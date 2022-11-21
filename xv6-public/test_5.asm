
_test_5:     file format elf32-i386


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
  1c:	a1 84 0e 00 00       	mov    0xe84,%eax
  21:	83 f8 01             	cmp    $0x1,%eax
  24:	0f 84 db 00 00 00    	je     105 <worker+0x105>
  2a:	6a 38                	push   $0x38
  2c:	68 d8 09 00 00       	push   $0x9d8
  31:	68 e1 09 00 00       	push   $0x9e1
  36:	6a 01                	push   $0x1
  38:	e8 ed 06 00 00       	call   72a <printf>
  3d:	83 c4 0c             	add    $0xc,%esp
  40:	68 20 0a 00 00       	push   $0xa20
  45:	68 f4 09 00 00       	push   $0x9f4
  4a:	6a 01                	push   $0x1
  4c:	e8 d9 06 00 00       	call   72a <printf>
  51:	83 c4 08             	add    $0x8,%esp
  54:	68 08 0a 00 00       	push   $0xa08
  59:	6a 01                	push   $0x1
  5b:	e8 ca 06 00 00       	call   72a <printf>
  60:	83 c4 04             	add    $0x4,%esp
  63:	ff 35 a0 0e 00 00    	push   0xea0
  69:	e8 97 05 00 00       	call   605 <kill>
  6e:	e8 62 05 00 00       	call   5d5 <exit>
   assert(tmp1 == 42);
  73:	6a 36                	push   $0x36
  75:	68 d8 09 00 00       	push   $0x9d8
  7a:	68 e1 09 00 00       	push   $0x9e1
  7f:	6a 01                	push   $0x1
  81:	e8 a4 06 00 00       	call   72a <printf>
  86:	83 c4 0c             	add    $0xc,%esp
  89:	68 e9 09 00 00       	push   $0x9e9
  8e:	68 f4 09 00 00       	push   $0x9f4
  93:	6a 01                	push   $0x1
  95:	e8 90 06 00 00       	call   72a <printf>
  9a:	83 c4 08             	add    $0x8,%esp
  9d:	68 08 0a 00 00       	push   $0xa08
  a2:	6a 01                	push   $0x1
  a4:	e8 81 06 00 00       	call   72a <printf>
  a9:	83 c4 04             	add    $0x4,%esp
  ac:	ff 35 a0 0e 00 00    	push   0xea0
  b2:	e8 4e 05 00 00       	call   605 <kill>
  b7:	e8 19 05 00 00       	call   5d5 <exit>
   assert(tmp2 == 24);
  bc:	6a 37                	push   $0x37
  be:	68 d8 09 00 00       	push   $0x9d8
  c3:	68 e1 09 00 00       	push   $0x9e1
  c8:	6a 01                	push   $0x1
  ca:	e8 5b 06 00 00       	call   72a <printf>
  cf:	83 c4 0c             	add    $0xc,%esp
  d2:	68 15 0a 00 00       	push   $0xa15
  d7:	68 f4 09 00 00       	push   $0x9f4
  dc:	6a 01                	push   $0x1
  de:	e8 47 06 00 00       	call   72a <printf>
  e3:	83 c4 08             	add    $0x8,%esp
  e6:	68 08 0a 00 00       	push   $0xa08
  eb:	6a 01                	push   $0x1
  ed:	e8 38 06 00 00       	call   72a <printf>
  f2:	83 c4 04             	add    $0x4,%esp
  f5:	ff 35 a0 0e 00 00    	push   0xea0
  fb:	e8 05 05 00 00       	call   605 <kill>
 100:	e8 d0 04 00 00       	call   5d5 <exit>
   global++;
 105:	83 c0 01             	add    $0x1,%eax
 108:	a3 84 0e 00 00       	mov    %eax,0xe84
   exit();
 10d:	e8 c3 04 00 00       	call   5d5 <exit>

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
 126:	e8 2a 05 00 00       	call   655 <getpid>
 12b:	a3 a0 0e 00 00       	mov    %eax,0xea0
   void *stack, *p = malloc(PGSIZE * 2);
 130:	83 ec 0c             	sub    $0xc,%esp
 133:	68 00 20 00 00       	push   $0x2000
 138:	e8 13 08 00 00       	call   950 <malloc>
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
 15a:	68 d8 09 00 00       	push   $0x9d8
 15f:	68 e1 09 00 00       	push   $0x9e1
 164:	6a 01                	push   $0x1
 166:	e8 bf 05 00 00       	call   72a <printf>
 16b:	83 c4 0c             	add    $0xc,%esp
 16e:	68 2c 0a 00 00       	push   $0xa2c
 173:	68 f4 09 00 00       	push   $0x9f4
 178:	6a 01                	push   $0x1
 17a:	e8 ab 05 00 00       	call   72a <printf>
 17f:	83 c4 08             	add    $0x8,%esp
 182:	68 08 0a 00 00       	push   $0xa08
 187:	6a 01                	push   $0x1
 189:	e8 9c 05 00 00       	call   72a <printf>
 18e:	83 c4 04             	add    $0x4,%esp
 191:	ff 35 a0 0e 00 00    	push   0xea0
 197:	e8 69 04 00 00       	call   605 <kill>
 19c:	e8 34 04 00 00       	call   5d5 <exit>
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
 1bf:	e8 b1 04 00 00       	call   675 <clone>
 1c4:	89 c6                	mov    %eax,%esi
   assert(clone_pid > 0);
 1c6:	83 c4 10             	add    $0x10,%esp
 1c9:	85 c0                	test   %eax,%eax
 1cb:	7e 69                	jle    236 <main+0x124>
   int join_pid = join(&join_stack);
 1cd:	83 ec 0c             	sub    $0xc,%esp
 1d0:	8d 45 dc             	lea    -0x24(%ebp),%eax
 1d3:	50                   	push   %eax
 1d4:	e8 a4 04 00 00       	call   67d <join>
   assert(join_pid == clone_pid);
 1d9:	83 c4 10             	add    $0x10,%esp
 1dc:	39 c6                	cmp    %eax,%esi
 1de:	0f 85 9b 00 00 00    	jne    27f <main+0x16d>
   assert(stack == join_stack);
 1e4:	39 7d dc             	cmp    %edi,-0x24(%ebp)
 1e7:	0f 84 db 00 00 00    	je     2c8 <main+0x1b6>
 1ed:	6a 2a                	push   $0x2a
 1ef:	68 d8 09 00 00       	push   $0x9d8
 1f4:	68 e1 09 00 00       	push   $0x9e1
 1f9:	6a 01                	push   $0x1
 1fb:	e8 2a 05 00 00       	call   72a <printf>
 200:	83 c4 0c             	add    $0xc,%esp
 203:	68 5a 0a 00 00       	push   $0xa5a
 208:	68 f4 09 00 00       	push   $0x9f4
 20d:	6a 01                	push   $0x1
 20f:	e8 16 05 00 00       	call   72a <printf>
 214:	83 c4 08             	add    $0x8,%esp
 217:	68 08 0a 00 00       	push   $0xa08
 21c:	6a 01                	push   $0x1
 21e:	e8 07 05 00 00       	call   72a <printf>
 223:	83 c4 04             	add    $0x4,%esp
 226:	ff 35 a0 0e 00 00    	push   0xea0
 22c:	e8 d4 03 00 00       	call   605 <kill>
 231:	e8 9f 03 00 00       	call   5d5 <exit>
   assert(clone_pid > 0);
 236:	6a 25                	push   $0x25
 238:	68 d8 09 00 00       	push   $0x9d8
 23d:	68 e1 09 00 00       	push   $0x9e1
 242:	6a 01                	push   $0x1
 244:	e8 e1 04 00 00       	call   72a <printf>
 249:	83 c4 0c             	add    $0xc,%esp
 24c:	68 36 0a 00 00       	push   $0xa36
 251:	68 f4 09 00 00       	push   $0x9f4
 256:	6a 01                	push   $0x1
 258:	e8 cd 04 00 00       	call   72a <printf>
 25d:	83 c4 08             	add    $0x8,%esp
 260:	68 08 0a 00 00       	push   $0xa08
 265:	6a 01                	push   $0x1
 267:	e8 be 04 00 00       	call   72a <printf>
 26c:	83 c4 04             	add    $0x4,%esp
 26f:	ff 35 a0 0e 00 00    	push   0xea0
 275:	e8 8b 03 00 00       	call   605 <kill>
 27a:	e8 56 03 00 00       	call   5d5 <exit>
   assert(join_pid == clone_pid);
 27f:	6a 29                	push   $0x29
 281:	68 d8 09 00 00       	push   $0x9d8
 286:	68 e1 09 00 00       	push   $0x9e1
 28b:	6a 01                	push   $0x1
 28d:	e8 98 04 00 00       	call   72a <printf>
 292:	83 c4 0c             	add    $0xc,%esp
 295:	68 44 0a 00 00       	push   $0xa44
 29a:	68 f4 09 00 00       	push   $0x9f4
 29f:	6a 01                	push   $0x1
 2a1:	e8 84 04 00 00       	call   72a <printf>
 2a6:	83 c4 08             	add    $0x8,%esp
 2a9:	68 08 0a 00 00       	push   $0xa08
 2ae:	6a 01                	push   $0x1
 2b0:	e8 75 04 00 00       	call   72a <printf>
 2b5:	83 c4 04             	add    $0x4,%esp
 2b8:	ff 35 a0 0e 00 00    	push   0xea0
 2be:	e8 42 03 00 00       	call   605 <kill>
 2c3:	e8 0d 03 00 00       	call   5d5 <exit>
   assert(global == 2);
 2c8:	83 3d 84 0e 00 00 02 	cmpl   $0x2,0xe84
 2cf:	74 49                	je     31a <main+0x208>
 2d1:	6a 2b                	push   $0x2b
 2d3:	68 d8 09 00 00       	push   $0x9d8
 2d8:	68 e1 09 00 00       	push   $0x9e1
 2dd:	6a 01                	push   $0x1
 2df:	e8 46 04 00 00       	call   72a <printf>
 2e4:	83 c4 0c             	add    $0xc,%esp
 2e7:	68 6e 0a 00 00       	push   $0xa6e
 2ec:	68 f4 09 00 00       	push   $0x9f4
 2f1:	6a 01                	push   $0x1
 2f3:	e8 32 04 00 00       	call   72a <printf>
 2f8:	83 c4 08             	add    $0x8,%esp
 2fb:	68 08 0a 00 00       	push   $0xa08
 300:	6a 01                	push   $0x1
 302:	e8 23 04 00 00       	call   72a <printf>
 307:	83 c4 04             	add    $0x4,%esp
 30a:	ff 35 a0 0e 00 00    	push   0xea0
 310:	e8 f0 02 00 00       	call   605 <kill>
 315:	e8 bb 02 00 00       	call   5d5 <exit>
   printf(1, "TEST PASSED\n");
 31a:	83 ec 08             	sub    $0x8,%esp
 31d:	68 7a 0a 00 00       	push   $0xa7a
 322:	6a 01                	push   $0x1
 324:	e8 01 04 00 00       	call   72a <printf>
   free(p);
 329:	89 1c 24             	mov    %ebx,(%esp)
 32c:	e8 5f 05 00 00       	call   890 <free>
   exit();
 331:	e8 9f 02 00 00       	call   5d5 <exit>

00000336 <test_and_set>:
  int flag;
};

struct thread_ref *threads[64];

int test_and_set(int *old_ptr, int new_ptr) {
 336:	55                   	push   %ebp
 337:	89 e5                	mov    %esp,%ebp
 339:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *old_ptr;
 33c:	8b 10                	mov    (%eax),%edx
  *old_ptr = new_ptr;
 33e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 341:	89 08                	mov    %ecx,(%eax)
  return old;
}
 343:	89 d0                	mov    %edx,%eax
 345:	5d                   	pop    %ebp
 346:	c3                   	ret    

00000347 <thread_create>:

// a wrapper func for clone
int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 347:	55                   	push   %ebp
 348:	89 e5                	mov    %esp,%ebp
 34a:	53                   	push   %ebx
 34b:	83 ec 10             	sub    $0x10,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE*2);
 34e:	68 00 20 00 00       	push   $0x2000
 353:	e8 f8 05 00 00       	call   950 <malloc>
  if(n_stack == 0){
 358:	83 c4 10             	add    $0x10,%esp
 35b:	85 c0                	test   %eax,%eax
 35d:	74 41                	je     3a0 <thread_create+0x59>
 35f:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  int new_pid = clone(start_routine, arg1, arg2, n_stack);
 361:	50                   	push   %eax
 362:	ff 75 10             	push   0x10(%ebp)
 365:	ff 75 0c             	push   0xc(%ebp)
 368:	ff 75 08             	push   0x8(%ebp)
 36b:	e8 05 03 00 00       	call   675 <clone>

  for(int i=0; i<64; i++){
 370:	83 c4 10             	add    $0x10,%esp
 373:	ba 00 00 00 00       	mov    $0x0,%edx
 378:	eb 03                	jmp    37d <thread_create+0x36>
 37a:	83 c2 01             	add    $0x1,%edx
 37d:	83 fa 3f             	cmp    $0x3f,%edx
 380:	7f 19                	jg     39b <thread_create+0x54>
    if(threads[i]->flag==0){
 382:	8b 0c 95 c0 0e 00 00 	mov    0xec0(,%edx,4),%ecx
 389:	83 79 08 00          	cmpl   $0x0,0x8(%ecx)
 38d:	75 eb                	jne    37a <thread_create+0x33>
      threads[i]->maddr = n_stack;
 38f:	89 19                	mov    %ebx,(%ecx)
      threads[i]->pg1addr = n_stack;
 391:	8b 14 95 c0 0e 00 00 	mov    0xec0(,%edx,4),%edx
 398:	89 5a 04             	mov    %ebx,0x4(%edx)
      break;
    }
  }

  return new_pid;
}
 39b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 39e:	c9                   	leave  
 39f:	c3                   	ret    
    return -1;
 3a0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 3a5:	eb f4                	jmp    39b <thread_create+0x54>

000003a7 <thread_join>:

//TODO: fix
int thread_join() {
 3a7:	55                   	push   %ebp
 3a8:	89 e5                	mov    %esp,%ebp
 3aa:	56                   	push   %esi
 3ab:	53                   	push   %ebx
 3ac:	83 ec 1c             	sub    $0x1c,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 3af:	8d 45 f4             	lea    -0xc(%ebp),%eax
 3b2:	50                   	push   %eax
 3b3:	e8 c5 02 00 00       	call   67d <join>
 3b8:	89 c6                	mov    %eax,%esi
  for(int i=0; i<64; i++){
 3ba:	83 c4 10             	add    $0x10,%esp
 3bd:	bb 00 00 00 00       	mov    $0x0,%ebx
 3c2:	eb 03                	jmp    3c7 <thread_join+0x20>
 3c4:	83 c3 01             	add    $0x1,%ebx
 3c7:	83 fb 3f             	cmp    $0x3f,%ebx
 3ca:	7f 23                	jg     3ef <thread_join+0x48>
    if((threads[i]->flag==1) && (stk_addr == threads[i]->pg1addr)){
 3cc:	8b 04 9d c0 0e 00 00 	mov    0xec0(,%ebx,4),%eax
 3d3:	83 78 08 01          	cmpl   $0x1,0x8(%eax)
 3d7:	75 eb                	jne    3c4 <thread_join+0x1d>
 3d9:	8b 55 f4             	mov    -0xc(%ebp),%edx
 3dc:	39 50 04             	cmp    %edx,0x4(%eax)
 3df:	75 e3                	jne    3c4 <thread_join+0x1d>
      free(stk_addr);
 3e1:	83 ec 0c             	sub    $0xc,%esp
 3e4:	52                   	push   %edx
 3e5:	e8 a6 04 00 00       	call   890 <free>
 3ea:	83 c4 10             	add    $0x10,%esp
 3ed:	eb d5                	jmp    3c4 <thread_join+0x1d>
    }
  }
  return pid;
}
 3ef:	89 f0                	mov    %esi,%eax
 3f1:	8d 65 f8             	lea    -0x8(%ebp),%esp
 3f4:	5b                   	pop    %ebx
 3f5:	5e                   	pop    %esi
 3f6:	5d                   	pop    %ebp
 3f7:	c3                   	ret    

000003f8 <lock_acquire>:

void lock_acquire(lock_t *lock){
 3f8:	55                   	push   %ebp
 3f9:	89 e5                	mov    %esp,%ebp
 3fb:	53                   	push   %ebx
 3fc:	83 ec 04             	sub    $0x4,%esp
 3ff:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 402:	83 ec 08             	sub    $0x8,%esp
 405:	6a 01                	push   $0x1
 407:	53                   	push   %ebx
 408:	e8 29 ff ff ff       	call   336 <test_and_set>
 40d:	83 c4 10             	add    $0x10,%esp
 410:	83 f8 01             	cmp    $0x1,%eax
 413:	74 ed                	je     402 <lock_acquire+0xa>
    ;
}
 415:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 418:	c9                   	leave  
 419:	c3                   	ret    

0000041a <lock_release>:

void lock_release(lock_t *lock) {
 41a:	55                   	push   %ebp
 41b:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 41d:	8b 45 08             	mov    0x8(%ebp),%eax
 420:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 426:	5d                   	pop    %ebp
 427:	c3                   	ret    

00000428 <lock_init>:

void lock_init(lock_t *lock) {
 428:	55                   	push   %ebp
 429:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 42b:	8b 45 08             	mov    0x8(%ebp),%eax
 42e:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 434:	5d                   	pop    %ebp
 435:	c3                   	ret    

00000436 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 436:	55                   	push   %ebp
 437:	89 e5                	mov    %esp,%ebp
 439:	56                   	push   %esi
 43a:	53                   	push   %ebx
 43b:	8b 75 08             	mov    0x8(%ebp),%esi
 43e:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 441:	89 f0                	mov    %esi,%eax
 443:	89 d1                	mov    %edx,%ecx
 445:	83 c2 01             	add    $0x1,%edx
 448:	89 c3                	mov    %eax,%ebx
 44a:	83 c0 01             	add    $0x1,%eax
 44d:	0f b6 09             	movzbl (%ecx),%ecx
 450:	88 0b                	mov    %cl,(%ebx)
 452:	84 c9                	test   %cl,%cl
 454:	75 ed                	jne    443 <strcpy+0xd>
    ;
  return os;
}
 456:	89 f0                	mov    %esi,%eax
 458:	5b                   	pop    %ebx
 459:	5e                   	pop    %esi
 45a:	5d                   	pop    %ebp
 45b:	c3                   	ret    

0000045c <strcmp>:

int
strcmp(const char *p, const char *q)
{
 45c:	55                   	push   %ebp
 45d:	89 e5                	mov    %esp,%ebp
 45f:	8b 4d 08             	mov    0x8(%ebp),%ecx
 462:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 465:	eb 06                	jmp    46d <strcmp+0x11>
    p++, q++;
 467:	83 c1 01             	add    $0x1,%ecx
 46a:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 46d:	0f b6 01             	movzbl (%ecx),%eax
 470:	84 c0                	test   %al,%al
 472:	74 04                	je     478 <strcmp+0x1c>
 474:	3a 02                	cmp    (%edx),%al
 476:	74 ef                	je     467 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 478:	0f b6 c0             	movzbl %al,%eax
 47b:	0f b6 12             	movzbl (%edx),%edx
 47e:	29 d0                	sub    %edx,%eax
}
 480:	5d                   	pop    %ebp
 481:	c3                   	ret    

00000482 <strlen>:

uint
strlen(const char *s)
{
 482:	55                   	push   %ebp
 483:	89 e5                	mov    %esp,%ebp
 485:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 488:	b8 00 00 00 00       	mov    $0x0,%eax
 48d:	eb 03                	jmp    492 <strlen+0x10>
 48f:	83 c0 01             	add    $0x1,%eax
 492:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 496:	75 f7                	jne    48f <strlen+0xd>
    ;
  return n;
}
 498:	5d                   	pop    %ebp
 499:	c3                   	ret    

0000049a <memset>:

void*
memset(void *dst, int c, uint n)
{
 49a:	55                   	push   %ebp
 49b:	89 e5                	mov    %esp,%ebp
 49d:	57                   	push   %edi
 49e:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 4a1:	89 d7                	mov    %edx,%edi
 4a3:	8b 4d 10             	mov    0x10(%ebp),%ecx
 4a6:	8b 45 0c             	mov    0xc(%ebp),%eax
 4a9:	fc                   	cld    
 4aa:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 4ac:	89 d0                	mov    %edx,%eax
 4ae:	8b 7d fc             	mov    -0x4(%ebp),%edi
 4b1:	c9                   	leave  
 4b2:	c3                   	ret    

000004b3 <strchr>:

char*
strchr(const char *s, char c)
{
 4b3:	55                   	push   %ebp
 4b4:	89 e5                	mov    %esp,%ebp
 4b6:	8b 45 08             	mov    0x8(%ebp),%eax
 4b9:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 4bd:	eb 03                	jmp    4c2 <strchr+0xf>
 4bf:	83 c0 01             	add    $0x1,%eax
 4c2:	0f b6 10             	movzbl (%eax),%edx
 4c5:	84 d2                	test   %dl,%dl
 4c7:	74 06                	je     4cf <strchr+0x1c>
    if(*s == c)
 4c9:	38 ca                	cmp    %cl,%dl
 4cb:	75 f2                	jne    4bf <strchr+0xc>
 4cd:	eb 05                	jmp    4d4 <strchr+0x21>
      return (char*)s;
  return 0;
 4cf:	b8 00 00 00 00       	mov    $0x0,%eax
}
 4d4:	5d                   	pop    %ebp
 4d5:	c3                   	ret    

000004d6 <gets>:

char*
gets(char *buf, int max)
{
 4d6:	55                   	push   %ebp
 4d7:	89 e5                	mov    %esp,%ebp
 4d9:	57                   	push   %edi
 4da:	56                   	push   %esi
 4db:	53                   	push   %ebx
 4dc:	83 ec 1c             	sub    $0x1c,%esp
 4df:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 4e2:	bb 00 00 00 00       	mov    $0x0,%ebx
 4e7:	89 de                	mov    %ebx,%esi
 4e9:	83 c3 01             	add    $0x1,%ebx
 4ec:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 4ef:	7d 2e                	jge    51f <gets+0x49>
    cc = read(0, &c, 1);
 4f1:	83 ec 04             	sub    $0x4,%esp
 4f4:	6a 01                	push   $0x1
 4f6:	8d 45 e7             	lea    -0x19(%ebp),%eax
 4f9:	50                   	push   %eax
 4fa:	6a 00                	push   $0x0
 4fc:	e8 ec 00 00 00       	call   5ed <read>
    if(cc < 1)
 501:	83 c4 10             	add    $0x10,%esp
 504:	85 c0                	test   %eax,%eax
 506:	7e 17                	jle    51f <gets+0x49>
      break;
    buf[i++] = c;
 508:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 50c:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 50f:	3c 0a                	cmp    $0xa,%al
 511:	0f 94 c2             	sete   %dl
 514:	3c 0d                	cmp    $0xd,%al
 516:	0f 94 c0             	sete   %al
 519:	08 c2                	or     %al,%dl
 51b:	74 ca                	je     4e7 <gets+0x11>
    buf[i++] = c;
 51d:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 51f:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 523:	89 f8                	mov    %edi,%eax
 525:	8d 65 f4             	lea    -0xc(%ebp),%esp
 528:	5b                   	pop    %ebx
 529:	5e                   	pop    %esi
 52a:	5f                   	pop    %edi
 52b:	5d                   	pop    %ebp
 52c:	c3                   	ret    

0000052d <stat>:

int
stat(const char *n, struct stat *st)
{
 52d:	55                   	push   %ebp
 52e:	89 e5                	mov    %esp,%ebp
 530:	56                   	push   %esi
 531:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 532:	83 ec 08             	sub    $0x8,%esp
 535:	6a 00                	push   $0x0
 537:	ff 75 08             	push   0x8(%ebp)
 53a:	e8 d6 00 00 00       	call   615 <open>
  if(fd < 0)
 53f:	83 c4 10             	add    $0x10,%esp
 542:	85 c0                	test   %eax,%eax
 544:	78 24                	js     56a <stat+0x3d>
 546:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 548:	83 ec 08             	sub    $0x8,%esp
 54b:	ff 75 0c             	push   0xc(%ebp)
 54e:	50                   	push   %eax
 54f:	e8 d9 00 00 00       	call   62d <fstat>
 554:	89 c6                	mov    %eax,%esi
  close(fd);
 556:	89 1c 24             	mov    %ebx,(%esp)
 559:	e8 9f 00 00 00       	call   5fd <close>
  return r;
 55e:	83 c4 10             	add    $0x10,%esp
}
 561:	89 f0                	mov    %esi,%eax
 563:	8d 65 f8             	lea    -0x8(%ebp),%esp
 566:	5b                   	pop    %ebx
 567:	5e                   	pop    %esi
 568:	5d                   	pop    %ebp
 569:	c3                   	ret    
    return -1;
 56a:	be ff ff ff ff       	mov    $0xffffffff,%esi
 56f:	eb f0                	jmp    561 <stat+0x34>

00000571 <atoi>:

int
atoi(const char *s)
{
 571:	55                   	push   %ebp
 572:	89 e5                	mov    %esp,%ebp
 574:	53                   	push   %ebx
 575:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 578:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 57d:	eb 10                	jmp    58f <atoi+0x1e>
    n = n*10 + *s++ - '0';
 57f:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 582:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 585:	83 c1 01             	add    $0x1,%ecx
 588:	0f be c0             	movsbl %al,%eax
 58b:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 58f:	0f b6 01             	movzbl (%ecx),%eax
 592:	8d 58 d0             	lea    -0x30(%eax),%ebx
 595:	80 fb 09             	cmp    $0x9,%bl
 598:	76 e5                	jbe    57f <atoi+0xe>
  return n;
}
 59a:	89 d0                	mov    %edx,%eax
 59c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 59f:	c9                   	leave  
 5a0:	c3                   	ret    

000005a1 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 5a1:	55                   	push   %ebp
 5a2:	89 e5                	mov    %esp,%ebp
 5a4:	56                   	push   %esi
 5a5:	53                   	push   %ebx
 5a6:	8b 75 08             	mov    0x8(%ebp),%esi
 5a9:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 5ac:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 5af:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 5b1:	eb 0d                	jmp    5c0 <memmove+0x1f>
    *dst++ = *src++;
 5b3:	0f b6 01             	movzbl (%ecx),%eax
 5b6:	88 02                	mov    %al,(%edx)
 5b8:	8d 49 01             	lea    0x1(%ecx),%ecx
 5bb:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 5be:	89 d8                	mov    %ebx,%eax
 5c0:	8d 58 ff             	lea    -0x1(%eax),%ebx
 5c3:	85 c0                	test   %eax,%eax
 5c5:	7f ec                	jg     5b3 <memmove+0x12>
  return vdst;
}
 5c7:	89 f0                	mov    %esi,%eax
 5c9:	5b                   	pop    %ebx
 5ca:	5e                   	pop    %esi
 5cb:	5d                   	pop    %ebp
 5cc:	c3                   	ret    

000005cd <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 5cd:	b8 01 00 00 00       	mov    $0x1,%eax
 5d2:	cd 40                	int    $0x40
 5d4:	c3                   	ret    

000005d5 <exit>:
SYSCALL(exit)
 5d5:	b8 02 00 00 00       	mov    $0x2,%eax
 5da:	cd 40                	int    $0x40
 5dc:	c3                   	ret    

000005dd <wait>:
SYSCALL(wait)
 5dd:	b8 03 00 00 00       	mov    $0x3,%eax
 5e2:	cd 40                	int    $0x40
 5e4:	c3                   	ret    

000005e5 <pipe>:
SYSCALL(pipe)
 5e5:	b8 04 00 00 00       	mov    $0x4,%eax
 5ea:	cd 40                	int    $0x40
 5ec:	c3                   	ret    

000005ed <read>:
SYSCALL(read)
 5ed:	b8 05 00 00 00       	mov    $0x5,%eax
 5f2:	cd 40                	int    $0x40
 5f4:	c3                   	ret    

000005f5 <write>:
SYSCALL(write)
 5f5:	b8 10 00 00 00       	mov    $0x10,%eax
 5fa:	cd 40                	int    $0x40
 5fc:	c3                   	ret    

000005fd <close>:
SYSCALL(close)
 5fd:	b8 15 00 00 00       	mov    $0x15,%eax
 602:	cd 40                	int    $0x40
 604:	c3                   	ret    

00000605 <kill>:
SYSCALL(kill)
 605:	b8 06 00 00 00       	mov    $0x6,%eax
 60a:	cd 40                	int    $0x40
 60c:	c3                   	ret    

0000060d <exec>:
SYSCALL(exec)
 60d:	b8 07 00 00 00       	mov    $0x7,%eax
 612:	cd 40                	int    $0x40
 614:	c3                   	ret    

00000615 <open>:
SYSCALL(open)
 615:	b8 0f 00 00 00       	mov    $0xf,%eax
 61a:	cd 40                	int    $0x40
 61c:	c3                   	ret    

0000061d <mknod>:
SYSCALL(mknod)
 61d:	b8 11 00 00 00       	mov    $0x11,%eax
 622:	cd 40                	int    $0x40
 624:	c3                   	ret    

00000625 <unlink>:
SYSCALL(unlink)
 625:	b8 12 00 00 00       	mov    $0x12,%eax
 62a:	cd 40                	int    $0x40
 62c:	c3                   	ret    

0000062d <fstat>:
SYSCALL(fstat)
 62d:	b8 08 00 00 00       	mov    $0x8,%eax
 632:	cd 40                	int    $0x40
 634:	c3                   	ret    

00000635 <link>:
SYSCALL(link)
 635:	b8 13 00 00 00       	mov    $0x13,%eax
 63a:	cd 40                	int    $0x40
 63c:	c3                   	ret    

0000063d <mkdir>:
SYSCALL(mkdir)
 63d:	b8 14 00 00 00       	mov    $0x14,%eax
 642:	cd 40                	int    $0x40
 644:	c3                   	ret    

00000645 <chdir>:
SYSCALL(chdir)
 645:	b8 09 00 00 00       	mov    $0x9,%eax
 64a:	cd 40                	int    $0x40
 64c:	c3                   	ret    

0000064d <dup>:
SYSCALL(dup)
 64d:	b8 0a 00 00 00       	mov    $0xa,%eax
 652:	cd 40                	int    $0x40
 654:	c3                   	ret    

00000655 <getpid>:
SYSCALL(getpid)
 655:	b8 0b 00 00 00       	mov    $0xb,%eax
 65a:	cd 40                	int    $0x40
 65c:	c3                   	ret    

0000065d <sbrk>:
SYSCALL(sbrk)
 65d:	b8 0c 00 00 00       	mov    $0xc,%eax
 662:	cd 40                	int    $0x40
 664:	c3                   	ret    

00000665 <sleep>:
SYSCALL(sleep)
 665:	b8 0d 00 00 00       	mov    $0xd,%eax
 66a:	cd 40                	int    $0x40
 66c:	c3                   	ret    

0000066d <uptime>:
SYSCALL(uptime)
 66d:	b8 0e 00 00 00       	mov    $0xe,%eax
 672:	cd 40                	int    $0x40
 674:	c3                   	ret    

00000675 <clone>:
SYSCALL(clone)
 675:	b8 16 00 00 00       	mov    $0x16,%eax
 67a:	cd 40                	int    $0x40
 67c:	c3                   	ret    

0000067d <join>:
 67d:	b8 17 00 00 00       	mov    $0x17,%eax
 682:	cd 40                	int    $0x40
 684:	c3                   	ret    

00000685 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 685:	55                   	push   %ebp
 686:	89 e5                	mov    %esp,%ebp
 688:	83 ec 1c             	sub    $0x1c,%esp
 68b:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 68e:	6a 01                	push   $0x1
 690:	8d 55 f4             	lea    -0xc(%ebp),%edx
 693:	52                   	push   %edx
 694:	50                   	push   %eax
 695:	e8 5b ff ff ff       	call   5f5 <write>
}
 69a:	83 c4 10             	add    $0x10,%esp
 69d:	c9                   	leave  
 69e:	c3                   	ret    

0000069f <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 69f:	55                   	push   %ebp
 6a0:	89 e5                	mov    %esp,%ebp
 6a2:	57                   	push   %edi
 6a3:	56                   	push   %esi
 6a4:	53                   	push   %ebx
 6a5:	83 ec 2c             	sub    $0x2c,%esp
 6a8:	89 45 d0             	mov    %eax,-0x30(%ebp)
 6ab:	89 d0                	mov    %edx,%eax
 6ad:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 6af:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 6b3:	0f 95 c1             	setne  %cl
 6b6:	c1 ea 1f             	shr    $0x1f,%edx
 6b9:	84 d1                	test   %dl,%cl
 6bb:	74 44                	je     701 <printint+0x62>
    neg = 1;
    x = -xx;
 6bd:	f7 d8                	neg    %eax
 6bf:	89 c1                	mov    %eax,%ecx
    neg = 1;
 6c1:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 6c8:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 6cd:	89 c8                	mov    %ecx,%eax
 6cf:	ba 00 00 00 00       	mov    $0x0,%edx
 6d4:	f7 f6                	div    %esi
 6d6:	89 df                	mov    %ebx,%edi
 6d8:	83 c3 01             	add    $0x1,%ebx
 6db:	0f b6 92 e8 0a 00 00 	movzbl 0xae8(%edx),%edx
 6e2:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 6e6:	89 ca                	mov    %ecx,%edx
 6e8:	89 c1                	mov    %eax,%ecx
 6ea:	39 d6                	cmp    %edx,%esi
 6ec:	76 df                	jbe    6cd <printint+0x2e>
  if(neg)
 6ee:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 6f2:	74 31                	je     725 <printint+0x86>
    buf[i++] = '-';
 6f4:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 6f9:	8d 5f 02             	lea    0x2(%edi),%ebx
 6fc:	8b 75 d0             	mov    -0x30(%ebp),%esi
 6ff:	eb 17                	jmp    718 <printint+0x79>
    x = xx;
 701:	89 c1                	mov    %eax,%ecx
  neg = 0;
 703:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 70a:	eb bc                	jmp    6c8 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 70c:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 711:	89 f0                	mov    %esi,%eax
 713:	e8 6d ff ff ff       	call   685 <putc>
  while(--i >= 0)
 718:	83 eb 01             	sub    $0x1,%ebx
 71b:	79 ef                	jns    70c <printint+0x6d>
}
 71d:	83 c4 2c             	add    $0x2c,%esp
 720:	5b                   	pop    %ebx
 721:	5e                   	pop    %esi
 722:	5f                   	pop    %edi
 723:	5d                   	pop    %ebp
 724:	c3                   	ret    
 725:	8b 75 d0             	mov    -0x30(%ebp),%esi
 728:	eb ee                	jmp    718 <printint+0x79>

0000072a <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 72a:	55                   	push   %ebp
 72b:	89 e5                	mov    %esp,%ebp
 72d:	57                   	push   %edi
 72e:	56                   	push   %esi
 72f:	53                   	push   %ebx
 730:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 733:	8d 45 10             	lea    0x10(%ebp),%eax
 736:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 739:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 73e:	bb 00 00 00 00       	mov    $0x0,%ebx
 743:	eb 14                	jmp    759 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 745:	89 fa                	mov    %edi,%edx
 747:	8b 45 08             	mov    0x8(%ebp),%eax
 74a:	e8 36 ff ff ff       	call   685 <putc>
 74f:	eb 05                	jmp    756 <printf+0x2c>
      }
    } else if(state == '%'){
 751:	83 fe 25             	cmp    $0x25,%esi
 754:	74 25                	je     77b <printf+0x51>
  for(i = 0; fmt[i]; i++){
 756:	83 c3 01             	add    $0x1,%ebx
 759:	8b 45 0c             	mov    0xc(%ebp),%eax
 75c:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 760:	84 c0                	test   %al,%al
 762:	0f 84 20 01 00 00    	je     888 <printf+0x15e>
    c = fmt[i] & 0xff;
 768:	0f be f8             	movsbl %al,%edi
 76b:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 76e:	85 f6                	test   %esi,%esi
 770:	75 df                	jne    751 <printf+0x27>
      if(c == '%'){
 772:	83 f8 25             	cmp    $0x25,%eax
 775:	75 ce                	jne    745 <printf+0x1b>
        state = '%';
 777:	89 c6                	mov    %eax,%esi
 779:	eb db                	jmp    756 <printf+0x2c>
      if(c == 'd'){
 77b:	83 f8 25             	cmp    $0x25,%eax
 77e:	0f 84 cf 00 00 00    	je     853 <printf+0x129>
 784:	0f 8c dd 00 00 00    	jl     867 <printf+0x13d>
 78a:	83 f8 78             	cmp    $0x78,%eax
 78d:	0f 8f d4 00 00 00    	jg     867 <printf+0x13d>
 793:	83 f8 63             	cmp    $0x63,%eax
 796:	0f 8c cb 00 00 00    	jl     867 <printf+0x13d>
 79c:	83 e8 63             	sub    $0x63,%eax
 79f:	83 f8 15             	cmp    $0x15,%eax
 7a2:	0f 87 bf 00 00 00    	ja     867 <printf+0x13d>
 7a8:	ff 24 85 90 0a 00 00 	jmp    *0xa90(,%eax,4)
        printint(fd, *ap, 10, 1);
 7af:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7b2:	8b 17                	mov    (%edi),%edx
 7b4:	83 ec 0c             	sub    $0xc,%esp
 7b7:	6a 01                	push   $0x1
 7b9:	b9 0a 00 00 00       	mov    $0xa,%ecx
 7be:	8b 45 08             	mov    0x8(%ebp),%eax
 7c1:	e8 d9 fe ff ff       	call   69f <printint>
        ap++;
 7c6:	83 c7 04             	add    $0x4,%edi
 7c9:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 7cc:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 7cf:	be 00 00 00 00       	mov    $0x0,%esi
 7d4:	eb 80                	jmp    756 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 7d6:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7d9:	8b 17                	mov    (%edi),%edx
 7db:	83 ec 0c             	sub    $0xc,%esp
 7de:	6a 00                	push   $0x0
 7e0:	b9 10 00 00 00       	mov    $0x10,%ecx
 7e5:	8b 45 08             	mov    0x8(%ebp),%eax
 7e8:	e8 b2 fe ff ff       	call   69f <printint>
        ap++;
 7ed:	83 c7 04             	add    $0x4,%edi
 7f0:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 7f3:	83 c4 10             	add    $0x10,%esp
      state = 0;
 7f6:	be 00 00 00 00       	mov    $0x0,%esi
 7fb:	e9 56 ff ff ff       	jmp    756 <printf+0x2c>
        s = (char*)*ap;
 800:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 803:	8b 30                	mov    (%eax),%esi
        ap++;
 805:	83 c0 04             	add    $0x4,%eax
 808:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 80b:	85 f6                	test   %esi,%esi
 80d:	75 15                	jne    824 <printf+0xfa>
          s = "(null)";
 80f:	be 87 0a 00 00       	mov    $0xa87,%esi
 814:	eb 0e                	jmp    824 <printf+0xfa>
          putc(fd, *s);
 816:	0f be d2             	movsbl %dl,%edx
 819:	8b 45 08             	mov    0x8(%ebp),%eax
 81c:	e8 64 fe ff ff       	call   685 <putc>
          s++;
 821:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 824:	0f b6 16             	movzbl (%esi),%edx
 827:	84 d2                	test   %dl,%dl
 829:	75 eb                	jne    816 <printf+0xec>
      state = 0;
 82b:	be 00 00 00 00       	mov    $0x0,%esi
 830:	e9 21 ff ff ff       	jmp    756 <printf+0x2c>
        putc(fd, *ap);
 835:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 838:	0f be 17             	movsbl (%edi),%edx
 83b:	8b 45 08             	mov    0x8(%ebp),%eax
 83e:	e8 42 fe ff ff       	call   685 <putc>
        ap++;
 843:	83 c7 04             	add    $0x4,%edi
 846:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 849:	be 00 00 00 00       	mov    $0x0,%esi
 84e:	e9 03 ff ff ff       	jmp    756 <printf+0x2c>
        putc(fd, c);
 853:	89 fa                	mov    %edi,%edx
 855:	8b 45 08             	mov    0x8(%ebp),%eax
 858:	e8 28 fe ff ff       	call   685 <putc>
      state = 0;
 85d:	be 00 00 00 00       	mov    $0x0,%esi
 862:	e9 ef fe ff ff       	jmp    756 <printf+0x2c>
        putc(fd, '%');
 867:	ba 25 00 00 00       	mov    $0x25,%edx
 86c:	8b 45 08             	mov    0x8(%ebp),%eax
 86f:	e8 11 fe ff ff       	call   685 <putc>
        putc(fd, c);
 874:	89 fa                	mov    %edi,%edx
 876:	8b 45 08             	mov    0x8(%ebp),%eax
 879:	e8 07 fe ff ff       	call   685 <putc>
      state = 0;
 87e:	be 00 00 00 00       	mov    $0x0,%esi
 883:	e9 ce fe ff ff       	jmp    756 <printf+0x2c>
    }
  }
}
 888:	8d 65 f4             	lea    -0xc(%ebp),%esp
 88b:	5b                   	pop    %ebx
 88c:	5e                   	pop    %esi
 88d:	5f                   	pop    %edi
 88e:	5d                   	pop    %ebp
 88f:	c3                   	ret    

00000890 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 890:	55                   	push   %ebp
 891:	89 e5                	mov    %esp,%ebp
 893:	57                   	push   %edi
 894:	56                   	push   %esi
 895:	53                   	push   %ebx
 896:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 899:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 89c:	a1 c0 0f 00 00       	mov    0xfc0,%eax
 8a1:	eb 02                	jmp    8a5 <free+0x15>
 8a3:	89 d0                	mov    %edx,%eax
 8a5:	39 c8                	cmp    %ecx,%eax
 8a7:	73 04                	jae    8ad <free+0x1d>
 8a9:	39 08                	cmp    %ecx,(%eax)
 8ab:	77 12                	ja     8bf <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8ad:	8b 10                	mov    (%eax),%edx
 8af:	39 c2                	cmp    %eax,%edx
 8b1:	77 f0                	ja     8a3 <free+0x13>
 8b3:	39 c8                	cmp    %ecx,%eax
 8b5:	72 08                	jb     8bf <free+0x2f>
 8b7:	39 ca                	cmp    %ecx,%edx
 8b9:	77 04                	ja     8bf <free+0x2f>
 8bb:	89 d0                	mov    %edx,%eax
 8bd:	eb e6                	jmp    8a5 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 8bf:	8b 73 fc             	mov    -0x4(%ebx),%esi
 8c2:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 8c5:	8b 10                	mov    (%eax),%edx
 8c7:	39 d7                	cmp    %edx,%edi
 8c9:	74 19                	je     8e4 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 8cb:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 8ce:	8b 50 04             	mov    0x4(%eax),%edx
 8d1:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 8d4:	39 ce                	cmp    %ecx,%esi
 8d6:	74 1b                	je     8f3 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 8d8:	89 08                	mov    %ecx,(%eax)
  freep = p;
 8da:	a3 c0 0f 00 00       	mov    %eax,0xfc0
}
 8df:	5b                   	pop    %ebx
 8e0:	5e                   	pop    %esi
 8e1:	5f                   	pop    %edi
 8e2:	5d                   	pop    %ebp
 8e3:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 8e4:	03 72 04             	add    0x4(%edx),%esi
 8e7:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 8ea:	8b 10                	mov    (%eax),%edx
 8ec:	8b 12                	mov    (%edx),%edx
 8ee:	89 53 f8             	mov    %edx,-0x8(%ebx)
 8f1:	eb db                	jmp    8ce <free+0x3e>
    p->s.size += bp->s.size;
 8f3:	03 53 fc             	add    -0x4(%ebx),%edx
 8f6:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 8f9:	8b 53 f8             	mov    -0x8(%ebx),%edx
 8fc:	89 10                	mov    %edx,(%eax)
 8fe:	eb da                	jmp    8da <free+0x4a>

00000900 <morecore>:

static Header*
morecore(uint nu)
{
 900:	55                   	push   %ebp
 901:	89 e5                	mov    %esp,%ebp
 903:	53                   	push   %ebx
 904:	83 ec 04             	sub    $0x4,%esp
 907:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 909:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 90e:	77 05                	ja     915 <morecore+0x15>
    nu = 4096;
 910:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 915:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 91c:	83 ec 0c             	sub    $0xc,%esp
 91f:	50                   	push   %eax
 920:	e8 38 fd ff ff       	call   65d <sbrk>
  if(p == (char*)-1)
 925:	83 c4 10             	add    $0x10,%esp
 928:	83 f8 ff             	cmp    $0xffffffff,%eax
 92b:	74 1c                	je     949 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 92d:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 930:	83 c0 08             	add    $0x8,%eax
 933:	83 ec 0c             	sub    $0xc,%esp
 936:	50                   	push   %eax
 937:	e8 54 ff ff ff       	call   890 <free>
  return freep;
 93c:	a1 c0 0f 00 00       	mov    0xfc0,%eax
 941:	83 c4 10             	add    $0x10,%esp
}
 944:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 947:	c9                   	leave  
 948:	c3                   	ret    
    return 0;
 949:	b8 00 00 00 00       	mov    $0x0,%eax
 94e:	eb f4                	jmp    944 <morecore+0x44>

00000950 <malloc>:

void*
malloc(uint nbytes)
{
 950:	55                   	push   %ebp
 951:	89 e5                	mov    %esp,%ebp
 953:	53                   	push   %ebx
 954:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 957:	8b 45 08             	mov    0x8(%ebp),%eax
 95a:	8d 58 07             	lea    0x7(%eax),%ebx
 95d:	c1 eb 03             	shr    $0x3,%ebx
 960:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 963:	8b 0d c0 0f 00 00    	mov    0xfc0,%ecx
 969:	85 c9                	test   %ecx,%ecx
 96b:	74 04                	je     971 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 96d:	8b 01                	mov    (%ecx),%eax
 96f:	eb 4a                	jmp    9bb <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 971:	c7 05 c0 0f 00 00 c4 	movl   $0xfc4,0xfc0
 978:	0f 00 00 
 97b:	c7 05 c4 0f 00 00 c4 	movl   $0xfc4,0xfc4
 982:	0f 00 00 
    base.s.size = 0;
 985:	c7 05 c8 0f 00 00 00 	movl   $0x0,0xfc8
 98c:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 98f:	b9 c4 0f 00 00       	mov    $0xfc4,%ecx
 994:	eb d7                	jmp    96d <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 996:	74 19                	je     9b1 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 998:	29 da                	sub    %ebx,%edx
 99a:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 99d:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 9a0:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 9a3:	89 0d c0 0f 00 00    	mov    %ecx,0xfc0
      return (void*)(p + 1);
 9a9:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 9ac:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 9af:	c9                   	leave  
 9b0:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 9b1:	8b 10                	mov    (%eax),%edx
 9b3:	89 11                	mov    %edx,(%ecx)
 9b5:	eb ec                	jmp    9a3 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9b7:	89 c1                	mov    %eax,%ecx
 9b9:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 9bb:	8b 50 04             	mov    0x4(%eax),%edx
 9be:	39 da                	cmp    %ebx,%edx
 9c0:	73 d4                	jae    996 <malloc+0x46>
    if(p == freep)
 9c2:	39 05 c0 0f 00 00    	cmp    %eax,0xfc0
 9c8:	75 ed                	jne    9b7 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 9ca:	89 d8                	mov    %ebx,%eax
 9cc:	e8 2f ff ff ff       	call   900 <morecore>
 9d1:	85 c0                	test   %eax,%eax
 9d3:	75 e2                	jne    9b7 <malloc+0x67>
 9d5:	eb d5                	jmp    9ac <malloc+0x5c>
