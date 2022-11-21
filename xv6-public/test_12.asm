
_test_12:     file format elf32-i386


Disassembly of section .text:

00000000 <worker>:
   
   exit();
}


void worker(void *arg1, void *arg2) {
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 14             	sub    $0x14,%esp
   lock_acquire(&lock);
   6:	68 30 0f 00 00       	push   $0xf30
   b:	e8 a7 04 00 00       	call   4b7 <lock_acquire>
   assert((unsigned int)sbrk(0) == size);
  10:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  17:	e8 00 07 00 00       	call   71c <sbrk>
  1c:	83 c4 10             	add    $0x10,%esp
  1f:	3b 05 34 0f 00 00    	cmp    0xf34,%eax
  25:	74 49                	je     70 <worker+0x70>
  27:	6a 5b                	push   $0x5b
  29:	68 98 0a 00 00       	push   $0xa98
  2e:	68 a2 0a 00 00       	push   $0xaa2
  33:	6a 01                	push   $0x1
  35:	e8 af 07 00 00       	call   7e9 <printf>
  3a:	83 c4 0c             	add    $0xc,%esp
  3d:	68 aa 0a 00 00       	push   $0xaaa
  42:	68 c8 0a 00 00       	push   $0xac8
  47:	6a 01                	push   $0x1
  49:	e8 9b 07 00 00       	call   7e9 <printf>
  4e:	83 c4 08             	add    $0x8,%esp
  51:	68 dc 0a 00 00       	push   $0xadc
  56:	6a 01                	push   $0x1
  58:	e8 8c 07 00 00       	call   7e9 <printf>
  5d:	83 c4 04             	add    $0x4,%esp
  60:	ff 35 3c 0f 00 00    	push   0xf3c
  66:	e8 59 06 00 00       	call   6c4 <kill>
  6b:	e8 24 06 00 00       	call   694 <exit>
   global++;
  70:	83 05 38 0f 00 00 01 	addl   $0x1,0xf38
   lock_release(&lock);
  77:	83 ec 0c             	sub    $0xc,%esp
  7a:	68 30 0f 00 00       	push   $0xf30
  7f:	e8 55 04 00 00       	call   4d9 <lock_release>

   


   lock_acquire(&lock2);
  84:	c7 04 24 2c 0f 00 00 	movl   $0xf2c,(%esp)
  8b:	e8 27 04 00 00       	call   4b7 <lock_acquire>
   assert((unsigned int)sbrk(0) == size);
  90:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  97:	e8 80 06 00 00       	call   71c <sbrk>
  9c:	83 c4 10             	add    $0x10,%esp
  9f:	3b 05 34 0f 00 00    	cmp    0xf34,%eax
  a5:	74 49                	je     f0 <worker+0xf0>
  a7:	6a 63                	push   $0x63
  a9:	68 98 0a 00 00       	push   $0xa98
  ae:	68 a2 0a 00 00       	push   $0xaa2
  b3:	6a 01                	push   $0x1
  b5:	e8 2f 07 00 00       	call   7e9 <printf>
  ba:	83 c4 0c             	add    $0xc,%esp
  bd:	68 aa 0a 00 00       	push   $0xaaa
  c2:	68 c8 0a 00 00       	push   $0xac8
  c7:	6a 01                	push   $0x1
  c9:	e8 1b 07 00 00       	call   7e9 <printf>
  ce:	83 c4 08             	add    $0x8,%esp
  d1:	68 dc 0a 00 00       	push   $0xadc
  d6:	6a 01                	push   $0x1
  d8:	e8 0c 07 00 00       	call   7e9 <printf>
  dd:	83 c4 04             	add    $0x4,%esp
  e0:	ff 35 3c 0f 00 00    	push   0xf3c
  e6:	e8 d9 05 00 00       	call   6c4 <kill>
  eb:	e8 a4 05 00 00       	call   694 <exit>
   global++;
  f0:	83 05 38 0f 00 00 01 	addl   $0x1,0xf38
   sbrk(10000);
  f7:	83 ec 0c             	sub    $0xc,%esp
  fa:	68 10 27 00 00       	push   $0x2710
  ff:	e8 18 06 00 00       	call   71c <sbrk>
   size = (unsigned int)sbrk(0);
 104:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 10b:	e8 0c 06 00 00       	call   71c <sbrk>
 110:	a3 34 0f 00 00       	mov    %eax,0xf34
   lock_release(&lock2);
 115:	c7 04 24 2c 0f 00 00 	movl   $0xf2c,(%esp)
 11c:	e8 b8 03 00 00       	call   4d9 <lock_release>



   exit();
 121:	e8 6e 05 00 00       	call   694 <exit>

00000126 <main>:
{
 126:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 12a:	83 e4 f0             	and    $0xfffffff0,%esp
 12d:	ff 71 fc             	push   -0x4(%ecx)
 130:	55                   	push   %ebp
 131:	89 e5                	mov    %esp,%ebp
 133:	53                   	push   %ebx
 134:	51                   	push   %ecx
 135:	83 ec 10             	sub    $0x10,%esp
   ppid = getpid();
 138:	e8 d7 05 00 00       	call   714 <getpid>
 13d:	a3 3c 0f 00 00       	mov    %eax,0xf3c
   int arg1 = 11, arg2 = 22;
 142:	c7 45 f4 0b 00 00 00 	movl   $0xb,-0xc(%ebp)
 149:	c7 45 f0 16 00 00 00 	movl   $0x16,-0x10(%ebp)
   lock_init(&lock);
 150:	83 ec 0c             	sub    $0xc,%esp
 153:	68 30 0f 00 00       	push   $0xf30
 158:	e8 8a 03 00 00       	call   4e7 <lock_init>
   lock_init(&lock2);
 15d:	c7 04 24 2c 0f 00 00 	movl   $0xf2c,(%esp)
 164:	e8 7e 03 00 00       	call   4e7 <lock_init>
   lock_acquire(&lock);
 169:	c7 04 24 30 0f 00 00 	movl   $0xf30,(%esp)
 170:	e8 42 03 00 00       	call   4b7 <lock_acquire>
   lock_acquire(&lock2);
 175:	c7 04 24 2c 0f 00 00 	movl   $0xf2c,(%esp)
 17c:	e8 36 03 00 00       	call   4b7 <lock_acquire>
   for (int i = 0; i < num_threads; i++) {
 181:	83 c4 10             	add    $0x10,%esp
 184:	bb 00 00 00 00       	mov    $0x0,%ebx
 189:	eb 03                	jmp    18e <main+0x68>
 18b:	83 c3 01             	add    $0x1,%ebx
 18e:	39 1d 28 0f 00 00    	cmp    %ebx,0xf28
 194:	7e 65                	jle    1fb <main+0xd5>
      int thread_pid = thread_create(worker, &arg1, &arg2);
 196:	83 ec 04             	sub    $0x4,%esp
 199:	8d 45 f0             	lea    -0x10(%ebp),%eax
 19c:	50                   	push   %eax
 19d:	8d 45 f4             	lea    -0xc(%ebp),%eax
 1a0:	50                   	push   %eax
 1a1:	68 00 00 00 00       	push   $0x0
 1a6:	e8 d4 02 00 00       	call   47f <thread_create>
      assert(thread_pid > 0);
 1ab:	83 c4 10             	add    $0x10,%esp
 1ae:	85 c0                	test   %eax,%eax
 1b0:	7f d9                	jg     18b <main+0x65>
 1b2:	6a 28                	push   $0x28
 1b4:	68 98 0a 00 00       	push   $0xa98
 1b9:	68 a2 0a 00 00       	push   $0xaa2
 1be:	6a 01                	push   $0x1
 1c0:	e8 24 06 00 00       	call   7e9 <printf>
 1c5:	83 c4 0c             	add    $0xc,%esp
 1c8:	68 e9 0a 00 00       	push   $0xae9
 1cd:	68 c8 0a 00 00       	push   $0xac8
 1d2:	6a 01                	push   $0x1
 1d4:	e8 10 06 00 00       	call   7e9 <printf>
 1d9:	83 c4 08             	add    $0x8,%esp
 1dc:	68 dc 0a 00 00       	push   $0xadc
 1e1:	6a 01                	push   $0x1
 1e3:	e8 01 06 00 00       	call   7e9 <printf>
 1e8:	83 c4 04             	add    $0x4,%esp
 1eb:	ff 35 3c 0f 00 00    	push   0xf3c
 1f1:	e8 ce 04 00 00       	call   6c4 <kill>
 1f6:	e8 99 04 00 00       	call   694 <exit>
   size = (unsigned int)sbrk(0);
 1fb:	83 ec 0c             	sub    $0xc,%esp
 1fe:	6a 00                	push   $0x0
 200:	e8 17 05 00 00       	call   71c <sbrk>
 205:	a3 34 0f 00 00       	mov    %eax,0xf34
   while (global < num_threads) {
 20a:	83 c4 10             	add    $0x10,%esp
 20d:	a1 28 0f 00 00       	mov    0xf28,%eax
 212:	39 05 38 0f 00 00    	cmp    %eax,0xf38
 218:	7d 2a                	jge    244 <main+0x11e>
      lock_release(&lock);
 21a:	83 ec 0c             	sub    $0xc,%esp
 21d:	68 30 0f 00 00       	push   $0xf30
 222:	e8 b2 02 00 00       	call   4d9 <lock_release>
      sleep(100);
 227:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 22e:	e8 f1 04 00 00       	call   724 <sleep>
      lock_acquire(&lock);
 233:	c7 04 24 30 0f 00 00 	movl   $0xf30,(%esp)
 23a:	e8 78 02 00 00       	call   4b7 <lock_acquire>
 23f:	83 c4 10             	add    $0x10,%esp
 242:	eb c9                	jmp    20d <main+0xe7>
   global = 0;
 244:	c7 05 38 0f 00 00 00 	movl   $0x0,0xf38
 24b:	00 00 00 
   sbrk(10000);
 24e:	83 ec 0c             	sub    $0xc,%esp
 251:	68 10 27 00 00       	push   $0x2710
 256:	e8 c1 04 00 00       	call   71c <sbrk>
   size = (unsigned int)sbrk(0);
 25b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 262:	e8 b5 04 00 00       	call   71c <sbrk>
 267:	a3 34 0f 00 00       	mov    %eax,0xf34
   lock_release(&lock);
 26c:	c7 04 24 30 0f 00 00 	movl   $0xf30,(%esp)
 273:	e8 61 02 00 00       	call   4d9 <lock_release>
   while (global < num_threads) {
 278:	83 c4 10             	add    $0x10,%esp
 27b:	a1 28 0f 00 00       	mov    0xf28,%eax
 280:	39 05 38 0f 00 00    	cmp    %eax,0xf38
 286:	7d 2a                	jge    2b2 <main+0x18c>
      lock_release(&lock2);
 288:	83 ec 0c             	sub    $0xc,%esp
 28b:	68 2c 0f 00 00       	push   $0xf2c
 290:	e8 44 02 00 00       	call   4d9 <lock_release>
      sleep(100);
 295:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 29c:	e8 83 04 00 00       	call   724 <sleep>
      lock_acquire(&lock2);
 2a1:	c7 04 24 2c 0f 00 00 	movl   $0xf2c,(%esp)
 2a8:	e8 0a 02 00 00       	call   4b7 <lock_acquire>
 2ad:	83 c4 10             	add    $0x10,%esp
 2b0:	eb c9                	jmp    27b <main+0x155>
   lock_release(&lock2);
 2b2:	83 ec 0c             	sub    $0xc,%esp
 2b5:	68 2c 0f 00 00       	push   $0xf2c
 2ba:	e8 1a 02 00 00       	call   4d9 <lock_release>
   for (int i = 0; i < num_threads; i++) {
 2bf:	83 c4 10             	add    $0x10,%esp
 2c2:	bb 00 00 00 00       	mov    $0x0,%ebx
 2c7:	39 1d 28 0f 00 00    	cmp    %ebx,0xf28
 2cd:	7e 57                	jle    326 <main+0x200>
      int join_pid = thread_join();
 2cf:	e8 dd 01 00 00       	call   4b1 <thread_join>
      assert(join_pid > 0);
 2d4:	85 c0                	test   %eax,%eax
 2d6:	7e 05                	jle    2dd <main+0x1b7>
   for (int i = 0; i < num_threads; i++) {
 2d8:	83 c3 01             	add    $0x1,%ebx
 2db:	eb ea                	jmp    2c7 <main+0x1a1>
      assert(join_pid > 0);
 2dd:	6a 41                	push   $0x41
 2df:	68 98 0a 00 00       	push   $0xa98
 2e4:	68 a2 0a 00 00       	push   $0xaa2
 2e9:	6a 01                	push   $0x1
 2eb:	e8 f9 04 00 00       	call   7e9 <printf>
 2f0:	83 c4 0c             	add    $0xc,%esp
 2f3:	68 f8 0a 00 00       	push   $0xaf8
 2f8:	68 c8 0a 00 00       	push   $0xac8
 2fd:	6a 01                	push   $0x1
 2ff:	e8 e5 04 00 00       	call   7e9 <printf>
 304:	83 c4 08             	add    $0x8,%esp
 307:	68 dc 0a 00 00       	push   $0xadc
 30c:	6a 01                	push   $0x1
 30e:	e8 d6 04 00 00       	call   7e9 <printf>
 313:	83 c4 04             	add    $0x4,%esp
 316:	ff 35 3c 0f 00 00    	push   0xf3c
 31c:	e8 a3 03 00 00       	call   6c4 <kill>
 321:	e8 6e 03 00 00       	call   694 <exit>
   printf(1, "TEST PASSED\n");
 326:	83 ec 08             	sub    $0x8,%esp
 329:	68 05 0b 00 00       	push   $0xb05
 32e:	6a 01                	push   $0x1
 330:	e8 b4 04 00 00       	call   7e9 <printf>
   exit();
 335:	e8 5a 03 00 00       	call   694 <exit>

0000033a <worker2>:
{
 33a:	55                   	push   %ebp
 33b:	89 e5                	mov    %esp,%ebp
 33d:	83 ec 08             	sub    $0x8,%esp
   int arg2_int = *(int*)arg2;
 340:	8b 45 0c             	mov    0xc(%ebp),%eax
 343:	8b 10                	mov    (%eax),%edx
   assert(arg1_int == 11);
 345:	8b 45 08             	mov    0x8(%ebp),%eax
 348:	83 38 0b             	cmpl   $0xb,(%eax)
 34b:	75 52                	jne    39f <worker2+0x65>
   assert(arg2_int == 22);
 34d:	83 fa 16             	cmp    $0x16,%edx
 350:	0f 84 92 00 00 00    	je     3e8 <worker2+0xae>
 356:	6a 4d                	push   $0x4d
 358:	68 98 0a 00 00       	push   $0xa98
 35d:	68 a2 0a 00 00       	push   $0xaa2
 362:	6a 01                	push   $0x1
 364:	e8 80 04 00 00       	call   7e9 <printf>
 369:	83 c4 0c             	add    $0xc,%esp
 36c:	68 21 0b 00 00       	push   $0xb21
 371:	68 c8 0a 00 00       	push   $0xac8
 376:	6a 01                	push   $0x1
 378:	e8 6c 04 00 00       	call   7e9 <printf>
 37d:	83 c4 08             	add    $0x8,%esp
 380:	68 dc 0a 00 00       	push   $0xadc
 385:	6a 01                	push   $0x1
 387:	e8 5d 04 00 00       	call   7e9 <printf>
 38c:	83 c4 04             	add    $0x4,%esp
 38f:	ff 35 3c 0f 00 00    	push   0xf3c
 395:	e8 2a 03 00 00       	call   6c4 <kill>
 39a:	e8 f5 02 00 00       	call   694 <exit>
   assert(arg1_int == 11);
 39f:	6a 4c                	push   $0x4c
 3a1:	68 98 0a 00 00       	push   $0xa98
 3a6:	68 a2 0a 00 00       	push   $0xaa2
 3ab:	6a 01                	push   $0x1
 3ad:	e8 37 04 00 00       	call   7e9 <printf>
 3b2:	83 c4 0c             	add    $0xc,%esp
 3b5:	68 12 0b 00 00       	push   $0xb12
 3ba:	68 c8 0a 00 00       	push   $0xac8
 3bf:	6a 01                	push   $0x1
 3c1:	e8 23 04 00 00       	call   7e9 <printf>
 3c6:	83 c4 08             	add    $0x8,%esp
 3c9:	68 dc 0a 00 00       	push   $0xadc
 3ce:	6a 01                	push   $0x1
 3d0:	e8 14 04 00 00       	call   7e9 <printf>
 3d5:	83 c4 04             	add    $0x4,%esp
 3d8:	ff 35 3c 0f 00 00    	push   0xf3c
 3de:	e8 e1 02 00 00       	call   6c4 <kill>
 3e3:	e8 ac 02 00 00       	call   694 <exit>
   lock_acquire(&lock2);
 3e8:	83 ec 0c             	sub    $0xc,%esp
 3eb:	68 2c 0f 00 00       	push   $0xf2c
 3f0:	e8 c2 00 00 00       	call   4b7 <lock_acquire>
   assert((unsigned int)sbrk(0) == size);
 3f5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 3fc:	e8 1b 03 00 00       	call   71c <sbrk>
 401:	83 c4 10             	add    $0x10,%esp
 404:	3b 05 34 0f 00 00    	cmp    0xf34,%eax
 40a:	74 49                	je     455 <worker2+0x11b>
 40c:	6a 50                	push   $0x50
 40e:	68 98 0a 00 00       	push   $0xa98
 413:	68 a2 0a 00 00       	push   $0xaa2
 418:	6a 01                	push   $0x1
 41a:	e8 ca 03 00 00       	call   7e9 <printf>
 41f:	83 c4 0c             	add    $0xc,%esp
 422:	68 aa 0a 00 00       	push   $0xaaa
 427:	68 c8 0a 00 00       	push   $0xac8
 42c:	6a 01                	push   $0x1
 42e:	e8 b6 03 00 00       	call   7e9 <printf>
 433:	83 c4 08             	add    $0x8,%esp
 436:	68 dc 0a 00 00       	push   $0xadc
 43b:	6a 01                	push   $0x1
 43d:	e8 a7 03 00 00       	call   7e9 <printf>
 442:	83 c4 04             	add    $0x4,%esp
 445:	ff 35 3c 0f 00 00    	push   0xf3c
 44b:	e8 74 02 00 00       	call   6c4 <kill>
 450:	e8 3f 02 00 00       	call   694 <exit>
   global++;
 455:	83 05 38 0f 00 00 01 	addl   $0x1,0xf38
   lock_release(&lock2);
 45c:	83 ec 0c             	sub    $0xc,%esp
 45f:	68 2c 0f 00 00       	push   $0xf2c
 464:	e8 70 00 00 00       	call   4d9 <lock_release>
   exit();
 469:	e8 26 02 00 00       	call   694 <exit>

0000046e <test_and_set>:
#include "fcntl.h"
#include "user.h"
#include "x86.h"
#include "mmu.h"

int test_and_set(int *old_ptr, int new_ptr) {
 46e:	55                   	push   %ebp
 46f:	89 e5                	mov    %esp,%ebp
 471:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *old_ptr;
 474:	8b 10                	mov    (%eax),%edx
  *old_ptr = new_ptr;
 476:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 479:	89 08                	mov    %ecx,(%eax)
  return old;
}
 47b:	89 d0                	mov    %edx,%eax
 47d:	5d                   	pop    %ebp
 47e:	c3                   	ret    

0000047f <thread_create>:

// a wrapper func for clone
int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 47f:	55                   	push   %ebp
 480:	89 e5                	mov    %esp,%ebp
 482:	83 ec 14             	sub    $0x14,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE);
 485:	68 00 10 00 00       	push   $0x1000
 48a:	e8 80 05 00 00       	call   a0f <malloc>
  if(n_stack == 0){
 48f:	83 c4 10             	add    $0x10,%esp
 492:	85 c0                	test   %eax,%eax
 494:	74 14                	je     4aa <thread_create+0x2b>
    return -1;
  }
  int new_pid = clone(start_routine, arg1, arg2, n_stack); // TODO: is this the right way to call it?
 496:	50                   	push   %eax
 497:	ff 75 10             	push   0x10(%ebp)
 49a:	ff 75 0c             	push   0xc(%ebp)
 49d:	ff 75 08             	push   0x8(%ebp)
 4a0:	e8 8f 02 00 00       	call   734 <clone>


  // I can't remember if there was something else to do here but I'm sure I'll find out


  return new_pid;
 4a5:	83 c4 10             	add    $0x10,%esp
}
 4a8:	c9                   	leave  
 4a9:	c3                   	ret    
    return -1;
 4aa:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 4af:	eb f7                	jmp    4a8 <thread_create+0x29>

000004b1 <thread_join>:

int thread_join() {
  return 0;
}
 4b1:	b8 00 00 00 00       	mov    $0x0,%eax
 4b6:	c3                   	ret    

000004b7 <lock_acquire>:

void lock_acquire(lock_t *lock){
 4b7:	55                   	push   %ebp
 4b8:	89 e5                	mov    %esp,%ebp
 4ba:	53                   	push   %ebx
 4bb:	83 ec 04             	sub    $0x4,%esp
 4be:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 4c1:	83 ec 08             	sub    $0x8,%esp
 4c4:	6a 01                	push   $0x1
 4c6:	53                   	push   %ebx
 4c7:	e8 a2 ff ff ff       	call   46e <test_and_set>
 4cc:	83 c4 10             	add    $0x10,%esp
 4cf:	83 f8 01             	cmp    $0x1,%eax
 4d2:	74 ed                	je     4c1 <lock_acquire+0xa>
    ;
}
 4d4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4d7:	c9                   	leave  
 4d8:	c3                   	ret    

000004d9 <lock_release>:

void lock_release(lock_t *lock) {
 4d9:	55                   	push   %ebp
 4da:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 4dc:	8b 45 08             	mov    0x8(%ebp),%eax
 4df:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 4e5:	5d                   	pop    %ebp
 4e6:	c3                   	ret    

000004e7 <lock_init>:

void lock_init(lock_t *lock) {
 4e7:	55                   	push   %ebp
 4e8:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 4ea:	8b 45 08             	mov    0x8(%ebp),%eax
 4ed:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 4f3:	5d                   	pop    %ebp
 4f4:	c3                   	ret    

000004f5 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 4f5:	55                   	push   %ebp
 4f6:	89 e5                	mov    %esp,%ebp
 4f8:	56                   	push   %esi
 4f9:	53                   	push   %ebx
 4fa:	8b 75 08             	mov    0x8(%ebp),%esi
 4fd:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 500:	89 f0                	mov    %esi,%eax
 502:	89 d1                	mov    %edx,%ecx
 504:	83 c2 01             	add    $0x1,%edx
 507:	89 c3                	mov    %eax,%ebx
 509:	83 c0 01             	add    $0x1,%eax
 50c:	0f b6 09             	movzbl (%ecx),%ecx
 50f:	88 0b                	mov    %cl,(%ebx)
 511:	84 c9                	test   %cl,%cl
 513:	75 ed                	jne    502 <strcpy+0xd>
    ;
  return os;
}
 515:	89 f0                	mov    %esi,%eax
 517:	5b                   	pop    %ebx
 518:	5e                   	pop    %esi
 519:	5d                   	pop    %ebp
 51a:	c3                   	ret    

0000051b <strcmp>:

int
strcmp(const char *p, const char *q)
{
 51b:	55                   	push   %ebp
 51c:	89 e5                	mov    %esp,%ebp
 51e:	8b 4d 08             	mov    0x8(%ebp),%ecx
 521:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 524:	eb 06                	jmp    52c <strcmp+0x11>
    p++, q++;
 526:	83 c1 01             	add    $0x1,%ecx
 529:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 52c:	0f b6 01             	movzbl (%ecx),%eax
 52f:	84 c0                	test   %al,%al
 531:	74 04                	je     537 <strcmp+0x1c>
 533:	3a 02                	cmp    (%edx),%al
 535:	74 ef                	je     526 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 537:	0f b6 c0             	movzbl %al,%eax
 53a:	0f b6 12             	movzbl (%edx),%edx
 53d:	29 d0                	sub    %edx,%eax
}
 53f:	5d                   	pop    %ebp
 540:	c3                   	ret    

00000541 <strlen>:

uint
strlen(const char *s)
{
 541:	55                   	push   %ebp
 542:	89 e5                	mov    %esp,%ebp
 544:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 547:	b8 00 00 00 00       	mov    $0x0,%eax
 54c:	eb 03                	jmp    551 <strlen+0x10>
 54e:	83 c0 01             	add    $0x1,%eax
 551:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 555:	75 f7                	jne    54e <strlen+0xd>
    ;
  return n;
}
 557:	5d                   	pop    %ebp
 558:	c3                   	ret    

00000559 <memset>:

void*
memset(void *dst, int c, uint n)
{
 559:	55                   	push   %ebp
 55a:	89 e5                	mov    %esp,%ebp
 55c:	57                   	push   %edi
 55d:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 560:	89 d7                	mov    %edx,%edi
 562:	8b 4d 10             	mov    0x10(%ebp),%ecx
 565:	8b 45 0c             	mov    0xc(%ebp),%eax
 568:	fc                   	cld    
 569:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 56b:	89 d0                	mov    %edx,%eax
 56d:	8b 7d fc             	mov    -0x4(%ebp),%edi
 570:	c9                   	leave  
 571:	c3                   	ret    

00000572 <strchr>:

char*
strchr(const char *s, char c)
{
 572:	55                   	push   %ebp
 573:	89 e5                	mov    %esp,%ebp
 575:	8b 45 08             	mov    0x8(%ebp),%eax
 578:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 57c:	eb 03                	jmp    581 <strchr+0xf>
 57e:	83 c0 01             	add    $0x1,%eax
 581:	0f b6 10             	movzbl (%eax),%edx
 584:	84 d2                	test   %dl,%dl
 586:	74 06                	je     58e <strchr+0x1c>
    if(*s == c)
 588:	38 ca                	cmp    %cl,%dl
 58a:	75 f2                	jne    57e <strchr+0xc>
 58c:	eb 05                	jmp    593 <strchr+0x21>
      return (char*)s;
  return 0;
 58e:	b8 00 00 00 00       	mov    $0x0,%eax
}
 593:	5d                   	pop    %ebp
 594:	c3                   	ret    

00000595 <gets>:

char*
gets(char *buf, int max)
{
 595:	55                   	push   %ebp
 596:	89 e5                	mov    %esp,%ebp
 598:	57                   	push   %edi
 599:	56                   	push   %esi
 59a:	53                   	push   %ebx
 59b:	83 ec 1c             	sub    $0x1c,%esp
 59e:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 5a1:	bb 00 00 00 00       	mov    $0x0,%ebx
 5a6:	89 de                	mov    %ebx,%esi
 5a8:	83 c3 01             	add    $0x1,%ebx
 5ab:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 5ae:	7d 2e                	jge    5de <gets+0x49>
    cc = read(0, &c, 1);
 5b0:	83 ec 04             	sub    $0x4,%esp
 5b3:	6a 01                	push   $0x1
 5b5:	8d 45 e7             	lea    -0x19(%ebp),%eax
 5b8:	50                   	push   %eax
 5b9:	6a 00                	push   $0x0
 5bb:	e8 ec 00 00 00       	call   6ac <read>
    if(cc < 1)
 5c0:	83 c4 10             	add    $0x10,%esp
 5c3:	85 c0                	test   %eax,%eax
 5c5:	7e 17                	jle    5de <gets+0x49>
      break;
    buf[i++] = c;
 5c7:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 5cb:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 5ce:	3c 0a                	cmp    $0xa,%al
 5d0:	0f 94 c2             	sete   %dl
 5d3:	3c 0d                	cmp    $0xd,%al
 5d5:	0f 94 c0             	sete   %al
 5d8:	08 c2                	or     %al,%dl
 5da:	74 ca                	je     5a6 <gets+0x11>
    buf[i++] = c;
 5dc:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 5de:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 5e2:	89 f8                	mov    %edi,%eax
 5e4:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5e7:	5b                   	pop    %ebx
 5e8:	5e                   	pop    %esi
 5e9:	5f                   	pop    %edi
 5ea:	5d                   	pop    %ebp
 5eb:	c3                   	ret    

000005ec <stat>:

int
stat(const char *n, struct stat *st)
{
 5ec:	55                   	push   %ebp
 5ed:	89 e5                	mov    %esp,%ebp
 5ef:	56                   	push   %esi
 5f0:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 5f1:	83 ec 08             	sub    $0x8,%esp
 5f4:	6a 00                	push   $0x0
 5f6:	ff 75 08             	push   0x8(%ebp)
 5f9:	e8 d6 00 00 00       	call   6d4 <open>
  if(fd < 0)
 5fe:	83 c4 10             	add    $0x10,%esp
 601:	85 c0                	test   %eax,%eax
 603:	78 24                	js     629 <stat+0x3d>
 605:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 607:	83 ec 08             	sub    $0x8,%esp
 60a:	ff 75 0c             	push   0xc(%ebp)
 60d:	50                   	push   %eax
 60e:	e8 d9 00 00 00       	call   6ec <fstat>
 613:	89 c6                	mov    %eax,%esi
  close(fd);
 615:	89 1c 24             	mov    %ebx,(%esp)
 618:	e8 9f 00 00 00       	call   6bc <close>
  return r;
 61d:	83 c4 10             	add    $0x10,%esp
}
 620:	89 f0                	mov    %esi,%eax
 622:	8d 65 f8             	lea    -0x8(%ebp),%esp
 625:	5b                   	pop    %ebx
 626:	5e                   	pop    %esi
 627:	5d                   	pop    %ebp
 628:	c3                   	ret    
    return -1;
 629:	be ff ff ff ff       	mov    $0xffffffff,%esi
 62e:	eb f0                	jmp    620 <stat+0x34>

00000630 <atoi>:

int
atoi(const char *s)
{
 630:	55                   	push   %ebp
 631:	89 e5                	mov    %esp,%ebp
 633:	53                   	push   %ebx
 634:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 637:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 63c:	eb 10                	jmp    64e <atoi+0x1e>
    n = n*10 + *s++ - '0';
 63e:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 641:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 644:	83 c1 01             	add    $0x1,%ecx
 647:	0f be c0             	movsbl %al,%eax
 64a:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 64e:	0f b6 01             	movzbl (%ecx),%eax
 651:	8d 58 d0             	lea    -0x30(%eax),%ebx
 654:	80 fb 09             	cmp    $0x9,%bl
 657:	76 e5                	jbe    63e <atoi+0xe>
  return n;
}
 659:	89 d0                	mov    %edx,%eax
 65b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 65e:	c9                   	leave  
 65f:	c3                   	ret    

00000660 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 660:	55                   	push   %ebp
 661:	89 e5                	mov    %esp,%ebp
 663:	56                   	push   %esi
 664:	53                   	push   %ebx
 665:	8b 75 08             	mov    0x8(%ebp),%esi
 668:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 66b:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 66e:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 670:	eb 0d                	jmp    67f <memmove+0x1f>
    *dst++ = *src++;
 672:	0f b6 01             	movzbl (%ecx),%eax
 675:	88 02                	mov    %al,(%edx)
 677:	8d 49 01             	lea    0x1(%ecx),%ecx
 67a:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 67d:	89 d8                	mov    %ebx,%eax
 67f:	8d 58 ff             	lea    -0x1(%eax),%ebx
 682:	85 c0                	test   %eax,%eax
 684:	7f ec                	jg     672 <memmove+0x12>
  return vdst;
}
 686:	89 f0                	mov    %esi,%eax
 688:	5b                   	pop    %ebx
 689:	5e                   	pop    %esi
 68a:	5d                   	pop    %ebp
 68b:	c3                   	ret    

0000068c <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 68c:	b8 01 00 00 00       	mov    $0x1,%eax
 691:	cd 40                	int    $0x40
 693:	c3                   	ret    

00000694 <exit>:
SYSCALL(exit)
 694:	b8 02 00 00 00       	mov    $0x2,%eax
 699:	cd 40                	int    $0x40
 69b:	c3                   	ret    

0000069c <wait>:
SYSCALL(wait)
 69c:	b8 03 00 00 00       	mov    $0x3,%eax
 6a1:	cd 40                	int    $0x40
 6a3:	c3                   	ret    

000006a4 <pipe>:
SYSCALL(pipe)
 6a4:	b8 04 00 00 00       	mov    $0x4,%eax
 6a9:	cd 40                	int    $0x40
 6ab:	c3                   	ret    

000006ac <read>:
SYSCALL(read)
 6ac:	b8 05 00 00 00       	mov    $0x5,%eax
 6b1:	cd 40                	int    $0x40
 6b3:	c3                   	ret    

000006b4 <write>:
SYSCALL(write)
 6b4:	b8 10 00 00 00       	mov    $0x10,%eax
 6b9:	cd 40                	int    $0x40
 6bb:	c3                   	ret    

000006bc <close>:
SYSCALL(close)
 6bc:	b8 15 00 00 00       	mov    $0x15,%eax
 6c1:	cd 40                	int    $0x40
 6c3:	c3                   	ret    

000006c4 <kill>:
SYSCALL(kill)
 6c4:	b8 06 00 00 00       	mov    $0x6,%eax
 6c9:	cd 40                	int    $0x40
 6cb:	c3                   	ret    

000006cc <exec>:
SYSCALL(exec)
 6cc:	b8 07 00 00 00       	mov    $0x7,%eax
 6d1:	cd 40                	int    $0x40
 6d3:	c3                   	ret    

000006d4 <open>:
SYSCALL(open)
 6d4:	b8 0f 00 00 00       	mov    $0xf,%eax
 6d9:	cd 40                	int    $0x40
 6db:	c3                   	ret    

000006dc <mknod>:
SYSCALL(mknod)
 6dc:	b8 11 00 00 00       	mov    $0x11,%eax
 6e1:	cd 40                	int    $0x40
 6e3:	c3                   	ret    

000006e4 <unlink>:
SYSCALL(unlink)
 6e4:	b8 12 00 00 00       	mov    $0x12,%eax
 6e9:	cd 40                	int    $0x40
 6eb:	c3                   	ret    

000006ec <fstat>:
SYSCALL(fstat)
 6ec:	b8 08 00 00 00       	mov    $0x8,%eax
 6f1:	cd 40                	int    $0x40
 6f3:	c3                   	ret    

000006f4 <link>:
SYSCALL(link)
 6f4:	b8 13 00 00 00       	mov    $0x13,%eax
 6f9:	cd 40                	int    $0x40
 6fb:	c3                   	ret    

000006fc <mkdir>:
SYSCALL(mkdir)
 6fc:	b8 14 00 00 00       	mov    $0x14,%eax
 701:	cd 40                	int    $0x40
 703:	c3                   	ret    

00000704 <chdir>:
SYSCALL(chdir)
 704:	b8 09 00 00 00       	mov    $0x9,%eax
 709:	cd 40                	int    $0x40
 70b:	c3                   	ret    

0000070c <dup>:
SYSCALL(dup)
 70c:	b8 0a 00 00 00       	mov    $0xa,%eax
 711:	cd 40                	int    $0x40
 713:	c3                   	ret    

00000714 <getpid>:
SYSCALL(getpid)
 714:	b8 0b 00 00 00       	mov    $0xb,%eax
 719:	cd 40                	int    $0x40
 71b:	c3                   	ret    

0000071c <sbrk>:
SYSCALL(sbrk)
 71c:	b8 0c 00 00 00       	mov    $0xc,%eax
 721:	cd 40                	int    $0x40
 723:	c3                   	ret    

00000724 <sleep>:
SYSCALL(sleep)
 724:	b8 0d 00 00 00       	mov    $0xd,%eax
 729:	cd 40                	int    $0x40
 72b:	c3                   	ret    

0000072c <uptime>:
SYSCALL(uptime)
 72c:	b8 0e 00 00 00       	mov    $0xe,%eax
 731:	cd 40                	int    $0x40
 733:	c3                   	ret    

00000734 <clone>:
SYSCALL(clone)
 734:	b8 16 00 00 00       	mov    $0x16,%eax
 739:	cd 40                	int    $0x40
 73b:	c3                   	ret    

0000073c <join>:
 73c:	b8 17 00 00 00       	mov    $0x17,%eax
 741:	cd 40                	int    $0x40
 743:	c3                   	ret    

00000744 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 744:	55                   	push   %ebp
 745:	89 e5                	mov    %esp,%ebp
 747:	83 ec 1c             	sub    $0x1c,%esp
 74a:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 74d:	6a 01                	push   $0x1
 74f:	8d 55 f4             	lea    -0xc(%ebp),%edx
 752:	52                   	push   %edx
 753:	50                   	push   %eax
 754:	e8 5b ff ff ff       	call   6b4 <write>
}
 759:	83 c4 10             	add    $0x10,%esp
 75c:	c9                   	leave  
 75d:	c3                   	ret    

0000075e <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 75e:	55                   	push   %ebp
 75f:	89 e5                	mov    %esp,%ebp
 761:	57                   	push   %edi
 762:	56                   	push   %esi
 763:	53                   	push   %ebx
 764:	83 ec 2c             	sub    $0x2c,%esp
 767:	89 45 d0             	mov    %eax,-0x30(%ebp)
 76a:	89 d0                	mov    %edx,%eax
 76c:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 76e:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 772:	0f 95 c1             	setne  %cl
 775:	c1 ea 1f             	shr    $0x1f,%edx
 778:	84 d1                	test   %dl,%cl
 77a:	74 44                	je     7c0 <printint+0x62>
    neg = 1;
    x = -xx;
 77c:	f7 d8                	neg    %eax
 77e:	89 c1                	mov    %eax,%ecx
    neg = 1;
 780:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 787:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 78c:	89 c8                	mov    %ecx,%eax
 78e:	ba 00 00 00 00       	mov    $0x0,%edx
 793:	f7 f6                	div    %esi
 795:	89 df                	mov    %ebx,%edi
 797:	83 c3 01             	add    $0x1,%ebx
 79a:	0f b6 92 90 0b 00 00 	movzbl 0xb90(%edx),%edx
 7a1:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 7a5:	89 ca                	mov    %ecx,%edx
 7a7:	89 c1                	mov    %eax,%ecx
 7a9:	39 d6                	cmp    %edx,%esi
 7ab:	76 df                	jbe    78c <printint+0x2e>
  if(neg)
 7ad:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 7b1:	74 31                	je     7e4 <printint+0x86>
    buf[i++] = '-';
 7b3:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 7b8:	8d 5f 02             	lea    0x2(%edi),%ebx
 7bb:	8b 75 d0             	mov    -0x30(%ebp),%esi
 7be:	eb 17                	jmp    7d7 <printint+0x79>
    x = xx;
 7c0:	89 c1                	mov    %eax,%ecx
  neg = 0;
 7c2:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 7c9:	eb bc                	jmp    787 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 7cb:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 7d0:	89 f0                	mov    %esi,%eax
 7d2:	e8 6d ff ff ff       	call   744 <putc>
  while(--i >= 0)
 7d7:	83 eb 01             	sub    $0x1,%ebx
 7da:	79 ef                	jns    7cb <printint+0x6d>
}
 7dc:	83 c4 2c             	add    $0x2c,%esp
 7df:	5b                   	pop    %ebx
 7e0:	5e                   	pop    %esi
 7e1:	5f                   	pop    %edi
 7e2:	5d                   	pop    %ebp
 7e3:	c3                   	ret    
 7e4:	8b 75 d0             	mov    -0x30(%ebp),%esi
 7e7:	eb ee                	jmp    7d7 <printint+0x79>

000007e9 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 7e9:	55                   	push   %ebp
 7ea:	89 e5                	mov    %esp,%ebp
 7ec:	57                   	push   %edi
 7ed:	56                   	push   %esi
 7ee:	53                   	push   %ebx
 7ef:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 7f2:	8d 45 10             	lea    0x10(%ebp),%eax
 7f5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 7f8:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 7fd:	bb 00 00 00 00       	mov    $0x0,%ebx
 802:	eb 14                	jmp    818 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 804:	89 fa                	mov    %edi,%edx
 806:	8b 45 08             	mov    0x8(%ebp),%eax
 809:	e8 36 ff ff ff       	call   744 <putc>
 80e:	eb 05                	jmp    815 <printf+0x2c>
      }
    } else if(state == '%'){
 810:	83 fe 25             	cmp    $0x25,%esi
 813:	74 25                	je     83a <printf+0x51>
  for(i = 0; fmt[i]; i++){
 815:	83 c3 01             	add    $0x1,%ebx
 818:	8b 45 0c             	mov    0xc(%ebp),%eax
 81b:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 81f:	84 c0                	test   %al,%al
 821:	0f 84 20 01 00 00    	je     947 <printf+0x15e>
    c = fmt[i] & 0xff;
 827:	0f be f8             	movsbl %al,%edi
 82a:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 82d:	85 f6                	test   %esi,%esi
 82f:	75 df                	jne    810 <printf+0x27>
      if(c == '%'){
 831:	83 f8 25             	cmp    $0x25,%eax
 834:	75 ce                	jne    804 <printf+0x1b>
        state = '%';
 836:	89 c6                	mov    %eax,%esi
 838:	eb db                	jmp    815 <printf+0x2c>
      if(c == 'd'){
 83a:	83 f8 25             	cmp    $0x25,%eax
 83d:	0f 84 cf 00 00 00    	je     912 <printf+0x129>
 843:	0f 8c dd 00 00 00    	jl     926 <printf+0x13d>
 849:	83 f8 78             	cmp    $0x78,%eax
 84c:	0f 8f d4 00 00 00    	jg     926 <printf+0x13d>
 852:	83 f8 63             	cmp    $0x63,%eax
 855:	0f 8c cb 00 00 00    	jl     926 <printf+0x13d>
 85b:	83 e8 63             	sub    $0x63,%eax
 85e:	83 f8 15             	cmp    $0x15,%eax
 861:	0f 87 bf 00 00 00    	ja     926 <printf+0x13d>
 867:	ff 24 85 38 0b 00 00 	jmp    *0xb38(,%eax,4)
        printint(fd, *ap, 10, 1);
 86e:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 871:	8b 17                	mov    (%edi),%edx
 873:	83 ec 0c             	sub    $0xc,%esp
 876:	6a 01                	push   $0x1
 878:	b9 0a 00 00 00       	mov    $0xa,%ecx
 87d:	8b 45 08             	mov    0x8(%ebp),%eax
 880:	e8 d9 fe ff ff       	call   75e <printint>
        ap++;
 885:	83 c7 04             	add    $0x4,%edi
 888:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 88b:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 88e:	be 00 00 00 00       	mov    $0x0,%esi
 893:	eb 80                	jmp    815 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 895:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 898:	8b 17                	mov    (%edi),%edx
 89a:	83 ec 0c             	sub    $0xc,%esp
 89d:	6a 00                	push   $0x0
 89f:	b9 10 00 00 00       	mov    $0x10,%ecx
 8a4:	8b 45 08             	mov    0x8(%ebp),%eax
 8a7:	e8 b2 fe ff ff       	call   75e <printint>
        ap++;
 8ac:	83 c7 04             	add    $0x4,%edi
 8af:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 8b2:	83 c4 10             	add    $0x10,%esp
      state = 0;
 8b5:	be 00 00 00 00       	mov    $0x0,%esi
 8ba:	e9 56 ff ff ff       	jmp    815 <printf+0x2c>
        s = (char*)*ap;
 8bf:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8c2:	8b 30                	mov    (%eax),%esi
        ap++;
 8c4:	83 c0 04             	add    $0x4,%eax
 8c7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 8ca:	85 f6                	test   %esi,%esi
 8cc:	75 15                	jne    8e3 <printf+0xfa>
          s = "(null)";
 8ce:	be 30 0b 00 00       	mov    $0xb30,%esi
 8d3:	eb 0e                	jmp    8e3 <printf+0xfa>
          putc(fd, *s);
 8d5:	0f be d2             	movsbl %dl,%edx
 8d8:	8b 45 08             	mov    0x8(%ebp),%eax
 8db:	e8 64 fe ff ff       	call   744 <putc>
          s++;
 8e0:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 8e3:	0f b6 16             	movzbl (%esi),%edx
 8e6:	84 d2                	test   %dl,%dl
 8e8:	75 eb                	jne    8d5 <printf+0xec>
      state = 0;
 8ea:	be 00 00 00 00       	mov    $0x0,%esi
 8ef:	e9 21 ff ff ff       	jmp    815 <printf+0x2c>
        putc(fd, *ap);
 8f4:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 8f7:	0f be 17             	movsbl (%edi),%edx
 8fa:	8b 45 08             	mov    0x8(%ebp),%eax
 8fd:	e8 42 fe ff ff       	call   744 <putc>
        ap++;
 902:	83 c7 04             	add    $0x4,%edi
 905:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 908:	be 00 00 00 00       	mov    $0x0,%esi
 90d:	e9 03 ff ff ff       	jmp    815 <printf+0x2c>
        putc(fd, c);
 912:	89 fa                	mov    %edi,%edx
 914:	8b 45 08             	mov    0x8(%ebp),%eax
 917:	e8 28 fe ff ff       	call   744 <putc>
      state = 0;
 91c:	be 00 00 00 00       	mov    $0x0,%esi
 921:	e9 ef fe ff ff       	jmp    815 <printf+0x2c>
        putc(fd, '%');
 926:	ba 25 00 00 00       	mov    $0x25,%edx
 92b:	8b 45 08             	mov    0x8(%ebp),%eax
 92e:	e8 11 fe ff ff       	call   744 <putc>
        putc(fd, c);
 933:	89 fa                	mov    %edi,%edx
 935:	8b 45 08             	mov    0x8(%ebp),%eax
 938:	e8 07 fe ff ff       	call   744 <putc>
      state = 0;
 93d:	be 00 00 00 00       	mov    $0x0,%esi
 942:	e9 ce fe ff ff       	jmp    815 <printf+0x2c>
    }
  }
}
 947:	8d 65 f4             	lea    -0xc(%ebp),%esp
 94a:	5b                   	pop    %ebx
 94b:	5e                   	pop    %esi
 94c:	5f                   	pop    %edi
 94d:	5d                   	pop    %ebp
 94e:	c3                   	ret    

0000094f <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 94f:	55                   	push   %ebp
 950:	89 e5                	mov    %esp,%ebp
 952:	57                   	push   %edi
 953:	56                   	push   %esi
 954:	53                   	push   %ebx
 955:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 958:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 95b:	a1 40 0f 00 00       	mov    0xf40,%eax
 960:	eb 02                	jmp    964 <free+0x15>
 962:	89 d0                	mov    %edx,%eax
 964:	39 c8                	cmp    %ecx,%eax
 966:	73 04                	jae    96c <free+0x1d>
 968:	39 08                	cmp    %ecx,(%eax)
 96a:	77 12                	ja     97e <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 96c:	8b 10                	mov    (%eax),%edx
 96e:	39 c2                	cmp    %eax,%edx
 970:	77 f0                	ja     962 <free+0x13>
 972:	39 c8                	cmp    %ecx,%eax
 974:	72 08                	jb     97e <free+0x2f>
 976:	39 ca                	cmp    %ecx,%edx
 978:	77 04                	ja     97e <free+0x2f>
 97a:	89 d0                	mov    %edx,%eax
 97c:	eb e6                	jmp    964 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 97e:	8b 73 fc             	mov    -0x4(%ebx),%esi
 981:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 984:	8b 10                	mov    (%eax),%edx
 986:	39 d7                	cmp    %edx,%edi
 988:	74 19                	je     9a3 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 98a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 98d:	8b 50 04             	mov    0x4(%eax),%edx
 990:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 993:	39 ce                	cmp    %ecx,%esi
 995:	74 1b                	je     9b2 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 997:	89 08                	mov    %ecx,(%eax)
  freep = p;
 999:	a3 40 0f 00 00       	mov    %eax,0xf40
}
 99e:	5b                   	pop    %ebx
 99f:	5e                   	pop    %esi
 9a0:	5f                   	pop    %edi
 9a1:	5d                   	pop    %ebp
 9a2:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 9a3:	03 72 04             	add    0x4(%edx),%esi
 9a6:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 9a9:	8b 10                	mov    (%eax),%edx
 9ab:	8b 12                	mov    (%edx),%edx
 9ad:	89 53 f8             	mov    %edx,-0x8(%ebx)
 9b0:	eb db                	jmp    98d <free+0x3e>
    p->s.size += bp->s.size;
 9b2:	03 53 fc             	add    -0x4(%ebx),%edx
 9b5:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 9b8:	8b 53 f8             	mov    -0x8(%ebx),%edx
 9bb:	89 10                	mov    %edx,(%eax)
 9bd:	eb da                	jmp    999 <free+0x4a>

000009bf <morecore>:

static Header*
morecore(uint nu)
{
 9bf:	55                   	push   %ebp
 9c0:	89 e5                	mov    %esp,%ebp
 9c2:	53                   	push   %ebx
 9c3:	83 ec 04             	sub    $0x4,%esp
 9c6:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 9c8:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 9cd:	77 05                	ja     9d4 <morecore+0x15>
    nu = 4096;
 9cf:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 9d4:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 9db:	83 ec 0c             	sub    $0xc,%esp
 9de:	50                   	push   %eax
 9df:	e8 38 fd ff ff       	call   71c <sbrk>
  if(p == (char*)-1)
 9e4:	83 c4 10             	add    $0x10,%esp
 9e7:	83 f8 ff             	cmp    $0xffffffff,%eax
 9ea:	74 1c                	je     a08 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 9ec:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 9ef:	83 c0 08             	add    $0x8,%eax
 9f2:	83 ec 0c             	sub    $0xc,%esp
 9f5:	50                   	push   %eax
 9f6:	e8 54 ff ff ff       	call   94f <free>
  return freep;
 9fb:	a1 40 0f 00 00       	mov    0xf40,%eax
 a00:	83 c4 10             	add    $0x10,%esp
}
 a03:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 a06:	c9                   	leave  
 a07:	c3                   	ret    
    return 0;
 a08:	b8 00 00 00 00       	mov    $0x0,%eax
 a0d:	eb f4                	jmp    a03 <morecore+0x44>

00000a0f <malloc>:

void*
malloc(uint nbytes)
{
 a0f:	55                   	push   %ebp
 a10:	89 e5                	mov    %esp,%ebp
 a12:	53                   	push   %ebx
 a13:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a16:	8b 45 08             	mov    0x8(%ebp),%eax
 a19:	8d 58 07             	lea    0x7(%eax),%ebx
 a1c:	c1 eb 03             	shr    $0x3,%ebx
 a1f:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 a22:	8b 0d 40 0f 00 00    	mov    0xf40,%ecx
 a28:	85 c9                	test   %ecx,%ecx
 a2a:	74 04                	je     a30 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a2c:	8b 01                	mov    (%ecx),%eax
 a2e:	eb 4a                	jmp    a7a <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 a30:	c7 05 40 0f 00 00 44 	movl   $0xf44,0xf40
 a37:	0f 00 00 
 a3a:	c7 05 44 0f 00 00 44 	movl   $0xf44,0xf44
 a41:	0f 00 00 
    base.s.size = 0;
 a44:	c7 05 48 0f 00 00 00 	movl   $0x0,0xf48
 a4b:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 a4e:	b9 44 0f 00 00       	mov    $0xf44,%ecx
 a53:	eb d7                	jmp    a2c <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 a55:	74 19                	je     a70 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 a57:	29 da                	sub    %ebx,%edx
 a59:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 a5c:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 a5f:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 a62:	89 0d 40 0f 00 00    	mov    %ecx,0xf40
      return (void*)(p + 1);
 a68:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 a6b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 a6e:	c9                   	leave  
 a6f:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 a70:	8b 10                	mov    (%eax),%edx
 a72:	89 11                	mov    %edx,(%ecx)
 a74:	eb ec                	jmp    a62 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a76:	89 c1                	mov    %eax,%ecx
 a78:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 a7a:	8b 50 04             	mov    0x4(%eax),%edx
 a7d:	39 da                	cmp    %ebx,%edx
 a7f:	73 d4                	jae    a55 <malloc+0x46>
    if(p == freep)
 a81:	39 05 40 0f 00 00    	cmp    %eax,0xf40
 a87:	75 ed                	jne    a76 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 a89:	89 d8                	mov    %ebx,%eax
 a8b:	e8 2f ff ff ff       	call   9bf <morecore>
 a90:	85 c0                	test   %eax,%eax
 a92:	75 e2                	jne    a76 <malloc+0x67>
 a94:	eb d5                	jmp    a6b <malloc+0x5c>
