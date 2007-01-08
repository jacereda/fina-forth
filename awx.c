#include <stdlib.h>
#include <GL/glx.h>

#include "aw.h"
#include "awos.h"

#define EVMASK 
static Display * g_dpy;
static int g_screen;
static XVisualInfo * g_visual;

struct _aw {
	Window win;
	GLXContext ctx;
	XVisualInfo * vinfo;
	struct awEvent ev;
	struct awEvent ev2;
	int pending;
	unsigned bx;
	unsigned by;
};

static XVisualInfo* chooseVisual() {
	int att[64];
	int * p = att;
	*p++ = GLX_RGBA;
        *p++ = GLX_DOUBLEBUFFER;
	*p++ = GLX_RED_SIZE; *p++ = 1;
        *p++ = GLX_GREEN_SIZE; *p++ = 1;
        *p++ = GLX_BLUE_SIZE; *p++ = 1;
        *p++ = GLX_DEPTH_SIZE; *p++ = 1;
	*p++ = None;
	return glXChooseVisual(g_dpy, g_screen, att);
}

static void calcBorders(Window w, unsigned * left, unsigned * top) {
	unsigned u0, u1, u2, u3;
	Window root, curr , *c;
	int x, y;
	*left = 0;
	*top = 0;
	do {
		XQueryTree(g_dpy, w, &root, &curr, &c, &u1);
		XFree(c);
		XGetGeometry(g_dpy, w, &root, &x, &y, &u0, &u1, &u2, &u3);
		if(curr != root){
			*left += x;
			*top += y;
		}
		w = curr;
	}
	while(w != root);
}

int awosInit() {
	int hasExtensions = 0;
	g_dpy = XOpenDisplay(0);
	if (g_dpy) {
		g_screen = XDefaultScreen(g_dpy);
		hasExtensions = 0 != glXQueryExtension(g_dpy, 0, 0);
		}
	return hasExtensions;
}

void awosEnd() {
	XCloseDisplay(g_dpy);
}

aw awosOpen(const char * t, int width, int height) {
	aw ret = NULL;
	aw w = calloc(1, sizeof(*ret));
	w->vinfo = chooseVisual( g_dpy, g_screen);
	w->pending = 0;
	if (w->vinfo) {
		Atom del;
		w->ctx = glXCreateContext(g_dpy, w->vinfo, NULL, True);
		w->win = XCreateSimpleWindow(g_dpy, XRootWindow(g_dpy, g_screen),
					     0, 0, width, height, 0, 0, None);
		XSelectInput(g_dpy, w->win, 
			     KeyPressMask | 
			     ButtonPressMask | 
			     ButtonReleaseMask | 
			     PointerMotionMask | 
			     StructureNotifyMask);
		del = XInternAtom(g_dpy, "WM_DELETE_WINDOW", False);
		XSetWMProtocols(g_dpy, w->win, &del, 1);
		if (w->win && w->ctx)
			ret = w;
	}
	if (!ret)
		awosClose(w);
	return ret;
}

int awosClose(aw w) {
	if (w) {
		if (w->win) XDestroyWindow(g_dpy, w->win);
		if (w->ctx) glXDestroyContext(g_dpy, w->ctx);
		if (w->vinfo) XFree(w->vinfo);
		free(w);
	}
	return w != 0;
}

int awosSwapBuffers(aw w) {
	glXSwapBuffers(g_dpy, w->win);
	return 1;
}

int awosMakeCurrent(aw w) {
	return glXMakeCurrent(g_dpy, w->win, w->ctx);
}

int awosShow(aw w) {
	int ret = 0;
	ret |= XMapWindow(g_dpy, w->win);
	ret |= XSync(g_dpy, False);
	calcBorders(w->win, &w->bx, &w->by);
	return ret;
}

int awosHide(aw w) {
	int ret = 0;
	ret |= XUnmapWindow(g_dpy, w->win);
	ret |= XSync(g_dpy, False);
	return ret;
}

int awosSetTitle(aw w, const char * t) {
	int ret = 0;
	ret |= XStoreName(g_dpy, w->win, t);
	ret |= XSetIconName(g_dpy, w->win, t);
	return ret;
}

int awosMove(aw w, int x, int y) {
	return XMoveWindow(g_dpy, w->win, x - w->bx, y - w->by);
}

int awosResize(aw w, int width, int height) {
	return XResizeWindow(g_dpy, w->win, width, height);
}

static int mapButton(int button) {
	int which;
	switch (button) {
	case Button1:
		which = AW_KEY_MOUSELEFT; break;
	case Button2:
		which = AW_KEY_MOUSEMIDDLE; break;
	case Button3:
		which = AW_KEY_MOUSERIGHT; break;
	case Button4:
		which = AW_KEY_MOUSEWHEELUP; break;
	case Button5:
		which = AW_KEY_MOUSEWHEELDOWN; break;
	default:
		which = AW_KEY_NONE;
	}
	return which;
}

int mapKey(KeyCode keycode) {
	return XKeycodeToKeysym(g_dpy, keycode, 0);
}

struct awEvent * awosNextEvent(aw w) {
	struct awEvent * pev = NULL;
	XEvent event;
	if (w->pending) {
		w->pending = 0;
		pev = &w->ev2;
	} else if (XPending(g_dpy)) { 
		pev = &w->ev;
		XNextEvent(g_dpy, &event);
		switch(event.type) {
			
		case ClientMessage:
			pev->type = AW_EVENT_CLOSE;
			break;
			
		case ConfigureNotify:
			pev->type = AW_EVENT_MOVE;
			pev->u.move.x = event.xconfigure.x;
			pev->u.move.y = event.xconfigure.y;
			w->pending = 1;
			w->ev2.type = AW_EVENT_RESIZE;
			w->ev2.u.resize.w = event.xconfigure.width;
			w->ev2.u.resize.h = event.xconfigure.height;
			break;
			
		case ButtonPress:
			pev->type = AW_EVENT_DOWN;
			pev->u.down.which = mapButton(event.xbutton.button);
			break;

		case ButtonRelease:
			pev->type = AW_EVENT_UP;
			pev->u.up.which = mapButton(event.xbutton.button);
			break;

		case MotionNotify:
			pev->type = AW_EVENT_MOTION;
			pev->u.motion.x = event.xmotion.x;
			pev->u.motion.y = event.xmotion.y;
			break;

		case KeyPress:
			pev->type = AW_EVENT_DOWN;
			pev->u.down.which = mapKey(event.xkey.keycode);
			break;

		default:
			pev->type = AW_EVENT_UNKNOWN;
			break;
		}
	}
	return pev;
}
