
_test_8:     file format elf32-i386


Disassembly of section .text:

00000000 <worker>:
   free(p);
   exit();
}

void
worker(void *arg1, void *arg2) {
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 08             	sub    $0x8,%esp
   int tmp1 = *(int*)arg1;
   int tmp2 = *(int*)arg2;
   6:	8b 45 0c             	mov    0xc(%ebp),%eax
   9:	8b 10                	mov    (%eax),%edx
   assert(tmp1 == 42);
   b:	8b 45 08             	mov    0x8(%ebp),%eax
   e:	83 38 2a             	cmpl   $0x2a,(%eax)
  11:	75 60                	jne    73 <worker+0x73>
   assert(tmp2 == 24);
  13:	83 fa 18             	cmp    $0x18,%edx
  16:	0f 85 a0 00 00 00    	jne    bc <worker+0xbc>
   assert(global == 1);
  1c:	a1 f4 0e 00 00       	mov    0xef4,%eax
  21:	83 f8 01             	cmp    $0x1,%eax
  24:	0f 84 db 00 00 00    	je     105 <worker+0x105>
  2a:	6a 3b                	push   $0x3b
  2c:	68 3c 0a 00 00       	push   $0xa3c
  31:	68 45 0a 00 00       	push   $0xa45
  36:	6a 01                	push   $0x1
  38:	e8 50 07 00 00       	call   78d <printf>
  3d:	83 c4 0c             	add    $0xc,%esp
  40:	68 84 0a 00 00       	push   $0xa84
  45:	68 58 0a 00 00       	push   $0xa58
  4a:	6a 01                	push   $0x1
  4c:	e8 3c 07 00 00       	call   78d <printf>
  51:	83 c4 08             	add    $0x8,%esp
  54:	68 6c 0a 00 00       	push   $0xa6c
  59:	6a 01                	push   $0x1
  5b:	e8 2d 07 00 00       	call   78d <printf>
  60:	83 c4 04             	add    $0x4,%esp
  63:	ff 35 00 0f 00 00    	push   0xf00
  69:	e8 fa 05 00 00       	call   668 <kill>
  6e:	e8 c5 05 00 00       	call   638 <exit>
   assert(tmp1 == 42);
  73:	6a 39                	push   $0x39
  75:	68 3c 0a 00 00       	push   $0xa3c
  7a:	68 45 0a 00 00       	push   $0xa45
  7f:	6a 01                	push   $0x1
  81:	e8 07 07 00 00       	call   78d <printf>
  86:	83 c4 0c             	add    $0xc,%esp
  89:	68 4d 0a 00 00       	push   $0xa4d
  8e:	68 58 0a 00 00       	push   $0xa58
  93:	6a 01                	push   $0x1
  95:	e8 f3 06 00 00       	call   78d <printf>
  9a:	83 c4 08             	add    $0x8,%esp
  9d:	68 6c 0a 00 00       	push   $0xa6c
  a2:	6a 01                	push   $0x1
  a4:	e8 e4 06 00 00       	call   78d <printf>
  a9:	83 c4 04             	add    $0x4,%esp
  ac:	ff 35 00 0f 00 00    	push   0xf00
  b2:	e8 b1 05 00 00       	call   668 <kill>
  b7:	e8 7c 05 00 00       	call   638 <exit>
   assert(tmp2 == 24);
  bc:	6a 3a                	push   $0x3a
  be:	68 3c 0a 00 00       	push   $0xa3c
  c3:	68 45 0a 00 00       	push   $0xa45
  c8:	6a 01                	push   $0x1
  ca:	e8 be 06 00 00       	call   78d <printf>
  cf:	83 c4 0c             	add    $0xc,%esp
  d2:	68 79 0a 00 00       	push   $0xa79
  d7:	68 58 0a 00 00       	push   $0xa58
  dc:	6a 01                	push   $0x1
  de:	e8 aa 06 00 00       	call   78d <printf>
  e3:	83 c4 08             	add    $0x8,%esp
  e6:	68 6c 0a 00 00       	push   $0xa6c
  eb:	6a 01                	push   $0x1
  ed:	e8 9b 06 00 00       	call   78d <printf>
  f2:	83 c4 04             	add    $0x4,%esp
  f5:	ff 35 00 0f 00 00    	push   0xf00
  fb:	e8 68 05 00 00       	call   668 <kill>
 100:	e8 33 05 00 00       	call   638 <exit>
   global++;
 105:	83 c0 01             	add    $0x1,%eax
 108:	a3 f4 0e 00 00       	mov    %eax,0xef4
   exit();
 10d:	e8 26 05 00 00       	call   638 <exit>

00000112 <main>:
{
 112:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 116:	83 e4 f0             	and    $0xfffffff0,%esp
 119:	ff 71 fc             	push   -0x4(%ecx)
 11c:	55                   	push   %ebp
 11d:	89 e5                	mov    %esp,%ebp
 11f:	57                   	push   %edi
 120:	56                   	push   %esi
 121:	53                   	push   %ebx
 122:	51                   	push   %ecx
 123:	83 ec 18             	sub    $0x18,%esp
   ppid = getpid();
 126:	e8 8d 05 00 00       	call   6b8 <getpid>
 12b:	a3 00 0f 00 00       	mov    %eax,0xf00
   void *stack, *p = malloc(PGSIZE * 2);
 130:	83 ec 0c             	sub    $0xc,%esp
 133:	68 00 20 00 00       	push   $0x2000
 138:	e8 76 08 00 00       	call   9b3 <malloc>
   assert(p != NULL);
 13d:	83 c4 10             	add    $0x10,%esp
 140:	85 c0                	test   %eax,%eax
 142:	74 14                	je     158 <main+0x46>
 144:	89 c3                	mov    %eax,%ebx
   if((uint)p % PGSIZE)
 146:	25 ff 0f 00 00       	and    $0xfff,%eax
 14b:	74 54                	je     1a1 <main+0x8f>
     stack = p + (PGSIZE - (uint)p % PGSIZE);
 14d:	bf 00 10 00 00       	mov    $0x1000,%edi
 152:	29 c7                	sub    %eax,%edi
 154:	01 df                	add    %ebx,%edi
 156:	eb 4b                	jmp    1a3 <main+0x91>
   assert(p != NULL);
 158:	6a 1d                	push   $0x1d
 15a:	68 3c 0a 00 00       	push   $0xa3c
 15f:	68 45 0a 00 00       	push   $0xa45
 164:	6a 01                	push   $0x1
 166:	e8 22 06 00 00       	call   78d <printf>
 16b:	83 c4 0c             	add    $0xc,%esp
 16e:	68 90 0a 00 00       	push   $0xa90
 173:	68 58 0a 00 00       	push   $0xa58
 178:	6a 01                	push   $0x1
 17a:	e8 0e 06 00 00       	call   78d <printf>
 17f:	83 c4 08             	add    $0x8,%esp
 182:	68 6c 0a 00 00       	push   $0xa6c
 187:	6a 01                	push   $0x1
 189:	e8 ff 05 00 00       	call   78d <printf>
 18e:	83 c4 04             	add    $0x4,%esp
 191:	ff 35 00 0f 00 00    	push   0xf00
 197:	e8 cc 04 00 00       	call   668 <kill>
 19c:	e8 97 04 00 00       	call   638 <exit>
     stack = p;
 1a1:	89 df                	mov    %ebx,%edi
   int arg1 = 42, arg2 = 24;
 1a3:	c7 45 e4 2a 00 00 00 	movl   $0x2a,-0x1c(%ebp)
 1aa:	c7 45 e0 18 00 00 00 	movl   $0x18,-0x20(%ebp)
   int clone_pid = clone(worker, &arg1, &arg2, stack);
 1b1:	57                   	push   %edi
 1b2:	8d 45 e0             	lea    -0x20(%ebp),%eax
 1b5:	50                   	push   %eax
 1b6:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 1b9:	50                   	push   %eax
 1ba:	68 00 00 00 00       	push   $0x0
 1bf:	e8 14 05 00 00       	call   6d8 <clone>
 1c4:	89 c6                	mov    %eax,%esi
   assert(clone_pid > 0);
 1c6:	83 c4 10             	add    $0x10,%esp
 1c9:	85 c0                	test   %eax,%eax
 1cb:	7e 67                	jle    234 <main+0x122>
   sleep(250);
 1cd:	83 ec 0c             	sub    $0xc,%esp
 1d0:	68 fa 00 00 00       	push   $0xfa
 1d5:	e8 ee 04 00 00       	call   6c8 <sleep>
   assert(wait() == -1);
 1da:	e8 61 04 00 00       	call   640 <wait>
 1df:	83 c4 10             	add    $0x10,%esp
 1e2:	83 f8 ff             	cmp    $0xffffffff,%eax
 1e5:	0f 84 92 00 00 00    	je     27d <main+0x16b>
 1eb:	6a 28                	push   $0x28
 1ed:	68 3c 0a 00 00       	push   $0xa3c
 1f2:	68 45 0a 00 00       	push   $0xa45
 1f7:	6a 01                	push   $0x1
 1f9:	e8 8f 05 00 00       	call   78d <printf>
 1fe:	83 c4 0c             	add    $0xc,%esp
 201:	68 a8 0a 00 00       	push   $0xaa8
 206:	68 58 0a 00 00       	push   $0xa58
 20b:	6a 01                	push   $0x1
 20d:	e8 7b 05 00 00       	call   78d <printf>
 212:	83 c4 08             	add    $0x8,%esp
 215:	68 6c 0a 00 00       	push   $0xa6c
 21a:	6a 01                	push   $0x1
 21c:	e8 6c 05 00 00       	call   78d <printf>
 221:	83 c4 04             	add    $0x4,%esp
 224:	ff 35 00 0f 00 00    	push   0xf00
 22a:	e8 39 04 00 00       	call   668 <kill>
 22f:	e8 04 04 00 00       	call   638 <exit>
   assert(clone_pid > 0);
 234:	6a 25                	push   $0x25
 236:	68 3c 0a 00 00       	push   $0xa3c
 23b:	68 45 0a 00 00       	push   $0xa45
 240:	6a 01                	push   $0x1
 242:	e8 46 05 00 00       	call   78d <printf>
 247:	83 c4 0c             	add    $0xc,%esp
 24a:	68 9a 0a 00 00       	push   $0xa9a
 24f:	68 58 0a 00 00       	push   $0xa58
 254:	6a 01                	push   $0x1
 256:	e8 32 05 00 00       	call   78d <printf>
 25b:	83 c4 08             	add    $0x8,%esp
 25e:	68 6c 0a 00 00       	push   $0xa6c
 263:	6a 01                	push   $0x1
 265:	e8 23 05 00 00       	call   78d <printf>
 26a:	83 c4 04             	add    $0x4,%esp
 26d:	ff 35 00 0f 00 00    	push   0xf00
 273:	e8 f0 03 00 00       	call   668 <kill>
 278:	e8 bb 03 00 00       	call   638 <exit>
   int join_pid = join(&join_stack);
 27d:	83 ec 0c             	sub    $0xc,%esp
 280:	8d 45 dc             	lea    -0x24(%ebp),%eax
 283:	50                   	push   %eax
 284:	e8 57 04 00 00       	call   6e0 <join>
   assert(join_pid == clone_pid);
 289:	83 c4 10             	add    $0x10,%esp
 28c:	39 c6                	cmp    %eax,%esi
 28e:	75 52                	jne    2e2 <main+0x1d0>
   assert(stack == join_stack);
 290:	39 7d dc             	cmp    %edi,-0x24(%ebp)
 293:	0f 84 92 00 00 00    	je     32b <main+0x219>
 299:	6a 2d                	push   $0x2d
 29b:	68 3c 0a 00 00       	push   $0xa3c
 2a0:	68 45 0a 00 00       	push   $0xa45
 2a5:	6a 01                	push   $0x1
 2a7:	e8 e1 04 00 00       	call   78d <printf>
 2ac:	83 c4 0c             	add    $0xc,%esp
 2af:	68 cb 0a 00 00       	push   $0xacb
 2b4:	68 58 0a 00 00       	push   $0xa58
 2b9:	6a 01                	push   $0x1
 2bb:	e8 cd 04 00 00       	call   78d <printf>
 2c0:	83 c4 08             	add    $0x8,%esp
 2c3:	68 6c 0a 00 00       	push   $0xa6c
 2c8:	6a 01                	push   $0x1
 2ca:	e8 be 04 00 00       	call   78d <printf>
 2cf:	83 c4 04             	add    $0x4,%esp
 2d2:	ff 35 00 0f 00 00    	push   0xf00
 2d8:	e8 8b 03 00 00       	call   668 <kill>
 2dd:	e8 56 03 00 00       	call   638 <exit>
   assert(join_pid == clone_pid);
 2e2:	6a 2c                	push   $0x2c
 2e4:	68 3c 0a 00 00       	push   $0xa3c
 2e9:	68 45 0a 00 00       	push   $0xa45
 2ee:	6a 01                	push   $0x1
 2f0:	e8 98 04 00 00       	call   78d <printf>
 2f5:	83 c4 0c             	add    $0xc,%esp
 2f8:	68 b5 0a 00 00       	push   $0xab5
 2fd:	68 58 0a 00 00       	push   $0xa58
 302:	6a 01                	push   $0x1
 304:	e8 84 04 00 00       	call   78d <printf>
 309:	83 c4 08             	add    $0x8,%esp
 30c:	68 6c 0a 00 00       	push   $0xa6c
 311:	6a 01                	push   $0x1
 313:	e8 75 04 00 00       	call   78d <printf>
 318:	83 c4 04             	add    $0x4,%esp
 31b:	ff 35 00 0f 00 00    	push   0xf00
 321:	e8 42 03 00 00       	call   668 <kill>
 326:	e8 0d 03 00 00       	call   638 <exit>
   assert(global == 2);
 32b:	83 3d f4 0e 00 00 02 	cmpl   $0x2,0xef4
 332:	74 49                	je     37d <main+0x26b>
 334:	6a 2e                	push   $0x2e
 336:	68 3c 0a 00 00       	push   $0xa3c
 33b:	68 45 0a 00 00       	push   $0xa45
 340:	6a 01                	push   $0x1
 342:	e8 46 04 00 00       	call   78d <printf>
 347:	83 c4 0c             	add    $0xc,%esp
 34a:	68 df 0a 00 00       	push   $0xadf
 34f:	68 58 0a 00 00       	push   $0xa58
 354:	6a 01                	push   $0x1
 356:	e8 32 04 00 00       	call   78d <printf>
 35b:	83 c4 08             	add    $0x8,%esp
 35e:	68 6c 0a 00 00       	push   $0xa6c
 363:	6a 01                	push   $0x1
 365:	e8 23 04 00 00       	call   78d <printf>
 36a:	83 c4 04             	add    $0x4,%esp
 36d:	ff 35 00 0f 00 00    	push   0xf00
 373:	e8 f0 02 00 00       	call   668 <kill>
 378:	e8 bb 02 00 00       	call   638 <exit>
   printf(1, "TEST PASSED\n");
 37d:	83 ec 08             	sub    $0x8,%esp
 380:	68 eb 0a 00 00       	push   $0xaeb
 385:	6a 01                	push   $0x1
 387:	e8 01 04 00 00       	call   78d <printf>
   free(p);
 38c:	89 1c 24             	mov    %ebx,(%esp)
 38f:	e8 5f 05 00 00       	call   8f3 <free>
   exit();
 394:	e8 9f 02 00 00       	call   638 <exit>

00000399 <test_and_set>:
  int flag;
};

struct thread_ref *threads[64];

int test_and_set(int *old_ptr, int new_ptr) {
 399:	55                   	push   %ebp
 39a:	89 e5                	mov    %esp,%ebp
 39c:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *old_ptr;
 39f:	8b 10                	mov    (%eax),%edx
  *old_ptr = new_ptr;
 3a1:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 3a4:	89 08                	mov    %ecx,(%eax)
  return old;
}
 3a6:	89 d0                	mov    %edx,%eax
 3a8:	5d                   	pop    %ebp
 3a9:	c3                   	ret    

000003aa <thread_create>:

// a wrapper func for clone
int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 3aa:	55                   	push   %ebp
 3ab:	89 e5                	mov    %esp,%ebp
 3ad:	53                   	push   %ebx
 3ae:	83 ec 10             	sub    $0x10,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE*2);
 3b1:	68 00 20 00 00       	push   $0x2000
 3b6:	e8 f8 05 00 00       	call   9b3 <malloc>
  if(n_stack == 0){
 3bb:	83 c4 10             	add    $0x10,%esp
 3be:	85 c0                	test   %eax,%eax
 3c0:	74 41                	je     403 <thread_create+0x59>
 3c2:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  int new_pid = clone(start_routine, arg1, arg2, n_stack);
 3c4:	50                   	push   %eax
 3c5:	ff 75 10             	push   0x10(%ebp)
 3c8:	ff 75 0c             	push   0xc(%ebp)
 3cb:	ff 75 08             	push   0x8(%ebp)
 3ce:	e8 05 03 00 00       	call   6d8 <clone>

  for(int i=0; i<64; i++){
 3d3:	83 c4 10             	add    $0x10,%esp
 3d6:	ba 00 00 00 00       	mov    $0x0,%edx
 3db:	eb 03                	jmp    3e0 <thread_create+0x36>
 3dd:	83 c2 01             	add    $0x1,%edx
 3e0:	83 fa 3f             	cmp    $0x3f,%edx
 3e3:	7f 19                	jg     3fe <thread_create+0x54>
    if(threads[i]->flag==0){
 3e5:	8b 0c 95 20 0f 00 00 	mov    0xf20(,%edx,4),%ecx
 3ec:	83 79 08 00          	cmpl   $0x0,0x8(%ecx)
 3f0:	75 eb                	jne    3dd <thread_create+0x33>
      threads[i]->maddr = n_stack;
 3f2:	89 19                	mov    %ebx,(%ecx)
      threads[i]->pg1addr = n_stack;
 3f4:	8b 14 95 20 0f 00 00 	mov    0xf20(,%edx,4),%edx
 3fb:	89 5a 04             	mov    %ebx,0x4(%edx)
      break;
    }
  }

  return new_pid;
}
 3fe:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 401:	c9                   	leave  
 402:	c3                   	ret    
    return -1;
 403:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 408:	eb f4                	jmp    3fe <thread_create+0x54>

0000040a <thread_join>:

//TODO: fix
int thread_join() {
 40a:	55                   	push   %ebp
 40b:	89 e5                	mov    %esp,%ebp
 40d:	56                   	push   %esi
 40e:	53                   	push   %ebx
 40f:	83 ec 1c             	sub    $0x1c,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 412:	8d 45 f4             	lea    -0xc(%ebp),%eax
 415:	50                   	push   %eax
 416:	e8 c5 02 00 00       	call   6e0 <join>
 41b:	89 c6                	mov    %eax,%esi
  for(int i=0; i<64; i++){
 41d:	83 c4 10             	add    $0x10,%esp
 420:	bb 00 00 00 00       	mov    $0x0,%ebx
 425:	eb 03                	jmp    42a <thread_join+0x20>
 427:	83 c3 01             	add    $0x1,%ebx
 42a:	83 fb 3f             	cmp    $0x3f,%ebx
 42d:	7f 23                	jg     452 <thread_join+0x48>
    if((threads[i]->flag==1) && (stk_addr == threads[i]->pg1addr)){
 42f:	8b 04 9d 20 0f 00 00 	mov    0xf20(,%ebx,4),%eax
 436:	83 78 08 01          	cmpl   $0x1,0x8(%eax)
 43a:	75 eb                	jne    427 <thread_join+0x1d>
 43c:	8b 55 f4             	mov    -0xc(%ebp),%edx
 43f:	39 50 04             	cmp    %edx,0x4(%eax)
 442:	75 e3                	jne    427 <thread_join+0x1d>
      free(stk_addr);
 444:	83 ec 0c             	sub    $0xc,%esp
 447:	52                   	push   %edx
 448:	e8 a6 04 00 00       	call   8f3 <free>
 44d:	83 c4 10             	add    $0x10,%esp
 450:	eb d5                	jmp    427 <thread_join+0x1d>
    }
  }
  return pid;
}
 452:	89 f0                	mov    %esi,%eax
 454:	8d 65 f8             	lea    -0x8(%ebp),%esp
 457:	5b                   	pop    %ebx
 458:	5e                   	pop    %esi
 459:	5d                   	pop    %ebp
 45a:	c3                   	ret    

0000045b <lock_acquire>:

void lock_acquire(lock_t *lock){
 45b:	55                   	push   %ebp
 45c:	89 e5                	mov    %esp,%ebp
 45e:	53                   	push   %ebx
 45f:	83 ec 04             	sub    $0x4,%esp
 462:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 465:	83 ec 08             	sub    $0x8,%esp
 468:	6a 01                	push   $0x1
 46a:	53                   	push   %ebx
 46b:	e8 29 ff ff ff       	call   399 <test_and_set>
 470:	83 c4 10             	add    $0x10,%esp
 473:	83 f8 01             	cmp    $0x1,%eax
 476:	74 ed                	je     465 <lock_acquire+0xa>
    ;
}
 478:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 47b:	c9                   	leave  
 47c:	c3                   	ret    

0000047d <lock_release>:

void lock_release(lock_t *lock) {
 47d:	55                   	push   %ebp
 47e:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 480:	8b 45 08             	mov    0x8(%ebp),%eax
 483:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 489:	5d                   	pop    %ebp
 48a:	c3                   	ret    

0000048b <lock_init>:

void lock_init(lock_t *lock) {
 48b:	55                   	push   %ebp
 48c:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 48e:	8b 45 08             	mov    0x8(%ebp),%eax
 491:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 497:	5d                   	pop    %ebp
 498:	c3                   	ret    

00000499 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 499:	55                   	push   %ebp
 49a:	89 e5                	mov    %esp,%ebp
 49c:	56                   	push   %esi
 49d:	53                   	push   %ebx
 49e:	8b 75 08             	mov    0x8(%ebp),%esi
 4a1:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 4a4:	89 f0                	mov    %esi,%eax
 4a6:	89 d1                	mov    %edx,%ecx
 4a8:	83 c2 01             	add    $0x1,%edx
 4ab:	89 c3                	mov    %eax,%ebx
 4ad:	83 c0 01             	add    $0x1,%eax
 4b0:	0f b6 09             	movzbl (%ecx),%ecx
 4b3:	88 0b                	mov    %cl,(%ebx)
 4b5:	84 c9                	test   %cl,%cl
 4b7:	75 ed                	jne    4a6 <strcpy+0xd>
    ;
  return os;
}
 4b9:	89 f0                	mov    %esi,%eax
 4bb:	5b                   	pop    %ebx
 4bc:	5e                   	pop    %esi
 4bd:	5d                   	pop    %ebp
 4be:	c3                   	ret    

000004bf <strcmp>:

int
strcmp(const char *p, const char *q)
{
 4bf:	55                   	push   %ebp
 4c0:	89 e5                	mov    %esp,%ebp
 4c2:	8b 4d 08             	mov    0x8(%ebp),%ecx
 4c5:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 4c8:	eb 06                	jmp    4d0 <strcmp+0x11>
    p++, q++;
 4ca:	83 c1 01             	add    $0x1,%ecx
 4cd:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 4d0:	0f b6 01             	movzbl (%ecx),%eax
 4d3:	84 c0                	test   %al,%al
 4d5:	74 04                	je     4db <strcmp+0x1c>
 4d7:	3a 02                	cmp    (%edx),%al
 4d9:	74 ef                	je     4ca <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 4db:	0f b6 c0             	movzbl %al,%eax
 4de:	0f b6 12             	movzbl (%edx),%edx
 4e1:	29 d0                	sub    %edx,%eax
}
 4e3:	5d                   	pop    %ebp
 4e4:	c3                   	ret    

000004e5 <strlen>:

uint
strlen(const char *s)
{
 4e5:	55                   	push   %ebp
 4e6:	89 e5                	mov    %esp,%ebp
 4e8:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 4eb:	b8 00 00 00 00       	mov    $0x0,%eax
 4f0:	eb 03                	jmp    4f5 <strlen+0x10>
 4f2:	83 c0 01             	add    $0x1,%eax
 4f5:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 4f9:	75 f7                	jne    4f2 <strlen+0xd>
    ;
  return n;
}
 4fb:	5d                   	pop    %ebp
 4fc:	c3                   	ret    

000004fd <memset>:

void*
memset(void *dst, int c, uint n)
{
 4fd:	55                   	push   %ebp
 4fe:	89 e5                	mov    %esp,%ebp
 500:	57                   	push   %edi
 501:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 504:	89 d7                	mov    %edx,%edi
 506:	8b 4d 10             	mov    0x10(%ebp),%ecx
 509:	8b 45 0c             	mov    0xc(%ebp),%eax
 50c:	fc                   	cld    
 50d:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 50f:	89 d0                	mov    %edx,%eax
 511:	8b 7d fc             	mov    -0x4(%ebp),%edi
 514:	c9                   	leave  
 515:	c3                   	ret    

00000516 <strchr>:

char*
strchr(const char *s, char c)
{
 516:	55                   	push   %ebp
 517:	89 e5                	mov    %esp,%ebp
 519:	8b 45 08             	mov    0x8(%ebp),%eax
 51c:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 520:	eb 03                	jmp    525 <strchr+0xf>
 522:	83 c0 01             	add    $0x1,%eax
 525:	0f b6 10             	movzbl (%eax),%edx
 528:	84 d2                	test   %dl,%dl
 52a:	74 06                	je     532 <strchr+0x1c>
    if(*s == c)
 52c:	38 ca                	cmp    %cl,%dl
 52e:	75 f2                	jne    522 <strchr+0xc>
 530:	eb 05                	jmp    537 <strchr+0x21>
      return (char*)s;
  return 0;
 532:	b8 00 00 00 00       	mov    $0x0,%eax
}
 537:	5d                   	pop    %ebp
 538:	c3                   	ret    

00000539 <gets>:

char*
gets(char *buf, int max)
{
 539:	55                   	push   %ebp
 53a:	89 e5                	mov    %esp,%ebp
 53c:	57                   	push   %edi
 53d:	56                   	push   %esi
 53e:	53                   	push   %ebx
 53f:	83 ec 1c             	sub    $0x1c,%esp
 542:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 545:	bb 00 00 00 00       	mov    $0x0,%ebx
 54a:	89 de                	mov    %ebx,%esi
 54c:	83 c3 01             	add    $0x1,%ebx
 54f:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 552:	7d 2e                	jge    582 <gets+0x49>
    cc = read(0, &c, 1);
 554:	83 ec 04             	sub    $0x4,%esp
 557:	6a 01                	push   $0x1
 559:	8d 45 e7             	lea    -0x19(%ebp),%eax
 55c:	50                   	push   %eax
 55d:	6a 00                	push   $0x0
 55f:	e8 ec 00 00 00       	call   650 <read>
    if(cc < 1)
 564:	83 c4 10             	add    $0x10,%esp
 567:	85 c0                	test   %eax,%eax
 569:	7e 17                	jle    582 <gets+0x49>
      break;
    buf[i++] = c;
 56b:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 56f:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 572:	3c 0a                	cmp    $0xa,%al
 574:	0f 94 c2             	sete   %dl
 577:	3c 0d                	cmp    $0xd,%al
 579:	0f 94 c0             	sete   %al
 57c:	08 c2                	or     %al,%dl
 57e:	74 ca                	je     54a <gets+0x11>
    buf[i++] = c;
 580:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 582:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 586:	89 f8                	mov    %edi,%eax
 588:	8d 65 f4             	lea    -0xc(%ebp),%esp
 58b:	5b                   	pop    %ebx
 58c:	5e                   	pop    %esi
 58d:	5f                   	pop    %edi
 58e:	5d                   	pop    %ebp
 58f:	c3                   	ret    

00000590 <stat>:

int
stat(const char *n, struct stat *st)
{
 590:	55                   	push   %ebp
 591:	89 e5                	mov    %esp,%ebp
 593:	56                   	push   %esi
 594:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 595:	83 ec 08             	sub    $0x8,%esp
 598:	6a 00                	push   $0x0
 59a:	ff 75 08             	push   0x8(%ebp)
 59d:	e8 d6 00 00 00       	call   678 <open>
  if(fd < 0)
 5a2:	83 c4 10             	add    $0x10,%esp
 5a5:	85 c0                	test   %eax,%eax
 5a7:	78 24                	js     5cd <stat+0x3d>
 5a9:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 5ab:	83 ec 08             	sub    $0x8,%esp
 5ae:	ff 75 0c             	push   0xc(%ebp)
 5b1:	50                   	push   %eax
 5b2:	e8 d9 00 00 00       	call   690 <fstat>
 5b7:	89 c6                	mov    %eax,%esi
  close(fd);
 5b9:	89 1c 24             	mov    %ebx,(%esp)
 5bc:	e8 9f 00 00 00       	call   660 <close>
  return r;
 5c1:	83 c4 10             	add    $0x10,%esp
}
 5c4:	89 f0                	mov    %esi,%eax
 5c6:	8d 65 f8             	lea    -0x8(%ebp),%esp
 5c9:	5b                   	pop    %ebx
 5ca:	5e                   	pop    %esi
 5cb:	5d                   	pop    %ebp
 5cc:	c3                   	ret    
    return -1;
 5cd:	be ff ff ff ff       	mov    $0xffffffff,%esi
 5d2:	eb f0                	jmp    5c4 <stat+0x34>

000005d4 <atoi>:

int
atoi(const char *s)
{
 5d4:	55                   	push   %ebp
 5d5:	89 e5                	mov    %esp,%ebp
 5d7:	53                   	push   %ebx
 5d8:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 5db:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 5e0:	eb 10                	jmp    5f2 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 5e2:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 5e5:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 5e8:	83 c1 01             	add    $0x1,%ecx
 5eb:	0f be c0             	movsbl %al,%eax
 5ee:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 5f2:	0f b6 01             	movzbl (%ecx),%eax
 5f5:	8d 58 d0             	lea    -0x30(%eax),%ebx
 5f8:	80 fb 09             	cmp    $0x9,%bl
 5fb:	76 e5                	jbe    5e2 <atoi+0xe>
  return n;
}
 5fd:	89 d0                	mov    %edx,%eax
 5ff:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 602:	c9                   	leave  
 603:	c3                   	ret    

00000604 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 604:	55                   	push   %ebp
 605:	89 e5                	mov    %esp,%ebp
 607:	56                   	push   %esi
 608:	53                   	push   %ebx
 609:	8b 75 08             	mov    0x8(%ebp),%esi
 60c:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 60f:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 612:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 614:	eb 0d                	jmp    623 <memmove+0x1f>
    *dst++ = *src++;
 616:	0f b6 01             	movzbl (%ecx),%eax
 619:	88 02                	mov    %al,(%edx)
 61b:	8d 49 01             	lea    0x1(%ecx),%ecx
 61e:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 621:	89 d8                	mov    %ebx,%eax
 623:	8d 58 ff             	lea    -0x1(%eax),%ebx
 626:	85 c0                	test   %eax,%eax
 628:	7f ec                	jg     616 <memmove+0x12>
  return vdst;
}
 62a:	89 f0                	mov    %esi,%eax
 62c:	5b                   	pop    %ebx
 62d:	5e                   	pop    %esi
 62e:	5d                   	pop    %ebp
 62f:	c3                   	ret    

00000630 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 630:	b8 01 00 00 00       	mov    $0x1,%eax
 635:	cd 40                	int    $0x40
 637:	c3                   	ret    

00000638 <exit>:
SYSCALL(exit)
 638:	b8 02 00 00 00       	mov    $0x2,%eax
 63d:	cd 40                	int    $0x40
 63f:	c3                   	ret    

00000640 <wait>:
SYSCALL(wait)
 640:	b8 03 00 00 00       	mov    $0x3,%eax
 645:	cd 40                	int    $0x40
 647:	c3                   	ret    

00000648 <pipe>:
SYSCALL(pipe)
 648:	b8 04 00 00 00       	mov    $0x4,%eax
 64d:	cd 40                	int    $0x40
 64f:	c3                   	ret    

00000650 <read>:
SYSCALL(read)
 650:	b8 05 00 00 00       	mov    $0x5,%eax
 655:	cd 40                	int    $0x40
 657:	c3                   	ret    

00000658 <write>:
SYSCALL(write)
 658:	b8 10 00 00 00       	mov    $0x10,%eax
 65d:	cd 40                	int    $0x40
 65f:	c3                   	ret    

00000660 <close>:
SYSCALL(close)
 660:	b8 15 00 00 00       	mov    $0x15,%eax
 665:	cd 40                	int    $0x40
 667:	c3                   	ret    

00000668 <kill>:
SYSCALL(kill)
 668:	b8 06 00 00 00       	mov    $0x6,%eax
 66d:	cd 40                	int    $0x40
 66f:	c3                   	ret    

00000670 <exec>:
SYSCALL(exec)
 670:	b8 07 00 00 00       	mov    $0x7,%eax
 675:	cd 40                	int    $0x40
 677:	c3                   	ret    

00000678 <open>:
SYSCALL(open)
 678:	b8 0f 00 00 00       	mov    $0xf,%eax
 67d:	cd 40                	int    $0x40
 67f:	c3                   	ret    

00000680 <mknod>:
SYSCALL(mknod)
 680:	b8 11 00 00 00       	mov    $0x11,%eax
 685:	cd 40                	int    $0x40
 687:	c3                   	ret    

00000688 <unlink>:
SYSCALL(unlink)
 688:	b8 12 00 00 00       	mov    $0x12,%eax
 68d:	cd 40                	int    $0x40
 68f:	c3                   	ret    

00000690 <fstat>:
SYSCALL(fstat)
 690:	b8 08 00 00 00       	mov    $0x8,%eax
 695:	cd 40                	int    $0x40
 697:	c3                   	ret    

00000698 <link>:
SYSCALL(link)
 698:	b8 13 00 00 00       	mov    $0x13,%eax
 69d:	cd 40                	int    $0x40
 69f:	c3                   	ret    

000006a0 <mkdir>:
SYSCALL(mkdir)
 6a0:	b8 14 00 00 00       	mov    $0x14,%eax
 6a5:	cd 40                	int    $0x40
 6a7:	c3                   	ret    

000006a8 <chdir>:
SYSCALL(chdir)
 6a8:	b8 09 00 00 00       	mov    $0x9,%eax
 6ad:	cd 40                	int    $0x40
 6af:	c3                   	ret    

000006b0 <dup>:
SYSCALL(dup)
 6b0:	b8 0a 00 00 00       	mov    $0xa,%eax
 6b5:	cd 40                	int    $0x40
 6b7:	c3                   	ret    

000006b8 <getpid>:
SYSCALL(getpid)
 6b8:	b8 0b 00 00 00       	mov    $0xb,%eax
 6bd:	cd 40                	int    $0x40
 6bf:	c3                   	ret    

000006c0 <sbrk>:
SYSCALL(sbrk)
 6c0:	b8 0c 00 00 00       	mov    $0xc,%eax
 6c5:	cd 40                	int    $0x40
 6c7:	c3                   	ret    

000006c8 <sleep>:
SYSCALL(sleep)
 6c8:	b8 0d 00 00 00       	mov    $0xd,%eax
 6cd:	cd 40                	int    $0x40
 6cf:	c3                   	ret    

000006d0 <uptime>:
SYSCALL(uptime)
 6d0:	b8 0e 00 00 00       	mov    $0xe,%eax
 6d5:	cd 40                	int    $0x40
 6d7:	c3                   	ret    

000006d8 <clone>:
SYSCALL(clone)
 6d8:	b8 16 00 00 00       	mov    $0x16,%eax
 6dd:	cd 40                	int    $0x40
 6df:	c3                   	ret    

000006e0 <join>:
 6e0:	b8 17 00 00 00       	mov    $0x17,%eax
 6e5:	cd 40                	int    $0x40
 6e7:	c3                   	ret    

000006e8 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 6e8:	55                   	push   %ebp
 6e9:	89 e5                	mov    %esp,%ebp
 6eb:	83 ec 1c             	sub    $0x1c,%esp
 6ee:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 6f1:	6a 01                	push   $0x1
 6f3:	8d 55 f4             	lea    -0xc(%ebp),%edx
 6f6:	52                   	push   %edx
 6f7:	50                   	push   %eax
 6f8:	e8 5b ff ff ff       	call   658 <write>
}
 6fd:	83 c4 10             	add    $0x10,%esp
 700:	c9                   	leave  
 701:	c3                   	ret    

00000702 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 702:	55                   	push   %ebp
 703:	89 e5                	mov    %esp,%ebp
 705:	57                   	push   %edi
 706:	56                   	push   %esi
 707:	53                   	push   %ebx
 708:	83 ec 2c             	sub    $0x2c,%esp
 70b:	89 45 d0             	mov    %eax,-0x30(%ebp)
 70e:	89 d0                	mov    %edx,%eax
 710:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 712:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 716:	0f 95 c1             	setne  %cl
 719:	c1 ea 1f             	shr    $0x1f,%edx
 71c:	84 d1                	test   %dl,%cl
 71e:	74 44                	je     764 <printint+0x62>
    neg = 1;
    x = -xx;
 720:	f7 d8                	neg    %eax
 722:	89 c1                	mov    %eax,%ecx
    neg = 1;
 724:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 72b:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 730:	89 c8                	mov    %ecx,%eax
 732:	ba 00 00 00 00       	mov    $0x0,%edx
 737:	f7 f6                	div    %esi
 739:	89 df                	mov    %ebx,%edi
 73b:	83 c3 01             	add    $0x1,%ebx
 73e:	0f b6 92 58 0b 00 00 	movzbl 0xb58(%edx),%edx
 745:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 749:	89 ca                	mov    %ecx,%edx
 74b:	89 c1                	mov    %eax,%ecx
 74d:	39 d6                	cmp    %edx,%esi
 74f:	76 df                	jbe    730 <printint+0x2e>
  if(neg)
 751:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 755:	74 31                	je     788 <printint+0x86>
    buf[i++] = '-';
 757:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 75c:	8d 5f 02             	lea    0x2(%edi),%ebx
 75f:	8b 75 d0             	mov    -0x30(%ebp),%esi
 762:	eb 17                	jmp    77b <printint+0x79>
    x = xx;
 764:	89 c1                	mov    %eax,%ecx
  neg = 0;
 766:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 76d:	eb bc                	jmp    72b <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 76f:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 774:	89 f0                	mov    %esi,%eax
 776:	e8 6d ff ff ff       	call   6e8 <putc>
  while(--i >= 0)
 77b:	83 eb 01             	sub    $0x1,%ebx
 77e:	79 ef                	jns    76f <printint+0x6d>
}
 780:	83 c4 2c             	add    $0x2c,%esp
 783:	5b                   	pop    %ebx
 784:	5e                   	pop    %esi
 785:	5f                   	pop    %edi
 786:	5d                   	pop    %ebp
 787:	c3                   	ret    
 788:	8b 75 d0             	mov    -0x30(%ebp),%esi
 78b:	eb ee                	jmp    77b <printint+0x79>

0000078d <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 78d:	55                   	push   %ebp
 78e:	89 e5                	mov    %esp,%ebp
 790:	57                   	push   %edi
 791:	56                   	push   %esi
 792:	53                   	push   %ebx
 793:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 796:	8d 45 10             	lea    0x10(%ebp),%eax
 799:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 79c:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 7a1:	bb 00 00 00 00       	mov    $0x0,%ebx
 7a6:	eb 14                	jmp    7bc <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 7a8:	89 fa                	mov    %edi,%edx
 7aa:	8b 45 08             	mov    0x8(%ebp),%eax
 7ad:	e8 36 ff ff ff       	call   6e8 <putc>
 7b2:	eb 05                	jmp    7b9 <printf+0x2c>
      }
    } else if(state == '%'){
 7b4:	83 fe 25             	cmp    $0x25,%esi
 7b7:	74 25                	je     7de <printf+0x51>
  for(i = 0; fmt[i]; i++){
 7b9:	83 c3 01             	add    $0x1,%ebx
 7bc:	8b 45 0c             	mov    0xc(%ebp),%eax
 7bf:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 7c3:	84 c0                	test   %al,%al
 7c5:	0f 84 20 01 00 00    	je     8eb <printf+0x15e>
    c = fmt[i] & 0xff;
 7cb:	0f be f8             	movsbl %al,%edi
 7ce:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 7d1:	85 f6                	test   %esi,%esi
 7d3:	75 df                	jne    7b4 <printf+0x27>
      if(c == '%'){
 7d5:	83 f8 25             	cmp    $0x25,%eax
 7d8:	75 ce                	jne    7a8 <printf+0x1b>
        state = '%';
 7da:	89 c6                	mov    %eax,%esi
 7dc:	eb db                	jmp    7b9 <printf+0x2c>
      if(c == 'd'){
 7de:	83 f8 25             	cmp    $0x25,%eax
 7e1:	0f 84 cf 00 00 00    	je     8b6 <printf+0x129>
 7e7:	0f 8c dd 00 00 00    	jl     8ca <printf+0x13d>
 7ed:	83 f8 78             	cmp    $0x78,%eax
 7f0:	0f 8f d4 00 00 00    	jg     8ca <printf+0x13d>
 7f6:	83 f8 63             	cmp    $0x63,%eax
 7f9:	0f 8c cb 00 00 00    	jl     8ca <printf+0x13d>
 7ff:	83 e8 63             	sub    $0x63,%eax
 802:	83 f8 15             	cmp    $0x15,%eax
 805:	0f 87 bf 00 00 00    	ja     8ca <printf+0x13d>
 80b:	ff 24 85 00 0b 00 00 	jmp    *0xb00(,%eax,4)
        printint(fd, *ap, 10, 1);
 812:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 815:	8b 17                	mov    (%edi),%edx
 817:	83 ec 0c             	sub    $0xc,%esp
 81a:	6a 01                	push   $0x1
 81c:	b9 0a 00 00 00       	mov    $0xa,%ecx
 821:	8b 45 08             	mov    0x8(%ebp),%eax
 824:	e8 d9 fe ff ff       	call   702 <printint>
        ap++;
 829:	83 c7 04             	add    $0x4,%edi
 82c:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 82f:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 832:	be 00 00 00 00       	mov    $0x0,%esi
 837:	eb 80                	jmp    7b9 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 839:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 83c:	8b 17                	mov    (%edi),%edx
 83e:	83 ec 0c             	sub    $0xc,%esp
 841:	6a 00                	push   $0x0
 843:	b9 10 00 00 00       	mov    $0x10,%ecx
 848:	8b 45 08             	mov    0x8(%ebp),%eax
 84b:	e8 b2 fe ff ff       	call   702 <printint>
        ap++;
 850:	83 c7 04             	add    $0x4,%edi
 853:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 856:	83 c4 10             	add    $0x10,%esp
      state = 0;
 859:	be 00 00 00 00       	mov    $0x0,%esi
 85e:	e9 56 ff ff ff       	jmp    7b9 <printf+0x2c>
        s = (char*)*ap;
 863:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 866:	8b 30                	mov    (%eax),%esi
        ap++;
 868:	83 c0 04             	add    $0x4,%eax
 86b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 86e:	85 f6                	test   %esi,%esi
 870:	75 15                	jne    887 <printf+0xfa>
          s = "(null)";
 872:	be f8 0a 00 00       	mov    $0xaf8,%esi
 877:	eb 0e                	jmp    887 <printf+0xfa>
          putc(fd, *s);
 879:	0f be d2             	movsbl %dl,%edx
 87c:	8b 45 08             	mov    0x8(%ebp),%eax
 87f:	e8 64 fe ff ff       	call   6e8 <putc>
          s++;
 884:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 887:	0f b6 16             	movzbl (%esi),%edx
 88a:	84 d2                	test   %dl,%dl
 88c:	75 eb                	jne    879 <printf+0xec>
      state = 0;
 88e:	be 00 00 00 00       	mov    $0x0,%esi
 893:	e9 21 ff ff ff       	jmp    7b9 <printf+0x2c>
        putc(fd, *ap);
 898:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 89b:	0f be 17             	movsbl (%edi),%edx
 89e:	8b 45 08             	mov    0x8(%ebp),%eax
 8a1:	e8 42 fe ff ff       	call   6e8 <putc>
        ap++;
 8a6:	83 c7 04             	add    $0x4,%edi
 8a9:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 8ac:	be 00 00 00 00       	mov    $0x0,%esi
 8b1:	e9 03 ff ff ff       	jmp    7b9 <printf+0x2c>
        putc(fd, c);
 8b6:	89 fa                	mov    %edi,%edx
 8b8:	8b 45 08             	mov    0x8(%ebp),%eax
 8bb:	e8 28 fe ff ff       	call   6e8 <putc>
      state = 0;
 8c0:	be 00 00 00 00       	mov    $0x0,%esi
 8c5:	e9 ef fe ff ff       	jmp    7b9 <printf+0x2c>
        putc(fd, '%');
 8ca:	ba 25 00 00 00       	mov    $0x25,%edx
 8cf:	8b 45 08             	mov    0x8(%ebp),%eax
 8d2:	e8 11 fe ff ff       	call   6e8 <putc>
        putc(fd, c);
 8d7:	89 fa                	mov    %edi,%edx
 8d9:	8b 45 08             	mov    0x8(%ebp),%eax
 8dc:	e8 07 fe ff ff       	call   6e8 <putc>
      state = 0;
 8e1:	be 00 00 00 00       	mov    $0x0,%esi
 8e6:	e9 ce fe ff ff       	jmp    7b9 <printf+0x2c>
    }
  }
}
 8eb:	8d 65 f4             	lea    -0xc(%ebp),%esp
 8ee:	5b                   	pop    %ebx
 8ef:	5e                   	pop    %esi
 8f0:	5f                   	pop    %edi
 8f1:	5d                   	pop    %ebp
 8f2:	c3                   	ret    

000008f3 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 8f3:	55                   	push   %ebp
 8f4:	89 e5                	mov    %esp,%ebp
 8f6:	57                   	push   %edi
 8f7:	56                   	push   %esi
 8f8:	53                   	push   %ebx
 8f9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 8fc:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8ff:	a1 20 10 00 00       	mov    0x1020,%eax
 904:	eb 02                	jmp    908 <free+0x15>
 906:	89 d0                	mov    %edx,%eax
 908:	39 c8                	cmp    %ecx,%eax
 90a:	73 04                	jae    910 <free+0x1d>
 90c:	39 08                	cmp    %ecx,(%eax)
 90e:	77 12                	ja     922 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 910:	8b 10                	mov    (%eax),%edx
 912:	39 c2                	cmp    %eax,%edx
 914:	77 f0                	ja     906 <free+0x13>
 916:	39 c8                	cmp    %ecx,%eax
 918:	72 08                	jb     922 <free+0x2f>
 91a:	39 ca                	cmp    %ecx,%edx
 91c:	77 04                	ja     922 <free+0x2f>
 91e:	89 d0                	mov    %edx,%eax
 920:	eb e6                	jmp    908 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 922:	8b 73 fc             	mov    -0x4(%ebx),%esi
 925:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 928:	8b 10                	mov    (%eax),%edx
 92a:	39 d7                	cmp    %edx,%edi
 92c:	74 19                	je     947 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 92e:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 931:	8b 50 04             	mov    0x4(%eax),%edx
 934:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 937:	39 ce                	cmp    %ecx,%esi
 939:	74 1b                	je     956 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 93b:	89 08                	mov    %ecx,(%eax)
  freep = p;
 93d:	a3 20 10 00 00       	mov    %eax,0x1020
}
 942:	5b                   	pop    %ebx
 943:	5e                   	pop    %esi
 944:	5f                   	pop    %edi
 945:	5d                   	pop    %ebp
 946:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 947:	03 72 04             	add    0x4(%edx),%esi
 94a:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 94d:	8b 10                	mov    (%eax),%edx
 94f:	8b 12                	mov    (%edx),%edx
 951:	89 53 f8             	mov    %edx,-0x8(%ebx)
 954:	eb db                	jmp    931 <free+0x3e>
    p->s.size += bp->s.size;
 956:	03 53 fc             	add    -0x4(%ebx),%edx
 959:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 95c:	8b 53 f8             	mov    -0x8(%ebx),%edx
 95f:	89 10                	mov    %edx,(%eax)
 961:	eb da                	jmp    93d <free+0x4a>

00000963 <morecore>:

static Header*
morecore(uint nu)
{
 963:	55                   	push   %ebp
 964:	89 e5                	mov    %esp,%ebp
 966:	53                   	push   %ebx
 967:	83 ec 04             	sub    $0x4,%esp
 96a:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 96c:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 971:	77 05                	ja     978 <morecore+0x15>
    nu = 4096;
 973:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 978:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 97f:	83 ec 0c             	sub    $0xc,%esp
 982:	50                   	push   %eax
 983:	e8 38 fd ff ff       	call   6c0 <sbrk>
  if(p == (char*)-1)
 988:	83 c4 10             	add    $0x10,%esp
 98b:	83 f8 ff             	cmp    $0xffffffff,%eax
 98e:	74 1c                	je     9ac <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 990:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 993:	83 c0 08             	add    $0x8,%eax
 996:	83 ec 0c             	sub    $0xc,%esp
 999:	50                   	push   %eax
 99a:	e8 54 ff ff ff       	call   8f3 <free>
  return freep;
 99f:	a1 20 10 00 00       	mov    0x1020,%eax
 9a4:	83 c4 10             	add    $0x10,%esp
}
 9a7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 9aa:	c9                   	leave  
 9ab:	c3                   	ret    
    return 0;
 9ac:	b8 00 00 00 00       	mov    $0x0,%eax
 9b1:	eb f4                	jmp    9a7 <morecore+0x44>

000009b3 <malloc>:

void*
malloc(uint nbytes)
{
 9b3:	55                   	push   %ebp
 9b4:	89 e5                	mov    %esp,%ebp
 9b6:	53                   	push   %ebx
 9b7:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9ba:	8b 45 08             	mov    0x8(%ebp),%eax
 9bd:	8d 58 07             	lea    0x7(%eax),%ebx
 9c0:	c1 eb 03             	shr    $0x3,%ebx
 9c3:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 9c6:	8b 0d 20 10 00 00    	mov    0x1020,%ecx
 9cc:	85 c9                	test   %ecx,%ecx
 9ce:	74 04                	je     9d4 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9d0:	8b 01                	mov    (%ecx),%eax
 9d2:	eb 4a                	jmp    a1e <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 9d4:	c7 05 20 10 00 00 24 	movl   $0x1024,0x1020
 9db:	10 00 00 
 9de:	c7 05 24 10 00 00 24 	movl   $0x1024,0x1024
 9e5:	10 00 00 
    base.s.size = 0;
 9e8:	c7 05 28 10 00 00 00 	movl   $0x0,0x1028
 9ef:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 9f2:	b9 24 10 00 00       	mov    $0x1024,%ecx
 9f7:	eb d7                	jmp    9d0 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 9f9:	74 19                	je     a14 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 9fb:	29 da                	sub    %ebx,%edx
 9fd:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 a00:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 a03:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 a06:	89 0d 20 10 00 00    	mov    %ecx,0x1020
      return (void*)(p + 1);
 a0c:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 a0f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 a12:	c9                   	leave  
 a13:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 a14:	8b 10                	mov    (%eax),%edx
 a16:	89 11                	mov    %edx,(%ecx)
 a18:	eb ec                	jmp    a06 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a1a:	89 c1                	mov    %eax,%ecx
 a1c:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 a1e:	8b 50 04             	mov    0x4(%eax),%edx
 a21:	39 da                	cmp    %ebx,%edx
 a23:	73 d4                	jae    9f9 <malloc+0x46>
    if(p == freep)
 a25:	39 05 20 10 00 00    	cmp    %eax,0x1020
 a2b:	75 ed                	jne    a1a <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 a2d:	89 d8                	mov    %ebx,%eax
 a2f:	e8 2f ff ff ff       	call   963 <morecore>
 a34:	85 c0                	test   %eax,%eax
 a36:	75 e2                	jne    a1a <malloc+0x67>
 a38:	eb d5                	jmp    a0f <malloc+0x5c>
