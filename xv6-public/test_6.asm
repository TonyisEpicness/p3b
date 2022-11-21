
_test_6:     file format elf32-i386


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
  1c:	a1 3c 0f 00 00       	mov    0xf3c,%eax
  21:	83 f8 01             	cmp    $0x1,%eax
  24:	0f 84 db 00 00 00    	je     105 <worker+0x105>
  2a:	6a 39                	push   $0x39
  2c:	68 5c 0a 00 00       	push   $0xa5c
  31:	68 65 0a 00 00       	push   $0xa65
  36:	6a 01                	push   $0x1
  38:	e8 71 07 00 00       	call   7ae <printf>
  3d:	83 c4 0c             	add    $0xc,%esp
  40:	68 a4 0a 00 00       	push   $0xaa4
  45:	68 78 0a 00 00       	push   $0xa78
  4a:	6a 01                	push   $0x1
  4c:	e8 5d 07 00 00       	call   7ae <printf>
  51:	83 c4 08             	add    $0x8,%esp
  54:	68 8c 0a 00 00       	push   $0xa8c
  59:	6a 01                	push   $0x1
  5b:	e8 4e 07 00 00       	call   7ae <printf>
  60:	83 c4 04             	add    $0x4,%esp
  63:	ff 35 40 0f 00 00    	push   0xf40
  69:	e8 1b 06 00 00       	call   689 <kill>
  6e:	e8 e6 05 00 00       	call   659 <exit>
   assert(tmp1 == 42);
  73:	6a 37                	push   $0x37
  75:	68 5c 0a 00 00       	push   $0xa5c
  7a:	68 65 0a 00 00       	push   $0xa65
  7f:	6a 01                	push   $0x1
  81:	e8 28 07 00 00       	call   7ae <printf>
  86:	83 c4 0c             	add    $0xc,%esp
  89:	68 6d 0a 00 00       	push   $0xa6d
  8e:	68 78 0a 00 00       	push   $0xa78
  93:	6a 01                	push   $0x1
  95:	e8 14 07 00 00       	call   7ae <printf>
  9a:	83 c4 08             	add    $0x8,%esp
  9d:	68 8c 0a 00 00       	push   $0xa8c
  a2:	6a 01                	push   $0x1
  a4:	e8 05 07 00 00       	call   7ae <printf>
  a9:	83 c4 04             	add    $0x4,%esp
  ac:	ff 35 40 0f 00 00    	push   0xf40
  b2:	e8 d2 05 00 00       	call   689 <kill>
  b7:	e8 9d 05 00 00       	call   659 <exit>
   assert(tmp2 == 24);
  bc:	6a 38                	push   $0x38
  be:	68 5c 0a 00 00       	push   $0xa5c
  c3:	68 65 0a 00 00       	push   $0xa65
  c8:	6a 01                	push   $0x1
  ca:	e8 df 06 00 00       	call   7ae <printf>
  cf:	83 c4 0c             	add    $0xc,%esp
  d2:	68 99 0a 00 00       	push   $0xa99
  d7:	68 78 0a 00 00       	push   $0xa78
  dc:	6a 01                	push   $0x1
  de:	e8 cb 06 00 00       	call   7ae <printf>
  e3:	83 c4 08             	add    $0x8,%esp
  e6:	68 8c 0a 00 00       	push   $0xa8c
  eb:	6a 01                	push   $0x1
  ed:	e8 bc 06 00 00       	call   7ae <printf>
  f2:	83 c4 04             	add    $0x4,%esp
  f5:	ff 35 40 0f 00 00    	push   0xf40
  fb:	e8 89 05 00 00       	call   689 <kill>
 100:	e8 54 05 00 00       	call   659 <exit>
   global++;
 105:	83 c0 01             	add    $0x1,%eax
 108:	a3 3c 0f 00 00       	mov    %eax,0xf3c
   exit();
 10d:	e8 47 05 00 00       	call   659 <exit>

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
 123:	83 ec 28             	sub    $0x28,%esp
   ppid = getpid();
 126:	e8 ae 05 00 00       	call   6d9 <getpid>
 12b:	a3 40 0f 00 00       	mov    %eax,0xf40
   void *stack, *p = malloc(PGSIZE * 2);
 130:	83 ec 0c             	sub    $0xc,%esp
 133:	68 00 20 00 00       	push   $0x2000
 138:	e8 97 08 00 00       	call   9d4 <malloc>
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
 15a:	68 5c 0a 00 00       	push   $0xa5c
 15f:	68 65 0a 00 00       	push   $0xa65
 164:	6a 01                	push   $0x1
 166:	e8 43 06 00 00       	call   7ae <printf>
 16b:	83 c4 0c             	add    $0xc,%esp
 16e:	68 b0 0a 00 00       	push   $0xab0
 173:	68 78 0a 00 00       	push   $0xa78
 178:	6a 01                	push   $0x1
 17a:	e8 2f 06 00 00       	call   7ae <printf>
 17f:	83 c4 08             	add    $0x8,%esp
 182:	68 8c 0a 00 00       	push   $0xa8c
 187:	6a 01                	push   $0x1
 189:	e8 20 06 00 00       	call   7ae <printf>
 18e:	83 c4 04             	add    $0x4,%esp
 191:	ff 35 40 0f 00 00    	push   0xf40
 197:	e8 ed 04 00 00       	call   689 <kill>
 19c:	e8 b8 04 00 00       	call   659 <exit>
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
 1bf:	e8 35 05 00 00       	call   6f9 <clone>
 1c4:	89 c6                	mov    %eax,%esi
   assert(clone_pid > 0);
 1c6:	83 c4 10             	add    $0x10,%esp
 1c9:	85 c0                	test   %eax,%eax
 1cb:	0f 8e 82 00 00 00    	jle    253 <main+0x141>
   sbrk(PGSIZE);
 1d1:	83 ec 0c             	sub    $0xc,%esp
 1d4:	68 00 10 00 00       	push   $0x1000
 1d9:	e8 03 05 00 00       	call   6e1 <sbrk>
   void **join_stack = (void**) ((uint)sbrk(0) - 4);
 1de:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1e5:	e8 f7 04 00 00       	call   6e1 <sbrk>
 1ea:	89 45 d0             	mov    %eax,-0x30(%ebp)
 1ed:	8d 50 fc             	lea    -0x4(%eax),%edx
 1f0:	89 55 d4             	mov    %edx,-0x2c(%ebp)
   assert(join((void**)((uint)join_stack + 2)) == -1);
 1f3:	83 e8 02             	sub    $0x2,%eax
 1f6:	89 04 24             	mov    %eax,(%esp)
 1f9:	e8 03 05 00 00       	call   701 <join>
 1fe:	83 c4 10             	add    $0x10,%esp
 201:	83 f8 ff             	cmp    $0xffffffff,%eax
 204:	0f 84 92 00 00 00    	je     29c <main+0x18a>
 20a:	6a 29                	push   $0x29
 20c:	68 5c 0a 00 00       	push   $0xa5c
 211:	68 65 0a 00 00       	push   $0xa65
 216:	6a 01                	push   $0x1
 218:	e8 91 05 00 00       	call   7ae <printf>
 21d:	83 c4 0c             	add    $0xc,%esp
 220:	68 14 0b 00 00       	push   $0xb14
 225:	68 78 0a 00 00       	push   $0xa78
 22a:	6a 01                	push   $0x1
 22c:	e8 7d 05 00 00       	call   7ae <printf>
 231:	83 c4 08             	add    $0x8,%esp
 234:	68 8c 0a 00 00       	push   $0xa8c
 239:	6a 01                	push   $0x1
 23b:	e8 6e 05 00 00       	call   7ae <printf>
 240:	83 c4 04             	add    $0x4,%esp
 243:	ff 35 40 0f 00 00    	push   0xf40
 249:	e8 3b 04 00 00       	call   689 <kill>
 24e:	e8 06 04 00 00       	call   659 <exit>
   assert(clone_pid > 0);
 253:	6a 25                	push   $0x25
 255:	68 5c 0a 00 00       	push   $0xa5c
 25a:	68 65 0a 00 00       	push   $0xa65
 25f:	6a 01                	push   $0x1
 261:	e8 48 05 00 00       	call   7ae <printf>
 266:	83 c4 0c             	add    $0xc,%esp
 269:	68 ba 0a 00 00       	push   $0xaba
 26e:	68 78 0a 00 00       	push   $0xa78
 273:	6a 01                	push   $0x1
 275:	e8 34 05 00 00       	call   7ae <printf>
 27a:	83 c4 08             	add    $0x8,%esp
 27d:	68 8c 0a 00 00       	push   $0xa8c
 282:	6a 01                	push   $0x1
 284:	e8 25 05 00 00       	call   7ae <printf>
 289:	83 c4 04             	add    $0x4,%esp
 28c:	ff 35 40 0f 00 00    	push   0xf40
 292:	e8 f2 03 00 00       	call   689 <kill>
 297:	e8 bd 03 00 00       	call   659 <exit>
   assert(join(join_stack) == clone_pid);
 29c:	83 ec 0c             	sub    $0xc,%esp
 29f:	ff 75 d4             	push   -0x2c(%ebp)
 2a2:	e8 5a 04 00 00       	call   701 <join>
 2a7:	83 c4 10             	add    $0x10,%esp
 2aa:	39 f0                	cmp    %esi,%eax
 2ac:	75 55                	jne    303 <main+0x1f1>
   assert(stack == *join_stack);
 2ae:	8b 45 d0             	mov    -0x30(%ebp),%eax
 2b1:	39 78 fc             	cmp    %edi,-0x4(%eax)
 2b4:	0f 84 92 00 00 00    	je     34c <main+0x23a>
 2ba:	6a 2b                	push   $0x2b
 2bc:	68 5c 0a 00 00       	push   $0xa5c
 2c1:	68 65 0a 00 00       	push   $0xa65
 2c6:	6a 01                	push   $0x1
 2c8:	e8 e1 04 00 00       	call   7ae <printf>
 2cd:	83 c4 0c             	add    $0xc,%esp
 2d0:	68 e6 0a 00 00       	push   $0xae6
 2d5:	68 78 0a 00 00       	push   $0xa78
 2da:	6a 01                	push   $0x1
 2dc:	e8 cd 04 00 00       	call   7ae <printf>
 2e1:	83 c4 08             	add    $0x8,%esp
 2e4:	68 8c 0a 00 00       	push   $0xa8c
 2e9:	6a 01                	push   $0x1
 2eb:	e8 be 04 00 00       	call   7ae <printf>
 2f0:	83 c4 04             	add    $0x4,%esp
 2f3:	ff 35 40 0f 00 00    	push   0xf40
 2f9:	e8 8b 03 00 00       	call   689 <kill>
 2fe:	e8 56 03 00 00       	call   659 <exit>
   assert(join(join_stack) == clone_pid);
 303:	6a 2a                	push   $0x2a
 305:	68 5c 0a 00 00       	push   $0xa5c
 30a:	68 65 0a 00 00       	push   $0xa65
 30f:	6a 01                	push   $0x1
 311:	e8 98 04 00 00       	call   7ae <printf>
 316:	83 c4 0c             	add    $0xc,%esp
 319:	68 c8 0a 00 00       	push   $0xac8
 31e:	68 78 0a 00 00       	push   $0xa78
 323:	6a 01                	push   $0x1
 325:	e8 84 04 00 00       	call   7ae <printf>
 32a:	83 c4 08             	add    $0x8,%esp
 32d:	68 8c 0a 00 00       	push   $0xa8c
 332:	6a 01                	push   $0x1
 334:	e8 75 04 00 00       	call   7ae <printf>
 339:	83 c4 04             	add    $0x4,%esp
 33c:	ff 35 40 0f 00 00    	push   0xf40
 342:	e8 42 03 00 00       	call   689 <kill>
 347:	e8 0d 03 00 00       	call   659 <exit>
   assert(global == 2);
 34c:	83 3d 3c 0f 00 00 02 	cmpl   $0x2,0xf3c
 353:	74 49                	je     39e <main+0x28c>
 355:	6a 2c                	push   $0x2c
 357:	68 5c 0a 00 00       	push   $0xa5c
 35c:	68 65 0a 00 00       	push   $0xa65
 361:	6a 01                	push   $0x1
 363:	e8 46 04 00 00       	call   7ae <printf>
 368:	83 c4 0c             	add    $0xc,%esp
 36b:	68 fb 0a 00 00       	push   $0xafb
 370:	68 78 0a 00 00       	push   $0xa78
 375:	6a 01                	push   $0x1
 377:	e8 32 04 00 00       	call   7ae <printf>
 37c:	83 c4 08             	add    $0x8,%esp
 37f:	68 8c 0a 00 00       	push   $0xa8c
 384:	6a 01                	push   $0x1
 386:	e8 23 04 00 00       	call   7ae <printf>
 38b:	83 c4 04             	add    $0x4,%esp
 38e:	ff 35 40 0f 00 00    	push   0xf40
 394:	e8 f0 02 00 00       	call   689 <kill>
 399:	e8 bb 02 00 00       	call   659 <exit>
   printf(1, "TEST PASSED\n");
 39e:	83 ec 08             	sub    $0x8,%esp
 3a1:	68 07 0b 00 00       	push   $0xb07
 3a6:	6a 01                	push   $0x1
 3a8:	e8 01 04 00 00       	call   7ae <printf>
   free(p);
 3ad:	89 1c 24             	mov    %ebx,(%esp)
 3b0:	e8 5f 05 00 00       	call   914 <free>
   exit();
 3b5:	e8 9f 02 00 00       	call   659 <exit>

000003ba <test_and_set>:
  int flag;
};

struct thread_ref *threads[64];

int test_and_set(int *old_ptr, int new_ptr) {
 3ba:	55                   	push   %ebp
 3bb:	89 e5                	mov    %esp,%ebp
 3bd:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *old_ptr;
 3c0:	8b 10                	mov    (%eax),%edx
  *old_ptr = new_ptr;
 3c2:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 3c5:	89 08                	mov    %ecx,(%eax)
  return old;
}
 3c7:	89 d0                	mov    %edx,%eax
 3c9:	5d                   	pop    %ebp
 3ca:	c3                   	ret    

000003cb <thread_create>:

// a wrapper func for clone
int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 3cb:	55                   	push   %ebp
 3cc:	89 e5                	mov    %esp,%ebp
 3ce:	53                   	push   %ebx
 3cf:	83 ec 10             	sub    $0x10,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE*2);
 3d2:	68 00 20 00 00       	push   $0x2000
 3d7:	e8 f8 05 00 00       	call   9d4 <malloc>
  if(n_stack == 0){
 3dc:	83 c4 10             	add    $0x10,%esp
 3df:	85 c0                	test   %eax,%eax
 3e1:	74 41                	je     424 <thread_create+0x59>
 3e3:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  int new_pid = clone(start_routine, arg1, arg2, n_stack);
 3e5:	50                   	push   %eax
 3e6:	ff 75 10             	push   0x10(%ebp)
 3e9:	ff 75 0c             	push   0xc(%ebp)
 3ec:	ff 75 08             	push   0x8(%ebp)
 3ef:	e8 05 03 00 00       	call   6f9 <clone>

  for(int i=0; i<64; i++){
 3f4:	83 c4 10             	add    $0x10,%esp
 3f7:	ba 00 00 00 00       	mov    $0x0,%edx
 3fc:	eb 03                	jmp    401 <thread_create+0x36>
 3fe:	83 c2 01             	add    $0x1,%edx
 401:	83 fa 3f             	cmp    $0x3f,%edx
 404:	7f 19                	jg     41f <thread_create+0x54>
    if(threads[i]->flag==0){
 406:	8b 0c 95 60 0f 00 00 	mov    0xf60(,%edx,4),%ecx
 40d:	83 79 08 00          	cmpl   $0x0,0x8(%ecx)
 411:	75 eb                	jne    3fe <thread_create+0x33>
      threads[i]->maddr = n_stack;
 413:	89 19                	mov    %ebx,(%ecx)
      threads[i]->pg1addr = n_stack;
 415:	8b 14 95 60 0f 00 00 	mov    0xf60(,%edx,4),%edx
 41c:	89 5a 04             	mov    %ebx,0x4(%edx)
      break;
    }
  }

  return new_pid;
}
 41f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 422:	c9                   	leave  
 423:	c3                   	ret    
    return -1;
 424:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 429:	eb f4                	jmp    41f <thread_create+0x54>

0000042b <thread_join>:

//TODO: fix
int thread_join() {
 42b:	55                   	push   %ebp
 42c:	89 e5                	mov    %esp,%ebp
 42e:	56                   	push   %esi
 42f:	53                   	push   %ebx
 430:	83 ec 1c             	sub    $0x1c,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 433:	8d 45 f4             	lea    -0xc(%ebp),%eax
 436:	50                   	push   %eax
 437:	e8 c5 02 00 00       	call   701 <join>
 43c:	89 c6                	mov    %eax,%esi
  for(int i=0; i<64; i++){
 43e:	83 c4 10             	add    $0x10,%esp
 441:	bb 00 00 00 00       	mov    $0x0,%ebx
 446:	eb 03                	jmp    44b <thread_join+0x20>
 448:	83 c3 01             	add    $0x1,%ebx
 44b:	83 fb 3f             	cmp    $0x3f,%ebx
 44e:	7f 23                	jg     473 <thread_join+0x48>
    if((threads[i]->flag==1) && (stk_addr == threads[i]->pg1addr)){
 450:	8b 04 9d 60 0f 00 00 	mov    0xf60(,%ebx,4),%eax
 457:	83 78 08 01          	cmpl   $0x1,0x8(%eax)
 45b:	75 eb                	jne    448 <thread_join+0x1d>
 45d:	8b 55 f4             	mov    -0xc(%ebp),%edx
 460:	39 50 04             	cmp    %edx,0x4(%eax)
 463:	75 e3                	jne    448 <thread_join+0x1d>
      free(stk_addr);
 465:	83 ec 0c             	sub    $0xc,%esp
 468:	52                   	push   %edx
 469:	e8 a6 04 00 00       	call   914 <free>
 46e:	83 c4 10             	add    $0x10,%esp
 471:	eb d5                	jmp    448 <thread_join+0x1d>
    }
  }
  return pid;
}
 473:	89 f0                	mov    %esi,%eax
 475:	8d 65 f8             	lea    -0x8(%ebp),%esp
 478:	5b                   	pop    %ebx
 479:	5e                   	pop    %esi
 47a:	5d                   	pop    %ebp
 47b:	c3                   	ret    

0000047c <lock_acquire>:

void lock_acquire(lock_t *lock){
 47c:	55                   	push   %ebp
 47d:	89 e5                	mov    %esp,%ebp
 47f:	53                   	push   %ebx
 480:	83 ec 04             	sub    $0x4,%esp
 483:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 486:	83 ec 08             	sub    $0x8,%esp
 489:	6a 01                	push   $0x1
 48b:	53                   	push   %ebx
 48c:	e8 29 ff ff ff       	call   3ba <test_and_set>
 491:	83 c4 10             	add    $0x10,%esp
 494:	83 f8 01             	cmp    $0x1,%eax
 497:	74 ed                	je     486 <lock_acquire+0xa>
    ;
}
 499:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 49c:	c9                   	leave  
 49d:	c3                   	ret    

0000049e <lock_release>:

void lock_release(lock_t *lock) {
 49e:	55                   	push   %ebp
 49f:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 4a1:	8b 45 08             	mov    0x8(%ebp),%eax
 4a4:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 4aa:	5d                   	pop    %ebp
 4ab:	c3                   	ret    

000004ac <lock_init>:

void lock_init(lock_t *lock) {
 4ac:	55                   	push   %ebp
 4ad:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 4af:	8b 45 08             	mov    0x8(%ebp),%eax
 4b2:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 4b8:	5d                   	pop    %ebp
 4b9:	c3                   	ret    

000004ba <strcpy>:

char*
strcpy(char *s, const char *t)
{
 4ba:	55                   	push   %ebp
 4bb:	89 e5                	mov    %esp,%ebp
 4bd:	56                   	push   %esi
 4be:	53                   	push   %ebx
 4bf:	8b 75 08             	mov    0x8(%ebp),%esi
 4c2:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 4c5:	89 f0                	mov    %esi,%eax
 4c7:	89 d1                	mov    %edx,%ecx
 4c9:	83 c2 01             	add    $0x1,%edx
 4cc:	89 c3                	mov    %eax,%ebx
 4ce:	83 c0 01             	add    $0x1,%eax
 4d1:	0f b6 09             	movzbl (%ecx),%ecx
 4d4:	88 0b                	mov    %cl,(%ebx)
 4d6:	84 c9                	test   %cl,%cl
 4d8:	75 ed                	jne    4c7 <strcpy+0xd>
    ;
  return os;
}
 4da:	89 f0                	mov    %esi,%eax
 4dc:	5b                   	pop    %ebx
 4dd:	5e                   	pop    %esi
 4de:	5d                   	pop    %ebp
 4df:	c3                   	ret    

000004e0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 4e0:	55                   	push   %ebp
 4e1:	89 e5                	mov    %esp,%ebp
 4e3:	8b 4d 08             	mov    0x8(%ebp),%ecx
 4e6:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 4e9:	eb 06                	jmp    4f1 <strcmp+0x11>
    p++, q++;
 4eb:	83 c1 01             	add    $0x1,%ecx
 4ee:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 4f1:	0f b6 01             	movzbl (%ecx),%eax
 4f4:	84 c0                	test   %al,%al
 4f6:	74 04                	je     4fc <strcmp+0x1c>
 4f8:	3a 02                	cmp    (%edx),%al
 4fa:	74 ef                	je     4eb <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 4fc:	0f b6 c0             	movzbl %al,%eax
 4ff:	0f b6 12             	movzbl (%edx),%edx
 502:	29 d0                	sub    %edx,%eax
}
 504:	5d                   	pop    %ebp
 505:	c3                   	ret    

00000506 <strlen>:

uint
strlen(const char *s)
{
 506:	55                   	push   %ebp
 507:	89 e5                	mov    %esp,%ebp
 509:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 50c:	b8 00 00 00 00       	mov    $0x0,%eax
 511:	eb 03                	jmp    516 <strlen+0x10>
 513:	83 c0 01             	add    $0x1,%eax
 516:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 51a:	75 f7                	jne    513 <strlen+0xd>
    ;
  return n;
}
 51c:	5d                   	pop    %ebp
 51d:	c3                   	ret    

0000051e <memset>:

void*
memset(void *dst, int c, uint n)
{
 51e:	55                   	push   %ebp
 51f:	89 e5                	mov    %esp,%ebp
 521:	57                   	push   %edi
 522:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 525:	89 d7                	mov    %edx,%edi
 527:	8b 4d 10             	mov    0x10(%ebp),%ecx
 52a:	8b 45 0c             	mov    0xc(%ebp),%eax
 52d:	fc                   	cld    
 52e:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 530:	89 d0                	mov    %edx,%eax
 532:	8b 7d fc             	mov    -0x4(%ebp),%edi
 535:	c9                   	leave  
 536:	c3                   	ret    

00000537 <strchr>:

char*
strchr(const char *s, char c)
{
 537:	55                   	push   %ebp
 538:	89 e5                	mov    %esp,%ebp
 53a:	8b 45 08             	mov    0x8(%ebp),%eax
 53d:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 541:	eb 03                	jmp    546 <strchr+0xf>
 543:	83 c0 01             	add    $0x1,%eax
 546:	0f b6 10             	movzbl (%eax),%edx
 549:	84 d2                	test   %dl,%dl
 54b:	74 06                	je     553 <strchr+0x1c>
    if(*s == c)
 54d:	38 ca                	cmp    %cl,%dl
 54f:	75 f2                	jne    543 <strchr+0xc>
 551:	eb 05                	jmp    558 <strchr+0x21>
      return (char*)s;
  return 0;
 553:	b8 00 00 00 00       	mov    $0x0,%eax
}
 558:	5d                   	pop    %ebp
 559:	c3                   	ret    

0000055a <gets>:

char*
gets(char *buf, int max)
{
 55a:	55                   	push   %ebp
 55b:	89 e5                	mov    %esp,%ebp
 55d:	57                   	push   %edi
 55e:	56                   	push   %esi
 55f:	53                   	push   %ebx
 560:	83 ec 1c             	sub    $0x1c,%esp
 563:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 566:	bb 00 00 00 00       	mov    $0x0,%ebx
 56b:	89 de                	mov    %ebx,%esi
 56d:	83 c3 01             	add    $0x1,%ebx
 570:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 573:	7d 2e                	jge    5a3 <gets+0x49>
    cc = read(0, &c, 1);
 575:	83 ec 04             	sub    $0x4,%esp
 578:	6a 01                	push   $0x1
 57a:	8d 45 e7             	lea    -0x19(%ebp),%eax
 57d:	50                   	push   %eax
 57e:	6a 00                	push   $0x0
 580:	e8 ec 00 00 00       	call   671 <read>
    if(cc < 1)
 585:	83 c4 10             	add    $0x10,%esp
 588:	85 c0                	test   %eax,%eax
 58a:	7e 17                	jle    5a3 <gets+0x49>
      break;
    buf[i++] = c;
 58c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 590:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 593:	3c 0a                	cmp    $0xa,%al
 595:	0f 94 c2             	sete   %dl
 598:	3c 0d                	cmp    $0xd,%al
 59a:	0f 94 c0             	sete   %al
 59d:	08 c2                	or     %al,%dl
 59f:	74 ca                	je     56b <gets+0x11>
    buf[i++] = c;
 5a1:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 5a3:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 5a7:	89 f8                	mov    %edi,%eax
 5a9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5ac:	5b                   	pop    %ebx
 5ad:	5e                   	pop    %esi
 5ae:	5f                   	pop    %edi
 5af:	5d                   	pop    %ebp
 5b0:	c3                   	ret    

000005b1 <stat>:

int
stat(const char *n, struct stat *st)
{
 5b1:	55                   	push   %ebp
 5b2:	89 e5                	mov    %esp,%ebp
 5b4:	56                   	push   %esi
 5b5:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 5b6:	83 ec 08             	sub    $0x8,%esp
 5b9:	6a 00                	push   $0x0
 5bb:	ff 75 08             	push   0x8(%ebp)
 5be:	e8 d6 00 00 00       	call   699 <open>
  if(fd < 0)
 5c3:	83 c4 10             	add    $0x10,%esp
 5c6:	85 c0                	test   %eax,%eax
 5c8:	78 24                	js     5ee <stat+0x3d>
 5ca:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 5cc:	83 ec 08             	sub    $0x8,%esp
 5cf:	ff 75 0c             	push   0xc(%ebp)
 5d2:	50                   	push   %eax
 5d3:	e8 d9 00 00 00       	call   6b1 <fstat>
 5d8:	89 c6                	mov    %eax,%esi
  close(fd);
 5da:	89 1c 24             	mov    %ebx,(%esp)
 5dd:	e8 9f 00 00 00       	call   681 <close>
  return r;
 5e2:	83 c4 10             	add    $0x10,%esp
}
 5e5:	89 f0                	mov    %esi,%eax
 5e7:	8d 65 f8             	lea    -0x8(%ebp),%esp
 5ea:	5b                   	pop    %ebx
 5eb:	5e                   	pop    %esi
 5ec:	5d                   	pop    %ebp
 5ed:	c3                   	ret    
    return -1;
 5ee:	be ff ff ff ff       	mov    $0xffffffff,%esi
 5f3:	eb f0                	jmp    5e5 <stat+0x34>

000005f5 <atoi>:

int
atoi(const char *s)
{
 5f5:	55                   	push   %ebp
 5f6:	89 e5                	mov    %esp,%ebp
 5f8:	53                   	push   %ebx
 5f9:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 5fc:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 601:	eb 10                	jmp    613 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 603:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 606:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 609:	83 c1 01             	add    $0x1,%ecx
 60c:	0f be c0             	movsbl %al,%eax
 60f:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 613:	0f b6 01             	movzbl (%ecx),%eax
 616:	8d 58 d0             	lea    -0x30(%eax),%ebx
 619:	80 fb 09             	cmp    $0x9,%bl
 61c:	76 e5                	jbe    603 <atoi+0xe>
  return n;
}
 61e:	89 d0                	mov    %edx,%eax
 620:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 623:	c9                   	leave  
 624:	c3                   	ret    

00000625 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 625:	55                   	push   %ebp
 626:	89 e5                	mov    %esp,%ebp
 628:	56                   	push   %esi
 629:	53                   	push   %ebx
 62a:	8b 75 08             	mov    0x8(%ebp),%esi
 62d:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 630:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 633:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 635:	eb 0d                	jmp    644 <memmove+0x1f>
    *dst++ = *src++;
 637:	0f b6 01             	movzbl (%ecx),%eax
 63a:	88 02                	mov    %al,(%edx)
 63c:	8d 49 01             	lea    0x1(%ecx),%ecx
 63f:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 642:	89 d8                	mov    %ebx,%eax
 644:	8d 58 ff             	lea    -0x1(%eax),%ebx
 647:	85 c0                	test   %eax,%eax
 649:	7f ec                	jg     637 <memmove+0x12>
  return vdst;
}
 64b:	89 f0                	mov    %esi,%eax
 64d:	5b                   	pop    %ebx
 64e:	5e                   	pop    %esi
 64f:	5d                   	pop    %ebp
 650:	c3                   	ret    

00000651 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 651:	b8 01 00 00 00       	mov    $0x1,%eax
 656:	cd 40                	int    $0x40
 658:	c3                   	ret    

00000659 <exit>:
SYSCALL(exit)
 659:	b8 02 00 00 00       	mov    $0x2,%eax
 65e:	cd 40                	int    $0x40
 660:	c3                   	ret    

00000661 <wait>:
SYSCALL(wait)
 661:	b8 03 00 00 00       	mov    $0x3,%eax
 666:	cd 40                	int    $0x40
 668:	c3                   	ret    

00000669 <pipe>:
SYSCALL(pipe)
 669:	b8 04 00 00 00       	mov    $0x4,%eax
 66e:	cd 40                	int    $0x40
 670:	c3                   	ret    

00000671 <read>:
SYSCALL(read)
 671:	b8 05 00 00 00       	mov    $0x5,%eax
 676:	cd 40                	int    $0x40
 678:	c3                   	ret    

00000679 <write>:
SYSCALL(write)
 679:	b8 10 00 00 00       	mov    $0x10,%eax
 67e:	cd 40                	int    $0x40
 680:	c3                   	ret    

00000681 <close>:
SYSCALL(close)
 681:	b8 15 00 00 00       	mov    $0x15,%eax
 686:	cd 40                	int    $0x40
 688:	c3                   	ret    

00000689 <kill>:
SYSCALL(kill)
 689:	b8 06 00 00 00       	mov    $0x6,%eax
 68e:	cd 40                	int    $0x40
 690:	c3                   	ret    

00000691 <exec>:
SYSCALL(exec)
 691:	b8 07 00 00 00       	mov    $0x7,%eax
 696:	cd 40                	int    $0x40
 698:	c3                   	ret    

00000699 <open>:
SYSCALL(open)
 699:	b8 0f 00 00 00       	mov    $0xf,%eax
 69e:	cd 40                	int    $0x40
 6a0:	c3                   	ret    

000006a1 <mknod>:
SYSCALL(mknod)
 6a1:	b8 11 00 00 00       	mov    $0x11,%eax
 6a6:	cd 40                	int    $0x40
 6a8:	c3                   	ret    

000006a9 <unlink>:
SYSCALL(unlink)
 6a9:	b8 12 00 00 00       	mov    $0x12,%eax
 6ae:	cd 40                	int    $0x40
 6b0:	c3                   	ret    

000006b1 <fstat>:
SYSCALL(fstat)
 6b1:	b8 08 00 00 00       	mov    $0x8,%eax
 6b6:	cd 40                	int    $0x40
 6b8:	c3                   	ret    

000006b9 <link>:
SYSCALL(link)
 6b9:	b8 13 00 00 00       	mov    $0x13,%eax
 6be:	cd 40                	int    $0x40
 6c0:	c3                   	ret    

000006c1 <mkdir>:
SYSCALL(mkdir)
 6c1:	b8 14 00 00 00       	mov    $0x14,%eax
 6c6:	cd 40                	int    $0x40
 6c8:	c3                   	ret    

000006c9 <chdir>:
SYSCALL(chdir)
 6c9:	b8 09 00 00 00       	mov    $0x9,%eax
 6ce:	cd 40                	int    $0x40
 6d0:	c3                   	ret    

000006d1 <dup>:
SYSCALL(dup)
 6d1:	b8 0a 00 00 00       	mov    $0xa,%eax
 6d6:	cd 40                	int    $0x40
 6d8:	c3                   	ret    

000006d9 <getpid>:
SYSCALL(getpid)
 6d9:	b8 0b 00 00 00       	mov    $0xb,%eax
 6de:	cd 40                	int    $0x40
 6e0:	c3                   	ret    

000006e1 <sbrk>:
SYSCALL(sbrk)
 6e1:	b8 0c 00 00 00       	mov    $0xc,%eax
 6e6:	cd 40                	int    $0x40
 6e8:	c3                   	ret    

000006e9 <sleep>:
SYSCALL(sleep)
 6e9:	b8 0d 00 00 00       	mov    $0xd,%eax
 6ee:	cd 40                	int    $0x40
 6f0:	c3                   	ret    

000006f1 <uptime>:
SYSCALL(uptime)
 6f1:	b8 0e 00 00 00       	mov    $0xe,%eax
 6f6:	cd 40                	int    $0x40
 6f8:	c3                   	ret    

000006f9 <clone>:
SYSCALL(clone)
 6f9:	b8 16 00 00 00       	mov    $0x16,%eax
 6fe:	cd 40                	int    $0x40
 700:	c3                   	ret    

00000701 <join>:
 701:	b8 17 00 00 00       	mov    $0x17,%eax
 706:	cd 40                	int    $0x40
 708:	c3                   	ret    

00000709 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 709:	55                   	push   %ebp
 70a:	89 e5                	mov    %esp,%ebp
 70c:	83 ec 1c             	sub    $0x1c,%esp
 70f:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 712:	6a 01                	push   $0x1
 714:	8d 55 f4             	lea    -0xc(%ebp),%edx
 717:	52                   	push   %edx
 718:	50                   	push   %eax
 719:	e8 5b ff ff ff       	call   679 <write>
}
 71e:	83 c4 10             	add    $0x10,%esp
 721:	c9                   	leave  
 722:	c3                   	ret    

00000723 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 723:	55                   	push   %ebp
 724:	89 e5                	mov    %esp,%ebp
 726:	57                   	push   %edi
 727:	56                   	push   %esi
 728:	53                   	push   %ebx
 729:	83 ec 2c             	sub    $0x2c,%esp
 72c:	89 45 d0             	mov    %eax,-0x30(%ebp)
 72f:	89 d0                	mov    %edx,%eax
 731:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 733:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 737:	0f 95 c1             	setne  %cl
 73a:	c1 ea 1f             	shr    $0x1f,%edx
 73d:	84 d1                	test   %dl,%cl
 73f:	74 44                	je     785 <printint+0x62>
    neg = 1;
    x = -xx;
 741:	f7 d8                	neg    %eax
 743:	89 c1                	mov    %eax,%ecx
    neg = 1;
 745:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 74c:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 751:	89 c8                	mov    %ecx,%eax
 753:	ba 00 00 00 00       	mov    $0x0,%edx
 758:	f7 f6                	div    %esi
 75a:	89 df                	mov    %ebx,%edi
 75c:	83 c3 01             	add    $0x1,%ebx
 75f:	0f b6 92 a0 0b 00 00 	movzbl 0xba0(%edx),%edx
 766:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 76a:	89 ca                	mov    %ecx,%edx
 76c:	89 c1                	mov    %eax,%ecx
 76e:	39 d6                	cmp    %edx,%esi
 770:	76 df                	jbe    751 <printint+0x2e>
  if(neg)
 772:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 776:	74 31                	je     7a9 <printint+0x86>
    buf[i++] = '-';
 778:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 77d:	8d 5f 02             	lea    0x2(%edi),%ebx
 780:	8b 75 d0             	mov    -0x30(%ebp),%esi
 783:	eb 17                	jmp    79c <printint+0x79>
    x = xx;
 785:	89 c1                	mov    %eax,%ecx
  neg = 0;
 787:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 78e:	eb bc                	jmp    74c <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 790:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 795:	89 f0                	mov    %esi,%eax
 797:	e8 6d ff ff ff       	call   709 <putc>
  while(--i >= 0)
 79c:	83 eb 01             	sub    $0x1,%ebx
 79f:	79 ef                	jns    790 <printint+0x6d>
}
 7a1:	83 c4 2c             	add    $0x2c,%esp
 7a4:	5b                   	pop    %ebx
 7a5:	5e                   	pop    %esi
 7a6:	5f                   	pop    %edi
 7a7:	5d                   	pop    %ebp
 7a8:	c3                   	ret    
 7a9:	8b 75 d0             	mov    -0x30(%ebp),%esi
 7ac:	eb ee                	jmp    79c <printint+0x79>

000007ae <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 7ae:	55                   	push   %ebp
 7af:	89 e5                	mov    %esp,%ebp
 7b1:	57                   	push   %edi
 7b2:	56                   	push   %esi
 7b3:	53                   	push   %ebx
 7b4:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 7b7:	8d 45 10             	lea    0x10(%ebp),%eax
 7ba:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 7bd:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 7c2:	bb 00 00 00 00       	mov    $0x0,%ebx
 7c7:	eb 14                	jmp    7dd <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 7c9:	89 fa                	mov    %edi,%edx
 7cb:	8b 45 08             	mov    0x8(%ebp),%eax
 7ce:	e8 36 ff ff ff       	call   709 <putc>
 7d3:	eb 05                	jmp    7da <printf+0x2c>
      }
    } else if(state == '%'){
 7d5:	83 fe 25             	cmp    $0x25,%esi
 7d8:	74 25                	je     7ff <printf+0x51>
  for(i = 0; fmt[i]; i++){
 7da:	83 c3 01             	add    $0x1,%ebx
 7dd:	8b 45 0c             	mov    0xc(%ebp),%eax
 7e0:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 7e4:	84 c0                	test   %al,%al
 7e6:	0f 84 20 01 00 00    	je     90c <printf+0x15e>
    c = fmt[i] & 0xff;
 7ec:	0f be f8             	movsbl %al,%edi
 7ef:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 7f2:	85 f6                	test   %esi,%esi
 7f4:	75 df                	jne    7d5 <printf+0x27>
      if(c == '%'){
 7f6:	83 f8 25             	cmp    $0x25,%eax
 7f9:	75 ce                	jne    7c9 <printf+0x1b>
        state = '%';
 7fb:	89 c6                	mov    %eax,%esi
 7fd:	eb db                	jmp    7da <printf+0x2c>
      if(c == 'd'){
 7ff:	83 f8 25             	cmp    $0x25,%eax
 802:	0f 84 cf 00 00 00    	je     8d7 <printf+0x129>
 808:	0f 8c dd 00 00 00    	jl     8eb <printf+0x13d>
 80e:	83 f8 78             	cmp    $0x78,%eax
 811:	0f 8f d4 00 00 00    	jg     8eb <printf+0x13d>
 817:	83 f8 63             	cmp    $0x63,%eax
 81a:	0f 8c cb 00 00 00    	jl     8eb <printf+0x13d>
 820:	83 e8 63             	sub    $0x63,%eax
 823:	83 f8 15             	cmp    $0x15,%eax
 826:	0f 87 bf 00 00 00    	ja     8eb <printf+0x13d>
 82c:	ff 24 85 48 0b 00 00 	jmp    *0xb48(,%eax,4)
        printint(fd, *ap, 10, 1);
 833:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 836:	8b 17                	mov    (%edi),%edx
 838:	83 ec 0c             	sub    $0xc,%esp
 83b:	6a 01                	push   $0x1
 83d:	b9 0a 00 00 00       	mov    $0xa,%ecx
 842:	8b 45 08             	mov    0x8(%ebp),%eax
 845:	e8 d9 fe ff ff       	call   723 <printint>
        ap++;
 84a:	83 c7 04             	add    $0x4,%edi
 84d:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 850:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 853:	be 00 00 00 00       	mov    $0x0,%esi
 858:	eb 80                	jmp    7da <printf+0x2c>
        printint(fd, *ap, 16, 0);
 85a:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 85d:	8b 17                	mov    (%edi),%edx
 85f:	83 ec 0c             	sub    $0xc,%esp
 862:	6a 00                	push   $0x0
 864:	b9 10 00 00 00       	mov    $0x10,%ecx
 869:	8b 45 08             	mov    0x8(%ebp),%eax
 86c:	e8 b2 fe ff ff       	call   723 <printint>
        ap++;
 871:	83 c7 04             	add    $0x4,%edi
 874:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 877:	83 c4 10             	add    $0x10,%esp
      state = 0;
 87a:	be 00 00 00 00       	mov    $0x0,%esi
 87f:	e9 56 ff ff ff       	jmp    7da <printf+0x2c>
        s = (char*)*ap;
 884:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 887:	8b 30                	mov    (%eax),%esi
        ap++;
 889:	83 c0 04             	add    $0x4,%eax
 88c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 88f:	85 f6                	test   %esi,%esi
 891:	75 15                	jne    8a8 <printf+0xfa>
          s = "(null)";
 893:	be 3f 0b 00 00       	mov    $0xb3f,%esi
 898:	eb 0e                	jmp    8a8 <printf+0xfa>
          putc(fd, *s);
 89a:	0f be d2             	movsbl %dl,%edx
 89d:	8b 45 08             	mov    0x8(%ebp),%eax
 8a0:	e8 64 fe ff ff       	call   709 <putc>
          s++;
 8a5:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 8a8:	0f b6 16             	movzbl (%esi),%edx
 8ab:	84 d2                	test   %dl,%dl
 8ad:	75 eb                	jne    89a <printf+0xec>
      state = 0;
 8af:	be 00 00 00 00       	mov    $0x0,%esi
 8b4:	e9 21 ff ff ff       	jmp    7da <printf+0x2c>
        putc(fd, *ap);
 8b9:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 8bc:	0f be 17             	movsbl (%edi),%edx
 8bf:	8b 45 08             	mov    0x8(%ebp),%eax
 8c2:	e8 42 fe ff ff       	call   709 <putc>
        ap++;
 8c7:	83 c7 04             	add    $0x4,%edi
 8ca:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 8cd:	be 00 00 00 00       	mov    $0x0,%esi
 8d2:	e9 03 ff ff ff       	jmp    7da <printf+0x2c>
        putc(fd, c);
 8d7:	89 fa                	mov    %edi,%edx
 8d9:	8b 45 08             	mov    0x8(%ebp),%eax
 8dc:	e8 28 fe ff ff       	call   709 <putc>
      state = 0;
 8e1:	be 00 00 00 00       	mov    $0x0,%esi
 8e6:	e9 ef fe ff ff       	jmp    7da <printf+0x2c>
        putc(fd, '%');
 8eb:	ba 25 00 00 00       	mov    $0x25,%edx
 8f0:	8b 45 08             	mov    0x8(%ebp),%eax
 8f3:	e8 11 fe ff ff       	call   709 <putc>
        putc(fd, c);
 8f8:	89 fa                	mov    %edi,%edx
 8fa:	8b 45 08             	mov    0x8(%ebp),%eax
 8fd:	e8 07 fe ff ff       	call   709 <putc>
      state = 0;
 902:	be 00 00 00 00       	mov    $0x0,%esi
 907:	e9 ce fe ff ff       	jmp    7da <printf+0x2c>
    }
  }
}
 90c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 90f:	5b                   	pop    %ebx
 910:	5e                   	pop    %esi
 911:	5f                   	pop    %edi
 912:	5d                   	pop    %ebp
 913:	c3                   	ret    

00000914 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 914:	55                   	push   %ebp
 915:	89 e5                	mov    %esp,%ebp
 917:	57                   	push   %edi
 918:	56                   	push   %esi
 919:	53                   	push   %ebx
 91a:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 91d:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 920:	a1 60 10 00 00       	mov    0x1060,%eax
 925:	eb 02                	jmp    929 <free+0x15>
 927:	89 d0                	mov    %edx,%eax
 929:	39 c8                	cmp    %ecx,%eax
 92b:	73 04                	jae    931 <free+0x1d>
 92d:	39 08                	cmp    %ecx,(%eax)
 92f:	77 12                	ja     943 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 931:	8b 10                	mov    (%eax),%edx
 933:	39 c2                	cmp    %eax,%edx
 935:	77 f0                	ja     927 <free+0x13>
 937:	39 c8                	cmp    %ecx,%eax
 939:	72 08                	jb     943 <free+0x2f>
 93b:	39 ca                	cmp    %ecx,%edx
 93d:	77 04                	ja     943 <free+0x2f>
 93f:	89 d0                	mov    %edx,%eax
 941:	eb e6                	jmp    929 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 943:	8b 73 fc             	mov    -0x4(%ebx),%esi
 946:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 949:	8b 10                	mov    (%eax),%edx
 94b:	39 d7                	cmp    %edx,%edi
 94d:	74 19                	je     968 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 94f:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 952:	8b 50 04             	mov    0x4(%eax),%edx
 955:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 958:	39 ce                	cmp    %ecx,%esi
 95a:	74 1b                	je     977 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 95c:	89 08                	mov    %ecx,(%eax)
  freep = p;
 95e:	a3 60 10 00 00       	mov    %eax,0x1060
}
 963:	5b                   	pop    %ebx
 964:	5e                   	pop    %esi
 965:	5f                   	pop    %edi
 966:	5d                   	pop    %ebp
 967:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 968:	03 72 04             	add    0x4(%edx),%esi
 96b:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 96e:	8b 10                	mov    (%eax),%edx
 970:	8b 12                	mov    (%edx),%edx
 972:	89 53 f8             	mov    %edx,-0x8(%ebx)
 975:	eb db                	jmp    952 <free+0x3e>
    p->s.size += bp->s.size;
 977:	03 53 fc             	add    -0x4(%ebx),%edx
 97a:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 97d:	8b 53 f8             	mov    -0x8(%ebx),%edx
 980:	89 10                	mov    %edx,(%eax)
 982:	eb da                	jmp    95e <free+0x4a>

00000984 <morecore>:

static Header*
morecore(uint nu)
{
 984:	55                   	push   %ebp
 985:	89 e5                	mov    %esp,%ebp
 987:	53                   	push   %ebx
 988:	83 ec 04             	sub    $0x4,%esp
 98b:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 98d:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 992:	77 05                	ja     999 <morecore+0x15>
    nu = 4096;
 994:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 999:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 9a0:	83 ec 0c             	sub    $0xc,%esp
 9a3:	50                   	push   %eax
 9a4:	e8 38 fd ff ff       	call   6e1 <sbrk>
  if(p == (char*)-1)
 9a9:	83 c4 10             	add    $0x10,%esp
 9ac:	83 f8 ff             	cmp    $0xffffffff,%eax
 9af:	74 1c                	je     9cd <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 9b1:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 9b4:	83 c0 08             	add    $0x8,%eax
 9b7:	83 ec 0c             	sub    $0xc,%esp
 9ba:	50                   	push   %eax
 9bb:	e8 54 ff ff ff       	call   914 <free>
  return freep;
 9c0:	a1 60 10 00 00       	mov    0x1060,%eax
 9c5:	83 c4 10             	add    $0x10,%esp
}
 9c8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 9cb:	c9                   	leave  
 9cc:	c3                   	ret    
    return 0;
 9cd:	b8 00 00 00 00       	mov    $0x0,%eax
 9d2:	eb f4                	jmp    9c8 <morecore+0x44>

000009d4 <malloc>:

void*
malloc(uint nbytes)
{
 9d4:	55                   	push   %ebp
 9d5:	89 e5                	mov    %esp,%ebp
 9d7:	53                   	push   %ebx
 9d8:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9db:	8b 45 08             	mov    0x8(%ebp),%eax
 9de:	8d 58 07             	lea    0x7(%eax),%ebx
 9e1:	c1 eb 03             	shr    $0x3,%ebx
 9e4:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 9e7:	8b 0d 60 10 00 00    	mov    0x1060,%ecx
 9ed:	85 c9                	test   %ecx,%ecx
 9ef:	74 04                	je     9f5 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9f1:	8b 01                	mov    (%ecx),%eax
 9f3:	eb 4a                	jmp    a3f <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 9f5:	c7 05 60 10 00 00 64 	movl   $0x1064,0x1060
 9fc:	10 00 00 
 9ff:	c7 05 64 10 00 00 64 	movl   $0x1064,0x1064
 a06:	10 00 00 
    base.s.size = 0;
 a09:	c7 05 68 10 00 00 00 	movl   $0x0,0x1068
 a10:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 a13:	b9 64 10 00 00       	mov    $0x1064,%ecx
 a18:	eb d7                	jmp    9f1 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 a1a:	74 19                	je     a35 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 a1c:	29 da                	sub    %ebx,%edx
 a1e:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 a21:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 a24:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 a27:	89 0d 60 10 00 00    	mov    %ecx,0x1060
      return (void*)(p + 1);
 a2d:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 a30:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 a33:	c9                   	leave  
 a34:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 a35:	8b 10                	mov    (%eax),%edx
 a37:	89 11                	mov    %edx,(%ecx)
 a39:	eb ec                	jmp    a27 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a3b:	89 c1                	mov    %eax,%ecx
 a3d:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 a3f:	8b 50 04             	mov    0x4(%eax),%edx
 a42:	39 da                	cmp    %ebx,%edx
 a44:	73 d4                	jae    a1a <malloc+0x46>
    if(p == freep)
 a46:	39 05 60 10 00 00    	cmp    %eax,0x1060
 a4c:	75 ed                	jne    a3b <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 a4e:	89 d8                	mov    %ebx,%eax
 a50:	e8 2f ff ff ff       	call   984 <morecore>
 a55:	85 c0                	test   %eax,%eax
 a57:	75 e2                	jne    a3b <malloc+0x67>
 a59:	eb d5                	jmp    a30 <malloc+0x5c>
