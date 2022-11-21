
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
   6:	68 c4 0f 00 00       	push   $0xfc4
   b:	e8 20 05 00 00       	call   530 <lock_acquire>
   assert((unsigned int)sbrk(0) == size);
  10:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  17:	e8 79 07 00 00       	call   795 <sbrk>
  1c:	83 c4 10             	add    $0x10,%esp
  1f:	3b 05 c8 0f 00 00    	cmp    0xfc8,%eax
  25:	74 49                	je     70 <worker+0x70>
  27:	6a 5b                	push   $0x5b
  29:	68 10 0b 00 00       	push   $0xb10
  2e:	68 1a 0b 00 00       	push   $0xb1a
  33:	6a 01                	push   $0x1
  35:	e8 28 08 00 00       	call   862 <printf>
  3a:	83 c4 0c             	add    $0xc,%esp
  3d:	68 22 0b 00 00       	push   $0xb22
  42:	68 40 0b 00 00       	push   $0xb40
  47:	6a 01                	push   $0x1
  49:	e8 14 08 00 00       	call   862 <printf>
  4e:	83 c4 08             	add    $0x8,%esp
  51:	68 54 0b 00 00       	push   $0xb54
  56:	6a 01                	push   $0x1
  58:	e8 05 08 00 00       	call   862 <printf>
  5d:	83 c4 04             	add    $0x4,%esp
  60:	ff 35 d0 0f 00 00    	push   0xfd0
  66:	e8 d2 06 00 00       	call   73d <kill>
  6b:	e8 9d 06 00 00       	call   70d <exit>
   global++;
  70:	83 05 cc 0f 00 00 01 	addl   $0x1,0xfcc
   lock_release(&lock);
  77:	83 ec 0c             	sub    $0xc,%esp
  7a:	68 c4 0f 00 00       	push   $0xfc4
  7f:	e8 ce 04 00 00       	call   552 <lock_release>

   


   lock_acquire(&lock2);
  84:	c7 04 24 c0 0f 00 00 	movl   $0xfc0,(%esp)
  8b:	e8 a0 04 00 00       	call   530 <lock_acquire>
   assert((unsigned int)sbrk(0) == size);
  90:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  97:	e8 f9 06 00 00       	call   795 <sbrk>
  9c:	83 c4 10             	add    $0x10,%esp
  9f:	3b 05 c8 0f 00 00    	cmp    0xfc8,%eax
  a5:	74 49                	je     f0 <worker+0xf0>
  a7:	6a 63                	push   $0x63
  a9:	68 10 0b 00 00       	push   $0xb10
  ae:	68 1a 0b 00 00       	push   $0xb1a
  b3:	6a 01                	push   $0x1
  b5:	e8 a8 07 00 00       	call   862 <printf>
  ba:	83 c4 0c             	add    $0xc,%esp
  bd:	68 22 0b 00 00       	push   $0xb22
  c2:	68 40 0b 00 00       	push   $0xb40
  c7:	6a 01                	push   $0x1
  c9:	e8 94 07 00 00       	call   862 <printf>
  ce:	83 c4 08             	add    $0x8,%esp
  d1:	68 54 0b 00 00       	push   $0xb54
  d6:	6a 01                	push   $0x1
  d8:	e8 85 07 00 00       	call   862 <printf>
  dd:	83 c4 04             	add    $0x4,%esp
  e0:	ff 35 d0 0f 00 00    	push   0xfd0
  e6:	e8 52 06 00 00       	call   73d <kill>
  eb:	e8 1d 06 00 00       	call   70d <exit>
   global++;
  f0:	83 05 cc 0f 00 00 01 	addl   $0x1,0xfcc
   sbrk(10000);
  f7:	83 ec 0c             	sub    $0xc,%esp
  fa:	68 10 27 00 00       	push   $0x2710
  ff:	e8 91 06 00 00       	call   795 <sbrk>
   size = (unsigned int)sbrk(0);
 104:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 10b:	e8 85 06 00 00       	call   795 <sbrk>
 110:	a3 c8 0f 00 00       	mov    %eax,0xfc8
   lock_release(&lock2);
 115:	c7 04 24 c0 0f 00 00 	movl   $0xfc0,(%esp)
 11c:	e8 31 04 00 00       	call   552 <lock_release>



   exit();
 121:	e8 e7 05 00 00       	call   70d <exit>

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
 138:	e8 50 06 00 00       	call   78d <getpid>
 13d:	a3 d0 0f 00 00       	mov    %eax,0xfd0
   int arg1 = 11, arg2 = 22;
 142:	c7 45 f4 0b 00 00 00 	movl   $0xb,-0xc(%ebp)
 149:	c7 45 f0 16 00 00 00 	movl   $0x16,-0x10(%ebp)
   lock_init(&lock);
 150:	83 ec 0c             	sub    $0xc,%esp
 153:	68 c4 0f 00 00       	push   $0xfc4
 158:	e8 03 04 00 00       	call   560 <lock_init>
   lock_init(&lock2);
 15d:	c7 04 24 c0 0f 00 00 	movl   $0xfc0,(%esp)
 164:	e8 f7 03 00 00       	call   560 <lock_init>
   lock_acquire(&lock);
 169:	c7 04 24 c4 0f 00 00 	movl   $0xfc4,(%esp)
 170:	e8 bb 03 00 00       	call   530 <lock_acquire>
   lock_acquire(&lock2);
 175:	c7 04 24 c0 0f 00 00 	movl   $0xfc0,(%esp)
 17c:	e8 af 03 00 00       	call   530 <lock_acquire>
   for (int i = 0; i < num_threads; i++) {
 181:	83 c4 10             	add    $0x10,%esp
 184:	bb 00 00 00 00       	mov    $0x0,%ebx
 189:	eb 03                	jmp    18e <main+0x68>
 18b:	83 c3 01             	add    $0x1,%ebx
 18e:	39 1d b8 0f 00 00    	cmp    %ebx,0xfb8
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
 1b4:	68 10 0b 00 00       	push   $0xb10
 1b9:	68 1a 0b 00 00       	push   $0xb1a
 1be:	6a 01                	push   $0x1
 1c0:	e8 9d 06 00 00       	call   862 <printf>
 1c5:	83 c4 0c             	add    $0xc,%esp
 1c8:	68 61 0b 00 00       	push   $0xb61
 1cd:	68 40 0b 00 00       	push   $0xb40
 1d2:	6a 01                	push   $0x1
 1d4:	e8 89 06 00 00       	call   862 <printf>
 1d9:	83 c4 08             	add    $0x8,%esp
 1dc:	68 54 0b 00 00       	push   $0xb54
 1e1:	6a 01                	push   $0x1
 1e3:	e8 7a 06 00 00       	call   862 <printf>
 1e8:	83 c4 04             	add    $0x4,%esp
 1eb:	ff 35 d0 0f 00 00    	push   0xfd0
 1f1:	e8 47 05 00 00       	call   73d <kill>
 1f6:	e8 12 05 00 00       	call   70d <exit>
   size = (unsigned int)sbrk(0);
 1fb:	83 ec 0c             	sub    $0xc,%esp
 1fe:	6a 00                	push   $0x0
 200:	e8 90 05 00 00       	call   795 <sbrk>
 205:	a3 c8 0f 00 00       	mov    %eax,0xfc8
   while (global < num_threads) {
 20a:	83 c4 10             	add    $0x10,%esp
 20d:	a1 b8 0f 00 00       	mov    0xfb8,%eax
 212:	39 05 cc 0f 00 00    	cmp    %eax,0xfcc
 218:	7d 2a                	jge    244 <main+0x11e>
      lock_release(&lock);
 21a:	83 ec 0c             	sub    $0xc,%esp
 21d:	68 c4 0f 00 00       	push   $0xfc4
 222:	e8 2b 03 00 00       	call   552 <lock_release>
      sleep(100);
 227:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 22e:	e8 6a 05 00 00       	call   79d <sleep>
      lock_acquire(&lock);
 233:	c7 04 24 c4 0f 00 00 	movl   $0xfc4,(%esp)
 23a:	e8 f1 02 00 00       	call   530 <lock_acquire>
 23f:	83 c4 10             	add    $0x10,%esp
 242:	eb c9                	jmp    20d <main+0xe7>
   global = 0;
 244:	c7 05 cc 0f 00 00 00 	movl   $0x0,0xfcc
 24b:	00 00 00 
   sbrk(10000);
 24e:	83 ec 0c             	sub    $0xc,%esp
 251:	68 10 27 00 00       	push   $0x2710
 256:	e8 3a 05 00 00       	call   795 <sbrk>
   size = (unsigned int)sbrk(0);
 25b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 262:	e8 2e 05 00 00       	call   795 <sbrk>
 267:	a3 c8 0f 00 00       	mov    %eax,0xfc8
   lock_release(&lock);
 26c:	c7 04 24 c4 0f 00 00 	movl   $0xfc4,(%esp)
 273:	e8 da 02 00 00       	call   552 <lock_release>
   while (global < num_threads) {
 278:	83 c4 10             	add    $0x10,%esp
 27b:	a1 b8 0f 00 00       	mov    0xfb8,%eax
 280:	39 05 cc 0f 00 00    	cmp    %eax,0xfcc
 286:	7d 2a                	jge    2b2 <main+0x18c>
      lock_release(&lock2);
 288:	83 ec 0c             	sub    $0xc,%esp
 28b:	68 c0 0f 00 00       	push   $0xfc0
 290:	e8 bd 02 00 00       	call   552 <lock_release>
      sleep(100);
 295:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 29c:	e8 fc 04 00 00       	call   79d <sleep>
      lock_acquire(&lock2);
 2a1:	c7 04 24 c0 0f 00 00 	movl   $0xfc0,(%esp)
 2a8:	e8 83 02 00 00       	call   530 <lock_acquire>
 2ad:	83 c4 10             	add    $0x10,%esp
 2b0:	eb c9                	jmp    27b <main+0x155>
   lock_release(&lock2);
 2b2:	83 ec 0c             	sub    $0xc,%esp
 2b5:	68 c0 0f 00 00       	push   $0xfc0
 2ba:	e8 93 02 00 00       	call   552 <lock_release>
   for (int i = 0; i < num_threads; i++) {
 2bf:	83 c4 10             	add    $0x10,%esp
 2c2:	bb 00 00 00 00       	mov    $0x0,%ebx
 2c7:	39 1d b8 0f 00 00    	cmp    %ebx,0xfb8
 2cd:	7e 57                	jle    326 <main+0x200>
      int join_pid = thread_join();
 2cf:	e8 0b 02 00 00       	call   4df <thread_join>
      assert(join_pid > 0);
 2d4:	85 c0                	test   %eax,%eax
 2d6:	7e 05                	jle    2dd <main+0x1b7>
   for (int i = 0; i < num_threads; i++) {
 2d8:	83 c3 01             	add    $0x1,%ebx
 2db:	eb ea                	jmp    2c7 <main+0x1a1>
      assert(join_pid > 0);
 2dd:	6a 41                	push   $0x41
 2df:	68 10 0b 00 00       	push   $0xb10
 2e4:	68 1a 0b 00 00       	push   $0xb1a
 2e9:	6a 01                	push   $0x1
 2eb:	e8 72 05 00 00       	call   862 <printf>
 2f0:	83 c4 0c             	add    $0xc,%esp
 2f3:	68 70 0b 00 00       	push   $0xb70
 2f8:	68 40 0b 00 00       	push   $0xb40
 2fd:	6a 01                	push   $0x1
 2ff:	e8 5e 05 00 00       	call   862 <printf>
 304:	83 c4 08             	add    $0x8,%esp
 307:	68 54 0b 00 00       	push   $0xb54
 30c:	6a 01                	push   $0x1
 30e:	e8 4f 05 00 00       	call   862 <printf>
 313:	83 c4 04             	add    $0x4,%esp
 316:	ff 35 d0 0f 00 00    	push   0xfd0
 31c:	e8 1c 04 00 00       	call   73d <kill>
 321:	e8 e7 03 00 00       	call   70d <exit>
   printf(1, "TEST PASSED\n");
 326:	83 ec 08             	sub    $0x8,%esp
 329:	68 7d 0b 00 00       	push   $0xb7d
 32e:	6a 01                	push   $0x1
 330:	e8 2d 05 00 00       	call   862 <printf>
   exit();
 335:	e8 d3 03 00 00       	call   70d <exit>

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
 358:	68 10 0b 00 00       	push   $0xb10
 35d:	68 1a 0b 00 00       	push   $0xb1a
 362:	6a 01                	push   $0x1
 364:	e8 f9 04 00 00       	call   862 <printf>
 369:	83 c4 0c             	add    $0xc,%esp
 36c:	68 99 0b 00 00       	push   $0xb99
 371:	68 40 0b 00 00       	push   $0xb40
 376:	6a 01                	push   $0x1
 378:	e8 e5 04 00 00       	call   862 <printf>
 37d:	83 c4 08             	add    $0x8,%esp
 380:	68 54 0b 00 00       	push   $0xb54
 385:	6a 01                	push   $0x1
 387:	e8 d6 04 00 00       	call   862 <printf>
 38c:	83 c4 04             	add    $0x4,%esp
 38f:	ff 35 d0 0f 00 00    	push   0xfd0
 395:	e8 a3 03 00 00       	call   73d <kill>
 39a:	e8 6e 03 00 00       	call   70d <exit>
   assert(arg1_int == 11);
 39f:	6a 4c                	push   $0x4c
 3a1:	68 10 0b 00 00       	push   $0xb10
 3a6:	68 1a 0b 00 00       	push   $0xb1a
 3ab:	6a 01                	push   $0x1
 3ad:	e8 b0 04 00 00       	call   862 <printf>
 3b2:	83 c4 0c             	add    $0xc,%esp
 3b5:	68 8a 0b 00 00       	push   $0xb8a
 3ba:	68 40 0b 00 00       	push   $0xb40
 3bf:	6a 01                	push   $0x1
 3c1:	e8 9c 04 00 00       	call   862 <printf>
 3c6:	83 c4 08             	add    $0x8,%esp
 3c9:	68 54 0b 00 00       	push   $0xb54
 3ce:	6a 01                	push   $0x1
 3d0:	e8 8d 04 00 00       	call   862 <printf>
 3d5:	83 c4 04             	add    $0x4,%esp
 3d8:	ff 35 d0 0f 00 00    	push   0xfd0
 3de:	e8 5a 03 00 00       	call   73d <kill>
 3e3:	e8 25 03 00 00       	call   70d <exit>
   lock_acquire(&lock2);
 3e8:	83 ec 0c             	sub    $0xc,%esp
 3eb:	68 c0 0f 00 00       	push   $0xfc0
 3f0:	e8 3b 01 00 00       	call   530 <lock_acquire>
   assert((unsigned int)sbrk(0) == size);
 3f5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 3fc:	e8 94 03 00 00       	call   795 <sbrk>
 401:	83 c4 10             	add    $0x10,%esp
 404:	3b 05 c8 0f 00 00    	cmp    0xfc8,%eax
 40a:	74 49                	je     455 <worker2+0x11b>
 40c:	6a 50                	push   $0x50
 40e:	68 10 0b 00 00       	push   $0xb10
 413:	68 1a 0b 00 00       	push   $0xb1a
 418:	6a 01                	push   $0x1
 41a:	e8 43 04 00 00       	call   862 <printf>
 41f:	83 c4 0c             	add    $0xc,%esp
 422:	68 22 0b 00 00       	push   $0xb22
 427:	68 40 0b 00 00       	push   $0xb40
 42c:	6a 01                	push   $0x1
 42e:	e8 2f 04 00 00       	call   862 <printf>
 433:	83 c4 08             	add    $0x8,%esp
 436:	68 54 0b 00 00       	push   $0xb54
 43b:	6a 01                	push   $0x1
 43d:	e8 20 04 00 00       	call   862 <printf>
 442:	83 c4 04             	add    $0x4,%esp
 445:	ff 35 d0 0f 00 00    	push   0xfd0
 44b:	e8 ed 02 00 00       	call   73d <kill>
 450:	e8 b8 02 00 00       	call   70d <exit>
   global++;
 455:	83 05 cc 0f 00 00 01 	addl   $0x1,0xfcc
   lock_release(&lock2);
 45c:	83 ec 0c             	sub    $0xc,%esp
 45f:	68 c0 0f 00 00       	push   $0xfc0
 464:	e8 e9 00 00 00       	call   552 <lock_release>
   exit();
 469:	e8 9f 02 00 00       	call   70d <exit>

0000046e <test_and_set>:
  int flag;
};

struct thread_ref *threads[64];

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
 482:	53                   	push   %ebx
 483:	83 ec 10             	sub    $0x10,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE*2);
 486:	68 00 20 00 00       	push   $0x2000
 48b:	e8 f8 05 00 00       	call   a88 <malloc>
  if(n_stack == 0){
 490:	83 c4 10             	add    $0x10,%esp
 493:	85 c0                	test   %eax,%eax
 495:	74 41                	je     4d8 <thread_create+0x59>
 497:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  int new_pid = clone(start_routine, arg1, arg2, n_stack);
 499:	50                   	push   %eax
 49a:	ff 75 10             	push   0x10(%ebp)
 49d:	ff 75 0c             	push   0xc(%ebp)
 4a0:	ff 75 08             	push   0x8(%ebp)
 4a3:	e8 05 03 00 00       	call   7ad <clone>

  for(int i=0; i<64; i++){
 4a8:	83 c4 10             	add    $0x10,%esp
 4ab:	ba 00 00 00 00       	mov    $0x0,%edx
 4b0:	eb 03                	jmp    4b5 <thread_create+0x36>
 4b2:	83 c2 01             	add    $0x1,%edx
 4b5:	83 fa 3f             	cmp    $0x3f,%edx
 4b8:	7f 19                	jg     4d3 <thread_create+0x54>
    if(threads[i]->flag==0){
 4ba:	8b 0c 95 e0 0f 00 00 	mov    0xfe0(,%edx,4),%ecx
 4c1:	83 79 08 00          	cmpl   $0x0,0x8(%ecx)
 4c5:	75 eb                	jne    4b2 <thread_create+0x33>
      threads[i]->maddr = n_stack;
 4c7:	89 19                	mov    %ebx,(%ecx)
      threads[i]->pg1addr = n_stack;
 4c9:	8b 14 95 e0 0f 00 00 	mov    0xfe0(,%edx,4),%edx
 4d0:	89 5a 04             	mov    %ebx,0x4(%edx)
      break;
    }
  }

  return new_pid;
}
 4d3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4d6:	c9                   	leave  
 4d7:	c3                   	ret    
    return -1;
 4d8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 4dd:	eb f4                	jmp    4d3 <thread_create+0x54>

000004df <thread_join>:

//TODO: fix
int thread_join() {
 4df:	55                   	push   %ebp
 4e0:	89 e5                	mov    %esp,%ebp
 4e2:	56                   	push   %esi
 4e3:	53                   	push   %ebx
 4e4:	83 ec 1c             	sub    $0x1c,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 4e7:	8d 45 f4             	lea    -0xc(%ebp),%eax
 4ea:	50                   	push   %eax
 4eb:	e8 c5 02 00 00       	call   7b5 <join>
 4f0:	89 c6                	mov    %eax,%esi
  for(int i=0; i<64; i++){
 4f2:	83 c4 10             	add    $0x10,%esp
 4f5:	bb 00 00 00 00       	mov    $0x0,%ebx
 4fa:	eb 03                	jmp    4ff <thread_join+0x20>
 4fc:	83 c3 01             	add    $0x1,%ebx
 4ff:	83 fb 3f             	cmp    $0x3f,%ebx
 502:	7f 23                	jg     527 <thread_join+0x48>
    if((threads[i]->flag==1) && (stk_addr == threads[i]->pg1addr)){
 504:	8b 04 9d e0 0f 00 00 	mov    0xfe0(,%ebx,4),%eax
 50b:	83 78 08 01          	cmpl   $0x1,0x8(%eax)
 50f:	75 eb                	jne    4fc <thread_join+0x1d>
 511:	8b 55 f4             	mov    -0xc(%ebp),%edx
 514:	39 50 04             	cmp    %edx,0x4(%eax)
 517:	75 e3                	jne    4fc <thread_join+0x1d>
      free(stk_addr);
 519:	83 ec 0c             	sub    $0xc,%esp
 51c:	52                   	push   %edx
 51d:	e8 a6 04 00 00       	call   9c8 <free>
 522:	83 c4 10             	add    $0x10,%esp
 525:	eb d5                	jmp    4fc <thread_join+0x1d>
    }
  }
  return pid;
}
 527:	89 f0                	mov    %esi,%eax
 529:	8d 65 f8             	lea    -0x8(%ebp),%esp
 52c:	5b                   	pop    %ebx
 52d:	5e                   	pop    %esi
 52e:	5d                   	pop    %ebp
 52f:	c3                   	ret    

00000530 <lock_acquire>:

void lock_acquire(lock_t *lock){
 530:	55                   	push   %ebp
 531:	89 e5                	mov    %esp,%ebp
 533:	53                   	push   %ebx
 534:	83 ec 04             	sub    $0x4,%esp
 537:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 53a:	83 ec 08             	sub    $0x8,%esp
 53d:	6a 01                	push   $0x1
 53f:	53                   	push   %ebx
 540:	e8 29 ff ff ff       	call   46e <test_and_set>
 545:	83 c4 10             	add    $0x10,%esp
 548:	83 f8 01             	cmp    $0x1,%eax
 54b:	74 ed                	je     53a <lock_acquire+0xa>
    ;
}
 54d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 550:	c9                   	leave  
 551:	c3                   	ret    

00000552 <lock_release>:

void lock_release(lock_t *lock) {
 552:	55                   	push   %ebp
 553:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 555:	8b 45 08             	mov    0x8(%ebp),%eax
 558:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 55e:	5d                   	pop    %ebp
 55f:	c3                   	ret    

00000560 <lock_init>:

void lock_init(lock_t *lock) {
 560:	55                   	push   %ebp
 561:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 563:	8b 45 08             	mov    0x8(%ebp),%eax
 566:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 56c:	5d                   	pop    %ebp
 56d:	c3                   	ret    

0000056e <strcpy>:

char*
strcpy(char *s, const char *t)
{
 56e:	55                   	push   %ebp
 56f:	89 e5                	mov    %esp,%ebp
 571:	56                   	push   %esi
 572:	53                   	push   %ebx
 573:	8b 75 08             	mov    0x8(%ebp),%esi
 576:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 579:	89 f0                	mov    %esi,%eax
 57b:	89 d1                	mov    %edx,%ecx
 57d:	83 c2 01             	add    $0x1,%edx
 580:	89 c3                	mov    %eax,%ebx
 582:	83 c0 01             	add    $0x1,%eax
 585:	0f b6 09             	movzbl (%ecx),%ecx
 588:	88 0b                	mov    %cl,(%ebx)
 58a:	84 c9                	test   %cl,%cl
 58c:	75 ed                	jne    57b <strcpy+0xd>
    ;
  return os;
}
 58e:	89 f0                	mov    %esi,%eax
 590:	5b                   	pop    %ebx
 591:	5e                   	pop    %esi
 592:	5d                   	pop    %ebp
 593:	c3                   	ret    

00000594 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 594:	55                   	push   %ebp
 595:	89 e5                	mov    %esp,%ebp
 597:	8b 4d 08             	mov    0x8(%ebp),%ecx
 59a:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 59d:	eb 06                	jmp    5a5 <strcmp+0x11>
    p++, q++;
 59f:	83 c1 01             	add    $0x1,%ecx
 5a2:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 5a5:	0f b6 01             	movzbl (%ecx),%eax
 5a8:	84 c0                	test   %al,%al
 5aa:	74 04                	je     5b0 <strcmp+0x1c>
 5ac:	3a 02                	cmp    (%edx),%al
 5ae:	74 ef                	je     59f <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 5b0:	0f b6 c0             	movzbl %al,%eax
 5b3:	0f b6 12             	movzbl (%edx),%edx
 5b6:	29 d0                	sub    %edx,%eax
}
 5b8:	5d                   	pop    %ebp
 5b9:	c3                   	ret    

000005ba <strlen>:

uint
strlen(const char *s)
{
 5ba:	55                   	push   %ebp
 5bb:	89 e5                	mov    %esp,%ebp
 5bd:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 5c0:	b8 00 00 00 00       	mov    $0x0,%eax
 5c5:	eb 03                	jmp    5ca <strlen+0x10>
 5c7:	83 c0 01             	add    $0x1,%eax
 5ca:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 5ce:	75 f7                	jne    5c7 <strlen+0xd>
    ;
  return n;
}
 5d0:	5d                   	pop    %ebp
 5d1:	c3                   	ret    

000005d2 <memset>:

void*
memset(void *dst, int c, uint n)
{
 5d2:	55                   	push   %ebp
 5d3:	89 e5                	mov    %esp,%ebp
 5d5:	57                   	push   %edi
 5d6:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 5d9:	89 d7                	mov    %edx,%edi
 5db:	8b 4d 10             	mov    0x10(%ebp),%ecx
 5de:	8b 45 0c             	mov    0xc(%ebp),%eax
 5e1:	fc                   	cld    
 5e2:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 5e4:	89 d0                	mov    %edx,%eax
 5e6:	8b 7d fc             	mov    -0x4(%ebp),%edi
 5e9:	c9                   	leave  
 5ea:	c3                   	ret    

000005eb <strchr>:

char*
strchr(const char *s, char c)
{
 5eb:	55                   	push   %ebp
 5ec:	89 e5                	mov    %esp,%ebp
 5ee:	8b 45 08             	mov    0x8(%ebp),%eax
 5f1:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 5f5:	eb 03                	jmp    5fa <strchr+0xf>
 5f7:	83 c0 01             	add    $0x1,%eax
 5fa:	0f b6 10             	movzbl (%eax),%edx
 5fd:	84 d2                	test   %dl,%dl
 5ff:	74 06                	je     607 <strchr+0x1c>
    if(*s == c)
 601:	38 ca                	cmp    %cl,%dl
 603:	75 f2                	jne    5f7 <strchr+0xc>
 605:	eb 05                	jmp    60c <strchr+0x21>
      return (char*)s;
  return 0;
 607:	b8 00 00 00 00       	mov    $0x0,%eax
}
 60c:	5d                   	pop    %ebp
 60d:	c3                   	ret    

0000060e <gets>:

char*
gets(char *buf, int max)
{
 60e:	55                   	push   %ebp
 60f:	89 e5                	mov    %esp,%ebp
 611:	57                   	push   %edi
 612:	56                   	push   %esi
 613:	53                   	push   %ebx
 614:	83 ec 1c             	sub    $0x1c,%esp
 617:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 61a:	bb 00 00 00 00       	mov    $0x0,%ebx
 61f:	89 de                	mov    %ebx,%esi
 621:	83 c3 01             	add    $0x1,%ebx
 624:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 627:	7d 2e                	jge    657 <gets+0x49>
    cc = read(0, &c, 1);
 629:	83 ec 04             	sub    $0x4,%esp
 62c:	6a 01                	push   $0x1
 62e:	8d 45 e7             	lea    -0x19(%ebp),%eax
 631:	50                   	push   %eax
 632:	6a 00                	push   $0x0
 634:	e8 ec 00 00 00       	call   725 <read>
    if(cc < 1)
 639:	83 c4 10             	add    $0x10,%esp
 63c:	85 c0                	test   %eax,%eax
 63e:	7e 17                	jle    657 <gets+0x49>
      break;
    buf[i++] = c;
 640:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 644:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 647:	3c 0a                	cmp    $0xa,%al
 649:	0f 94 c2             	sete   %dl
 64c:	3c 0d                	cmp    $0xd,%al
 64e:	0f 94 c0             	sete   %al
 651:	08 c2                	or     %al,%dl
 653:	74 ca                	je     61f <gets+0x11>
    buf[i++] = c;
 655:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 657:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 65b:	89 f8                	mov    %edi,%eax
 65d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 660:	5b                   	pop    %ebx
 661:	5e                   	pop    %esi
 662:	5f                   	pop    %edi
 663:	5d                   	pop    %ebp
 664:	c3                   	ret    

00000665 <stat>:

int
stat(const char *n, struct stat *st)
{
 665:	55                   	push   %ebp
 666:	89 e5                	mov    %esp,%ebp
 668:	56                   	push   %esi
 669:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 66a:	83 ec 08             	sub    $0x8,%esp
 66d:	6a 00                	push   $0x0
 66f:	ff 75 08             	push   0x8(%ebp)
 672:	e8 d6 00 00 00       	call   74d <open>
  if(fd < 0)
 677:	83 c4 10             	add    $0x10,%esp
 67a:	85 c0                	test   %eax,%eax
 67c:	78 24                	js     6a2 <stat+0x3d>
 67e:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 680:	83 ec 08             	sub    $0x8,%esp
 683:	ff 75 0c             	push   0xc(%ebp)
 686:	50                   	push   %eax
 687:	e8 d9 00 00 00       	call   765 <fstat>
 68c:	89 c6                	mov    %eax,%esi
  close(fd);
 68e:	89 1c 24             	mov    %ebx,(%esp)
 691:	e8 9f 00 00 00       	call   735 <close>
  return r;
 696:	83 c4 10             	add    $0x10,%esp
}
 699:	89 f0                	mov    %esi,%eax
 69b:	8d 65 f8             	lea    -0x8(%ebp),%esp
 69e:	5b                   	pop    %ebx
 69f:	5e                   	pop    %esi
 6a0:	5d                   	pop    %ebp
 6a1:	c3                   	ret    
    return -1;
 6a2:	be ff ff ff ff       	mov    $0xffffffff,%esi
 6a7:	eb f0                	jmp    699 <stat+0x34>

000006a9 <atoi>:

int
atoi(const char *s)
{
 6a9:	55                   	push   %ebp
 6aa:	89 e5                	mov    %esp,%ebp
 6ac:	53                   	push   %ebx
 6ad:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 6b0:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 6b5:	eb 10                	jmp    6c7 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 6b7:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 6ba:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 6bd:	83 c1 01             	add    $0x1,%ecx
 6c0:	0f be c0             	movsbl %al,%eax
 6c3:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 6c7:	0f b6 01             	movzbl (%ecx),%eax
 6ca:	8d 58 d0             	lea    -0x30(%eax),%ebx
 6cd:	80 fb 09             	cmp    $0x9,%bl
 6d0:	76 e5                	jbe    6b7 <atoi+0xe>
  return n;
}
 6d2:	89 d0                	mov    %edx,%eax
 6d4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 6d7:	c9                   	leave  
 6d8:	c3                   	ret    

000006d9 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 6d9:	55                   	push   %ebp
 6da:	89 e5                	mov    %esp,%ebp
 6dc:	56                   	push   %esi
 6dd:	53                   	push   %ebx
 6de:	8b 75 08             	mov    0x8(%ebp),%esi
 6e1:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 6e4:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 6e7:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 6e9:	eb 0d                	jmp    6f8 <memmove+0x1f>
    *dst++ = *src++;
 6eb:	0f b6 01             	movzbl (%ecx),%eax
 6ee:	88 02                	mov    %al,(%edx)
 6f0:	8d 49 01             	lea    0x1(%ecx),%ecx
 6f3:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 6f6:	89 d8                	mov    %ebx,%eax
 6f8:	8d 58 ff             	lea    -0x1(%eax),%ebx
 6fb:	85 c0                	test   %eax,%eax
 6fd:	7f ec                	jg     6eb <memmove+0x12>
  return vdst;
}
 6ff:	89 f0                	mov    %esi,%eax
 701:	5b                   	pop    %ebx
 702:	5e                   	pop    %esi
 703:	5d                   	pop    %ebp
 704:	c3                   	ret    

00000705 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 705:	b8 01 00 00 00       	mov    $0x1,%eax
 70a:	cd 40                	int    $0x40
 70c:	c3                   	ret    

0000070d <exit>:
SYSCALL(exit)
 70d:	b8 02 00 00 00       	mov    $0x2,%eax
 712:	cd 40                	int    $0x40
 714:	c3                   	ret    

00000715 <wait>:
SYSCALL(wait)
 715:	b8 03 00 00 00       	mov    $0x3,%eax
 71a:	cd 40                	int    $0x40
 71c:	c3                   	ret    

0000071d <pipe>:
SYSCALL(pipe)
 71d:	b8 04 00 00 00       	mov    $0x4,%eax
 722:	cd 40                	int    $0x40
 724:	c3                   	ret    

00000725 <read>:
SYSCALL(read)
 725:	b8 05 00 00 00       	mov    $0x5,%eax
 72a:	cd 40                	int    $0x40
 72c:	c3                   	ret    

0000072d <write>:
SYSCALL(write)
 72d:	b8 10 00 00 00       	mov    $0x10,%eax
 732:	cd 40                	int    $0x40
 734:	c3                   	ret    

00000735 <close>:
SYSCALL(close)
 735:	b8 15 00 00 00       	mov    $0x15,%eax
 73a:	cd 40                	int    $0x40
 73c:	c3                   	ret    

0000073d <kill>:
SYSCALL(kill)
 73d:	b8 06 00 00 00       	mov    $0x6,%eax
 742:	cd 40                	int    $0x40
 744:	c3                   	ret    

00000745 <exec>:
SYSCALL(exec)
 745:	b8 07 00 00 00       	mov    $0x7,%eax
 74a:	cd 40                	int    $0x40
 74c:	c3                   	ret    

0000074d <open>:
SYSCALL(open)
 74d:	b8 0f 00 00 00       	mov    $0xf,%eax
 752:	cd 40                	int    $0x40
 754:	c3                   	ret    

00000755 <mknod>:
SYSCALL(mknod)
 755:	b8 11 00 00 00       	mov    $0x11,%eax
 75a:	cd 40                	int    $0x40
 75c:	c3                   	ret    

0000075d <unlink>:
SYSCALL(unlink)
 75d:	b8 12 00 00 00       	mov    $0x12,%eax
 762:	cd 40                	int    $0x40
 764:	c3                   	ret    

00000765 <fstat>:
SYSCALL(fstat)
 765:	b8 08 00 00 00       	mov    $0x8,%eax
 76a:	cd 40                	int    $0x40
 76c:	c3                   	ret    

0000076d <link>:
SYSCALL(link)
 76d:	b8 13 00 00 00       	mov    $0x13,%eax
 772:	cd 40                	int    $0x40
 774:	c3                   	ret    

00000775 <mkdir>:
SYSCALL(mkdir)
 775:	b8 14 00 00 00       	mov    $0x14,%eax
 77a:	cd 40                	int    $0x40
 77c:	c3                   	ret    

0000077d <chdir>:
SYSCALL(chdir)
 77d:	b8 09 00 00 00       	mov    $0x9,%eax
 782:	cd 40                	int    $0x40
 784:	c3                   	ret    

00000785 <dup>:
SYSCALL(dup)
 785:	b8 0a 00 00 00       	mov    $0xa,%eax
 78a:	cd 40                	int    $0x40
 78c:	c3                   	ret    

0000078d <getpid>:
SYSCALL(getpid)
 78d:	b8 0b 00 00 00       	mov    $0xb,%eax
 792:	cd 40                	int    $0x40
 794:	c3                   	ret    

00000795 <sbrk>:
SYSCALL(sbrk)
 795:	b8 0c 00 00 00       	mov    $0xc,%eax
 79a:	cd 40                	int    $0x40
 79c:	c3                   	ret    

0000079d <sleep>:
SYSCALL(sleep)
 79d:	b8 0d 00 00 00       	mov    $0xd,%eax
 7a2:	cd 40                	int    $0x40
 7a4:	c3                   	ret    

000007a5 <uptime>:
SYSCALL(uptime)
 7a5:	b8 0e 00 00 00       	mov    $0xe,%eax
 7aa:	cd 40                	int    $0x40
 7ac:	c3                   	ret    

000007ad <clone>:
SYSCALL(clone)
 7ad:	b8 16 00 00 00       	mov    $0x16,%eax
 7b2:	cd 40                	int    $0x40
 7b4:	c3                   	ret    

000007b5 <join>:
 7b5:	b8 17 00 00 00       	mov    $0x17,%eax
 7ba:	cd 40                	int    $0x40
 7bc:	c3                   	ret    

000007bd <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 7bd:	55                   	push   %ebp
 7be:	89 e5                	mov    %esp,%ebp
 7c0:	83 ec 1c             	sub    $0x1c,%esp
 7c3:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 7c6:	6a 01                	push   $0x1
 7c8:	8d 55 f4             	lea    -0xc(%ebp),%edx
 7cb:	52                   	push   %edx
 7cc:	50                   	push   %eax
 7cd:	e8 5b ff ff ff       	call   72d <write>
}
 7d2:	83 c4 10             	add    $0x10,%esp
 7d5:	c9                   	leave  
 7d6:	c3                   	ret    

000007d7 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 7d7:	55                   	push   %ebp
 7d8:	89 e5                	mov    %esp,%ebp
 7da:	57                   	push   %edi
 7db:	56                   	push   %esi
 7dc:	53                   	push   %ebx
 7dd:	83 ec 2c             	sub    $0x2c,%esp
 7e0:	89 45 d0             	mov    %eax,-0x30(%ebp)
 7e3:	89 d0                	mov    %edx,%eax
 7e5:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 7e7:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 7eb:	0f 95 c1             	setne  %cl
 7ee:	c1 ea 1f             	shr    $0x1f,%edx
 7f1:	84 d1                	test   %dl,%cl
 7f3:	74 44                	je     839 <printint+0x62>
    neg = 1;
    x = -xx;
 7f5:	f7 d8                	neg    %eax
 7f7:	89 c1                	mov    %eax,%ecx
    neg = 1;
 7f9:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 800:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 805:	89 c8                	mov    %ecx,%eax
 807:	ba 00 00 00 00       	mov    $0x0,%edx
 80c:	f7 f6                	div    %esi
 80e:	89 df                	mov    %ebx,%edi
 810:	83 c3 01             	add    $0x1,%ebx
 813:	0f b6 92 08 0c 00 00 	movzbl 0xc08(%edx),%edx
 81a:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 81e:	89 ca                	mov    %ecx,%edx
 820:	89 c1                	mov    %eax,%ecx
 822:	39 d6                	cmp    %edx,%esi
 824:	76 df                	jbe    805 <printint+0x2e>
  if(neg)
 826:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 82a:	74 31                	je     85d <printint+0x86>
    buf[i++] = '-';
 82c:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 831:	8d 5f 02             	lea    0x2(%edi),%ebx
 834:	8b 75 d0             	mov    -0x30(%ebp),%esi
 837:	eb 17                	jmp    850 <printint+0x79>
    x = xx;
 839:	89 c1                	mov    %eax,%ecx
  neg = 0;
 83b:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 842:	eb bc                	jmp    800 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 844:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 849:	89 f0                	mov    %esi,%eax
 84b:	e8 6d ff ff ff       	call   7bd <putc>
  while(--i >= 0)
 850:	83 eb 01             	sub    $0x1,%ebx
 853:	79 ef                	jns    844 <printint+0x6d>
}
 855:	83 c4 2c             	add    $0x2c,%esp
 858:	5b                   	pop    %ebx
 859:	5e                   	pop    %esi
 85a:	5f                   	pop    %edi
 85b:	5d                   	pop    %ebp
 85c:	c3                   	ret    
 85d:	8b 75 d0             	mov    -0x30(%ebp),%esi
 860:	eb ee                	jmp    850 <printint+0x79>

00000862 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 862:	55                   	push   %ebp
 863:	89 e5                	mov    %esp,%ebp
 865:	57                   	push   %edi
 866:	56                   	push   %esi
 867:	53                   	push   %ebx
 868:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 86b:	8d 45 10             	lea    0x10(%ebp),%eax
 86e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 871:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 876:	bb 00 00 00 00       	mov    $0x0,%ebx
 87b:	eb 14                	jmp    891 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 87d:	89 fa                	mov    %edi,%edx
 87f:	8b 45 08             	mov    0x8(%ebp),%eax
 882:	e8 36 ff ff ff       	call   7bd <putc>
 887:	eb 05                	jmp    88e <printf+0x2c>
      }
    } else if(state == '%'){
 889:	83 fe 25             	cmp    $0x25,%esi
 88c:	74 25                	je     8b3 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 88e:	83 c3 01             	add    $0x1,%ebx
 891:	8b 45 0c             	mov    0xc(%ebp),%eax
 894:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 898:	84 c0                	test   %al,%al
 89a:	0f 84 20 01 00 00    	je     9c0 <printf+0x15e>
    c = fmt[i] & 0xff;
 8a0:	0f be f8             	movsbl %al,%edi
 8a3:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 8a6:	85 f6                	test   %esi,%esi
 8a8:	75 df                	jne    889 <printf+0x27>
      if(c == '%'){
 8aa:	83 f8 25             	cmp    $0x25,%eax
 8ad:	75 ce                	jne    87d <printf+0x1b>
        state = '%';
 8af:	89 c6                	mov    %eax,%esi
 8b1:	eb db                	jmp    88e <printf+0x2c>
      if(c == 'd'){
 8b3:	83 f8 25             	cmp    $0x25,%eax
 8b6:	0f 84 cf 00 00 00    	je     98b <printf+0x129>
 8bc:	0f 8c dd 00 00 00    	jl     99f <printf+0x13d>
 8c2:	83 f8 78             	cmp    $0x78,%eax
 8c5:	0f 8f d4 00 00 00    	jg     99f <printf+0x13d>
 8cb:	83 f8 63             	cmp    $0x63,%eax
 8ce:	0f 8c cb 00 00 00    	jl     99f <printf+0x13d>
 8d4:	83 e8 63             	sub    $0x63,%eax
 8d7:	83 f8 15             	cmp    $0x15,%eax
 8da:	0f 87 bf 00 00 00    	ja     99f <printf+0x13d>
 8e0:	ff 24 85 b0 0b 00 00 	jmp    *0xbb0(,%eax,4)
        printint(fd, *ap, 10, 1);
 8e7:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 8ea:	8b 17                	mov    (%edi),%edx
 8ec:	83 ec 0c             	sub    $0xc,%esp
 8ef:	6a 01                	push   $0x1
 8f1:	b9 0a 00 00 00       	mov    $0xa,%ecx
 8f6:	8b 45 08             	mov    0x8(%ebp),%eax
 8f9:	e8 d9 fe ff ff       	call   7d7 <printint>
        ap++;
 8fe:	83 c7 04             	add    $0x4,%edi
 901:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 904:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 907:	be 00 00 00 00       	mov    $0x0,%esi
 90c:	eb 80                	jmp    88e <printf+0x2c>
        printint(fd, *ap, 16, 0);
 90e:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 911:	8b 17                	mov    (%edi),%edx
 913:	83 ec 0c             	sub    $0xc,%esp
 916:	6a 00                	push   $0x0
 918:	b9 10 00 00 00       	mov    $0x10,%ecx
 91d:	8b 45 08             	mov    0x8(%ebp),%eax
 920:	e8 b2 fe ff ff       	call   7d7 <printint>
        ap++;
 925:	83 c7 04             	add    $0x4,%edi
 928:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 92b:	83 c4 10             	add    $0x10,%esp
      state = 0;
 92e:	be 00 00 00 00       	mov    $0x0,%esi
 933:	e9 56 ff ff ff       	jmp    88e <printf+0x2c>
        s = (char*)*ap;
 938:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 93b:	8b 30                	mov    (%eax),%esi
        ap++;
 93d:	83 c0 04             	add    $0x4,%eax
 940:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 943:	85 f6                	test   %esi,%esi
 945:	75 15                	jne    95c <printf+0xfa>
          s = "(null)";
 947:	be a8 0b 00 00       	mov    $0xba8,%esi
 94c:	eb 0e                	jmp    95c <printf+0xfa>
          putc(fd, *s);
 94e:	0f be d2             	movsbl %dl,%edx
 951:	8b 45 08             	mov    0x8(%ebp),%eax
 954:	e8 64 fe ff ff       	call   7bd <putc>
          s++;
 959:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 95c:	0f b6 16             	movzbl (%esi),%edx
 95f:	84 d2                	test   %dl,%dl
 961:	75 eb                	jne    94e <printf+0xec>
      state = 0;
 963:	be 00 00 00 00       	mov    $0x0,%esi
 968:	e9 21 ff ff ff       	jmp    88e <printf+0x2c>
        putc(fd, *ap);
 96d:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 970:	0f be 17             	movsbl (%edi),%edx
 973:	8b 45 08             	mov    0x8(%ebp),%eax
 976:	e8 42 fe ff ff       	call   7bd <putc>
        ap++;
 97b:	83 c7 04             	add    $0x4,%edi
 97e:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 981:	be 00 00 00 00       	mov    $0x0,%esi
 986:	e9 03 ff ff ff       	jmp    88e <printf+0x2c>
        putc(fd, c);
 98b:	89 fa                	mov    %edi,%edx
 98d:	8b 45 08             	mov    0x8(%ebp),%eax
 990:	e8 28 fe ff ff       	call   7bd <putc>
      state = 0;
 995:	be 00 00 00 00       	mov    $0x0,%esi
 99a:	e9 ef fe ff ff       	jmp    88e <printf+0x2c>
        putc(fd, '%');
 99f:	ba 25 00 00 00       	mov    $0x25,%edx
 9a4:	8b 45 08             	mov    0x8(%ebp),%eax
 9a7:	e8 11 fe ff ff       	call   7bd <putc>
        putc(fd, c);
 9ac:	89 fa                	mov    %edi,%edx
 9ae:	8b 45 08             	mov    0x8(%ebp),%eax
 9b1:	e8 07 fe ff ff       	call   7bd <putc>
      state = 0;
 9b6:	be 00 00 00 00       	mov    $0x0,%esi
 9bb:	e9 ce fe ff ff       	jmp    88e <printf+0x2c>
    }
  }
}
 9c0:	8d 65 f4             	lea    -0xc(%ebp),%esp
 9c3:	5b                   	pop    %ebx
 9c4:	5e                   	pop    %esi
 9c5:	5f                   	pop    %edi
 9c6:	5d                   	pop    %ebp
 9c7:	c3                   	ret    

000009c8 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 9c8:	55                   	push   %ebp
 9c9:	89 e5                	mov    %esp,%ebp
 9cb:	57                   	push   %edi
 9cc:	56                   	push   %esi
 9cd:	53                   	push   %ebx
 9ce:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 9d1:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9d4:	a1 e0 10 00 00       	mov    0x10e0,%eax
 9d9:	eb 02                	jmp    9dd <free+0x15>
 9db:	89 d0                	mov    %edx,%eax
 9dd:	39 c8                	cmp    %ecx,%eax
 9df:	73 04                	jae    9e5 <free+0x1d>
 9e1:	39 08                	cmp    %ecx,(%eax)
 9e3:	77 12                	ja     9f7 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9e5:	8b 10                	mov    (%eax),%edx
 9e7:	39 c2                	cmp    %eax,%edx
 9e9:	77 f0                	ja     9db <free+0x13>
 9eb:	39 c8                	cmp    %ecx,%eax
 9ed:	72 08                	jb     9f7 <free+0x2f>
 9ef:	39 ca                	cmp    %ecx,%edx
 9f1:	77 04                	ja     9f7 <free+0x2f>
 9f3:	89 d0                	mov    %edx,%eax
 9f5:	eb e6                	jmp    9dd <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 9f7:	8b 73 fc             	mov    -0x4(%ebx),%esi
 9fa:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 9fd:	8b 10                	mov    (%eax),%edx
 9ff:	39 d7                	cmp    %edx,%edi
 a01:	74 19                	je     a1c <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 a03:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 a06:	8b 50 04             	mov    0x4(%eax),%edx
 a09:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 a0c:	39 ce                	cmp    %ecx,%esi
 a0e:	74 1b                	je     a2b <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 a10:	89 08                	mov    %ecx,(%eax)
  freep = p;
 a12:	a3 e0 10 00 00       	mov    %eax,0x10e0
}
 a17:	5b                   	pop    %ebx
 a18:	5e                   	pop    %esi
 a19:	5f                   	pop    %edi
 a1a:	5d                   	pop    %ebp
 a1b:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 a1c:	03 72 04             	add    0x4(%edx),%esi
 a1f:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 a22:	8b 10                	mov    (%eax),%edx
 a24:	8b 12                	mov    (%edx),%edx
 a26:	89 53 f8             	mov    %edx,-0x8(%ebx)
 a29:	eb db                	jmp    a06 <free+0x3e>
    p->s.size += bp->s.size;
 a2b:	03 53 fc             	add    -0x4(%ebx),%edx
 a2e:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 a31:	8b 53 f8             	mov    -0x8(%ebx),%edx
 a34:	89 10                	mov    %edx,(%eax)
 a36:	eb da                	jmp    a12 <free+0x4a>

00000a38 <morecore>:

static Header*
morecore(uint nu)
{
 a38:	55                   	push   %ebp
 a39:	89 e5                	mov    %esp,%ebp
 a3b:	53                   	push   %ebx
 a3c:	83 ec 04             	sub    $0x4,%esp
 a3f:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 a41:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 a46:	77 05                	ja     a4d <morecore+0x15>
    nu = 4096;
 a48:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 a4d:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 a54:	83 ec 0c             	sub    $0xc,%esp
 a57:	50                   	push   %eax
 a58:	e8 38 fd ff ff       	call   795 <sbrk>
  if(p == (char*)-1)
 a5d:	83 c4 10             	add    $0x10,%esp
 a60:	83 f8 ff             	cmp    $0xffffffff,%eax
 a63:	74 1c                	je     a81 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 a65:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 a68:	83 c0 08             	add    $0x8,%eax
 a6b:	83 ec 0c             	sub    $0xc,%esp
 a6e:	50                   	push   %eax
 a6f:	e8 54 ff ff ff       	call   9c8 <free>
  return freep;
 a74:	a1 e0 10 00 00       	mov    0x10e0,%eax
 a79:	83 c4 10             	add    $0x10,%esp
}
 a7c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 a7f:	c9                   	leave  
 a80:	c3                   	ret    
    return 0;
 a81:	b8 00 00 00 00       	mov    $0x0,%eax
 a86:	eb f4                	jmp    a7c <morecore+0x44>

00000a88 <malloc>:

void*
malloc(uint nbytes)
{
 a88:	55                   	push   %ebp
 a89:	89 e5                	mov    %esp,%ebp
 a8b:	53                   	push   %ebx
 a8c:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a8f:	8b 45 08             	mov    0x8(%ebp),%eax
 a92:	8d 58 07             	lea    0x7(%eax),%ebx
 a95:	c1 eb 03             	shr    $0x3,%ebx
 a98:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 a9b:	8b 0d e0 10 00 00    	mov    0x10e0,%ecx
 aa1:	85 c9                	test   %ecx,%ecx
 aa3:	74 04                	je     aa9 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 aa5:	8b 01                	mov    (%ecx),%eax
 aa7:	eb 4a                	jmp    af3 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 aa9:	c7 05 e0 10 00 00 e4 	movl   $0x10e4,0x10e0
 ab0:	10 00 00 
 ab3:	c7 05 e4 10 00 00 e4 	movl   $0x10e4,0x10e4
 aba:	10 00 00 
    base.s.size = 0;
 abd:	c7 05 e8 10 00 00 00 	movl   $0x0,0x10e8
 ac4:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 ac7:	b9 e4 10 00 00       	mov    $0x10e4,%ecx
 acc:	eb d7                	jmp    aa5 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 ace:	74 19                	je     ae9 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 ad0:	29 da                	sub    %ebx,%edx
 ad2:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 ad5:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 ad8:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 adb:	89 0d e0 10 00 00    	mov    %ecx,0x10e0
      return (void*)(p + 1);
 ae1:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 ae4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 ae7:	c9                   	leave  
 ae8:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 ae9:	8b 10                	mov    (%eax),%edx
 aeb:	89 11                	mov    %edx,(%ecx)
 aed:	eb ec                	jmp    adb <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 aef:	89 c1                	mov    %eax,%ecx
 af1:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 af3:	8b 50 04             	mov    0x4(%eax),%edx
 af6:	39 da                	cmp    %ebx,%edx
 af8:	73 d4                	jae    ace <malloc+0x46>
    if(p == freep)
 afa:	39 05 e0 10 00 00    	cmp    %eax,0x10e0
 b00:	75 ed                	jne    aef <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 b02:	89 d8                	mov    %ebx,%eax
 b04:	e8 2f ff ff ff       	call   a38 <morecore>
 b09:	85 c0                	test   %eax,%eax
 b0b:	75 e2                	jne    aef <malloc+0x67>
 b0d:	eb d5                	jmp    ae4 <malloc+0x5c>
