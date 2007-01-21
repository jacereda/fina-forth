#include <stdio.h>
#include <stdarg.h>
#include <string.h>
#include "aw.h"
#include "awos.h"

static void report(const char * fmt, ...) {
	va_list ap;
	va_start(ap, fmt);
	fprintf(stderr, "ERROR: ");
	vfprintf(stderr, fmt, ap);
	va_end(ap);
	fprintf(stderr, "\n");
	fflush(stderr);
}

static int check(aw w) {
	if (!w)
		report("Null handle");
	return w != 0;
}

int awInit() {
	return awosInit();
}

void awEnd() {
	awosEnd();
}

aw awOpen() {
	aw w = awosOpen("AW Window", 100, 100);
	if (!w)
		report("Unable to open window");
	return w;
}

void awClose(aw w) {
	if (check(w) && !awosClose(w)) 
		report("Unable to close window");
}

void awSwapBuffers(aw w) {
	if (check(w) && !awosSwapBuffers(w))
		report("awSwapBuffers failed");
}

void awMakeCurrent(aw w) {
	if (check(w) && !awosMakeCurrent(w))
		report("awMakeCurrent failed");
}

void awShow(aw w) {
	if (check(w) && !awosShow(w))
		report("awShow failed");
}

void awHide(aw w) {
	if (check(w) && !awosHide(w))
		report("awHide failed");
}

void awSetTitle(aw w, const char * t) {
	if (check(w) && !awosSetTitle(w, t))
		report("awSetTitle failed");
}

void awMove(aw w, int x, int y) {
	if (check(w) && !awosMove(w, x, y))
		report("awMove failed");
}

void awResize(aw w, int width, int height) {
	if (check(w) && !awosResize(w, width, height))
		report("awResize failed");
}

struct awEvent * awNextEvent(aw w) {
	struct awEvent * ev = NULL;
	if (check(w))
		ev = awosNextEvent(w);
	return ev;
}
