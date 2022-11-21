
_test_16:     file format elf32-i386


Disassembly of section .text:

00000000 <nested_worker>:
   printf(1, "TEST PASSED\n");
   exit();
}


void nested_worker(void *arg1, void *arg2){
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
  11:	75 60                	jne    73 <nested_worker+0x73>
   assert(arg2_int == 42);
  13:	83 fa 2a             	cmp    $0x2a,%edx
  16:	0f 85 a0 00 00 00    	jne    bc <nested_worker+0xbc>
   assert(global == 2);
  1c:	a1 f0 0e 00 00       	mov    0xef0,%eax
  21:	83 f8 02             	cmp    $0x2,%eax
  24:	0f 84 db 00 00 00    	je     105 <nested_worker+0x105>
  2a:	6a 30                	push   $0x30
  2c:	68 20 0a 00 00       	push   $0xa20
  31:	68 2a 0a 00 00       	push   $0xa2a
  36:	6a 01                	push   $0x1
  38:	e8 33 07 00 00       	call   770 <printf>
  3d:	83 c4 0c             	add    $0xc,%esp
  40:	68 71 0a 00 00       	push   $0xa71
  45:	68 41 0a 00 00       	push   $0xa41
  4a:	6a 01                	push   $0x1
  4c:	e8 1f 07 00 00       	call   770 <printf>
  51:	83 c4 08             	add    $0x8,%esp
  54:	68 55 0a 00 00       	push   $0xa55
  59:	6a 01                	push   $0x1
  5b:	e8 10 07 00 00       	call   770 <printf>
  60:	83 c4 04             	add    $0x4,%esp
  63:	ff 35 f4 0e 00 00    	push   0xef4
  69:	e8 dd 05 00 00       	call   64b <kill>
  6e:	e8 a8 05 00 00       	call   61b <exit>
   assert(arg1_int == 35);
  73:	6a 2e                	push   $0x2e
  75:	68 20 0a 00 00       	push   $0xa20
  7a:	68 2a 0a 00 00       	push   $0xa2a
  7f:	6a 01                	push   $0x1
  81:	e8 ea 06 00 00       	call   770 <printf>
  86:	83 c4 0c             	add    $0xc,%esp
  89:	68 32 0a 00 00       	push   $0xa32
  8e:	68 41 0a 00 00       	push   $0xa41
  93:	6a 01                	push   $0x1
  95:	e8 d6 06 00 00       	call   770 <printf>
  9a:	83 c4 08             	add    $0x8,%esp
  9d:	68 55 0a 00 00       	push   $0xa55
  a2:	6a 01                	push   $0x1
  a4:	e8 c7 06 00 00       	call   770 <printf>
  a9:	83 c4 04             	add    $0x4,%esp
  ac:	ff 35 f4 0e 00 00    	push   0xef4
  b2:	e8 94 05 00 00       	call   64b <kill>
  b7:	e8 5f 05 00 00       	call   61b <exit>
   assert(arg2_int == 42);
  bc:	6a 2f                	push   $0x2f
  be:	68 20 0a 00 00       	push   $0xa20
  c3:	68 2a 0a 00 00       	push   $0xa2a
  c8:	6a 01                	push   $0x1
  ca:	e8 a1 06 00 00       	call   770 <printf>
  cf:	83 c4 0c             	add    $0xc,%esp
  d2:	68 62 0a 00 00       	push   $0xa62
  d7:	68 41 0a 00 00       	push   $0xa41
  dc:	6a 01                	push   $0x1
  de:	e8 8d 06 00 00       	call   770 <printf>
  e3:	83 c4 08             	add    $0x8,%esp
  e6:	68 55 0a 00 00       	push   $0xa55
  eb:	6a 01                	push   $0x1
  ed:	e8 7e 06 00 00       	call   770 <printf>
  f2:	83 c4 04             	add    $0x4,%esp
  f5:	ff 35 f4 0e 00 00    	push   0xef4
  fb:	e8 4b 05 00 00       	call   64b <kill>
 100:	e8 16 05 00 00       	call   61b <exit>
   global++;
 105:	83 c0 01             	add    $0x1,%eax
 108:	a3 f0 0e 00 00       	mov    %eax,0xef0
   exit();
 10d:	e8 09 05 00 00       	call   61b <exit>

00000112 <worker>:
}

void
worker(void *arg1, void *arg2) {
 112:	55                   	push   %ebp
 113:	89 e5                	mov    %esp,%ebp
 115:	53                   	push   %ebx
 116:	83 ec 14             	sub    $0x14,%esp
   int arg1_int = *(int*)arg1;
 119:	8b 45 08             	mov    0x8(%ebp),%eax
 11c:	8b 00                	mov    (%eax),%eax
 11e:	89 45 f4             	mov    %eax,-0xc(%ebp)
   int arg2_int = *(int*)arg2;
 121:	8b 55 0c             	mov    0xc(%ebp),%edx
 124:	8b 12                	mov    (%edx),%edx
 126:	89 55 f0             	mov    %edx,-0x10(%ebp)
   assert(arg1_int == 35);
 129:	83 f8 23             	cmp    $0x23,%eax
 12c:	75 60                	jne    18e <worker+0x7c>
   assert(arg2_int == 42);
 12e:	83 fa 2a             	cmp    $0x2a,%edx
 131:	0f 85 a0 00 00 00    	jne    1d7 <worker+0xc5>
   assert(global == 1);
 137:	a1 f0 0e 00 00       	mov    0xef0,%eax
 13c:	83 f8 01             	cmp    $0x1,%eax
 13f:	0f 84 db 00 00 00    	je     220 <worker+0x10e>
 145:	6a 3b                	push   $0x3b
 147:	68 20 0a 00 00       	push   $0xa20
 14c:	68 2a 0a 00 00       	push   $0xa2a
 151:	6a 01                	push   $0x1
 153:	e8 18 06 00 00       	call   770 <printf>
 158:	83 c4 0c             	add    $0xc,%esp
 15b:	68 7d 0a 00 00       	push   $0xa7d
 160:	68 41 0a 00 00       	push   $0xa41
 165:	6a 01                	push   $0x1
 167:	e8 04 06 00 00       	call   770 <printf>
 16c:	83 c4 08             	add    $0x8,%esp
 16f:	68 55 0a 00 00       	push   $0xa55
 174:	6a 01                	push   $0x1
 176:	e8 f5 05 00 00       	call   770 <printf>
 17b:	83 c4 04             	add    $0x4,%esp
 17e:	ff 35 f4 0e 00 00    	push   0xef4
 184:	e8 c2 04 00 00       	call   64b <kill>
 189:	e8 8d 04 00 00       	call   61b <exit>
   assert(arg1_int == 35);
 18e:	6a 39                	push   $0x39
 190:	68 20 0a 00 00       	push   $0xa20
 195:	68 2a 0a 00 00       	push   $0xa2a
 19a:	6a 01                	push   $0x1
 19c:	e8 cf 05 00 00       	call   770 <printf>
 1a1:	83 c4 0c             	add    $0xc,%esp
 1a4:	68 32 0a 00 00       	push   $0xa32
 1a9:	68 41 0a 00 00       	push   $0xa41
 1ae:	6a 01                	push   $0x1
 1b0:	e8 bb 05 00 00       	call   770 <printf>
 1b5:	83 c4 08             	add    $0x8,%esp
 1b8:	68 55 0a 00 00       	push   $0xa55
 1bd:	6a 01                	push   $0x1
 1bf:	e8 ac 05 00 00       	call   770 <printf>
 1c4:	83 c4 04             	add    $0x4,%esp
 1c7:	ff 35 f4 0e 00 00    	push   0xef4
 1cd:	e8 79 04 00 00       	call   64b <kill>
 1d2:	e8 44 04 00 00       	call   61b <exit>
   assert(arg2_int == 42);
 1d7:	6a 3a                	push   $0x3a
 1d9:	68 20 0a 00 00       	push   $0xa20
 1de:	68 2a 0a 00 00       	push   $0xa2a
 1e3:	6a 01                	push   $0x1
 1e5:	e8 86 05 00 00       	call   770 <printf>
 1ea:	83 c4 0c             	add    $0xc,%esp
 1ed:	68 62 0a 00 00       	push   $0xa62
 1f2:	68 41 0a 00 00       	push   $0xa41
 1f7:	6a 01                	push   $0x1
 1f9:	e8 72 05 00 00       	call   770 <printf>
 1fe:	83 c4 08             	add    $0x8,%esp
 201:	68 55 0a 00 00       	push   $0xa55
 206:	6a 01                	push   $0x1
 208:	e8 63 05 00 00       	call   770 <printf>
 20d:	83 c4 04             	add    $0x4,%esp
 210:	ff 35 f4 0e 00 00    	push   0xef4
 216:	e8 30 04 00 00       	call   64b <kill>
 21b:	e8 fb 03 00 00       	call   61b <exit>
   global++;
 220:	83 c0 01             	add    $0x1,%eax
 223:	a3 f0 0e 00 00       	mov    %eax,0xef0
   int nested_thread_pid = thread_create(nested_worker, &arg1_int, &arg2_int);
 228:	83 ec 04             	sub    $0x4,%esp
 22b:	8d 45 f0             	lea    -0x10(%ebp),%eax
 22e:	50                   	push   %eax
 22f:	8d 45 f4             	lea    -0xc(%ebp),%eax
 232:	50                   	push   %eax
 233:	68 00 00 00 00       	push   $0x0
 238:	e8 be 01 00 00       	call   3fb <thread_create>
 23d:	89 c3                	mov    %eax,%ebx
   int nested_join_pid = thread_join();
 23f:	e8 e9 01 00 00       	call   42d <thread_join>
   assert(nested_join_pid == nested_thread_pid);
 244:	83 c4 10             	add    $0x10,%esp
 247:	39 c3                	cmp    %eax,%ebx
 249:	74 49                	je     294 <worker+0x182>
 24b:	6a 3f                	push   $0x3f
 24d:	68 20 0a 00 00       	push   $0xa20
 252:	68 2a 0a 00 00       	push   $0xa2a
 257:	6a 01                	push   $0x1
 259:	e8 12 05 00 00       	call   770 <printf>
 25e:	83 c4 0c             	add    $0xc,%esp
 261:	68 c8 0a 00 00       	push   $0xac8
 266:	68 41 0a 00 00       	push   $0xa41
 26b:	6a 01                	push   $0x1
 26d:	e8 fe 04 00 00       	call   770 <printf>
 272:	83 c4 08             	add    $0x8,%esp
 275:	68 55 0a 00 00       	push   $0xa55
 27a:	6a 01                	push   $0x1
 27c:	e8 ef 04 00 00       	call   770 <printf>
 281:	83 c4 04             	add    $0x4,%esp
 284:	ff 35 f4 0e 00 00    	push   0xef4
 28a:	e8 bc 03 00 00       	call   64b <kill>
 28f:	e8 87 03 00 00       	call   61b <exit>
   exit();
 294:	e8 82 03 00 00       	call   61b <exit>

00000299 <main>:
{
 299:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 29d:	83 e4 f0             	and    $0xfffffff0,%esp
 2a0:	ff 71 fc             	push   -0x4(%ecx)
 2a3:	55                   	push   %ebp
 2a4:	89 e5                	mov    %esp,%ebp
 2a6:	53                   	push   %ebx
 2a7:	51                   	push   %ecx
 2a8:	83 ec 10             	sub    $0x10,%esp
   ppid = getpid();
 2ab:	e8 eb 03 00 00       	call   69b <getpid>
 2b0:	a3 f4 0e 00 00       	mov    %eax,0xef4
   int arg1 = 35;
 2b5:	c7 45 f4 23 00 00 00 	movl   $0x23,-0xc(%ebp)
   int arg2 = 42;
 2bc:	c7 45 f0 2a 00 00 00 	movl   $0x2a,-0x10(%ebp)
   int thread_pid = thread_create(worker, &arg1, &arg2);
 2c3:	83 ec 04             	sub    $0x4,%esp
 2c6:	8d 45 f0             	lea    -0x10(%ebp),%eax
 2c9:	50                   	push   %eax
 2ca:	8d 45 f4             	lea    -0xc(%ebp),%eax
 2cd:	50                   	push   %eax
 2ce:	68 12 01 00 00       	push   $0x112
 2d3:	e8 23 01 00 00       	call   3fb <thread_create>
   assert(thread_pid > 0);
 2d8:	83 c4 10             	add    $0x10,%esp
 2db:	85 c0                	test   %eax,%eax
 2dd:	7e 65                	jle    344 <main+0xab>
 2df:	89 c3                	mov    %eax,%ebx
   int join_pid = thread_join();
 2e1:	e8 47 01 00 00       	call   42d <thread_join>
   assert(join_pid == thread_pid);
 2e6:	39 c3                	cmp    %eax,%ebx
 2e8:	0f 85 9f 00 00 00    	jne    38d <main+0xf4>
   assert(global == 3);
 2ee:	83 3d f0 0e 00 00 03 	cmpl   $0x3,0xef0
 2f5:	0f 84 db 00 00 00    	je     3d6 <main+0x13d>
 2fb:	6a 24                	push   $0x24
 2fd:	68 20 0a 00 00       	push   $0xa20
 302:	68 2a 0a 00 00       	push   $0xa2a
 307:	6a 01                	push   $0x1
 309:	e8 62 04 00 00       	call   770 <printf>
 30e:	83 c4 0c             	add    $0xc,%esp
 311:	68 af 0a 00 00       	push   $0xaaf
 316:	68 41 0a 00 00       	push   $0xa41
 31b:	6a 01                	push   $0x1
 31d:	e8 4e 04 00 00       	call   770 <printf>
 322:	83 c4 08             	add    $0x8,%esp
 325:	68 55 0a 00 00       	push   $0xa55
 32a:	6a 01                	push   $0x1
 32c:	e8 3f 04 00 00       	call   770 <printf>
 331:	83 c4 04             	add    $0x4,%esp
 334:	ff 35 f4 0e 00 00    	push   0xef4
 33a:	e8 0c 03 00 00       	call   64b <kill>
 33f:	e8 d7 02 00 00       	call   61b <exit>
   assert(thread_pid > 0);
 344:	6a 20                	push   $0x20
 346:	68 20 0a 00 00       	push   $0xa20
 34b:	68 2a 0a 00 00       	push   $0xa2a
 350:	6a 01                	push   $0x1
 352:	e8 19 04 00 00       	call   770 <printf>
 357:	83 c4 0c             	add    $0xc,%esp
 35a:	68 89 0a 00 00       	push   $0xa89
 35f:	68 41 0a 00 00       	push   $0xa41
 364:	6a 01                	push   $0x1
 366:	e8 05 04 00 00       	call   770 <printf>
 36b:	83 c4 08             	add    $0x8,%esp
 36e:	68 55 0a 00 00       	push   $0xa55
 373:	6a 01                	push   $0x1
 375:	e8 f6 03 00 00       	call   770 <printf>
 37a:	83 c4 04             	add    $0x4,%esp
 37d:	ff 35 f4 0e 00 00    	push   0xef4
 383:	e8 c3 02 00 00       	call   64b <kill>
 388:	e8 8e 02 00 00       	call   61b <exit>
   assert(join_pid == thread_pid);
 38d:	6a 23                	push   $0x23
 38f:	68 20 0a 00 00       	push   $0xa20
 394:	68 2a 0a 00 00       	push   $0xa2a
 399:	6a 01                	push   $0x1
 39b:	e8 d0 03 00 00       	call   770 <printf>
 3a0:	83 c4 0c             	add    $0xc,%esp
 3a3:	68 98 0a 00 00       	push   $0xa98
 3a8:	68 41 0a 00 00       	push   $0xa41
 3ad:	6a 01                	push   $0x1
 3af:	e8 bc 03 00 00       	call   770 <printf>
 3b4:	83 c4 08             	add    $0x8,%esp
 3b7:	68 55 0a 00 00       	push   $0xa55
 3bc:	6a 01                	push   $0x1
 3be:	e8 ad 03 00 00       	call   770 <printf>
 3c3:	83 c4 04             	add    $0x4,%esp
 3c6:	ff 35 f4 0e 00 00    	push   0xef4
 3cc:	e8 7a 02 00 00       	call   64b <kill>
 3d1:	e8 45 02 00 00       	call   61b <exit>
   printf(1, "TEST PASSED\n");
 3d6:	83 ec 08             	sub    $0x8,%esp
 3d9:	68 bb 0a 00 00       	push   $0xabb
 3de:	6a 01                	push   $0x1
 3e0:	e8 8b 03 00 00       	call   770 <printf>
   exit();
 3e5:	e8 31 02 00 00       	call   61b <exit>

000003ea <test_and_set>:
#include "fcntl.h"
#include "user.h"
#include "x86.h"
#include "mmu.h"

int test_and_set(int *old_ptr, int new_ptr) {
 3ea:	55                   	push   %ebp
 3eb:	89 e5                	mov    %esp,%ebp
 3ed:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *old_ptr;
 3f0:	8b 10                	mov    (%eax),%edx
  *old_ptr = new_ptr;
 3f2:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 3f5:	89 08                	mov    %ecx,(%eax)
  return old;
}
 3f7:	89 d0                	mov    %edx,%eax
 3f9:	5d                   	pop    %ebp
 3fa:	c3                   	ret    

000003fb <thread_create>:

// a wrapper func for clone
int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 3fb:	55                   	push   %ebp
 3fc:	89 e5                	mov    %esp,%ebp
 3fe:	83 ec 14             	sub    $0x14,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE*2);
 401:	68 00 20 00 00       	push   $0x2000
 406:	e8 8b 05 00 00       	call   996 <malloc>
  if(n_stack == 0){
 40b:	83 c4 10             	add    $0x10,%esp
 40e:	85 c0                	test   %eax,%eax
 410:	74 14                	je     426 <thread_create+0x2b>
    return -1;
  }
  int new_pid = clone(start_routine, arg1, arg2, n_stack); // TODO: is this the right way to call it?
 412:	50                   	push   %eax
 413:	ff 75 10             	push   0x10(%ebp)
 416:	ff 75 0c             	push   0xc(%ebp)
 419:	ff 75 08             	push   0x8(%ebp)
 41c:	e8 9a 02 00 00       	call   6bb <clone>


  // I can't remember if there was something else to do here but I'm sure I'll find out


  return new_pid;
 421:	83 c4 10             	add    $0x10,%esp
}
 424:	c9                   	leave  
 425:	c3                   	ret    
    return -1;
 426:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 42b:	eb f7                	jmp    424 <thread_create+0x29>

0000042d <thread_join>:

int thread_join() {
 42d:	55                   	push   %ebp
 42e:	89 e5                	mov    %esp,%ebp
 430:	83 ec 24             	sub    $0x24,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 433:	8d 45 f4             	lea    -0xc(%ebp),%eax
 436:	50                   	push   %eax
 437:	e8 87 02 00 00       	call   6c3 <join>
  
  return pid;
}
 43c:	c9                   	leave  
 43d:	c3                   	ret    

0000043e <lock_acquire>:

void lock_acquire(lock_t *lock){
 43e:	55                   	push   %ebp
 43f:	89 e5                	mov    %esp,%ebp
 441:	53                   	push   %ebx
 442:	83 ec 04             	sub    $0x4,%esp
 445:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 448:	83 ec 08             	sub    $0x8,%esp
 44b:	6a 01                	push   $0x1
 44d:	53                   	push   %ebx
 44e:	e8 97 ff ff ff       	call   3ea <test_and_set>
 453:	83 c4 10             	add    $0x10,%esp
 456:	83 f8 01             	cmp    $0x1,%eax
 459:	74 ed                	je     448 <lock_acquire+0xa>
    ;
}
 45b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 45e:	c9                   	leave  
 45f:	c3                   	ret    

00000460 <lock_release>:

void lock_release(lock_t *lock) {
 460:	55                   	push   %ebp
 461:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 463:	8b 45 08             	mov    0x8(%ebp),%eax
 466:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 46c:	5d                   	pop    %ebp
 46d:	c3                   	ret    

0000046e <lock_init>:

void lock_init(lock_t *lock) {
 46e:	55                   	push   %ebp
 46f:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 471:	8b 45 08             	mov    0x8(%ebp),%eax
 474:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 47a:	5d                   	pop    %ebp
 47b:	c3                   	ret    

0000047c <strcpy>:

char*
strcpy(char *s, const char *t)
{
 47c:	55                   	push   %ebp
 47d:	89 e5                	mov    %esp,%ebp
 47f:	56                   	push   %esi
 480:	53                   	push   %ebx
 481:	8b 75 08             	mov    0x8(%ebp),%esi
 484:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 487:	89 f0                	mov    %esi,%eax
 489:	89 d1                	mov    %edx,%ecx
 48b:	83 c2 01             	add    $0x1,%edx
 48e:	89 c3                	mov    %eax,%ebx
 490:	83 c0 01             	add    $0x1,%eax
 493:	0f b6 09             	movzbl (%ecx),%ecx
 496:	88 0b                	mov    %cl,(%ebx)
 498:	84 c9                	test   %cl,%cl
 49a:	75 ed                	jne    489 <strcpy+0xd>
    ;
  return os;
}
 49c:	89 f0                	mov    %esi,%eax
 49e:	5b                   	pop    %ebx
 49f:	5e                   	pop    %esi
 4a0:	5d                   	pop    %ebp
 4a1:	c3                   	ret    

000004a2 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 4a2:	55                   	push   %ebp
 4a3:	89 e5                	mov    %esp,%ebp
 4a5:	8b 4d 08             	mov    0x8(%ebp),%ecx
 4a8:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 4ab:	eb 06                	jmp    4b3 <strcmp+0x11>
    p++, q++;
 4ad:	83 c1 01             	add    $0x1,%ecx
 4b0:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 4b3:	0f b6 01             	movzbl (%ecx),%eax
 4b6:	84 c0                	test   %al,%al
 4b8:	74 04                	je     4be <strcmp+0x1c>
 4ba:	3a 02                	cmp    (%edx),%al
 4bc:	74 ef                	je     4ad <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 4be:	0f b6 c0             	movzbl %al,%eax
 4c1:	0f b6 12             	movzbl (%edx),%edx
 4c4:	29 d0                	sub    %edx,%eax
}
 4c6:	5d                   	pop    %ebp
 4c7:	c3                   	ret    

000004c8 <strlen>:

uint
strlen(const char *s)
{
 4c8:	55                   	push   %ebp
 4c9:	89 e5                	mov    %esp,%ebp
 4cb:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 4ce:	b8 00 00 00 00       	mov    $0x0,%eax
 4d3:	eb 03                	jmp    4d8 <strlen+0x10>
 4d5:	83 c0 01             	add    $0x1,%eax
 4d8:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 4dc:	75 f7                	jne    4d5 <strlen+0xd>
    ;
  return n;
}
 4de:	5d                   	pop    %ebp
 4df:	c3                   	ret    

000004e0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 4e0:	55                   	push   %ebp
 4e1:	89 e5                	mov    %esp,%ebp
 4e3:	57                   	push   %edi
 4e4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 4e7:	89 d7                	mov    %edx,%edi
 4e9:	8b 4d 10             	mov    0x10(%ebp),%ecx
 4ec:	8b 45 0c             	mov    0xc(%ebp),%eax
 4ef:	fc                   	cld    
 4f0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 4f2:	89 d0                	mov    %edx,%eax
 4f4:	8b 7d fc             	mov    -0x4(%ebp),%edi
 4f7:	c9                   	leave  
 4f8:	c3                   	ret    

000004f9 <strchr>:

char*
strchr(const char *s, char c)
{
 4f9:	55                   	push   %ebp
 4fa:	89 e5                	mov    %esp,%ebp
 4fc:	8b 45 08             	mov    0x8(%ebp),%eax
 4ff:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 503:	eb 03                	jmp    508 <strchr+0xf>
 505:	83 c0 01             	add    $0x1,%eax
 508:	0f b6 10             	movzbl (%eax),%edx
 50b:	84 d2                	test   %dl,%dl
 50d:	74 06                	je     515 <strchr+0x1c>
    if(*s == c)
 50f:	38 ca                	cmp    %cl,%dl
 511:	75 f2                	jne    505 <strchr+0xc>
 513:	eb 05                	jmp    51a <strchr+0x21>
      return (char*)s;
  return 0;
 515:	b8 00 00 00 00       	mov    $0x0,%eax
}
 51a:	5d                   	pop    %ebp
 51b:	c3                   	ret    

0000051c <gets>:

char*
gets(char *buf, int max)
{
 51c:	55                   	push   %ebp
 51d:	89 e5                	mov    %esp,%ebp
 51f:	57                   	push   %edi
 520:	56                   	push   %esi
 521:	53                   	push   %ebx
 522:	83 ec 1c             	sub    $0x1c,%esp
 525:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 528:	bb 00 00 00 00       	mov    $0x0,%ebx
 52d:	89 de                	mov    %ebx,%esi
 52f:	83 c3 01             	add    $0x1,%ebx
 532:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 535:	7d 2e                	jge    565 <gets+0x49>
    cc = read(0, &c, 1);
 537:	83 ec 04             	sub    $0x4,%esp
 53a:	6a 01                	push   $0x1
 53c:	8d 45 e7             	lea    -0x19(%ebp),%eax
 53f:	50                   	push   %eax
 540:	6a 00                	push   $0x0
 542:	e8 ec 00 00 00       	call   633 <read>
    if(cc < 1)
 547:	83 c4 10             	add    $0x10,%esp
 54a:	85 c0                	test   %eax,%eax
 54c:	7e 17                	jle    565 <gets+0x49>
      break;
    buf[i++] = c;
 54e:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 552:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 555:	3c 0a                	cmp    $0xa,%al
 557:	0f 94 c2             	sete   %dl
 55a:	3c 0d                	cmp    $0xd,%al
 55c:	0f 94 c0             	sete   %al
 55f:	08 c2                	or     %al,%dl
 561:	74 ca                	je     52d <gets+0x11>
    buf[i++] = c;
 563:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 565:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 569:	89 f8                	mov    %edi,%eax
 56b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 56e:	5b                   	pop    %ebx
 56f:	5e                   	pop    %esi
 570:	5f                   	pop    %edi
 571:	5d                   	pop    %ebp
 572:	c3                   	ret    

00000573 <stat>:

int
stat(const char *n, struct stat *st)
{
 573:	55                   	push   %ebp
 574:	89 e5                	mov    %esp,%ebp
 576:	56                   	push   %esi
 577:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 578:	83 ec 08             	sub    $0x8,%esp
 57b:	6a 00                	push   $0x0
 57d:	ff 75 08             	push   0x8(%ebp)
 580:	e8 d6 00 00 00       	call   65b <open>
  if(fd < 0)
 585:	83 c4 10             	add    $0x10,%esp
 588:	85 c0                	test   %eax,%eax
 58a:	78 24                	js     5b0 <stat+0x3d>
 58c:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 58e:	83 ec 08             	sub    $0x8,%esp
 591:	ff 75 0c             	push   0xc(%ebp)
 594:	50                   	push   %eax
 595:	e8 d9 00 00 00       	call   673 <fstat>
 59a:	89 c6                	mov    %eax,%esi
  close(fd);
 59c:	89 1c 24             	mov    %ebx,(%esp)
 59f:	e8 9f 00 00 00       	call   643 <close>
  return r;
 5a4:	83 c4 10             	add    $0x10,%esp
}
 5a7:	89 f0                	mov    %esi,%eax
 5a9:	8d 65 f8             	lea    -0x8(%ebp),%esp
 5ac:	5b                   	pop    %ebx
 5ad:	5e                   	pop    %esi
 5ae:	5d                   	pop    %ebp
 5af:	c3                   	ret    
    return -1;
 5b0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 5b5:	eb f0                	jmp    5a7 <stat+0x34>

000005b7 <atoi>:

int
atoi(const char *s)
{
 5b7:	55                   	push   %ebp
 5b8:	89 e5                	mov    %esp,%ebp
 5ba:	53                   	push   %ebx
 5bb:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 5be:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 5c3:	eb 10                	jmp    5d5 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 5c5:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 5c8:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 5cb:	83 c1 01             	add    $0x1,%ecx
 5ce:	0f be c0             	movsbl %al,%eax
 5d1:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 5d5:	0f b6 01             	movzbl (%ecx),%eax
 5d8:	8d 58 d0             	lea    -0x30(%eax),%ebx
 5db:	80 fb 09             	cmp    $0x9,%bl
 5de:	76 e5                	jbe    5c5 <atoi+0xe>
  return n;
}
 5e0:	89 d0                	mov    %edx,%eax
 5e2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5e5:	c9                   	leave  
 5e6:	c3                   	ret    

000005e7 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 5e7:	55                   	push   %ebp
 5e8:	89 e5                	mov    %esp,%ebp
 5ea:	56                   	push   %esi
 5eb:	53                   	push   %ebx
 5ec:	8b 75 08             	mov    0x8(%ebp),%esi
 5ef:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 5f2:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 5f5:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 5f7:	eb 0d                	jmp    606 <memmove+0x1f>
    *dst++ = *src++;
 5f9:	0f b6 01             	movzbl (%ecx),%eax
 5fc:	88 02                	mov    %al,(%edx)
 5fe:	8d 49 01             	lea    0x1(%ecx),%ecx
 601:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 604:	89 d8                	mov    %ebx,%eax
 606:	8d 58 ff             	lea    -0x1(%eax),%ebx
 609:	85 c0                	test   %eax,%eax
 60b:	7f ec                	jg     5f9 <memmove+0x12>
  return vdst;
}
 60d:	89 f0                	mov    %esi,%eax
 60f:	5b                   	pop    %ebx
 610:	5e                   	pop    %esi
 611:	5d                   	pop    %ebp
 612:	c3                   	ret    

00000613 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 613:	b8 01 00 00 00       	mov    $0x1,%eax
 618:	cd 40                	int    $0x40
 61a:	c3                   	ret    

0000061b <exit>:
SYSCALL(exit)
 61b:	b8 02 00 00 00       	mov    $0x2,%eax
 620:	cd 40                	int    $0x40
 622:	c3                   	ret    

00000623 <wait>:
SYSCALL(wait)
 623:	b8 03 00 00 00       	mov    $0x3,%eax
 628:	cd 40                	int    $0x40
 62a:	c3                   	ret    

0000062b <pipe>:
SYSCALL(pipe)
 62b:	b8 04 00 00 00       	mov    $0x4,%eax
 630:	cd 40                	int    $0x40
 632:	c3                   	ret    

00000633 <read>:
SYSCALL(read)
 633:	b8 05 00 00 00       	mov    $0x5,%eax
 638:	cd 40                	int    $0x40
 63a:	c3                   	ret    

0000063b <write>:
SYSCALL(write)
 63b:	b8 10 00 00 00       	mov    $0x10,%eax
 640:	cd 40                	int    $0x40
 642:	c3                   	ret    

00000643 <close>:
SYSCALL(close)
 643:	b8 15 00 00 00       	mov    $0x15,%eax
 648:	cd 40                	int    $0x40
 64a:	c3                   	ret    

0000064b <kill>:
SYSCALL(kill)
 64b:	b8 06 00 00 00       	mov    $0x6,%eax
 650:	cd 40                	int    $0x40
 652:	c3                   	ret    

00000653 <exec>:
SYSCALL(exec)
 653:	b8 07 00 00 00       	mov    $0x7,%eax
 658:	cd 40                	int    $0x40
 65a:	c3                   	ret    

0000065b <open>:
SYSCALL(open)
 65b:	b8 0f 00 00 00       	mov    $0xf,%eax
 660:	cd 40                	int    $0x40
 662:	c3                   	ret    

00000663 <mknod>:
SYSCALL(mknod)
 663:	b8 11 00 00 00       	mov    $0x11,%eax
 668:	cd 40                	int    $0x40
 66a:	c3                   	ret    

0000066b <unlink>:
SYSCALL(unlink)
 66b:	b8 12 00 00 00       	mov    $0x12,%eax
 670:	cd 40                	int    $0x40
 672:	c3                   	ret    

00000673 <fstat>:
SYSCALL(fstat)
 673:	b8 08 00 00 00       	mov    $0x8,%eax
 678:	cd 40                	int    $0x40
 67a:	c3                   	ret    

0000067b <link>:
SYSCALL(link)
 67b:	b8 13 00 00 00       	mov    $0x13,%eax
 680:	cd 40                	int    $0x40
 682:	c3                   	ret    

00000683 <mkdir>:
SYSCALL(mkdir)
 683:	b8 14 00 00 00       	mov    $0x14,%eax
 688:	cd 40                	int    $0x40
 68a:	c3                   	ret    

0000068b <chdir>:
SYSCALL(chdir)
 68b:	b8 09 00 00 00       	mov    $0x9,%eax
 690:	cd 40                	int    $0x40
 692:	c3                   	ret    

00000693 <dup>:
SYSCALL(dup)
 693:	b8 0a 00 00 00       	mov    $0xa,%eax
 698:	cd 40                	int    $0x40
 69a:	c3                   	ret    

0000069b <getpid>:
SYSCALL(getpid)
 69b:	b8 0b 00 00 00       	mov    $0xb,%eax
 6a0:	cd 40                	int    $0x40
 6a2:	c3                   	ret    

000006a3 <sbrk>:
SYSCALL(sbrk)
 6a3:	b8 0c 00 00 00       	mov    $0xc,%eax
 6a8:	cd 40                	int    $0x40
 6aa:	c3                   	ret    

000006ab <sleep>:
SYSCALL(sleep)
 6ab:	b8 0d 00 00 00       	mov    $0xd,%eax
 6b0:	cd 40                	int    $0x40
 6b2:	c3                   	ret    

000006b3 <uptime>:
SYSCALL(uptime)
 6b3:	b8 0e 00 00 00       	mov    $0xe,%eax
 6b8:	cd 40                	int    $0x40
 6ba:	c3                   	ret    

000006bb <clone>:
SYSCALL(clone)
 6bb:	b8 16 00 00 00       	mov    $0x16,%eax
 6c0:	cd 40                	int    $0x40
 6c2:	c3                   	ret    

000006c3 <join>:
 6c3:	b8 17 00 00 00       	mov    $0x17,%eax
 6c8:	cd 40                	int    $0x40
 6ca:	c3                   	ret    

000006cb <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 6cb:	55                   	push   %ebp
 6cc:	89 e5                	mov    %esp,%ebp
 6ce:	83 ec 1c             	sub    $0x1c,%esp
 6d1:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 6d4:	6a 01                	push   $0x1
 6d6:	8d 55 f4             	lea    -0xc(%ebp),%edx
 6d9:	52                   	push   %edx
 6da:	50                   	push   %eax
 6db:	e8 5b ff ff ff       	call   63b <write>
}
 6e0:	83 c4 10             	add    $0x10,%esp
 6e3:	c9                   	leave  
 6e4:	c3                   	ret    

000006e5 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 6e5:	55                   	push   %ebp
 6e6:	89 e5                	mov    %esp,%ebp
 6e8:	57                   	push   %edi
 6e9:	56                   	push   %esi
 6ea:	53                   	push   %ebx
 6eb:	83 ec 2c             	sub    $0x2c,%esp
 6ee:	89 45 d0             	mov    %eax,-0x30(%ebp)
 6f1:	89 d0                	mov    %edx,%eax
 6f3:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 6f5:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 6f9:	0f 95 c1             	setne  %cl
 6fc:	c1 ea 1f             	shr    $0x1f,%edx
 6ff:	84 d1                	test   %dl,%cl
 701:	74 44                	je     747 <printint+0x62>
    neg = 1;
    x = -xx;
 703:	f7 d8                	neg    %eax
 705:	89 c1                	mov    %eax,%ecx
    neg = 1;
 707:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 70e:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 713:	89 c8                	mov    %ecx,%eax
 715:	ba 00 00 00 00       	mov    $0x0,%edx
 71a:	f7 f6                	div    %esi
 71c:	89 df                	mov    %ebx,%edi
 71e:	83 c3 01             	add    $0x1,%ebx
 721:	0f b6 92 4c 0b 00 00 	movzbl 0xb4c(%edx),%edx
 728:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 72c:	89 ca                	mov    %ecx,%edx
 72e:	89 c1                	mov    %eax,%ecx
 730:	39 d6                	cmp    %edx,%esi
 732:	76 df                	jbe    713 <printint+0x2e>
  if(neg)
 734:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 738:	74 31                	je     76b <printint+0x86>
    buf[i++] = '-';
 73a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 73f:	8d 5f 02             	lea    0x2(%edi),%ebx
 742:	8b 75 d0             	mov    -0x30(%ebp),%esi
 745:	eb 17                	jmp    75e <printint+0x79>
    x = xx;
 747:	89 c1                	mov    %eax,%ecx
  neg = 0;
 749:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 750:	eb bc                	jmp    70e <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 752:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 757:	89 f0                	mov    %esi,%eax
 759:	e8 6d ff ff ff       	call   6cb <putc>
  while(--i >= 0)
 75e:	83 eb 01             	sub    $0x1,%ebx
 761:	79 ef                	jns    752 <printint+0x6d>
}
 763:	83 c4 2c             	add    $0x2c,%esp
 766:	5b                   	pop    %ebx
 767:	5e                   	pop    %esi
 768:	5f                   	pop    %edi
 769:	5d                   	pop    %ebp
 76a:	c3                   	ret    
 76b:	8b 75 d0             	mov    -0x30(%ebp),%esi
 76e:	eb ee                	jmp    75e <printint+0x79>

00000770 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 770:	55                   	push   %ebp
 771:	89 e5                	mov    %esp,%ebp
 773:	57                   	push   %edi
 774:	56                   	push   %esi
 775:	53                   	push   %ebx
 776:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 779:	8d 45 10             	lea    0x10(%ebp),%eax
 77c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 77f:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 784:	bb 00 00 00 00       	mov    $0x0,%ebx
 789:	eb 14                	jmp    79f <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 78b:	89 fa                	mov    %edi,%edx
 78d:	8b 45 08             	mov    0x8(%ebp),%eax
 790:	e8 36 ff ff ff       	call   6cb <putc>
 795:	eb 05                	jmp    79c <printf+0x2c>
      }
    } else if(state == '%'){
 797:	83 fe 25             	cmp    $0x25,%esi
 79a:	74 25                	je     7c1 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 79c:	83 c3 01             	add    $0x1,%ebx
 79f:	8b 45 0c             	mov    0xc(%ebp),%eax
 7a2:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 7a6:	84 c0                	test   %al,%al
 7a8:	0f 84 20 01 00 00    	je     8ce <printf+0x15e>
    c = fmt[i] & 0xff;
 7ae:	0f be f8             	movsbl %al,%edi
 7b1:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 7b4:	85 f6                	test   %esi,%esi
 7b6:	75 df                	jne    797 <printf+0x27>
      if(c == '%'){
 7b8:	83 f8 25             	cmp    $0x25,%eax
 7bb:	75 ce                	jne    78b <printf+0x1b>
        state = '%';
 7bd:	89 c6                	mov    %eax,%esi
 7bf:	eb db                	jmp    79c <printf+0x2c>
      if(c == 'd'){
 7c1:	83 f8 25             	cmp    $0x25,%eax
 7c4:	0f 84 cf 00 00 00    	je     899 <printf+0x129>
 7ca:	0f 8c dd 00 00 00    	jl     8ad <printf+0x13d>
 7d0:	83 f8 78             	cmp    $0x78,%eax
 7d3:	0f 8f d4 00 00 00    	jg     8ad <printf+0x13d>
 7d9:	83 f8 63             	cmp    $0x63,%eax
 7dc:	0f 8c cb 00 00 00    	jl     8ad <printf+0x13d>
 7e2:	83 e8 63             	sub    $0x63,%eax
 7e5:	83 f8 15             	cmp    $0x15,%eax
 7e8:	0f 87 bf 00 00 00    	ja     8ad <printf+0x13d>
 7ee:	ff 24 85 f4 0a 00 00 	jmp    *0xaf4(,%eax,4)
        printint(fd, *ap, 10, 1);
 7f5:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7f8:	8b 17                	mov    (%edi),%edx
 7fa:	83 ec 0c             	sub    $0xc,%esp
 7fd:	6a 01                	push   $0x1
 7ff:	b9 0a 00 00 00       	mov    $0xa,%ecx
 804:	8b 45 08             	mov    0x8(%ebp),%eax
 807:	e8 d9 fe ff ff       	call   6e5 <printint>
        ap++;
 80c:	83 c7 04             	add    $0x4,%edi
 80f:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 812:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 815:	be 00 00 00 00       	mov    $0x0,%esi
 81a:	eb 80                	jmp    79c <printf+0x2c>
        printint(fd, *ap, 16, 0);
 81c:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 81f:	8b 17                	mov    (%edi),%edx
 821:	83 ec 0c             	sub    $0xc,%esp
 824:	6a 00                	push   $0x0
 826:	b9 10 00 00 00       	mov    $0x10,%ecx
 82b:	8b 45 08             	mov    0x8(%ebp),%eax
 82e:	e8 b2 fe ff ff       	call   6e5 <printint>
        ap++;
 833:	83 c7 04             	add    $0x4,%edi
 836:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 839:	83 c4 10             	add    $0x10,%esp
      state = 0;
 83c:	be 00 00 00 00       	mov    $0x0,%esi
 841:	e9 56 ff ff ff       	jmp    79c <printf+0x2c>
        s = (char*)*ap;
 846:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 849:	8b 30                	mov    (%eax),%esi
        ap++;
 84b:	83 c0 04             	add    $0x4,%eax
 84e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 851:	85 f6                	test   %esi,%esi
 853:	75 15                	jne    86a <printf+0xfa>
          s = "(null)";
 855:	be ed 0a 00 00       	mov    $0xaed,%esi
 85a:	eb 0e                	jmp    86a <printf+0xfa>
          putc(fd, *s);
 85c:	0f be d2             	movsbl %dl,%edx
 85f:	8b 45 08             	mov    0x8(%ebp),%eax
 862:	e8 64 fe ff ff       	call   6cb <putc>
          s++;
 867:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 86a:	0f b6 16             	movzbl (%esi),%edx
 86d:	84 d2                	test   %dl,%dl
 86f:	75 eb                	jne    85c <printf+0xec>
      state = 0;
 871:	be 00 00 00 00       	mov    $0x0,%esi
 876:	e9 21 ff ff ff       	jmp    79c <printf+0x2c>
        putc(fd, *ap);
 87b:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 87e:	0f be 17             	movsbl (%edi),%edx
 881:	8b 45 08             	mov    0x8(%ebp),%eax
 884:	e8 42 fe ff ff       	call   6cb <putc>
        ap++;
 889:	83 c7 04             	add    $0x4,%edi
 88c:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 88f:	be 00 00 00 00       	mov    $0x0,%esi
 894:	e9 03 ff ff ff       	jmp    79c <printf+0x2c>
        putc(fd, c);
 899:	89 fa                	mov    %edi,%edx
 89b:	8b 45 08             	mov    0x8(%ebp),%eax
 89e:	e8 28 fe ff ff       	call   6cb <putc>
      state = 0;
 8a3:	be 00 00 00 00       	mov    $0x0,%esi
 8a8:	e9 ef fe ff ff       	jmp    79c <printf+0x2c>
        putc(fd, '%');
 8ad:	ba 25 00 00 00       	mov    $0x25,%edx
 8b2:	8b 45 08             	mov    0x8(%ebp),%eax
 8b5:	e8 11 fe ff ff       	call   6cb <putc>
        putc(fd, c);
 8ba:	89 fa                	mov    %edi,%edx
 8bc:	8b 45 08             	mov    0x8(%ebp),%eax
 8bf:	e8 07 fe ff ff       	call   6cb <putc>
      state = 0;
 8c4:	be 00 00 00 00       	mov    $0x0,%esi
 8c9:	e9 ce fe ff ff       	jmp    79c <printf+0x2c>
    }
  }
}
 8ce:	8d 65 f4             	lea    -0xc(%ebp),%esp
 8d1:	5b                   	pop    %ebx
 8d2:	5e                   	pop    %esi
 8d3:	5f                   	pop    %edi
 8d4:	5d                   	pop    %ebp
 8d5:	c3                   	ret    

000008d6 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 8d6:	55                   	push   %ebp
 8d7:	89 e5                	mov    %esp,%ebp
 8d9:	57                   	push   %edi
 8da:	56                   	push   %esi
 8db:	53                   	push   %ebx
 8dc:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 8df:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8e2:	a1 f8 0e 00 00       	mov    0xef8,%eax
 8e7:	eb 02                	jmp    8eb <free+0x15>
 8e9:	89 d0                	mov    %edx,%eax
 8eb:	39 c8                	cmp    %ecx,%eax
 8ed:	73 04                	jae    8f3 <free+0x1d>
 8ef:	39 08                	cmp    %ecx,(%eax)
 8f1:	77 12                	ja     905 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8f3:	8b 10                	mov    (%eax),%edx
 8f5:	39 c2                	cmp    %eax,%edx
 8f7:	77 f0                	ja     8e9 <free+0x13>
 8f9:	39 c8                	cmp    %ecx,%eax
 8fb:	72 08                	jb     905 <free+0x2f>
 8fd:	39 ca                	cmp    %ecx,%edx
 8ff:	77 04                	ja     905 <free+0x2f>
 901:	89 d0                	mov    %edx,%eax
 903:	eb e6                	jmp    8eb <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 905:	8b 73 fc             	mov    -0x4(%ebx),%esi
 908:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 90b:	8b 10                	mov    (%eax),%edx
 90d:	39 d7                	cmp    %edx,%edi
 90f:	74 19                	je     92a <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 911:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 914:	8b 50 04             	mov    0x4(%eax),%edx
 917:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 91a:	39 ce                	cmp    %ecx,%esi
 91c:	74 1b                	je     939 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 91e:	89 08                	mov    %ecx,(%eax)
  freep = p;
 920:	a3 f8 0e 00 00       	mov    %eax,0xef8
}
 925:	5b                   	pop    %ebx
 926:	5e                   	pop    %esi
 927:	5f                   	pop    %edi
 928:	5d                   	pop    %ebp
 929:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 92a:	03 72 04             	add    0x4(%edx),%esi
 92d:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 930:	8b 10                	mov    (%eax),%edx
 932:	8b 12                	mov    (%edx),%edx
 934:	89 53 f8             	mov    %edx,-0x8(%ebx)
 937:	eb db                	jmp    914 <free+0x3e>
    p->s.size += bp->s.size;
 939:	03 53 fc             	add    -0x4(%ebx),%edx
 93c:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 93f:	8b 53 f8             	mov    -0x8(%ebx),%edx
 942:	89 10                	mov    %edx,(%eax)
 944:	eb da                	jmp    920 <free+0x4a>

00000946 <morecore>:

static Header*
morecore(uint nu)
{
 946:	55                   	push   %ebp
 947:	89 e5                	mov    %esp,%ebp
 949:	53                   	push   %ebx
 94a:	83 ec 04             	sub    $0x4,%esp
 94d:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 94f:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 954:	77 05                	ja     95b <morecore+0x15>
    nu = 4096;
 956:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 95b:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 962:	83 ec 0c             	sub    $0xc,%esp
 965:	50                   	push   %eax
 966:	e8 38 fd ff ff       	call   6a3 <sbrk>
  if(p == (char*)-1)
 96b:	83 c4 10             	add    $0x10,%esp
 96e:	83 f8 ff             	cmp    $0xffffffff,%eax
 971:	74 1c                	je     98f <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 973:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 976:	83 c0 08             	add    $0x8,%eax
 979:	83 ec 0c             	sub    $0xc,%esp
 97c:	50                   	push   %eax
 97d:	e8 54 ff ff ff       	call   8d6 <free>
  return freep;
 982:	a1 f8 0e 00 00       	mov    0xef8,%eax
 987:	83 c4 10             	add    $0x10,%esp
}
 98a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 98d:	c9                   	leave  
 98e:	c3                   	ret    
    return 0;
 98f:	b8 00 00 00 00       	mov    $0x0,%eax
 994:	eb f4                	jmp    98a <morecore+0x44>

00000996 <malloc>:

void*
malloc(uint nbytes)
{
 996:	55                   	push   %ebp
 997:	89 e5                	mov    %esp,%ebp
 999:	53                   	push   %ebx
 99a:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 99d:	8b 45 08             	mov    0x8(%ebp),%eax
 9a0:	8d 58 07             	lea    0x7(%eax),%ebx
 9a3:	c1 eb 03             	shr    $0x3,%ebx
 9a6:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 9a9:	8b 0d f8 0e 00 00    	mov    0xef8,%ecx
 9af:	85 c9                	test   %ecx,%ecx
 9b1:	74 04                	je     9b7 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9b3:	8b 01                	mov    (%ecx),%eax
 9b5:	eb 4a                	jmp    a01 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 9b7:	c7 05 f8 0e 00 00 fc 	movl   $0xefc,0xef8
 9be:	0e 00 00 
 9c1:	c7 05 fc 0e 00 00 fc 	movl   $0xefc,0xefc
 9c8:	0e 00 00 
    base.s.size = 0;
 9cb:	c7 05 00 0f 00 00 00 	movl   $0x0,0xf00
 9d2:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 9d5:	b9 fc 0e 00 00       	mov    $0xefc,%ecx
 9da:	eb d7                	jmp    9b3 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 9dc:	74 19                	je     9f7 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 9de:	29 da                	sub    %ebx,%edx
 9e0:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 9e3:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 9e6:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 9e9:	89 0d f8 0e 00 00    	mov    %ecx,0xef8
      return (void*)(p + 1);
 9ef:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 9f2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 9f5:	c9                   	leave  
 9f6:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 9f7:	8b 10                	mov    (%eax),%edx
 9f9:	89 11                	mov    %edx,(%ecx)
 9fb:	eb ec                	jmp    9e9 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9fd:	89 c1                	mov    %eax,%ecx
 9ff:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 a01:	8b 50 04             	mov    0x4(%eax),%edx
 a04:	39 da                	cmp    %ebx,%edx
 a06:	73 d4                	jae    9dc <malloc+0x46>
    if(p == freep)
 a08:	39 05 f8 0e 00 00    	cmp    %eax,0xef8
 a0e:	75 ed                	jne    9fd <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 a10:	89 d8                	mov    %ebx,%eax
 a12:	e8 2f ff ff ff       	call   946 <morecore>
 a17:	85 c0                	test   %eax,%eax
 a19:	75 e2                	jne    9fd <malloc+0x67>
 a1b:	eb d5                	jmp    9f2 <malloc+0x5c>
