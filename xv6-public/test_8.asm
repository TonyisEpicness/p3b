
_test_8:     file format elf32-i386


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
  1c:	a1 28 0e 00 00       	mov    0xe28,%eax
  21:	83 f8 01             	cmp    $0x1,%eax
  24:	0f 84 db 00 00 00    	je     105 <worker+0x105>
  2a:	6a 3b                	push   $0x3b
  2c:	68 98 09 00 00       	push   $0x998
  31:	68 a1 09 00 00       	push   $0x9a1
  36:	6a 01                	push   $0x1
  38:	e8 ab 06 00 00       	call   6e8 <printf>
  3d:	83 c4 0c             	add    $0xc,%esp
  40:	68 e0 09 00 00       	push   $0x9e0
  45:	68 b4 09 00 00       	push   $0x9b4
  4a:	6a 01                	push   $0x1
  4c:	e8 97 06 00 00       	call   6e8 <printf>
  51:	83 c4 08             	add    $0x8,%esp
  54:	68 c8 09 00 00       	push   $0x9c8
  59:	6a 01                	push   $0x1
  5b:	e8 88 06 00 00       	call   6e8 <printf>
  60:	83 c4 04             	add    $0x4,%esp
  63:	ff 35 2c 0e 00 00    	push   0xe2c
  69:	e8 55 05 00 00       	call   5c3 <kill>
  6e:	e8 20 05 00 00       	call   593 <exit>
   assert(tmp1 == 42);
  73:	6a 39                	push   $0x39
  75:	68 98 09 00 00       	push   $0x998
  7a:	68 a1 09 00 00       	push   $0x9a1
  7f:	6a 01                	push   $0x1
  81:	e8 62 06 00 00       	call   6e8 <printf>
  86:	83 c4 0c             	add    $0xc,%esp
  89:	68 a9 09 00 00       	push   $0x9a9
  8e:	68 b4 09 00 00       	push   $0x9b4
  93:	6a 01                	push   $0x1
  95:	e8 4e 06 00 00       	call   6e8 <printf>
  9a:	83 c4 08             	add    $0x8,%esp
  9d:	68 c8 09 00 00       	push   $0x9c8
  a2:	6a 01                	push   $0x1
  a4:	e8 3f 06 00 00       	call   6e8 <printf>
  a9:	83 c4 04             	add    $0x4,%esp
  ac:	ff 35 2c 0e 00 00    	push   0xe2c
  b2:	e8 0c 05 00 00       	call   5c3 <kill>
  b7:	e8 d7 04 00 00       	call   593 <exit>
   assert(tmp2 == 24);
  bc:	6a 3a                	push   $0x3a
  be:	68 98 09 00 00       	push   $0x998
  c3:	68 a1 09 00 00       	push   $0x9a1
  c8:	6a 01                	push   $0x1
  ca:	e8 19 06 00 00       	call   6e8 <printf>
  cf:	83 c4 0c             	add    $0xc,%esp
  d2:	68 d5 09 00 00       	push   $0x9d5
  d7:	68 b4 09 00 00       	push   $0x9b4
  dc:	6a 01                	push   $0x1
  de:	e8 05 06 00 00       	call   6e8 <printf>
  e3:	83 c4 08             	add    $0x8,%esp
  e6:	68 c8 09 00 00       	push   $0x9c8
  eb:	6a 01                	push   $0x1
  ed:	e8 f6 05 00 00       	call   6e8 <printf>
  f2:	83 c4 04             	add    $0x4,%esp
  f5:	ff 35 2c 0e 00 00    	push   0xe2c
  fb:	e8 c3 04 00 00       	call   5c3 <kill>
 100:	e8 8e 04 00 00       	call   593 <exit>
   global++;
 105:	83 c0 01             	add    $0x1,%eax
 108:	a3 28 0e 00 00       	mov    %eax,0xe28
   exit();
 10d:	e8 81 04 00 00       	call   593 <exit>

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
 126:	e8 e8 04 00 00       	call   613 <getpid>
 12b:	a3 2c 0e 00 00       	mov    %eax,0xe2c
   void *stack, *p = malloc(PGSIZE * 2);
 130:	83 ec 0c             	sub    $0xc,%esp
 133:	68 00 20 00 00       	push   $0x2000
 138:	e8 d1 07 00 00       	call   90e <malloc>
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
 15a:	68 98 09 00 00       	push   $0x998
 15f:	68 a1 09 00 00       	push   $0x9a1
 164:	6a 01                	push   $0x1
 166:	e8 7d 05 00 00       	call   6e8 <printf>
 16b:	83 c4 0c             	add    $0xc,%esp
 16e:	68 ec 09 00 00       	push   $0x9ec
 173:	68 b4 09 00 00       	push   $0x9b4
 178:	6a 01                	push   $0x1
 17a:	e8 69 05 00 00       	call   6e8 <printf>
 17f:	83 c4 08             	add    $0x8,%esp
 182:	68 c8 09 00 00       	push   $0x9c8
 187:	6a 01                	push   $0x1
 189:	e8 5a 05 00 00       	call   6e8 <printf>
 18e:	83 c4 04             	add    $0x4,%esp
 191:	ff 35 2c 0e 00 00    	push   0xe2c
 197:	e8 27 04 00 00       	call   5c3 <kill>
 19c:	e8 f2 03 00 00       	call   593 <exit>
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
 1bf:	e8 6f 04 00 00       	call   633 <clone>
 1c4:	89 c6                	mov    %eax,%esi
   assert(clone_pid > 0);
 1c6:	83 c4 10             	add    $0x10,%esp
 1c9:	85 c0                	test   %eax,%eax
 1cb:	7e 67                	jle    234 <main+0x122>
   sleep(250);
 1cd:	83 ec 0c             	sub    $0xc,%esp
 1d0:	68 fa 00 00 00       	push   $0xfa
 1d5:	e8 49 04 00 00       	call   623 <sleep>
   assert(wait() == -1);
 1da:	e8 bc 03 00 00       	call   59b <wait>
 1df:	83 c4 10             	add    $0x10,%esp
 1e2:	83 f8 ff             	cmp    $0xffffffff,%eax
 1e5:	0f 84 92 00 00 00    	je     27d <main+0x16b>
 1eb:	6a 28                	push   $0x28
 1ed:	68 98 09 00 00       	push   $0x998
 1f2:	68 a1 09 00 00       	push   $0x9a1
 1f7:	6a 01                	push   $0x1
 1f9:	e8 ea 04 00 00       	call   6e8 <printf>
 1fe:	83 c4 0c             	add    $0xc,%esp
 201:	68 04 0a 00 00       	push   $0xa04
 206:	68 b4 09 00 00       	push   $0x9b4
 20b:	6a 01                	push   $0x1
 20d:	e8 d6 04 00 00       	call   6e8 <printf>
 212:	83 c4 08             	add    $0x8,%esp
 215:	68 c8 09 00 00       	push   $0x9c8
 21a:	6a 01                	push   $0x1
 21c:	e8 c7 04 00 00       	call   6e8 <printf>
 221:	83 c4 04             	add    $0x4,%esp
 224:	ff 35 2c 0e 00 00    	push   0xe2c
 22a:	e8 94 03 00 00       	call   5c3 <kill>
 22f:	e8 5f 03 00 00       	call   593 <exit>
   assert(clone_pid > 0);
 234:	6a 25                	push   $0x25
 236:	68 98 09 00 00       	push   $0x998
 23b:	68 a1 09 00 00       	push   $0x9a1
 240:	6a 01                	push   $0x1
 242:	e8 a1 04 00 00       	call   6e8 <printf>
 247:	83 c4 0c             	add    $0xc,%esp
 24a:	68 f6 09 00 00       	push   $0x9f6
 24f:	68 b4 09 00 00       	push   $0x9b4
 254:	6a 01                	push   $0x1
 256:	e8 8d 04 00 00       	call   6e8 <printf>
 25b:	83 c4 08             	add    $0x8,%esp
 25e:	68 c8 09 00 00       	push   $0x9c8
 263:	6a 01                	push   $0x1
 265:	e8 7e 04 00 00       	call   6e8 <printf>
 26a:	83 c4 04             	add    $0x4,%esp
 26d:	ff 35 2c 0e 00 00    	push   0xe2c
 273:	e8 4b 03 00 00       	call   5c3 <kill>
 278:	e8 16 03 00 00       	call   593 <exit>
   int join_pid = join(&join_stack);
 27d:	83 ec 0c             	sub    $0xc,%esp
 280:	8d 45 dc             	lea    -0x24(%ebp),%eax
 283:	50                   	push   %eax
 284:	e8 b2 03 00 00       	call   63b <join>
   assert(join_pid == clone_pid);
 289:	83 c4 10             	add    $0x10,%esp
 28c:	39 c6                	cmp    %eax,%esi
 28e:	75 52                	jne    2e2 <main+0x1d0>
   assert(stack == join_stack);
 290:	39 7d dc             	cmp    %edi,-0x24(%ebp)
 293:	0f 84 92 00 00 00    	je     32b <main+0x219>
 299:	6a 2d                	push   $0x2d
 29b:	68 98 09 00 00       	push   $0x998
 2a0:	68 a1 09 00 00       	push   $0x9a1
 2a5:	6a 01                	push   $0x1
 2a7:	e8 3c 04 00 00       	call   6e8 <printf>
 2ac:	83 c4 0c             	add    $0xc,%esp
 2af:	68 27 0a 00 00       	push   $0xa27
 2b4:	68 b4 09 00 00       	push   $0x9b4
 2b9:	6a 01                	push   $0x1
 2bb:	e8 28 04 00 00       	call   6e8 <printf>
 2c0:	83 c4 08             	add    $0x8,%esp
 2c3:	68 c8 09 00 00       	push   $0x9c8
 2c8:	6a 01                	push   $0x1
 2ca:	e8 19 04 00 00       	call   6e8 <printf>
 2cf:	83 c4 04             	add    $0x4,%esp
 2d2:	ff 35 2c 0e 00 00    	push   0xe2c
 2d8:	e8 e6 02 00 00       	call   5c3 <kill>
 2dd:	e8 b1 02 00 00       	call   593 <exit>
   assert(join_pid == clone_pid);
 2e2:	6a 2c                	push   $0x2c
 2e4:	68 98 09 00 00       	push   $0x998
 2e9:	68 a1 09 00 00       	push   $0x9a1
 2ee:	6a 01                	push   $0x1
 2f0:	e8 f3 03 00 00       	call   6e8 <printf>
 2f5:	83 c4 0c             	add    $0xc,%esp
 2f8:	68 11 0a 00 00       	push   $0xa11
 2fd:	68 b4 09 00 00       	push   $0x9b4
 302:	6a 01                	push   $0x1
 304:	e8 df 03 00 00       	call   6e8 <printf>
 309:	83 c4 08             	add    $0x8,%esp
 30c:	68 c8 09 00 00       	push   $0x9c8
 311:	6a 01                	push   $0x1
 313:	e8 d0 03 00 00       	call   6e8 <printf>
 318:	83 c4 04             	add    $0x4,%esp
 31b:	ff 35 2c 0e 00 00    	push   0xe2c
 321:	e8 9d 02 00 00       	call   5c3 <kill>
 326:	e8 68 02 00 00       	call   593 <exit>
   assert(global == 2);
 32b:	83 3d 28 0e 00 00 02 	cmpl   $0x2,0xe28
 332:	74 49                	je     37d <main+0x26b>
 334:	6a 2e                	push   $0x2e
 336:	68 98 09 00 00       	push   $0x998
 33b:	68 a1 09 00 00       	push   $0x9a1
 340:	6a 01                	push   $0x1
 342:	e8 a1 03 00 00       	call   6e8 <printf>
 347:	83 c4 0c             	add    $0xc,%esp
 34a:	68 3b 0a 00 00       	push   $0xa3b
 34f:	68 b4 09 00 00       	push   $0x9b4
 354:	6a 01                	push   $0x1
 356:	e8 8d 03 00 00       	call   6e8 <printf>
 35b:	83 c4 08             	add    $0x8,%esp
 35e:	68 c8 09 00 00       	push   $0x9c8
 363:	6a 01                	push   $0x1
 365:	e8 7e 03 00 00       	call   6e8 <printf>
 36a:	83 c4 04             	add    $0x4,%esp
 36d:	ff 35 2c 0e 00 00    	push   0xe2c
 373:	e8 4b 02 00 00       	call   5c3 <kill>
 378:	e8 16 02 00 00       	call   593 <exit>
   printf(1, "TEST PASSED\n");
 37d:	83 ec 08             	sub    $0x8,%esp
 380:	68 47 0a 00 00       	push   $0xa47
 385:	6a 01                	push   $0x1
 387:	e8 5c 03 00 00       	call   6e8 <printf>
   free(p);
 38c:	89 1c 24             	mov    %ebx,(%esp)
 38f:	e8 ba 04 00 00       	call   84e <free>
   exit();
 394:	e8 fa 01 00 00       	call   593 <exit>

00000399 <test_and_set>:
#include "fcntl.h"
#include "user.h"
#include "x86.h"
#include "mmu.h"

int test_and_set(int *old_ptr, int new_ptr) {
 399:	55                   	push   %ebp
 39a:	89 e5                	mov    %esp,%ebp
 39c:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *old_ptr;
 39f:	8b 10                	mov    (%eax),%edx
  *old_ptr = new_ptr;
 3a1:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 3a4:	89 08                	mov    %ecx,(%eax)
  return old;
}
 3a6:	89 d0                	mov    %edx,%eax
 3a8:	5d                   	pop    %ebp
 3a9:	c3                   	ret    

000003aa <thread_create>:

  // I can't remember if there was something else to do here but I'm sure I'll find out


  return new_pid;
}
 3aa:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 3af:	c3                   	ret    

000003b0 <thread_join>:

int thread_join() {
  return 0;
}
 3b0:	b8 00 00 00 00       	mov    $0x0,%eax
 3b5:	c3                   	ret    

000003b6 <lock_acquire>:

void lock_acquire(lock_t *lock){
 3b6:	55                   	push   %ebp
 3b7:	89 e5                	mov    %esp,%ebp
 3b9:	53                   	push   %ebx
 3ba:	83 ec 04             	sub    $0x4,%esp
 3bd:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 3c0:	83 ec 08             	sub    $0x8,%esp
 3c3:	6a 01                	push   $0x1
 3c5:	53                   	push   %ebx
 3c6:	e8 ce ff ff ff       	call   399 <test_and_set>
 3cb:	83 c4 10             	add    $0x10,%esp
 3ce:	83 f8 01             	cmp    $0x1,%eax
 3d1:	74 ed                	je     3c0 <lock_acquire+0xa>
    ;
}
 3d3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3d6:	c9                   	leave  
 3d7:	c3                   	ret    

000003d8 <lock_release>:

void lock_release(lock_t *lock) {
 3d8:	55                   	push   %ebp
 3d9:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 3db:	8b 45 08             	mov    0x8(%ebp),%eax
 3de:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 3e4:	5d                   	pop    %ebp
 3e5:	c3                   	ret    

000003e6 <lock_init>:

void lock_init(lock_t *lock) {
 3e6:	55                   	push   %ebp
 3e7:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 3e9:	8b 45 08             	mov    0x8(%ebp),%eax
 3ec:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 3f2:	5d                   	pop    %ebp
 3f3:	c3                   	ret    

000003f4 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 3f4:	55                   	push   %ebp
 3f5:	89 e5                	mov    %esp,%ebp
 3f7:	56                   	push   %esi
 3f8:	53                   	push   %ebx
 3f9:	8b 75 08             	mov    0x8(%ebp),%esi
 3fc:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 3ff:	89 f0                	mov    %esi,%eax
 401:	89 d1                	mov    %edx,%ecx
 403:	83 c2 01             	add    $0x1,%edx
 406:	89 c3                	mov    %eax,%ebx
 408:	83 c0 01             	add    $0x1,%eax
 40b:	0f b6 09             	movzbl (%ecx),%ecx
 40e:	88 0b                	mov    %cl,(%ebx)
 410:	84 c9                	test   %cl,%cl
 412:	75 ed                	jne    401 <strcpy+0xd>
    ;
  return os;
}
 414:	89 f0                	mov    %esi,%eax
 416:	5b                   	pop    %ebx
 417:	5e                   	pop    %esi
 418:	5d                   	pop    %ebp
 419:	c3                   	ret    

0000041a <strcmp>:

int
strcmp(const char *p, const char *q)
{
 41a:	55                   	push   %ebp
 41b:	89 e5                	mov    %esp,%ebp
 41d:	8b 4d 08             	mov    0x8(%ebp),%ecx
 420:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 423:	eb 06                	jmp    42b <strcmp+0x11>
    p++, q++;
 425:	83 c1 01             	add    $0x1,%ecx
 428:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 42b:	0f b6 01             	movzbl (%ecx),%eax
 42e:	84 c0                	test   %al,%al
 430:	74 04                	je     436 <strcmp+0x1c>
 432:	3a 02                	cmp    (%edx),%al
 434:	74 ef                	je     425 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 436:	0f b6 c0             	movzbl %al,%eax
 439:	0f b6 12             	movzbl (%edx),%edx
 43c:	29 d0                	sub    %edx,%eax
}
 43e:	5d                   	pop    %ebp
 43f:	c3                   	ret    

00000440 <strlen>:

uint
strlen(const char *s)
{
 440:	55                   	push   %ebp
 441:	89 e5                	mov    %esp,%ebp
 443:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 446:	b8 00 00 00 00       	mov    $0x0,%eax
 44b:	eb 03                	jmp    450 <strlen+0x10>
 44d:	83 c0 01             	add    $0x1,%eax
 450:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 454:	75 f7                	jne    44d <strlen+0xd>
    ;
  return n;
}
 456:	5d                   	pop    %ebp
 457:	c3                   	ret    

00000458 <memset>:

void*
memset(void *dst, int c, uint n)
{
 458:	55                   	push   %ebp
 459:	89 e5                	mov    %esp,%ebp
 45b:	57                   	push   %edi
 45c:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 45f:	89 d7                	mov    %edx,%edi
 461:	8b 4d 10             	mov    0x10(%ebp),%ecx
 464:	8b 45 0c             	mov    0xc(%ebp),%eax
 467:	fc                   	cld    
 468:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 46a:	89 d0                	mov    %edx,%eax
 46c:	8b 7d fc             	mov    -0x4(%ebp),%edi
 46f:	c9                   	leave  
 470:	c3                   	ret    

00000471 <strchr>:

char*
strchr(const char *s, char c)
{
 471:	55                   	push   %ebp
 472:	89 e5                	mov    %esp,%ebp
 474:	8b 45 08             	mov    0x8(%ebp),%eax
 477:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 47b:	eb 03                	jmp    480 <strchr+0xf>
 47d:	83 c0 01             	add    $0x1,%eax
 480:	0f b6 10             	movzbl (%eax),%edx
 483:	84 d2                	test   %dl,%dl
 485:	74 06                	je     48d <strchr+0x1c>
    if(*s == c)
 487:	38 ca                	cmp    %cl,%dl
 489:	75 f2                	jne    47d <strchr+0xc>
 48b:	eb 05                	jmp    492 <strchr+0x21>
      return (char*)s;
  return 0;
 48d:	b8 00 00 00 00       	mov    $0x0,%eax
}
 492:	5d                   	pop    %ebp
 493:	c3                   	ret    

00000494 <gets>:

char*
gets(char *buf, int max)
{
 494:	55                   	push   %ebp
 495:	89 e5                	mov    %esp,%ebp
 497:	57                   	push   %edi
 498:	56                   	push   %esi
 499:	53                   	push   %ebx
 49a:	83 ec 1c             	sub    $0x1c,%esp
 49d:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 4a0:	bb 00 00 00 00       	mov    $0x0,%ebx
 4a5:	89 de                	mov    %ebx,%esi
 4a7:	83 c3 01             	add    $0x1,%ebx
 4aa:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 4ad:	7d 2e                	jge    4dd <gets+0x49>
    cc = read(0, &c, 1);
 4af:	83 ec 04             	sub    $0x4,%esp
 4b2:	6a 01                	push   $0x1
 4b4:	8d 45 e7             	lea    -0x19(%ebp),%eax
 4b7:	50                   	push   %eax
 4b8:	6a 00                	push   $0x0
 4ba:	e8 ec 00 00 00       	call   5ab <read>
    if(cc < 1)
 4bf:	83 c4 10             	add    $0x10,%esp
 4c2:	85 c0                	test   %eax,%eax
 4c4:	7e 17                	jle    4dd <gets+0x49>
      break;
    buf[i++] = c;
 4c6:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 4ca:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 4cd:	3c 0a                	cmp    $0xa,%al
 4cf:	0f 94 c2             	sete   %dl
 4d2:	3c 0d                	cmp    $0xd,%al
 4d4:	0f 94 c0             	sete   %al
 4d7:	08 c2                	or     %al,%dl
 4d9:	74 ca                	je     4a5 <gets+0x11>
    buf[i++] = c;
 4db:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 4dd:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 4e1:	89 f8                	mov    %edi,%eax
 4e3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4e6:	5b                   	pop    %ebx
 4e7:	5e                   	pop    %esi
 4e8:	5f                   	pop    %edi
 4e9:	5d                   	pop    %ebp
 4ea:	c3                   	ret    

000004eb <stat>:

int
stat(const char *n, struct stat *st)
{
 4eb:	55                   	push   %ebp
 4ec:	89 e5                	mov    %esp,%ebp
 4ee:	56                   	push   %esi
 4ef:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4f0:	83 ec 08             	sub    $0x8,%esp
 4f3:	6a 00                	push   $0x0
 4f5:	ff 75 08             	push   0x8(%ebp)
 4f8:	e8 d6 00 00 00       	call   5d3 <open>
  if(fd < 0)
 4fd:	83 c4 10             	add    $0x10,%esp
 500:	85 c0                	test   %eax,%eax
 502:	78 24                	js     528 <stat+0x3d>
 504:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 506:	83 ec 08             	sub    $0x8,%esp
 509:	ff 75 0c             	push   0xc(%ebp)
 50c:	50                   	push   %eax
 50d:	e8 d9 00 00 00       	call   5eb <fstat>
 512:	89 c6                	mov    %eax,%esi
  close(fd);
 514:	89 1c 24             	mov    %ebx,(%esp)
 517:	e8 9f 00 00 00       	call   5bb <close>
  return r;
 51c:	83 c4 10             	add    $0x10,%esp
}
 51f:	89 f0                	mov    %esi,%eax
 521:	8d 65 f8             	lea    -0x8(%ebp),%esp
 524:	5b                   	pop    %ebx
 525:	5e                   	pop    %esi
 526:	5d                   	pop    %ebp
 527:	c3                   	ret    
    return -1;
 528:	be ff ff ff ff       	mov    $0xffffffff,%esi
 52d:	eb f0                	jmp    51f <stat+0x34>

0000052f <atoi>:

int
atoi(const char *s)
{
 52f:	55                   	push   %ebp
 530:	89 e5                	mov    %esp,%ebp
 532:	53                   	push   %ebx
 533:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 536:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 53b:	eb 10                	jmp    54d <atoi+0x1e>
    n = n*10 + *s++ - '0';
 53d:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 540:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 543:	83 c1 01             	add    $0x1,%ecx
 546:	0f be c0             	movsbl %al,%eax
 549:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 54d:	0f b6 01             	movzbl (%ecx),%eax
 550:	8d 58 d0             	lea    -0x30(%eax),%ebx
 553:	80 fb 09             	cmp    $0x9,%bl
 556:	76 e5                	jbe    53d <atoi+0xe>
  return n;
}
 558:	89 d0                	mov    %edx,%eax
 55a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 55d:	c9                   	leave  
 55e:	c3                   	ret    

0000055f <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 55f:	55                   	push   %ebp
 560:	89 e5                	mov    %esp,%ebp
 562:	56                   	push   %esi
 563:	53                   	push   %ebx
 564:	8b 75 08             	mov    0x8(%ebp),%esi
 567:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 56a:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 56d:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 56f:	eb 0d                	jmp    57e <memmove+0x1f>
    *dst++ = *src++;
 571:	0f b6 01             	movzbl (%ecx),%eax
 574:	88 02                	mov    %al,(%edx)
 576:	8d 49 01             	lea    0x1(%ecx),%ecx
 579:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 57c:	89 d8                	mov    %ebx,%eax
 57e:	8d 58 ff             	lea    -0x1(%eax),%ebx
 581:	85 c0                	test   %eax,%eax
 583:	7f ec                	jg     571 <memmove+0x12>
  return vdst;
}
 585:	89 f0                	mov    %esi,%eax
 587:	5b                   	pop    %ebx
 588:	5e                   	pop    %esi
 589:	5d                   	pop    %ebp
 58a:	c3                   	ret    

0000058b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 58b:	b8 01 00 00 00       	mov    $0x1,%eax
 590:	cd 40                	int    $0x40
 592:	c3                   	ret    

00000593 <exit>:
SYSCALL(exit)
 593:	b8 02 00 00 00       	mov    $0x2,%eax
 598:	cd 40                	int    $0x40
 59a:	c3                   	ret    

0000059b <wait>:
SYSCALL(wait)
 59b:	b8 03 00 00 00       	mov    $0x3,%eax
 5a0:	cd 40                	int    $0x40
 5a2:	c3                   	ret    

000005a3 <pipe>:
SYSCALL(pipe)
 5a3:	b8 04 00 00 00       	mov    $0x4,%eax
 5a8:	cd 40                	int    $0x40
 5aa:	c3                   	ret    

000005ab <read>:
SYSCALL(read)
 5ab:	b8 05 00 00 00       	mov    $0x5,%eax
 5b0:	cd 40                	int    $0x40
 5b2:	c3                   	ret    

000005b3 <write>:
SYSCALL(write)
 5b3:	b8 10 00 00 00       	mov    $0x10,%eax
 5b8:	cd 40                	int    $0x40
 5ba:	c3                   	ret    

000005bb <close>:
SYSCALL(close)
 5bb:	b8 15 00 00 00       	mov    $0x15,%eax
 5c0:	cd 40                	int    $0x40
 5c2:	c3                   	ret    

000005c3 <kill>:
SYSCALL(kill)
 5c3:	b8 06 00 00 00       	mov    $0x6,%eax
 5c8:	cd 40                	int    $0x40
 5ca:	c3                   	ret    

000005cb <exec>:
SYSCALL(exec)
 5cb:	b8 07 00 00 00       	mov    $0x7,%eax
 5d0:	cd 40                	int    $0x40
 5d2:	c3                   	ret    

000005d3 <open>:
SYSCALL(open)
 5d3:	b8 0f 00 00 00       	mov    $0xf,%eax
 5d8:	cd 40                	int    $0x40
 5da:	c3                   	ret    

000005db <mknod>:
SYSCALL(mknod)
 5db:	b8 11 00 00 00       	mov    $0x11,%eax
 5e0:	cd 40                	int    $0x40
 5e2:	c3                   	ret    

000005e3 <unlink>:
SYSCALL(unlink)
 5e3:	b8 12 00 00 00       	mov    $0x12,%eax
 5e8:	cd 40                	int    $0x40
 5ea:	c3                   	ret    

000005eb <fstat>:
SYSCALL(fstat)
 5eb:	b8 08 00 00 00       	mov    $0x8,%eax
 5f0:	cd 40                	int    $0x40
 5f2:	c3                   	ret    

000005f3 <link>:
SYSCALL(link)
 5f3:	b8 13 00 00 00       	mov    $0x13,%eax
 5f8:	cd 40                	int    $0x40
 5fa:	c3                   	ret    

000005fb <mkdir>:
SYSCALL(mkdir)
 5fb:	b8 14 00 00 00       	mov    $0x14,%eax
 600:	cd 40                	int    $0x40
 602:	c3                   	ret    

00000603 <chdir>:
SYSCALL(chdir)
 603:	b8 09 00 00 00       	mov    $0x9,%eax
 608:	cd 40                	int    $0x40
 60a:	c3                   	ret    

0000060b <dup>:
SYSCALL(dup)
 60b:	b8 0a 00 00 00       	mov    $0xa,%eax
 610:	cd 40                	int    $0x40
 612:	c3                   	ret    

00000613 <getpid>:
SYSCALL(getpid)
 613:	b8 0b 00 00 00       	mov    $0xb,%eax
 618:	cd 40                	int    $0x40
 61a:	c3                   	ret    

0000061b <sbrk>:
SYSCALL(sbrk)
 61b:	b8 0c 00 00 00       	mov    $0xc,%eax
 620:	cd 40                	int    $0x40
 622:	c3                   	ret    

00000623 <sleep>:
SYSCALL(sleep)
 623:	b8 0d 00 00 00       	mov    $0xd,%eax
 628:	cd 40                	int    $0x40
 62a:	c3                   	ret    

0000062b <uptime>:
SYSCALL(uptime)
 62b:	b8 0e 00 00 00       	mov    $0xe,%eax
 630:	cd 40                	int    $0x40
 632:	c3                   	ret    

00000633 <clone>:
SYSCALL(clone)
 633:	b8 16 00 00 00       	mov    $0x16,%eax
 638:	cd 40                	int    $0x40
 63a:	c3                   	ret    

0000063b <join>:
 63b:	b8 17 00 00 00       	mov    $0x17,%eax
 640:	cd 40                	int    $0x40
 642:	c3                   	ret    

00000643 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 643:	55                   	push   %ebp
 644:	89 e5                	mov    %esp,%ebp
 646:	83 ec 1c             	sub    $0x1c,%esp
 649:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 64c:	6a 01                	push   $0x1
 64e:	8d 55 f4             	lea    -0xc(%ebp),%edx
 651:	52                   	push   %edx
 652:	50                   	push   %eax
 653:	e8 5b ff ff ff       	call   5b3 <write>
}
 658:	83 c4 10             	add    $0x10,%esp
 65b:	c9                   	leave  
 65c:	c3                   	ret    

0000065d <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 65d:	55                   	push   %ebp
 65e:	89 e5                	mov    %esp,%ebp
 660:	57                   	push   %edi
 661:	56                   	push   %esi
 662:	53                   	push   %ebx
 663:	83 ec 2c             	sub    $0x2c,%esp
 666:	89 45 d0             	mov    %eax,-0x30(%ebp)
 669:	89 d0                	mov    %edx,%eax
 66b:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 66d:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 671:	0f 95 c1             	setne  %cl
 674:	c1 ea 1f             	shr    $0x1f,%edx
 677:	84 d1                	test   %dl,%cl
 679:	74 44                	je     6bf <printint+0x62>
    neg = 1;
    x = -xx;
 67b:	f7 d8                	neg    %eax
 67d:	89 c1                	mov    %eax,%ecx
    neg = 1;
 67f:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 686:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 68b:	89 c8                	mov    %ecx,%eax
 68d:	ba 00 00 00 00       	mov    $0x0,%edx
 692:	f7 f6                	div    %esi
 694:	89 df                	mov    %ebx,%edi
 696:	83 c3 01             	add    $0x1,%ebx
 699:	0f b6 92 b4 0a 00 00 	movzbl 0xab4(%edx),%edx
 6a0:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 6a4:	89 ca                	mov    %ecx,%edx
 6a6:	89 c1                	mov    %eax,%ecx
 6a8:	39 d6                	cmp    %edx,%esi
 6aa:	76 df                	jbe    68b <printint+0x2e>
  if(neg)
 6ac:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 6b0:	74 31                	je     6e3 <printint+0x86>
    buf[i++] = '-';
 6b2:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 6b7:	8d 5f 02             	lea    0x2(%edi),%ebx
 6ba:	8b 75 d0             	mov    -0x30(%ebp),%esi
 6bd:	eb 17                	jmp    6d6 <printint+0x79>
    x = xx;
 6bf:	89 c1                	mov    %eax,%ecx
  neg = 0;
 6c1:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 6c8:	eb bc                	jmp    686 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 6ca:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 6cf:	89 f0                	mov    %esi,%eax
 6d1:	e8 6d ff ff ff       	call   643 <putc>
  while(--i >= 0)
 6d6:	83 eb 01             	sub    $0x1,%ebx
 6d9:	79 ef                	jns    6ca <printint+0x6d>
}
 6db:	83 c4 2c             	add    $0x2c,%esp
 6de:	5b                   	pop    %ebx
 6df:	5e                   	pop    %esi
 6e0:	5f                   	pop    %edi
 6e1:	5d                   	pop    %ebp
 6e2:	c3                   	ret    
 6e3:	8b 75 d0             	mov    -0x30(%ebp),%esi
 6e6:	eb ee                	jmp    6d6 <printint+0x79>

000006e8 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 6e8:	55                   	push   %ebp
 6e9:	89 e5                	mov    %esp,%ebp
 6eb:	57                   	push   %edi
 6ec:	56                   	push   %esi
 6ed:	53                   	push   %ebx
 6ee:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 6f1:	8d 45 10             	lea    0x10(%ebp),%eax
 6f4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 6f7:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 6fc:	bb 00 00 00 00       	mov    $0x0,%ebx
 701:	eb 14                	jmp    717 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 703:	89 fa                	mov    %edi,%edx
 705:	8b 45 08             	mov    0x8(%ebp),%eax
 708:	e8 36 ff ff ff       	call   643 <putc>
 70d:	eb 05                	jmp    714 <printf+0x2c>
      }
    } else if(state == '%'){
 70f:	83 fe 25             	cmp    $0x25,%esi
 712:	74 25                	je     739 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 714:	83 c3 01             	add    $0x1,%ebx
 717:	8b 45 0c             	mov    0xc(%ebp),%eax
 71a:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 71e:	84 c0                	test   %al,%al
 720:	0f 84 20 01 00 00    	je     846 <printf+0x15e>
    c = fmt[i] & 0xff;
 726:	0f be f8             	movsbl %al,%edi
 729:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 72c:	85 f6                	test   %esi,%esi
 72e:	75 df                	jne    70f <printf+0x27>
      if(c == '%'){
 730:	83 f8 25             	cmp    $0x25,%eax
 733:	75 ce                	jne    703 <printf+0x1b>
        state = '%';
 735:	89 c6                	mov    %eax,%esi
 737:	eb db                	jmp    714 <printf+0x2c>
      if(c == 'd'){
 739:	83 f8 25             	cmp    $0x25,%eax
 73c:	0f 84 cf 00 00 00    	je     811 <printf+0x129>
 742:	0f 8c dd 00 00 00    	jl     825 <printf+0x13d>
 748:	83 f8 78             	cmp    $0x78,%eax
 74b:	0f 8f d4 00 00 00    	jg     825 <printf+0x13d>
 751:	83 f8 63             	cmp    $0x63,%eax
 754:	0f 8c cb 00 00 00    	jl     825 <printf+0x13d>
 75a:	83 e8 63             	sub    $0x63,%eax
 75d:	83 f8 15             	cmp    $0x15,%eax
 760:	0f 87 bf 00 00 00    	ja     825 <printf+0x13d>
 766:	ff 24 85 5c 0a 00 00 	jmp    *0xa5c(,%eax,4)
        printint(fd, *ap, 10, 1);
 76d:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 770:	8b 17                	mov    (%edi),%edx
 772:	83 ec 0c             	sub    $0xc,%esp
 775:	6a 01                	push   $0x1
 777:	b9 0a 00 00 00       	mov    $0xa,%ecx
 77c:	8b 45 08             	mov    0x8(%ebp),%eax
 77f:	e8 d9 fe ff ff       	call   65d <printint>
        ap++;
 784:	83 c7 04             	add    $0x4,%edi
 787:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 78a:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 78d:	be 00 00 00 00       	mov    $0x0,%esi
 792:	eb 80                	jmp    714 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 794:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 797:	8b 17                	mov    (%edi),%edx
 799:	83 ec 0c             	sub    $0xc,%esp
 79c:	6a 00                	push   $0x0
 79e:	b9 10 00 00 00       	mov    $0x10,%ecx
 7a3:	8b 45 08             	mov    0x8(%ebp),%eax
 7a6:	e8 b2 fe ff ff       	call   65d <printint>
        ap++;
 7ab:	83 c7 04             	add    $0x4,%edi
 7ae:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 7b1:	83 c4 10             	add    $0x10,%esp
      state = 0;
 7b4:	be 00 00 00 00       	mov    $0x0,%esi
 7b9:	e9 56 ff ff ff       	jmp    714 <printf+0x2c>
        s = (char*)*ap;
 7be:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 7c1:	8b 30                	mov    (%eax),%esi
        ap++;
 7c3:	83 c0 04             	add    $0x4,%eax
 7c6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 7c9:	85 f6                	test   %esi,%esi
 7cb:	75 15                	jne    7e2 <printf+0xfa>
          s = "(null)";
 7cd:	be 54 0a 00 00       	mov    $0xa54,%esi
 7d2:	eb 0e                	jmp    7e2 <printf+0xfa>
          putc(fd, *s);
 7d4:	0f be d2             	movsbl %dl,%edx
 7d7:	8b 45 08             	mov    0x8(%ebp),%eax
 7da:	e8 64 fe ff ff       	call   643 <putc>
          s++;
 7df:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 7e2:	0f b6 16             	movzbl (%esi),%edx
 7e5:	84 d2                	test   %dl,%dl
 7e7:	75 eb                	jne    7d4 <printf+0xec>
      state = 0;
 7e9:	be 00 00 00 00       	mov    $0x0,%esi
 7ee:	e9 21 ff ff ff       	jmp    714 <printf+0x2c>
        putc(fd, *ap);
 7f3:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7f6:	0f be 17             	movsbl (%edi),%edx
 7f9:	8b 45 08             	mov    0x8(%ebp),%eax
 7fc:	e8 42 fe ff ff       	call   643 <putc>
        ap++;
 801:	83 c7 04             	add    $0x4,%edi
 804:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 807:	be 00 00 00 00       	mov    $0x0,%esi
 80c:	e9 03 ff ff ff       	jmp    714 <printf+0x2c>
        putc(fd, c);
 811:	89 fa                	mov    %edi,%edx
 813:	8b 45 08             	mov    0x8(%ebp),%eax
 816:	e8 28 fe ff ff       	call   643 <putc>
      state = 0;
 81b:	be 00 00 00 00       	mov    $0x0,%esi
 820:	e9 ef fe ff ff       	jmp    714 <printf+0x2c>
        putc(fd, '%');
 825:	ba 25 00 00 00       	mov    $0x25,%edx
 82a:	8b 45 08             	mov    0x8(%ebp),%eax
 82d:	e8 11 fe ff ff       	call   643 <putc>
        putc(fd, c);
 832:	89 fa                	mov    %edi,%edx
 834:	8b 45 08             	mov    0x8(%ebp),%eax
 837:	e8 07 fe ff ff       	call   643 <putc>
      state = 0;
 83c:	be 00 00 00 00       	mov    $0x0,%esi
 841:	e9 ce fe ff ff       	jmp    714 <printf+0x2c>
    }
  }
}
 846:	8d 65 f4             	lea    -0xc(%ebp),%esp
 849:	5b                   	pop    %ebx
 84a:	5e                   	pop    %esi
 84b:	5f                   	pop    %edi
 84c:	5d                   	pop    %ebp
 84d:	c3                   	ret    

0000084e <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 84e:	55                   	push   %ebp
 84f:	89 e5                	mov    %esp,%ebp
 851:	57                   	push   %edi
 852:	56                   	push   %esi
 853:	53                   	push   %ebx
 854:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 857:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 85a:	a1 30 0e 00 00       	mov    0xe30,%eax
 85f:	eb 02                	jmp    863 <free+0x15>
 861:	89 d0                	mov    %edx,%eax
 863:	39 c8                	cmp    %ecx,%eax
 865:	73 04                	jae    86b <free+0x1d>
 867:	39 08                	cmp    %ecx,(%eax)
 869:	77 12                	ja     87d <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 86b:	8b 10                	mov    (%eax),%edx
 86d:	39 c2                	cmp    %eax,%edx
 86f:	77 f0                	ja     861 <free+0x13>
 871:	39 c8                	cmp    %ecx,%eax
 873:	72 08                	jb     87d <free+0x2f>
 875:	39 ca                	cmp    %ecx,%edx
 877:	77 04                	ja     87d <free+0x2f>
 879:	89 d0                	mov    %edx,%eax
 87b:	eb e6                	jmp    863 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 87d:	8b 73 fc             	mov    -0x4(%ebx),%esi
 880:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 883:	8b 10                	mov    (%eax),%edx
 885:	39 d7                	cmp    %edx,%edi
 887:	74 19                	je     8a2 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 889:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 88c:	8b 50 04             	mov    0x4(%eax),%edx
 88f:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 892:	39 ce                	cmp    %ecx,%esi
 894:	74 1b                	je     8b1 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 896:	89 08                	mov    %ecx,(%eax)
  freep = p;
 898:	a3 30 0e 00 00       	mov    %eax,0xe30
}
 89d:	5b                   	pop    %ebx
 89e:	5e                   	pop    %esi
 89f:	5f                   	pop    %edi
 8a0:	5d                   	pop    %ebp
 8a1:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 8a2:	03 72 04             	add    0x4(%edx),%esi
 8a5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 8a8:	8b 10                	mov    (%eax),%edx
 8aa:	8b 12                	mov    (%edx),%edx
 8ac:	89 53 f8             	mov    %edx,-0x8(%ebx)
 8af:	eb db                	jmp    88c <free+0x3e>
    p->s.size += bp->s.size;
 8b1:	03 53 fc             	add    -0x4(%ebx),%edx
 8b4:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 8b7:	8b 53 f8             	mov    -0x8(%ebx),%edx
 8ba:	89 10                	mov    %edx,(%eax)
 8bc:	eb da                	jmp    898 <free+0x4a>

000008be <morecore>:

static Header*
morecore(uint nu)
{
 8be:	55                   	push   %ebp
 8bf:	89 e5                	mov    %esp,%ebp
 8c1:	53                   	push   %ebx
 8c2:	83 ec 04             	sub    $0x4,%esp
 8c5:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 8c7:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 8cc:	77 05                	ja     8d3 <morecore+0x15>
    nu = 4096;
 8ce:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 8d3:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 8da:	83 ec 0c             	sub    $0xc,%esp
 8dd:	50                   	push   %eax
 8de:	e8 38 fd ff ff       	call   61b <sbrk>
  if(p == (char*)-1)
 8e3:	83 c4 10             	add    $0x10,%esp
 8e6:	83 f8 ff             	cmp    $0xffffffff,%eax
 8e9:	74 1c                	je     907 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 8eb:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 8ee:	83 c0 08             	add    $0x8,%eax
 8f1:	83 ec 0c             	sub    $0xc,%esp
 8f4:	50                   	push   %eax
 8f5:	e8 54 ff ff ff       	call   84e <free>
  return freep;
 8fa:	a1 30 0e 00 00       	mov    0xe30,%eax
 8ff:	83 c4 10             	add    $0x10,%esp
}
 902:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 905:	c9                   	leave  
 906:	c3                   	ret    
    return 0;
 907:	b8 00 00 00 00       	mov    $0x0,%eax
 90c:	eb f4                	jmp    902 <morecore+0x44>

0000090e <malloc>:

void*
malloc(uint nbytes)
{
 90e:	55                   	push   %ebp
 90f:	89 e5                	mov    %esp,%ebp
 911:	53                   	push   %ebx
 912:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 915:	8b 45 08             	mov    0x8(%ebp),%eax
 918:	8d 58 07             	lea    0x7(%eax),%ebx
 91b:	c1 eb 03             	shr    $0x3,%ebx
 91e:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 921:	8b 0d 30 0e 00 00    	mov    0xe30,%ecx
 927:	85 c9                	test   %ecx,%ecx
 929:	74 04                	je     92f <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 92b:	8b 01                	mov    (%ecx),%eax
 92d:	eb 4a                	jmp    979 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 92f:	c7 05 30 0e 00 00 34 	movl   $0xe34,0xe30
 936:	0e 00 00 
 939:	c7 05 34 0e 00 00 34 	movl   $0xe34,0xe34
 940:	0e 00 00 
    base.s.size = 0;
 943:	c7 05 38 0e 00 00 00 	movl   $0x0,0xe38
 94a:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 94d:	b9 34 0e 00 00       	mov    $0xe34,%ecx
 952:	eb d7                	jmp    92b <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 954:	74 19                	je     96f <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 956:	29 da                	sub    %ebx,%edx
 958:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 95b:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 95e:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 961:	89 0d 30 0e 00 00    	mov    %ecx,0xe30
      return (void*)(p + 1);
 967:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 96a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 96d:	c9                   	leave  
 96e:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 96f:	8b 10                	mov    (%eax),%edx
 971:	89 11                	mov    %edx,(%ecx)
 973:	eb ec                	jmp    961 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 975:	89 c1                	mov    %eax,%ecx
 977:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 979:	8b 50 04             	mov    0x4(%eax),%edx
 97c:	39 da                	cmp    %ebx,%edx
 97e:	73 d4                	jae    954 <malloc+0x46>
    if(p == freep)
 980:	39 05 30 0e 00 00    	cmp    %eax,0xe30
 986:	75 ed                	jne    975 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 988:	89 d8                	mov    %ebx,%eax
 98a:	e8 2f ff ff ff       	call   8be <morecore>
 98f:	85 c0                	test   %eax,%eax
 991:	75 e2                	jne    975 <malloc+0x67>
 993:	eb d5                	jmp    96a <malloc+0x5c>
