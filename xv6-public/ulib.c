#include "types.h"
#include "stat.h"
#include "fcntl.h"
#include "user.h"
#include "x86.h"
#include "mmu.h"

int test_and_set(int *old_ptr, int new_ptr) {
  int old = *old_ptr;
  *old_ptr = new_ptr;
  return old;
}

// a wrapper func for clone
int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = 0;
  if(n_stack == 0){
    return -1;
  }
  int new_pid = clone(start_routine, arg1, arg2, n_stack); // TODO: is this the right way to call it?

  // TODO: push args onto stack (grows negatively) -- do arg2 first then arg1 at the top of the stack


  // I can't remember if there was something else to do here but I'm sure I'll find out


  return new_pid;
}

int thread_join() {
  return 0;
}

void lock_acquire(lock_t *lock){
  while(test_and_set(&lock->flag, 1) == 1)
    ;
}

void lock_release(lock_t *lock) {
  lock->flag = 0;
}

void lock_init(lock_t *lock) {
  lock->flag = 0;
}

char*
strcpy(char *s, const char *t)
{
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    ;
  return os;
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    p++, q++;
  return (uchar)*p - (uchar)*q;
}

uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
    ;
  return n;
}

void*
memset(void *dst, int c, uint n)
{
  stosb(dst, c, n);
  return dst;
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    if(*s == c)
      return (char*)s;
  return 0;
}

char*
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
  return buf;
}

int
stat(const char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
  r = fstat(fd, st);
  close(fd);
  return r;
}

int
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    n = n*10 + *s++ - '0';
  return n;
}

void*
memmove(void *vdst, const void *vsrc, int n)
{
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    *dst++ = *src++;
  return vdst;
}
