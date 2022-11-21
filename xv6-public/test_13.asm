
_test_13:     file format elf32-i386


Disassembly of section .text:

00000000 <fib>:
   exit(); \
}

void worker(void *arg1, void *arg2);

unsigned int fib(unsigned int n) {
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	56                   	push   %esi
   4:	53                   	push   %ebx
   5:	8b 5d 08             	mov    0x8(%ebp),%ebx
   if (n == 0) {
   8:	85 db                	test   %ebx,%ebx
   a:	74 05                	je     11 <fib+0x11>
      return 0;
   } else if (n == 1) {
   c:	83 fb 01             	cmp    $0x1,%ebx
   f:	75 09                	jne    1a <fib+0x1a>
      return 1;
   } else {
      return fib(n - 1) + fib(n - 2);
   }
}
  11:	89 d8                	mov    %ebx,%eax
  13:	8d 65 f8             	lea    -0x8(%ebp),%esp
  16:	5b                   	pop    %ebx
  17:	5e                   	pop    %esi
  18:	5d                   	pop    %ebp
  19:	c3                   	ret    
      return fib(n - 1) + fib(n - 2);
  1a:	83 ec 0c             	sub    $0xc,%esp
  1d:	8d 43 ff             	lea    -0x1(%ebx),%eax
  20:	50                   	push   %eax
  21:	e8 da ff ff ff       	call   0 <fib>
  26:	89 c6                	mov    %eax,%esi
  28:	83 eb 02             	sub    $0x2,%ebx
  2b:	89 1c 24             	mov    %ebx,(%esp)
  2e:	e8 cd ff ff ff       	call   0 <fib>
  33:	83 c4 10             	add    $0x10,%esp
  36:	8d 1c 06             	lea    (%esi,%eax,1),%ebx
  39:	eb d6                	jmp    11 <fib+0x11>

0000003b <worker>:
   printf(1, "TEST PASSED\n");
   exit();
}

void
worker(void *arg1, void *arg2) {
  3b:	55                   	push   %ebp
  3c:	89 e5                	mov    %esp,%ebp
  3e:	83 ec 08             	sub    $0x8,%esp
   int tmp1 = *(int*)arg1;
   int tmp2 = *(int*)arg2;
  41:	8b 45 0c             	mov    0xc(%ebp),%eax
  44:	8b 10                	mov    (%eax),%edx
   assert(tmp1 == 11);
  46:	8b 45 08             	mov    0x8(%ebp),%eax
  49:	83 38 0b             	cmpl   $0xb,(%eax)
  4c:	75 5f                	jne    ad <worker+0x72>
   assert(tmp2 == 22);
  4e:	83 fa 16             	cmp    $0x16,%edx
  51:	0f 85 9f 00 00 00    	jne    f6 <worker+0xbb>
   assert(global == 1);
  57:	83 3d b8 0f 00 00 01 	cmpl   $0x1,0xfb8
  5e:	0f 84 db 00 00 00    	je     13f <worker+0x104>
  64:	6a 40                	push   $0x40
  66:	68 d0 0a 00 00       	push   $0xad0
  6b:	68 da 0a 00 00       	push   $0xada
  70:	6a 01                	push   $0x1
  72:	e8 a9 07 00 00       	call   820 <printf>
  77:	83 c4 0c             	add    $0xc,%esp
  7a:	68 19 0b 00 00       	push   $0xb19
  7f:	68 ed 0a 00 00       	push   $0xaed
  84:	6a 01                	push   $0x1
  86:	e8 95 07 00 00       	call   820 <printf>
  8b:	83 c4 08             	add    $0x8,%esp
  8e:	68 01 0b 00 00       	push   $0xb01
  93:	6a 01                	push   $0x1
  95:	e8 86 07 00 00       	call   820 <printf>
  9a:	83 c4 04             	add    $0x4,%esp
  9d:	ff 35 c0 0f 00 00    	push   0xfc0
  a3:	e8 53 06 00 00       	call   6fb <kill>
  a8:	e8 1e 06 00 00       	call   6cb <exit>
   assert(tmp1 == 11);
  ad:	6a 3e                	push   $0x3e
  af:	68 d0 0a 00 00       	push   $0xad0
  b4:	68 da 0a 00 00       	push   $0xada
  b9:	6a 01                	push   $0x1
  bb:	e8 60 07 00 00       	call   820 <printf>
  c0:	83 c4 0c             	add    $0xc,%esp
  c3:	68 e2 0a 00 00       	push   $0xae2
  c8:	68 ed 0a 00 00       	push   $0xaed
  cd:	6a 01                	push   $0x1
  cf:	e8 4c 07 00 00       	call   820 <printf>
  d4:	83 c4 08             	add    $0x8,%esp
  d7:	68 01 0b 00 00       	push   $0xb01
  dc:	6a 01                	push   $0x1
  de:	e8 3d 07 00 00       	call   820 <printf>
  e3:	83 c4 04             	add    $0x4,%esp
  e6:	ff 35 c0 0f 00 00    	push   0xfc0
  ec:	e8 0a 06 00 00       	call   6fb <kill>
  f1:	e8 d5 05 00 00       	call   6cb <exit>
   assert(tmp2 == 22);
  f6:	6a 3f                	push   $0x3f
  f8:	68 d0 0a 00 00       	push   $0xad0
  fd:	68 da 0a 00 00       	push   $0xada
 102:	6a 01                	push   $0x1
 104:	e8 17 07 00 00       	call   820 <printf>
 109:	83 c4 0c             	add    $0xc,%esp
 10c:	68 0e 0b 00 00       	push   $0xb0e
 111:	68 ed 0a 00 00       	push   $0xaed
 116:	6a 01                	push   $0x1
 118:	e8 03 07 00 00       	call   820 <printf>
 11d:	83 c4 08             	add    $0x8,%esp
 120:	68 01 0b 00 00       	push   $0xb01
 125:	6a 01                	push   $0x1
 127:	e8 f4 06 00 00       	call   820 <printf>
 12c:	83 c4 04             	add    $0x4,%esp
 12f:	ff 35 c0 0f 00 00    	push   0xfc0
 135:	e8 c1 05 00 00       	call   6fb <kill>
 13a:	e8 8c 05 00 00       	call   6cb <exit>
   assert(fib(2) == 1);
 13f:	83 ec 0c             	sub    $0xc,%esp
 142:	6a 02                	push   $0x2
 144:	e8 b7 fe ff ff       	call   0 <fib>
 149:	83 c4 10             	add    $0x10,%esp
 14c:	83 f8 01             	cmp    $0x1,%eax
 14f:	74 49                	je     19a <worker+0x15f>
 151:	6a 41                	push   $0x41
 153:	68 d0 0a 00 00       	push   $0xad0
 158:	68 da 0a 00 00       	push   $0xada
 15d:	6a 01                	push   $0x1
 15f:	e8 bc 06 00 00       	call   820 <printf>
 164:	83 c4 0c             	add    $0xc,%esp
 167:	68 25 0b 00 00       	push   $0xb25
 16c:	68 ed 0a 00 00       	push   $0xaed
 171:	6a 01                	push   $0x1
 173:	e8 a8 06 00 00       	call   820 <printf>
 178:	83 c4 08             	add    $0x8,%esp
 17b:	68 01 0b 00 00       	push   $0xb01
 180:	6a 01                	push   $0x1
 182:	e8 99 06 00 00       	call   820 <printf>
 187:	83 c4 04             	add    $0x4,%esp
 18a:	ff 35 c0 0f 00 00    	push   0xfc0
 190:	e8 66 05 00 00       	call   6fb <kill>
 195:	e8 31 05 00 00       	call   6cb <exit>
   assert(fib(3) == 2);
 19a:	83 ec 0c             	sub    $0xc,%esp
 19d:	6a 03                	push   $0x3
 19f:	e8 5c fe ff ff       	call   0 <fib>
 1a4:	83 c4 10             	add    $0x10,%esp
 1a7:	83 f8 02             	cmp    $0x2,%eax
 1aa:	74 49                	je     1f5 <worker+0x1ba>
 1ac:	6a 42                	push   $0x42
 1ae:	68 d0 0a 00 00       	push   $0xad0
 1b3:	68 da 0a 00 00       	push   $0xada
 1b8:	6a 01                	push   $0x1
 1ba:	e8 61 06 00 00       	call   820 <printf>
 1bf:	83 c4 0c             	add    $0xc,%esp
 1c2:	68 31 0b 00 00       	push   $0xb31
 1c7:	68 ed 0a 00 00       	push   $0xaed
 1cc:	6a 01                	push   $0x1
 1ce:	e8 4d 06 00 00       	call   820 <printf>
 1d3:	83 c4 08             	add    $0x8,%esp
 1d6:	68 01 0b 00 00       	push   $0xb01
 1db:	6a 01                	push   $0x1
 1dd:	e8 3e 06 00 00       	call   820 <printf>
 1e2:	83 c4 04             	add    $0x4,%esp
 1e5:	ff 35 c0 0f 00 00    	push   0xfc0
 1eb:	e8 0b 05 00 00       	call   6fb <kill>
 1f0:	e8 d6 04 00 00       	call   6cb <exit>
   assert(fib(9) == 34);
 1f5:	83 ec 0c             	sub    $0xc,%esp
 1f8:	6a 09                	push   $0x9
 1fa:	e8 01 fe ff ff       	call   0 <fib>
 1ff:	83 c4 10             	add    $0x10,%esp
 202:	83 f8 22             	cmp    $0x22,%eax
 205:	74 49                	je     250 <worker+0x215>
 207:	6a 43                	push   $0x43
 209:	68 d0 0a 00 00       	push   $0xad0
 20e:	68 da 0a 00 00       	push   $0xada
 213:	6a 01                	push   $0x1
 215:	e8 06 06 00 00       	call   820 <printf>
 21a:	83 c4 0c             	add    $0xc,%esp
 21d:	68 3d 0b 00 00       	push   $0xb3d
 222:	68 ed 0a 00 00       	push   $0xaed
 227:	6a 01                	push   $0x1
 229:	e8 f2 05 00 00       	call   820 <printf>
 22e:	83 c4 08             	add    $0x8,%esp
 231:	68 01 0b 00 00       	push   $0xb01
 236:	6a 01                	push   $0x1
 238:	e8 e3 05 00 00       	call   820 <printf>
 23d:	83 c4 04             	add    $0x4,%esp
 240:	ff 35 c0 0f 00 00    	push   0xfc0
 246:	e8 b0 04 00 00       	call   6fb <kill>
 24b:	e8 7b 04 00 00       	call   6cb <exit>
   assert(fib(15) == 610);
 250:	83 ec 0c             	sub    $0xc,%esp
 253:	6a 0f                	push   $0xf
 255:	e8 a6 fd ff ff       	call   0 <fib>
 25a:	83 c4 10             	add    $0x10,%esp
 25d:	3d 62 02 00 00       	cmp    $0x262,%eax
 262:	74 49                	je     2ad <worker+0x272>
 264:	6a 44                	push   $0x44
 266:	68 d0 0a 00 00       	push   $0xad0
 26b:	68 da 0a 00 00       	push   $0xada
 270:	6a 01                	push   $0x1
 272:	e8 a9 05 00 00       	call   820 <printf>
 277:	83 c4 0c             	add    $0xc,%esp
 27a:	68 4a 0b 00 00       	push   $0xb4a
 27f:	68 ed 0a 00 00       	push   $0xaed
 284:	6a 01                	push   $0x1
 286:	e8 95 05 00 00       	call   820 <printf>
 28b:	83 c4 08             	add    $0x8,%esp
 28e:	68 01 0b 00 00       	push   $0xb01
 293:	6a 01                	push   $0x1
 295:	e8 86 05 00 00       	call   820 <printf>
 29a:	83 c4 04             	add    $0x4,%esp
 29d:	ff 35 c0 0f 00 00    	push   0xfc0
 2a3:	e8 53 04 00 00       	call   6fb <kill>
 2a8:	e8 1e 04 00 00       	call   6cb <exit>
   exit();
 2ad:	e8 19 04 00 00       	call   6cb <exit>

000002b2 <main>:
{
 2b2:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 2b6:	83 e4 f0             	and    $0xfffffff0,%esp
 2b9:	ff 71 fc             	push   -0x4(%ecx)
 2bc:	55                   	push   %ebp
 2bd:	89 e5                	mov    %esp,%ebp
 2bf:	53                   	push   %ebx
 2c0:	51                   	push   %ecx
 2c1:	83 ec 10             	sub    $0x10,%esp
   ppid = getpid();
 2c4:	e8 82 04 00 00       	call   74b <getpid>
 2c9:	a3 c0 0f 00 00       	mov    %eax,0xfc0
   assert(fib(28) == 317811);
 2ce:	83 ec 0c             	sub    $0xc,%esp
 2d1:	6a 1c                	push   $0x1c
 2d3:	e8 28 fd ff ff       	call   0 <fib>
 2d8:	83 c4 10             	add    $0x10,%esp
 2db:	3d 73 d9 04 00       	cmp    $0x4d973,%eax
 2e0:	75 40                	jne    322 <main+0x70>
   int arg1 = 11, arg2 = 22;
 2e2:	c7 45 f4 0b 00 00 00 	movl   $0xb,-0xc(%ebp)
 2e9:	c7 45 f0 16 00 00 00 	movl   $0x16,-0x10(%ebp)
   for (int i = 0; i < num_threads; i++) {
 2f0:	bb 00 00 00 00       	mov    $0x0,%ebx
 2f5:	39 1d b4 0f 00 00    	cmp    %ebx,0xfb4
 2fb:	0f 8e b3 00 00 00    	jle    3b4 <main+0x102>
      int thread_pid = thread_create(worker, &arg1, &arg2);
 301:	83 ec 04             	sub    $0x4,%esp
 304:	8d 45 f0             	lea    -0x10(%ebp),%eax
 307:	50                   	push   %eax
 308:	8d 45 f4             	lea    -0xc(%ebp),%eax
 30b:	50                   	push   %eax
 30c:	68 3b 00 00 00       	push   $0x3b
 311:	e8 27 01 00 00       	call   43d <thread_create>
      assert(thread_pid > 0);
 316:	83 c4 10             	add    $0x10,%esp
 319:	85 c0                	test   %eax,%eax
 31b:	7e 4e                	jle    36b <main+0xb9>
   for (int i = 0; i < num_threads; i++) {
 31d:	83 c3 01             	add    $0x1,%ebx
 320:	eb d3                	jmp    2f5 <main+0x43>
   assert(fib(28) == 317811);
 322:	6a 28                	push   $0x28
 324:	68 d0 0a 00 00       	push   $0xad0
 329:	68 da 0a 00 00       	push   $0xada
 32e:	6a 01                	push   $0x1
 330:	e8 eb 04 00 00       	call   820 <printf>
 335:	83 c4 0c             	add    $0xc,%esp
 338:	68 59 0b 00 00       	push   $0xb59
 33d:	68 ed 0a 00 00       	push   $0xaed
 342:	6a 01                	push   $0x1
 344:	e8 d7 04 00 00       	call   820 <printf>
 349:	83 c4 08             	add    $0x8,%esp
 34c:	68 01 0b 00 00       	push   $0xb01
 351:	6a 01                	push   $0x1
 353:	e8 c8 04 00 00       	call   820 <printf>
 358:	83 c4 04             	add    $0x4,%esp
 35b:	ff 35 c0 0f 00 00    	push   0xfc0
 361:	e8 95 03 00 00       	call   6fb <kill>
 366:	e8 60 03 00 00       	call   6cb <exit>
      assert(thread_pid > 0);
 36b:	6a 2e                	push   $0x2e
 36d:	68 d0 0a 00 00       	push   $0xad0
 372:	68 da 0a 00 00       	push   $0xada
 377:	6a 01                	push   $0x1
 379:	e8 a2 04 00 00       	call   820 <printf>
 37e:	83 c4 0c             	add    $0xc,%esp
 381:	68 6b 0b 00 00       	push   $0xb6b
 386:	68 ed 0a 00 00       	push   $0xaed
 38b:	6a 01                	push   $0x1
 38d:	e8 8e 04 00 00       	call   820 <printf>
 392:	83 c4 08             	add    $0x8,%esp
 395:	68 01 0b 00 00       	push   $0xb01
 39a:	6a 01                	push   $0x1
 39c:	e8 7f 04 00 00       	call   820 <printf>
 3a1:	83 c4 04             	add    $0x4,%esp
 3a4:	ff 35 c0 0f 00 00    	push   0xfc0
 3aa:	e8 4c 03 00 00       	call   6fb <kill>
 3af:	e8 17 03 00 00       	call   6cb <exit>
   for (int i = 0; i < num_threads; i++) {
 3b4:	bb 00 00 00 00       	mov    $0x0,%ebx
 3b9:	39 1d b4 0f 00 00    	cmp    %ebx,0xfb4
 3bf:	7e 57                	jle    418 <main+0x166>
      int join_pid = thread_join();
 3c1:	e8 d7 00 00 00       	call   49d <thread_join>
      assert(join_pid > 0);
 3c6:	85 c0                	test   %eax,%eax
 3c8:	7e 05                	jle    3cf <main+0x11d>
   for (int i = 0; i < num_threads; i++) {
 3ca:	83 c3 01             	add    $0x1,%ebx
 3cd:	eb ea                	jmp    3b9 <main+0x107>
      assert(join_pid > 0);
 3cf:	6a 33                	push   $0x33
 3d1:	68 d0 0a 00 00       	push   $0xad0
 3d6:	68 da 0a 00 00       	push   $0xada
 3db:	6a 01                	push   $0x1
 3dd:	e8 3e 04 00 00       	call   820 <printf>
 3e2:	83 c4 0c             	add    $0xc,%esp
 3e5:	68 7a 0b 00 00       	push   $0xb7a
 3ea:	68 ed 0a 00 00       	push   $0xaed
 3ef:	6a 01                	push   $0x1
 3f1:	e8 2a 04 00 00       	call   820 <printf>
 3f6:	83 c4 08             	add    $0x8,%esp
 3f9:	68 01 0b 00 00       	push   $0xb01
 3fe:	6a 01                	push   $0x1
 400:	e8 1b 04 00 00       	call   820 <printf>
 405:	83 c4 04             	add    $0x4,%esp
 408:	ff 35 c0 0f 00 00    	push   0xfc0
 40e:	e8 e8 02 00 00       	call   6fb <kill>
 413:	e8 b3 02 00 00       	call   6cb <exit>
   printf(1, "TEST PASSED\n");
 418:	83 ec 08             	sub    $0x8,%esp
 41b:	68 87 0b 00 00       	push   $0xb87
 420:	6a 01                	push   $0x1
 422:	e8 f9 03 00 00       	call   820 <printf>
   exit();
 427:	e8 9f 02 00 00       	call   6cb <exit>

0000042c <test_and_set>:
  int flag;
};

struct thread_ref *threads[64];

int test_and_set(int *old_ptr, int new_ptr) {
 42c:	55                   	push   %ebp
 42d:	89 e5                	mov    %esp,%ebp
 42f:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *old_ptr;
 432:	8b 10                	mov    (%eax),%edx
  *old_ptr = new_ptr;
 434:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 437:	89 08                	mov    %ecx,(%eax)
  return old;
}
 439:	89 d0                	mov    %edx,%eax
 43b:	5d                   	pop    %ebp
 43c:	c3                   	ret    

0000043d <thread_create>:

// a wrapper func for clone
int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 43d:	55                   	push   %ebp
 43e:	89 e5                	mov    %esp,%ebp
 440:	53                   	push   %ebx
 441:	83 ec 10             	sub    $0x10,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE*2);
 444:	68 00 20 00 00       	push   $0x2000
 449:	e8 f8 05 00 00       	call   a46 <malloc>
  if(n_stack == 0){
 44e:	83 c4 10             	add    $0x10,%esp
 451:	85 c0                	test   %eax,%eax
 453:	74 41                	je     496 <thread_create+0x59>
 455:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  int new_pid = clone(start_routine, arg1, arg2, n_stack);
 457:	50                   	push   %eax
 458:	ff 75 10             	push   0x10(%ebp)
 45b:	ff 75 0c             	push   0xc(%ebp)
 45e:	ff 75 08             	push   0x8(%ebp)
 461:	e8 05 03 00 00       	call   76b <clone>

  for(int i=0; i<64; i++){
 466:	83 c4 10             	add    $0x10,%esp
 469:	ba 00 00 00 00       	mov    $0x0,%edx
 46e:	eb 03                	jmp    473 <thread_create+0x36>
 470:	83 c2 01             	add    $0x1,%edx
 473:	83 fa 3f             	cmp    $0x3f,%edx
 476:	7f 19                	jg     491 <thread_create+0x54>
    if(threads[i]->flag==0){
 478:	8b 0c 95 e0 0f 00 00 	mov    0xfe0(,%edx,4),%ecx
 47f:	83 79 08 00          	cmpl   $0x0,0x8(%ecx)
 483:	75 eb                	jne    470 <thread_create+0x33>
      threads[i]->maddr = n_stack;
 485:	89 19                	mov    %ebx,(%ecx)
      threads[i]->pg1addr = n_stack;
 487:	8b 14 95 e0 0f 00 00 	mov    0xfe0(,%edx,4),%edx
 48e:	89 5a 04             	mov    %ebx,0x4(%edx)
      break;
    }
  }

  return new_pid;
}
 491:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 494:	c9                   	leave  
 495:	c3                   	ret    
    return -1;
 496:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 49b:	eb f4                	jmp    491 <thread_create+0x54>

0000049d <thread_join>:

//TODO: fix
int thread_join() {
 49d:	55                   	push   %ebp
 49e:	89 e5                	mov    %esp,%ebp
 4a0:	56                   	push   %esi
 4a1:	53                   	push   %ebx
 4a2:	83 ec 1c             	sub    $0x1c,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 4a5:	8d 45 f4             	lea    -0xc(%ebp),%eax
 4a8:	50                   	push   %eax
 4a9:	e8 c5 02 00 00       	call   773 <join>
 4ae:	89 c6                	mov    %eax,%esi
  for(int i=0; i<64; i++){
 4b0:	83 c4 10             	add    $0x10,%esp
 4b3:	bb 00 00 00 00       	mov    $0x0,%ebx
 4b8:	eb 03                	jmp    4bd <thread_join+0x20>
 4ba:	83 c3 01             	add    $0x1,%ebx
 4bd:	83 fb 3f             	cmp    $0x3f,%ebx
 4c0:	7f 23                	jg     4e5 <thread_join+0x48>
    if((threads[i]->flag==1) && (stk_addr == threads[i]->pg1addr)){
 4c2:	8b 04 9d e0 0f 00 00 	mov    0xfe0(,%ebx,4),%eax
 4c9:	83 78 08 01          	cmpl   $0x1,0x8(%eax)
 4cd:	75 eb                	jne    4ba <thread_join+0x1d>
 4cf:	8b 55 f4             	mov    -0xc(%ebp),%edx
 4d2:	39 50 04             	cmp    %edx,0x4(%eax)
 4d5:	75 e3                	jne    4ba <thread_join+0x1d>
      free(stk_addr);
 4d7:	83 ec 0c             	sub    $0xc,%esp
 4da:	52                   	push   %edx
 4db:	e8 a6 04 00 00       	call   986 <free>
 4e0:	83 c4 10             	add    $0x10,%esp
 4e3:	eb d5                	jmp    4ba <thread_join+0x1d>
    }
  }
  return pid;
}
 4e5:	89 f0                	mov    %esi,%eax
 4e7:	8d 65 f8             	lea    -0x8(%ebp),%esp
 4ea:	5b                   	pop    %ebx
 4eb:	5e                   	pop    %esi
 4ec:	5d                   	pop    %ebp
 4ed:	c3                   	ret    

000004ee <lock_acquire>:

void lock_acquire(lock_t *lock){
 4ee:	55                   	push   %ebp
 4ef:	89 e5                	mov    %esp,%ebp
 4f1:	53                   	push   %ebx
 4f2:	83 ec 04             	sub    $0x4,%esp
 4f5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 4f8:	83 ec 08             	sub    $0x8,%esp
 4fb:	6a 01                	push   $0x1
 4fd:	53                   	push   %ebx
 4fe:	e8 29 ff ff ff       	call   42c <test_and_set>
 503:	83 c4 10             	add    $0x10,%esp
 506:	83 f8 01             	cmp    $0x1,%eax
 509:	74 ed                	je     4f8 <lock_acquire+0xa>
    ;
}
 50b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 50e:	c9                   	leave  
 50f:	c3                   	ret    

00000510 <lock_release>:

void lock_release(lock_t *lock) {
 510:	55                   	push   %ebp
 511:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 513:	8b 45 08             	mov    0x8(%ebp),%eax
 516:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 51c:	5d                   	pop    %ebp
 51d:	c3                   	ret    

0000051e <lock_init>:

void lock_init(lock_t *lock) {
 51e:	55                   	push   %ebp
 51f:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 521:	8b 45 08             	mov    0x8(%ebp),%eax
 524:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 52a:	5d                   	pop    %ebp
 52b:	c3                   	ret    

0000052c <strcpy>:

char*
strcpy(char *s, const char *t)
{
 52c:	55                   	push   %ebp
 52d:	89 e5                	mov    %esp,%ebp
 52f:	56                   	push   %esi
 530:	53                   	push   %ebx
 531:	8b 75 08             	mov    0x8(%ebp),%esi
 534:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 537:	89 f0                	mov    %esi,%eax
 539:	89 d1                	mov    %edx,%ecx
 53b:	83 c2 01             	add    $0x1,%edx
 53e:	89 c3                	mov    %eax,%ebx
 540:	83 c0 01             	add    $0x1,%eax
 543:	0f b6 09             	movzbl (%ecx),%ecx
 546:	88 0b                	mov    %cl,(%ebx)
 548:	84 c9                	test   %cl,%cl
 54a:	75 ed                	jne    539 <strcpy+0xd>
    ;
  return os;
}
 54c:	89 f0                	mov    %esi,%eax
 54e:	5b                   	pop    %ebx
 54f:	5e                   	pop    %esi
 550:	5d                   	pop    %ebp
 551:	c3                   	ret    

00000552 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 552:	55                   	push   %ebp
 553:	89 e5                	mov    %esp,%ebp
 555:	8b 4d 08             	mov    0x8(%ebp),%ecx
 558:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 55b:	eb 06                	jmp    563 <strcmp+0x11>
    p++, q++;
 55d:	83 c1 01             	add    $0x1,%ecx
 560:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 563:	0f b6 01             	movzbl (%ecx),%eax
 566:	84 c0                	test   %al,%al
 568:	74 04                	je     56e <strcmp+0x1c>
 56a:	3a 02                	cmp    (%edx),%al
 56c:	74 ef                	je     55d <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 56e:	0f b6 c0             	movzbl %al,%eax
 571:	0f b6 12             	movzbl (%edx),%edx
 574:	29 d0                	sub    %edx,%eax
}
 576:	5d                   	pop    %ebp
 577:	c3                   	ret    

00000578 <strlen>:

uint
strlen(const char *s)
{
 578:	55                   	push   %ebp
 579:	89 e5                	mov    %esp,%ebp
 57b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 57e:	b8 00 00 00 00       	mov    $0x0,%eax
 583:	eb 03                	jmp    588 <strlen+0x10>
 585:	83 c0 01             	add    $0x1,%eax
 588:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 58c:	75 f7                	jne    585 <strlen+0xd>
    ;
  return n;
}
 58e:	5d                   	pop    %ebp
 58f:	c3                   	ret    

00000590 <memset>:

void*
memset(void *dst, int c, uint n)
{
 590:	55                   	push   %ebp
 591:	89 e5                	mov    %esp,%ebp
 593:	57                   	push   %edi
 594:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 597:	89 d7                	mov    %edx,%edi
 599:	8b 4d 10             	mov    0x10(%ebp),%ecx
 59c:	8b 45 0c             	mov    0xc(%ebp),%eax
 59f:	fc                   	cld    
 5a0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 5a2:	89 d0                	mov    %edx,%eax
 5a4:	8b 7d fc             	mov    -0x4(%ebp),%edi
 5a7:	c9                   	leave  
 5a8:	c3                   	ret    

000005a9 <strchr>:

char*
strchr(const char *s, char c)
{
 5a9:	55                   	push   %ebp
 5aa:	89 e5                	mov    %esp,%ebp
 5ac:	8b 45 08             	mov    0x8(%ebp),%eax
 5af:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 5b3:	eb 03                	jmp    5b8 <strchr+0xf>
 5b5:	83 c0 01             	add    $0x1,%eax
 5b8:	0f b6 10             	movzbl (%eax),%edx
 5bb:	84 d2                	test   %dl,%dl
 5bd:	74 06                	je     5c5 <strchr+0x1c>
    if(*s == c)
 5bf:	38 ca                	cmp    %cl,%dl
 5c1:	75 f2                	jne    5b5 <strchr+0xc>
 5c3:	eb 05                	jmp    5ca <strchr+0x21>
      return (char*)s;
  return 0;
 5c5:	b8 00 00 00 00       	mov    $0x0,%eax
}
 5ca:	5d                   	pop    %ebp
 5cb:	c3                   	ret    

000005cc <gets>:

char*
gets(char *buf, int max)
{
 5cc:	55                   	push   %ebp
 5cd:	89 e5                	mov    %esp,%ebp
 5cf:	57                   	push   %edi
 5d0:	56                   	push   %esi
 5d1:	53                   	push   %ebx
 5d2:	83 ec 1c             	sub    $0x1c,%esp
 5d5:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 5d8:	bb 00 00 00 00       	mov    $0x0,%ebx
 5dd:	89 de                	mov    %ebx,%esi
 5df:	83 c3 01             	add    $0x1,%ebx
 5e2:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 5e5:	7d 2e                	jge    615 <gets+0x49>
    cc = read(0, &c, 1);
 5e7:	83 ec 04             	sub    $0x4,%esp
 5ea:	6a 01                	push   $0x1
 5ec:	8d 45 e7             	lea    -0x19(%ebp),%eax
 5ef:	50                   	push   %eax
 5f0:	6a 00                	push   $0x0
 5f2:	e8 ec 00 00 00       	call   6e3 <read>
    if(cc < 1)
 5f7:	83 c4 10             	add    $0x10,%esp
 5fa:	85 c0                	test   %eax,%eax
 5fc:	7e 17                	jle    615 <gets+0x49>
      break;
    buf[i++] = c;
 5fe:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 602:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 605:	3c 0a                	cmp    $0xa,%al
 607:	0f 94 c2             	sete   %dl
 60a:	3c 0d                	cmp    $0xd,%al
 60c:	0f 94 c0             	sete   %al
 60f:	08 c2                	or     %al,%dl
 611:	74 ca                	je     5dd <gets+0x11>
    buf[i++] = c;
 613:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 615:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 619:	89 f8                	mov    %edi,%eax
 61b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 61e:	5b                   	pop    %ebx
 61f:	5e                   	pop    %esi
 620:	5f                   	pop    %edi
 621:	5d                   	pop    %ebp
 622:	c3                   	ret    

00000623 <stat>:

int
stat(const char *n, struct stat *st)
{
 623:	55                   	push   %ebp
 624:	89 e5                	mov    %esp,%ebp
 626:	56                   	push   %esi
 627:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 628:	83 ec 08             	sub    $0x8,%esp
 62b:	6a 00                	push   $0x0
 62d:	ff 75 08             	push   0x8(%ebp)
 630:	e8 d6 00 00 00       	call   70b <open>
  if(fd < 0)
 635:	83 c4 10             	add    $0x10,%esp
 638:	85 c0                	test   %eax,%eax
 63a:	78 24                	js     660 <stat+0x3d>
 63c:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 63e:	83 ec 08             	sub    $0x8,%esp
 641:	ff 75 0c             	push   0xc(%ebp)
 644:	50                   	push   %eax
 645:	e8 d9 00 00 00       	call   723 <fstat>
 64a:	89 c6                	mov    %eax,%esi
  close(fd);
 64c:	89 1c 24             	mov    %ebx,(%esp)
 64f:	e8 9f 00 00 00       	call   6f3 <close>
  return r;
 654:	83 c4 10             	add    $0x10,%esp
}
 657:	89 f0                	mov    %esi,%eax
 659:	8d 65 f8             	lea    -0x8(%ebp),%esp
 65c:	5b                   	pop    %ebx
 65d:	5e                   	pop    %esi
 65e:	5d                   	pop    %ebp
 65f:	c3                   	ret    
    return -1;
 660:	be ff ff ff ff       	mov    $0xffffffff,%esi
 665:	eb f0                	jmp    657 <stat+0x34>

00000667 <atoi>:

int
atoi(const char *s)
{
 667:	55                   	push   %ebp
 668:	89 e5                	mov    %esp,%ebp
 66a:	53                   	push   %ebx
 66b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 66e:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 673:	eb 10                	jmp    685 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 675:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 678:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 67b:	83 c1 01             	add    $0x1,%ecx
 67e:	0f be c0             	movsbl %al,%eax
 681:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 685:	0f b6 01             	movzbl (%ecx),%eax
 688:	8d 58 d0             	lea    -0x30(%eax),%ebx
 68b:	80 fb 09             	cmp    $0x9,%bl
 68e:	76 e5                	jbe    675 <atoi+0xe>
  return n;
}
 690:	89 d0                	mov    %edx,%eax
 692:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 695:	c9                   	leave  
 696:	c3                   	ret    

00000697 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 697:	55                   	push   %ebp
 698:	89 e5                	mov    %esp,%ebp
 69a:	56                   	push   %esi
 69b:	53                   	push   %ebx
 69c:	8b 75 08             	mov    0x8(%ebp),%esi
 69f:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 6a2:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 6a5:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 6a7:	eb 0d                	jmp    6b6 <memmove+0x1f>
    *dst++ = *src++;
 6a9:	0f b6 01             	movzbl (%ecx),%eax
 6ac:	88 02                	mov    %al,(%edx)
 6ae:	8d 49 01             	lea    0x1(%ecx),%ecx
 6b1:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 6b4:	89 d8                	mov    %ebx,%eax
 6b6:	8d 58 ff             	lea    -0x1(%eax),%ebx
 6b9:	85 c0                	test   %eax,%eax
 6bb:	7f ec                	jg     6a9 <memmove+0x12>
  return vdst;
}
 6bd:	89 f0                	mov    %esi,%eax
 6bf:	5b                   	pop    %ebx
 6c0:	5e                   	pop    %esi
 6c1:	5d                   	pop    %ebp
 6c2:	c3                   	ret    

000006c3 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 6c3:	b8 01 00 00 00       	mov    $0x1,%eax
 6c8:	cd 40                	int    $0x40
 6ca:	c3                   	ret    

000006cb <exit>:
SYSCALL(exit)
 6cb:	b8 02 00 00 00       	mov    $0x2,%eax
 6d0:	cd 40                	int    $0x40
 6d2:	c3                   	ret    

000006d3 <wait>:
SYSCALL(wait)
 6d3:	b8 03 00 00 00       	mov    $0x3,%eax
 6d8:	cd 40                	int    $0x40
 6da:	c3                   	ret    

000006db <pipe>:
SYSCALL(pipe)
 6db:	b8 04 00 00 00       	mov    $0x4,%eax
 6e0:	cd 40                	int    $0x40
 6e2:	c3                   	ret    

000006e3 <read>:
SYSCALL(read)
 6e3:	b8 05 00 00 00       	mov    $0x5,%eax
 6e8:	cd 40                	int    $0x40
 6ea:	c3                   	ret    

000006eb <write>:
SYSCALL(write)
 6eb:	b8 10 00 00 00       	mov    $0x10,%eax
 6f0:	cd 40                	int    $0x40
 6f2:	c3                   	ret    

000006f3 <close>:
SYSCALL(close)
 6f3:	b8 15 00 00 00       	mov    $0x15,%eax
 6f8:	cd 40                	int    $0x40
 6fa:	c3                   	ret    

000006fb <kill>:
SYSCALL(kill)
 6fb:	b8 06 00 00 00       	mov    $0x6,%eax
 700:	cd 40                	int    $0x40
 702:	c3                   	ret    

00000703 <exec>:
SYSCALL(exec)
 703:	b8 07 00 00 00       	mov    $0x7,%eax
 708:	cd 40                	int    $0x40
 70a:	c3                   	ret    

0000070b <open>:
SYSCALL(open)
 70b:	b8 0f 00 00 00       	mov    $0xf,%eax
 710:	cd 40                	int    $0x40
 712:	c3                   	ret    

00000713 <mknod>:
SYSCALL(mknod)
 713:	b8 11 00 00 00       	mov    $0x11,%eax
 718:	cd 40                	int    $0x40
 71a:	c3                   	ret    

0000071b <unlink>:
SYSCALL(unlink)
 71b:	b8 12 00 00 00       	mov    $0x12,%eax
 720:	cd 40                	int    $0x40
 722:	c3                   	ret    

00000723 <fstat>:
SYSCALL(fstat)
 723:	b8 08 00 00 00       	mov    $0x8,%eax
 728:	cd 40                	int    $0x40
 72a:	c3                   	ret    

0000072b <link>:
SYSCALL(link)
 72b:	b8 13 00 00 00       	mov    $0x13,%eax
 730:	cd 40                	int    $0x40
 732:	c3                   	ret    

00000733 <mkdir>:
SYSCALL(mkdir)
 733:	b8 14 00 00 00       	mov    $0x14,%eax
 738:	cd 40                	int    $0x40
 73a:	c3                   	ret    

0000073b <chdir>:
SYSCALL(chdir)
 73b:	b8 09 00 00 00       	mov    $0x9,%eax
 740:	cd 40                	int    $0x40
 742:	c3                   	ret    

00000743 <dup>:
SYSCALL(dup)
 743:	b8 0a 00 00 00       	mov    $0xa,%eax
 748:	cd 40                	int    $0x40
 74a:	c3                   	ret    

0000074b <getpid>:
SYSCALL(getpid)
 74b:	b8 0b 00 00 00       	mov    $0xb,%eax
 750:	cd 40                	int    $0x40
 752:	c3                   	ret    

00000753 <sbrk>:
SYSCALL(sbrk)
 753:	b8 0c 00 00 00       	mov    $0xc,%eax
 758:	cd 40                	int    $0x40
 75a:	c3                   	ret    

0000075b <sleep>:
SYSCALL(sleep)
 75b:	b8 0d 00 00 00       	mov    $0xd,%eax
 760:	cd 40                	int    $0x40
 762:	c3                   	ret    

00000763 <uptime>:
SYSCALL(uptime)
 763:	b8 0e 00 00 00       	mov    $0xe,%eax
 768:	cd 40                	int    $0x40
 76a:	c3                   	ret    

0000076b <clone>:
SYSCALL(clone)
 76b:	b8 16 00 00 00       	mov    $0x16,%eax
 770:	cd 40                	int    $0x40
 772:	c3                   	ret    

00000773 <join>:
 773:	b8 17 00 00 00       	mov    $0x17,%eax
 778:	cd 40                	int    $0x40
 77a:	c3                   	ret    

0000077b <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 77b:	55                   	push   %ebp
 77c:	89 e5                	mov    %esp,%ebp
 77e:	83 ec 1c             	sub    $0x1c,%esp
 781:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 784:	6a 01                	push   $0x1
 786:	8d 55 f4             	lea    -0xc(%ebp),%edx
 789:	52                   	push   %edx
 78a:	50                   	push   %eax
 78b:	e8 5b ff ff ff       	call   6eb <write>
}
 790:	83 c4 10             	add    $0x10,%esp
 793:	c9                   	leave  
 794:	c3                   	ret    

00000795 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 795:	55                   	push   %ebp
 796:	89 e5                	mov    %esp,%ebp
 798:	57                   	push   %edi
 799:	56                   	push   %esi
 79a:	53                   	push   %ebx
 79b:	83 ec 2c             	sub    $0x2c,%esp
 79e:	89 45 d0             	mov    %eax,-0x30(%ebp)
 7a1:	89 d0                	mov    %edx,%eax
 7a3:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 7a5:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 7a9:	0f 95 c1             	setne  %cl
 7ac:	c1 ea 1f             	shr    $0x1f,%edx
 7af:	84 d1                	test   %dl,%cl
 7b1:	74 44                	je     7f7 <printint+0x62>
    neg = 1;
    x = -xx;
 7b3:	f7 d8                	neg    %eax
 7b5:	89 c1                	mov    %eax,%ecx
    neg = 1;
 7b7:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 7be:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 7c3:	89 c8                	mov    %ecx,%eax
 7c5:	ba 00 00 00 00       	mov    $0x0,%edx
 7ca:	f7 f6                	div    %esi
 7cc:	89 df                	mov    %ebx,%edi
 7ce:	83 c3 01             	add    $0x1,%ebx
 7d1:	0f b6 92 f4 0b 00 00 	movzbl 0xbf4(%edx),%edx
 7d8:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 7dc:	89 ca                	mov    %ecx,%edx
 7de:	89 c1                	mov    %eax,%ecx
 7e0:	39 d6                	cmp    %edx,%esi
 7e2:	76 df                	jbe    7c3 <printint+0x2e>
  if(neg)
 7e4:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 7e8:	74 31                	je     81b <printint+0x86>
    buf[i++] = '-';
 7ea:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 7ef:	8d 5f 02             	lea    0x2(%edi),%ebx
 7f2:	8b 75 d0             	mov    -0x30(%ebp),%esi
 7f5:	eb 17                	jmp    80e <printint+0x79>
    x = xx;
 7f7:	89 c1                	mov    %eax,%ecx
  neg = 0;
 7f9:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 800:	eb bc                	jmp    7be <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 802:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 807:	89 f0                	mov    %esi,%eax
 809:	e8 6d ff ff ff       	call   77b <putc>
  while(--i >= 0)
 80e:	83 eb 01             	sub    $0x1,%ebx
 811:	79 ef                	jns    802 <printint+0x6d>
}
 813:	83 c4 2c             	add    $0x2c,%esp
 816:	5b                   	pop    %ebx
 817:	5e                   	pop    %esi
 818:	5f                   	pop    %edi
 819:	5d                   	pop    %ebp
 81a:	c3                   	ret    
 81b:	8b 75 d0             	mov    -0x30(%ebp),%esi
 81e:	eb ee                	jmp    80e <printint+0x79>

00000820 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 820:	55                   	push   %ebp
 821:	89 e5                	mov    %esp,%ebp
 823:	57                   	push   %edi
 824:	56                   	push   %esi
 825:	53                   	push   %ebx
 826:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 829:	8d 45 10             	lea    0x10(%ebp),%eax
 82c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 82f:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 834:	bb 00 00 00 00       	mov    $0x0,%ebx
 839:	eb 14                	jmp    84f <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 83b:	89 fa                	mov    %edi,%edx
 83d:	8b 45 08             	mov    0x8(%ebp),%eax
 840:	e8 36 ff ff ff       	call   77b <putc>
 845:	eb 05                	jmp    84c <printf+0x2c>
      }
    } else if(state == '%'){
 847:	83 fe 25             	cmp    $0x25,%esi
 84a:	74 25                	je     871 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 84c:	83 c3 01             	add    $0x1,%ebx
 84f:	8b 45 0c             	mov    0xc(%ebp),%eax
 852:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 856:	84 c0                	test   %al,%al
 858:	0f 84 20 01 00 00    	je     97e <printf+0x15e>
    c = fmt[i] & 0xff;
 85e:	0f be f8             	movsbl %al,%edi
 861:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 864:	85 f6                	test   %esi,%esi
 866:	75 df                	jne    847 <printf+0x27>
      if(c == '%'){
 868:	83 f8 25             	cmp    $0x25,%eax
 86b:	75 ce                	jne    83b <printf+0x1b>
        state = '%';
 86d:	89 c6                	mov    %eax,%esi
 86f:	eb db                	jmp    84c <printf+0x2c>
      if(c == 'd'){
 871:	83 f8 25             	cmp    $0x25,%eax
 874:	0f 84 cf 00 00 00    	je     949 <printf+0x129>
 87a:	0f 8c dd 00 00 00    	jl     95d <printf+0x13d>
 880:	83 f8 78             	cmp    $0x78,%eax
 883:	0f 8f d4 00 00 00    	jg     95d <printf+0x13d>
 889:	83 f8 63             	cmp    $0x63,%eax
 88c:	0f 8c cb 00 00 00    	jl     95d <printf+0x13d>
 892:	83 e8 63             	sub    $0x63,%eax
 895:	83 f8 15             	cmp    $0x15,%eax
 898:	0f 87 bf 00 00 00    	ja     95d <printf+0x13d>
 89e:	ff 24 85 9c 0b 00 00 	jmp    *0xb9c(,%eax,4)
        printint(fd, *ap, 10, 1);
 8a5:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 8a8:	8b 17                	mov    (%edi),%edx
 8aa:	83 ec 0c             	sub    $0xc,%esp
 8ad:	6a 01                	push   $0x1
 8af:	b9 0a 00 00 00       	mov    $0xa,%ecx
 8b4:	8b 45 08             	mov    0x8(%ebp),%eax
 8b7:	e8 d9 fe ff ff       	call   795 <printint>
        ap++;
 8bc:	83 c7 04             	add    $0x4,%edi
 8bf:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 8c2:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 8c5:	be 00 00 00 00       	mov    $0x0,%esi
 8ca:	eb 80                	jmp    84c <printf+0x2c>
        printint(fd, *ap, 16, 0);
 8cc:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 8cf:	8b 17                	mov    (%edi),%edx
 8d1:	83 ec 0c             	sub    $0xc,%esp
 8d4:	6a 00                	push   $0x0
 8d6:	b9 10 00 00 00       	mov    $0x10,%ecx
 8db:	8b 45 08             	mov    0x8(%ebp),%eax
 8de:	e8 b2 fe ff ff       	call   795 <printint>
        ap++;
 8e3:	83 c7 04             	add    $0x4,%edi
 8e6:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 8e9:	83 c4 10             	add    $0x10,%esp
      state = 0;
 8ec:	be 00 00 00 00       	mov    $0x0,%esi
 8f1:	e9 56 ff ff ff       	jmp    84c <printf+0x2c>
        s = (char*)*ap;
 8f6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8f9:	8b 30                	mov    (%eax),%esi
        ap++;
 8fb:	83 c0 04             	add    $0x4,%eax
 8fe:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 901:	85 f6                	test   %esi,%esi
 903:	75 15                	jne    91a <printf+0xfa>
          s = "(null)";
 905:	be 94 0b 00 00       	mov    $0xb94,%esi
 90a:	eb 0e                	jmp    91a <printf+0xfa>
          putc(fd, *s);
 90c:	0f be d2             	movsbl %dl,%edx
 90f:	8b 45 08             	mov    0x8(%ebp),%eax
 912:	e8 64 fe ff ff       	call   77b <putc>
          s++;
 917:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 91a:	0f b6 16             	movzbl (%esi),%edx
 91d:	84 d2                	test   %dl,%dl
 91f:	75 eb                	jne    90c <printf+0xec>
      state = 0;
 921:	be 00 00 00 00       	mov    $0x0,%esi
 926:	e9 21 ff ff ff       	jmp    84c <printf+0x2c>
        putc(fd, *ap);
 92b:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 92e:	0f be 17             	movsbl (%edi),%edx
 931:	8b 45 08             	mov    0x8(%ebp),%eax
 934:	e8 42 fe ff ff       	call   77b <putc>
        ap++;
 939:	83 c7 04             	add    $0x4,%edi
 93c:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 93f:	be 00 00 00 00       	mov    $0x0,%esi
 944:	e9 03 ff ff ff       	jmp    84c <printf+0x2c>
        putc(fd, c);
 949:	89 fa                	mov    %edi,%edx
 94b:	8b 45 08             	mov    0x8(%ebp),%eax
 94e:	e8 28 fe ff ff       	call   77b <putc>
      state = 0;
 953:	be 00 00 00 00       	mov    $0x0,%esi
 958:	e9 ef fe ff ff       	jmp    84c <printf+0x2c>
        putc(fd, '%');
 95d:	ba 25 00 00 00       	mov    $0x25,%edx
 962:	8b 45 08             	mov    0x8(%ebp),%eax
 965:	e8 11 fe ff ff       	call   77b <putc>
        putc(fd, c);
 96a:	89 fa                	mov    %edi,%edx
 96c:	8b 45 08             	mov    0x8(%ebp),%eax
 96f:	e8 07 fe ff ff       	call   77b <putc>
      state = 0;
 974:	be 00 00 00 00       	mov    $0x0,%esi
 979:	e9 ce fe ff ff       	jmp    84c <printf+0x2c>
    }
  }
}
 97e:	8d 65 f4             	lea    -0xc(%ebp),%esp
 981:	5b                   	pop    %ebx
 982:	5e                   	pop    %esi
 983:	5f                   	pop    %edi
 984:	5d                   	pop    %ebp
 985:	c3                   	ret    

00000986 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 986:	55                   	push   %ebp
 987:	89 e5                	mov    %esp,%ebp
 989:	57                   	push   %edi
 98a:	56                   	push   %esi
 98b:	53                   	push   %ebx
 98c:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 98f:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 992:	a1 e0 10 00 00       	mov    0x10e0,%eax
 997:	eb 02                	jmp    99b <free+0x15>
 999:	89 d0                	mov    %edx,%eax
 99b:	39 c8                	cmp    %ecx,%eax
 99d:	73 04                	jae    9a3 <free+0x1d>
 99f:	39 08                	cmp    %ecx,(%eax)
 9a1:	77 12                	ja     9b5 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9a3:	8b 10                	mov    (%eax),%edx
 9a5:	39 c2                	cmp    %eax,%edx
 9a7:	77 f0                	ja     999 <free+0x13>
 9a9:	39 c8                	cmp    %ecx,%eax
 9ab:	72 08                	jb     9b5 <free+0x2f>
 9ad:	39 ca                	cmp    %ecx,%edx
 9af:	77 04                	ja     9b5 <free+0x2f>
 9b1:	89 d0                	mov    %edx,%eax
 9b3:	eb e6                	jmp    99b <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 9b5:	8b 73 fc             	mov    -0x4(%ebx),%esi
 9b8:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 9bb:	8b 10                	mov    (%eax),%edx
 9bd:	39 d7                	cmp    %edx,%edi
 9bf:	74 19                	je     9da <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 9c1:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 9c4:	8b 50 04             	mov    0x4(%eax),%edx
 9c7:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 9ca:	39 ce                	cmp    %ecx,%esi
 9cc:	74 1b                	je     9e9 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 9ce:	89 08                	mov    %ecx,(%eax)
  freep = p;
 9d0:	a3 e0 10 00 00       	mov    %eax,0x10e0
}
 9d5:	5b                   	pop    %ebx
 9d6:	5e                   	pop    %esi
 9d7:	5f                   	pop    %edi
 9d8:	5d                   	pop    %ebp
 9d9:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 9da:	03 72 04             	add    0x4(%edx),%esi
 9dd:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 9e0:	8b 10                	mov    (%eax),%edx
 9e2:	8b 12                	mov    (%edx),%edx
 9e4:	89 53 f8             	mov    %edx,-0x8(%ebx)
 9e7:	eb db                	jmp    9c4 <free+0x3e>
    p->s.size += bp->s.size;
 9e9:	03 53 fc             	add    -0x4(%ebx),%edx
 9ec:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 9ef:	8b 53 f8             	mov    -0x8(%ebx),%edx
 9f2:	89 10                	mov    %edx,(%eax)
 9f4:	eb da                	jmp    9d0 <free+0x4a>

000009f6 <morecore>:

static Header*
morecore(uint nu)
{
 9f6:	55                   	push   %ebp
 9f7:	89 e5                	mov    %esp,%ebp
 9f9:	53                   	push   %ebx
 9fa:	83 ec 04             	sub    $0x4,%esp
 9fd:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 9ff:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 a04:	77 05                	ja     a0b <morecore+0x15>
    nu = 4096;
 a06:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 a0b:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 a12:	83 ec 0c             	sub    $0xc,%esp
 a15:	50                   	push   %eax
 a16:	e8 38 fd ff ff       	call   753 <sbrk>
  if(p == (char*)-1)
 a1b:	83 c4 10             	add    $0x10,%esp
 a1e:	83 f8 ff             	cmp    $0xffffffff,%eax
 a21:	74 1c                	je     a3f <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 a23:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 a26:	83 c0 08             	add    $0x8,%eax
 a29:	83 ec 0c             	sub    $0xc,%esp
 a2c:	50                   	push   %eax
 a2d:	e8 54 ff ff ff       	call   986 <free>
  return freep;
 a32:	a1 e0 10 00 00       	mov    0x10e0,%eax
 a37:	83 c4 10             	add    $0x10,%esp
}
 a3a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 a3d:	c9                   	leave  
 a3e:	c3                   	ret    
    return 0;
 a3f:	b8 00 00 00 00       	mov    $0x0,%eax
 a44:	eb f4                	jmp    a3a <morecore+0x44>

00000a46 <malloc>:

void*
malloc(uint nbytes)
{
 a46:	55                   	push   %ebp
 a47:	89 e5                	mov    %esp,%ebp
 a49:	53                   	push   %ebx
 a4a:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a4d:	8b 45 08             	mov    0x8(%ebp),%eax
 a50:	8d 58 07             	lea    0x7(%eax),%ebx
 a53:	c1 eb 03             	shr    $0x3,%ebx
 a56:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 a59:	8b 0d e0 10 00 00    	mov    0x10e0,%ecx
 a5f:	85 c9                	test   %ecx,%ecx
 a61:	74 04                	je     a67 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a63:	8b 01                	mov    (%ecx),%eax
 a65:	eb 4a                	jmp    ab1 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 a67:	c7 05 e0 10 00 00 e4 	movl   $0x10e4,0x10e0
 a6e:	10 00 00 
 a71:	c7 05 e4 10 00 00 e4 	movl   $0x10e4,0x10e4
 a78:	10 00 00 
    base.s.size = 0;
 a7b:	c7 05 e8 10 00 00 00 	movl   $0x0,0x10e8
 a82:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 a85:	b9 e4 10 00 00       	mov    $0x10e4,%ecx
 a8a:	eb d7                	jmp    a63 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 a8c:	74 19                	je     aa7 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 a8e:	29 da                	sub    %ebx,%edx
 a90:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 a93:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 a96:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 a99:	89 0d e0 10 00 00    	mov    %ecx,0x10e0
      return (void*)(p + 1);
 a9f:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 aa2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 aa5:	c9                   	leave  
 aa6:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 aa7:	8b 10                	mov    (%eax),%edx
 aa9:	89 11                	mov    %edx,(%ecx)
 aab:	eb ec                	jmp    a99 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 aad:	89 c1                	mov    %eax,%ecx
 aaf:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 ab1:	8b 50 04             	mov    0x4(%eax),%edx
 ab4:	39 da                	cmp    %ebx,%edx
 ab6:	73 d4                	jae    a8c <malloc+0x46>
    if(p == freep)
 ab8:	39 05 e0 10 00 00    	cmp    %eax,0x10e0
 abe:	75 ed                	jne    aad <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 ac0:	89 d8                	mov    %ebx,%eax
 ac2:	e8 2f ff ff ff       	call   9f6 <morecore>
 ac7:	85 c0                	test   %eax,%eax
 ac9:	75 e2                	jne    aad <malloc+0x67>
 acb:	eb d5                	jmp    aa2 <malloc+0x5c>
