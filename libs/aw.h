
enum {
  AW_EVENT_UNKNOWN,
  AW_EVENT_MOVE,
  AW_EVENT_RESIZE,
  AW_EVENT_CLOSE,
  AW_EVENT_DOWN,
  AW_EVENT_UP,
  AW_EVENT_MOTION,
};

enum {
  AW_KEY_NONE,
  AW_KEY_MOUSEWHEELUP, 
  AW_KEY_MOUSEWHEELDOWN,
  AW_KEY_MOUSELEFT, 
  AW_KEY_MOUSEMIDDLE,
  AW_KEY_MOUSERIGHT,
};

struct awEvent {
  int type;
  union {
    struct { int x, y; } move;
    struct { int w, h; } resize;
    struct { int which; } down;
    struct { int which; } up;
    struct { int x, y; } motion;
  } u;
};

typedef struct _aw * aw;

int awInit();
void awEnd();
aw awOpen();
void awClose(aw);
void awSwapBuffers(aw);
void awMakeCurrent(aw);
void awShow(aw);
void awHide(aw);
void awSetTitle(aw, const char *);
void awMove(aw, int, int);
void awResize(aw, int, int);
struct awEvent * awNextEvent(aw);
