
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
  1c:	a1 d8 0e 00 00       	mov    0xed8,%eax
  21:	83 f8 02             	cmp    $0x2,%eax
  24:	0f 84 db 00 00 00    	je     105 <nested_worker+0x105>
  2a:	6a 30                	push   $0x30
  2c:	68 14 0a 00 00       	push   $0xa14
  31:	68 1e 0a 00 00       	push   $0xa1e
  36:	6a 01                	push   $0x1
  38:	e8 28 07 00 00       	call   765 <printf>
  3d:	83 c4 0c             	add    $0xc,%esp
  40:	68 65 0a 00 00       	push   $0xa65
  45:	68 35 0a 00 00       	push   $0xa35
  4a:	6a 01                	push   $0x1
  4c:	e8 14 07 00 00       	call   765 <printf>
  51:	83 c4 08             	add    $0x8,%esp
  54:	68 49 0a 00 00       	push   $0xa49
  59:	6a 01                	push   $0x1
  5b:	e8 05 07 00 00       	call   765 <printf>
  60:	83 c4 04             	add    $0x4,%esp
  63:	ff 35 dc 0e 00 00    	push   0xedc
  69:	e8 d2 05 00 00       	call   640 <kill>
  6e:	e8 9d 05 00 00       	call   610 <exit>
   assert(arg1_int == 35);
  73:	6a 2e                	push   $0x2e
  75:	68 14 0a 00 00       	push   $0xa14
  7a:	68 1e 0a 00 00       	push   $0xa1e
  7f:	6a 01                	push   $0x1
  81:	e8 df 06 00 00       	call   765 <printf>
  86:	83 c4 0c             	add    $0xc,%esp
  89:	68 26 0a 00 00       	push   $0xa26
  8e:	68 35 0a 00 00       	push   $0xa35
  93:	6a 01                	push   $0x1
  95:	e8 cb 06 00 00       	call   765 <printf>
  9a:	83 c4 08             	add    $0x8,%esp
  9d:	68 49 0a 00 00       	push   $0xa49
  a2:	6a 01                	push   $0x1
  a4:	e8 bc 06 00 00       	call   765 <printf>
  a9:	83 c4 04             	add    $0x4,%esp
  ac:	ff 35 dc 0e 00 00    	push   0xedc
  b2:	e8 89 05 00 00       	call   640 <kill>
  b7:	e8 54 05 00 00       	call   610 <exit>
   assert(arg2_int == 42);
  bc:	6a 2f                	push   $0x2f
  be:	68 14 0a 00 00       	push   $0xa14
  c3:	68 1e 0a 00 00       	push   $0xa1e
  c8:	6a 01                	push   $0x1
  ca:	e8 96 06 00 00       	call   765 <printf>
  cf:	83 c4 0c             	add    $0xc,%esp
  d2:	68 56 0a 00 00       	push   $0xa56
  d7:	68 35 0a 00 00       	push   $0xa35
  dc:	6a 01                	push   $0x1
  de:	e8 82 06 00 00       	call   765 <printf>
  e3:	83 c4 08             	add    $0x8,%esp
  e6:	68 49 0a 00 00       	push   $0xa49
  eb:	6a 01                	push   $0x1
  ed:	e8 73 06 00 00       	call   765 <printf>
  f2:	83 c4 04             	add    $0x4,%esp
  f5:	ff 35 dc 0e 00 00    	push   0xedc
  fb:	e8 40 05 00 00       	call   640 <kill>
 100:	e8 0b 05 00 00       	call   610 <exit>
   global++;
 105:	83 c0 01             	add    $0x1,%eax
 108:	a3 d8 0e 00 00       	mov    %eax,0xed8
   exit();
 10d:	e8 fe 04 00 00       	call   610 <exit>

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
 137:	a1 d8 0e 00 00       	mov    0xed8,%eax
 13c:	83 f8 01             	cmp    $0x1,%eax
 13f:	0f 84 db 00 00 00    	je     220 <worker+0x10e>
 145:	6a 3b                	push   $0x3b
 147:	68 14 0a 00 00       	push   $0xa14
 14c:	68 1e 0a 00 00       	push   $0xa1e
 151:	6a 01                	push   $0x1
 153:	e8 0d 06 00 00       	call   765 <printf>
 158:	83 c4 0c             	add    $0xc,%esp
 15b:	68 71 0a 00 00       	push   $0xa71
 160:	68 35 0a 00 00       	push   $0xa35
 165:	6a 01                	push   $0x1
 167:	e8 f9 05 00 00       	call   765 <printf>
 16c:	83 c4 08             	add    $0x8,%esp
 16f:	68 49 0a 00 00       	push   $0xa49
 174:	6a 01                	push   $0x1
 176:	e8 ea 05 00 00       	call   765 <printf>
 17b:	83 c4 04             	add    $0x4,%esp
 17e:	ff 35 dc 0e 00 00    	push   0xedc
 184:	e8 b7 04 00 00       	call   640 <kill>
 189:	e8 82 04 00 00       	call   610 <exit>
   assert(arg1_int == 35);
 18e:	6a 39                	push   $0x39
 190:	68 14 0a 00 00       	push   $0xa14
 195:	68 1e 0a 00 00       	push   $0xa1e
 19a:	6a 01                	push   $0x1
 19c:	e8 c4 05 00 00       	call   765 <printf>
 1a1:	83 c4 0c             	add    $0xc,%esp
 1a4:	68 26 0a 00 00       	push   $0xa26
 1a9:	68 35 0a 00 00       	push   $0xa35
 1ae:	6a 01                	push   $0x1
 1b0:	e8 b0 05 00 00       	call   765 <printf>
 1b5:	83 c4 08             	add    $0x8,%esp
 1b8:	68 49 0a 00 00       	push   $0xa49
 1bd:	6a 01                	push   $0x1
 1bf:	e8 a1 05 00 00       	call   765 <printf>
 1c4:	83 c4 04             	add    $0x4,%esp
 1c7:	ff 35 dc 0e 00 00    	push   0xedc
 1cd:	e8 6e 04 00 00       	call   640 <kill>
 1d2:	e8 39 04 00 00       	call   610 <exit>
   assert(arg2_int == 42);
 1d7:	6a 3a                	push   $0x3a
 1d9:	68 14 0a 00 00       	push   $0xa14
 1de:	68 1e 0a 00 00       	push   $0xa1e
 1e3:	6a 01                	push   $0x1
 1e5:	e8 7b 05 00 00       	call   765 <printf>
 1ea:	83 c4 0c             	add    $0xc,%esp
 1ed:	68 56 0a 00 00       	push   $0xa56
 1f2:	68 35 0a 00 00       	push   $0xa35
 1f7:	6a 01                	push   $0x1
 1f9:	e8 67 05 00 00       	call   765 <printf>
 1fe:	83 c4 08             	add    $0x8,%esp
 201:	68 49 0a 00 00       	push   $0xa49
 206:	6a 01                	push   $0x1
 208:	e8 58 05 00 00       	call   765 <printf>
 20d:	83 c4 04             	add    $0x4,%esp
 210:	ff 35 dc 0e 00 00    	push   0xedc
 216:	e8 25 04 00 00       	call   640 <kill>
 21b:	e8 f0 03 00 00       	call   610 <exit>
   global++;
 220:	83 c0 01             	add    $0x1,%eax
 223:	a3 d8 0e 00 00       	mov    %eax,0xed8
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
 24d:	68 14 0a 00 00       	push   $0xa14
 252:	68 1e 0a 00 00       	push   $0xa1e
 257:	6a 01                	push   $0x1
 259:	e8 07 05 00 00       	call   765 <printf>
 25e:	83 c4 0c             	add    $0xc,%esp
 261:	68 bc 0a 00 00       	push   $0xabc
 266:	68 35 0a 00 00       	push   $0xa35
 26b:	6a 01                	push   $0x1
 26d:	e8 f3 04 00 00       	call   765 <printf>
 272:	83 c4 08             	add    $0x8,%esp
 275:	68 49 0a 00 00       	push   $0xa49
 27a:	6a 01                	push   $0x1
 27c:	e8 e4 04 00 00       	call   765 <printf>
 281:	83 c4 04             	add    $0x4,%esp
 284:	ff 35 dc 0e 00 00    	push   0xedc
 28a:	e8 b1 03 00 00       	call   640 <kill>
 28f:	e8 7c 03 00 00       	call   610 <exit>
   exit();
 294:	e8 77 03 00 00       	call   610 <exit>

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
 2ab:	e8 e0 03 00 00       	call   690 <getpid>
 2b0:	a3 dc 0e 00 00       	mov    %eax,0xedc
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
 2ee:	83 3d d8 0e 00 00 03 	cmpl   $0x3,0xed8
 2f5:	0f 84 db 00 00 00    	je     3d6 <main+0x13d>
 2fb:	6a 24                	push   $0x24
 2fd:	68 14 0a 00 00       	push   $0xa14
 302:	68 1e 0a 00 00       	push   $0xa1e
 307:	6a 01                	push   $0x1
 309:	e8 57 04 00 00       	call   765 <printf>
 30e:	83 c4 0c             	add    $0xc,%esp
 311:	68 a3 0a 00 00       	push   $0xaa3
 316:	68 35 0a 00 00       	push   $0xa35
 31b:	6a 01                	push   $0x1
 31d:	e8 43 04 00 00       	call   765 <printf>
 322:	83 c4 08             	add    $0x8,%esp
 325:	68 49 0a 00 00       	push   $0xa49
 32a:	6a 01                	push   $0x1
 32c:	e8 34 04 00 00       	call   765 <printf>
 331:	83 c4 04             	add    $0x4,%esp
 334:	ff 35 dc 0e 00 00    	push   0xedc
 33a:	e8 01 03 00 00       	call   640 <kill>
 33f:	e8 cc 02 00 00       	call   610 <exit>
   assert(thread_pid > 0);
 344:	6a 20                	push   $0x20
 346:	68 14 0a 00 00       	push   $0xa14
 34b:	68 1e 0a 00 00       	push   $0xa1e
 350:	6a 01                	push   $0x1
 352:	e8 0e 04 00 00       	call   765 <printf>
 357:	83 c4 0c             	add    $0xc,%esp
 35a:	68 7d 0a 00 00       	push   $0xa7d
 35f:	68 35 0a 00 00       	push   $0xa35
 364:	6a 01                	push   $0x1
 366:	e8 fa 03 00 00       	call   765 <printf>
 36b:	83 c4 08             	add    $0x8,%esp
 36e:	68 49 0a 00 00       	push   $0xa49
 373:	6a 01                	push   $0x1
 375:	e8 eb 03 00 00       	call   765 <printf>
 37a:	83 c4 04             	add    $0x4,%esp
 37d:	ff 35 dc 0e 00 00    	push   0xedc
 383:	e8 b8 02 00 00       	call   640 <kill>
 388:	e8 83 02 00 00       	call   610 <exit>
   assert(join_pid == thread_pid);
 38d:	6a 23                	push   $0x23
 38f:	68 14 0a 00 00       	push   $0xa14
 394:	68 1e 0a 00 00       	push   $0xa1e
 399:	6a 01                	push   $0x1
 39b:	e8 c5 03 00 00       	call   765 <printf>
 3a0:	83 c4 0c             	add    $0xc,%esp
 3a3:	68 8c 0a 00 00       	push   $0xa8c
 3a8:	68 35 0a 00 00       	push   $0xa35
 3ad:	6a 01                	push   $0x1
 3af:	e8 b1 03 00 00       	call   765 <printf>
 3b4:	83 c4 08             	add    $0x8,%esp
 3b7:	68 49 0a 00 00       	push   $0xa49
 3bc:	6a 01                	push   $0x1
 3be:	e8 a2 03 00 00       	call   765 <printf>
 3c3:	83 c4 04             	add    $0x4,%esp
 3c6:	ff 35 dc 0e 00 00    	push   0xedc
 3cc:	e8 6f 02 00 00       	call   640 <kill>
 3d1:	e8 3a 02 00 00       	call   610 <exit>
   printf(1, "TEST PASSED\n");
 3d6:	83 ec 08             	sub    $0x8,%esp
 3d9:	68 af 0a 00 00       	push   $0xaaf
 3de:	6a 01                	push   $0x1
 3e0:	e8 80 03 00 00       	call   765 <printf>
   exit();
 3e5:	e8 26 02 00 00       	call   610 <exit>

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
  void *n_stack = malloc(PGSIZE);
 401:	68 00 10 00 00       	push   $0x1000
 406:	e8 80 05 00 00       	call   98b <malloc>
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
 41c:	e8 8f 02 00 00       	call   6b0 <clone>


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
  return 0;
}
 42d:	b8 00 00 00 00       	mov    $0x0,%eax
 432:	c3                   	ret    

00000433 <lock_acquire>:

void lock_acquire(lock_t *lock){
 433:	55                   	push   %ebp
 434:	89 e5                	mov    %esp,%ebp
 436:	53                   	push   %ebx
 437:	83 ec 04             	sub    $0x4,%esp
 43a:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 43d:	83 ec 08             	sub    $0x8,%esp
 440:	6a 01                	push   $0x1
 442:	53                   	push   %ebx
 443:	e8 a2 ff ff ff       	call   3ea <test_and_set>
 448:	83 c4 10             	add    $0x10,%esp
 44b:	83 f8 01             	cmp    $0x1,%eax
 44e:	74 ed                	je     43d <lock_acquire+0xa>
    ;
}
 450:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 453:	c9                   	leave  
 454:	c3                   	ret    

00000455 <lock_release>:

void lock_release(lock_t *lock) {
 455:	55                   	push   %ebp
 456:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 458:	8b 45 08             	mov    0x8(%ebp),%eax
 45b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 461:	5d                   	pop    %ebp
 462:	c3                   	ret    

00000463 <lock_init>:

void lock_init(lock_t *lock) {
 463:	55                   	push   %ebp
 464:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 466:	8b 45 08             	mov    0x8(%ebp),%eax
 469:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 46f:	5d                   	pop    %ebp
 470:	c3                   	ret    

00000471 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 471:	55                   	push   %ebp
 472:	89 e5                	mov    %esp,%ebp
 474:	56                   	push   %esi
 475:	53                   	push   %ebx
 476:	8b 75 08             	mov    0x8(%ebp),%esi
 479:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 47c:	89 f0                	mov    %esi,%eax
 47e:	89 d1                	mov    %edx,%ecx
 480:	83 c2 01             	add    $0x1,%edx
 483:	89 c3                	mov    %eax,%ebx
 485:	83 c0 01             	add    $0x1,%eax
 488:	0f b6 09             	movzbl (%ecx),%ecx
 48b:	88 0b                	mov    %cl,(%ebx)
 48d:	84 c9                	test   %cl,%cl
 48f:	75 ed                	jne    47e <strcpy+0xd>
    ;
  return os;
}
 491:	89 f0                	mov    %esi,%eax
 493:	5b                   	pop    %ebx
 494:	5e                   	pop    %esi
 495:	5d                   	pop    %ebp
 496:	c3                   	ret    

00000497 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 497:	55                   	push   %ebp
 498:	89 e5                	mov    %esp,%ebp
 49a:	8b 4d 08             	mov    0x8(%ebp),%ecx
 49d:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 4a0:	eb 06                	jmp    4a8 <strcmp+0x11>
    p++, q++;
 4a2:	83 c1 01             	add    $0x1,%ecx
 4a5:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 4a8:	0f b6 01             	movzbl (%ecx),%eax
 4ab:	84 c0                	test   %al,%al
 4ad:	74 04                	je     4b3 <strcmp+0x1c>
 4af:	3a 02                	cmp    (%edx),%al
 4b1:	74 ef                	je     4a2 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 4b3:	0f b6 c0             	movzbl %al,%eax
 4b6:	0f b6 12             	movzbl (%edx),%edx
 4b9:	29 d0                	sub    %edx,%eax
}
 4bb:	5d                   	pop    %ebp
 4bc:	c3                   	ret    

000004bd <strlen>:

uint
strlen(const char *s)
{
 4bd:	55                   	push   %ebp
 4be:	89 e5                	mov    %esp,%ebp
 4c0:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 4c3:	b8 00 00 00 00       	mov    $0x0,%eax
 4c8:	eb 03                	jmp    4cd <strlen+0x10>
 4ca:	83 c0 01             	add    $0x1,%eax
 4cd:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 4d1:	75 f7                	jne    4ca <strlen+0xd>
    ;
  return n;
}
 4d3:	5d                   	pop    %ebp
 4d4:	c3                   	ret    

000004d5 <memset>:

void*
memset(void *dst, int c, uint n)
{
 4d5:	55                   	push   %ebp
 4d6:	89 e5                	mov    %esp,%ebp
 4d8:	57                   	push   %edi
 4d9:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 4dc:	89 d7                	mov    %edx,%edi
 4de:	8b 4d 10             	mov    0x10(%ebp),%ecx
 4e1:	8b 45 0c             	mov    0xc(%ebp),%eax
 4e4:	fc                   	cld    
 4e5:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 4e7:	89 d0                	mov    %edx,%eax
 4e9:	8b 7d fc             	mov    -0x4(%ebp),%edi
 4ec:	c9                   	leave  
 4ed:	c3                   	ret    

000004ee <strchr>:

char*
strchr(const char *s, char c)
{
 4ee:	55                   	push   %ebp
 4ef:	89 e5                	mov    %esp,%ebp
 4f1:	8b 45 08             	mov    0x8(%ebp),%eax
 4f4:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 4f8:	eb 03                	jmp    4fd <strchr+0xf>
 4fa:	83 c0 01             	add    $0x1,%eax
 4fd:	0f b6 10             	movzbl (%eax),%edx
 500:	84 d2                	test   %dl,%dl
 502:	74 06                	je     50a <strchr+0x1c>
    if(*s == c)
 504:	38 ca                	cmp    %cl,%dl
 506:	75 f2                	jne    4fa <strchr+0xc>
 508:	eb 05                	jmp    50f <strchr+0x21>
      return (char*)s;
  return 0;
 50a:	b8 00 00 00 00       	mov    $0x0,%eax
}
 50f:	5d                   	pop    %ebp
 510:	c3                   	ret    

00000511 <gets>:

char*
gets(char *buf, int max)
{
 511:	55                   	push   %ebp
 512:	89 e5                	mov    %esp,%ebp
 514:	57                   	push   %edi
 515:	56                   	push   %esi
 516:	53                   	push   %ebx
 517:	83 ec 1c             	sub    $0x1c,%esp
 51a:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 51d:	bb 00 00 00 00       	mov    $0x0,%ebx
 522:	89 de                	mov    %ebx,%esi
 524:	83 c3 01             	add    $0x1,%ebx
 527:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 52a:	7d 2e                	jge    55a <gets+0x49>
    cc = read(0, &c, 1);
 52c:	83 ec 04             	sub    $0x4,%esp
 52f:	6a 01                	push   $0x1
 531:	8d 45 e7             	lea    -0x19(%ebp),%eax
 534:	50                   	push   %eax
 535:	6a 00                	push   $0x0
 537:	e8 ec 00 00 00       	call   628 <read>
    if(cc < 1)
 53c:	83 c4 10             	add    $0x10,%esp
 53f:	85 c0                	test   %eax,%eax
 541:	7e 17                	jle    55a <gets+0x49>
      break;
    buf[i++] = c;
 543:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 547:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 54a:	3c 0a                	cmp    $0xa,%al
 54c:	0f 94 c2             	sete   %dl
 54f:	3c 0d                	cmp    $0xd,%al
 551:	0f 94 c0             	sete   %al
 554:	08 c2                	or     %al,%dl
 556:	74 ca                	je     522 <gets+0x11>
    buf[i++] = c;
 558:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 55a:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 55e:	89 f8                	mov    %edi,%eax
 560:	8d 65 f4             	lea    -0xc(%ebp),%esp
 563:	5b                   	pop    %ebx
 564:	5e                   	pop    %esi
 565:	5f                   	pop    %edi
 566:	5d                   	pop    %ebp
 567:	c3                   	ret    

00000568 <stat>:

int
stat(const char *n, struct stat *st)
{
 568:	55                   	push   %ebp
 569:	89 e5                	mov    %esp,%ebp
 56b:	56                   	push   %esi
 56c:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 56d:	83 ec 08             	sub    $0x8,%esp
 570:	6a 00                	push   $0x0
 572:	ff 75 08             	push   0x8(%ebp)
 575:	e8 d6 00 00 00       	call   650 <open>
  if(fd < 0)
 57a:	83 c4 10             	add    $0x10,%esp
 57d:	85 c0                	test   %eax,%eax
 57f:	78 24                	js     5a5 <stat+0x3d>
 581:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 583:	83 ec 08             	sub    $0x8,%esp
 586:	ff 75 0c             	push   0xc(%ebp)
 589:	50                   	push   %eax
 58a:	e8 d9 00 00 00       	call   668 <fstat>
 58f:	89 c6                	mov    %eax,%esi
  close(fd);
 591:	89 1c 24             	mov    %ebx,(%esp)
 594:	e8 9f 00 00 00       	call   638 <close>
  return r;
 599:	83 c4 10             	add    $0x10,%esp
}
 59c:	89 f0                	mov    %esi,%eax
 59e:	8d 65 f8             	lea    -0x8(%ebp),%esp
 5a1:	5b                   	pop    %ebx
 5a2:	5e                   	pop    %esi
 5a3:	5d                   	pop    %ebp
 5a4:	c3                   	ret    
    return -1;
 5a5:	be ff ff ff ff       	mov    $0xffffffff,%esi
 5aa:	eb f0                	jmp    59c <stat+0x34>

000005ac <atoi>:

int
atoi(const char *s)
{
 5ac:	55                   	push   %ebp
 5ad:	89 e5                	mov    %esp,%ebp
 5af:	53                   	push   %ebx
 5b0:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 5b3:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 5b8:	eb 10                	jmp    5ca <atoi+0x1e>
    n = n*10 + *s++ - '0';
 5ba:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 5bd:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 5c0:	83 c1 01             	add    $0x1,%ecx
 5c3:	0f be c0             	movsbl %al,%eax
 5c6:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 5ca:	0f b6 01             	movzbl (%ecx),%eax
 5cd:	8d 58 d0             	lea    -0x30(%eax),%ebx
 5d0:	80 fb 09             	cmp    $0x9,%bl
 5d3:	76 e5                	jbe    5ba <atoi+0xe>
  return n;
}
 5d5:	89 d0                	mov    %edx,%eax
 5d7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5da:	c9                   	leave  
 5db:	c3                   	ret    

000005dc <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 5dc:	55                   	push   %ebp
 5dd:	89 e5                	mov    %esp,%ebp
 5df:	56                   	push   %esi
 5e0:	53                   	push   %ebx
 5e1:	8b 75 08             	mov    0x8(%ebp),%esi
 5e4:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 5e7:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 5ea:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 5ec:	eb 0d                	jmp    5fb <memmove+0x1f>
    *dst++ = *src++;
 5ee:	0f b6 01             	movzbl (%ecx),%eax
 5f1:	88 02                	mov    %al,(%edx)
 5f3:	8d 49 01             	lea    0x1(%ecx),%ecx
 5f6:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 5f9:	89 d8                	mov    %ebx,%eax
 5fb:	8d 58 ff             	lea    -0x1(%eax),%ebx
 5fe:	85 c0                	test   %eax,%eax
 600:	7f ec                	jg     5ee <memmove+0x12>
  return vdst;
}
 602:	89 f0                	mov    %esi,%eax
 604:	5b                   	pop    %ebx
 605:	5e                   	pop    %esi
 606:	5d                   	pop    %ebp
 607:	c3                   	ret    

00000608 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 608:	b8 01 00 00 00       	mov    $0x1,%eax
 60d:	cd 40                	int    $0x40
 60f:	c3                   	ret    

00000610 <exit>:
SYSCALL(exit)
 610:	b8 02 00 00 00       	mov    $0x2,%eax
 615:	cd 40                	int    $0x40
 617:	c3                   	ret    

00000618 <wait>:
SYSCALL(wait)
 618:	b8 03 00 00 00       	mov    $0x3,%eax
 61d:	cd 40                	int    $0x40
 61f:	c3                   	ret    

00000620 <pipe>:
SYSCALL(pipe)
 620:	b8 04 00 00 00       	mov    $0x4,%eax
 625:	cd 40                	int    $0x40
 627:	c3                   	ret    

00000628 <read>:
SYSCALL(read)
 628:	b8 05 00 00 00       	mov    $0x5,%eax
 62d:	cd 40                	int    $0x40
 62f:	c3                   	ret    

00000630 <write>:
SYSCALL(write)
 630:	b8 10 00 00 00       	mov    $0x10,%eax
 635:	cd 40                	int    $0x40
 637:	c3                   	ret    

00000638 <close>:
SYSCALL(close)
 638:	b8 15 00 00 00       	mov    $0x15,%eax
 63d:	cd 40                	int    $0x40
 63f:	c3                   	ret    

00000640 <kill>:
SYSCALL(kill)
 640:	b8 06 00 00 00       	mov    $0x6,%eax
 645:	cd 40                	int    $0x40
 647:	c3                   	ret    

00000648 <exec>:
SYSCALL(exec)
 648:	b8 07 00 00 00       	mov    $0x7,%eax
 64d:	cd 40                	int    $0x40
 64f:	c3                   	ret    

00000650 <open>:
SYSCALL(open)
 650:	b8 0f 00 00 00       	mov    $0xf,%eax
 655:	cd 40                	int    $0x40
 657:	c3                   	ret    

00000658 <mknod>:
SYSCALL(mknod)
 658:	b8 11 00 00 00       	mov    $0x11,%eax
 65d:	cd 40                	int    $0x40
 65f:	c3                   	ret    

00000660 <unlink>:
SYSCALL(unlink)
 660:	b8 12 00 00 00       	mov    $0x12,%eax
 665:	cd 40                	int    $0x40
 667:	c3                   	ret    

00000668 <fstat>:
SYSCALL(fstat)
 668:	b8 08 00 00 00       	mov    $0x8,%eax
 66d:	cd 40                	int    $0x40
 66f:	c3                   	ret    

00000670 <link>:
SYSCALL(link)
 670:	b8 13 00 00 00       	mov    $0x13,%eax
 675:	cd 40                	int    $0x40
 677:	c3                   	ret    

00000678 <mkdir>:
SYSCALL(mkdir)
 678:	b8 14 00 00 00       	mov    $0x14,%eax
 67d:	cd 40                	int    $0x40
 67f:	c3                   	ret    

00000680 <chdir>:
SYSCALL(chdir)
 680:	b8 09 00 00 00       	mov    $0x9,%eax
 685:	cd 40                	int    $0x40
 687:	c3                   	ret    

00000688 <dup>:
SYSCALL(dup)
 688:	b8 0a 00 00 00       	mov    $0xa,%eax
 68d:	cd 40                	int    $0x40
 68f:	c3                   	ret    

00000690 <getpid>:
SYSCALL(getpid)
 690:	b8 0b 00 00 00       	mov    $0xb,%eax
 695:	cd 40                	int    $0x40
 697:	c3                   	ret    

00000698 <sbrk>:
SYSCALL(sbrk)
 698:	b8 0c 00 00 00       	mov    $0xc,%eax
 69d:	cd 40                	int    $0x40
 69f:	c3                   	ret    

000006a0 <sleep>:
SYSCALL(sleep)
 6a0:	b8 0d 00 00 00       	mov    $0xd,%eax
 6a5:	cd 40                	int    $0x40
 6a7:	c3                   	ret    

000006a8 <uptime>:
SYSCALL(uptime)
 6a8:	b8 0e 00 00 00       	mov    $0xe,%eax
 6ad:	cd 40                	int    $0x40
 6af:	c3                   	ret    

000006b0 <clone>:
SYSCALL(clone)
 6b0:	b8 16 00 00 00       	mov    $0x16,%eax
 6b5:	cd 40                	int    $0x40
 6b7:	c3                   	ret    

000006b8 <join>:
 6b8:	b8 17 00 00 00       	mov    $0x17,%eax
 6bd:	cd 40                	int    $0x40
 6bf:	c3                   	ret    

000006c0 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 6c0:	55                   	push   %ebp
 6c1:	89 e5                	mov    %esp,%ebp
 6c3:	83 ec 1c             	sub    $0x1c,%esp
 6c6:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 6c9:	6a 01                	push   $0x1
 6cb:	8d 55 f4             	lea    -0xc(%ebp),%edx
 6ce:	52                   	push   %edx
 6cf:	50                   	push   %eax
 6d0:	e8 5b ff ff ff       	call   630 <write>
}
 6d5:	83 c4 10             	add    $0x10,%esp
 6d8:	c9                   	leave  
 6d9:	c3                   	ret    

000006da <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 6da:	55                   	push   %ebp
 6db:	89 e5                	mov    %esp,%ebp
 6dd:	57                   	push   %edi
 6de:	56                   	push   %esi
 6df:	53                   	push   %ebx
 6e0:	83 ec 2c             	sub    $0x2c,%esp
 6e3:	89 45 d0             	mov    %eax,-0x30(%ebp)
 6e6:	89 d0                	mov    %edx,%eax
 6e8:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 6ea:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 6ee:	0f 95 c1             	setne  %cl
 6f1:	c1 ea 1f             	shr    $0x1f,%edx
 6f4:	84 d1                	test   %dl,%cl
 6f6:	74 44                	je     73c <printint+0x62>
    neg = 1;
    x = -xx;
 6f8:	f7 d8                	neg    %eax
 6fa:	89 c1                	mov    %eax,%ecx
    neg = 1;
 6fc:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 703:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 708:	89 c8                	mov    %ecx,%eax
 70a:	ba 00 00 00 00       	mov    $0x0,%edx
 70f:	f7 f6                	div    %esi
 711:	89 df                	mov    %ebx,%edi
 713:	83 c3 01             	add    $0x1,%ebx
 716:	0f b6 92 40 0b 00 00 	movzbl 0xb40(%edx),%edx
 71d:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 721:	89 ca                	mov    %ecx,%edx
 723:	89 c1                	mov    %eax,%ecx
 725:	39 d6                	cmp    %edx,%esi
 727:	76 df                	jbe    708 <printint+0x2e>
  if(neg)
 729:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 72d:	74 31                	je     760 <printint+0x86>
    buf[i++] = '-';
 72f:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 734:	8d 5f 02             	lea    0x2(%edi),%ebx
 737:	8b 75 d0             	mov    -0x30(%ebp),%esi
 73a:	eb 17                	jmp    753 <printint+0x79>
    x = xx;
 73c:	89 c1                	mov    %eax,%ecx
  neg = 0;
 73e:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 745:	eb bc                	jmp    703 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 747:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 74c:	89 f0                	mov    %esi,%eax
 74e:	e8 6d ff ff ff       	call   6c0 <putc>
  while(--i >= 0)
 753:	83 eb 01             	sub    $0x1,%ebx
 756:	79 ef                	jns    747 <printint+0x6d>
}
 758:	83 c4 2c             	add    $0x2c,%esp
 75b:	5b                   	pop    %ebx
 75c:	5e                   	pop    %esi
 75d:	5f                   	pop    %edi
 75e:	5d                   	pop    %ebp
 75f:	c3                   	ret    
 760:	8b 75 d0             	mov    -0x30(%ebp),%esi
 763:	eb ee                	jmp    753 <printint+0x79>

00000765 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 765:	55                   	push   %ebp
 766:	89 e5                	mov    %esp,%ebp
 768:	57                   	push   %edi
 769:	56                   	push   %esi
 76a:	53                   	push   %ebx
 76b:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 76e:	8d 45 10             	lea    0x10(%ebp),%eax
 771:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 774:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 779:	bb 00 00 00 00       	mov    $0x0,%ebx
 77e:	eb 14                	jmp    794 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 780:	89 fa                	mov    %edi,%edx
 782:	8b 45 08             	mov    0x8(%ebp),%eax
 785:	e8 36 ff ff ff       	call   6c0 <putc>
 78a:	eb 05                	jmp    791 <printf+0x2c>
      }
    } else if(state == '%'){
 78c:	83 fe 25             	cmp    $0x25,%esi
 78f:	74 25                	je     7b6 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 791:	83 c3 01             	add    $0x1,%ebx
 794:	8b 45 0c             	mov    0xc(%ebp),%eax
 797:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 79b:	84 c0                	test   %al,%al
 79d:	0f 84 20 01 00 00    	je     8c3 <printf+0x15e>
    c = fmt[i] & 0xff;
 7a3:	0f be f8             	movsbl %al,%edi
 7a6:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 7a9:	85 f6                	test   %esi,%esi
 7ab:	75 df                	jne    78c <printf+0x27>
      if(c == '%'){
 7ad:	83 f8 25             	cmp    $0x25,%eax
 7b0:	75 ce                	jne    780 <printf+0x1b>
        state = '%';
 7b2:	89 c6                	mov    %eax,%esi
 7b4:	eb db                	jmp    791 <printf+0x2c>
      if(c == 'd'){
 7b6:	83 f8 25             	cmp    $0x25,%eax
 7b9:	0f 84 cf 00 00 00    	je     88e <printf+0x129>
 7bf:	0f 8c dd 00 00 00    	jl     8a2 <printf+0x13d>
 7c5:	83 f8 78             	cmp    $0x78,%eax
 7c8:	0f 8f d4 00 00 00    	jg     8a2 <printf+0x13d>
 7ce:	83 f8 63             	cmp    $0x63,%eax
 7d1:	0f 8c cb 00 00 00    	jl     8a2 <printf+0x13d>
 7d7:	83 e8 63             	sub    $0x63,%eax
 7da:	83 f8 15             	cmp    $0x15,%eax
 7dd:	0f 87 bf 00 00 00    	ja     8a2 <printf+0x13d>
 7e3:	ff 24 85 e8 0a 00 00 	jmp    *0xae8(,%eax,4)
        printint(fd, *ap, 10, 1);
 7ea:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7ed:	8b 17                	mov    (%edi),%edx
 7ef:	83 ec 0c             	sub    $0xc,%esp
 7f2:	6a 01                	push   $0x1
 7f4:	b9 0a 00 00 00       	mov    $0xa,%ecx
 7f9:	8b 45 08             	mov    0x8(%ebp),%eax
 7fc:	e8 d9 fe ff ff       	call   6da <printint>
        ap++;
 801:	83 c7 04             	add    $0x4,%edi
 804:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 807:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 80a:	be 00 00 00 00       	mov    $0x0,%esi
 80f:	eb 80                	jmp    791 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 811:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 814:	8b 17                	mov    (%edi),%edx
 816:	83 ec 0c             	sub    $0xc,%esp
 819:	6a 00                	push   $0x0
 81b:	b9 10 00 00 00       	mov    $0x10,%ecx
 820:	8b 45 08             	mov    0x8(%ebp),%eax
 823:	e8 b2 fe ff ff       	call   6da <printint>
        ap++;
 828:	83 c7 04             	add    $0x4,%edi
 82b:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 82e:	83 c4 10             	add    $0x10,%esp
      state = 0;
 831:	be 00 00 00 00       	mov    $0x0,%esi
 836:	e9 56 ff ff ff       	jmp    791 <printf+0x2c>
        s = (char*)*ap;
 83b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 83e:	8b 30                	mov    (%eax),%esi
        ap++;
 840:	83 c0 04             	add    $0x4,%eax
 843:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 846:	85 f6                	test   %esi,%esi
 848:	75 15                	jne    85f <printf+0xfa>
          s = "(null)";
 84a:	be e1 0a 00 00       	mov    $0xae1,%esi
 84f:	eb 0e                	jmp    85f <printf+0xfa>
          putc(fd, *s);
 851:	0f be d2             	movsbl %dl,%edx
 854:	8b 45 08             	mov    0x8(%ebp),%eax
 857:	e8 64 fe ff ff       	call   6c0 <putc>
          s++;
 85c:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 85f:	0f b6 16             	movzbl (%esi),%edx
 862:	84 d2                	test   %dl,%dl
 864:	75 eb                	jne    851 <printf+0xec>
      state = 0;
 866:	be 00 00 00 00       	mov    $0x0,%esi
 86b:	e9 21 ff ff ff       	jmp    791 <printf+0x2c>
        putc(fd, *ap);
 870:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 873:	0f be 17             	movsbl (%edi),%edx
 876:	8b 45 08             	mov    0x8(%ebp),%eax
 879:	e8 42 fe ff ff       	call   6c0 <putc>
        ap++;
 87e:	83 c7 04             	add    $0x4,%edi
 881:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 884:	be 00 00 00 00       	mov    $0x0,%esi
 889:	e9 03 ff ff ff       	jmp    791 <printf+0x2c>
        putc(fd, c);
 88e:	89 fa                	mov    %edi,%edx
 890:	8b 45 08             	mov    0x8(%ebp),%eax
 893:	e8 28 fe ff ff       	call   6c0 <putc>
      state = 0;
 898:	be 00 00 00 00       	mov    $0x0,%esi
 89d:	e9 ef fe ff ff       	jmp    791 <printf+0x2c>
        putc(fd, '%');
 8a2:	ba 25 00 00 00       	mov    $0x25,%edx
 8a7:	8b 45 08             	mov    0x8(%ebp),%eax
 8aa:	e8 11 fe ff ff       	call   6c0 <putc>
        putc(fd, c);
 8af:	89 fa                	mov    %edi,%edx
 8b1:	8b 45 08             	mov    0x8(%ebp),%eax
 8b4:	e8 07 fe ff ff       	call   6c0 <putc>
      state = 0;
 8b9:	be 00 00 00 00       	mov    $0x0,%esi
 8be:	e9 ce fe ff ff       	jmp    791 <printf+0x2c>
    }
  }
}
 8c3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 8c6:	5b                   	pop    %ebx
 8c7:	5e                   	pop    %esi
 8c8:	5f                   	pop    %edi
 8c9:	5d                   	pop    %ebp
 8ca:	c3                   	ret    

000008cb <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 8cb:	55                   	push   %ebp
 8cc:	89 e5                	mov    %esp,%ebp
 8ce:	57                   	push   %edi
 8cf:	56                   	push   %esi
 8d0:	53                   	push   %ebx
 8d1:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 8d4:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8d7:	a1 e0 0e 00 00       	mov    0xee0,%eax
 8dc:	eb 02                	jmp    8e0 <free+0x15>
 8de:	89 d0                	mov    %edx,%eax
 8e0:	39 c8                	cmp    %ecx,%eax
 8e2:	73 04                	jae    8e8 <free+0x1d>
 8e4:	39 08                	cmp    %ecx,(%eax)
 8e6:	77 12                	ja     8fa <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8e8:	8b 10                	mov    (%eax),%edx
 8ea:	39 c2                	cmp    %eax,%edx
 8ec:	77 f0                	ja     8de <free+0x13>
 8ee:	39 c8                	cmp    %ecx,%eax
 8f0:	72 08                	jb     8fa <free+0x2f>
 8f2:	39 ca                	cmp    %ecx,%edx
 8f4:	77 04                	ja     8fa <free+0x2f>
 8f6:	89 d0                	mov    %edx,%eax
 8f8:	eb e6                	jmp    8e0 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 8fa:	8b 73 fc             	mov    -0x4(%ebx),%esi
 8fd:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 900:	8b 10                	mov    (%eax),%edx
 902:	39 d7                	cmp    %edx,%edi
 904:	74 19                	je     91f <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 906:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 909:	8b 50 04             	mov    0x4(%eax),%edx
 90c:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 90f:	39 ce                	cmp    %ecx,%esi
 911:	74 1b                	je     92e <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 913:	89 08                	mov    %ecx,(%eax)
  freep = p;
 915:	a3 e0 0e 00 00       	mov    %eax,0xee0
}
 91a:	5b                   	pop    %ebx
 91b:	5e                   	pop    %esi
 91c:	5f                   	pop    %edi
 91d:	5d                   	pop    %ebp
 91e:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 91f:	03 72 04             	add    0x4(%edx),%esi
 922:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 925:	8b 10                	mov    (%eax),%edx
 927:	8b 12                	mov    (%edx),%edx
 929:	89 53 f8             	mov    %edx,-0x8(%ebx)
 92c:	eb db                	jmp    909 <free+0x3e>
    p->s.size += bp->s.size;
 92e:	03 53 fc             	add    -0x4(%ebx),%edx
 931:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 934:	8b 53 f8             	mov    -0x8(%ebx),%edx
 937:	89 10                	mov    %edx,(%eax)
 939:	eb da                	jmp    915 <free+0x4a>

0000093b <morecore>:

static Header*
morecore(uint nu)
{
 93b:	55                   	push   %ebp
 93c:	89 e5                	mov    %esp,%ebp
 93e:	53                   	push   %ebx
 93f:	83 ec 04             	sub    $0x4,%esp
 942:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 944:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 949:	77 05                	ja     950 <morecore+0x15>
    nu = 4096;
 94b:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 950:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 957:	83 ec 0c             	sub    $0xc,%esp
 95a:	50                   	push   %eax
 95b:	e8 38 fd ff ff       	call   698 <sbrk>
  if(p == (char*)-1)
 960:	83 c4 10             	add    $0x10,%esp
 963:	83 f8 ff             	cmp    $0xffffffff,%eax
 966:	74 1c                	je     984 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 968:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 96b:	83 c0 08             	add    $0x8,%eax
 96e:	83 ec 0c             	sub    $0xc,%esp
 971:	50                   	push   %eax
 972:	e8 54 ff ff ff       	call   8cb <free>
  return freep;
 977:	a1 e0 0e 00 00       	mov    0xee0,%eax
 97c:	83 c4 10             	add    $0x10,%esp
}
 97f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 982:	c9                   	leave  
 983:	c3                   	ret    
    return 0;
 984:	b8 00 00 00 00       	mov    $0x0,%eax
 989:	eb f4                	jmp    97f <morecore+0x44>

0000098b <malloc>:

void*
malloc(uint nbytes)
{
 98b:	55                   	push   %ebp
 98c:	89 e5                	mov    %esp,%ebp
 98e:	53                   	push   %ebx
 98f:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 992:	8b 45 08             	mov    0x8(%ebp),%eax
 995:	8d 58 07             	lea    0x7(%eax),%ebx
 998:	c1 eb 03             	shr    $0x3,%ebx
 99b:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 99e:	8b 0d e0 0e 00 00    	mov    0xee0,%ecx
 9a4:	85 c9                	test   %ecx,%ecx
 9a6:	74 04                	je     9ac <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9a8:	8b 01                	mov    (%ecx),%eax
 9aa:	eb 4a                	jmp    9f6 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 9ac:	c7 05 e0 0e 00 00 e4 	movl   $0xee4,0xee0
 9b3:	0e 00 00 
 9b6:	c7 05 e4 0e 00 00 e4 	movl   $0xee4,0xee4
 9bd:	0e 00 00 
    base.s.size = 0;
 9c0:	c7 05 e8 0e 00 00 00 	movl   $0x0,0xee8
 9c7:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 9ca:	b9 e4 0e 00 00       	mov    $0xee4,%ecx
 9cf:	eb d7                	jmp    9a8 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 9d1:	74 19                	je     9ec <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 9d3:	29 da                	sub    %ebx,%edx
 9d5:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 9d8:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 9db:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 9de:	89 0d e0 0e 00 00    	mov    %ecx,0xee0
      return (void*)(p + 1);
 9e4:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 9e7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 9ea:	c9                   	leave  
 9eb:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 9ec:	8b 10                	mov    (%eax),%edx
 9ee:	89 11                	mov    %edx,(%ecx)
 9f0:	eb ec                	jmp    9de <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9f2:	89 c1                	mov    %eax,%ecx
 9f4:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 9f6:	8b 50 04             	mov    0x4(%eax),%edx
 9f9:	39 da                	cmp    %ebx,%edx
 9fb:	73 d4                	jae    9d1 <malloc+0x46>
    if(p == freep)
 9fd:	39 05 e0 0e 00 00    	cmp    %eax,0xee0
 a03:	75 ed                	jne    9f2 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 a05:	89 d8                	mov    %ebx,%eax
 a07:	e8 2f ff ff ff       	call   93b <morecore>
 a0c:	85 c0                	test   %eax,%eax
 a0e:	75 e2                	jne    9f2 <malloc+0x67>
 a10:	eb d5                	jmp    9e7 <malloc+0x5c>
