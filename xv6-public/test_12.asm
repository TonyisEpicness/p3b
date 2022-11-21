
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
   6:	68 f4 0e 00 00       	push   $0xef4
   b:	e8 7b 04 00 00       	call   48b <lock_acquire>
   assert((unsigned int)sbrk(0) == size);
  10:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  17:	e8 d4 06 00 00       	call   6f0 <sbrk>
  1c:	83 c4 10             	add    $0x10,%esp
  1f:	3b 05 f8 0e 00 00    	cmp    0xef8,%eax
  25:	74 49                	je     70 <worker+0x70>
  27:	6a 5b                	push   $0x5b
  29:	68 6c 0a 00 00       	push   $0xa6c
  2e:	68 76 0a 00 00       	push   $0xa76
  33:	6a 01                	push   $0x1
  35:	e8 83 07 00 00       	call   7bd <printf>
  3a:	83 c4 0c             	add    $0xc,%esp
  3d:	68 7e 0a 00 00       	push   $0xa7e
  42:	68 9c 0a 00 00       	push   $0xa9c
  47:	6a 01                	push   $0x1
  49:	e8 6f 07 00 00       	call   7bd <printf>
  4e:	83 c4 08             	add    $0x8,%esp
  51:	68 b0 0a 00 00       	push   $0xab0
  56:	6a 01                	push   $0x1
  58:	e8 60 07 00 00       	call   7bd <printf>
  5d:	83 c4 04             	add    $0x4,%esp
  60:	ff 35 00 0f 00 00    	push   0xf00
  66:	e8 2d 06 00 00       	call   698 <kill>
  6b:	e8 f8 05 00 00       	call   668 <exit>
   global++;
  70:	83 05 fc 0e 00 00 01 	addl   $0x1,0xefc
   lock_release(&lock);
  77:	83 ec 0c             	sub    $0xc,%esp
  7a:	68 f4 0e 00 00       	push   $0xef4
  7f:	e8 29 04 00 00       	call   4ad <lock_release>

   


   lock_acquire(&lock2);
  84:	c7 04 24 f0 0e 00 00 	movl   $0xef0,(%esp)
  8b:	e8 fb 03 00 00       	call   48b <lock_acquire>
   assert((unsigned int)sbrk(0) == size);
  90:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  97:	e8 54 06 00 00       	call   6f0 <sbrk>
  9c:	83 c4 10             	add    $0x10,%esp
  9f:	3b 05 f8 0e 00 00    	cmp    0xef8,%eax
  a5:	74 49                	je     f0 <worker+0xf0>
  a7:	6a 63                	push   $0x63
  a9:	68 6c 0a 00 00       	push   $0xa6c
  ae:	68 76 0a 00 00       	push   $0xa76
  b3:	6a 01                	push   $0x1
  b5:	e8 03 07 00 00       	call   7bd <printf>
  ba:	83 c4 0c             	add    $0xc,%esp
  bd:	68 7e 0a 00 00       	push   $0xa7e
  c2:	68 9c 0a 00 00       	push   $0xa9c
  c7:	6a 01                	push   $0x1
  c9:	e8 ef 06 00 00       	call   7bd <printf>
  ce:	83 c4 08             	add    $0x8,%esp
  d1:	68 b0 0a 00 00       	push   $0xab0
  d6:	6a 01                	push   $0x1
  d8:	e8 e0 06 00 00       	call   7bd <printf>
  dd:	83 c4 04             	add    $0x4,%esp
  e0:	ff 35 00 0f 00 00    	push   0xf00
  e6:	e8 ad 05 00 00       	call   698 <kill>
  eb:	e8 78 05 00 00       	call   668 <exit>
   global++;
  f0:	83 05 fc 0e 00 00 01 	addl   $0x1,0xefc
   sbrk(10000);
  f7:	83 ec 0c             	sub    $0xc,%esp
  fa:	68 10 27 00 00       	push   $0x2710
  ff:	e8 ec 05 00 00       	call   6f0 <sbrk>
   size = (unsigned int)sbrk(0);
 104:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 10b:	e8 e0 05 00 00       	call   6f0 <sbrk>
 110:	a3 f8 0e 00 00       	mov    %eax,0xef8
   lock_release(&lock2);
 115:	c7 04 24 f0 0e 00 00 	movl   $0xef0,(%esp)
 11c:	e8 8c 03 00 00       	call   4ad <lock_release>



   exit();
 121:	e8 42 05 00 00       	call   668 <exit>

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
 138:	e8 ab 05 00 00       	call   6e8 <getpid>
 13d:	a3 00 0f 00 00       	mov    %eax,0xf00
   int arg1 = 11, arg2 = 22;
 142:	c7 45 f4 0b 00 00 00 	movl   $0xb,-0xc(%ebp)
 149:	c7 45 f0 16 00 00 00 	movl   $0x16,-0x10(%ebp)
   lock_init(&lock);
 150:	83 ec 0c             	sub    $0xc,%esp
 153:	68 f4 0e 00 00       	push   $0xef4
 158:	e8 5e 03 00 00       	call   4bb <lock_init>
   lock_init(&lock2);
 15d:	c7 04 24 f0 0e 00 00 	movl   $0xef0,(%esp)
 164:	e8 52 03 00 00       	call   4bb <lock_init>
   lock_acquire(&lock);
 169:	c7 04 24 f4 0e 00 00 	movl   $0xef4,(%esp)
 170:	e8 16 03 00 00       	call   48b <lock_acquire>
   lock_acquire(&lock2);
 175:	c7 04 24 f0 0e 00 00 	movl   $0xef0,(%esp)
 17c:	e8 0a 03 00 00       	call   48b <lock_acquire>
   for (int i = 0; i < num_threads; i++) {
 181:	83 c4 10             	add    $0x10,%esp
 184:	bb 00 00 00 00       	mov    $0x0,%ebx
 189:	eb 03                	jmp    18e <main+0x68>
 18b:	83 c3 01             	add    $0x1,%ebx
 18e:	39 1d ec 0e 00 00    	cmp    %ebx,0xeec
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
 1b4:	68 6c 0a 00 00       	push   $0xa6c
 1b9:	68 76 0a 00 00       	push   $0xa76
 1be:	6a 01                	push   $0x1
 1c0:	e8 f8 05 00 00       	call   7bd <printf>
 1c5:	83 c4 0c             	add    $0xc,%esp
 1c8:	68 bd 0a 00 00       	push   $0xabd
 1cd:	68 9c 0a 00 00       	push   $0xa9c
 1d2:	6a 01                	push   $0x1
 1d4:	e8 e4 05 00 00       	call   7bd <printf>
 1d9:	83 c4 08             	add    $0x8,%esp
 1dc:	68 b0 0a 00 00       	push   $0xab0
 1e1:	6a 01                	push   $0x1
 1e3:	e8 d5 05 00 00       	call   7bd <printf>
 1e8:	83 c4 04             	add    $0x4,%esp
 1eb:	ff 35 00 0f 00 00    	push   0xf00
 1f1:	e8 a2 04 00 00       	call   698 <kill>
 1f6:	e8 6d 04 00 00       	call   668 <exit>
   size = (unsigned int)sbrk(0);
 1fb:	83 ec 0c             	sub    $0xc,%esp
 1fe:	6a 00                	push   $0x0
 200:	e8 eb 04 00 00       	call   6f0 <sbrk>
 205:	a3 f8 0e 00 00       	mov    %eax,0xef8
   while (global < num_threads) {
 20a:	83 c4 10             	add    $0x10,%esp
 20d:	a1 ec 0e 00 00       	mov    0xeec,%eax
 212:	39 05 fc 0e 00 00    	cmp    %eax,0xefc
 218:	7d 2a                	jge    244 <main+0x11e>
      lock_release(&lock);
 21a:	83 ec 0c             	sub    $0xc,%esp
 21d:	68 f4 0e 00 00       	push   $0xef4
 222:	e8 86 02 00 00       	call   4ad <lock_release>
      sleep(100);
 227:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 22e:	e8 c5 04 00 00       	call   6f8 <sleep>
      lock_acquire(&lock);
 233:	c7 04 24 f4 0e 00 00 	movl   $0xef4,(%esp)
 23a:	e8 4c 02 00 00       	call   48b <lock_acquire>
 23f:	83 c4 10             	add    $0x10,%esp
 242:	eb c9                	jmp    20d <main+0xe7>
   global = 0;
 244:	c7 05 fc 0e 00 00 00 	movl   $0x0,0xefc
 24b:	00 00 00 
   sbrk(10000);
 24e:	83 ec 0c             	sub    $0xc,%esp
 251:	68 10 27 00 00       	push   $0x2710
 256:	e8 95 04 00 00       	call   6f0 <sbrk>
   size = (unsigned int)sbrk(0);
 25b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 262:	e8 89 04 00 00       	call   6f0 <sbrk>
 267:	a3 f8 0e 00 00       	mov    %eax,0xef8
   lock_release(&lock);
 26c:	c7 04 24 f4 0e 00 00 	movl   $0xef4,(%esp)
 273:	e8 35 02 00 00       	call   4ad <lock_release>
   while (global < num_threads) {
 278:	83 c4 10             	add    $0x10,%esp
 27b:	a1 ec 0e 00 00       	mov    0xeec,%eax
 280:	39 05 fc 0e 00 00    	cmp    %eax,0xefc
 286:	7d 2a                	jge    2b2 <main+0x18c>
      lock_release(&lock2);
 288:	83 ec 0c             	sub    $0xc,%esp
 28b:	68 f0 0e 00 00       	push   $0xef0
 290:	e8 18 02 00 00       	call   4ad <lock_release>
      sleep(100);
 295:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 29c:	e8 57 04 00 00       	call   6f8 <sleep>
      lock_acquire(&lock2);
 2a1:	c7 04 24 f0 0e 00 00 	movl   $0xef0,(%esp)
 2a8:	e8 de 01 00 00       	call   48b <lock_acquire>
 2ad:	83 c4 10             	add    $0x10,%esp
 2b0:	eb c9                	jmp    27b <main+0x155>
   lock_release(&lock2);
 2b2:	83 ec 0c             	sub    $0xc,%esp
 2b5:	68 f0 0e 00 00       	push   $0xef0
 2ba:	e8 ee 01 00 00       	call   4ad <lock_release>
   for (int i = 0; i < num_threads; i++) {
 2bf:	83 c4 10             	add    $0x10,%esp
 2c2:	bb 00 00 00 00       	mov    $0x0,%ebx
 2c7:	39 1d ec 0e 00 00    	cmp    %ebx,0xeec
 2cd:	7e 57                	jle    326 <main+0x200>
      int join_pid = thread_join();
 2cf:	e8 b1 01 00 00       	call   485 <thread_join>
      assert(join_pid > 0);
 2d4:	85 c0                	test   %eax,%eax
 2d6:	7e 05                	jle    2dd <main+0x1b7>
   for (int i = 0; i < num_threads; i++) {
 2d8:	83 c3 01             	add    $0x1,%ebx
 2db:	eb ea                	jmp    2c7 <main+0x1a1>
      assert(join_pid > 0);
 2dd:	6a 41                	push   $0x41
 2df:	68 6c 0a 00 00       	push   $0xa6c
 2e4:	68 76 0a 00 00       	push   $0xa76
 2e9:	6a 01                	push   $0x1
 2eb:	e8 cd 04 00 00       	call   7bd <printf>
 2f0:	83 c4 0c             	add    $0xc,%esp
 2f3:	68 cc 0a 00 00       	push   $0xacc
 2f8:	68 9c 0a 00 00       	push   $0xa9c
 2fd:	6a 01                	push   $0x1
 2ff:	e8 b9 04 00 00       	call   7bd <printf>
 304:	83 c4 08             	add    $0x8,%esp
 307:	68 b0 0a 00 00       	push   $0xab0
 30c:	6a 01                	push   $0x1
 30e:	e8 aa 04 00 00       	call   7bd <printf>
 313:	83 c4 04             	add    $0x4,%esp
 316:	ff 35 00 0f 00 00    	push   0xf00
 31c:	e8 77 03 00 00       	call   698 <kill>
 321:	e8 42 03 00 00       	call   668 <exit>
   printf(1, "TEST PASSED\n");
 326:	83 ec 08             	sub    $0x8,%esp
 329:	68 d9 0a 00 00       	push   $0xad9
 32e:	6a 01                	push   $0x1
 330:	e8 88 04 00 00       	call   7bd <printf>
   exit();
 335:	e8 2e 03 00 00       	call   668 <exit>

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
 358:	68 6c 0a 00 00       	push   $0xa6c
 35d:	68 76 0a 00 00       	push   $0xa76
 362:	6a 01                	push   $0x1
 364:	e8 54 04 00 00       	call   7bd <printf>
 369:	83 c4 0c             	add    $0xc,%esp
 36c:	68 f5 0a 00 00       	push   $0xaf5
 371:	68 9c 0a 00 00       	push   $0xa9c
 376:	6a 01                	push   $0x1
 378:	e8 40 04 00 00       	call   7bd <printf>
 37d:	83 c4 08             	add    $0x8,%esp
 380:	68 b0 0a 00 00       	push   $0xab0
 385:	6a 01                	push   $0x1
 387:	e8 31 04 00 00       	call   7bd <printf>
 38c:	83 c4 04             	add    $0x4,%esp
 38f:	ff 35 00 0f 00 00    	push   0xf00
 395:	e8 fe 02 00 00       	call   698 <kill>
 39a:	e8 c9 02 00 00       	call   668 <exit>
   assert(arg1_int == 11);
 39f:	6a 4c                	push   $0x4c
 3a1:	68 6c 0a 00 00       	push   $0xa6c
 3a6:	68 76 0a 00 00       	push   $0xa76
 3ab:	6a 01                	push   $0x1
 3ad:	e8 0b 04 00 00       	call   7bd <printf>
 3b2:	83 c4 0c             	add    $0xc,%esp
 3b5:	68 e6 0a 00 00       	push   $0xae6
 3ba:	68 9c 0a 00 00       	push   $0xa9c
 3bf:	6a 01                	push   $0x1
 3c1:	e8 f7 03 00 00       	call   7bd <printf>
 3c6:	83 c4 08             	add    $0x8,%esp
 3c9:	68 b0 0a 00 00       	push   $0xab0
 3ce:	6a 01                	push   $0x1
 3d0:	e8 e8 03 00 00       	call   7bd <printf>
 3d5:	83 c4 04             	add    $0x4,%esp
 3d8:	ff 35 00 0f 00 00    	push   0xf00
 3de:	e8 b5 02 00 00       	call   698 <kill>
 3e3:	e8 80 02 00 00       	call   668 <exit>
   lock_acquire(&lock2);
 3e8:	83 ec 0c             	sub    $0xc,%esp
 3eb:	68 f0 0e 00 00       	push   $0xef0
 3f0:	e8 96 00 00 00       	call   48b <lock_acquire>
   assert((unsigned int)sbrk(0) == size);
 3f5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 3fc:	e8 ef 02 00 00       	call   6f0 <sbrk>
 401:	83 c4 10             	add    $0x10,%esp
 404:	3b 05 f8 0e 00 00    	cmp    0xef8,%eax
 40a:	74 49                	je     455 <worker2+0x11b>
 40c:	6a 50                	push   $0x50
 40e:	68 6c 0a 00 00       	push   $0xa6c
 413:	68 76 0a 00 00       	push   $0xa76
 418:	6a 01                	push   $0x1
 41a:	e8 9e 03 00 00       	call   7bd <printf>
 41f:	83 c4 0c             	add    $0xc,%esp
 422:	68 7e 0a 00 00       	push   $0xa7e
 427:	68 9c 0a 00 00       	push   $0xa9c
 42c:	6a 01                	push   $0x1
 42e:	e8 8a 03 00 00       	call   7bd <printf>
 433:	83 c4 08             	add    $0x8,%esp
 436:	68 b0 0a 00 00       	push   $0xab0
 43b:	6a 01                	push   $0x1
 43d:	e8 7b 03 00 00       	call   7bd <printf>
 442:	83 c4 04             	add    $0x4,%esp
 445:	ff 35 00 0f 00 00    	push   0xf00
 44b:	e8 48 02 00 00       	call   698 <kill>
 450:	e8 13 02 00 00       	call   668 <exit>
   global++;
 455:	83 05 fc 0e 00 00 01 	addl   $0x1,0xefc
   lock_release(&lock2);
 45c:	83 ec 0c             	sub    $0xc,%esp
 45f:	68 f0 0e 00 00       	push   $0xef0
 464:	e8 44 00 00 00       	call   4ad <lock_release>
   exit();
 469:	e8 fa 01 00 00       	call   668 <exit>

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

  // I can't remember if there was something else to do here but I'm sure I'll find out


  return new_pid;
}
 47f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 484:	c3                   	ret    

00000485 <thread_join>:

int thread_join() {
  return 0;
}
 485:	b8 00 00 00 00       	mov    $0x0,%eax
 48a:	c3                   	ret    

0000048b <lock_acquire>:

void lock_acquire(lock_t *lock){
 48b:	55                   	push   %ebp
 48c:	89 e5                	mov    %esp,%ebp
 48e:	53                   	push   %ebx
 48f:	83 ec 04             	sub    $0x4,%esp
 492:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 495:	83 ec 08             	sub    $0x8,%esp
 498:	6a 01                	push   $0x1
 49a:	53                   	push   %ebx
 49b:	e8 ce ff ff ff       	call   46e <test_and_set>
 4a0:	83 c4 10             	add    $0x10,%esp
 4a3:	83 f8 01             	cmp    $0x1,%eax
 4a6:	74 ed                	je     495 <lock_acquire+0xa>
    ;
}
 4a8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4ab:	c9                   	leave  
 4ac:	c3                   	ret    

000004ad <lock_release>:

void lock_release(lock_t *lock) {
 4ad:	55                   	push   %ebp
 4ae:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 4b0:	8b 45 08             	mov    0x8(%ebp),%eax
 4b3:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 4b9:	5d                   	pop    %ebp
 4ba:	c3                   	ret    

000004bb <lock_init>:

void lock_init(lock_t *lock) {
 4bb:	55                   	push   %ebp
 4bc:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 4be:	8b 45 08             	mov    0x8(%ebp),%eax
 4c1:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 4c7:	5d                   	pop    %ebp
 4c8:	c3                   	ret    

000004c9 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 4c9:	55                   	push   %ebp
 4ca:	89 e5                	mov    %esp,%ebp
 4cc:	56                   	push   %esi
 4cd:	53                   	push   %ebx
 4ce:	8b 75 08             	mov    0x8(%ebp),%esi
 4d1:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 4d4:	89 f0                	mov    %esi,%eax
 4d6:	89 d1                	mov    %edx,%ecx
 4d8:	83 c2 01             	add    $0x1,%edx
 4db:	89 c3                	mov    %eax,%ebx
 4dd:	83 c0 01             	add    $0x1,%eax
 4e0:	0f b6 09             	movzbl (%ecx),%ecx
 4e3:	88 0b                	mov    %cl,(%ebx)
 4e5:	84 c9                	test   %cl,%cl
 4e7:	75 ed                	jne    4d6 <strcpy+0xd>
    ;
  return os;
}
 4e9:	89 f0                	mov    %esi,%eax
 4eb:	5b                   	pop    %ebx
 4ec:	5e                   	pop    %esi
 4ed:	5d                   	pop    %ebp
 4ee:	c3                   	ret    

000004ef <strcmp>:

int
strcmp(const char *p, const char *q)
{
 4ef:	55                   	push   %ebp
 4f0:	89 e5                	mov    %esp,%ebp
 4f2:	8b 4d 08             	mov    0x8(%ebp),%ecx
 4f5:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 4f8:	eb 06                	jmp    500 <strcmp+0x11>
    p++, q++;
 4fa:	83 c1 01             	add    $0x1,%ecx
 4fd:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 500:	0f b6 01             	movzbl (%ecx),%eax
 503:	84 c0                	test   %al,%al
 505:	74 04                	je     50b <strcmp+0x1c>
 507:	3a 02                	cmp    (%edx),%al
 509:	74 ef                	je     4fa <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 50b:	0f b6 c0             	movzbl %al,%eax
 50e:	0f b6 12             	movzbl (%edx),%edx
 511:	29 d0                	sub    %edx,%eax
}
 513:	5d                   	pop    %ebp
 514:	c3                   	ret    

00000515 <strlen>:

uint
strlen(const char *s)
{
 515:	55                   	push   %ebp
 516:	89 e5                	mov    %esp,%ebp
 518:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 51b:	b8 00 00 00 00       	mov    $0x0,%eax
 520:	eb 03                	jmp    525 <strlen+0x10>
 522:	83 c0 01             	add    $0x1,%eax
 525:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 529:	75 f7                	jne    522 <strlen+0xd>
    ;
  return n;
}
 52b:	5d                   	pop    %ebp
 52c:	c3                   	ret    

0000052d <memset>:

void*
memset(void *dst, int c, uint n)
{
 52d:	55                   	push   %ebp
 52e:	89 e5                	mov    %esp,%ebp
 530:	57                   	push   %edi
 531:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 534:	89 d7                	mov    %edx,%edi
 536:	8b 4d 10             	mov    0x10(%ebp),%ecx
 539:	8b 45 0c             	mov    0xc(%ebp),%eax
 53c:	fc                   	cld    
 53d:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 53f:	89 d0                	mov    %edx,%eax
 541:	8b 7d fc             	mov    -0x4(%ebp),%edi
 544:	c9                   	leave  
 545:	c3                   	ret    

00000546 <strchr>:

char*
strchr(const char *s, char c)
{
 546:	55                   	push   %ebp
 547:	89 e5                	mov    %esp,%ebp
 549:	8b 45 08             	mov    0x8(%ebp),%eax
 54c:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 550:	eb 03                	jmp    555 <strchr+0xf>
 552:	83 c0 01             	add    $0x1,%eax
 555:	0f b6 10             	movzbl (%eax),%edx
 558:	84 d2                	test   %dl,%dl
 55a:	74 06                	je     562 <strchr+0x1c>
    if(*s == c)
 55c:	38 ca                	cmp    %cl,%dl
 55e:	75 f2                	jne    552 <strchr+0xc>
 560:	eb 05                	jmp    567 <strchr+0x21>
      return (char*)s;
  return 0;
 562:	b8 00 00 00 00       	mov    $0x0,%eax
}
 567:	5d                   	pop    %ebp
 568:	c3                   	ret    

00000569 <gets>:

char*
gets(char *buf, int max)
{
 569:	55                   	push   %ebp
 56a:	89 e5                	mov    %esp,%ebp
 56c:	57                   	push   %edi
 56d:	56                   	push   %esi
 56e:	53                   	push   %ebx
 56f:	83 ec 1c             	sub    $0x1c,%esp
 572:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 575:	bb 00 00 00 00       	mov    $0x0,%ebx
 57a:	89 de                	mov    %ebx,%esi
 57c:	83 c3 01             	add    $0x1,%ebx
 57f:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 582:	7d 2e                	jge    5b2 <gets+0x49>
    cc = read(0, &c, 1);
 584:	83 ec 04             	sub    $0x4,%esp
 587:	6a 01                	push   $0x1
 589:	8d 45 e7             	lea    -0x19(%ebp),%eax
 58c:	50                   	push   %eax
 58d:	6a 00                	push   $0x0
 58f:	e8 ec 00 00 00       	call   680 <read>
    if(cc < 1)
 594:	83 c4 10             	add    $0x10,%esp
 597:	85 c0                	test   %eax,%eax
 599:	7e 17                	jle    5b2 <gets+0x49>
      break;
    buf[i++] = c;
 59b:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 59f:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 5a2:	3c 0a                	cmp    $0xa,%al
 5a4:	0f 94 c2             	sete   %dl
 5a7:	3c 0d                	cmp    $0xd,%al
 5a9:	0f 94 c0             	sete   %al
 5ac:	08 c2                	or     %al,%dl
 5ae:	74 ca                	je     57a <gets+0x11>
    buf[i++] = c;
 5b0:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 5b2:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 5b6:	89 f8                	mov    %edi,%eax
 5b8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5bb:	5b                   	pop    %ebx
 5bc:	5e                   	pop    %esi
 5bd:	5f                   	pop    %edi
 5be:	5d                   	pop    %ebp
 5bf:	c3                   	ret    

000005c0 <stat>:

int
stat(const char *n, struct stat *st)
{
 5c0:	55                   	push   %ebp
 5c1:	89 e5                	mov    %esp,%ebp
 5c3:	56                   	push   %esi
 5c4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 5c5:	83 ec 08             	sub    $0x8,%esp
 5c8:	6a 00                	push   $0x0
 5ca:	ff 75 08             	push   0x8(%ebp)
 5cd:	e8 d6 00 00 00       	call   6a8 <open>
  if(fd < 0)
 5d2:	83 c4 10             	add    $0x10,%esp
 5d5:	85 c0                	test   %eax,%eax
 5d7:	78 24                	js     5fd <stat+0x3d>
 5d9:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 5db:	83 ec 08             	sub    $0x8,%esp
 5de:	ff 75 0c             	push   0xc(%ebp)
 5e1:	50                   	push   %eax
 5e2:	e8 d9 00 00 00       	call   6c0 <fstat>
 5e7:	89 c6                	mov    %eax,%esi
  close(fd);
 5e9:	89 1c 24             	mov    %ebx,(%esp)
 5ec:	e8 9f 00 00 00       	call   690 <close>
  return r;
 5f1:	83 c4 10             	add    $0x10,%esp
}
 5f4:	89 f0                	mov    %esi,%eax
 5f6:	8d 65 f8             	lea    -0x8(%ebp),%esp
 5f9:	5b                   	pop    %ebx
 5fa:	5e                   	pop    %esi
 5fb:	5d                   	pop    %ebp
 5fc:	c3                   	ret    
    return -1;
 5fd:	be ff ff ff ff       	mov    $0xffffffff,%esi
 602:	eb f0                	jmp    5f4 <stat+0x34>

00000604 <atoi>:

int
atoi(const char *s)
{
 604:	55                   	push   %ebp
 605:	89 e5                	mov    %esp,%ebp
 607:	53                   	push   %ebx
 608:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 60b:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 610:	eb 10                	jmp    622 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 612:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 615:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 618:	83 c1 01             	add    $0x1,%ecx
 61b:	0f be c0             	movsbl %al,%eax
 61e:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 622:	0f b6 01             	movzbl (%ecx),%eax
 625:	8d 58 d0             	lea    -0x30(%eax),%ebx
 628:	80 fb 09             	cmp    $0x9,%bl
 62b:	76 e5                	jbe    612 <atoi+0xe>
  return n;
}
 62d:	89 d0                	mov    %edx,%eax
 62f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 632:	c9                   	leave  
 633:	c3                   	ret    

00000634 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 634:	55                   	push   %ebp
 635:	89 e5                	mov    %esp,%ebp
 637:	56                   	push   %esi
 638:	53                   	push   %ebx
 639:	8b 75 08             	mov    0x8(%ebp),%esi
 63c:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 63f:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 642:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 644:	eb 0d                	jmp    653 <memmove+0x1f>
    *dst++ = *src++;
 646:	0f b6 01             	movzbl (%ecx),%eax
 649:	88 02                	mov    %al,(%edx)
 64b:	8d 49 01             	lea    0x1(%ecx),%ecx
 64e:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 651:	89 d8                	mov    %ebx,%eax
 653:	8d 58 ff             	lea    -0x1(%eax),%ebx
 656:	85 c0                	test   %eax,%eax
 658:	7f ec                	jg     646 <memmove+0x12>
  return vdst;
}
 65a:	89 f0                	mov    %esi,%eax
 65c:	5b                   	pop    %ebx
 65d:	5e                   	pop    %esi
 65e:	5d                   	pop    %ebp
 65f:	c3                   	ret    

00000660 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 660:	b8 01 00 00 00       	mov    $0x1,%eax
 665:	cd 40                	int    $0x40
 667:	c3                   	ret    

00000668 <exit>:
SYSCALL(exit)
 668:	b8 02 00 00 00       	mov    $0x2,%eax
 66d:	cd 40                	int    $0x40
 66f:	c3                   	ret    

00000670 <wait>:
SYSCALL(wait)
 670:	b8 03 00 00 00       	mov    $0x3,%eax
 675:	cd 40                	int    $0x40
 677:	c3                   	ret    

00000678 <pipe>:
SYSCALL(pipe)
 678:	b8 04 00 00 00       	mov    $0x4,%eax
 67d:	cd 40                	int    $0x40
 67f:	c3                   	ret    

00000680 <read>:
SYSCALL(read)
 680:	b8 05 00 00 00       	mov    $0x5,%eax
 685:	cd 40                	int    $0x40
 687:	c3                   	ret    

00000688 <write>:
SYSCALL(write)
 688:	b8 10 00 00 00       	mov    $0x10,%eax
 68d:	cd 40                	int    $0x40
 68f:	c3                   	ret    

00000690 <close>:
SYSCALL(close)
 690:	b8 15 00 00 00       	mov    $0x15,%eax
 695:	cd 40                	int    $0x40
 697:	c3                   	ret    

00000698 <kill>:
SYSCALL(kill)
 698:	b8 06 00 00 00       	mov    $0x6,%eax
 69d:	cd 40                	int    $0x40
 69f:	c3                   	ret    

000006a0 <exec>:
SYSCALL(exec)
 6a0:	b8 07 00 00 00       	mov    $0x7,%eax
 6a5:	cd 40                	int    $0x40
 6a7:	c3                   	ret    

000006a8 <open>:
SYSCALL(open)
 6a8:	b8 0f 00 00 00       	mov    $0xf,%eax
 6ad:	cd 40                	int    $0x40
 6af:	c3                   	ret    

000006b0 <mknod>:
SYSCALL(mknod)
 6b0:	b8 11 00 00 00       	mov    $0x11,%eax
 6b5:	cd 40                	int    $0x40
 6b7:	c3                   	ret    

000006b8 <unlink>:
SYSCALL(unlink)
 6b8:	b8 12 00 00 00       	mov    $0x12,%eax
 6bd:	cd 40                	int    $0x40
 6bf:	c3                   	ret    

000006c0 <fstat>:
SYSCALL(fstat)
 6c0:	b8 08 00 00 00       	mov    $0x8,%eax
 6c5:	cd 40                	int    $0x40
 6c7:	c3                   	ret    

000006c8 <link>:
SYSCALL(link)
 6c8:	b8 13 00 00 00       	mov    $0x13,%eax
 6cd:	cd 40                	int    $0x40
 6cf:	c3                   	ret    

000006d0 <mkdir>:
SYSCALL(mkdir)
 6d0:	b8 14 00 00 00       	mov    $0x14,%eax
 6d5:	cd 40                	int    $0x40
 6d7:	c3                   	ret    

000006d8 <chdir>:
SYSCALL(chdir)
 6d8:	b8 09 00 00 00       	mov    $0x9,%eax
 6dd:	cd 40                	int    $0x40
 6df:	c3                   	ret    

000006e0 <dup>:
SYSCALL(dup)
 6e0:	b8 0a 00 00 00       	mov    $0xa,%eax
 6e5:	cd 40                	int    $0x40
 6e7:	c3                   	ret    

000006e8 <getpid>:
SYSCALL(getpid)
 6e8:	b8 0b 00 00 00       	mov    $0xb,%eax
 6ed:	cd 40                	int    $0x40
 6ef:	c3                   	ret    

000006f0 <sbrk>:
SYSCALL(sbrk)
 6f0:	b8 0c 00 00 00       	mov    $0xc,%eax
 6f5:	cd 40                	int    $0x40
 6f7:	c3                   	ret    

000006f8 <sleep>:
SYSCALL(sleep)
 6f8:	b8 0d 00 00 00       	mov    $0xd,%eax
 6fd:	cd 40                	int    $0x40
 6ff:	c3                   	ret    

00000700 <uptime>:
SYSCALL(uptime)
 700:	b8 0e 00 00 00       	mov    $0xe,%eax
 705:	cd 40                	int    $0x40
 707:	c3                   	ret    

00000708 <clone>:
SYSCALL(clone)
 708:	b8 16 00 00 00       	mov    $0x16,%eax
 70d:	cd 40                	int    $0x40
 70f:	c3                   	ret    

00000710 <join>:
 710:	b8 17 00 00 00       	mov    $0x17,%eax
 715:	cd 40                	int    $0x40
 717:	c3                   	ret    

00000718 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 718:	55                   	push   %ebp
 719:	89 e5                	mov    %esp,%ebp
 71b:	83 ec 1c             	sub    $0x1c,%esp
 71e:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 721:	6a 01                	push   $0x1
 723:	8d 55 f4             	lea    -0xc(%ebp),%edx
 726:	52                   	push   %edx
 727:	50                   	push   %eax
 728:	e8 5b ff ff ff       	call   688 <write>
}
 72d:	83 c4 10             	add    $0x10,%esp
 730:	c9                   	leave  
 731:	c3                   	ret    

00000732 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 732:	55                   	push   %ebp
 733:	89 e5                	mov    %esp,%ebp
 735:	57                   	push   %edi
 736:	56                   	push   %esi
 737:	53                   	push   %ebx
 738:	83 ec 2c             	sub    $0x2c,%esp
 73b:	89 45 d0             	mov    %eax,-0x30(%ebp)
 73e:	89 d0                	mov    %edx,%eax
 740:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 742:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 746:	0f 95 c1             	setne  %cl
 749:	c1 ea 1f             	shr    $0x1f,%edx
 74c:	84 d1                	test   %dl,%cl
 74e:	74 44                	je     794 <printint+0x62>
    neg = 1;
    x = -xx;
 750:	f7 d8                	neg    %eax
 752:	89 c1                	mov    %eax,%ecx
    neg = 1;
 754:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 75b:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 760:	89 c8                	mov    %ecx,%eax
 762:	ba 00 00 00 00       	mov    $0x0,%edx
 767:	f7 f6                	div    %esi
 769:	89 df                	mov    %ebx,%edi
 76b:	83 c3 01             	add    $0x1,%ebx
 76e:	0f b6 92 64 0b 00 00 	movzbl 0xb64(%edx),%edx
 775:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 779:	89 ca                	mov    %ecx,%edx
 77b:	89 c1                	mov    %eax,%ecx
 77d:	39 d6                	cmp    %edx,%esi
 77f:	76 df                	jbe    760 <printint+0x2e>
  if(neg)
 781:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 785:	74 31                	je     7b8 <printint+0x86>
    buf[i++] = '-';
 787:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 78c:	8d 5f 02             	lea    0x2(%edi),%ebx
 78f:	8b 75 d0             	mov    -0x30(%ebp),%esi
 792:	eb 17                	jmp    7ab <printint+0x79>
    x = xx;
 794:	89 c1                	mov    %eax,%ecx
  neg = 0;
 796:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 79d:	eb bc                	jmp    75b <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 79f:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 7a4:	89 f0                	mov    %esi,%eax
 7a6:	e8 6d ff ff ff       	call   718 <putc>
  while(--i >= 0)
 7ab:	83 eb 01             	sub    $0x1,%ebx
 7ae:	79 ef                	jns    79f <printint+0x6d>
}
 7b0:	83 c4 2c             	add    $0x2c,%esp
 7b3:	5b                   	pop    %ebx
 7b4:	5e                   	pop    %esi
 7b5:	5f                   	pop    %edi
 7b6:	5d                   	pop    %ebp
 7b7:	c3                   	ret    
 7b8:	8b 75 d0             	mov    -0x30(%ebp),%esi
 7bb:	eb ee                	jmp    7ab <printint+0x79>

000007bd <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 7bd:	55                   	push   %ebp
 7be:	89 e5                	mov    %esp,%ebp
 7c0:	57                   	push   %edi
 7c1:	56                   	push   %esi
 7c2:	53                   	push   %ebx
 7c3:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 7c6:	8d 45 10             	lea    0x10(%ebp),%eax
 7c9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 7cc:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 7d1:	bb 00 00 00 00       	mov    $0x0,%ebx
 7d6:	eb 14                	jmp    7ec <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 7d8:	89 fa                	mov    %edi,%edx
 7da:	8b 45 08             	mov    0x8(%ebp),%eax
 7dd:	e8 36 ff ff ff       	call   718 <putc>
 7e2:	eb 05                	jmp    7e9 <printf+0x2c>
      }
    } else if(state == '%'){
 7e4:	83 fe 25             	cmp    $0x25,%esi
 7e7:	74 25                	je     80e <printf+0x51>
  for(i = 0; fmt[i]; i++){
 7e9:	83 c3 01             	add    $0x1,%ebx
 7ec:	8b 45 0c             	mov    0xc(%ebp),%eax
 7ef:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 7f3:	84 c0                	test   %al,%al
 7f5:	0f 84 20 01 00 00    	je     91b <printf+0x15e>
    c = fmt[i] & 0xff;
 7fb:	0f be f8             	movsbl %al,%edi
 7fe:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 801:	85 f6                	test   %esi,%esi
 803:	75 df                	jne    7e4 <printf+0x27>
      if(c == '%'){
 805:	83 f8 25             	cmp    $0x25,%eax
 808:	75 ce                	jne    7d8 <printf+0x1b>
        state = '%';
 80a:	89 c6                	mov    %eax,%esi
 80c:	eb db                	jmp    7e9 <printf+0x2c>
      if(c == 'd'){
 80e:	83 f8 25             	cmp    $0x25,%eax
 811:	0f 84 cf 00 00 00    	je     8e6 <printf+0x129>
 817:	0f 8c dd 00 00 00    	jl     8fa <printf+0x13d>
 81d:	83 f8 78             	cmp    $0x78,%eax
 820:	0f 8f d4 00 00 00    	jg     8fa <printf+0x13d>
 826:	83 f8 63             	cmp    $0x63,%eax
 829:	0f 8c cb 00 00 00    	jl     8fa <printf+0x13d>
 82f:	83 e8 63             	sub    $0x63,%eax
 832:	83 f8 15             	cmp    $0x15,%eax
 835:	0f 87 bf 00 00 00    	ja     8fa <printf+0x13d>
 83b:	ff 24 85 0c 0b 00 00 	jmp    *0xb0c(,%eax,4)
        printint(fd, *ap, 10, 1);
 842:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 845:	8b 17                	mov    (%edi),%edx
 847:	83 ec 0c             	sub    $0xc,%esp
 84a:	6a 01                	push   $0x1
 84c:	b9 0a 00 00 00       	mov    $0xa,%ecx
 851:	8b 45 08             	mov    0x8(%ebp),%eax
 854:	e8 d9 fe ff ff       	call   732 <printint>
        ap++;
 859:	83 c7 04             	add    $0x4,%edi
 85c:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 85f:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 862:	be 00 00 00 00       	mov    $0x0,%esi
 867:	eb 80                	jmp    7e9 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 869:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 86c:	8b 17                	mov    (%edi),%edx
 86e:	83 ec 0c             	sub    $0xc,%esp
 871:	6a 00                	push   $0x0
 873:	b9 10 00 00 00       	mov    $0x10,%ecx
 878:	8b 45 08             	mov    0x8(%ebp),%eax
 87b:	e8 b2 fe ff ff       	call   732 <printint>
        ap++;
 880:	83 c7 04             	add    $0x4,%edi
 883:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 886:	83 c4 10             	add    $0x10,%esp
      state = 0;
 889:	be 00 00 00 00       	mov    $0x0,%esi
 88e:	e9 56 ff ff ff       	jmp    7e9 <printf+0x2c>
        s = (char*)*ap;
 893:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 896:	8b 30                	mov    (%eax),%esi
        ap++;
 898:	83 c0 04             	add    $0x4,%eax
 89b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 89e:	85 f6                	test   %esi,%esi
 8a0:	75 15                	jne    8b7 <printf+0xfa>
          s = "(null)";
 8a2:	be 04 0b 00 00       	mov    $0xb04,%esi
 8a7:	eb 0e                	jmp    8b7 <printf+0xfa>
          putc(fd, *s);
 8a9:	0f be d2             	movsbl %dl,%edx
 8ac:	8b 45 08             	mov    0x8(%ebp),%eax
 8af:	e8 64 fe ff ff       	call   718 <putc>
          s++;
 8b4:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 8b7:	0f b6 16             	movzbl (%esi),%edx
 8ba:	84 d2                	test   %dl,%dl
 8bc:	75 eb                	jne    8a9 <printf+0xec>
      state = 0;
 8be:	be 00 00 00 00       	mov    $0x0,%esi
 8c3:	e9 21 ff ff ff       	jmp    7e9 <printf+0x2c>
        putc(fd, *ap);
 8c8:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 8cb:	0f be 17             	movsbl (%edi),%edx
 8ce:	8b 45 08             	mov    0x8(%ebp),%eax
 8d1:	e8 42 fe ff ff       	call   718 <putc>
        ap++;
 8d6:	83 c7 04             	add    $0x4,%edi
 8d9:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 8dc:	be 00 00 00 00       	mov    $0x0,%esi
 8e1:	e9 03 ff ff ff       	jmp    7e9 <printf+0x2c>
        putc(fd, c);
 8e6:	89 fa                	mov    %edi,%edx
 8e8:	8b 45 08             	mov    0x8(%ebp),%eax
 8eb:	e8 28 fe ff ff       	call   718 <putc>
      state = 0;
 8f0:	be 00 00 00 00       	mov    $0x0,%esi
 8f5:	e9 ef fe ff ff       	jmp    7e9 <printf+0x2c>
        putc(fd, '%');
 8fa:	ba 25 00 00 00       	mov    $0x25,%edx
 8ff:	8b 45 08             	mov    0x8(%ebp),%eax
 902:	e8 11 fe ff ff       	call   718 <putc>
        putc(fd, c);
 907:	89 fa                	mov    %edi,%edx
 909:	8b 45 08             	mov    0x8(%ebp),%eax
 90c:	e8 07 fe ff ff       	call   718 <putc>
      state = 0;
 911:	be 00 00 00 00       	mov    $0x0,%esi
 916:	e9 ce fe ff ff       	jmp    7e9 <printf+0x2c>
    }
  }
}
 91b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 91e:	5b                   	pop    %ebx
 91f:	5e                   	pop    %esi
 920:	5f                   	pop    %edi
 921:	5d                   	pop    %ebp
 922:	c3                   	ret    

00000923 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 923:	55                   	push   %ebp
 924:	89 e5                	mov    %esp,%ebp
 926:	57                   	push   %edi
 927:	56                   	push   %esi
 928:	53                   	push   %ebx
 929:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 92c:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 92f:	a1 04 0f 00 00       	mov    0xf04,%eax
 934:	eb 02                	jmp    938 <free+0x15>
 936:	89 d0                	mov    %edx,%eax
 938:	39 c8                	cmp    %ecx,%eax
 93a:	73 04                	jae    940 <free+0x1d>
 93c:	39 08                	cmp    %ecx,(%eax)
 93e:	77 12                	ja     952 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 940:	8b 10                	mov    (%eax),%edx
 942:	39 c2                	cmp    %eax,%edx
 944:	77 f0                	ja     936 <free+0x13>
 946:	39 c8                	cmp    %ecx,%eax
 948:	72 08                	jb     952 <free+0x2f>
 94a:	39 ca                	cmp    %ecx,%edx
 94c:	77 04                	ja     952 <free+0x2f>
 94e:	89 d0                	mov    %edx,%eax
 950:	eb e6                	jmp    938 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 952:	8b 73 fc             	mov    -0x4(%ebx),%esi
 955:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 958:	8b 10                	mov    (%eax),%edx
 95a:	39 d7                	cmp    %edx,%edi
 95c:	74 19                	je     977 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 95e:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 961:	8b 50 04             	mov    0x4(%eax),%edx
 964:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 967:	39 ce                	cmp    %ecx,%esi
 969:	74 1b                	je     986 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 96b:	89 08                	mov    %ecx,(%eax)
  freep = p;
 96d:	a3 04 0f 00 00       	mov    %eax,0xf04
}
 972:	5b                   	pop    %ebx
 973:	5e                   	pop    %esi
 974:	5f                   	pop    %edi
 975:	5d                   	pop    %ebp
 976:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 977:	03 72 04             	add    0x4(%edx),%esi
 97a:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 97d:	8b 10                	mov    (%eax),%edx
 97f:	8b 12                	mov    (%edx),%edx
 981:	89 53 f8             	mov    %edx,-0x8(%ebx)
 984:	eb db                	jmp    961 <free+0x3e>
    p->s.size += bp->s.size;
 986:	03 53 fc             	add    -0x4(%ebx),%edx
 989:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 98c:	8b 53 f8             	mov    -0x8(%ebx),%edx
 98f:	89 10                	mov    %edx,(%eax)
 991:	eb da                	jmp    96d <free+0x4a>

00000993 <morecore>:

static Header*
morecore(uint nu)
{
 993:	55                   	push   %ebp
 994:	89 e5                	mov    %esp,%ebp
 996:	53                   	push   %ebx
 997:	83 ec 04             	sub    $0x4,%esp
 99a:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 99c:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 9a1:	77 05                	ja     9a8 <morecore+0x15>
    nu = 4096;
 9a3:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 9a8:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 9af:	83 ec 0c             	sub    $0xc,%esp
 9b2:	50                   	push   %eax
 9b3:	e8 38 fd ff ff       	call   6f0 <sbrk>
  if(p == (char*)-1)
 9b8:	83 c4 10             	add    $0x10,%esp
 9bb:	83 f8 ff             	cmp    $0xffffffff,%eax
 9be:	74 1c                	je     9dc <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 9c0:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 9c3:	83 c0 08             	add    $0x8,%eax
 9c6:	83 ec 0c             	sub    $0xc,%esp
 9c9:	50                   	push   %eax
 9ca:	e8 54 ff ff ff       	call   923 <free>
  return freep;
 9cf:	a1 04 0f 00 00       	mov    0xf04,%eax
 9d4:	83 c4 10             	add    $0x10,%esp
}
 9d7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 9da:	c9                   	leave  
 9db:	c3                   	ret    
    return 0;
 9dc:	b8 00 00 00 00       	mov    $0x0,%eax
 9e1:	eb f4                	jmp    9d7 <morecore+0x44>

000009e3 <malloc>:

void*
malloc(uint nbytes)
{
 9e3:	55                   	push   %ebp
 9e4:	89 e5                	mov    %esp,%ebp
 9e6:	53                   	push   %ebx
 9e7:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9ea:	8b 45 08             	mov    0x8(%ebp),%eax
 9ed:	8d 58 07             	lea    0x7(%eax),%ebx
 9f0:	c1 eb 03             	shr    $0x3,%ebx
 9f3:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 9f6:	8b 0d 04 0f 00 00    	mov    0xf04,%ecx
 9fc:	85 c9                	test   %ecx,%ecx
 9fe:	74 04                	je     a04 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a00:	8b 01                	mov    (%ecx),%eax
 a02:	eb 4a                	jmp    a4e <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 a04:	c7 05 04 0f 00 00 08 	movl   $0xf08,0xf04
 a0b:	0f 00 00 
 a0e:	c7 05 08 0f 00 00 08 	movl   $0xf08,0xf08
 a15:	0f 00 00 
    base.s.size = 0;
 a18:	c7 05 0c 0f 00 00 00 	movl   $0x0,0xf0c
 a1f:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 a22:	b9 08 0f 00 00       	mov    $0xf08,%ecx
 a27:	eb d7                	jmp    a00 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 a29:	74 19                	je     a44 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 a2b:	29 da                	sub    %ebx,%edx
 a2d:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 a30:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 a33:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 a36:	89 0d 04 0f 00 00    	mov    %ecx,0xf04
      return (void*)(p + 1);
 a3c:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 a3f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 a42:	c9                   	leave  
 a43:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 a44:	8b 10                	mov    (%eax),%edx
 a46:	89 11                	mov    %edx,(%ecx)
 a48:	eb ec                	jmp    a36 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a4a:	89 c1                	mov    %eax,%ecx
 a4c:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 a4e:	8b 50 04             	mov    0x4(%eax),%edx
 a51:	39 da                	cmp    %ebx,%edx
 a53:	73 d4                	jae    a29 <malloc+0x46>
    if(p == freep)
 a55:	39 05 04 0f 00 00    	cmp    %eax,0xf04
 a5b:	75 ed                	jne    a4a <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 a5d:	89 d8                	mov    %ebx,%eax
 a5f:	e8 2f ff ff ff       	call   993 <morecore>
 a64:	85 c0                	test   %eax,%eax
 a66:	75 e2                	jne    a4a <malloc+0x67>
 a68:	eb d5                	jmp    a3f <malloc+0x5c>
