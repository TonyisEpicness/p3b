
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
  1c:	a1 40 0f 00 00       	mov    0xf40,%eax
  21:	83 f8 01             	cmp    $0x1,%eax
  24:	0f 84 db 00 00 00    	je     105 <worker+0x105>
  2a:	6a 39                	push   $0x39
  2c:	68 64 0a 00 00       	push   $0xa64
  31:	68 6d 0a 00 00       	push   $0xa6d
  36:	6a 01                	push   $0x1
  38:	e8 79 07 00 00       	call   7b6 <printf>
  3d:	83 c4 0c             	add    $0xc,%esp
  40:	68 ac 0a 00 00       	push   $0xaac
  45:	68 80 0a 00 00       	push   $0xa80
  4a:	6a 01                	push   $0x1
  4c:	e8 65 07 00 00       	call   7b6 <printf>
  51:	83 c4 08             	add    $0x8,%esp
  54:	68 94 0a 00 00       	push   $0xa94
  59:	6a 01                	push   $0x1
  5b:	e8 56 07 00 00       	call   7b6 <printf>
  60:	83 c4 04             	add    $0x4,%esp
  63:	ff 35 60 0f 00 00    	push   0xf60
  69:	e8 23 06 00 00       	call   691 <kill>
  6e:	e8 ee 05 00 00       	call   661 <exit>
   assert(tmp1 == 42);
  73:	6a 37                	push   $0x37
  75:	68 64 0a 00 00       	push   $0xa64
  7a:	68 6d 0a 00 00       	push   $0xa6d
  7f:	6a 01                	push   $0x1
  81:	e8 30 07 00 00       	call   7b6 <printf>
  86:	83 c4 0c             	add    $0xc,%esp
  89:	68 75 0a 00 00       	push   $0xa75
  8e:	68 80 0a 00 00       	push   $0xa80
  93:	6a 01                	push   $0x1
  95:	e8 1c 07 00 00       	call   7b6 <printf>
  9a:	83 c4 08             	add    $0x8,%esp
  9d:	68 94 0a 00 00       	push   $0xa94
  a2:	6a 01                	push   $0x1
  a4:	e8 0d 07 00 00       	call   7b6 <printf>
  a9:	83 c4 04             	add    $0x4,%esp
  ac:	ff 35 60 0f 00 00    	push   0xf60
  b2:	e8 da 05 00 00       	call   691 <kill>
  b7:	e8 a5 05 00 00       	call   661 <exit>
   assert(tmp2 == 24);
  bc:	6a 38                	push   $0x38
  be:	68 64 0a 00 00       	push   $0xa64
  c3:	68 6d 0a 00 00       	push   $0xa6d
  c8:	6a 01                	push   $0x1
  ca:	e8 e7 06 00 00       	call   7b6 <printf>
  cf:	83 c4 0c             	add    $0xc,%esp
  d2:	68 a1 0a 00 00       	push   $0xaa1
  d7:	68 80 0a 00 00       	push   $0xa80
  dc:	6a 01                	push   $0x1
  de:	e8 d3 06 00 00       	call   7b6 <printf>
  e3:	83 c4 08             	add    $0x8,%esp
  e6:	68 94 0a 00 00       	push   $0xa94
  eb:	6a 01                	push   $0x1
  ed:	e8 c4 06 00 00       	call   7b6 <printf>
  f2:	83 c4 04             	add    $0x4,%esp
  f5:	ff 35 60 0f 00 00    	push   0xf60
  fb:	e8 91 05 00 00       	call   691 <kill>
 100:	e8 5c 05 00 00       	call   661 <exit>
   global++;
 105:	83 c0 01             	add    $0x1,%eax
 108:	a3 40 0f 00 00       	mov    %eax,0xf40
   exit();
 10d:	e8 4f 05 00 00       	call   661 <exit>

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
 126:	e8 b6 05 00 00       	call   6e1 <getpid>
 12b:	a3 60 0f 00 00       	mov    %eax,0xf60
   void *stack, *p = malloc(PGSIZE * 2);
 130:	83 ec 0c             	sub    $0xc,%esp
 133:	68 00 20 00 00       	push   $0x2000
 138:	e8 9f 08 00 00       	call   9dc <malloc>
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
 15a:	68 64 0a 00 00       	push   $0xa64
 15f:	68 6d 0a 00 00       	push   $0xa6d
 164:	6a 01                	push   $0x1
 166:	e8 4b 06 00 00       	call   7b6 <printf>
 16b:	83 c4 0c             	add    $0xc,%esp
 16e:	68 b8 0a 00 00       	push   $0xab8
 173:	68 80 0a 00 00       	push   $0xa80
 178:	6a 01                	push   $0x1
 17a:	e8 37 06 00 00       	call   7b6 <printf>
 17f:	83 c4 08             	add    $0x8,%esp
 182:	68 94 0a 00 00       	push   $0xa94
 187:	6a 01                	push   $0x1
 189:	e8 28 06 00 00       	call   7b6 <printf>
 18e:	83 c4 04             	add    $0x4,%esp
 191:	ff 35 60 0f 00 00    	push   0xf60
 197:	e8 f5 04 00 00       	call   691 <kill>
 19c:	e8 c0 04 00 00       	call   661 <exit>
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
 1bf:	e8 3d 05 00 00       	call   701 <clone>
 1c4:	89 c6                	mov    %eax,%esi
   assert(clone_pid > 0);
 1c6:	83 c4 10             	add    $0x10,%esp
 1c9:	85 c0                	test   %eax,%eax
 1cb:	0f 8e 82 00 00 00    	jle    253 <main+0x141>
   sbrk(PGSIZE);
 1d1:	83 ec 0c             	sub    $0xc,%esp
 1d4:	68 00 10 00 00       	push   $0x1000
 1d9:	e8 0b 05 00 00       	call   6e9 <sbrk>
   void **join_stack = (void**) ((uint)sbrk(0) - 4);
 1de:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1e5:	e8 ff 04 00 00       	call   6e9 <sbrk>
 1ea:	89 45 d0             	mov    %eax,-0x30(%ebp)
 1ed:	8d 50 fc             	lea    -0x4(%eax),%edx
 1f0:	89 55 d4             	mov    %edx,-0x2c(%ebp)
   assert(join((void**)((uint)join_stack + 2)) == -1);
 1f3:	83 e8 02             	sub    $0x2,%eax
 1f6:	89 04 24             	mov    %eax,(%esp)
 1f9:	e8 0b 05 00 00       	call   709 <join>
 1fe:	83 c4 10             	add    $0x10,%esp
 201:	83 f8 ff             	cmp    $0xffffffff,%eax
 204:	0f 84 92 00 00 00    	je     29c <main+0x18a>
 20a:	6a 29                	push   $0x29
 20c:	68 64 0a 00 00       	push   $0xa64
 211:	68 6d 0a 00 00       	push   $0xa6d
 216:	6a 01                	push   $0x1
 218:	e8 99 05 00 00       	call   7b6 <printf>
 21d:	83 c4 0c             	add    $0xc,%esp
 220:	68 1c 0b 00 00       	push   $0xb1c
 225:	68 80 0a 00 00       	push   $0xa80
 22a:	6a 01                	push   $0x1
 22c:	e8 85 05 00 00       	call   7b6 <printf>
 231:	83 c4 08             	add    $0x8,%esp
 234:	68 94 0a 00 00       	push   $0xa94
 239:	6a 01                	push   $0x1
 23b:	e8 76 05 00 00       	call   7b6 <printf>
 240:	83 c4 04             	add    $0x4,%esp
 243:	ff 35 60 0f 00 00    	push   0xf60
 249:	e8 43 04 00 00       	call   691 <kill>
 24e:	e8 0e 04 00 00       	call   661 <exit>
   assert(clone_pid > 0);
 253:	6a 25                	push   $0x25
 255:	68 64 0a 00 00       	push   $0xa64
 25a:	68 6d 0a 00 00       	push   $0xa6d
 25f:	6a 01                	push   $0x1
 261:	e8 50 05 00 00       	call   7b6 <printf>
 266:	83 c4 0c             	add    $0xc,%esp
 269:	68 c2 0a 00 00       	push   $0xac2
 26e:	68 80 0a 00 00       	push   $0xa80
 273:	6a 01                	push   $0x1
 275:	e8 3c 05 00 00       	call   7b6 <printf>
 27a:	83 c4 08             	add    $0x8,%esp
 27d:	68 94 0a 00 00       	push   $0xa94
 282:	6a 01                	push   $0x1
 284:	e8 2d 05 00 00       	call   7b6 <printf>
 289:	83 c4 04             	add    $0x4,%esp
 28c:	ff 35 60 0f 00 00    	push   0xf60
 292:	e8 fa 03 00 00       	call   691 <kill>
 297:	e8 c5 03 00 00       	call   661 <exit>
   assert(join(join_stack) == clone_pid);
 29c:	83 ec 0c             	sub    $0xc,%esp
 29f:	ff 75 d4             	push   -0x2c(%ebp)
 2a2:	e8 62 04 00 00       	call   709 <join>
 2a7:	83 c4 10             	add    $0x10,%esp
 2aa:	39 f0                	cmp    %esi,%eax
 2ac:	75 55                	jne    303 <main+0x1f1>
   assert(stack == *join_stack);
 2ae:	8b 45 d0             	mov    -0x30(%ebp),%eax
 2b1:	39 78 fc             	cmp    %edi,-0x4(%eax)
 2b4:	0f 84 92 00 00 00    	je     34c <main+0x23a>
 2ba:	6a 2b                	push   $0x2b
 2bc:	68 64 0a 00 00       	push   $0xa64
 2c1:	68 6d 0a 00 00       	push   $0xa6d
 2c6:	6a 01                	push   $0x1
 2c8:	e8 e9 04 00 00       	call   7b6 <printf>
 2cd:	83 c4 0c             	add    $0xc,%esp
 2d0:	68 ee 0a 00 00       	push   $0xaee
 2d5:	68 80 0a 00 00       	push   $0xa80
 2da:	6a 01                	push   $0x1
 2dc:	e8 d5 04 00 00       	call   7b6 <printf>
 2e1:	83 c4 08             	add    $0x8,%esp
 2e4:	68 94 0a 00 00       	push   $0xa94
 2e9:	6a 01                	push   $0x1
 2eb:	e8 c6 04 00 00       	call   7b6 <printf>
 2f0:	83 c4 04             	add    $0x4,%esp
 2f3:	ff 35 60 0f 00 00    	push   0xf60
 2f9:	e8 93 03 00 00       	call   691 <kill>
 2fe:	e8 5e 03 00 00       	call   661 <exit>
   assert(join(join_stack) == clone_pid);
 303:	6a 2a                	push   $0x2a
 305:	68 64 0a 00 00       	push   $0xa64
 30a:	68 6d 0a 00 00       	push   $0xa6d
 30f:	6a 01                	push   $0x1
 311:	e8 a0 04 00 00       	call   7b6 <printf>
 316:	83 c4 0c             	add    $0xc,%esp
 319:	68 d0 0a 00 00       	push   $0xad0
 31e:	68 80 0a 00 00       	push   $0xa80
 323:	6a 01                	push   $0x1
 325:	e8 8c 04 00 00       	call   7b6 <printf>
 32a:	83 c4 08             	add    $0x8,%esp
 32d:	68 94 0a 00 00       	push   $0xa94
 332:	6a 01                	push   $0x1
 334:	e8 7d 04 00 00       	call   7b6 <printf>
 339:	83 c4 04             	add    $0x4,%esp
 33c:	ff 35 60 0f 00 00    	push   0xf60
 342:	e8 4a 03 00 00       	call   691 <kill>
 347:	e8 15 03 00 00       	call   661 <exit>
   assert(global == 2);
 34c:	83 3d 40 0f 00 00 02 	cmpl   $0x2,0xf40
 353:	74 49                	je     39e <main+0x28c>
 355:	6a 2c                	push   $0x2c
 357:	68 64 0a 00 00       	push   $0xa64
 35c:	68 6d 0a 00 00       	push   $0xa6d
 361:	6a 01                	push   $0x1
 363:	e8 4e 04 00 00       	call   7b6 <printf>
 368:	83 c4 0c             	add    $0xc,%esp
 36b:	68 03 0b 00 00       	push   $0xb03
 370:	68 80 0a 00 00       	push   $0xa80
 375:	6a 01                	push   $0x1
 377:	e8 3a 04 00 00       	call   7b6 <printf>
 37c:	83 c4 08             	add    $0x8,%esp
 37f:	68 94 0a 00 00       	push   $0xa94
 384:	6a 01                	push   $0x1
 386:	e8 2b 04 00 00       	call   7b6 <printf>
 38b:	83 c4 04             	add    $0x4,%esp
 38e:	ff 35 60 0f 00 00    	push   0xf60
 394:	e8 f8 02 00 00       	call   691 <kill>
 399:	e8 c3 02 00 00       	call   661 <exit>
   printf(1, "TEST PASSED\n");
 39e:	83 ec 08             	sub    $0x8,%esp
 3a1:	68 0f 0b 00 00       	push   $0xb0f
 3a6:	6a 01                	push   $0x1
 3a8:	e8 09 04 00 00       	call   7b6 <printf>
   free(p);
 3ad:	89 1c 24             	mov    %ebx,(%esp)
 3b0:	e8 67 05 00 00       	call   91c <free>
   exit();
 3b5:	e8 a7 02 00 00       	call   661 <exit>

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
 3ce:	83 ec 14             	sub    $0x14,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE*2);
 3d1:	68 00 20 00 00       	push   $0x2000
 3d6:	e8 01 06 00 00       	call   9dc <malloc>
  if(n_stack == 0){
 3db:	83 c4 10             	add    $0x10,%esp
 3de:	85 c0                	test   %eax,%eax
 3e0:	74 4a                	je     42c <thread_create+0x61>
    return -1;
  }
  
  for(int i=0; i<64; i++){
 3e2:	ba 00 00 00 00       	mov    $0x0,%edx
 3e7:	eb 03                	jmp    3ec <thread_create+0x21>
 3e9:	83 c2 01             	add    $0x1,%edx
 3ec:	83 fa 3f             	cmp    $0x3f,%edx
 3ef:	7f 27                	jg     418 <thread_create+0x4d>
    if(threads[i]->flag==0){
 3f1:	8b 0c 95 80 0f 00 00 	mov    0xf80(,%edx,4),%ecx
 3f8:	83 79 08 00          	cmpl   $0x0,0x8(%ecx)
 3fc:	75 eb                	jne    3e9 <thread_create+0x1e>
      threads[i]->maddr = n_stack;
 3fe:	89 01                	mov    %eax,(%ecx)
      threads[i]->pg1addr = n_stack;
 400:	8b 0c 95 80 0f 00 00 	mov    0xf80(,%edx,4),%ecx
 407:	89 41 04             	mov    %eax,0x4(%ecx)
      threads[i]->flag = 1;
 40a:	8b 14 95 80 0f 00 00 	mov    0xf80(,%edx,4),%edx
 411:	c7 42 08 01 00 00 00 	movl   $0x1,0x8(%edx)
      break;
    }
  }
  
  int new_pid = clone(start_routine, arg1, arg2, n_stack); // TODO: is this the right way to call it?
 418:	50                   	push   %eax
 419:	ff 75 10             	push   0x10(%ebp)
 41c:	ff 75 0c             	push   0xc(%ebp)
 41f:	ff 75 08             	push   0x8(%ebp)
 422:	e8 da 02 00 00       	call   701 <clone>

  // I can't remember if there was something else to do here but I'm sure I'll find out



  return new_pid;
 427:	83 c4 10             	add    $0x10,%esp
}
 42a:	c9                   	leave  
 42b:	c3                   	ret    
    return -1;
 42c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 431:	eb f7                	jmp    42a <thread_create+0x5f>

00000433 <thread_join>:

//TODO: fix
int thread_join() {
 433:	55                   	push   %ebp
 434:	89 e5                	mov    %esp,%ebp
 436:	56                   	push   %esi
 437:	53                   	push   %ebx
 438:	83 ec 1c             	sub    $0x1c,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 43b:	8d 45 f4             	lea    -0xc(%ebp),%eax
 43e:	50                   	push   %eax
 43f:	e8 c5 02 00 00       	call   709 <join>
 444:	89 c6                	mov    %eax,%esi
  for(int i=0; i<64; i++){
 446:	83 c4 10             	add    $0x10,%esp
 449:	bb 00 00 00 00       	mov    $0x0,%ebx
 44e:	eb 03                	jmp    453 <thread_join+0x20>
 450:	83 c3 01             	add    $0x1,%ebx
 453:	83 fb 3f             	cmp    $0x3f,%ebx
 456:	7f 23                	jg     47b <thread_join+0x48>
    if((threads[i]->flag==1) && (stk_addr == threads[i]->pg1addr)){
 458:	8b 04 9d 80 0f 00 00 	mov    0xf80(,%ebx,4),%eax
 45f:	83 78 08 01          	cmpl   $0x1,0x8(%eax)
 463:	75 eb                	jne    450 <thread_join+0x1d>
 465:	8b 55 f4             	mov    -0xc(%ebp),%edx
 468:	39 50 04             	cmp    %edx,0x4(%eax)
 46b:	75 e3                	jne    450 <thread_join+0x1d>
      free(stk_addr);
 46d:	83 ec 0c             	sub    $0xc,%esp
 470:	52                   	push   %edx
 471:	e8 a6 04 00 00       	call   91c <free>
 476:	83 c4 10             	add    $0x10,%esp
 479:	eb d5                	jmp    450 <thread_join+0x1d>
    }
  }
  return pid;
}
 47b:	89 f0                	mov    %esi,%eax
 47d:	8d 65 f8             	lea    -0x8(%ebp),%esp
 480:	5b                   	pop    %ebx
 481:	5e                   	pop    %esi
 482:	5d                   	pop    %ebp
 483:	c3                   	ret    

00000484 <lock_acquire>:

void lock_acquire(lock_t *lock){
 484:	55                   	push   %ebp
 485:	89 e5                	mov    %esp,%ebp
 487:	53                   	push   %ebx
 488:	83 ec 04             	sub    $0x4,%esp
 48b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 48e:	83 ec 08             	sub    $0x8,%esp
 491:	6a 01                	push   $0x1
 493:	53                   	push   %ebx
 494:	e8 21 ff ff ff       	call   3ba <test_and_set>
 499:	83 c4 10             	add    $0x10,%esp
 49c:	83 f8 01             	cmp    $0x1,%eax
 49f:	74 ed                	je     48e <lock_acquire+0xa>
    ;
}
 4a1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4a4:	c9                   	leave  
 4a5:	c3                   	ret    

000004a6 <lock_release>:

void lock_release(lock_t *lock) {
 4a6:	55                   	push   %ebp
 4a7:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 4a9:	8b 45 08             	mov    0x8(%ebp),%eax
 4ac:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 4b2:	5d                   	pop    %ebp
 4b3:	c3                   	ret    

000004b4 <lock_init>:

void lock_init(lock_t *lock) {
 4b4:	55                   	push   %ebp
 4b5:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 4b7:	8b 45 08             	mov    0x8(%ebp),%eax
 4ba:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 4c0:	5d                   	pop    %ebp
 4c1:	c3                   	ret    

000004c2 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 4c2:	55                   	push   %ebp
 4c3:	89 e5                	mov    %esp,%ebp
 4c5:	56                   	push   %esi
 4c6:	53                   	push   %ebx
 4c7:	8b 75 08             	mov    0x8(%ebp),%esi
 4ca:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 4cd:	89 f0                	mov    %esi,%eax
 4cf:	89 d1                	mov    %edx,%ecx
 4d1:	83 c2 01             	add    $0x1,%edx
 4d4:	89 c3                	mov    %eax,%ebx
 4d6:	83 c0 01             	add    $0x1,%eax
 4d9:	0f b6 09             	movzbl (%ecx),%ecx
 4dc:	88 0b                	mov    %cl,(%ebx)
 4de:	84 c9                	test   %cl,%cl
 4e0:	75 ed                	jne    4cf <strcpy+0xd>
    ;
  return os;
}
 4e2:	89 f0                	mov    %esi,%eax
 4e4:	5b                   	pop    %ebx
 4e5:	5e                   	pop    %esi
 4e6:	5d                   	pop    %ebp
 4e7:	c3                   	ret    

000004e8 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 4e8:	55                   	push   %ebp
 4e9:	89 e5                	mov    %esp,%ebp
 4eb:	8b 4d 08             	mov    0x8(%ebp),%ecx
 4ee:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 4f1:	eb 06                	jmp    4f9 <strcmp+0x11>
    p++, q++;
 4f3:	83 c1 01             	add    $0x1,%ecx
 4f6:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 4f9:	0f b6 01             	movzbl (%ecx),%eax
 4fc:	84 c0                	test   %al,%al
 4fe:	74 04                	je     504 <strcmp+0x1c>
 500:	3a 02                	cmp    (%edx),%al
 502:	74 ef                	je     4f3 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 504:	0f b6 c0             	movzbl %al,%eax
 507:	0f b6 12             	movzbl (%edx),%edx
 50a:	29 d0                	sub    %edx,%eax
}
 50c:	5d                   	pop    %ebp
 50d:	c3                   	ret    

0000050e <strlen>:

uint
strlen(const char *s)
{
 50e:	55                   	push   %ebp
 50f:	89 e5                	mov    %esp,%ebp
 511:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 514:	b8 00 00 00 00       	mov    $0x0,%eax
 519:	eb 03                	jmp    51e <strlen+0x10>
 51b:	83 c0 01             	add    $0x1,%eax
 51e:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 522:	75 f7                	jne    51b <strlen+0xd>
    ;
  return n;
}
 524:	5d                   	pop    %ebp
 525:	c3                   	ret    

00000526 <memset>:

void*
memset(void *dst, int c, uint n)
{
 526:	55                   	push   %ebp
 527:	89 e5                	mov    %esp,%ebp
 529:	57                   	push   %edi
 52a:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 52d:	89 d7                	mov    %edx,%edi
 52f:	8b 4d 10             	mov    0x10(%ebp),%ecx
 532:	8b 45 0c             	mov    0xc(%ebp),%eax
 535:	fc                   	cld    
 536:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 538:	89 d0                	mov    %edx,%eax
 53a:	8b 7d fc             	mov    -0x4(%ebp),%edi
 53d:	c9                   	leave  
 53e:	c3                   	ret    

0000053f <strchr>:

char*
strchr(const char *s, char c)
{
 53f:	55                   	push   %ebp
 540:	89 e5                	mov    %esp,%ebp
 542:	8b 45 08             	mov    0x8(%ebp),%eax
 545:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 549:	eb 03                	jmp    54e <strchr+0xf>
 54b:	83 c0 01             	add    $0x1,%eax
 54e:	0f b6 10             	movzbl (%eax),%edx
 551:	84 d2                	test   %dl,%dl
 553:	74 06                	je     55b <strchr+0x1c>
    if(*s == c)
 555:	38 ca                	cmp    %cl,%dl
 557:	75 f2                	jne    54b <strchr+0xc>
 559:	eb 05                	jmp    560 <strchr+0x21>
      return (char*)s;
  return 0;
 55b:	b8 00 00 00 00       	mov    $0x0,%eax
}
 560:	5d                   	pop    %ebp
 561:	c3                   	ret    

00000562 <gets>:

char*
gets(char *buf, int max)
{
 562:	55                   	push   %ebp
 563:	89 e5                	mov    %esp,%ebp
 565:	57                   	push   %edi
 566:	56                   	push   %esi
 567:	53                   	push   %ebx
 568:	83 ec 1c             	sub    $0x1c,%esp
 56b:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 56e:	bb 00 00 00 00       	mov    $0x0,%ebx
 573:	89 de                	mov    %ebx,%esi
 575:	83 c3 01             	add    $0x1,%ebx
 578:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 57b:	7d 2e                	jge    5ab <gets+0x49>
    cc = read(0, &c, 1);
 57d:	83 ec 04             	sub    $0x4,%esp
 580:	6a 01                	push   $0x1
 582:	8d 45 e7             	lea    -0x19(%ebp),%eax
 585:	50                   	push   %eax
 586:	6a 00                	push   $0x0
 588:	e8 ec 00 00 00       	call   679 <read>
    if(cc < 1)
 58d:	83 c4 10             	add    $0x10,%esp
 590:	85 c0                	test   %eax,%eax
 592:	7e 17                	jle    5ab <gets+0x49>
      break;
    buf[i++] = c;
 594:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 598:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 59b:	3c 0a                	cmp    $0xa,%al
 59d:	0f 94 c2             	sete   %dl
 5a0:	3c 0d                	cmp    $0xd,%al
 5a2:	0f 94 c0             	sete   %al
 5a5:	08 c2                	or     %al,%dl
 5a7:	74 ca                	je     573 <gets+0x11>
    buf[i++] = c;
 5a9:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 5ab:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 5af:	89 f8                	mov    %edi,%eax
 5b1:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5b4:	5b                   	pop    %ebx
 5b5:	5e                   	pop    %esi
 5b6:	5f                   	pop    %edi
 5b7:	5d                   	pop    %ebp
 5b8:	c3                   	ret    

000005b9 <stat>:

int
stat(const char *n, struct stat *st)
{
 5b9:	55                   	push   %ebp
 5ba:	89 e5                	mov    %esp,%ebp
 5bc:	56                   	push   %esi
 5bd:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 5be:	83 ec 08             	sub    $0x8,%esp
 5c1:	6a 00                	push   $0x0
 5c3:	ff 75 08             	push   0x8(%ebp)
 5c6:	e8 d6 00 00 00       	call   6a1 <open>
  if(fd < 0)
 5cb:	83 c4 10             	add    $0x10,%esp
 5ce:	85 c0                	test   %eax,%eax
 5d0:	78 24                	js     5f6 <stat+0x3d>
 5d2:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 5d4:	83 ec 08             	sub    $0x8,%esp
 5d7:	ff 75 0c             	push   0xc(%ebp)
 5da:	50                   	push   %eax
 5db:	e8 d9 00 00 00       	call   6b9 <fstat>
 5e0:	89 c6                	mov    %eax,%esi
  close(fd);
 5e2:	89 1c 24             	mov    %ebx,(%esp)
 5e5:	e8 9f 00 00 00       	call   689 <close>
  return r;
 5ea:	83 c4 10             	add    $0x10,%esp
}
 5ed:	89 f0                	mov    %esi,%eax
 5ef:	8d 65 f8             	lea    -0x8(%ebp),%esp
 5f2:	5b                   	pop    %ebx
 5f3:	5e                   	pop    %esi
 5f4:	5d                   	pop    %ebp
 5f5:	c3                   	ret    
    return -1;
 5f6:	be ff ff ff ff       	mov    $0xffffffff,%esi
 5fb:	eb f0                	jmp    5ed <stat+0x34>

000005fd <atoi>:

int
atoi(const char *s)
{
 5fd:	55                   	push   %ebp
 5fe:	89 e5                	mov    %esp,%ebp
 600:	53                   	push   %ebx
 601:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 604:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 609:	eb 10                	jmp    61b <atoi+0x1e>
    n = n*10 + *s++ - '0';
 60b:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 60e:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 611:	83 c1 01             	add    $0x1,%ecx
 614:	0f be c0             	movsbl %al,%eax
 617:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 61b:	0f b6 01             	movzbl (%ecx),%eax
 61e:	8d 58 d0             	lea    -0x30(%eax),%ebx
 621:	80 fb 09             	cmp    $0x9,%bl
 624:	76 e5                	jbe    60b <atoi+0xe>
  return n;
}
 626:	89 d0                	mov    %edx,%eax
 628:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 62b:	c9                   	leave  
 62c:	c3                   	ret    

0000062d <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 62d:	55                   	push   %ebp
 62e:	89 e5                	mov    %esp,%ebp
 630:	56                   	push   %esi
 631:	53                   	push   %ebx
 632:	8b 75 08             	mov    0x8(%ebp),%esi
 635:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 638:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 63b:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 63d:	eb 0d                	jmp    64c <memmove+0x1f>
    *dst++ = *src++;
 63f:	0f b6 01             	movzbl (%ecx),%eax
 642:	88 02                	mov    %al,(%edx)
 644:	8d 49 01             	lea    0x1(%ecx),%ecx
 647:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 64a:	89 d8                	mov    %ebx,%eax
 64c:	8d 58 ff             	lea    -0x1(%eax),%ebx
 64f:	85 c0                	test   %eax,%eax
 651:	7f ec                	jg     63f <memmove+0x12>
  return vdst;
}
 653:	89 f0                	mov    %esi,%eax
 655:	5b                   	pop    %ebx
 656:	5e                   	pop    %esi
 657:	5d                   	pop    %ebp
 658:	c3                   	ret    

00000659 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 659:	b8 01 00 00 00       	mov    $0x1,%eax
 65e:	cd 40                	int    $0x40
 660:	c3                   	ret    

00000661 <exit>:
SYSCALL(exit)
 661:	b8 02 00 00 00       	mov    $0x2,%eax
 666:	cd 40                	int    $0x40
 668:	c3                   	ret    

00000669 <wait>:
SYSCALL(wait)
 669:	b8 03 00 00 00       	mov    $0x3,%eax
 66e:	cd 40                	int    $0x40
 670:	c3                   	ret    

00000671 <pipe>:
SYSCALL(pipe)
 671:	b8 04 00 00 00       	mov    $0x4,%eax
 676:	cd 40                	int    $0x40
 678:	c3                   	ret    

00000679 <read>:
SYSCALL(read)
 679:	b8 05 00 00 00       	mov    $0x5,%eax
 67e:	cd 40                	int    $0x40
 680:	c3                   	ret    

00000681 <write>:
SYSCALL(write)
 681:	b8 10 00 00 00       	mov    $0x10,%eax
 686:	cd 40                	int    $0x40
 688:	c3                   	ret    

00000689 <close>:
SYSCALL(close)
 689:	b8 15 00 00 00       	mov    $0x15,%eax
 68e:	cd 40                	int    $0x40
 690:	c3                   	ret    

00000691 <kill>:
SYSCALL(kill)
 691:	b8 06 00 00 00       	mov    $0x6,%eax
 696:	cd 40                	int    $0x40
 698:	c3                   	ret    

00000699 <exec>:
SYSCALL(exec)
 699:	b8 07 00 00 00       	mov    $0x7,%eax
 69e:	cd 40                	int    $0x40
 6a0:	c3                   	ret    

000006a1 <open>:
SYSCALL(open)
 6a1:	b8 0f 00 00 00       	mov    $0xf,%eax
 6a6:	cd 40                	int    $0x40
 6a8:	c3                   	ret    

000006a9 <mknod>:
SYSCALL(mknod)
 6a9:	b8 11 00 00 00       	mov    $0x11,%eax
 6ae:	cd 40                	int    $0x40
 6b0:	c3                   	ret    

000006b1 <unlink>:
SYSCALL(unlink)
 6b1:	b8 12 00 00 00       	mov    $0x12,%eax
 6b6:	cd 40                	int    $0x40
 6b8:	c3                   	ret    

000006b9 <fstat>:
SYSCALL(fstat)
 6b9:	b8 08 00 00 00       	mov    $0x8,%eax
 6be:	cd 40                	int    $0x40
 6c0:	c3                   	ret    

000006c1 <link>:
SYSCALL(link)
 6c1:	b8 13 00 00 00       	mov    $0x13,%eax
 6c6:	cd 40                	int    $0x40
 6c8:	c3                   	ret    

000006c9 <mkdir>:
SYSCALL(mkdir)
 6c9:	b8 14 00 00 00       	mov    $0x14,%eax
 6ce:	cd 40                	int    $0x40
 6d0:	c3                   	ret    

000006d1 <chdir>:
SYSCALL(chdir)
 6d1:	b8 09 00 00 00       	mov    $0x9,%eax
 6d6:	cd 40                	int    $0x40
 6d8:	c3                   	ret    

000006d9 <dup>:
SYSCALL(dup)
 6d9:	b8 0a 00 00 00       	mov    $0xa,%eax
 6de:	cd 40                	int    $0x40
 6e0:	c3                   	ret    

000006e1 <getpid>:
SYSCALL(getpid)
 6e1:	b8 0b 00 00 00       	mov    $0xb,%eax
 6e6:	cd 40                	int    $0x40
 6e8:	c3                   	ret    

000006e9 <sbrk>:
SYSCALL(sbrk)
 6e9:	b8 0c 00 00 00       	mov    $0xc,%eax
 6ee:	cd 40                	int    $0x40
 6f0:	c3                   	ret    

000006f1 <sleep>:
SYSCALL(sleep)
 6f1:	b8 0d 00 00 00       	mov    $0xd,%eax
 6f6:	cd 40                	int    $0x40
 6f8:	c3                   	ret    

000006f9 <uptime>:
SYSCALL(uptime)
 6f9:	b8 0e 00 00 00       	mov    $0xe,%eax
 6fe:	cd 40                	int    $0x40
 700:	c3                   	ret    

00000701 <clone>:
SYSCALL(clone)
 701:	b8 16 00 00 00       	mov    $0x16,%eax
 706:	cd 40                	int    $0x40
 708:	c3                   	ret    

00000709 <join>:
 709:	b8 17 00 00 00       	mov    $0x17,%eax
 70e:	cd 40                	int    $0x40
 710:	c3                   	ret    

00000711 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 711:	55                   	push   %ebp
 712:	89 e5                	mov    %esp,%ebp
 714:	83 ec 1c             	sub    $0x1c,%esp
 717:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 71a:	6a 01                	push   $0x1
 71c:	8d 55 f4             	lea    -0xc(%ebp),%edx
 71f:	52                   	push   %edx
 720:	50                   	push   %eax
 721:	e8 5b ff ff ff       	call   681 <write>
}
 726:	83 c4 10             	add    $0x10,%esp
 729:	c9                   	leave  
 72a:	c3                   	ret    

0000072b <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 72b:	55                   	push   %ebp
 72c:	89 e5                	mov    %esp,%ebp
 72e:	57                   	push   %edi
 72f:	56                   	push   %esi
 730:	53                   	push   %ebx
 731:	83 ec 2c             	sub    $0x2c,%esp
 734:	89 45 d0             	mov    %eax,-0x30(%ebp)
 737:	89 d0                	mov    %edx,%eax
 739:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 73b:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 73f:	0f 95 c1             	setne  %cl
 742:	c1 ea 1f             	shr    $0x1f,%edx
 745:	84 d1                	test   %dl,%cl
 747:	74 44                	je     78d <printint+0x62>
    neg = 1;
    x = -xx;
 749:	f7 d8                	neg    %eax
 74b:	89 c1                	mov    %eax,%ecx
    neg = 1;
 74d:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 754:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 759:	89 c8                	mov    %ecx,%eax
 75b:	ba 00 00 00 00       	mov    $0x0,%edx
 760:	f7 f6                	div    %esi
 762:	89 df                	mov    %ebx,%edi
 764:	83 c3 01             	add    $0x1,%ebx
 767:	0f b6 92 a8 0b 00 00 	movzbl 0xba8(%edx),%edx
 76e:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 772:	89 ca                	mov    %ecx,%edx
 774:	89 c1                	mov    %eax,%ecx
 776:	39 d6                	cmp    %edx,%esi
 778:	76 df                	jbe    759 <printint+0x2e>
  if(neg)
 77a:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 77e:	74 31                	je     7b1 <printint+0x86>
    buf[i++] = '-';
 780:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 785:	8d 5f 02             	lea    0x2(%edi),%ebx
 788:	8b 75 d0             	mov    -0x30(%ebp),%esi
 78b:	eb 17                	jmp    7a4 <printint+0x79>
    x = xx;
 78d:	89 c1                	mov    %eax,%ecx
  neg = 0;
 78f:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 796:	eb bc                	jmp    754 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 798:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 79d:	89 f0                	mov    %esi,%eax
 79f:	e8 6d ff ff ff       	call   711 <putc>
  while(--i >= 0)
 7a4:	83 eb 01             	sub    $0x1,%ebx
 7a7:	79 ef                	jns    798 <printint+0x6d>
}
 7a9:	83 c4 2c             	add    $0x2c,%esp
 7ac:	5b                   	pop    %ebx
 7ad:	5e                   	pop    %esi
 7ae:	5f                   	pop    %edi
 7af:	5d                   	pop    %ebp
 7b0:	c3                   	ret    
 7b1:	8b 75 d0             	mov    -0x30(%ebp),%esi
 7b4:	eb ee                	jmp    7a4 <printint+0x79>

000007b6 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 7b6:	55                   	push   %ebp
 7b7:	89 e5                	mov    %esp,%ebp
 7b9:	57                   	push   %edi
 7ba:	56                   	push   %esi
 7bb:	53                   	push   %ebx
 7bc:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 7bf:	8d 45 10             	lea    0x10(%ebp),%eax
 7c2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 7c5:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 7ca:	bb 00 00 00 00       	mov    $0x0,%ebx
 7cf:	eb 14                	jmp    7e5 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 7d1:	89 fa                	mov    %edi,%edx
 7d3:	8b 45 08             	mov    0x8(%ebp),%eax
 7d6:	e8 36 ff ff ff       	call   711 <putc>
 7db:	eb 05                	jmp    7e2 <printf+0x2c>
      }
    } else if(state == '%'){
 7dd:	83 fe 25             	cmp    $0x25,%esi
 7e0:	74 25                	je     807 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 7e2:	83 c3 01             	add    $0x1,%ebx
 7e5:	8b 45 0c             	mov    0xc(%ebp),%eax
 7e8:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 7ec:	84 c0                	test   %al,%al
 7ee:	0f 84 20 01 00 00    	je     914 <printf+0x15e>
    c = fmt[i] & 0xff;
 7f4:	0f be f8             	movsbl %al,%edi
 7f7:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 7fa:	85 f6                	test   %esi,%esi
 7fc:	75 df                	jne    7dd <printf+0x27>
      if(c == '%'){
 7fe:	83 f8 25             	cmp    $0x25,%eax
 801:	75 ce                	jne    7d1 <printf+0x1b>
        state = '%';
 803:	89 c6                	mov    %eax,%esi
 805:	eb db                	jmp    7e2 <printf+0x2c>
      if(c == 'd'){
 807:	83 f8 25             	cmp    $0x25,%eax
 80a:	0f 84 cf 00 00 00    	je     8df <printf+0x129>
 810:	0f 8c dd 00 00 00    	jl     8f3 <printf+0x13d>
 816:	83 f8 78             	cmp    $0x78,%eax
 819:	0f 8f d4 00 00 00    	jg     8f3 <printf+0x13d>
 81f:	83 f8 63             	cmp    $0x63,%eax
 822:	0f 8c cb 00 00 00    	jl     8f3 <printf+0x13d>
 828:	83 e8 63             	sub    $0x63,%eax
 82b:	83 f8 15             	cmp    $0x15,%eax
 82e:	0f 87 bf 00 00 00    	ja     8f3 <printf+0x13d>
 834:	ff 24 85 50 0b 00 00 	jmp    *0xb50(,%eax,4)
        printint(fd, *ap, 10, 1);
 83b:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 83e:	8b 17                	mov    (%edi),%edx
 840:	83 ec 0c             	sub    $0xc,%esp
 843:	6a 01                	push   $0x1
 845:	b9 0a 00 00 00       	mov    $0xa,%ecx
 84a:	8b 45 08             	mov    0x8(%ebp),%eax
 84d:	e8 d9 fe ff ff       	call   72b <printint>
        ap++;
 852:	83 c7 04             	add    $0x4,%edi
 855:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 858:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 85b:	be 00 00 00 00       	mov    $0x0,%esi
 860:	eb 80                	jmp    7e2 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 862:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 865:	8b 17                	mov    (%edi),%edx
 867:	83 ec 0c             	sub    $0xc,%esp
 86a:	6a 00                	push   $0x0
 86c:	b9 10 00 00 00       	mov    $0x10,%ecx
 871:	8b 45 08             	mov    0x8(%ebp),%eax
 874:	e8 b2 fe ff ff       	call   72b <printint>
        ap++;
 879:	83 c7 04             	add    $0x4,%edi
 87c:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 87f:	83 c4 10             	add    $0x10,%esp
      state = 0;
 882:	be 00 00 00 00       	mov    $0x0,%esi
 887:	e9 56 ff ff ff       	jmp    7e2 <printf+0x2c>
        s = (char*)*ap;
 88c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 88f:	8b 30                	mov    (%eax),%esi
        ap++;
 891:	83 c0 04             	add    $0x4,%eax
 894:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 897:	85 f6                	test   %esi,%esi
 899:	75 15                	jne    8b0 <printf+0xfa>
          s = "(null)";
 89b:	be 47 0b 00 00       	mov    $0xb47,%esi
 8a0:	eb 0e                	jmp    8b0 <printf+0xfa>
          putc(fd, *s);
 8a2:	0f be d2             	movsbl %dl,%edx
 8a5:	8b 45 08             	mov    0x8(%ebp),%eax
 8a8:	e8 64 fe ff ff       	call   711 <putc>
          s++;
 8ad:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 8b0:	0f b6 16             	movzbl (%esi),%edx
 8b3:	84 d2                	test   %dl,%dl
 8b5:	75 eb                	jne    8a2 <printf+0xec>
      state = 0;
 8b7:	be 00 00 00 00       	mov    $0x0,%esi
 8bc:	e9 21 ff ff ff       	jmp    7e2 <printf+0x2c>
        putc(fd, *ap);
 8c1:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 8c4:	0f be 17             	movsbl (%edi),%edx
 8c7:	8b 45 08             	mov    0x8(%ebp),%eax
 8ca:	e8 42 fe ff ff       	call   711 <putc>
        ap++;
 8cf:	83 c7 04             	add    $0x4,%edi
 8d2:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 8d5:	be 00 00 00 00       	mov    $0x0,%esi
 8da:	e9 03 ff ff ff       	jmp    7e2 <printf+0x2c>
        putc(fd, c);
 8df:	89 fa                	mov    %edi,%edx
 8e1:	8b 45 08             	mov    0x8(%ebp),%eax
 8e4:	e8 28 fe ff ff       	call   711 <putc>
      state = 0;
 8e9:	be 00 00 00 00       	mov    $0x0,%esi
 8ee:	e9 ef fe ff ff       	jmp    7e2 <printf+0x2c>
        putc(fd, '%');
 8f3:	ba 25 00 00 00       	mov    $0x25,%edx
 8f8:	8b 45 08             	mov    0x8(%ebp),%eax
 8fb:	e8 11 fe ff ff       	call   711 <putc>
        putc(fd, c);
 900:	89 fa                	mov    %edi,%edx
 902:	8b 45 08             	mov    0x8(%ebp),%eax
 905:	e8 07 fe ff ff       	call   711 <putc>
      state = 0;
 90a:	be 00 00 00 00       	mov    $0x0,%esi
 90f:	e9 ce fe ff ff       	jmp    7e2 <printf+0x2c>
    }
  }
}
 914:	8d 65 f4             	lea    -0xc(%ebp),%esp
 917:	5b                   	pop    %ebx
 918:	5e                   	pop    %esi
 919:	5f                   	pop    %edi
 91a:	5d                   	pop    %ebp
 91b:	c3                   	ret    

0000091c <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 91c:	55                   	push   %ebp
 91d:	89 e5                	mov    %esp,%ebp
 91f:	57                   	push   %edi
 920:	56                   	push   %esi
 921:	53                   	push   %ebx
 922:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 925:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 928:	a1 80 10 00 00       	mov    0x1080,%eax
 92d:	eb 02                	jmp    931 <free+0x15>
 92f:	89 d0                	mov    %edx,%eax
 931:	39 c8                	cmp    %ecx,%eax
 933:	73 04                	jae    939 <free+0x1d>
 935:	39 08                	cmp    %ecx,(%eax)
 937:	77 12                	ja     94b <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 939:	8b 10                	mov    (%eax),%edx
 93b:	39 c2                	cmp    %eax,%edx
 93d:	77 f0                	ja     92f <free+0x13>
 93f:	39 c8                	cmp    %ecx,%eax
 941:	72 08                	jb     94b <free+0x2f>
 943:	39 ca                	cmp    %ecx,%edx
 945:	77 04                	ja     94b <free+0x2f>
 947:	89 d0                	mov    %edx,%eax
 949:	eb e6                	jmp    931 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 94b:	8b 73 fc             	mov    -0x4(%ebx),%esi
 94e:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 951:	8b 10                	mov    (%eax),%edx
 953:	39 d7                	cmp    %edx,%edi
 955:	74 19                	je     970 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 957:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 95a:	8b 50 04             	mov    0x4(%eax),%edx
 95d:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 960:	39 ce                	cmp    %ecx,%esi
 962:	74 1b                	je     97f <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 964:	89 08                	mov    %ecx,(%eax)
  freep = p;
 966:	a3 80 10 00 00       	mov    %eax,0x1080
}
 96b:	5b                   	pop    %ebx
 96c:	5e                   	pop    %esi
 96d:	5f                   	pop    %edi
 96e:	5d                   	pop    %ebp
 96f:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 970:	03 72 04             	add    0x4(%edx),%esi
 973:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 976:	8b 10                	mov    (%eax),%edx
 978:	8b 12                	mov    (%edx),%edx
 97a:	89 53 f8             	mov    %edx,-0x8(%ebx)
 97d:	eb db                	jmp    95a <free+0x3e>
    p->s.size += bp->s.size;
 97f:	03 53 fc             	add    -0x4(%ebx),%edx
 982:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 985:	8b 53 f8             	mov    -0x8(%ebx),%edx
 988:	89 10                	mov    %edx,(%eax)
 98a:	eb da                	jmp    966 <free+0x4a>

0000098c <morecore>:

static Header*
morecore(uint nu)
{
 98c:	55                   	push   %ebp
 98d:	89 e5                	mov    %esp,%ebp
 98f:	53                   	push   %ebx
 990:	83 ec 04             	sub    $0x4,%esp
 993:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 995:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 99a:	77 05                	ja     9a1 <morecore+0x15>
    nu = 4096;
 99c:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 9a1:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 9a8:	83 ec 0c             	sub    $0xc,%esp
 9ab:	50                   	push   %eax
 9ac:	e8 38 fd ff ff       	call   6e9 <sbrk>
  if(p == (char*)-1)
 9b1:	83 c4 10             	add    $0x10,%esp
 9b4:	83 f8 ff             	cmp    $0xffffffff,%eax
 9b7:	74 1c                	je     9d5 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 9b9:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 9bc:	83 c0 08             	add    $0x8,%eax
 9bf:	83 ec 0c             	sub    $0xc,%esp
 9c2:	50                   	push   %eax
 9c3:	e8 54 ff ff ff       	call   91c <free>
  return freep;
 9c8:	a1 80 10 00 00       	mov    0x1080,%eax
 9cd:	83 c4 10             	add    $0x10,%esp
}
 9d0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 9d3:	c9                   	leave  
 9d4:	c3                   	ret    
    return 0;
 9d5:	b8 00 00 00 00       	mov    $0x0,%eax
 9da:	eb f4                	jmp    9d0 <morecore+0x44>

000009dc <malloc>:

void*
malloc(uint nbytes)
{
 9dc:	55                   	push   %ebp
 9dd:	89 e5                	mov    %esp,%ebp
 9df:	53                   	push   %ebx
 9e0:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9e3:	8b 45 08             	mov    0x8(%ebp),%eax
 9e6:	8d 58 07             	lea    0x7(%eax),%ebx
 9e9:	c1 eb 03             	shr    $0x3,%ebx
 9ec:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 9ef:	8b 0d 80 10 00 00    	mov    0x1080,%ecx
 9f5:	85 c9                	test   %ecx,%ecx
 9f7:	74 04                	je     9fd <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9f9:	8b 01                	mov    (%ecx),%eax
 9fb:	eb 4a                	jmp    a47 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 9fd:	c7 05 80 10 00 00 84 	movl   $0x1084,0x1080
 a04:	10 00 00 
 a07:	c7 05 84 10 00 00 84 	movl   $0x1084,0x1084
 a0e:	10 00 00 
    base.s.size = 0;
 a11:	c7 05 88 10 00 00 00 	movl   $0x0,0x1088
 a18:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 a1b:	b9 84 10 00 00       	mov    $0x1084,%ecx
 a20:	eb d7                	jmp    9f9 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 a22:	74 19                	je     a3d <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 a24:	29 da                	sub    %ebx,%edx
 a26:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 a29:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 a2c:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 a2f:	89 0d 80 10 00 00    	mov    %ecx,0x1080
      return (void*)(p + 1);
 a35:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 a38:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 a3b:	c9                   	leave  
 a3c:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 a3d:	8b 10                	mov    (%eax),%edx
 a3f:	89 11                	mov    %edx,(%ecx)
 a41:	eb ec                	jmp    a2f <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a43:	89 c1                	mov    %eax,%ecx
 a45:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 a47:	8b 50 04             	mov    0x4(%eax),%edx
 a4a:	39 da                	cmp    %ebx,%edx
 a4c:	73 d4                	jae    a22 <malloc+0x46>
    if(p == freep)
 a4e:	39 05 80 10 00 00    	cmp    %eax,0x1080
 a54:	75 ed                	jne    a43 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 a56:	89 d8                	mov    %ebx,%eax
 a58:	e8 2f ff ff ff       	call   98c <morecore>
 a5d:	85 c0                	test   %eax,%eax
 a5f:	75 e2                	jne    a43 <malloc+0x67>
 a61:	eb d5                	jmp    a38 <malloc+0x5c>
