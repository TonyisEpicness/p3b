
_test_9:     file format elf32-i386


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
   assert((uint)&arg2 == ((uint)arg1 + PGSIZE - 4));
   6:	8d 4d 0c             	lea    0xc(%ebp),%ecx
   9:	8b 45 08             	mov    0x8(%ebp),%eax
   c:	8d 90 fc 0f 00 00    	lea    0xffc(%eax),%edx
  12:	39 d1                	cmp    %edx,%ecx
  14:	75 67                	jne    7d <worker+0x7d>
   assert((uint)&arg1 == ((uint)arg1 + PGSIZE - 8));
  16:	8d 90 f8 0f 00 00    	lea    0xff8(%eax),%edx
  1c:	8d 4d 08             	lea    0x8(%ebp),%ecx
  1f:	39 d1                	cmp    %edx,%ecx
  21:	0f 85 9f 00 00 00    	jne    c6 <worker+0xc6>
   assert(*((uint*) (arg1 + PGSIZE - 12)) == 0xffffffff);
  27:	83 b8 f4 0f 00 00 ff 	cmpl   $0xffffffff,0xff4(%eax)
  2e:	0f 84 db 00 00 00    	je     10f <worker+0x10f>
  34:	6a 32                	push   $0x32
  36:	68 44 09 00 00       	push   $0x944
  3b:	68 4d 09 00 00       	push   $0x94d
  40:	6a 01                	push   $0x1
  42:	e8 50 06 00 00       	call   697 <printf>
  47:	83 c4 0c             	add    $0xc,%esp
  4a:	68 0c 0a 00 00       	push   $0xa0c
  4f:	68 55 09 00 00       	push   $0x955
  54:	6a 01                	push   $0x1
  56:	e8 3c 06 00 00       	call   697 <printf>
  5b:	83 c4 08             	add    $0x8,%esp
  5e:	68 69 09 00 00       	push   $0x969
  63:	6a 01                	push   $0x1
  65:	e8 2d 06 00 00       	call   697 <printf>
  6a:	83 c4 04             	add    $0x4,%esp
  6d:	ff 35 40 0e 00 00    	push   0xe40
  73:	e8 fa 04 00 00       	call   572 <kill>
  78:	e8 c5 04 00 00       	call   542 <exit>
   assert((uint)&arg2 == ((uint)arg1 + PGSIZE - 4));
  7d:	6a 30                	push   $0x30
  7f:	68 44 09 00 00       	push   $0x944
  84:	68 4d 09 00 00       	push   $0x94d
  89:	6a 01                	push   $0x1
  8b:	e8 07 06 00 00       	call   697 <printf>
  90:	83 c4 0c             	add    $0xc,%esp
  93:	68 b4 09 00 00       	push   $0x9b4
  98:	68 55 09 00 00       	push   $0x955
  9d:	6a 01                	push   $0x1
  9f:	e8 f3 05 00 00       	call   697 <printf>
  a4:	83 c4 08             	add    $0x8,%esp
  a7:	68 69 09 00 00       	push   $0x969
  ac:	6a 01                	push   $0x1
  ae:	e8 e4 05 00 00       	call   697 <printf>
  b3:	83 c4 04             	add    $0x4,%esp
  b6:	ff 35 40 0e 00 00    	push   0xe40
  bc:	e8 b1 04 00 00       	call   572 <kill>
  c1:	e8 7c 04 00 00       	call   542 <exit>
   assert((uint)&arg1 == ((uint)arg1 + PGSIZE - 8));
  c6:	6a 31                	push   $0x31
  c8:	68 44 09 00 00       	push   $0x944
  cd:	68 4d 09 00 00       	push   $0x94d
  d2:	6a 01                	push   $0x1
  d4:	e8 be 05 00 00       	call   697 <printf>
  d9:	83 c4 0c             	add    $0xc,%esp
  dc:	68 e0 09 00 00       	push   $0x9e0
  e1:	68 55 09 00 00       	push   $0x955
  e6:	6a 01                	push   $0x1
  e8:	e8 aa 05 00 00       	call   697 <printf>
  ed:	83 c4 08             	add    $0x8,%esp
  f0:	68 69 09 00 00       	push   $0x969
  f5:	6a 01                	push   $0x1
  f7:	e8 9b 05 00 00       	call   697 <printf>
  fc:	83 c4 04             	add    $0x4,%esp
  ff:	ff 35 40 0e 00 00    	push   0xe40
 105:	e8 68 04 00 00       	call   572 <kill>
 10a:	e8 33 04 00 00       	call   542 <exit>
   global = 5;
 10f:	c7 05 30 0e 00 00 05 	movl   $0x5,0xe30
 116:	00 00 00 
   exit();
 119:	e8 24 04 00 00       	call   542 <exit>

0000011e <main>:
{
 11e:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 122:	83 e4 f0             	and    $0xfffffff0,%esp
 125:	ff 71 fc             	push   -0x4(%ecx)
 128:	55                   	push   %ebp
 129:	89 e5                	mov    %esp,%ebp
 12b:	56                   	push   %esi
 12c:	53                   	push   %ebx
 12d:	51                   	push   %ecx
 12e:	83 ec 1c             	sub    $0x1c,%esp
   ppid = getpid();
 131:	e8 8c 04 00 00       	call   5c2 <getpid>
 136:	a3 40 0e 00 00       	mov    %eax,0xe40
   void *stack, *p = malloc(PGSIZE * 2);
 13b:	83 ec 0c             	sub    $0xc,%esp
 13e:	68 00 20 00 00       	push   $0x2000
 143:	e8 75 07 00 00       	call   8bd <malloc>
   assert(p != NULL);
 148:	83 c4 10             	add    $0x10,%esp
 14b:	85 c0                	test   %eax,%eax
 14d:	0f 84 a8 00 00 00    	je     1fb <main+0xdd>
 153:	89 c3                	mov    %eax,%ebx
   if((uint)p % PGSIZE)
 155:	89 c2                	mov    %eax,%edx
 157:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 15d:	74 09                	je     168 <main+0x4a>
     stack = p + (PGSIZE - (uint)p % PGSIZE);
 15f:	b8 00 10 00 00       	mov    $0x1000,%eax
 164:	29 d0                	sub    %edx,%eax
 166:	01 d8                	add    %ebx,%eax
   int clone_pid = clone(worker, stack, 0, stack);
 168:	50                   	push   %eax
 169:	6a 00                	push   $0x0
 16b:	50                   	push   %eax
 16c:	68 00 00 00 00       	push   $0x0
 171:	e8 6c 04 00 00       	call   5e2 <clone>
 176:	89 c6                	mov    %eax,%esi
   assert(clone_pid > 0);
 178:	83 c4 10             	add    $0x10,%esp
 17b:	85 c0                	test   %eax,%eax
 17d:	0f 8e c1 00 00 00    	jle    244 <main+0x126>
   while(global != 5);
 183:	a1 30 0e 00 00       	mov    0xe30,%eax
 188:	83 f8 05             	cmp    $0x5,%eax
 18b:	75 f6                	jne    183 <main+0x65>
   printf(1, "TEST PASSED\n");
 18d:	83 ec 08             	sub    $0x8,%esp
 190:	68 8e 09 00 00       	push   $0x98e
 195:	6a 01                	push   $0x1
 197:	e8 fb 04 00 00       	call   697 <printf>
   int join_pid = join(&join_stack);
 19c:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 19f:	89 04 24             	mov    %eax,(%esp)
 1a2:	e8 43 04 00 00       	call   5ea <join>
   assert(join_pid == clone_pid);
 1a7:	83 c4 10             	add    $0x10,%esp
 1aa:	39 c6                	cmp    %eax,%esi
 1ac:	0f 84 db 00 00 00    	je     28d <main+0x16f>
 1b2:	6a 29                	push   $0x29
 1b4:	68 44 09 00 00       	push   $0x944
 1b9:	68 4d 09 00 00       	push   $0x94d
 1be:	6a 01                	push   $0x1
 1c0:	e8 d2 04 00 00       	call   697 <printf>
 1c5:	83 c4 0c             	add    $0xc,%esp
 1c8:	68 9b 09 00 00       	push   $0x99b
 1cd:	68 55 09 00 00       	push   $0x955
 1d2:	6a 01                	push   $0x1
 1d4:	e8 be 04 00 00       	call   697 <printf>
 1d9:	83 c4 08             	add    $0x8,%esp
 1dc:	68 69 09 00 00       	push   $0x969
 1e1:	6a 01                	push   $0x1
 1e3:	e8 af 04 00 00       	call   697 <printf>
 1e8:	83 c4 04             	add    $0x4,%esp
 1eb:	ff 35 40 0e 00 00    	push   0xe40
 1f1:	e8 7c 03 00 00       	call   572 <kill>
 1f6:	e8 47 03 00 00       	call   542 <exit>
   assert(p != NULL);
 1fb:	6a 1c                	push   $0x1c
 1fd:	68 44 09 00 00       	push   $0x944
 202:	68 4d 09 00 00       	push   $0x94d
 207:	6a 01                	push   $0x1
 209:	e8 89 04 00 00       	call   697 <printf>
 20e:	83 c4 0c             	add    $0xc,%esp
 211:	68 76 09 00 00       	push   $0x976
 216:	68 55 09 00 00       	push   $0x955
 21b:	6a 01                	push   $0x1
 21d:	e8 75 04 00 00       	call   697 <printf>
 222:	83 c4 08             	add    $0x8,%esp
 225:	68 69 09 00 00       	push   $0x969
 22a:	6a 01                	push   $0x1
 22c:	e8 66 04 00 00       	call   697 <printf>
 231:	83 c4 04             	add    $0x4,%esp
 234:	ff 35 40 0e 00 00    	push   0xe40
 23a:	e8 33 03 00 00       	call   572 <kill>
 23f:	e8 fe 02 00 00       	call   542 <exit>
   assert(clone_pid > 0);
 244:	6a 23                	push   $0x23
 246:	68 44 09 00 00       	push   $0x944
 24b:	68 4d 09 00 00       	push   $0x94d
 250:	6a 01                	push   $0x1
 252:	e8 40 04 00 00       	call   697 <printf>
 257:	83 c4 0c             	add    $0xc,%esp
 25a:	68 80 09 00 00       	push   $0x980
 25f:	68 55 09 00 00       	push   $0x955
 264:	6a 01                	push   $0x1
 266:	e8 2c 04 00 00       	call   697 <printf>
 26b:	83 c4 08             	add    $0x8,%esp
 26e:	68 69 09 00 00       	push   $0x969
 273:	6a 01                	push   $0x1
 275:	e8 1d 04 00 00       	call   697 <printf>
 27a:	83 c4 04             	add    $0x4,%esp
 27d:	ff 35 40 0e 00 00    	push   0xe40
 283:	e8 ea 02 00 00       	call   572 <kill>
 288:	e8 b5 02 00 00       	call   542 <exit>
   free(p);
 28d:	83 ec 0c             	sub    $0xc,%esp
 290:	53                   	push   %ebx
 291:	e8 67 05 00 00       	call   7fd <free>
   exit();
 296:	e8 a7 02 00 00       	call   542 <exit>

0000029b <test_and_set>:
  int flag;
};

struct thread_ref *threads[64];

int test_and_set(int *old_ptr, int new_ptr) {
 29b:	55                   	push   %ebp
 29c:	89 e5                	mov    %esp,%ebp
 29e:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *old_ptr;
 2a1:	8b 10                	mov    (%eax),%edx
  *old_ptr = new_ptr;
 2a3:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 2a6:	89 08                	mov    %ecx,(%eax)
  return old;
}
 2a8:	89 d0                	mov    %edx,%eax
 2aa:	5d                   	pop    %ebp
 2ab:	c3                   	ret    

000002ac <thread_create>:

// a wrapper func for clone
int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 2ac:	55                   	push   %ebp
 2ad:	89 e5                	mov    %esp,%ebp
 2af:	83 ec 14             	sub    $0x14,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE*2);
 2b2:	68 00 20 00 00       	push   $0x2000
 2b7:	e8 01 06 00 00       	call   8bd <malloc>
  if(n_stack == 0){
 2bc:	83 c4 10             	add    $0x10,%esp
 2bf:	85 c0                	test   %eax,%eax
 2c1:	74 4a                	je     30d <thread_create+0x61>
    return -1;
  }
  
  for(int i=0; i<64; i++){
 2c3:	ba 00 00 00 00       	mov    $0x0,%edx
 2c8:	eb 03                	jmp    2cd <thread_create+0x21>
 2ca:	83 c2 01             	add    $0x1,%edx
 2cd:	83 fa 3f             	cmp    $0x3f,%edx
 2d0:	7f 27                	jg     2f9 <thread_create+0x4d>
    if(threads[i]->flag==0){
 2d2:	8b 0c 95 60 0e 00 00 	mov    0xe60(,%edx,4),%ecx
 2d9:	83 79 08 00          	cmpl   $0x0,0x8(%ecx)
 2dd:	75 eb                	jne    2ca <thread_create+0x1e>
      threads[i]->maddr = n_stack;
 2df:	89 01                	mov    %eax,(%ecx)
      threads[i]->pg1addr = n_stack;
 2e1:	8b 0c 95 60 0e 00 00 	mov    0xe60(,%edx,4),%ecx
 2e8:	89 41 04             	mov    %eax,0x4(%ecx)
      threads[i]->flag = 1;
 2eb:	8b 14 95 60 0e 00 00 	mov    0xe60(,%edx,4),%edx
 2f2:	c7 42 08 01 00 00 00 	movl   $0x1,0x8(%edx)
      break;
    }
  }
  
  int new_pid = clone(start_routine, arg1, arg2, n_stack); // TODO: is this the right way to call it?
 2f9:	50                   	push   %eax
 2fa:	ff 75 10             	push   0x10(%ebp)
 2fd:	ff 75 0c             	push   0xc(%ebp)
 300:	ff 75 08             	push   0x8(%ebp)
 303:	e8 da 02 00 00       	call   5e2 <clone>

  // I can't remember if there was something else to do here but I'm sure I'll find out



  return new_pid;
 308:	83 c4 10             	add    $0x10,%esp
}
 30b:	c9                   	leave  
 30c:	c3                   	ret    
    return -1;
 30d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 312:	eb f7                	jmp    30b <thread_create+0x5f>

00000314 <thread_join>:

//TODO: fix
int thread_join() {
 314:	55                   	push   %ebp
 315:	89 e5                	mov    %esp,%ebp
 317:	56                   	push   %esi
 318:	53                   	push   %ebx
 319:	83 ec 1c             	sub    $0x1c,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 31c:	8d 45 f4             	lea    -0xc(%ebp),%eax
 31f:	50                   	push   %eax
 320:	e8 c5 02 00 00       	call   5ea <join>
 325:	89 c6                	mov    %eax,%esi
  for(int i=0; i<64; i++){
 327:	83 c4 10             	add    $0x10,%esp
 32a:	bb 00 00 00 00       	mov    $0x0,%ebx
 32f:	eb 03                	jmp    334 <thread_join+0x20>
 331:	83 c3 01             	add    $0x1,%ebx
 334:	83 fb 3f             	cmp    $0x3f,%ebx
 337:	7f 23                	jg     35c <thread_join+0x48>
    if((threads[i]->flag==1) && (stk_addr == threads[i]->pg1addr)){
 339:	8b 04 9d 60 0e 00 00 	mov    0xe60(,%ebx,4),%eax
 340:	83 78 08 01          	cmpl   $0x1,0x8(%eax)
 344:	75 eb                	jne    331 <thread_join+0x1d>
 346:	8b 55 f4             	mov    -0xc(%ebp),%edx
 349:	39 50 04             	cmp    %edx,0x4(%eax)
 34c:	75 e3                	jne    331 <thread_join+0x1d>
      free(stk_addr);
 34e:	83 ec 0c             	sub    $0xc,%esp
 351:	52                   	push   %edx
 352:	e8 a6 04 00 00       	call   7fd <free>
 357:	83 c4 10             	add    $0x10,%esp
 35a:	eb d5                	jmp    331 <thread_join+0x1d>
    }
  }
  return pid;
}
 35c:	89 f0                	mov    %esi,%eax
 35e:	8d 65 f8             	lea    -0x8(%ebp),%esp
 361:	5b                   	pop    %ebx
 362:	5e                   	pop    %esi
 363:	5d                   	pop    %ebp
 364:	c3                   	ret    

00000365 <lock_acquire>:

void lock_acquire(lock_t *lock){
 365:	55                   	push   %ebp
 366:	89 e5                	mov    %esp,%ebp
 368:	53                   	push   %ebx
 369:	83 ec 04             	sub    $0x4,%esp
 36c:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 36f:	83 ec 08             	sub    $0x8,%esp
 372:	6a 01                	push   $0x1
 374:	53                   	push   %ebx
 375:	e8 21 ff ff ff       	call   29b <test_and_set>
 37a:	83 c4 10             	add    $0x10,%esp
 37d:	83 f8 01             	cmp    $0x1,%eax
 380:	74 ed                	je     36f <lock_acquire+0xa>
    ;
}
 382:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 385:	c9                   	leave  
 386:	c3                   	ret    

00000387 <lock_release>:

void lock_release(lock_t *lock) {
 387:	55                   	push   %ebp
 388:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 38a:	8b 45 08             	mov    0x8(%ebp),%eax
 38d:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 393:	5d                   	pop    %ebp
 394:	c3                   	ret    

00000395 <lock_init>:

void lock_init(lock_t *lock) {
 395:	55                   	push   %ebp
 396:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 398:	8b 45 08             	mov    0x8(%ebp),%eax
 39b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 3a1:	5d                   	pop    %ebp
 3a2:	c3                   	ret    

000003a3 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 3a3:	55                   	push   %ebp
 3a4:	89 e5                	mov    %esp,%ebp
 3a6:	56                   	push   %esi
 3a7:	53                   	push   %ebx
 3a8:	8b 75 08             	mov    0x8(%ebp),%esi
 3ab:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 3ae:	89 f0                	mov    %esi,%eax
 3b0:	89 d1                	mov    %edx,%ecx
 3b2:	83 c2 01             	add    $0x1,%edx
 3b5:	89 c3                	mov    %eax,%ebx
 3b7:	83 c0 01             	add    $0x1,%eax
 3ba:	0f b6 09             	movzbl (%ecx),%ecx
 3bd:	88 0b                	mov    %cl,(%ebx)
 3bf:	84 c9                	test   %cl,%cl
 3c1:	75 ed                	jne    3b0 <strcpy+0xd>
    ;
  return os;
}
 3c3:	89 f0                	mov    %esi,%eax
 3c5:	5b                   	pop    %ebx
 3c6:	5e                   	pop    %esi
 3c7:	5d                   	pop    %ebp
 3c8:	c3                   	ret    

000003c9 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 3c9:	55                   	push   %ebp
 3ca:	89 e5                	mov    %esp,%ebp
 3cc:	8b 4d 08             	mov    0x8(%ebp),%ecx
 3cf:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 3d2:	eb 06                	jmp    3da <strcmp+0x11>
    p++, q++;
 3d4:	83 c1 01             	add    $0x1,%ecx
 3d7:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 3da:	0f b6 01             	movzbl (%ecx),%eax
 3dd:	84 c0                	test   %al,%al
 3df:	74 04                	je     3e5 <strcmp+0x1c>
 3e1:	3a 02                	cmp    (%edx),%al
 3e3:	74 ef                	je     3d4 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 3e5:	0f b6 c0             	movzbl %al,%eax
 3e8:	0f b6 12             	movzbl (%edx),%edx
 3eb:	29 d0                	sub    %edx,%eax
}
 3ed:	5d                   	pop    %ebp
 3ee:	c3                   	ret    

000003ef <strlen>:

uint
strlen(const char *s)
{
 3ef:	55                   	push   %ebp
 3f0:	89 e5                	mov    %esp,%ebp
 3f2:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 3f5:	b8 00 00 00 00       	mov    $0x0,%eax
 3fa:	eb 03                	jmp    3ff <strlen+0x10>
 3fc:	83 c0 01             	add    $0x1,%eax
 3ff:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 403:	75 f7                	jne    3fc <strlen+0xd>
    ;
  return n;
}
 405:	5d                   	pop    %ebp
 406:	c3                   	ret    

00000407 <memset>:

void*
memset(void *dst, int c, uint n)
{
 407:	55                   	push   %ebp
 408:	89 e5                	mov    %esp,%ebp
 40a:	57                   	push   %edi
 40b:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 40e:	89 d7                	mov    %edx,%edi
 410:	8b 4d 10             	mov    0x10(%ebp),%ecx
 413:	8b 45 0c             	mov    0xc(%ebp),%eax
 416:	fc                   	cld    
 417:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 419:	89 d0                	mov    %edx,%eax
 41b:	8b 7d fc             	mov    -0x4(%ebp),%edi
 41e:	c9                   	leave  
 41f:	c3                   	ret    

00000420 <strchr>:

char*
strchr(const char *s, char c)
{
 420:	55                   	push   %ebp
 421:	89 e5                	mov    %esp,%ebp
 423:	8b 45 08             	mov    0x8(%ebp),%eax
 426:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 42a:	eb 03                	jmp    42f <strchr+0xf>
 42c:	83 c0 01             	add    $0x1,%eax
 42f:	0f b6 10             	movzbl (%eax),%edx
 432:	84 d2                	test   %dl,%dl
 434:	74 06                	je     43c <strchr+0x1c>
    if(*s == c)
 436:	38 ca                	cmp    %cl,%dl
 438:	75 f2                	jne    42c <strchr+0xc>
 43a:	eb 05                	jmp    441 <strchr+0x21>
      return (char*)s;
  return 0;
 43c:	b8 00 00 00 00       	mov    $0x0,%eax
}
 441:	5d                   	pop    %ebp
 442:	c3                   	ret    

00000443 <gets>:

char*
gets(char *buf, int max)
{
 443:	55                   	push   %ebp
 444:	89 e5                	mov    %esp,%ebp
 446:	57                   	push   %edi
 447:	56                   	push   %esi
 448:	53                   	push   %ebx
 449:	83 ec 1c             	sub    $0x1c,%esp
 44c:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 44f:	bb 00 00 00 00       	mov    $0x0,%ebx
 454:	89 de                	mov    %ebx,%esi
 456:	83 c3 01             	add    $0x1,%ebx
 459:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 45c:	7d 2e                	jge    48c <gets+0x49>
    cc = read(0, &c, 1);
 45e:	83 ec 04             	sub    $0x4,%esp
 461:	6a 01                	push   $0x1
 463:	8d 45 e7             	lea    -0x19(%ebp),%eax
 466:	50                   	push   %eax
 467:	6a 00                	push   $0x0
 469:	e8 ec 00 00 00       	call   55a <read>
    if(cc < 1)
 46e:	83 c4 10             	add    $0x10,%esp
 471:	85 c0                	test   %eax,%eax
 473:	7e 17                	jle    48c <gets+0x49>
      break;
    buf[i++] = c;
 475:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 479:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 47c:	3c 0a                	cmp    $0xa,%al
 47e:	0f 94 c2             	sete   %dl
 481:	3c 0d                	cmp    $0xd,%al
 483:	0f 94 c0             	sete   %al
 486:	08 c2                	or     %al,%dl
 488:	74 ca                	je     454 <gets+0x11>
    buf[i++] = c;
 48a:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 48c:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 490:	89 f8                	mov    %edi,%eax
 492:	8d 65 f4             	lea    -0xc(%ebp),%esp
 495:	5b                   	pop    %ebx
 496:	5e                   	pop    %esi
 497:	5f                   	pop    %edi
 498:	5d                   	pop    %ebp
 499:	c3                   	ret    

0000049a <stat>:

int
stat(const char *n, struct stat *st)
{
 49a:	55                   	push   %ebp
 49b:	89 e5                	mov    %esp,%ebp
 49d:	56                   	push   %esi
 49e:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 49f:	83 ec 08             	sub    $0x8,%esp
 4a2:	6a 00                	push   $0x0
 4a4:	ff 75 08             	push   0x8(%ebp)
 4a7:	e8 d6 00 00 00       	call   582 <open>
  if(fd < 0)
 4ac:	83 c4 10             	add    $0x10,%esp
 4af:	85 c0                	test   %eax,%eax
 4b1:	78 24                	js     4d7 <stat+0x3d>
 4b3:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 4b5:	83 ec 08             	sub    $0x8,%esp
 4b8:	ff 75 0c             	push   0xc(%ebp)
 4bb:	50                   	push   %eax
 4bc:	e8 d9 00 00 00       	call   59a <fstat>
 4c1:	89 c6                	mov    %eax,%esi
  close(fd);
 4c3:	89 1c 24             	mov    %ebx,(%esp)
 4c6:	e8 9f 00 00 00       	call   56a <close>
  return r;
 4cb:	83 c4 10             	add    $0x10,%esp
}
 4ce:	89 f0                	mov    %esi,%eax
 4d0:	8d 65 f8             	lea    -0x8(%ebp),%esp
 4d3:	5b                   	pop    %ebx
 4d4:	5e                   	pop    %esi
 4d5:	5d                   	pop    %ebp
 4d6:	c3                   	ret    
    return -1;
 4d7:	be ff ff ff ff       	mov    $0xffffffff,%esi
 4dc:	eb f0                	jmp    4ce <stat+0x34>

000004de <atoi>:

int
atoi(const char *s)
{
 4de:	55                   	push   %ebp
 4df:	89 e5                	mov    %esp,%ebp
 4e1:	53                   	push   %ebx
 4e2:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 4e5:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 4ea:	eb 10                	jmp    4fc <atoi+0x1e>
    n = n*10 + *s++ - '0';
 4ec:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 4ef:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 4f2:	83 c1 01             	add    $0x1,%ecx
 4f5:	0f be c0             	movsbl %al,%eax
 4f8:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 4fc:	0f b6 01             	movzbl (%ecx),%eax
 4ff:	8d 58 d0             	lea    -0x30(%eax),%ebx
 502:	80 fb 09             	cmp    $0x9,%bl
 505:	76 e5                	jbe    4ec <atoi+0xe>
  return n;
}
 507:	89 d0                	mov    %edx,%eax
 509:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 50c:	c9                   	leave  
 50d:	c3                   	ret    

0000050e <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 50e:	55                   	push   %ebp
 50f:	89 e5                	mov    %esp,%ebp
 511:	56                   	push   %esi
 512:	53                   	push   %ebx
 513:	8b 75 08             	mov    0x8(%ebp),%esi
 516:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 519:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 51c:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 51e:	eb 0d                	jmp    52d <memmove+0x1f>
    *dst++ = *src++;
 520:	0f b6 01             	movzbl (%ecx),%eax
 523:	88 02                	mov    %al,(%edx)
 525:	8d 49 01             	lea    0x1(%ecx),%ecx
 528:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 52b:	89 d8                	mov    %ebx,%eax
 52d:	8d 58 ff             	lea    -0x1(%eax),%ebx
 530:	85 c0                	test   %eax,%eax
 532:	7f ec                	jg     520 <memmove+0x12>
  return vdst;
}
 534:	89 f0                	mov    %esi,%eax
 536:	5b                   	pop    %ebx
 537:	5e                   	pop    %esi
 538:	5d                   	pop    %ebp
 539:	c3                   	ret    

0000053a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 53a:	b8 01 00 00 00       	mov    $0x1,%eax
 53f:	cd 40                	int    $0x40
 541:	c3                   	ret    

00000542 <exit>:
SYSCALL(exit)
 542:	b8 02 00 00 00       	mov    $0x2,%eax
 547:	cd 40                	int    $0x40
 549:	c3                   	ret    

0000054a <wait>:
SYSCALL(wait)
 54a:	b8 03 00 00 00       	mov    $0x3,%eax
 54f:	cd 40                	int    $0x40
 551:	c3                   	ret    

00000552 <pipe>:
SYSCALL(pipe)
 552:	b8 04 00 00 00       	mov    $0x4,%eax
 557:	cd 40                	int    $0x40
 559:	c3                   	ret    

0000055a <read>:
SYSCALL(read)
 55a:	b8 05 00 00 00       	mov    $0x5,%eax
 55f:	cd 40                	int    $0x40
 561:	c3                   	ret    

00000562 <write>:
SYSCALL(write)
 562:	b8 10 00 00 00       	mov    $0x10,%eax
 567:	cd 40                	int    $0x40
 569:	c3                   	ret    

0000056a <close>:
SYSCALL(close)
 56a:	b8 15 00 00 00       	mov    $0x15,%eax
 56f:	cd 40                	int    $0x40
 571:	c3                   	ret    

00000572 <kill>:
SYSCALL(kill)
 572:	b8 06 00 00 00       	mov    $0x6,%eax
 577:	cd 40                	int    $0x40
 579:	c3                   	ret    

0000057a <exec>:
SYSCALL(exec)
 57a:	b8 07 00 00 00       	mov    $0x7,%eax
 57f:	cd 40                	int    $0x40
 581:	c3                   	ret    

00000582 <open>:
SYSCALL(open)
 582:	b8 0f 00 00 00       	mov    $0xf,%eax
 587:	cd 40                	int    $0x40
 589:	c3                   	ret    

0000058a <mknod>:
SYSCALL(mknod)
 58a:	b8 11 00 00 00       	mov    $0x11,%eax
 58f:	cd 40                	int    $0x40
 591:	c3                   	ret    

00000592 <unlink>:
SYSCALL(unlink)
 592:	b8 12 00 00 00       	mov    $0x12,%eax
 597:	cd 40                	int    $0x40
 599:	c3                   	ret    

0000059a <fstat>:
SYSCALL(fstat)
 59a:	b8 08 00 00 00       	mov    $0x8,%eax
 59f:	cd 40                	int    $0x40
 5a1:	c3                   	ret    

000005a2 <link>:
SYSCALL(link)
 5a2:	b8 13 00 00 00       	mov    $0x13,%eax
 5a7:	cd 40                	int    $0x40
 5a9:	c3                   	ret    

000005aa <mkdir>:
SYSCALL(mkdir)
 5aa:	b8 14 00 00 00       	mov    $0x14,%eax
 5af:	cd 40                	int    $0x40
 5b1:	c3                   	ret    

000005b2 <chdir>:
SYSCALL(chdir)
 5b2:	b8 09 00 00 00       	mov    $0x9,%eax
 5b7:	cd 40                	int    $0x40
 5b9:	c3                   	ret    

000005ba <dup>:
SYSCALL(dup)
 5ba:	b8 0a 00 00 00       	mov    $0xa,%eax
 5bf:	cd 40                	int    $0x40
 5c1:	c3                   	ret    

000005c2 <getpid>:
SYSCALL(getpid)
 5c2:	b8 0b 00 00 00       	mov    $0xb,%eax
 5c7:	cd 40                	int    $0x40
 5c9:	c3                   	ret    

000005ca <sbrk>:
SYSCALL(sbrk)
 5ca:	b8 0c 00 00 00       	mov    $0xc,%eax
 5cf:	cd 40                	int    $0x40
 5d1:	c3                   	ret    

000005d2 <sleep>:
SYSCALL(sleep)
 5d2:	b8 0d 00 00 00       	mov    $0xd,%eax
 5d7:	cd 40                	int    $0x40
 5d9:	c3                   	ret    

000005da <uptime>:
SYSCALL(uptime)
 5da:	b8 0e 00 00 00       	mov    $0xe,%eax
 5df:	cd 40                	int    $0x40
 5e1:	c3                   	ret    

000005e2 <clone>:
SYSCALL(clone)
 5e2:	b8 16 00 00 00       	mov    $0x16,%eax
 5e7:	cd 40                	int    $0x40
 5e9:	c3                   	ret    

000005ea <join>:
 5ea:	b8 17 00 00 00       	mov    $0x17,%eax
 5ef:	cd 40                	int    $0x40
 5f1:	c3                   	ret    

000005f2 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 5f2:	55                   	push   %ebp
 5f3:	89 e5                	mov    %esp,%ebp
 5f5:	83 ec 1c             	sub    $0x1c,%esp
 5f8:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 5fb:	6a 01                	push   $0x1
 5fd:	8d 55 f4             	lea    -0xc(%ebp),%edx
 600:	52                   	push   %edx
 601:	50                   	push   %eax
 602:	e8 5b ff ff ff       	call   562 <write>
}
 607:	83 c4 10             	add    $0x10,%esp
 60a:	c9                   	leave  
 60b:	c3                   	ret    

0000060c <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 60c:	55                   	push   %ebp
 60d:	89 e5                	mov    %esp,%ebp
 60f:	57                   	push   %edi
 610:	56                   	push   %esi
 611:	53                   	push   %ebx
 612:	83 ec 2c             	sub    $0x2c,%esp
 615:	89 45 d0             	mov    %eax,-0x30(%ebp)
 618:	89 d0                	mov    %edx,%eax
 61a:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 61c:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 620:	0f 95 c1             	setne  %cl
 623:	c1 ea 1f             	shr    $0x1f,%edx
 626:	84 d1                	test   %dl,%cl
 628:	74 44                	je     66e <printint+0x62>
    neg = 1;
    x = -xx;
 62a:	f7 d8                	neg    %eax
 62c:	89 c1                	mov    %eax,%ecx
    neg = 1;
 62e:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 635:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 63a:	89 c8                	mov    %ecx,%eax
 63c:	ba 00 00 00 00       	mov    $0x0,%edx
 641:	f7 f6                	div    %esi
 643:	89 df                	mov    %ebx,%edi
 645:	83 c3 01             	add    $0x1,%ebx
 648:	0f b6 92 9c 0a 00 00 	movzbl 0xa9c(%edx),%edx
 64f:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 653:	89 ca                	mov    %ecx,%edx
 655:	89 c1                	mov    %eax,%ecx
 657:	39 d6                	cmp    %edx,%esi
 659:	76 df                	jbe    63a <printint+0x2e>
  if(neg)
 65b:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 65f:	74 31                	je     692 <printint+0x86>
    buf[i++] = '-';
 661:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 666:	8d 5f 02             	lea    0x2(%edi),%ebx
 669:	8b 75 d0             	mov    -0x30(%ebp),%esi
 66c:	eb 17                	jmp    685 <printint+0x79>
    x = xx;
 66e:	89 c1                	mov    %eax,%ecx
  neg = 0;
 670:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 677:	eb bc                	jmp    635 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 679:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 67e:	89 f0                	mov    %esi,%eax
 680:	e8 6d ff ff ff       	call   5f2 <putc>
  while(--i >= 0)
 685:	83 eb 01             	sub    $0x1,%ebx
 688:	79 ef                	jns    679 <printint+0x6d>
}
 68a:	83 c4 2c             	add    $0x2c,%esp
 68d:	5b                   	pop    %ebx
 68e:	5e                   	pop    %esi
 68f:	5f                   	pop    %edi
 690:	5d                   	pop    %ebp
 691:	c3                   	ret    
 692:	8b 75 d0             	mov    -0x30(%ebp),%esi
 695:	eb ee                	jmp    685 <printint+0x79>

00000697 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 697:	55                   	push   %ebp
 698:	89 e5                	mov    %esp,%ebp
 69a:	57                   	push   %edi
 69b:	56                   	push   %esi
 69c:	53                   	push   %ebx
 69d:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 6a0:	8d 45 10             	lea    0x10(%ebp),%eax
 6a3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 6a6:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 6ab:	bb 00 00 00 00       	mov    $0x0,%ebx
 6b0:	eb 14                	jmp    6c6 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 6b2:	89 fa                	mov    %edi,%edx
 6b4:	8b 45 08             	mov    0x8(%ebp),%eax
 6b7:	e8 36 ff ff ff       	call   5f2 <putc>
 6bc:	eb 05                	jmp    6c3 <printf+0x2c>
      }
    } else if(state == '%'){
 6be:	83 fe 25             	cmp    $0x25,%esi
 6c1:	74 25                	je     6e8 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 6c3:	83 c3 01             	add    $0x1,%ebx
 6c6:	8b 45 0c             	mov    0xc(%ebp),%eax
 6c9:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 6cd:	84 c0                	test   %al,%al
 6cf:	0f 84 20 01 00 00    	je     7f5 <printf+0x15e>
    c = fmt[i] & 0xff;
 6d5:	0f be f8             	movsbl %al,%edi
 6d8:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 6db:	85 f6                	test   %esi,%esi
 6dd:	75 df                	jne    6be <printf+0x27>
      if(c == '%'){
 6df:	83 f8 25             	cmp    $0x25,%eax
 6e2:	75 ce                	jne    6b2 <printf+0x1b>
        state = '%';
 6e4:	89 c6                	mov    %eax,%esi
 6e6:	eb db                	jmp    6c3 <printf+0x2c>
      if(c == 'd'){
 6e8:	83 f8 25             	cmp    $0x25,%eax
 6eb:	0f 84 cf 00 00 00    	je     7c0 <printf+0x129>
 6f1:	0f 8c dd 00 00 00    	jl     7d4 <printf+0x13d>
 6f7:	83 f8 78             	cmp    $0x78,%eax
 6fa:	0f 8f d4 00 00 00    	jg     7d4 <printf+0x13d>
 700:	83 f8 63             	cmp    $0x63,%eax
 703:	0f 8c cb 00 00 00    	jl     7d4 <printf+0x13d>
 709:	83 e8 63             	sub    $0x63,%eax
 70c:	83 f8 15             	cmp    $0x15,%eax
 70f:	0f 87 bf 00 00 00    	ja     7d4 <printf+0x13d>
 715:	ff 24 85 44 0a 00 00 	jmp    *0xa44(,%eax,4)
        printint(fd, *ap, 10, 1);
 71c:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 71f:	8b 17                	mov    (%edi),%edx
 721:	83 ec 0c             	sub    $0xc,%esp
 724:	6a 01                	push   $0x1
 726:	b9 0a 00 00 00       	mov    $0xa,%ecx
 72b:	8b 45 08             	mov    0x8(%ebp),%eax
 72e:	e8 d9 fe ff ff       	call   60c <printint>
        ap++;
 733:	83 c7 04             	add    $0x4,%edi
 736:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 739:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 73c:	be 00 00 00 00       	mov    $0x0,%esi
 741:	eb 80                	jmp    6c3 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 743:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 746:	8b 17                	mov    (%edi),%edx
 748:	83 ec 0c             	sub    $0xc,%esp
 74b:	6a 00                	push   $0x0
 74d:	b9 10 00 00 00       	mov    $0x10,%ecx
 752:	8b 45 08             	mov    0x8(%ebp),%eax
 755:	e8 b2 fe ff ff       	call   60c <printint>
        ap++;
 75a:	83 c7 04             	add    $0x4,%edi
 75d:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 760:	83 c4 10             	add    $0x10,%esp
      state = 0;
 763:	be 00 00 00 00       	mov    $0x0,%esi
 768:	e9 56 ff ff ff       	jmp    6c3 <printf+0x2c>
        s = (char*)*ap;
 76d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 770:	8b 30                	mov    (%eax),%esi
        ap++;
 772:	83 c0 04             	add    $0x4,%eax
 775:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 778:	85 f6                	test   %esi,%esi
 77a:	75 15                	jne    791 <printf+0xfa>
          s = "(null)";
 77c:	be 3a 0a 00 00       	mov    $0xa3a,%esi
 781:	eb 0e                	jmp    791 <printf+0xfa>
          putc(fd, *s);
 783:	0f be d2             	movsbl %dl,%edx
 786:	8b 45 08             	mov    0x8(%ebp),%eax
 789:	e8 64 fe ff ff       	call   5f2 <putc>
          s++;
 78e:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 791:	0f b6 16             	movzbl (%esi),%edx
 794:	84 d2                	test   %dl,%dl
 796:	75 eb                	jne    783 <printf+0xec>
      state = 0;
 798:	be 00 00 00 00       	mov    $0x0,%esi
 79d:	e9 21 ff ff ff       	jmp    6c3 <printf+0x2c>
        putc(fd, *ap);
 7a2:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7a5:	0f be 17             	movsbl (%edi),%edx
 7a8:	8b 45 08             	mov    0x8(%ebp),%eax
 7ab:	e8 42 fe ff ff       	call   5f2 <putc>
        ap++;
 7b0:	83 c7 04             	add    $0x4,%edi
 7b3:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 7b6:	be 00 00 00 00       	mov    $0x0,%esi
 7bb:	e9 03 ff ff ff       	jmp    6c3 <printf+0x2c>
        putc(fd, c);
 7c0:	89 fa                	mov    %edi,%edx
 7c2:	8b 45 08             	mov    0x8(%ebp),%eax
 7c5:	e8 28 fe ff ff       	call   5f2 <putc>
      state = 0;
 7ca:	be 00 00 00 00       	mov    $0x0,%esi
 7cf:	e9 ef fe ff ff       	jmp    6c3 <printf+0x2c>
        putc(fd, '%');
 7d4:	ba 25 00 00 00       	mov    $0x25,%edx
 7d9:	8b 45 08             	mov    0x8(%ebp),%eax
 7dc:	e8 11 fe ff ff       	call   5f2 <putc>
        putc(fd, c);
 7e1:	89 fa                	mov    %edi,%edx
 7e3:	8b 45 08             	mov    0x8(%ebp),%eax
 7e6:	e8 07 fe ff ff       	call   5f2 <putc>
      state = 0;
 7eb:	be 00 00 00 00       	mov    $0x0,%esi
 7f0:	e9 ce fe ff ff       	jmp    6c3 <printf+0x2c>
    }
  }
}
 7f5:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7f8:	5b                   	pop    %ebx
 7f9:	5e                   	pop    %esi
 7fa:	5f                   	pop    %edi
 7fb:	5d                   	pop    %ebp
 7fc:	c3                   	ret    

000007fd <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7fd:	55                   	push   %ebp
 7fe:	89 e5                	mov    %esp,%ebp
 800:	57                   	push   %edi
 801:	56                   	push   %esi
 802:	53                   	push   %ebx
 803:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 806:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 809:	a1 60 0f 00 00       	mov    0xf60,%eax
 80e:	eb 02                	jmp    812 <free+0x15>
 810:	89 d0                	mov    %edx,%eax
 812:	39 c8                	cmp    %ecx,%eax
 814:	73 04                	jae    81a <free+0x1d>
 816:	39 08                	cmp    %ecx,(%eax)
 818:	77 12                	ja     82c <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 81a:	8b 10                	mov    (%eax),%edx
 81c:	39 c2                	cmp    %eax,%edx
 81e:	77 f0                	ja     810 <free+0x13>
 820:	39 c8                	cmp    %ecx,%eax
 822:	72 08                	jb     82c <free+0x2f>
 824:	39 ca                	cmp    %ecx,%edx
 826:	77 04                	ja     82c <free+0x2f>
 828:	89 d0                	mov    %edx,%eax
 82a:	eb e6                	jmp    812 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 82c:	8b 73 fc             	mov    -0x4(%ebx),%esi
 82f:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 832:	8b 10                	mov    (%eax),%edx
 834:	39 d7                	cmp    %edx,%edi
 836:	74 19                	je     851 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 838:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 83b:	8b 50 04             	mov    0x4(%eax),%edx
 83e:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 841:	39 ce                	cmp    %ecx,%esi
 843:	74 1b                	je     860 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 845:	89 08                	mov    %ecx,(%eax)
  freep = p;
 847:	a3 60 0f 00 00       	mov    %eax,0xf60
}
 84c:	5b                   	pop    %ebx
 84d:	5e                   	pop    %esi
 84e:	5f                   	pop    %edi
 84f:	5d                   	pop    %ebp
 850:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 851:	03 72 04             	add    0x4(%edx),%esi
 854:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 857:	8b 10                	mov    (%eax),%edx
 859:	8b 12                	mov    (%edx),%edx
 85b:	89 53 f8             	mov    %edx,-0x8(%ebx)
 85e:	eb db                	jmp    83b <free+0x3e>
    p->s.size += bp->s.size;
 860:	03 53 fc             	add    -0x4(%ebx),%edx
 863:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 866:	8b 53 f8             	mov    -0x8(%ebx),%edx
 869:	89 10                	mov    %edx,(%eax)
 86b:	eb da                	jmp    847 <free+0x4a>

0000086d <morecore>:

static Header*
morecore(uint nu)
{
 86d:	55                   	push   %ebp
 86e:	89 e5                	mov    %esp,%ebp
 870:	53                   	push   %ebx
 871:	83 ec 04             	sub    $0x4,%esp
 874:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 876:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 87b:	77 05                	ja     882 <morecore+0x15>
    nu = 4096;
 87d:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 882:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 889:	83 ec 0c             	sub    $0xc,%esp
 88c:	50                   	push   %eax
 88d:	e8 38 fd ff ff       	call   5ca <sbrk>
  if(p == (char*)-1)
 892:	83 c4 10             	add    $0x10,%esp
 895:	83 f8 ff             	cmp    $0xffffffff,%eax
 898:	74 1c                	je     8b6 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 89a:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 89d:	83 c0 08             	add    $0x8,%eax
 8a0:	83 ec 0c             	sub    $0xc,%esp
 8a3:	50                   	push   %eax
 8a4:	e8 54 ff ff ff       	call   7fd <free>
  return freep;
 8a9:	a1 60 0f 00 00       	mov    0xf60,%eax
 8ae:	83 c4 10             	add    $0x10,%esp
}
 8b1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8b4:	c9                   	leave  
 8b5:	c3                   	ret    
    return 0;
 8b6:	b8 00 00 00 00       	mov    $0x0,%eax
 8bb:	eb f4                	jmp    8b1 <morecore+0x44>

000008bd <malloc>:

void*
malloc(uint nbytes)
{
 8bd:	55                   	push   %ebp
 8be:	89 e5                	mov    %esp,%ebp
 8c0:	53                   	push   %ebx
 8c1:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8c4:	8b 45 08             	mov    0x8(%ebp),%eax
 8c7:	8d 58 07             	lea    0x7(%eax),%ebx
 8ca:	c1 eb 03             	shr    $0x3,%ebx
 8cd:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 8d0:	8b 0d 60 0f 00 00    	mov    0xf60,%ecx
 8d6:	85 c9                	test   %ecx,%ecx
 8d8:	74 04                	je     8de <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8da:	8b 01                	mov    (%ecx),%eax
 8dc:	eb 4a                	jmp    928 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 8de:	c7 05 60 0f 00 00 64 	movl   $0xf64,0xf60
 8e5:	0f 00 00 
 8e8:	c7 05 64 0f 00 00 64 	movl   $0xf64,0xf64
 8ef:	0f 00 00 
    base.s.size = 0;
 8f2:	c7 05 68 0f 00 00 00 	movl   $0x0,0xf68
 8f9:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 8fc:	b9 64 0f 00 00       	mov    $0xf64,%ecx
 901:	eb d7                	jmp    8da <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 903:	74 19                	je     91e <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 905:	29 da                	sub    %ebx,%edx
 907:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 90a:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 90d:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 910:	89 0d 60 0f 00 00    	mov    %ecx,0xf60
      return (void*)(p + 1);
 916:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 919:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 91c:	c9                   	leave  
 91d:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 91e:	8b 10                	mov    (%eax),%edx
 920:	89 11                	mov    %edx,(%ecx)
 922:	eb ec                	jmp    910 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 924:	89 c1                	mov    %eax,%ecx
 926:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 928:	8b 50 04             	mov    0x4(%eax),%edx
 92b:	39 da                	cmp    %ebx,%edx
 92d:	73 d4                	jae    903 <malloc+0x46>
    if(p == freep)
 92f:	39 05 60 0f 00 00    	cmp    %eax,0xf60
 935:	75 ed                	jne    924 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 937:	89 d8                	mov    %ebx,%eax
 939:	e8 2f ff ff ff       	call   86d <morecore>
 93e:	85 c0                	test   %eax,%eax
 940:	75 e2                	jne    924 <malloc+0x67>
 942:	eb d5                	jmp    919 <malloc+0x5c>
