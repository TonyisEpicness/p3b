
_test_10:     file format elf32-i386


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
   int arg1_int = *(int*)arg1;
   int arg2_int = *(int*)arg2;
   6:	8b 45 0c             	mov    0xc(%ebp),%eax
   9:	8b 10                	mov    (%eax),%edx
   assert(arg1_int == 35);
   b:	8b 45 08             	mov    0x8(%ebp),%eax
   e:	83 38 23             	cmpl   $0x23,(%eax)
  11:	75 60                	jne    73 <worker+0x73>
   assert(arg2_int == 42);
  13:	83 fa 2a             	cmp    $0x2a,%edx
  16:	0f 85 a0 00 00 00    	jne    bc <worker+0xbc>
   assert(global == 1);
  1c:	a1 c8 0c 00 00       	mov    0xcc8,%eax
  21:	83 f8 01             	cmp    $0x1,%eax
  24:	0f 84 db 00 00 00    	je     105 <worker+0x105>
  2a:	6a 2f                	push   $0x2f
  2c:	68 60 08 00 00       	push   $0x860
  31:	68 6a 08 00 00       	push   $0x86a
  36:	6a 01                	push   $0x1
  38:	e8 75 05 00 00       	call   5b2 <printf>
  3d:	83 c4 0c             	add    $0xc,%esp
  40:	68 b1 08 00 00       	push   $0x8b1
  45:	68 81 08 00 00       	push   $0x881
  4a:	6a 01                	push   $0x1
  4c:	e8 61 05 00 00       	call   5b2 <printf>
  51:	83 c4 08             	add    $0x8,%esp
  54:	68 95 08 00 00       	push   $0x895
  59:	6a 01                	push   $0x1
  5b:	e8 52 05 00 00       	call   5b2 <printf>
  60:	83 c4 04             	add    $0x4,%esp
  63:	ff 35 cc 0c 00 00    	push   0xccc
  69:	e8 1f 04 00 00       	call   48d <kill>
  6e:	e8 ea 03 00 00       	call   45d <exit>
   assert(arg1_int == 35);
  73:	6a 2d                	push   $0x2d
  75:	68 60 08 00 00       	push   $0x860
  7a:	68 6a 08 00 00       	push   $0x86a
  7f:	6a 01                	push   $0x1
  81:	e8 2c 05 00 00       	call   5b2 <printf>
  86:	83 c4 0c             	add    $0xc,%esp
  89:	68 72 08 00 00       	push   $0x872
  8e:	68 81 08 00 00       	push   $0x881
  93:	6a 01                	push   $0x1
  95:	e8 18 05 00 00       	call   5b2 <printf>
  9a:	83 c4 08             	add    $0x8,%esp
  9d:	68 95 08 00 00       	push   $0x895
  a2:	6a 01                	push   $0x1
  a4:	e8 09 05 00 00       	call   5b2 <printf>
  a9:	83 c4 04             	add    $0x4,%esp
  ac:	ff 35 cc 0c 00 00    	push   0xccc
  b2:	e8 d6 03 00 00       	call   48d <kill>
  b7:	e8 a1 03 00 00       	call   45d <exit>
   assert(arg2_int == 42);
  bc:	6a 2e                	push   $0x2e
  be:	68 60 08 00 00       	push   $0x860
  c3:	68 6a 08 00 00       	push   $0x86a
  c8:	6a 01                	push   $0x1
  ca:	e8 e3 04 00 00       	call   5b2 <printf>
  cf:	83 c4 0c             	add    $0xc,%esp
  d2:	68 a2 08 00 00       	push   $0x8a2
  d7:	68 81 08 00 00       	push   $0x881
  dc:	6a 01                	push   $0x1
  de:	e8 cf 04 00 00       	call   5b2 <printf>
  e3:	83 c4 08             	add    $0x8,%esp
  e6:	68 95 08 00 00       	push   $0x895
  eb:	6a 01                	push   $0x1
  ed:	e8 c0 04 00 00       	call   5b2 <printf>
  f2:	83 c4 04             	add    $0x4,%esp
  f5:	ff 35 cc 0c 00 00    	push   0xccc
  fb:	e8 8d 03 00 00       	call   48d <kill>
 100:	e8 58 03 00 00       	call   45d <exit>
   global++;
 105:	83 c0 01             	add    $0x1,%eax
 108:	a3 c8 0c 00 00       	mov    %eax,0xcc8
   exit();
 10d:	e8 4b 03 00 00       	call   45d <exit>

00000112 <main>:
{
 112:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 116:	83 e4 f0             	and    $0xfffffff0,%esp
 119:	ff 71 fc             	push   -0x4(%ecx)
 11c:	55                   	push   %ebp
 11d:	89 e5                	mov    %esp,%ebp
 11f:	53                   	push   %ebx
 120:	51                   	push   %ecx
 121:	83 ec 10             	sub    $0x10,%esp
   ppid = getpid();
 124:	e8 b4 03 00 00       	call   4dd <getpid>
 129:	a3 cc 0c 00 00       	mov    %eax,0xccc
   int arg1 = 35;
 12e:	c7 45 f4 23 00 00 00 	movl   $0x23,-0xc(%ebp)
   int arg2 = 42;
 135:	c7 45 f0 2a 00 00 00 	movl   $0x2a,-0x10(%ebp)
   int thread_pid = thread_create(worker, &arg1, &arg2);
 13c:	83 ec 04             	sub    $0x4,%esp
 13f:	8d 45 f0             	lea    -0x10(%ebp),%eax
 142:	50                   	push   %eax
 143:	8d 45 f4             	lea    -0xc(%ebp),%eax
 146:	50                   	push   %eax
 147:	68 00 00 00 00       	push   $0x0
 14c:	e8 23 01 00 00       	call   274 <thread_create>
   assert(thread_pid > 0);
 151:	83 c4 10             	add    $0x10,%esp
 154:	85 c0                	test   %eax,%eax
 156:	7e 65                	jle    1bd <main+0xab>
 158:	89 c3                	mov    %eax,%ebx
   int join_pid = thread_join();
 15a:	e8 1b 01 00 00       	call   27a <thread_join>
   assert(join_pid == thread_pid);
 15f:	39 c3                	cmp    %eax,%ebx
 161:	0f 85 9f 00 00 00    	jne    206 <main+0xf4>
   assert(global == 2);
 167:	83 3d c8 0c 00 00 02 	cmpl   $0x2,0xcc8
 16e:	0f 84 db 00 00 00    	je     24f <main+0x13d>
 174:	6a 23                	push   $0x23
 176:	68 60 08 00 00       	push   $0x860
 17b:	68 6a 08 00 00       	push   $0x86a
 180:	6a 01                	push   $0x1
 182:	e8 2b 04 00 00       	call   5b2 <printf>
 187:	83 c4 0c             	add    $0xc,%esp
 18a:	68 e3 08 00 00       	push   $0x8e3
 18f:	68 81 08 00 00       	push   $0x881
 194:	6a 01                	push   $0x1
 196:	e8 17 04 00 00       	call   5b2 <printf>
 19b:	83 c4 08             	add    $0x8,%esp
 19e:	68 95 08 00 00       	push   $0x895
 1a3:	6a 01                	push   $0x1
 1a5:	e8 08 04 00 00       	call   5b2 <printf>
 1aa:	83 c4 04             	add    $0x4,%esp
 1ad:	ff 35 cc 0c 00 00    	push   0xccc
 1b3:	e8 d5 02 00 00       	call   48d <kill>
 1b8:	e8 a0 02 00 00       	call   45d <exit>
   assert(thread_pid > 0);
 1bd:	6a 1f                	push   $0x1f
 1bf:	68 60 08 00 00       	push   $0x860
 1c4:	68 6a 08 00 00       	push   $0x86a
 1c9:	6a 01                	push   $0x1
 1cb:	e8 e2 03 00 00       	call   5b2 <printf>
 1d0:	83 c4 0c             	add    $0xc,%esp
 1d3:	68 bd 08 00 00       	push   $0x8bd
 1d8:	68 81 08 00 00       	push   $0x881
 1dd:	6a 01                	push   $0x1
 1df:	e8 ce 03 00 00       	call   5b2 <printf>
 1e4:	83 c4 08             	add    $0x8,%esp
 1e7:	68 95 08 00 00       	push   $0x895
 1ec:	6a 01                	push   $0x1
 1ee:	e8 bf 03 00 00       	call   5b2 <printf>
 1f3:	83 c4 04             	add    $0x4,%esp
 1f6:	ff 35 cc 0c 00 00    	push   0xccc
 1fc:	e8 8c 02 00 00       	call   48d <kill>
 201:	e8 57 02 00 00       	call   45d <exit>
   assert(join_pid == thread_pid);
 206:	6a 22                	push   $0x22
 208:	68 60 08 00 00       	push   $0x860
 20d:	68 6a 08 00 00       	push   $0x86a
 212:	6a 01                	push   $0x1
 214:	e8 99 03 00 00       	call   5b2 <printf>
 219:	83 c4 0c             	add    $0xc,%esp
 21c:	68 cc 08 00 00       	push   $0x8cc
 221:	68 81 08 00 00       	push   $0x881
 226:	6a 01                	push   $0x1
 228:	e8 85 03 00 00       	call   5b2 <printf>
 22d:	83 c4 08             	add    $0x8,%esp
 230:	68 95 08 00 00       	push   $0x895
 235:	6a 01                	push   $0x1
 237:	e8 76 03 00 00       	call   5b2 <printf>
 23c:	83 c4 04             	add    $0x4,%esp
 23f:	ff 35 cc 0c 00 00    	push   0xccc
 245:	e8 43 02 00 00       	call   48d <kill>
 24a:	e8 0e 02 00 00       	call   45d <exit>
   printf(1, "TEST PASSED\n");
 24f:	83 ec 08             	sub    $0x8,%esp
 252:	68 ef 08 00 00       	push   $0x8ef
 257:	6a 01                	push   $0x1
 259:	e8 54 03 00 00       	call   5b2 <printf>
   exit();
 25e:	e8 fa 01 00 00       	call   45d <exit>

00000263 <test_and_set>:
#include "fcntl.h"
#include "user.h"
#include "x86.h"
#include "mmu.h"

int test_and_set(int *old_ptr, int new_ptr) {
 263:	55                   	push   %ebp
 264:	89 e5                	mov    %esp,%ebp
 266:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *old_ptr;
 269:	8b 10                	mov    (%eax),%edx
  *old_ptr = new_ptr;
 26b:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 26e:	89 08                	mov    %ecx,(%eax)
  return old;
}
 270:	89 d0                	mov    %edx,%eax
 272:	5d                   	pop    %ebp
 273:	c3                   	ret    

00000274 <thread_create>:

  // I can't remember if there was something else to do here but I'm sure I'll find out


  return new_pid;
}
 274:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 279:	c3                   	ret    

0000027a <thread_join>:

int thread_join() {
  return 0;
}
 27a:	b8 00 00 00 00       	mov    $0x0,%eax
 27f:	c3                   	ret    

00000280 <lock_acquire>:

void lock_acquire(lock_t *lock){
 280:	55                   	push   %ebp
 281:	89 e5                	mov    %esp,%ebp
 283:	53                   	push   %ebx
 284:	83 ec 04             	sub    $0x4,%esp
 287:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 28a:	83 ec 08             	sub    $0x8,%esp
 28d:	6a 01                	push   $0x1
 28f:	53                   	push   %ebx
 290:	e8 ce ff ff ff       	call   263 <test_and_set>
 295:	83 c4 10             	add    $0x10,%esp
 298:	83 f8 01             	cmp    $0x1,%eax
 29b:	74 ed                	je     28a <lock_acquire+0xa>
    ;
}
 29d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2a0:	c9                   	leave  
 2a1:	c3                   	ret    

000002a2 <lock_release>:

void lock_release(lock_t *lock) {
 2a2:	55                   	push   %ebp
 2a3:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 2a5:	8b 45 08             	mov    0x8(%ebp),%eax
 2a8:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 2ae:	5d                   	pop    %ebp
 2af:	c3                   	ret    

000002b0 <lock_init>:

void lock_init(lock_t *lock) {
 2b0:	55                   	push   %ebp
 2b1:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 2b3:	8b 45 08             	mov    0x8(%ebp),%eax
 2b6:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 2bc:	5d                   	pop    %ebp
 2bd:	c3                   	ret    

000002be <strcpy>:

char*
strcpy(char *s, const char *t)
{
 2be:	55                   	push   %ebp
 2bf:	89 e5                	mov    %esp,%ebp
 2c1:	56                   	push   %esi
 2c2:	53                   	push   %ebx
 2c3:	8b 75 08             	mov    0x8(%ebp),%esi
 2c6:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 2c9:	89 f0                	mov    %esi,%eax
 2cb:	89 d1                	mov    %edx,%ecx
 2cd:	83 c2 01             	add    $0x1,%edx
 2d0:	89 c3                	mov    %eax,%ebx
 2d2:	83 c0 01             	add    $0x1,%eax
 2d5:	0f b6 09             	movzbl (%ecx),%ecx
 2d8:	88 0b                	mov    %cl,(%ebx)
 2da:	84 c9                	test   %cl,%cl
 2dc:	75 ed                	jne    2cb <strcpy+0xd>
    ;
  return os;
}
 2de:	89 f0                	mov    %esi,%eax
 2e0:	5b                   	pop    %ebx
 2e1:	5e                   	pop    %esi
 2e2:	5d                   	pop    %ebp
 2e3:	c3                   	ret    

000002e4 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 2e4:	55                   	push   %ebp
 2e5:	89 e5                	mov    %esp,%ebp
 2e7:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2ea:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 2ed:	eb 06                	jmp    2f5 <strcmp+0x11>
    p++, q++;
 2ef:	83 c1 01             	add    $0x1,%ecx
 2f2:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 2f5:	0f b6 01             	movzbl (%ecx),%eax
 2f8:	84 c0                	test   %al,%al
 2fa:	74 04                	je     300 <strcmp+0x1c>
 2fc:	3a 02                	cmp    (%edx),%al
 2fe:	74 ef                	je     2ef <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 300:	0f b6 c0             	movzbl %al,%eax
 303:	0f b6 12             	movzbl (%edx),%edx
 306:	29 d0                	sub    %edx,%eax
}
 308:	5d                   	pop    %ebp
 309:	c3                   	ret    

0000030a <strlen>:

uint
strlen(const char *s)
{
 30a:	55                   	push   %ebp
 30b:	89 e5                	mov    %esp,%ebp
 30d:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 310:	b8 00 00 00 00       	mov    $0x0,%eax
 315:	eb 03                	jmp    31a <strlen+0x10>
 317:	83 c0 01             	add    $0x1,%eax
 31a:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 31e:	75 f7                	jne    317 <strlen+0xd>
    ;
  return n;
}
 320:	5d                   	pop    %ebp
 321:	c3                   	ret    

00000322 <memset>:

void*
memset(void *dst, int c, uint n)
{
 322:	55                   	push   %ebp
 323:	89 e5                	mov    %esp,%ebp
 325:	57                   	push   %edi
 326:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 329:	89 d7                	mov    %edx,%edi
 32b:	8b 4d 10             	mov    0x10(%ebp),%ecx
 32e:	8b 45 0c             	mov    0xc(%ebp),%eax
 331:	fc                   	cld    
 332:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 334:	89 d0                	mov    %edx,%eax
 336:	8b 7d fc             	mov    -0x4(%ebp),%edi
 339:	c9                   	leave  
 33a:	c3                   	ret    

0000033b <strchr>:

char*
strchr(const char *s, char c)
{
 33b:	55                   	push   %ebp
 33c:	89 e5                	mov    %esp,%ebp
 33e:	8b 45 08             	mov    0x8(%ebp),%eax
 341:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 345:	eb 03                	jmp    34a <strchr+0xf>
 347:	83 c0 01             	add    $0x1,%eax
 34a:	0f b6 10             	movzbl (%eax),%edx
 34d:	84 d2                	test   %dl,%dl
 34f:	74 06                	je     357 <strchr+0x1c>
    if(*s == c)
 351:	38 ca                	cmp    %cl,%dl
 353:	75 f2                	jne    347 <strchr+0xc>
 355:	eb 05                	jmp    35c <strchr+0x21>
      return (char*)s;
  return 0;
 357:	b8 00 00 00 00       	mov    $0x0,%eax
}
 35c:	5d                   	pop    %ebp
 35d:	c3                   	ret    

0000035e <gets>:

char*
gets(char *buf, int max)
{
 35e:	55                   	push   %ebp
 35f:	89 e5                	mov    %esp,%ebp
 361:	57                   	push   %edi
 362:	56                   	push   %esi
 363:	53                   	push   %ebx
 364:	83 ec 1c             	sub    $0x1c,%esp
 367:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 36a:	bb 00 00 00 00       	mov    $0x0,%ebx
 36f:	89 de                	mov    %ebx,%esi
 371:	83 c3 01             	add    $0x1,%ebx
 374:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 377:	7d 2e                	jge    3a7 <gets+0x49>
    cc = read(0, &c, 1);
 379:	83 ec 04             	sub    $0x4,%esp
 37c:	6a 01                	push   $0x1
 37e:	8d 45 e7             	lea    -0x19(%ebp),%eax
 381:	50                   	push   %eax
 382:	6a 00                	push   $0x0
 384:	e8 ec 00 00 00       	call   475 <read>
    if(cc < 1)
 389:	83 c4 10             	add    $0x10,%esp
 38c:	85 c0                	test   %eax,%eax
 38e:	7e 17                	jle    3a7 <gets+0x49>
      break;
    buf[i++] = c;
 390:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 394:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 397:	3c 0a                	cmp    $0xa,%al
 399:	0f 94 c2             	sete   %dl
 39c:	3c 0d                	cmp    $0xd,%al
 39e:	0f 94 c0             	sete   %al
 3a1:	08 c2                	or     %al,%dl
 3a3:	74 ca                	je     36f <gets+0x11>
    buf[i++] = c;
 3a5:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 3a7:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 3ab:	89 f8                	mov    %edi,%eax
 3ad:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3b0:	5b                   	pop    %ebx
 3b1:	5e                   	pop    %esi
 3b2:	5f                   	pop    %edi
 3b3:	5d                   	pop    %ebp
 3b4:	c3                   	ret    

000003b5 <stat>:

int
stat(const char *n, struct stat *st)
{
 3b5:	55                   	push   %ebp
 3b6:	89 e5                	mov    %esp,%ebp
 3b8:	56                   	push   %esi
 3b9:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 3ba:	83 ec 08             	sub    $0x8,%esp
 3bd:	6a 00                	push   $0x0
 3bf:	ff 75 08             	push   0x8(%ebp)
 3c2:	e8 d6 00 00 00       	call   49d <open>
  if(fd < 0)
 3c7:	83 c4 10             	add    $0x10,%esp
 3ca:	85 c0                	test   %eax,%eax
 3cc:	78 24                	js     3f2 <stat+0x3d>
 3ce:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 3d0:	83 ec 08             	sub    $0x8,%esp
 3d3:	ff 75 0c             	push   0xc(%ebp)
 3d6:	50                   	push   %eax
 3d7:	e8 d9 00 00 00       	call   4b5 <fstat>
 3dc:	89 c6                	mov    %eax,%esi
  close(fd);
 3de:	89 1c 24             	mov    %ebx,(%esp)
 3e1:	e8 9f 00 00 00       	call   485 <close>
  return r;
 3e6:	83 c4 10             	add    $0x10,%esp
}
 3e9:	89 f0                	mov    %esi,%eax
 3eb:	8d 65 f8             	lea    -0x8(%ebp),%esp
 3ee:	5b                   	pop    %ebx
 3ef:	5e                   	pop    %esi
 3f0:	5d                   	pop    %ebp
 3f1:	c3                   	ret    
    return -1;
 3f2:	be ff ff ff ff       	mov    $0xffffffff,%esi
 3f7:	eb f0                	jmp    3e9 <stat+0x34>

000003f9 <atoi>:

int
atoi(const char *s)
{
 3f9:	55                   	push   %ebp
 3fa:	89 e5                	mov    %esp,%ebp
 3fc:	53                   	push   %ebx
 3fd:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 400:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 405:	eb 10                	jmp    417 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 407:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 40a:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 40d:	83 c1 01             	add    $0x1,%ecx
 410:	0f be c0             	movsbl %al,%eax
 413:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 417:	0f b6 01             	movzbl (%ecx),%eax
 41a:	8d 58 d0             	lea    -0x30(%eax),%ebx
 41d:	80 fb 09             	cmp    $0x9,%bl
 420:	76 e5                	jbe    407 <atoi+0xe>
  return n;
}
 422:	89 d0                	mov    %edx,%eax
 424:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 427:	c9                   	leave  
 428:	c3                   	ret    

00000429 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 429:	55                   	push   %ebp
 42a:	89 e5                	mov    %esp,%ebp
 42c:	56                   	push   %esi
 42d:	53                   	push   %ebx
 42e:	8b 75 08             	mov    0x8(%ebp),%esi
 431:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 434:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 437:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 439:	eb 0d                	jmp    448 <memmove+0x1f>
    *dst++ = *src++;
 43b:	0f b6 01             	movzbl (%ecx),%eax
 43e:	88 02                	mov    %al,(%edx)
 440:	8d 49 01             	lea    0x1(%ecx),%ecx
 443:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 446:	89 d8                	mov    %ebx,%eax
 448:	8d 58 ff             	lea    -0x1(%eax),%ebx
 44b:	85 c0                	test   %eax,%eax
 44d:	7f ec                	jg     43b <memmove+0x12>
  return vdst;
}
 44f:	89 f0                	mov    %esi,%eax
 451:	5b                   	pop    %ebx
 452:	5e                   	pop    %esi
 453:	5d                   	pop    %ebp
 454:	c3                   	ret    

00000455 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 455:	b8 01 00 00 00       	mov    $0x1,%eax
 45a:	cd 40                	int    $0x40
 45c:	c3                   	ret    

0000045d <exit>:
SYSCALL(exit)
 45d:	b8 02 00 00 00       	mov    $0x2,%eax
 462:	cd 40                	int    $0x40
 464:	c3                   	ret    

00000465 <wait>:
SYSCALL(wait)
 465:	b8 03 00 00 00       	mov    $0x3,%eax
 46a:	cd 40                	int    $0x40
 46c:	c3                   	ret    

0000046d <pipe>:
SYSCALL(pipe)
 46d:	b8 04 00 00 00       	mov    $0x4,%eax
 472:	cd 40                	int    $0x40
 474:	c3                   	ret    

00000475 <read>:
SYSCALL(read)
 475:	b8 05 00 00 00       	mov    $0x5,%eax
 47a:	cd 40                	int    $0x40
 47c:	c3                   	ret    

0000047d <write>:
SYSCALL(write)
 47d:	b8 10 00 00 00       	mov    $0x10,%eax
 482:	cd 40                	int    $0x40
 484:	c3                   	ret    

00000485 <close>:
SYSCALL(close)
 485:	b8 15 00 00 00       	mov    $0x15,%eax
 48a:	cd 40                	int    $0x40
 48c:	c3                   	ret    

0000048d <kill>:
SYSCALL(kill)
 48d:	b8 06 00 00 00       	mov    $0x6,%eax
 492:	cd 40                	int    $0x40
 494:	c3                   	ret    

00000495 <exec>:
SYSCALL(exec)
 495:	b8 07 00 00 00       	mov    $0x7,%eax
 49a:	cd 40                	int    $0x40
 49c:	c3                   	ret    

0000049d <open>:
SYSCALL(open)
 49d:	b8 0f 00 00 00       	mov    $0xf,%eax
 4a2:	cd 40                	int    $0x40
 4a4:	c3                   	ret    

000004a5 <mknod>:
SYSCALL(mknod)
 4a5:	b8 11 00 00 00       	mov    $0x11,%eax
 4aa:	cd 40                	int    $0x40
 4ac:	c3                   	ret    

000004ad <unlink>:
SYSCALL(unlink)
 4ad:	b8 12 00 00 00       	mov    $0x12,%eax
 4b2:	cd 40                	int    $0x40
 4b4:	c3                   	ret    

000004b5 <fstat>:
SYSCALL(fstat)
 4b5:	b8 08 00 00 00       	mov    $0x8,%eax
 4ba:	cd 40                	int    $0x40
 4bc:	c3                   	ret    

000004bd <link>:
SYSCALL(link)
 4bd:	b8 13 00 00 00       	mov    $0x13,%eax
 4c2:	cd 40                	int    $0x40
 4c4:	c3                   	ret    

000004c5 <mkdir>:
SYSCALL(mkdir)
 4c5:	b8 14 00 00 00       	mov    $0x14,%eax
 4ca:	cd 40                	int    $0x40
 4cc:	c3                   	ret    

000004cd <chdir>:
SYSCALL(chdir)
 4cd:	b8 09 00 00 00       	mov    $0x9,%eax
 4d2:	cd 40                	int    $0x40
 4d4:	c3                   	ret    

000004d5 <dup>:
SYSCALL(dup)
 4d5:	b8 0a 00 00 00       	mov    $0xa,%eax
 4da:	cd 40                	int    $0x40
 4dc:	c3                   	ret    

000004dd <getpid>:
SYSCALL(getpid)
 4dd:	b8 0b 00 00 00       	mov    $0xb,%eax
 4e2:	cd 40                	int    $0x40
 4e4:	c3                   	ret    

000004e5 <sbrk>:
SYSCALL(sbrk)
 4e5:	b8 0c 00 00 00       	mov    $0xc,%eax
 4ea:	cd 40                	int    $0x40
 4ec:	c3                   	ret    

000004ed <sleep>:
SYSCALL(sleep)
 4ed:	b8 0d 00 00 00       	mov    $0xd,%eax
 4f2:	cd 40                	int    $0x40
 4f4:	c3                   	ret    

000004f5 <uptime>:
SYSCALL(uptime)
 4f5:	b8 0e 00 00 00       	mov    $0xe,%eax
 4fa:	cd 40                	int    $0x40
 4fc:	c3                   	ret    

000004fd <clone>:
SYSCALL(clone)
 4fd:	b8 16 00 00 00       	mov    $0x16,%eax
 502:	cd 40                	int    $0x40
 504:	c3                   	ret    

00000505 <join>:
 505:	b8 17 00 00 00       	mov    $0x17,%eax
 50a:	cd 40                	int    $0x40
 50c:	c3                   	ret    

0000050d <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 50d:	55                   	push   %ebp
 50e:	89 e5                	mov    %esp,%ebp
 510:	83 ec 1c             	sub    $0x1c,%esp
 513:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 516:	6a 01                	push   $0x1
 518:	8d 55 f4             	lea    -0xc(%ebp),%edx
 51b:	52                   	push   %edx
 51c:	50                   	push   %eax
 51d:	e8 5b ff ff ff       	call   47d <write>
}
 522:	83 c4 10             	add    $0x10,%esp
 525:	c9                   	leave  
 526:	c3                   	ret    

00000527 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 527:	55                   	push   %ebp
 528:	89 e5                	mov    %esp,%ebp
 52a:	57                   	push   %edi
 52b:	56                   	push   %esi
 52c:	53                   	push   %ebx
 52d:	83 ec 2c             	sub    $0x2c,%esp
 530:	89 45 d0             	mov    %eax,-0x30(%ebp)
 533:	89 d0                	mov    %edx,%eax
 535:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 537:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 53b:	0f 95 c1             	setne  %cl
 53e:	c1 ea 1f             	shr    $0x1f,%edx
 541:	84 d1                	test   %dl,%cl
 543:	74 44                	je     589 <printint+0x62>
    neg = 1;
    x = -xx;
 545:	f7 d8                	neg    %eax
 547:	89 c1                	mov    %eax,%ecx
    neg = 1;
 549:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 550:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 555:	89 c8                	mov    %ecx,%eax
 557:	ba 00 00 00 00       	mov    $0x0,%edx
 55c:	f7 f6                	div    %esi
 55e:	89 df                	mov    %ebx,%edi
 560:	83 c3 01             	add    $0x1,%ebx
 563:	0f b6 92 5c 09 00 00 	movzbl 0x95c(%edx),%edx
 56a:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 56e:	89 ca                	mov    %ecx,%edx
 570:	89 c1                	mov    %eax,%ecx
 572:	39 d6                	cmp    %edx,%esi
 574:	76 df                	jbe    555 <printint+0x2e>
  if(neg)
 576:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 57a:	74 31                	je     5ad <printint+0x86>
    buf[i++] = '-';
 57c:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 581:	8d 5f 02             	lea    0x2(%edi),%ebx
 584:	8b 75 d0             	mov    -0x30(%ebp),%esi
 587:	eb 17                	jmp    5a0 <printint+0x79>
    x = xx;
 589:	89 c1                	mov    %eax,%ecx
  neg = 0;
 58b:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 592:	eb bc                	jmp    550 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 594:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 599:	89 f0                	mov    %esi,%eax
 59b:	e8 6d ff ff ff       	call   50d <putc>
  while(--i >= 0)
 5a0:	83 eb 01             	sub    $0x1,%ebx
 5a3:	79 ef                	jns    594 <printint+0x6d>
}
 5a5:	83 c4 2c             	add    $0x2c,%esp
 5a8:	5b                   	pop    %ebx
 5a9:	5e                   	pop    %esi
 5aa:	5f                   	pop    %edi
 5ab:	5d                   	pop    %ebp
 5ac:	c3                   	ret    
 5ad:	8b 75 d0             	mov    -0x30(%ebp),%esi
 5b0:	eb ee                	jmp    5a0 <printint+0x79>

000005b2 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5b2:	55                   	push   %ebp
 5b3:	89 e5                	mov    %esp,%ebp
 5b5:	57                   	push   %edi
 5b6:	56                   	push   %esi
 5b7:	53                   	push   %ebx
 5b8:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 5bb:	8d 45 10             	lea    0x10(%ebp),%eax
 5be:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 5c1:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 5c6:	bb 00 00 00 00       	mov    $0x0,%ebx
 5cb:	eb 14                	jmp    5e1 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 5cd:	89 fa                	mov    %edi,%edx
 5cf:	8b 45 08             	mov    0x8(%ebp),%eax
 5d2:	e8 36 ff ff ff       	call   50d <putc>
 5d7:	eb 05                	jmp    5de <printf+0x2c>
      }
    } else if(state == '%'){
 5d9:	83 fe 25             	cmp    $0x25,%esi
 5dc:	74 25                	je     603 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 5de:	83 c3 01             	add    $0x1,%ebx
 5e1:	8b 45 0c             	mov    0xc(%ebp),%eax
 5e4:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 5e8:	84 c0                	test   %al,%al
 5ea:	0f 84 20 01 00 00    	je     710 <printf+0x15e>
    c = fmt[i] & 0xff;
 5f0:	0f be f8             	movsbl %al,%edi
 5f3:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 5f6:	85 f6                	test   %esi,%esi
 5f8:	75 df                	jne    5d9 <printf+0x27>
      if(c == '%'){
 5fa:	83 f8 25             	cmp    $0x25,%eax
 5fd:	75 ce                	jne    5cd <printf+0x1b>
        state = '%';
 5ff:	89 c6                	mov    %eax,%esi
 601:	eb db                	jmp    5de <printf+0x2c>
      if(c == 'd'){
 603:	83 f8 25             	cmp    $0x25,%eax
 606:	0f 84 cf 00 00 00    	je     6db <printf+0x129>
 60c:	0f 8c dd 00 00 00    	jl     6ef <printf+0x13d>
 612:	83 f8 78             	cmp    $0x78,%eax
 615:	0f 8f d4 00 00 00    	jg     6ef <printf+0x13d>
 61b:	83 f8 63             	cmp    $0x63,%eax
 61e:	0f 8c cb 00 00 00    	jl     6ef <printf+0x13d>
 624:	83 e8 63             	sub    $0x63,%eax
 627:	83 f8 15             	cmp    $0x15,%eax
 62a:	0f 87 bf 00 00 00    	ja     6ef <printf+0x13d>
 630:	ff 24 85 04 09 00 00 	jmp    *0x904(,%eax,4)
        printint(fd, *ap, 10, 1);
 637:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 63a:	8b 17                	mov    (%edi),%edx
 63c:	83 ec 0c             	sub    $0xc,%esp
 63f:	6a 01                	push   $0x1
 641:	b9 0a 00 00 00       	mov    $0xa,%ecx
 646:	8b 45 08             	mov    0x8(%ebp),%eax
 649:	e8 d9 fe ff ff       	call   527 <printint>
        ap++;
 64e:	83 c7 04             	add    $0x4,%edi
 651:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 654:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 657:	be 00 00 00 00       	mov    $0x0,%esi
 65c:	eb 80                	jmp    5de <printf+0x2c>
        printint(fd, *ap, 16, 0);
 65e:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 661:	8b 17                	mov    (%edi),%edx
 663:	83 ec 0c             	sub    $0xc,%esp
 666:	6a 00                	push   $0x0
 668:	b9 10 00 00 00       	mov    $0x10,%ecx
 66d:	8b 45 08             	mov    0x8(%ebp),%eax
 670:	e8 b2 fe ff ff       	call   527 <printint>
        ap++;
 675:	83 c7 04             	add    $0x4,%edi
 678:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 67b:	83 c4 10             	add    $0x10,%esp
      state = 0;
 67e:	be 00 00 00 00       	mov    $0x0,%esi
 683:	e9 56 ff ff ff       	jmp    5de <printf+0x2c>
        s = (char*)*ap;
 688:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 68b:	8b 30                	mov    (%eax),%esi
        ap++;
 68d:	83 c0 04             	add    $0x4,%eax
 690:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 693:	85 f6                	test   %esi,%esi
 695:	75 15                	jne    6ac <printf+0xfa>
          s = "(null)";
 697:	be fc 08 00 00       	mov    $0x8fc,%esi
 69c:	eb 0e                	jmp    6ac <printf+0xfa>
          putc(fd, *s);
 69e:	0f be d2             	movsbl %dl,%edx
 6a1:	8b 45 08             	mov    0x8(%ebp),%eax
 6a4:	e8 64 fe ff ff       	call   50d <putc>
          s++;
 6a9:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 6ac:	0f b6 16             	movzbl (%esi),%edx
 6af:	84 d2                	test   %dl,%dl
 6b1:	75 eb                	jne    69e <printf+0xec>
      state = 0;
 6b3:	be 00 00 00 00       	mov    $0x0,%esi
 6b8:	e9 21 ff ff ff       	jmp    5de <printf+0x2c>
        putc(fd, *ap);
 6bd:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6c0:	0f be 17             	movsbl (%edi),%edx
 6c3:	8b 45 08             	mov    0x8(%ebp),%eax
 6c6:	e8 42 fe ff ff       	call   50d <putc>
        ap++;
 6cb:	83 c7 04             	add    $0x4,%edi
 6ce:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 6d1:	be 00 00 00 00       	mov    $0x0,%esi
 6d6:	e9 03 ff ff ff       	jmp    5de <printf+0x2c>
        putc(fd, c);
 6db:	89 fa                	mov    %edi,%edx
 6dd:	8b 45 08             	mov    0x8(%ebp),%eax
 6e0:	e8 28 fe ff ff       	call   50d <putc>
      state = 0;
 6e5:	be 00 00 00 00       	mov    $0x0,%esi
 6ea:	e9 ef fe ff ff       	jmp    5de <printf+0x2c>
        putc(fd, '%');
 6ef:	ba 25 00 00 00       	mov    $0x25,%edx
 6f4:	8b 45 08             	mov    0x8(%ebp),%eax
 6f7:	e8 11 fe ff ff       	call   50d <putc>
        putc(fd, c);
 6fc:	89 fa                	mov    %edi,%edx
 6fe:	8b 45 08             	mov    0x8(%ebp),%eax
 701:	e8 07 fe ff ff       	call   50d <putc>
      state = 0;
 706:	be 00 00 00 00       	mov    $0x0,%esi
 70b:	e9 ce fe ff ff       	jmp    5de <printf+0x2c>
    }
  }
}
 710:	8d 65 f4             	lea    -0xc(%ebp),%esp
 713:	5b                   	pop    %ebx
 714:	5e                   	pop    %esi
 715:	5f                   	pop    %edi
 716:	5d                   	pop    %ebp
 717:	c3                   	ret    

00000718 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 718:	55                   	push   %ebp
 719:	89 e5                	mov    %esp,%ebp
 71b:	57                   	push   %edi
 71c:	56                   	push   %esi
 71d:	53                   	push   %ebx
 71e:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 721:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 724:	a1 d0 0c 00 00       	mov    0xcd0,%eax
 729:	eb 02                	jmp    72d <free+0x15>
 72b:	89 d0                	mov    %edx,%eax
 72d:	39 c8                	cmp    %ecx,%eax
 72f:	73 04                	jae    735 <free+0x1d>
 731:	39 08                	cmp    %ecx,(%eax)
 733:	77 12                	ja     747 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 735:	8b 10                	mov    (%eax),%edx
 737:	39 c2                	cmp    %eax,%edx
 739:	77 f0                	ja     72b <free+0x13>
 73b:	39 c8                	cmp    %ecx,%eax
 73d:	72 08                	jb     747 <free+0x2f>
 73f:	39 ca                	cmp    %ecx,%edx
 741:	77 04                	ja     747 <free+0x2f>
 743:	89 d0                	mov    %edx,%eax
 745:	eb e6                	jmp    72d <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 747:	8b 73 fc             	mov    -0x4(%ebx),%esi
 74a:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 74d:	8b 10                	mov    (%eax),%edx
 74f:	39 d7                	cmp    %edx,%edi
 751:	74 19                	je     76c <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 753:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 756:	8b 50 04             	mov    0x4(%eax),%edx
 759:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 75c:	39 ce                	cmp    %ecx,%esi
 75e:	74 1b                	je     77b <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 760:	89 08                	mov    %ecx,(%eax)
  freep = p;
 762:	a3 d0 0c 00 00       	mov    %eax,0xcd0
}
 767:	5b                   	pop    %ebx
 768:	5e                   	pop    %esi
 769:	5f                   	pop    %edi
 76a:	5d                   	pop    %ebp
 76b:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 76c:	03 72 04             	add    0x4(%edx),%esi
 76f:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 772:	8b 10                	mov    (%eax),%edx
 774:	8b 12                	mov    (%edx),%edx
 776:	89 53 f8             	mov    %edx,-0x8(%ebx)
 779:	eb db                	jmp    756 <free+0x3e>
    p->s.size += bp->s.size;
 77b:	03 53 fc             	add    -0x4(%ebx),%edx
 77e:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 781:	8b 53 f8             	mov    -0x8(%ebx),%edx
 784:	89 10                	mov    %edx,(%eax)
 786:	eb da                	jmp    762 <free+0x4a>

00000788 <morecore>:

static Header*
morecore(uint nu)
{
 788:	55                   	push   %ebp
 789:	89 e5                	mov    %esp,%ebp
 78b:	53                   	push   %ebx
 78c:	83 ec 04             	sub    $0x4,%esp
 78f:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 791:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 796:	77 05                	ja     79d <morecore+0x15>
    nu = 4096;
 798:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 79d:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 7a4:	83 ec 0c             	sub    $0xc,%esp
 7a7:	50                   	push   %eax
 7a8:	e8 38 fd ff ff       	call   4e5 <sbrk>
  if(p == (char*)-1)
 7ad:	83 c4 10             	add    $0x10,%esp
 7b0:	83 f8 ff             	cmp    $0xffffffff,%eax
 7b3:	74 1c                	je     7d1 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 7b5:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 7b8:	83 c0 08             	add    $0x8,%eax
 7bb:	83 ec 0c             	sub    $0xc,%esp
 7be:	50                   	push   %eax
 7bf:	e8 54 ff ff ff       	call   718 <free>
  return freep;
 7c4:	a1 d0 0c 00 00       	mov    0xcd0,%eax
 7c9:	83 c4 10             	add    $0x10,%esp
}
 7cc:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 7cf:	c9                   	leave  
 7d0:	c3                   	ret    
    return 0;
 7d1:	b8 00 00 00 00       	mov    $0x0,%eax
 7d6:	eb f4                	jmp    7cc <morecore+0x44>

000007d8 <malloc>:

void*
malloc(uint nbytes)
{
 7d8:	55                   	push   %ebp
 7d9:	89 e5                	mov    %esp,%ebp
 7db:	53                   	push   %ebx
 7dc:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7df:	8b 45 08             	mov    0x8(%ebp),%eax
 7e2:	8d 58 07             	lea    0x7(%eax),%ebx
 7e5:	c1 eb 03             	shr    $0x3,%ebx
 7e8:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 7eb:	8b 0d d0 0c 00 00    	mov    0xcd0,%ecx
 7f1:	85 c9                	test   %ecx,%ecx
 7f3:	74 04                	je     7f9 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7f5:	8b 01                	mov    (%ecx),%eax
 7f7:	eb 4a                	jmp    843 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 7f9:	c7 05 d0 0c 00 00 d4 	movl   $0xcd4,0xcd0
 800:	0c 00 00 
 803:	c7 05 d4 0c 00 00 d4 	movl   $0xcd4,0xcd4
 80a:	0c 00 00 
    base.s.size = 0;
 80d:	c7 05 d8 0c 00 00 00 	movl   $0x0,0xcd8
 814:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 817:	b9 d4 0c 00 00       	mov    $0xcd4,%ecx
 81c:	eb d7                	jmp    7f5 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 81e:	74 19                	je     839 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 820:	29 da                	sub    %ebx,%edx
 822:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 825:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 828:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 82b:	89 0d d0 0c 00 00    	mov    %ecx,0xcd0
      return (void*)(p + 1);
 831:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 834:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 837:	c9                   	leave  
 838:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 839:	8b 10                	mov    (%eax),%edx
 83b:	89 11                	mov    %edx,(%ecx)
 83d:	eb ec                	jmp    82b <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 83f:	89 c1                	mov    %eax,%ecx
 841:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 843:	8b 50 04             	mov    0x4(%eax),%edx
 846:	39 da                	cmp    %ebx,%edx
 848:	73 d4                	jae    81e <malloc+0x46>
    if(p == freep)
 84a:	39 05 d0 0c 00 00    	cmp    %eax,0xcd0
 850:	75 ed                	jne    83f <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 852:	89 d8                	mov    %ebx,%eax
 854:	e8 2f ff ff ff       	call   788 <morecore>
 859:	85 c0                	test   %eax,%eax
 85b:	75 e2                	jne    83f <malloc+0x67>
 85d:	eb d5                	jmp    834 <malloc+0x5c>
