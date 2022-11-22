
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
   b:	e8 79 04 00 00       	call   489 <lock_acquire>
   assert((unsigned int)sbrk(0) == size);
  10:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  17:	e8 d2 06 00 00       	call   6ee <sbrk>
  1c:	83 c4 10             	add    $0x10,%esp
  1f:	3b 05 28 0f 00 00    	cmp    0xf28,%eax
  25:	74 49                	je     70 <worker2+0x70>
  27:	6a 31                	push   $0x31
  29:	68 68 0a 00 00       	push   $0xa68
  2e:	68 72 0a 00 00       	push   $0xa72
  33:	6a 01                	push   $0x1
  35:	e8 81 07 00 00       	call   7bb <printf>
  3a:	83 c4 0c             	add    $0xc,%esp
  3d:	68 7a 0a 00 00       	push   $0xa7a
  42:	68 98 0a 00 00       	push   $0xa98
  47:	6a 01                	push   $0x1
  49:	e8 6d 07 00 00       	call   7bb <printf>
  4e:	83 c4 08             	add    $0x8,%esp
  51:	68 ac 0a 00 00       	push   $0xaac
  56:	6a 01                	push   $0x1
  58:	e8 5e 07 00 00       	call   7bb <printf>
  5d:	83 c4 04             	add    $0x4,%esp
  60:	ff 35 30 0f 00 00    	push   0xf30
  66:	e8 2b 06 00 00       	call   696 <kill>
  6b:	e8 f6 05 00 00       	call   666 <exit>
   global++;
  70:	83 05 2c 0f 00 00 01 	addl   $0x1,0xf2c
   lock_release(&lock);
  77:	83 ec 0c             	sub    $0xc,%esp
  7a:	68 24 0f 00 00       	push   $0xf24
  7f:	e8 27 04 00 00       	call   4ab <lock_release>

   
   lock_acquire(&lock2);
  84:	c7 04 24 20 0f 00 00 	movl   $0xf20,(%esp)
  8b:	e8 f9 03 00 00       	call   489 <lock_acquire>
   assert((unsigned int)sbrk(0) == size);
  90:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  97:	e8 52 06 00 00       	call   6ee <sbrk>
  9c:	83 c4 10             	add    $0x10,%esp
  9f:	3b 05 28 0f 00 00    	cmp    0xf28,%eax
  a5:	74 49                	je     f0 <worker2+0xf0>
  a7:	6a 37                	push   $0x37
  a9:	68 68 0a 00 00       	push   $0xa68
  ae:	68 72 0a 00 00       	push   $0xa72
  b3:	6a 01                	push   $0x1
  b5:	e8 01 07 00 00       	call   7bb <printf>
  ba:	83 c4 0c             	add    $0xc,%esp
  bd:	68 7a 0a 00 00       	push   $0xa7a
  c2:	68 98 0a 00 00       	push   $0xa98
  c7:	6a 01                	push   $0x1
  c9:	e8 ed 06 00 00       	call   7bb <printf>
  ce:	83 c4 08             	add    $0x8,%esp
  d1:	68 ac 0a 00 00       	push   $0xaac
  d6:	6a 01                	push   $0x1
  d8:	e8 de 06 00 00       	call   7bb <printf>
  dd:	83 c4 04             	add    $0x4,%esp
  e0:	ff 35 30 0f 00 00    	push   0xf30
  e6:	e8 ab 05 00 00       	call   696 <kill>
  eb:	e8 76 05 00 00       	call   666 <exit>
   global++;
  f0:	83 05 2c 0f 00 00 01 	addl   $0x1,0xf2c
   lock_release(&lock2);
  f7:	83 ec 0c             	sub    $0xc,%esp
  fa:	68 20 0f 00 00       	push   $0xf20
  ff:	e8 a7 03 00 00       	call   4ab <lock_release>

   
   exit();
 104:	e8 5d 05 00 00       	call   666 <exit>

00000109 <worker>:
}


void worker(void *arg1, void *arg2) {
 109:	55                   	push   %ebp
 10a:	89 e5                	mov    %esp,%ebp
 10c:	83 ec 14             	sub    $0x14,%esp
   lock_init(&lock);
 10f:	68 24 0f 00 00       	push   $0xf24
 114:	e8 a0 03 00 00       	call   4b9 <lock_init>
   lock_init(&lock2);
 119:	c7 04 24 20 0f 00 00 	movl   $0xf20,(%esp)
 120:	e8 94 03 00 00       	call   4b9 <lock_init>
   lock_acquire(&lock);
 125:	c7 04 24 24 0f 00 00 	movl   $0xf24,(%esp)
 12c:	e8 58 03 00 00       	call   489 <lock_acquire>
   lock_acquire(&lock2);
 131:	c7 04 24 20 0f 00 00 	movl   $0xf20,(%esp)
 138:	e8 4c 03 00 00       	call   489 <lock_acquire>

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
 15a:	e8 8f 05 00 00       	call   6ee <sbrk>
 15f:	a3 28 0f 00 00       	mov    %eax,0xf28

   while (global < num_threads) {
 164:	83 c4 10             	add    $0x10,%esp
 167:	eb 71                	jmp    1da <worker+0xd1>
    assert(nested_thread_id > 0);
 169:	6a 47                	push   $0x47
 16b:	68 68 0a 00 00       	push   $0xa68
 170:	68 72 0a 00 00       	push   $0xa72
 175:	6a 01                	push   $0x1
 177:	e8 3f 06 00 00       	call   7bb <printf>
 17c:	83 c4 0c             	add    $0xc,%esp
 17f:	68 b9 0a 00 00       	push   $0xab9
 184:	68 98 0a 00 00       	push   $0xa98
 189:	6a 01                	push   $0x1
 18b:	e8 2b 06 00 00       	call   7bb <printf>
 190:	83 c4 08             	add    $0x8,%esp
 193:	68 ac 0a 00 00       	push   $0xaac
 198:	6a 01                	push   $0x1
 19a:	e8 1c 06 00 00       	call   7bb <printf>
 19f:	83 c4 04             	add    $0x4,%esp
 1a2:	ff 35 30 0f 00 00    	push   0xf30
 1a8:	e8 e9 04 00 00       	call   696 <kill>
 1ad:	e8 b4 04 00 00       	call   666 <exit>
      lock_release(&lock);
 1b2:	83 ec 0c             	sub    $0xc,%esp
 1b5:	68 24 0f 00 00       	push   $0xf24
 1ba:	e8 ec 02 00 00       	call   4ab <lock_release>
      sleep(100);
 1bf:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 1c6:	e8 2b 05 00 00       	call   6f6 <sleep>
      lock_acquire(&lock);
 1cb:	c7 04 24 24 0f 00 00 	movl   $0xf24,(%esp)
 1d2:	e8 b2 02 00 00       	call   489 <lock_acquire>
 1d7:	83 c4 10             	add    $0x10,%esp
   while (global < num_threads) {
 1da:	a1 08 0f 00 00       	mov    0xf08,%eax
 1df:	39 05 2c 0f 00 00    	cmp    %eax,0xf2c
 1e5:	7c cb                	jl     1b2 <worker+0xa9>
   }

   global = 0;
 1e7:	c7 05 2c 0f 00 00 00 	movl   $0x0,0xf2c
 1ee:	00 00 00 
   sbrk(10000);
 1f1:	83 ec 0c             	sub    $0xc,%esp
 1f4:	68 10 27 00 00       	push   $0x2710
 1f9:	e8 f0 04 00 00       	call   6ee <sbrk>
   size = (unsigned int)sbrk(0);
 1fe:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 205:	e8 e4 04 00 00       	call   6ee <sbrk>
 20a:	a3 28 0f 00 00       	mov    %eax,0xf28
   lock_release(&lock);
 20f:	c7 04 24 24 0f 00 00 	movl   $0xf24,(%esp)
 216:	e8 90 02 00 00       	call   4ab <lock_release>

   while (global < num_threads) {
 21b:	83 c4 10             	add    $0x10,%esp
 21e:	eb 28                	jmp    248 <worker+0x13f>
      lock_release(&lock2);
 220:	83 ec 0c             	sub    $0xc,%esp
 223:	68 20 0f 00 00       	push   $0xf20
 228:	e8 7e 02 00 00       	call   4ab <lock_release>
      sleep(100);
 22d:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 234:	e8 bd 04 00 00       	call   6f6 <sleep>
      lock_acquire(&lock2);
 239:	c7 04 24 20 0f 00 00 	movl   $0xf20,(%esp)
 240:	e8 44 02 00 00       	call   489 <lock_acquire>
 245:	83 c4 10             	add    $0x10,%esp
   while (global < num_threads) {
 248:	a1 08 0f 00 00       	mov    0xf08,%eax
 24d:	39 05 2c 0f 00 00    	cmp    %eax,0xf2c
 253:	7c cb                	jl     220 <worker+0x117>
   }
   lock_release(&lock2);
 255:	83 ec 0c             	sub    $0xc,%esp
 258:	68 20 0f 00 00       	push   $0xf20
 25d:	e8 49 02 00 00       	call   4ab <lock_release>

   int nested_join_pid = thread_join();
 262:	e8 d1 01 00 00       	call   438 <thread_join>
   assert(nested_join_pid > 0);
 267:	83 c4 10             	add    $0x10,%esp
 26a:	85 c0                	test   %eax,%eax
 26c:	7e 05                	jle    273 <worker+0x16a>




   exit();
 26e:	e8 f3 03 00 00       	call   666 <exit>
   assert(nested_join_pid > 0);
 273:	6a 5d                	push   $0x5d
 275:	68 68 0a 00 00       	push   $0xa68
 27a:	68 72 0a 00 00       	push   $0xa72
 27f:	6a 01                	push   $0x1
 281:	e8 35 05 00 00       	call   7bb <printf>
 286:	83 c4 0c             	add    $0xc,%esp
 289:	68 ce 0a 00 00       	push   $0xace
 28e:	68 98 0a 00 00       	push   $0xa98
 293:	6a 01                	push   $0x1
 295:	e8 21 05 00 00       	call   7bb <printf>
 29a:	83 c4 08             	add    $0x8,%esp
 29d:	68 ac 0a 00 00       	push   $0xaac
 2a2:	6a 01                	push   $0x1
 2a4:	e8 12 05 00 00       	call   7bb <printf>
 2a9:	83 c4 04             	add    $0x4,%esp
 2ac:	ff 35 30 0f 00 00    	push   0xf30
 2b2:	e8 df 03 00 00       	call   696 <kill>
 2b7:	e8 aa 03 00 00       	call   666 <exit>

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
 2cd:	e8 14 04 00 00       	call   6e6 <getpid>
 2d2:	a3 30 0f 00 00       	mov    %eax,0xf30
   int arg1 = 11, arg2 = 22;
 2d7:	c7 45 f4 0b 00 00 00 	movl   $0xb,-0xc(%ebp)
 2de:	c7 45 f0 16 00 00 00 	movl   $0x16,-0x10(%ebp)
   size = (unsigned int)sbrk(0);
 2e5:	83 ec 0c             	sub    $0xc,%esp
 2e8:	6a 00                	push   $0x0
 2ea:	e8 ff 03 00 00       	call   6ee <sbrk>
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
 310:	e8 23 01 00 00       	call   438 <thread_join>
   assert(join_pid > 0);
 315:	85 c0                	test   %eax,%eax
 317:	7e 5d                	jle    376 <main+0xba>
   printf(1, "TEST PASSED\n");
 319:	83 ec 08             	sub    $0x8,%esp
 31c:	68 f1 0a 00 00       	push   $0xaf1
 321:	6a 01                	push   $0x1
 323:	e8 93 04 00 00       	call   7bb <printf>
   exit();
 328:	e8 39 03 00 00       	call   666 <exit>
   assert(thread_pid > 0);
 32d:	6a 24                	push   $0x24
 32f:	68 68 0a 00 00       	push   $0xa68
 334:	68 72 0a 00 00       	push   $0xa72
 339:	6a 01                	push   $0x1
 33b:	e8 7b 04 00 00       	call   7bb <printf>
 340:	83 c4 0c             	add    $0xc,%esp
 343:	68 e2 0a 00 00       	push   $0xae2
 348:	68 98 0a 00 00       	push   $0xa98
 34d:	6a 01                	push   $0x1
 34f:	e8 67 04 00 00       	call   7bb <printf>
 354:	83 c4 08             	add    $0x8,%esp
 357:	68 ac 0a 00 00       	push   $0xaac
 35c:	6a 01                	push   $0x1
 35e:	e8 58 04 00 00       	call   7bb <printf>
 363:	83 c4 04             	add    $0x4,%esp
 366:	ff 35 30 0f 00 00    	push   0xf30
 36c:	e8 25 03 00 00       	call   696 <kill>
 371:	e8 f0 02 00 00       	call   666 <exit>
   assert(join_pid > 0);
 376:	6a 27                	push   $0x27
 378:	68 68 0a 00 00       	push   $0xa68
 37d:	68 72 0a 00 00       	push   $0xa72
 382:	6a 01                	push   $0x1
 384:	e8 32 04 00 00       	call   7bb <printf>
 389:	83 c4 0c             	add    $0xc,%esp
 38c:	68 d5 0a 00 00       	push   $0xad5
 391:	68 98 0a 00 00       	push   $0xa98
 396:	6a 01                	push   $0x1
 398:	e8 1e 04 00 00       	call   7bb <printf>
 39d:	83 c4 08             	add    $0x8,%esp
 3a0:	68 ac 0a 00 00       	push   $0xaac
 3a5:	6a 01                	push   $0x1
 3a7:	e8 0f 04 00 00       	call   7bb <printf>
 3ac:	83 c4 04             	add    $0x4,%esp
 3af:	ff 35 30 0f 00 00    	push   0xf30
 3b5:	e8 dc 02 00 00       	call   696 <kill>
 3ba:	e8 a7 02 00 00       	call   666 <exit>

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
 3d3:	83 ec 14             	sub    $0x14,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE*2);
 3d6:	68 00 20 00 00       	push   $0x2000
 3db:	e8 01 06 00 00       	call   9e1 <malloc>
  if(n_stack == 0){
 3e0:	83 c4 10             	add    $0x10,%esp
 3e3:	85 c0                	test   %eax,%eax
 3e5:	74 4a                	je     431 <thread_create+0x61>
    return -1;
  }
  
  for(int i=0; i<64; i++){
 3e7:	ba 00 00 00 00       	mov    $0x0,%edx
 3ec:	eb 03                	jmp    3f1 <thread_create+0x21>
 3ee:	83 c2 01             	add    $0x1,%edx
 3f1:	83 fa 3f             	cmp    $0x3f,%edx
 3f4:	7f 27                	jg     41d <thread_create+0x4d>
    if(threads[i]->flag==0){
 3f6:	8b 0c 95 40 0f 00 00 	mov    0xf40(,%edx,4),%ecx
 3fd:	83 79 08 00          	cmpl   $0x0,0x8(%ecx)
 401:	75 eb                	jne    3ee <thread_create+0x1e>
      threads[i]->maddr = n_stack;
 403:	89 01                	mov    %eax,(%ecx)
      threads[i]->pg1addr = n_stack;
 405:	8b 0c 95 40 0f 00 00 	mov    0xf40(,%edx,4),%ecx
 40c:	89 41 04             	mov    %eax,0x4(%ecx)
      threads[i]->flag = 1;
 40f:	8b 14 95 40 0f 00 00 	mov    0xf40(,%edx,4),%edx
 416:	c7 42 08 01 00 00 00 	movl   $0x1,0x8(%edx)
      break;
    }
  }
  
  int new_pid = clone(start_routine, arg1, arg2, n_stack); // TODO: is this the right way to call it?
 41d:	50                   	push   %eax
 41e:	ff 75 10             	push   0x10(%ebp)
 421:	ff 75 0c             	push   0xc(%ebp)
 424:	ff 75 08             	push   0x8(%ebp)
 427:	e8 da 02 00 00       	call   706 <clone>

  // I can't remember if there was something else to do here but I'm sure I'll find out



  return new_pid;
 42c:	83 c4 10             	add    $0x10,%esp
}
 42f:	c9                   	leave  
 430:	c3                   	ret    
    return -1;
 431:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 436:	eb f7                	jmp    42f <thread_create+0x5f>

00000438 <thread_join>:

//TODO: fix
int thread_join() {
 438:	55                   	push   %ebp
 439:	89 e5                	mov    %esp,%ebp
 43b:	56                   	push   %esi
 43c:	53                   	push   %ebx
 43d:	83 ec 1c             	sub    $0x1c,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 440:	8d 45 f4             	lea    -0xc(%ebp),%eax
 443:	50                   	push   %eax
 444:	e8 c5 02 00 00       	call   70e <join>
 449:	89 c6                	mov    %eax,%esi
  for(int i=0; i<64; i++){
 44b:	83 c4 10             	add    $0x10,%esp
 44e:	bb 00 00 00 00       	mov    $0x0,%ebx
 453:	eb 03                	jmp    458 <thread_join+0x20>
 455:	83 c3 01             	add    $0x1,%ebx
 458:	83 fb 3f             	cmp    $0x3f,%ebx
 45b:	7f 23                	jg     480 <thread_join+0x48>
    if((threads[i]->flag==1) && (stk_addr == threads[i]->pg1addr)){
 45d:	8b 04 9d 40 0f 00 00 	mov    0xf40(,%ebx,4),%eax
 464:	83 78 08 01          	cmpl   $0x1,0x8(%eax)
 468:	75 eb                	jne    455 <thread_join+0x1d>
 46a:	8b 55 f4             	mov    -0xc(%ebp),%edx
 46d:	39 50 04             	cmp    %edx,0x4(%eax)
 470:	75 e3                	jne    455 <thread_join+0x1d>
      free(stk_addr);
 472:	83 ec 0c             	sub    $0xc,%esp
 475:	52                   	push   %edx
 476:	e8 a6 04 00 00       	call   921 <free>
 47b:	83 c4 10             	add    $0x10,%esp
 47e:	eb d5                	jmp    455 <thread_join+0x1d>
    }
  }
  return pid;
}
 480:	89 f0                	mov    %esi,%eax
 482:	8d 65 f8             	lea    -0x8(%ebp),%esp
 485:	5b                   	pop    %ebx
 486:	5e                   	pop    %esi
 487:	5d                   	pop    %ebp
 488:	c3                   	ret    

00000489 <lock_acquire>:

void lock_acquire(lock_t *lock){
 489:	55                   	push   %ebp
 48a:	89 e5                	mov    %esp,%ebp
 48c:	53                   	push   %ebx
 48d:	83 ec 04             	sub    $0x4,%esp
 490:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 493:	83 ec 08             	sub    $0x8,%esp
 496:	6a 01                	push   $0x1
 498:	53                   	push   %ebx
 499:	e8 21 ff ff ff       	call   3bf <test_and_set>
 49e:	83 c4 10             	add    $0x10,%esp
 4a1:	83 f8 01             	cmp    $0x1,%eax
 4a4:	74 ed                	je     493 <lock_acquire+0xa>
    ;
}
 4a6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4a9:	c9                   	leave  
 4aa:	c3                   	ret    

000004ab <lock_release>:

void lock_release(lock_t *lock) {
 4ab:	55                   	push   %ebp
 4ac:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 4ae:	8b 45 08             	mov    0x8(%ebp),%eax
 4b1:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 4b7:	5d                   	pop    %ebp
 4b8:	c3                   	ret    

000004b9 <lock_init>:

void lock_init(lock_t *lock) {
 4b9:	55                   	push   %ebp
 4ba:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 4bc:	8b 45 08             	mov    0x8(%ebp),%eax
 4bf:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 4c5:	5d                   	pop    %ebp
 4c6:	c3                   	ret    

000004c7 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 4c7:	55                   	push   %ebp
 4c8:	89 e5                	mov    %esp,%ebp
 4ca:	56                   	push   %esi
 4cb:	53                   	push   %ebx
 4cc:	8b 75 08             	mov    0x8(%ebp),%esi
 4cf:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 4d2:	89 f0                	mov    %esi,%eax
 4d4:	89 d1                	mov    %edx,%ecx
 4d6:	83 c2 01             	add    $0x1,%edx
 4d9:	89 c3                	mov    %eax,%ebx
 4db:	83 c0 01             	add    $0x1,%eax
 4de:	0f b6 09             	movzbl (%ecx),%ecx
 4e1:	88 0b                	mov    %cl,(%ebx)
 4e3:	84 c9                	test   %cl,%cl
 4e5:	75 ed                	jne    4d4 <strcpy+0xd>
    ;
  return os;
}
 4e7:	89 f0                	mov    %esi,%eax
 4e9:	5b                   	pop    %ebx
 4ea:	5e                   	pop    %esi
 4eb:	5d                   	pop    %ebp
 4ec:	c3                   	ret    

000004ed <strcmp>:

int
strcmp(const char *p, const char *q)
{
 4ed:	55                   	push   %ebp
 4ee:	89 e5                	mov    %esp,%ebp
 4f0:	8b 4d 08             	mov    0x8(%ebp),%ecx
 4f3:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 4f6:	eb 06                	jmp    4fe <strcmp+0x11>
    p++, q++;
 4f8:	83 c1 01             	add    $0x1,%ecx
 4fb:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 4fe:	0f b6 01             	movzbl (%ecx),%eax
 501:	84 c0                	test   %al,%al
 503:	74 04                	je     509 <strcmp+0x1c>
 505:	3a 02                	cmp    (%edx),%al
 507:	74 ef                	je     4f8 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 509:	0f b6 c0             	movzbl %al,%eax
 50c:	0f b6 12             	movzbl (%edx),%edx
 50f:	29 d0                	sub    %edx,%eax
}
 511:	5d                   	pop    %ebp
 512:	c3                   	ret    

00000513 <strlen>:

uint
strlen(const char *s)
{
 513:	55                   	push   %ebp
 514:	89 e5                	mov    %esp,%ebp
 516:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 519:	b8 00 00 00 00       	mov    $0x0,%eax
 51e:	eb 03                	jmp    523 <strlen+0x10>
 520:	83 c0 01             	add    $0x1,%eax
 523:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 527:	75 f7                	jne    520 <strlen+0xd>
    ;
  return n;
}
 529:	5d                   	pop    %ebp
 52a:	c3                   	ret    

0000052b <memset>:

void*
memset(void *dst, int c, uint n)
{
 52b:	55                   	push   %ebp
 52c:	89 e5                	mov    %esp,%ebp
 52e:	57                   	push   %edi
 52f:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 532:	89 d7                	mov    %edx,%edi
 534:	8b 4d 10             	mov    0x10(%ebp),%ecx
 537:	8b 45 0c             	mov    0xc(%ebp),%eax
 53a:	fc                   	cld    
 53b:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 53d:	89 d0                	mov    %edx,%eax
 53f:	8b 7d fc             	mov    -0x4(%ebp),%edi
 542:	c9                   	leave  
 543:	c3                   	ret    

00000544 <strchr>:

char*
strchr(const char *s, char c)
{
 544:	55                   	push   %ebp
 545:	89 e5                	mov    %esp,%ebp
 547:	8b 45 08             	mov    0x8(%ebp),%eax
 54a:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 54e:	eb 03                	jmp    553 <strchr+0xf>
 550:	83 c0 01             	add    $0x1,%eax
 553:	0f b6 10             	movzbl (%eax),%edx
 556:	84 d2                	test   %dl,%dl
 558:	74 06                	je     560 <strchr+0x1c>
    if(*s == c)
 55a:	38 ca                	cmp    %cl,%dl
 55c:	75 f2                	jne    550 <strchr+0xc>
 55e:	eb 05                	jmp    565 <strchr+0x21>
      return (char*)s;
  return 0;
 560:	b8 00 00 00 00       	mov    $0x0,%eax
}
 565:	5d                   	pop    %ebp
 566:	c3                   	ret    

00000567 <gets>:

char*
gets(char *buf, int max)
{
 567:	55                   	push   %ebp
 568:	89 e5                	mov    %esp,%ebp
 56a:	57                   	push   %edi
 56b:	56                   	push   %esi
 56c:	53                   	push   %ebx
 56d:	83 ec 1c             	sub    $0x1c,%esp
 570:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 573:	bb 00 00 00 00       	mov    $0x0,%ebx
 578:	89 de                	mov    %ebx,%esi
 57a:	83 c3 01             	add    $0x1,%ebx
 57d:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 580:	7d 2e                	jge    5b0 <gets+0x49>
    cc = read(0, &c, 1);
 582:	83 ec 04             	sub    $0x4,%esp
 585:	6a 01                	push   $0x1
 587:	8d 45 e7             	lea    -0x19(%ebp),%eax
 58a:	50                   	push   %eax
 58b:	6a 00                	push   $0x0
 58d:	e8 ec 00 00 00       	call   67e <read>
    if(cc < 1)
 592:	83 c4 10             	add    $0x10,%esp
 595:	85 c0                	test   %eax,%eax
 597:	7e 17                	jle    5b0 <gets+0x49>
      break;
    buf[i++] = c;
 599:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 59d:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 5a0:	3c 0a                	cmp    $0xa,%al
 5a2:	0f 94 c2             	sete   %dl
 5a5:	3c 0d                	cmp    $0xd,%al
 5a7:	0f 94 c0             	sete   %al
 5aa:	08 c2                	or     %al,%dl
 5ac:	74 ca                	je     578 <gets+0x11>
    buf[i++] = c;
 5ae:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 5b0:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 5b4:	89 f8                	mov    %edi,%eax
 5b6:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5b9:	5b                   	pop    %ebx
 5ba:	5e                   	pop    %esi
 5bb:	5f                   	pop    %edi
 5bc:	5d                   	pop    %ebp
 5bd:	c3                   	ret    

000005be <stat>:

int
stat(const char *n, struct stat *st)
{
 5be:	55                   	push   %ebp
 5bf:	89 e5                	mov    %esp,%ebp
 5c1:	56                   	push   %esi
 5c2:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 5c3:	83 ec 08             	sub    $0x8,%esp
 5c6:	6a 00                	push   $0x0
 5c8:	ff 75 08             	push   0x8(%ebp)
 5cb:	e8 d6 00 00 00       	call   6a6 <open>
  if(fd < 0)
 5d0:	83 c4 10             	add    $0x10,%esp
 5d3:	85 c0                	test   %eax,%eax
 5d5:	78 24                	js     5fb <stat+0x3d>
 5d7:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 5d9:	83 ec 08             	sub    $0x8,%esp
 5dc:	ff 75 0c             	push   0xc(%ebp)
 5df:	50                   	push   %eax
 5e0:	e8 d9 00 00 00       	call   6be <fstat>
 5e5:	89 c6                	mov    %eax,%esi
  close(fd);
 5e7:	89 1c 24             	mov    %ebx,(%esp)
 5ea:	e8 9f 00 00 00       	call   68e <close>
  return r;
 5ef:	83 c4 10             	add    $0x10,%esp
}
 5f2:	89 f0                	mov    %esi,%eax
 5f4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 5f7:	5b                   	pop    %ebx
 5f8:	5e                   	pop    %esi
 5f9:	5d                   	pop    %ebp
 5fa:	c3                   	ret    
    return -1;
 5fb:	be ff ff ff ff       	mov    $0xffffffff,%esi
 600:	eb f0                	jmp    5f2 <stat+0x34>

00000602 <atoi>:

int
atoi(const char *s)
{
 602:	55                   	push   %ebp
 603:	89 e5                	mov    %esp,%ebp
 605:	53                   	push   %ebx
 606:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 609:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 60e:	eb 10                	jmp    620 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 610:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 613:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 616:	83 c1 01             	add    $0x1,%ecx
 619:	0f be c0             	movsbl %al,%eax
 61c:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 620:	0f b6 01             	movzbl (%ecx),%eax
 623:	8d 58 d0             	lea    -0x30(%eax),%ebx
 626:	80 fb 09             	cmp    $0x9,%bl
 629:	76 e5                	jbe    610 <atoi+0xe>
  return n;
}
 62b:	89 d0                	mov    %edx,%eax
 62d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 630:	c9                   	leave  
 631:	c3                   	ret    

00000632 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 632:	55                   	push   %ebp
 633:	89 e5                	mov    %esp,%ebp
 635:	56                   	push   %esi
 636:	53                   	push   %ebx
 637:	8b 75 08             	mov    0x8(%ebp),%esi
 63a:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 63d:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 640:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 642:	eb 0d                	jmp    651 <memmove+0x1f>
    *dst++ = *src++;
 644:	0f b6 01             	movzbl (%ecx),%eax
 647:	88 02                	mov    %al,(%edx)
 649:	8d 49 01             	lea    0x1(%ecx),%ecx
 64c:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 64f:	89 d8                	mov    %ebx,%eax
 651:	8d 58 ff             	lea    -0x1(%eax),%ebx
 654:	85 c0                	test   %eax,%eax
 656:	7f ec                	jg     644 <memmove+0x12>
  return vdst;
}
 658:	89 f0                	mov    %esi,%eax
 65a:	5b                   	pop    %ebx
 65b:	5e                   	pop    %esi
 65c:	5d                   	pop    %ebp
 65d:	c3                   	ret    

0000065e <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 65e:	b8 01 00 00 00       	mov    $0x1,%eax
 663:	cd 40                	int    $0x40
 665:	c3                   	ret    

00000666 <exit>:
SYSCALL(exit)
 666:	b8 02 00 00 00       	mov    $0x2,%eax
 66b:	cd 40                	int    $0x40
 66d:	c3                   	ret    

0000066e <wait>:
SYSCALL(wait)
 66e:	b8 03 00 00 00       	mov    $0x3,%eax
 673:	cd 40                	int    $0x40
 675:	c3                   	ret    

00000676 <pipe>:
SYSCALL(pipe)
 676:	b8 04 00 00 00       	mov    $0x4,%eax
 67b:	cd 40                	int    $0x40
 67d:	c3                   	ret    

0000067e <read>:
SYSCALL(read)
 67e:	b8 05 00 00 00       	mov    $0x5,%eax
 683:	cd 40                	int    $0x40
 685:	c3                   	ret    

00000686 <write>:
SYSCALL(write)
 686:	b8 10 00 00 00       	mov    $0x10,%eax
 68b:	cd 40                	int    $0x40
 68d:	c3                   	ret    

0000068e <close>:
SYSCALL(close)
 68e:	b8 15 00 00 00       	mov    $0x15,%eax
 693:	cd 40                	int    $0x40
 695:	c3                   	ret    

00000696 <kill>:
SYSCALL(kill)
 696:	b8 06 00 00 00       	mov    $0x6,%eax
 69b:	cd 40                	int    $0x40
 69d:	c3                   	ret    

0000069e <exec>:
SYSCALL(exec)
 69e:	b8 07 00 00 00       	mov    $0x7,%eax
 6a3:	cd 40                	int    $0x40
 6a5:	c3                   	ret    

000006a6 <open>:
SYSCALL(open)
 6a6:	b8 0f 00 00 00       	mov    $0xf,%eax
 6ab:	cd 40                	int    $0x40
 6ad:	c3                   	ret    

000006ae <mknod>:
SYSCALL(mknod)
 6ae:	b8 11 00 00 00       	mov    $0x11,%eax
 6b3:	cd 40                	int    $0x40
 6b5:	c3                   	ret    

000006b6 <unlink>:
SYSCALL(unlink)
 6b6:	b8 12 00 00 00       	mov    $0x12,%eax
 6bb:	cd 40                	int    $0x40
 6bd:	c3                   	ret    

000006be <fstat>:
SYSCALL(fstat)
 6be:	b8 08 00 00 00       	mov    $0x8,%eax
 6c3:	cd 40                	int    $0x40
 6c5:	c3                   	ret    

000006c6 <link>:
SYSCALL(link)
 6c6:	b8 13 00 00 00       	mov    $0x13,%eax
 6cb:	cd 40                	int    $0x40
 6cd:	c3                   	ret    

000006ce <mkdir>:
SYSCALL(mkdir)
 6ce:	b8 14 00 00 00       	mov    $0x14,%eax
 6d3:	cd 40                	int    $0x40
 6d5:	c3                   	ret    

000006d6 <chdir>:
SYSCALL(chdir)
 6d6:	b8 09 00 00 00       	mov    $0x9,%eax
 6db:	cd 40                	int    $0x40
 6dd:	c3                   	ret    

000006de <dup>:
SYSCALL(dup)
 6de:	b8 0a 00 00 00       	mov    $0xa,%eax
 6e3:	cd 40                	int    $0x40
 6e5:	c3                   	ret    

000006e6 <getpid>:
SYSCALL(getpid)
 6e6:	b8 0b 00 00 00       	mov    $0xb,%eax
 6eb:	cd 40                	int    $0x40
 6ed:	c3                   	ret    

000006ee <sbrk>:
SYSCALL(sbrk)
 6ee:	b8 0c 00 00 00       	mov    $0xc,%eax
 6f3:	cd 40                	int    $0x40
 6f5:	c3                   	ret    

000006f6 <sleep>:
SYSCALL(sleep)
 6f6:	b8 0d 00 00 00       	mov    $0xd,%eax
 6fb:	cd 40                	int    $0x40
 6fd:	c3                   	ret    

000006fe <uptime>:
SYSCALL(uptime)
 6fe:	b8 0e 00 00 00       	mov    $0xe,%eax
 703:	cd 40                	int    $0x40
 705:	c3                   	ret    

00000706 <clone>:
SYSCALL(clone)
 706:	b8 16 00 00 00       	mov    $0x16,%eax
 70b:	cd 40                	int    $0x40
 70d:	c3                   	ret    

0000070e <join>:
 70e:	b8 17 00 00 00       	mov    $0x17,%eax
 713:	cd 40                	int    $0x40
 715:	c3                   	ret    

00000716 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 716:	55                   	push   %ebp
 717:	89 e5                	mov    %esp,%ebp
 719:	83 ec 1c             	sub    $0x1c,%esp
 71c:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 71f:	6a 01                	push   $0x1
 721:	8d 55 f4             	lea    -0xc(%ebp),%edx
 724:	52                   	push   %edx
 725:	50                   	push   %eax
 726:	e8 5b ff ff ff       	call   686 <write>
}
 72b:	83 c4 10             	add    $0x10,%esp
 72e:	c9                   	leave  
 72f:	c3                   	ret    

00000730 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 730:	55                   	push   %ebp
 731:	89 e5                	mov    %esp,%ebp
 733:	57                   	push   %edi
 734:	56                   	push   %esi
 735:	53                   	push   %ebx
 736:	83 ec 2c             	sub    $0x2c,%esp
 739:	89 45 d0             	mov    %eax,-0x30(%ebp)
 73c:	89 d0                	mov    %edx,%eax
 73e:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 740:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 744:	0f 95 c1             	setne  %cl
 747:	c1 ea 1f             	shr    $0x1f,%edx
 74a:	84 d1                	test   %dl,%cl
 74c:	74 44                	je     792 <printint+0x62>
    neg = 1;
    x = -xx;
 74e:	f7 d8                	neg    %eax
 750:	89 c1                	mov    %eax,%ecx
    neg = 1;
 752:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 759:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 75e:	89 c8                	mov    %ecx,%eax
 760:	ba 00 00 00 00       	mov    $0x0,%edx
 765:	f7 f6                	div    %esi
 767:	89 df                	mov    %ebx,%edi
 769:	83 c3 01             	add    $0x1,%ebx
 76c:	0f b6 92 60 0b 00 00 	movzbl 0xb60(%edx),%edx
 773:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 777:	89 ca                	mov    %ecx,%edx
 779:	89 c1                	mov    %eax,%ecx
 77b:	39 d6                	cmp    %edx,%esi
 77d:	76 df                	jbe    75e <printint+0x2e>
  if(neg)
 77f:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 783:	74 31                	je     7b6 <printint+0x86>
    buf[i++] = '-';
 785:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 78a:	8d 5f 02             	lea    0x2(%edi),%ebx
 78d:	8b 75 d0             	mov    -0x30(%ebp),%esi
 790:	eb 17                	jmp    7a9 <printint+0x79>
    x = xx;
 792:	89 c1                	mov    %eax,%ecx
  neg = 0;
 794:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 79b:	eb bc                	jmp    759 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 79d:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 7a2:	89 f0                	mov    %esi,%eax
 7a4:	e8 6d ff ff ff       	call   716 <putc>
  while(--i >= 0)
 7a9:	83 eb 01             	sub    $0x1,%ebx
 7ac:	79 ef                	jns    79d <printint+0x6d>
}
 7ae:	83 c4 2c             	add    $0x2c,%esp
 7b1:	5b                   	pop    %ebx
 7b2:	5e                   	pop    %esi
 7b3:	5f                   	pop    %edi
 7b4:	5d                   	pop    %ebp
 7b5:	c3                   	ret    
 7b6:	8b 75 d0             	mov    -0x30(%ebp),%esi
 7b9:	eb ee                	jmp    7a9 <printint+0x79>

000007bb <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 7bb:	55                   	push   %ebp
 7bc:	89 e5                	mov    %esp,%ebp
 7be:	57                   	push   %edi
 7bf:	56                   	push   %esi
 7c0:	53                   	push   %ebx
 7c1:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 7c4:	8d 45 10             	lea    0x10(%ebp),%eax
 7c7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 7ca:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 7cf:	bb 00 00 00 00       	mov    $0x0,%ebx
 7d4:	eb 14                	jmp    7ea <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 7d6:	89 fa                	mov    %edi,%edx
 7d8:	8b 45 08             	mov    0x8(%ebp),%eax
 7db:	e8 36 ff ff ff       	call   716 <putc>
 7e0:	eb 05                	jmp    7e7 <printf+0x2c>
      }
    } else if(state == '%'){
 7e2:	83 fe 25             	cmp    $0x25,%esi
 7e5:	74 25                	je     80c <printf+0x51>
  for(i = 0; fmt[i]; i++){
 7e7:	83 c3 01             	add    $0x1,%ebx
 7ea:	8b 45 0c             	mov    0xc(%ebp),%eax
 7ed:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 7f1:	84 c0                	test   %al,%al
 7f3:	0f 84 20 01 00 00    	je     919 <printf+0x15e>
    c = fmt[i] & 0xff;
 7f9:	0f be f8             	movsbl %al,%edi
 7fc:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 7ff:	85 f6                	test   %esi,%esi
 801:	75 df                	jne    7e2 <printf+0x27>
      if(c == '%'){
 803:	83 f8 25             	cmp    $0x25,%eax
 806:	75 ce                	jne    7d6 <printf+0x1b>
        state = '%';
 808:	89 c6                	mov    %eax,%esi
 80a:	eb db                	jmp    7e7 <printf+0x2c>
      if(c == 'd'){
 80c:	83 f8 25             	cmp    $0x25,%eax
 80f:	0f 84 cf 00 00 00    	je     8e4 <printf+0x129>
 815:	0f 8c dd 00 00 00    	jl     8f8 <printf+0x13d>
 81b:	83 f8 78             	cmp    $0x78,%eax
 81e:	0f 8f d4 00 00 00    	jg     8f8 <printf+0x13d>
 824:	83 f8 63             	cmp    $0x63,%eax
 827:	0f 8c cb 00 00 00    	jl     8f8 <printf+0x13d>
 82d:	83 e8 63             	sub    $0x63,%eax
 830:	83 f8 15             	cmp    $0x15,%eax
 833:	0f 87 bf 00 00 00    	ja     8f8 <printf+0x13d>
 839:	ff 24 85 08 0b 00 00 	jmp    *0xb08(,%eax,4)
        printint(fd, *ap, 10, 1);
 840:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 843:	8b 17                	mov    (%edi),%edx
 845:	83 ec 0c             	sub    $0xc,%esp
 848:	6a 01                	push   $0x1
 84a:	b9 0a 00 00 00       	mov    $0xa,%ecx
 84f:	8b 45 08             	mov    0x8(%ebp),%eax
 852:	e8 d9 fe ff ff       	call   730 <printint>
        ap++;
 857:	83 c7 04             	add    $0x4,%edi
 85a:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 85d:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 860:	be 00 00 00 00       	mov    $0x0,%esi
 865:	eb 80                	jmp    7e7 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 867:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 86a:	8b 17                	mov    (%edi),%edx
 86c:	83 ec 0c             	sub    $0xc,%esp
 86f:	6a 00                	push   $0x0
 871:	b9 10 00 00 00       	mov    $0x10,%ecx
 876:	8b 45 08             	mov    0x8(%ebp),%eax
 879:	e8 b2 fe ff ff       	call   730 <printint>
        ap++;
 87e:	83 c7 04             	add    $0x4,%edi
 881:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 884:	83 c4 10             	add    $0x10,%esp
      state = 0;
 887:	be 00 00 00 00       	mov    $0x0,%esi
 88c:	e9 56 ff ff ff       	jmp    7e7 <printf+0x2c>
        s = (char*)*ap;
 891:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 894:	8b 30                	mov    (%eax),%esi
        ap++;
 896:	83 c0 04             	add    $0x4,%eax
 899:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 89c:	85 f6                	test   %esi,%esi
 89e:	75 15                	jne    8b5 <printf+0xfa>
          s = "(null)";
 8a0:	be fe 0a 00 00       	mov    $0xafe,%esi
 8a5:	eb 0e                	jmp    8b5 <printf+0xfa>
          putc(fd, *s);
 8a7:	0f be d2             	movsbl %dl,%edx
 8aa:	8b 45 08             	mov    0x8(%ebp),%eax
 8ad:	e8 64 fe ff ff       	call   716 <putc>
          s++;
 8b2:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 8b5:	0f b6 16             	movzbl (%esi),%edx
 8b8:	84 d2                	test   %dl,%dl
 8ba:	75 eb                	jne    8a7 <printf+0xec>
      state = 0;
 8bc:	be 00 00 00 00       	mov    $0x0,%esi
 8c1:	e9 21 ff ff ff       	jmp    7e7 <printf+0x2c>
        putc(fd, *ap);
 8c6:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 8c9:	0f be 17             	movsbl (%edi),%edx
 8cc:	8b 45 08             	mov    0x8(%ebp),%eax
 8cf:	e8 42 fe ff ff       	call   716 <putc>
        ap++;
 8d4:	83 c7 04             	add    $0x4,%edi
 8d7:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 8da:	be 00 00 00 00       	mov    $0x0,%esi
 8df:	e9 03 ff ff ff       	jmp    7e7 <printf+0x2c>
        putc(fd, c);
 8e4:	89 fa                	mov    %edi,%edx
 8e6:	8b 45 08             	mov    0x8(%ebp),%eax
 8e9:	e8 28 fe ff ff       	call   716 <putc>
      state = 0;
 8ee:	be 00 00 00 00       	mov    $0x0,%esi
 8f3:	e9 ef fe ff ff       	jmp    7e7 <printf+0x2c>
        putc(fd, '%');
 8f8:	ba 25 00 00 00       	mov    $0x25,%edx
 8fd:	8b 45 08             	mov    0x8(%ebp),%eax
 900:	e8 11 fe ff ff       	call   716 <putc>
        putc(fd, c);
 905:	89 fa                	mov    %edi,%edx
 907:	8b 45 08             	mov    0x8(%ebp),%eax
 90a:	e8 07 fe ff ff       	call   716 <putc>
      state = 0;
 90f:	be 00 00 00 00       	mov    $0x0,%esi
 914:	e9 ce fe ff ff       	jmp    7e7 <printf+0x2c>
    }
  }
}
 919:	8d 65 f4             	lea    -0xc(%ebp),%esp
 91c:	5b                   	pop    %ebx
 91d:	5e                   	pop    %esi
 91e:	5f                   	pop    %edi
 91f:	5d                   	pop    %ebp
 920:	c3                   	ret    

00000921 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 921:	55                   	push   %ebp
 922:	89 e5                	mov    %esp,%ebp
 924:	57                   	push   %edi
 925:	56                   	push   %esi
 926:	53                   	push   %ebx
 927:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 92a:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 92d:	a1 40 10 00 00       	mov    0x1040,%eax
 932:	eb 02                	jmp    936 <free+0x15>
 934:	89 d0                	mov    %edx,%eax
 936:	39 c8                	cmp    %ecx,%eax
 938:	73 04                	jae    93e <free+0x1d>
 93a:	39 08                	cmp    %ecx,(%eax)
 93c:	77 12                	ja     950 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 93e:	8b 10                	mov    (%eax),%edx
 940:	39 c2                	cmp    %eax,%edx
 942:	77 f0                	ja     934 <free+0x13>
 944:	39 c8                	cmp    %ecx,%eax
 946:	72 08                	jb     950 <free+0x2f>
 948:	39 ca                	cmp    %ecx,%edx
 94a:	77 04                	ja     950 <free+0x2f>
 94c:	89 d0                	mov    %edx,%eax
 94e:	eb e6                	jmp    936 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 950:	8b 73 fc             	mov    -0x4(%ebx),%esi
 953:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 956:	8b 10                	mov    (%eax),%edx
 958:	39 d7                	cmp    %edx,%edi
 95a:	74 19                	je     975 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 95c:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 95f:	8b 50 04             	mov    0x4(%eax),%edx
 962:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 965:	39 ce                	cmp    %ecx,%esi
 967:	74 1b                	je     984 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 969:	89 08                	mov    %ecx,(%eax)
  freep = p;
 96b:	a3 40 10 00 00       	mov    %eax,0x1040
}
 970:	5b                   	pop    %ebx
 971:	5e                   	pop    %esi
 972:	5f                   	pop    %edi
 973:	5d                   	pop    %ebp
 974:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 975:	03 72 04             	add    0x4(%edx),%esi
 978:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 97b:	8b 10                	mov    (%eax),%edx
 97d:	8b 12                	mov    (%edx),%edx
 97f:	89 53 f8             	mov    %edx,-0x8(%ebx)
 982:	eb db                	jmp    95f <free+0x3e>
    p->s.size += bp->s.size;
 984:	03 53 fc             	add    -0x4(%ebx),%edx
 987:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 98a:	8b 53 f8             	mov    -0x8(%ebx),%edx
 98d:	89 10                	mov    %edx,(%eax)
 98f:	eb da                	jmp    96b <free+0x4a>

00000991 <morecore>:

static Header*
morecore(uint nu)
{
 991:	55                   	push   %ebp
 992:	89 e5                	mov    %esp,%ebp
 994:	53                   	push   %ebx
 995:	83 ec 04             	sub    $0x4,%esp
 998:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 99a:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 99f:	77 05                	ja     9a6 <morecore+0x15>
    nu = 4096;
 9a1:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 9a6:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 9ad:	83 ec 0c             	sub    $0xc,%esp
 9b0:	50                   	push   %eax
 9b1:	e8 38 fd ff ff       	call   6ee <sbrk>
  if(p == (char*)-1)
 9b6:	83 c4 10             	add    $0x10,%esp
 9b9:	83 f8 ff             	cmp    $0xffffffff,%eax
 9bc:	74 1c                	je     9da <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 9be:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 9c1:	83 c0 08             	add    $0x8,%eax
 9c4:	83 ec 0c             	sub    $0xc,%esp
 9c7:	50                   	push   %eax
 9c8:	e8 54 ff ff ff       	call   921 <free>
  return freep;
 9cd:	a1 40 10 00 00       	mov    0x1040,%eax
 9d2:	83 c4 10             	add    $0x10,%esp
}
 9d5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 9d8:	c9                   	leave  
 9d9:	c3                   	ret    
    return 0;
 9da:	b8 00 00 00 00       	mov    $0x0,%eax
 9df:	eb f4                	jmp    9d5 <morecore+0x44>

000009e1 <malloc>:

void*
malloc(uint nbytes)
{
 9e1:	55                   	push   %ebp
 9e2:	89 e5                	mov    %esp,%ebp
 9e4:	53                   	push   %ebx
 9e5:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9e8:	8b 45 08             	mov    0x8(%ebp),%eax
 9eb:	8d 58 07             	lea    0x7(%eax),%ebx
 9ee:	c1 eb 03             	shr    $0x3,%ebx
 9f1:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 9f4:	8b 0d 40 10 00 00    	mov    0x1040,%ecx
 9fa:	85 c9                	test   %ecx,%ecx
 9fc:	74 04                	je     a02 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9fe:	8b 01                	mov    (%ecx),%eax
 a00:	eb 4a                	jmp    a4c <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 a02:	c7 05 40 10 00 00 44 	movl   $0x1044,0x1040
 a09:	10 00 00 
 a0c:	c7 05 44 10 00 00 44 	movl   $0x1044,0x1044
 a13:	10 00 00 
    base.s.size = 0;
 a16:	c7 05 48 10 00 00 00 	movl   $0x0,0x1048
 a1d:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 a20:	b9 44 10 00 00       	mov    $0x1044,%ecx
 a25:	eb d7                	jmp    9fe <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 a27:	74 19                	je     a42 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 a29:	29 da                	sub    %ebx,%edx
 a2b:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 a2e:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 a31:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 a34:	89 0d 40 10 00 00    	mov    %ecx,0x1040
      return (void*)(p + 1);
 a3a:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 a3d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 a40:	c9                   	leave  
 a41:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 a42:	8b 10                	mov    (%eax),%edx
 a44:	89 11                	mov    %edx,(%ecx)
 a46:	eb ec                	jmp    a34 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a48:	89 c1                	mov    %eax,%ecx
 a4a:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 a4c:	8b 50 04             	mov    0x4(%eax),%edx
 a4f:	39 da                	cmp    %ebx,%edx
 a51:	73 d4                	jae    a27 <malloc+0x46>
    if(p == freep)
 a53:	39 05 40 10 00 00    	cmp    %eax,0x1040
 a59:	75 ed                	jne    a48 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 a5b:	89 d8                	mov    %ebx,%eax
 a5d:	e8 2f ff ff ff       	call   991 <morecore>
 a62:	85 c0                	test   %eax,%eax
 a64:	75 e2                	jne    a48 <malloc+0x67>
 a66:	eb d5                	jmp    a3d <malloc+0x5c>
