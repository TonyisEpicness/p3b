
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
  57:	83 3d bc 0f 00 00 01 	cmpl   $0x1,0xfbc
  5e:	0f 84 db 00 00 00    	je     13f <worker+0x104>
  64:	6a 40                	push   $0x40
  66:	68 d8 0a 00 00       	push   $0xad8
  6b:	68 e2 0a 00 00       	push   $0xae2
  70:	6a 01                	push   $0x1
  72:	e8 b1 07 00 00       	call   828 <printf>
  77:	83 c4 0c             	add    $0xc,%esp
  7a:	68 21 0b 00 00       	push   $0xb21
  7f:	68 f5 0a 00 00       	push   $0xaf5
  84:	6a 01                	push   $0x1
  86:	e8 9d 07 00 00       	call   828 <printf>
  8b:	83 c4 08             	add    $0x8,%esp
  8e:	68 09 0b 00 00       	push   $0xb09
  93:	6a 01                	push   $0x1
  95:	e8 8e 07 00 00       	call   828 <printf>
  9a:	83 c4 04             	add    $0x4,%esp
  9d:	ff 35 c0 0f 00 00    	push   0xfc0
  a3:	e8 5b 06 00 00       	call   703 <kill>
  a8:	e8 26 06 00 00       	call   6d3 <exit>
   assert(tmp1 == 11);
  ad:	6a 3e                	push   $0x3e
  af:	68 d8 0a 00 00       	push   $0xad8
  b4:	68 e2 0a 00 00       	push   $0xae2
  b9:	6a 01                	push   $0x1
  bb:	e8 68 07 00 00       	call   828 <printf>
  c0:	83 c4 0c             	add    $0xc,%esp
  c3:	68 ea 0a 00 00       	push   $0xaea
  c8:	68 f5 0a 00 00       	push   $0xaf5
  cd:	6a 01                	push   $0x1
  cf:	e8 54 07 00 00       	call   828 <printf>
  d4:	83 c4 08             	add    $0x8,%esp
  d7:	68 09 0b 00 00       	push   $0xb09
  dc:	6a 01                	push   $0x1
  de:	e8 45 07 00 00       	call   828 <printf>
  e3:	83 c4 04             	add    $0x4,%esp
  e6:	ff 35 c0 0f 00 00    	push   0xfc0
  ec:	e8 12 06 00 00       	call   703 <kill>
  f1:	e8 dd 05 00 00       	call   6d3 <exit>
   assert(tmp2 == 22);
  f6:	6a 3f                	push   $0x3f
  f8:	68 d8 0a 00 00       	push   $0xad8
  fd:	68 e2 0a 00 00       	push   $0xae2
 102:	6a 01                	push   $0x1
 104:	e8 1f 07 00 00       	call   828 <printf>
 109:	83 c4 0c             	add    $0xc,%esp
 10c:	68 16 0b 00 00       	push   $0xb16
 111:	68 f5 0a 00 00       	push   $0xaf5
 116:	6a 01                	push   $0x1
 118:	e8 0b 07 00 00       	call   828 <printf>
 11d:	83 c4 08             	add    $0x8,%esp
 120:	68 09 0b 00 00       	push   $0xb09
 125:	6a 01                	push   $0x1
 127:	e8 fc 06 00 00       	call   828 <printf>
 12c:	83 c4 04             	add    $0x4,%esp
 12f:	ff 35 c0 0f 00 00    	push   0xfc0
 135:	e8 c9 05 00 00       	call   703 <kill>
 13a:	e8 94 05 00 00       	call   6d3 <exit>
   assert(fib(2) == 1);
 13f:	83 ec 0c             	sub    $0xc,%esp
 142:	6a 02                	push   $0x2
 144:	e8 b7 fe ff ff       	call   0 <fib>
 149:	83 c4 10             	add    $0x10,%esp
 14c:	83 f8 01             	cmp    $0x1,%eax
 14f:	74 49                	je     19a <worker+0x15f>
 151:	6a 41                	push   $0x41
 153:	68 d8 0a 00 00       	push   $0xad8
 158:	68 e2 0a 00 00       	push   $0xae2
 15d:	6a 01                	push   $0x1
 15f:	e8 c4 06 00 00       	call   828 <printf>
 164:	83 c4 0c             	add    $0xc,%esp
 167:	68 2d 0b 00 00       	push   $0xb2d
 16c:	68 f5 0a 00 00       	push   $0xaf5
 171:	6a 01                	push   $0x1
 173:	e8 b0 06 00 00       	call   828 <printf>
 178:	83 c4 08             	add    $0x8,%esp
 17b:	68 09 0b 00 00       	push   $0xb09
 180:	6a 01                	push   $0x1
 182:	e8 a1 06 00 00       	call   828 <printf>
 187:	83 c4 04             	add    $0x4,%esp
 18a:	ff 35 c0 0f 00 00    	push   0xfc0
 190:	e8 6e 05 00 00       	call   703 <kill>
 195:	e8 39 05 00 00       	call   6d3 <exit>
   assert(fib(3) == 2);
 19a:	83 ec 0c             	sub    $0xc,%esp
 19d:	6a 03                	push   $0x3
 19f:	e8 5c fe ff ff       	call   0 <fib>
 1a4:	83 c4 10             	add    $0x10,%esp
 1a7:	83 f8 02             	cmp    $0x2,%eax
 1aa:	74 49                	je     1f5 <worker+0x1ba>
 1ac:	6a 42                	push   $0x42
 1ae:	68 d8 0a 00 00       	push   $0xad8
 1b3:	68 e2 0a 00 00       	push   $0xae2
 1b8:	6a 01                	push   $0x1
 1ba:	e8 69 06 00 00       	call   828 <printf>
 1bf:	83 c4 0c             	add    $0xc,%esp
 1c2:	68 39 0b 00 00       	push   $0xb39
 1c7:	68 f5 0a 00 00       	push   $0xaf5
 1cc:	6a 01                	push   $0x1
 1ce:	e8 55 06 00 00       	call   828 <printf>
 1d3:	83 c4 08             	add    $0x8,%esp
 1d6:	68 09 0b 00 00       	push   $0xb09
 1db:	6a 01                	push   $0x1
 1dd:	e8 46 06 00 00       	call   828 <printf>
 1e2:	83 c4 04             	add    $0x4,%esp
 1e5:	ff 35 c0 0f 00 00    	push   0xfc0
 1eb:	e8 13 05 00 00       	call   703 <kill>
 1f0:	e8 de 04 00 00       	call   6d3 <exit>
   assert(fib(9) == 34);
 1f5:	83 ec 0c             	sub    $0xc,%esp
 1f8:	6a 09                	push   $0x9
 1fa:	e8 01 fe ff ff       	call   0 <fib>
 1ff:	83 c4 10             	add    $0x10,%esp
 202:	83 f8 22             	cmp    $0x22,%eax
 205:	74 49                	je     250 <worker+0x215>
 207:	6a 43                	push   $0x43
 209:	68 d8 0a 00 00       	push   $0xad8
 20e:	68 e2 0a 00 00       	push   $0xae2
 213:	6a 01                	push   $0x1
 215:	e8 0e 06 00 00       	call   828 <printf>
 21a:	83 c4 0c             	add    $0xc,%esp
 21d:	68 45 0b 00 00       	push   $0xb45
 222:	68 f5 0a 00 00       	push   $0xaf5
 227:	6a 01                	push   $0x1
 229:	e8 fa 05 00 00       	call   828 <printf>
 22e:	83 c4 08             	add    $0x8,%esp
 231:	68 09 0b 00 00       	push   $0xb09
 236:	6a 01                	push   $0x1
 238:	e8 eb 05 00 00       	call   828 <printf>
 23d:	83 c4 04             	add    $0x4,%esp
 240:	ff 35 c0 0f 00 00    	push   0xfc0
 246:	e8 b8 04 00 00       	call   703 <kill>
 24b:	e8 83 04 00 00       	call   6d3 <exit>
   assert(fib(15) == 610);
 250:	83 ec 0c             	sub    $0xc,%esp
 253:	6a 0f                	push   $0xf
 255:	e8 a6 fd ff ff       	call   0 <fib>
 25a:	83 c4 10             	add    $0x10,%esp
 25d:	3d 62 02 00 00       	cmp    $0x262,%eax
 262:	74 49                	je     2ad <worker+0x272>
 264:	6a 44                	push   $0x44
 266:	68 d8 0a 00 00       	push   $0xad8
 26b:	68 e2 0a 00 00       	push   $0xae2
 270:	6a 01                	push   $0x1
 272:	e8 b1 05 00 00       	call   828 <printf>
 277:	83 c4 0c             	add    $0xc,%esp
 27a:	68 52 0b 00 00       	push   $0xb52
 27f:	68 f5 0a 00 00       	push   $0xaf5
 284:	6a 01                	push   $0x1
 286:	e8 9d 05 00 00       	call   828 <printf>
 28b:	83 c4 08             	add    $0x8,%esp
 28e:	68 09 0b 00 00       	push   $0xb09
 293:	6a 01                	push   $0x1
 295:	e8 8e 05 00 00       	call   828 <printf>
 29a:	83 c4 04             	add    $0x4,%esp
 29d:	ff 35 c0 0f 00 00    	push   0xfc0
 2a3:	e8 5b 04 00 00       	call   703 <kill>
 2a8:	e8 26 04 00 00       	call   6d3 <exit>
   exit();
 2ad:	e8 21 04 00 00       	call   6d3 <exit>

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
 2c4:	e8 8a 04 00 00       	call   753 <getpid>
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
 2f5:	39 1d b8 0f 00 00    	cmp    %ebx,0xfb8
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
 324:	68 d8 0a 00 00       	push   $0xad8
 329:	68 e2 0a 00 00       	push   $0xae2
 32e:	6a 01                	push   $0x1
 330:	e8 f3 04 00 00       	call   828 <printf>
 335:	83 c4 0c             	add    $0xc,%esp
 338:	68 61 0b 00 00       	push   $0xb61
 33d:	68 f5 0a 00 00       	push   $0xaf5
 342:	6a 01                	push   $0x1
 344:	e8 df 04 00 00       	call   828 <printf>
 349:	83 c4 08             	add    $0x8,%esp
 34c:	68 09 0b 00 00       	push   $0xb09
 351:	6a 01                	push   $0x1
 353:	e8 d0 04 00 00       	call   828 <printf>
 358:	83 c4 04             	add    $0x4,%esp
 35b:	ff 35 c0 0f 00 00    	push   0xfc0
 361:	e8 9d 03 00 00       	call   703 <kill>
 366:	e8 68 03 00 00       	call   6d3 <exit>
      assert(thread_pid > 0);
 36b:	6a 2e                	push   $0x2e
 36d:	68 d8 0a 00 00       	push   $0xad8
 372:	68 e2 0a 00 00       	push   $0xae2
 377:	6a 01                	push   $0x1
 379:	e8 aa 04 00 00       	call   828 <printf>
 37e:	83 c4 0c             	add    $0xc,%esp
 381:	68 73 0b 00 00       	push   $0xb73
 386:	68 f5 0a 00 00       	push   $0xaf5
 38b:	6a 01                	push   $0x1
 38d:	e8 96 04 00 00       	call   828 <printf>
 392:	83 c4 08             	add    $0x8,%esp
 395:	68 09 0b 00 00       	push   $0xb09
 39a:	6a 01                	push   $0x1
 39c:	e8 87 04 00 00       	call   828 <printf>
 3a1:	83 c4 04             	add    $0x4,%esp
 3a4:	ff 35 c0 0f 00 00    	push   0xfc0
 3aa:	e8 54 03 00 00       	call   703 <kill>
 3af:	e8 1f 03 00 00       	call   6d3 <exit>
   for (int i = 0; i < num_threads; i++) {
 3b4:	bb 00 00 00 00       	mov    $0x0,%ebx
 3b9:	39 1d b8 0f 00 00    	cmp    %ebx,0xfb8
 3bf:	7e 57                	jle    418 <main+0x166>
      int join_pid = thread_join();
 3c1:	e8 df 00 00 00       	call   4a5 <thread_join>
      assert(join_pid > 0);
 3c6:	85 c0                	test   %eax,%eax
 3c8:	7e 05                	jle    3cf <main+0x11d>
   for (int i = 0; i < num_threads; i++) {
 3ca:	83 c3 01             	add    $0x1,%ebx
 3cd:	eb ea                	jmp    3b9 <main+0x107>
      assert(join_pid > 0);
 3cf:	6a 33                	push   $0x33
 3d1:	68 d8 0a 00 00       	push   $0xad8
 3d6:	68 e2 0a 00 00       	push   $0xae2
 3db:	6a 01                	push   $0x1
 3dd:	e8 46 04 00 00       	call   828 <printf>
 3e2:	83 c4 0c             	add    $0xc,%esp
 3e5:	68 82 0b 00 00       	push   $0xb82
 3ea:	68 f5 0a 00 00       	push   $0xaf5
 3ef:	6a 01                	push   $0x1
 3f1:	e8 32 04 00 00       	call   828 <printf>
 3f6:	83 c4 08             	add    $0x8,%esp
 3f9:	68 09 0b 00 00       	push   $0xb09
 3fe:	6a 01                	push   $0x1
 400:	e8 23 04 00 00       	call   828 <printf>
 405:	83 c4 04             	add    $0x4,%esp
 408:	ff 35 c0 0f 00 00    	push   0xfc0
 40e:	e8 f0 02 00 00       	call   703 <kill>
 413:	e8 bb 02 00 00       	call   6d3 <exit>
   printf(1, "TEST PASSED\n");
 418:	83 ec 08             	sub    $0x8,%esp
 41b:	68 8f 0b 00 00       	push   $0xb8f
 420:	6a 01                	push   $0x1
 422:	e8 01 04 00 00       	call   828 <printf>
   exit();
 427:	e8 a7 02 00 00       	call   6d3 <exit>

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
 440:	83 ec 14             	sub    $0x14,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE*2);
 443:	68 00 20 00 00       	push   $0x2000
 448:	e8 01 06 00 00       	call   a4e <malloc>
  if(n_stack == 0){
 44d:	83 c4 10             	add    $0x10,%esp
 450:	85 c0                	test   %eax,%eax
 452:	74 4a                	je     49e <thread_create+0x61>
    return -1;
  }
  
  for(int i=0; i<64; i++){
 454:	ba 00 00 00 00       	mov    $0x0,%edx
 459:	eb 03                	jmp    45e <thread_create+0x21>
 45b:	83 c2 01             	add    $0x1,%edx
 45e:	83 fa 3f             	cmp    $0x3f,%edx
 461:	7f 27                	jg     48a <thread_create+0x4d>
    if(threads[i]->flag==0){
 463:	8b 0c 95 e0 0f 00 00 	mov    0xfe0(,%edx,4),%ecx
 46a:	83 79 08 00          	cmpl   $0x0,0x8(%ecx)
 46e:	75 eb                	jne    45b <thread_create+0x1e>
      threads[i]->maddr = n_stack;
 470:	89 01                	mov    %eax,(%ecx)
      threads[i]->pg1addr = n_stack;
 472:	8b 0c 95 e0 0f 00 00 	mov    0xfe0(,%edx,4),%ecx
 479:	89 41 04             	mov    %eax,0x4(%ecx)
      threads[i]->flag = 1;
 47c:	8b 14 95 e0 0f 00 00 	mov    0xfe0(,%edx,4),%edx
 483:	c7 42 08 01 00 00 00 	movl   $0x1,0x8(%edx)
      break;
    }
  }
  
  int new_pid = clone(start_routine, arg1, arg2, n_stack); // TODO: is this the right way to call it?
 48a:	50                   	push   %eax
 48b:	ff 75 10             	push   0x10(%ebp)
 48e:	ff 75 0c             	push   0xc(%ebp)
 491:	ff 75 08             	push   0x8(%ebp)
 494:	e8 da 02 00 00       	call   773 <clone>

  // I can't remember if there was something else to do here but I'm sure I'll find out



  return new_pid;
 499:	83 c4 10             	add    $0x10,%esp
}
 49c:	c9                   	leave  
 49d:	c3                   	ret    
    return -1;
 49e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 4a3:	eb f7                	jmp    49c <thread_create+0x5f>

000004a5 <thread_join>:

//TODO: fix
int thread_join() {
 4a5:	55                   	push   %ebp
 4a6:	89 e5                	mov    %esp,%ebp
 4a8:	56                   	push   %esi
 4a9:	53                   	push   %ebx
 4aa:	83 ec 1c             	sub    $0x1c,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 4ad:	8d 45 f4             	lea    -0xc(%ebp),%eax
 4b0:	50                   	push   %eax
 4b1:	e8 c5 02 00 00       	call   77b <join>
 4b6:	89 c6                	mov    %eax,%esi
  for(int i=0; i<64; i++){
 4b8:	83 c4 10             	add    $0x10,%esp
 4bb:	bb 00 00 00 00       	mov    $0x0,%ebx
 4c0:	eb 03                	jmp    4c5 <thread_join+0x20>
 4c2:	83 c3 01             	add    $0x1,%ebx
 4c5:	83 fb 3f             	cmp    $0x3f,%ebx
 4c8:	7f 23                	jg     4ed <thread_join+0x48>
    if((threads[i]->flag==1) && (stk_addr == threads[i]->pg1addr)){
 4ca:	8b 04 9d e0 0f 00 00 	mov    0xfe0(,%ebx,4),%eax
 4d1:	83 78 08 01          	cmpl   $0x1,0x8(%eax)
 4d5:	75 eb                	jne    4c2 <thread_join+0x1d>
 4d7:	8b 55 f4             	mov    -0xc(%ebp),%edx
 4da:	39 50 04             	cmp    %edx,0x4(%eax)
 4dd:	75 e3                	jne    4c2 <thread_join+0x1d>
      free(stk_addr);
 4df:	83 ec 0c             	sub    $0xc,%esp
 4e2:	52                   	push   %edx
 4e3:	e8 a6 04 00 00       	call   98e <free>
 4e8:	83 c4 10             	add    $0x10,%esp
 4eb:	eb d5                	jmp    4c2 <thread_join+0x1d>
    }
  }
  return pid;
}
 4ed:	89 f0                	mov    %esi,%eax
 4ef:	8d 65 f8             	lea    -0x8(%ebp),%esp
 4f2:	5b                   	pop    %ebx
 4f3:	5e                   	pop    %esi
 4f4:	5d                   	pop    %ebp
 4f5:	c3                   	ret    

000004f6 <lock_acquire>:

void lock_acquire(lock_t *lock){
 4f6:	55                   	push   %ebp
 4f7:	89 e5                	mov    %esp,%ebp
 4f9:	53                   	push   %ebx
 4fa:	83 ec 04             	sub    $0x4,%esp
 4fd:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 500:	83 ec 08             	sub    $0x8,%esp
 503:	6a 01                	push   $0x1
 505:	53                   	push   %ebx
 506:	e8 21 ff ff ff       	call   42c <test_and_set>
 50b:	83 c4 10             	add    $0x10,%esp
 50e:	83 f8 01             	cmp    $0x1,%eax
 511:	74 ed                	je     500 <lock_acquire+0xa>
    ;
}
 513:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 516:	c9                   	leave  
 517:	c3                   	ret    

00000518 <lock_release>:

void lock_release(lock_t *lock) {
 518:	55                   	push   %ebp
 519:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 51b:	8b 45 08             	mov    0x8(%ebp),%eax
 51e:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 524:	5d                   	pop    %ebp
 525:	c3                   	ret    

00000526 <lock_init>:

void lock_init(lock_t *lock) {
 526:	55                   	push   %ebp
 527:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 529:	8b 45 08             	mov    0x8(%ebp),%eax
 52c:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 532:	5d                   	pop    %ebp
 533:	c3                   	ret    

00000534 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 534:	55                   	push   %ebp
 535:	89 e5                	mov    %esp,%ebp
 537:	56                   	push   %esi
 538:	53                   	push   %ebx
 539:	8b 75 08             	mov    0x8(%ebp),%esi
 53c:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 53f:	89 f0                	mov    %esi,%eax
 541:	89 d1                	mov    %edx,%ecx
 543:	83 c2 01             	add    $0x1,%edx
 546:	89 c3                	mov    %eax,%ebx
 548:	83 c0 01             	add    $0x1,%eax
 54b:	0f b6 09             	movzbl (%ecx),%ecx
 54e:	88 0b                	mov    %cl,(%ebx)
 550:	84 c9                	test   %cl,%cl
 552:	75 ed                	jne    541 <strcpy+0xd>
    ;
  return os;
}
 554:	89 f0                	mov    %esi,%eax
 556:	5b                   	pop    %ebx
 557:	5e                   	pop    %esi
 558:	5d                   	pop    %ebp
 559:	c3                   	ret    

0000055a <strcmp>:

int
strcmp(const char *p, const char *q)
{
 55a:	55                   	push   %ebp
 55b:	89 e5                	mov    %esp,%ebp
 55d:	8b 4d 08             	mov    0x8(%ebp),%ecx
 560:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 563:	eb 06                	jmp    56b <strcmp+0x11>
    p++, q++;
 565:	83 c1 01             	add    $0x1,%ecx
 568:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 56b:	0f b6 01             	movzbl (%ecx),%eax
 56e:	84 c0                	test   %al,%al
 570:	74 04                	je     576 <strcmp+0x1c>
 572:	3a 02                	cmp    (%edx),%al
 574:	74 ef                	je     565 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 576:	0f b6 c0             	movzbl %al,%eax
 579:	0f b6 12             	movzbl (%edx),%edx
 57c:	29 d0                	sub    %edx,%eax
}
 57e:	5d                   	pop    %ebp
 57f:	c3                   	ret    

00000580 <strlen>:

uint
strlen(const char *s)
{
 580:	55                   	push   %ebp
 581:	89 e5                	mov    %esp,%ebp
 583:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 586:	b8 00 00 00 00       	mov    $0x0,%eax
 58b:	eb 03                	jmp    590 <strlen+0x10>
 58d:	83 c0 01             	add    $0x1,%eax
 590:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 594:	75 f7                	jne    58d <strlen+0xd>
    ;
  return n;
}
 596:	5d                   	pop    %ebp
 597:	c3                   	ret    

00000598 <memset>:

void*
memset(void *dst, int c, uint n)
{
 598:	55                   	push   %ebp
 599:	89 e5                	mov    %esp,%ebp
 59b:	57                   	push   %edi
 59c:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 59f:	89 d7                	mov    %edx,%edi
 5a1:	8b 4d 10             	mov    0x10(%ebp),%ecx
 5a4:	8b 45 0c             	mov    0xc(%ebp),%eax
 5a7:	fc                   	cld    
 5a8:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 5aa:	89 d0                	mov    %edx,%eax
 5ac:	8b 7d fc             	mov    -0x4(%ebp),%edi
 5af:	c9                   	leave  
 5b0:	c3                   	ret    

000005b1 <strchr>:

char*
strchr(const char *s, char c)
{
 5b1:	55                   	push   %ebp
 5b2:	89 e5                	mov    %esp,%ebp
 5b4:	8b 45 08             	mov    0x8(%ebp),%eax
 5b7:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 5bb:	eb 03                	jmp    5c0 <strchr+0xf>
 5bd:	83 c0 01             	add    $0x1,%eax
 5c0:	0f b6 10             	movzbl (%eax),%edx
 5c3:	84 d2                	test   %dl,%dl
 5c5:	74 06                	je     5cd <strchr+0x1c>
    if(*s == c)
 5c7:	38 ca                	cmp    %cl,%dl
 5c9:	75 f2                	jne    5bd <strchr+0xc>
 5cb:	eb 05                	jmp    5d2 <strchr+0x21>
      return (char*)s;
  return 0;
 5cd:	b8 00 00 00 00       	mov    $0x0,%eax
}
 5d2:	5d                   	pop    %ebp
 5d3:	c3                   	ret    

000005d4 <gets>:

char*
gets(char *buf, int max)
{
 5d4:	55                   	push   %ebp
 5d5:	89 e5                	mov    %esp,%ebp
 5d7:	57                   	push   %edi
 5d8:	56                   	push   %esi
 5d9:	53                   	push   %ebx
 5da:	83 ec 1c             	sub    $0x1c,%esp
 5dd:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 5e0:	bb 00 00 00 00       	mov    $0x0,%ebx
 5e5:	89 de                	mov    %ebx,%esi
 5e7:	83 c3 01             	add    $0x1,%ebx
 5ea:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 5ed:	7d 2e                	jge    61d <gets+0x49>
    cc = read(0, &c, 1);
 5ef:	83 ec 04             	sub    $0x4,%esp
 5f2:	6a 01                	push   $0x1
 5f4:	8d 45 e7             	lea    -0x19(%ebp),%eax
 5f7:	50                   	push   %eax
 5f8:	6a 00                	push   $0x0
 5fa:	e8 ec 00 00 00       	call   6eb <read>
    if(cc < 1)
 5ff:	83 c4 10             	add    $0x10,%esp
 602:	85 c0                	test   %eax,%eax
 604:	7e 17                	jle    61d <gets+0x49>
      break;
    buf[i++] = c;
 606:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 60a:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 60d:	3c 0a                	cmp    $0xa,%al
 60f:	0f 94 c2             	sete   %dl
 612:	3c 0d                	cmp    $0xd,%al
 614:	0f 94 c0             	sete   %al
 617:	08 c2                	or     %al,%dl
 619:	74 ca                	je     5e5 <gets+0x11>
    buf[i++] = c;
 61b:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 61d:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 621:	89 f8                	mov    %edi,%eax
 623:	8d 65 f4             	lea    -0xc(%ebp),%esp
 626:	5b                   	pop    %ebx
 627:	5e                   	pop    %esi
 628:	5f                   	pop    %edi
 629:	5d                   	pop    %ebp
 62a:	c3                   	ret    

0000062b <stat>:

int
stat(const char *n, struct stat *st)
{
 62b:	55                   	push   %ebp
 62c:	89 e5                	mov    %esp,%ebp
 62e:	56                   	push   %esi
 62f:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 630:	83 ec 08             	sub    $0x8,%esp
 633:	6a 00                	push   $0x0
 635:	ff 75 08             	push   0x8(%ebp)
 638:	e8 d6 00 00 00       	call   713 <open>
  if(fd < 0)
 63d:	83 c4 10             	add    $0x10,%esp
 640:	85 c0                	test   %eax,%eax
 642:	78 24                	js     668 <stat+0x3d>
 644:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 646:	83 ec 08             	sub    $0x8,%esp
 649:	ff 75 0c             	push   0xc(%ebp)
 64c:	50                   	push   %eax
 64d:	e8 d9 00 00 00       	call   72b <fstat>
 652:	89 c6                	mov    %eax,%esi
  close(fd);
 654:	89 1c 24             	mov    %ebx,(%esp)
 657:	e8 9f 00 00 00       	call   6fb <close>
  return r;
 65c:	83 c4 10             	add    $0x10,%esp
}
 65f:	89 f0                	mov    %esi,%eax
 661:	8d 65 f8             	lea    -0x8(%ebp),%esp
 664:	5b                   	pop    %ebx
 665:	5e                   	pop    %esi
 666:	5d                   	pop    %ebp
 667:	c3                   	ret    
    return -1;
 668:	be ff ff ff ff       	mov    $0xffffffff,%esi
 66d:	eb f0                	jmp    65f <stat+0x34>

0000066f <atoi>:

int
atoi(const char *s)
{
 66f:	55                   	push   %ebp
 670:	89 e5                	mov    %esp,%ebp
 672:	53                   	push   %ebx
 673:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 676:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 67b:	eb 10                	jmp    68d <atoi+0x1e>
    n = n*10 + *s++ - '0';
 67d:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 680:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 683:	83 c1 01             	add    $0x1,%ecx
 686:	0f be c0             	movsbl %al,%eax
 689:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 68d:	0f b6 01             	movzbl (%ecx),%eax
 690:	8d 58 d0             	lea    -0x30(%eax),%ebx
 693:	80 fb 09             	cmp    $0x9,%bl
 696:	76 e5                	jbe    67d <atoi+0xe>
  return n;
}
 698:	89 d0                	mov    %edx,%eax
 69a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 69d:	c9                   	leave  
 69e:	c3                   	ret    

0000069f <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 69f:	55                   	push   %ebp
 6a0:	89 e5                	mov    %esp,%ebp
 6a2:	56                   	push   %esi
 6a3:	53                   	push   %ebx
 6a4:	8b 75 08             	mov    0x8(%ebp),%esi
 6a7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 6aa:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 6ad:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 6af:	eb 0d                	jmp    6be <memmove+0x1f>
    *dst++ = *src++;
 6b1:	0f b6 01             	movzbl (%ecx),%eax
 6b4:	88 02                	mov    %al,(%edx)
 6b6:	8d 49 01             	lea    0x1(%ecx),%ecx
 6b9:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 6bc:	89 d8                	mov    %ebx,%eax
 6be:	8d 58 ff             	lea    -0x1(%eax),%ebx
 6c1:	85 c0                	test   %eax,%eax
 6c3:	7f ec                	jg     6b1 <memmove+0x12>
  return vdst;
}
 6c5:	89 f0                	mov    %esi,%eax
 6c7:	5b                   	pop    %ebx
 6c8:	5e                   	pop    %esi
 6c9:	5d                   	pop    %ebp
 6ca:	c3                   	ret    

000006cb <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 6cb:	b8 01 00 00 00       	mov    $0x1,%eax
 6d0:	cd 40                	int    $0x40
 6d2:	c3                   	ret    

000006d3 <exit>:
SYSCALL(exit)
 6d3:	b8 02 00 00 00       	mov    $0x2,%eax
 6d8:	cd 40                	int    $0x40
 6da:	c3                   	ret    

000006db <wait>:
SYSCALL(wait)
 6db:	b8 03 00 00 00       	mov    $0x3,%eax
 6e0:	cd 40                	int    $0x40
 6e2:	c3                   	ret    

000006e3 <pipe>:
SYSCALL(pipe)
 6e3:	b8 04 00 00 00       	mov    $0x4,%eax
 6e8:	cd 40                	int    $0x40
 6ea:	c3                   	ret    

000006eb <read>:
SYSCALL(read)
 6eb:	b8 05 00 00 00       	mov    $0x5,%eax
 6f0:	cd 40                	int    $0x40
 6f2:	c3                   	ret    

000006f3 <write>:
SYSCALL(write)
 6f3:	b8 10 00 00 00       	mov    $0x10,%eax
 6f8:	cd 40                	int    $0x40
 6fa:	c3                   	ret    

000006fb <close>:
SYSCALL(close)
 6fb:	b8 15 00 00 00       	mov    $0x15,%eax
 700:	cd 40                	int    $0x40
 702:	c3                   	ret    

00000703 <kill>:
SYSCALL(kill)
 703:	b8 06 00 00 00       	mov    $0x6,%eax
 708:	cd 40                	int    $0x40
 70a:	c3                   	ret    

0000070b <exec>:
SYSCALL(exec)
 70b:	b8 07 00 00 00       	mov    $0x7,%eax
 710:	cd 40                	int    $0x40
 712:	c3                   	ret    

00000713 <open>:
SYSCALL(open)
 713:	b8 0f 00 00 00       	mov    $0xf,%eax
 718:	cd 40                	int    $0x40
 71a:	c3                   	ret    

0000071b <mknod>:
SYSCALL(mknod)
 71b:	b8 11 00 00 00       	mov    $0x11,%eax
 720:	cd 40                	int    $0x40
 722:	c3                   	ret    

00000723 <unlink>:
SYSCALL(unlink)
 723:	b8 12 00 00 00       	mov    $0x12,%eax
 728:	cd 40                	int    $0x40
 72a:	c3                   	ret    

0000072b <fstat>:
SYSCALL(fstat)
 72b:	b8 08 00 00 00       	mov    $0x8,%eax
 730:	cd 40                	int    $0x40
 732:	c3                   	ret    

00000733 <link>:
SYSCALL(link)
 733:	b8 13 00 00 00       	mov    $0x13,%eax
 738:	cd 40                	int    $0x40
 73a:	c3                   	ret    

0000073b <mkdir>:
SYSCALL(mkdir)
 73b:	b8 14 00 00 00       	mov    $0x14,%eax
 740:	cd 40                	int    $0x40
 742:	c3                   	ret    

00000743 <chdir>:
SYSCALL(chdir)
 743:	b8 09 00 00 00       	mov    $0x9,%eax
 748:	cd 40                	int    $0x40
 74a:	c3                   	ret    

0000074b <dup>:
SYSCALL(dup)
 74b:	b8 0a 00 00 00       	mov    $0xa,%eax
 750:	cd 40                	int    $0x40
 752:	c3                   	ret    

00000753 <getpid>:
SYSCALL(getpid)
 753:	b8 0b 00 00 00       	mov    $0xb,%eax
 758:	cd 40                	int    $0x40
 75a:	c3                   	ret    

0000075b <sbrk>:
SYSCALL(sbrk)
 75b:	b8 0c 00 00 00       	mov    $0xc,%eax
 760:	cd 40                	int    $0x40
 762:	c3                   	ret    

00000763 <sleep>:
SYSCALL(sleep)
 763:	b8 0d 00 00 00       	mov    $0xd,%eax
 768:	cd 40                	int    $0x40
 76a:	c3                   	ret    

0000076b <uptime>:
SYSCALL(uptime)
 76b:	b8 0e 00 00 00       	mov    $0xe,%eax
 770:	cd 40                	int    $0x40
 772:	c3                   	ret    

00000773 <clone>:
SYSCALL(clone)
 773:	b8 16 00 00 00       	mov    $0x16,%eax
 778:	cd 40                	int    $0x40
 77a:	c3                   	ret    

0000077b <join>:
 77b:	b8 17 00 00 00       	mov    $0x17,%eax
 780:	cd 40                	int    $0x40
 782:	c3                   	ret    

00000783 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 783:	55                   	push   %ebp
 784:	89 e5                	mov    %esp,%ebp
 786:	83 ec 1c             	sub    $0x1c,%esp
 789:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 78c:	6a 01                	push   $0x1
 78e:	8d 55 f4             	lea    -0xc(%ebp),%edx
 791:	52                   	push   %edx
 792:	50                   	push   %eax
 793:	e8 5b ff ff ff       	call   6f3 <write>
}
 798:	83 c4 10             	add    $0x10,%esp
 79b:	c9                   	leave  
 79c:	c3                   	ret    

0000079d <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 79d:	55                   	push   %ebp
 79e:	89 e5                	mov    %esp,%ebp
 7a0:	57                   	push   %edi
 7a1:	56                   	push   %esi
 7a2:	53                   	push   %ebx
 7a3:	83 ec 2c             	sub    $0x2c,%esp
 7a6:	89 45 d0             	mov    %eax,-0x30(%ebp)
 7a9:	89 d0                	mov    %edx,%eax
 7ab:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 7ad:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 7b1:	0f 95 c1             	setne  %cl
 7b4:	c1 ea 1f             	shr    $0x1f,%edx
 7b7:	84 d1                	test   %dl,%cl
 7b9:	74 44                	je     7ff <printint+0x62>
    neg = 1;
    x = -xx;
 7bb:	f7 d8                	neg    %eax
 7bd:	89 c1                	mov    %eax,%ecx
    neg = 1;
 7bf:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 7c6:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 7cb:	89 c8                	mov    %ecx,%eax
 7cd:	ba 00 00 00 00       	mov    $0x0,%edx
 7d2:	f7 f6                	div    %esi
 7d4:	89 df                	mov    %ebx,%edi
 7d6:	83 c3 01             	add    $0x1,%ebx
 7d9:	0f b6 92 fc 0b 00 00 	movzbl 0xbfc(%edx),%edx
 7e0:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 7e4:	89 ca                	mov    %ecx,%edx
 7e6:	89 c1                	mov    %eax,%ecx
 7e8:	39 d6                	cmp    %edx,%esi
 7ea:	76 df                	jbe    7cb <printint+0x2e>
  if(neg)
 7ec:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 7f0:	74 31                	je     823 <printint+0x86>
    buf[i++] = '-';
 7f2:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 7f7:	8d 5f 02             	lea    0x2(%edi),%ebx
 7fa:	8b 75 d0             	mov    -0x30(%ebp),%esi
 7fd:	eb 17                	jmp    816 <printint+0x79>
    x = xx;
 7ff:	89 c1                	mov    %eax,%ecx
  neg = 0;
 801:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 808:	eb bc                	jmp    7c6 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 80a:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 80f:	89 f0                	mov    %esi,%eax
 811:	e8 6d ff ff ff       	call   783 <putc>
  while(--i >= 0)
 816:	83 eb 01             	sub    $0x1,%ebx
 819:	79 ef                	jns    80a <printint+0x6d>
}
 81b:	83 c4 2c             	add    $0x2c,%esp
 81e:	5b                   	pop    %ebx
 81f:	5e                   	pop    %esi
 820:	5f                   	pop    %edi
 821:	5d                   	pop    %ebp
 822:	c3                   	ret    
 823:	8b 75 d0             	mov    -0x30(%ebp),%esi
 826:	eb ee                	jmp    816 <printint+0x79>

00000828 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 828:	55                   	push   %ebp
 829:	89 e5                	mov    %esp,%ebp
 82b:	57                   	push   %edi
 82c:	56                   	push   %esi
 82d:	53                   	push   %ebx
 82e:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 831:	8d 45 10             	lea    0x10(%ebp),%eax
 834:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 837:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 83c:	bb 00 00 00 00       	mov    $0x0,%ebx
 841:	eb 14                	jmp    857 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 843:	89 fa                	mov    %edi,%edx
 845:	8b 45 08             	mov    0x8(%ebp),%eax
 848:	e8 36 ff ff ff       	call   783 <putc>
 84d:	eb 05                	jmp    854 <printf+0x2c>
      }
    } else if(state == '%'){
 84f:	83 fe 25             	cmp    $0x25,%esi
 852:	74 25                	je     879 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 854:	83 c3 01             	add    $0x1,%ebx
 857:	8b 45 0c             	mov    0xc(%ebp),%eax
 85a:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 85e:	84 c0                	test   %al,%al
 860:	0f 84 20 01 00 00    	je     986 <printf+0x15e>
    c = fmt[i] & 0xff;
 866:	0f be f8             	movsbl %al,%edi
 869:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 86c:	85 f6                	test   %esi,%esi
 86e:	75 df                	jne    84f <printf+0x27>
      if(c == '%'){
 870:	83 f8 25             	cmp    $0x25,%eax
 873:	75 ce                	jne    843 <printf+0x1b>
        state = '%';
 875:	89 c6                	mov    %eax,%esi
 877:	eb db                	jmp    854 <printf+0x2c>
      if(c == 'd'){
 879:	83 f8 25             	cmp    $0x25,%eax
 87c:	0f 84 cf 00 00 00    	je     951 <printf+0x129>
 882:	0f 8c dd 00 00 00    	jl     965 <printf+0x13d>
 888:	83 f8 78             	cmp    $0x78,%eax
 88b:	0f 8f d4 00 00 00    	jg     965 <printf+0x13d>
 891:	83 f8 63             	cmp    $0x63,%eax
 894:	0f 8c cb 00 00 00    	jl     965 <printf+0x13d>
 89a:	83 e8 63             	sub    $0x63,%eax
 89d:	83 f8 15             	cmp    $0x15,%eax
 8a0:	0f 87 bf 00 00 00    	ja     965 <printf+0x13d>
 8a6:	ff 24 85 a4 0b 00 00 	jmp    *0xba4(,%eax,4)
        printint(fd, *ap, 10, 1);
 8ad:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 8b0:	8b 17                	mov    (%edi),%edx
 8b2:	83 ec 0c             	sub    $0xc,%esp
 8b5:	6a 01                	push   $0x1
 8b7:	b9 0a 00 00 00       	mov    $0xa,%ecx
 8bc:	8b 45 08             	mov    0x8(%ebp),%eax
 8bf:	e8 d9 fe ff ff       	call   79d <printint>
        ap++;
 8c4:	83 c7 04             	add    $0x4,%edi
 8c7:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 8ca:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 8cd:	be 00 00 00 00       	mov    $0x0,%esi
 8d2:	eb 80                	jmp    854 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 8d4:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 8d7:	8b 17                	mov    (%edi),%edx
 8d9:	83 ec 0c             	sub    $0xc,%esp
 8dc:	6a 00                	push   $0x0
 8de:	b9 10 00 00 00       	mov    $0x10,%ecx
 8e3:	8b 45 08             	mov    0x8(%ebp),%eax
 8e6:	e8 b2 fe ff ff       	call   79d <printint>
        ap++;
 8eb:	83 c7 04             	add    $0x4,%edi
 8ee:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 8f1:	83 c4 10             	add    $0x10,%esp
      state = 0;
 8f4:	be 00 00 00 00       	mov    $0x0,%esi
 8f9:	e9 56 ff ff ff       	jmp    854 <printf+0x2c>
        s = (char*)*ap;
 8fe:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 901:	8b 30                	mov    (%eax),%esi
        ap++;
 903:	83 c0 04             	add    $0x4,%eax
 906:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 909:	85 f6                	test   %esi,%esi
 90b:	75 15                	jne    922 <printf+0xfa>
          s = "(null)";
 90d:	be 9c 0b 00 00       	mov    $0xb9c,%esi
 912:	eb 0e                	jmp    922 <printf+0xfa>
          putc(fd, *s);
 914:	0f be d2             	movsbl %dl,%edx
 917:	8b 45 08             	mov    0x8(%ebp),%eax
 91a:	e8 64 fe ff ff       	call   783 <putc>
          s++;
 91f:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 922:	0f b6 16             	movzbl (%esi),%edx
 925:	84 d2                	test   %dl,%dl
 927:	75 eb                	jne    914 <printf+0xec>
      state = 0;
 929:	be 00 00 00 00       	mov    $0x0,%esi
 92e:	e9 21 ff ff ff       	jmp    854 <printf+0x2c>
        putc(fd, *ap);
 933:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 936:	0f be 17             	movsbl (%edi),%edx
 939:	8b 45 08             	mov    0x8(%ebp),%eax
 93c:	e8 42 fe ff ff       	call   783 <putc>
        ap++;
 941:	83 c7 04             	add    $0x4,%edi
 944:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 947:	be 00 00 00 00       	mov    $0x0,%esi
 94c:	e9 03 ff ff ff       	jmp    854 <printf+0x2c>
        putc(fd, c);
 951:	89 fa                	mov    %edi,%edx
 953:	8b 45 08             	mov    0x8(%ebp),%eax
 956:	e8 28 fe ff ff       	call   783 <putc>
      state = 0;
 95b:	be 00 00 00 00       	mov    $0x0,%esi
 960:	e9 ef fe ff ff       	jmp    854 <printf+0x2c>
        putc(fd, '%');
 965:	ba 25 00 00 00       	mov    $0x25,%edx
 96a:	8b 45 08             	mov    0x8(%ebp),%eax
 96d:	e8 11 fe ff ff       	call   783 <putc>
        putc(fd, c);
 972:	89 fa                	mov    %edi,%edx
 974:	8b 45 08             	mov    0x8(%ebp),%eax
 977:	e8 07 fe ff ff       	call   783 <putc>
      state = 0;
 97c:	be 00 00 00 00       	mov    $0x0,%esi
 981:	e9 ce fe ff ff       	jmp    854 <printf+0x2c>
    }
  }
}
 986:	8d 65 f4             	lea    -0xc(%ebp),%esp
 989:	5b                   	pop    %ebx
 98a:	5e                   	pop    %esi
 98b:	5f                   	pop    %edi
 98c:	5d                   	pop    %ebp
 98d:	c3                   	ret    

0000098e <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 98e:	55                   	push   %ebp
 98f:	89 e5                	mov    %esp,%ebp
 991:	57                   	push   %edi
 992:	56                   	push   %esi
 993:	53                   	push   %ebx
 994:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 997:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 99a:	a1 e0 10 00 00       	mov    0x10e0,%eax
 99f:	eb 02                	jmp    9a3 <free+0x15>
 9a1:	89 d0                	mov    %edx,%eax
 9a3:	39 c8                	cmp    %ecx,%eax
 9a5:	73 04                	jae    9ab <free+0x1d>
 9a7:	39 08                	cmp    %ecx,(%eax)
 9a9:	77 12                	ja     9bd <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9ab:	8b 10                	mov    (%eax),%edx
 9ad:	39 c2                	cmp    %eax,%edx
 9af:	77 f0                	ja     9a1 <free+0x13>
 9b1:	39 c8                	cmp    %ecx,%eax
 9b3:	72 08                	jb     9bd <free+0x2f>
 9b5:	39 ca                	cmp    %ecx,%edx
 9b7:	77 04                	ja     9bd <free+0x2f>
 9b9:	89 d0                	mov    %edx,%eax
 9bb:	eb e6                	jmp    9a3 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 9bd:	8b 73 fc             	mov    -0x4(%ebx),%esi
 9c0:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 9c3:	8b 10                	mov    (%eax),%edx
 9c5:	39 d7                	cmp    %edx,%edi
 9c7:	74 19                	je     9e2 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 9c9:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 9cc:	8b 50 04             	mov    0x4(%eax),%edx
 9cf:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 9d2:	39 ce                	cmp    %ecx,%esi
 9d4:	74 1b                	je     9f1 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 9d6:	89 08                	mov    %ecx,(%eax)
  freep = p;
 9d8:	a3 e0 10 00 00       	mov    %eax,0x10e0
}
 9dd:	5b                   	pop    %ebx
 9de:	5e                   	pop    %esi
 9df:	5f                   	pop    %edi
 9e0:	5d                   	pop    %ebp
 9e1:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 9e2:	03 72 04             	add    0x4(%edx),%esi
 9e5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 9e8:	8b 10                	mov    (%eax),%edx
 9ea:	8b 12                	mov    (%edx),%edx
 9ec:	89 53 f8             	mov    %edx,-0x8(%ebx)
 9ef:	eb db                	jmp    9cc <free+0x3e>
    p->s.size += bp->s.size;
 9f1:	03 53 fc             	add    -0x4(%ebx),%edx
 9f4:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 9f7:	8b 53 f8             	mov    -0x8(%ebx),%edx
 9fa:	89 10                	mov    %edx,(%eax)
 9fc:	eb da                	jmp    9d8 <free+0x4a>

000009fe <morecore>:

static Header*
morecore(uint nu)
{
 9fe:	55                   	push   %ebp
 9ff:	89 e5                	mov    %esp,%ebp
 a01:	53                   	push   %ebx
 a02:	83 ec 04             	sub    $0x4,%esp
 a05:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 a07:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 a0c:	77 05                	ja     a13 <morecore+0x15>
    nu = 4096;
 a0e:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 a13:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 a1a:	83 ec 0c             	sub    $0xc,%esp
 a1d:	50                   	push   %eax
 a1e:	e8 38 fd ff ff       	call   75b <sbrk>
  if(p == (char*)-1)
 a23:	83 c4 10             	add    $0x10,%esp
 a26:	83 f8 ff             	cmp    $0xffffffff,%eax
 a29:	74 1c                	je     a47 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 a2b:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 a2e:	83 c0 08             	add    $0x8,%eax
 a31:	83 ec 0c             	sub    $0xc,%esp
 a34:	50                   	push   %eax
 a35:	e8 54 ff ff ff       	call   98e <free>
  return freep;
 a3a:	a1 e0 10 00 00       	mov    0x10e0,%eax
 a3f:	83 c4 10             	add    $0x10,%esp
}
 a42:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 a45:	c9                   	leave  
 a46:	c3                   	ret    
    return 0;
 a47:	b8 00 00 00 00       	mov    $0x0,%eax
 a4c:	eb f4                	jmp    a42 <morecore+0x44>

00000a4e <malloc>:

void*
malloc(uint nbytes)
{
 a4e:	55                   	push   %ebp
 a4f:	89 e5                	mov    %esp,%ebp
 a51:	53                   	push   %ebx
 a52:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a55:	8b 45 08             	mov    0x8(%ebp),%eax
 a58:	8d 58 07             	lea    0x7(%eax),%ebx
 a5b:	c1 eb 03             	shr    $0x3,%ebx
 a5e:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 a61:	8b 0d e0 10 00 00    	mov    0x10e0,%ecx
 a67:	85 c9                	test   %ecx,%ecx
 a69:	74 04                	je     a6f <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a6b:	8b 01                	mov    (%ecx),%eax
 a6d:	eb 4a                	jmp    ab9 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 a6f:	c7 05 e0 10 00 00 e4 	movl   $0x10e4,0x10e0
 a76:	10 00 00 
 a79:	c7 05 e4 10 00 00 e4 	movl   $0x10e4,0x10e4
 a80:	10 00 00 
    base.s.size = 0;
 a83:	c7 05 e8 10 00 00 00 	movl   $0x0,0x10e8
 a8a:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 a8d:	b9 e4 10 00 00       	mov    $0x10e4,%ecx
 a92:	eb d7                	jmp    a6b <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 a94:	74 19                	je     aaf <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 a96:	29 da                	sub    %ebx,%edx
 a98:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 a9b:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 a9e:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 aa1:	89 0d e0 10 00 00    	mov    %ecx,0x10e0
      return (void*)(p + 1);
 aa7:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 aaa:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 aad:	c9                   	leave  
 aae:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 aaf:	8b 10                	mov    (%eax),%edx
 ab1:	89 11                	mov    %edx,(%ecx)
 ab3:	eb ec                	jmp    aa1 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 ab5:	89 c1                	mov    %eax,%ecx
 ab7:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 ab9:	8b 50 04             	mov    0x4(%eax),%edx
 abc:	39 da                	cmp    %ebx,%edx
 abe:	73 d4                	jae    a94 <malloc+0x46>
    if(p == freep)
 ac0:	39 05 e0 10 00 00    	cmp    %eax,0x10e0
 ac6:	75 ed                	jne    ab5 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 ac8:	89 d8                	mov    %ebx,%eax
 aca:	e8 2f ff ff ff       	call   9fe <morecore>
 acf:	85 c0                	test   %eax,%eax
 ad1:	75 e2                	jne    ab5 <malloc+0x67>
 ad3:	eb d5                	jmp    aaa <malloc+0x5c>
