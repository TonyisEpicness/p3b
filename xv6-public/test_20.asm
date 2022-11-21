
_test_20:     file format elf32-i386


Disassembly of section .text:

00000000 <worker2>:
   printf(1, "TEST PASSED\n");
   exit();
}

void worker2(void *arg1, void *arg2)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 14             	sub    $0x14,%esp
   lock_acquire(&lock);
   6:	68 24 0f 00 00       	push   $0xf24
   b:	e8 71 04 00 00       	call   481 <lock_acquire>
   assert((unsigned int)sbrk(0) == size);
  10:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  17:	e8 ca 06 00 00       	call   6e6 <sbrk>
  1c:	83 c4 10             	add    $0x10,%esp
  1f:	3b 05 28 0f 00 00    	cmp    0xf28,%eax
  25:	74 49                	je     70 <worker2+0x70>
  27:	6a 31                	push   $0x31
  29:	68 60 0a 00 00       	push   $0xa60
  2e:	68 6a 0a 00 00       	push   $0xa6a
  33:	6a 01                	push   $0x1
  35:	e8 79 07 00 00       	call   7b3 <printf>
  3a:	83 c4 0c             	add    $0xc,%esp
  3d:	68 72 0a 00 00       	push   $0xa72
  42:	68 90 0a 00 00       	push   $0xa90
  47:	6a 01                	push   $0x1
  49:	e8 65 07 00 00       	call   7b3 <printf>
  4e:	83 c4 08             	add    $0x8,%esp
  51:	68 a4 0a 00 00       	push   $0xaa4
  56:	6a 01                	push   $0x1
  58:	e8 56 07 00 00       	call   7b3 <printf>
  5d:	83 c4 04             	add    $0x4,%esp
  60:	ff 35 30 0f 00 00    	push   0xf30
  66:	e8 23 06 00 00       	call   68e <kill>
  6b:	e8 ee 05 00 00       	call   65e <exit>
   global++;
  70:	83 05 2c 0f 00 00 01 	addl   $0x1,0xf2c
   lock_release(&lock);
  77:	83 ec 0c             	sub    $0xc,%esp
  7a:	68 24 0f 00 00       	push   $0xf24
  7f:	e8 1f 04 00 00       	call   4a3 <lock_release>

   
   lock_acquire(&lock2);
  84:	c7 04 24 20 0f 00 00 	movl   $0xf20,(%esp)
  8b:	e8 f1 03 00 00       	call   481 <lock_acquire>
   assert((unsigned int)sbrk(0) == size);
  90:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  97:	e8 4a 06 00 00       	call   6e6 <sbrk>
  9c:	83 c4 10             	add    $0x10,%esp
  9f:	3b 05 28 0f 00 00    	cmp    0xf28,%eax
  a5:	74 49                	je     f0 <worker2+0xf0>
  a7:	6a 37                	push   $0x37
  a9:	68 60 0a 00 00       	push   $0xa60
  ae:	68 6a 0a 00 00       	push   $0xa6a
  b3:	6a 01                	push   $0x1
  b5:	e8 f9 06 00 00       	call   7b3 <printf>
  ba:	83 c4 0c             	add    $0xc,%esp
  bd:	68 72 0a 00 00       	push   $0xa72
  c2:	68 90 0a 00 00       	push   $0xa90
  c7:	6a 01                	push   $0x1
  c9:	e8 e5 06 00 00       	call   7b3 <printf>
  ce:	83 c4 08             	add    $0x8,%esp
  d1:	68 a4 0a 00 00       	push   $0xaa4
  d6:	6a 01                	push   $0x1
  d8:	e8 d6 06 00 00       	call   7b3 <printf>
  dd:	83 c4 04             	add    $0x4,%esp
  e0:	ff 35 30 0f 00 00    	push   0xf30
  e6:	e8 a3 05 00 00       	call   68e <kill>
  eb:	e8 6e 05 00 00       	call   65e <exit>
   global++;
  f0:	83 05 2c 0f 00 00 01 	addl   $0x1,0xf2c
   lock_release(&lock2);
  f7:	83 ec 0c             	sub    $0xc,%esp
  fa:	68 20 0f 00 00       	push   $0xf20
  ff:	e8 9f 03 00 00       	call   4a3 <lock_release>

   
   exit();
 104:	e8 55 05 00 00       	call   65e <exit>

00000109 <worker>:
}


void worker(void *arg1, void *arg2) {
 109:	55                   	push   %ebp
 10a:	89 e5                	mov    %esp,%ebp
 10c:	83 ec 14             	sub    $0x14,%esp
   lock_init(&lock);
 10f:	68 24 0f 00 00       	push   $0xf24
 114:	e8 98 03 00 00       	call   4b1 <lock_init>
   lock_init(&lock2);
 119:	c7 04 24 20 0f 00 00 	movl   $0xf20,(%esp)
 120:	e8 8c 03 00 00       	call   4b1 <lock_init>
   lock_acquire(&lock);
 125:	c7 04 24 24 0f 00 00 	movl   $0xf24,(%esp)
 12c:	e8 50 03 00 00       	call   481 <lock_acquire>
   lock_acquire(&lock2);
 131:	c7 04 24 20 0f 00 00 	movl   $0xf20,(%esp)
 138:	e8 44 03 00 00       	call   481 <lock_acquire>

   int nested_thread_id = thread_create(worker2, 0, 0);
 13d:	83 c4 0c             	add    $0xc,%esp
 140:	6a 00                	push   $0x0
 142:	6a 00                	push   $0x0
 144:	68 00 00 00 00       	push   $0x0
 149:	e8 82 02 00 00       	call   3d0 <thread_create>
    assert(nested_thread_id > 0);
 14e:	83 c4 10             	add    $0x10,%esp
 151:	85 c0                	test   %eax,%eax
 153:	7e 14                	jle    169 <worker+0x60>
   size = (unsigned int)sbrk(0);
 155:	83 ec 0c             	sub    $0xc,%esp
 158:	6a 00                	push   $0x0
 15a:	e8 87 05 00 00       	call   6e6 <sbrk>
 15f:	a3 28 0f 00 00       	mov    %eax,0xf28

   while (global < num_threads) {
 164:	83 c4 10             	add    $0x10,%esp
 167:	eb 71                	jmp    1da <worker+0xd1>
    assert(nested_thread_id > 0);
 169:	6a 47                	push   $0x47
 16b:	68 60 0a 00 00       	push   $0xa60
 170:	68 6a 0a 00 00       	push   $0xa6a
 175:	6a 01                	push   $0x1
 177:	e8 37 06 00 00       	call   7b3 <printf>
 17c:	83 c4 0c             	add    $0xc,%esp
 17f:	68 b1 0a 00 00       	push   $0xab1
 184:	68 90 0a 00 00       	push   $0xa90
 189:	6a 01                	push   $0x1
 18b:	e8 23 06 00 00       	call   7b3 <printf>
 190:	83 c4 08             	add    $0x8,%esp
 193:	68 a4 0a 00 00       	push   $0xaa4
 198:	6a 01                	push   $0x1
 19a:	e8 14 06 00 00       	call   7b3 <printf>
 19f:	83 c4 04             	add    $0x4,%esp
 1a2:	ff 35 30 0f 00 00    	push   0xf30
 1a8:	e8 e1 04 00 00       	call   68e <kill>
 1ad:	e8 ac 04 00 00       	call   65e <exit>
      lock_release(&lock);
 1b2:	83 ec 0c             	sub    $0xc,%esp
 1b5:	68 24 0f 00 00       	push   $0xf24
 1ba:	e8 e4 02 00 00       	call   4a3 <lock_release>
      sleep(100);
 1bf:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 1c6:	e8 23 05 00 00       	call   6ee <sleep>
      lock_acquire(&lock);
 1cb:	c7 04 24 24 0f 00 00 	movl   $0xf24,(%esp)
 1d2:	e8 aa 02 00 00       	call   481 <lock_acquire>
 1d7:	83 c4 10             	add    $0x10,%esp
   while (global < num_threads) {
 1da:	a1 04 0f 00 00       	mov    0xf04,%eax
 1df:	39 05 2c 0f 00 00    	cmp    %eax,0xf2c
 1e5:	7c cb                	jl     1b2 <worker+0xa9>
   }

   global = 0;
 1e7:	c7 05 2c 0f 00 00 00 	movl   $0x0,0xf2c
 1ee:	00 00 00 
   sbrk(10000);
 1f1:	83 ec 0c             	sub    $0xc,%esp
 1f4:	68 10 27 00 00       	push   $0x2710
 1f9:	e8 e8 04 00 00       	call   6e6 <sbrk>
   size = (unsigned int)sbrk(0);
 1fe:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 205:	e8 dc 04 00 00       	call   6e6 <sbrk>
 20a:	a3 28 0f 00 00       	mov    %eax,0xf28
   lock_release(&lock);
 20f:	c7 04 24 24 0f 00 00 	movl   $0xf24,(%esp)
 216:	e8 88 02 00 00       	call   4a3 <lock_release>

   while (global < num_threads) {
 21b:	83 c4 10             	add    $0x10,%esp
 21e:	eb 28                	jmp    248 <worker+0x13f>
      lock_release(&lock2);
 220:	83 ec 0c             	sub    $0xc,%esp
 223:	68 20 0f 00 00       	push   $0xf20
 228:	e8 76 02 00 00       	call   4a3 <lock_release>
      sleep(100);
 22d:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 234:	e8 b5 04 00 00       	call   6ee <sleep>
      lock_acquire(&lock2);
 239:	c7 04 24 20 0f 00 00 	movl   $0xf20,(%esp)
 240:	e8 3c 02 00 00       	call   481 <lock_acquire>
 245:	83 c4 10             	add    $0x10,%esp
   while (global < num_threads) {
 248:	a1 04 0f 00 00       	mov    0xf04,%eax
 24d:	39 05 2c 0f 00 00    	cmp    %eax,0xf2c
 253:	7c cb                	jl     220 <worker+0x117>
   }
   lock_release(&lock2);
 255:	83 ec 0c             	sub    $0xc,%esp
 258:	68 20 0f 00 00       	push   $0xf20
 25d:	e8 41 02 00 00       	call   4a3 <lock_release>

   int nested_join_pid = thread_join();
 262:	e8 c9 01 00 00       	call   430 <thread_join>
   assert(nested_join_pid > 0);
 267:	83 c4 10             	add    $0x10,%esp
 26a:	85 c0                	test   %eax,%eax
 26c:	7e 05                	jle    273 <worker+0x16a>




   exit();
 26e:	e8 eb 03 00 00       	call   65e <exit>
   assert(nested_join_pid > 0);
 273:	6a 5d                	push   $0x5d
 275:	68 60 0a 00 00       	push   $0xa60
 27a:	68 6a 0a 00 00       	push   $0xa6a
 27f:	6a 01                	push   $0x1
 281:	e8 2d 05 00 00       	call   7b3 <printf>
 286:	83 c4 0c             	add    $0xc,%esp
 289:	68 c6 0a 00 00       	push   $0xac6
 28e:	68 90 0a 00 00       	push   $0xa90
 293:	6a 01                	push   $0x1
 295:	e8 19 05 00 00       	call   7b3 <printf>
 29a:	83 c4 08             	add    $0x8,%esp
 29d:	68 a4 0a 00 00       	push   $0xaa4
 2a2:	6a 01                	push   $0x1
 2a4:	e8 0a 05 00 00       	call   7b3 <printf>
 2a9:	83 c4 04             	add    $0x4,%esp
 2ac:	ff 35 30 0f 00 00    	push   0xf30
 2b2:	e8 d7 03 00 00       	call   68e <kill>
 2b7:	e8 a2 03 00 00       	call   65e <exit>

000002bc <main>:
{
 2bc:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 2c0:	83 e4 f0             	and    $0xfffffff0,%esp
 2c3:	ff 71 fc             	push   -0x4(%ecx)
 2c6:	55                   	push   %ebp
 2c7:	89 e5                	mov    %esp,%ebp
 2c9:	51                   	push   %ecx
 2ca:	83 ec 14             	sub    $0x14,%esp
   ppid = getpid();
 2cd:	e8 0c 04 00 00       	call   6de <getpid>
 2d2:	a3 30 0f 00 00       	mov    %eax,0xf30
   int arg1 = 11, arg2 = 22;
 2d7:	c7 45 f4 0b 00 00 00 	movl   $0xb,-0xc(%ebp)
 2de:	c7 45 f0 16 00 00 00 	movl   $0x16,-0x10(%ebp)
   size = (unsigned int)sbrk(0);
 2e5:	83 ec 0c             	sub    $0xc,%esp
 2e8:	6a 00                	push   $0x0
 2ea:	e8 f7 03 00 00       	call   6e6 <sbrk>
 2ef:	a3 28 0f 00 00       	mov    %eax,0xf28
   int thread_pid = thread_create(worker, &arg1, &arg2);
 2f4:	83 c4 0c             	add    $0xc,%esp
 2f7:	8d 45 f0             	lea    -0x10(%ebp),%eax
 2fa:	50                   	push   %eax
 2fb:	8d 45 f4             	lea    -0xc(%ebp),%eax
 2fe:	50                   	push   %eax
 2ff:	68 09 01 00 00       	push   $0x109
 304:	e8 c7 00 00 00       	call   3d0 <thread_create>
   assert(thread_pid > 0);
 309:	83 c4 10             	add    $0x10,%esp
 30c:	85 c0                	test   %eax,%eax
 30e:	7e 1d                	jle    32d <main+0x71>
   int join_pid = thread_join();
 310:	e8 1b 01 00 00       	call   430 <thread_join>
   assert(join_pid > 0);
 315:	85 c0                	test   %eax,%eax
 317:	7e 5d                	jle    376 <main+0xba>
   printf(1, "TEST PASSED\n");
 319:	83 ec 08             	sub    $0x8,%esp
 31c:	68 e9 0a 00 00       	push   $0xae9
 321:	6a 01                	push   $0x1
 323:	e8 8b 04 00 00       	call   7b3 <printf>
   exit();
 328:	e8 31 03 00 00       	call   65e <exit>
   assert(thread_pid > 0);
 32d:	6a 24                	push   $0x24
 32f:	68 60 0a 00 00       	push   $0xa60
 334:	68 6a 0a 00 00       	push   $0xa6a
 339:	6a 01                	push   $0x1
 33b:	e8 73 04 00 00       	call   7b3 <printf>
 340:	83 c4 0c             	add    $0xc,%esp
 343:	68 da 0a 00 00       	push   $0xada
 348:	68 90 0a 00 00       	push   $0xa90
 34d:	6a 01                	push   $0x1
 34f:	e8 5f 04 00 00       	call   7b3 <printf>
 354:	83 c4 08             	add    $0x8,%esp
 357:	68 a4 0a 00 00       	push   $0xaa4
 35c:	6a 01                	push   $0x1
 35e:	e8 50 04 00 00       	call   7b3 <printf>
 363:	83 c4 04             	add    $0x4,%esp
 366:	ff 35 30 0f 00 00    	push   0xf30
 36c:	e8 1d 03 00 00       	call   68e <kill>
 371:	e8 e8 02 00 00       	call   65e <exit>
   assert(join_pid > 0);
 376:	6a 27                	push   $0x27
 378:	68 60 0a 00 00       	push   $0xa60
 37d:	68 6a 0a 00 00       	push   $0xa6a
 382:	6a 01                	push   $0x1
 384:	e8 2a 04 00 00       	call   7b3 <printf>
 389:	83 c4 0c             	add    $0xc,%esp
 38c:	68 cd 0a 00 00       	push   $0xacd
 391:	68 90 0a 00 00       	push   $0xa90
 396:	6a 01                	push   $0x1
 398:	e8 16 04 00 00       	call   7b3 <printf>
 39d:	83 c4 08             	add    $0x8,%esp
 3a0:	68 a4 0a 00 00       	push   $0xaa4
 3a5:	6a 01                	push   $0x1
 3a7:	e8 07 04 00 00       	call   7b3 <printf>
 3ac:	83 c4 04             	add    $0x4,%esp
 3af:	ff 35 30 0f 00 00    	push   0xf30
 3b5:	e8 d4 02 00 00       	call   68e <kill>
 3ba:	e8 9f 02 00 00       	call   65e <exit>

000003bf <test_and_set>:
  int flag;
};

struct thread_ref *threads[64];

int test_and_set(int *old_ptr, int new_ptr) {
 3bf:	55                   	push   %ebp
 3c0:	89 e5                	mov    %esp,%ebp
 3c2:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *old_ptr;
 3c5:	8b 10                	mov    (%eax),%edx
  *old_ptr = new_ptr;
 3c7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 3ca:	89 08                	mov    %ecx,(%eax)
  return old;
}
 3cc:	89 d0                	mov    %edx,%eax
 3ce:	5d                   	pop    %ebp
 3cf:	c3                   	ret    

000003d0 <thread_create>:

// a wrapper func for clone
int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 3d0:	55                   	push   %ebp
 3d1:	89 e5                	mov    %esp,%ebp
 3d3:	53                   	push   %ebx
 3d4:	83 ec 10             	sub    $0x10,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE*2);
 3d7:	68 00 20 00 00       	push   $0x2000
 3dc:	e8 f8 05 00 00       	call   9d9 <malloc>
  if(n_stack == 0){
 3e1:	83 c4 10             	add    $0x10,%esp
 3e4:	85 c0                	test   %eax,%eax
 3e6:	74 41                	je     429 <thread_create+0x59>
 3e8:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  int new_pid = clone(start_routine, arg1, arg2, n_stack);
 3ea:	50                   	push   %eax
 3eb:	ff 75 10             	push   0x10(%ebp)
 3ee:	ff 75 0c             	push   0xc(%ebp)
 3f1:	ff 75 08             	push   0x8(%ebp)
 3f4:	e8 05 03 00 00       	call   6fe <clone>

  for(int i=0; i<64; i++){
 3f9:	83 c4 10             	add    $0x10,%esp
 3fc:	ba 00 00 00 00       	mov    $0x0,%edx
 401:	eb 03                	jmp    406 <thread_create+0x36>
 403:	83 c2 01             	add    $0x1,%edx
 406:	83 fa 3f             	cmp    $0x3f,%edx
 409:	7f 19                	jg     424 <thread_create+0x54>
    if(threads[i]->flag==0){
 40b:	8b 0c 95 40 0f 00 00 	mov    0xf40(,%edx,4),%ecx
 412:	83 79 08 00          	cmpl   $0x0,0x8(%ecx)
 416:	75 eb                	jne    403 <thread_create+0x33>
      threads[i]->maddr = n_stack;
 418:	89 19                	mov    %ebx,(%ecx)
      threads[i]->pg1addr = n_stack;
 41a:	8b 14 95 40 0f 00 00 	mov    0xf40(,%edx,4),%edx
 421:	89 5a 04             	mov    %ebx,0x4(%edx)
      break;
    }
  }

  return new_pid;
}
 424:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 427:	c9                   	leave  
 428:	c3                   	ret    
    return -1;
 429:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 42e:	eb f4                	jmp    424 <thread_create+0x54>

00000430 <thread_join>:

//TODO: fix
int thread_join() {
 430:	55                   	push   %ebp
 431:	89 e5                	mov    %esp,%ebp
 433:	56                   	push   %esi
 434:	53                   	push   %ebx
 435:	83 ec 1c             	sub    $0x1c,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 438:	8d 45 f4             	lea    -0xc(%ebp),%eax
 43b:	50                   	push   %eax
 43c:	e8 c5 02 00 00       	call   706 <join>
 441:	89 c6                	mov    %eax,%esi
  for(int i=0; i<64; i++){
 443:	83 c4 10             	add    $0x10,%esp
 446:	bb 00 00 00 00       	mov    $0x0,%ebx
 44b:	eb 03                	jmp    450 <thread_join+0x20>
 44d:	83 c3 01             	add    $0x1,%ebx
 450:	83 fb 3f             	cmp    $0x3f,%ebx
 453:	7f 23                	jg     478 <thread_join+0x48>
    if((threads[i]->flag==1) && (stk_addr == threads[i]->pg1addr)){
 455:	8b 04 9d 40 0f 00 00 	mov    0xf40(,%ebx,4),%eax
 45c:	83 78 08 01          	cmpl   $0x1,0x8(%eax)
 460:	75 eb                	jne    44d <thread_join+0x1d>
 462:	8b 55 f4             	mov    -0xc(%ebp),%edx
 465:	39 50 04             	cmp    %edx,0x4(%eax)
 468:	75 e3                	jne    44d <thread_join+0x1d>
      free(stk_addr);
 46a:	83 ec 0c             	sub    $0xc,%esp
 46d:	52                   	push   %edx
 46e:	e8 a6 04 00 00       	call   919 <free>
 473:	83 c4 10             	add    $0x10,%esp
 476:	eb d5                	jmp    44d <thread_join+0x1d>
    }
  }
  return pid;
}
 478:	89 f0                	mov    %esi,%eax
 47a:	8d 65 f8             	lea    -0x8(%ebp),%esp
 47d:	5b                   	pop    %ebx
 47e:	5e                   	pop    %esi
 47f:	5d                   	pop    %ebp
 480:	c3                   	ret    

00000481 <lock_acquire>:

void lock_acquire(lock_t *lock){
 481:	55                   	push   %ebp
 482:	89 e5                	mov    %esp,%ebp
 484:	53                   	push   %ebx
 485:	83 ec 04             	sub    $0x4,%esp
 488:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 48b:	83 ec 08             	sub    $0x8,%esp
 48e:	6a 01                	push   $0x1
 490:	53                   	push   %ebx
 491:	e8 29 ff ff ff       	call   3bf <test_and_set>
 496:	83 c4 10             	add    $0x10,%esp
 499:	83 f8 01             	cmp    $0x1,%eax
 49c:	74 ed                	je     48b <lock_acquire+0xa>
    ;
}
 49e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4a1:	c9                   	leave  
 4a2:	c3                   	ret    

000004a3 <lock_release>:

void lock_release(lock_t *lock) {
 4a3:	55                   	push   %ebp
 4a4:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 4a6:	8b 45 08             	mov    0x8(%ebp),%eax
 4a9:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 4af:	5d                   	pop    %ebp
 4b0:	c3                   	ret    

000004b1 <lock_init>:

void lock_init(lock_t *lock) {
 4b1:	55                   	push   %ebp
 4b2:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 4b4:	8b 45 08             	mov    0x8(%ebp),%eax
 4b7:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 4bd:	5d                   	pop    %ebp
 4be:	c3                   	ret    

000004bf <strcpy>:

char*
strcpy(char *s, const char *t)
{
 4bf:	55                   	push   %ebp
 4c0:	89 e5                	mov    %esp,%ebp
 4c2:	56                   	push   %esi
 4c3:	53                   	push   %ebx
 4c4:	8b 75 08             	mov    0x8(%ebp),%esi
 4c7:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 4ca:	89 f0                	mov    %esi,%eax
 4cc:	89 d1                	mov    %edx,%ecx
 4ce:	83 c2 01             	add    $0x1,%edx
 4d1:	89 c3                	mov    %eax,%ebx
 4d3:	83 c0 01             	add    $0x1,%eax
 4d6:	0f b6 09             	movzbl (%ecx),%ecx
 4d9:	88 0b                	mov    %cl,(%ebx)
 4db:	84 c9                	test   %cl,%cl
 4dd:	75 ed                	jne    4cc <strcpy+0xd>
    ;
  return os;
}
 4df:	89 f0                	mov    %esi,%eax
 4e1:	5b                   	pop    %ebx
 4e2:	5e                   	pop    %esi
 4e3:	5d                   	pop    %ebp
 4e4:	c3                   	ret    

000004e5 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 4e5:	55                   	push   %ebp
 4e6:	89 e5                	mov    %esp,%ebp
 4e8:	8b 4d 08             	mov    0x8(%ebp),%ecx
 4eb:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 4ee:	eb 06                	jmp    4f6 <strcmp+0x11>
    p++, q++;
 4f0:	83 c1 01             	add    $0x1,%ecx
 4f3:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 4f6:	0f b6 01             	movzbl (%ecx),%eax
 4f9:	84 c0                	test   %al,%al
 4fb:	74 04                	je     501 <strcmp+0x1c>
 4fd:	3a 02                	cmp    (%edx),%al
 4ff:	74 ef                	je     4f0 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 501:	0f b6 c0             	movzbl %al,%eax
 504:	0f b6 12             	movzbl (%edx),%edx
 507:	29 d0                	sub    %edx,%eax
}
 509:	5d                   	pop    %ebp
 50a:	c3                   	ret    

0000050b <strlen>:

uint
strlen(const char *s)
{
 50b:	55                   	push   %ebp
 50c:	89 e5                	mov    %esp,%ebp
 50e:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 511:	b8 00 00 00 00       	mov    $0x0,%eax
 516:	eb 03                	jmp    51b <strlen+0x10>
 518:	83 c0 01             	add    $0x1,%eax
 51b:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 51f:	75 f7                	jne    518 <strlen+0xd>
    ;
  return n;
}
 521:	5d                   	pop    %ebp
 522:	c3                   	ret    

00000523 <memset>:

void*
memset(void *dst, int c, uint n)
{
 523:	55                   	push   %ebp
 524:	89 e5                	mov    %esp,%ebp
 526:	57                   	push   %edi
 527:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 52a:	89 d7                	mov    %edx,%edi
 52c:	8b 4d 10             	mov    0x10(%ebp),%ecx
 52f:	8b 45 0c             	mov    0xc(%ebp),%eax
 532:	fc                   	cld    
 533:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 535:	89 d0                	mov    %edx,%eax
 537:	8b 7d fc             	mov    -0x4(%ebp),%edi
 53a:	c9                   	leave  
 53b:	c3                   	ret    

0000053c <strchr>:

char*
strchr(const char *s, char c)
{
 53c:	55                   	push   %ebp
 53d:	89 e5                	mov    %esp,%ebp
 53f:	8b 45 08             	mov    0x8(%ebp),%eax
 542:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 546:	eb 03                	jmp    54b <strchr+0xf>
 548:	83 c0 01             	add    $0x1,%eax
 54b:	0f b6 10             	movzbl (%eax),%edx
 54e:	84 d2                	test   %dl,%dl
 550:	74 06                	je     558 <strchr+0x1c>
    if(*s == c)
 552:	38 ca                	cmp    %cl,%dl
 554:	75 f2                	jne    548 <strchr+0xc>
 556:	eb 05                	jmp    55d <strchr+0x21>
      return (char*)s;
  return 0;
 558:	b8 00 00 00 00       	mov    $0x0,%eax
}
 55d:	5d                   	pop    %ebp
 55e:	c3                   	ret    

0000055f <gets>:

char*
gets(char *buf, int max)
{
 55f:	55                   	push   %ebp
 560:	89 e5                	mov    %esp,%ebp
 562:	57                   	push   %edi
 563:	56                   	push   %esi
 564:	53                   	push   %ebx
 565:	83 ec 1c             	sub    $0x1c,%esp
 568:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 56b:	bb 00 00 00 00       	mov    $0x0,%ebx
 570:	89 de                	mov    %ebx,%esi
 572:	83 c3 01             	add    $0x1,%ebx
 575:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 578:	7d 2e                	jge    5a8 <gets+0x49>
    cc = read(0, &c, 1);
 57a:	83 ec 04             	sub    $0x4,%esp
 57d:	6a 01                	push   $0x1
 57f:	8d 45 e7             	lea    -0x19(%ebp),%eax
 582:	50                   	push   %eax
 583:	6a 00                	push   $0x0
 585:	e8 ec 00 00 00       	call   676 <read>
    if(cc < 1)
 58a:	83 c4 10             	add    $0x10,%esp
 58d:	85 c0                	test   %eax,%eax
 58f:	7e 17                	jle    5a8 <gets+0x49>
      break;
    buf[i++] = c;
 591:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 595:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 598:	3c 0a                	cmp    $0xa,%al
 59a:	0f 94 c2             	sete   %dl
 59d:	3c 0d                	cmp    $0xd,%al
 59f:	0f 94 c0             	sete   %al
 5a2:	08 c2                	or     %al,%dl
 5a4:	74 ca                	je     570 <gets+0x11>
    buf[i++] = c;
 5a6:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 5a8:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 5ac:	89 f8                	mov    %edi,%eax
 5ae:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5b1:	5b                   	pop    %ebx
 5b2:	5e                   	pop    %esi
 5b3:	5f                   	pop    %edi
 5b4:	5d                   	pop    %ebp
 5b5:	c3                   	ret    

000005b6 <stat>:

int
stat(const char *n, struct stat *st)
{
 5b6:	55                   	push   %ebp
 5b7:	89 e5                	mov    %esp,%ebp
 5b9:	56                   	push   %esi
 5ba:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 5bb:	83 ec 08             	sub    $0x8,%esp
 5be:	6a 00                	push   $0x0
 5c0:	ff 75 08             	push   0x8(%ebp)
 5c3:	e8 d6 00 00 00       	call   69e <open>
  if(fd < 0)
 5c8:	83 c4 10             	add    $0x10,%esp
 5cb:	85 c0                	test   %eax,%eax
 5cd:	78 24                	js     5f3 <stat+0x3d>
 5cf:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 5d1:	83 ec 08             	sub    $0x8,%esp
 5d4:	ff 75 0c             	push   0xc(%ebp)
 5d7:	50                   	push   %eax
 5d8:	e8 d9 00 00 00       	call   6b6 <fstat>
 5dd:	89 c6                	mov    %eax,%esi
  close(fd);
 5df:	89 1c 24             	mov    %ebx,(%esp)
 5e2:	e8 9f 00 00 00       	call   686 <close>
  return r;
 5e7:	83 c4 10             	add    $0x10,%esp
}
 5ea:	89 f0                	mov    %esi,%eax
 5ec:	8d 65 f8             	lea    -0x8(%ebp),%esp
 5ef:	5b                   	pop    %ebx
 5f0:	5e                   	pop    %esi
 5f1:	5d                   	pop    %ebp
 5f2:	c3                   	ret    
    return -1;
 5f3:	be ff ff ff ff       	mov    $0xffffffff,%esi
 5f8:	eb f0                	jmp    5ea <stat+0x34>

000005fa <atoi>:

int
atoi(const char *s)
{
 5fa:	55                   	push   %ebp
 5fb:	89 e5                	mov    %esp,%ebp
 5fd:	53                   	push   %ebx
 5fe:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 601:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 606:	eb 10                	jmp    618 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 608:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 60b:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 60e:	83 c1 01             	add    $0x1,%ecx
 611:	0f be c0             	movsbl %al,%eax
 614:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 618:	0f b6 01             	movzbl (%ecx),%eax
 61b:	8d 58 d0             	lea    -0x30(%eax),%ebx
 61e:	80 fb 09             	cmp    $0x9,%bl
 621:	76 e5                	jbe    608 <atoi+0xe>
  return n;
}
 623:	89 d0                	mov    %edx,%eax
 625:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 628:	c9                   	leave  
 629:	c3                   	ret    

0000062a <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 62a:	55                   	push   %ebp
 62b:	89 e5                	mov    %esp,%ebp
 62d:	56                   	push   %esi
 62e:	53                   	push   %ebx
 62f:	8b 75 08             	mov    0x8(%ebp),%esi
 632:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 635:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 638:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 63a:	eb 0d                	jmp    649 <memmove+0x1f>
    *dst++ = *src++;
 63c:	0f b6 01             	movzbl (%ecx),%eax
 63f:	88 02                	mov    %al,(%edx)
 641:	8d 49 01             	lea    0x1(%ecx),%ecx
 644:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 647:	89 d8                	mov    %ebx,%eax
 649:	8d 58 ff             	lea    -0x1(%eax),%ebx
 64c:	85 c0                	test   %eax,%eax
 64e:	7f ec                	jg     63c <memmove+0x12>
  return vdst;
}
 650:	89 f0                	mov    %esi,%eax
 652:	5b                   	pop    %ebx
 653:	5e                   	pop    %esi
 654:	5d                   	pop    %ebp
 655:	c3                   	ret    

00000656 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 656:	b8 01 00 00 00       	mov    $0x1,%eax
 65b:	cd 40                	int    $0x40
 65d:	c3                   	ret    

0000065e <exit>:
SYSCALL(exit)
 65e:	b8 02 00 00 00       	mov    $0x2,%eax
 663:	cd 40                	int    $0x40
 665:	c3                   	ret    

00000666 <wait>:
SYSCALL(wait)
 666:	b8 03 00 00 00       	mov    $0x3,%eax
 66b:	cd 40                	int    $0x40
 66d:	c3                   	ret    

0000066e <pipe>:
SYSCALL(pipe)
 66e:	b8 04 00 00 00       	mov    $0x4,%eax
 673:	cd 40                	int    $0x40
 675:	c3                   	ret    

00000676 <read>:
SYSCALL(read)
 676:	b8 05 00 00 00       	mov    $0x5,%eax
 67b:	cd 40                	int    $0x40
 67d:	c3                   	ret    

0000067e <write>:
SYSCALL(write)
 67e:	b8 10 00 00 00       	mov    $0x10,%eax
 683:	cd 40                	int    $0x40
 685:	c3                   	ret    

00000686 <close>:
SYSCALL(close)
 686:	b8 15 00 00 00       	mov    $0x15,%eax
 68b:	cd 40                	int    $0x40
 68d:	c3                   	ret    

0000068e <kill>:
SYSCALL(kill)
 68e:	b8 06 00 00 00       	mov    $0x6,%eax
 693:	cd 40                	int    $0x40
 695:	c3                   	ret    

00000696 <exec>:
SYSCALL(exec)
 696:	b8 07 00 00 00       	mov    $0x7,%eax
 69b:	cd 40                	int    $0x40
 69d:	c3                   	ret    

0000069e <open>:
SYSCALL(open)
 69e:	b8 0f 00 00 00       	mov    $0xf,%eax
 6a3:	cd 40                	int    $0x40
 6a5:	c3                   	ret    

000006a6 <mknod>:
SYSCALL(mknod)
 6a6:	b8 11 00 00 00       	mov    $0x11,%eax
 6ab:	cd 40                	int    $0x40
 6ad:	c3                   	ret    

000006ae <unlink>:
SYSCALL(unlink)
 6ae:	b8 12 00 00 00       	mov    $0x12,%eax
 6b3:	cd 40                	int    $0x40
 6b5:	c3                   	ret    

000006b6 <fstat>:
SYSCALL(fstat)
 6b6:	b8 08 00 00 00       	mov    $0x8,%eax
 6bb:	cd 40                	int    $0x40
 6bd:	c3                   	ret    

000006be <link>:
SYSCALL(link)
 6be:	b8 13 00 00 00       	mov    $0x13,%eax
 6c3:	cd 40                	int    $0x40
 6c5:	c3                   	ret    

000006c6 <mkdir>:
SYSCALL(mkdir)
 6c6:	b8 14 00 00 00       	mov    $0x14,%eax
 6cb:	cd 40                	int    $0x40
 6cd:	c3                   	ret    

000006ce <chdir>:
SYSCALL(chdir)
 6ce:	b8 09 00 00 00       	mov    $0x9,%eax
 6d3:	cd 40                	int    $0x40
 6d5:	c3                   	ret    

000006d6 <dup>:
SYSCALL(dup)
 6d6:	b8 0a 00 00 00       	mov    $0xa,%eax
 6db:	cd 40                	int    $0x40
 6dd:	c3                   	ret    

000006de <getpid>:
SYSCALL(getpid)
 6de:	b8 0b 00 00 00       	mov    $0xb,%eax
 6e3:	cd 40                	int    $0x40
 6e5:	c3                   	ret    

000006e6 <sbrk>:
SYSCALL(sbrk)
 6e6:	b8 0c 00 00 00       	mov    $0xc,%eax
 6eb:	cd 40                	int    $0x40
 6ed:	c3                   	ret    

000006ee <sleep>:
SYSCALL(sleep)
 6ee:	b8 0d 00 00 00       	mov    $0xd,%eax
 6f3:	cd 40                	int    $0x40
 6f5:	c3                   	ret    

000006f6 <uptime>:
SYSCALL(uptime)
 6f6:	b8 0e 00 00 00       	mov    $0xe,%eax
 6fb:	cd 40                	int    $0x40
 6fd:	c3                   	ret    

000006fe <clone>:
SYSCALL(clone)
 6fe:	b8 16 00 00 00       	mov    $0x16,%eax
 703:	cd 40                	int    $0x40
 705:	c3                   	ret    

00000706 <join>:
 706:	b8 17 00 00 00       	mov    $0x17,%eax
 70b:	cd 40                	int    $0x40
 70d:	c3                   	ret    

0000070e <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 70e:	55                   	push   %ebp
 70f:	89 e5                	mov    %esp,%ebp
 711:	83 ec 1c             	sub    $0x1c,%esp
 714:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 717:	6a 01                	push   $0x1
 719:	8d 55 f4             	lea    -0xc(%ebp),%edx
 71c:	52                   	push   %edx
 71d:	50                   	push   %eax
 71e:	e8 5b ff ff ff       	call   67e <write>
}
 723:	83 c4 10             	add    $0x10,%esp
 726:	c9                   	leave  
 727:	c3                   	ret    

00000728 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 728:	55                   	push   %ebp
 729:	89 e5                	mov    %esp,%ebp
 72b:	57                   	push   %edi
 72c:	56                   	push   %esi
 72d:	53                   	push   %ebx
 72e:	83 ec 2c             	sub    $0x2c,%esp
 731:	89 45 d0             	mov    %eax,-0x30(%ebp)
 734:	89 d0                	mov    %edx,%eax
 736:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 738:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 73c:	0f 95 c1             	setne  %cl
 73f:	c1 ea 1f             	shr    $0x1f,%edx
 742:	84 d1                	test   %dl,%cl
 744:	74 44                	je     78a <printint+0x62>
    neg = 1;
    x = -xx;
 746:	f7 d8                	neg    %eax
 748:	89 c1                	mov    %eax,%ecx
    neg = 1;
 74a:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 751:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 756:	89 c8                	mov    %ecx,%eax
 758:	ba 00 00 00 00       	mov    $0x0,%edx
 75d:	f7 f6                	div    %esi
 75f:	89 df                	mov    %ebx,%edi
 761:	83 c3 01             	add    $0x1,%ebx
 764:	0f b6 92 58 0b 00 00 	movzbl 0xb58(%edx),%edx
 76b:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 76f:	89 ca                	mov    %ecx,%edx
 771:	89 c1                	mov    %eax,%ecx
 773:	39 d6                	cmp    %edx,%esi
 775:	76 df                	jbe    756 <printint+0x2e>
  if(neg)
 777:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 77b:	74 31                	je     7ae <printint+0x86>
    buf[i++] = '-';
 77d:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 782:	8d 5f 02             	lea    0x2(%edi),%ebx
 785:	8b 75 d0             	mov    -0x30(%ebp),%esi
 788:	eb 17                	jmp    7a1 <printint+0x79>
    x = xx;
 78a:	89 c1                	mov    %eax,%ecx
  neg = 0;
 78c:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 793:	eb bc                	jmp    751 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 795:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 79a:	89 f0                	mov    %esi,%eax
 79c:	e8 6d ff ff ff       	call   70e <putc>
  while(--i >= 0)
 7a1:	83 eb 01             	sub    $0x1,%ebx
 7a4:	79 ef                	jns    795 <printint+0x6d>
}
 7a6:	83 c4 2c             	add    $0x2c,%esp
 7a9:	5b                   	pop    %ebx
 7aa:	5e                   	pop    %esi
 7ab:	5f                   	pop    %edi
 7ac:	5d                   	pop    %ebp
 7ad:	c3                   	ret    
 7ae:	8b 75 d0             	mov    -0x30(%ebp),%esi
 7b1:	eb ee                	jmp    7a1 <printint+0x79>

000007b3 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 7b3:	55                   	push   %ebp
 7b4:	89 e5                	mov    %esp,%ebp
 7b6:	57                   	push   %edi
 7b7:	56                   	push   %esi
 7b8:	53                   	push   %ebx
 7b9:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 7bc:	8d 45 10             	lea    0x10(%ebp),%eax
 7bf:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 7c2:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 7c7:	bb 00 00 00 00       	mov    $0x0,%ebx
 7cc:	eb 14                	jmp    7e2 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 7ce:	89 fa                	mov    %edi,%edx
 7d0:	8b 45 08             	mov    0x8(%ebp),%eax
 7d3:	e8 36 ff ff ff       	call   70e <putc>
 7d8:	eb 05                	jmp    7df <printf+0x2c>
      }
    } else if(state == '%'){
 7da:	83 fe 25             	cmp    $0x25,%esi
 7dd:	74 25                	je     804 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 7df:	83 c3 01             	add    $0x1,%ebx
 7e2:	8b 45 0c             	mov    0xc(%ebp),%eax
 7e5:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 7e9:	84 c0                	test   %al,%al
 7eb:	0f 84 20 01 00 00    	je     911 <printf+0x15e>
    c = fmt[i] & 0xff;
 7f1:	0f be f8             	movsbl %al,%edi
 7f4:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 7f7:	85 f6                	test   %esi,%esi
 7f9:	75 df                	jne    7da <printf+0x27>
      if(c == '%'){
 7fb:	83 f8 25             	cmp    $0x25,%eax
 7fe:	75 ce                	jne    7ce <printf+0x1b>
        state = '%';
 800:	89 c6                	mov    %eax,%esi
 802:	eb db                	jmp    7df <printf+0x2c>
      if(c == 'd'){
 804:	83 f8 25             	cmp    $0x25,%eax
 807:	0f 84 cf 00 00 00    	je     8dc <printf+0x129>
 80d:	0f 8c dd 00 00 00    	jl     8f0 <printf+0x13d>
 813:	83 f8 78             	cmp    $0x78,%eax
 816:	0f 8f d4 00 00 00    	jg     8f0 <printf+0x13d>
 81c:	83 f8 63             	cmp    $0x63,%eax
 81f:	0f 8c cb 00 00 00    	jl     8f0 <printf+0x13d>
 825:	83 e8 63             	sub    $0x63,%eax
 828:	83 f8 15             	cmp    $0x15,%eax
 82b:	0f 87 bf 00 00 00    	ja     8f0 <printf+0x13d>
 831:	ff 24 85 00 0b 00 00 	jmp    *0xb00(,%eax,4)
        printint(fd, *ap, 10, 1);
 838:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 83b:	8b 17                	mov    (%edi),%edx
 83d:	83 ec 0c             	sub    $0xc,%esp
 840:	6a 01                	push   $0x1
 842:	b9 0a 00 00 00       	mov    $0xa,%ecx
 847:	8b 45 08             	mov    0x8(%ebp),%eax
 84a:	e8 d9 fe ff ff       	call   728 <printint>
        ap++;
 84f:	83 c7 04             	add    $0x4,%edi
 852:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 855:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 858:	be 00 00 00 00       	mov    $0x0,%esi
 85d:	eb 80                	jmp    7df <printf+0x2c>
        printint(fd, *ap, 16, 0);
 85f:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 862:	8b 17                	mov    (%edi),%edx
 864:	83 ec 0c             	sub    $0xc,%esp
 867:	6a 00                	push   $0x0
 869:	b9 10 00 00 00       	mov    $0x10,%ecx
 86e:	8b 45 08             	mov    0x8(%ebp),%eax
 871:	e8 b2 fe ff ff       	call   728 <printint>
        ap++;
 876:	83 c7 04             	add    $0x4,%edi
 879:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 87c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 87f:	be 00 00 00 00       	mov    $0x0,%esi
 884:	e9 56 ff ff ff       	jmp    7df <printf+0x2c>
        s = (char*)*ap;
 889:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 88c:	8b 30                	mov    (%eax),%esi
        ap++;
 88e:	83 c0 04             	add    $0x4,%eax
 891:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 894:	85 f6                	test   %esi,%esi
 896:	75 15                	jne    8ad <printf+0xfa>
          s = "(null)";
 898:	be f6 0a 00 00       	mov    $0xaf6,%esi
 89d:	eb 0e                	jmp    8ad <printf+0xfa>
          putc(fd, *s);
 89f:	0f be d2             	movsbl %dl,%edx
 8a2:	8b 45 08             	mov    0x8(%ebp),%eax
 8a5:	e8 64 fe ff ff       	call   70e <putc>
          s++;
 8aa:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 8ad:	0f b6 16             	movzbl (%esi),%edx
 8b0:	84 d2                	test   %dl,%dl
 8b2:	75 eb                	jne    89f <printf+0xec>
      state = 0;
 8b4:	be 00 00 00 00       	mov    $0x0,%esi
 8b9:	e9 21 ff ff ff       	jmp    7df <printf+0x2c>
        putc(fd, *ap);
 8be:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 8c1:	0f be 17             	movsbl (%edi),%edx
 8c4:	8b 45 08             	mov    0x8(%ebp),%eax
 8c7:	e8 42 fe ff ff       	call   70e <putc>
        ap++;
 8cc:	83 c7 04             	add    $0x4,%edi
 8cf:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 8d2:	be 00 00 00 00       	mov    $0x0,%esi
 8d7:	e9 03 ff ff ff       	jmp    7df <printf+0x2c>
        putc(fd, c);
 8dc:	89 fa                	mov    %edi,%edx
 8de:	8b 45 08             	mov    0x8(%ebp),%eax
 8e1:	e8 28 fe ff ff       	call   70e <putc>
      state = 0;
 8e6:	be 00 00 00 00       	mov    $0x0,%esi
 8eb:	e9 ef fe ff ff       	jmp    7df <printf+0x2c>
        putc(fd, '%');
 8f0:	ba 25 00 00 00       	mov    $0x25,%edx
 8f5:	8b 45 08             	mov    0x8(%ebp),%eax
 8f8:	e8 11 fe ff ff       	call   70e <putc>
        putc(fd, c);
 8fd:	89 fa                	mov    %edi,%edx
 8ff:	8b 45 08             	mov    0x8(%ebp),%eax
 902:	e8 07 fe ff ff       	call   70e <putc>
      state = 0;
 907:	be 00 00 00 00       	mov    $0x0,%esi
 90c:	e9 ce fe ff ff       	jmp    7df <printf+0x2c>
    }
  }
}
 911:	8d 65 f4             	lea    -0xc(%ebp),%esp
 914:	5b                   	pop    %ebx
 915:	5e                   	pop    %esi
 916:	5f                   	pop    %edi
 917:	5d                   	pop    %ebp
 918:	c3                   	ret    

00000919 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 919:	55                   	push   %ebp
 91a:	89 e5                	mov    %esp,%ebp
 91c:	57                   	push   %edi
 91d:	56                   	push   %esi
 91e:	53                   	push   %ebx
 91f:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 922:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 925:	a1 40 10 00 00       	mov    0x1040,%eax
 92a:	eb 02                	jmp    92e <free+0x15>
 92c:	89 d0                	mov    %edx,%eax
 92e:	39 c8                	cmp    %ecx,%eax
 930:	73 04                	jae    936 <free+0x1d>
 932:	39 08                	cmp    %ecx,(%eax)
 934:	77 12                	ja     948 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 936:	8b 10                	mov    (%eax),%edx
 938:	39 c2                	cmp    %eax,%edx
 93a:	77 f0                	ja     92c <free+0x13>
 93c:	39 c8                	cmp    %ecx,%eax
 93e:	72 08                	jb     948 <free+0x2f>
 940:	39 ca                	cmp    %ecx,%edx
 942:	77 04                	ja     948 <free+0x2f>
 944:	89 d0                	mov    %edx,%eax
 946:	eb e6                	jmp    92e <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 948:	8b 73 fc             	mov    -0x4(%ebx),%esi
 94b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 94e:	8b 10                	mov    (%eax),%edx
 950:	39 d7                	cmp    %edx,%edi
 952:	74 19                	je     96d <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 954:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 957:	8b 50 04             	mov    0x4(%eax),%edx
 95a:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 95d:	39 ce                	cmp    %ecx,%esi
 95f:	74 1b                	je     97c <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 961:	89 08                	mov    %ecx,(%eax)
  freep = p;
 963:	a3 40 10 00 00       	mov    %eax,0x1040
}
 968:	5b                   	pop    %ebx
 969:	5e                   	pop    %esi
 96a:	5f                   	pop    %edi
 96b:	5d                   	pop    %ebp
 96c:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 96d:	03 72 04             	add    0x4(%edx),%esi
 970:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 973:	8b 10                	mov    (%eax),%edx
 975:	8b 12                	mov    (%edx),%edx
 977:	89 53 f8             	mov    %edx,-0x8(%ebx)
 97a:	eb db                	jmp    957 <free+0x3e>
    p->s.size += bp->s.size;
 97c:	03 53 fc             	add    -0x4(%ebx),%edx
 97f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 982:	8b 53 f8             	mov    -0x8(%ebx),%edx
 985:	89 10                	mov    %edx,(%eax)
 987:	eb da                	jmp    963 <free+0x4a>

00000989 <morecore>:

static Header*
morecore(uint nu)
{
 989:	55                   	push   %ebp
 98a:	89 e5                	mov    %esp,%ebp
 98c:	53                   	push   %ebx
 98d:	83 ec 04             	sub    $0x4,%esp
 990:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 992:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 997:	77 05                	ja     99e <morecore+0x15>
    nu = 4096;
 999:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 99e:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 9a5:	83 ec 0c             	sub    $0xc,%esp
 9a8:	50                   	push   %eax
 9a9:	e8 38 fd ff ff       	call   6e6 <sbrk>
  if(p == (char*)-1)
 9ae:	83 c4 10             	add    $0x10,%esp
 9b1:	83 f8 ff             	cmp    $0xffffffff,%eax
 9b4:	74 1c                	je     9d2 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 9b6:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 9b9:	83 c0 08             	add    $0x8,%eax
 9bc:	83 ec 0c             	sub    $0xc,%esp
 9bf:	50                   	push   %eax
 9c0:	e8 54 ff ff ff       	call   919 <free>
  return freep;
 9c5:	a1 40 10 00 00       	mov    0x1040,%eax
 9ca:	83 c4 10             	add    $0x10,%esp
}
 9cd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 9d0:	c9                   	leave  
 9d1:	c3                   	ret    
    return 0;
 9d2:	b8 00 00 00 00       	mov    $0x0,%eax
 9d7:	eb f4                	jmp    9cd <morecore+0x44>

000009d9 <malloc>:

void*
malloc(uint nbytes)
{
 9d9:	55                   	push   %ebp
 9da:	89 e5                	mov    %esp,%ebp
 9dc:	53                   	push   %ebx
 9dd:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9e0:	8b 45 08             	mov    0x8(%ebp),%eax
 9e3:	8d 58 07             	lea    0x7(%eax),%ebx
 9e6:	c1 eb 03             	shr    $0x3,%ebx
 9e9:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 9ec:	8b 0d 40 10 00 00    	mov    0x1040,%ecx
 9f2:	85 c9                	test   %ecx,%ecx
 9f4:	74 04                	je     9fa <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9f6:	8b 01                	mov    (%ecx),%eax
 9f8:	eb 4a                	jmp    a44 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 9fa:	c7 05 40 10 00 00 44 	movl   $0x1044,0x1040
 a01:	10 00 00 
 a04:	c7 05 44 10 00 00 44 	movl   $0x1044,0x1044
 a0b:	10 00 00 
    base.s.size = 0;
 a0e:	c7 05 48 10 00 00 00 	movl   $0x0,0x1048
 a15:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 a18:	b9 44 10 00 00       	mov    $0x1044,%ecx
 a1d:	eb d7                	jmp    9f6 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 a1f:	74 19                	je     a3a <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 a21:	29 da                	sub    %ebx,%edx
 a23:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 a26:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 a29:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 a2c:	89 0d 40 10 00 00    	mov    %ecx,0x1040
      return (void*)(p + 1);
 a32:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 a35:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 a38:	c9                   	leave  
 a39:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 a3a:	8b 10                	mov    (%eax),%edx
 a3c:	89 11                	mov    %edx,(%ecx)
 a3e:	eb ec                	jmp    a2c <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a40:	89 c1                	mov    %eax,%ecx
 a42:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 a44:	8b 50 04             	mov    0x4(%eax),%edx
 a47:	39 da                	cmp    %ebx,%edx
 a49:	73 d4                	jae    a1f <malloc+0x46>
    if(p == freep)
 a4b:	39 05 40 10 00 00    	cmp    %eax,0x1040
 a51:	75 ed                	jne    a40 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 a53:	89 d8                	mov    %ebx,%eax
 a55:	e8 2f ff ff ff       	call   989 <morecore>
 a5a:	85 c0                	test   %eax,%eax
 a5c:	75 e2                	jne    a40 <malloc+0x67>
 a5e:	eb d5                	jmp    a35 <malloc+0x5c>
