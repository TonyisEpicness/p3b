
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
  1c:	a1 6c 0f 00 00       	mov    0xf6c,%eax
  21:	83 f8 02             	cmp    $0x2,%eax
  24:	0f 84 db 00 00 00    	je     105 <nested_worker+0x105>
  2a:	6a 30                	push   $0x30
  2c:	68 94 0a 00 00       	push   $0xa94
  31:	68 9e 0a 00 00       	push   $0xa9e
  36:	6a 01                	push   $0x1
  38:	e8 a9 07 00 00       	call   7e6 <printf>
  3d:	83 c4 0c             	add    $0xc,%esp
  40:	68 e5 0a 00 00       	push   $0xae5
  45:	68 b5 0a 00 00       	push   $0xab5
  4a:	6a 01                	push   $0x1
  4c:	e8 95 07 00 00       	call   7e6 <printf>
  51:	83 c4 08             	add    $0x8,%esp
  54:	68 c9 0a 00 00       	push   $0xac9
  59:	6a 01                	push   $0x1
  5b:	e8 86 07 00 00       	call   7e6 <printf>
  60:	83 c4 04             	add    $0x4,%esp
  63:	ff 35 80 0f 00 00    	push   0xf80
  69:	e8 53 06 00 00       	call   6c1 <kill>
  6e:	e8 1e 06 00 00       	call   691 <exit>
   assert(arg1_int == 35);
  73:	6a 2e                	push   $0x2e
  75:	68 94 0a 00 00       	push   $0xa94
  7a:	68 9e 0a 00 00       	push   $0xa9e
  7f:	6a 01                	push   $0x1
  81:	e8 60 07 00 00       	call   7e6 <printf>
  86:	83 c4 0c             	add    $0xc,%esp
  89:	68 a6 0a 00 00       	push   $0xaa6
  8e:	68 b5 0a 00 00       	push   $0xab5
  93:	6a 01                	push   $0x1
  95:	e8 4c 07 00 00       	call   7e6 <printf>
  9a:	83 c4 08             	add    $0x8,%esp
  9d:	68 c9 0a 00 00       	push   $0xac9
  a2:	6a 01                	push   $0x1
  a4:	e8 3d 07 00 00       	call   7e6 <printf>
  a9:	83 c4 04             	add    $0x4,%esp
  ac:	ff 35 80 0f 00 00    	push   0xf80
  b2:	e8 0a 06 00 00       	call   6c1 <kill>
  b7:	e8 d5 05 00 00       	call   691 <exit>
   assert(arg2_int == 42);
  bc:	6a 2f                	push   $0x2f
  be:	68 94 0a 00 00       	push   $0xa94
  c3:	68 9e 0a 00 00       	push   $0xa9e
  c8:	6a 01                	push   $0x1
  ca:	e8 17 07 00 00       	call   7e6 <printf>
  cf:	83 c4 0c             	add    $0xc,%esp
  d2:	68 d6 0a 00 00       	push   $0xad6
  d7:	68 b5 0a 00 00       	push   $0xab5
  dc:	6a 01                	push   $0x1
  de:	e8 03 07 00 00       	call   7e6 <printf>
  e3:	83 c4 08             	add    $0x8,%esp
  e6:	68 c9 0a 00 00       	push   $0xac9
  eb:	6a 01                	push   $0x1
  ed:	e8 f4 06 00 00       	call   7e6 <printf>
  f2:	83 c4 04             	add    $0x4,%esp
  f5:	ff 35 80 0f 00 00    	push   0xf80
  fb:	e8 c1 05 00 00       	call   6c1 <kill>
 100:	e8 8c 05 00 00       	call   691 <exit>
   global++;
 105:	83 c0 01             	add    $0x1,%eax
 108:	a3 6c 0f 00 00       	mov    %eax,0xf6c
   exit();
 10d:	e8 7f 05 00 00       	call   691 <exit>

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
 137:	a1 6c 0f 00 00       	mov    0xf6c,%eax
 13c:	83 f8 01             	cmp    $0x1,%eax
 13f:	0f 84 db 00 00 00    	je     220 <worker+0x10e>
 145:	6a 3b                	push   $0x3b
 147:	68 94 0a 00 00       	push   $0xa94
 14c:	68 9e 0a 00 00       	push   $0xa9e
 151:	6a 01                	push   $0x1
 153:	e8 8e 06 00 00       	call   7e6 <printf>
 158:	83 c4 0c             	add    $0xc,%esp
 15b:	68 f1 0a 00 00       	push   $0xaf1
 160:	68 b5 0a 00 00       	push   $0xab5
 165:	6a 01                	push   $0x1
 167:	e8 7a 06 00 00       	call   7e6 <printf>
 16c:	83 c4 08             	add    $0x8,%esp
 16f:	68 c9 0a 00 00       	push   $0xac9
 174:	6a 01                	push   $0x1
 176:	e8 6b 06 00 00       	call   7e6 <printf>
 17b:	83 c4 04             	add    $0x4,%esp
 17e:	ff 35 80 0f 00 00    	push   0xf80
 184:	e8 38 05 00 00       	call   6c1 <kill>
 189:	e8 03 05 00 00       	call   691 <exit>
   assert(arg1_int == 35);
 18e:	6a 39                	push   $0x39
 190:	68 94 0a 00 00       	push   $0xa94
 195:	68 9e 0a 00 00       	push   $0xa9e
 19a:	6a 01                	push   $0x1
 19c:	e8 45 06 00 00       	call   7e6 <printf>
 1a1:	83 c4 0c             	add    $0xc,%esp
 1a4:	68 a6 0a 00 00       	push   $0xaa6
 1a9:	68 b5 0a 00 00       	push   $0xab5
 1ae:	6a 01                	push   $0x1
 1b0:	e8 31 06 00 00       	call   7e6 <printf>
 1b5:	83 c4 08             	add    $0x8,%esp
 1b8:	68 c9 0a 00 00       	push   $0xac9
 1bd:	6a 01                	push   $0x1
 1bf:	e8 22 06 00 00       	call   7e6 <printf>
 1c4:	83 c4 04             	add    $0x4,%esp
 1c7:	ff 35 80 0f 00 00    	push   0xf80
 1cd:	e8 ef 04 00 00       	call   6c1 <kill>
 1d2:	e8 ba 04 00 00       	call   691 <exit>
   assert(arg2_int == 42);
 1d7:	6a 3a                	push   $0x3a
 1d9:	68 94 0a 00 00       	push   $0xa94
 1de:	68 9e 0a 00 00       	push   $0xa9e
 1e3:	6a 01                	push   $0x1
 1e5:	e8 fc 05 00 00       	call   7e6 <printf>
 1ea:	83 c4 0c             	add    $0xc,%esp
 1ed:	68 d6 0a 00 00       	push   $0xad6
 1f2:	68 b5 0a 00 00       	push   $0xab5
 1f7:	6a 01                	push   $0x1
 1f9:	e8 e8 05 00 00       	call   7e6 <printf>
 1fe:	83 c4 08             	add    $0x8,%esp
 201:	68 c9 0a 00 00       	push   $0xac9
 206:	6a 01                	push   $0x1
 208:	e8 d9 05 00 00       	call   7e6 <printf>
 20d:	83 c4 04             	add    $0x4,%esp
 210:	ff 35 80 0f 00 00    	push   0xf80
 216:	e8 a6 04 00 00       	call   6c1 <kill>
 21b:	e8 71 04 00 00       	call   691 <exit>
   global++;
 220:	83 c0 01             	add    $0x1,%eax
 223:	a3 6c 0f 00 00       	mov    %eax,0xf6c
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
 23f:	e8 1f 02 00 00       	call   463 <thread_join>
   assert(nested_join_pid == nested_thread_pid);
 244:	83 c4 10             	add    $0x10,%esp
 247:	39 c3                	cmp    %eax,%ebx
 249:	74 49                	je     294 <worker+0x182>
 24b:	6a 3f                	push   $0x3f
 24d:	68 94 0a 00 00       	push   $0xa94
 252:	68 9e 0a 00 00       	push   $0xa9e
 257:	6a 01                	push   $0x1
 259:	e8 88 05 00 00       	call   7e6 <printf>
 25e:	83 c4 0c             	add    $0xc,%esp
 261:	68 3c 0b 00 00       	push   $0xb3c
 266:	68 b5 0a 00 00       	push   $0xab5
 26b:	6a 01                	push   $0x1
 26d:	e8 74 05 00 00       	call   7e6 <printf>
 272:	83 c4 08             	add    $0x8,%esp
 275:	68 c9 0a 00 00       	push   $0xac9
 27a:	6a 01                	push   $0x1
 27c:	e8 65 05 00 00       	call   7e6 <printf>
 281:	83 c4 04             	add    $0x4,%esp
 284:	ff 35 80 0f 00 00    	push   0xf80
 28a:	e8 32 04 00 00       	call   6c1 <kill>
 28f:	e8 fd 03 00 00       	call   691 <exit>
   exit();
 294:	e8 f8 03 00 00       	call   691 <exit>

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
 2ab:	e8 61 04 00 00       	call   711 <getpid>
 2b0:	a3 80 0f 00 00       	mov    %eax,0xf80
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
 2e1:	e8 7d 01 00 00       	call   463 <thread_join>
   assert(join_pid == thread_pid);
 2e6:	39 c3                	cmp    %eax,%ebx
 2e8:	0f 85 9f 00 00 00    	jne    38d <main+0xf4>
   assert(global == 3);
 2ee:	83 3d 6c 0f 00 00 03 	cmpl   $0x3,0xf6c
 2f5:	0f 84 db 00 00 00    	je     3d6 <main+0x13d>
 2fb:	6a 24                	push   $0x24
 2fd:	68 94 0a 00 00       	push   $0xa94
 302:	68 9e 0a 00 00       	push   $0xa9e
 307:	6a 01                	push   $0x1
 309:	e8 d8 04 00 00       	call   7e6 <printf>
 30e:	83 c4 0c             	add    $0xc,%esp
 311:	68 23 0b 00 00       	push   $0xb23
 316:	68 b5 0a 00 00       	push   $0xab5
 31b:	6a 01                	push   $0x1
 31d:	e8 c4 04 00 00       	call   7e6 <printf>
 322:	83 c4 08             	add    $0x8,%esp
 325:	68 c9 0a 00 00       	push   $0xac9
 32a:	6a 01                	push   $0x1
 32c:	e8 b5 04 00 00       	call   7e6 <printf>
 331:	83 c4 04             	add    $0x4,%esp
 334:	ff 35 80 0f 00 00    	push   0xf80
 33a:	e8 82 03 00 00       	call   6c1 <kill>
 33f:	e8 4d 03 00 00       	call   691 <exit>
   assert(thread_pid > 0);
 344:	6a 20                	push   $0x20
 346:	68 94 0a 00 00       	push   $0xa94
 34b:	68 9e 0a 00 00       	push   $0xa9e
 350:	6a 01                	push   $0x1
 352:	e8 8f 04 00 00       	call   7e6 <printf>
 357:	83 c4 0c             	add    $0xc,%esp
 35a:	68 fd 0a 00 00       	push   $0xafd
 35f:	68 b5 0a 00 00       	push   $0xab5
 364:	6a 01                	push   $0x1
 366:	e8 7b 04 00 00       	call   7e6 <printf>
 36b:	83 c4 08             	add    $0x8,%esp
 36e:	68 c9 0a 00 00       	push   $0xac9
 373:	6a 01                	push   $0x1
 375:	e8 6c 04 00 00       	call   7e6 <printf>
 37a:	83 c4 04             	add    $0x4,%esp
 37d:	ff 35 80 0f 00 00    	push   0xf80
 383:	e8 39 03 00 00       	call   6c1 <kill>
 388:	e8 04 03 00 00       	call   691 <exit>
   assert(join_pid == thread_pid);
 38d:	6a 23                	push   $0x23
 38f:	68 94 0a 00 00       	push   $0xa94
 394:	68 9e 0a 00 00       	push   $0xa9e
 399:	6a 01                	push   $0x1
 39b:	e8 46 04 00 00       	call   7e6 <printf>
 3a0:	83 c4 0c             	add    $0xc,%esp
 3a3:	68 0c 0b 00 00       	push   $0xb0c
 3a8:	68 b5 0a 00 00       	push   $0xab5
 3ad:	6a 01                	push   $0x1
 3af:	e8 32 04 00 00       	call   7e6 <printf>
 3b4:	83 c4 08             	add    $0x8,%esp
 3b7:	68 c9 0a 00 00       	push   $0xac9
 3bc:	6a 01                	push   $0x1
 3be:	e8 23 04 00 00       	call   7e6 <printf>
 3c3:	83 c4 04             	add    $0x4,%esp
 3c6:	ff 35 80 0f 00 00    	push   0xf80
 3cc:	e8 f0 02 00 00       	call   6c1 <kill>
 3d1:	e8 bb 02 00 00       	call   691 <exit>
   printf(1, "TEST PASSED\n");
 3d6:	83 ec 08             	sub    $0x8,%esp
 3d9:	68 2f 0b 00 00       	push   $0xb2f
 3de:	6a 01                	push   $0x1
 3e0:	e8 01 04 00 00       	call   7e6 <printf>
   exit();
 3e5:	e8 a7 02 00 00       	call   691 <exit>

000003ea <test_and_set>:
  int flag;
};

struct thread_ref *threads[64];

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
  void *n_stack = malloc(PGSIZE*2);
 401:	68 00 20 00 00       	push   $0x2000
 406:	e8 01 06 00 00       	call   a0c <malloc>
  if(n_stack == 0){
 40b:	83 c4 10             	add    $0x10,%esp
 40e:	85 c0                	test   %eax,%eax
 410:	74 4a                	je     45c <thread_create+0x61>
    return -1;
  }
  
  for(int i=0; i<64; i++){
 412:	ba 00 00 00 00       	mov    $0x0,%edx
 417:	eb 03                	jmp    41c <thread_create+0x21>
 419:	83 c2 01             	add    $0x1,%edx
 41c:	83 fa 3f             	cmp    $0x3f,%edx
 41f:	7f 27                	jg     448 <thread_create+0x4d>
    if(threads[i]->flag==0){
 421:	8b 0c 95 a0 0f 00 00 	mov    0xfa0(,%edx,4),%ecx
 428:	83 79 08 00          	cmpl   $0x0,0x8(%ecx)
 42c:	75 eb                	jne    419 <thread_create+0x1e>
      threads[i]->maddr = n_stack;
 42e:	89 01                	mov    %eax,(%ecx)
      threads[i]->pg1addr = n_stack;
 430:	8b 0c 95 a0 0f 00 00 	mov    0xfa0(,%edx,4),%ecx
 437:	89 41 04             	mov    %eax,0x4(%ecx)
      threads[i]->flag = 1;
 43a:	8b 14 95 a0 0f 00 00 	mov    0xfa0(,%edx,4),%edx
 441:	c7 42 08 01 00 00 00 	movl   $0x1,0x8(%edx)
      break;
    }
  }
  
  int new_pid = clone(start_routine, arg1, arg2, n_stack); // TODO: is this the right way to call it?
 448:	50                   	push   %eax
 449:	ff 75 10             	push   0x10(%ebp)
 44c:	ff 75 0c             	push   0xc(%ebp)
 44f:	ff 75 08             	push   0x8(%ebp)
 452:	e8 da 02 00 00       	call   731 <clone>

  // I can't remember if there was something else to do here but I'm sure I'll find out



  return new_pid;
 457:	83 c4 10             	add    $0x10,%esp
}
 45a:	c9                   	leave  
 45b:	c3                   	ret    
    return -1;
 45c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 461:	eb f7                	jmp    45a <thread_create+0x5f>

00000463 <thread_join>:

//TODO: fix
int thread_join() {
 463:	55                   	push   %ebp
 464:	89 e5                	mov    %esp,%ebp
 466:	56                   	push   %esi
 467:	53                   	push   %ebx
 468:	83 ec 1c             	sub    $0x1c,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 46b:	8d 45 f4             	lea    -0xc(%ebp),%eax
 46e:	50                   	push   %eax
 46f:	e8 c5 02 00 00       	call   739 <join>
 474:	89 c6                	mov    %eax,%esi
  for(int i=0; i<64; i++){
 476:	83 c4 10             	add    $0x10,%esp
 479:	bb 00 00 00 00       	mov    $0x0,%ebx
 47e:	eb 03                	jmp    483 <thread_join+0x20>
 480:	83 c3 01             	add    $0x1,%ebx
 483:	83 fb 3f             	cmp    $0x3f,%ebx
 486:	7f 23                	jg     4ab <thread_join+0x48>
    if((threads[i]->flag==1) && (stk_addr == threads[i]->pg1addr)){
 488:	8b 04 9d a0 0f 00 00 	mov    0xfa0(,%ebx,4),%eax
 48f:	83 78 08 01          	cmpl   $0x1,0x8(%eax)
 493:	75 eb                	jne    480 <thread_join+0x1d>
 495:	8b 55 f4             	mov    -0xc(%ebp),%edx
 498:	39 50 04             	cmp    %edx,0x4(%eax)
 49b:	75 e3                	jne    480 <thread_join+0x1d>
      free(stk_addr);
 49d:	83 ec 0c             	sub    $0xc,%esp
 4a0:	52                   	push   %edx
 4a1:	e8 a6 04 00 00       	call   94c <free>
 4a6:	83 c4 10             	add    $0x10,%esp
 4a9:	eb d5                	jmp    480 <thread_join+0x1d>
    }
  }
  return pid;
}
 4ab:	89 f0                	mov    %esi,%eax
 4ad:	8d 65 f8             	lea    -0x8(%ebp),%esp
 4b0:	5b                   	pop    %ebx
 4b1:	5e                   	pop    %esi
 4b2:	5d                   	pop    %ebp
 4b3:	c3                   	ret    

000004b4 <lock_acquire>:

void lock_acquire(lock_t *lock){
 4b4:	55                   	push   %ebp
 4b5:	89 e5                	mov    %esp,%ebp
 4b7:	53                   	push   %ebx
 4b8:	83 ec 04             	sub    $0x4,%esp
 4bb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 4be:	83 ec 08             	sub    $0x8,%esp
 4c1:	6a 01                	push   $0x1
 4c3:	53                   	push   %ebx
 4c4:	e8 21 ff ff ff       	call   3ea <test_and_set>
 4c9:	83 c4 10             	add    $0x10,%esp
 4cc:	83 f8 01             	cmp    $0x1,%eax
 4cf:	74 ed                	je     4be <lock_acquire+0xa>
    ;
}
 4d1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4d4:	c9                   	leave  
 4d5:	c3                   	ret    

000004d6 <lock_release>:

void lock_release(lock_t *lock) {
 4d6:	55                   	push   %ebp
 4d7:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 4d9:	8b 45 08             	mov    0x8(%ebp),%eax
 4dc:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 4e2:	5d                   	pop    %ebp
 4e3:	c3                   	ret    

000004e4 <lock_init>:

void lock_init(lock_t *lock) {
 4e4:	55                   	push   %ebp
 4e5:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 4e7:	8b 45 08             	mov    0x8(%ebp),%eax
 4ea:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 4f0:	5d                   	pop    %ebp
 4f1:	c3                   	ret    

000004f2 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 4f2:	55                   	push   %ebp
 4f3:	89 e5                	mov    %esp,%ebp
 4f5:	56                   	push   %esi
 4f6:	53                   	push   %ebx
 4f7:	8b 75 08             	mov    0x8(%ebp),%esi
 4fa:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 4fd:	89 f0                	mov    %esi,%eax
 4ff:	89 d1                	mov    %edx,%ecx
 501:	83 c2 01             	add    $0x1,%edx
 504:	89 c3                	mov    %eax,%ebx
 506:	83 c0 01             	add    $0x1,%eax
 509:	0f b6 09             	movzbl (%ecx),%ecx
 50c:	88 0b                	mov    %cl,(%ebx)
 50e:	84 c9                	test   %cl,%cl
 510:	75 ed                	jne    4ff <strcpy+0xd>
    ;
  return os;
}
 512:	89 f0                	mov    %esi,%eax
 514:	5b                   	pop    %ebx
 515:	5e                   	pop    %esi
 516:	5d                   	pop    %ebp
 517:	c3                   	ret    

00000518 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 518:	55                   	push   %ebp
 519:	89 e5                	mov    %esp,%ebp
 51b:	8b 4d 08             	mov    0x8(%ebp),%ecx
 51e:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 521:	eb 06                	jmp    529 <strcmp+0x11>
    p++, q++;
 523:	83 c1 01             	add    $0x1,%ecx
 526:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 529:	0f b6 01             	movzbl (%ecx),%eax
 52c:	84 c0                	test   %al,%al
 52e:	74 04                	je     534 <strcmp+0x1c>
 530:	3a 02                	cmp    (%edx),%al
 532:	74 ef                	je     523 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 534:	0f b6 c0             	movzbl %al,%eax
 537:	0f b6 12             	movzbl (%edx),%edx
 53a:	29 d0                	sub    %edx,%eax
}
 53c:	5d                   	pop    %ebp
 53d:	c3                   	ret    

0000053e <strlen>:

uint
strlen(const char *s)
{
 53e:	55                   	push   %ebp
 53f:	89 e5                	mov    %esp,%ebp
 541:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 544:	b8 00 00 00 00       	mov    $0x0,%eax
 549:	eb 03                	jmp    54e <strlen+0x10>
 54b:	83 c0 01             	add    $0x1,%eax
 54e:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 552:	75 f7                	jne    54b <strlen+0xd>
    ;
  return n;
}
 554:	5d                   	pop    %ebp
 555:	c3                   	ret    

00000556 <memset>:

void*
memset(void *dst, int c, uint n)
{
 556:	55                   	push   %ebp
 557:	89 e5                	mov    %esp,%ebp
 559:	57                   	push   %edi
 55a:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 55d:	89 d7                	mov    %edx,%edi
 55f:	8b 4d 10             	mov    0x10(%ebp),%ecx
 562:	8b 45 0c             	mov    0xc(%ebp),%eax
 565:	fc                   	cld    
 566:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 568:	89 d0                	mov    %edx,%eax
 56a:	8b 7d fc             	mov    -0x4(%ebp),%edi
 56d:	c9                   	leave  
 56e:	c3                   	ret    

0000056f <strchr>:

char*
strchr(const char *s, char c)
{
 56f:	55                   	push   %ebp
 570:	89 e5                	mov    %esp,%ebp
 572:	8b 45 08             	mov    0x8(%ebp),%eax
 575:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 579:	eb 03                	jmp    57e <strchr+0xf>
 57b:	83 c0 01             	add    $0x1,%eax
 57e:	0f b6 10             	movzbl (%eax),%edx
 581:	84 d2                	test   %dl,%dl
 583:	74 06                	je     58b <strchr+0x1c>
    if(*s == c)
 585:	38 ca                	cmp    %cl,%dl
 587:	75 f2                	jne    57b <strchr+0xc>
 589:	eb 05                	jmp    590 <strchr+0x21>
      return (char*)s;
  return 0;
 58b:	b8 00 00 00 00       	mov    $0x0,%eax
}
 590:	5d                   	pop    %ebp
 591:	c3                   	ret    

00000592 <gets>:

char*
gets(char *buf, int max)
{
 592:	55                   	push   %ebp
 593:	89 e5                	mov    %esp,%ebp
 595:	57                   	push   %edi
 596:	56                   	push   %esi
 597:	53                   	push   %ebx
 598:	83 ec 1c             	sub    $0x1c,%esp
 59b:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 59e:	bb 00 00 00 00       	mov    $0x0,%ebx
 5a3:	89 de                	mov    %ebx,%esi
 5a5:	83 c3 01             	add    $0x1,%ebx
 5a8:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 5ab:	7d 2e                	jge    5db <gets+0x49>
    cc = read(0, &c, 1);
 5ad:	83 ec 04             	sub    $0x4,%esp
 5b0:	6a 01                	push   $0x1
 5b2:	8d 45 e7             	lea    -0x19(%ebp),%eax
 5b5:	50                   	push   %eax
 5b6:	6a 00                	push   $0x0
 5b8:	e8 ec 00 00 00       	call   6a9 <read>
    if(cc < 1)
 5bd:	83 c4 10             	add    $0x10,%esp
 5c0:	85 c0                	test   %eax,%eax
 5c2:	7e 17                	jle    5db <gets+0x49>
      break;
    buf[i++] = c;
 5c4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 5c8:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 5cb:	3c 0a                	cmp    $0xa,%al
 5cd:	0f 94 c2             	sete   %dl
 5d0:	3c 0d                	cmp    $0xd,%al
 5d2:	0f 94 c0             	sete   %al
 5d5:	08 c2                	or     %al,%dl
 5d7:	74 ca                	je     5a3 <gets+0x11>
    buf[i++] = c;
 5d9:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 5db:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 5df:	89 f8                	mov    %edi,%eax
 5e1:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5e4:	5b                   	pop    %ebx
 5e5:	5e                   	pop    %esi
 5e6:	5f                   	pop    %edi
 5e7:	5d                   	pop    %ebp
 5e8:	c3                   	ret    

000005e9 <stat>:

int
stat(const char *n, struct stat *st)
{
 5e9:	55                   	push   %ebp
 5ea:	89 e5                	mov    %esp,%ebp
 5ec:	56                   	push   %esi
 5ed:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 5ee:	83 ec 08             	sub    $0x8,%esp
 5f1:	6a 00                	push   $0x0
 5f3:	ff 75 08             	push   0x8(%ebp)
 5f6:	e8 d6 00 00 00       	call   6d1 <open>
  if(fd < 0)
 5fb:	83 c4 10             	add    $0x10,%esp
 5fe:	85 c0                	test   %eax,%eax
 600:	78 24                	js     626 <stat+0x3d>
 602:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 604:	83 ec 08             	sub    $0x8,%esp
 607:	ff 75 0c             	push   0xc(%ebp)
 60a:	50                   	push   %eax
 60b:	e8 d9 00 00 00       	call   6e9 <fstat>
 610:	89 c6                	mov    %eax,%esi
  close(fd);
 612:	89 1c 24             	mov    %ebx,(%esp)
 615:	e8 9f 00 00 00       	call   6b9 <close>
  return r;
 61a:	83 c4 10             	add    $0x10,%esp
}
 61d:	89 f0                	mov    %esi,%eax
 61f:	8d 65 f8             	lea    -0x8(%ebp),%esp
 622:	5b                   	pop    %ebx
 623:	5e                   	pop    %esi
 624:	5d                   	pop    %ebp
 625:	c3                   	ret    
    return -1;
 626:	be ff ff ff ff       	mov    $0xffffffff,%esi
 62b:	eb f0                	jmp    61d <stat+0x34>

0000062d <atoi>:

int
atoi(const char *s)
{
 62d:	55                   	push   %ebp
 62e:	89 e5                	mov    %esp,%ebp
 630:	53                   	push   %ebx
 631:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 634:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 639:	eb 10                	jmp    64b <atoi+0x1e>
    n = n*10 + *s++ - '0';
 63b:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 63e:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 641:	83 c1 01             	add    $0x1,%ecx
 644:	0f be c0             	movsbl %al,%eax
 647:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 64b:	0f b6 01             	movzbl (%ecx),%eax
 64e:	8d 58 d0             	lea    -0x30(%eax),%ebx
 651:	80 fb 09             	cmp    $0x9,%bl
 654:	76 e5                	jbe    63b <atoi+0xe>
  return n;
}
 656:	89 d0                	mov    %edx,%eax
 658:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 65b:	c9                   	leave  
 65c:	c3                   	ret    

0000065d <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 65d:	55                   	push   %ebp
 65e:	89 e5                	mov    %esp,%ebp
 660:	56                   	push   %esi
 661:	53                   	push   %ebx
 662:	8b 75 08             	mov    0x8(%ebp),%esi
 665:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 668:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 66b:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 66d:	eb 0d                	jmp    67c <memmove+0x1f>
    *dst++ = *src++;
 66f:	0f b6 01             	movzbl (%ecx),%eax
 672:	88 02                	mov    %al,(%edx)
 674:	8d 49 01             	lea    0x1(%ecx),%ecx
 677:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 67a:	89 d8                	mov    %ebx,%eax
 67c:	8d 58 ff             	lea    -0x1(%eax),%ebx
 67f:	85 c0                	test   %eax,%eax
 681:	7f ec                	jg     66f <memmove+0x12>
  return vdst;
}
 683:	89 f0                	mov    %esi,%eax
 685:	5b                   	pop    %ebx
 686:	5e                   	pop    %esi
 687:	5d                   	pop    %ebp
 688:	c3                   	ret    

00000689 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 689:	b8 01 00 00 00       	mov    $0x1,%eax
 68e:	cd 40                	int    $0x40
 690:	c3                   	ret    

00000691 <exit>:
SYSCALL(exit)
 691:	b8 02 00 00 00       	mov    $0x2,%eax
 696:	cd 40                	int    $0x40
 698:	c3                   	ret    

00000699 <wait>:
SYSCALL(wait)
 699:	b8 03 00 00 00       	mov    $0x3,%eax
 69e:	cd 40                	int    $0x40
 6a0:	c3                   	ret    

000006a1 <pipe>:
SYSCALL(pipe)
 6a1:	b8 04 00 00 00       	mov    $0x4,%eax
 6a6:	cd 40                	int    $0x40
 6a8:	c3                   	ret    

000006a9 <read>:
SYSCALL(read)
 6a9:	b8 05 00 00 00       	mov    $0x5,%eax
 6ae:	cd 40                	int    $0x40
 6b0:	c3                   	ret    

000006b1 <write>:
SYSCALL(write)
 6b1:	b8 10 00 00 00       	mov    $0x10,%eax
 6b6:	cd 40                	int    $0x40
 6b8:	c3                   	ret    

000006b9 <close>:
SYSCALL(close)
 6b9:	b8 15 00 00 00       	mov    $0x15,%eax
 6be:	cd 40                	int    $0x40
 6c0:	c3                   	ret    

000006c1 <kill>:
SYSCALL(kill)
 6c1:	b8 06 00 00 00       	mov    $0x6,%eax
 6c6:	cd 40                	int    $0x40
 6c8:	c3                   	ret    

000006c9 <exec>:
SYSCALL(exec)
 6c9:	b8 07 00 00 00       	mov    $0x7,%eax
 6ce:	cd 40                	int    $0x40
 6d0:	c3                   	ret    

000006d1 <open>:
SYSCALL(open)
 6d1:	b8 0f 00 00 00       	mov    $0xf,%eax
 6d6:	cd 40                	int    $0x40
 6d8:	c3                   	ret    

000006d9 <mknod>:
SYSCALL(mknod)
 6d9:	b8 11 00 00 00       	mov    $0x11,%eax
 6de:	cd 40                	int    $0x40
 6e0:	c3                   	ret    

000006e1 <unlink>:
SYSCALL(unlink)
 6e1:	b8 12 00 00 00       	mov    $0x12,%eax
 6e6:	cd 40                	int    $0x40
 6e8:	c3                   	ret    

000006e9 <fstat>:
SYSCALL(fstat)
 6e9:	b8 08 00 00 00       	mov    $0x8,%eax
 6ee:	cd 40                	int    $0x40
 6f0:	c3                   	ret    

000006f1 <link>:
SYSCALL(link)
 6f1:	b8 13 00 00 00       	mov    $0x13,%eax
 6f6:	cd 40                	int    $0x40
 6f8:	c3                   	ret    

000006f9 <mkdir>:
SYSCALL(mkdir)
 6f9:	b8 14 00 00 00       	mov    $0x14,%eax
 6fe:	cd 40                	int    $0x40
 700:	c3                   	ret    

00000701 <chdir>:
SYSCALL(chdir)
 701:	b8 09 00 00 00       	mov    $0x9,%eax
 706:	cd 40                	int    $0x40
 708:	c3                   	ret    

00000709 <dup>:
SYSCALL(dup)
 709:	b8 0a 00 00 00       	mov    $0xa,%eax
 70e:	cd 40                	int    $0x40
 710:	c3                   	ret    

00000711 <getpid>:
SYSCALL(getpid)
 711:	b8 0b 00 00 00       	mov    $0xb,%eax
 716:	cd 40                	int    $0x40
 718:	c3                   	ret    

00000719 <sbrk>:
SYSCALL(sbrk)
 719:	b8 0c 00 00 00       	mov    $0xc,%eax
 71e:	cd 40                	int    $0x40
 720:	c3                   	ret    

00000721 <sleep>:
SYSCALL(sleep)
 721:	b8 0d 00 00 00       	mov    $0xd,%eax
 726:	cd 40                	int    $0x40
 728:	c3                   	ret    

00000729 <uptime>:
SYSCALL(uptime)
 729:	b8 0e 00 00 00       	mov    $0xe,%eax
 72e:	cd 40                	int    $0x40
 730:	c3                   	ret    

00000731 <clone>:
SYSCALL(clone)
 731:	b8 16 00 00 00       	mov    $0x16,%eax
 736:	cd 40                	int    $0x40
 738:	c3                   	ret    

00000739 <join>:
 739:	b8 17 00 00 00       	mov    $0x17,%eax
 73e:	cd 40                	int    $0x40
 740:	c3                   	ret    

00000741 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 741:	55                   	push   %ebp
 742:	89 e5                	mov    %esp,%ebp
 744:	83 ec 1c             	sub    $0x1c,%esp
 747:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 74a:	6a 01                	push   $0x1
 74c:	8d 55 f4             	lea    -0xc(%ebp),%edx
 74f:	52                   	push   %edx
 750:	50                   	push   %eax
 751:	e8 5b ff ff ff       	call   6b1 <write>
}
 756:	83 c4 10             	add    $0x10,%esp
 759:	c9                   	leave  
 75a:	c3                   	ret    

0000075b <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 75b:	55                   	push   %ebp
 75c:	89 e5                	mov    %esp,%ebp
 75e:	57                   	push   %edi
 75f:	56                   	push   %esi
 760:	53                   	push   %ebx
 761:	83 ec 2c             	sub    $0x2c,%esp
 764:	89 45 d0             	mov    %eax,-0x30(%ebp)
 767:	89 d0                	mov    %edx,%eax
 769:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 76b:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 76f:	0f 95 c1             	setne  %cl
 772:	c1 ea 1f             	shr    $0x1f,%edx
 775:	84 d1                	test   %dl,%cl
 777:	74 44                	je     7bd <printint+0x62>
    neg = 1;
    x = -xx;
 779:	f7 d8                	neg    %eax
 77b:	89 c1                	mov    %eax,%ecx
    neg = 1;
 77d:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 784:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 789:	89 c8                	mov    %ecx,%eax
 78b:	ba 00 00 00 00       	mov    $0x0,%edx
 790:	f7 f6                	div    %esi
 792:	89 df                	mov    %ebx,%edi
 794:	83 c3 01             	add    $0x1,%ebx
 797:	0f b6 92 c0 0b 00 00 	movzbl 0xbc0(%edx),%edx
 79e:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 7a2:	89 ca                	mov    %ecx,%edx
 7a4:	89 c1                	mov    %eax,%ecx
 7a6:	39 d6                	cmp    %edx,%esi
 7a8:	76 df                	jbe    789 <printint+0x2e>
  if(neg)
 7aa:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 7ae:	74 31                	je     7e1 <printint+0x86>
    buf[i++] = '-';
 7b0:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 7b5:	8d 5f 02             	lea    0x2(%edi),%ebx
 7b8:	8b 75 d0             	mov    -0x30(%ebp),%esi
 7bb:	eb 17                	jmp    7d4 <printint+0x79>
    x = xx;
 7bd:	89 c1                	mov    %eax,%ecx
  neg = 0;
 7bf:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 7c6:	eb bc                	jmp    784 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 7c8:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 7cd:	89 f0                	mov    %esi,%eax
 7cf:	e8 6d ff ff ff       	call   741 <putc>
  while(--i >= 0)
 7d4:	83 eb 01             	sub    $0x1,%ebx
 7d7:	79 ef                	jns    7c8 <printint+0x6d>
}
 7d9:	83 c4 2c             	add    $0x2c,%esp
 7dc:	5b                   	pop    %ebx
 7dd:	5e                   	pop    %esi
 7de:	5f                   	pop    %edi
 7df:	5d                   	pop    %ebp
 7e0:	c3                   	ret    
 7e1:	8b 75 d0             	mov    -0x30(%ebp),%esi
 7e4:	eb ee                	jmp    7d4 <printint+0x79>

000007e6 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 7e6:	55                   	push   %ebp
 7e7:	89 e5                	mov    %esp,%ebp
 7e9:	57                   	push   %edi
 7ea:	56                   	push   %esi
 7eb:	53                   	push   %ebx
 7ec:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 7ef:	8d 45 10             	lea    0x10(%ebp),%eax
 7f2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 7f5:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 7fa:	bb 00 00 00 00       	mov    $0x0,%ebx
 7ff:	eb 14                	jmp    815 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 801:	89 fa                	mov    %edi,%edx
 803:	8b 45 08             	mov    0x8(%ebp),%eax
 806:	e8 36 ff ff ff       	call   741 <putc>
 80b:	eb 05                	jmp    812 <printf+0x2c>
      }
    } else if(state == '%'){
 80d:	83 fe 25             	cmp    $0x25,%esi
 810:	74 25                	je     837 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 812:	83 c3 01             	add    $0x1,%ebx
 815:	8b 45 0c             	mov    0xc(%ebp),%eax
 818:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 81c:	84 c0                	test   %al,%al
 81e:	0f 84 20 01 00 00    	je     944 <printf+0x15e>
    c = fmt[i] & 0xff;
 824:	0f be f8             	movsbl %al,%edi
 827:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 82a:	85 f6                	test   %esi,%esi
 82c:	75 df                	jne    80d <printf+0x27>
      if(c == '%'){
 82e:	83 f8 25             	cmp    $0x25,%eax
 831:	75 ce                	jne    801 <printf+0x1b>
        state = '%';
 833:	89 c6                	mov    %eax,%esi
 835:	eb db                	jmp    812 <printf+0x2c>
      if(c == 'd'){
 837:	83 f8 25             	cmp    $0x25,%eax
 83a:	0f 84 cf 00 00 00    	je     90f <printf+0x129>
 840:	0f 8c dd 00 00 00    	jl     923 <printf+0x13d>
 846:	83 f8 78             	cmp    $0x78,%eax
 849:	0f 8f d4 00 00 00    	jg     923 <printf+0x13d>
 84f:	83 f8 63             	cmp    $0x63,%eax
 852:	0f 8c cb 00 00 00    	jl     923 <printf+0x13d>
 858:	83 e8 63             	sub    $0x63,%eax
 85b:	83 f8 15             	cmp    $0x15,%eax
 85e:	0f 87 bf 00 00 00    	ja     923 <printf+0x13d>
 864:	ff 24 85 68 0b 00 00 	jmp    *0xb68(,%eax,4)
        printint(fd, *ap, 10, 1);
 86b:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 86e:	8b 17                	mov    (%edi),%edx
 870:	83 ec 0c             	sub    $0xc,%esp
 873:	6a 01                	push   $0x1
 875:	b9 0a 00 00 00       	mov    $0xa,%ecx
 87a:	8b 45 08             	mov    0x8(%ebp),%eax
 87d:	e8 d9 fe ff ff       	call   75b <printint>
        ap++;
 882:	83 c7 04             	add    $0x4,%edi
 885:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 888:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 88b:	be 00 00 00 00       	mov    $0x0,%esi
 890:	eb 80                	jmp    812 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 892:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 895:	8b 17                	mov    (%edi),%edx
 897:	83 ec 0c             	sub    $0xc,%esp
 89a:	6a 00                	push   $0x0
 89c:	b9 10 00 00 00       	mov    $0x10,%ecx
 8a1:	8b 45 08             	mov    0x8(%ebp),%eax
 8a4:	e8 b2 fe ff ff       	call   75b <printint>
        ap++;
 8a9:	83 c7 04             	add    $0x4,%edi
 8ac:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 8af:	83 c4 10             	add    $0x10,%esp
      state = 0;
 8b2:	be 00 00 00 00       	mov    $0x0,%esi
 8b7:	e9 56 ff ff ff       	jmp    812 <printf+0x2c>
        s = (char*)*ap;
 8bc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8bf:	8b 30                	mov    (%eax),%esi
        ap++;
 8c1:	83 c0 04             	add    $0x4,%eax
 8c4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 8c7:	85 f6                	test   %esi,%esi
 8c9:	75 15                	jne    8e0 <printf+0xfa>
          s = "(null)";
 8cb:	be 61 0b 00 00       	mov    $0xb61,%esi
 8d0:	eb 0e                	jmp    8e0 <printf+0xfa>
          putc(fd, *s);
 8d2:	0f be d2             	movsbl %dl,%edx
 8d5:	8b 45 08             	mov    0x8(%ebp),%eax
 8d8:	e8 64 fe ff ff       	call   741 <putc>
          s++;
 8dd:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 8e0:	0f b6 16             	movzbl (%esi),%edx
 8e3:	84 d2                	test   %dl,%dl
 8e5:	75 eb                	jne    8d2 <printf+0xec>
      state = 0;
 8e7:	be 00 00 00 00       	mov    $0x0,%esi
 8ec:	e9 21 ff ff ff       	jmp    812 <printf+0x2c>
        putc(fd, *ap);
 8f1:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 8f4:	0f be 17             	movsbl (%edi),%edx
 8f7:	8b 45 08             	mov    0x8(%ebp),%eax
 8fa:	e8 42 fe ff ff       	call   741 <putc>
        ap++;
 8ff:	83 c7 04             	add    $0x4,%edi
 902:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 905:	be 00 00 00 00       	mov    $0x0,%esi
 90a:	e9 03 ff ff ff       	jmp    812 <printf+0x2c>
        putc(fd, c);
 90f:	89 fa                	mov    %edi,%edx
 911:	8b 45 08             	mov    0x8(%ebp),%eax
 914:	e8 28 fe ff ff       	call   741 <putc>
      state = 0;
 919:	be 00 00 00 00       	mov    $0x0,%esi
 91e:	e9 ef fe ff ff       	jmp    812 <printf+0x2c>
        putc(fd, '%');
 923:	ba 25 00 00 00       	mov    $0x25,%edx
 928:	8b 45 08             	mov    0x8(%ebp),%eax
 92b:	e8 11 fe ff ff       	call   741 <putc>
        putc(fd, c);
 930:	89 fa                	mov    %edi,%edx
 932:	8b 45 08             	mov    0x8(%ebp),%eax
 935:	e8 07 fe ff ff       	call   741 <putc>
      state = 0;
 93a:	be 00 00 00 00       	mov    $0x0,%esi
 93f:	e9 ce fe ff ff       	jmp    812 <printf+0x2c>
    }
  }
}
 944:	8d 65 f4             	lea    -0xc(%ebp),%esp
 947:	5b                   	pop    %ebx
 948:	5e                   	pop    %esi
 949:	5f                   	pop    %edi
 94a:	5d                   	pop    %ebp
 94b:	c3                   	ret    

0000094c <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 94c:	55                   	push   %ebp
 94d:	89 e5                	mov    %esp,%ebp
 94f:	57                   	push   %edi
 950:	56                   	push   %esi
 951:	53                   	push   %ebx
 952:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 955:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 958:	a1 a0 10 00 00       	mov    0x10a0,%eax
 95d:	eb 02                	jmp    961 <free+0x15>
 95f:	89 d0                	mov    %edx,%eax
 961:	39 c8                	cmp    %ecx,%eax
 963:	73 04                	jae    969 <free+0x1d>
 965:	39 08                	cmp    %ecx,(%eax)
 967:	77 12                	ja     97b <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 969:	8b 10                	mov    (%eax),%edx
 96b:	39 c2                	cmp    %eax,%edx
 96d:	77 f0                	ja     95f <free+0x13>
 96f:	39 c8                	cmp    %ecx,%eax
 971:	72 08                	jb     97b <free+0x2f>
 973:	39 ca                	cmp    %ecx,%edx
 975:	77 04                	ja     97b <free+0x2f>
 977:	89 d0                	mov    %edx,%eax
 979:	eb e6                	jmp    961 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 97b:	8b 73 fc             	mov    -0x4(%ebx),%esi
 97e:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 981:	8b 10                	mov    (%eax),%edx
 983:	39 d7                	cmp    %edx,%edi
 985:	74 19                	je     9a0 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 987:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 98a:	8b 50 04             	mov    0x4(%eax),%edx
 98d:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 990:	39 ce                	cmp    %ecx,%esi
 992:	74 1b                	je     9af <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 994:	89 08                	mov    %ecx,(%eax)
  freep = p;
 996:	a3 a0 10 00 00       	mov    %eax,0x10a0
}
 99b:	5b                   	pop    %ebx
 99c:	5e                   	pop    %esi
 99d:	5f                   	pop    %edi
 99e:	5d                   	pop    %ebp
 99f:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 9a0:	03 72 04             	add    0x4(%edx),%esi
 9a3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 9a6:	8b 10                	mov    (%eax),%edx
 9a8:	8b 12                	mov    (%edx),%edx
 9aa:	89 53 f8             	mov    %edx,-0x8(%ebx)
 9ad:	eb db                	jmp    98a <free+0x3e>
    p->s.size += bp->s.size;
 9af:	03 53 fc             	add    -0x4(%ebx),%edx
 9b2:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 9b5:	8b 53 f8             	mov    -0x8(%ebx),%edx
 9b8:	89 10                	mov    %edx,(%eax)
 9ba:	eb da                	jmp    996 <free+0x4a>

000009bc <morecore>:

static Header*
morecore(uint nu)
{
 9bc:	55                   	push   %ebp
 9bd:	89 e5                	mov    %esp,%ebp
 9bf:	53                   	push   %ebx
 9c0:	83 ec 04             	sub    $0x4,%esp
 9c3:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 9c5:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 9ca:	77 05                	ja     9d1 <morecore+0x15>
    nu = 4096;
 9cc:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 9d1:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 9d8:	83 ec 0c             	sub    $0xc,%esp
 9db:	50                   	push   %eax
 9dc:	e8 38 fd ff ff       	call   719 <sbrk>
  if(p == (char*)-1)
 9e1:	83 c4 10             	add    $0x10,%esp
 9e4:	83 f8 ff             	cmp    $0xffffffff,%eax
 9e7:	74 1c                	je     a05 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 9e9:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 9ec:	83 c0 08             	add    $0x8,%eax
 9ef:	83 ec 0c             	sub    $0xc,%esp
 9f2:	50                   	push   %eax
 9f3:	e8 54 ff ff ff       	call   94c <free>
  return freep;
 9f8:	a1 a0 10 00 00       	mov    0x10a0,%eax
 9fd:	83 c4 10             	add    $0x10,%esp
}
 a00:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 a03:	c9                   	leave  
 a04:	c3                   	ret    
    return 0;
 a05:	b8 00 00 00 00       	mov    $0x0,%eax
 a0a:	eb f4                	jmp    a00 <morecore+0x44>

00000a0c <malloc>:

void*
malloc(uint nbytes)
{
 a0c:	55                   	push   %ebp
 a0d:	89 e5                	mov    %esp,%ebp
 a0f:	53                   	push   %ebx
 a10:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a13:	8b 45 08             	mov    0x8(%ebp),%eax
 a16:	8d 58 07             	lea    0x7(%eax),%ebx
 a19:	c1 eb 03             	shr    $0x3,%ebx
 a1c:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 a1f:	8b 0d a0 10 00 00    	mov    0x10a0,%ecx
 a25:	85 c9                	test   %ecx,%ecx
 a27:	74 04                	je     a2d <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a29:	8b 01                	mov    (%ecx),%eax
 a2b:	eb 4a                	jmp    a77 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 a2d:	c7 05 a0 10 00 00 a4 	movl   $0x10a4,0x10a0
 a34:	10 00 00 
 a37:	c7 05 a4 10 00 00 a4 	movl   $0x10a4,0x10a4
 a3e:	10 00 00 
    base.s.size = 0;
 a41:	c7 05 a8 10 00 00 00 	movl   $0x0,0x10a8
 a48:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 a4b:	b9 a4 10 00 00       	mov    $0x10a4,%ecx
 a50:	eb d7                	jmp    a29 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 a52:	74 19                	je     a6d <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 a54:	29 da                	sub    %ebx,%edx
 a56:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 a59:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 a5c:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 a5f:	89 0d a0 10 00 00    	mov    %ecx,0x10a0
      return (void*)(p + 1);
 a65:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 a68:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 a6b:	c9                   	leave  
 a6c:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 a6d:	8b 10                	mov    (%eax),%edx
 a6f:	89 11                	mov    %edx,(%ecx)
 a71:	eb ec                	jmp    a5f <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a73:	89 c1                	mov    %eax,%ecx
 a75:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 a77:	8b 50 04             	mov    0x4(%eax),%edx
 a7a:	39 da                	cmp    %ebx,%edx
 a7c:	73 d4                	jae    a52 <malloc+0x46>
    if(p == freep)
 a7e:	39 05 a0 10 00 00    	cmp    %eax,0x10a0
 a84:	75 ed                	jne    a73 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 a86:	89 d8                	mov    %ebx,%eax
 a88:	e8 2f ff ff ff       	call   9bc <morecore>
 a8d:	85 c0                	test   %eax,%eax
 a8f:	75 e2                	jne    a73 <malloc+0x67>
 a91:	eb d5                	jmp    a68 <malloc+0x5c>
