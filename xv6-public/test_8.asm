
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
  1c:	a1 78 0e 00 00       	mov    0xe78,%eax
  21:	83 f8 01             	cmp    $0x1,%eax
  24:	0f 84 db 00 00 00    	je     105 <worker+0x105>
  2a:	6a 3b                	push   $0x3b
  2c:	68 cc 09 00 00       	push   $0x9cc
  31:	68 d5 09 00 00       	push   $0x9d5
  36:	6a 01                	push   $0x1
  38:	e8 e2 06 00 00       	call   71f <printf>
  3d:	83 c4 0c             	add    $0xc,%esp
  40:	68 14 0a 00 00       	push   $0xa14
  45:	68 e8 09 00 00       	push   $0x9e8
  4a:	6a 01                	push   $0x1
  4c:	e8 ce 06 00 00       	call   71f <printf>
  51:	83 c4 08             	add    $0x8,%esp
  54:	68 fc 09 00 00       	push   $0x9fc
  59:	6a 01                	push   $0x1
  5b:	e8 bf 06 00 00       	call   71f <printf>
  60:	83 c4 04             	add    $0x4,%esp
  63:	ff 35 7c 0e 00 00    	push   0xe7c
  69:	e8 8c 05 00 00       	call   5fa <kill>
  6e:	e8 57 05 00 00       	call   5ca <exit>
   assert(tmp1 == 42);
  73:	6a 39                	push   $0x39
  75:	68 cc 09 00 00       	push   $0x9cc
  7a:	68 d5 09 00 00       	push   $0x9d5
  7f:	6a 01                	push   $0x1
  81:	e8 99 06 00 00       	call   71f <printf>
  86:	83 c4 0c             	add    $0xc,%esp
  89:	68 dd 09 00 00       	push   $0x9dd
  8e:	68 e8 09 00 00       	push   $0x9e8
  93:	6a 01                	push   $0x1
  95:	e8 85 06 00 00       	call   71f <printf>
  9a:	83 c4 08             	add    $0x8,%esp
  9d:	68 fc 09 00 00       	push   $0x9fc
  a2:	6a 01                	push   $0x1
  a4:	e8 76 06 00 00       	call   71f <printf>
  a9:	83 c4 04             	add    $0x4,%esp
  ac:	ff 35 7c 0e 00 00    	push   0xe7c
  b2:	e8 43 05 00 00       	call   5fa <kill>
  b7:	e8 0e 05 00 00       	call   5ca <exit>
   assert(tmp2 == 24);
  bc:	6a 3a                	push   $0x3a
  be:	68 cc 09 00 00       	push   $0x9cc
  c3:	68 d5 09 00 00       	push   $0x9d5
  c8:	6a 01                	push   $0x1
  ca:	e8 50 06 00 00       	call   71f <printf>
  cf:	83 c4 0c             	add    $0xc,%esp
  d2:	68 09 0a 00 00       	push   $0xa09
  d7:	68 e8 09 00 00       	push   $0x9e8
  dc:	6a 01                	push   $0x1
  de:	e8 3c 06 00 00       	call   71f <printf>
  e3:	83 c4 08             	add    $0x8,%esp
  e6:	68 fc 09 00 00       	push   $0x9fc
  eb:	6a 01                	push   $0x1
  ed:	e8 2d 06 00 00       	call   71f <printf>
  f2:	83 c4 04             	add    $0x4,%esp
  f5:	ff 35 7c 0e 00 00    	push   0xe7c
  fb:	e8 fa 04 00 00       	call   5fa <kill>
 100:	e8 c5 04 00 00       	call   5ca <exit>
   global++;
 105:	83 c0 01             	add    $0x1,%eax
 108:	a3 78 0e 00 00       	mov    %eax,0xe78
   exit();
 10d:	e8 b8 04 00 00       	call   5ca <exit>

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
 126:	e8 1f 05 00 00       	call   64a <getpid>
 12b:	a3 7c 0e 00 00       	mov    %eax,0xe7c
   void *stack, *p = malloc(PGSIZE * 2);
 130:	83 ec 0c             	sub    $0xc,%esp
 133:	68 00 20 00 00       	push   $0x2000
 138:	e8 08 08 00 00       	call   945 <malloc>
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
 15a:	68 cc 09 00 00       	push   $0x9cc
 15f:	68 d5 09 00 00       	push   $0x9d5
 164:	6a 01                	push   $0x1
 166:	e8 b4 05 00 00       	call   71f <printf>
 16b:	83 c4 0c             	add    $0xc,%esp
 16e:	68 20 0a 00 00       	push   $0xa20
 173:	68 e8 09 00 00       	push   $0x9e8
 178:	6a 01                	push   $0x1
 17a:	e8 a0 05 00 00       	call   71f <printf>
 17f:	83 c4 08             	add    $0x8,%esp
 182:	68 fc 09 00 00       	push   $0x9fc
 187:	6a 01                	push   $0x1
 189:	e8 91 05 00 00       	call   71f <printf>
 18e:	83 c4 04             	add    $0x4,%esp
 191:	ff 35 7c 0e 00 00    	push   0xe7c
 197:	e8 5e 04 00 00       	call   5fa <kill>
 19c:	e8 29 04 00 00       	call   5ca <exit>
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
 1bf:	e8 a6 04 00 00       	call   66a <clone>
 1c4:	89 c6                	mov    %eax,%esi
   assert(clone_pid > 0);
 1c6:	83 c4 10             	add    $0x10,%esp
 1c9:	85 c0                	test   %eax,%eax
 1cb:	7e 67                	jle    234 <main+0x122>
   sleep(250);
 1cd:	83 ec 0c             	sub    $0xc,%esp
 1d0:	68 fa 00 00 00       	push   $0xfa
 1d5:	e8 80 04 00 00       	call   65a <sleep>
   assert(wait() == -1);
 1da:	e8 f3 03 00 00       	call   5d2 <wait>
 1df:	83 c4 10             	add    $0x10,%esp
 1e2:	83 f8 ff             	cmp    $0xffffffff,%eax
 1e5:	0f 84 92 00 00 00    	je     27d <main+0x16b>
 1eb:	6a 28                	push   $0x28
 1ed:	68 cc 09 00 00       	push   $0x9cc
 1f2:	68 d5 09 00 00       	push   $0x9d5
 1f7:	6a 01                	push   $0x1
 1f9:	e8 21 05 00 00       	call   71f <printf>
 1fe:	83 c4 0c             	add    $0xc,%esp
 201:	68 38 0a 00 00       	push   $0xa38
 206:	68 e8 09 00 00       	push   $0x9e8
 20b:	6a 01                	push   $0x1
 20d:	e8 0d 05 00 00       	call   71f <printf>
 212:	83 c4 08             	add    $0x8,%esp
 215:	68 fc 09 00 00       	push   $0x9fc
 21a:	6a 01                	push   $0x1
 21c:	e8 fe 04 00 00       	call   71f <printf>
 221:	83 c4 04             	add    $0x4,%esp
 224:	ff 35 7c 0e 00 00    	push   0xe7c
 22a:	e8 cb 03 00 00       	call   5fa <kill>
 22f:	e8 96 03 00 00       	call   5ca <exit>
   assert(clone_pid > 0);
 234:	6a 25                	push   $0x25
 236:	68 cc 09 00 00       	push   $0x9cc
 23b:	68 d5 09 00 00       	push   $0x9d5
 240:	6a 01                	push   $0x1
 242:	e8 d8 04 00 00       	call   71f <printf>
 247:	83 c4 0c             	add    $0xc,%esp
 24a:	68 2a 0a 00 00       	push   $0xa2a
 24f:	68 e8 09 00 00       	push   $0x9e8
 254:	6a 01                	push   $0x1
 256:	e8 c4 04 00 00       	call   71f <printf>
 25b:	83 c4 08             	add    $0x8,%esp
 25e:	68 fc 09 00 00       	push   $0x9fc
 263:	6a 01                	push   $0x1
 265:	e8 b5 04 00 00       	call   71f <printf>
 26a:	83 c4 04             	add    $0x4,%esp
 26d:	ff 35 7c 0e 00 00    	push   0xe7c
 273:	e8 82 03 00 00       	call   5fa <kill>
 278:	e8 4d 03 00 00       	call   5ca <exit>
   int join_pid = join(&join_stack);
 27d:	83 ec 0c             	sub    $0xc,%esp
 280:	8d 45 dc             	lea    -0x24(%ebp),%eax
 283:	50                   	push   %eax
 284:	e8 e9 03 00 00       	call   672 <join>
   assert(join_pid == clone_pid);
 289:	83 c4 10             	add    $0x10,%esp
 28c:	39 c6                	cmp    %eax,%esi
 28e:	75 52                	jne    2e2 <main+0x1d0>
   assert(stack == join_stack);
 290:	39 7d dc             	cmp    %edi,-0x24(%ebp)
 293:	0f 84 92 00 00 00    	je     32b <main+0x219>
 299:	6a 2d                	push   $0x2d
 29b:	68 cc 09 00 00       	push   $0x9cc
 2a0:	68 d5 09 00 00       	push   $0x9d5
 2a5:	6a 01                	push   $0x1
 2a7:	e8 73 04 00 00       	call   71f <printf>
 2ac:	83 c4 0c             	add    $0xc,%esp
 2af:	68 5b 0a 00 00       	push   $0xa5b
 2b4:	68 e8 09 00 00       	push   $0x9e8
 2b9:	6a 01                	push   $0x1
 2bb:	e8 5f 04 00 00       	call   71f <printf>
 2c0:	83 c4 08             	add    $0x8,%esp
 2c3:	68 fc 09 00 00       	push   $0x9fc
 2c8:	6a 01                	push   $0x1
 2ca:	e8 50 04 00 00       	call   71f <printf>
 2cf:	83 c4 04             	add    $0x4,%esp
 2d2:	ff 35 7c 0e 00 00    	push   0xe7c
 2d8:	e8 1d 03 00 00       	call   5fa <kill>
 2dd:	e8 e8 02 00 00       	call   5ca <exit>
   assert(join_pid == clone_pid);
 2e2:	6a 2c                	push   $0x2c
 2e4:	68 cc 09 00 00       	push   $0x9cc
 2e9:	68 d5 09 00 00       	push   $0x9d5
 2ee:	6a 01                	push   $0x1
 2f0:	e8 2a 04 00 00       	call   71f <printf>
 2f5:	83 c4 0c             	add    $0xc,%esp
 2f8:	68 45 0a 00 00       	push   $0xa45
 2fd:	68 e8 09 00 00       	push   $0x9e8
 302:	6a 01                	push   $0x1
 304:	e8 16 04 00 00       	call   71f <printf>
 309:	83 c4 08             	add    $0x8,%esp
 30c:	68 fc 09 00 00       	push   $0x9fc
 311:	6a 01                	push   $0x1
 313:	e8 07 04 00 00       	call   71f <printf>
 318:	83 c4 04             	add    $0x4,%esp
 31b:	ff 35 7c 0e 00 00    	push   0xe7c
 321:	e8 d4 02 00 00       	call   5fa <kill>
 326:	e8 9f 02 00 00       	call   5ca <exit>
   assert(global == 2);
 32b:	83 3d 78 0e 00 00 02 	cmpl   $0x2,0xe78
 332:	74 49                	je     37d <main+0x26b>
 334:	6a 2e                	push   $0x2e
 336:	68 cc 09 00 00       	push   $0x9cc
 33b:	68 d5 09 00 00       	push   $0x9d5
 340:	6a 01                	push   $0x1
 342:	e8 d8 03 00 00       	call   71f <printf>
 347:	83 c4 0c             	add    $0xc,%esp
 34a:	68 6f 0a 00 00       	push   $0xa6f
 34f:	68 e8 09 00 00       	push   $0x9e8
 354:	6a 01                	push   $0x1
 356:	e8 c4 03 00 00       	call   71f <printf>
 35b:	83 c4 08             	add    $0x8,%esp
 35e:	68 fc 09 00 00       	push   $0x9fc
 363:	6a 01                	push   $0x1
 365:	e8 b5 03 00 00       	call   71f <printf>
 36a:	83 c4 04             	add    $0x4,%esp
 36d:	ff 35 7c 0e 00 00    	push   0xe7c
 373:	e8 82 02 00 00       	call   5fa <kill>
 378:	e8 4d 02 00 00       	call   5ca <exit>
   printf(1, "TEST PASSED\n");
 37d:	83 ec 08             	sub    $0x8,%esp
 380:	68 7b 0a 00 00       	push   $0xa7b
 385:	6a 01                	push   $0x1
 387:	e8 93 03 00 00       	call   71f <printf>
   free(p);
 38c:	89 1c 24             	mov    %ebx,(%esp)
 38f:	e8 f1 04 00 00       	call   885 <free>
   exit();
 394:	e8 31 02 00 00       	call   5ca <exit>

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
  void *n_stack = malloc(PGSIZE*2);
 3b0:	68 00 20 00 00       	push   $0x2000
 3b5:	e8 8b 05 00 00       	call   945 <malloc>
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
 3cb:	e8 9a 02 00 00       	call   66a <clone>


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
 3dc:	55                   	push   %ebp
 3dd:	89 e5                	mov    %esp,%ebp
 3df:	83 ec 24             	sub    $0x24,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 3e2:	8d 45 f4             	lea    -0xc(%ebp),%eax
 3e5:	50                   	push   %eax
 3e6:	e8 87 02 00 00       	call   672 <join>
  
  return pid;
}
 3eb:	c9                   	leave  
 3ec:	c3                   	ret    

000003ed <lock_acquire>:

void lock_acquire(lock_t *lock){
 3ed:	55                   	push   %ebp
 3ee:	89 e5                	mov    %esp,%ebp
 3f0:	53                   	push   %ebx
 3f1:	83 ec 04             	sub    $0x4,%esp
 3f4:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 3f7:	83 ec 08             	sub    $0x8,%esp
 3fa:	6a 01                	push   $0x1
 3fc:	53                   	push   %ebx
 3fd:	e8 97 ff ff ff       	call   399 <test_and_set>
 402:	83 c4 10             	add    $0x10,%esp
 405:	83 f8 01             	cmp    $0x1,%eax
 408:	74 ed                	je     3f7 <lock_acquire+0xa>
    ;
}
 40a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 40d:	c9                   	leave  
 40e:	c3                   	ret    

0000040f <lock_release>:

void lock_release(lock_t *lock) {
 40f:	55                   	push   %ebp
 410:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 412:	8b 45 08             	mov    0x8(%ebp),%eax
 415:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 41b:	5d                   	pop    %ebp
 41c:	c3                   	ret    

0000041d <lock_init>:

void lock_init(lock_t *lock) {
 41d:	55                   	push   %ebp
 41e:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 420:	8b 45 08             	mov    0x8(%ebp),%eax
 423:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 429:	5d                   	pop    %ebp
 42a:	c3                   	ret    

0000042b <strcpy>:

char*
strcpy(char *s, const char *t)
{
 42b:	55                   	push   %ebp
 42c:	89 e5                	mov    %esp,%ebp
 42e:	56                   	push   %esi
 42f:	53                   	push   %ebx
 430:	8b 75 08             	mov    0x8(%ebp),%esi
 433:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 436:	89 f0                	mov    %esi,%eax
 438:	89 d1                	mov    %edx,%ecx
 43a:	83 c2 01             	add    $0x1,%edx
 43d:	89 c3                	mov    %eax,%ebx
 43f:	83 c0 01             	add    $0x1,%eax
 442:	0f b6 09             	movzbl (%ecx),%ecx
 445:	88 0b                	mov    %cl,(%ebx)
 447:	84 c9                	test   %cl,%cl
 449:	75 ed                	jne    438 <strcpy+0xd>
    ;
  return os;
}
 44b:	89 f0                	mov    %esi,%eax
 44d:	5b                   	pop    %ebx
 44e:	5e                   	pop    %esi
 44f:	5d                   	pop    %ebp
 450:	c3                   	ret    

00000451 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 451:	55                   	push   %ebp
 452:	89 e5                	mov    %esp,%ebp
 454:	8b 4d 08             	mov    0x8(%ebp),%ecx
 457:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 45a:	eb 06                	jmp    462 <strcmp+0x11>
    p++, q++;
 45c:	83 c1 01             	add    $0x1,%ecx
 45f:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 462:	0f b6 01             	movzbl (%ecx),%eax
 465:	84 c0                	test   %al,%al
 467:	74 04                	je     46d <strcmp+0x1c>
 469:	3a 02                	cmp    (%edx),%al
 46b:	74 ef                	je     45c <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 46d:	0f b6 c0             	movzbl %al,%eax
 470:	0f b6 12             	movzbl (%edx),%edx
 473:	29 d0                	sub    %edx,%eax
}
 475:	5d                   	pop    %ebp
 476:	c3                   	ret    

00000477 <strlen>:

uint
strlen(const char *s)
{
 477:	55                   	push   %ebp
 478:	89 e5                	mov    %esp,%ebp
 47a:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 47d:	b8 00 00 00 00       	mov    $0x0,%eax
 482:	eb 03                	jmp    487 <strlen+0x10>
 484:	83 c0 01             	add    $0x1,%eax
 487:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 48b:	75 f7                	jne    484 <strlen+0xd>
    ;
  return n;
}
 48d:	5d                   	pop    %ebp
 48e:	c3                   	ret    

0000048f <memset>:

void*
memset(void *dst, int c, uint n)
{
 48f:	55                   	push   %ebp
 490:	89 e5                	mov    %esp,%ebp
 492:	57                   	push   %edi
 493:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 496:	89 d7                	mov    %edx,%edi
 498:	8b 4d 10             	mov    0x10(%ebp),%ecx
 49b:	8b 45 0c             	mov    0xc(%ebp),%eax
 49e:	fc                   	cld    
 49f:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 4a1:	89 d0                	mov    %edx,%eax
 4a3:	8b 7d fc             	mov    -0x4(%ebp),%edi
 4a6:	c9                   	leave  
 4a7:	c3                   	ret    

000004a8 <strchr>:

char*
strchr(const char *s, char c)
{
 4a8:	55                   	push   %ebp
 4a9:	89 e5                	mov    %esp,%ebp
 4ab:	8b 45 08             	mov    0x8(%ebp),%eax
 4ae:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 4b2:	eb 03                	jmp    4b7 <strchr+0xf>
 4b4:	83 c0 01             	add    $0x1,%eax
 4b7:	0f b6 10             	movzbl (%eax),%edx
 4ba:	84 d2                	test   %dl,%dl
 4bc:	74 06                	je     4c4 <strchr+0x1c>
    if(*s == c)
 4be:	38 ca                	cmp    %cl,%dl
 4c0:	75 f2                	jne    4b4 <strchr+0xc>
 4c2:	eb 05                	jmp    4c9 <strchr+0x21>
      return (char*)s;
  return 0;
 4c4:	b8 00 00 00 00       	mov    $0x0,%eax
}
 4c9:	5d                   	pop    %ebp
 4ca:	c3                   	ret    

000004cb <gets>:

char*
gets(char *buf, int max)
{
 4cb:	55                   	push   %ebp
 4cc:	89 e5                	mov    %esp,%ebp
 4ce:	57                   	push   %edi
 4cf:	56                   	push   %esi
 4d0:	53                   	push   %ebx
 4d1:	83 ec 1c             	sub    $0x1c,%esp
 4d4:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 4d7:	bb 00 00 00 00       	mov    $0x0,%ebx
 4dc:	89 de                	mov    %ebx,%esi
 4de:	83 c3 01             	add    $0x1,%ebx
 4e1:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 4e4:	7d 2e                	jge    514 <gets+0x49>
    cc = read(0, &c, 1);
 4e6:	83 ec 04             	sub    $0x4,%esp
 4e9:	6a 01                	push   $0x1
 4eb:	8d 45 e7             	lea    -0x19(%ebp),%eax
 4ee:	50                   	push   %eax
 4ef:	6a 00                	push   $0x0
 4f1:	e8 ec 00 00 00       	call   5e2 <read>
    if(cc < 1)
 4f6:	83 c4 10             	add    $0x10,%esp
 4f9:	85 c0                	test   %eax,%eax
 4fb:	7e 17                	jle    514 <gets+0x49>
      break;
    buf[i++] = c;
 4fd:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 501:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 504:	3c 0a                	cmp    $0xa,%al
 506:	0f 94 c2             	sete   %dl
 509:	3c 0d                	cmp    $0xd,%al
 50b:	0f 94 c0             	sete   %al
 50e:	08 c2                	or     %al,%dl
 510:	74 ca                	je     4dc <gets+0x11>
    buf[i++] = c;
 512:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 514:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 518:	89 f8                	mov    %edi,%eax
 51a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 51d:	5b                   	pop    %ebx
 51e:	5e                   	pop    %esi
 51f:	5f                   	pop    %edi
 520:	5d                   	pop    %ebp
 521:	c3                   	ret    

00000522 <stat>:

int
stat(const char *n, struct stat *st)
{
 522:	55                   	push   %ebp
 523:	89 e5                	mov    %esp,%ebp
 525:	56                   	push   %esi
 526:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 527:	83 ec 08             	sub    $0x8,%esp
 52a:	6a 00                	push   $0x0
 52c:	ff 75 08             	push   0x8(%ebp)
 52f:	e8 d6 00 00 00       	call   60a <open>
  if(fd < 0)
 534:	83 c4 10             	add    $0x10,%esp
 537:	85 c0                	test   %eax,%eax
 539:	78 24                	js     55f <stat+0x3d>
 53b:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 53d:	83 ec 08             	sub    $0x8,%esp
 540:	ff 75 0c             	push   0xc(%ebp)
 543:	50                   	push   %eax
 544:	e8 d9 00 00 00       	call   622 <fstat>
 549:	89 c6                	mov    %eax,%esi
  close(fd);
 54b:	89 1c 24             	mov    %ebx,(%esp)
 54e:	e8 9f 00 00 00       	call   5f2 <close>
  return r;
 553:	83 c4 10             	add    $0x10,%esp
}
 556:	89 f0                	mov    %esi,%eax
 558:	8d 65 f8             	lea    -0x8(%ebp),%esp
 55b:	5b                   	pop    %ebx
 55c:	5e                   	pop    %esi
 55d:	5d                   	pop    %ebp
 55e:	c3                   	ret    
    return -1;
 55f:	be ff ff ff ff       	mov    $0xffffffff,%esi
 564:	eb f0                	jmp    556 <stat+0x34>

00000566 <atoi>:

int
atoi(const char *s)
{
 566:	55                   	push   %ebp
 567:	89 e5                	mov    %esp,%ebp
 569:	53                   	push   %ebx
 56a:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 56d:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 572:	eb 10                	jmp    584 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 574:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 577:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 57a:	83 c1 01             	add    $0x1,%ecx
 57d:	0f be c0             	movsbl %al,%eax
 580:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 584:	0f b6 01             	movzbl (%ecx),%eax
 587:	8d 58 d0             	lea    -0x30(%eax),%ebx
 58a:	80 fb 09             	cmp    $0x9,%bl
 58d:	76 e5                	jbe    574 <atoi+0xe>
  return n;
}
 58f:	89 d0                	mov    %edx,%eax
 591:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 594:	c9                   	leave  
 595:	c3                   	ret    

00000596 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 596:	55                   	push   %ebp
 597:	89 e5                	mov    %esp,%ebp
 599:	56                   	push   %esi
 59a:	53                   	push   %ebx
 59b:	8b 75 08             	mov    0x8(%ebp),%esi
 59e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 5a1:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 5a4:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 5a6:	eb 0d                	jmp    5b5 <memmove+0x1f>
    *dst++ = *src++;
 5a8:	0f b6 01             	movzbl (%ecx),%eax
 5ab:	88 02                	mov    %al,(%edx)
 5ad:	8d 49 01             	lea    0x1(%ecx),%ecx
 5b0:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 5b3:	89 d8                	mov    %ebx,%eax
 5b5:	8d 58 ff             	lea    -0x1(%eax),%ebx
 5b8:	85 c0                	test   %eax,%eax
 5ba:	7f ec                	jg     5a8 <memmove+0x12>
  return vdst;
}
 5bc:	89 f0                	mov    %esi,%eax
 5be:	5b                   	pop    %ebx
 5bf:	5e                   	pop    %esi
 5c0:	5d                   	pop    %ebp
 5c1:	c3                   	ret    

000005c2 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 5c2:	b8 01 00 00 00       	mov    $0x1,%eax
 5c7:	cd 40                	int    $0x40
 5c9:	c3                   	ret    

000005ca <exit>:
SYSCALL(exit)
 5ca:	b8 02 00 00 00       	mov    $0x2,%eax
 5cf:	cd 40                	int    $0x40
 5d1:	c3                   	ret    

000005d2 <wait>:
SYSCALL(wait)
 5d2:	b8 03 00 00 00       	mov    $0x3,%eax
 5d7:	cd 40                	int    $0x40
 5d9:	c3                   	ret    

000005da <pipe>:
SYSCALL(pipe)
 5da:	b8 04 00 00 00       	mov    $0x4,%eax
 5df:	cd 40                	int    $0x40
 5e1:	c3                   	ret    

000005e2 <read>:
SYSCALL(read)
 5e2:	b8 05 00 00 00       	mov    $0x5,%eax
 5e7:	cd 40                	int    $0x40
 5e9:	c3                   	ret    

000005ea <write>:
SYSCALL(write)
 5ea:	b8 10 00 00 00       	mov    $0x10,%eax
 5ef:	cd 40                	int    $0x40
 5f1:	c3                   	ret    

000005f2 <close>:
SYSCALL(close)
 5f2:	b8 15 00 00 00       	mov    $0x15,%eax
 5f7:	cd 40                	int    $0x40
 5f9:	c3                   	ret    

000005fa <kill>:
SYSCALL(kill)
 5fa:	b8 06 00 00 00       	mov    $0x6,%eax
 5ff:	cd 40                	int    $0x40
 601:	c3                   	ret    

00000602 <exec>:
SYSCALL(exec)
 602:	b8 07 00 00 00       	mov    $0x7,%eax
 607:	cd 40                	int    $0x40
 609:	c3                   	ret    

0000060a <open>:
SYSCALL(open)
 60a:	b8 0f 00 00 00       	mov    $0xf,%eax
 60f:	cd 40                	int    $0x40
 611:	c3                   	ret    

00000612 <mknod>:
SYSCALL(mknod)
 612:	b8 11 00 00 00       	mov    $0x11,%eax
 617:	cd 40                	int    $0x40
 619:	c3                   	ret    

0000061a <unlink>:
SYSCALL(unlink)
 61a:	b8 12 00 00 00       	mov    $0x12,%eax
 61f:	cd 40                	int    $0x40
 621:	c3                   	ret    

00000622 <fstat>:
SYSCALL(fstat)
 622:	b8 08 00 00 00       	mov    $0x8,%eax
 627:	cd 40                	int    $0x40
 629:	c3                   	ret    

0000062a <link>:
SYSCALL(link)
 62a:	b8 13 00 00 00       	mov    $0x13,%eax
 62f:	cd 40                	int    $0x40
 631:	c3                   	ret    

00000632 <mkdir>:
SYSCALL(mkdir)
 632:	b8 14 00 00 00       	mov    $0x14,%eax
 637:	cd 40                	int    $0x40
 639:	c3                   	ret    

0000063a <chdir>:
SYSCALL(chdir)
 63a:	b8 09 00 00 00       	mov    $0x9,%eax
 63f:	cd 40                	int    $0x40
 641:	c3                   	ret    

00000642 <dup>:
SYSCALL(dup)
 642:	b8 0a 00 00 00       	mov    $0xa,%eax
 647:	cd 40                	int    $0x40
 649:	c3                   	ret    

0000064a <getpid>:
SYSCALL(getpid)
 64a:	b8 0b 00 00 00       	mov    $0xb,%eax
 64f:	cd 40                	int    $0x40
 651:	c3                   	ret    

00000652 <sbrk>:
SYSCALL(sbrk)
 652:	b8 0c 00 00 00       	mov    $0xc,%eax
 657:	cd 40                	int    $0x40
 659:	c3                   	ret    

0000065a <sleep>:
SYSCALL(sleep)
 65a:	b8 0d 00 00 00       	mov    $0xd,%eax
 65f:	cd 40                	int    $0x40
 661:	c3                   	ret    

00000662 <uptime>:
SYSCALL(uptime)
 662:	b8 0e 00 00 00       	mov    $0xe,%eax
 667:	cd 40                	int    $0x40
 669:	c3                   	ret    

0000066a <clone>:
SYSCALL(clone)
 66a:	b8 16 00 00 00       	mov    $0x16,%eax
 66f:	cd 40                	int    $0x40
 671:	c3                   	ret    

00000672 <join>:
 672:	b8 17 00 00 00       	mov    $0x17,%eax
 677:	cd 40                	int    $0x40
 679:	c3                   	ret    

0000067a <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 67a:	55                   	push   %ebp
 67b:	89 e5                	mov    %esp,%ebp
 67d:	83 ec 1c             	sub    $0x1c,%esp
 680:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 683:	6a 01                	push   $0x1
 685:	8d 55 f4             	lea    -0xc(%ebp),%edx
 688:	52                   	push   %edx
 689:	50                   	push   %eax
 68a:	e8 5b ff ff ff       	call   5ea <write>
}
 68f:	83 c4 10             	add    $0x10,%esp
 692:	c9                   	leave  
 693:	c3                   	ret    

00000694 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 694:	55                   	push   %ebp
 695:	89 e5                	mov    %esp,%ebp
 697:	57                   	push   %edi
 698:	56                   	push   %esi
 699:	53                   	push   %ebx
 69a:	83 ec 2c             	sub    $0x2c,%esp
 69d:	89 45 d0             	mov    %eax,-0x30(%ebp)
 6a0:	89 d0                	mov    %edx,%eax
 6a2:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 6a4:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 6a8:	0f 95 c1             	setne  %cl
 6ab:	c1 ea 1f             	shr    $0x1f,%edx
 6ae:	84 d1                	test   %dl,%cl
 6b0:	74 44                	je     6f6 <printint+0x62>
    neg = 1;
    x = -xx;
 6b2:	f7 d8                	neg    %eax
 6b4:	89 c1                	mov    %eax,%ecx
    neg = 1;
 6b6:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 6bd:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 6c2:	89 c8                	mov    %ecx,%eax
 6c4:	ba 00 00 00 00       	mov    $0x0,%edx
 6c9:	f7 f6                	div    %esi
 6cb:	89 df                	mov    %ebx,%edi
 6cd:	83 c3 01             	add    $0x1,%ebx
 6d0:	0f b6 92 e8 0a 00 00 	movzbl 0xae8(%edx),%edx
 6d7:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 6db:	89 ca                	mov    %ecx,%edx
 6dd:	89 c1                	mov    %eax,%ecx
 6df:	39 d6                	cmp    %edx,%esi
 6e1:	76 df                	jbe    6c2 <printint+0x2e>
  if(neg)
 6e3:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 6e7:	74 31                	je     71a <printint+0x86>
    buf[i++] = '-';
 6e9:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 6ee:	8d 5f 02             	lea    0x2(%edi),%ebx
 6f1:	8b 75 d0             	mov    -0x30(%ebp),%esi
 6f4:	eb 17                	jmp    70d <printint+0x79>
    x = xx;
 6f6:	89 c1                	mov    %eax,%ecx
  neg = 0;
 6f8:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 6ff:	eb bc                	jmp    6bd <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 701:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 706:	89 f0                	mov    %esi,%eax
 708:	e8 6d ff ff ff       	call   67a <putc>
  while(--i >= 0)
 70d:	83 eb 01             	sub    $0x1,%ebx
 710:	79 ef                	jns    701 <printint+0x6d>
}
 712:	83 c4 2c             	add    $0x2c,%esp
 715:	5b                   	pop    %ebx
 716:	5e                   	pop    %esi
 717:	5f                   	pop    %edi
 718:	5d                   	pop    %ebp
 719:	c3                   	ret    
 71a:	8b 75 d0             	mov    -0x30(%ebp),%esi
 71d:	eb ee                	jmp    70d <printint+0x79>

0000071f <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 71f:	55                   	push   %ebp
 720:	89 e5                	mov    %esp,%ebp
 722:	57                   	push   %edi
 723:	56                   	push   %esi
 724:	53                   	push   %ebx
 725:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 728:	8d 45 10             	lea    0x10(%ebp),%eax
 72b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 72e:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 733:	bb 00 00 00 00       	mov    $0x0,%ebx
 738:	eb 14                	jmp    74e <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 73a:	89 fa                	mov    %edi,%edx
 73c:	8b 45 08             	mov    0x8(%ebp),%eax
 73f:	e8 36 ff ff ff       	call   67a <putc>
 744:	eb 05                	jmp    74b <printf+0x2c>
      }
    } else if(state == '%'){
 746:	83 fe 25             	cmp    $0x25,%esi
 749:	74 25                	je     770 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 74b:	83 c3 01             	add    $0x1,%ebx
 74e:	8b 45 0c             	mov    0xc(%ebp),%eax
 751:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 755:	84 c0                	test   %al,%al
 757:	0f 84 20 01 00 00    	je     87d <printf+0x15e>
    c = fmt[i] & 0xff;
 75d:	0f be f8             	movsbl %al,%edi
 760:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 763:	85 f6                	test   %esi,%esi
 765:	75 df                	jne    746 <printf+0x27>
      if(c == '%'){
 767:	83 f8 25             	cmp    $0x25,%eax
 76a:	75 ce                	jne    73a <printf+0x1b>
        state = '%';
 76c:	89 c6                	mov    %eax,%esi
 76e:	eb db                	jmp    74b <printf+0x2c>
      if(c == 'd'){
 770:	83 f8 25             	cmp    $0x25,%eax
 773:	0f 84 cf 00 00 00    	je     848 <printf+0x129>
 779:	0f 8c dd 00 00 00    	jl     85c <printf+0x13d>
 77f:	83 f8 78             	cmp    $0x78,%eax
 782:	0f 8f d4 00 00 00    	jg     85c <printf+0x13d>
 788:	83 f8 63             	cmp    $0x63,%eax
 78b:	0f 8c cb 00 00 00    	jl     85c <printf+0x13d>
 791:	83 e8 63             	sub    $0x63,%eax
 794:	83 f8 15             	cmp    $0x15,%eax
 797:	0f 87 bf 00 00 00    	ja     85c <printf+0x13d>
 79d:	ff 24 85 90 0a 00 00 	jmp    *0xa90(,%eax,4)
        printint(fd, *ap, 10, 1);
 7a4:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7a7:	8b 17                	mov    (%edi),%edx
 7a9:	83 ec 0c             	sub    $0xc,%esp
 7ac:	6a 01                	push   $0x1
 7ae:	b9 0a 00 00 00       	mov    $0xa,%ecx
 7b3:	8b 45 08             	mov    0x8(%ebp),%eax
 7b6:	e8 d9 fe ff ff       	call   694 <printint>
        ap++;
 7bb:	83 c7 04             	add    $0x4,%edi
 7be:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 7c1:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 7c4:	be 00 00 00 00       	mov    $0x0,%esi
 7c9:	eb 80                	jmp    74b <printf+0x2c>
        printint(fd, *ap, 16, 0);
 7cb:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7ce:	8b 17                	mov    (%edi),%edx
 7d0:	83 ec 0c             	sub    $0xc,%esp
 7d3:	6a 00                	push   $0x0
 7d5:	b9 10 00 00 00       	mov    $0x10,%ecx
 7da:	8b 45 08             	mov    0x8(%ebp),%eax
 7dd:	e8 b2 fe ff ff       	call   694 <printint>
        ap++;
 7e2:	83 c7 04             	add    $0x4,%edi
 7e5:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 7e8:	83 c4 10             	add    $0x10,%esp
      state = 0;
 7eb:	be 00 00 00 00       	mov    $0x0,%esi
 7f0:	e9 56 ff ff ff       	jmp    74b <printf+0x2c>
        s = (char*)*ap;
 7f5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 7f8:	8b 30                	mov    (%eax),%esi
        ap++;
 7fa:	83 c0 04             	add    $0x4,%eax
 7fd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 800:	85 f6                	test   %esi,%esi
 802:	75 15                	jne    819 <printf+0xfa>
          s = "(null)";
 804:	be 88 0a 00 00       	mov    $0xa88,%esi
 809:	eb 0e                	jmp    819 <printf+0xfa>
          putc(fd, *s);
 80b:	0f be d2             	movsbl %dl,%edx
 80e:	8b 45 08             	mov    0x8(%ebp),%eax
 811:	e8 64 fe ff ff       	call   67a <putc>
          s++;
 816:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 819:	0f b6 16             	movzbl (%esi),%edx
 81c:	84 d2                	test   %dl,%dl
 81e:	75 eb                	jne    80b <printf+0xec>
      state = 0;
 820:	be 00 00 00 00       	mov    $0x0,%esi
 825:	e9 21 ff ff ff       	jmp    74b <printf+0x2c>
        putc(fd, *ap);
 82a:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 82d:	0f be 17             	movsbl (%edi),%edx
 830:	8b 45 08             	mov    0x8(%ebp),%eax
 833:	e8 42 fe ff ff       	call   67a <putc>
        ap++;
 838:	83 c7 04             	add    $0x4,%edi
 83b:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 83e:	be 00 00 00 00       	mov    $0x0,%esi
 843:	e9 03 ff ff ff       	jmp    74b <printf+0x2c>
        putc(fd, c);
 848:	89 fa                	mov    %edi,%edx
 84a:	8b 45 08             	mov    0x8(%ebp),%eax
 84d:	e8 28 fe ff ff       	call   67a <putc>
      state = 0;
 852:	be 00 00 00 00       	mov    $0x0,%esi
 857:	e9 ef fe ff ff       	jmp    74b <printf+0x2c>
        putc(fd, '%');
 85c:	ba 25 00 00 00       	mov    $0x25,%edx
 861:	8b 45 08             	mov    0x8(%ebp),%eax
 864:	e8 11 fe ff ff       	call   67a <putc>
        putc(fd, c);
 869:	89 fa                	mov    %edi,%edx
 86b:	8b 45 08             	mov    0x8(%ebp),%eax
 86e:	e8 07 fe ff ff       	call   67a <putc>
      state = 0;
 873:	be 00 00 00 00       	mov    $0x0,%esi
 878:	e9 ce fe ff ff       	jmp    74b <printf+0x2c>
    }
  }
}
 87d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 880:	5b                   	pop    %ebx
 881:	5e                   	pop    %esi
 882:	5f                   	pop    %edi
 883:	5d                   	pop    %ebp
 884:	c3                   	ret    

00000885 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 885:	55                   	push   %ebp
 886:	89 e5                	mov    %esp,%ebp
 888:	57                   	push   %edi
 889:	56                   	push   %esi
 88a:	53                   	push   %ebx
 88b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 88e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 891:	a1 80 0e 00 00       	mov    0xe80,%eax
 896:	eb 02                	jmp    89a <free+0x15>
 898:	89 d0                	mov    %edx,%eax
 89a:	39 c8                	cmp    %ecx,%eax
 89c:	73 04                	jae    8a2 <free+0x1d>
 89e:	39 08                	cmp    %ecx,(%eax)
 8a0:	77 12                	ja     8b4 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8a2:	8b 10                	mov    (%eax),%edx
 8a4:	39 c2                	cmp    %eax,%edx
 8a6:	77 f0                	ja     898 <free+0x13>
 8a8:	39 c8                	cmp    %ecx,%eax
 8aa:	72 08                	jb     8b4 <free+0x2f>
 8ac:	39 ca                	cmp    %ecx,%edx
 8ae:	77 04                	ja     8b4 <free+0x2f>
 8b0:	89 d0                	mov    %edx,%eax
 8b2:	eb e6                	jmp    89a <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 8b4:	8b 73 fc             	mov    -0x4(%ebx),%esi
 8b7:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 8ba:	8b 10                	mov    (%eax),%edx
 8bc:	39 d7                	cmp    %edx,%edi
 8be:	74 19                	je     8d9 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 8c0:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 8c3:	8b 50 04             	mov    0x4(%eax),%edx
 8c6:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 8c9:	39 ce                	cmp    %ecx,%esi
 8cb:	74 1b                	je     8e8 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 8cd:	89 08                	mov    %ecx,(%eax)
  freep = p;
 8cf:	a3 80 0e 00 00       	mov    %eax,0xe80
}
 8d4:	5b                   	pop    %ebx
 8d5:	5e                   	pop    %esi
 8d6:	5f                   	pop    %edi
 8d7:	5d                   	pop    %ebp
 8d8:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 8d9:	03 72 04             	add    0x4(%edx),%esi
 8dc:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 8df:	8b 10                	mov    (%eax),%edx
 8e1:	8b 12                	mov    (%edx),%edx
 8e3:	89 53 f8             	mov    %edx,-0x8(%ebx)
 8e6:	eb db                	jmp    8c3 <free+0x3e>
    p->s.size += bp->s.size;
 8e8:	03 53 fc             	add    -0x4(%ebx),%edx
 8eb:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 8ee:	8b 53 f8             	mov    -0x8(%ebx),%edx
 8f1:	89 10                	mov    %edx,(%eax)
 8f3:	eb da                	jmp    8cf <free+0x4a>

000008f5 <morecore>:

static Header*
morecore(uint nu)
{
 8f5:	55                   	push   %ebp
 8f6:	89 e5                	mov    %esp,%ebp
 8f8:	53                   	push   %ebx
 8f9:	83 ec 04             	sub    $0x4,%esp
 8fc:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 8fe:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 903:	77 05                	ja     90a <morecore+0x15>
    nu = 4096;
 905:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 90a:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 911:	83 ec 0c             	sub    $0xc,%esp
 914:	50                   	push   %eax
 915:	e8 38 fd ff ff       	call   652 <sbrk>
  if(p == (char*)-1)
 91a:	83 c4 10             	add    $0x10,%esp
 91d:	83 f8 ff             	cmp    $0xffffffff,%eax
 920:	74 1c                	je     93e <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 922:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 925:	83 c0 08             	add    $0x8,%eax
 928:	83 ec 0c             	sub    $0xc,%esp
 92b:	50                   	push   %eax
 92c:	e8 54 ff ff ff       	call   885 <free>
  return freep;
 931:	a1 80 0e 00 00       	mov    0xe80,%eax
 936:	83 c4 10             	add    $0x10,%esp
}
 939:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 93c:	c9                   	leave  
 93d:	c3                   	ret    
    return 0;
 93e:	b8 00 00 00 00       	mov    $0x0,%eax
 943:	eb f4                	jmp    939 <morecore+0x44>

00000945 <malloc>:

void*
malloc(uint nbytes)
{
 945:	55                   	push   %ebp
 946:	89 e5                	mov    %esp,%ebp
 948:	53                   	push   %ebx
 949:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 94c:	8b 45 08             	mov    0x8(%ebp),%eax
 94f:	8d 58 07             	lea    0x7(%eax),%ebx
 952:	c1 eb 03             	shr    $0x3,%ebx
 955:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 958:	8b 0d 80 0e 00 00    	mov    0xe80,%ecx
 95e:	85 c9                	test   %ecx,%ecx
 960:	74 04                	je     966 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 962:	8b 01                	mov    (%ecx),%eax
 964:	eb 4a                	jmp    9b0 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 966:	c7 05 80 0e 00 00 84 	movl   $0xe84,0xe80
 96d:	0e 00 00 
 970:	c7 05 84 0e 00 00 84 	movl   $0xe84,0xe84
 977:	0e 00 00 
    base.s.size = 0;
 97a:	c7 05 88 0e 00 00 00 	movl   $0x0,0xe88
 981:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 984:	b9 84 0e 00 00       	mov    $0xe84,%ecx
 989:	eb d7                	jmp    962 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 98b:	74 19                	je     9a6 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 98d:	29 da                	sub    %ebx,%edx
 98f:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 992:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 995:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 998:	89 0d 80 0e 00 00    	mov    %ecx,0xe80
      return (void*)(p + 1);
 99e:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 9a1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 9a4:	c9                   	leave  
 9a5:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 9a6:	8b 10                	mov    (%eax),%edx
 9a8:	89 11                	mov    %edx,(%ecx)
 9aa:	eb ec                	jmp    998 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9ac:	89 c1                	mov    %eax,%ecx
 9ae:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 9b0:	8b 50 04             	mov    0x4(%eax),%edx
 9b3:	39 da                	cmp    %ebx,%edx
 9b5:	73 d4                	jae    98b <malloc+0x46>
    if(p == freep)
 9b7:	39 05 80 0e 00 00    	cmp    %eax,0xe80
 9bd:	75 ed                	jne    9ac <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 9bf:	89 d8                	mov    %ebx,%eax
 9c1:	e8 2f ff ff ff       	call   8f5 <morecore>
 9c6:	85 c0                	test   %eax,%eax
 9c8:	75 e2                	jne    9ac <malloc+0x67>
 9ca:	eb d5                	jmp    9a1 <malloc+0x5c>
