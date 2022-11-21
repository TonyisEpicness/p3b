
_test_5:     file format elf32-i386


Disassembly of section .text:

00000000 <worker>:
   free(p);
   exit();
}

void
worker(void *arg1, void *arg2) {
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 08             	sub    $0x8,%esp
   int tmp1 = *(int*)arg1;
   int tmp2 = *(int*)arg2;
   6:	8b 45 0c             	mov    0xc(%ebp),%eax
   9:	8b 10                	mov    (%eax),%edx
   assert(tmp1 == 42);
   b:	8b 45 08             	mov    0x8(%ebp),%eax
   e:	83 38 2a             	cmpl   $0x2a,(%eax)
  11:	75 60                	jne    73 <worker+0x73>
   assert(tmp2 == 24);
  13:	83 fa 18             	cmp    $0x18,%edx
  16:	0f 85 a0 00 00 00    	jne    bc <worker+0xbc>
   assert(global == 1);
  1c:	a1 b8 0d 00 00       	mov    0xdb8,%eax
  21:	83 f8 01             	cmp    $0x1,%eax
  24:	0f 84 db 00 00 00    	je     105 <worker+0x105>
  2a:	6a 38                	push   $0x38
  2c:	68 34 09 00 00       	push   $0x934
  31:	68 3d 09 00 00       	push   $0x93d
  36:	6a 01                	push   $0x1
  38:	e8 48 06 00 00       	call   685 <printf>
  3d:	83 c4 0c             	add    $0xc,%esp
  40:	68 7c 09 00 00       	push   $0x97c
  45:	68 50 09 00 00       	push   $0x950
  4a:	6a 01                	push   $0x1
  4c:	e8 34 06 00 00       	call   685 <printf>
  51:	83 c4 08             	add    $0x8,%esp
  54:	68 64 09 00 00       	push   $0x964
  59:	6a 01                	push   $0x1
  5b:	e8 25 06 00 00       	call   685 <printf>
  60:	83 c4 04             	add    $0x4,%esp
  63:	ff 35 bc 0d 00 00    	push   0xdbc
  69:	e8 f2 04 00 00       	call   560 <kill>
  6e:	e8 bd 04 00 00       	call   530 <exit>
   assert(tmp1 == 42);
  73:	6a 36                	push   $0x36
  75:	68 34 09 00 00       	push   $0x934
  7a:	68 3d 09 00 00       	push   $0x93d
  7f:	6a 01                	push   $0x1
  81:	e8 ff 05 00 00       	call   685 <printf>
  86:	83 c4 0c             	add    $0xc,%esp
  89:	68 45 09 00 00       	push   $0x945
  8e:	68 50 09 00 00       	push   $0x950
  93:	6a 01                	push   $0x1
  95:	e8 eb 05 00 00       	call   685 <printf>
  9a:	83 c4 08             	add    $0x8,%esp
  9d:	68 64 09 00 00       	push   $0x964
  a2:	6a 01                	push   $0x1
  a4:	e8 dc 05 00 00       	call   685 <printf>
  a9:	83 c4 04             	add    $0x4,%esp
  ac:	ff 35 bc 0d 00 00    	push   0xdbc
  b2:	e8 a9 04 00 00       	call   560 <kill>
  b7:	e8 74 04 00 00       	call   530 <exit>
   assert(tmp2 == 24);
  bc:	6a 37                	push   $0x37
  be:	68 34 09 00 00       	push   $0x934
  c3:	68 3d 09 00 00       	push   $0x93d
  c8:	6a 01                	push   $0x1
  ca:	e8 b6 05 00 00       	call   685 <printf>
  cf:	83 c4 0c             	add    $0xc,%esp
  d2:	68 71 09 00 00       	push   $0x971
  d7:	68 50 09 00 00       	push   $0x950
  dc:	6a 01                	push   $0x1
  de:	e8 a2 05 00 00       	call   685 <printf>
  e3:	83 c4 08             	add    $0x8,%esp
  e6:	68 64 09 00 00       	push   $0x964
  eb:	6a 01                	push   $0x1
  ed:	e8 93 05 00 00       	call   685 <printf>
  f2:	83 c4 04             	add    $0x4,%esp
  f5:	ff 35 bc 0d 00 00    	push   0xdbc
  fb:	e8 60 04 00 00       	call   560 <kill>
 100:	e8 2b 04 00 00       	call   530 <exit>
   global++;
 105:	83 c0 01             	add    $0x1,%eax
 108:	a3 b8 0d 00 00       	mov    %eax,0xdb8
   exit();
 10d:	e8 1e 04 00 00       	call   530 <exit>

00000112 <main>:
{
 112:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 116:	83 e4 f0             	and    $0xfffffff0,%esp
 119:	ff 71 fc             	push   -0x4(%ecx)
 11c:	55                   	push   %ebp
 11d:	89 e5                	mov    %esp,%ebp
 11f:	57                   	push   %edi
 120:	56                   	push   %esi
 121:	53                   	push   %ebx
 122:	51                   	push   %ecx
 123:	83 ec 18             	sub    $0x18,%esp
   ppid = getpid();
 126:	e8 85 04 00 00       	call   5b0 <getpid>
 12b:	a3 bc 0d 00 00       	mov    %eax,0xdbc
   void *stack, *p = malloc(PGSIZE * 2);
 130:	83 ec 0c             	sub    $0xc,%esp
 133:	68 00 20 00 00       	push   $0x2000
 138:	e8 6e 07 00 00       	call   8ab <malloc>
   assert(p != NULL);
 13d:	83 c4 10             	add    $0x10,%esp
 140:	85 c0                	test   %eax,%eax
 142:	74 14                	je     158 <main+0x46>
 144:	89 c3                	mov    %eax,%ebx
   if((uint)p % PGSIZE)
 146:	25 ff 0f 00 00       	and    $0xfff,%eax
 14b:	74 54                	je     1a1 <main+0x8f>
     stack = p + (PGSIZE - (uint)p % PGSIZE);
 14d:	bf 00 10 00 00       	mov    $0x1000,%edi
 152:	29 c7                	sub    %eax,%edi
 154:	01 df                	add    %ebx,%edi
 156:	eb 4b                	jmp    1a3 <main+0x91>
   assert(p != NULL);
 158:	6a 1d                	push   $0x1d
 15a:	68 34 09 00 00       	push   $0x934
 15f:	68 3d 09 00 00       	push   $0x93d
 164:	6a 01                	push   $0x1
 166:	e8 1a 05 00 00       	call   685 <printf>
 16b:	83 c4 0c             	add    $0xc,%esp
 16e:	68 88 09 00 00       	push   $0x988
 173:	68 50 09 00 00       	push   $0x950
 178:	6a 01                	push   $0x1
 17a:	e8 06 05 00 00       	call   685 <printf>
 17f:	83 c4 08             	add    $0x8,%esp
 182:	68 64 09 00 00       	push   $0x964
 187:	6a 01                	push   $0x1
 189:	e8 f7 04 00 00       	call   685 <printf>
 18e:	83 c4 04             	add    $0x4,%esp
 191:	ff 35 bc 0d 00 00    	push   0xdbc
 197:	e8 c4 03 00 00       	call   560 <kill>
 19c:	e8 8f 03 00 00       	call   530 <exit>
     stack = p;
 1a1:	89 df                	mov    %ebx,%edi
   int arg1 = 42, arg2 = 24;
 1a3:	c7 45 e4 2a 00 00 00 	movl   $0x2a,-0x1c(%ebp)
 1aa:	c7 45 e0 18 00 00 00 	movl   $0x18,-0x20(%ebp)
   int clone_pid = clone(worker, &arg1, &arg2, stack);
 1b1:	57                   	push   %edi
 1b2:	8d 45 e0             	lea    -0x20(%ebp),%eax
 1b5:	50                   	push   %eax
 1b6:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 1b9:	50                   	push   %eax
 1ba:	68 00 00 00 00       	push   $0x0
 1bf:	e8 0c 04 00 00       	call   5d0 <clone>
 1c4:	89 c6                	mov    %eax,%esi
   assert(clone_pid > 0);
 1c6:	83 c4 10             	add    $0x10,%esp
 1c9:	85 c0                	test   %eax,%eax
 1cb:	7e 69                	jle    236 <main+0x124>
   int join_pid = join(&join_stack);
 1cd:	83 ec 0c             	sub    $0xc,%esp
 1d0:	8d 45 dc             	lea    -0x24(%ebp),%eax
 1d3:	50                   	push   %eax
 1d4:	e8 ff 03 00 00       	call   5d8 <join>
   assert(join_pid == clone_pid);
 1d9:	83 c4 10             	add    $0x10,%esp
 1dc:	39 c6                	cmp    %eax,%esi
 1de:	0f 85 9b 00 00 00    	jne    27f <main+0x16d>
   assert(stack == join_stack);
 1e4:	39 7d dc             	cmp    %edi,-0x24(%ebp)
 1e7:	0f 84 db 00 00 00    	je     2c8 <main+0x1b6>
 1ed:	6a 2a                	push   $0x2a
 1ef:	68 34 09 00 00       	push   $0x934
 1f4:	68 3d 09 00 00       	push   $0x93d
 1f9:	6a 01                	push   $0x1
 1fb:	e8 85 04 00 00       	call   685 <printf>
 200:	83 c4 0c             	add    $0xc,%esp
 203:	68 b6 09 00 00       	push   $0x9b6
 208:	68 50 09 00 00       	push   $0x950
 20d:	6a 01                	push   $0x1
 20f:	e8 71 04 00 00       	call   685 <printf>
 214:	83 c4 08             	add    $0x8,%esp
 217:	68 64 09 00 00       	push   $0x964
 21c:	6a 01                	push   $0x1
 21e:	e8 62 04 00 00       	call   685 <printf>
 223:	83 c4 04             	add    $0x4,%esp
 226:	ff 35 bc 0d 00 00    	push   0xdbc
 22c:	e8 2f 03 00 00       	call   560 <kill>
 231:	e8 fa 02 00 00       	call   530 <exit>
   assert(clone_pid > 0);
 236:	6a 25                	push   $0x25
 238:	68 34 09 00 00       	push   $0x934
 23d:	68 3d 09 00 00       	push   $0x93d
 242:	6a 01                	push   $0x1
 244:	e8 3c 04 00 00       	call   685 <printf>
 249:	83 c4 0c             	add    $0xc,%esp
 24c:	68 92 09 00 00       	push   $0x992
 251:	68 50 09 00 00       	push   $0x950
 256:	6a 01                	push   $0x1
 258:	e8 28 04 00 00       	call   685 <printf>
 25d:	83 c4 08             	add    $0x8,%esp
 260:	68 64 09 00 00       	push   $0x964
 265:	6a 01                	push   $0x1
 267:	e8 19 04 00 00       	call   685 <printf>
 26c:	83 c4 04             	add    $0x4,%esp
 26f:	ff 35 bc 0d 00 00    	push   0xdbc
 275:	e8 e6 02 00 00       	call   560 <kill>
 27a:	e8 b1 02 00 00       	call   530 <exit>
   assert(join_pid == clone_pid);
 27f:	6a 29                	push   $0x29
 281:	68 34 09 00 00       	push   $0x934
 286:	68 3d 09 00 00       	push   $0x93d
 28b:	6a 01                	push   $0x1
 28d:	e8 f3 03 00 00       	call   685 <printf>
 292:	83 c4 0c             	add    $0xc,%esp
 295:	68 a0 09 00 00       	push   $0x9a0
 29a:	68 50 09 00 00       	push   $0x950
 29f:	6a 01                	push   $0x1
 2a1:	e8 df 03 00 00       	call   685 <printf>
 2a6:	83 c4 08             	add    $0x8,%esp
 2a9:	68 64 09 00 00       	push   $0x964
 2ae:	6a 01                	push   $0x1
 2b0:	e8 d0 03 00 00       	call   685 <printf>
 2b5:	83 c4 04             	add    $0x4,%esp
 2b8:	ff 35 bc 0d 00 00    	push   0xdbc
 2be:	e8 9d 02 00 00       	call   560 <kill>
 2c3:	e8 68 02 00 00       	call   530 <exit>
   assert(global == 2);
 2c8:	83 3d b8 0d 00 00 02 	cmpl   $0x2,0xdb8
 2cf:	74 49                	je     31a <main+0x208>
 2d1:	6a 2b                	push   $0x2b
 2d3:	68 34 09 00 00       	push   $0x934
 2d8:	68 3d 09 00 00       	push   $0x93d
 2dd:	6a 01                	push   $0x1
 2df:	e8 a1 03 00 00       	call   685 <printf>
 2e4:	83 c4 0c             	add    $0xc,%esp
 2e7:	68 ca 09 00 00       	push   $0x9ca
 2ec:	68 50 09 00 00       	push   $0x950
 2f1:	6a 01                	push   $0x1
 2f3:	e8 8d 03 00 00       	call   685 <printf>
 2f8:	83 c4 08             	add    $0x8,%esp
 2fb:	68 64 09 00 00       	push   $0x964
 300:	6a 01                	push   $0x1
 302:	e8 7e 03 00 00       	call   685 <printf>
 307:	83 c4 04             	add    $0x4,%esp
 30a:	ff 35 bc 0d 00 00    	push   0xdbc
 310:	e8 4b 02 00 00       	call   560 <kill>
 315:	e8 16 02 00 00       	call   530 <exit>
   printf(1, "TEST PASSED\n");
 31a:	83 ec 08             	sub    $0x8,%esp
 31d:	68 d6 09 00 00       	push   $0x9d6
 322:	6a 01                	push   $0x1
 324:	e8 5c 03 00 00       	call   685 <printf>
   free(p);
 329:	89 1c 24             	mov    %ebx,(%esp)
 32c:	e8 ba 04 00 00       	call   7eb <free>
   exit();
 331:	e8 fa 01 00 00       	call   530 <exit>

00000336 <test_and_set>:
#include "fcntl.h"
#include "user.h"
#include "x86.h"
#include "mmu.h"

int test_and_set(int *old_ptr, int new_ptr) {
 336:	55                   	push   %ebp
 337:	89 e5                	mov    %esp,%ebp
 339:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *old_ptr;
 33c:	8b 10                	mov    (%eax),%edx
  *old_ptr = new_ptr;
 33e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 341:	89 08                	mov    %ecx,(%eax)
  return old;
}
 343:	89 d0                	mov    %edx,%eax
 345:	5d                   	pop    %ebp
 346:	c3                   	ret    

00000347 <thread_create>:

  // I can't remember if there was something else to do here but I'm sure I'll find out


  return new_pid;
}
 347:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 34c:	c3                   	ret    

0000034d <thread_join>:

int thread_join() {
  return 0;
}
 34d:	b8 00 00 00 00       	mov    $0x0,%eax
 352:	c3                   	ret    

00000353 <lock_acquire>:

void lock_acquire(lock_t *lock){
 353:	55                   	push   %ebp
 354:	89 e5                	mov    %esp,%ebp
 356:	53                   	push   %ebx
 357:	83 ec 04             	sub    $0x4,%esp
 35a:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 35d:	83 ec 08             	sub    $0x8,%esp
 360:	6a 01                	push   $0x1
 362:	53                   	push   %ebx
 363:	e8 ce ff ff ff       	call   336 <test_and_set>
 368:	83 c4 10             	add    $0x10,%esp
 36b:	83 f8 01             	cmp    $0x1,%eax
 36e:	74 ed                	je     35d <lock_acquire+0xa>
    ;
}
 370:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 373:	c9                   	leave  
 374:	c3                   	ret    

00000375 <lock_release>:

void lock_release(lock_t *lock) {
 375:	55                   	push   %ebp
 376:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 378:	8b 45 08             	mov    0x8(%ebp),%eax
 37b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 381:	5d                   	pop    %ebp
 382:	c3                   	ret    

00000383 <lock_init>:

void lock_init(lock_t *lock) {
 383:	55                   	push   %ebp
 384:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 386:	8b 45 08             	mov    0x8(%ebp),%eax
 389:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 38f:	5d                   	pop    %ebp
 390:	c3                   	ret    

00000391 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 391:	55                   	push   %ebp
 392:	89 e5                	mov    %esp,%ebp
 394:	56                   	push   %esi
 395:	53                   	push   %ebx
 396:	8b 75 08             	mov    0x8(%ebp),%esi
 399:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 39c:	89 f0                	mov    %esi,%eax
 39e:	89 d1                	mov    %edx,%ecx
 3a0:	83 c2 01             	add    $0x1,%edx
 3a3:	89 c3                	mov    %eax,%ebx
 3a5:	83 c0 01             	add    $0x1,%eax
 3a8:	0f b6 09             	movzbl (%ecx),%ecx
 3ab:	88 0b                	mov    %cl,(%ebx)
 3ad:	84 c9                	test   %cl,%cl
 3af:	75 ed                	jne    39e <strcpy+0xd>
    ;
  return os;
}
 3b1:	89 f0                	mov    %esi,%eax
 3b3:	5b                   	pop    %ebx
 3b4:	5e                   	pop    %esi
 3b5:	5d                   	pop    %ebp
 3b6:	c3                   	ret    

000003b7 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 3b7:	55                   	push   %ebp
 3b8:	89 e5                	mov    %esp,%ebp
 3ba:	8b 4d 08             	mov    0x8(%ebp),%ecx
 3bd:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 3c0:	eb 06                	jmp    3c8 <strcmp+0x11>
    p++, q++;
 3c2:	83 c1 01             	add    $0x1,%ecx
 3c5:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 3c8:	0f b6 01             	movzbl (%ecx),%eax
 3cb:	84 c0                	test   %al,%al
 3cd:	74 04                	je     3d3 <strcmp+0x1c>
 3cf:	3a 02                	cmp    (%edx),%al
 3d1:	74 ef                	je     3c2 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 3d3:	0f b6 c0             	movzbl %al,%eax
 3d6:	0f b6 12             	movzbl (%edx),%edx
 3d9:	29 d0                	sub    %edx,%eax
}
 3db:	5d                   	pop    %ebp
 3dc:	c3                   	ret    

000003dd <strlen>:

uint
strlen(const char *s)
{
 3dd:	55                   	push   %ebp
 3de:	89 e5                	mov    %esp,%ebp
 3e0:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 3e3:	b8 00 00 00 00       	mov    $0x0,%eax
 3e8:	eb 03                	jmp    3ed <strlen+0x10>
 3ea:	83 c0 01             	add    $0x1,%eax
 3ed:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 3f1:	75 f7                	jne    3ea <strlen+0xd>
    ;
  return n;
}
 3f3:	5d                   	pop    %ebp
 3f4:	c3                   	ret    

000003f5 <memset>:

void*
memset(void *dst, int c, uint n)
{
 3f5:	55                   	push   %ebp
 3f6:	89 e5                	mov    %esp,%ebp
 3f8:	57                   	push   %edi
 3f9:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 3fc:	89 d7                	mov    %edx,%edi
 3fe:	8b 4d 10             	mov    0x10(%ebp),%ecx
 401:	8b 45 0c             	mov    0xc(%ebp),%eax
 404:	fc                   	cld    
 405:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 407:	89 d0                	mov    %edx,%eax
 409:	8b 7d fc             	mov    -0x4(%ebp),%edi
 40c:	c9                   	leave  
 40d:	c3                   	ret    

0000040e <strchr>:

char*
strchr(const char *s, char c)
{
 40e:	55                   	push   %ebp
 40f:	89 e5                	mov    %esp,%ebp
 411:	8b 45 08             	mov    0x8(%ebp),%eax
 414:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 418:	eb 03                	jmp    41d <strchr+0xf>
 41a:	83 c0 01             	add    $0x1,%eax
 41d:	0f b6 10             	movzbl (%eax),%edx
 420:	84 d2                	test   %dl,%dl
 422:	74 06                	je     42a <strchr+0x1c>
    if(*s == c)
 424:	38 ca                	cmp    %cl,%dl
 426:	75 f2                	jne    41a <strchr+0xc>
 428:	eb 05                	jmp    42f <strchr+0x21>
      return (char*)s;
  return 0;
 42a:	b8 00 00 00 00       	mov    $0x0,%eax
}
 42f:	5d                   	pop    %ebp
 430:	c3                   	ret    

00000431 <gets>:

char*
gets(char *buf, int max)
{
 431:	55                   	push   %ebp
 432:	89 e5                	mov    %esp,%ebp
 434:	57                   	push   %edi
 435:	56                   	push   %esi
 436:	53                   	push   %ebx
 437:	83 ec 1c             	sub    $0x1c,%esp
 43a:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 43d:	bb 00 00 00 00       	mov    $0x0,%ebx
 442:	89 de                	mov    %ebx,%esi
 444:	83 c3 01             	add    $0x1,%ebx
 447:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 44a:	7d 2e                	jge    47a <gets+0x49>
    cc = read(0, &c, 1);
 44c:	83 ec 04             	sub    $0x4,%esp
 44f:	6a 01                	push   $0x1
 451:	8d 45 e7             	lea    -0x19(%ebp),%eax
 454:	50                   	push   %eax
 455:	6a 00                	push   $0x0
 457:	e8 ec 00 00 00       	call   548 <read>
    if(cc < 1)
 45c:	83 c4 10             	add    $0x10,%esp
 45f:	85 c0                	test   %eax,%eax
 461:	7e 17                	jle    47a <gets+0x49>
      break;
    buf[i++] = c;
 463:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 467:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 46a:	3c 0a                	cmp    $0xa,%al
 46c:	0f 94 c2             	sete   %dl
 46f:	3c 0d                	cmp    $0xd,%al
 471:	0f 94 c0             	sete   %al
 474:	08 c2                	or     %al,%dl
 476:	74 ca                	je     442 <gets+0x11>
    buf[i++] = c;
 478:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 47a:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 47e:	89 f8                	mov    %edi,%eax
 480:	8d 65 f4             	lea    -0xc(%ebp),%esp
 483:	5b                   	pop    %ebx
 484:	5e                   	pop    %esi
 485:	5f                   	pop    %edi
 486:	5d                   	pop    %ebp
 487:	c3                   	ret    

00000488 <stat>:

int
stat(const char *n, struct stat *st)
{
 488:	55                   	push   %ebp
 489:	89 e5                	mov    %esp,%ebp
 48b:	56                   	push   %esi
 48c:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 48d:	83 ec 08             	sub    $0x8,%esp
 490:	6a 00                	push   $0x0
 492:	ff 75 08             	push   0x8(%ebp)
 495:	e8 d6 00 00 00       	call   570 <open>
  if(fd < 0)
 49a:	83 c4 10             	add    $0x10,%esp
 49d:	85 c0                	test   %eax,%eax
 49f:	78 24                	js     4c5 <stat+0x3d>
 4a1:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 4a3:	83 ec 08             	sub    $0x8,%esp
 4a6:	ff 75 0c             	push   0xc(%ebp)
 4a9:	50                   	push   %eax
 4aa:	e8 d9 00 00 00       	call   588 <fstat>
 4af:	89 c6                	mov    %eax,%esi
  close(fd);
 4b1:	89 1c 24             	mov    %ebx,(%esp)
 4b4:	e8 9f 00 00 00       	call   558 <close>
  return r;
 4b9:	83 c4 10             	add    $0x10,%esp
}
 4bc:	89 f0                	mov    %esi,%eax
 4be:	8d 65 f8             	lea    -0x8(%ebp),%esp
 4c1:	5b                   	pop    %ebx
 4c2:	5e                   	pop    %esi
 4c3:	5d                   	pop    %ebp
 4c4:	c3                   	ret    
    return -1;
 4c5:	be ff ff ff ff       	mov    $0xffffffff,%esi
 4ca:	eb f0                	jmp    4bc <stat+0x34>

000004cc <atoi>:

int
atoi(const char *s)
{
 4cc:	55                   	push   %ebp
 4cd:	89 e5                	mov    %esp,%ebp
 4cf:	53                   	push   %ebx
 4d0:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 4d3:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 4d8:	eb 10                	jmp    4ea <atoi+0x1e>
    n = n*10 + *s++ - '0';
 4da:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 4dd:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 4e0:	83 c1 01             	add    $0x1,%ecx
 4e3:	0f be c0             	movsbl %al,%eax
 4e6:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 4ea:	0f b6 01             	movzbl (%ecx),%eax
 4ed:	8d 58 d0             	lea    -0x30(%eax),%ebx
 4f0:	80 fb 09             	cmp    $0x9,%bl
 4f3:	76 e5                	jbe    4da <atoi+0xe>
  return n;
}
 4f5:	89 d0                	mov    %edx,%eax
 4f7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4fa:	c9                   	leave  
 4fb:	c3                   	ret    

000004fc <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 4fc:	55                   	push   %ebp
 4fd:	89 e5                	mov    %esp,%ebp
 4ff:	56                   	push   %esi
 500:	53                   	push   %ebx
 501:	8b 75 08             	mov    0x8(%ebp),%esi
 504:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 507:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 50a:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 50c:	eb 0d                	jmp    51b <memmove+0x1f>
    *dst++ = *src++;
 50e:	0f b6 01             	movzbl (%ecx),%eax
 511:	88 02                	mov    %al,(%edx)
 513:	8d 49 01             	lea    0x1(%ecx),%ecx
 516:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 519:	89 d8                	mov    %ebx,%eax
 51b:	8d 58 ff             	lea    -0x1(%eax),%ebx
 51e:	85 c0                	test   %eax,%eax
 520:	7f ec                	jg     50e <memmove+0x12>
  return vdst;
}
 522:	89 f0                	mov    %esi,%eax
 524:	5b                   	pop    %ebx
 525:	5e                   	pop    %esi
 526:	5d                   	pop    %ebp
 527:	c3                   	ret    

00000528 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 528:	b8 01 00 00 00       	mov    $0x1,%eax
 52d:	cd 40                	int    $0x40
 52f:	c3                   	ret    

00000530 <exit>:
SYSCALL(exit)
 530:	b8 02 00 00 00       	mov    $0x2,%eax
 535:	cd 40                	int    $0x40
 537:	c3                   	ret    

00000538 <wait>:
SYSCALL(wait)
 538:	b8 03 00 00 00       	mov    $0x3,%eax
 53d:	cd 40                	int    $0x40
 53f:	c3                   	ret    

00000540 <pipe>:
SYSCALL(pipe)
 540:	b8 04 00 00 00       	mov    $0x4,%eax
 545:	cd 40                	int    $0x40
 547:	c3                   	ret    

00000548 <read>:
SYSCALL(read)
 548:	b8 05 00 00 00       	mov    $0x5,%eax
 54d:	cd 40                	int    $0x40
 54f:	c3                   	ret    

00000550 <write>:
SYSCALL(write)
 550:	b8 10 00 00 00       	mov    $0x10,%eax
 555:	cd 40                	int    $0x40
 557:	c3                   	ret    

00000558 <close>:
SYSCALL(close)
 558:	b8 15 00 00 00       	mov    $0x15,%eax
 55d:	cd 40                	int    $0x40
 55f:	c3                   	ret    

00000560 <kill>:
SYSCALL(kill)
 560:	b8 06 00 00 00       	mov    $0x6,%eax
 565:	cd 40                	int    $0x40
 567:	c3                   	ret    

00000568 <exec>:
SYSCALL(exec)
 568:	b8 07 00 00 00       	mov    $0x7,%eax
 56d:	cd 40                	int    $0x40
 56f:	c3                   	ret    

00000570 <open>:
SYSCALL(open)
 570:	b8 0f 00 00 00       	mov    $0xf,%eax
 575:	cd 40                	int    $0x40
 577:	c3                   	ret    

00000578 <mknod>:
SYSCALL(mknod)
 578:	b8 11 00 00 00       	mov    $0x11,%eax
 57d:	cd 40                	int    $0x40
 57f:	c3                   	ret    

00000580 <unlink>:
SYSCALL(unlink)
 580:	b8 12 00 00 00       	mov    $0x12,%eax
 585:	cd 40                	int    $0x40
 587:	c3                   	ret    

00000588 <fstat>:
SYSCALL(fstat)
 588:	b8 08 00 00 00       	mov    $0x8,%eax
 58d:	cd 40                	int    $0x40
 58f:	c3                   	ret    

00000590 <link>:
SYSCALL(link)
 590:	b8 13 00 00 00       	mov    $0x13,%eax
 595:	cd 40                	int    $0x40
 597:	c3                   	ret    

00000598 <mkdir>:
SYSCALL(mkdir)
 598:	b8 14 00 00 00       	mov    $0x14,%eax
 59d:	cd 40                	int    $0x40
 59f:	c3                   	ret    

000005a0 <chdir>:
SYSCALL(chdir)
 5a0:	b8 09 00 00 00       	mov    $0x9,%eax
 5a5:	cd 40                	int    $0x40
 5a7:	c3                   	ret    

000005a8 <dup>:
SYSCALL(dup)
 5a8:	b8 0a 00 00 00       	mov    $0xa,%eax
 5ad:	cd 40                	int    $0x40
 5af:	c3                   	ret    

000005b0 <getpid>:
SYSCALL(getpid)
 5b0:	b8 0b 00 00 00       	mov    $0xb,%eax
 5b5:	cd 40                	int    $0x40
 5b7:	c3                   	ret    

000005b8 <sbrk>:
SYSCALL(sbrk)
 5b8:	b8 0c 00 00 00       	mov    $0xc,%eax
 5bd:	cd 40                	int    $0x40
 5bf:	c3                   	ret    

000005c0 <sleep>:
SYSCALL(sleep)
 5c0:	b8 0d 00 00 00       	mov    $0xd,%eax
 5c5:	cd 40                	int    $0x40
 5c7:	c3                   	ret    

000005c8 <uptime>:
SYSCALL(uptime)
 5c8:	b8 0e 00 00 00       	mov    $0xe,%eax
 5cd:	cd 40                	int    $0x40
 5cf:	c3                   	ret    

000005d0 <clone>:
SYSCALL(clone)
 5d0:	b8 16 00 00 00       	mov    $0x16,%eax
 5d5:	cd 40                	int    $0x40
 5d7:	c3                   	ret    

000005d8 <join>:
 5d8:	b8 17 00 00 00       	mov    $0x17,%eax
 5dd:	cd 40                	int    $0x40
 5df:	c3                   	ret    

000005e0 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 5e0:	55                   	push   %ebp
 5e1:	89 e5                	mov    %esp,%ebp
 5e3:	83 ec 1c             	sub    $0x1c,%esp
 5e6:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 5e9:	6a 01                	push   $0x1
 5eb:	8d 55 f4             	lea    -0xc(%ebp),%edx
 5ee:	52                   	push   %edx
 5ef:	50                   	push   %eax
 5f0:	e8 5b ff ff ff       	call   550 <write>
}
 5f5:	83 c4 10             	add    $0x10,%esp
 5f8:	c9                   	leave  
 5f9:	c3                   	ret    

000005fa <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 5fa:	55                   	push   %ebp
 5fb:	89 e5                	mov    %esp,%ebp
 5fd:	57                   	push   %edi
 5fe:	56                   	push   %esi
 5ff:	53                   	push   %ebx
 600:	83 ec 2c             	sub    $0x2c,%esp
 603:	89 45 d0             	mov    %eax,-0x30(%ebp)
 606:	89 d0                	mov    %edx,%eax
 608:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 60a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 60e:	0f 95 c1             	setne  %cl
 611:	c1 ea 1f             	shr    $0x1f,%edx
 614:	84 d1                	test   %dl,%cl
 616:	74 44                	je     65c <printint+0x62>
    neg = 1;
    x = -xx;
 618:	f7 d8                	neg    %eax
 61a:	89 c1                	mov    %eax,%ecx
    neg = 1;
 61c:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 623:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 628:	89 c8                	mov    %ecx,%eax
 62a:	ba 00 00 00 00       	mov    $0x0,%edx
 62f:	f7 f6                	div    %esi
 631:	89 df                	mov    %ebx,%edi
 633:	83 c3 01             	add    $0x1,%ebx
 636:	0f b6 92 44 0a 00 00 	movzbl 0xa44(%edx),%edx
 63d:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 641:	89 ca                	mov    %ecx,%edx
 643:	89 c1                	mov    %eax,%ecx
 645:	39 d6                	cmp    %edx,%esi
 647:	76 df                	jbe    628 <printint+0x2e>
  if(neg)
 649:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 64d:	74 31                	je     680 <printint+0x86>
    buf[i++] = '-';
 64f:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 654:	8d 5f 02             	lea    0x2(%edi),%ebx
 657:	8b 75 d0             	mov    -0x30(%ebp),%esi
 65a:	eb 17                	jmp    673 <printint+0x79>
    x = xx;
 65c:	89 c1                	mov    %eax,%ecx
  neg = 0;
 65e:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 665:	eb bc                	jmp    623 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 667:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 66c:	89 f0                	mov    %esi,%eax
 66e:	e8 6d ff ff ff       	call   5e0 <putc>
  while(--i >= 0)
 673:	83 eb 01             	sub    $0x1,%ebx
 676:	79 ef                	jns    667 <printint+0x6d>
}
 678:	83 c4 2c             	add    $0x2c,%esp
 67b:	5b                   	pop    %ebx
 67c:	5e                   	pop    %esi
 67d:	5f                   	pop    %edi
 67e:	5d                   	pop    %ebp
 67f:	c3                   	ret    
 680:	8b 75 d0             	mov    -0x30(%ebp),%esi
 683:	eb ee                	jmp    673 <printint+0x79>

00000685 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 685:	55                   	push   %ebp
 686:	89 e5                	mov    %esp,%ebp
 688:	57                   	push   %edi
 689:	56                   	push   %esi
 68a:	53                   	push   %ebx
 68b:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 68e:	8d 45 10             	lea    0x10(%ebp),%eax
 691:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 694:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 699:	bb 00 00 00 00       	mov    $0x0,%ebx
 69e:	eb 14                	jmp    6b4 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 6a0:	89 fa                	mov    %edi,%edx
 6a2:	8b 45 08             	mov    0x8(%ebp),%eax
 6a5:	e8 36 ff ff ff       	call   5e0 <putc>
 6aa:	eb 05                	jmp    6b1 <printf+0x2c>
      }
    } else if(state == '%'){
 6ac:	83 fe 25             	cmp    $0x25,%esi
 6af:	74 25                	je     6d6 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 6b1:	83 c3 01             	add    $0x1,%ebx
 6b4:	8b 45 0c             	mov    0xc(%ebp),%eax
 6b7:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 6bb:	84 c0                	test   %al,%al
 6bd:	0f 84 20 01 00 00    	je     7e3 <printf+0x15e>
    c = fmt[i] & 0xff;
 6c3:	0f be f8             	movsbl %al,%edi
 6c6:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 6c9:	85 f6                	test   %esi,%esi
 6cb:	75 df                	jne    6ac <printf+0x27>
      if(c == '%'){
 6cd:	83 f8 25             	cmp    $0x25,%eax
 6d0:	75 ce                	jne    6a0 <printf+0x1b>
        state = '%';
 6d2:	89 c6                	mov    %eax,%esi
 6d4:	eb db                	jmp    6b1 <printf+0x2c>
      if(c == 'd'){
 6d6:	83 f8 25             	cmp    $0x25,%eax
 6d9:	0f 84 cf 00 00 00    	je     7ae <printf+0x129>
 6df:	0f 8c dd 00 00 00    	jl     7c2 <printf+0x13d>
 6e5:	83 f8 78             	cmp    $0x78,%eax
 6e8:	0f 8f d4 00 00 00    	jg     7c2 <printf+0x13d>
 6ee:	83 f8 63             	cmp    $0x63,%eax
 6f1:	0f 8c cb 00 00 00    	jl     7c2 <printf+0x13d>
 6f7:	83 e8 63             	sub    $0x63,%eax
 6fa:	83 f8 15             	cmp    $0x15,%eax
 6fd:	0f 87 bf 00 00 00    	ja     7c2 <printf+0x13d>
 703:	ff 24 85 ec 09 00 00 	jmp    *0x9ec(,%eax,4)
        printint(fd, *ap, 10, 1);
 70a:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 70d:	8b 17                	mov    (%edi),%edx
 70f:	83 ec 0c             	sub    $0xc,%esp
 712:	6a 01                	push   $0x1
 714:	b9 0a 00 00 00       	mov    $0xa,%ecx
 719:	8b 45 08             	mov    0x8(%ebp),%eax
 71c:	e8 d9 fe ff ff       	call   5fa <printint>
        ap++;
 721:	83 c7 04             	add    $0x4,%edi
 724:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 727:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 72a:	be 00 00 00 00       	mov    $0x0,%esi
 72f:	eb 80                	jmp    6b1 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 731:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 734:	8b 17                	mov    (%edi),%edx
 736:	83 ec 0c             	sub    $0xc,%esp
 739:	6a 00                	push   $0x0
 73b:	b9 10 00 00 00       	mov    $0x10,%ecx
 740:	8b 45 08             	mov    0x8(%ebp),%eax
 743:	e8 b2 fe ff ff       	call   5fa <printint>
        ap++;
 748:	83 c7 04             	add    $0x4,%edi
 74b:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 74e:	83 c4 10             	add    $0x10,%esp
      state = 0;
 751:	be 00 00 00 00       	mov    $0x0,%esi
 756:	e9 56 ff ff ff       	jmp    6b1 <printf+0x2c>
        s = (char*)*ap;
 75b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 75e:	8b 30                	mov    (%eax),%esi
        ap++;
 760:	83 c0 04             	add    $0x4,%eax
 763:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 766:	85 f6                	test   %esi,%esi
 768:	75 15                	jne    77f <printf+0xfa>
          s = "(null)";
 76a:	be e3 09 00 00       	mov    $0x9e3,%esi
 76f:	eb 0e                	jmp    77f <printf+0xfa>
          putc(fd, *s);
 771:	0f be d2             	movsbl %dl,%edx
 774:	8b 45 08             	mov    0x8(%ebp),%eax
 777:	e8 64 fe ff ff       	call   5e0 <putc>
          s++;
 77c:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 77f:	0f b6 16             	movzbl (%esi),%edx
 782:	84 d2                	test   %dl,%dl
 784:	75 eb                	jne    771 <printf+0xec>
      state = 0;
 786:	be 00 00 00 00       	mov    $0x0,%esi
 78b:	e9 21 ff ff ff       	jmp    6b1 <printf+0x2c>
        putc(fd, *ap);
 790:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 793:	0f be 17             	movsbl (%edi),%edx
 796:	8b 45 08             	mov    0x8(%ebp),%eax
 799:	e8 42 fe ff ff       	call   5e0 <putc>
        ap++;
 79e:	83 c7 04             	add    $0x4,%edi
 7a1:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 7a4:	be 00 00 00 00       	mov    $0x0,%esi
 7a9:	e9 03 ff ff ff       	jmp    6b1 <printf+0x2c>
        putc(fd, c);
 7ae:	89 fa                	mov    %edi,%edx
 7b0:	8b 45 08             	mov    0x8(%ebp),%eax
 7b3:	e8 28 fe ff ff       	call   5e0 <putc>
      state = 0;
 7b8:	be 00 00 00 00       	mov    $0x0,%esi
 7bd:	e9 ef fe ff ff       	jmp    6b1 <printf+0x2c>
        putc(fd, '%');
 7c2:	ba 25 00 00 00       	mov    $0x25,%edx
 7c7:	8b 45 08             	mov    0x8(%ebp),%eax
 7ca:	e8 11 fe ff ff       	call   5e0 <putc>
        putc(fd, c);
 7cf:	89 fa                	mov    %edi,%edx
 7d1:	8b 45 08             	mov    0x8(%ebp),%eax
 7d4:	e8 07 fe ff ff       	call   5e0 <putc>
      state = 0;
 7d9:	be 00 00 00 00       	mov    $0x0,%esi
 7de:	e9 ce fe ff ff       	jmp    6b1 <printf+0x2c>
    }
  }
}
 7e3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7e6:	5b                   	pop    %ebx
 7e7:	5e                   	pop    %esi
 7e8:	5f                   	pop    %edi
 7e9:	5d                   	pop    %ebp
 7ea:	c3                   	ret    

000007eb <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7eb:	55                   	push   %ebp
 7ec:	89 e5                	mov    %esp,%ebp
 7ee:	57                   	push   %edi
 7ef:	56                   	push   %esi
 7f0:	53                   	push   %ebx
 7f1:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7f4:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7f7:	a1 c0 0d 00 00       	mov    0xdc0,%eax
 7fc:	eb 02                	jmp    800 <free+0x15>
 7fe:	89 d0                	mov    %edx,%eax
 800:	39 c8                	cmp    %ecx,%eax
 802:	73 04                	jae    808 <free+0x1d>
 804:	39 08                	cmp    %ecx,(%eax)
 806:	77 12                	ja     81a <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 808:	8b 10                	mov    (%eax),%edx
 80a:	39 c2                	cmp    %eax,%edx
 80c:	77 f0                	ja     7fe <free+0x13>
 80e:	39 c8                	cmp    %ecx,%eax
 810:	72 08                	jb     81a <free+0x2f>
 812:	39 ca                	cmp    %ecx,%edx
 814:	77 04                	ja     81a <free+0x2f>
 816:	89 d0                	mov    %edx,%eax
 818:	eb e6                	jmp    800 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 81a:	8b 73 fc             	mov    -0x4(%ebx),%esi
 81d:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 820:	8b 10                	mov    (%eax),%edx
 822:	39 d7                	cmp    %edx,%edi
 824:	74 19                	je     83f <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 826:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 829:	8b 50 04             	mov    0x4(%eax),%edx
 82c:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 82f:	39 ce                	cmp    %ecx,%esi
 831:	74 1b                	je     84e <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 833:	89 08                	mov    %ecx,(%eax)
  freep = p;
 835:	a3 c0 0d 00 00       	mov    %eax,0xdc0
}
 83a:	5b                   	pop    %ebx
 83b:	5e                   	pop    %esi
 83c:	5f                   	pop    %edi
 83d:	5d                   	pop    %ebp
 83e:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 83f:	03 72 04             	add    0x4(%edx),%esi
 842:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 845:	8b 10                	mov    (%eax),%edx
 847:	8b 12                	mov    (%edx),%edx
 849:	89 53 f8             	mov    %edx,-0x8(%ebx)
 84c:	eb db                	jmp    829 <free+0x3e>
    p->s.size += bp->s.size;
 84e:	03 53 fc             	add    -0x4(%ebx),%edx
 851:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 854:	8b 53 f8             	mov    -0x8(%ebx),%edx
 857:	89 10                	mov    %edx,(%eax)
 859:	eb da                	jmp    835 <free+0x4a>

0000085b <morecore>:

static Header*
morecore(uint nu)
{
 85b:	55                   	push   %ebp
 85c:	89 e5                	mov    %esp,%ebp
 85e:	53                   	push   %ebx
 85f:	83 ec 04             	sub    $0x4,%esp
 862:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 864:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 869:	77 05                	ja     870 <morecore+0x15>
    nu = 4096;
 86b:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 870:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 877:	83 ec 0c             	sub    $0xc,%esp
 87a:	50                   	push   %eax
 87b:	e8 38 fd ff ff       	call   5b8 <sbrk>
  if(p == (char*)-1)
 880:	83 c4 10             	add    $0x10,%esp
 883:	83 f8 ff             	cmp    $0xffffffff,%eax
 886:	74 1c                	je     8a4 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 888:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 88b:	83 c0 08             	add    $0x8,%eax
 88e:	83 ec 0c             	sub    $0xc,%esp
 891:	50                   	push   %eax
 892:	e8 54 ff ff ff       	call   7eb <free>
  return freep;
 897:	a1 c0 0d 00 00       	mov    0xdc0,%eax
 89c:	83 c4 10             	add    $0x10,%esp
}
 89f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8a2:	c9                   	leave  
 8a3:	c3                   	ret    
    return 0;
 8a4:	b8 00 00 00 00       	mov    $0x0,%eax
 8a9:	eb f4                	jmp    89f <morecore+0x44>

000008ab <malloc>:

void*
malloc(uint nbytes)
{
 8ab:	55                   	push   %ebp
 8ac:	89 e5                	mov    %esp,%ebp
 8ae:	53                   	push   %ebx
 8af:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8b2:	8b 45 08             	mov    0x8(%ebp),%eax
 8b5:	8d 58 07             	lea    0x7(%eax),%ebx
 8b8:	c1 eb 03             	shr    $0x3,%ebx
 8bb:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 8be:	8b 0d c0 0d 00 00    	mov    0xdc0,%ecx
 8c4:	85 c9                	test   %ecx,%ecx
 8c6:	74 04                	je     8cc <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8c8:	8b 01                	mov    (%ecx),%eax
 8ca:	eb 4a                	jmp    916 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 8cc:	c7 05 c0 0d 00 00 c4 	movl   $0xdc4,0xdc0
 8d3:	0d 00 00 
 8d6:	c7 05 c4 0d 00 00 c4 	movl   $0xdc4,0xdc4
 8dd:	0d 00 00 
    base.s.size = 0;
 8e0:	c7 05 c8 0d 00 00 00 	movl   $0x0,0xdc8
 8e7:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 8ea:	b9 c4 0d 00 00       	mov    $0xdc4,%ecx
 8ef:	eb d7                	jmp    8c8 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 8f1:	74 19                	je     90c <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 8f3:	29 da                	sub    %ebx,%edx
 8f5:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8f8:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 8fb:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 8fe:	89 0d c0 0d 00 00    	mov    %ecx,0xdc0
      return (void*)(p + 1);
 904:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 907:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 90a:	c9                   	leave  
 90b:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 90c:	8b 10                	mov    (%eax),%edx
 90e:	89 11                	mov    %edx,(%ecx)
 910:	eb ec                	jmp    8fe <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 912:	89 c1                	mov    %eax,%ecx
 914:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 916:	8b 50 04             	mov    0x4(%eax),%edx
 919:	39 da                	cmp    %ebx,%edx
 91b:	73 d4                	jae    8f1 <malloc+0x46>
    if(p == freep)
 91d:	39 05 c0 0d 00 00    	cmp    %eax,0xdc0
 923:	75 ed                	jne    912 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 925:	89 d8                	mov    %ebx,%eax
 927:	e8 2f ff ff ff       	call   85b <morecore>
 92c:	85 c0                	test   %eax,%eax
 92e:	75 e2                	jne    912 <malloc+0x67>
 930:	eb d5                	jmp    907 <malloc+0x5c>
