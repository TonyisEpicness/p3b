
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
  1c:	a1 f8 0e 00 00       	mov    0xef8,%eax
  21:	83 f8 01             	cmp    $0x1,%eax
  24:	0f 84 db 00 00 00    	je     105 <worker+0x105>
  2a:	6a 3b                	push   $0x3b
  2c:	68 44 0a 00 00       	push   $0xa44
  31:	68 4d 0a 00 00       	push   $0xa4d
  36:	6a 01                	push   $0x1
  38:	e8 58 07 00 00       	call   795 <printf>
  3d:	83 c4 0c             	add    $0xc,%esp
  40:	68 8c 0a 00 00       	push   $0xa8c
  45:	68 60 0a 00 00       	push   $0xa60
  4a:	6a 01                	push   $0x1
  4c:	e8 44 07 00 00       	call   795 <printf>
  51:	83 c4 08             	add    $0x8,%esp
  54:	68 74 0a 00 00       	push   $0xa74
  59:	6a 01                	push   $0x1
  5b:	e8 35 07 00 00       	call   795 <printf>
  60:	83 c4 04             	add    $0x4,%esp
  63:	ff 35 00 0f 00 00    	push   0xf00
  69:	e8 02 06 00 00       	call   670 <kill>
  6e:	e8 cd 05 00 00       	call   640 <exit>
   assert(tmp1 == 42);
  73:	6a 39                	push   $0x39
  75:	68 44 0a 00 00       	push   $0xa44
  7a:	68 4d 0a 00 00       	push   $0xa4d
  7f:	6a 01                	push   $0x1
  81:	e8 0f 07 00 00       	call   795 <printf>
  86:	83 c4 0c             	add    $0xc,%esp
  89:	68 55 0a 00 00       	push   $0xa55
  8e:	68 60 0a 00 00       	push   $0xa60
  93:	6a 01                	push   $0x1
  95:	e8 fb 06 00 00       	call   795 <printf>
  9a:	83 c4 08             	add    $0x8,%esp
  9d:	68 74 0a 00 00       	push   $0xa74
  a2:	6a 01                	push   $0x1
  a4:	e8 ec 06 00 00       	call   795 <printf>
  a9:	83 c4 04             	add    $0x4,%esp
  ac:	ff 35 00 0f 00 00    	push   0xf00
  b2:	e8 b9 05 00 00       	call   670 <kill>
  b7:	e8 84 05 00 00       	call   640 <exit>
   assert(tmp2 == 24);
  bc:	6a 3a                	push   $0x3a
  be:	68 44 0a 00 00       	push   $0xa44
  c3:	68 4d 0a 00 00       	push   $0xa4d
  c8:	6a 01                	push   $0x1
  ca:	e8 c6 06 00 00       	call   795 <printf>
  cf:	83 c4 0c             	add    $0xc,%esp
  d2:	68 81 0a 00 00       	push   $0xa81
  d7:	68 60 0a 00 00       	push   $0xa60
  dc:	6a 01                	push   $0x1
  de:	e8 b2 06 00 00       	call   795 <printf>
  e3:	83 c4 08             	add    $0x8,%esp
  e6:	68 74 0a 00 00       	push   $0xa74
  eb:	6a 01                	push   $0x1
  ed:	e8 a3 06 00 00       	call   795 <printf>
  f2:	83 c4 04             	add    $0x4,%esp
  f5:	ff 35 00 0f 00 00    	push   0xf00
  fb:	e8 70 05 00 00       	call   670 <kill>
 100:	e8 3b 05 00 00       	call   640 <exit>
   global++;
 105:	83 c0 01             	add    $0x1,%eax
 108:	a3 f8 0e 00 00       	mov    %eax,0xef8
   exit();
 10d:	e8 2e 05 00 00       	call   640 <exit>

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
 126:	e8 95 05 00 00       	call   6c0 <getpid>
 12b:	a3 00 0f 00 00       	mov    %eax,0xf00
   void *stack, *p = malloc(PGSIZE * 2);
 130:	83 ec 0c             	sub    $0xc,%esp
 133:	68 00 20 00 00       	push   $0x2000
 138:	e8 7e 08 00 00       	call   9bb <malloc>
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
 15a:	68 44 0a 00 00       	push   $0xa44
 15f:	68 4d 0a 00 00       	push   $0xa4d
 164:	6a 01                	push   $0x1
 166:	e8 2a 06 00 00       	call   795 <printf>
 16b:	83 c4 0c             	add    $0xc,%esp
 16e:	68 98 0a 00 00       	push   $0xa98
 173:	68 60 0a 00 00       	push   $0xa60
 178:	6a 01                	push   $0x1
 17a:	e8 16 06 00 00       	call   795 <printf>
 17f:	83 c4 08             	add    $0x8,%esp
 182:	68 74 0a 00 00       	push   $0xa74
 187:	6a 01                	push   $0x1
 189:	e8 07 06 00 00       	call   795 <printf>
 18e:	83 c4 04             	add    $0x4,%esp
 191:	ff 35 00 0f 00 00    	push   0xf00
 197:	e8 d4 04 00 00       	call   670 <kill>
 19c:	e8 9f 04 00 00       	call   640 <exit>
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
 1bf:	e8 1c 05 00 00       	call   6e0 <clone>
 1c4:	89 c6                	mov    %eax,%esi
   assert(clone_pid > 0);
 1c6:	83 c4 10             	add    $0x10,%esp
 1c9:	85 c0                	test   %eax,%eax
 1cb:	7e 67                	jle    234 <main+0x122>
   sleep(250);
 1cd:	83 ec 0c             	sub    $0xc,%esp
 1d0:	68 fa 00 00 00       	push   $0xfa
 1d5:	e8 f6 04 00 00       	call   6d0 <sleep>
   assert(wait() == -1);
 1da:	e8 69 04 00 00       	call   648 <wait>
 1df:	83 c4 10             	add    $0x10,%esp
 1e2:	83 f8 ff             	cmp    $0xffffffff,%eax
 1e5:	0f 84 92 00 00 00    	je     27d <main+0x16b>
 1eb:	6a 28                	push   $0x28
 1ed:	68 44 0a 00 00       	push   $0xa44
 1f2:	68 4d 0a 00 00       	push   $0xa4d
 1f7:	6a 01                	push   $0x1
 1f9:	e8 97 05 00 00       	call   795 <printf>
 1fe:	83 c4 0c             	add    $0xc,%esp
 201:	68 b0 0a 00 00       	push   $0xab0
 206:	68 60 0a 00 00       	push   $0xa60
 20b:	6a 01                	push   $0x1
 20d:	e8 83 05 00 00       	call   795 <printf>
 212:	83 c4 08             	add    $0x8,%esp
 215:	68 74 0a 00 00       	push   $0xa74
 21a:	6a 01                	push   $0x1
 21c:	e8 74 05 00 00       	call   795 <printf>
 221:	83 c4 04             	add    $0x4,%esp
 224:	ff 35 00 0f 00 00    	push   0xf00
 22a:	e8 41 04 00 00       	call   670 <kill>
 22f:	e8 0c 04 00 00       	call   640 <exit>
   assert(clone_pid > 0);
 234:	6a 25                	push   $0x25
 236:	68 44 0a 00 00       	push   $0xa44
 23b:	68 4d 0a 00 00       	push   $0xa4d
 240:	6a 01                	push   $0x1
 242:	e8 4e 05 00 00       	call   795 <printf>
 247:	83 c4 0c             	add    $0xc,%esp
 24a:	68 a2 0a 00 00       	push   $0xaa2
 24f:	68 60 0a 00 00       	push   $0xa60
 254:	6a 01                	push   $0x1
 256:	e8 3a 05 00 00       	call   795 <printf>
 25b:	83 c4 08             	add    $0x8,%esp
 25e:	68 74 0a 00 00       	push   $0xa74
 263:	6a 01                	push   $0x1
 265:	e8 2b 05 00 00       	call   795 <printf>
 26a:	83 c4 04             	add    $0x4,%esp
 26d:	ff 35 00 0f 00 00    	push   0xf00
 273:	e8 f8 03 00 00       	call   670 <kill>
 278:	e8 c3 03 00 00       	call   640 <exit>
   int join_pid = join(&join_stack);
 27d:	83 ec 0c             	sub    $0xc,%esp
 280:	8d 45 dc             	lea    -0x24(%ebp),%eax
 283:	50                   	push   %eax
 284:	e8 5f 04 00 00       	call   6e8 <join>
   assert(join_pid == clone_pid);
 289:	83 c4 10             	add    $0x10,%esp
 28c:	39 c6                	cmp    %eax,%esi
 28e:	75 52                	jne    2e2 <main+0x1d0>
   assert(stack == join_stack);
 290:	39 7d dc             	cmp    %edi,-0x24(%ebp)
 293:	0f 84 92 00 00 00    	je     32b <main+0x219>
 299:	6a 2d                	push   $0x2d
 29b:	68 44 0a 00 00       	push   $0xa44
 2a0:	68 4d 0a 00 00       	push   $0xa4d
 2a5:	6a 01                	push   $0x1
 2a7:	e8 e9 04 00 00       	call   795 <printf>
 2ac:	83 c4 0c             	add    $0xc,%esp
 2af:	68 d3 0a 00 00       	push   $0xad3
 2b4:	68 60 0a 00 00       	push   $0xa60
 2b9:	6a 01                	push   $0x1
 2bb:	e8 d5 04 00 00       	call   795 <printf>
 2c0:	83 c4 08             	add    $0x8,%esp
 2c3:	68 74 0a 00 00       	push   $0xa74
 2c8:	6a 01                	push   $0x1
 2ca:	e8 c6 04 00 00       	call   795 <printf>
 2cf:	83 c4 04             	add    $0x4,%esp
 2d2:	ff 35 00 0f 00 00    	push   0xf00
 2d8:	e8 93 03 00 00       	call   670 <kill>
 2dd:	e8 5e 03 00 00       	call   640 <exit>
   assert(join_pid == clone_pid);
 2e2:	6a 2c                	push   $0x2c
 2e4:	68 44 0a 00 00       	push   $0xa44
 2e9:	68 4d 0a 00 00       	push   $0xa4d
 2ee:	6a 01                	push   $0x1
 2f0:	e8 a0 04 00 00       	call   795 <printf>
 2f5:	83 c4 0c             	add    $0xc,%esp
 2f8:	68 bd 0a 00 00       	push   $0xabd
 2fd:	68 60 0a 00 00       	push   $0xa60
 302:	6a 01                	push   $0x1
 304:	e8 8c 04 00 00       	call   795 <printf>
 309:	83 c4 08             	add    $0x8,%esp
 30c:	68 74 0a 00 00       	push   $0xa74
 311:	6a 01                	push   $0x1
 313:	e8 7d 04 00 00       	call   795 <printf>
 318:	83 c4 04             	add    $0x4,%esp
 31b:	ff 35 00 0f 00 00    	push   0xf00
 321:	e8 4a 03 00 00       	call   670 <kill>
 326:	e8 15 03 00 00       	call   640 <exit>
   assert(global == 2);
 32b:	83 3d f8 0e 00 00 02 	cmpl   $0x2,0xef8
 332:	74 49                	je     37d <main+0x26b>
 334:	6a 2e                	push   $0x2e
 336:	68 44 0a 00 00       	push   $0xa44
 33b:	68 4d 0a 00 00       	push   $0xa4d
 340:	6a 01                	push   $0x1
 342:	e8 4e 04 00 00       	call   795 <printf>
 347:	83 c4 0c             	add    $0xc,%esp
 34a:	68 e7 0a 00 00       	push   $0xae7
 34f:	68 60 0a 00 00       	push   $0xa60
 354:	6a 01                	push   $0x1
 356:	e8 3a 04 00 00       	call   795 <printf>
 35b:	83 c4 08             	add    $0x8,%esp
 35e:	68 74 0a 00 00       	push   $0xa74
 363:	6a 01                	push   $0x1
 365:	e8 2b 04 00 00       	call   795 <printf>
 36a:	83 c4 04             	add    $0x4,%esp
 36d:	ff 35 00 0f 00 00    	push   0xf00
 373:	e8 f8 02 00 00       	call   670 <kill>
 378:	e8 c3 02 00 00       	call   640 <exit>
   printf(1, "TEST PASSED\n");
 37d:	83 ec 08             	sub    $0x8,%esp
 380:	68 f3 0a 00 00       	push   $0xaf3
 385:	6a 01                	push   $0x1
 387:	e8 09 04 00 00       	call   795 <printf>
   free(p);
 38c:	89 1c 24             	mov    %ebx,(%esp)
 38f:	e8 67 05 00 00       	call   8fb <free>
   exit();
 394:	e8 a7 02 00 00       	call   640 <exit>

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
 3ad:	83 ec 14             	sub    $0x14,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE*2);
 3b0:	68 00 20 00 00       	push   $0x2000
 3b5:	e8 01 06 00 00       	call   9bb <malloc>
  if(n_stack == 0){
 3ba:	83 c4 10             	add    $0x10,%esp
 3bd:	85 c0                	test   %eax,%eax
 3bf:	74 4a                	je     40b <thread_create+0x61>
    return -1;
  }
  
  for(int i=0; i<64; i++){
 3c1:	ba 00 00 00 00       	mov    $0x0,%edx
 3c6:	eb 03                	jmp    3cb <thread_create+0x21>
 3c8:	83 c2 01             	add    $0x1,%edx
 3cb:	83 fa 3f             	cmp    $0x3f,%edx
 3ce:	7f 27                	jg     3f7 <thread_create+0x4d>
    if(threads[i]->flag==0){
 3d0:	8b 0c 95 20 0f 00 00 	mov    0xf20(,%edx,4),%ecx
 3d7:	83 79 08 00          	cmpl   $0x0,0x8(%ecx)
 3db:	75 eb                	jne    3c8 <thread_create+0x1e>
      threads[i]->maddr = n_stack;
 3dd:	89 01                	mov    %eax,(%ecx)
      threads[i]->pg1addr = n_stack;
 3df:	8b 0c 95 20 0f 00 00 	mov    0xf20(,%edx,4),%ecx
 3e6:	89 41 04             	mov    %eax,0x4(%ecx)
      threads[i]->flag = 1;
 3e9:	8b 14 95 20 0f 00 00 	mov    0xf20(,%edx,4),%edx
 3f0:	c7 42 08 01 00 00 00 	movl   $0x1,0x8(%edx)
      break;
    }
  }
  
  int new_pid = clone(start_routine, arg1, arg2, n_stack); // TODO: is this the right way to call it?
 3f7:	50                   	push   %eax
 3f8:	ff 75 10             	push   0x10(%ebp)
 3fb:	ff 75 0c             	push   0xc(%ebp)
 3fe:	ff 75 08             	push   0x8(%ebp)
 401:	e8 da 02 00 00       	call   6e0 <clone>

  // I can't remember if there was something else to do here but I'm sure I'll find out



  return new_pid;
 406:	83 c4 10             	add    $0x10,%esp
}
 409:	c9                   	leave  
 40a:	c3                   	ret    
    return -1;
 40b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 410:	eb f7                	jmp    409 <thread_create+0x5f>

00000412 <thread_join>:

//TODO: fix
int thread_join() {
 412:	55                   	push   %ebp
 413:	89 e5                	mov    %esp,%ebp
 415:	56                   	push   %esi
 416:	53                   	push   %ebx
 417:	83 ec 1c             	sub    $0x1c,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 41a:	8d 45 f4             	lea    -0xc(%ebp),%eax
 41d:	50                   	push   %eax
 41e:	e8 c5 02 00 00       	call   6e8 <join>
 423:	89 c6                	mov    %eax,%esi
  for(int i=0; i<64; i++){
 425:	83 c4 10             	add    $0x10,%esp
 428:	bb 00 00 00 00       	mov    $0x0,%ebx
 42d:	eb 03                	jmp    432 <thread_join+0x20>
 42f:	83 c3 01             	add    $0x1,%ebx
 432:	83 fb 3f             	cmp    $0x3f,%ebx
 435:	7f 23                	jg     45a <thread_join+0x48>
    if((threads[i]->flag==1) && (stk_addr == threads[i]->pg1addr)){
 437:	8b 04 9d 20 0f 00 00 	mov    0xf20(,%ebx,4),%eax
 43e:	83 78 08 01          	cmpl   $0x1,0x8(%eax)
 442:	75 eb                	jne    42f <thread_join+0x1d>
 444:	8b 55 f4             	mov    -0xc(%ebp),%edx
 447:	39 50 04             	cmp    %edx,0x4(%eax)
 44a:	75 e3                	jne    42f <thread_join+0x1d>
      free(stk_addr);
 44c:	83 ec 0c             	sub    $0xc,%esp
 44f:	52                   	push   %edx
 450:	e8 a6 04 00 00       	call   8fb <free>
 455:	83 c4 10             	add    $0x10,%esp
 458:	eb d5                	jmp    42f <thread_join+0x1d>
    }
  }
  return pid;
}
 45a:	89 f0                	mov    %esi,%eax
 45c:	8d 65 f8             	lea    -0x8(%ebp),%esp
 45f:	5b                   	pop    %ebx
 460:	5e                   	pop    %esi
 461:	5d                   	pop    %ebp
 462:	c3                   	ret    

00000463 <lock_acquire>:

void lock_acquire(lock_t *lock){
 463:	55                   	push   %ebp
 464:	89 e5                	mov    %esp,%ebp
 466:	53                   	push   %ebx
 467:	83 ec 04             	sub    $0x4,%esp
 46a:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 46d:	83 ec 08             	sub    $0x8,%esp
 470:	6a 01                	push   $0x1
 472:	53                   	push   %ebx
 473:	e8 21 ff ff ff       	call   399 <test_and_set>
 478:	83 c4 10             	add    $0x10,%esp
 47b:	83 f8 01             	cmp    $0x1,%eax
 47e:	74 ed                	je     46d <lock_acquire+0xa>
    ;
}
 480:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 483:	c9                   	leave  
 484:	c3                   	ret    

00000485 <lock_release>:

void lock_release(lock_t *lock) {
 485:	55                   	push   %ebp
 486:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 488:	8b 45 08             	mov    0x8(%ebp),%eax
 48b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 491:	5d                   	pop    %ebp
 492:	c3                   	ret    

00000493 <lock_init>:

void lock_init(lock_t *lock) {
 493:	55                   	push   %ebp
 494:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 496:	8b 45 08             	mov    0x8(%ebp),%eax
 499:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 49f:	5d                   	pop    %ebp
 4a0:	c3                   	ret    

000004a1 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 4a1:	55                   	push   %ebp
 4a2:	89 e5                	mov    %esp,%ebp
 4a4:	56                   	push   %esi
 4a5:	53                   	push   %ebx
 4a6:	8b 75 08             	mov    0x8(%ebp),%esi
 4a9:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 4ac:	89 f0                	mov    %esi,%eax
 4ae:	89 d1                	mov    %edx,%ecx
 4b0:	83 c2 01             	add    $0x1,%edx
 4b3:	89 c3                	mov    %eax,%ebx
 4b5:	83 c0 01             	add    $0x1,%eax
 4b8:	0f b6 09             	movzbl (%ecx),%ecx
 4bb:	88 0b                	mov    %cl,(%ebx)
 4bd:	84 c9                	test   %cl,%cl
 4bf:	75 ed                	jne    4ae <strcpy+0xd>
    ;
  return os;
}
 4c1:	89 f0                	mov    %esi,%eax
 4c3:	5b                   	pop    %ebx
 4c4:	5e                   	pop    %esi
 4c5:	5d                   	pop    %ebp
 4c6:	c3                   	ret    

000004c7 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 4c7:	55                   	push   %ebp
 4c8:	89 e5                	mov    %esp,%ebp
 4ca:	8b 4d 08             	mov    0x8(%ebp),%ecx
 4cd:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 4d0:	eb 06                	jmp    4d8 <strcmp+0x11>
    p++, q++;
 4d2:	83 c1 01             	add    $0x1,%ecx
 4d5:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 4d8:	0f b6 01             	movzbl (%ecx),%eax
 4db:	84 c0                	test   %al,%al
 4dd:	74 04                	je     4e3 <strcmp+0x1c>
 4df:	3a 02                	cmp    (%edx),%al
 4e1:	74 ef                	je     4d2 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 4e3:	0f b6 c0             	movzbl %al,%eax
 4e6:	0f b6 12             	movzbl (%edx),%edx
 4e9:	29 d0                	sub    %edx,%eax
}
 4eb:	5d                   	pop    %ebp
 4ec:	c3                   	ret    

000004ed <strlen>:

uint
strlen(const char *s)
{
 4ed:	55                   	push   %ebp
 4ee:	89 e5                	mov    %esp,%ebp
 4f0:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 4f3:	b8 00 00 00 00       	mov    $0x0,%eax
 4f8:	eb 03                	jmp    4fd <strlen+0x10>
 4fa:	83 c0 01             	add    $0x1,%eax
 4fd:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 501:	75 f7                	jne    4fa <strlen+0xd>
    ;
  return n;
}
 503:	5d                   	pop    %ebp
 504:	c3                   	ret    

00000505 <memset>:

void*
memset(void *dst, int c, uint n)
{
 505:	55                   	push   %ebp
 506:	89 e5                	mov    %esp,%ebp
 508:	57                   	push   %edi
 509:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 50c:	89 d7                	mov    %edx,%edi
 50e:	8b 4d 10             	mov    0x10(%ebp),%ecx
 511:	8b 45 0c             	mov    0xc(%ebp),%eax
 514:	fc                   	cld    
 515:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 517:	89 d0                	mov    %edx,%eax
 519:	8b 7d fc             	mov    -0x4(%ebp),%edi
 51c:	c9                   	leave  
 51d:	c3                   	ret    

0000051e <strchr>:

char*
strchr(const char *s, char c)
{
 51e:	55                   	push   %ebp
 51f:	89 e5                	mov    %esp,%ebp
 521:	8b 45 08             	mov    0x8(%ebp),%eax
 524:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 528:	eb 03                	jmp    52d <strchr+0xf>
 52a:	83 c0 01             	add    $0x1,%eax
 52d:	0f b6 10             	movzbl (%eax),%edx
 530:	84 d2                	test   %dl,%dl
 532:	74 06                	je     53a <strchr+0x1c>
    if(*s == c)
 534:	38 ca                	cmp    %cl,%dl
 536:	75 f2                	jne    52a <strchr+0xc>
 538:	eb 05                	jmp    53f <strchr+0x21>
      return (char*)s;
  return 0;
 53a:	b8 00 00 00 00       	mov    $0x0,%eax
}
 53f:	5d                   	pop    %ebp
 540:	c3                   	ret    

00000541 <gets>:

char*
gets(char *buf, int max)
{
 541:	55                   	push   %ebp
 542:	89 e5                	mov    %esp,%ebp
 544:	57                   	push   %edi
 545:	56                   	push   %esi
 546:	53                   	push   %ebx
 547:	83 ec 1c             	sub    $0x1c,%esp
 54a:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 54d:	bb 00 00 00 00       	mov    $0x0,%ebx
 552:	89 de                	mov    %ebx,%esi
 554:	83 c3 01             	add    $0x1,%ebx
 557:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 55a:	7d 2e                	jge    58a <gets+0x49>
    cc = read(0, &c, 1);
 55c:	83 ec 04             	sub    $0x4,%esp
 55f:	6a 01                	push   $0x1
 561:	8d 45 e7             	lea    -0x19(%ebp),%eax
 564:	50                   	push   %eax
 565:	6a 00                	push   $0x0
 567:	e8 ec 00 00 00       	call   658 <read>
    if(cc < 1)
 56c:	83 c4 10             	add    $0x10,%esp
 56f:	85 c0                	test   %eax,%eax
 571:	7e 17                	jle    58a <gets+0x49>
      break;
    buf[i++] = c;
 573:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 577:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 57a:	3c 0a                	cmp    $0xa,%al
 57c:	0f 94 c2             	sete   %dl
 57f:	3c 0d                	cmp    $0xd,%al
 581:	0f 94 c0             	sete   %al
 584:	08 c2                	or     %al,%dl
 586:	74 ca                	je     552 <gets+0x11>
    buf[i++] = c;
 588:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 58a:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 58e:	89 f8                	mov    %edi,%eax
 590:	8d 65 f4             	lea    -0xc(%ebp),%esp
 593:	5b                   	pop    %ebx
 594:	5e                   	pop    %esi
 595:	5f                   	pop    %edi
 596:	5d                   	pop    %ebp
 597:	c3                   	ret    

00000598 <stat>:

int
stat(const char *n, struct stat *st)
{
 598:	55                   	push   %ebp
 599:	89 e5                	mov    %esp,%ebp
 59b:	56                   	push   %esi
 59c:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 59d:	83 ec 08             	sub    $0x8,%esp
 5a0:	6a 00                	push   $0x0
 5a2:	ff 75 08             	push   0x8(%ebp)
 5a5:	e8 d6 00 00 00       	call   680 <open>
  if(fd < 0)
 5aa:	83 c4 10             	add    $0x10,%esp
 5ad:	85 c0                	test   %eax,%eax
 5af:	78 24                	js     5d5 <stat+0x3d>
 5b1:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 5b3:	83 ec 08             	sub    $0x8,%esp
 5b6:	ff 75 0c             	push   0xc(%ebp)
 5b9:	50                   	push   %eax
 5ba:	e8 d9 00 00 00       	call   698 <fstat>
 5bf:	89 c6                	mov    %eax,%esi
  close(fd);
 5c1:	89 1c 24             	mov    %ebx,(%esp)
 5c4:	e8 9f 00 00 00       	call   668 <close>
  return r;
 5c9:	83 c4 10             	add    $0x10,%esp
}
 5cc:	89 f0                	mov    %esi,%eax
 5ce:	8d 65 f8             	lea    -0x8(%ebp),%esp
 5d1:	5b                   	pop    %ebx
 5d2:	5e                   	pop    %esi
 5d3:	5d                   	pop    %ebp
 5d4:	c3                   	ret    
    return -1;
 5d5:	be ff ff ff ff       	mov    $0xffffffff,%esi
 5da:	eb f0                	jmp    5cc <stat+0x34>

000005dc <atoi>:

int
atoi(const char *s)
{
 5dc:	55                   	push   %ebp
 5dd:	89 e5                	mov    %esp,%ebp
 5df:	53                   	push   %ebx
 5e0:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 5e3:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 5e8:	eb 10                	jmp    5fa <atoi+0x1e>
    n = n*10 + *s++ - '0';
 5ea:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 5ed:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 5f0:	83 c1 01             	add    $0x1,%ecx
 5f3:	0f be c0             	movsbl %al,%eax
 5f6:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 5fa:	0f b6 01             	movzbl (%ecx),%eax
 5fd:	8d 58 d0             	lea    -0x30(%eax),%ebx
 600:	80 fb 09             	cmp    $0x9,%bl
 603:	76 e5                	jbe    5ea <atoi+0xe>
  return n;
}
 605:	89 d0                	mov    %edx,%eax
 607:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 60a:	c9                   	leave  
 60b:	c3                   	ret    

0000060c <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 60c:	55                   	push   %ebp
 60d:	89 e5                	mov    %esp,%ebp
 60f:	56                   	push   %esi
 610:	53                   	push   %ebx
 611:	8b 75 08             	mov    0x8(%ebp),%esi
 614:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 617:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 61a:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 61c:	eb 0d                	jmp    62b <memmove+0x1f>
    *dst++ = *src++;
 61e:	0f b6 01             	movzbl (%ecx),%eax
 621:	88 02                	mov    %al,(%edx)
 623:	8d 49 01             	lea    0x1(%ecx),%ecx
 626:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 629:	89 d8                	mov    %ebx,%eax
 62b:	8d 58 ff             	lea    -0x1(%eax),%ebx
 62e:	85 c0                	test   %eax,%eax
 630:	7f ec                	jg     61e <memmove+0x12>
  return vdst;
}
 632:	89 f0                	mov    %esi,%eax
 634:	5b                   	pop    %ebx
 635:	5e                   	pop    %esi
 636:	5d                   	pop    %ebp
 637:	c3                   	ret    

00000638 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 638:	b8 01 00 00 00       	mov    $0x1,%eax
 63d:	cd 40                	int    $0x40
 63f:	c3                   	ret    

00000640 <exit>:
SYSCALL(exit)
 640:	b8 02 00 00 00       	mov    $0x2,%eax
 645:	cd 40                	int    $0x40
 647:	c3                   	ret    

00000648 <wait>:
SYSCALL(wait)
 648:	b8 03 00 00 00       	mov    $0x3,%eax
 64d:	cd 40                	int    $0x40
 64f:	c3                   	ret    

00000650 <pipe>:
SYSCALL(pipe)
 650:	b8 04 00 00 00       	mov    $0x4,%eax
 655:	cd 40                	int    $0x40
 657:	c3                   	ret    

00000658 <read>:
SYSCALL(read)
 658:	b8 05 00 00 00       	mov    $0x5,%eax
 65d:	cd 40                	int    $0x40
 65f:	c3                   	ret    

00000660 <write>:
SYSCALL(write)
 660:	b8 10 00 00 00       	mov    $0x10,%eax
 665:	cd 40                	int    $0x40
 667:	c3                   	ret    

00000668 <close>:
SYSCALL(close)
 668:	b8 15 00 00 00       	mov    $0x15,%eax
 66d:	cd 40                	int    $0x40
 66f:	c3                   	ret    

00000670 <kill>:
SYSCALL(kill)
 670:	b8 06 00 00 00       	mov    $0x6,%eax
 675:	cd 40                	int    $0x40
 677:	c3                   	ret    

00000678 <exec>:
SYSCALL(exec)
 678:	b8 07 00 00 00       	mov    $0x7,%eax
 67d:	cd 40                	int    $0x40
 67f:	c3                   	ret    

00000680 <open>:
SYSCALL(open)
 680:	b8 0f 00 00 00       	mov    $0xf,%eax
 685:	cd 40                	int    $0x40
 687:	c3                   	ret    

00000688 <mknod>:
SYSCALL(mknod)
 688:	b8 11 00 00 00       	mov    $0x11,%eax
 68d:	cd 40                	int    $0x40
 68f:	c3                   	ret    

00000690 <unlink>:
SYSCALL(unlink)
 690:	b8 12 00 00 00       	mov    $0x12,%eax
 695:	cd 40                	int    $0x40
 697:	c3                   	ret    

00000698 <fstat>:
SYSCALL(fstat)
 698:	b8 08 00 00 00       	mov    $0x8,%eax
 69d:	cd 40                	int    $0x40
 69f:	c3                   	ret    

000006a0 <link>:
SYSCALL(link)
 6a0:	b8 13 00 00 00       	mov    $0x13,%eax
 6a5:	cd 40                	int    $0x40
 6a7:	c3                   	ret    

000006a8 <mkdir>:
SYSCALL(mkdir)
 6a8:	b8 14 00 00 00       	mov    $0x14,%eax
 6ad:	cd 40                	int    $0x40
 6af:	c3                   	ret    

000006b0 <chdir>:
SYSCALL(chdir)
 6b0:	b8 09 00 00 00       	mov    $0x9,%eax
 6b5:	cd 40                	int    $0x40
 6b7:	c3                   	ret    

000006b8 <dup>:
SYSCALL(dup)
 6b8:	b8 0a 00 00 00       	mov    $0xa,%eax
 6bd:	cd 40                	int    $0x40
 6bf:	c3                   	ret    

000006c0 <getpid>:
SYSCALL(getpid)
 6c0:	b8 0b 00 00 00       	mov    $0xb,%eax
 6c5:	cd 40                	int    $0x40
 6c7:	c3                   	ret    

000006c8 <sbrk>:
SYSCALL(sbrk)
 6c8:	b8 0c 00 00 00       	mov    $0xc,%eax
 6cd:	cd 40                	int    $0x40
 6cf:	c3                   	ret    

000006d0 <sleep>:
SYSCALL(sleep)
 6d0:	b8 0d 00 00 00       	mov    $0xd,%eax
 6d5:	cd 40                	int    $0x40
 6d7:	c3                   	ret    

000006d8 <uptime>:
SYSCALL(uptime)
 6d8:	b8 0e 00 00 00       	mov    $0xe,%eax
 6dd:	cd 40                	int    $0x40
 6df:	c3                   	ret    

000006e0 <clone>:
SYSCALL(clone)
 6e0:	b8 16 00 00 00       	mov    $0x16,%eax
 6e5:	cd 40                	int    $0x40
 6e7:	c3                   	ret    

000006e8 <join>:
 6e8:	b8 17 00 00 00       	mov    $0x17,%eax
 6ed:	cd 40                	int    $0x40
 6ef:	c3                   	ret    

000006f0 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 6f0:	55                   	push   %ebp
 6f1:	89 e5                	mov    %esp,%ebp
 6f3:	83 ec 1c             	sub    $0x1c,%esp
 6f6:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 6f9:	6a 01                	push   $0x1
 6fb:	8d 55 f4             	lea    -0xc(%ebp),%edx
 6fe:	52                   	push   %edx
 6ff:	50                   	push   %eax
 700:	e8 5b ff ff ff       	call   660 <write>
}
 705:	83 c4 10             	add    $0x10,%esp
 708:	c9                   	leave  
 709:	c3                   	ret    

0000070a <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 70a:	55                   	push   %ebp
 70b:	89 e5                	mov    %esp,%ebp
 70d:	57                   	push   %edi
 70e:	56                   	push   %esi
 70f:	53                   	push   %ebx
 710:	83 ec 2c             	sub    $0x2c,%esp
 713:	89 45 d0             	mov    %eax,-0x30(%ebp)
 716:	89 d0                	mov    %edx,%eax
 718:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 71a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 71e:	0f 95 c1             	setne  %cl
 721:	c1 ea 1f             	shr    $0x1f,%edx
 724:	84 d1                	test   %dl,%cl
 726:	74 44                	je     76c <printint+0x62>
    neg = 1;
    x = -xx;
 728:	f7 d8                	neg    %eax
 72a:	89 c1                	mov    %eax,%ecx
    neg = 1;
 72c:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 733:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 738:	89 c8                	mov    %ecx,%eax
 73a:	ba 00 00 00 00       	mov    $0x0,%edx
 73f:	f7 f6                	div    %esi
 741:	89 df                	mov    %ebx,%edi
 743:	83 c3 01             	add    $0x1,%ebx
 746:	0f b6 92 60 0b 00 00 	movzbl 0xb60(%edx),%edx
 74d:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 751:	89 ca                	mov    %ecx,%edx
 753:	89 c1                	mov    %eax,%ecx
 755:	39 d6                	cmp    %edx,%esi
 757:	76 df                	jbe    738 <printint+0x2e>
  if(neg)
 759:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 75d:	74 31                	je     790 <printint+0x86>
    buf[i++] = '-';
 75f:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 764:	8d 5f 02             	lea    0x2(%edi),%ebx
 767:	8b 75 d0             	mov    -0x30(%ebp),%esi
 76a:	eb 17                	jmp    783 <printint+0x79>
    x = xx;
 76c:	89 c1                	mov    %eax,%ecx
  neg = 0;
 76e:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 775:	eb bc                	jmp    733 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 777:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 77c:	89 f0                	mov    %esi,%eax
 77e:	e8 6d ff ff ff       	call   6f0 <putc>
  while(--i >= 0)
 783:	83 eb 01             	sub    $0x1,%ebx
 786:	79 ef                	jns    777 <printint+0x6d>
}
 788:	83 c4 2c             	add    $0x2c,%esp
 78b:	5b                   	pop    %ebx
 78c:	5e                   	pop    %esi
 78d:	5f                   	pop    %edi
 78e:	5d                   	pop    %ebp
 78f:	c3                   	ret    
 790:	8b 75 d0             	mov    -0x30(%ebp),%esi
 793:	eb ee                	jmp    783 <printint+0x79>

00000795 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 795:	55                   	push   %ebp
 796:	89 e5                	mov    %esp,%ebp
 798:	57                   	push   %edi
 799:	56                   	push   %esi
 79a:	53                   	push   %ebx
 79b:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 79e:	8d 45 10             	lea    0x10(%ebp),%eax
 7a1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 7a4:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 7a9:	bb 00 00 00 00       	mov    $0x0,%ebx
 7ae:	eb 14                	jmp    7c4 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 7b0:	89 fa                	mov    %edi,%edx
 7b2:	8b 45 08             	mov    0x8(%ebp),%eax
 7b5:	e8 36 ff ff ff       	call   6f0 <putc>
 7ba:	eb 05                	jmp    7c1 <printf+0x2c>
      }
    } else if(state == '%'){
 7bc:	83 fe 25             	cmp    $0x25,%esi
 7bf:	74 25                	je     7e6 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 7c1:	83 c3 01             	add    $0x1,%ebx
 7c4:	8b 45 0c             	mov    0xc(%ebp),%eax
 7c7:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 7cb:	84 c0                	test   %al,%al
 7cd:	0f 84 20 01 00 00    	je     8f3 <printf+0x15e>
    c = fmt[i] & 0xff;
 7d3:	0f be f8             	movsbl %al,%edi
 7d6:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 7d9:	85 f6                	test   %esi,%esi
 7db:	75 df                	jne    7bc <printf+0x27>
      if(c == '%'){
 7dd:	83 f8 25             	cmp    $0x25,%eax
 7e0:	75 ce                	jne    7b0 <printf+0x1b>
        state = '%';
 7e2:	89 c6                	mov    %eax,%esi
 7e4:	eb db                	jmp    7c1 <printf+0x2c>
      if(c == 'd'){
 7e6:	83 f8 25             	cmp    $0x25,%eax
 7e9:	0f 84 cf 00 00 00    	je     8be <printf+0x129>
 7ef:	0f 8c dd 00 00 00    	jl     8d2 <printf+0x13d>
 7f5:	83 f8 78             	cmp    $0x78,%eax
 7f8:	0f 8f d4 00 00 00    	jg     8d2 <printf+0x13d>
 7fe:	83 f8 63             	cmp    $0x63,%eax
 801:	0f 8c cb 00 00 00    	jl     8d2 <printf+0x13d>
 807:	83 e8 63             	sub    $0x63,%eax
 80a:	83 f8 15             	cmp    $0x15,%eax
 80d:	0f 87 bf 00 00 00    	ja     8d2 <printf+0x13d>
 813:	ff 24 85 08 0b 00 00 	jmp    *0xb08(,%eax,4)
        printint(fd, *ap, 10, 1);
 81a:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 81d:	8b 17                	mov    (%edi),%edx
 81f:	83 ec 0c             	sub    $0xc,%esp
 822:	6a 01                	push   $0x1
 824:	b9 0a 00 00 00       	mov    $0xa,%ecx
 829:	8b 45 08             	mov    0x8(%ebp),%eax
 82c:	e8 d9 fe ff ff       	call   70a <printint>
        ap++;
 831:	83 c7 04             	add    $0x4,%edi
 834:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 837:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 83a:	be 00 00 00 00       	mov    $0x0,%esi
 83f:	eb 80                	jmp    7c1 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 841:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 844:	8b 17                	mov    (%edi),%edx
 846:	83 ec 0c             	sub    $0xc,%esp
 849:	6a 00                	push   $0x0
 84b:	b9 10 00 00 00       	mov    $0x10,%ecx
 850:	8b 45 08             	mov    0x8(%ebp),%eax
 853:	e8 b2 fe ff ff       	call   70a <printint>
        ap++;
 858:	83 c7 04             	add    $0x4,%edi
 85b:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 85e:	83 c4 10             	add    $0x10,%esp
      state = 0;
 861:	be 00 00 00 00       	mov    $0x0,%esi
 866:	e9 56 ff ff ff       	jmp    7c1 <printf+0x2c>
        s = (char*)*ap;
 86b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 86e:	8b 30                	mov    (%eax),%esi
        ap++;
 870:	83 c0 04             	add    $0x4,%eax
 873:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 876:	85 f6                	test   %esi,%esi
 878:	75 15                	jne    88f <printf+0xfa>
          s = "(null)";
 87a:	be 00 0b 00 00       	mov    $0xb00,%esi
 87f:	eb 0e                	jmp    88f <printf+0xfa>
          putc(fd, *s);
 881:	0f be d2             	movsbl %dl,%edx
 884:	8b 45 08             	mov    0x8(%ebp),%eax
 887:	e8 64 fe ff ff       	call   6f0 <putc>
          s++;
 88c:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 88f:	0f b6 16             	movzbl (%esi),%edx
 892:	84 d2                	test   %dl,%dl
 894:	75 eb                	jne    881 <printf+0xec>
      state = 0;
 896:	be 00 00 00 00       	mov    $0x0,%esi
 89b:	e9 21 ff ff ff       	jmp    7c1 <printf+0x2c>
        putc(fd, *ap);
 8a0:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 8a3:	0f be 17             	movsbl (%edi),%edx
 8a6:	8b 45 08             	mov    0x8(%ebp),%eax
 8a9:	e8 42 fe ff ff       	call   6f0 <putc>
        ap++;
 8ae:	83 c7 04             	add    $0x4,%edi
 8b1:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 8b4:	be 00 00 00 00       	mov    $0x0,%esi
 8b9:	e9 03 ff ff ff       	jmp    7c1 <printf+0x2c>
        putc(fd, c);
 8be:	89 fa                	mov    %edi,%edx
 8c0:	8b 45 08             	mov    0x8(%ebp),%eax
 8c3:	e8 28 fe ff ff       	call   6f0 <putc>
      state = 0;
 8c8:	be 00 00 00 00       	mov    $0x0,%esi
 8cd:	e9 ef fe ff ff       	jmp    7c1 <printf+0x2c>
        putc(fd, '%');
 8d2:	ba 25 00 00 00       	mov    $0x25,%edx
 8d7:	8b 45 08             	mov    0x8(%ebp),%eax
 8da:	e8 11 fe ff ff       	call   6f0 <putc>
        putc(fd, c);
 8df:	89 fa                	mov    %edi,%edx
 8e1:	8b 45 08             	mov    0x8(%ebp),%eax
 8e4:	e8 07 fe ff ff       	call   6f0 <putc>
      state = 0;
 8e9:	be 00 00 00 00       	mov    $0x0,%esi
 8ee:	e9 ce fe ff ff       	jmp    7c1 <printf+0x2c>
    }
  }
}
 8f3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 8f6:	5b                   	pop    %ebx
 8f7:	5e                   	pop    %esi
 8f8:	5f                   	pop    %edi
 8f9:	5d                   	pop    %ebp
 8fa:	c3                   	ret    

000008fb <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 8fb:	55                   	push   %ebp
 8fc:	89 e5                	mov    %esp,%ebp
 8fe:	57                   	push   %edi
 8ff:	56                   	push   %esi
 900:	53                   	push   %ebx
 901:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 904:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 907:	a1 20 10 00 00       	mov    0x1020,%eax
 90c:	eb 02                	jmp    910 <free+0x15>
 90e:	89 d0                	mov    %edx,%eax
 910:	39 c8                	cmp    %ecx,%eax
 912:	73 04                	jae    918 <free+0x1d>
 914:	39 08                	cmp    %ecx,(%eax)
 916:	77 12                	ja     92a <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 918:	8b 10                	mov    (%eax),%edx
 91a:	39 c2                	cmp    %eax,%edx
 91c:	77 f0                	ja     90e <free+0x13>
 91e:	39 c8                	cmp    %ecx,%eax
 920:	72 08                	jb     92a <free+0x2f>
 922:	39 ca                	cmp    %ecx,%edx
 924:	77 04                	ja     92a <free+0x2f>
 926:	89 d0                	mov    %edx,%eax
 928:	eb e6                	jmp    910 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 92a:	8b 73 fc             	mov    -0x4(%ebx),%esi
 92d:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 930:	8b 10                	mov    (%eax),%edx
 932:	39 d7                	cmp    %edx,%edi
 934:	74 19                	je     94f <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 936:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 939:	8b 50 04             	mov    0x4(%eax),%edx
 93c:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 93f:	39 ce                	cmp    %ecx,%esi
 941:	74 1b                	je     95e <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 943:	89 08                	mov    %ecx,(%eax)
  freep = p;
 945:	a3 20 10 00 00       	mov    %eax,0x1020
}
 94a:	5b                   	pop    %ebx
 94b:	5e                   	pop    %esi
 94c:	5f                   	pop    %edi
 94d:	5d                   	pop    %ebp
 94e:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 94f:	03 72 04             	add    0x4(%edx),%esi
 952:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 955:	8b 10                	mov    (%eax),%edx
 957:	8b 12                	mov    (%edx),%edx
 959:	89 53 f8             	mov    %edx,-0x8(%ebx)
 95c:	eb db                	jmp    939 <free+0x3e>
    p->s.size += bp->s.size;
 95e:	03 53 fc             	add    -0x4(%ebx),%edx
 961:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 964:	8b 53 f8             	mov    -0x8(%ebx),%edx
 967:	89 10                	mov    %edx,(%eax)
 969:	eb da                	jmp    945 <free+0x4a>

0000096b <morecore>:

static Header*
morecore(uint nu)
{
 96b:	55                   	push   %ebp
 96c:	89 e5                	mov    %esp,%ebp
 96e:	53                   	push   %ebx
 96f:	83 ec 04             	sub    $0x4,%esp
 972:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 974:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 979:	77 05                	ja     980 <morecore+0x15>
    nu = 4096;
 97b:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 980:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 987:	83 ec 0c             	sub    $0xc,%esp
 98a:	50                   	push   %eax
 98b:	e8 38 fd ff ff       	call   6c8 <sbrk>
  if(p == (char*)-1)
 990:	83 c4 10             	add    $0x10,%esp
 993:	83 f8 ff             	cmp    $0xffffffff,%eax
 996:	74 1c                	je     9b4 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 998:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 99b:	83 c0 08             	add    $0x8,%eax
 99e:	83 ec 0c             	sub    $0xc,%esp
 9a1:	50                   	push   %eax
 9a2:	e8 54 ff ff ff       	call   8fb <free>
  return freep;
 9a7:	a1 20 10 00 00       	mov    0x1020,%eax
 9ac:	83 c4 10             	add    $0x10,%esp
}
 9af:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 9b2:	c9                   	leave  
 9b3:	c3                   	ret    
    return 0;
 9b4:	b8 00 00 00 00       	mov    $0x0,%eax
 9b9:	eb f4                	jmp    9af <morecore+0x44>

000009bb <malloc>:

void*
malloc(uint nbytes)
{
 9bb:	55                   	push   %ebp
 9bc:	89 e5                	mov    %esp,%ebp
 9be:	53                   	push   %ebx
 9bf:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9c2:	8b 45 08             	mov    0x8(%ebp),%eax
 9c5:	8d 58 07             	lea    0x7(%eax),%ebx
 9c8:	c1 eb 03             	shr    $0x3,%ebx
 9cb:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 9ce:	8b 0d 20 10 00 00    	mov    0x1020,%ecx
 9d4:	85 c9                	test   %ecx,%ecx
 9d6:	74 04                	je     9dc <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9d8:	8b 01                	mov    (%ecx),%eax
 9da:	eb 4a                	jmp    a26 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 9dc:	c7 05 20 10 00 00 24 	movl   $0x1024,0x1020
 9e3:	10 00 00 
 9e6:	c7 05 24 10 00 00 24 	movl   $0x1024,0x1024
 9ed:	10 00 00 
    base.s.size = 0;
 9f0:	c7 05 28 10 00 00 00 	movl   $0x0,0x1028
 9f7:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 9fa:	b9 24 10 00 00       	mov    $0x1024,%ecx
 9ff:	eb d7                	jmp    9d8 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 a01:	74 19                	je     a1c <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 a03:	29 da                	sub    %ebx,%edx
 a05:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 a08:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 a0b:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 a0e:	89 0d 20 10 00 00    	mov    %ecx,0x1020
      return (void*)(p + 1);
 a14:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 a17:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 a1a:	c9                   	leave  
 a1b:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 a1c:	8b 10                	mov    (%eax),%edx
 a1e:	89 11                	mov    %edx,(%ecx)
 a20:	eb ec                	jmp    a0e <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a22:	89 c1                	mov    %eax,%ecx
 a24:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 a26:	8b 50 04             	mov    0x4(%eax),%edx
 a29:	39 da                	cmp    %ebx,%edx
 a2b:	73 d4                	jae    a01 <malloc+0x46>
    if(p == freep)
 a2d:	39 05 20 10 00 00    	cmp    %eax,0x1020
 a33:	75 ed                	jne    a22 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 a35:	89 d8                	mov    %ebx,%eax
 a37:	e8 2f ff ff ff       	call   96b <morecore>
 a3c:	85 c0                	test   %eax,%eax
 a3e:	75 e2                	jne    a22 <malloc+0x67>
 a40:	eb d5                	jmp    a17 <malloc+0x5c>
