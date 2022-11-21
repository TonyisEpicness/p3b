
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
   6:	68 48 0f 00 00       	push   $0xf48
   b:	e8 b2 04 00 00       	call   4c2 <lock_acquire>
   assert((unsigned int)sbrk(0) == size);
  10:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  17:	e8 0b 07 00 00       	call   727 <sbrk>
  1c:	83 c4 10             	add    $0x10,%esp
  1f:	3b 05 4c 0f 00 00    	cmp    0xf4c,%eax
  25:	74 49                	je     70 <worker+0x70>
  27:	6a 5b                	push   $0x5b
  29:	68 a4 0a 00 00       	push   $0xaa4
  2e:	68 ae 0a 00 00       	push   $0xaae
  33:	6a 01                	push   $0x1
  35:	e8 ba 07 00 00       	call   7f4 <printf>
  3a:	83 c4 0c             	add    $0xc,%esp
  3d:	68 b6 0a 00 00       	push   $0xab6
  42:	68 d4 0a 00 00       	push   $0xad4
  47:	6a 01                	push   $0x1
  49:	e8 a6 07 00 00       	call   7f4 <printf>
  4e:	83 c4 08             	add    $0x8,%esp
  51:	68 e8 0a 00 00       	push   $0xae8
  56:	6a 01                	push   $0x1
  58:	e8 97 07 00 00       	call   7f4 <printf>
  5d:	83 c4 04             	add    $0x4,%esp
  60:	ff 35 54 0f 00 00    	push   0xf54
  66:	e8 64 06 00 00       	call   6cf <kill>
  6b:	e8 2f 06 00 00       	call   69f <exit>
   global++;
  70:	83 05 50 0f 00 00 01 	addl   $0x1,0xf50
   lock_release(&lock);
  77:	83 ec 0c             	sub    $0xc,%esp
  7a:	68 48 0f 00 00       	push   $0xf48
  7f:	e8 60 04 00 00       	call   4e4 <lock_release>

   


   lock_acquire(&lock2);
  84:	c7 04 24 44 0f 00 00 	movl   $0xf44,(%esp)
  8b:	e8 32 04 00 00       	call   4c2 <lock_acquire>
   assert((unsigned int)sbrk(0) == size);
  90:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  97:	e8 8b 06 00 00       	call   727 <sbrk>
  9c:	83 c4 10             	add    $0x10,%esp
  9f:	3b 05 4c 0f 00 00    	cmp    0xf4c,%eax
  a5:	74 49                	je     f0 <worker+0xf0>
  a7:	6a 63                	push   $0x63
  a9:	68 a4 0a 00 00       	push   $0xaa4
  ae:	68 ae 0a 00 00       	push   $0xaae
  b3:	6a 01                	push   $0x1
  b5:	e8 3a 07 00 00       	call   7f4 <printf>
  ba:	83 c4 0c             	add    $0xc,%esp
  bd:	68 b6 0a 00 00       	push   $0xab6
  c2:	68 d4 0a 00 00       	push   $0xad4
  c7:	6a 01                	push   $0x1
  c9:	e8 26 07 00 00       	call   7f4 <printf>
  ce:	83 c4 08             	add    $0x8,%esp
  d1:	68 e8 0a 00 00       	push   $0xae8
  d6:	6a 01                	push   $0x1
  d8:	e8 17 07 00 00       	call   7f4 <printf>
  dd:	83 c4 04             	add    $0x4,%esp
  e0:	ff 35 54 0f 00 00    	push   0xf54
  e6:	e8 e4 05 00 00       	call   6cf <kill>
  eb:	e8 af 05 00 00       	call   69f <exit>
   global++;
  f0:	83 05 50 0f 00 00 01 	addl   $0x1,0xf50
   sbrk(10000);
  f7:	83 ec 0c             	sub    $0xc,%esp
  fa:	68 10 27 00 00       	push   $0x2710
  ff:	e8 23 06 00 00       	call   727 <sbrk>
   size = (unsigned int)sbrk(0);
 104:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 10b:	e8 17 06 00 00       	call   727 <sbrk>
 110:	a3 4c 0f 00 00       	mov    %eax,0xf4c
   lock_release(&lock2);
 115:	c7 04 24 44 0f 00 00 	movl   $0xf44,(%esp)
 11c:	e8 c3 03 00 00       	call   4e4 <lock_release>



   exit();
 121:	e8 79 05 00 00       	call   69f <exit>

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
 138:	e8 e2 05 00 00       	call   71f <getpid>
 13d:	a3 54 0f 00 00       	mov    %eax,0xf54
   int arg1 = 11, arg2 = 22;
 142:	c7 45 f4 0b 00 00 00 	movl   $0xb,-0xc(%ebp)
 149:	c7 45 f0 16 00 00 00 	movl   $0x16,-0x10(%ebp)
   lock_init(&lock);
 150:	83 ec 0c             	sub    $0xc,%esp
 153:	68 48 0f 00 00       	push   $0xf48
 158:	e8 95 03 00 00       	call   4f2 <lock_init>
   lock_init(&lock2);
 15d:	c7 04 24 44 0f 00 00 	movl   $0xf44,(%esp)
 164:	e8 89 03 00 00       	call   4f2 <lock_init>
   lock_acquire(&lock);
 169:	c7 04 24 48 0f 00 00 	movl   $0xf48,(%esp)
 170:	e8 4d 03 00 00       	call   4c2 <lock_acquire>
   lock_acquire(&lock2);
 175:	c7 04 24 44 0f 00 00 	movl   $0xf44,(%esp)
 17c:	e8 41 03 00 00       	call   4c2 <lock_acquire>
   for (int i = 0; i < num_threads; i++) {
 181:	83 c4 10             	add    $0x10,%esp
 184:	bb 00 00 00 00       	mov    $0x0,%ebx
 189:	eb 03                	jmp    18e <main+0x68>
 18b:	83 c3 01             	add    $0x1,%ebx
 18e:	39 1d 40 0f 00 00    	cmp    %ebx,0xf40
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
 1b4:	68 a4 0a 00 00       	push   $0xaa4
 1b9:	68 ae 0a 00 00       	push   $0xaae
 1be:	6a 01                	push   $0x1
 1c0:	e8 2f 06 00 00       	call   7f4 <printf>
 1c5:	83 c4 0c             	add    $0xc,%esp
 1c8:	68 f5 0a 00 00       	push   $0xaf5
 1cd:	68 d4 0a 00 00       	push   $0xad4
 1d2:	6a 01                	push   $0x1
 1d4:	e8 1b 06 00 00       	call   7f4 <printf>
 1d9:	83 c4 08             	add    $0x8,%esp
 1dc:	68 e8 0a 00 00       	push   $0xae8
 1e1:	6a 01                	push   $0x1
 1e3:	e8 0c 06 00 00       	call   7f4 <printf>
 1e8:	83 c4 04             	add    $0x4,%esp
 1eb:	ff 35 54 0f 00 00    	push   0xf54
 1f1:	e8 d9 04 00 00       	call   6cf <kill>
 1f6:	e8 a4 04 00 00       	call   69f <exit>
   size = (unsigned int)sbrk(0);
 1fb:	83 ec 0c             	sub    $0xc,%esp
 1fe:	6a 00                	push   $0x0
 200:	e8 22 05 00 00       	call   727 <sbrk>
 205:	a3 4c 0f 00 00       	mov    %eax,0xf4c
   while (global < num_threads) {
 20a:	83 c4 10             	add    $0x10,%esp
 20d:	a1 40 0f 00 00       	mov    0xf40,%eax
 212:	39 05 50 0f 00 00    	cmp    %eax,0xf50
 218:	7d 2a                	jge    244 <main+0x11e>
      lock_release(&lock);
 21a:	83 ec 0c             	sub    $0xc,%esp
 21d:	68 48 0f 00 00       	push   $0xf48
 222:	e8 bd 02 00 00       	call   4e4 <lock_release>
      sleep(100);
 227:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 22e:	e8 fc 04 00 00       	call   72f <sleep>
      lock_acquire(&lock);
 233:	c7 04 24 48 0f 00 00 	movl   $0xf48,(%esp)
 23a:	e8 83 02 00 00       	call   4c2 <lock_acquire>
 23f:	83 c4 10             	add    $0x10,%esp
 242:	eb c9                	jmp    20d <main+0xe7>
   global = 0;
 244:	c7 05 50 0f 00 00 00 	movl   $0x0,0xf50
 24b:	00 00 00 
   sbrk(10000);
 24e:	83 ec 0c             	sub    $0xc,%esp
 251:	68 10 27 00 00       	push   $0x2710
 256:	e8 cc 04 00 00       	call   727 <sbrk>
   size = (unsigned int)sbrk(0);
 25b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 262:	e8 c0 04 00 00       	call   727 <sbrk>
 267:	a3 4c 0f 00 00       	mov    %eax,0xf4c
   lock_release(&lock);
 26c:	c7 04 24 48 0f 00 00 	movl   $0xf48,(%esp)
 273:	e8 6c 02 00 00       	call   4e4 <lock_release>
   while (global < num_threads) {
 278:	83 c4 10             	add    $0x10,%esp
 27b:	a1 40 0f 00 00       	mov    0xf40,%eax
 280:	39 05 50 0f 00 00    	cmp    %eax,0xf50
 286:	7d 2a                	jge    2b2 <main+0x18c>
      lock_release(&lock2);
 288:	83 ec 0c             	sub    $0xc,%esp
 28b:	68 44 0f 00 00       	push   $0xf44
 290:	e8 4f 02 00 00       	call   4e4 <lock_release>
      sleep(100);
 295:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 29c:	e8 8e 04 00 00       	call   72f <sleep>
      lock_acquire(&lock2);
 2a1:	c7 04 24 44 0f 00 00 	movl   $0xf44,(%esp)
 2a8:	e8 15 02 00 00       	call   4c2 <lock_acquire>
 2ad:	83 c4 10             	add    $0x10,%esp
 2b0:	eb c9                	jmp    27b <main+0x155>
   lock_release(&lock2);
 2b2:	83 ec 0c             	sub    $0xc,%esp
 2b5:	68 44 0f 00 00       	push   $0xf44
 2ba:	e8 25 02 00 00       	call   4e4 <lock_release>
   for (int i = 0; i < num_threads; i++) {
 2bf:	83 c4 10             	add    $0x10,%esp
 2c2:	bb 00 00 00 00       	mov    $0x0,%ebx
 2c7:	39 1d 40 0f 00 00    	cmp    %ebx,0xf40
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
 2df:	68 a4 0a 00 00       	push   $0xaa4
 2e4:	68 ae 0a 00 00       	push   $0xaae
 2e9:	6a 01                	push   $0x1
 2eb:	e8 04 05 00 00       	call   7f4 <printf>
 2f0:	83 c4 0c             	add    $0xc,%esp
 2f3:	68 04 0b 00 00       	push   $0xb04
 2f8:	68 d4 0a 00 00       	push   $0xad4
 2fd:	6a 01                	push   $0x1
 2ff:	e8 f0 04 00 00       	call   7f4 <printf>
 304:	83 c4 08             	add    $0x8,%esp
 307:	68 e8 0a 00 00       	push   $0xae8
 30c:	6a 01                	push   $0x1
 30e:	e8 e1 04 00 00       	call   7f4 <printf>
 313:	83 c4 04             	add    $0x4,%esp
 316:	ff 35 54 0f 00 00    	push   0xf54
 31c:	e8 ae 03 00 00       	call   6cf <kill>
 321:	e8 79 03 00 00       	call   69f <exit>
   printf(1, "TEST PASSED\n");
 326:	83 ec 08             	sub    $0x8,%esp
 329:	68 11 0b 00 00       	push   $0xb11
 32e:	6a 01                	push   $0x1
 330:	e8 bf 04 00 00       	call   7f4 <printf>
   exit();
 335:	e8 65 03 00 00       	call   69f <exit>

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
 358:	68 a4 0a 00 00       	push   $0xaa4
 35d:	68 ae 0a 00 00       	push   $0xaae
 362:	6a 01                	push   $0x1
 364:	e8 8b 04 00 00       	call   7f4 <printf>
 369:	83 c4 0c             	add    $0xc,%esp
 36c:	68 2d 0b 00 00       	push   $0xb2d
 371:	68 d4 0a 00 00       	push   $0xad4
 376:	6a 01                	push   $0x1
 378:	e8 77 04 00 00       	call   7f4 <printf>
 37d:	83 c4 08             	add    $0x8,%esp
 380:	68 e8 0a 00 00       	push   $0xae8
 385:	6a 01                	push   $0x1
 387:	e8 68 04 00 00       	call   7f4 <printf>
 38c:	83 c4 04             	add    $0x4,%esp
 38f:	ff 35 54 0f 00 00    	push   0xf54
 395:	e8 35 03 00 00       	call   6cf <kill>
 39a:	e8 00 03 00 00       	call   69f <exit>
   assert(arg1_int == 11);
 39f:	6a 4c                	push   $0x4c
 3a1:	68 a4 0a 00 00       	push   $0xaa4
 3a6:	68 ae 0a 00 00       	push   $0xaae
 3ab:	6a 01                	push   $0x1
 3ad:	e8 42 04 00 00       	call   7f4 <printf>
 3b2:	83 c4 0c             	add    $0xc,%esp
 3b5:	68 1e 0b 00 00       	push   $0xb1e
 3ba:	68 d4 0a 00 00       	push   $0xad4
 3bf:	6a 01                	push   $0x1
 3c1:	e8 2e 04 00 00       	call   7f4 <printf>
 3c6:	83 c4 08             	add    $0x8,%esp
 3c9:	68 e8 0a 00 00       	push   $0xae8
 3ce:	6a 01                	push   $0x1
 3d0:	e8 1f 04 00 00       	call   7f4 <printf>
 3d5:	83 c4 04             	add    $0x4,%esp
 3d8:	ff 35 54 0f 00 00    	push   0xf54
 3de:	e8 ec 02 00 00       	call   6cf <kill>
 3e3:	e8 b7 02 00 00       	call   69f <exit>
   lock_acquire(&lock2);
 3e8:	83 ec 0c             	sub    $0xc,%esp
 3eb:	68 44 0f 00 00       	push   $0xf44
 3f0:	e8 cd 00 00 00       	call   4c2 <lock_acquire>
   assert((unsigned int)sbrk(0) == size);
 3f5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 3fc:	e8 26 03 00 00       	call   727 <sbrk>
 401:	83 c4 10             	add    $0x10,%esp
 404:	3b 05 4c 0f 00 00    	cmp    0xf4c,%eax
 40a:	74 49                	je     455 <worker2+0x11b>
 40c:	6a 50                	push   $0x50
 40e:	68 a4 0a 00 00       	push   $0xaa4
 413:	68 ae 0a 00 00       	push   $0xaae
 418:	6a 01                	push   $0x1
 41a:	e8 d5 03 00 00       	call   7f4 <printf>
 41f:	83 c4 0c             	add    $0xc,%esp
 422:	68 b6 0a 00 00       	push   $0xab6
 427:	68 d4 0a 00 00       	push   $0xad4
 42c:	6a 01                	push   $0x1
 42e:	e8 c1 03 00 00       	call   7f4 <printf>
 433:	83 c4 08             	add    $0x8,%esp
 436:	68 e8 0a 00 00       	push   $0xae8
 43b:	6a 01                	push   $0x1
 43d:	e8 b2 03 00 00       	call   7f4 <printf>
 442:	83 c4 04             	add    $0x4,%esp
 445:	ff 35 54 0f 00 00    	push   0xf54
 44b:	e8 7f 02 00 00       	call   6cf <kill>
 450:	e8 4a 02 00 00       	call   69f <exit>
   global++;
 455:	83 05 50 0f 00 00 01 	addl   $0x1,0xf50
   lock_release(&lock2);
 45c:	83 ec 0c             	sub    $0xc,%esp
 45f:	68 44 0f 00 00       	push   $0xf44
 464:	e8 7b 00 00 00       	call   4e4 <lock_release>
   exit();
 469:	e8 31 02 00 00       	call   69f <exit>

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
  void *n_stack = malloc(PGSIZE*2);
 485:	68 00 20 00 00       	push   $0x2000
 48a:	e8 8b 05 00 00       	call   a1a <malloc>
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
 4a0:	e8 9a 02 00 00       	call   73f <clone>


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
 4b1:	55                   	push   %ebp
 4b2:	89 e5                	mov    %esp,%ebp
 4b4:	83 ec 24             	sub    $0x24,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 4b7:	8d 45 f4             	lea    -0xc(%ebp),%eax
 4ba:	50                   	push   %eax
 4bb:	e8 87 02 00 00       	call   747 <join>
  
  return pid;
}
 4c0:	c9                   	leave  
 4c1:	c3                   	ret    

000004c2 <lock_acquire>:

void lock_acquire(lock_t *lock){
 4c2:	55                   	push   %ebp
 4c3:	89 e5                	mov    %esp,%ebp
 4c5:	53                   	push   %ebx
 4c6:	83 ec 04             	sub    $0x4,%esp
 4c9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 4cc:	83 ec 08             	sub    $0x8,%esp
 4cf:	6a 01                	push   $0x1
 4d1:	53                   	push   %ebx
 4d2:	e8 97 ff ff ff       	call   46e <test_and_set>
 4d7:	83 c4 10             	add    $0x10,%esp
 4da:	83 f8 01             	cmp    $0x1,%eax
 4dd:	74 ed                	je     4cc <lock_acquire+0xa>
    ;
}
 4df:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4e2:	c9                   	leave  
 4e3:	c3                   	ret    

000004e4 <lock_release>:

void lock_release(lock_t *lock) {
 4e4:	55                   	push   %ebp
 4e5:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 4e7:	8b 45 08             	mov    0x8(%ebp),%eax
 4ea:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 4f0:	5d                   	pop    %ebp
 4f1:	c3                   	ret    

000004f2 <lock_init>:

void lock_init(lock_t *lock) {
 4f2:	55                   	push   %ebp
 4f3:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 4f5:	8b 45 08             	mov    0x8(%ebp),%eax
 4f8:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 4fe:	5d                   	pop    %ebp
 4ff:	c3                   	ret    

00000500 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 500:	55                   	push   %ebp
 501:	89 e5                	mov    %esp,%ebp
 503:	56                   	push   %esi
 504:	53                   	push   %ebx
 505:	8b 75 08             	mov    0x8(%ebp),%esi
 508:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 50b:	89 f0                	mov    %esi,%eax
 50d:	89 d1                	mov    %edx,%ecx
 50f:	83 c2 01             	add    $0x1,%edx
 512:	89 c3                	mov    %eax,%ebx
 514:	83 c0 01             	add    $0x1,%eax
 517:	0f b6 09             	movzbl (%ecx),%ecx
 51a:	88 0b                	mov    %cl,(%ebx)
 51c:	84 c9                	test   %cl,%cl
 51e:	75 ed                	jne    50d <strcpy+0xd>
    ;
  return os;
}
 520:	89 f0                	mov    %esi,%eax
 522:	5b                   	pop    %ebx
 523:	5e                   	pop    %esi
 524:	5d                   	pop    %ebp
 525:	c3                   	ret    

00000526 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 526:	55                   	push   %ebp
 527:	89 e5                	mov    %esp,%ebp
 529:	8b 4d 08             	mov    0x8(%ebp),%ecx
 52c:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 52f:	eb 06                	jmp    537 <strcmp+0x11>
    p++, q++;
 531:	83 c1 01             	add    $0x1,%ecx
 534:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 537:	0f b6 01             	movzbl (%ecx),%eax
 53a:	84 c0                	test   %al,%al
 53c:	74 04                	je     542 <strcmp+0x1c>
 53e:	3a 02                	cmp    (%edx),%al
 540:	74 ef                	je     531 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 542:	0f b6 c0             	movzbl %al,%eax
 545:	0f b6 12             	movzbl (%edx),%edx
 548:	29 d0                	sub    %edx,%eax
}
 54a:	5d                   	pop    %ebp
 54b:	c3                   	ret    

0000054c <strlen>:

uint
strlen(const char *s)
{
 54c:	55                   	push   %ebp
 54d:	89 e5                	mov    %esp,%ebp
 54f:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 552:	b8 00 00 00 00       	mov    $0x0,%eax
 557:	eb 03                	jmp    55c <strlen+0x10>
 559:	83 c0 01             	add    $0x1,%eax
 55c:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 560:	75 f7                	jne    559 <strlen+0xd>
    ;
  return n;
}
 562:	5d                   	pop    %ebp
 563:	c3                   	ret    

00000564 <memset>:

void*
memset(void *dst, int c, uint n)
{
 564:	55                   	push   %ebp
 565:	89 e5                	mov    %esp,%ebp
 567:	57                   	push   %edi
 568:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 56b:	89 d7                	mov    %edx,%edi
 56d:	8b 4d 10             	mov    0x10(%ebp),%ecx
 570:	8b 45 0c             	mov    0xc(%ebp),%eax
 573:	fc                   	cld    
 574:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 576:	89 d0                	mov    %edx,%eax
 578:	8b 7d fc             	mov    -0x4(%ebp),%edi
 57b:	c9                   	leave  
 57c:	c3                   	ret    

0000057d <strchr>:

char*
strchr(const char *s, char c)
{
 57d:	55                   	push   %ebp
 57e:	89 e5                	mov    %esp,%ebp
 580:	8b 45 08             	mov    0x8(%ebp),%eax
 583:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 587:	eb 03                	jmp    58c <strchr+0xf>
 589:	83 c0 01             	add    $0x1,%eax
 58c:	0f b6 10             	movzbl (%eax),%edx
 58f:	84 d2                	test   %dl,%dl
 591:	74 06                	je     599 <strchr+0x1c>
    if(*s == c)
 593:	38 ca                	cmp    %cl,%dl
 595:	75 f2                	jne    589 <strchr+0xc>
 597:	eb 05                	jmp    59e <strchr+0x21>
      return (char*)s;
  return 0;
 599:	b8 00 00 00 00       	mov    $0x0,%eax
}
 59e:	5d                   	pop    %ebp
 59f:	c3                   	ret    

000005a0 <gets>:

char*
gets(char *buf, int max)
{
 5a0:	55                   	push   %ebp
 5a1:	89 e5                	mov    %esp,%ebp
 5a3:	57                   	push   %edi
 5a4:	56                   	push   %esi
 5a5:	53                   	push   %ebx
 5a6:	83 ec 1c             	sub    $0x1c,%esp
 5a9:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 5ac:	bb 00 00 00 00       	mov    $0x0,%ebx
 5b1:	89 de                	mov    %ebx,%esi
 5b3:	83 c3 01             	add    $0x1,%ebx
 5b6:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 5b9:	7d 2e                	jge    5e9 <gets+0x49>
    cc = read(0, &c, 1);
 5bb:	83 ec 04             	sub    $0x4,%esp
 5be:	6a 01                	push   $0x1
 5c0:	8d 45 e7             	lea    -0x19(%ebp),%eax
 5c3:	50                   	push   %eax
 5c4:	6a 00                	push   $0x0
 5c6:	e8 ec 00 00 00       	call   6b7 <read>
    if(cc < 1)
 5cb:	83 c4 10             	add    $0x10,%esp
 5ce:	85 c0                	test   %eax,%eax
 5d0:	7e 17                	jle    5e9 <gets+0x49>
      break;
    buf[i++] = c;
 5d2:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 5d6:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 5d9:	3c 0a                	cmp    $0xa,%al
 5db:	0f 94 c2             	sete   %dl
 5de:	3c 0d                	cmp    $0xd,%al
 5e0:	0f 94 c0             	sete   %al
 5e3:	08 c2                	or     %al,%dl
 5e5:	74 ca                	je     5b1 <gets+0x11>
    buf[i++] = c;
 5e7:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 5e9:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 5ed:	89 f8                	mov    %edi,%eax
 5ef:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5f2:	5b                   	pop    %ebx
 5f3:	5e                   	pop    %esi
 5f4:	5f                   	pop    %edi
 5f5:	5d                   	pop    %ebp
 5f6:	c3                   	ret    

000005f7 <stat>:

int
stat(const char *n, struct stat *st)
{
 5f7:	55                   	push   %ebp
 5f8:	89 e5                	mov    %esp,%ebp
 5fa:	56                   	push   %esi
 5fb:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 5fc:	83 ec 08             	sub    $0x8,%esp
 5ff:	6a 00                	push   $0x0
 601:	ff 75 08             	push   0x8(%ebp)
 604:	e8 d6 00 00 00       	call   6df <open>
  if(fd < 0)
 609:	83 c4 10             	add    $0x10,%esp
 60c:	85 c0                	test   %eax,%eax
 60e:	78 24                	js     634 <stat+0x3d>
 610:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 612:	83 ec 08             	sub    $0x8,%esp
 615:	ff 75 0c             	push   0xc(%ebp)
 618:	50                   	push   %eax
 619:	e8 d9 00 00 00       	call   6f7 <fstat>
 61e:	89 c6                	mov    %eax,%esi
  close(fd);
 620:	89 1c 24             	mov    %ebx,(%esp)
 623:	e8 9f 00 00 00       	call   6c7 <close>
  return r;
 628:	83 c4 10             	add    $0x10,%esp
}
 62b:	89 f0                	mov    %esi,%eax
 62d:	8d 65 f8             	lea    -0x8(%ebp),%esp
 630:	5b                   	pop    %ebx
 631:	5e                   	pop    %esi
 632:	5d                   	pop    %ebp
 633:	c3                   	ret    
    return -1;
 634:	be ff ff ff ff       	mov    $0xffffffff,%esi
 639:	eb f0                	jmp    62b <stat+0x34>

0000063b <atoi>:

int
atoi(const char *s)
{
 63b:	55                   	push   %ebp
 63c:	89 e5                	mov    %esp,%ebp
 63e:	53                   	push   %ebx
 63f:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 642:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 647:	eb 10                	jmp    659 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 649:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 64c:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 64f:	83 c1 01             	add    $0x1,%ecx
 652:	0f be c0             	movsbl %al,%eax
 655:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 659:	0f b6 01             	movzbl (%ecx),%eax
 65c:	8d 58 d0             	lea    -0x30(%eax),%ebx
 65f:	80 fb 09             	cmp    $0x9,%bl
 662:	76 e5                	jbe    649 <atoi+0xe>
  return n;
}
 664:	89 d0                	mov    %edx,%eax
 666:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 669:	c9                   	leave  
 66a:	c3                   	ret    

0000066b <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 66b:	55                   	push   %ebp
 66c:	89 e5                	mov    %esp,%ebp
 66e:	56                   	push   %esi
 66f:	53                   	push   %ebx
 670:	8b 75 08             	mov    0x8(%ebp),%esi
 673:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 676:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 679:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 67b:	eb 0d                	jmp    68a <memmove+0x1f>
    *dst++ = *src++;
 67d:	0f b6 01             	movzbl (%ecx),%eax
 680:	88 02                	mov    %al,(%edx)
 682:	8d 49 01             	lea    0x1(%ecx),%ecx
 685:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 688:	89 d8                	mov    %ebx,%eax
 68a:	8d 58 ff             	lea    -0x1(%eax),%ebx
 68d:	85 c0                	test   %eax,%eax
 68f:	7f ec                	jg     67d <memmove+0x12>
  return vdst;
}
 691:	89 f0                	mov    %esi,%eax
 693:	5b                   	pop    %ebx
 694:	5e                   	pop    %esi
 695:	5d                   	pop    %ebp
 696:	c3                   	ret    

00000697 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 697:	b8 01 00 00 00       	mov    $0x1,%eax
 69c:	cd 40                	int    $0x40
 69e:	c3                   	ret    

0000069f <exit>:
SYSCALL(exit)
 69f:	b8 02 00 00 00       	mov    $0x2,%eax
 6a4:	cd 40                	int    $0x40
 6a6:	c3                   	ret    

000006a7 <wait>:
SYSCALL(wait)
 6a7:	b8 03 00 00 00       	mov    $0x3,%eax
 6ac:	cd 40                	int    $0x40
 6ae:	c3                   	ret    

000006af <pipe>:
SYSCALL(pipe)
 6af:	b8 04 00 00 00       	mov    $0x4,%eax
 6b4:	cd 40                	int    $0x40
 6b6:	c3                   	ret    

000006b7 <read>:
SYSCALL(read)
 6b7:	b8 05 00 00 00       	mov    $0x5,%eax
 6bc:	cd 40                	int    $0x40
 6be:	c3                   	ret    

000006bf <write>:
SYSCALL(write)
 6bf:	b8 10 00 00 00       	mov    $0x10,%eax
 6c4:	cd 40                	int    $0x40
 6c6:	c3                   	ret    

000006c7 <close>:
SYSCALL(close)
 6c7:	b8 15 00 00 00       	mov    $0x15,%eax
 6cc:	cd 40                	int    $0x40
 6ce:	c3                   	ret    

000006cf <kill>:
SYSCALL(kill)
 6cf:	b8 06 00 00 00       	mov    $0x6,%eax
 6d4:	cd 40                	int    $0x40
 6d6:	c3                   	ret    

000006d7 <exec>:
SYSCALL(exec)
 6d7:	b8 07 00 00 00       	mov    $0x7,%eax
 6dc:	cd 40                	int    $0x40
 6de:	c3                   	ret    

000006df <open>:
SYSCALL(open)
 6df:	b8 0f 00 00 00       	mov    $0xf,%eax
 6e4:	cd 40                	int    $0x40
 6e6:	c3                   	ret    

000006e7 <mknod>:
SYSCALL(mknod)
 6e7:	b8 11 00 00 00       	mov    $0x11,%eax
 6ec:	cd 40                	int    $0x40
 6ee:	c3                   	ret    

000006ef <unlink>:
SYSCALL(unlink)
 6ef:	b8 12 00 00 00       	mov    $0x12,%eax
 6f4:	cd 40                	int    $0x40
 6f6:	c3                   	ret    

000006f7 <fstat>:
SYSCALL(fstat)
 6f7:	b8 08 00 00 00       	mov    $0x8,%eax
 6fc:	cd 40                	int    $0x40
 6fe:	c3                   	ret    

000006ff <link>:
SYSCALL(link)
 6ff:	b8 13 00 00 00       	mov    $0x13,%eax
 704:	cd 40                	int    $0x40
 706:	c3                   	ret    

00000707 <mkdir>:
SYSCALL(mkdir)
 707:	b8 14 00 00 00       	mov    $0x14,%eax
 70c:	cd 40                	int    $0x40
 70e:	c3                   	ret    

0000070f <chdir>:
SYSCALL(chdir)
 70f:	b8 09 00 00 00       	mov    $0x9,%eax
 714:	cd 40                	int    $0x40
 716:	c3                   	ret    

00000717 <dup>:
SYSCALL(dup)
 717:	b8 0a 00 00 00       	mov    $0xa,%eax
 71c:	cd 40                	int    $0x40
 71e:	c3                   	ret    

0000071f <getpid>:
SYSCALL(getpid)
 71f:	b8 0b 00 00 00       	mov    $0xb,%eax
 724:	cd 40                	int    $0x40
 726:	c3                   	ret    

00000727 <sbrk>:
SYSCALL(sbrk)
 727:	b8 0c 00 00 00       	mov    $0xc,%eax
 72c:	cd 40                	int    $0x40
 72e:	c3                   	ret    

0000072f <sleep>:
SYSCALL(sleep)
 72f:	b8 0d 00 00 00       	mov    $0xd,%eax
 734:	cd 40                	int    $0x40
 736:	c3                   	ret    

00000737 <uptime>:
SYSCALL(uptime)
 737:	b8 0e 00 00 00       	mov    $0xe,%eax
 73c:	cd 40                	int    $0x40
 73e:	c3                   	ret    

0000073f <clone>:
SYSCALL(clone)
 73f:	b8 16 00 00 00       	mov    $0x16,%eax
 744:	cd 40                	int    $0x40
 746:	c3                   	ret    

00000747 <join>:
 747:	b8 17 00 00 00       	mov    $0x17,%eax
 74c:	cd 40                	int    $0x40
 74e:	c3                   	ret    

0000074f <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 74f:	55                   	push   %ebp
 750:	89 e5                	mov    %esp,%ebp
 752:	83 ec 1c             	sub    $0x1c,%esp
 755:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 758:	6a 01                	push   $0x1
 75a:	8d 55 f4             	lea    -0xc(%ebp),%edx
 75d:	52                   	push   %edx
 75e:	50                   	push   %eax
 75f:	e8 5b ff ff ff       	call   6bf <write>
}
 764:	83 c4 10             	add    $0x10,%esp
 767:	c9                   	leave  
 768:	c3                   	ret    

00000769 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 769:	55                   	push   %ebp
 76a:	89 e5                	mov    %esp,%ebp
 76c:	57                   	push   %edi
 76d:	56                   	push   %esi
 76e:	53                   	push   %ebx
 76f:	83 ec 2c             	sub    $0x2c,%esp
 772:	89 45 d0             	mov    %eax,-0x30(%ebp)
 775:	89 d0                	mov    %edx,%eax
 777:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 779:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 77d:	0f 95 c1             	setne  %cl
 780:	c1 ea 1f             	shr    $0x1f,%edx
 783:	84 d1                	test   %dl,%cl
 785:	74 44                	je     7cb <printint+0x62>
    neg = 1;
    x = -xx;
 787:	f7 d8                	neg    %eax
 789:	89 c1                	mov    %eax,%ecx
    neg = 1;
 78b:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 792:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 797:	89 c8                	mov    %ecx,%eax
 799:	ba 00 00 00 00       	mov    $0x0,%edx
 79e:	f7 f6                	div    %esi
 7a0:	89 df                	mov    %ebx,%edi
 7a2:	83 c3 01             	add    $0x1,%ebx
 7a5:	0f b6 92 9c 0b 00 00 	movzbl 0xb9c(%edx),%edx
 7ac:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 7b0:	89 ca                	mov    %ecx,%edx
 7b2:	89 c1                	mov    %eax,%ecx
 7b4:	39 d6                	cmp    %edx,%esi
 7b6:	76 df                	jbe    797 <printint+0x2e>
  if(neg)
 7b8:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 7bc:	74 31                	je     7ef <printint+0x86>
    buf[i++] = '-';
 7be:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 7c3:	8d 5f 02             	lea    0x2(%edi),%ebx
 7c6:	8b 75 d0             	mov    -0x30(%ebp),%esi
 7c9:	eb 17                	jmp    7e2 <printint+0x79>
    x = xx;
 7cb:	89 c1                	mov    %eax,%ecx
  neg = 0;
 7cd:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 7d4:	eb bc                	jmp    792 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 7d6:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 7db:	89 f0                	mov    %esi,%eax
 7dd:	e8 6d ff ff ff       	call   74f <putc>
  while(--i >= 0)
 7e2:	83 eb 01             	sub    $0x1,%ebx
 7e5:	79 ef                	jns    7d6 <printint+0x6d>
}
 7e7:	83 c4 2c             	add    $0x2c,%esp
 7ea:	5b                   	pop    %ebx
 7eb:	5e                   	pop    %esi
 7ec:	5f                   	pop    %edi
 7ed:	5d                   	pop    %ebp
 7ee:	c3                   	ret    
 7ef:	8b 75 d0             	mov    -0x30(%ebp),%esi
 7f2:	eb ee                	jmp    7e2 <printint+0x79>

000007f4 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 7f4:	55                   	push   %ebp
 7f5:	89 e5                	mov    %esp,%ebp
 7f7:	57                   	push   %edi
 7f8:	56                   	push   %esi
 7f9:	53                   	push   %ebx
 7fa:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 7fd:	8d 45 10             	lea    0x10(%ebp),%eax
 800:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 803:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 808:	bb 00 00 00 00       	mov    $0x0,%ebx
 80d:	eb 14                	jmp    823 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 80f:	89 fa                	mov    %edi,%edx
 811:	8b 45 08             	mov    0x8(%ebp),%eax
 814:	e8 36 ff ff ff       	call   74f <putc>
 819:	eb 05                	jmp    820 <printf+0x2c>
      }
    } else if(state == '%'){
 81b:	83 fe 25             	cmp    $0x25,%esi
 81e:	74 25                	je     845 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 820:	83 c3 01             	add    $0x1,%ebx
 823:	8b 45 0c             	mov    0xc(%ebp),%eax
 826:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 82a:	84 c0                	test   %al,%al
 82c:	0f 84 20 01 00 00    	je     952 <printf+0x15e>
    c = fmt[i] & 0xff;
 832:	0f be f8             	movsbl %al,%edi
 835:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 838:	85 f6                	test   %esi,%esi
 83a:	75 df                	jne    81b <printf+0x27>
      if(c == '%'){
 83c:	83 f8 25             	cmp    $0x25,%eax
 83f:	75 ce                	jne    80f <printf+0x1b>
        state = '%';
 841:	89 c6                	mov    %eax,%esi
 843:	eb db                	jmp    820 <printf+0x2c>
      if(c == 'd'){
 845:	83 f8 25             	cmp    $0x25,%eax
 848:	0f 84 cf 00 00 00    	je     91d <printf+0x129>
 84e:	0f 8c dd 00 00 00    	jl     931 <printf+0x13d>
 854:	83 f8 78             	cmp    $0x78,%eax
 857:	0f 8f d4 00 00 00    	jg     931 <printf+0x13d>
 85d:	83 f8 63             	cmp    $0x63,%eax
 860:	0f 8c cb 00 00 00    	jl     931 <printf+0x13d>
 866:	83 e8 63             	sub    $0x63,%eax
 869:	83 f8 15             	cmp    $0x15,%eax
 86c:	0f 87 bf 00 00 00    	ja     931 <printf+0x13d>
 872:	ff 24 85 44 0b 00 00 	jmp    *0xb44(,%eax,4)
        printint(fd, *ap, 10, 1);
 879:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 87c:	8b 17                	mov    (%edi),%edx
 87e:	83 ec 0c             	sub    $0xc,%esp
 881:	6a 01                	push   $0x1
 883:	b9 0a 00 00 00       	mov    $0xa,%ecx
 888:	8b 45 08             	mov    0x8(%ebp),%eax
 88b:	e8 d9 fe ff ff       	call   769 <printint>
        ap++;
 890:	83 c7 04             	add    $0x4,%edi
 893:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 896:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 899:	be 00 00 00 00       	mov    $0x0,%esi
 89e:	eb 80                	jmp    820 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 8a0:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 8a3:	8b 17                	mov    (%edi),%edx
 8a5:	83 ec 0c             	sub    $0xc,%esp
 8a8:	6a 00                	push   $0x0
 8aa:	b9 10 00 00 00       	mov    $0x10,%ecx
 8af:	8b 45 08             	mov    0x8(%ebp),%eax
 8b2:	e8 b2 fe ff ff       	call   769 <printint>
        ap++;
 8b7:	83 c7 04             	add    $0x4,%edi
 8ba:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 8bd:	83 c4 10             	add    $0x10,%esp
      state = 0;
 8c0:	be 00 00 00 00       	mov    $0x0,%esi
 8c5:	e9 56 ff ff ff       	jmp    820 <printf+0x2c>
        s = (char*)*ap;
 8ca:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8cd:	8b 30                	mov    (%eax),%esi
        ap++;
 8cf:	83 c0 04             	add    $0x4,%eax
 8d2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 8d5:	85 f6                	test   %esi,%esi
 8d7:	75 15                	jne    8ee <printf+0xfa>
          s = "(null)";
 8d9:	be 3c 0b 00 00       	mov    $0xb3c,%esi
 8de:	eb 0e                	jmp    8ee <printf+0xfa>
          putc(fd, *s);
 8e0:	0f be d2             	movsbl %dl,%edx
 8e3:	8b 45 08             	mov    0x8(%ebp),%eax
 8e6:	e8 64 fe ff ff       	call   74f <putc>
          s++;
 8eb:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 8ee:	0f b6 16             	movzbl (%esi),%edx
 8f1:	84 d2                	test   %dl,%dl
 8f3:	75 eb                	jne    8e0 <printf+0xec>
      state = 0;
 8f5:	be 00 00 00 00       	mov    $0x0,%esi
 8fa:	e9 21 ff ff ff       	jmp    820 <printf+0x2c>
        putc(fd, *ap);
 8ff:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 902:	0f be 17             	movsbl (%edi),%edx
 905:	8b 45 08             	mov    0x8(%ebp),%eax
 908:	e8 42 fe ff ff       	call   74f <putc>
        ap++;
 90d:	83 c7 04             	add    $0x4,%edi
 910:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 913:	be 00 00 00 00       	mov    $0x0,%esi
 918:	e9 03 ff ff ff       	jmp    820 <printf+0x2c>
        putc(fd, c);
 91d:	89 fa                	mov    %edi,%edx
 91f:	8b 45 08             	mov    0x8(%ebp),%eax
 922:	e8 28 fe ff ff       	call   74f <putc>
      state = 0;
 927:	be 00 00 00 00       	mov    $0x0,%esi
 92c:	e9 ef fe ff ff       	jmp    820 <printf+0x2c>
        putc(fd, '%');
 931:	ba 25 00 00 00       	mov    $0x25,%edx
 936:	8b 45 08             	mov    0x8(%ebp),%eax
 939:	e8 11 fe ff ff       	call   74f <putc>
        putc(fd, c);
 93e:	89 fa                	mov    %edi,%edx
 940:	8b 45 08             	mov    0x8(%ebp),%eax
 943:	e8 07 fe ff ff       	call   74f <putc>
      state = 0;
 948:	be 00 00 00 00       	mov    $0x0,%esi
 94d:	e9 ce fe ff ff       	jmp    820 <printf+0x2c>
    }
  }
}
 952:	8d 65 f4             	lea    -0xc(%ebp),%esp
 955:	5b                   	pop    %ebx
 956:	5e                   	pop    %esi
 957:	5f                   	pop    %edi
 958:	5d                   	pop    %ebp
 959:	c3                   	ret    

0000095a <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 95a:	55                   	push   %ebp
 95b:	89 e5                	mov    %esp,%ebp
 95d:	57                   	push   %edi
 95e:	56                   	push   %esi
 95f:	53                   	push   %ebx
 960:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 963:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 966:	a1 58 0f 00 00       	mov    0xf58,%eax
 96b:	eb 02                	jmp    96f <free+0x15>
 96d:	89 d0                	mov    %edx,%eax
 96f:	39 c8                	cmp    %ecx,%eax
 971:	73 04                	jae    977 <free+0x1d>
 973:	39 08                	cmp    %ecx,(%eax)
 975:	77 12                	ja     989 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 977:	8b 10                	mov    (%eax),%edx
 979:	39 c2                	cmp    %eax,%edx
 97b:	77 f0                	ja     96d <free+0x13>
 97d:	39 c8                	cmp    %ecx,%eax
 97f:	72 08                	jb     989 <free+0x2f>
 981:	39 ca                	cmp    %ecx,%edx
 983:	77 04                	ja     989 <free+0x2f>
 985:	89 d0                	mov    %edx,%eax
 987:	eb e6                	jmp    96f <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 989:	8b 73 fc             	mov    -0x4(%ebx),%esi
 98c:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 98f:	8b 10                	mov    (%eax),%edx
 991:	39 d7                	cmp    %edx,%edi
 993:	74 19                	je     9ae <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 995:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 998:	8b 50 04             	mov    0x4(%eax),%edx
 99b:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 99e:	39 ce                	cmp    %ecx,%esi
 9a0:	74 1b                	je     9bd <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 9a2:	89 08                	mov    %ecx,(%eax)
  freep = p;
 9a4:	a3 58 0f 00 00       	mov    %eax,0xf58
}
 9a9:	5b                   	pop    %ebx
 9aa:	5e                   	pop    %esi
 9ab:	5f                   	pop    %edi
 9ac:	5d                   	pop    %ebp
 9ad:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 9ae:	03 72 04             	add    0x4(%edx),%esi
 9b1:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 9b4:	8b 10                	mov    (%eax),%edx
 9b6:	8b 12                	mov    (%edx),%edx
 9b8:	89 53 f8             	mov    %edx,-0x8(%ebx)
 9bb:	eb db                	jmp    998 <free+0x3e>
    p->s.size += bp->s.size;
 9bd:	03 53 fc             	add    -0x4(%ebx),%edx
 9c0:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 9c3:	8b 53 f8             	mov    -0x8(%ebx),%edx
 9c6:	89 10                	mov    %edx,(%eax)
 9c8:	eb da                	jmp    9a4 <free+0x4a>

000009ca <morecore>:

static Header*
morecore(uint nu)
{
 9ca:	55                   	push   %ebp
 9cb:	89 e5                	mov    %esp,%ebp
 9cd:	53                   	push   %ebx
 9ce:	83 ec 04             	sub    $0x4,%esp
 9d1:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 9d3:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 9d8:	77 05                	ja     9df <morecore+0x15>
    nu = 4096;
 9da:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 9df:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 9e6:	83 ec 0c             	sub    $0xc,%esp
 9e9:	50                   	push   %eax
 9ea:	e8 38 fd ff ff       	call   727 <sbrk>
  if(p == (char*)-1)
 9ef:	83 c4 10             	add    $0x10,%esp
 9f2:	83 f8 ff             	cmp    $0xffffffff,%eax
 9f5:	74 1c                	je     a13 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 9f7:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 9fa:	83 c0 08             	add    $0x8,%eax
 9fd:	83 ec 0c             	sub    $0xc,%esp
 a00:	50                   	push   %eax
 a01:	e8 54 ff ff ff       	call   95a <free>
  return freep;
 a06:	a1 58 0f 00 00       	mov    0xf58,%eax
 a0b:	83 c4 10             	add    $0x10,%esp
}
 a0e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 a11:	c9                   	leave  
 a12:	c3                   	ret    
    return 0;
 a13:	b8 00 00 00 00       	mov    $0x0,%eax
 a18:	eb f4                	jmp    a0e <morecore+0x44>

00000a1a <malloc>:

void*
malloc(uint nbytes)
{
 a1a:	55                   	push   %ebp
 a1b:	89 e5                	mov    %esp,%ebp
 a1d:	53                   	push   %ebx
 a1e:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a21:	8b 45 08             	mov    0x8(%ebp),%eax
 a24:	8d 58 07             	lea    0x7(%eax),%ebx
 a27:	c1 eb 03             	shr    $0x3,%ebx
 a2a:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 a2d:	8b 0d 58 0f 00 00    	mov    0xf58,%ecx
 a33:	85 c9                	test   %ecx,%ecx
 a35:	74 04                	je     a3b <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a37:	8b 01                	mov    (%ecx),%eax
 a39:	eb 4a                	jmp    a85 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 a3b:	c7 05 58 0f 00 00 5c 	movl   $0xf5c,0xf58
 a42:	0f 00 00 
 a45:	c7 05 5c 0f 00 00 5c 	movl   $0xf5c,0xf5c
 a4c:	0f 00 00 
    base.s.size = 0;
 a4f:	c7 05 60 0f 00 00 00 	movl   $0x0,0xf60
 a56:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 a59:	b9 5c 0f 00 00       	mov    $0xf5c,%ecx
 a5e:	eb d7                	jmp    a37 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 a60:	74 19                	je     a7b <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 a62:	29 da                	sub    %ebx,%edx
 a64:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 a67:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 a6a:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 a6d:	89 0d 58 0f 00 00    	mov    %ecx,0xf58
      return (void*)(p + 1);
 a73:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 a76:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 a79:	c9                   	leave  
 a7a:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 a7b:	8b 10                	mov    (%eax),%edx
 a7d:	89 11                	mov    %edx,(%ecx)
 a7f:	eb ec                	jmp    a6d <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a81:	89 c1                	mov    %eax,%ecx
 a83:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 a85:	8b 50 04             	mov    0x4(%eax),%edx
 a88:	39 da                	cmp    %ebx,%edx
 a8a:	73 d4                	jae    a60 <malloc+0x46>
    if(p == freep)
 a8c:	39 05 58 0f 00 00    	cmp    %eax,0xf58
 a92:	75 ed                	jne    a81 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 a94:	89 d8                	mov    %ebx,%eax
 a96:	e8 2f ff ff ff       	call   9ca <morecore>
 a9b:	85 c0                	test   %eax,%eax
 a9d:	75 e2                	jne    a81 <malloc+0x67>
 a9f:	eb d5                	jmp    a76 <malloc+0x5c>
