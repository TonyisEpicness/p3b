
_test_3:     file format elf32-i386


Disassembly of section .text:

00000000 <worker>:
   free(p);
   exit();
}

void
worker(void *arg1, void *arg2) {
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 0c             	sub    $0xc,%esp
   assert(write(3, "hello\n", 6) == 6);
   6:	6a 06                	push   $0x6
   8:	68 78 09 00 00       	push   $0x978
   d:	6a 03                	push   $0x3
   f:	e8 80 05 00 00       	call   594 <write>
  14:	83 c4 10             	add    $0x10,%esp
  17:	83 f8 06             	cmp    $0x6,%eax
  1a:	74 49                	je     65 <worker+0x65>
  1c:	6a 34                	push   $0x34
  1e:	68 7f 09 00 00       	push   $0x97f
  23:	68 88 09 00 00       	push   $0x988
  28:	6a 01                	push   $0x1
  2a:	e8 9a 06 00 00       	call   6c9 <printf>
  2f:	83 c4 0c             	add    $0xc,%esp
  32:	68 90 09 00 00       	push   $0x990
  37:	68 ac 09 00 00       	push   $0x9ac
  3c:	6a 01                	push   $0x1
  3e:	e8 86 06 00 00       	call   6c9 <printf>
  43:	83 c4 08             	add    $0x8,%esp
  46:	68 c0 09 00 00       	push   $0x9c0
  4b:	6a 01                	push   $0x1
  4d:	e8 77 06 00 00       	call   6c9 <printf>
  52:	83 c4 04             	add    $0x4,%esp
  55:	ff 35 44 0e 00 00    	push   0xe44
  5b:	e8 44 05 00 00       	call   5a4 <kill>
  60:	e8 0f 05 00 00       	call   574 <exit>
   xchg(&newfd, open("tmp2", O_WRONLY|O_CREATE));
  65:	83 ec 08             	sub    $0x8,%esp
  68:	68 01 02 00 00       	push   $0x201
  6d:	68 cd 09 00 00       	push   $0x9cd
  72:	e8 3d 05 00 00       	call   5b4 <open>
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
  77:	f0 87 05 40 0e 00 00 	lock xchg %eax,0xe40
   exit();
  7e:	e8 f1 04 00 00       	call   574 <exit>

00000083 <main>:
{
  83:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  87:	83 e4 f0             	and    $0xfffffff0,%esp
  8a:	ff 71 fc             	push   -0x4(%ecx)
  8d:	55                   	push   %ebp
  8e:	89 e5                	mov    %esp,%ebp
  90:	56                   	push   %esi
  91:	53                   	push   %ebx
  92:	51                   	push   %ecx
  93:	83 ec 1c             	sub    $0x1c,%esp
   ppid = getpid();
  96:	e8 59 05 00 00       	call   5f4 <getpid>
  9b:	a3 44 0e 00 00       	mov    %eax,0xe44
   void *stack, *p = malloc(PGSIZE * 2);
  a0:	83 ec 0c             	sub    $0xc,%esp
  a3:	68 00 20 00 00       	push   $0x2000
  a8:	e8 42 08 00 00       	call   8ef <malloc>
   assert(p != NULL);
  ad:	83 c4 10             	add    $0x10,%esp
  b0:	85 c0                	test   %eax,%eax
  b2:	74 7d                	je     131 <main+0xae>
  b4:	89 c3                	mov    %eax,%ebx
   if((uint)p % PGSIZE)
  b6:	25 ff 0f 00 00       	and    $0xfff,%eax
  bb:	0f 84 b9 00 00 00    	je     17a <main+0xf7>
     stack = p + (PGSIZE - (uint)p % PGSIZE);
  c1:	be 00 10 00 00       	mov    $0x1000,%esi
  c6:	29 c6                	sub    %eax,%esi
  c8:	01 de                	add    %ebx,%esi
   int fd = open("tmp", O_WRONLY|O_CREATE);
  ca:	83 ec 08             	sub    $0x8,%esp
  cd:	68 01 02 00 00       	push   $0x201
  d2:	68 dc 09 00 00       	push   $0x9dc
  d7:	e8 d8 04 00 00       	call   5b4 <open>
   assert(fd == 3);
  dc:	83 c4 10             	add    $0x10,%esp
  df:	83 f8 03             	cmp    $0x3,%eax
  e2:	0f 84 99 00 00 00    	je     181 <main+0xfe>
  e8:	6a 24                	push   $0x24
  ea:	68 7f 09 00 00       	push   $0x97f
  ef:	68 88 09 00 00       	push   $0x988
  f4:	6a 01                	push   $0x1
  f6:	e8 ce 05 00 00       	call   6c9 <printf>
  fb:	83 c4 0c             	add    $0xc,%esp
  fe:	68 e0 09 00 00       	push   $0x9e0
 103:	68 ac 09 00 00       	push   $0x9ac
 108:	6a 01                	push   $0x1
 10a:	e8 ba 05 00 00       	call   6c9 <printf>
 10f:	83 c4 08             	add    $0x8,%esp
 112:	68 c0 09 00 00       	push   $0x9c0
 117:	6a 01                	push   $0x1
 119:	e8 ab 05 00 00       	call   6c9 <printf>
 11e:	83 c4 04             	add    $0x4,%esp
 121:	ff 35 44 0e 00 00    	push   0xe44
 127:	e8 78 04 00 00       	call   5a4 <kill>
 12c:	e8 43 04 00 00       	call   574 <exit>
   assert(p != NULL);
 131:	6a 1d                	push   $0x1d
 133:	68 7f 09 00 00       	push   $0x97f
 138:	68 88 09 00 00       	push   $0x988
 13d:	6a 01                	push   $0x1
 13f:	e8 85 05 00 00       	call   6c9 <printf>
 144:	83 c4 0c             	add    $0xc,%esp
 147:	68 d2 09 00 00       	push   $0x9d2
 14c:	68 ac 09 00 00       	push   $0x9ac
 151:	6a 01                	push   $0x1
 153:	e8 71 05 00 00       	call   6c9 <printf>
 158:	83 c4 08             	add    $0x8,%esp
 15b:	68 c0 09 00 00       	push   $0x9c0
 160:	6a 01                	push   $0x1
 162:	e8 62 05 00 00       	call   6c9 <printf>
 167:	83 c4 04             	add    $0x4,%esp
 16a:	ff 35 44 0e 00 00    	push   0xe44
 170:	e8 2f 04 00 00       	call   5a4 <kill>
 175:	e8 fa 03 00 00       	call   574 <exit>
     stack = p;
 17a:	89 de                	mov    %ebx,%esi
 17c:	e9 49 ff ff ff       	jmp    ca <main+0x47>
   int clone_pid = clone(worker, 0, 0, stack);
 181:	56                   	push   %esi
 182:	6a 00                	push   $0x0
 184:	6a 00                	push   $0x0
 186:	68 00 00 00 00       	push   $0x0
 18b:	e8 84 04 00 00       	call   614 <clone>
 190:	89 c6                	mov    %eax,%esi
   assert(clone_pid > 0);
 192:	83 c4 10             	add    $0x10,%esp
 195:	85 c0                	test   %eax,%eax
 197:	7e 73                	jle    20c <main+0x189>
   while(!newfd);
 199:	a1 40 0e 00 00       	mov    0xe40,%eax
 19e:	85 c0                	test   %eax,%eax
 1a0:	74 f7                	je     199 <main+0x116>
   assert(write(newfd, "goodbye\n", 8) == -1);
 1a2:	a1 40 0e 00 00       	mov    0xe40,%eax
 1a7:	83 ec 04             	sub    $0x4,%esp
 1aa:	6a 08                	push   $0x8
 1ac:	68 f6 09 00 00       	push   $0x9f6
 1b1:	50                   	push   %eax
 1b2:	e8 dd 03 00 00       	call   594 <write>
 1b7:	83 c4 10             	add    $0x10,%esp
 1ba:	83 f8 ff             	cmp    $0xffffffff,%eax
 1bd:	0f 84 92 00 00 00    	je     255 <main+0x1d2>
 1c3:	6a 28                	push   $0x28
 1c5:	68 7f 09 00 00       	push   $0x97f
 1ca:	68 88 09 00 00       	push   $0x988
 1cf:	6a 01                	push   $0x1
 1d1:	e8 f3 04 00 00       	call   6c9 <printf>
 1d6:	83 c4 0c             	add    $0xc,%esp
 1d9:	68 24 0a 00 00       	push   $0xa24
 1de:	68 ac 09 00 00       	push   $0x9ac
 1e3:	6a 01                	push   $0x1
 1e5:	e8 df 04 00 00       	call   6c9 <printf>
 1ea:	83 c4 08             	add    $0x8,%esp
 1ed:	68 c0 09 00 00       	push   $0x9c0
 1f2:	6a 01                	push   $0x1
 1f4:	e8 d0 04 00 00       	call   6c9 <printf>
 1f9:	83 c4 04             	add    $0x4,%esp
 1fc:	ff 35 44 0e 00 00    	push   0xe44
 202:	e8 9d 03 00 00       	call   5a4 <kill>
 207:	e8 68 03 00 00       	call   574 <exit>
   assert(clone_pid > 0);
 20c:	6a 26                	push   $0x26
 20e:	68 7f 09 00 00       	push   $0x97f
 213:	68 88 09 00 00       	push   $0x988
 218:	6a 01                	push   $0x1
 21a:	e8 aa 04 00 00       	call   6c9 <printf>
 21f:	83 c4 0c             	add    $0xc,%esp
 222:	68 e8 09 00 00       	push   $0x9e8
 227:	68 ac 09 00 00       	push   $0x9ac
 22c:	6a 01                	push   $0x1
 22e:	e8 96 04 00 00       	call   6c9 <printf>
 233:	83 c4 08             	add    $0x8,%esp
 236:	68 c0 09 00 00       	push   $0x9c0
 23b:	6a 01                	push   $0x1
 23d:	e8 87 04 00 00       	call   6c9 <printf>
 242:	83 c4 04             	add    $0x4,%esp
 245:	ff 35 44 0e 00 00    	push   0xe44
 24b:	e8 54 03 00 00       	call   5a4 <kill>
 250:	e8 1f 03 00 00       	call   574 <exit>
   printf(1, "TEST PASSED\n");
 255:	83 ec 08             	sub    $0x8,%esp
 258:	68 ff 09 00 00       	push   $0x9ff
 25d:	6a 01                	push   $0x1
 25f:	e8 65 04 00 00       	call   6c9 <printf>
   int join_pid = join(&join_stack);
 264:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 267:	89 04 24             	mov    %eax,(%esp)
 26a:	e8 ad 03 00 00       	call   61c <join>
   assert(join_pid == clone_pid);
 26f:	83 c4 10             	add    $0x10,%esp
 272:	39 c6                	cmp    %eax,%esi
 274:	74 49                	je     2bf <main+0x23c>
 276:	6a 2d                	push   $0x2d
 278:	68 7f 09 00 00       	push   $0x97f
 27d:	68 88 09 00 00       	push   $0x988
 282:	6a 01                	push   $0x1
 284:	e8 40 04 00 00       	call   6c9 <printf>
 289:	83 c4 0c             	add    $0xc,%esp
 28c:	68 0c 0a 00 00       	push   $0xa0c
 291:	68 ac 09 00 00       	push   $0x9ac
 296:	6a 01                	push   $0x1
 298:	e8 2c 04 00 00       	call   6c9 <printf>
 29d:	83 c4 08             	add    $0x8,%esp
 2a0:	68 c0 09 00 00       	push   $0x9c0
 2a5:	6a 01                	push   $0x1
 2a7:	e8 1d 04 00 00       	call   6c9 <printf>
 2ac:	83 c4 04             	add    $0x4,%esp
 2af:	ff 35 44 0e 00 00    	push   0xe44
 2b5:	e8 ea 02 00 00       	call   5a4 <kill>
 2ba:	e8 b5 02 00 00       	call   574 <exit>
   free(p);
 2bf:	83 ec 0c             	sub    $0xc,%esp
 2c2:	53                   	push   %ebx
 2c3:	e8 67 05 00 00       	call   82f <free>
   exit();
 2c8:	e8 a7 02 00 00       	call   574 <exit>

000002cd <test_and_set>:
  int flag;
};

struct thread_ref *threads[64];

int test_and_set(int *old_ptr, int new_ptr) {
 2cd:	55                   	push   %ebp
 2ce:	89 e5                	mov    %esp,%ebp
 2d0:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *old_ptr;
 2d3:	8b 10                	mov    (%eax),%edx
  *old_ptr = new_ptr;
 2d5:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 2d8:	89 08                	mov    %ecx,(%eax)
  return old;
}
 2da:	89 d0                	mov    %edx,%eax
 2dc:	5d                   	pop    %ebp
 2dd:	c3                   	ret    

000002de <thread_create>:

// a wrapper func for clone
int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 2de:	55                   	push   %ebp
 2df:	89 e5                	mov    %esp,%ebp
 2e1:	83 ec 14             	sub    $0x14,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE*2);
 2e4:	68 00 20 00 00       	push   $0x2000
 2e9:	e8 01 06 00 00       	call   8ef <malloc>
  if(n_stack == 0){
 2ee:	83 c4 10             	add    $0x10,%esp
 2f1:	85 c0                	test   %eax,%eax
 2f3:	74 4a                	je     33f <thread_create+0x61>
    return -1;
  }
  
  for(int i=0; i<64; i++){
 2f5:	ba 00 00 00 00       	mov    $0x0,%edx
 2fa:	eb 03                	jmp    2ff <thread_create+0x21>
 2fc:	83 c2 01             	add    $0x1,%edx
 2ff:	83 fa 3f             	cmp    $0x3f,%edx
 302:	7f 27                	jg     32b <thread_create+0x4d>
    if(threads[i]->flag==0){
 304:	8b 0c 95 60 0e 00 00 	mov    0xe60(,%edx,4),%ecx
 30b:	83 79 08 00          	cmpl   $0x0,0x8(%ecx)
 30f:	75 eb                	jne    2fc <thread_create+0x1e>
      threads[i]->maddr = n_stack;
 311:	89 01                	mov    %eax,(%ecx)
      threads[i]->pg1addr = n_stack;
 313:	8b 0c 95 60 0e 00 00 	mov    0xe60(,%edx,4),%ecx
 31a:	89 41 04             	mov    %eax,0x4(%ecx)
      threads[i]->flag = 1;
 31d:	8b 14 95 60 0e 00 00 	mov    0xe60(,%edx,4),%edx
 324:	c7 42 08 01 00 00 00 	movl   $0x1,0x8(%edx)
      break;
    }
  }
  
  int new_pid = clone(start_routine, arg1, arg2, n_stack); // TODO: is this the right way to call it?
 32b:	50                   	push   %eax
 32c:	ff 75 10             	push   0x10(%ebp)
 32f:	ff 75 0c             	push   0xc(%ebp)
 332:	ff 75 08             	push   0x8(%ebp)
 335:	e8 da 02 00 00       	call   614 <clone>

  // I can't remember if there was something else to do here but I'm sure I'll find out



  return new_pid;
 33a:	83 c4 10             	add    $0x10,%esp
}
 33d:	c9                   	leave  
 33e:	c3                   	ret    
    return -1;
 33f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 344:	eb f7                	jmp    33d <thread_create+0x5f>

00000346 <thread_join>:

//TODO: fix
int thread_join() {
 346:	55                   	push   %ebp
 347:	89 e5                	mov    %esp,%ebp
 349:	56                   	push   %esi
 34a:	53                   	push   %ebx
 34b:	83 ec 1c             	sub    $0x1c,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 34e:	8d 45 f4             	lea    -0xc(%ebp),%eax
 351:	50                   	push   %eax
 352:	e8 c5 02 00 00       	call   61c <join>
 357:	89 c6                	mov    %eax,%esi
  for(int i=0; i<64; i++){
 359:	83 c4 10             	add    $0x10,%esp
 35c:	bb 00 00 00 00       	mov    $0x0,%ebx
 361:	eb 03                	jmp    366 <thread_join+0x20>
 363:	83 c3 01             	add    $0x1,%ebx
 366:	83 fb 3f             	cmp    $0x3f,%ebx
 369:	7f 23                	jg     38e <thread_join+0x48>
    if((threads[i]->flag==1) && (stk_addr == threads[i]->pg1addr)){
 36b:	8b 04 9d 60 0e 00 00 	mov    0xe60(,%ebx,4),%eax
 372:	83 78 08 01          	cmpl   $0x1,0x8(%eax)
 376:	75 eb                	jne    363 <thread_join+0x1d>
 378:	8b 55 f4             	mov    -0xc(%ebp),%edx
 37b:	39 50 04             	cmp    %edx,0x4(%eax)
 37e:	75 e3                	jne    363 <thread_join+0x1d>
      free(stk_addr);
 380:	83 ec 0c             	sub    $0xc,%esp
 383:	52                   	push   %edx
 384:	e8 a6 04 00 00       	call   82f <free>
 389:	83 c4 10             	add    $0x10,%esp
 38c:	eb d5                	jmp    363 <thread_join+0x1d>
    }
  }
  return pid;
}
 38e:	89 f0                	mov    %esi,%eax
 390:	8d 65 f8             	lea    -0x8(%ebp),%esp
 393:	5b                   	pop    %ebx
 394:	5e                   	pop    %esi
 395:	5d                   	pop    %ebp
 396:	c3                   	ret    

00000397 <lock_acquire>:

void lock_acquire(lock_t *lock){
 397:	55                   	push   %ebp
 398:	89 e5                	mov    %esp,%ebp
 39a:	53                   	push   %ebx
 39b:	83 ec 04             	sub    $0x4,%esp
 39e:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 3a1:	83 ec 08             	sub    $0x8,%esp
 3a4:	6a 01                	push   $0x1
 3a6:	53                   	push   %ebx
 3a7:	e8 21 ff ff ff       	call   2cd <test_and_set>
 3ac:	83 c4 10             	add    $0x10,%esp
 3af:	83 f8 01             	cmp    $0x1,%eax
 3b2:	74 ed                	je     3a1 <lock_acquire+0xa>
    ;
}
 3b4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3b7:	c9                   	leave  
 3b8:	c3                   	ret    

000003b9 <lock_release>:

void lock_release(lock_t *lock) {
 3b9:	55                   	push   %ebp
 3ba:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 3bc:	8b 45 08             	mov    0x8(%ebp),%eax
 3bf:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 3c5:	5d                   	pop    %ebp
 3c6:	c3                   	ret    

000003c7 <lock_init>:

void lock_init(lock_t *lock) {
 3c7:	55                   	push   %ebp
 3c8:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 3ca:	8b 45 08             	mov    0x8(%ebp),%eax
 3cd:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 3d3:	5d                   	pop    %ebp
 3d4:	c3                   	ret    

000003d5 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 3d5:	55                   	push   %ebp
 3d6:	89 e5                	mov    %esp,%ebp
 3d8:	56                   	push   %esi
 3d9:	53                   	push   %ebx
 3da:	8b 75 08             	mov    0x8(%ebp),%esi
 3dd:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 3e0:	89 f0                	mov    %esi,%eax
 3e2:	89 d1                	mov    %edx,%ecx
 3e4:	83 c2 01             	add    $0x1,%edx
 3e7:	89 c3                	mov    %eax,%ebx
 3e9:	83 c0 01             	add    $0x1,%eax
 3ec:	0f b6 09             	movzbl (%ecx),%ecx
 3ef:	88 0b                	mov    %cl,(%ebx)
 3f1:	84 c9                	test   %cl,%cl
 3f3:	75 ed                	jne    3e2 <strcpy+0xd>
    ;
  return os;
}
 3f5:	89 f0                	mov    %esi,%eax
 3f7:	5b                   	pop    %ebx
 3f8:	5e                   	pop    %esi
 3f9:	5d                   	pop    %ebp
 3fa:	c3                   	ret    

000003fb <strcmp>:

int
strcmp(const char *p, const char *q)
{
 3fb:	55                   	push   %ebp
 3fc:	89 e5                	mov    %esp,%ebp
 3fe:	8b 4d 08             	mov    0x8(%ebp),%ecx
 401:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 404:	eb 06                	jmp    40c <strcmp+0x11>
    p++, q++;
 406:	83 c1 01             	add    $0x1,%ecx
 409:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 40c:	0f b6 01             	movzbl (%ecx),%eax
 40f:	84 c0                	test   %al,%al
 411:	74 04                	je     417 <strcmp+0x1c>
 413:	3a 02                	cmp    (%edx),%al
 415:	74 ef                	je     406 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 417:	0f b6 c0             	movzbl %al,%eax
 41a:	0f b6 12             	movzbl (%edx),%edx
 41d:	29 d0                	sub    %edx,%eax
}
 41f:	5d                   	pop    %ebp
 420:	c3                   	ret    

00000421 <strlen>:

uint
strlen(const char *s)
{
 421:	55                   	push   %ebp
 422:	89 e5                	mov    %esp,%ebp
 424:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 427:	b8 00 00 00 00       	mov    $0x0,%eax
 42c:	eb 03                	jmp    431 <strlen+0x10>
 42e:	83 c0 01             	add    $0x1,%eax
 431:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 435:	75 f7                	jne    42e <strlen+0xd>
    ;
  return n;
}
 437:	5d                   	pop    %ebp
 438:	c3                   	ret    

00000439 <memset>:

void*
memset(void *dst, int c, uint n)
{
 439:	55                   	push   %ebp
 43a:	89 e5                	mov    %esp,%ebp
 43c:	57                   	push   %edi
 43d:	8b 55 08             	mov    0x8(%ebp),%edx
  asm volatile("cld; rep stosb" :
 440:	89 d7                	mov    %edx,%edi
 442:	8b 4d 10             	mov    0x10(%ebp),%ecx
 445:	8b 45 0c             	mov    0xc(%ebp),%eax
 448:	fc                   	cld    
 449:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 44b:	89 d0                	mov    %edx,%eax
 44d:	8b 7d fc             	mov    -0x4(%ebp),%edi
 450:	c9                   	leave  
 451:	c3                   	ret    

00000452 <strchr>:

char*
strchr(const char *s, char c)
{
 452:	55                   	push   %ebp
 453:	89 e5                	mov    %esp,%ebp
 455:	8b 45 08             	mov    0x8(%ebp),%eax
 458:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 45c:	eb 03                	jmp    461 <strchr+0xf>
 45e:	83 c0 01             	add    $0x1,%eax
 461:	0f b6 10             	movzbl (%eax),%edx
 464:	84 d2                	test   %dl,%dl
 466:	74 06                	je     46e <strchr+0x1c>
    if(*s == c)
 468:	38 ca                	cmp    %cl,%dl
 46a:	75 f2                	jne    45e <strchr+0xc>
 46c:	eb 05                	jmp    473 <strchr+0x21>
      return (char*)s;
  return 0;
 46e:	b8 00 00 00 00       	mov    $0x0,%eax
}
 473:	5d                   	pop    %ebp
 474:	c3                   	ret    

00000475 <gets>:

char*
gets(char *buf, int max)
{
 475:	55                   	push   %ebp
 476:	89 e5                	mov    %esp,%ebp
 478:	57                   	push   %edi
 479:	56                   	push   %esi
 47a:	53                   	push   %ebx
 47b:	83 ec 1c             	sub    $0x1c,%esp
 47e:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 481:	bb 00 00 00 00       	mov    $0x0,%ebx
 486:	89 de                	mov    %ebx,%esi
 488:	83 c3 01             	add    $0x1,%ebx
 48b:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 48e:	7d 2e                	jge    4be <gets+0x49>
    cc = read(0, &c, 1);
 490:	83 ec 04             	sub    $0x4,%esp
 493:	6a 01                	push   $0x1
 495:	8d 45 e7             	lea    -0x19(%ebp),%eax
 498:	50                   	push   %eax
 499:	6a 00                	push   $0x0
 49b:	e8 ec 00 00 00       	call   58c <read>
    if(cc < 1)
 4a0:	83 c4 10             	add    $0x10,%esp
 4a3:	85 c0                	test   %eax,%eax
 4a5:	7e 17                	jle    4be <gets+0x49>
      break;
    buf[i++] = c;
 4a7:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 4ab:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 4ae:	3c 0a                	cmp    $0xa,%al
 4b0:	0f 94 c2             	sete   %dl
 4b3:	3c 0d                	cmp    $0xd,%al
 4b5:	0f 94 c0             	sete   %al
 4b8:	08 c2                	or     %al,%dl
 4ba:	74 ca                	je     486 <gets+0x11>
    buf[i++] = c;
 4bc:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 4be:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 4c2:	89 f8                	mov    %edi,%eax
 4c4:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4c7:	5b                   	pop    %ebx
 4c8:	5e                   	pop    %esi
 4c9:	5f                   	pop    %edi
 4ca:	5d                   	pop    %ebp
 4cb:	c3                   	ret    

000004cc <stat>:

int
stat(const char *n, struct stat *st)
{
 4cc:	55                   	push   %ebp
 4cd:	89 e5                	mov    %esp,%ebp
 4cf:	56                   	push   %esi
 4d0:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4d1:	83 ec 08             	sub    $0x8,%esp
 4d4:	6a 00                	push   $0x0
 4d6:	ff 75 08             	push   0x8(%ebp)
 4d9:	e8 d6 00 00 00       	call   5b4 <open>
  if(fd < 0)
 4de:	83 c4 10             	add    $0x10,%esp
 4e1:	85 c0                	test   %eax,%eax
 4e3:	78 24                	js     509 <stat+0x3d>
 4e5:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 4e7:	83 ec 08             	sub    $0x8,%esp
 4ea:	ff 75 0c             	push   0xc(%ebp)
 4ed:	50                   	push   %eax
 4ee:	e8 d9 00 00 00       	call   5cc <fstat>
 4f3:	89 c6                	mov    %eax,%esi
  close(fd);
 4f5:	89 1c 24             	mov    %ebx,(%esp)
 4f8:	e8 9f 00 00 00       	call   59c <close>
  return r;
 4fd:	83 c4 10             	add    $0x10,%esp
}
 500:	89 f0                	mov    %esi,%eax
 502:	8d 65 f8             	lea    -0x8(%ebp),%esp
 505:	5b                   	pop    %ebx
 506:	5e                   	pop    %esi
 507:	5d                   	pop    %ebp
 508:	c3                   	ret    
    return -1;
 509:	be ff ff ff ff       	mov    $0xffffffff,%esi
 50e:	eb f0                	jmp    500 <stat+0x34>

00000510 <atoi>:

int
atoi(const char *s)
{
 510:	55                   	push   %ebp
 511:	89 e5                	mov    %esp,%ebp
 513:	53                   	push   %ebx
 514:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 517:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 51c:	eb 10                	jmp    52e <atoi+0x1e>
    n = n*10 + *s++ - '0';
 51e:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 521:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 524:	83 c1 01             	add    $0x1,%ecx
 527:	0f be c0             	movsbl %al,%eax
 52a:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 52e:	0f b6 01             	movzbl (%ecx),%eax
 531:	8d 58 d0             	lea    -0x30(%eax),%ebx
 534:	80 fb 09             	cmp    $0x9,%bl
 537:	76 e5                	jbe    51e <atoi+0xe>
  return n;
}
 539:	89 d0                	mov    %edx,%eax
 53b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 53e:	c9                   	leave  
 53f:	c3                   	ret    

00000540 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 540:	55                   	push   %ebp
 541:	89 e5                	mov    %esp,%ebp
 543:	56                   	push   %esi
 544:	53                   	push   %ebx
 545:	8b 75 08             	mov    0x8(%ebp),%esi
 548:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 54b:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 54e:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 550:	eb 0d                	jmp    55f <memmove+0x1f>
    *dst++ = *src++;
 552:	0f b6 01             	movzbl (%ecx),%eax
 555:	88 02                	mov    %al,(%edx)
 557:	8d 49 01             	lea    0x1(%ecx),%ecx
 55a:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 55d:	89 d8                	mov    %ebx,%eax
 55f:	8d 58 ff             	lea    -0x1(%eax),%ebx
 562:	85 c0                	test   %eax,%eax
 564:	7f ec                	jg     552 <memmove+0x12>
  return vdst;
}
 566:	89 f0                	mov    %esi,%eax
 568:	5b                   	pop    %ebx
 569:	5e                   	pop    %esi
 56a:	5d                   	pop    %ebp
 56b:	c3                   	ret    

0000056c <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 56c:	b8 01 00 00 00       	mov    $0x1,%eax
 571:	cd 40                	int    $0x40
 573:	c3                   	ret    

00000574 <exit>:
SYSCALL(exit)
 574:	b8 02 00 00 00       	mov    $0x2,%eax
 579:	cd 40                	int    $0x40
 57b:	c3                   	ret    

0000057c <wait>:
SYSCALL(wait)
 57c:	b8 03 00 00 00       	mov    $0x3,%eax
 581:	cd 40                	int    $0x40
 583:	c3                   	ret    

00000584 <pipe>:
SYSCALL(pipe)
 584:	b8 04 00 00 00       	mov    $0x4,%eax
 589:	cd 40                	int    $0x40
 58b:	c3                   	ret    

0000058c <read>:
SYSCALL(read)
 58c:	b8 05 00 00 00       	mov    $0x5,%eax
 591:	cd 40                	int    $0x40
 593:	c3                   	ret    

00000594 <write>:
SYSCALL(write)
 594:	b8 10 00 00 00       	mov    $0x10,%eax
 599:	cd 40                	int    $0x40
 59b:	c3                   	ret    

0000059c <close>:
SYSCALL(close)
 59c:	b8 15 00 00 00       	mov    $0x15,%eax
 5a1:	cd 40                	int    $0x40
 5a3:	c3                   	ret    

000005a4 <kill>:
SYSCALL(kill)
 5a4:	b8 06 00 00 00       	mov    $0x6,%eax
 5a9:	cd 40                	int    $0x40
 5ab:	c3                   	ret    

000005ac <exec>:
SYSCALL(exec)
 5ac:	b8 07 00 00 00       	mov    $0x7,%eax
 5b1:	cd 40                	int    $0x40
 5b3:	c3                   	ret    

000005b4 <open>:
SYSCALL(open)
 5b4:	b8 0f 00 00 00       	mov    $0xf,%eax
 5b9:	cd 40                	int    $0x40
 5bb:	c3                   	ret    

000005bc <mknod>:
SYSCALL(mknod)
 5bc:	b8 11 00 00 00       	mov    $0x11,%eax
 5c1:	cd 40                	int    $0x40
 5c3:	c3                   	ret    

000005c4 <unlink>:
SYSCALL(unlink)
 5c4:	b8 12 00 00 00       	mov    $0x12,%eax
 5c9:	cd 40                	int    $0x40
 5cb:	c3                   	ret    

000005cc <fstat>:
SYSCALL(fstat)
 5cc:	b8 08 00 00 00       	mov    $0x8,%eax
 5d1:	cd 40                	int    $0x40
 5d3:	c3                   	ret    

000005d4 <link>:
SYSCALL(link)
 5d4:	b8 13 00 00 00       	mov    $0x13,%eax
 5d9:	cd 40                	int    $0x40
 5db:	c3                   	ret    

000005dc <mkdir>:
SYSCALL(mkdir)
 5dc:	b8 14 00 00 00       	mov    $0x14,%eax
 5e1:	cd 40                	int    $0x40
 5e3:	c3                   	ret    

000005e4 <chdir>:
SYSCALL(chdir)
 5e4:	b8 09 00 00 00       	mov    $0x9,%eax
 5e9:	cd 40                	int    $0x40
 5eb:	c3                   	ret    

000005ec <dup>:
SYSCALL(dup)
 5ec:	b8 0a 00 00 00       	mov    $0xa,%eax
 5f1:	cd 40                	int    $0x40
 5f3:	c3                   	ret    

000005f4 <getpid>:
SYSCALL(getpid)
 5f4:	b8 0b 00 00 00       	mov    $0xb,%eax
 5f9:	cd 40                	int    $0x40
 5fb:	c3                   	ret    

000005fc <sbrk>:
SYSCALL(sbrk)
 5fc:	b8 0c 00 00 00       	mov    $0xc,%eax
 601:	cd 40                	int    $0x40
 603:	c3                   	ret    

00000604 <sleep>:
SYSCALL(sleep)
 604:	b8 0d 00 00 00       	mov    $0xd,%eax
 609:	cd 40                	int    $0x40
 60b:	c3                   	ret    

0000060c <uptime>:
SYSCALL(uptime)
 60c:	b8 0e 00 00 00       	mov    $0xe,%eax
 611:	cd 40                	int    $0x40
 613:	c3                   	ret    

00000614 <clone>:
SYSCALL(clone)
 614:	b8 16 00 00 00       	mov    $0x16,%eax
 619:	cd 40                	int    $0x40
 61b:	c3                   	ret    

0000061c <join>:
 61c:	b8 17 00 00 00       	mov    $0x17,%eax
 621:	cd 40                	int    $0x40
 623:	c3                   	ret    

00000624 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 624:	55                   	push   %ebp
 625:	89 e5                	mov    %esp,%ebp
 627:	83 ec 1c             	sub    $0x1c,%esp
 62a:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 62d:	6a 01                	push   $0x1
 62f:	8d 55 f4             	lea    -0xc(%ebp),%edx
 632:	52                   	push   %edx
 633:	50                   	push   %eax
 634:	e8 5b ff ff ff       	call   594 <write>
}
 639:	83 c4 10             	add    $0x10,%esp
 63c:	c9                   	leave  
 63d:	c3                   	ret    

0000063e <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 63e:	55                   	push   %ebp
 63f:	89 e5                	mov    %esp,%ebp
 641:	57                   	push   %edi
 642:	56                   	push   %esi
 643:	53                   	push   %ebx
 644:	83 ec 2c             	sub    $0x2c,%esp
 647:	89 45 d0             	mov    %eax,-0x30(%ebp)
 64a:	89 d0                	mov    %edx,%eax
 64c:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 64e:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 652:	0f 95 c1             	setne  %cl
 655:	c1 ea 1f             	shr    $0x1f,%edx
 658:	84 d1                	test   %dl,%cl
 65a:	74 44                	je     6a0 <printint+0x62>
    neg = 1;
    x = -xx;
 65c:	f7 d8                	neg    %eax
 65e:	89 c1                	mov    %eax,%ecx
    neg = 1;
 660:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 667:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 66c:	89 c8                	mov    %ecx,%eax
 66e:	ba 00 00 00 00       	mov    $0x0,%edx
 673:	f7 f6                	div    %esi
 675:	89 df                	mov    %ebx,%edi
 677:	83 c3 01             	add    $0x1,%ebx
 67a:	0f b6 92 a8 0a 00 00 	movzbl 0xaa8(%edx),%edx
 681:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 685:	89 ca                	mov    %ecx,%edx
 687:	89 c1                	mov    %eax,%ecx
 689:	39 d6                	cmp    %edx,%esi
 68b:	76 df                	jbe    66c <printint+0x2e>
  if(neg)
 68d:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 691:	74 31                	je     6c4 <printint+0x86>
    buf[i++] = '-';
 693:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 698:	8d 5f 02             	lea    0x2(%edi),%ebx
 69b:	8b 75 d0             	mov    -0x30(%ebp),%esi
 69e:	eb 17                	jmp    6b7 <printint+0x79>
    x = xx;
 6a0:	89 c1                	mov    %eax,%ecx
  neg = 0;
 6a2:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 6a9:	eb bc                	jmp    667 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 6ab:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 6b0:	89 f0                	mov    %esi,%eax
 6b2:	e8 6d ff ff ff       	call   624 <putc>
  while(--i >= 0)
 6b7:	83 eb 01             	sub    $0x1,%ebx
 6ba:	79 ef                	jns    6ab <printint+0x6d>
}
 6bc:	83 c4 2c             	add    $0x2c,%esp
 6bf:	5b                   	pop    %ebx
 6c0:	5e                   	pop    %esi
 6c1:	5f                   	pop    %edi
 6c2:	5d                   	pop    %ebp
 6c3:	c3                   	ret    
 6c4:	8b 75 d0             	mov    -0x30(%ebp),%esi
 6c7:	eb ee                	jmp    6b7 <printint+0x79>

000006c9 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 6c9:	55                   	push   %ebp
 6ca:	89 e5                	mov    %esp,%ebp
 6cc:	57                   	push   %edi
 6cd:	56                   	push   %esi
 6ce:	53                   	push   %ebx
 6cf:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 6d2:	8d 45 10             	lea    0x10(%ebp),%eax
 6d5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 6d8:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 6dd:	bb 00 00 00 00       	mov    $0x0,%ebx
 6e2:	eb 14                	jmp    6f8 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 6e4:	89 fa                	mov    %edi,%edx
 6e6:	8b 45 08             	mov    0x8(%ebp),%eax
 6e9:	e8 36 ff ff ff       	call   624 <putc>
 6ee:	eb 05                	jmp    6f5 <printf+0x2c>
      }
    } else if(state == '%'){
 6f0:	83 fe 25             	cmp    $0x25,%esi
 6f3:	74 25                	je     71a <printf+0x51>
  for(i = 0; fmt[i]; i++){
 6f5:	83 c3 01             	add    $0x1,%ebx
 6f8:	8b 45 0c             	mov    0xc(%ebp),%eax
 6fb:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 6ff:	84 c0                	test   %al,%al
 701:	0f 84 20 01 00 00    	je     827 <printf+0x15e>
    c = fmt[i] & 0xff;
 707:	0f be f8             	movsbl %al,%edi
 70a:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 70d:	85 f6                	test   %esi,%esi
 70f:	75 df                	jne    6f0 <printf+0x27>
      if(c == '%'){
 711:	83 f8 25             	cmp    $0x25,%eax
 714:	75 ce                	jne    6e4 <printf+0x1b>
        state = '%';
 716:	89 c6                	mov    %eax,%esi
 718:	eb db                	jmp    6f5 <printf+0x2c>
      if(c == 'd'){
 71a:	83 f8 25             	cmp    $0x25,%eax
 71d:	0f 84 cf 00 00 00    	je     7f2 <printf+0x129>
 723:	0f 8c dd 00 00 00    	jl     806 <printf+0x13d>
 729:	83 f8 78             	cmp    $0x78,%eax
 72c:	0f 8f d4 00 00 00    	jg     806 <printf+0x13d>
 732:	83 f8 63             	cmp    $0x63,%eax
 735:	0f 8c cb 00 00 00    	jl     806 <printf+0x13d>
 73b:	83 e8 63             	sub    $0x63,%eax
 73e:	83 f8 15             	cmp    $0x15,%eax
 741:	0f 87 bf 00 00 00    	ja     806 <printf+0x13d>
 747:	ff 24 85 50 0a 00 00 	jmp    *0xa50(,%eax,4)
        printint(fd, *ap, 10, 1);
 74e:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 751:	8b 17                	mov    (%edi),%edx
 753:	83 ec 0c             	sub    $0xc,%esp
 756:	6a 01                	push   $0x1
 758:	b9 0a 00 00 00       	mov    $0xa,%ecx
 75d:	8b 45 08             	mov    0x8(%ebp),%eax
 760:	e8 d9 fe ff ff       	call   63e <printint>
        ap++;
 765:	83 c7 04             	add    $0x4,%edi
 768:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 76b:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 76e:	be 00 00 00 00       	mov    $0x0,%esi
 773:	eb 80                	jmp    6f5 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 775:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 778:	8b 17                	mov    (%edi),%edx
 77a:	83 ec 0c             	sub    $0xc,%esp
 77d:	6a 00                	push   $0x0
 77f:	b9 10 00 00 00       	mov    $0x10,%ecx
 784:	8b 45 08             	mov    0x8(%ebp),%eax
 787:	e8 b2 fe ff ff       	call   63e <printint>
        ap++;
 78c:	83 c7 04             	add    $0x4,%edi
 78f:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 792:	83 c4 10             	add    $0x10,%esp
      state = 0;
 795:	be 00 00 00 00       	mov    $0x0,%esi
 79a:	e9 56 ff ff ff       	jmp    6f5 <printf+0x2c>
        s = (char*)*ap;
 79f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 7a2:	8b 30                	mov    (%eax),%esi
        ap++;
 7a4:	83 c0 04             	add    $0x4,%eax
 7a7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 7aa:	85 f6                	test   %esi,%esi
 7ac:	75 15                	jne    7c3 <printf+0xfa>
          s = "(null)";
 7ae:	be 47 0a 00 00       	mov    $0xa47,%esi
 7b3:	eb 0e                	jmp    7c3 <printf+0xfa>
          putc(fd, *s);
 7b5:	0f be d2             	movsbl %dl,%edx
 7b8:	8b 45 08             	mov    0x8(%ebp),%eax
 7bb:	e8 64 fe ff ff       	call   624 <putc>
          s++;
 7c0:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 7c3:	0f b6 16             	movzbl (%esi),%edx
 7c6:	84 d2                	test   %dl,%dl
 7c8:	75 eb                	jne    7b5 <printf+0xec>
      state = 0;
 7ca:	be 00 00 00 00       	mov    $0x0,%esi
 7cf:	e9 21 ff ff ff       	jmp    6f5 <printf+0x2c>
        putc(fd, *ap);
 7d4:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7d7:	0f be 17             	movsbl (%edi),%edx
 7da:	8b 45 08             	mov    0x8(%ebp),%eax
 7dd:	e8 42 fe ff ff       	call   624 <putc>
        ap++;
 7e2:	83 c7 04             	add    $0x4,%edi
 7e5:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 7e8:	be 00 00 00 00       	mov    $0x0,%esi
 7ed:	e9 03 ff ff ff       	jmp    6f5 <printf+0x2c>
        putc(fd, c);
 7f2:	89 fa                	mov    %edi,%edx
 7f4:	8b 45 08             	mov    0x8(%ebp),%eax
 7f7:	e8 28 fe ff ff       	call   624 <putc>
      state = 0;
 7fc:	be 00 00 00 00       	mov    $0x0,%esi
 801:	e9 ef fe ff ff       	jmp    6f5 <printf+0x2c>
        putc(fd, '%');
 806:	ba 25 00 00 00       	mov    $0x25,%edx
 80b:	8b 45 08             	mov    0x8(%ebp),%eax
 80e:	e8 11 fe ff ff       	call   624 <putc>
        putc(fd, c);
 813:	89 fa                	mov    %edi,%edx
 815:	8b 45 08             	mov    0x8(%ebp),%eax
 818:	e8 07 fe ff ff       	call   624 <putc>
      state = 0;
 81d:	be 00 00 00 00       	mov    $0x0,%esi
 822:	e9 ce fe ff ff       	jmp    6f5 <printf+0x2c>
    }
  }
}
 827:	8d 65 f4             	lea    -0xc(%ebp),%esp
 82a:	5b                   	pop    %ebx
 82b:	5e                   	pop    %esi
 82c:	5f                   	pop    %edi
 82d:	5d                   	pop    %ebp
 82e:	c3                   	ret    

0000082f <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 82f:	55                   	push   %ebp
 830:	89 e5                	mov    %esp,%ebp
 832:	57                   	push   %edi
 833:	56                   	push   %esi
 834:	53                   	push   %ebx
 835:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 838:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 83b:	a1 60 0f 00 00       	mov    0xf60,%eax
 840:	eb 02                	jmp    844 <free+0x15>
 842:	89 d0                	mov    %edx,%eax
 844:	39 c8                	cmp    %ecx,%eax
 846:	73 04                	jae    84c <free+0x1d>
 848:	39 08                	cmp    %ecx,(%eax)
 84a:	77 12                	ja     85e <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 84c:	8b 10                	mov    (%eax),%edx
 84e:	39 c2                	cmp    %eax,%edx
 850:	77 f0                	ja     842 <free+0x13>
 852:	39 c8                	cmp    %ecx,%eax
 854:	72 08                	jb     85e <free+0x2f>
 856:	39 ca                	cmp    %ecx,%edx
 858:	77 04                	ja     85e <free+0x2f>
 85a:	89 d0                	mov    %edx,%eax
 85c:	eb e6                	jmp    844 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 85e:	8b 73 fc             	mov    -0x4(%ebx),%esi
 861:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 864:	8b 10                	mov    (%eax),%edx
 866:	39 d7                	cmp    %edx,%edi
 868:	74 19                	je     883 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 86a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 86d:	8b 50 04             	mov    0x4(%eax),%edx
 870:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 873:	39 ce                	cmp    %ecx,%esi
 875:	74 1b                	je     892 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 877:	89 08                	mov    %ecx,(%eax)
  freep = p;
 879:	a3 60 0f 00 00       	mov    %eax,0xf60
}
 87e:	5b                   	pop    %ebx
 87f:	5e                   	pop    %esi
 880:	5f                   	pop    %edi
 881:	5d                   	pop    %ebp
 882:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 883:	03 72 04             	add    0x4(%edx),%esi
 886:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 889:	8b 10                	mov    (%eax),%edx
 88b:	8b 12                	mov    (%edx),%edx
 88d:	89 53 f8             	mov    %edx,-0x8(%ebx)
 890:	eb db                	jmp    86d <free+0x3e>
    p->s.size += bp->s.size;
 892:	03 53 fc             	add    -0x4(%ebx),%edx
 895:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 898:	8b 53 f8             	mov    -0x8(%ebx),%edx
 89b:	89 10                	mov    %edx,(%eax)
 89d:	eb da                	jmp    879 <free+0x4a>

0000089f <morecore>:

static Header*
morecore(uint nu)
{
 89f:	55                   	push   %ebp
 8a0:	89 e5                	mov    %esp,%ebp
 8a2:	53                   	push   %ebx
 8a3:	83 ec 04             	sub    $0x4,%esp
 8a6:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 8a8:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 8ad:	77 05                	ja     8b4 <morecore+0x15>
    nu = 4096;
 8af:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 8b4:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 8bb:	83 ec 0c             	sub    $0xc,%esp
 8be:	50                   	push   %eax
 8bf:	e8 38 fd ff ff       	call   5fc <sbrk>
  if(p == (char*)-1)
 8c4:	83 c4 10             	add    $0x10,%esp
 8c7:	83 f8 ff             	cmp    $0xffffffff,%eax
 8ca:	74 1c                	je     8e8 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 8cc:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 8cf:	83 c0 08             	add    $0x8,%eax
 8d2:	83 ec 0c             	sub    $0xc,%esp
 8d5:	50                   	push   %eax
 8d6:	e8 54 ff ff ff       	call   82f <free>
  return freep;
 8db:	a1 60 0f 00 00       	mov    0xf60,%eax
 8e0:	83 c4 10             	add    $0x10,%esp
}
 8e3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8e6:	c9                   	leave  
 8e7:	c3                   	ret    
    return 0;
 8e8:	b8 00 00 00 00       	mov    $0x0,%eax
 8ed:	eb f4                	jmp    8e3 <morecore+0x44>

000008ef <malloc>:

void*
malloc(uint nbytes)
{
 8ef:	55                   	push   %ebp
 8f0:	89 e5                	mov    %esp,%ebp
 8f2:	53                   	push   %ebx
 8f3:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8f6:	8b 45 08             	mov    0x8(%ebp),%eax
 8f9:	8d 58 07             	lea    0x7(%eax),%ebx
 8fc:	c1 eb 03             	shr    $0x3,%ebx
 8ff:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 902:	8b 0d 60 0f 00 00    	mov    0xf60,%ecx
 908:	85 c9                	test   %ecx,%ecx
 90a:	74 04                	je     910 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 90c:	8b 01                	mov    (%ecx),%eax
 90e:	eb 4a                	jmp    95a <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 910:	c7 05 60 0f 00 00 64 	movl   $0xf64,0xf60
 917:	0f 00 00 
 91a:	c7 05 64 0f 00 00 64 	movl   $0xf64,0xf64
 921:	0f 00 00 
    base.s.size = 0;
 924:	c7 05 68 0f 00 00 00 	movl   $0x0,0xf68
 92b:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 92e:	b9 64 0f 00 00       	mov    $0xf64,%ecx
 933:	eb d7                	jmp    90c <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 935:	74 19                	je     950 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 937:	29 da                	sub    %ebx,%edx
 939:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 93c:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 93f:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 942:	89 0d 60 0f 00 00    	mov    %ecx,0xf60
      return (void*)(p + 1);
 948:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 94b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 94e:	c9                   	leave  
 94f:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 950:	8b 10                	mov    (%eax),%edx
 952:	89 11                	mov    %edx,(%ecx)
 954:	eb ec                	jmp    942 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 956:	89 c1                	mov    %eax,%ecx
 958:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 95a:	8b 50 04             	mov    0x4(%eax),%edx
 95d:	39 da                	cmp    %ebx,%edx
 95f:	73 d4                	jae    935 <malloc+0x46>
    if(p == freep)
 961:	39 05 60 0f 00 00    	cmp    %eax,0xf60
 967:	75 ed                	jne    956 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 969:	89 d8                	mov    %ebx,%eax
 96b:	e8 2f ff ff ff       	call   89f <morecore>
 970:	85 c0                	test   %eax,%eax
 972:	75 e2                	jne    956 <malloc+0x67>
 974:	eb d5                	jmp    94b <malloc+0x5c>
