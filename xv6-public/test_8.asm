
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
  1c:	a1 64 0e 00 00       	mov    0xe64,%eax
  21:	83 f8 01             	cmp    $0x1,%eax
  24:	0f 84 db 00 00 00    	je     105 <worker+0x105>
  2a:	6a 3b                	push   $0x3b
  2c:	68 c4 09 00 00       	push   $0x9c4
  31:	68 cd 09 00 00       	push   $0x9cd
  36:	6a 01                	push   $0x1
  38:	e8 d7 06 00 00       	call   714 <printf>
  3d:	83 c4 0c             	add    $0xc,%esp
  40:	68 0c 0a 00 00       	push   $0xa0c
  45:	68 e0 09 00 00       	push   $0x9e0
  4a:	6a 01                	push   $0x1
  4c:	e8 c3 06 00 00       	call   714 <printf>
  51:	83 c4 08             	add    $0x8,%esp
  54:	68 f4 09 00 00       	push   $0x9f4
  59:	6a 01                	push   $0x1
  5b:	e8 b4 06 00 00       	call   714 <printf>
  60:	83 c4 04             	add    $0x4,%esp
  63:	ff 35 68 0e 00 00    	push   0xe68
  69:	e8 81 05 00 00       	call   5ef <kill>
  6e:	e8 4c 05 00 00       	call   5bf <exit>
   assert(tmp1 == 42);
  73:	6a 39                	push   $0x39
  75:	68 c4 09 00 00       	push   $0x9c4
  7a:	68 cd 09 00 00       	push   $0x9cd
  7f:	6a 01                	push   $0x1
  81:	e8 8e 06 00 00       	call   714 <printf>
  86:	83 c4 0c             	add    $0xc,%esp
  89:	68 d5 09 00 00       	push   $0x9d5
  8e:	68 e0 09 00 00       	push   $0x9e0
  93:	6a 01                	push   $0x1
  95:	e8 7a 06 00 00       	call   714 <printf>
  9a:	83 c4 08             	add    $0x8,%esp
  9d:	68 f4 09 00 00       	push   $0x9f4
  a2:	6a 01                	push   $0x1
  a4:	e8 6b 06 00 00       	call   714 <printf>
  a9:	83 c4 04             	add    $0x4,%esp
  ac:	ff 35 68 0e 00 00    	push   0xe68
  b2:	e8 38 05 00 00       	call   5ef <kill>
  b7:	e8 03 05 00 00       	call   5bf <exit>
   assert(tmp2 == 24);
  bc:	6a 3a                	push   $0x3a
  be:	68 c4 09 00 00       	push   $0x9c4
  c3:	68 cd 09 00 00       	push   $0x9cd
  c8:	6a 01                	push   $0x1
  ca:	e8 45 06 00 00       	call   714 <printf>
  cf:	83 c4 0c             	add    $0xc,%esp
  d2:	68 01 0a 00 00       	push   $0xa01
  d7:	68 e0 09 00 00       	push   $0x9e0
  dc:	6a 01                	push   $0x1
  de:	e8 31 06 00 00       	call   714 <printf>
  e3:	83 c4 08             	add    $0x8,%esp
  e6:	68 f4 09 00 00       	push   $0x9f4
  eb:	6a 01                	push   $0x1
  ed:	e8 22 06 00 00       	call   714 <printf>
  f2:	83 c4 04             	add    $0x4,%esp
  f5:	ff 35 68 0e 00 00    	push   0xe68
  fb:	e8 ef 04 00 00       	call   5ef <kill>
 100:	e8 ba 04 00 00       	call   5bf <exit>
   global++;
 105:	83 c0 01             	add    $0x1,%eax
 108:	a3 64 0e 00 00       	mov    %eax,0xe64
   exit();
 10d:	e8 ad 04 00 00       	call   5bf <exit>

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
 126:	e8 14 05 00 00       	call   63f <getpid>
 12b:	a3 68 0e 00 00       	mov    %eax,0xe68
   void *stack, *p = malloc(PGSIZE * 2);
 130:	83 ec 0c             	sub    $0xc,%esp
 133:	68 00 20 00 00       	push   $0x2000
 138:	e8 fd 07 00 00       	call   93a <malloc>
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
 15a:	68 c4 09 00 00       	push   $0x9c4
 15f:	68 cd 09 00 00       	push   $0x9cd
 164:	6a 01                	push   $0x1
 166:	e8 a9 05 00 00       	call   714 <printf>
 16b:	83 c4 0c             	add    $0xc,%esp
 16e:	68 18 0a 00 00       	push   $0xa18
 173:	68 e0 09 00 00       	push   $0x9e0
 178:	6a 01                	push   $0x1
 17a:	e8 95 05 00 00       	call   714 <printf>
 17f:	83 c4 08             	add    $0x8,%esp
 182:	68 f4 09 00 00       	push   $0x9f4
 187:	6a 01                	push   $0x1
 189:	e8 86 05 00 00       	call   714 <printf>
 18e:	83 c4 04             	add    $0x4,%esp
 191:	ff 35 68 0e 00 00    	push   0xe68
 197:	e8 53 04 00 00       	call   5ef <kill>
 19c:	e8 1e 04 00 00       	call   5bf <exit>
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
 1bf:	e8 9b 04 00 00       	call   65f <clone>
 1c4:	89 c6                	mov    %eax,%esi
   assert(clone_pid > 0);
 1c6:	83 c4 10             	add    $0x10,%esp
 1c9:	85 c0                	test   %eax,%eax
 1cb:	7e 67                	jle    234 <main+0x122>
   sleep(250);
 1cd:	83 ec 0c             	sub    $0xc,%esp
 1d0:	68 fa 00 00 00       	push   $0xfa
 1d5:	e8 75 04 00 00       	call   64f <sleep>
   assert(wait() == -1);
 1da:	e8 e8 03 00 00       	call   5c7 <wait>
 1df:	83 c4 10             	add    $0x10,%esp
 1e2:	83 f8 ff             	cmp    $0xffffffff,%eax
 1e5:	0f 84 92 00 00 00    	je     27d <main+0x16b>
 1eb:	6a 28                	push   $0x28
 1ed:	68 c4 09 00 00       	push   $0x9c4
 1f2:	68 cd 09 00 00       	push   $0x9cd
 1f7:	6a 01                	push   $0x1
 1f9:	e8 16 05 00 00       	call   714 <printf>
 1fe:	83 c4 0c             	add    $0xc,%esp
 201:	68 30 0a 00 00       	push   $0xa30
 206:	68 e0 09 00 00       	push   $0x9e0
 20b:	6a 01                	push   $0x1
 20d:	e8 02 05 00 00       	call   714 <printf>
 212:	83 c4 08             	add    $0x8,%esp
 215:	68 f4 09 00 00       	push   $0x9f4
 21a:	6a 01                	push   $0x1
 21c:	e8 f3 04 00 00       	call   714 <printf>
 221:	83 c4 04             	add    $0x4,%esp
 224:	ff 35 68 0e 00 00    	push   0xe68
 22a:	e8 c0 03 00 00       	call   5ef <kill>
 22f:	e8 8b 03 00 00       	call   5bf <exit>
   assert(clone_pid > 0);
 234:	6a 25                	push   $0x25
 236:	68 c4 09 00 00       	push   $0x9c4
 23b:	68 cd 09 00 00       	push   $0x9cd
 240:	6a 01                	push   $0x1
 242:	e8 cd 04 00 00       	call   714 <printf>
 247:	83 c4 0c             	add    $0xc,%esp
 24a:	68 22 0a 00 00       	push   $0xa22
 24f:	68 e0 09 00 00       	push   $0x9e0
 254:	6a 01                	push   $0x1
 256:	e8 b9 04 00 00       	call   714 <printf>
 25b:	83 c4 08             	add    $0x8,%esp
 25e:	68 f4 09 00 00       	push   $0x9f4
 263:	6a 01                	push   $0x1
 265:	e8 aa 04 00 00       	call   714 <printf>
 26a:	83 c4 04             	add    $0x4,%esp
 26d:	ff 35 68 0e 00 00    	push   0xe68
 273:	e8 77 03 00 00       	call   5ef <kill>
 278:	e8 42 03 00 00       	call   5bf <exit>
   int join_pid = join(&join_stack);
 27d:	83 ec 0c             	sub    $0xc,%esp
 280:	8d 45 dc             	lea    -0x24(%ebp),%eax
 283:	50                   	push   %eax
 284:	e8 de 03 00 00       	call   667 <join>
   assert(join_pid == clone_pid);
 289:	83 c4 10             	add    $0x10,%esp
 28c:	39 c6                	cmp    %eax,%esi
 28e:	75 52                	jne    2e2 <main+0x1d0>
   assert(stack == join_stack);
 290:	39 7d dc             	cmp    %edi,-0x24(%ebp)
 293:	0f 84 92 00 00 00    	je     32b <main+0x219>
 299:	6a 2d                	push   $0x2d
 29b:	68 c4 09 00 00       	push   $0x9c4
 2a0:	68 cd 09 00 00       	push   $0x9cd
 2a5:	6a 01                	push   $0x1
 2a7:	e8 68 04 00 00       	call   714 <printf>
 2ac:	83 c4 0c             	add    $0xc,%esp
 2af:	68 53 0a 00 00       	push   $0xa53
 2b4:	68 e0 09 00 00       	push   $0x9e0
 2b9:	6a 01                	push   $0x1
 2bb:	e8 54 04 00 00       	call   714 <printf>
 2c0:	83 c4 08             	add    $0x8,%esp
 2c3:	68 f4 09 00 00       	push   $0x9f4
 2c8:	6a 01                	push   $0x1
 2ca:	e8 45 04 00 00       	call   714 <printf>
 2cf:	83 c4 04             	add    $0x4,%esp
 2d2:	ff 35 68 0e 00 00    	push   0xe68
 2d8:	e8 12 03 00 00       	call   5ef <kill>
 2dd:	e8 dd 02 00 00       	call   5bf <exit>
   assert(join_pid == clone_pid);
 2e2:	6a 2c                	push   $0x2c
 2e4:	68 c4 09 00 00       	push   $0x9c4
 2e9:	68 cd 09 00 00       	push   $0x9cd
 2ee:	6a 01                	push   $0x1
 2f0:	e8 1f 04 00 00       	call   714 <printf>
 2f5:	83 c4 0c             	add    $0xc,%esp
 2f8:	68 3d 0a 00 00       	push   $0xa3d
 2fd:	68 e0 09 00 00       	push   $0x9e0
 302:	6a 01                	push   $0x1
 304:	e8 0b 04 00 00       	call   714 <printf>
 309:	83 c4 08             	add    $0x8,%esp
 30c:	68 f4 09 00 00       	push   $0x9f4
 311:	6a 01                	push   $0x1
 313:	e8 fc 03 00 00       	call   714 <printf>
 318:	83 c4 04             	add    $0x4,%esp
 31b:	ff 35 68 0e 00 00    	push   0xe68
 321:	e8 c9 02 00 00       	call   5ef <kill>
 326:	e8 94 02 00 00       	call   5bf <exit>
   assert(global == 2);
 32b:	83 3d 64 0e 00 00 02 	cmpl   $0x2,0xe64
 332:	74 49                	je     37d <main+0x26b>
 334:	6a 2e                	push   $0x2e
 336:	68 c4 09 00 00       	push   $0x9c4
 33b:	68 cd 09 00 00       	push   $0x9cd
 340:	6a 01                	push   $0x1
 342:	e8 cd 03 00 00       	call   714 <printf>
 347:	83 c4 0c             	add    $0xc,%esp
 34a:	68 67 0a 00 00       	push   $0xa67
 34f:	68 e0 09 00 00       	push   $0x9e0
 354:	6a 01                	push   $0x1
 356:	e8 b9 03 00 00       	call   714 <printf>
 35b:	83 c4 08             	add    $0x8,%esp
 35e:	68 f4 09 00 00       	push   $0x9f4
 363:	6a 01                	push   $0x1
 365:	e8 aa 03 00 00       	call   714 <printf>
 36a:	83 c4 04             	add    $0x4,%esp
 36d:	ff 35 68 0e 00 00    	push   0xe68
 373:	e8 77 02 00 00       	call   5ef <kill>
 378:	e8 42 02 00 00       	call   5bf <exit>
   printf(1, "TEST PASSED\n");
 37d:	83 ec 08             	sub    $0x8,%esp
 380:	68 73 0a 00 00       	push   $0xa73
 385:	6a 01                	push   $0x1
 387:	e8 88 03 00 00       	call   714 <printf>
   free(p);
 38c:	89 1c 24             	mov    %ebx,(%esp)
 38f:	e8 e6 04 00 00       	call   87a <free>
   exit();
 394:	e8 26 02 00 00       	call   5bf <exit>

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

// a wrapper func for clone
int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 3aa:	55                   	push   %ebp
 3ab:	89 e5                	mov    %esp,%ebp
 3ad:	83 ec 14             	sub    $0x14,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE);
 3b0:	68 00 10 00 00       	push   $0x1000
 3b5:	e8 80 05 00 00       	call   93a <malloc>
  if(n_stack == 0){
 3ba:	83 c4 10             	add    $0x10,%esp
 3bd:	85 c0                	test   %eax,%eax
 3bf:	74 14                	je     3d5 <thread_create+0x2b>
    return -1;
  }
  int new_pid = clone(start_routine, arg1, arg2, n_stack); // TODO: is this the right way to call it?
 3c1:	50                   	push   %eax
 3c2:	ff 75 10             	push   0x10(%ebp)
 3c5:	ff 75 0c             	push   0xc(%ebp)
 3c8:	ff 75 08             	push   0x8(%ebp)
 3cb:	e8 8f 02 00 00       	call   65f <clone>


  // I can't remember if there was something else to do here but I'm sure I'll find out


  return new_pid;
 3d0:	83 c4 10             	add    $0x10,%esp
}
 3d3:	c9                   	leave  
 3d4:	c3                   	ret    
    return -1;
 3d5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 3da:	eb f7                	jmp    3d3 <thread_create+0x29>

000003dc <thread_join>:

int thread_join() {
  return 0;
}
 3dc:	b8 00 00 00 00       	mov    $0x0,%eax
 3e1:	c3                   	ret    

000003e2 <lock_acquire>:

void lock_acquire(lock_t *lock){
 3e2:	55                   	push   %ebp
 3e3:	89 e5                	mov    %esp,%ebp
 3e5:	53                   	push   %ebx
 3e6:	83 ec 04             	sub    $0x4,%esp
 3e9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 3ec:	83 ec 08             	sub    $0x8,%esp
 3ef:	6a 01                	push   $0x1
 3f1:	53                   	push   %ebx
 3f2:	e8 a2 ff ff ff       	call   399 <test_and_set>
 3f7:	83 c4 10             	add    $0x10,%esp
 3fa:	83 f8 01             	cmp    $0x1,%eax
 3fd:	74 ed                	je     3ec <lock_acquire+0xa>
    ;
}
 3ff:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 402:	c9                   	leave  
 403:	c3                   	ret    

00000404 <lock_release>:

void lock_release(lock_t *lock) {
 404:	55                   	push   %ebp
 405:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 407:	8b 45 08             	mov    0x8(%ebp),%eax
 40a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 410:	5d                   	pop    %ebp
 411:	c3                   	ret    

00000412 <lock_init>:

void lock_init(lock_t *lock) {
 412:	55                   	push   %ebp
 413:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 415:	8b 45 08             	mov    0x8(%ebp),%eax
 418:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 41e:	5d                   	pop    %ebp
 41f:	c3                   	ret    

00000420 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 420:	55                   	push   %ebp
 421:	89 e5                	mov    %esp,%ebp
 423:	56                   	push   %esi
 424:	53                   	push   %ebx
 425:	8b 75 08             	mov    0x8(%ebp),%esi
 428:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 42b:	89 f0                	mov    %esi,%eax
 42d:	89 d1                	mov    %edx,%ecx
 42f:	83 c2 01             	add    $0x1,%edx
 432:	89 c3                	mov    %eax,%ebx
 434:	83 c0 01             	add    $0x1,%eax
 437:	0f b6 09             	movzbl (%ecx),%ecx
 43a:	88 0b                	mov    %cl,(%ebx)
 43c:	84 c9                	test   %cl,%cl
 43e:	75 ed                	jne    42d <strcpy+0xd>
    ;
  return os;
}
 440:	89 f0                	mov    %esi,%eax
 442:	5b                   	pop    %ebx
 443:	5e                   	pop    %esi
 444:	5d                   	pop    %ebp
 445:	c3                   	ret    

00000446 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 446:	55                   	push   %ebp
 447:	89 e5                	mov    %esp,%ebp
 449:	8b 4d 08             	mov    0x8(%ebp),%ecx
 44c:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 44f:	eb 06                	jmp    457 <strcmp+0x11>
    p++, q++;
 451:	83 c1 01             	add    $0x1,%ecx
 454:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 457:	0f b6 01             	movzbl (%ecx),%eax
 45a:	84 c0                	test   %al,%al
 45c:	74 04                	je     462 <strcmp+0x1c>
 45e:	3a 02                	cmp    (%edx),%al
 460:	74 ef                	je     451 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 462:	0f b6 c0             	movzbl %al,%eax
 465:	0f b6 12             	movzbl (%edx),%edx
 468:	29 d0                	sub    %edx,%eax
}
 46a:	5d                   	pop    %ebp
 46b:	c3                   	ret    

0000046c <strlen>:

uint
strlen(const char *s)
{
 46c:	55                   	push   %ebp
 46d:	89 e5                	mov    %esp,%ebp
 46f:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 472:	b8 00 00 00 00       	mov    $0x0,%eax
 477:	eb 03                	jmp    47c <strlen+0x10>
 479:	83 c0 01             	add    $0x1,%eax
 47c:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 480:	75 f7                	jne    479 <strlen+0xd>
    ;
  return n;
}
 482:	5d                   	pop    %ebp
 483:	c3                   	ret    

00000484 <memset>:

void*
memset(void *dst, int c, uint n)
{
 484:	55                   	push   %ebp
 485:	89 e5                	mov    %esp,%ebp
 487:	57                   	push   %edi
 488:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 48b:	89 d7                	mov    %edx,%edi
 48d:	8b 4d 10             	mov    0x10(%ebp),%ecx
 490:	8b 45 0c             	mov    0xc(%ebp),%eax
 493:	fc                   	cld    
 494:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 496:	89 d0                	mov    %edx,%eax
 498:	8b 7d fc             	mov    -0x4(%ebp),%edi
 49b:	c9                   	leave  
 49c:	c3                   	ret    

0000049d <strchr>:

char*
strchr(const char *s, char c)
{
 49d:	55                   	push   %ebp
 49e:	89 e5                	mov    %esp,%ebp
 4a0:	8b 45 08             	mov    0x8(%ebp),%eax
 4a3:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 4a7:	eb 03                	jmp    4ac <strchr+0xf>
 4a9:	83 c0 01             	add    $0x1,%eax
 4ac:	0f b6 10             	movzbl (%eax),%edx
 4af:	84 d2                	test   %dl,%dl
 4b1:	74 06                	je     4b9 <strchr+0x1c>
    if(*s == c)
 4b3:	38 ca                	cmp    %cl,%dl
 4b5:	75 f2                	jne    4a9 <strchr+0xc>
 4b7:	eb 05                	jmp    4be <strchr+0x21>
      return (char*)s;
  return 0;
 4b9:	b8 00 00 00 00       	mov    $0x0,%eax
}
 4be:	5d                   	pop    %ebp
 4bf:	c3                   	ret    

000004c0 <gets>:

char*
gets(char *buf, int max)
{
 4c0:	55                   	push   %ebp
 4c1:	89 e5                	mov    %esp,%ebp
 4c3:	57                   	push   %edi
 4c4:	56                   	push   %esi
 4c5:	53                   	push   %ebx
 4c6:	83 ec 1c             	sub    $0x1c,%esp
 4c9:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 4cc:	bb 00 00 00 00       	mov    $0x0,%ebx
 4d1:	89 de                	mov    %ebx,%esi
 4d3:	83 c3 01             	add    $0x1,%ebx
 4d6:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 4d9:	7d 2e                	jge    509 <gets+0x49>
    cc = read(0, &c, 1);
 4db:	83 ec 04             	sub    $0x4,%esp
 4de:	6a 01                	push   $0x1
 4e0:	8d 45 e7             	lea    -0x19(%ebp),%eax
 4e3:	50                   	push   %eax
 4e4:	6a 00                	push   $0x0
 4e6:	e8 ec 00 00 00       	call   5d7 <read>
    if(cc < 1)
 4eb:	83 c4 10             	add    $0x10,%esp
 4ee:	85 c0                	test   %eax,%eax
 4f0:	7e 17                	jle    509 <gets+0x49>
      break;
    buf[i++] = c;
 4f2:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 4f6:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 4f9:	3c 0a                	cmp    $0xa,%al
 4fb:	0f 94 c2             	sete   %dl
 4fe:	3c 0d                	cmp    $0xd,%al
 500:	0f 94 c0             	sete   %al
 503:	08 c2                	or     %al,%dl
 505:	74 ca                	je     4d1 <gets+0x11>
    buf[i++] = c;
 507:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 509:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 50d:	89 f8                	mov    %edi,%eax
 50f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 512:	5b                   	pop    %ebx
 513:	5e                   	pop    %esi
 514:	5f                   	pop    %edi
 515:	5d                   	pop    %ebp
 516:	c3                   	ret    

00000517 <stat>:

int
stat(const char *n, struct stat *st)
{
 517:	55                   	push   %ebp
 518:	89 e5                	mov    %esp,%ebp
 51a:	56                   	push   %esi
 51b:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 51c:	83 ec 08             	sub    $0x8,%esp
 51f:	6a 00                	push   $0x0
 521:	ff 75 08             	push   0x8(%ebp)
 524:	e8 d6 00 00 00       	call   5ff <open>
  if(fd < 0)
 529:	83 c4 10             	add    $0x10,%esp
 52c:	85 c0                	test   %eax,%eax
 52e:	78 24                	js     554 <stat+0x3d>
 530:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 532:	83 ec 08             	sub    $0x8,%esp
 535:	ff 75 0c             	push   0xc(%ebp)
 538:	50                   	push   %eax
 539:	e8 d9 00 00 00       	call   617 <fstat>
 53e:	89 c6                	mov    %eax,%esi
  close(fd);
 540:	89 1c 24             	mov    %ebx,(%esp)
 543:	e8 9f 00 00 00       	call   5e7 <close>
  return r;
 548:	83 c4 10             	add    $0x10,%esp
}
 54b:	89 f0                	mov    %esi,%eax
 54d:	8d 65 f8             	lea    -0x8(%ebp),%esp
 550:	5b                   	pop    %ebx
 551:	5e                   	pop    %esi
 552:	5d                   	pop    %ebp
 553:	c3                   	ret    
    return -1;
 554:	be ff ff ff ff       	mov    $0xffffffff,%esi
 559:	eb f0                	jmp    54b <stat+0x34>

0000055b <atoi>:

int
atoi(const char *s)
{
 55b:	55                   	push   %ebp
 55c:	89 e5                	mov    %esp,%ebp
 55e:	53                   	push   %ebx
 55f:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 562:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 567:	eb 10                	jmp    579 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 569:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 56c:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 56f:	83 c1 01             	add    $0x1,%ecx
 572:	0f be c0             	movsbl %al,%eax
 575:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 579:	0f b6 01             	movzbl (%ecx),%eax
 57c:	8d 58 d0             	lea    -0x30(%eax),%ebx
 57f:	80 fb 09             	cmp    $0x9,%bl
 582:	76 e5                	jbe    569 <atoi+0xe>
  return n;
}
 584:	89 d0                	mov    %edx,%eax
 586:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 589:	c9                   	leave  
 58a:	c3                   	ret    

0000058b <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 58b:	55                   	push   %ebp
 58c:	89 e5                	mov    %esp,%ebp
 58e:	56                   	push   %esi
 58f:	53                   	push   %ebx
 590:	8b 75 08             	mov    0x8(%ebp),%esi
 593:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 596:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 599:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 59b:	eb 0d                	jmp    5aa <memmove+0x1f>
    *dst++ = *src++;
 59d:	0f b6 01             	movzbl (%ecx),%eax
 5a0:	88 02                	mov    %al,(%edx)
 5a2:	8d 49 01             	lea    0x1(%ecx),%ecx
 5a5:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 5a8:	89 d8                	mov    %ebx,%eax
 5aa:	8d 58 ff             	lea    -0x1(%eax),%ebx
 5ad:	85 c0                	test   %eax,%eax
 5af:	7f ec                	jg     59d <memmove+0x12>
  return vdst;
}
 5b1:	89 f0                	mov    %esi,%eax
 5b3:	5b                   	pop    %ebx
 5b4:	5e                   	pop    %esi
 5b5:	5d                   	pop    %ebp
 5b6:	c3                   	ret    

000005b7 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 5b7:	b8 01 00 00 00       	mov    $0x1,%eax
 5bc:	cd 40                	int    $0x40
 5be:	c3                   	ret    

000005bf <exit>:
SYSCALL(exit)
 5bf:	b8 02 00 00 00       	mov    $0x2,%eax
 5c4:	cd 40                	int    $0x40
 5c6:	c3                   	ret    

000005c7 <wait>:
SYSCALL(wait)
 5c7:	b8 03 00 00 00       	mov    $0x3,%eax
 5cc:	cd 40                	int    $0x40
 5ce:	c3                   	ret    

000005cf <pipe>:
SYSCALL(pipe)
 5cf:	b8 04 00 00 00       	mov    $0x4,%eax
 5d4:	cd 40                	int    $0x40
 5d6:	c3                   	ret    

000005d7 <read>:
SYSCALL(read)
 5d7:	b8 05 00 00 00       	mov    $0x5,%eax
 5dc:	cd 40                	int    $0x40
 5de:	c3                   	ret    

000005df <write>:
SYSCALL(write)
 5df:	b8 10 00 00 00       	mov    $0x10,%eax
 5e4:	cd 40                	int    $0x40
 5e6:	c3                   	ret    

000005e7 <close>:
SYSCALL(close)
 5e7:	b8 15 00 00 00       	mov    $0x15,%eax
 5ec:	cd 40                	int    $0x40
 5ee:	c3                   	ret    

000005ef <kill>:
SYSCALL(kill)
 5ef:	b8 06 00 00 00       	mov    $0x6,%eax
 5f4:	cd 40                	int    $0x40
 5f6:	c3                   	ret    

000005f7 <exec>:
SYSCALL(exec)
 5f7:	b8 07 00 00 00       	mov    $0x7,%eax
 5fc:	cd 40                	int    $0x40
 5fe:	c3                   	ret    

000005ff <open>:
SYSCALL(open)
 5ff:	b8 0f 00 00 00       	mov    $0xf,%eax
 604:	cd 40                	int    $0x40
 606:	c3                   	ret    

00000607 <mknod>:
SYSCALL(mknod)
 607:	b8 11 00 00 00       	mov    $0x11,%eax
 60c:	cd 40                	int    $0x40
 60e:	c3                   	ret    

0000060f <unlink>:
SYSCALL(unlink)
 60f:	b8 12 00 00 00       	mov    $0x12,%eax
 614:	cd 40                	int    $0x40
 616:	c3                   	ret    

00000617 <fstat>:
SYSCALL(fstat)
 617:	b8 08 00 00 00       	mov    $0x8,%eax
 61c:	cd 40                	int    $0x40
 61e:	c3                   	ret    

0000061f <link>:
SYSCALL(link)
 61f:	b8 13 00 00 00       	mov    $0x13,%eax
 624:	cd 40                	int    $0x40
 626:	c3                   	ret    

00000627 <mkdir>:
SYSCALL(mkdir)
 627:	b8 14 00 00 00       	mov    $0x14,%eax
 62c:	cd 40                	int    $0x40
 62e:	c3                   	ret    

0000062f <chdir>:
SYSCALL(chdir)
 62f:	b8 09 00 00 00       	mov    $0x9,%eax
 634:	cd 40                	int    $0x40
 636:	c3                   	ret    

00000637 <dup>:
SYSCALL(dup)
 637:	b8 0a 00 00 00       	mov    $0xa,%eax
 63c:	cd 40                	int    $0x40
 63e:	c3                   	ret    

0000063f <getpid>:
SYSCALL(getpid)
 63f:	b8 0b 00 00 00       	mov    $0xb,%eax
 644:	cd 40                	int    $0x40
 646:	c3                   	ret    

00000647 <sbrk>:
SYSCALL(sbrk)
 647:	b8 0c 00 00 00       	mov    $0xc,%eax
 64c:	cd 40                	int    $0x40
 64e:	c3                   	ret    

0000064f <sleep>:
SYSCALL(sleep)
 64f:	b8 0d 00 00 00       	mov    $0xd,%eax
 654:	cd 40                	int    $0x40
 656:	c3                   	ret    

00000657 <uptime>:
SYSCALL(uptime)
 657:	b8 0e 00 00 00       	mov    $0xe,%eax
 65c:	cd 40                	int    $0x40
 65e:	c3                   	ret    

0000065f <clone>:
SYSCALL(clone)
 65f:	b8 16 00 00 00       	mov    $0x16,%eax
 664:	cd 40                	int    $0x40
 666:	c3                   	ret    

00000667 <join>:
 667:	b8 17 00 00 00       	mov    $0x17,%eax
 66c:	cd 40                	int    $0x40
 66e:	c3                   	ret    

0000066f <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 66f:	55                   	push   %ebp
 670:	89 e5                	mov    %esp,%ebp
 672:	83 ec 1c             	sub    $0x1c,%esp
 675:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 678:	6a 01                	push   $0x1
 67a:	8d 55 f4             	lea    -0xc(%ebp),%edx
 67d:	52                   	push   %edx
 67e:	50                   	push   %eax
 67f:	e8 5b ff ff ff       	call   5df <write>
}
 684:	83 c4 10             	add    $0x10,%esp
 687:	c9                   	leave  
 688:	c3                   	ret    

00000689 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 689:	55                   	push   %ebp
 68a:	89 e5                	mov    %esp,%ebp
 68c:	57                   	push   %edi
 68d:	56                   	push   %esi
 68e:	53                   	push   %ebx
 68f:	83 ec 2c             	sub    $0x2c,%esp
 692:	89 45 d0             	mov    %eax,-0x30(%ebp)
 695:	89 d0                	mov    %edx,%eax
 697:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 699:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 69d:	0f 95 c1             	setne  %cl
 6a0:	c1 ea 1f             	shr    $0x1f,%edx
 6a3:	84 d1                	test   %dl,%cl
 6a5:	74 44                	je     6eb <printint+0x62>
    neg = 1;
    x = -xx;
 6a7:	f7 d8                	neg    %eax
 6a9:	89 c1                	mov    %eax,%ecx
    neg = 1;
 6ab:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 6b2:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 6b7:	89 c8                	mov    %ecx,%eax
 6b9:	ba 00 00 00 00       	mov    $0x0,%edx
 6be:	f7 f6                	div    %esi
 6c0:	89 df                	mov    %ebx,%edi
 6c2:	83 c3 01             	add    $0x1,%ebx
 6c5:	0f b6 92 e0 0a 00 00 	movzbl 0xae0(%edx),%edx
 6cc:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 6d0:	89 ca                	mov    %ecx,%edx
 6d2:	89 c1                	mov    %eax,%ecx
 6d4:	39 d6                	cmp    %edx,%esi
 6d6:	76 df                	jbe    6b7 <printint+0x2e>
  if(neg)
 6d8:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 6dc:	74 31                	je     70f <printint+0x86>
    buf[i++] = '-';
 6de:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 6e3:	8d 5f 02             	lea    0x2(%edi),%ebx
 6e6:	8b 75 d0             	mov    -0x30(%ebp),%esi
 6e9:	eb 17                	jmp    702 <printint+0x79>
    x = xx;
 6eb:	89 c1                	mov    %eax,%ecx
  neg = 0;
 6ed:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 6f4:	eb bc                	jmp    6b2 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 6f6:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 6fb:	89 f0                	mov    %esi,%eax
 6fd:	e8 6d ff ff ff       	call   66f <putc>
  while(--i >= 0)
 702:	83 eb 01             	sub    $0x1,%ebx
 705:	79 ef                	jns    6f6 <printint+0x6d>
}
 707:	83 c4 2c             	add    $0x2c,%esp
 70a:	5b                   	pop    %ebx
 70b:	5e                   	pop    %esi
 70c:	5f                   	pop    %edi
 70d:	5d                   	pop    %ebp
 70e:	c3                   	ret    
 70f:	8b 75 d0             	mov    -0x30(%ebp),%esi
 712:	eb ee                	jmp    702 <printint+0x79>

00000714 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 714:	55                   	push   %ebp
 715:	89 e5                	mov    %esp,%ebp
 717:	57                   	push   %edi
 718:	56                   	push   %esi
 719:	53                   	push   %ebx
 71a:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 71d:	8d 45 10             	lea    0x10(%ebp),%eax
 720:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 723:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 728:	bb 00 00 00 00       	mov    $0x0,%ebx
 72d:	eb 14                	jmp    743 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 72f:	89 fa                	mov    %edi,%edx
 731:	8b 45 08             	mov    0x8(%ebp),%eax
 734:	e8 36 ff ff ff       	call   66f <putc>
 739:	eb 05                	jmp    740 <printf+0x2c>
      }
    } else if(state == '%'){
 73b:	83 fe 25             	cmp    $0x25,%esi
 73e:	74 25                	je     765 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 740:	83 c3 01             	add    $0x1,%ebx
 743:	8b 45 0c             	mov    0xc(%ebp),%eax
 746:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 74a:	84 c0                	test   %al,%al
 74c:	0f 84 20 01 00 00    	je     872 <printf+0x15e>
    c = fmt[i] & 0xff;
 752:	0f be f8             	movsbl %al,%edi
 755:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 758:	85 f6                	test   %esi,%esi
 75a:	75 df                	jne    73b <printf+0x27>
      if(c == '%'){
 75c:	83 f8 25             	cmp    $0x25,%eax
 75f:	75 ce                	jne    72f <printf+0x1b>
        state = '%';
 761:	89 c6                	mov    %eax,%esi
 763:	eb db                	jmp    740 <printf+0x2c>
      if(c == 'd'){
 765:	83 f8 25             	cmp    $0x25,%eax
 768:	0f 84 cf 00 00 00    	je     83d <printf+0x129>
 76e:	0f 8c dd 00 00 00    	jl     851 <printf+0x13d>
 774:	83 f8 78             	cmp    $0x78,%eax
 777:	0f 8f d4 00 00 00    	jg     851 <printf+0x13d>
 77d:	83 f8 63             	cmp    $0x63,%eax
 780:	0f 8c cb 00 00 00    	jl     851 <printf+0x13d>
 786:	83 e8 63             	sub    $0x63,%eax
 789:	83 f8 15             	cmp    $0x15,%eax
 78c:	0f 87 bf 00 00 00    	ja     851 <printf+0x13d>
 792:	ff 24 85 88 0a 00 00 	jmp    *0xa88(,%eax,4)
        printint(fd, *ap, 10, 1);
 799:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 79c:	8b 17                	mov    (%edi),%edx
 79e:	83 ec 0c             	sub    $0xc,%esp
 7a1:	6a 01                	push   $0x1
 7a3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 7a8:	8b 45 08             	mov    0x8(%ebp),%eax
 7ab:	e8 d9 fe ff ff       	call   689 <printint>
        ap++;
 7b0:	83 c7 04             	add    $0x4,%edi
 7b3:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 7b6:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 7b9:	be 00 00 00 00       	mov    $0x0,%esi
 7be:	eb 80                	jmp    740 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 7c0:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7c3:	8b 17                	mov    (%edi),%edx
 7c5:	83 ec 0c             	sub    $0xc,%esp
 7c8:	6a 00                	push   $0x0
 7ca:	b9 10 00 00 00       	mov    $0x10,%ecx
 7cf:	8b 45 08             	mov    0x8(%ebp),%eax
 7d2:	e8 b2 fe ff ff       	call   689 <printint>
        ap++;
 7d7:	83 c7 04             	add    $0x4,%edi
 7da:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 7dd:	83 c4 10             	add    $0x10,%esp
      state = 0;
 7e0:	be 00 00 00 00       	mov    $0x0,%esi
 7e5:	e9 56 ff ff ff       	jmp    740 <printf+0x2c>
        s = (char*)*ap;
 7ea:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 7ed:	8b 30                	mov    (%eax),%esi
        ap++;
 7ef:	83 c0 04             	add    $0x4,%eax
 7f2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 7f5:	85 f6                	test   %esi,%esi
 7f7:	75 15                	jne    80e <printf+0xfa>
          s = "(null)";
 7f9:	be 80 0a 00 00       	mov    $0xa80,%esi
 7fe:	eb 0e                	jmp    80e <printf+0xfa>
          putc(fd, *s);
 800:	0f be d2             	movsbl %dl,%edx
 803:	8b 45 08             	mov    0x8(%ebp),%eax
 806:	e8 64 fe ff ff       	call   66f <putc>
          s++;
 80b:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 80e:	0f b6 16             	movzbl (%esi),%edx
 811:	84 d2                	test   %dl,%dl
 813:	75 eb                	jne    800 <printf+0xec>
      state = 0;
 815:	be 00 00 00 00       	mov    $0x0,%esi
 81a:	e9 21 ff ff ff       	jmp    740 <printf+0x2c>
        putc(fd, *ap);
 81f:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 822:	0f be 17             	movsbl (%edi),%edx
 825:	8b 45 08             	mov    0x8(%ebp),%eax
 828:	e8 42 fe ff ff       	call   66f <putc>
        ap++;
 82d:	83 c7 04             	add    $0x4,%edi
 830:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 833:	be 00 00 00 00       	mov    $0x0,%esi
 838:	e9 03 ff ff ff       	jmp    740 <printf+0x2c>
        putc(fd, c);
 83d:	89 fa                	mov    %edi,%edx
 83f:	8b 45 08             	mov    0x8(%ebp),%eax
 842:	e8 28 fe ff ff       	call   66f <putc>
      state = 0;
 847:	be 00 00 00 00       	mov    $0x0,%esi
 84c:	e9 ef fe ff ff       	jmp    740 <printf+0x2c>
        putc(fd, '%');
 851:	ba 25 00 00 00       	mov    $0x25,%edx
 856:	8b 45 08             	mov    0x8(%ebp),%eax
 859:	e8 11 fe ff ff       	call   66f <putc>
        putc(fd, c);
 85e:	89 fa                	mov    %edi,%edx
 860:	8b 45 08             	mov    0x8(%ebp),%eax
 863:	e8 07 fe ff ff       	call   66f <putc>
      state = 0;
 868:	be 00 00 00 00       	mov    $0x0,%esi
 86d:	e9 ce fe ff ff       	jmp    740 <printf+0x2c>
    }
  }
}
 872:	8d 65 f4             	lea    -0xc(%ebp),%esp
 875:	5b                   	pop    %ebx
 876:	5e                   	pop    %esi
 877:	5f                   	pop    %edi
 878:	5d                   	pop    %ebp
 879:	c3                   	ret    

0000087a <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 87a:	55                   	push   %ebp
 87b:	89 e5                	mov    %esp,%ebp
 87d:	57                   	push   %edi
 87e:	56                   	push   %esi
 87f:	53                   	push   %ebx
 880:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 883:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 886:	a1 6c 0e 00 00       	mov    0xe6c,%eax
 88b:	eb 02                	jmp    88f <free+0x15>
 88d:	89 d0                	mov    %edx,%eax
 88f:	39 c8                	cmp    %ecx,%eax
 891:	73 04                	jae    897 <free+0x1d>
 893:	39 08                	cmp    %ecx,(%eax)
 895:	77 12                	ja     8a9 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 897:	8b 10                	mov    (%eax),%edx
 899:	39 c2                	cmp    %eax,%edx
 89b:	77 f0                	ja     88d <free+0x13>
 89d:	39 c8                	cmp    %ecx,%eax
 89f:	72 08                	jb     8a9 <free+0x2f>
 8a1:	39 ca                	cmp    %ecx,%edx
 8a3:	77 04                	ja     8a9 <free+0x2f>
 8a5:	89 d0                	mov    %edx,%eax
 8a7:	eb e6                	jmp    88f <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 8a9:	8b 73 fc             	mov    -0x4(%ebx),%esi
 8ac:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 8af:	8b 10                	mov    (%eax),%edx
 8b1:	39 d7                	cmp    %edx,%edi
 8b3:	74 19                	je     8ce <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 8b5:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 8b8:	8b 50 04             	mov    0x4(%eax),%edx
 8bb:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 8be:	39 ce                	cmp    %ecx,%esi
 8c0:	74 1b                	je     8dd <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 8c2:	89 08                	mov    %ecx,(%eax)
  freep = p;
 8c4:	a3 6c 0e 00 00       	mov    %eax,0xe6c
}
 8c9:	5b                   	pop    %ebx
 8ca:	5e                   	pop    %esi
 8cb:	5f                   	pop    %edi
 8cc:	5d                   	pop    %ebp
 8cd:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 8ce:	03 72 04             	add    0x4(%edx),%esi
 8d1:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 8d4:	8b 10                	mov    (%eax),%edx
 8d6:	8b 12                	mov    (%edx),%edx
 8d8:	89 53 f8             	mov    %edx,-0x8(%ebx)
 8db:	eb db                	jmp    8b8 <free+0x3e>
    p->s.size += bp->s.size;
 8dd:	03 53 fc             	add    -0x4(%ebx),%edx
 8e0:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 8e3:	8b 53 f8             	mov    -0x8(%ebx),%edx
 8e6:	89 10                	mov    %edx,(%eax)
 8e8:	eb da                	jmp    8c4 <free+0x4a>

000008ea <morecore>:

static Header*
morecore(uint nu)
{
 8ea:	55                   	push   %ebp
 8eb:	89 e5                	mov    %esp,%ebp
 8ed:	53                   	push   %ebx
 8ee:	83 ec 04             	sub    $0x4,%esp
 8f1:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 8f3:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 8f8:	77 05                	ja     8ff <morecore+0x15>
    nu = 4096;
 8fa:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 8ff:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 906:	83 ec 0c             	sub    $0xc,%esp
 909:	50                   	push   %eax
 90a:	e8 38 fd ff ff       	call   647 <sbrk>
  if(p == (char*)-1)
 90f:	83 c4 10             	add    $0x10,%esp
 912:	83 f8 ff             	cmp    $0xffffffff,%eax
 915:	74 1c                	je     933 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 917:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 91a:	83 c0 08             	add    $0x8,%eax
 91d:	83 ec 0c             	sub    $0xc,%esp
 920:	50                   	push   %eax
 921:	e8 54 ff ff ff       	call   87a <free>
  return freep;
 926:	a1 6c 0e 00 00       	mov    0xe6c,%eax
 92b:	83 c4 10             	add    $0x10,%esp
}
 92e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 931:	c9                   	leave  
 932:	c3                   	ret    
    return 0;
 933:	b8 00 00 00 00       	mov    $0x0,%eax
 938:	eb f4                	jmp    92e <morecore+0x44>

0000093a <malloc>:

void*
malloc(uint nbytes)
{
 93a:	55                   	push   %ebp
 93b:	89 e5                	mov    %esp,%ebp
 93d:	53                   	push   %ebx
 93e:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 941:	8b 45 08             	mov    0x8(%ebp),%eax
 944:	8d 58 07             	lea    0x7(%eax),%ebx
 947:	c1 eb 03             	shr    $0x3,%ebx
 94a:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 94d:	8b 0d 6c 0e 00 00    	mov    0xe6c,%ecx
 953:	85 c9                	test   %ecx,%ecx
 955:	74 04                	je     95b <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 957:	8b 01                	mov    (%ecx),%eax
 959:	eb 4a                	jmp    9a5 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 95b:	c7 05 6c 0e 00 00 70 	movl   $0xe70,0xe6c
 962:	0e 00 00 
 965:	c7 05 70 0e 00 00 70 	movl   $0xe70,0xe70
 96c:	0e 00 00 
    base.s.size = 0;
 96f:	c7 05 74 0e 00 00 00 	movl   $0x0,0xe74
 976:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 979:	b9 70 0e 00 00       	mov    $0xe70,%ecx
 97e:	eb d7                	jmp    957 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 980:	74 19                	je     99b <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 982:	29 da                	sub    %ebx,%edx
 984:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 987:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 98a:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 98d:	89 0d 6c 0e 00 00    	mov    %ecx,0xe6c
      return (void*)(p + 1);
 993:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 996:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 999:	c9                   	leave  
 99a:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 99b:	8b 10                	mov    (%eax),%edx
 99d:	89 11                	mov    %edx,(%ecx)
 99f:	eb ec                	jmp    98d <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9a1:	89 c1                	mov    %eax,%ecx
 9a3:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 9a5:	8b 50 04             	mov    0x4(%eax),%edx
 9a8:	39 da                	cmp    %ebx,%edx
 9aa:	73 d4                	jae    980 <malloc+0x46>
    if(p == freep)
 9ac:	39 05 6c 0e 00 00    	cmp    %eax,0xe6c
 9b2:	75 ed                	jne    9a1 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 9b4:	89 d8                	mov    %ebx,%eax
 9b6:	e8 2f ff ff ff       	call   8ea <morecore>
 9bb:	85 c0                	test   %eax,%eax
 9bd:	75 e2                	jne    9a1 <malloc+0x67>
 9bf:	eb d5                	jmp    996 <malloc+0x5c>
