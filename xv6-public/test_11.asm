
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
   6:	a1 b0 0c 00 00       	mov    0xcb0,%eax
   b:	83 f8 01             	cmp    $0x1,%eax
   e:	74 49                	je     59 <worker+0x59>
  10:	6a 2e                	push   $0x2e
  12:	68 24 08 00 00       	push   $0x824
  17:	68 2e 08 00 00       	push   $0x82e
  1c:	6a 01                	push   $0x1
  1e:	e8 52 05 00 00       	call   575 <printf>
  23:	83 c4 0c             	add    $0xc,%esp
  26:	68 36 08 00 00       	push   $0x836
  2b:	68 42 08 00 00       	push   $0x842
  30:	6a 01                	push   $0x1
  32:	e8 3e 05 00 00       	call   575 <printf>
  37:	83 c4 08             	add    $0x8,%esp
  3a:	68 56 08 00 00       	push   $0x856
  3f:	6a 01                	push   $0x1
  41:	e8 2f 05 00 00       	call   575 <printf>
  46:	83 c4 04             	add    $0x4,%esp
  49:	ff 35 b4 0c 00 00    	push   0xcb4
  4f:	e8 fc 03 00 00       	call   450 <kill>
  54:	e8 c7 03 00 00       	call   420 <exit>
   global += 4;
  59:	a1 b0 0c 00 00       	mov    0xcb0,%eax
  5e:	83 c0 04             	add    $0x4,%eax
  61:	a3 b0 0c 00 00       	mov    %eax,0xcb0
   exit();
  66:	e8 b5 03 00 00       	call   420 <exit>

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
  7e:	e8 1d 04 00 00       	call   4a0 <getpid>
  83:	a3 b4 0c 00 00       	mov    %eax,0xcb4
   for(i = 0; i < 10; i++) {
  88:	be 00 00 00 00       	mov    $0x0,%esi
  8d:	83 fe 09             	cmp    $0x9,%esi
  90:	0f 8f 7c 01 00 00    	jg     212 <main+0x1a7>
      global = 1;
  96:	c7 05 b0 0c 00 00 01 	movl   $0x1,0xcb0
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
  ba:	e8 7e 01 00 00       	call   23d <thread_join>
      assert(join_pid == thread_pid);
  bf:	39 c3                	cmp    %eax,%ebx
  c1:	75 74                	jne    137 <main+0xcc>
      assert(global == 5);
  c3:	a1 b0 0c 00 00       	mov    0xcb0,%eax
  c8:	83 f8 05             	cmp    $0x5,%eax
  cb:	0f 85 af 00 00 00    	jne    180 <main+0x115>
      assert((uint)sbrk(0) < (150 * 4096) && "shouldn't even come close");
  d1:	83 ec 0c             	sub    $0xc,%esp
  d4:	6a 00                	push   $0x0
  d6:	e8 cd 03 00 00       	call   4a8 <sbrk>
  db:	83 c4 10             	add    $0x10,%esp
  de:	3d ff 5f 09 00       	cmp    $0x95fff,%eax
  e3:	0f 87 e0 00 00 00    	ja     1c9 <main+0x15e>
   for(i = 0; i < 10; i++) {
  e9:	83 c6 01             	add    $0x1,%esi
  ec:	eb 9f                	jmp    8d <main+0x22>
      assert(thread_pid > 0);
  ee:	6a 20                	push   $0x20
  f0:	68 24 08 00 00       	push   $0x824
  f5:	68 2e 08 00 00       	push   $0x82e
  fa:	6a 01                	push   $0x1
  fc:	e8 74 04 00 00       	call   575 <printf>
 101:	83 c4 0c             	add    $0xc,%esp
 104:	68 63 08 00 00       	push   $0x863
 109:	68 42 08 00 00       	push   $0x842
 10e:	6a 01                	push   $0x1
 110:	e8 60 04 00 00       	call   575 <printf>
 115:	83 c4 08             	add    $0x8,%esp
 118:	68 56 08 00 00       	push   $0x856
 11d:	6a 01                	push   $0x1
 11f:	e8 51 04 00 00       	call   575 <printf>
 124:	83 c4 04             	add    $0x4,%esp
 127:	ff 35 b4 0c 00 00    	push   0xcb4
 12d:	e8 1e 03 00 00       	call   450 <kill>
 132:	e8 e9 02 00 00       	call   420 <exit>
      assert(join_pid == thread_pid);
 137:	6a 22                	push   $0x22
 139:	68 24 08 00 00       	push   $0x824
 13e:	68 2e 08 00 00       	push   $0x82e
 143:	6a 01                	push   $0x1
 145:	e8 2b 04 00 00       	call   575 <printf>
 14a:	83 c4 0c             	add    $0xc,%esp
 14d:	68 72 08 00 00       	push   $0x872
 152:	68 42 08 00 00       	push   $0x842
 157:	6a 01                	push   $0x1
 159:	e8 17 04 00 00       	call   575 <printf>
 15e:	83 c4 08             	add    $0x8,%esp
 161:	68 56 08 00 00       	push   $0x856
 166:	6a 01                	push   $0x1
 168:	e8 08 04 00 00       	call   575 <printf>
 16d:	83 c4 04             	add    $0x4,%esp
 170:	ff 35 b4 0c 00 00    	push   0xcb4
 176:	e8 d5 02 00 00       	call   450 <kill>
 17b:	e8 a0 02 00 00       	call   420 <exit>
      assert(global == 5);
 180:	6a 23                	push   $0x23
 182:	68 24 08 00 00       	push   $0x824
 187:	68 2e 08 00 00       	push   $0x82e
 18c:	6a 01                	push   $0x1
 18e:	e8 e2 03 00 00       	call   575 <printf>
 193:	83 c4 0c             	add    $0xc,%esp
 196:	68 89 08 00 00       	push   $0x889
 19b:	68 42 08 00 00       	push   $0x842
 1a0:	6a 01                	push   $0x1
 1a2:	e8 ce 03 00 00       	call   575 <printf>
 1a7:	83 c4 08             	add    $0x8,%esp
 1aa:	68 56 08 00 00       	push   $0x856
 1af:	6a 01                	push   $0x1
 1b1:	e8 bf 03 00 00       	call   575 <printf>
 1b6:	83 c4 04             	add    $0x4,%esp
 1b9:	ff 35 b4 0c 00 00    	push   0xcb4
 1bf:	e8 8c 02 00 00       	call   450 <kill>
 1c4:	e8 57 02 00 00       	call   420 <exit>
      assert((uint)sbrk(0) < (150 * 4096) && "shouldn't even come close");
 1c9:	6a 25                	push   $0x25
 1cb:	68 24 08 00 00       	push   $0x824
 1d0:	68 2e 08 00 00       	push   $0x82e
 1d5:	6a 01                	push   $0x1
 1d7:	e8 99 03 00 00       	call   575 <printf>
 1dc:	83 c4 0c             	add    $0xc,%esp
 1df:	68 a4 08 00 00       	push   $0x8a4
 1e4:	68 42 08 00 00       	push   $0x842
 1e9:	6a 01                	push   $0x1
 1eb:	e8 85 03 00 00       	call   575 <printf>
 1f0:	83 c4 08             	add    $0x8,%esp
 1f3:	68 56 08 00 00       	push   $0x856
 1f8:	6a 01                	push   $0x1
 1fa:	e8 76 03 00 00       	call   575 <printf>
 1ff:	83 c4 04             	add    $0x4,%esp
 202:	ff 35 b4 0c 00 00    	push   0xcb4
 208:	e8 43 02 00 00       	call   450 <kill>
 20d:	e8 0e 02 00 00       	call   420 <exit>
   printf(1, "TEST PASSED\n");
 212:	83 ec 08             	sub    $0x8,%esp
 215:	68 95 08 00 00       	push   $0x895
 21a:	6a 01                	push   $0x1
 21c:	e8 54 03 00 00       	call   575 <printf>
   exit();
 221:	e8 fa 01 00 00       	call   420 <exit>

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

  // I can't remember if there was something else to do here but I'm sure I'll find out


  return new_pid;
}
 237:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 23c:	c3                   	ret    

0000023d <thread_join>:

int thread_join() {
  return 0;
}
 23d:	b8 00 00 00 00       	mov    $0x0,%eax
 242:	c3                   	ret    

00000243 <lock_acquire>:

void lock_acquire(lock_t *lock){
 243:	55                   	push   %ebp
 244:	89 e5                	mov    %esp,%ebp
 246:	53                   	push   %ebx
 247:	83 ec 04             	sub    $0x4,%esp
 24a:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 24d:	83 ec 08             	sub    $0x8,%esp
 250:	6a 01                	push   $0x1
 252:	53                   	push   %ebx
 253:	e8 ce ff ff ff       	call   226 <test_and_set>
 258:	83 c4 10             	add    $0x10,%esp
 25b:	83 f8 01             	cmp    $0x1,%eax
 25e:	74 ed                	je     24d <lock_acquire+0xa>
    ;
}
 260:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 263:	c9                   	leave  
 264:	c3                   	ret    

00000265 <lock_release>:

void lock_release(lock_t *lock) {
 265:	55                   	push   %ebp
 266:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 268:	8b 45 08             	mov    0x8(%ebp),%eax
 26b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 271:	5d                   	pop    %ebp
 272:	c3                   	ret    

00000273 <lock_init>:

void lock_init(lock_t *lock) {
 273:	55                   	push   %ebp
 274:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 276:	8b 45 08             	mov    0x8(%ebp),%eax
 279:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 27f:	5d                   	pop    %ebp
 280:	c3                   	ret    

00000281 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 281:	55                   	push   %ebp
 282:	89 e5                	mov    %esp,%ebp
 284:	56                   	push   %esi
 285:	53                   	push   %ebx
 286:	8b 75 08             	mov    0x8(%ebp),%esi
 289:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 28c:	89 f0                	mov    %esi,%eax
 28e:	89 d1                	mov    %edx,%ecx
 290:	83 c2 01             	add    $0x1,%edx
 293:	89 c3                	mov    %eax,%ebx
 295:	83 c0 01             	add    $0x1,%eax
 298:	0f b6 09             	movzbl (%ecx),%ecx
 29b:	88 0b                	mov    %cl,(%ebx)
 29d:	84 c9                	test   %cl,%cl
 29f:	75 ed                	jne    28e <strcpy+0xd>
    ;
  return os;
}
 2a1:	89 f0                	mov    %esi,%eax
 2a3:	5b                   	pop    %ebx
 2a4:	5e                   	pop    %esi
 2a5:	5d                   	pop    %ebp
 2a6:	c3                   	ret    

000002a7 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 2a7:	55                   	push   %ebp
 2a8:	89 e5                	mov    %esp,%ebp
 2aa:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2ad:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 2b0:	eb 06                	jmp    2b8 <strcmp+0x11>
    p++, q++;
 2b2:	83 c1 01             	add    $0x1,%ecx
 2b5:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 2b8:	0f b6 01             	movzbl (%ecx),%eax
 2bb:	84 c0                	test   %al,%al
 2bd:	74 04                	je     2c3 <strcmp+0x1c>
 2bf:	3a 02                	cmp    (%edx),%al
 2c1:	74 ef                	je     2b2 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 2c3:	0f b6 c0             	movzbl %al,%eax
 2c6:	0f b6 12             	movzbl (%edx),%edx
 2c9:	29 d0                	sub    %edx,%eax
}
 2cb:	5d                   	pop    %ebp
 2cc:	c3                   	ret    

000002cd <strlen>:

uint
strlen(const char *s)
{
 2cd:	55                   	push   %ebp
 2ce:	89 e5                	mov    %esp,%ebp
 2d0:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 2d3:	b8 00 00 00 00       	mov    $0x0,%eax
 2d8:	eb 03                	jmp    2dd <strlen+0x10>
 2da:	83 c0 01             	add    $0x1,%eax
 2dd:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 2e1:	75 f7                	jne    2da <strlen+0xd>
    ;
  return n;
}
 2e3:	5d                   	pop    %ebp
 2e4:	c3                   	ret    

000002e5 <memset>:

void*
memset(void *dst, int c, uint n)
{
 2e5:	55                   	push   %ebp
 2e6:	89 e5                	mov    %esp,%ebp
 2e8:	57                   	push   %edi
 2e9:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 2ec:	89 d7                	mov    %edx,%edi
 2ee:	8b 4d 10             	mov    0x10(%ebp),%ecx
 2f1:	8b 45 0c             	mov    0xc(%ebp),%eax
 2f4:	fc                   	cld    
 2f5:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 2f7:	89 d0                	mov    %edx,%eax
 2f9:	8b 7d fc             	mov    -0x4(%ebp),%edi
 2fc:	c9                   	leave  
 2fd:	c3                   	ret    

000002fe <strchr>:

char*
strchr(const char *s, char c)
{
 2fe:	55                   	push   %ebp
 2ff:	89 e5                	mov    %esp,%ebp
 301:	8b 45 08             	mov    0x8(%ebp),%eax
 304:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 308:	eb 03                	jmp    30d <strchr+0xf>
 30a:	83 c0 01             	add    $0x1,%eax
 30d:	0f b6 10             	movzbl (%eax),%edx
 310:	84 d2                	test   %dl,%dl
 312:	74 06                	je     31a <strchr+0x1c>
    if(*s == c)
 314:	38 ca                	cmp    %cl,%dl
 316:	75 f2                	jne    30a <strchr+0xc>
 318:	eb 05                	jmp    31f <strchr+0x21>
      return (char*)s;
  return 0;
 31a:	b8 00 00 00 00       	mov    $0x0,%eax
}
 31f:	5d                   	pop    %ebp
 320:	c3                   	ret    

00000321 <gets>:

char*
gets(char *buf, int max)
{
 321:	55                   	push   %ebp
 322:	89 e5                	mov    %esp,%ebp
 324:	57                   	push   %edi
 325:	56                   	push   %esi
 326:	53                   	push   %ebx
 327:	83 ec 1c             	sub    $0x1c,%esp
 32a:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 32d:	bb 00 00 00 00       	mov    $0x0,%ebx
 332:	89 de                	mov    %ebx,%esi
 334:	83 c3 01             	add    $0x1,%ebx
 337:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 33a:	7d 2e                	jge    36a <gets+0x49>
    cc = read(0, &c, 1);
 33c:	83 ec 04             	sub    $0x4,%esp
 33f:	6a 01                	push   $0x1
 341:	8d 45 e7             	lea    -0x19(%ebp),%eax
 344:	50                   	push   %eax
 345:	6a 00                	push   $0x0
 347:	e8 ec 00 00 00       	call   438 <read>
    if(cc < 1)
 34c:	83 c4 10             	add    $0x10,%esp
 34f:	85 c0                	test   %eax,%eax
 351:	7e 17                	jle    36a <gets+0x49>
      break;
    buf[i++] = c;
 353:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 357:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 35a:	3c 0a                	cmp    $0xa,%al
 35c:	0f 94 c2             	sete   %dl
 35f:	3c 0d                	cmp    $0xd,%al
 361:	0f 94 c0             	sete   %al
 364:	08 c2                	or     %al,%dl
 366:	74 ca                	je     332 <gets+0x11>
    buf[i++] = c;
 368:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 36a:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 36e:	89 f8                	mov    %edi,%eax
 370:	8d 65 f4             	lea    -0xc(%ebp),%esp
 373:	5b                   	pop    %ebx
 374:	5e                   	pop    %esi
 375:	5f                   	pop    %edi
 376:	5d                   	pop    %ebp
 377:	c3                   	ret    

00000378 <stat>:

int
stat(const char *n, struct stat *st)
{
 378:	55                   	push   %ebp
 379:	89 e5                	mov    %esp,%ebp
 37b:	56                   	push   %esi
 37c:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 37d:	83 ec 08             	sub    $0x8,%esp
 380:	6a 00                	push   $0x0
 382:	ff 75 08             	push   0x8(%ebp)
 385:	e8 d6 00 00 00       	call   460 <open>
  if(fd < 0)
 38a:	83 c4 10             	add    $0x10,%esp
 38d:	85 c0                	test   %eax,%eax
 38f:	78 24                	js     3b5 <stat+0x3d>
 391:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 393:	83 ec 08             	sub    $0x8,%esp
 396:	ff 75 0c             	push   0xc(%ebp)
 399:	50                   	push   %eax
 39a:	e8 d9 00 00 00       	call   478 <fstat>
 39f:	89 c6                	mov    %eax,%esi
  close(fd);
 3a1:	89 1c 24             	mov    %ebx,(%esp)
 3a4:	e8 9f 00 00 00       	call   448 <close>
  return r;
 3a9:	83 c4 10             	add    $0x10,%esp
}
 3ac:	89 f0                	mov    %esi,%eax
 3ae:	8d 65 f8             	lea    -0x8(%ebp),%esp
 3b1:	5b                   	pop    %ebx
 3b2:	5e                   	pop    %esi
 3b3:	5d                   	pop    %ebp
 3b4:	c3                   	ret    
    return -1;
 3b5:	be ff ff ff ff       	mov    $0xffffffff,%esi
 3ba:	eb f0                	jmp    3ac <stat+0x34>

000003bc <atoi>:

int
atoi(const char *s)
{
 3bc:	55                   	push   %ebp
 3bd:	89 e5                	mov    %esp,%ebp
 3bf:	53                   	push   %ebx
 3c0:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 3c3:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 3c8:	eb 10                	jmp    3da <atoi+0x1e>
    n = n*10 + *s++ - '0';
 3ca:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 3cd:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 3d0:	83 c1 01             	add    $0x1,%ecx
 3d3:	0f be c0             	movsbl %al,%eax
 3d6:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 3da:	0f b6 01             	movzbl (%ecx),%eax
 3dd:	8d 58 d0             	lea    -0x30(%eax),%ebx
 3e0:	80 fb 09             	cmp    $0x9,%bl
 3e3:	76 e5                	jbe    3ca <atoi+0xe>
  return n;
}
 3e5:	89 d0                	mov    %edx,%eax
 3e7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3ea:	c9                   	leave  
 3eb:	c3                   	ret    

000003ec <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3ec:	55                   	push   %ebp
 3ed:	89 e5                	mov    %esp,%ebp
 3ef:	56                   	push   %esi
 3f0:	53                   	push   %ebx
 3f1:	8b 75 08             	mov    0x8(%ebp),%esi
 3f4:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 3f7:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 3fa:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 3fc:	eb 0d                	jmp    40b <memmove+0x1f>
    *dst++ = *src++;
 3fe:	0f b6 01             	movzbl (%ecx),%eax
 401:	88 02                	mov    %al,(%edx)
 403:	8d 49 01             	lea    0x1(%ecx),%ecx
 406:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 409:	89 d8                	mov    %ebx,%eax
 40b:	8d 58 ff             	lea    -0x1(%eax),%ebx
 40e:	85 c0                	test   %eax,%eax
 410:	7f ec                	jg     3fe <memmove+0x12>
  return vdst;
}
 412:	89 f0                	mov    %esi,%eax
 414:	5b                   	pop    %ebx
 415:	5e                   	pop    %esi
 416:	5d                   	pop    %ebp
 417:	c3                   	ret    

00000418 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 418:	b8 01 00 00 00       	mov    $0x1,%eax
 41d:	cd 40                	int    $0x40
 41f:	c3                   	ret    

00000420 <exit>:
SYSCALL(exit)
 420:	b8 02 00 00 00       	mov    $0x2,%eax
 425:	cd 40                	int    $0x40
 427:	c3                   	ret    

00000428 <wait>:
SYSCALL(wait)
 428:	b8 03 00 00 00       	mov    $0x3,%eax
 42d:	cd 40                	int    $0x40
 42f:	c3                   	ret    

00000430 <pipe>:
SYSCALL(pipe)
 430:	b8 04 00 00 00       	mov    $0x4,%eax
 435:	cd 40                	int    $0x40
 437:	c3                   	ret    

00000438 <read>:
SYSCALL(read)
 438:	b8 05 00 00 00       	mov    $0x5,%eax
 43d:	cd 40                	int    $0x40
 43f:	c3                   	ret    

00000440 <write>:
SYSCALL(write)
 440:	b8 10 00 00 00       	mov    $0x10,%eax
 445:	cd 40                	int    $0x40
 447:	c3                   	ret    

00000448 <close>:
SYSCALL(close)
 448:	b8 15 00 00 00       	mov    $0x15,%eax
 44d:	cd 40                	int    $0x40
 44f:	c3                   	ret    

00000450 <kill>:
SYSCALL(kill)
 450:	b8 06 00 00 00       	mov    $0x6,%eax
 455:	cd 40                	int    $0x40
 457:	c3                   	ret    

00000458 <exec>:
SYSCALL(exec)
 458:	b8 07 00 00 00       	mov    $0x7,%eax
 45d:	cd 40                	int    $0x40
 45f:	c3                   	ret    

00000460 <open>:
SYSCALL(open)
 460:	b8 0f 00 00 00       	mov    $0xf,%eax
 465:	cd 40                	int    $0x40
 467:	c3                   	ret    

00000468 <mknod>:
SYSCALL(mknod)
 468:	b8 11 00 00 00       	mov    $0x11,%eax
 46d:	cd 40                	int    $0x40
 46f:	c3                   	ret    

00000470 <unlink>:
SYSCALL(unlink)
 470:	b8 12 00 00 00       	mov    $0x12,%eax
 475:	cd 40                	int    $0x40
 477:	c3                   	ret    

00000478 <fstat>:
SYSCALL(fstat)
 478:	b8 08 00 00 00       	mov    $0x8,%eax
 47d:	cd 40                	int    $0x40
 47f:	c3                   	ret    

00000480 <link>:
SYSCALL(link)
 480:	b8 13 00 00 00       	mov    $0x13,%eax
 485:	cd 40                	int    $0x40
 487:	c3                   	ret    

00000488 <mkdir>:
SYSCALL(mkdir)
 488:	b8 14 00 00 00       	mov    $0x14,%eax
 48d:	cd 40                	int    $0x40
 48f:	c3                   	ret    

00000490 <chdir>:
SYSCALL(chdir)
 490:	b8 09 00 00 00       	mov    $0x9,%eax
 495:	cd 40                	int    $0x40
 497:	c3                   	ret    

00000498 <dup>:
SYSCALL(dup)
 498:	b8 0a 00 00 00       	mov    $0xa,%eax
 49d:	cd 40                	int    $0x40
 49f:	c3                   	ret    

000004a0 <getpid>:
SYSCALL(getpid)
 4a0:	b8 0b 00 00 00       	mov    $0xb,%eax
 4a5:	cd 40                	int    $0x40
 4a7:	c3                   	ret    

000004a8 <sbrk>:
SYSCALL(sbrk)
 4a8:	b8 0c 00 00 00       	mov    $0xc,%eax
 4ad:	cd 40                	int    $0x40
 4af:	c3                   	ret    

000004b0 <sleep>:
SYSCALL(sleep)
 4b0:	b8 0d 00 00 00       	mov    $0xd,%eax
 4b5:	cd 40                	int    $0x40
 4b7:	c3                   	ret    

000004b8 <uptime>:
SYSCALL(uptime)
 4b8:	b8 0e 00 00 00       	mov    $0xe,%eax
 4bd:	cd 40                	int    $0x40
 4bf:	c3                   	ret    

000004c0 <clone>:
SYSCALL(clone)
 4c0:	b8 16 00 00 00       	mov    $0x16,%eax
 4c5:	cd 40                	int    $0x40
 4c7:	c3                   	ret    

000004c8 <join>:
 4c8:	b8 17 00 00 00       	mov    $0x17,%eax
 4cd:	cd 40                	int    $0x40
 4cf:	c3                   	ret    

000004d0 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 4d0:	55                   	push   %ebp
 4d1:	89 e5                	mov    %esp,%ebp
 4d3:	83 ec 1c             	sub    $0x1c,%esp
 4d6:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 4d9:	6a 01                	push   $0x1
 4db:	8d 55 f4             	lea    -0xc(%ebp),%edx
 4de:	52                   	push   %edx
 4df:	50                   	push   %eax
 4e0:	e8 5b ff ff ff       	call   440 <write>
}
 4e5:	83 c4 10             	add    $0x10,%esp
 4e8:	c9                   	leave  
 4e9:	c3                   	ret    

000004ea <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 4ea:	55                   	push   %ebp
 4eb:	89 e5                	mov    %esp,%ebp
 4ed:	57                   	push   %edi
 4ee:	56                   	push   %esi
 4ef:	53                   	push   %ebx
 4f0:	83 ec 2c             	sub    $0x2c,%esp
 4f3:	89 45 d0             	mov    %eax,-0x30(%ebp)
 4f6:	89 d0                	mov    %edx,%eax
 4f8:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 4fa:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 4fe:	0f 95 c1             	setne  %cl
 501:	c1 ea 1f             	shr    $0x1f,%edx
 504:	84 d1                	test   %dl,%cl
 506:	74 44                	je     54c <printint+0x62>
    neg = 1;
    x = -xx;
 508:	f7 d8                	neg    %eax
 50a:	89 c1                	mov    %eax,%ecx
    neg = 1;
 50c:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 513:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 518:	89 c8                	mov    %ecx,%eax
 51a:	ba 00 00 00 00       	mov    $0x0,%edx
 51f:	f7 f6                	div    %esi
 521:	89 df                	mov    %ebx,%edi
 523:	83 c3 01             	add    $0x1,%ebx
 526:	0f b6 92 40 09 00 00 	movzbl 0x940(%edx),%edx
 52d:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 531:	89 ca                	mov    %ecx,%edx
 533:	89 c1                	mov    %eax,%ecx
 535:	39 d6                	cmp    %edx,%esi
 537:	76 df                	jbe    518 <printint+0x2e>
  if(neg)
 539:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 53d:	74 31                	je     570 <printint+0x86>
    buf[i++] = '-';
 53f:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 544:	8d 5f 02             	lea    0x2(%edi),%ebx
 547:	8b 75 d0             	mov    -0x30(%ebp),%esi
 54a:	eb 17                	jmp    563 <printint+0x79>
    x = xx;
 54c:	89 c1                	mov    %eax,%ecx
  neg = 0;
 54e:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 555:	eb bc                	jmp    513 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 557:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 55c:	89 f0                	mov    %esi,%eax
 55e:	e8 6d ff ff ff       	call   4d0 <putc>
  while(--i >= 0)
 563:	83 eb 01             	sub    $0x1,%ebx
 566:	79 ef                	jns    557 <printint+0x6d>
}
 568:	83 c4 2c             	add    $0x2c,%esp
 56b:	5b                   	pop    %ebx
 56c:	5e                   	pop    %esi
 56d:	5f                   	pop    %edi
 56e:	5d                   	pop    %ebp
 56f:	c3                   	ret    
 570:	8b 75 d0             	mov    -0x30(%ebp),%esi
 573:	eb ee                	jmp    563 <printint+0x79>

00000575 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 575:	55                   	push   %ebp
 576:	89 e5                	mov    %esp,%ebp
 578:	57                   	push   %edi
 579:	56                   	push   %esi
 57a:	53                   	push   %ebx
 57b:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 57e:	8d 45 10             	lea    0x10(%ebp),%eax
 581:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 584:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 589:	bb 00 00 00 00       	mov    $0x0,%ebx
 58e:	eb 14                	jmp    5a4 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 590:	89 fa                	mov    %edi,%edx
 592:	8b 45 08             	mov    0x8(%ebp),%eax
 595:	e8 36 ff ff ff       	call   4d0 <putc>
 59a:	eb 05                	jmp    5a1 <printf+0x2c>
      }
    } else if(state == '%'){
 59c:	83 fe 25             	cmp    $0x25,%esi
 59f:	74 25                	je     5c6 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 5a1:	83 c3 01             	add    $0x1,%ebx
 5a4:	8b 45 0c             	mov    0xc(%ebp),%eax
 5a7:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 5ab:	84 c0                	test   %al,%al
 5ad:	0f 84 20 01 00 00    	je     6d3 <printf+0x15e>
    c = fmt[i] & 0xff;
 5b3:	0f be f8             	movsbl %al,%edi
 5b6:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 5b9:	85 f6                	test   %esi,%esi
 5bb:	75 df                	jne    59c <printf+0x27>
      if(c == '%'){
 5bd:	83 f8 25             	cmp    $0x25,%eax
 5c0:	75 ce                	jne    590 <printf+0x1b>
        state = '%';
 5c2:	89 c6                	mov    %eax,%esi
 5c4:	eb db                	jmp    5a1 <printf+0x2c>
      if(c == 'd'){
 5c6:	83 f8 25             	cmp    $0x25,%eax
 5c9:	0f 84 cf 00 00 00    	je     69e <printf+0x129>
 5cf:	0f 8c dd 00 00 00    	jl     6b2 <printf+0x13d>
 5d5:	83 f8 78             	cmp    $0x78,%eax
 5d8:	0f 8f d4 00 00 00    	jg     6b2 <printf+0x13d>
 5de:	83 f8 63             	cmp    $0x63,%eax
 5e1:	0f 8c cb 00 00 00    	jl     6b2 <printf+0x13d>
 5e7:	83 e8 63             	sub    $0x63,%eax
 5ea:	83 f8 15             	cmp    $0x15,%eax
 5ed:	0f 87 bf 00 00 00    	ja     6b2 <printf+0x13d>
 5f3:	ff 24 85 e8 08 00 00 	jmp    *0x8e8(,%eax,4)
        printint(fd, *ap, 10, 1);
 5fa:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5fd:	8b 17                	mov    (%edi),%edx
 5ff:	83 ec 0c             	sub    $0xc,%esp
 602:	6a 01                	push   $0x1
 604:	b9 0a 00 00 00       	mov    $0xa,%ecx
 609:	8b 45 08             	mov    0x8(%ebp),%eax
 60c:	e8 d9 fe ff ff       	call   4ea <printint>
        ap++;
 611:	83 c7 04             	add    $0x4,%edi
 614:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 617:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 61a:	be 00 00 00 00       	mov    $0x0,%esi
 61f:	eb 80                	jmp    5a1 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 621:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 624:	8b 17                	mov    (%edi),%edx
 626:	83 ec 0c             	sub    $0xc,%esp
 629:	6a 00                	push   $0x0
 62b:	b9 10 00 00 00       	mov    $0x10,%ecx
 630:	8b 45 08             	mov    0x8(%ebp),%eax
 633:	e8 b2 fe ff ff       	call   4ea <printint>
        ap++;
 638:	83 c7 04             	add    $0x4,%edi
 63b:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 63e:	83 c4 10             	add    $0x10,%esp
      state = 0;
 641:	be 00 00 00 00       	mov    $0x0,%esi
 646:	e9 56 ff ff ff       	jmp    5a1 <printf+0x2c>
        s = (char*)*ap;
 64b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 64e:	8b 30                	mov    (%eax),%esi
        ap++;
 650:	83 c0 04             	add    $0x4,%eax
 653:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 656:	85 f6                	test   %esi,%esi
 658:	75 15                	jne    66f <printf+0xfa>
          s = "(null)";
 65a:	be e0 08 00 00       	mov    $0x8e0,%esi
 65f:	eb 0e                	jmp    66f <printf+0xfa>
          putc(fd, *s);
 661:	0f be d2             	movsbl %dl,%edx
 664:	8b 45 08             	mov    0x8(%ebp),%eax
 667:	e8 64 fe ff ff       	call   4d0 <putc>
          s++;
 66c:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 66f:	0f b6 16             	movzbl (%esi),%edx
 672:	84 d2                	test   %dl,%dl
 674:	75 eb                	jne    661 <printf+0xec>
      state = 0;
 676:	be 00 00 00 00       	mov    $0x0,%esi
 67b:	e9 21 ff ff ff       	jmp    5a1 <printf+0x2c>
        putc(fd, *ap);
 680:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 683:	0f be 17             	movsbl (%edi),%edx
 686:	8b 45 08             	mov    0x8(%ebp),%eax
 689:	e8 42 fe ff ff       	call   4d0 <putc>
        ap++;
 68e:	83 c7 04             	add    $0x4,%edi
 691:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 694:	be 00 00 00 00       	mov    $0x0,%esi
 699:	e9 03 ff ff ff       	jmp    5a1 <printf+0x2c>
        putc(fd, c);
 69e:	89 fa                	mov    %edi,%edx
 6a0:	8b 45 08             	mov    0x8(%ebp),%eax
 6a3:	e8 28 fe ff ff       	call   4d0 <putc>
      state = 0;
 6a8:	be 00 00 00 00       	mov    $0x0,%esi
 6ad:	e9 ef fe ff ff       	jmp    5a1 <printf+0x2c>
        putc(fd, '%');
 6b2:	ba 25 00 00 00       	mov    $0x25,%edx
 6b7:	8b 45 08             	mov    0x8(%ebp),%eax
 6ba:	e8 11 fe ff ff       	call   4d0 <putc>
        putc(fd, c);
 6bf:	89 fa                	mov    %edi,%edx
 6c1:	8b 45 08             	mov    0x8(%ebp),%eax
 6c4:	e8 07 fe ff ff       	call   4d0 <putc>
      state = 0;
 6c9:	be 00 00 00 00       	mov    $0x0,%esi
 6ce:	e9 ce fe ff ff       	jmp    5a1 <printf+0x2c>
    }
  }
}
 6d3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6d6:	5b                   	pop    %ebx
 6d7:	5e                   	pop    %esi
 6d8:	5f                   	pop    %edi
 6d9:	5d                   	pop    %ebp
 6da:	c3                   	ret    

000006db <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6db:	55                   	push   %ebp
 6dc:	89 e5                	mov    %esp,%ebp
 6de:	57                   	push   %edi
 6df:	56                   	push   %esi
 6e0:	53                   	push   %ebx
 6e1:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 6e4:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6e7:	a1 b8 0c 00 00       	mov    0xcb8,%eax
 6ec:	eb 02                	jmp    6f0 <free+0x15>
 6ee:	89 d0                	mov    %edx,%eax
 6f0:	39 c8                	cmp    %ecx,%eax
 6f2:	73 04                	jae    6f8 <free+0x1d>
 6f4:	39 08                	cmp    %ecx,(%eax)
 6f6:	77 12                	ja     70a <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6f8:	8b 10                	mov    (%eax),%edx
 6fa:	39 c2                	cmp    %eax,%edx
 6fc:	77 f0                	ja     6ee <free+0x13>
 6fe:	39 c8                	cmp    %ecx,%eax
 700:	72 08                	jb     70a <free+0x2f>
 702:	39 ca                	cmp    %ecx,%edx
 704:	77 04                	ja     70a <free+0x2f>
 706:	89 d0                	mov    %edx,%eax
 708:	eb e6                	jmp    6f0 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 70a:	8b 73 fc             	mov    -0x4(%ebx),%esi
 70d:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 710:	8b 10                	mov    (%eax),%edx
 712:	39 d7                	cmp    %edx,%edi
 714:	74 19                	je     72f <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 716:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 719:	8b 50 04             	mov    0x4(%eax),%edx
 71c:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 71f:	39 ce                	cmp    %ecx,%esi
 721:	74 1b                	je     73e <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 723:	89 08                	mov    %ecx,(%eax)
  freep = p;
 725:	a3 b8 0c 00 00       	mov    %eax,0xcb8
}
 72a:	5b                   	pop    %ebx
 72b:	5e                   	pop    %esi
 72c:	5f                   	pop    %edi
 72d:	5d                   	pop    %ebp
 72e:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 72f:	03 72 04             	add    0x4(%edx),%esi
 732:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 735:	8b 10                	mov    (%eax),%edx
 737:	8b 12                	mov    (%edx),%edx
 739:	89 53 f8             	mov    %edx,-0x8(%ebx)
 73c:	eb db                	jmp    719 <free+0x3e>
    p->s.size += bp->s.size;
 73e:	03 53 fc             	add    -0x4(%ebx),%edx
 741:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 744:	8b 53 f8             	mov    -0x8(%ebx),%edx
 747:	89 10                	mov    %edx,(%eax)
 749:	eb da                	jmp    725 <free+0x4a>

0000074b <morecore>:

static Header*
morecore(uint nu)
{
 74b:	55                   	push   %ebp
 74c:	89 e5                	mov    %esp,%ebp
 74e:	53                   	push   %ebx
 74f:	83 ec 04             	sub    $0x4,%esp
 752:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 754:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 759:	77 05                	ja     760 <morecore+0x15>
    nu = 4096;
 75b:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 760:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 767:	83 ec 0c             	sub    $0xc,%esp
 76a:	50                   	push   %eax
 76b:	e8 38 fd ff ff       	call   4a8 <sbrk>
  if(p == (char*)-1)
 770:	83 c4 10             	add    $0x10,%esp
 773:	83 f8 ff             	cmp    $0xffffffff,%eax
 776:	74 1c                	je     794 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 778:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 77b:	83 c0 08             	add    $0x8,%eax
 77e:	83 ec 0c             	sub    $0xc,%esp
 781:	50                   	push   %eax
 782:	e8 54 ff ff ff       	call   6db <free>
  return freep;
 787:	a1 b8 0c 00 00       	mov    0xcb8,%eax
 78c:	83 c4 10             	add    $0x10,%esp
}
 78f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 792:	c9                   	leave  
 793:	c3                   	ret    
    return 0;
 794:	b8 00 00 00 00       	mov    $0x0,%eax
 799:	eb f4                	jmp    78f <morecore+0x44>

0000079b <malloc>:

void*
malloc(uint nbytes)
{
 79b:	55                   	push   %ebp
 79c:	89 e5                	mov    %esp,%ebp
 79e:	53                   	push   %ebx
 79f:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7a2:	8b 45 08             	mov    0x8(%ebp),%eax
 7a5:	8d 58 07             	lea    0x7(%eax),%ebx
 7a8:	c1 eb 03             	shr    $0x3,%ebx
 7ab:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 7ae:	8b 0d b8 0c 00 00    	mov    0xcb8,%ecx
 7b4:	85 c9                	test   %ecx,%ecx
 7b6:	74 04                	je     7bc <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7b8:	8b 01                	mov    (%ecx),%eax
 7ba:	eb 4a                	jmp    806 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 7bc:	c7 05 b8 0c 00 00 bc 	movl   $0xcbc,0xcb8
 7c3:	0c 00 00 
 7c6:	c7 05 bc 0c 00 00 bc 	movl   $0xcbc,0xcbc
 7cd:	0c 00 00 
    base.s.size = 0;
 7d0:	c7 05 c0 0c 00 00 00 	movl   $0x0,0xcc0
 7d7:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 7da:	b9 bc 0c 00 00       	mov    $0xcbc,%ecx
 7df:	eb d7                	jmp    7b8 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 7e1:	74 19                	je     7fc <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 7e3:	29 da                	sub    %ebx,%edx
 7e5:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 7e8:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 7eb:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 7ee:	89 0d b8 0c 00 00    	mov    %ecx,0xcb8
      return (void*)(p + 1);
 7f4:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 7f7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 7fa:	c9                   	leave  
 7fb:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 7fc:	8b 10                	mov    (%eax),%edx
 7fe:	89 11                	mov    %edx,(%ecx)
 800:	eb ec                	jmp    7ee <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 802:	89 c1                	mov    %eax,%ecx
 804:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 806:	8b 50 04             	mov    0x4(%eax),%edx
 809:	39 da                	cmp    %ebx,%edx
 80b:	73 d4                	jae    7e1 <malloc+0x46>
    if(p == freep)
 80d:	39 05 b8 0c 00 00    	cmp    %eax,0xcb8
 813:	75 ed                	jne    802 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 815:	89 d8                	mov    %ebx,%eax
 817:	e8 2f ff ff ff       	call   74b <morecore>
 81c:	85 c0                	test   %eax,%eax
 81e:	75 e2                	jne    802 <malloc+0x67>
 820:	eb d5                	jmp    7f7 <malloc+0x5c>
