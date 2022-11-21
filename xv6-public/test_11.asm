
_test_11:     file format elf32-i386


Disassembly of section .text:

00000000 <worker>:
   printf(1, "TEST PASSED\n");
   exit();
}

void
worker(void *arg1, void *arg2) {
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 08             	sub    $0x8,%esp
   assert(global == 1);
   6:	a1 ec 0c 00 00       	mov    0xcec,%eax
   b:	83 f8 01             	cmp    $0x1,%eax
   e:	74 49                	je     59 <worker+0x59>
  10:	6a 2e                	push   $0x2e
  12:	68 50 08 00 00       	push   $0x850
  17:	68 5a 08 00 00       	push   $0x85a
  1c:	6a 01                	push   $0x1
  1e:	e8 7e 05 00 00       	call   5a1 <printf>
  23:	83 c4 0c             	add    $0xc,%esp
  26:	68 62 08 00 00       	push   $0x862
  2b:	68 6e 08 00 00       	push   $0x86e
  30:	6a 01                	push   $0x1
  32:	e8 6a 05 00 00       	call   5a1 <printf>
  37:	83 c4 08             	add    $0x8,%esp
  3a:	68 82 08 00 00       	push   $0x882
  3f:	6a 01                	push   $0x1
  41:	e8 5b 05 00 00       	call   5a1 <printf>
  46:	83 c4 04             	add    $0x4,%esp
  49:	ff 35 f0 0c 00 00    	push   0xcf0
  4f:	e8 28 04 00 00       	call   47c <kill>
  54:	e8 f3 03 00 00       	call   44c <exit>
   global += 4;
  59:	a1 ec 0c 00 00       	mov    0xcec,%eax
  5e:	83 c0 04             	add    $0x4,%eax
  61:	a3 ec 0c 00 00       	mov    %eax,0xcec
   exit();
  66:	e8 e1 03 00 00       	call   44c <exit>

0000006b <main>:
{
  6b:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  6f:	83 e4 f0             	and    $0xfffffff0,%esp
  72:	ff 71 fc             	push   -0x4(%ecx)
  75:	55                   	push   %ebp
  76:	89 e5                	mov    %esp,%ebp
  78:	56                   	push   %esi
  79:	53                   	push   %ebx
  7a:	51                   	push   %ecx
  7b:	83 ec 0c             	sub    $0xc,%esp
   ppid = getpid();
  7e:	e8 49 04 00 00       	call   4cc <getpid>
  83:	a3 f0 0c 00 00       	mov    %eax,0xcf0
   for(i = 0; i < 10; i++) {
  88:	be 00 00 00 00       	mov    $0x0,%esi
  8d:	83 fe 09             	cmp    $0x9,%esi
  90:	0f 8f 7c 01 00 00    	jg     212 <main+0x1a7>
      global = 1;
  96:	c7 05 ec 0c 00 00 01 	movl   $0x1,0xcec
  9d:	00 00 00 
      thread_pid = thread_create(worker, 0, 0);
  a0:	83 ec 04             	sub    $0x4,%esp
  a3:	6a 00                	push   $0x0
  a5:	6a 00                	push   $0x0
  a7:	68 00 00 00 00       	push   $0x0
  ac:	e8 86 01 00 00       	call   237 <thread_create>
  b1:	89 c3                	mov    %eax,%ebx
      assert(thread_pid > 0);
  b3:	83 c4 10             	add    $0x10,%esp
  b6:	85 c0                	test   %eax,%eax
  b8:	7e 34                	jle    ee <main+0x83>
      join_pid = thread_join();
  ba:	e8 aa 01 00 00       	call   269 <thread_join>
      assert(join_pid == thread_pid);
  bf:	39 c3                	cmp    %eax,%ebx
  c1:	75 74                	jne    137 <main+0xcc>
      assert(global == 5);
  c3:	a1 ec 0c 00 00       	mov    0xcec,%eax
  c8:	83 f8 05             	cmp    $0x5,%eax
  cb:	0f 85 af 00 00 00    	jne    180 <main+0x115>
      assert((uint)sbrk(0) < (150 * 4096) && "shouldn't even come close");
  d1:	83 ec 0c             	sub    $0xc,%esp
  d4:	6a 00                	push   $0x0
  d6:	e8 f9 03 00 00       	call   4d4 <sbrk>
  db:	83 c4 10             	add    $0x10,%esp
  de:	3d ff 5f 09 00       	cmp    $0x95fff,%eax
  e3:	0f 87 e0 00 00 00    	ja     1c9 <main+0x15e>
   for(i = 0; i < 10; i++) {
  e9:	83 c6 01             	add    $0x1,%esi
  ec:	eb 9f                	jmp    8d <main+0x22>
      assert(thread_pid > 0);
  ee:	6a 20                	push   $0x20
  f0:	68 50 08 00 00       	push   $0x850
  f5:	68 5a 08 00 00       	push   $0x85a
  fa:	6a 01                	push   $0x1
  fc:	e8 a0 04 00 00       	call   5a1 <printf>
 101:	83 c4 0c             	add    $0xc,%esp
 104:	68 8f 08 00 00       	push   $0x88f
 109:	68 6e 08 00 00       	push   $0x86e
 10e:	6a 01                	push   $0x1
 110:	e8 8c 04 00 00       	call   5a1 <printf>
 115:	83 c4 08             	add    $0x8,%esp
 118:	68 82 08 00 00       	push   $0x882
 11d:	6a 01                	push   $0x1
 11f:	e8 7d 04 00 00       	call   5a1 <printf>
 124:	83 c4 04             	add    $0x4,%esp
 127:	ff 35 f0 0c 00 00    	push   0xcf0
 12d:	e8 4a 03 00 00       	call   47c <kill>
 132:	e8 15 03 00 00       	call   44c <exit>
      assert(join_pid == thread_pid);
 137:	6a 22                	push   $0x22
 139:	68 50 08 00 00       	push   $0x850
 13e:	68 5a 08 00 00       	push   $0x85a
 143:	6a 01                	push   $0x1
 145:	e8 57 04 00 00       	call   5a1 <printf>
 14a:	83 c4 0c             	add    $0xc,%esp
 14d:	68 9e 08 00 00       	push   $0x89e
 152:	68 6e 08 00 00       	push   $0x86e
 157:	6a 01                	push   $0x1
 159:	e8 43 04 00 00       	call   5a1 <printf>
 15e:	83 c4 08             	add    $0x8,%esp
 161:	68 82 08 00 00       	push   $0x882
 166:	6a 01                	push   $0x1
 168:	e8 34 04 00 00       	call   5a1 <printf>
 16d:	83 c4 04             	add    $0x4,%esp
 170:	ff 35 f0 0c 00 00    	push   0xcf0
 176:	e8 01 03 00 00       	call   47c <kill>
 17b:	e8 cc 02 00 00       	call   44c <exit>
      assert(global == 5);
 180:	6a 23                	push   $0x23
 182:	68 50 08 00 00       	push   $0x850
 187:	68 5a 08 00 00       	push   $0x85a
 18c:	6a 01                	push   $0x1
 18e:	e8 0e 04 00 00       	call   5a1 <printf>
 193:	83 c4 0c             	add    $0xc,%esp
 196:	68 b5 08 00 00       	push   $0x8b5
 19b:	68 6e 08 00 00       	push   $0x86e
 1a0:	6a 01                	push   $0x1
 1a2:	e8 fa 03 00 00       	call   5a1 <printf>
 1a7:	83 c4 08             	add    $0x8,%esp
 1aa:	68 82 08 00 00       	push   $0x882
 1af:	6a 01                	push   $0x1
 1b1:	e8 eb 03 00 00       	call   5a1 <printf>
 1b6:	83 c4 04             	add    $0x4,%esp
 1b9:	ff 35 f0 0c 00 00    	push   0xcf0
 1bf:	e8 b8 02 00 00       	call   47c <kill>
 1c4:	e8 83 02 00 00       	call   44c <exit>
      assert((uint)sbrk(0) < (150 * 4096) && "shouldn't even come close");
 1c9:	6a 25                	push   $0x25
 1cb:	68 50 08 00 00       	push   $0x850
 1d0:	68 5a 08 00 00       	push   $0x85a
 1d5:	6a 01                	push   $0x1
 1d7:	e8 c5 03 00 00       	call   5a1 <printf>
 1dc:	83 c4 0c             	add    $0xc,%esp
 1df:	68 d0 08 00 00       	push   $0x8d0
 1e4:	68 6e 08 00 00       	push   $0x86e
 1e9:	6a 01                	push   $0x1
 1eb:	e8 b1 03 00 00       	call   5a1 <printf>
 1f0:	83 c4 08             	add    $0x8,%esp
 1f3:	68 82 08 00 00       	push   $0x882
 1f8:	6a 01                	push   $0x1
 1fa:	e8 a2 03 00 00       	call   5a1 <printf>
 1ff:	83 c4 04             	add    $0x4,%esp
 202:	ff 35 f0 0c 00 00    	push   0xcf0
 208:	e8 6f 02 00 00       	call   47c <kill>
 20d:	e8 3a 02 00 00       	call   44c <exit>
   printf(1, "TEST PASSED\n");
 212:	83 ec 08             	sub    $0x8,%esp
 215:	68 c1 08 00 00       	push   $0x8c1
 21a:	6a 01                	push   $0x1
 21c:	e8 80 03 00 00       	call   5a1 <printf>
   exit();
 221:	e8 26 02 00 00       	call   44c <exit>

00000226 <test_and_set>:
#include "fcntl.h"
#include "user.h"
#include "x86.h"
#include "mmu.h"

int test_and_set(int *old_ptr, int new_ptr) {
 226:	55                   	push   %ebp
 227:	89 e5                	mov    %esp,%ebp
 229:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *old_ptr;
 22c:	8b 10                	mov    (%eax),%edx
  *old_ptr = new_ptr;
 22e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 231:	89 08                	mov    %ecx,(%eax)
  return old;
}
 233:	89 d0                	mov    %edx,%eax
 235:	5d                   	pop    %ebp
 236:	c3                   	ret    

00000237 <thread_create>:

// a wrapper func for clone
int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 237:	55                   	push   %ebp
 238:	89 e5                	mov    %esp,%ebp
 23a:	83 ec 14             	sub    $0x14,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE);
 23d:	68 00 10 00 00       	push   $0x1000
 242:	e8 80 05 00 00       	call   7c7 <malloc>
  if(n_stack == 0){
 247:	83 c4 10             	add    $0x10,%esp
 24a:	85 c0                	test   %eax,%eax
 24c:	74 14                	je     262 <thread_create+0x2b>
    return -1;
  }
  int new_pid = clone(start_routine, arg1, arg2, n_stack); // TODO: is this the right way to call it?
 24e:	50                   	push   %eax
 24f:	ff 75 10             	push   0x10(%ebp)
 252:	ff 75 0c             	push   0xc(%ebp)
 255:	ff 75 08             	push   0x8(%ebp)
 258:	e8 8f 02 00 00       	call   4ec <clone>


  // I can't remember if there was something else to do here but I'm sure I'll find out


  return new_pid;
 25d:	83 c4 10             	add    $0x10,%esp
}
 260:	c9                   	leave  
 261:	c3                   	ret    
    return -1;
 262:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 267:	eb f7                	jmp    260 <thread_create+0x29>

00000269 <thread_join>:

int thread_join() {
  return 0;
}
 269:	b8 00 00 00 00       	mov    $0x0,%eax
 26e:	c3                   	ret    

0000026f <lock_acquire>:

void lock_acquire(lock_t *lock){
 26f:	55                   	push   %ebp
 270:	89 e5                	mov    %esp,%ebp
 272:	53                   	push   %ebx
 273:	83 ec 04             	sub    $0x4,%esp
 276:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 279:	83 ec 08             	sub    $0x8,%esp
 27c:	6a 01                	push   $0x1
 27e:	53                   	push   %ebx
 27f:	e8 a2 ff ff ff       	call   226 <test_and_set>
 284:	83 c4 10             	add    $0x10,%esp
 287:	83 f8 01             	cmp    $0x1,%eax
 28a:	74 ed                	je     279 <lock_acquire+0xa>
    ;
}
 28c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 28f:	c9                   	leave  
 290:	c3                   	ret    

00000291 <lock_release>:

void lock_release(lock_t *lock) {
 291:	55                   	push   %ebp
 292:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 294:	8b 45 08             	mov    0x8(%ebp),%eax
 297:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 29d:	5d                   	pop    %ebp
 29e:	c3                   	ret    

0000029f <lock_init>:

void lock_init(lock_t *lock) {
 29f:	55                   	push   %ebp
 2a0:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 2a2:	8b 45 08             	mov    0x8(%ebp),%eax
 2a5:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 2ab:	5d                   	pop    %ebp
 2ac:	c3                   	ret    

000002ad <strcpy>:

char*
strcpy(char *s, const char *t)
{
 2ad:	55                   	push   %ebp
 2ae:	89 e5                	mov    %esp,%ebp
 2b0:	56                   	push   %esi
 2b1:	53                   	push   %ebx
 2b2:	8b 75 08             	mov    0x8(%ebp),%esi
 2b5:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 2b8:	89 f0                	mov    %esi,%eax
 2ba:	89 d1                	mov    %edx,%ecx
 2bc:	83 c2 01             	add    $0x1,%edx
 2bf:	89 c3                	mov    %eax,%ebx
 2c1:	83 c0 01             	add    $0x1,%eax
 2c4:	0f b6 09             	movzbl (%ecx),%ecx
 2c7:	88 0b                	mov    %cl,(%ebx)
 2c9:	84 c9                	test   %cl,%cl
 2cb:	75 ed                	jne    2ba <strcpy+0xd>
    ;
  return os;
}
 2cd:	89 f0                	mov    %esi,%eax
 2cf:	5b                   	pop    %ebx
 2d0:	5e                   	pop    %esi
 2d1:	5d                   	pop    %ebp
 2d2:	c3                   	ret    

000002d3 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 2d3:	55                   	push   %ebp
 2d4:	89 e5                	mov    %esp,%ebp
 2d6:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2d9:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 2dc:	eb 06                	jmp    2e4 <strcmp+0x11>
    p++, q++;
 2de:	83 c1 01             	add    $0x1,%ecx
 2e1:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 2e4:	0f b6 01             	movzbl (%ecx),%eax
 2e7:	84 c0                	test   %al,%al
 2e9:	74 04                	je     2ef <strcmp+0x1c>
 2eb:	3a 02                	cmp    (%edx),%al
 2ed:	74 ef                	je     2de <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 2ef:	0f b6 c0             	movzbl %al,%eax
 2f2:	0f b6 12             	movzbl (%edx),%edx
 2f5:	29 d0                	sub    %edx,%eax
}
 2f7:	5d                   	pop    %ebp
 2f8:	c3                   	ret    

000002f9 <strlen>:

uint
strlen(const char *s)
{
 2f9:	55                   	push   %ebp
 2fa:	89 e5                	mov    %esp,%ebp
 2fc:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 2ff:	b8 00 00 00 00       	mov    $0x0,%eax
 304:	eb 03                	jmp    309 <strlen+0x10>
 306:	83 c0 01             	add    $0x1,%eax
 309:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 30d:	75 f7                	jne    306 <strlen+0xd>
    ;
  return n;
}
 30f:	5d                   	pop    %ebp
 310:	c3                   	ret    

00000311 <memset>:

void*
memset(void *dst, int c, uint n)
{
 311:	55                   	push   %ebp
 312:	89 e5                	mov    %esp,%ebp
 314:	57                   	push   %edi
 315:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 318:	89 d7                	mov    %edx,%edi
 31a:	8b 4d 10             	mov    0x10(%ebp),%ecx
 31d:	8b 45 0c             	mov    0xc(%ebp),%eax
 320:	fc                   	cld    
 321:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 323:	89 d0                	mov    %edx,%eax
 325:	8b 7d fc             	mov    -0x4(%ebp),%edi
 328:	c9                   	leave  
 329:	c3                   	ret    

0000032a <strchr>:

char*
strchr(const char *s, char c)
{
 32a:	55                   	push   %ebp
 32b:	89 e5                	mov    %esp,%ebp
 32d:	8b 45 08             	mov    0x8(%ebp),%eax
 330:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 334:	eb 03                	jmp    339 <strchr+0xf>
 336:	83 c0 01             	add    $0x1,%eax
 339:	0f b6 10             	movzbl (%eax),%edx
 33c:	84 d2                	test   %dl,%dl
 33e:	74 06                	je     346 <strchr+0x1c>
    if(*s == c)
 340:	38 ca                	cmp    %cl,%dl
 342:	75 f2                	jne    336 <strchr+0xc>
 344:	eb 05                	jmp    34b <strchr+0x21>
      return (char*)s;
  return 0;
 346:	b8 00 00 00 00       	mov    $0x0,%eax
}
 34b:	5d                   	pop    %ebp
 34c:	c3                   	ret    

0000034d <gets>:

char*
gets(char *buf, int max)
{
 34d:	55                   	push   %ebp
 34e:	89 e5                	mov    %esp,%ebp
 350:	57                   	push   %edi
 351:	56                   	push   %esi
 352:	53                   	push   %ebx
 353:	83 ec 1c             	sub    $0x1c,%esp
 356:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 359:	bb 00 00 00 00       	mov    $0x0,%ebx
 35e:	89 de                	mov    %ebx,%esi
 360:	83 c3 01             	add    $0x1,%ebx
 363:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 366:	7d 2e                	jge    396 <gets+0x49>
    cc = read(0, &c, 1);
 368:	83 ec 04             	sub    $0x4,%esp
 36b:	6a 01                	push   $0x1
 36d:	8d 45 e7             	lea    -0x19(%ebp),%eax
 370:	50                   	push   %eax
 371:	6a 00                	push   $0x0
 373:	e8 ec 00 00 00       	call   464 <read>
    if(cc < 1)
 378:	83 c4 10             	add    $0x10,%esp
 37b:	85 c0                	test   %eax,%eax
 37d:	7e 17                	jle    396 <gets+0x49>
      break;
    buf[i++] = c;
 37f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 383:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 386:	3c 0a                	cmp    $0xa,%al
 388:	0f 94 c2             	sete   %dl
 38b:	3c 0d                	cmp    $0xd,%al
 38d:	0f 94 c0             	sete   %al
 390:	08 c2                	or     %al,%dl
 392:	74 ca                	je     35e <gets+0x11>
    buf[i++] = c;
 394:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 396:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 39a:	89 f8                	mov    %edi,%eax
 39c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 39f:	5b                   	pop    %ebx
 3a0:	5e                   	pop    %esi
 3a1:	5f                   	pop    %edi
 3a2:	5d                   	pop    %ebp
 3a3:	c3                   	ret    

000003a4 <stat>:

int
stat(const char *n, struct stat *st)
{
 3a4:	55                   	push   %ebp
 3a5:	89 e5                	mov    %esp,%ebp
 3a7:	56                   	push   %esi
 3a8:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 3a9:	83 ec 08             	sub    $0x8,%esp
 3ac:	6a 00                	push   $0x0
 3ae:	ff 75 08             	push   0x8(%ebp)
 3b1:	e8 d6 00 00 00       	call   48c <open>
  if(fd < 0)
 3b6:	83 c4 10             	add    $0x10,%esp
 3b9:	85 c0                	test   %eax,%eax
 3bb:	78 24                	js     3e1 <stat+0x3d>
 3bd:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 3bf:	83 ec 08             	sub    $0x8,%esp
 3c2:	ff 75 0c             	push   0xc(%ebp)
 3c5:	50                   	push   %eax
 3c6:	e8 d9 00 00 00       	call   4a4 <fstat>
 3cb:	89 c6                	mov    %eax,%esi
  close(fd);
 3cd:	89 1c 24             	mov    %ebx,(%esp)
 3d0:	e8 9f 00 00 00       	call   474 <close>
  return r;
 3d5:	83 c4 10             	add    $0x10,%esp
}
 3d8:	89 f0                	mov    %esi,%eax
 3da:	8d 65 f8             	lea    -0x8(%ebp),%esp
 3dd:	5b                   	pop    %ebx
 3de:	5e                   	pop    %esi
 3df:	5d                   	pop    %ebp
 3e0:	c3                   	ret    
    return -1;
 3e1:	be ff ff ff ff       	mov    $0xffffffff,%esi
 3e6:	eb f0                	jmp    3d8 <stat+0x34>

000003e8 <atoi>:

int
atoi(const char *s)
{
 3e8:	55                   	push   %ebp
 3e9:	89 e5                	mov    %esp,%ebp
 3eb:	53                   	push   %ebx
 3ec:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 3ef:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 3f4:	eb 10                	jmp    406 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 3f6:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 3f9:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 3fc:	83 c1 01             	add    $0x1,%ecx
 3ff:	0f be c0             	movsbl %al,%eax
 402:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 406:	0f b6 01             	movzbl (%ecx),%eax
 409:	8d 58 d0             	lea    -0x30(%eax),%ebx
 40c:	80 fb 09             	cmp    $0x9,%bl
 40f:	76 e5                	jbe    3f6 <atoi+0xe>
  return n;
}
 411:	89 d0                	mov    %edx,%eax
 413:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 416:	c9                   	leave  
 417:	c3                   	ret    

00000418 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 418:	55                   	push   %ebp
 419:	89 e5                	mov    %esp,%ebp
 41b:	56                   	push   %esi
 41c:	53                   	push   %ebx
 41d:	8b 75 08             	mov    0x8(%ebp),%esi
 420:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 423:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 426:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 428:	eb 0d                	jmp    437 <memmove+0x1f>
    *dst++ = *src++;
 42a:	0f b6 01             	movzbl (%ecx),%eax
 42d:	88 02                	mov    %al,(%edx)
 42f:	8d 49 01             	lea    0x1(%ecx),%ecx
 432:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 435:	89 d8                	mov    %ebx,%eax
 437:	8d 58 ff             	lea    -0x1(%eax),%ebx
 43a:	85 c0                	test   %eax,%eax
 43c:	7f ec                	jg     42a <memmove+0x12>
  return vdst;
}
 43e:	89 f0                	mov    %esi,%eax
 440:	5b                   	pop    %ebx
 441:	5e                   	pop    %esi
 442:	5d                   	pop    %ebp
 443:	c3                   	ret    

00000444 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 444:	b8 01 00 00 00       	mov    $0x1,%eax
 449:	cd 40                	int    $0x40
 44b:	c3                   	ret    

0000044c <exit>:
SYSCALL(exit)
 44c:	b8 02 00 00 00       	mov    $0x2,%eax
 451:	cd 40                	int    $0x40
 453:	c3                   	ret    

00000454 <wait>:
SYSCALL(wait)
 454:	b8 03 00 00 00       	mov    $0x3,%eax
 459:	cd 40                	int    $0x40
 45b:	c3                   	ret    

0000045c <pipe>:
SYSCALL(pipe)
 45c:	b8 04 00 00 00       	mov    $0x4,%eax
 461:	cd 40                	int    $0x40
 463:	c3                   	ret    

00000464 <read>:
SYSCALL(read)
 464:	b8 05 00 00 00       	mov    $0x5,%eax
 469:	cd 40                	int    $0x40
 46b:	c3                   	ret    

0000046c <write>:
SYSCALL(write)
 46c:	b8 10 00 00 00       	mov    $0x10,%eax
 471:	cd 40                	int    $0x40
 473:	c3                   	ret    

00000474 <close>:
SYSCALL(close)
 474:	b8 15 00 00 00       	mov    $0x15,%eax
 479:	cd 40                	int    $0x40
 47b:	c3                   	ret    

0000047c <kill>:
SYSCALL(kill)
 47c:	b8 06 00 00 00       	mov    $0x6,%eax
 481:	cd 40                	int    $0x40
 483:	c3                   	ret    

00000484 <exec>:
SYSCALL(exec)
 484:	b8 07 00 00 00       	mov    $0x7,%eax
 489:	cd 40                	int    $0x40
 48b:	c3                   	ret    

0000048c <open>:
SYSCALL(open)
 48c:	b8 0f 00 00 00       	mov    $0xf,%eax
 491:	cd 40                	int    $0x40
 493:	c3                   	ret    

00000494 <mknod>:
SYSCALL(mknod)
 494:	b8 11 00 00 00       	mov    $0x11,%eax
 499:	cd 40                	int    $0x40
 49b:	c3                   	ret    

0000049c <unlink>:
SYSCALL(unlink)
 49c:	b8 12 00 00 00       	mov    $0x12,%eax
 4a1:	cd 40                	int    $0x40
 4a3:	c3                   	ret    

000004a4 <fstat>:
SYSCALL(fstat)
 4a4:	b8 08 00 00 00       	mov    $0x8,%eax
 4a9:	cd 40                	int    $0x40
 4ab:	c3                   	ret    

000004ac <link>:
SYSCALL(link)
 4ac:	b8 13 00 00 00       	mov    $0x13,%eax
 4b1:	cd 40                	int    $0x40
 4b3:	c3                   	ret    

000004b4 <mkdir>:
SYSCALL(mkdir)
 4b4:	b8 14 00 00 00       	mov    $0x14,%eax
 4b9:	cd 40                	int    $0x40
 4bb:	c3                   	ret    

000004bc <chdir>:
SYSCALL(chdir)
 4bc:	b8 09 00 00 00       	mov    $0x9,%eax
 4c1:	cd 40                	int    $0x40
 4c3:	c3                   	ret    

000004c4 <dup>:
SYSCALL(dup)
 4c4:	b8 0a 00 00 00       	mov    $0xa,%eax
 4c9:	cd 40                	int    $0x40
 4cb:	c3                   	ret    

000004cc <getpid>:
SYSCALL(getpid)
 4cc:	b8 0b 00 00 00       	mov    $0xb,%eax
 4d1:	cd 40                	int    $0x40
 4d3:	c3                   	ret    

000004d4 <sbrk>:
SYSCALL(sbrk)
 4d4:	b8 0c 00 00 00       	mov    $0xc,%eax
 4d9:	cd 40                	int    $0x40
 4db:	c3                   	ret    

000004dc <sleep>:
SYSCALL(sleep)
 4dc:	b8 0d 00 00 00       	mov    $0xd,%eax
 4e1:	cd 40                	int    $0x40
 4e3:	c3                   	ret    

000004e4 <uptime>:
SYSCALL(uptime)
 4e4:	b8 0e 00 00 00       	mov    $0xe,%eax
 4e9:	cd 40                	int    $0x40
 4eb:	c3                   	ret    

000004ec <clone>:
SYSCALL(clone)
 4ec:	b8 16 00 00 00       	mov    $0x16,%eax
 4f1:	cd 40                	int    $0x40
 4f3:	c3                   	ret    

000004f4 <join>:
 4f4:	b8 17 00 00 00       	mov    $0x17,%eax
 4f9:	cd 40                	int    $0x40
 4fb:	c3                   	ret    

000004fc <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 4fc:	55                   	push   %ebp
 4fd:	89 e5                	mov    %esp,%ebp
 4ff:	83 ec 1c             	sub    $0x1c,%esp
 502:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 505:	6a 01                	push   $0x1
 507:	8d 55 f4             	lea    -0xc(%ebp),%edx
 50a:	52                   	push   %edx
 50b:	50                   	push   %eax
 50c:	e8 5b ff ff ff       	call   46c <write>
}
 511:	83 c4 10             	add    $0x10,%esp
 514:	c9                   	leave  
 515:	c3                   	ret    

00000516 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 516:	55                   	push   %ebp
 517:	89 e5                	mov    %esp,%ebp
 519:	57                   	push   %edi
 51a:	56                   	push   %esi
 51b:	53                   	push   %ebx
 51c:	83 ec 2c             	sub    $0x2c,%esp
 51f:	89 45 d0             	mov    %eax,-0x30(%ebp)
 522:	89 d0                	mov    %edx,%eax
 524:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 526:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 52a:	0f 95 c1             	setne  %cl
 52d:	c1 ea 1f             	shr    $0x1f,%edx
 530:	84 d1                	test   %dl,%cl
 532:	74 44                	je     578 <printint+0x62>
    neg = 1;
    x = -xx;
 534:	f7 d8                	neg    %eax
 536:	89 c1                	mov    %eax,%ecx
    neg = 1;
 538:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 53f:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 544:	89 c8                	mov    %ecx,%eax
 546:	ba 00 00 00 00       	mov    $0x0,%edx
 54b:	f7 f6                	div    %esi
 54d:	89 df                	mov    %ebx,%edi
 54f:	83 c3 01             	add    $0x1,%ebx
 552:	0f b6 92 6c 09 00 00 	movzbl 0x96c(%edx),%edx
 559:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 55d:	89 ca                	mov    %ecx,%edx
 55f:	89 c1                	mov    %eax,%ecx
 561:	39 d6                	cmp    %edx,%esi
 563:	76 df                	jbe    544 <printint+0x2e>
  if(neg)
 565:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 569:	74 31                	je     59c <printint+0x86>
    buf[i++] = '-';
 56b:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 570:	8d 5f 02             	lea    0x2(%edi),%ebx
 573:	8b 75 d0             	mov    -0x30(%ebp),%esi
 576:	eb 17                	jmp    58f <printint+0x79>
    x = xx;
 578:	89 c1                	mov    %eax,%ecx
  neg = 0;
 57a:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 581:	eb bc                	jmp    53f <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 583:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 588:	89 f0                	mov    %esi,%eax
 58a:	e8 6d ff ff ff       	call   4fc <putc>
  while(--i >= 0)
 58f:	83 eb 01             	sub    $0x1,%ebx
 592:	79 ef                	jns    583 <printint+0x6d>
}
 594:	83 c4 2c             	add    $0x2c,%esp
 597:	5b                   	pop    %ebx
 598:	5e                   	pop    %esi
 599:	5f                   	pop    %edi
 59a:	5d                   	pop    %ebp
 59b:	c3                   	ret    
 59c:	8b 75 d0             	mov    -0x30(%ebp),%esi
 59f:	eb ee                	jmp    58f <printint+0x79>

000005a1 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5a1:	55                   	push   %ebp
 5a2:	89 e5                	mov    %esp,%ebp
 5a4:	57                   	push   %edi
 5a5:	56                   	push   %esi
 5a6:	53                   	push   %ebx
 5a7:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 5aa:	8d 45 10             	lea    0x10(%ebp),%eax
 5ad:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 5b0:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 5b5:	bb 00 00 00 00       	mov    $0x0,%ebx
 5ba:	eb 14                	jmp    5d0 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 5bc:	89 fa                	mov    %edi,%edx
 5be:	8b 45 08             	mov    0x8(%ebp),%eax
 5c1:	e8 36 ff ff ff       	call   4fc <putc>
 5c6:	eb 05                	jmp    5cd <printf+0x2c>
      }
    } else if(state == '%'){
 5c8:	83 fe 25             	cmp    $0x25,%esi
 5cb:	74 25                	je     5f2 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 5cd:	83 c3 01             	add    $0x1,%ebx
 5d0:	8b 45 0c             	mov    0xc(%ebp),%eax
 5d3:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 5d7:	84 c0                	test   %al,%al
 5d9:	0f 84 20 01 00 00    	je     6ff <printf+0x15e>
    c = fmt[i] & 0xff;
 5df:	0f be f8             	movsbl %al,%edi
 5e2:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 5e5:	85 f6                	test   %esi,%esi
 5e7:	75 df                	jne    5c8 <printf+0x27>
      if(c == '%'){
 5e9:	83 f8 25             	cmp    $0x25,%eax
 5ec:	75 ce                	jne    5bc <printf+0x1b>
        state = '%';
 5ee:	89 c6                	mov    %eax,%esi
 5f0:	eb db                	jmp    5cd <printf+0x2c>
      if(c == 'd'){
 5f2:	83 f8 25             	cmp    $0x25,%eax
 5f5:	0f 84 cf 00 00 00    	je     6ca <printf+0x129>
 5fb:	0f 8c dd 00 00 00    	jl     6de <printf+0x13d>
 601:	83 f8 78             	cmp    $0x78,%eax
 604:	0f 8f d4 00 00 00    	jg     6de <printf+0x13d>
 60a:	83 f8 63             	cmp    $0x63,%eax
 60d:	0f 8c cb 00 00 00    	jl     6de <printf+0x13d>
 613:	83 e8 63             	sub    $0x63,%eax
 616:	83 f8 15             	cmp    $0x15,%eax
 619:	0f 87 bf 00 00 00    	ja     6de <printf+0x13d>
 61f:	ff 24 85 14 09 00 00 	jmp    *0x914(,%eax,4)
        printint(fd, *ap, 10, 1);
 626:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 629:	8b 17                	mov    (%edi),%edx
 62b:	83 ec 0c             	sub    $0xc,%esp
 62e:	6a 01                	push   $0x1
 630:	b9 0a 00 00 00       	mov    $0xa,%ecx
 635:	8b 45 08             	mov    0x8(%ebp),%eax
 638:	e8 d9 fe ff ff       	call   516 <printint>
        ap++;
 63d:	83 c7 04             	add    $0x4,%edi
 640:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 643:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 646:	be 00 00 00 00       	mov    $0x0,%esi
 64b:	eb 80                	jmp    5cd <printf+0x2c>
        printint(fd, *ap, 16, 0);
 64d:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 650:	8b 17                	mov    (%edi),%edx
 652:	83 ec 0c             	sub    $0xc,%esp
 655:	6a 00                	push   $0x0
 657:	b9 10 00 00 00       	mov    $0x10,%ecx
 65c:	8b 45 08             	mov    0x8(%ebp),%eax
 65f:	e8 b2 fe ff ff       	call   516 <printint>
        ap++;
 664:	83 c7 04             	add    $0x4,%edi
 667:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 66a:	83 c4 10             	add    $0x10,%esp
      state = 0;
 66d:	be 00 00 00 00       	mov    $0x0,%esi
 672:	e9 56 ff ff ff       	jmp    5cd <printf+0x2c>
        s = (char*)*ap;
 677:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 67a:	8b 30                	mov    (%eax),%esi
        ap++;
 67c:	83 c0 04             	add    $0x4,%eax
 67f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 682:	85 f6                	test   %esi,%esi
 684:	75 15                	jne    69b <printf+0xfa>
          s = "(null)";
 686:	be 0c 09 00 00       	mov    $0x90c,%esi
 68b:	eb 0e                	jmp    69b <printf+0xfa>
          putc(fd, *s);
 68d:	0f be d2             	movsbl %dl,%edx
 690:	8b 45 08             	mov    0x8(%ebp),%eax
 693:	e8 64 fe ff ff       	call   4fc <putc>
          s++;
 698:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 69b:	0f b6 16             	movzbl (%esi),%edx
 69e:	84 d2                	test   %dl,%dl
 6a0:	75 eb                	jne    68d <printf+0xec>
      state = 0;
 6a2:	be 00 00 00 00       	mov    $0x0,%esi
 6a7:	e9 21 ff ff ff       	jmp    5cd <printf+0x2c>
        putc(fd, *ap);
 6ac:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6af:	0f be 17             	movsbl (%edi),%edx
 6b2:	8b 45 08             	mov    0x8(%ebp),%eax
 6b5:	e8 42 fe ff ff       	call   4fc <putc>
        ap++;
 6ba:	83 c7 04             	add    $0x4,%edi
 6bd:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 6c0:	be 00 00 00 00       	mov    $0x0,%esi
 6c5:	e9 03 ff ff ff       	jmp    5cd <printf+0x2c>
        putc(fd, c);
 6ca:	89 fa                	mov    %edi,%edx
 6cc:	8b 45 08             	mov    0x8(%ebp),%eax
 6cf:	e8 28 fe ff ff       	call   4fc <putc>
      state = 0;
 6d4:	be 00 00 00 00       	mov    $0x0,%esi
 6d9:	e9 ef fe ff ff       	jmp    5cd <printf+0x2c>
        putc(fd, '%');
 6de:	ba 25 00 00 00       	mov    $0x25,%edx
 6e3:	8b 45 08             	mov    0x8(%ebp),%eax
 6e6:	e8 11 fe ff ff       	call   4fc <putc>
        putc(fd, c);
 6eb:	89 fa                	mov    %edi,%edx
 6ed:	8b 45 08             	mov    0x8(%ebp),%eax
 6f0:	e8 07 fe ff ff       	call   4fc <putc>
      state = 0;
 6f5:	be 00 00 00 00       	mov    $0x0,%esi
 6fa:	e9 ce fe ff ff       	jmp    5cd <printf+0x2c>
    }
  }
}
 6ff:	8d 65 f4             	lea    -0xc(%ebp),%esp
 702:	5b                   	pop    %ebx
 703:	5e                   	pop    %esi
 704:	5f                   	pop    %edi
 705:	5d                   	pop    %ebp
 706:	c3                   	ret    

00000707 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 707:	55                   	push   %ebp
 708:	89 e5                	mov    %esp,%ebp
 70a:	57                   	push   %edi
 70b:	56                   	push   %esi
 70c:	53                   	push   %ebx
 70d:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 710:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 713:	a1 f4 0c 00 00       	mov    0xcf4,%eax
 718:	eb 02                	jmp    71c <free+0x15>
 71a:	89 d0                	mov    %edx,%eax
 71c:	39 c8                	cmp    %ecx,%eax
 71e:	73 04                	jae    724 <free+0x1d>
 720:	39 08                	cmp    %ecx,(%eax)
 722:	77 12                	ja     736 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 724:	8b 10                	mov    (%eax),%edx
 726:	39 c2                	cmp    %eax,%edx
 728:	77 f0                	ja     71a <free+0x13>
 72a:	39 c8                	cmp    %ecx,%eax
 72c:	72 08                	jb     736 <free+0x2f>
 72e:	39 ca                	cmp    %ecx,%edx
 730:	77 04                	ja     736 <free+0x2f>
 732:	89 d0                	mov    %edx,%eax
 734:	eb e6                	jmp    71c <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 736:	8b 73 fc             	mov    -0x4(%ebx),%esi
 739:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 73c:	8b 10                	mov    (%eax),%edx
 73e:	39 d7                	cmp    %edx,%edi
 740:	74 19                	je     75b <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 742:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 745:	8b 50 04             	mov    0x4(%eax),%edx
 748:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 74b:	39 ce                	cmp    %ecx,%esi
 74d:	74 1b                	je     76a <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 74f:	89 08                	mov    %ecx,(%eax)
  freep = p;
 751:	a3 f4 0c 00 00       	mov    %eax,0xcf4
}
 756:	5b                   	pop    %ebx
 757:	5e                   	pop    %esi
 758:	5f                   	pop    %edi
 759:	5d                   	pop    %ebp
 75a:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 75b:	03 72 04             	add    0x4(%edx),%esi
 75e:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 761:	8b 10                	mov    (%eax),%edx
 763:	8b 12                	mov    (%edx),%edx
 765:	89 53 f8             	mov    %edx,-0x8(%ebx)
 768:	eb db                	jmp    745 <free+0x3e>
    p->s.size += bp->s.size;
 76a:	03 53 fc             	add    -0x4(%ebx),%edx
 76d:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 770:	8b 53 f8             	mov    -0x8(%ebx),%edx
 773:	89 10                	mov    %edx,(%eax)
 775:	eb da                	jmp    751 <free+0x4a>

00000777 <morecore>:

static Header*
morecore(uint nu)
{
 777:	55                   	push   %ebp
 778:	89 e5                	mov    %esp,%ebp
 77a:	53                   	push   %ebx
 77b:	83 ec 04             	sub    $0x4,%esp
 77e:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 780:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 785:	77 05                	ja     78c <morecore+0x15>
    nu = 4096;
 787:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 78c:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 793:	83 ec 0c             	sub    $0xc,%esp
 796:	50                   	push   %eax
 797:	e8 38 fd ff ff       	call   4d4 <sbrk>
  if(p == (char*)-1)
 79c:	83 c4 10             	add    $0x10,%esp
 79f:	83 f8 ff             	cmp    $0xffffffff,%eax
 7a2:	74 1c                	je     7c0 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 7a4:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 7a7:	83 c0 08             	add    $0x8,%eax
 7aa:	83 ec 0c             	sub    $0xc,%esp
 7ad:	50                   	push   %eax
 7ae:	e8 54 ff ff ff       	call   707 <free>
  return freep;
 7b3:	a1 f4 0c 00 00       	mov    0xcf4,%eax
 7b8:	83 c4 10             	add    $0x10,%esp
}
 7bb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 7be:	c9                   	leave  
 7bf:	c3                   	ret    
    return 0;
 7c0:	b8 00 00 00 00       	mov    $0x0,%eax
 7c5:	eb f4                	jmp    7bb <morecore+0x44>

000007c7 <malloc>:

void*
malloc(uint nbytes)
{
 7c7:	55                   	push   %ebp
 7c8:	89 e5                	mov    %esp,%ebp
 7ca:	53                   	push   %ebx
 7cb:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7ce:	8b 45 08             	mov    0x8(%ebp),%eax
 7d1:	8d 58 07             	lea    0x7(%eax),%ebx
 7d4:	c1 eb 03             	shr    $0x3,%ebx
 7d7:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 7da:	8b 0d f4 0c 00 00    	mov    0xcf4,%ecx
 7e0:	85 c9                	test   %ecx,%ecx
 7e2:	74 04                	je     7e8 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7e4:	8b 01                	mov    (%ecx),%eax
 7e6:	eb 4a                	jmp    832 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 7e8:	c7 05 f4 0c 00 00 f8 	movl   $0xcf8,0xcf4
 7ef:	0c 00 00 
 7f2:	c7 05 f8 0c 00 00 f8 	movl   $0xcf8,0xcf8
 7f9:	0c 00 00 
    base.s.size = 0;
 7fc:	c7 05 fc 0c 00 00 00 	movl   $0x0,0xcfc
 803:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 806:	b9 f8 0c 00 00       	mov    $0xcf8,%ecx
 80b:	eb d7                	jmp    7e4 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 80d:	74 19                	je     828 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 80f:	29 da                	sub    %ebx,%edx
 811:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 814:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 817:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 81a:	89 0d f4 0c 00 00    	mov    %ecx,0xcf4
      return (void*)(p + 1);
 820:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 823:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 826:	c9                   	leave  
 827:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 828:	8b 10                	mov    (%eax),%edx
 82a:	89 11                	mov    %edx,(%ecx)
 82c:	eb ec                	jmp    81a <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 82e:	89 c1                	mov    %eax,%ecx
 830:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 832:	8b 50 04             	mov    0x4(%eax),%edx
 835:	39 da                	cmp    %ebx,%edx
 837:	73 d4                	jae    80d <malloc+0x46>
    if(p == freep)
 839:	39 05 f4 0c 00 00    	cmp    %eax,0xcf4
 83f:	75 ed                	jne    82e <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 841:	89 d8                	mov    %ebx,%eax
 843:	e8 2f ff ff ff       	call   777 <morecore>
 848:	85 c0                	test   %eax,%eax
 84a:	75 e2                	jne    82e <malloc+0x67>
 84c:	eb d5                	jmp    823 <malloc+0x5c>
