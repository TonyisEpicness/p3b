
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
   b:	e8 28 05 00 00       	call   538 <lock_acquire>
   assert((unsigned int)sbrk(0) == size);
  10:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  17:	e8 81 07 00 00       	call   79d <sbrk>
  1c:	83 c4 10             	add    $0x10,%esp
  1f:	3b 05 c8 0f 00 00    	cmp    0xfc8,%eax
  25:	74 49                	je     70 <worker+0x70>
  27:	6a 5b                	push   $0x5b
  29:	68 18 0b 00 00       	push   $0xb18
  2e:	68 22 0b 00 00       	push   $0xb22
  33:	6a 01                	push   $0x1
  35:	e8 30 08 00 00       	call   86a <printf>
  3a:	83 c4 0c             	add    $0xc,%esp
  3d:	68 2a 0b 00 00       	push   $0xb2a
  42:	68 48 0b 00 00       	push   $0xb48
  47:	6a 01                	push   $0x1
  49:	e8 1c 08 00 00       	call   86a <printf>
  4e:	83 c4 08             	add    $0x8,%esp
  51:	68 5c 0b 00 00       	push   $0xb5c
  56:	6a 01                	push   $0x1
  58:	e8 0d 08 00 00       	call   86a <printf>
  5d:	83 c4 04             	add    $0x4,%esp
  60:	ff 35 d0 0f 00 00    	push   0xfd0
  66:	e8 da 06 00 00       	call   745 <kill>
  6b:	e8 a5 06 00 00       	call   715 <exit>
   global++;
  70:	83 05 cc 0f 00 00 01 	addl   $0x1,0xfcc
   lock_release(&lock);
  77:	83 ec 0c             	sub    $0xc,%esp
  7a:	68 c4 0f 00 00       	push   $0xfc4
  7f:	e8 d6 04 00 00       	call   55a <lock_release>

   


   lock_acquire(&lock2);
  84:	c7 04 24 c0 0f 00 00 	movl   $0xfc0,(%esp)
  8b:	e8 a8 04 00 00       	call   538 <lock_acquire>
   assert((unsigned int)sbrk(0) == size);
  90:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  97:	e8 01 07 00 00       	call   79d <sbrk>
  9c:	83 c4 10             	add    $0x10,%esp
  9f:	3b 05 c8 0f 00 00    	cmp    0xfc8,%eax
  a5:	74 49                	je     f0 <worker+0xf0>
  a7:	6a 63                	push   $0x63
  a9:	68 18 0b 00 00       	push   $0xb18
  ae:	68 22 0b 00 00       	push   $0xb22
  b3:	6a 01                	push   $0x1
  b5:	e8 b0 07 00 00       	call   86a <printf>
  ba:	83 c4 0c             	add    $0xc,%esp
  bd:	68 2a 0b 00 00       	push   $0xb2a
  c2:	68 48 0b 00 00       	push   $0xb48
  c7:	6a 01                	push   $0x1
  c9:	e8 9c 07 00 00       	call   86a <printf>
  ce:	83 c4 08             	add    $0x8,%esp
  d1:	68 5c 0b 00 00       	push   $0xb5c
  d6:	6a 01                	push   $0x1
  d8:	e8 8d 07 00 00       	call   86a <printf>
  dd:	83 c4 04             	add    $0x4,%esp
  e0:	ff 35 d0 0f 00 00    	push   0xfd0
  e6:	e8 5a 06 00 00       	call   745 <kill>
  eb:	e8 25 06 00 00       	call   715 <exit>
   global++;
  f0:	83 05 cc 0f 00 00 01 	addl   $0x1,0xfcc
   sbrk(10000);
  f7:	83 ec 0c             	sub    $0xc,%esp
  fa:	68 10 27 00 00       	push   $0x2710
  ff:	e8 99 06 00 00       	call   79d <sbrk>
   size = (unsigned int)sbrk(0);
 104:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 10b:	e8 8d 06 00 00       	call   79d <sbrk>
 110:	a3 c8 0f 00 00       	mov    %eax,0xfc8
   lock_release(&lock2);
 115:	c7 04 24 c0 0f 00 00 	movl   $0xfc0,(%esp)
 11c:	e8 39 04 00 00       	call   55a <lock_release>



   exit();
 121:	e8 ef 05 00 00       	call   715 <exit>

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
 138:	e8 58 06 00 00       	call   795 <getpid>
 13d:	a3 d0 0f 00 00       	mov    %eax,0xfd0
   int arg1 = 11, arg2 = 22;
 142:	c7 45 f4 0b 00 00 00 	movl   $0xb,-0xc(%ebp)
 149:	c7 45 f0 16 00 00 00 	movl   $0x16,-0x10(%ebp)
   lock_init(&lock);
 150:	83 ec 0c             	sub    $0xc,%esp
 153:	68 c4 0f 00 00       	push   $0xfc4
 158:	e8 0b 04 00 00       	call   568 <lock_init>
   lock_init(&lock2);
 15d:	c7 04 24 c0 0f 00 00 	movl   $0xfc0,(%esp)
 164:	e8 ff 03 00 00       	call   568 <lock_init>
   lock_acquire(&lock);
 169:	c7 04 24 c4 0f 00 00 	movl   $0xfc4,(%esp)
 170:	e8 c3 03 00 00       	call   538 <lock_acquire>
   lock_acquire(&lock2);
 175:	c7 04 24 c0 0f 00 00 	movl   $0xfc0,(%esp)
 17c:	e8 b7 03 00 00       	call   538 <lock_acquire>
   for (int i = 0; i < num_threads; i++) {
 181:	83 c4 10             	add    $0x10,%esp
 184:	bb 00 00 00 00       	mov    $0x0,%ebx
 189:	eb 03                	jmp    18e <main+0x68>
 18b:	83 c3 01             	add    $0x1,%ebx
 18e:	39 1d bc 0f 00 00    	cmp    %ebx,0xfbc
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
 1b4:	68 18 0b 00 00       	push   $0xb18
 1b9:	68 22 0b 00 00       	push   $0xb22
 1be:	6a 01                	push   $0x1
 1c0:	e8 a5 06 00 00       	call   86a <printf>
 1c5:	83 c4 0c             	add    $0xc,%esp
 1c8:	68 69 0b 00 00       	push   $0xb69
 1cd:	68 48 0b 00 00       	push   $0xb48
 1d2:	6a 01                	push   $0x1
 1d4:	e8 91 06 00 00       	call   86a <printf>
 1d9:	83 c4 08             	add    $0x8,%esp
 1dc:	68 5c 0b 00 00       	push   $0xb5c
 1e1:	6a 01                	push   $0x1
 1e3:	e8 82 06 00 00       	call   86a <printf>
 1e8:	83 c4 04             	add    $0x4,%esp
 1eb:	ff 35 d0 0f 00 00    	push   0xfd0
 1f1:	e8 4f 05 00 00       	call   745 <kill>
 1f6:	e8 1a 05 00 00       	call   715 <exit>
   size = (unsigned int)sbrk(0);
 1fb:	83 ec 0c             	sub    $0xc,%esp
 1fe:	6a 00                	push   $0x0
 200:	e8 98 05 00 00       	call   79d <sbrk>
 205:	a3 c8 0f 00 00       	mov    %eax,0xfc8
   while (global < num_threads) {
 20a:	83 c4 10             	add    $0x10,%esp
 20d:	a1 bc 0f 00 00       	mov    0xfbc,%eax
 212:	39 05 cc 0f 00 00    	cmp    %eax,0xfcc
 218:	7d 2a                	jge    244 <main+0x11e>
      lock_release(&lock);
 21a:	83 ec 0c             	sub    $0xc,%esp
 21d:	68 c4 0f 00 00       	push   $0xfc4
 222:	e8 33 03 00 00       	call   55a <lock_release>
      sleep(100);
 227:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 22e:	e8 72 05 00 00       	call   7a5 <sleep>
      lock_acquire(&lock);
 233:	c7 04 24 c4 0f 00 00 	movl   $0xfc4,(%esp)
 23a:	e8 f9 02 00 00       	call   538 <lock_acquire>
 23f:	83 c4 10             	add    $0x10,%esp
 242:	eb c9                	jmp    20d <main+0xe7>
   global = 0;
 244:	c7 05 cc 0f 00 00 00 	movl   $0x0,0xfcc
 24b:	00 00 00 
   sbrk(10000);
 24e:	83 ec 0c             	sub    $0xc,%esp
 251:	68 10 27 00 00       	push   $0x2710
 256:	e8 42 05 00 00       	call   79d <sbrk>
   size = (unsigned int)sbrk(0);
 25b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 262:	e8 36 05 00 00       	call   79d <sbrk>
 267:	a3 c8 0f 00 00       	mov    %eax,0xfc8
   lock_release(&lock);
 26c:	c7 04 24 c4 0f 00 00 	movl   $0xfc4,(%esp)
 273:	e8 e2 02 00 00       	call   55a <lock_release>
   while (global < num_threads) {
 278:	83 c4 10             	add    $0x10,%esp
 27b:	a1 bc 0f 00 00       	mov    0xfbc,%eax
 280:	39 05 cc 0f 00 00    	cmp    %eax,0xfcc
 286:	7d 2a                	jge    2b2 <main+0x18c>
      lock_release(&lock2);
 288:	83 ec 0c             	sub    $0xc,%esp
 28b:	68 c0 0f 00 00       	push   $0xfc0
 290:	e8 c5 02 00 00       	call   55a <lock_release>
      sleep(100);
 295:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 29c:	e8 04 05 00 00       	call   7a5 <sleep>
      lock_acquire(&lock2);
 2a1:	c7 04 24 c0 0f 00 00 	movl   $0xfc0,(%esp)
 2a8:	e8 8b 02 00 00       	call   538 <lock_acquire>
 2ad:	83 c4 10             	add    $0x10,%esp
 2b0:	eb c9                	jmp    27b <main+0x155>
   lock_release(&lock2);
 2b2:	83 ec 0c             	sub    $0xc,%esp
 2b5:	68 c0 0f 00 00       	push   $0xfc0
 2ba:	e8 9b 02 00 00       	call   55a <lock_release>
   for (int i = 0; i < num_threads; i++) {
 2bf:	83 c4 10             	add    $0x10,%esp
 2c2:	bb 00 00 00 00       	mov    $0x0,%ebx
 2c7:	39 1d bc 0f 00 00    	cmp    %ebx,0xfbc
 2cd:	7e 57                	jle    326 <main+0x200>
      int join_pid = thread_join();
 2cf:	e8 13 02 00 00       	call   4e7 <thread_join>
      assert(join_pid > 0);
 2d4:	85 c0                	test   %eax,%eax
 2d6:	7e 05                	jle    2dd <main+0x1b7>
   for (int i = 0; i < num_threads; i++) {
 2d8:	83 c3 01             	add    $0x1,%ebx
 2db:	eb ea                	jmp    2c7 <main+0x1a1>
      assert(join_pid > 0);
 2dd:	6a 41                	push   $0x41
 2df:	68 18 0b 00 00       	push   $0xb18
 2e4:	68 22 0b 00 00       	push   $0xb22
 2e9:	6a 01                	push   $0x1
 2eb:	e8 7a 05 00 00       	call   86a <printf>
 2f0:	83 c4 0c             	add    $0xc,%esp
 2f3:	68 78 0b 00 00       	push   $0xb78
 2f8:	68 48 0b 00 00       	push   $0xb48
 2fd:	6a 01                	push   $0x1
 2ff:	e8 66 05 00 00       	call   86a <printf>
 304:	83 c4 08             	add    $0x8,%esp
 307:	68 5c 0b 00 00       	push   $0xb5c
 30c:	6a 01                	push   $0x1
 30e:	e8 57 05 00 00       	call   86a <printf>
 313:	83 c4 04             	add    $0x4,%esp
 316:	ff 35 d0 0f 00 00    	push   0xfd0
 31c:	e8 24 04 00 00       	call   745 <kill>
 321:	e8 ef 03 00 00       	call   715 <exit>
   printf(1, "TEST PASSED\n");
 326:	83 ec 08             	sub    $0x8,%esp
 329:	68 85 0b 00 00       	push   $0xb85
 32e:	6a 01                	push   $0x1
 330:	e8 35 05 00 00       	call   86a <printf>
   exit();
 335:	e8 db 03 00 00       	call   715 <exit>

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
 358:	68 18 0b 00 00       	push   $0xb18
 35d:	68 22 0b 00 00       	push   $0xb22
 362:	6a 01                	push   $0x1
 364:	e8 01 05 00 00       	call   86a <printf>
 369:	83 c4 0c             	add    $0xc,%esp
 36c:	68 a1 0b 00 00       	push   $0xba1
 371:	68 48 0b 00 00       	push   $0xb48
 376:	6a 01                	push   $0x1
 378:	e8 ed 04 00 00       	call   86a <printf>
 37d:	83 c4 08             	add    $0x8,%esp
 380:	68 5c 0b 00 00       	push   $0xb5c
 385:	6a 01                	push   $0x1
 387:	e8 de 04 00 00       	call   86a <printf>
 38c:	83 c4 04             	add    $0x4,%esp
 38f:	ff 35 d0 0f 00 00    	push   0xfd0
 395:	e8 ab 03 00 00       	call   745 <kill>
 39a:	e8 76 03 00 00       	call   715 <exit>
   assert(arg1_int == 11);
 39f:	6a 4c                	push   $0x4c
 3a1:	68 18 0b 00 00       	push   $0xb18
 3a6:	68 22 0b 00 00       	push   $0xb22
 3ab:	6a 01                	push   $0x1
 3ad:	e8 b8 04 00 00       	call   86a <printf>
 3b2:	83 c4 0c             	add    $0xc,%esp
 3b5:	68 92 0b 00 00       	push   $0xb92
 3ba:	68 48 0b 00 00       	push   $0xb48
 3bf:	6a 01                	push   $0x1
 3c1:	e8 a4 04 00 00       	call   86a <printf>
 3c6:	83 c4 08             	add    $0x8,%esp
 3c9:	68 5c 0b 00 00       	push   $0xb5c
 3ce:	6a 01                	push   $0x1
 3d0:	e8 95 04 00 00       	call   86a <printf>
 3d5:	83 c4 04             	add    $0x4,%esp
 3d8:	ff 35 d0 0f 00 00    	push   0xfd0
 3de:	e8 62 03 00 00       	call   745 <kill>
 3e3:	e8 2d 03 00 00       	call   715 <exit>
   lock_acquire(&lock2);
 3e8:	83 ec 0c             	sub    $0xc,%esp
 3eb:	68 c0 0f 00 00       	push   $0xfc0
 3f0:	e8 43 01 00 00       	call   538 <lock_acquire>
   assert((unsigned int)sbrk(0) == size);
 3f5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 3fc:	e8 9c 03 00 00       	call   79d <sbrk>
 401:	83 c4 10             	add    $0x10,%esp
 404:	3b 05 c8 0f 00 00    	cmp    0xfc8,%eax
 40a:	74 49                	je     455 <worker2+0x11b>
 40c:	6a 50                	push   $0x50
 40e:	68 18 0b 00 00       	push   $0xb18
 413:	68 22 0b 00 00       	push   $0xb22
 418:	6a 01                	push   $0x1
 41a:	e8 4b 04 00 00       	call   86a <printf>
 41f:	83 c4 0c             	add    $0xc,%esp
 422:	68 2a 0b 00 00       	push   $0xb2a
 427:	68 48 0b 00 00       	push   $0xb48
 42c:	6a 01                	push   $0x1
 42e:	e8 37 04 00 00       	call   86a <printf>
 433:	83 c4 08             	add    $0x8,%esp
 436:	68 5c 0b 00 00       	push   $0xb5c
 43b:	6a 01                	push   $0x1
 43d:	e8 28 04 00 00       	call   86a <printf>
 442:	83 c4 04             	add    $0x4,%esp
 445:	ff 35 d0 0f 00 00    	push   0xfd0
 44b:	e8 f5 02 00 00       	call   745 <kill>
 450:	e8 c0 02 00 00       	call   715 <exit>
   global++;
 455:	83 05 cc 0f 00 00 01 	addl   $0x1,0xfcc
   lock_release(&lock2);
 45c:	83 ec 0c             	sub    $0xc,%esp
 45f:	68 c0 0f 00 00       	push   $0xfc0
 464:	e8 f1 00 00 00       	call   55a <lock_release>
   exit();
 469:	e8 a7 02 00 00       	call   715 <exit>

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
 482:	83 ec 14             	sub    $0x14,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE*2);
 485:	68 00 20 00 00       	push   $0x2000
 48a:	e8 01 06 00 00       	call   a90 <malloc>
  if(n_stack == 0){
 48f:	83 c4 10             	add    $0x10,%esp
 492:	85 c0                	test   %eax,%eax
 494:	74 4a                	je     4e0 <thread_create+0x61>
    return -1;
  }
  
  for(int i=0; i<64; i++){
 496:	ba 00 00 00 00       	mov    $0x0,%edx
 49b:	eb 03                	jmp    4a0 <thread_create+0x21>
 49d:	83 c2 01             	add    $0x1,%edx
 4a0:	83 fa 3f             	cmp    $0x3f,%edx
 4a3:	7f 27                	jg     4cc <thread_create+0x4d>
    if(threads[i]->flag==0){
 4a5:	8b 0c 95 e0 0f 00 00 	mov    0xfe0(,%edx,4),%ecx
 4ac:	83 79 08 00          	cmpl   $0x0,0x8(%ecx)
 4b0:	75 eb                	jne    49d <thread_create+0x1e>
      threads[i]->maddr = n_stack;
 4b2:	89 01                	mov    %eax,(%ecx)
      threads[i]->pg1addr = n_stack;
 4b4:	8b 0c 95 e0 0f 00 00 	mov    0xfe0(,%edx,4),%ecx
 4bb:	89 41 04             	mov    %eax,0x4(%ecx)
      threads[i]->flag = 1;
 4be:	8b 14 95 e0 0f 00 00 	mov    0xfe0(,%edx,4),%edx
 4c5:	c7 42 08 01 00 00 00 	movl   $0x1,0x8(%edx)
      break;
    }
  }
  
  int new_pid = clone(start_routine, arg1, arg2, n_stack); // TODO: is this the right way to call it?
 4cc:	50                   	push   %eax
 4cd:	ff 75 10             	push   0x10(%ebp)
 4d0:	ff 75 0c             	push   0xc(%ebp)
 4d3:	ff 75 08             	push   0x8(%ebp)
 4d6:	e8 da 02 00 00       	call   7b5 <clone>

  // I can't remember if there was something else to do here but I'm sure I'll find out



  return new_pid;
 4db:	83 c4 10             	add    $0x10,%esp
}
 4de:	c9                   	leave  
 4df:	c3                   	ret    
    return -1;
 4e0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 4e5:	eb f7                	jmp    4de <thread_create+0x5f>

000004e7 <thread_join>:

//TODO: fix
int thread_join() {
 4e7:	55                   	push   %ebp
 4e8:	89 e5                	mov    %esp,%ebp
 4ea:	56                   	push   %esi
 4eb:	53                   	push   %ebx
 4ec:	83 ec 1c             	sub    $0x1c,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 4ef:	8d 45 f4             	lea    -0xc(%ebp),%eax
 4f2:	50                   	push   %eax
 4f3:	e8 c5 02 00 00       	call   7bd <join>
 4f8:	89 c6                	mov    %eax,%esi
  for(int i=0; i<64; i++){
 4fa:	83 c4 10             	add    $0x10,%esp
 4fd:	bb 00 00 00 00       	mov    $0x0,%ebx
 502:	eb 03                	jmp    507 <thread_join+0x20>
 504:	83 c3 01             	add    $0x1,%ebx
 507:	83 fb 3f             	cmp    $0x3f,%ebx
 50a:	7f 23                	jg     52f <thread_join+0x48>
    if((threads[i]->flag==1) && (stk_addr == threads[i]->pg1addr)){
 50c:	8b 04 9d e0 0f 00 00 	mov    0xfe0(,%ebx,4),%eax
 513:	83 78 08 01          	cmpl   $0x1,0x8(%eax)
 517:	75 eb                	jne    504 <thread_join+0x1d>
 519:	8b 55 f4             	mov    -0xc(%ebp),%edx
 51c:	39 50 04             	cmp    %edx,0x4(%eax)
 51f:	75 e3                	jne    504 <thread_join+0x1d>
      free(stk_addr);
 521:	83 ec 0c             	sub    $0xc,%esp
 524:	52                   	push   %edx
 525:	e8 a6 04 00 00       	call   9d0 <free>
 52a:	83 c4 10             	add    $0x10,%esp
 52d:	eb d5                	jmp    504 <thread_join+0x1d>
    }
  }
  return pid;
}
 52f:	89 f0                	mov    %esi,%eax
 531:	8d 65 f8             	lea    -0x8(%ebp),%esp
 534:	5b                   	pop    %ebx
 535:	5e                   	pop    %esi
 536:	5d                   	pop    %ebp
 537:	c3                   	ret    

00000538 <lock_acquire>:

void lock_acquire(lock_t *lock){
 538:	55                   	push   %ebp
 539:	89 e5                	mov    %esp,%ebp
 53b:	53                   	push   %ebx
 53c:	83 ec 04             	sub    $0x4,%esp
 53f:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 542:	83 ec 08             	sub    $0x8,%esp
 545:	6a 01                	push   $0x1
 547:	53                   	push   %ebx
 548:	e8 21 ff ff ff       	call   46e <test_and_set>
 54d:	83 c4 10             	add    $0x10,%esp
 550:	83 f8 01             	cmp    $0x1,%eax
 553:	74 ed                	je     542 <lock_acquire+0xa>
    ;
}
 555:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 558:	c9                   	leave  
 559:	c3                   	ret    

0000055a <lock_release>:

void lock_release(lock_t *lock) {
 55a:	55                   	push   %ebp
 55b:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 55d:	8b 45 08             	mov    0x8(%ebp),%eax
 560:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 566:	5d                   	pop    %ebp
 567:	c3                   	ret    

00000568 <lock_init>:

void lock_init(lock_t *lock) {
 568:	55                   	push   %ebp
 569:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 56b:	8b 45 08             	mov    0x8(%ebp),%eax
 56e:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 574:	5d                   	pop    %ebp
 575:	c3                   	ret    

00000576 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 576:	55                   	push   %ebp
 577:	89 e5                	mov    %esp,%ebp
 579:	56                   	push   %esi
 57a:	53                   	push   %ebx
 57b:	8b 75 08             	mov    0x8(%ebp),%esi
 57e:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 581:	89 f0                	mov    %esi,%eax
 583:	89 d1                	mov    %edx,%ecx
 585:	83 c2 01             	add    $0x1,%edx
 588:	89 c3                	mov    %eax,%ebx
 58a:	83 c0 01             	add    $0x1,%eax
 58d:	0f b6 09             	movzbl (%ecx),%ecx
 590:	88 0b                	mov    %cl,(%ebx)
 592:	84 c9                	test   %cl,%cl
 594:	75 ed                	jne    583 <strcpy+0xd>
    ;
  return os;
}
 596:	89 f0                	mov    %esi,%eax
 598:	5b                   	pop    %ebx
 599:	5e                   	pop    %esi
 59a:	5d                   	pop    %ebp
 59b:	c3                   	ret    

0000059c <strcmp>:

int
strcmp(const char *p, const char *q)
{
 59c:	55                   	push   %ebp
 59d:	89 e5                	mov    %esp,%ebp
 59f:	8b 4d 08             	mov    0x8(%ebp),%ecx
 5a2:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 5a5:	eb 06                	jmp    5ad <strcmp+0x11>
    p++, q++;
 5a7:	83 c1 01             	add    $0x1,%ecx
 5aa:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 5ad:	0f b6 01             	movzbl (%ecx),%eax
 5b0:	84 c0                	test   %al,%al
 5b2:	74 04                	je     5b8 <strcmp+0x1c>
 5b4:	3a 02                	cmp    (%edx),%al
 5b6:	74 ef                	je     5a7 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 5b8:	0f b6 c0             	movzbl %al,%eax
 5bb:	0f b6 12             	movzbl (%edx),%edx
 5be:	29 d0                	sub    %edx,%eax
}
 5c0:	5d                   	pop    %ebp
 5c1:	c3                   	ret    

000005c2 <strlen>:

uint
strlen(const char *s)
{
 5c2:	55                   	push   %ebp
 5c3:	89 e5                	mov    %esp,%ebp
 5c5:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 5c8:	b8 00 00 00 00       	mov    $0x0,%eax
 5cd:	eb 03                	jmp    5d2 <strlen+0x10>
 5cf:	83 c0 01             	add    $0x1,%eax
 5d2:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 5d6:	75 f7                	jne    5cf <strlen+0xd>
    ;
  return n;
}
 5d8:	5d                   	pop    %ebp
 5d9:	c3                   	ret    

000005da <memset>:

void*
memset(void *dst, int c, uint n)
{
 5da:	55                   	push   %ebp
 5db:	89 e5                	mov    %esp,%ebp
 5dd:	57                   	push   %edi
 5de:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 5e1:	89 d7                	mov    %edx,%edi
 5e3:	8b 4d 10             	mov    0x10(%ebp),%ecx
 5e6:	8b 45 0c             	mov    0xc(%ebp),%eax
 5e9:	fc                   	cld    
 5ea:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 5ec:	89 d0                	mov    %edx,%eax
 5ee:	8b 7d fc             	mov    -0x4(%ebp),%edi
 5f1:	c9                   	leave  
 5f2:	c3                   	ret    

000005f3 <strchr>:

char*
strchr(const char *s, char c)
{
 5f3:	55                   	push   %ebp
 5f4:	89 e5                	mov    %esp,%ebp
 5f6:	8b 45 08             	mov    0x8(%ebp),%eax
 5f9:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 5fd:	eb 03                	jmp    602 <strchr+0xf>
 5ff:	83 c0 01             	add    $0x1,%eax
 602:	0f b6 10             	movzbl (%eax),%edx
 605:	84 d2                	test   %dl,%dl
 607:	74 06                	je     60f <strchr+0x1c>
    if(*s == c)
 609:	38 ca                	cmp    %cl,%dl
 60b:	75 f2                	jne    5ff <strchr+0xc>
 60d:	eb 05                	jmp    614 <strchr+0x21>
      return (char*)s;
  return 0;
 60f:	b8 00 00 00 00       	mov    $0x0,%eax
}
 614:	5d                   	pop    %ebp
 615:	c3                   	ret    

00000616 <gets>:

char*
gets(char *buf, int max)
{
 616:	55                   	push   %ebp
 617:	89 e5                	mov    %esp,%ebp
 619:	57                   	push   %edi
 61a:	56                   	push   %esi
 61b:	53                   	push   %ebx
 61c:	83 ec 1c             	sub    $0x1c,%esp
 61f:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 622:	bb 00 00 00 00       	mov    $0x0,%ebx
 627:	89 de                	mov    %ebx,%esi
 629:	83 c3 01             	add    $0x1,%ebx
 62c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 62f:	7d 2e                	jge    65f <gets+0x49>
    cc = read(0, &c, 1);
 631:	83 ec 04             	sub    $0x4,%esp
 634:	6a 01                	push   $0x1
 636:	8d 45 e7             	lea    -0x19(%ebp),%eax
 639:	50                   	push   %eax
 63a:	6a 00                	push   $0x0
 63c:	e8 ec 00 00 00       	call   72d <read>
    if(cc < 1)
 641:	83 c4 10             	add    $0x10,%esp
 644:	85 c0                	test   %eax,%eax
 646:	7e 17                	jle    65f <gets+0x49>
      break;
    buf[i++] = c;
 648:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 64c:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 64f:	3c 0a                	cmp    $0xa,%al
 651:	0f 94 c2             	sete   %dl
 654:	3c 0d                	cmp    $0xd,%al
 656:	0f 94 c0             	sete   %al
 659:	08 c2                	or     %al,%dl
 65b:	74 ca                	je     627 <gets+0x11>
    buf[i++] = c;
 65d:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 65f:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 663:	89 f8                	mov    %edi,%eax
 665:	8d 65 f4             	lea    -0xc(%ebp),%esp
 668:	5b                   	pop    %ebx
 669:	5e                   	pop    %esi
 66a:	5f                   	pop    %edi
 66b:	5d                   	pop    %ebp
 66c:	c3                   	ret    

0000066d <stat>:

int
stat(const char *n, struct stat *st)
{
 66d:	55                   	push   %ebp
 66e:	89 e5                	mov    %esp,%ebp
 670:	56                   	push   %esi
 671:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 672:	83 ec 08             	sub    $0x8,%esp
 675:	6a 00                	push   $0x0
 677:	ff 75 08             	push   0x8(%ebp)
 67a:	e8 d6 00 00 00       	call   755 <open>
  if(fd < 0)
 67f:	83 c4 10             	add    $0x10,%esp
 682:	85 c0                	test   %eax,%eax
 684:	78 24                	js     6aa <stat+0x3d>
 686:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 688:	83 ec 08             	sub    $0x8,%esp
 68b:	ff 75 0c             	push   0xc(%ebp)
 68e:	50                   	push   %eax
 68f:	e8 d9 00 00 00       	call   76d <fstat>
 694:	89 c6                	mov    %eax,%esi
  close(fd);
 696:	89 1c 24             	mov    %ebx,(%esp)
 699:	e8 9f 00 00 00       	call   73d <close>
  return r;
 69e:	83 c4 10             	add    $0x10,%esp
}
 6a1:	89 f0                	mov    %esi,%eax
 6a3:	8d 65 f8             	lea    -0x8(%ebp),%esp
 6a6:	5b                   	pop    %ebx
 6a7:	5e                   	pop    %esi
 6a8:	5d                   	pop    %ebp
 6a9:	c3                   	ret    
    return -1;
 6aa:	be ff ff ff ff       	mov    $0xffffffff,%esi
 6af:	eb f0                	jmp    6a1 <stat+0x34>

000006b1 <atoi>:

int
atoi(const char *s)
{
 6b1:	55                   	push   %ebp
 6b2:	89 e5                	mov    %esp,%ebp
 6b4:	53                   	push   %ebx
 6b5:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 6b8:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 6bd:	eb 10                	jmp    6cf <atoi+0x1e>
    n = n*10 + *s++ - '0';
 6bf:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 6c2:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 6c5:	83 c1 01             	add    $0x1,%ecx
 6c8:	0f be c0             	movsbl %al,%eax
 6cb:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 6cf:	0f b6 01             	movzbl (%ecx),%eax
 6d2:	8d 58 d0             	lea    -0x30(%eax),%ebx
 6d5:	80 fb 09             	cmp    $0x9,%bl
 6d8:	76 e5                	jbe    6bf <atoi+0xe>
  return n;
}
 6da:	89 d0                	mov    %edx,%eax
 6dc:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 6df:	c9                   	leave  
 6e0:	c3                   	ret    

000006e1 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 6e1:	55                   	push   %ebp
 6e2:	89 e5                	mov    %esp,%ebp
 6e4:	56                   	push   %esi
 6e5:	53                   	push   %ebx
 6e6:	8b 75 08             	mov    0x8(%ebp),%esi
 6e9:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 6ec:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 6ef:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 6f1:	eb 0d                	jmp    700 <memmove+0x1f>
    *dst++ = *src++;
 6f3:	0f b6 01             	movzbl (%ecx),%eax
 6f6:	88 02                	mov    %al,(%edx)
 6f8:	8d 49 01             	lea    0x1(%ecx),%ecx
 6fb:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 6fe:	89 d8                	mov    %ebx,%eax
 700:	8d 58 ff             	lea    -0x1(%eax),%ebx
 703:	85 c0                	test   %eax,%eax
 705:	7f ec                	jg     6f3 <memmove+0x12>
  return vdst;
}
 707:	89 f0                	mov    %esi,%eax
 709:	5b                   	pop    %ebx
 70a:	5e                   	pop    %esi
 70b:	5d                   	pop    %ebp
 70c:	c3                   	ret    

0000070d <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 70d:	b8 01 00 00 00       	mov    $0x1,%eax
 712:	cd 40                	int    $0x40
 714:	c3                   	ret    

00000715 <exit>:
SYSCALL(exit)
 715:	b8 02 00 00 00       	mov    $0x2,%eax
 71a:	cd 40                	int    $0x40
 71c:	c3                   	ret    

0000071d <wait>:
SYSCALL(wait)
 71d:	b8 03 00 00 00       	mov    $0x3,%eax
 722:	cd 40                	int    $0x40
 724:	c3                   	ret    

00000725 <pipe>:
SYSCALL(pipe)
 725:	b8 04 00 00 00       	mov    $0x4,%eax
 72a:	cd 40                	int    $0x40
 72c:	c3                   	ret    

0000072d <read>:
SYSCALL(read)
 72d:	b8 05 00 00 00       	mov    $0x5,%eax
 732:	cd 40                	int    $0x40
 734:	c3                   	ret    

00000735 <write>:
SYSCALL(write)
 735:	b8 10 00 00 00       	mov    $0x10,%eax
 73a:	cd 40                	int    $0x40
 73c:	c3                   	ret    

0000073d <close>:
SYSCALL(close)
 73d:	b8 15 00 00 00       	mov    $0x15,%eax
 742:	cd 40                	int    $0x40
 744:	c3                   	ret    

00000745 <kill>:
SYSCALL(kill)
 745:	b8 06 00 00 00       	mov    $0x6,%eax
 74a:	cd 40                	int    $0x40
 74c:	c3                   	ret    

0000074d <exec>:
SYSCALL(exec)
 74d:	b8 07 00 00 00       	mov    $0x7,%eax
 752:	cd 40                	int    $0x40
 754:	c3                   	ret    

00000755 <open>:
SYSCALL(open)
 755:	b8 0f 00 00 00       	mov    $0xf,%eax
 75a:	cd 40                	int    $0x40
 75c:	c3                   	ret    

0000075d <mknod>:
SYSCALL(mknod)
 75d:	b8 11 00 00 00       	mov    $0x11,%eax
 762:	cd 40                	int    $0x40
 764:	c3                   	ret    

00000765 <unlink>:
SYSCALL(unlink)
 765:	b8 12 00 00 00       	mov    $0x12,%eax
 76a:	cd 40                	int    $0x40
 76c:	c3                   	ret    

0000076d <fstat>:
SYSCALL(fstat)
 76d:	b8 08 00 00 00       	mov    $0x8,%eax
 772:	cd 40                	int    $0x40
 774:	c3                   	ret    

00000775 <link>:
SYSCALL(link)
 775:	b8 13 00 00 00       	mov    $0x13,%eax
 77a:	cd 40                	int    $0x40
 77c:	c3                   	ret    

0000077d <mkdir>:
SYSCALL(mkdir)
 77d:	b8 14 00 00 00       	mov    $0x14,%eax
 782:	cd 40                	int    $0x40
 784:	c3                   	ret    

00000785 <chdir>:
SYSCALL(chdir)
 785:	b8 09 00 00 00       	mov    $0x9,%eax
 78a:	cd 40                	int    $0x40
 78c:	c3                   	ret    

0000078d <dup>:
SYSCALL(dup)
 78d:	b8 0a 00 00 00       	mov    $0xa,%eax
 792:	cd 40                	int    $0x40
 794:	c3                   	ret    

00000795 <getpid>:
SYSCALL(getpid)
 795:	b8 0b 00 00 00       	mov    $0xb,%eax
 79a:	cd 40                	int    $0x40
 79c:	c3                   	ret    

0000079d <sbrk>:
SYSCALL(sbrk)
 79d:	b8 0c 00 00 00       	mov    $0xc,%eax
 7a2:	cd 40                	int    $0x40
 7a4:	c3                   	ret    

000007a5 <sleep>:
SYSCALL(sleep)
 7a5:	b8 0d 00 00 00       	mov    $0xd,%eax
 7aa:	cd 40                	int    $0x40
 7ac:	c3                   	ret    

000007ad <uptime>:
SYSCALL(uptime)
 7ad:	b8 0e 00 00 00       	mov    $0xe,%eax
 7b2:	cd 40                	int    $0x40
 7b4:	c3                   	ret    

000007b5 <clone>:
SYSCALL(clone)
 7b5:	b8 16 00 00 00       	mov    $0x16,%eax
 7ba:	cd 40                	int    $0x40
 7bc:	c3                   	ret    

000007bd <join>:
 7bd:	b8 17 00 00 00       	mov    $0x17,%eax
 7c2:	cd 40                	int    $0x40
 7c4:	c3                   	ret    

000007c5 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 7c5:	55                   	push   %ebp
 7c6:	89 e5                	mov    %esp,%ebp
 7c8:	83 ec 1c             	sub    $0x1c,%esp
 7cb:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 7ce:	6a 01                	push   $0x1
 7d0:	8d 55 f4             	lea    -0xc(%ebp),%edx
 7d3:	52                   	push   %edx
 7d4:	50                   	push   %eax
 7d5:	e8 5b ff ff ff       	call   735 <write>
}
 7da:	83 c4 10             	add    $0x10,%esp
 7dd:	c9                   	leave  
 7de:	c3                   	ret    

000007df <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 7df:	55                   	push   %ebp
 7e0:	89 e5                	mov    %esp,%ebp
 7e2:	57                   	push   %edi
 7e3:	56                   	push   %esi
 7e4:	53                   	push   %ebx
 7e5:	83 ec 2c             	sub    $0x2c,%esp
 7e8:	89 45 d0             	mov    %eax,-0x30(%ebp)
 7eb:	89 d0                	mov    %edx,%eax
 7ed:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 7ef:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 7f3:	0f 95 c1             	setne  %cl
 7f6:	c1 ea 1f             	shr    $0x1f,%edx
 7f9:	84 d1                	test   %dl,%cl
 7fb:	74 44                	je     841 <printint+0x62>
    neg = 1;
    x = -xx;
 7fd:	f7 d8                	neg    %eax
 7ff:	89 c1                	mov    %eax,%ecx
    neg = 1;
 801:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 808:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 80d:	89 c8                	mov    %ecx,%eax
 80f:	ba 00 00 00 00       	mov    $0x0,%edx
 814:	f7 f6                	div    %esi
 816:	89 df                	mov    %ebx,%edi
 818:	83 c3 01             	add    $0x1,%ebx
 81b:	0f b6 92 10 0c 00 00 	movzbl 0xc10(%edx),%edx
 822:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 826:	89 ca                	mov    %ecx,%edx
 828:	89 c1                	mov    %eax,%ecx
 82a:	39 d6                	cmp    %edx,%esi
 82c:	76 df                	jbe    80d <printint+0x2e>
  if(neg)
 82e:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 832:	74 31                	je     865 <printint+0x86>
    buf[i++] = '-';
 834:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 839:	8d 5f 02             	lea    0x2(%edi),%ebx
 83c:	8b 75 d0             	mov    -0x30(%ebp),%esi
 83f:	eb 17                	jmp    858 <printint+0x79>
    x = xx;
 841:	89 c1                	mov    %eax,%ecx
  neg = 0;
 843:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 84a:	eb bc                	jmp    808 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 84c:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 851:	89 f0                	mov    %esi,%eax
 853:	e8 6d ff ff ff       	call   7c5 <putc>
  while(--i >= 0)
 858:	83 eb 01             	sub    $0x1,%ebx
 85b:	79 ef                	jns    84c <printint+0x6d>
}
 85d:	83 c4 2c             	add    $0x2c,%esp
 860:	5b                   	pop    %ebx
 861:	5e                   	pop    %esi
 862:	5f                   	pop    %edi
 863:	5d                   	pop    %ebp
 864:	c3                   	ret    
 865:	8b 75 d0             	mov    -0x30(%ebp),%esi
 868:	eb ee                	jmp    858 <printint+0x79>

0000086a <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 86a:	55                   	push   %ebp
 86b:	89 e5                	mov    %esp,%ebp
 86d:	57                   	push   %edi
 86e:	56                   	push   %esi
 86f:	53                   	push   %ebx
 870:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 873:	8d 45 10             	lea    0x10(%ebp),%eax
 876:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 879:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 87e:	bb 00 00 00 00       	mov    $0x0,%ebx
 883:	eb 14                	jmp    899 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 885:	89 fa                	mov    %edi,%edx
 887:	8b 45 08             	mov    0x8(%ebp),%eax
 88a:	e8 36 ff ff ff       	call   7c5 <putc>
 88f:	eb 05                	jmp    896 <printf+0x2c>
      }
    } else if(state == '%'){
 891:	83 fe 25             	cmp    $0x25,%esi
 894:	74 25                	je     8bb <printf+0x51>
  for(i = 0; fmt[i]; i++){
 896:	83 c3 01             	add    $0x1,%ebx
 899:	8b 45 0c             	mov    0xc(%ebp),%eax
 89c:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 8a0:	84 c0                	test   %al,%al
 8a2:	0f 84 20 01 00 00    	je     9c8 <printf+0x15e>
    c = fmt[i] & 0xff;
 8a8:	0f be f8             	movsbl %al,%edi
 8ab:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 8ae:	85 f6                	test   %esi,%esi
 8b0:	75 df                	jne    891 <printf+0x27>
      if(c == '%'){
 8b2:	83 f8 25             	cmp    $0x25,%eax
 8b5:	75 ce                	jne    885 <printf+0x1b>
        state = '%';
 8b7:	89 c6                	mov    %eax,%esi
 8b9:	eb db                	jmp    896 <printf+0x2c>
      if(c == 'd'){
 8bb:	83 f8 25             	cmp    $0x25,%eax
 8be:	0f 84 cf 00 00 00    	je     993 <printf+0x129>
 8c4:	0f 8c dd 00 00 00    	jl     9a7 <printf+0x13d>
 8ca:	83 f8 78             	cmp    $0x78,%eax
 8cd:	0f 8f d4 00 00 00    	jg     9a7 <printf+0x13d>
 8d3:	83 f8 63             	cmp    $0x63,%eax
 8d6:	0f 8c cb 00 00 00    	jl     9a7 <printf+0x13d>
 8dc:	83 e8 63             	sub    $0x63,%eax
 8df:	83 f8 15             	cmp    $0x15,%eax
 8e2:	0f 87 bf 00 00 00    	ja     9a7 <printf+0x13d>
 8e8:	ff 24 85 b8 0b 00 00 	jmp    *0xbb8(,%eax,4)
        printint(fd, *ap, 10, 1);
 8ef:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 8f2:	8b 17                	mov    (%edi),%edx
 8f4:	83 ec 0c             	sub    $0xc,%esp
 8f7:	6a 01                	push   $0x1
 8f9:	b9 0a 00 00 00       	mov    $0xa,%ecx
 8fe:	8b 45 08             	mov    0x8(%ebp),%eax
 901:	e8 d9 fe ff ff       	call   7df <printint>
        ap++;
 906:	83 c7 04             	add    $0x4,%edi
 909:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 90c:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 90f:	be 00 00 00 00       	mov    $0x0,%esi
 914:	eb 80                	jmp    896 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 916:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 919:	8b 17                	mov    (%edi),%edx
 91b:	83 ec 0c             	sub    $0xc,%esp
 91e:	6a 00                	push   $0x0
 920:	b9 10 00 00 00       	mov    $0x10,%ecx
 925:	8b 45 08             	mov    0x8(%ebp),%eax
 928:	e8 b2 fe ff ff       	call   7df <printint>
        ap++;
 92d:	83 c7 04             	add    $0x4,%edi
 930:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 933:	83 c4 10             	add    $0x10,%esp
      state = 0;
 936:	be 00 00 00 00       	mov    $0x0,%esi
 93b:	e9 56 ff ff ff       	jmp    896 <printf+0x2c>
        s = (char*)*ap;
 940:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 943:	8b 30                	mov    (%eax),%esi
        ap++;
 945:	83 c0 04             	add    $0x4,%eax
 948:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 94b:	85 f6                	test   %esi,%esi
 94d:	75 15                	jne    964 <printf+0xfa>
          s = "(null)";
 94f:	be b0 0b 00 00       	mov    $0xbb0,%esi
 954:	eb 0e                	jmp    964 <printf+0xfa>
          putc(fd, *s);
 956:	0f be d2             	movsbl %dl,%edx
 959:	8b 45 08             	mov    0x8(%ebp),%eax
 95c:	e8 64 fe ff ff       	call   7c5 <putc>
          s++;
 961:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 964:	0f b6 16             	movzbl (%esi),%edx
 967:	84 d2                	test   %dl,%dl
 969:	75 eb                	jne    956 <printf+0xec>
      state = 0;
 96b:	be 00 00 00 00       	mov    $0x0,%esi
 970:	e9 21 ff ff ff       	jmp    896 <printf+0x2c>
        putc(fd, *ap);
 975:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 978:	0f be 17             	movsbl (%edi),%edx
 97b:	8b 45 08             	mov    0x8(%ebp),%eax
 97e:	e8 42 fe ff ff       	call   7c5 <putc>
        ap++;
 983:	83 c7 04             	add    $0x4,%edi
 986:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 989:	be 00 00 00 00       	mov    $0x0,%esi
 98e:	e9 03 ff ff ff       	jmp    896 <printf+0x2c>
        putc(fd, c);
 993:	89 fa                	mov    %edi,%edx
 995:	8b 45 08             	mov    0x8(%ebp),%eax
 998:	e8 28 fe ff ff       	call   7c5 <putc>
      state = 0;
 99d:	be 00 00 00 00       	mov    $0x0,%esi
 9a2:	e9 ef fe ff ff       	jmp    896 <printf+0x2c>
        putc(fd, '%');
 9a7:	ba 25 00 00 00       	mov    $0x25,%edx
 9ac:	8b 45 08             	mov    0x8(%ebp),%eax
 9af:	e8 11 fe ff ff       	call   7c5 <putc>
        putc(fd, c);
 9b4:	89 fa                	mov    %edi,%edx
 9b6:	8b 45 08             	mov    0x8(%ebp),%eax
 9b9:	e8 07 fe ff ff       	call   7c5 <putc>
      state = 0;
 9be:	be 00 00 00 00       	mov    $0x0,%esi
 9c3:	e9 ce fe ff ff       	jmp    896 <printf+0x2c>
    }
  }
}
 9c8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 9cb:	5b                   	pop    %ebx
 9cc:	5e                   	pop    %esi
 9cd:	5f                   	pop    %edi
 9ce:	5d                   	pop    %ebp
 9cf:	c3                   	ret    

000009d0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 9d0:	55                   	push   %ebp
 9d1:	89 e5                	mov    %esp,%ebp
 9d3:	57                   	push   %edi
 9d4:	56                   	push   %esi
 9d5:	53                   	push   %ebx
 9d6:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 9d9:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9dc:	a1 e0 10 00 00       	mov    0x10e0,%eax
 9e1:	eb 02                	jmp    9e5 <free+0x15>
 9e3:	89 d0                	mov    %edx,%eax
 9e5:	39 c8                	cmp    %ecx,%eax
 9e7:	73 04                	jae    9ed <free+0x1d>
 9e9:	39 08                	cmp    %ecx,(%eax)
 9eb:	77 12                	ja     9ff <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9ed:	8b 10                	mov    (%eax),%edx
 9ef:	39 c2                	cmp    %eax,%edx
 9f1:	77 f0                	ja     9e3 <free+0x13>
 9f3:	39 c8                	cmp    %ecx,%eax
 9f5:	72 08                	jb     9ff <free+0x2f>
 9f7:	39 ca                	cmp    %ecx,%edx
 9f9:	77 04                	ja     9ff <free+0x2f>
 9fb:	89 d0                	mov    %edx,%eax
 9fd:	eb e6                	jmp    9e5 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 9ff:	8b 73 fc             	mov    -0x4(%ebx),%esi
 a02:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 a05:	8b 10                	mov    (%eax),%edx
 a07:	39 d7                	cmp    %edx,%edi
 a09:	74 19                	je     a24 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 a0b:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 a0e:	8b 50 04             	mov    0x4(%eax),%edx
 a11:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 a14:	39 ce                	cmp    %ecx,%esi
 a16:	74 1b                	je     a33 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 a18:	89 08                	mov    %ecx,(%eax)
  freep = p;
 a1a:	a3 e0 10 00 00       	mov    %eax,0x10e0
}
 a1f:	5b                   	pop    %ebx
 a20:	5e                   	pop    %esi
 a21:	5f                   	pop    %edi
 a22:	5d                   	pop    %ebp
 a23:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 a24:	03 72 04             	add    0x4(%edx),%esi
 a27:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 a2a:	8b 10                	mov    (%eax),%edx
 a2c:	8b 12                	mov    (%edx),%edx
 a2e:	89 53 f8             	mov    %edx,-0x8(%ebx)
 a31:	eb db                	jmp    a0e <free+0x3e>
    p->s.size += bp->s.size;
 a33:	03 53 fc             	add    -0x4(%ebx),%edx
 a36:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 a39:	8b 53 f8             	mov    -0x8(%ebx),%edx
 a3c:	89 10                	mov    %edx,(%eax)
 a3e:	eb da                	jmp    a1a <free+0x4a>

00000a40 <morecore>:

static Header*
morecore(uint nu)
{
 a40:	55                   	push   %ebp
 a41:	89 e5                	mov    %esp,%ebp
 a43:	53                   	push   %ebx
 a44:	83 ec 04             	sub    $0x4,%esp
 a47:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 a49:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 a4e:	77 05                	ja     a55 <morecore+0x15>
    nu = 4096;
 a50:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 a55:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 a5c:	83 ec 0c             	sub    $0xc,%esp
 a5f:	50                   	push   %eax
 a60:	e8 38 fd ff ff       	call   79d <sbrk>
  if(p == (char*)-1)
 a65:	83 c4 10             	add    $0x10,%esp
 a68:	83 f8 ff             	cmp    $0xffffffff,%eax
 a6b:	74 1c                	je     a89 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 a6d:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 a70:	83 c0 08             	add    $0x8,%eax
 a73:	83 ec 0c             	sub    $0xc,%esp
 a76:	50                   	push   %eax
 a77:	e8 54 ff ff ff       	call   9d0 <free>
  return freep;
 a7c:	a1 e0 10 00 00       	mov    0x10e0,%eax
 a81:	83 c4 10             	add    $0x10,%esp
}
 a84:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 a87:	c9                   	leave  
 a88:	c3                   	ret    
    return 0;
 a89:	b8 00 00 00 00       	mov    $0x0,%eax
 a8e:	eb f4                	jmp    a84 <morecore+0x44>

00000a90 <malloc>:

void*
malloc(uint nbytes)
{
 a90:	55                   	push   %ebp
 a91:	89 e5                	mov    %esp,%ebp
 a93:	53                   	push   %ebx
 a94:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a97:	8b 45 08             	mov    0x8(%ebp),%eax
 a9a:	8d 58 07             	lea    0x7(%eax),%ebx
 a9d:	c1 eb 03             	shr    $0x3,%ebx
 aa0:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 aa3:	8b 0d e0 10 00 00    	mov    0x10e0,%ecx
 aa9:	85 c9                	test   %ecx,%ecx
 aab:	74 04                	je     ab1 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 aad:	8b 01                	mov    (%ecx),%eax
 aaf:	eb 4a                	jmp    afb <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 ab1:	c7 05 e0 10 00 00 e4 	movl   $0x10e4,0x10e0
 ab8:	10 00 00 
 abb:	c7 05 e4 10 00 00 e4 	movl   $0x10e4,0x10e4
 ac2:	10 00 00 
    base.s.size = 0;
 ac5:	c7 05 e8 10 00 00 00 	movl   $0x0,0x10e8
 acc:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 acf:	b9 e4 10 00 00       	mov    $0x10e4,%ecx
 ad4:	eb d7                	jmp    aad <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 ad6:	74 19                	je     af1 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 ad8:	29 da                	sub    %ebx,%edx
 ada:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 add:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 ae0:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 ae3:	89 0d e0 10 00 00    	mov    %ecx,0x10e0
      return (void*)(p + 1);
 ae9:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 aec:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 aef:	c9                   	leave  
 af0:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 af1:	8b 10                	mov    (%eax),%edx
 af3:	89 11                	mov    %edx,(%ecx)
 af5:	eb ec                	jmp    ae3 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 af7:	89 c1                	mov    %eax,%ecx
 af9:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 afb:	8b 50 04             	mov    0x4(%eax),%edx
 afe:	39 da                	cmp    %ebx,%edx
 b00:	73 d4                	jae    ad6 <malloc+0x46>
    if(p == freep)
 b02:	39 05 e0 10 00 00    	cmp    %eax,0x10e0
 b08:	75 ed                	jne    af7 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 b0a:	89 d8                	mov    %ebx,%eax
 b0c:	e8 2f ff ff ff       	call   a40 <morecore>
 b11:	85 c0                	test   %eax,%eax
 b13:	75 e2                	jne    af7 <malloc+0x67>
 b15:	eb d5                	jmp    aec <malloc+0x5c>
