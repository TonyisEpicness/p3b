
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
  1c:	a1 88 0e 00 00       	mov    0xe88,%eax
  21:	83 f8 01             	cmp    $0x1,%eax
  24:	0f 84 db 00 00 00    	je     105 <worker+0x105>
  2a:	6a 38                	push   $0x38
  2c:	68 e0 09 00 00       	push   $0x9e0
  31:	68 e9 09 00 00       	push   $0x9e9
  36:	6a 01                	push   $0x1
  38:	e8 f5 06 00 00       	call   732 <printf>
  3d:	83 c4 0c             	add    $0xc,%esp
  40:	68 28 0a 00 00       	push   $0xa28
  45:	68 fc 09 00 00       	push   $0x9fc
  4a:	6a 01                	push   $0x1
  4c:	e8 e1 06 00 00       	call   732 <printf>
  51:	83 c4 08             	add    $0x8,%esp
  54:	68 10 0a 00 00       	push   $0xa10
  59:	6a 01                	push   $0x1
  5b:	e8 d2 06 00 00       	call   732 <printf>
  60:	83 c4 04             	add    $0x4,%esp
  63:	ff 35 a0 0e 00 00    	push   0xea0
  69:	e8 9f 05 00 00       	call   60d <kill>
  6e:	e8 6a 05 00 00       	call   5dd <exit>
   assert(tmp1 == 42);
  73:	6a 36                	push   $0x36
  75:	68 e0 09 00 00       	push   $0x9e0
  7a:	68 e9 09 00 00       	push   $0x9e9
  7f:	6a 01                	push   $0x1
  81:	e8 ac 06 00 00       	call   732 <printf>
  86:	83 c4 0c             	add    $0xc,%esp
  89:	68 f1 09 00 00       	push   $0x9f1
  8e:	68 fc 09 00 00       	push   $0x9fc
  93:	6a 01                	push   $0x1
  95:	e8 98 06 00 00       	call   732 <printf>
  9a:	83 c4 08             	add    $0x8,%esp
  9d:	68 10 0a 00 00       	push   $0xa10
  a2:	6a 01                	push   $0x1
  a4:	e8 89 06 00 00       	call   732 <printf>
  a9:	83 c4 04             	add    $0x4,%esp
  ac:	ff 35 a0 0e 00 00    	push   0xea0
  b2:	e8 56 05 00 00       	call   60d <kill>
  b7:	e8 21 05 00 00       	call   5dd <exit>
   assert(tmp2 == 24);
  bc:	6a 37                	push   $0x37
  be:	68 e0 09 00 00       	push   $0x9e0
  c3:	68 e9 09 00 00       	push   $0x9e9
  c8:	6a 01                	push   $0x1
  ca:	e8 63 06 00 00       	call   732 <printf>
  cf:	83 c4 0c             	add    $0xc,%esp
  d2:	68 1d 0a 00 00       	push   $0xa1d
  d7:	68 fc 09 00 00       	push   $0x9fc
  dc:	6a 01                	push   $0x1
  de:	e8 4f 06 00 00       	call   732 <printf>
  e3:	83 c4 08             	add    $0x8,%esp
  e6:	68 10 0a 00 00       	push   $0xa10
  eb:	6a 01                	push   $0x1
  ed:	e8 40 06 00 00       	call   732 <printf>
  f2:	83 c4 04             	add    $0x4,%esp
  f5:	ff 35 a0 0e 00 00    	push   0xea0
  fb:	e8 0d 05 00 00       	call   60d <kill>
 100:	e8 d8 04 00 00       	call   5dd <exit>
   global++;
 105:	83 c0 01             	add    $0x1,%eax
 108:	a3 88 0e 00 00       	mov    %eax,0xe88
   exit();
 10d:	e8 cb 04 00 00       	call   5dd <exit>

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
 126:	e8 32 05 00 00       	call   65d <getpid>
 12b:	a3 a0 0e 00 00       	mov    %eax,0xea0
   void *stack, *p = malloc(PGSIZE * 2);
 130:	83 ec 0c             	sub    $0xc,%esp
 133:	68 00 20 00 00       	push   $0x2000
 138:	e8 1b 08 00 00       	call   958 <malloc>
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
 15a:	68 e0 09 00 00       	push   $0x9e0
 15f:	68 e9 09 00 00       	push   $0x9e9
 164:	6a 01                	push   $0x1
 166:	e8 c7 05 00 00       	call   732 <printf>
 16b:	83 c4 0c             	add    $0xc,%esp
 16e:	68 34 0a 00 00       	push   $0xa34
 173:	68 fc 09 00 00       	push   $0x9fc
 178:	6a 01                	push   $0x1
 17a:	e8 b3 05 00 00       	call   732 <printf>
 17f:	83 c4 08             	add    $0x8,%esp
 182:	68 10 0a 00 00       	push   $0xa10
 187:	6a 01                	push   $0x1
 189:	e8 a4 05 00 00       	call   732 <printf>
 18e:	83 c4 04             	add    $0x4,%esp
 191:	ff 35 a0 0e 00 00    	push   0xea0
 197:	e8 71 04 00 00       	call   60d <kill>
 19c:	e8 3c 04 00 00       	call   5dd <exit>
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
 1bf:	e8 b9 04 00 00       	call   67d <clone>
 1c4:	89 c6                	mov    %eax,%esi
   assert(clone_pid > 0);
 1c6:	83 c4 10             	add    $0x10,%esp
 1c9:	85 c0                	test   %eax,%eax
 1cb:	7e 69                	jle    236 <main+0x124>
   int join_pid = join(&join_stack);
 1cd:	83 ec 0c             	sub    $0xc,%esp
 1d0:	8d 45 dc             	lea    -0x24(%ebp),%eax
 1d3:	50                   	push   %eax
 1d4:	e8 ac 04 00 00       	call   685 <join>
   assert(join_pid == clone_pid);
 1d9:	83 c4 10             	add    $0x10,%esp
 1dc:	39 c6                	cmp    %eax,%esi
 1de:	0f 85 9b 00 00 00    	jne    27f <main+0x16d>
   assert(stack == join_stack);
 1e4:	39 7d dc             	cmp    %edi,-0x24(%ebp)
 1e7:	0f 84 db 00 00 00    	je     2c8 <main+0x1b6>
 1ed:	6a 2a                	push   $0x2a
 1ef:	68 e0 09 00 00       	push   $0x9e0
 1f4:	68 e9 09 00 00       	push   $0x9e9
 1f9:	6a 01                	push   $0x1
 1fb:	e8 32 05 00 00       	call   732 <printf>
 200:	83 c4 0c             	add    $0xc,%esp
 203:	68 62 0a 00 00       	push   $0xa62
 208:	68 fc 09 00 00       	push   $0x9fc
 20d:	6a 01                	push   $0x1
 20f:	e8 1e 05 00 00       	call   732 <printf>
 214:	83 c4 08             	add    $0x8,%esp
 217:	68 10 0a 00 00       	push   $0xa10
 21c:	6a 01                	push   $0x1
 21e:	e8 0f 05 00 00       	call   732 <printf>
 223:	83 c4 04             	add    $0x4,%esp
 226:	ff 35 a0 0e 00 00    	push   0xea0
 22c:	e8 dc 03 00 00       	call   60d <kill>
 231:	e8 a7 03 00 00       	call   5dd <exit>
   assert(clone_pid > 0);
 236:	6a 25                	push   $0x25
 238:	68 e0 09 00 00       	push   $0x9e0
 23d:	68 e9 09 00 00       	push   $0x9e9
 242:	6a 01                	push   $0x1
 244:	e8 e9 04 00 00       	call   732 <printf>
 249:	83 c4 0c             	add    $0xc,%esp
 24c:	68 3e 0a 00 00       	push   $0xa3e
 251:	68 fc 09 00 00       	push   $0x9fc
 256:	6a 01                	push   $0x1
 258:	e8 d5 04 00 00       	call   732 <printf>
 25d:	83 c4 08             	add    $0x8,%esp
 260:	68 10 0a 00 00       	push   $0xa10
 265:	6a 01                	push   $0x1
 267:	e8 c6 04 00 00       	call   732 <printf>
 26c:	83 c4 04             	add    $0x4,%esp
 26f:	ff 35 a0 0e 00 00    	push   0xea0
 275:	e8 93 03 00 00       	call   60d <kill>
 27a:	e8 5e 03 00 00       	call   5dd <exit>
   assert(join_pid == clone_pid);
 27f:	6a 29                	push   $0x29
 281:	68 e0 09 00 00       	push   $0x9e0
 286:	68 e9 09 00 00       	push   $0x9e9
 28b:	6a 01                	push   $0x1
 28d:	e8 a0 04 00 00       	call   732 <printf>
 292:	83 c4 0c             	add    $0xc,%esp
 295:	68 4c 0a 00 00       	push   $0xa4c
 29a:	68 fc 09 00 00       	push   $0x9fc
 29f:	6a 01                	push   $0x1
 2a1:	e8 8c 04 00 00       	call   732 <printf>
 2a6:	83 c4 08             	add    $0x8,%esp
 2a9:	68 10 0a 00 00       	push   $0xa10
 2ae:	6a 01                	push   $0x1
 2b0:	e8 7d 04 00 00       	call   732 <printf>
 2b5:	83 c4 04             	add    $0x4,%esp
 2b8:	ff 35 a0 0e 00 00    	push   0xea0
 2be:	e8 4a 03 00 00       	call   60d <kill>
 2c3:	e8 15 03 00 00       	call   5dd <exit>
   assert(global == 2);
 2c8:	83 3d 88 0e 00 00 02 	cmpl   $0x2,0xe88
 2cf:	74 49                	je     31a <main+0x208>
 2d1:	6a 2b                	push   $0x2b
 2d3:	68 e0 09 00 00       	push   $0x9e0
 2d8:	68 e9 09 00 00       	push   $0x9e9
 2dd:	6a 01                	push   $0x1
 2df:	e8 4e 04 00 00       	call   732 <printf>
 2e4:	83 c4 0c             	add    $0xc,%esp
 2e7:	68 76 0a 00 00       	push   $0xa76
 2ec:	68 fc 09 00 00       	push   $0x9fc
 2f1:	6a 01                	push   $0x1
 2f3:	e8 3a 04 00 00       	call   732 <printf>
 2f8:	83 c4 08             	add    $0x8,%esp
 2fb:	68 10 0a 00 00       	push   $0xa10
 300:	6a 01                	push   $0x1
 302:	e8 2b 04 00 00       	call   732 <printf>
 307:	83 c4 04             	add    $0x4,%esp
 30a:	ff 35 a0 0e 00 00    	push   0xea0
 310:	e8 f8 02 00 00       	call   60d <kill>
 315:	e8 c3 02 00 00       	call   5dd <exit>
   printf(1, "TEST PASSED\n");
 31a:	83 ec 08             	sub    $0x8,%esp
 31d:	68 82 0a 00 00       	push   $0xa82
 322:	6a 01                	push   $0x1
 324:	e8 09 04 00 00       	call   732 <printf>
   free(p);
 329:	89 1c 24             	mov    %ebx,(%esp)
 32c:	e8 67 05 00 00       	call   898 <free>
   exit();
 331:	e8 a7 02 00 00       	call   5dd <exit>

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
 34a:	83 ec 14             	sub    $0x14,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE*2);
 34d:	68 00 20 00 00       	push   $0x2000
 352:	e8 01 06 00 00       	call   958 <malloc>
  if(n_stack == 0){
 357:	83 c4 10             	add    $0x10,%esp
 35a:	85 c0                	test   %eax,%eax
 35c:	74 4a                	je     3a8 <thread_create+0x61>
    return -1;
  }
  
  for(int i=0; i<64; i++){
 35e:	ba 00 00 00 00       	mov    $0x0,%edx
 363:	eb 03                	jmp    368 <thread_create+0x21>
 365:	83 c2 01             	add    $0x1,%edx
 368:	83 fa 3f             	cmp    $0x3f,%edx
 36b:	7f 27                	jg     394 <thread_create+0x4d>
    if(threads[i]->flag==0){
 36d:	8b 0c 95 c0 0e 00 00 	mov    0xec0(,%edx,4),%ecx
 374:	83 79 08 00          	cmpl   $0x0,0x8(%ecx)
 378:	75 eb                	jne    365 <thread_create+0x1e>
      threads[i]->maddr = n_stack;
 37a:	89 01                	mov    %eax,(%ecx)
      threads[i]->pg1addr = n_stack;
 37c:	8b 0c 95 c0 0e 00 00 	mov    0xec0(,%edx,4),%ecx
 383:	89 41 04             	mov    %eax,0x4(%ecx)
      threads[i]->flag = 1;
 386:	8b 14 95 c0 0e 00 00 	mov    0xec0(,%edx,4),%edx
 38d:	c7 42 08 01 00 00 00 	movl   $0x1,0x8(%edx)
      break;
    }
  }
  
  int new_pid = clone(start_routine, arg1, arg2, n_stack); // TODO: is this the right way to call it?
 394:	50                   	push   %eax
 395:	ff 75 10             	push   0x10(%ebp)
 398:	ff 75 0c             	push   0xc(%ebp)
 39b:	ff 75 08             	push   0x8(%ebp)
 39e:	e8 da 02 00 00       	call   67d <clone>

  // I can't remember if there was something else to do here but I'm sure I'll find out



  return new_pid;
 3a3:	83 c4 10             	add    $0x10,%esp
}
 3a6:	c9                   	leave  
 3a7:	c3                   	ret    
    return -1;
 3a8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 3ad:	eb f7                	jmp    3a6 <thread_create+0x5f>

000003af <thread_join>:

//TODO: fix
int thread_join() {
 3af:	55                   	push   %ebp
 3b0:	89 e5                	mov    %esp,%ebp
 3b2:	56                   	push   %esi
 3b3:	53                   	push   %ebx
 3b4:	83 ec 1c             	sub    $0x1c,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 3b7:	8d 45 f4             	lea    -0xc(%ebp),%eax
 3ba:	50                   	push   %eax
 3bb:	e8 c5 02 00 00       	call   685 <join>
 3c0:	89 c6                	mov    %eax,%esi
  for(int i=0; i<64; i++){
 3c2:	83 c4 10             	add    $0x10,%esp
 3c5:	bb 00 00 00 00       	mov    $0x0,%ebx
 3ca:	eb 03                	jmp    3cf <thread_join+0x20>
 3cc:	83 c3 01             	add    $0x1,%ebx
 3cf:	83 fb 3f             	cmp    $0x3f,%ebx
 3d2:	7f 23                	jg     3f7 <thread_join+0x48>
    if((threads[i]->flag==1) && (stk_addr == threads[i]->pg1addr)){
 3d4:	8b 04 9d c0 0e 00 00 	mov    0xec0(,%ebx,4),%eax
 3db:	83 78 08 01          	cmpl   $0x1,0x8(%eax)
 3df:	75 eb                	jne    3cc <thread_join+0x1d>
 3e1:	8b 55 f4             	mov    -0xc(%ebp),%edx
 3e4:	39 50 04             	cmp    %edx,0x4(%eax)
 3e7:	75 e3                	jne    3cc <thread_join+0x1d>
      free(stk_addr);
 3e9:	83 ec 0c             	sub    $0xc,%esp
 3ec:	52                   	push   %edx
 3ed:	e8 a6 04 00 00       	call   898 <free>
 3f2:	83 c4 10             	add    $0x10,%esp
 3f5:	eb d5                	jmp    3cc <thread_join+0x1d>
    }
  }
  return pid;
}
 3f7:	89 f0                	mov    %esi,%eax
 3f9:	8d 65 f8             	lea    -0x8(%ebp),%esp
 3fc:	5b                   	pop    %ebx
 3fd:	5e                   	pop    %esi
 3fe:	5d                   	pop    %ebp
 3ff:	c3                   	ret    

00000400 <lock_acquire>:

void lock_acquire(lock_t *lock){
 400:	55                   	push   %ebp
 401:	89 e5                	mov    %esp,%ebp
 403:	53                   	push   %ebx
 404:	83 ec 04             	sub    $0x4,%esp
 407:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 40a:	83 ec 08             	sub    $0x8,%esp
 40d:	6a 01                	push   $0x1
 40f:	53                   	push   %ebx
 410:	e8 21 ff ff ff       	call   336 <test_and_set>
 415:	83 c4 10             	add    $0x10,%esp
 418:	83 f8 01             	cmp    $0x1,%eax
 41b:	74 ed                	je     40a <lock_acquire+0xa>
    ;
}
 41d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 420:	c9                   	leave  
 421:	c3                   	ret    

00000422 <lock_release>:

void lock_release(lock_t *lock) {
 422:	55                   	push   %ebp
 423:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 425:	8b 45 08             	mov    0x8(%ebp),%eax
 428:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 42e:	5d                   	pop    %ebp
 42f:	c3                   	ret    

00000430 <lock_init>:

void lock_init(lock_t *lock) {
 430:	55                   	push   %ebp
 431:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 433:	8b 45 08             	mov    0x8(%ebp),%eax
 436:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 43c:	5d                   	pop    %ebp
 43d:	c3                   	ret    

0000043e <strcpy>:

char*
strcpy(char *s, const char *t)
{
 43e:	55                   	push   %ebp
 43f:	89 e5                	mov    %esp,%ebp
 441:	56                   	push   %esi
 442:	53                   	push   %ebx
 443:	8b 75 08             	mov    0x8(%ebp),%esi
 446:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 449:	89 f0                	mov    %esi,%eax
 44b:	89 d1                	mov    %edx,%ecx
 44d:	83 c2 01             	add    $0x1,%edx
 450:	89 c3                	mov    %eax,%ebx
 452:	83 c0 01             	add    $0x1,%eax
 455:	0f b6 09             	movzbl (%ecx),%ecx
 458:	88 0b                	mov    %cl,(%ebx)
 45a:	84 c9                	test   %cl,%cl
 45c:	75 ed                	jne    44b <strcpy+0xd>
    ;
  return os;
}
 45e:	89 f0                	mov    %esi,%eax
 460:	5b                   	pop    %ebx
 461:	5e                   	pop    %esi
 462:	5d                   	pop    %ebp
 463:	c3                   	ret    

00000464 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 464:	55                   	push   %ebp
 465:	89 e5                	mov    %esp,%ebp
 467:	8b 4d 08             	mov    0x8(%ebp),%ecx
 46a:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 46d:	eb 06                	jmp    475 <strcmp+0x11>
    p++, q++;
 46f:	83 c1 01             	add    $0x1,%ecx
 472:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 475:	0f b6 01             	movzbl (%ecx),%eax
 478:	84 c0                	test   %al,%al
 47a:	74 04                	je     480 <strcmp+0x1c>
 47c:	3a 02                	cmp    (%edx),%al
 47e:	74 ef                	je     46f <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 480:	0f b6 c0             	movzbl %al,%eax
 483:	0f b6 12             	movzbl (%edx),%edx
 486:	29 d0                	sub    %edx,%eax
}
 488:	5d                   	pop    %ebp
 489:	c3                   	ret    

0000048a <strlen>:

uint
strlen(const char *s)
{
 48a:	55                   	push   %ebp
 48b:	89 e5                	mov    %esp,%ebp
 48d:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 490:	b8 00 00 00 00       	mov    $0x0,%eax
 495:	eb 03                	jmp    49a <strlen+0x10>
 497:	83 c0 01             	add    $0x1,%eax
 49a:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 49e:	75 f7                	jne    497 <strlen+0xd>
    ;
  return n;
}
 4a0:	5d                   	pop    %ebp
 4a1:	c3                   	ret    

000004a2 <memset>:

void*
memset(void *dst, int c, uint n)
{
 4a2:	55                   	push   %ebp
 4a3:	89 e5                	mov    %esp,%ebp
 4a5:	57                   	push   %edi
 4a6:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 4a9:	89 d7                	mov    %edx,%edi
 4ab:	8b 4d 10             	mov    0x10(%ebp),%ecx
 4ae:	8b 45 0c             	mov    0xc(%ebp),%eax
 4b1:	fc                   	cld    
 4b2:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 4b4:	89 d0                	mov    %edx,%eax
 4b6:	8b 7d fc             	mov    -0x4(%ebp),%edi
 4b9:	c9                   	leave  
 4ba:	c3                   	ret    

000004bb <strchr>:

char*
strchr(const char *s, char c)
{
 4bb:	55                   	push   %ebp
 4bc:	89 e5                	mov    %esp,%ebp
 4be:	8b 45 08             	mov    0x8(%ebp),%eax
 4c1:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 4c5:	eb 03                	jmp    4ca <strchr+0xf>
 4c7:	83 c0 01             	add    $0x1,%eax
 4ca:	0f b6 10             	movzbl (%eax),%edx
 4cd:	84 d2                	test   %dl,%dl
 4cf:	74 06                	je     4d7 <strchr+0x1c>
    if(*s == c)
 4d1:	38 ca                	cmp    %cl,%dl
 4d3:	75 f2                	jne    4c7 <strchr+0xc>
 4d5:	eb 05                	jmp    4dc <strchr+0x21>
      return (char*)s;
  return 0;
 4d7:	b8 00 00 00 00       	mov    $0x0,%eax
}
 4dc:	5d                   	pop    %ebp
 4dd:	c3                   	ret    

000004de <gets>:

char*
gets(char *buf, int max)
{
 4de:	55                   	push   %ebp
 4df:	89 e5                	mov    %esp,%ebp
 4e1:	57                   	push   %edi
 4e2:	56                   	push   %esi
 4e3:	53                   	push   %ebx
 4e4:	83 ec 1c             	sub    $0x1c,%esp
 4e7:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 4ea:	bb 00 00 00 00       	mov    $0x0,%ebx
 4ef:	89 de                	mov    %ebx,%esi
 4f1:	83 c3 01             	add    $0x1,%ebx
 4f4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 4f7:	7d 2e                	jge    527 <gets+0x49>
    cc = read(0, &c, 1);
 4f9:	83 ec 04             	sub    $0x4,%esp
 4fc:	6a 01                	push   $0x1
 4fe:	8d 45 e7             	lea    -0x19(%ebp),%eax
 501:	50                   	push   %eax
 502:	6a 00                	push   $0x0
 504:	e8 ec 00 00 00       	call   5f5 <read>
    if(cc < 1)
 509:	83 c4 10             	add    $0x10,%esp
 50c:	85 c0                	test   %eax,%eax
 50e:	7e 17                	jle    527 <gets+0x49>
      break;
    buf[i++] = c;
 510:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 514:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 517:	3c 0a                	cmp    $0xa,%al
 519:	0f 94 c2             	sete   %dl
 51c:	3c 0d                	cmp    $0xd,%al
 51e:	0f 94 c0             	sete   %al
 521:	08 c2                	or     %al,%dl
 523:	74 ca                	je     4ef <gets+0x11>
    buf[i++] = c;
 525:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 527:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 52b:	89 f8                	mov    %edi,%eax
 52d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 530:	5b                   	pop    %ebx
 531:	5e                   	pop    %esi
 532:	5f                   	pop    %edi
 533:	5d                   	pop    %ebp
 534:	c3                   	ret    

00000535 <stat>:

int
stat(const char *n, struct stat *st)
{
 535:	55                   	push   %ebp
 536:	89 e5                	mov    %esp,%ebp
 538:	56                   	push   %esi
 539:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 53a:	83 ec 08             	sub    $0x8,%esp
 53d:	6a 00                	push   $0x0
 53f:	ff 75 08             	push   0x8(%ebp)
 542:	e8 d6 00 00 00       	call   61d <open>
  if(fd < 0)
 547:	83 c4 10             	add    $0x10,%esp
 54a:	85 c0                	test   %eax,%eax
 54c:	78 24                	js     572 <stat+0x3d>
 54e:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 550:	83 ec 08             	sub    $0x8,%esp
 553:	ff 75 0c             	push   0xc(%ebp)
 556:	50                   	push   %eax
 557:	e8 d9 00 00 00       	call   635 <fstat>
 55c:	89 c6                	mov    %eax,%esi
  close(fd);
 55e:	89 1c 24             	mov    %ebx,(%esp)
 561:	e8 9f 00 00 00       	call   605 <close>
  return r;
 566:	83 c4 10             	add    $0x10,%esp
}
 569:	89 f0                	mov    %esi,%eax
 56b:	8d 65 f8             	lea    -0x8(%ebp),%esp
 56e:	5b                   	pop    %ebx
 56f:	5e                   	pop    %esi
 570:	5d                   	pop    %ebp
 571:	c3                   	ret    
    return -1;
 572:	be ff ff ff ff       	mov    $0xffffffff,%esi
 577:	eb f0                	jmp    569 <stat+0x34>

00000579 <atoi>:

int
atoi(const char *s)
{
 579:	55                   	push   %ebp
 57a:	89 e5                	mov    %esp,%ebp
 57c:	53                   	push   %ebx
 57d:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 580:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 585:	eb 10                	jmp    597 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 587:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 58a:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 58d:	83 c1 01             	add    $0x1,%ecx
 590:	0f be c0             	movsbl %al,%eax
 593:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 597:	0f b6 01             	movzbl (%ecx),%eax
 59a:	8d 58 d0             	lea    -0x30(%eax),%ebx
 59d:	80 fb 09             	cmp    $0x9,%bl
 5a0:	76 e5                	jbe    587 <atoi+0xe>
  return n;
}
 5a2:	89 d0                	mov    %edx,%eax
 5a4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5a7:	c9                   	leave  
 5a8:	c3                   	ret    

000005a9 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 5a9:	55                   	push   %ebp
 5aa:	89 e5                	mov    %esp,%ebp
 5ac:	56                   	push   %esi
 5ad:	53                   	push   %ebx
 5ae:	8b 75 08             	mov    0x8(%ebp),%esi
 5b1:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 5b4:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 5b7:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 5b9:	eb 0d                	jmp    5c8 <memmove+0x1f>
    *dst++ = *src++;
 5bb:	0f b6 01             	movzbl (%ecx),%eax
 5be:	88 02                	mov    %al,(%edx)
 5c0:	8d 49 01             	lea    0x1(%ecx),%ecx
 5c3:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 5c6:	89 d8                	mov    %ebx,%eax
 5c8:	8d 58 ff             	lea    -0x1(%eax),%ebx
 5cb:	85 c0                	test   %eax,%eax
 5cd:	7f ec                	jg     5bb <memmove+0x12>
  return vdst;
}
 5cf:	89 f0                	mov    %esi,%eax
 5d1:	5b                   	pop    %ebx
 5d2:	5e                   	pop    %esi
 5d3:	5d                   	pop    %ebp
 5d4:	c3                   	ret    

000005d5 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 5d5:	b8 01 00 00 00       	mov    $0x1,%eax
 5da:	cd 40                	int    $0x40
 5dc:	c3                   	ret    

000005dd <exit>:
SYSCALL(exit)
 5dd:	b8 02 00 00 00       	mov    $0x2,%eax
 5e2:	cd 40                	int    $0x40
 5e4:	c3                   	ret    

000005e5 <wait>:
SYSCALL(wait)
 5e5:	b8 03 00 00 00       	mov    $0x3,%eax
 5ea:	cd 40                	int    $0x40
 5ec:	c3                   	ret    

000005ed <pipe>:
SYSCALL(pipe)
 5ed:	b8 04 00 00 00       	mov    $0x4,%eax
 5f2:	cd 40                	int    $0x40
 5f4:	c3                   	ret    

000005f5 <read>:
SYSCALL(read)
 5f5:	b8 05 00 00 00       	mov    $0x5,%eax
 5fa:	cd 40                	int    $0x40
 5fc:	c3                   	ret    

000005fd <write>:
SYSCALL(write)
 5fd:	b8 10 00 00 00       	mov    $0x10,%eax
 602:	cd 40                	int    $0x40
 604:	c3                   	ret    

00000605 <close>:
SYSCALL(close)
 605:	b8 15 00 00 00       	mov    $0x15,%eax
 60a:	cd 40                	int    $0x40
 60c:	c3                   	ret    

0000060d <kill>:
SYSCALL(kill)
 60d:	b8 06 00 00 00       	mov    $0x6,%eax
 612:	cd 40                	int    $0x40
 614:	c3                   	ret    

00000615 <exec>:
SYSCALL(exec)
 615:	b8 07 00 00 00       	mov    $0x7,%eax
 61a:	cd 40                	int    $0x40
 61c:	c3                   	ret    

0000061d <open>:
SYSCALL(open)
 61d:	b8 0f 00 00 00       	mov    $0xf,%eax
 622:	cd 40                	int    $0x40
 624:	c3                   	ret    

00000625 <mknod>:
SYSCALL(mknod)
 625:	b8 11 00 00 00       	mov    $0x11,%eax
 62a:	cd 40                	int    $0x40
 62c:	c3                   	ret    

0000062d <unlink>:
SYSCALL(unlink)
 62d:	b8 12 00 00 00       	mov    $0x12,%eax
 632:	cd 40                	int    $0x40
 634:	c3                   	ret    

00000635 <fstat>:
SYSCALL(fstat)
 635:	b8 08 00 00 00       	mov    $0x8,%eax
 63a:	cd 40                	int    $0x40
 63c:	c3                   	ret    

0000063d <link>:
SYSCALL(link)
 63d:	b8 13 00 00 00       	mov    $0x13,%eax
 642:	cd 40                	int    $0x40
 644:	c3                   	ret    

00000645 <mkdir>:
SYSCALL(mkdir)
 645:	b8 14 00 00 00       	mov    $0x14,%eax
 64a:	cd 40                	int    $0x40
 64c:	c3                   	ret    

0000064d <chdir>:
SYSCALL(chdir)
 64d:	b8 09 00 00 00       	mov    $0x9,%eax
 652:	cd 40                	int    $0x40
 654:	c3                   	ret    

00000655 <dup>:
SYSCALL(dup)
 655:	b8 0a 00 00 00       	mov    $0xa,%eax
 65a:	cd 40                	int    $0x40
 65c:	c3                   	ret    

0000065d <getpid>:
SYSCALL(getpid)
 65d:	b8 0b 00 00 00       	mov    $0xb,%eax
 662:	cd 40                	int    $0x40
 664:	c3                   	ret    

00000665 <sbrk>:
SYSCALL(sbrk)
 665:	b8 0c 00 00 00       	mov    $0xc,%eax
 66a:	cd 40                	int    $0x40
 66c:	c3                   	ret    

0000066d <sleep>:
SYSCALL(sleep)
 66d:	b8 0d 00 00 00       	mov    $0xd,%eax
 672:	cd 40                	int    $0x40
 674:	c3                   	ret    

00000675 <uptime>:
SYSCALL(uptime)
 675:	b8 0e 00 00 00       	mov    $0xe,%eax
 67a:	cd 40                	int    $0x40
 67c:	c3                   	ret    

0000067d <clone>:
SYSCALL(clone)
 67d:	b8 16 00 00 00       	mov    $0x16,%eax
 682:	cd 40                	int    $0x40
 684:	c3                   	ret    

00000685 <join>:
 685:	b8 17 00 00 00       	mov    $0x17,%eax
 68a:	cd 40                	int    $0x40
 68c:	c3                   	ret    

0000068d <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 68d:	55                   	push   %ebp
 68e:	89 e5                	mov    %esp,%ebp
 690:	83 ec 1c             	sub    $0x1c,%esp
 693:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 696:	6a 01                	push   $0x1
 698:	8d 55 f4             	lea    -0xc(%ebp),%edx
 69b:	52                   	push   %edx
 69c:	50                   	push   %eax
 69d:	e8 5b ff ff ff       	call   5fd <write>
}
 6a2:	83 c4 10             	add    $0x10,%esp
 6a5:	c9                   	leave  
 6a6:	c3                   	ret    

000006a7 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 6a7:	55                   	push   %ebp
 6a8:	89 e5                	mov    %esp,%ebp
 6aa:	57                   	push   %edi
 6ab:	56                   	push   %esi
 6ac:	53                   	push   %ebx
 6ad:	83 ec 2c             	sub    $0x2c,%esp
 6b0:	89 45 d0             	mov    %eax,-0x30(%ebp)
 6b3:	89 d0                	mov    %edx,%eax
 6b5:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 6b7:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 6bb:	0f 95 c1             	setne  %cl
 6be:	c1 ea 1f             	shr    $0x1f,%edx
 6c1:	84 d1                	test   %dl,%cl
 6c3:	74 44                	je     709 <printint+0x62>
    neg = 1;
    x = -xx;
 6c5:	f7 d8                	neg    %eax
 6c7:	89 c1                	mov    %eax,%ecx
    neg = 1;
 6c9:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 6d0:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 6d5:	89 c8                	mov    %ecx,%eax
 6d7:	ba 00 00 00 00       	mov    $0x0,%edx
 6dc:	f7 f6                	div    %esi
 6de:	89 df                	mov    %ebx,%edi
 6e0:	83 c3 01             	add    $0x1,%ebx
 6e3:	0f b6 92 f0 0a 00 00 	movzbl 0xaf0(%edx),%edx
 6ea:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 6ee:	89 ca                	mov    %ecx,%edx
 6f0:	89 c1                	mov    %eax,%ecx
 6f2:	39 d6                	cmp    %edx,%esi
 6f4:	76 df                	jbe    6d5 <printint+0x2e>
  if(neg)
 6f6:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 6fa:	74 31                	je     72d <printint+0x86>
    buf[i++] = '-';
 6fc:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 701:	8d 5f 02             	lea    0x2(%edi),%ebx
 704:	8b 75 d0             	mov    -0x30(%ebp),%esi
 707:	eb 17                	jmp    720 <printint+0x79>
    x = xx;
 709:	89 c1                	mov    %eax,%ecx
  neg = 0;
 70b:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 712:	eb bc                	jmp    6d0 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 714:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 719:	89 f0                	mov    %esi,%eax
 71b:	e8 6d ff ff ff       	call   68d <putc>
  while(--i >= 0)
 720:	83 eb 01             	sub    $0x1,%ebx
 723:	79 ef                	jns    714 <printint+0x6d>
}
 725:	83 c4 2c             	add    $0x2c,%esp
 728:	5b                   	pop    %ebx
 729:	5e                   	pop    %esi
 72a:	5f                   	pop    %edi
 72b:	5d                   	pop    %ebp
 72c:	c3                   	ret    
 72d:	8b 75 d0             	mov    -0x30(%ebp),%esi
 730:	eb ee                	jmp    720 <printint+0x79>

00000732 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 732:	55                   	push   %ebp
 733:	89 e5                	mov    %esp,%ebp
 735:	57                   	push   %edi
 736:	56                   	push   %esi
 737:	53                   	push   %ebx
 738:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 73b:	8d 45 10             	lea    0x10(%ebp),%eax
 73e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 741:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 746:	bb 00 00 00 00       	mov    $0x0,%ebx
 74b:	eb 14                	jmp    761 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 74d:	89 fa                	mov    %edi,%edx
 74f:	8b 45 08             	mov    0x8(%ebp),%eax
 752:	e8 36 ff ff ff       	call   68d <putc>
 757:	eb 05                	jmp    75e <printf+0x2c>
      }
    } else if(state == '%'){
 759:	83 fe 25             	cmp    $0x25,%esi
 75c:	74 25                	je     783 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 75e:	83 c3 01             	add    $0x1,%ebx
 761:	8b 45 0c             	mov    0xc(%ebp),%eax
 764:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 768:	84 c0                	test   %al,%al
 76a:	0f 84 20 01 00 00    	je     890 <printf+0x15e>
    c = fmt[i] & 0xff;
 770:	0f be f8             	movsbl %al,%edi
 773:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 776:	85 f6                	test   %esi,%esi
 778:	75 df                	jne    759 <printf+0x27>
      if(c == '%'){
 77a:	83 f8 25             	cmp    $0x25,%eax
 77d:	75 ce                	jne    74d <printf+0x1b>
        state = '%';
 77f:	89 c6                	mov    %eax,%esi
 781:	eb db                	jmp    75e <printf+0x2c>
      if(c == 'd'){
 783:	83 f8 25             	cmp    $0x25,%eax
 786:	0f 84 cf 00 00 00    	je     85b <printf+0x129>
 78c:	0f 8c dd 00 00 00    	jl     86f <printf+0x13d>
 792:	83 f8 78             	cmp    $0x78,%eax
 795:	0f 8f d4 00 00 00    	jg     86f <printf+0x13d>
 79b:	83 f8 63             	cmp    $0x63,%eax
 79e:	0f 8c cb 00 00 00    	jl     86f <printf+0x13d>
 7a4:	83 e8 63             	sub    $0x63,%eax
 7a7:	83 f8 15             	cmp    $0x15,%eax
 7aa:	0f 87 bf 00 00 00    	ja     86f <printf+0x13d>
 7b0:	ff 24 85 98 0a 00 00 	jmp    *0xa98(,%eax,4)
        printint(fd, *ap, 10, 1);
 7b7:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7ba:	8b 17                	mov    (%edi),%edx
 7bc:	83 ec 0c             	sub    $0xc,%esp
 7bf:	6a 01                	push   $0x1
 7c1:	b9 0a 00 00 00       	mov    $0xa,%ecx
 7c6:	8b 45 08             	mov    0x8(%ebp),%eax
 7c9:	e8 d9 fe ff ff       	call   6a7 <printint>
        ap++;
 7ce:	83 c7 04             	add    $0x4,%edi
 7d1:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 7d4:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 7d7:	be 00 00 00 00       	mov    $0x0,%esi
 7dc:	eb 80                	jmp    75e <printf+0x2c>
        printint(fd, *ap, 16, 0);
 7de:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7e1:	8b 17                	mov    (%edi),%edx
 7e3:	83 ec 0c             	sub    $0xc,%esp
 7e6:	6a 00                	push   $0x0
 7e8:	b9 10 00 00 00       	mov    $0x10,%ecx
 7ed:	8b 45 08             	mov    0x8(%ebp),%eax
 7f0:	e8 b2 fe ff ff       	call   6a7 <printint>
        ap++;
 7f5:	83 c7 04             	add    $0x4,%edi
 7f8:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 7fb:	83 c4 10             	add    $0x10,%esp
      state = 0;
 7fe:	be 00 00 00 00       	mov    $0x0,%esi
 803:	e9 56 ff ff ff       	jmp    75e <printf+0x2c>
        s = (char*)*ap;
 808:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 80b:	8b 30                	mov    (%eax),%esi
        ap++;
 80d:	83 c0 04             	add    $0x4,%eax
 810:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 813:	85 f6                	test   %esi,%esi
 815:	75 15                	jne    82c <printf+0xfa>
          s = "(null)";
 817:	be 8f 0a 00 00       	mov    $0xa8f,%esi
 81c:	eb 0e                	jmp    82c <printf+0xfa>
          putc(fd, *s);
 81e:	0f be d2             	movsbl %dl,%edx
 821:	8b 45 08             	mov    0x8(%ebp),%eax
 824:	e8 64 fe ff ff       	call   68d <putc>
          s++;
 829:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 82c:	0f b6 16             	movzbl (%esi),%edx
 82f:	84 d2                	test   %dl,%dl
 831:	75 eb                	jne    81e <printf+0xec>
      state = 0;
 833:	be 00 00 00 00       	mov    $0x0,%esi
 838:	e9 21 ff ff ff       	jmp    75e <printf+0x2c>
        putc(fd, *ap);
 83d:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 840:	0f be 17             	movsbl (%edi),%edx
 843:	8b 45 08             	mov    0x8(%ebp),%eax
 846:	e8 42 fe ff ff       	call   68d <putc>
        ap++;
 84b:	83 c7 04             	add    $0x4,%edi
 84e:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 851:	be 00 00 00 00       	mov    $0x0,%esi
 856:	e9 03 ff ff ff       	jmp    75e <printf+0x2c>
        putc(fd, c);
 85b:	89 fa                	mov    %edi,%edx
 85d:	8b 45 08             	mov    0x8(%ebp),%eax
 860:	e8 28 fe ff ff       	call   68d <putc>
      state = 0;
 865:	be 00 00 00 00       	mov    $0x0,%esi
 86a:	e9 ef fe ff ff       	jmp    75e <printf+0x2c>
        putc(fd, '%');
 86f:	ba 25 00 00 00       	mov    $0x25,%edx
 874:	8b 45 08             	mov    0x8(%ebp),%eax
 877:	e8 11 fe ff ff       	call   68d <putc>
        putc(fd, c);
 87c:	89 fa                	mov    %edi,%edx
 87e:	8b 45 08             	mov    0x8(%ebp),%eax
 881:	e8 07 fe ff ff       	call   68d <putc>
      state = 0;
 886:	be 00 00 00 00       	mov    $0x0,%esi
 88b:	e9 ce fe ff ff       	jmp    75e <printf+0x2c>
    }
  }
}
 890:	8d 65 f4             	lea    -0xc(%ebp),%esp
 893:	5b                   	pop    %ebx
 894:	5e                   	pop    %esi
 895:	5f                   	pop    %edi
 896:	5d                   	pop    %ebp
 897:	c3                   	ret    

00000898 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 898:	55                   	push   %ebp
 899:	89 e5                	mov    %esp,%ebp
 89b:	57                   	push   %edi
 89c:	56                   	push   %esi
 89d:	53                   	push   %ebx
 89e:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 8a1:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8a4:	a1 c0 0f 00 00       	mov    0xfc0,%eax
 8a9:	eb 02                	jmp    8ad <free+0x15>
 8ab:	89 d0                	mov    %edx,%eax
 8ad:	39 c8                	cmp    %ecx,%eax
 8af:	73 04                	jae    8b5 <free+0x1d>
 8b1:	39 08                	cmp    %ecx,(%eax)
 8b3:	77 12                	ja     8c7 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8b5:	8b 10                	mov    (%eax),%edx
 8b7:	39 c2                	cmp    %eax,%edx
 8b9:	77 f0                	ja     8ab <free+0x13>
 8bb:	39 c8                	cmp    %ecx,%eax
 8bd:	72 08                	jb     8c7 <free+0x2f>
 8bf:	39 ca                	cmp    %ecx,%edx
 8c1:	77 04                	ja     8c7 <free+0x2f>
 8c3:	89 d0                	mov    %edx,%eax
 8c5:	eb e6                	jmp    8ad <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 8c7:	8b 73 fc             	mov    -0x4(%ebx),%esi
 8ca:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 8cd:	8b 10                	mov    (%eax),%edx
 8cf:	39 d7                	cmp    %edx,%edi
 8d1:	74 19                	je     8ec <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 8d3:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 8d6:	8b 50 04             	mov    0x4(%eax),%edx
 8d9:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 8dc:	39 ce                	cmp    %ecx,%esi
 8de:	74 1b                	je     8fb <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 8e0:	89 08                	mov    %ecx,(%eax)
  freep = p;
 8e2:	a3 c0 0f 00 00       	mov    %eax,0xfc0
}
 8e7:	5b                   	pop    %ebx
 8e8:	5e                   	pop    %esi
 8e9:	5f                   	pop    %edi
 8ea:	5d                   	pop    %ebp
 8eb:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 8ec:	03 72 04             	add    0x4(%edx),%esi
 8ef:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 8f2:	8b 10                	mov    (%eax),%edx
 8f4:	8b 12                	mov    (%edx),%edx
 8f6:	89 53 f8             	mov    %edx,-0x8(%ebx)
 8f9:	eb db                	jmp    8d6 <free+0x3e>
    p->s.size += bp->s.size;
 8fb:	03 53 fc             	add    -0x4(%ebx),%edx
 8fe:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 901:	8b 53 f8             	mov    -0x8(%ebx),%edx
 904:	89 10                	mov    %edx,(%eax)
 906:	eb da                	jmp    8e2 <free+0x4a>

00000908 <morecore>:

static Header*
morecore(uint nu)
{
 908:	55                   	push   %ebp
 909:	89 e5                	mov    %esp,%ebp
 90b:	53                   	push   %ebx
 90c:	83 ec 04             	sub    $0x4,%esp
 90f:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 911:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 916:	77 05                	ja     91d <morecore+0x15>
    nu = 4096;
 918:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 91d:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 924:	83 ec 0c             	sub    $0xc,%esp
 927:	50                   	push   %eax
 928:	e8 38 fd ff ff       	call   665 <sbrk>
  if(p == (char*)-1)
 92d:	83 c4 10             	add    $0x10,%esp
 930:	83 f8 ff             	cmp    $0xffffffff,%eax
 933:	74 1c                	je     951 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 935:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 938:	83 c0 08             	add    $0x8,%eax
 93b:	83 ec 0c             	sub    $0xc,%esp
 93e:	50                   	push   %eax
 93f:	e8 54 ff ff ff       	call   898 <free>
  return freep;
 944:	a1 c0 0f 00 00       	mov    0xfc0,%eax
 949:	83 c4 10             	add    $0x10,%esp
}
 94c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 94f:	c9                   	leave  
 950:	c3                   	ret    
    return 0;
 951:	b8 00 00 00 00       	mov    $0x0,%eax
 956:	eb f4                	jmp    94c <morecore+0x44>

00000958 <malloc>:

void*
malloc(uint nbytes)
{
 958:	55                   	push   %ebp
 959:	89 e5                	mov    %esp,%ebp
 95b:	53                   	push   %ebx
 95c:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 95f:	8b 45 08             	mov    0x8(%ebp),%eax
 962:	8d 58 07             	lea    0x7(%eax),%ebx
 965:	c1 eb 03             	shr    $0x3,%ebx
 968:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 96b:	8b 0d c0 0f 00 00    	mov    0xfc0,%ecx
 971:	85 c9                	test   %ecx,%ecx
 973:	74 04                	je     979 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 975:	8b 01                	mov    (%ecx),%eax
 977:	eb 4a                	jmp    9c3 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 979:	c7 05 c0 0f 00 00 c4 	movl   $0xfc4,0xfc0
 980:	0f 00 00 
 983:	c7 05 c4 0f 00 00 c4 	movl   $0xfc4,0xfc4
 98a:	0f 00 00 
    base.s.size = 0;
 98d:	c7 05 c8 0f 00 00 00 	movl   $0x0,0xfc8
 994:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 997:	b9 c4 0f 00 00       	mov    $0xfc4,%ecx
 99c:	eb d7                	jmp    975 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 99e:	74 19                	je     9b9 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 9a0:	29 da                	sub    %ebx,%edx
 9a2:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 9a5:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 9a8:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 9ab:	89 0d c0 0f 00 00    	mov    %ecx,0xfc0
      return (void*)(p + 1);
 9b1:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 9b4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 9b7:	c9                   	leave  
 9b8:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 9b9:	8b 10                	mov    (%eax),%edx
 9bb:	89 11                	mov    %edx,(%ecx)
 9bd:	eb ec                	jmp    9ab <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9bf:	89 c1                	mov    %eax,%ecx
 9c1:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 9c3:	8b 50 04             	mov    0x4(%eax),%edx
 9c6:	39 da                	cmp    %ebx,%edx
 9c8:	73 d4                	jae    99e <malloc+0x46>
    if(p == freep)
 9ca:	39 05 c0 0f 00 00    	cmp    %eax,0xfc0
 9d0:	75 ed                	jne    9bf <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 9d2:	89 d8                	mov    %ebx,%eax
 9d4:	e8 2f ff ff ff       	call   908 <morecore>
 9d9:	85 c0                	test   %eax,%eax
 9db:	75 e2                	jne    9bf <malloc+0x67>
 9dd:	eb d5                	jmp    9b4 <malloc+0x5c>
