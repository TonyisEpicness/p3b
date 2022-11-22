
_test_2:     file format elf32-i386


Disassembly of section .text:

00000000 <worker>:
   free(p);
   exit();
}

void
worker(void *arg1, void *arg2) {
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	53                   	push   %ebx
   4:	83 ec 04             	sub    $0x4,%esp
   7:	8b 55 08             	mov    0x8(%ebp),%edx
   a:	8b 45 0c             	mov    0xc(%ebp),%eax
   int tmp1 = *(int*)arg1;
   d:	8b 0a                	mov    (%edx),%ecx
   int tmp2 = *(int*)arg2;
   f:	8b 18                	mov    (%eax),%ebx
   *(int*)arg1 = 44;
  11:	c7 02 2c 00 00 00    	movl   $0x2c,(%edx)
   *(int*)arg2 = 55;
  17:	c7 00 37 00 00 00    	movl   $0x37,(%eax)
   assert(global == 1);
  1d:	a1 d8 0d 00 00       	mov    0xdd8,%eax
  22:	83 f8 01             	cmp    $0x1,%eax
  25:	74 49                	je     70 <worker+0x70>
  27:	6a 38                	push   $0x38
  29:	68 54 09 00 00       	push   $0x954
  2e:	68 5d 09 00 00       	push   $0x95d
  33:	6a 01                	push   $0x1
  35:	e8 6d 06 00 00       	call   6a7 <printf>
  3a:	83 c4 0c             	add    $0xc,%esp
  3d:	68 65 09 00 00       	push   $0x965
  42:	68 71 09 00 00       	push   $0x971
  47:	6a 01                	push   $0x1
  49:	e8 59 06 00 00       	call   6a7 <printf>
  4e:	83 c4 08             	add    $0x8,%esp
  51:	68 85 09 00 00       	push   $0x985
  56:	6a 01                	push   $0x1
  58:	e8 4a 06 00 00       	call   6a7 <printf>
  5d:	83 c4 04             	add    $0x4,%esp
  60:	ff 35 00 0e 00 00    	push   0xe00
  66:	e8 17 05 00 00       	call   582 <kill>
  6b:	e8 e2 04 00 00       	call   552 <exit>
   global = tmp1 + tmp2;
  70:	01 d9                	add    %ebx,%ecx
  72:	89 0d d8 0d 00 00    	mov    %ecx,0xdd8
   exit();
  78:	e8 d5 04 00 00       	call   552 <exit>

0000007d <main>:
{
  7d:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  81:	83 e4 f0             	and    $0xfffffff0,%esp
  84:	ff 71 fc             	push   -0x4(%ecx)
  87:	55                   	push   %ebp
  88:	89 e5                	mov    %esp,%ebp
  8a:	56                   	push   %esi
  8b:	53                   	push   %ebx
  8c:	51                   	push   %ecx
  8d:	83 ec 1c             	sub    $0x1c,%esp
   ppid = getpid();
  90:	e8 3d 05 00 00       	call   5d2 <getpid>
  95:	a3 00 0e 00 00       	mov    %eax,0xe00
   void *stack, *p = malloc(PGSIZE * 2);
  9a:	83 ec 0c             	sub    $0xc,%esp
  9d:	68 00 20 00 00       	push   $0x2000
  a2:	e8 26 08 00 00       	call   8cd <malloc>
   assert(p != NULL);
  a7:	83 c4 10             	add    $0x10,%esp
  aa:	85 c0                	test   %eax,%eax
  ac:	0f 84 a6 00 00 00    	je     158 <main+0xdb>
  b2:	89 c3                	mov    %eax,%ebx
   if((uint)p % PGSIZE)
  b4:	89 c2                	mov    %eax,%edx
  b6:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
  bc:	74 09                	je     c7 <main+0x4a>
     stack = p + (PGSIZE - (uint)p % PGSIZE);
  be:	b8 00 10 00 00       	mov    $0x1000,%eax
  c3:	29 d0                	sub    %edx,%eax
  c5:	01 d8                	add    %ebx,%eax
   int clone_pid = clone(worker, (void*)&arg1, (void*)&arg2, stack);
  c7:	50                   	push   %eax
  c8:	68 dc 0d 00 00       	push   $0xddc
  cd:	68 e0 0d 00 00       	push   $0xde0
  d2:	68 00 00 00 00       	push   $0x0
  d7:	e8 16 05 00 00       	call   5f2 <clone>
  dc:	89 c6                	mov    %eax,%esi
   assert(clone_pid > 0);
  de:	83 c4 10             	add    $0x10,%esp
  e1:	85 c0                	test   %eax,%eax
  e3:	0f 8e b8 00 00 00    	jle    1a1 <main+0x124>
   while(global != 33);
  e9:	a1 d8 0d 00 00       	mov    0xdd8,%eax
  ee:	83 f8 21             	cmp    $0x21,%eax
  f1:	75 f6                	jne    e9 <main+0x6c>
   assert(arg1 == 44);
  f3:	a1 e0 0d 00 00       	mov    0xde0,%eax
  f8:	83 f8 2c             	cmp    $0x2c,%eax
  fb:	0f 85 e9 00 00 00    	jne    1ea <main+0x16d>
   assert(arg2 == 55);
 101:	a1 dc 0d 00 00       	mov    0xddc,%eax
 106:	83 f8 37             	cmp    $0x37,%eax
 109:	0f 84 24 01 00 00    	je     233 <main+0x1b6>
 10f:	6a 28                	push   $0x28
 111:	68 54 09 00 00       	push   $0x954
 116:	68 5d 09 00 00       	push   $0x95d
 11b:	6a 01                	push   $0x1
 11d:	e8 85 05 00 00       	call   6a7 <printf>
 122:	83 c4 0c             	add    $0xc,%esp
 125:	68 b5 09 00 00       	push   $0x9b5
 12a:	68 71 09 00 00       	push   $0x971
 12f:	6a 01                	push   $0x1
 131:	e8 71 05 00 00       	call   6a7 <printf>
 136:	83 c4 08             	add    $0x8,%esp
 139:	68 85 09 00 00       	push   $0x985
 13e:	6a 01                	push   $0x1
 140:	e8 62 05 00 00       	call   6a7 <printf>
 145:	83 c4 04             	add    $0x4,%esp
 148:	ff 35 00 0e 00 00    	push   0xe00
 14e:	e8 2f 04 00 00       	call   582 <kill>
 153:	e8 fa 03 00 00       	call   552 <exit>
   assert(p != NULL);
 158:	6a 1e                	push   $0x1e
 15a:	68 54 09 00 00       	push   $0x954
 15f:	68 5d 09 00 00       	push   $0x95d
 164:	6a 01                	push   $0x1
 166:	e8 3c 05 00 00       	call   6a7 <printf>
 16b:	83 c4 0c             	add    $0xc,%esp
 16e:	68 92 09 00 00       	push   $0x992
 173:	68 71 09 00 00       	push   $0x971
 178:	6a 01                	push   $0x1
 17a:	e8 28 05 00 00       	call   6a7 <printf>
 17f:	83 c4 08             	add    $0x8,%esp
 182:	68 85 09 00 00       	push   $0x985
 187:	6a 01                	push   $0x1
 189:	e8 19 05 00 00       	call   6a7 <printf>
 18e:	83 c4 04             	add    $0x4,%esp
 191:	ff 35 00 0e 00 00    	push   0xe00
 197:	e8 e6 03 00 00       	call   582 <kill>
 19c:	e8 b1 03 00 00       	call   552 <exit>
   assert(clone_pid > 0);
 1a1:	6a 25                	push   $0x25
 1a3:	68 54 09 00 00       	push   $0x954
 1a8:	68 5d 09 00 00       	push   $0x95d
 1ad:	6a 01                	push   $0x1
 1af:	e8 f3 04 00 00       	call   6a7 <printf>
 1b4:	83 c4 0c             	add    $0xc,%esp
 1b7:	68 9c 09 00 00       	push   $0x99c
 1bc:	68 71 09 00 00       	push   $0x971
 1c1:	6a 01                	push   $0x1
 1c3:	e8 df 04 00 00       	call   6a7 <printf>
 1c8:	83 c4 08             	add    $0x8,%esp
 1cb:	68 85 09 00 00       	push   $0x985
 1d0:	6a 01                	push   $0x1
 1d2:	e8 d0 04 00 00       	call   6a7 <printf>
 1d7:	83 c4 04             	add    $0x4,%esp
 1da:	ff 35 00 0e 00 00    	push   0xe00
 1e0:	e8 9d 03 00 00       	call   582 <kill>
 1e5:	e8 68 03 00 00       	call   552 <exit>
   assert(arg1 == 44);
 1ea:	6a 27                	push   $0x27
 1ec:	68 54 09 00 00       	push   $0x954
 1f1:	68 5d 09 00 00       	push   $0x95d
 1f6:	6a 01                	push   $0x1
 1f8:	e8 aa 04 00 00       	call   6a7 <printf>
 1fd:	83 c4 0c             	add    $0xc,%esp
 200:	68 aa 09 00 00       	push   $0x9aa
 205:	68 71 09 00 00       	push   $0x971
 20a:	6a 01                	push   $0x1
 20c:	e8 96 04 00 00       	call   6a7 <printf>
 211:	83 c4 08             	add    $0x8,%esp
 214:	68 85 09 00 00       	push   $0x985
 219:	6a 01                	push   $0x1
 21b:	e8 87 04 00 00       	call   6a7 <printf>
 220:	83 c4 04             	add    $0x4,%esp
 223:	ff 35 00 0e 00 00    	push   0xe00
 229:	e8 54 03 00 00       	call   582 <kill>
 22e:	e8 1f 03 00 00       	call   552 <exit>
   printf(1, "TEST PASSED\n");
 233:	83 ec 08             	sub    $0x8,%esp
 236:	68 c0 09 00 00       	push   $0x9c0
 23b:	6a 01                	push   $0x1
 23d:	e8 65 04 00 00       	call   6a7 <printf>
   int join_pid = join(&join_stack);
 242:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 245:	89 04 24             	mov    %eax,(%esp)
 248:	e8 ad 03 00 00       	call   5fa <join>
   assert(join_pid == clone_pid);
 24d:	83 c4 10             	add    $0x10,%esp
 250:	39 c6                	cmp    %eax,%esi
 252:	74 49                	je     29d <main+0x220>
 254:	6a 2d                	push   $0x2d
 256:	68 54 09 00 00       	push   $0x954
 25b:	68 5d 09 00 00       	push   $0x95d
 260:	6a 01                	push   $0x1
 262:	e8 40 04 00 00       	call   6a7 <printf>
 267:	83 c4 0c             	add    $0xc,%esp
 26a:	68 cd 09 00 00       	push   $0x9cd
 26f:	68 71 09 00 00       	push   $0x971
 274:	6a 01                	push   $0x1
 276:	e8 2c 04 00 00       	call   6a7 <printf>
 27b:	83 c4 08             	add    $0x8,%esp
 27e:	68 85 09 00 00       	push   $0x985
 283:	6a 01                	push   $0x1
 285:	e8 1d 04 00 00       	call   6a7 <printf>
 28a:	83 c4 04             	add    $0x4,%esp
 28d:	ff 35 00 0e 00 00    	push   0xe00
 293:	e8 ea 02 00 00       	call   582 <kill>
 298:	e8 b5 02 00 00       	call   552 <exit>
   free(p);
 29d:	83 ec 0c             	sub    $0xc,%esp
 2a0:	53                   	push   %ebx
 2a1:	e8 67 05 00 00       	call   80d <free>
   exit();
 2a6:	e8 a7 02 00 00       	call   552 <exit>

000002ab <test_and_set>:
  int flag;
};

struct thread_ref *threads[64];

int test_and_set(int *old_ptr, int new_ptr) {
 2ab:	55                   	push   %ebp
 2ac:	89 e5                	mov    %esp,%ebp
 2ae:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *old_ptr;
 2b1:	8b 10                	mov    (%eax),%edx
  *old_ptr = new_ptr;
 2b3:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 2b6:	89 08                	mov    %ecx,(%eax)
  return old;
}
 2b8:	89 d0                	mov    %edx,%eax
 2ba:	5d                   	pop    %ebp
 2bb:	c3                   	ret    

000002bc <thread_create>:

// a wrapper func for clone
int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 2bc:	55                   	push   %ebp
 2bd:	89 e5                	mov    %esp,%ebp
 2bf:	83 ec 14             	sub    $0x14,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE*2);
 2c2:	68 00 20 00 00       	push   $0x2000
 2c7:	e8 01 06 00 00       	call   8cd <malloc>
  if(n_stack == 0){
 2cc:	83 c4 10             	add    $0x10,%esp
 2cf:	85 c0                	test   %eax,%eax
 2d1:	74 4a                	je     31d <thread_create+0x61>
    return -1;
  }
  
  for(int i=0; i<64; i++){
 2d3:	ba 00 00 00 00       	mov    $0x0,%edx
 2d8:	eb 03                	jmp    2dd <thread_create+0x21>
 2da:	83 c2 01             	add    $0x1,%edx
 2dd:	83 fa 3f             	cmp    $0x3f,%edx
 2e0:	7f 27                	jg     309 <thread_create+0x4d>
    if(threads[i]->flag==0){
 2e2:	8b 0c 95 20 0e 00 00 	mov    0xe20(,%edx,4),%ecx
 2e9:	83 79 08 00          	cmpl   $0x0,0x8(%ecx)
 2ed:	75 eb                	jne    2da <thread_create+0x1e>
      threads[i]->maddr = n_stack;
 2ef:	89 01                	mov    %eax,(%ecx)
      threads[i]->pg1addr = n_stack;
 2f1:	8b 0c 95 20 0e 00 00 	mov    0xe20(,%edx,4),%ecx
 2f8:	89 41 04             	mov    %eax,0x4(%ecx)
      threads[i]->flag = 1;
 2fb:	8b 14 95 20 0e 00 00 	mov    0xe20(,%edx,4),%edx
 302:	c7 42 08 01 00 00 00 	movl   $0x1,0x8(%edx)
      break;
    }
  }
  
  int new_pid = clone(start_routine, arg1, arg2, n_stack); // TODO: is this the right way to call it?
 309:	50                   	push   %eax
 30a:	ff 75 10             	push   0x10(%ebp)
 30d:	ff 75 0c             	push   0xc(%ebp)
 310:	ff 75 08             	push   0x8(%ebp)
 313:	e8 da 02 00 00       	call   5f2 <clone>

  // I can't remember if there was something else to do here but I'm sure I'll find out



  return new_pid;
 318:	83 c4 10             	add    $0x10,%esp
}
 31b:	c9                   	leave  
 31c:	c3                   	ret    
    return -1;
 31d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 322:	eb f7                	jmp    31b <thread_create+0x5f>

00000324 <thread_join>:

//TODO: fix
int thread_join() {
 324:	55                   	push   %ebp
 325:	89 e5                	mov    %esp,%ebp
 327:	56                   	push   %esi
 328:	53                   	push   %ebx
 329:	83 ec 1c             	sub    $0x1c,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 32c:	8d 45 f4             	lea    -0xc(%ebp),%eax
 32f:	50                   	push   %eax
 330:	e8 c5 02 00 00       	call   5fa <join>
 335:	89 c6                	mov    %eax,%esi
  for(int i=0; i<64; i++){
 337:	83 c4 10             	add    $0x10,%esp
 33a:	bb 00 00 00 00       	mov    $0x0,%ebx
 33f:	eb 03                	jmp    344 <thread_join+0x20>
 341:	83 c3 01             	add    $0x1,%ebx
 344:	83 fb 3f             	cmp    $0x3f,%ebx
 347:	7f 23                	jg     36c <thread_join+0x48>
    if((threads[i]->flag==1) && (stk_addr == threads[i]->pg1addr)){
 349:	8b 04 9d 20 0e 00 00 	mov    0xe20(,%ebx,4),%eax
 350:	83 78 08 01          	cmpl   $0x1,0x8(%eax)
 354:	75 eb                	jne    341 <thread_join+0x1d>
 356:	8b 55 f4             	mov    -0xc(%ebp),%edx
 359:	39 50 04             	cmp    %edx,0x4(%eax)
 35c:	75 e3                	jne    341 <thread_join+0x1d>
      free(stk_addr);
 35e:	83 ec 0c             	sub    $0xc,%esp
 361:	52                   	push   %edx
 362:	e8 a6 04 00 00       	call   80d <free>
 367:	83 c4 10             	add    $0x10,%esp
 36a:	eb d5                	jmp    341 <thread_join+0x1d>
    }
  }
  return pid;
}
 36c:	89 f0                	mov    %esi,%eax
 36e:	8d 65 f8             	lea    -0x8(%ebp),%esp
 371:	5b                   	pop    %ebx
 372:	5e                   	pop    %esi
 373:	5d                   	pop    %ebp
 374:	c3                   	ret    

00000375 <lock_acquire>:

void lock_acquire(lock_t *lock){
 375:	55                   	push   %ebp
 376:	89 e5                	mov    %esp,%ebp
 378:	53                   	push   %ebx
 379:	83 ec 04             	sub    $0x4,%esp
 37c:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 37f:	83 ec 08             	sub    $0x8,%esp
 382:	6a 01                	push   $0x1
 384:	53                   	push   %ebx
 385:	e8 21 ff ff ff       	call   2ab <test_and_set>
 38a:	83 c4 10             	add    $0x10,%esp
 38d:	83 f8 01             	cmp    $0x1,%eax
 390:	74 ed                	je     37f <lock_acquire+0xa>
    ;
}
 392:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 395:	c9                   	leave  
 396:	c3                   	ret    

00000397 <lock_release>:

void lock_release(lock_t *lock) {
 397:	55                   	push   %ebp
 398:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 39a:	8b 45 08             	mov    0x8(%ebp),%eax
 39d:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 3a3:	5d                   	pop    %ebp
 3a4:	c3                   	ret    

000003a5 <lock_init>:

void lock_init(lock_t *lock) {
 3a5:	55                   	push   %ebp
 3a6:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 3a8:	8b 45 08             	mov    0x8(%ebp),%eax
 3ab:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 3b1:	5d                   	pop    %ebp
 3b2:	c3                   	ret    

000003b3 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 3b3:	55                   	push   %ebp
 3b4:	89 e5                	mov    %esp,%ebp
 3b6:	56                   	push   %esi
 3b7:	53                   	push   %ebx
 3b8:	8b 75 08             	mov    0x8(%ebp),%esi
 3bb:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 3be:	89 f0                	mov    %esi,%eax
 3c0:	89 d1                	mov    %edx,%ecx
 3c2:	83 c2 01             	add    $0x1,%edx
 3c5:	89 c3                	mov    %eax,%ebx
 3c7:	83 c0 01             	add    $0x1,%eax
 3ca:	0f b6 09             	movzbl (%ecx),%ecx
 3cd:	88 0b                	mov    %cl,(%ebx)
 3cf:	84 c9                	test   %cl,%cl
 3d1:	75 ed                	jne    3c0 <strcpy+0xd>
    ;
  return os;
}
 3d3:	89 f0                	mov    %esi,%eax
 3d5:	5b                   	pop    %ebx
 3d6:	5e                   	pop    %esi
 3d7:	5d                   	pop    %ebp
 3d8:	c3                   	ret    

000003d9 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 3d9:	55                   	push   %ebp
 3da:	89 e5                	mov    %esp,%ebp
 3dc:	8b 4d 08             	mov    0x8(%ebp),%ecx
 3df:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 3e2:	eb 06                	jmp    3ea <strcmp+0x11>
    p++, q++;
 3e4:	83 c1 01             	add    $0x1,%ecx
 3e7:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 3ea:	0f b6 01             	movzbl (%ecx),%eax
 3ed:	84 c0                	test   %al,%al
 3ef:	74 04                	je     3f5 <strcmp+0x1c>
 3f1:	3a 02                	cmp    (%edx),%al
 3f3:	74 ef                	je     3e4 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 3f5:	0f b6 c0             	movzbl %al,%eax
 3f8:	0f b6 12             	movzbl (%edx),%edx
 3fb:	29 d0                	sub    %edx,%eax
}
 3fd:	5d                   	pop    %ebp
 3fe:	c3                   	ret    

000003ff <strlen>:

uint
strlen(const char *s)
{
 3ff:	55                   	push   %ebp
 400:	89 e5                	mov    %esp,%ebp
 402:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 405:	b8 00 00 00 00       	mov    $0x0,%eax
 40a:	eb 03                	jmp    40f <strlen+0x10>
 40c:	83 c0 01             	add    $0x1,%eax
 40f:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 413:	75 f7                	jne    40c <strlen+0xd>
    ;
  return n;
}
 415:	5d                   	pop    %ebp
 416:	c3                   	ret    

00000417 <memset>:

void*
memset(void *dst, int c, uint n)
{
 417:	55                   	push   %ebp
 418:	89 e5                	mov    %esp,%ebp
 41a:	57                   	push   %edi
 41b:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 41e:	89 d7                	mov    %edx,%edi
 420:	8b 4d 10             	mov    0x10(%ebp),%ecx
 423:	8b 45 0c             	mov    0xc(%ebp),%eax
 426:	fc                   	cld    
 427:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 429:	89 d0                	mov    %edx,%eax
 42b:	8b 7d fc             	mov    -0x4(%ebp),%edi
 42e:	c9                   	leave  
 42f:	c3                   	ret    

00000430 <strchr>:

char*
strchr(const char *s, char c)
{
 430:	55                   	push   %ebp
 431:	89 e5                	mov    %esp,%ebp
 433:	8b 45 08             	mov    0x8(%ebp),%eax
 436:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 43a:	eb 03                	jmp    43f <strchr+0xf>
 43c:	83 c0 01             	add    $0x1,%eax
 43f:	0f b6 10             	movzbl (%eax),%edx
 442:	84 d2                	test   %dl,%dl
 444:	74 06                	je     44c <strchr+0x1c>
    if(*s == c)
 446:	38 ca                	cmp    %cl,%dl
 448:	75 f2                	jne    43c <strchr+0xc>
 44a:	eb 05                	jmp    451 <strchr+0x21>
      return (char*)s;
  return 0;
 44c:	b8 00 00 00 00       	mov    $0x0,%eax
}
 451:	5d                   	pop    %ebp
 452:	c3                   	ret    

00000453 <gets>:

char*
gets(char *buf, int max)
{
 453:	55                   	push   %ebp
 454:	89 e5                	mov    %esp,%ebp
 456:	57                   	push   %edi
 457:	56                   	push   %esi
 458:	53                   	push   %ebx
 459:	83 ec 1c             	sub    $0x1c,%esp
 45c:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 45f:	bb 00 00 00 00       	mov    $0x0,%ebx
 464:	89 de                	mov    %ebx,%esi
 466:	83 c3 01             	add    $0x1,%ebx
 469:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 46c:	7d 2e                	jge    49c <gets+0x49>
    cc = read(0, &c, 1);
 46e:	83 ec 04             	sub    $0x4,%esp
 471:	6a 01                	push   $0x1
 473:	8d 45 e7             	lea    -0x19(%ebp),%eax
 476:	50                   	push   %eax
 477:	6a 00                	push   $0x0
 479:	e8 ec 00 00 00       	call   56a <read>
    if(cc < 1)
 47e:	83 c4 10             	add    $0x10,%esp
 481:	85 c0                	test   %eax,%eax
 483:	7e 17                	jle    49c <gets+0x49>
      break;
    buf[i++] = c;
 485:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 489:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 48c:	3c 0a                	cmp    $0xa,%al
 48e:	0f 94 c2             	sete   %dl
 491:	3c 0d                	cmp    $0xd,%al
 493:	0f 94 c0             	sete   %al
 496:	08 c2                	or     %al,%dl
 498:	74 ca                	je     464 <gets+0x11>
    buf[i++] = c;
 49a:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 49c:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 4a0:	89 f8                	mov    %edi,%eax
 4a2:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4a5:	5b                   	pop    %ebx
 4a6:	5e                   	pop    %esi
 4a7:	5f                   	pop    %edi
 4a8:	5d                   	pop    %ebp
 4a9:	c3                   	ret    

000004aa <stat>:

int
stat(const char *n, struct stat *st)
{
 4aa:	55                   	push   %ebp
 4ab:	89 e5                	mov    %esp,%ebp
 4ad:	56                   	push   %esi
 4ae:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4af:	83 ec 08             	sub    $0x8,%esp
 4b2:	6a 00                	push   $0x0
 4b4:	ff 75 08             	push   0x8(%ebp)
 4b7:	e8 d6 00 00 00       	call   592 <open>
  if(fd < 0)
 4bc:	83 c4 10             	add    $0x10,%esp
 4bf:	85 c0                	test   %eax,%eax
 4c1:	78 24                	js     4e7 <stat+0x3d>
 4c3:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 4c5:	83 ec 08             	sub    $0x8,%esp
 4c8:	ff 75 0c             	push   0xc(%ebp)
 4cb:	50                   	push   %eax
 4cc:	e8 d9 00 00 00       	call   5aa <fstat>
 4d1:	89 c6                	mov    %eax,%esi
  close(fd);
 4d3:	89 1c 24             	mov    %ebx,(%esp)
 4d6:	e8 9f 00 00 00       	call   57a <close>
  return r;
 4db:	83 c4 10             	add    $0x10,%esp
}
 4de:	89 f0                	mov    %esi,%eax
 4e0:	8d 65 f8             	lea    -0x8(%ebp),%esp
 4e3:	5b                   	pop    %ebx
 4e4:	5e                   	pop    %esi
 4e5:	5d                   	pop    %ebp
 4e6:	c3                   	ret    
    return -1;
 4e7:	be ff ff ff ff       	mov    $0xffffffff,%esi
 4ec:	eb f0                	jmp    4de <stat+0x34>

000004ee <atoi>:

int
atoi(const char *s)
{
 4ee:	55                   	push   %ebp
 4ef:	89 e5                	mov    %esp,%ebp
 4f1:	53                   	push   %ebx
 4f2:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 4f5:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 4fa:	eb 10                	jmp    50c <atoi+0x1e>
    n = n*10 + *s++ - '0';
 4fc:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 4ff:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 502:	83 c1 01             	add    $0x1,%ecx
 505:	0f be c0             	movsbl %al,%eax
 508:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 50c:	0f b6 01             	movzbl (%ecx),%eax
 50f:	8d 58 d0             	lea    -0x30(%eax),%ebx
 512:	80 fb 09             	cmp    $0x9,%bl
 515:	76 e5                	jbe    4fc <atoi+0xe>
  return n;
}
 517:	89 d0                	mov    %edx,%eax
 519:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 51c:	c9                   	leave  
 51d:	c3                   	ret    

0000051e <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 51e:	55                   	push   %ebp
 51f:	89 e5                	mov    %esp,%ebp
 521:	56                   	push   %esi
 522:	53                   	push   %ebx
 523:	8b 75 08             	mov    0x8(%ebp),%esi
 526:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 529:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 52c:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 52e:	eb 0d                	jmp    53d <memmove+0x1f>
    *dst++ = *src++;
 530:	0f b6 01             	movzbl (%ecx),%eax
 533:	88 02                	mov    %al,(%edx)
 535:	8d 49 01             	lea    0x1(%ecx),%ecx
 538:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 53b:	89 d8                	mov    %ebx,%eax
 53d:	8d 58 ff             	lea    -0x1(%eax),%ebx
 540:	85 c0                	test   %eax,%eax
 542:	7f ec                	jg     530 <memmove+0x12>
  return vdst;
}
 544:	89 f0                	mov    %esi,%eax
 546:	5b                   	pop    %ebx
 547:	5e                   	pop    %esi
 548:	5d                   	pop    %ebp
 549:	c3                   	ret    

0000054a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 54a:	b8 01 00 00 00       	mov    $0x1,%eax
 54f:	cd 40                	int    $0x40
 551:	c3                   	ret    

00000552 <exit>:
SYSCALL(exit)
 552:	b8 02 00 00 00       	mov    $0x2,%eax
 557:	cd 40                	int    $0x40
 559:	c3                   	ret    

0000055a <wait>:
SYSCALL(wait)
 55a:	b8 03 00 00 00       	mov    $0x3,%eax
 55f:	cd 40                	int    $0x40
 561:	c3                   	ret    

00000562 <pipe>:
SYSCALL(pipe)
 562:	b8 04 00 00 00       	mov    $0x4,%eax
 567:	cd 40                	int    $0x40
 569:	c3                   	ret    

0000056a <read>:
SYSCALL(read)
 56a:	b8 05 00 00 00       	mov    $0x5,%eax
 56f:	cd 40                	int    $0x40
 571:	c3                   	ret    

00000572 <write>:
SYSCALL(write)
 572:	b8 10 00 00 00       	mov    $0x10,%eax
 577:	cd 40                	int    $0x40
 579:	c3                   	ret    

0000057a <close>:
SYSCALL(close)
 57a:	b8 15 00 00 00       	mov    $0x15,%eax
 57f:	cd 40                	int    $0x40
 581:	c3                   	ret    

00000582 <kill>:
SYSCALL(kill)
 582:	b8 06 00 00 00       	mov    $0x6,%eax
 587:	cd 40                	int    $0x40
 589:	c3                   	ret    

0000058a <exec>:
SYSCALL(exec)
 58a:	b8 07 00 00 00       	mov    $0x7,%eax
 58f:	cd 40                	int    $0x40
 591:	c3                   	ret    

00000592 <open>:
SYSCALL(open)
 592:	b8 0f 00 00 00       	mov    $0xf,%eax
 597:	cd 40                	int    $0x40
 599:	c3                   	ret    

0000059a <mknod>:
SYSCALL(mknod)
 59a:	b8 11 00 00 00       	mov    $0x11,%eax
 59f:	cd 40                	int    $0x40
 5a1:	c3                   	ret    

000005a2 <unlink>:
SYSCALL(unlink)
 5a2:	b8 12 00 00 00       	mov    $0x12,%eax
 5a7:	cd 40                	int    $0x40
 5a9:	c3                   	ret    

000005aa <fstat>:
SYSCALL(fstat)
 5aa:	b8 08 00 00 00       	mov    $0x8,%eax
 5af:	cd 40                	int    $0x40
 5b1:	c3                   	ret    

000005b2 <link>:
SYSCALL(link)
 5b2:	b8 13 00 00 00       	mov    $0x13,%eax
 5b7:	cd 40                	int    $0x40
 5b9:	c3                   	ret    

000005ba <mkdir>:
SYSCALL(mkdir)
 5ba:	b8 14 00 00 00       	mov    $0x14,%eax
 5bf:	cd 40                	int    $0x40
 5c1:	c3                   	ret    

000005c2 <chdir>:
SYSCALL(chdir)
 5c2:	b8 09 00 00 00       	mov    $0x9,%eax
 5c7:	cd 40                	int    $0x40
 5c9:	c3                   	ret    

000005ca <dup>:
SYSCALL(dup)
 5ca:	b8 0a 00 00 00       	mov    $0xa,%eax
 5cf:	cd 40                	int    $0x40
 5d1:	c3                   	ret    

000005d2 <getpid>:
SYSCALL(getpid)
 5d2:	b8 0b 00 00 00       	mov    $0xb,%eax
 5d7:	cd 40                	int    $0x40
 5d9:	c3                   	ret    

000005da <sbrk>:
SYSCALL(sbrk)
 5da:	b8 0c 00 00 00       	mov    $0xc,%eax
 5df:	cd 40                	int    $0x40
 5e1:	c3                   	ret    

000005e2 <sleep>:
SYSCALL(sleep)
 5e2:	b8 0d 00 00 00       	mov    $0xd,%eax
 5e7:	cd 40                	int    $0x40
 5e9:	c3                   	ret    

000005ea <uptime>:
SYSCALL(uptime)
 5ea:	b8 0e 00 00 00       	mov    $0xe,%eax
 5ef:	cd 40                	int    $0x40
 5f1:	c3                   	ret    

000005f2 <clone>:
SYSCALL(clone)
 5f2:	b8 16 00 00 00       	mov    $0x16,%eax
 5f7:	cd 40                	int    $0x40
 5f9:	c3                   	ret    

000005fa <join>:
 5fa:	b8 17 00 00 00       	mov    $0x17,%eax
 5ff:	cd 40                	int    $0x40
 601:	c3                   	ret    

00000602 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 602:	55                   	push   %ebp
 603:	89 e5                	mov    %esp,%ebp
 605:	83 ec 1c             	sub    $0x1c,%esp
 608:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 60b:	6a 01                	push   $0x1
 60d:	8d 55 f4             	lea    -0xc(%ebp),%edx
 610:	52                   	push   %edx
 611:	50                   	push   %eax
 612:	e8 5b ff ff ff       	call   572 <write>
}
 617:	83 c4 10             	add    $0x10,%esp
 61a:	c9                   	leave  
 61b:	c3                   	ret    

0000061c <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 61c:	55                   	push   %ebp
 61d:	89 e5                	mov    %esp,%ebp
 61f:	57                   	push   %edi
 620:	56                   	push   %esi
 621:	53                   	push   %ebx
 622:	83 ec 2c             	sub    $0x2c,%esp
 625:	89 45 d0             	mov    %eax,-0x30(%ebp)
 628:	89 d0                	mov    %edx,%eax
 62a:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 62c:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 630:	0f 95 c1             	setne  %cl
 633:	c1 ea 1f             	shr    $0x1f,%edx
 636:	84 d1                	test   %dl,%cl
 638:	74 44                	je     67e <printint+0x62>
    neg = 1;
    x = -xx;
 63a:	f7 d8                	neg    %eax
 63c:	89 c1                	mov    %eax,%ecx
    neg = 1;
 63e:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 645:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 64a:	89 c8                	mov    %ecx,%eax
 64c:	ba 00 00 00 00       	mov    $0x0,%edx
 651:	f7 f6                	div    %esi
 653:	89 df                	mov    %ebx,%edi
 655:	83 c3 01             	add    $0x1,%ebx
 658:	0f b6 92 44 0a 00 00 	movzbl 0xa44(%edx),%edx
 65f:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 663:	89 ca                	mov    %ecx,%edx
 665:	89 c1                	mov    %eax,%ecx
 667:	39 d6                	cmp    %edx,%esi
 669:	76 df                	jbe    64a <printint+0x2e>
  if(neg)
 66b:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 66f:	74 31                	je     6a2 <printint+0x86>
    buf[i++] = '-';
 671:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 676:	8d 5f 02             	lea    0x2(%edi),%ebx
 679:	8b 75 d0             	mov    -0x30(%ebp),%esi
 67c:	eb 17                	jmp    695 <printint+0x79>
    x = xx;
 67e:	89 c1                	mov    %eax,%ecx
  neg = 0;
 680:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 687:	eb bc                	jmp    645 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 689:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 68e:	89 f0                	mov    %esi,%eax
 690:	e8 6d ff ff ff       	call   602 <putc>
  while(--i >= 0)
 695:	83 eb 01             	sub    $0x1,%ebx
 698:	79 ef                	jns    689 <printint+0x6d>
}
 69a:	83 c4 2c             	add    $0x2c,%esp
 69d:	5b                   	pop    %ebx
 69e:	5e                   	pop    %esi
 69f:	5f                   	pop    %edi
 6a0:	5d                   	pop    %ebp
 6a1:	c3                   	ret    
 6a2:	8b 75 d0             	mov    -0x30(%ebp),%esi
 6a5:	eb ee                	jmp    695 <printint+0x79>

000006a7 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 6a7:	55                   	push   %ebp
 6a8:	89 e5                	mov    %esp,%ebp
 6aa:	57                   	push   %edi
 6ab:	56                   	push   %esi
 6ac:	53                   	push   %ebx
 6ad:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 6b0:	8d 45 10             	lea    0x10(%ebp),%eax
 6b3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 6b6:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 6bb:	bb 00 00 00 00       	mov    $0x0,%ebx
 6c0:	eb 14                	jmp    6d6 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 6c2:	89 fa                	mov    %edi,%edx
 6c4:	8b 45 08             	mov    0x8(%ebp),%eax
 6c7:	e8 36 ff ff ff       	call   602 <putc>
 6cc:	eb 05                	jmp    6d3 <printf+0x2c>
      }
    } else if(state == '%'){
 6ce:	83 fe 25             	cmp    $0x25,%esi
 6d1:	74 25                	je     6f8 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 6d3:	83 c3 01             	add    $0x1,%ebx
 6d6:	8b 45 0c             	mov    0xc(%ebp),%eax
 6d9:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 6dd:	84 c0                	test   %al,%al
 6df:	0f 84 20 01 00 00    	je     805 <printf+0x15e>
    c = fmt[i] & 0xff;
 6e5:	0f be f8             	movsbl %al,%edi
 6e8:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 6eb:	85 f6                	test   %esi,%esi
 6ed:	75 df                	jne    6ce <printf+0x27>
      if(c == '%'){
 6ef:	83 f8 25             	cmp    $0x25,%eax
 6f2:	75 ce                	jne    6c2 <printf+0x1b>
        state = '%';
 6f4:	89 c6                	mov    %eax,%esi
 6f6:	eb db                	jmp    6d3 <printf+0x2c>
      if(c == 'd'){
 6f8:	83 f8 25             	cmp    $0x25,%eax
 6fb:	0f 84 cf 00 00 00    	je     7d0 <printf+0x129>
 701:	0f 8c dd 00 00 00    	jl     7e4 <printf+0x13d>
 707:	83 f8 78             	cmp    $0x78,%eax
 70a:	0f 8f d4 00 00 00    	jg     7e4 <printf+0x13d>
 710:	83 f8 63             	cmp    $0x63,%eax
 713:	0f 8c cb 00 00 00    	jl     7e4 <printf+0x13d>
 719:	83 e8 63             	sub    $0x63,%eax
 71c:	83 f8 15             	cmp    $0x15,%eax
 71f:	0f 87 bf 00 00 00    	ja     7e4 <printf+0x13d>
 725:	ff 24 85 ec 09 00 00 	jmp    *0x9ec(,%eax,4)
        printint(fd, *ap, 10, 1);
 72c:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 72f:	8b 17                	mov    (%edi),%edx
 731:	83 ec 0c             	sub    $0xc,%esp
 734:	6a 01                	push   $0x1
 736:	b9 0a 00 00 00       	mov    $0xa,%ecx
 73b:	8b 45 08             	mov    0x8(%ebp),%eax
 73e:	e8 d9 fe ff ff       	call   61c <printint>
        ap++;
 743:	83 c7 04             	add    $0x4,%edi
 746:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 749:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 74c:	be 00 00 00 00       	mov    $0x0,%esi
 751:	eb 80                	jmp    6d3 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 753:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 756:	8b 17                	mov    (%edi),%edx
 758:	83 ec 0c             	sub    $0xc,%esp
 75b:	6a 00                	push   $0x0
 75d:	b9 10 00 00 00       	mov    $0x10,%ecx
 762:	8b 45 08             	mov    0x8(%ebp),%eax
 765:	e8 b2 fe ff ff       	call   61c <printint>
        ap++;
 76a:	83 c7 04             	add    $0x4,%edi
 76d:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 770:	83 c4 10             	add    $0x10,%esp
      state = 0;
 773:	be 00 00 00 00       	mov    $0x0,%esi
 778:	e9 56 ff ff ff       	jmp    6d3 <printf+0x2c>
        s = (char*)*ap;
 77d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 780:	8b 30                	mov    (%eax),%esi
        ap++;
 782:	83 c0 04             	add    $0x4,%eax
 785:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 788:	85 f6                	test   %esi,%esi
 78a:	75 15                	jne    7a1 <printf+0xfa>
          s = "(null)";
 78c:	be e3 09 00 00       	mov    $0x9e3,%esi
 791:	eb 0e                	jmp    7a1 <printf+0xfa>
          putc(fd, *s);
 793:	0f be d2             	movsbl %dl,%edx
 796:	8b 45 08             	mov    0x8(%ebp),%eax
 799:	e8 64 fe ff ff       	call   602 <putc>
          s++;
 79e:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 7a1:	0f b6 16             	movzbl (%esi),%edx
 7a4:	84 d2                	test   %dl,%dl
 7a6:	75 eb                	jne    793 <printf+0xec>
      state = 0;
 7a8:	be 00 00 00 00       	mov    $0x0,%esi
 7ad:	e9 21 ff ff ff       	jmp    6d3 <printf+0x2c>
        putc(fd, *ap);
 7b2:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7b5:	0f be 17             	movsbl (%edi),%edx
 7b8:	8b 45 08             	mov    0x8(%ebp),%eax
 7bb:	e8 42 fe ff ff       	call   602 <putc>
        ap++;
 7c0:	83 c7 04             	add    $0x4,%edi
 7c3:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 7c6:	be 00 00 00 00       	mov    $0x0,%esi
 7cb:	e9 03 ff ff ff       	jmp    6d3 <printf+0x2c>
        putc(fd, c);
 7d0:	89 fa                	mov    %edi,%edx
 7d2:	8b 45 08             	mov    0x8(%ebp),%eax
 7d5:	e8 28 fe ff ff       	call   602 <putc>
      state = 0;
 7da:	be 00 00 00 00       	mov    $0x0,%esi
 7df:	e9 ef fe ff ff       	jmp    6d3 <printf+0x2c>
        putc(fd, '%');
 7e4:	ba 25 00 00 00       	mov    $0x25,%edx
 7e9:	8b 45 08             	mov    0x8(%ebp),%eax
 7ec:	e8 11 fe ff ff       	call   602 <putc>
        putc(fd, c);
 7f1:	89 fa                	mov    %edi,%edx
 7f3:	8b 45 08             	mov    0x8(%ebp),%eax
 7f6:	e8 07 fe ff ff       	call   602 <putc>
      state = 0;
 7fb:	be 00 00 00 00       	mov    $0x0,%esi
 800:	e9 ce fe ff ff       	jmp    6d3 <printf+0x2c>
    }
  }
}
 805:	8d 65 f4             	lea    -0xc(%ebp),%esp
 808:	5b                   	pop    %ebx
 809:	5e                   	pop    %esi
 80a:	5f                   	pop    %edi
 80b:	5d                   	pop    %ebp
 80c:	c3                   	ret    

0000080d <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 80d:	55                   	push   %ebp
 80e:	89 e5                	mov    %esp,%ebp
 810:	57                   	push   %edi
 811:	56                   	push   %esi
 812:	53                   	push   %ebx
 813:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 816:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 819:	a1 20 0f 00 00       	mov    0xf20,%eax
 81e:	eb 02                	jmp    822 <free+0x15>
 820:	89 d0                	mov    %edx,%eax
 822:	39 c8                	cmp    %ecx,%eax
 824:	73 04                	jae    82a <free+0x1d>
 826:	39 08                	cmp    %ecx,(%eax)
 828:	77 12                	ja     83c <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 82a:	8b 10                	mov    (%eax),%edx
 82c:	39 c2                	cmp    %eax,%edx
 82e:	77 f0                	ja     820 <free+0x13>
 830:	39 c8                	cmp    %ecx,%eax
 832:	72 08                	jb     83c <free+0x2f>
 834:	39 ca                	cmp    %ecx,%edx
 836:	77 04                	ja     83c <free+0x2f>
 838:	89 d0                	mov    %edx,%eax
 83a:	eb e6                	jmp    822 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 83c:	8b 73 fc             	mov    -0x4(%ebx),%esi
 83f:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 842:	8b 10                	mov    (%eax),%edx
 844:	39 d7                	cmp    %edx,%edi
 846:	74 19                	je     861 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 848:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 84b:	8b 50 04             	mov    0x4(%eax),%edx
 84e:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 851:	39 ce                	cmp    %ecx,%esi
 853:	74 1b                	je     870 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 855:	89 08                	mov    %ecx,(%eax)
  freep = p;
 857:	a3 20 0f 00 00       	mov    %eax,0xf20
}
 85c:	5b                   	pop    %ebx
 85d:	5e                   	pop    %esi
 85e:	5f                   	pop    %edi
 85f:	5d                   	pop    %ebp
 860:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 861:	03 72 04             	add    0x4(%edx),%esi
 864:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 867:	8b 10                	mov    (%eax),%edx
 869:	8b 12                	mov    (%edx),%edx
 86b:	89 53 f8             	mov    %edx,-0x8(%ebx)
 86e:	eb db                	jmp    84b <free+0x3e>
    p->s.size += bp->s.size;
 870:	03 53 fc             	add    -0x4(%ebx),%edx
 873:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 876:	8b 53 f8             	mov    -0x8(%ebx),%edx
 879:	89 10                	mov    %edx,(%eax)
 87b:	eb da                	jmp    857 <free+0x4a>

0000087d <morecore>:

static Header*
morecore(uint nu)
{
 87d:	55                   	push   %ebp
 87e:	89 e5                	mov    %esp,%ebp
 880:	53                   	push   %ebx
 881:	83 ec 04             	sub    $0x4,%esp
 884:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 886:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 88b:	77 05                	ja     892 <morecore+0x15>
    nu = 4096;
 88d:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 892:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 899:	83 ec 0c             	sub    $0xc,%esp
 89c:	50                   	push   %eax
 89d:	e8 38 fd ff ff       	call   5da <sbrk>
  if(p == (char*)-1)
 8a2:	83 c4 10             	add    $0x10,%esp
 8a5:	83 f8 ff             	cmp    $0xffffffff,%eax
 8a8:	74 1c                	je     8c6 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 8aa:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 8ad:	83 c0 08             	add    $0x8,%eax
 8b0:	83 ec 0c             	sub    $0xc,%esp
 8b3:	50                   	push   %eax
 8b4:	e8 54 ff ff ff       	call   80d <free>
  return freep;
 8b9:	a1 20 0f 00 00       	mov    0xf20,%eax
 8be:	83 c4 10             	add    $0x10,%esp
}
 8c1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8c4:	c9                   	leave  
 8c5:	c3                   	ret    
    return 0;
 8c6:	b8 00 00 00 00       	mov    $0x0,%eax
 8cb:	eb f4                	jmp    8c1 <morecore+0x44>

000008cd <malloc>:

void*
malloc(uint nbytes)
{
 8cd:	55                   	push   %ebp
 8ce:	89 e5                	mov    %esp,%ebp
 8d0:	53                   	push   %ebx
 8d1:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8d4:	8b 45 08             	mov    0x8(%ebp),%eax
 8d7:	8d 58 07             	lea    0x7(%eax),%ebx
 8da:	c1 eb 03             	shr    $0x3,%ebx
 8dd:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 8e0:	8b 0d 20 0f 00 00    	mov    0xf20,%ecx
 8e6:	85 c9                	test   %ecx,%ecx
 8e8:	74 04                	je     8ee <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8ea:	8b 01                	mov    (%ecx),%eax
 8ec:	eb 4a                	jmp    938 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 8ee:	c7 05 20 0f 00 00 24 	movl   $0xf24,0xf20
 8f5:	0f 00 00 
 8f8:	c7 05 24 0f 00 00 24 	movl   $0xf24,0xf24
 8ff:	0f 00 00 
    base.s.size = 0;
 902:	c7 05 28 0f 00 00 00 	movl   $0x0,0xf28
 909:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 90c:	b9 24 0f 00 00       	mov    $0xf24,%ecx
 911:	eb d7                	jmp    8ea <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 913:	74 19                	je     92e <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 915:	29 da                	sub    %ebx,%edx
 917:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 91a:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 91d:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 920:	89 0d 20 0f 00 00    	mov    %ecx,0xf20
      return (void*)(p + 1);
 926:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 929:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 92c:	c9                   	leave  
 92d:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 92e:	8b 10                	mov    (%eax),%edx
 930:	89 11                	mov    %edx,(%ecx)
 932:	eb ec                	jmp    920 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 934:	89 c1                	mov    %eax,%ecx
 936:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 938:	8b 50 04             	mov    0x4(%eax),%edx
 93b:	39 da                	cmp    %ebx,%edx
 93d:	73 d4                	jae    913 <malloc+0x46>
    if(p == freep)
 93f:	39 05 20 0f 00 00    	cmp    %eax,0xf20
 945:	75 ed                	jne    934 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 947:	89 d8                	mov    %ebx,%eax
 949:	e8 2f ff ff ff       	call   87d <morecore>
 94e:	85 c0                	test   %eax,%eax
 950:	75 e2                	jne    934 <malloc+0x67>
 952:	eb d5                	jmp    929 <malloc+0x5c>
