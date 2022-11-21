
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
  36:	68 3c 09 00 00       	push   $0x93c
  3b:	68 45 09 00 00       	push   $0x945
  40:	6a 01                	push   $0x1
  42:	e8 48 06 00 00       	call   68f <printf>
  47:	83 c4 0c             	add    $0xc,%esp
  4a:	68 04 0a 00 00       	push   $0xa04
  4f:	68 4d 09 00 00       	push   $0x94d
  54:	6a 01                	push   $0x1
  56:	e8 34 06 00 00       	call   68f <printf>
  5b:	83 c4 08             	add    $0x8,%esp
  5e:	68 61 09 00 00       	push   $0x961
  63:	6a 01                	push   $0x1
  65:	e8 25 06 00 00       	call   68f <printf>
  6a:	83 c4 04             	add    $0x4,%esp
  6d:	ff 35 40 0e 00 00    	push   0xe40
  73:	e8 f2 04 00 00       	call   56a <kill>
  78:	e8 bd 04 00 00       	call   53a <exit>
   assert((uint)&arg2 == ((uint)arg1 + PGSIZE - 4));
  7d:	6a 30                	push   $0x30
  7f:	68 3c 09 00 00       	push   $0x93c
  84:	68 45 09 00 00       	push   $0x945
  89:	6a 01                	push   $0x1
  8b:	e8 ff 05 00 00       	call   68f <printf>
  90:	83 c4 0c             	add    $0xc,%esp
  93:	68 ac 09 00 00       	push   $0x9ac
  98:	68 4d 09 00 00       	push   $0x94d
  9d:	6a 01                	push   $0x1
  9f:	e8 eb 05 00 00       	call   68f <printf>
  a4:	83 c4 08             	add    $0x8,%esp
  a7:	68 61 09 00 00       	push   $0x961
  ac:	6a 01                	push   $0x1
  ae:	e8 dc 05 00 00       	call   68f <printf>
  b3:	83 c4 04             	add    $0x4,%esp
  b6:	ff 35 40 0e 00 00    	push   0xe40
  bc:	e8 a9 04 00 00       	call   56a <kill>
  c1:	e8 74 04 00 00       	call   53a <exit>
   assert((uint)&arg1 == ((uint)arg1 + PGSIZE - 8));
  c6:	6a 31                	push   $0x31
  c8:	68 3c 09 00 00       	push   $0x93c
  cd:	68 45 09 00 00       	push   $0x945
  d2:	6a 01                	push   $0x1
  d4:	e8 b6 05 00 00       	call   68f <printf>
  d9:	83 c4 0c             	add    $0xc,%esp
  dc:	68 d8 09 00 00       	push   $0x9d8
  e1:	68 4d 09 00 00       	push   $0x94d
  e6:	6a 01                	push   $0x1
  e8:	e8 a2 05 00 00       	call   68f <printf>
  ed:	83 c4 08             	add    $0x8,%esp
  f0:	68 61 09 00 00       	push   $0x961
  f5:	6a 01                	push   $0x1
  f7:	e8 93 05 00 00       	call   68f <printf>
  fc:	83 c4 04             	add    $0x4,%esp
  ff:	ff 35 40 0e 00 00    	push   0xe40
 105:	e8 60 04 00 00       	call   56a <kill>
 10a:	e8 2b 04 00 00       	call   53a <exit>
   global = 5;
 10f:	c7 05 2c 0e 00 00 05 	movl   $0x5,0xe2c
 116:	00 00 00 
   exit();
 119:	e8 1c 04 00 00       	call   53a <exit>

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
 131:	e8 84 04 00 00       	call   5ba <getpid>
 136:	a3 40 0e 00 00       	mov    %eax,0xe40
   void *stack, *p = malloc(PGSIZE * 2);
 13b:	83 ec 0c             	sub    $0xc,%esp
 13e:	68 00 20 00 00       	push   $0x2000
 143:	e8 6d 07 00 00       	call   8b5 <malloc>
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
 171:	e8 64 04 00 00       	call   5da <clone>
 176:	89 c6                	mov    %eax,%esi
   assert(clone_pid > 0);
 178:	83 c4 10             	add    $0x10,%esp
 17b:	85 c0                	test   %eax,%eax
 17d:	0f 8e c1 00 00 00    	jle    244 <main+0x126>
   while(global != 5);
 183:	a1 2c 0e 00 00       	mov    0xe2c,%eax
 188:	83 f8 05             	cmp    $0x5,%eax
 18b:	75 f6                	jne    183 <main+0x65>
   printf(1, "TEST PASSED\n");
 18d:	83 ec 08             	sub    $0x8,%esp
 190:	68 86 09 00 00       	push   $0x986
 195:	6a 01                	push   $0x1
 197:	e8 f3 04 00 00       	call   68f <printf>
   int join_pid = join(&join_stack);
 19c:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 19f:	89 04 24             	mov    %eax,(%esp)
 1a2:	e8 3b 04 00 00       	call   5e2 <join>
   assert(join_pid == clone_pid);
 1a7:	83 c4 10             	add    $0x10,%esp
 1aa:	39 c6                	cmp    %eax,%esi
 1ac:	0f 84 db 00 00 00    	je     28d <main+0x16f>
 1b2:	6a 29                	push   $0x29
 1b4:	68 3c 09 00 00       	push   $0x93c
 1b9:	68 45 09 00 00       	push   $0x945
 1be:	6a 01                	push   $0x1
 1c0:	e8 ca 04 00 00       	call   68f <printf>
 1c5:	83 c4 0c             	add    $0xc,%esp
 1c8:	68 93 09 00 00       	push   $0x993
 1cd:	68 4d 09 00 00       	push   $0x94d
 1d2:	6a 01                	push   $0x1
 1d4:	e8 b6 04 00 00       	call   68f <printf>
 1d9:	83 c4 08             	add    $0x8,%esp
 1dc:	68 61 09 00 00       	push   $0x961
 1e1:	6a 01                	push   $0x1
 1e3:	e8 a7 04 00 00       	call   68f <printf>
 1e8:	83 c4 04             	add    $0x4,%esp
 1eb:	ff 35 40 0e 00 00    	push   0xe40
 1f1:	e8 74 03 00 00       	call   56a <kill>
 1f6:	e8 3f 03 00 00       	call   53a <exit>
   assert(p != NULL);
 1fb:	6a 1c                	push   $0x1c
 1fd:	68 3c 09 00 00       	push   $0x93c
 202:	68 45 09 00 00       	push   $0x945
 207:	6a 01                	push   $0x1
 209:	e8 81 04 00 00       	call   68f <printf>
 20e:	83 c4 0c             	add    $0xc,%esp
 211:	68 6e 09 00 00       	push   $0x96e
 216:	68 4d 09 00 00       	push   $0x94d
 21b:	6a 01                	push   $0x1
 21d:	e8 6d 04 00 00       	call   68f <printf>
 222:	83 c4 08             	add    $0x8,%esp
 225:	68 61 09 00 00       	push   $0x961
 22a:	6a 01                	push   $0x1
 22c:	e8 5e 04 00 00       	call   68f <printf>
 231:	83 c4 04             	add    $0x4,%esp
 234:	ff 35 40 0e 00 00    	push   0xe40
 23a:	e8 2b 03 00 00       	call   56a <kill>
 23f:	e8 f6 02 00 00       	call   53a <exit>
   assert(clone_pid > 0);
 244:	6a 23                	push   $0x23
 246:	68 3c 09 00 00       	push   $0x93c
 24b:	68 45 09 00 00       	push   $0x945
 250:	6a 01                	push   $0x1
 252:	e8 38 04 00 00       	call   68f <printf>
 257:	83 c4 0c             	add    $0xc,%esp
 25a:	68 78 09 00 00       	push   $0x978
 25f:	68 4d 09 00 00       	push   $0x94d
 264:	6a 01                	push   $0x1
 266:	e8 24 04 00 00       	call   68f <printf>
 26b:	83 c4 08             	add    $0x8,%esp
 26e:	68 61 09 00 00       	push   $0x961
 273:	6a 01                	push   $0x1
 275:	e8 15 04 00 00       	call   68f <printf>
 27a:	83 c4 04             	add    $0x4,%esp
 27d:	ff 35 40 0e 00 00    	push   0xe40
 283:	e8 e2 02 00 00       	call   56a <kill>
 288:	e8 ad 02 00 00       	call   53a <exit>
   free(p);
 28d:	83 ec 0c             	sub    $0xc,%esp
 290:	53                   	push   %ebx
 291:	e8 5f 05 00 00       	call   7f5 <free>
   exit();
 296:	e8 9f 02 00 00       	call   53a <exit>

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
 2af:	53                   	push   %ebx
 2b0:	83 ec 10             	sub    $0x10,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE*2);
 2b3:	68 00 20 00 00       	push   $0x2000
 2b8:	e8 f8 05 00 00       	call   8b5 <malloc>
  if(n_stack == 0){
 2bd:	83 c4 10             	add    $0x10,%esp
 2c0:	85 c0                	test   %eax,%eax
 2c2:	74 41                	je     305 <thread_create+0x59>
 2c4:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  int new_pid = clone(start_routine, arg1, arg2, n_stack);
 2c6:	50                   	push   %eax
 2c7:	ff 75 10             	push   0x10(%ebp)
 2ca:	ff 75 0c             	push   0xc(%ebp)
 2cd:	ff 75 08             	push   0x8(%ebp)
 2d0:	e8 05 03 00 00       	call   5da <clone>

  for(int i=0; i<64; i++){
 2d5:	83 c4 10             	add    $0x10,%esp
 2d8:	ba 00 00 00 00       	mov    $0x0,%edx
 2dd:	eb 03                	jmp    2e2 <thread_create+0x36>
 2df:	83 c2 01             	add    $0x1,%edx
 2e2:	83 fa 3f             	cmp    $0x3f,%edx
 2e5:	7f 19                	jg     300 <thread_create+0x54>
    if(threads[i]->flag==0){
 2e7:	8b 0c 95 60 0e 00 00 	mov    0xe60(,%edx,4),%ecx
 2ee:	83 79 08 00          	cmpl   $0x0,0x8(%ecx)
 2f2:	75 eb                	jne    2df <thread_create+0x33>
      threads[i]->maddr = n_stack;
 2f4:	89 19                	mov    %ebx,(%ecx)
      threads[i]->pg1addr = n_stack;
 2f6:	8b 14 95 60 0e 00 00 	mov    0xe60(,%edx,4),%edx
 2fd:	89 5a 04             	mov    %ebx,0x4(%edx)
      break;
    }
  }

  return new_pid;
}
 300:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 303:	c9                   	leave  
 304:	c3                   	ret    
    return -1;
 305:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 30a:	eb f4                	jmp    300 <thread_create+0x54>

0000030c <thread_join>:

//TODO: fix
int thread_join() {
 30c:	55                   	push   %ebp
 30d:	89 e5                	mov    %esp,%ebp
 30f:	56                   	push   %esi
 310:	53                   	push   %ebx
 311:	83 ec 1c             	sub    $0x1c,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 314:	8d 45 f4             	lea    -0xc(%ebp),%eax
 317:	50                   	push   %eax
 318:	e8 c5 02 00 00       	call   5e2 <join>
 31d:	89 c6                	mov    %eax,%esi
  for(int i=0; i<64; i++){
 31f:	83 c4 10             	add    $0x10,%esp
 322:	bb 00 00 00 00       	mov    $0x0,%ebx
 327:	eb 03                	jmp    32c <thread_join+0x20>
 329:	83 c3 01             	add    $0x1,%ebx
 32c:	83 fb 3f             	cmp    $0x3f,%ebx
 32f:	7f 23                	jg     354 <thread_join+0x48>
    if((threads[i]->flag==1) && (stk_addr == threads[i]->pg1addr)){
 331:	8b 04 9d 60 0e 00 00 	mov    0xe60(,%ebx,4),%eax
 338:	83 78 08 01          	cmpl   $0x1,0x8(%eax)
 33c:	75 eb                	jne    329 <thread_join+0x1d>
 33e:	8b 55 f4             	mov    -0xc(%ebp),%edx
 341:	39 50 04             	cmp    %edx,0x4(%eax)
 344:	75 e3                	jne    329 <thread_join+0x1d>
      free(stk_addr);
 346:	83 ec 0c             	sub    $0xc,%esp
 349:	52                   	push   %edx
 34a:	e8 a6 04 00 00       	call   7f5 <free>
 34f:	83 c4 10             	add    $0x10,%esp
 352:	eb d5                	jmp    329 <thread_join+0x1d>
    }
  }
  return pid;
}
 354:	89 f0                	mov    %esi,%eax
 356:	8d 65 f8             	lea    -0x8(%ebp),%esp
 359:	5b                   	pop    %ebx
 35a:	5e                   	pop    %esi
 35b:	5d                   	pop    %ebp
 35c:	c3                   	ret    

0000035d <lock_acquire>:

void lock_acquire(lock_t *lock){
 35d:	55                   	push   %ebp
 35e:	89 e5                	mov    %esp,%ebp
 360:	53                   	push   %ebx
 361:	83 ec 04             	sub    $0x4,%esp
 364:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 367:	83 ec 08             	sub    $0x8,%esp
 36a:	6a 01                	push   $0x1
 36c:	53                   	push   %ebx
 36d:	e8 29 ff ff ff       	call   29b <test_and_set>
 372:	83 c4 10             	add    $0x10,%esp
 375:	83 f8 01             	cmp    $0x1,%eax
 378:	74 ed                	je     367 <lock_acquire+0xa>
    ;
}
 37a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 37d:	c9                   	leave  
 37e:	c3                   	ret    

0000037f <lock_release>:

void lock_release(lock_t *lock) {
 37f:	55                   	push   %ebp
 380:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 382:	8b 45 08             	mov    0x8(%ebp),%eax
 385:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 38b:	5d                   	pop    %ebp
 38c:	c3                   	ret    

0000038d <lock_init>:

void lock_init(lock_t *lock) {
 38d:	55                   	push   %ebp
 38e:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 390:	8b 45 08             	mov    0x8(%ebp),%eax
 393:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 399:	5d                   	pop    %ebp
 39a:	c3                   	ret    

0000039b <strcpy>:

char*
strcpy(char *s, const char *t)
{
 39b:	55                   	push   %ebp
 39c:	89 e5                	mov    %esp,%ebp
 39e:	56                   	push   %esi
 39f:	53                   	push   %ebx
 3a0:	8b 75 08             	mov    0x8(%ebp),%esi
 3a3:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 3a6:	89 f0                	mov    %esi,%eax
 3a8:	89 d1                	mov    %edx,%ecx
 3aa:	83 c2 01             	add    $0x1,%edx
 3ad:	89 c3                	mov    %eax,%ebx
 3af:	83 c0 01             	add    $0x1,%eax
 3b2:	0f b6 09             	movzbl (%ecx),%ecx
 3b5:	88 0b                	mov    %cl,(%ebx)
 3b7:	84 c9                	test   %cl,%cl
 3b9:	75 ed                	jne    3a8 <strcpy+0xd>
    ;
  return os;
}
 3bb:	89 f0                	mov    %esi,%eax
 3bd:	5b                   	pop    %ebx
 3be:	5e                   	pop    %esi
 3bf:	5d                   	pop    %ebp
 3c0:	c3                   	ret    

000003c1 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 3c1:	55                   	push   %ebp
 3c2:	89 e5                	mov    %esp,%ebp
 3c4:	8b 4d 08             	mov    0x8(%ebp),%ecx
 3c7:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 3ca:	eb 06                	jmp    3d2 <strcmp+0x11>
    p++, q++;
 3cc:	83 c1 01             	add    $0x1,%ecx
 3cf:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 3d2:	0f b6 01             	movzbl (%ecx),%eax
 3d5:	84 c0                	test   %al,%al
 3d7:	74 04                	je     3dd <strcmp+0x1c>
 3d9:	3a 02                	cmp    (%edx),%al
 3db:	74 ef                	je     3cc <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 3dd:	0f b6 c0             	movzbl %al,%eax
 3e0:	0f b6 12             	movzbl (%edx),%edx
 3e3:	29 d0                	sub    %edx,%eax
}
 3e5:	5d                   	pop    %ebp
 3e6:	c3                   	ret    

000003e7 <strlen>:

uint
strlen(const char *s)
{
 3e7:	55                   	push   %ebp
 3e8:	89 e5                	mov    %esp,%ebp
 3ea:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 3ed:	b8 00 00 00 00       	mov    $0x0,%eax
 3f2:	eb 03                	jmp    3f7 <strlen+0x10>
 3f4:	83 c0 01             	add    $0x1,%eax
 3f7:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 3fb:	75 f7                	jne    3f4 <strlen+0xd>
    ;
  return n;
}
 3fd:	5d                   	pop    %ebp
 3fe:	c3                   	ret    

000003ff <memset>:

void*
memset(void *dst, int c, uint n)
{
 3ff:	55                   	push   %ebp
 400:	89 e5                	mov    %esp,%ebp
 402:	57                   	push   %edi
 403:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 406:	89 d7                	mov    %edx,%edi
 408:	8b 4d 10             	mov    0x10(%ebp),%ecx
 40b:	8b 45 0c             	mov    0xc(%ebp),%eax
 40e:	fc                   	cld    
 40f:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 411:	89 d0                	mov    %edx,%eax
 413:	8b 7d fc             	mov    -0x4(%ebp),%edi
 416:	c9                   	leave  
 417:	c3                   	ret    

00000418 <strchr>:

char*
strchr(const char *s, char c)
{
 418:	55                   	push   %ebp
 419:	89 e5                	mov    %esp,%ebp
 41b:	8b 45 08             	mov    0x8(%ebp),%eax
 41e:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 422:	eb 03                	jmp    427 <strchr+0xf>
 424:	83 c0 01             	add    $0x1,%eax
 427:	0f b6 10             	movzbl (%eax),%edx
 42a:	84 d2                	test   %dl,%dl
 42c:	74 06                	je     434 <strchr+0x1c>
    if(*s == c)
 42e:	38 ca                	cmp    %cl,%dl
 430:	75 f2                	jne    424 <strchr+0xc>
 432:	eb 05                	jmp    439 <strchr+0x21>
      return (char*)s;
  return 0;
 434:	b8 00 00 00 00       	mov    $0x0,%eax
}
 439:	5d                   	pop    %ebp
 43a:	c3                   	ret    

0000043b <gets>:

char*
gets(char *buf, int max)
{
 43b:	55                   	push   %ebp
 43c:	89 e5                	mov    %esp,%ebp
 43e:	57                   	push   %edi
 43f:	56                   	push   %esi
 440:	53                   	push   %ebx
 441:	83 ec 1c             	sub    $0x1c,%esp
 444:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 447:	bb 00 00 00 00       	mov    $0x0,%ebx
 44c:	89 de                	mov    %ebx,%esi
 44e:	83 c3 01             	add    $0x1,%ebx
 451:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 454:	7d 2e                	jge    484 <gets+0x49>
    cc = read(0, &c, 1);
 456:	83 ec 04             	sub    $0x4,%esp
 459:	6a 01                	push   $0x1
 45b:	8d 45 e7             	lea    -0x19(%ebp),%eax
 45e:	50                   	push   %eax
 45f:	6a 00                	push   $0x0
 461:	e8 ec 00 00 00       	call   552 <read>
    if(cc < 1)
 466:	83 c4 10             	add    $0x10,%esp
 469:	85 c0                	test   %eax,%eax
 46b:	7e 17                	jle    484 <gets+0x49>
      break;
    buf[i++] = c;
 46d:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 471:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 474:	3c 0a                	cmp    $0xa,%al
 476:	0f 94 c2             	sete   %dl
 479:	3c 0d                	cmp    $0xd,%al
 47b:	0f 94 c0             	sete   %al
 47e:	08 c2                	or     %al,%dl
 480:	74 ca                	je     44c <gets+0x11>
    buf[i++] = c;
 482:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 484:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 488:	89 f8                	mov    %edi,%eax
 48a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 48d:	5b                   	pop    %ebx
 48e:	5e                   	pop    %esi
 48f:	5f                   	pop    %edi
 490:	5d                   	pop    %ebp
 491:	c3                   	ret    

00000492 <stat>:

int
stat(const char *n, struct stat *st)
{
 492:	55                   	push   %ebp
 493:	89 e5                	mov    %esp,%ebp
 495:	56                   	push   %esi
 496:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 497:	83 ec 08             	sub    $0x8,%esp
 49a:	6a 00                	push   $0x0
 49c:	ff 75 08             	push   0x8(%ebp)
 49f:	e8 d6 00 00 00       	call   57a <open>
  if(fd < 0)
 4a4:	83 c4 10             	add    $0x10,%esp
 4a7:	85 c0                	test   %eax,%eax
 4a9:	78 24                	js     4cf <stat+0x3d>
 4ab:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 4ad:	83 ec 08             	sub    $0x8,%esp
 4b0:	ff 75 0c             	push   0xc(%ebp)
 4b3:	50                   	push   %eax
 4b4:	e8 d9 00 00 00       	call   592 <fstat>
 4b9:	89 c6                	mov    %eax,%esi
  close(fd);
 4bb:	89 1c 24             	mov    %ebx,(%esp)
 4be:	e8 9f 00 00 00       	call   562 <close>
  return r;
 4c3:	83 c4 10             	add    $0x10,%esp
}
 4c6:	89 f0                	mov    %esi,%eax
 4c8:	8d 65 f8             	lea    -0x8(%ebp),%esp
 4cb:	5b                   	pop    %ebx
 4cc:	5e                   	pop    %esi
 4cd:	5d                   	pop    %ebp
 4ce:	c3                   	ret    
    return -1;
 4cf:	be ff ff ff ff       	mov    $0xffffffff,%esi
 4d4:	eb f0                	jmp    4c6 <stat+0x34>

000004d6 <atoi>:

int
atoi(const char *s)
{
 4d6:	55                   	push   %ebp
 4d7:	89 e5                	mov    %esp,%ebp
 4d9:	53                   	push   %ebx
 4da:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 4dd:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 4e2:	eb 10                	jmp    4f4 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 4e4:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 4e7:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 4ea:	83 c1 01             	add    $0x1,%ecx
 4ed:	0f be c0             	movsbl %al,%eax
 4f0:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 4f4:	0f b6 01             	movzbl (%ecx),%eax
 4f7:	8d 58 d0             	lea    -0x30(%eax),%ebx
 4fa:	80 fb 09             	cmp    $0x9,%bl
 4fd:	76 e5                	jbe    4e4 <atoi+0xe>
  return n;
}
 4ff:	89 d0                	mov    %edx,%eax
 501:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 504:	c9                   	leave  
 505:	c3                   	ret    

00000506 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 506:	55                   	push   %ebp
 507:	89 e5                	mov    %esp,%ebp
 509:	56                   	push   %esi
 50a:	53                   	push   %ebx
 50b:	8b 75 08             	mov    0x8(%ebp),%esi
 50e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 511:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 514:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 516:	eb 0d                	jmp    525 <memmove+0x1f>
    *dst++ = *src++;
 518:	0f b6 01             	movzbl (%ecx),%eax
 51b:	88 02                	mov    %al,(%edx)
 51d:	8d 49 01             	lea    0x1(%ecx),%ecx
 520:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 523:	89 d8                	mov    %ebx,%eax
 525:	8d 58 ff             	lea    -0x1(%eax),%ebx
 528:	85 c0                	test   %eax,%eax
 52a:	7f ec                	jg     518 <memmove+0x12>
  return vdst;
}
 52c:	89 f0                	mov    %esi,%eax
 52e:	5b                   	pop    %ebx
 52f:	5e                   	pop    %esi
 530:	5d                   	pop    %ebp
 531:	c3                   	ret    

00000532 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 532:	b8 01 00 00 00       	mov    $0x1,%eax
 537:	cd 40                	int    $0x40
 539:	c3                   	ret    

0000053a <exit>:
SYSCALL(exit)
 53a:	b8 02 00 00 00       	mov    $0x2,%eax
 53f:	cd 40                	int    $0x40
 541:	c3                   	ret    

00000542 <wait>:
SYSCALL(wait)
 542:	b8 03 00 00 00       	mov    $0x3,%eax
 547:	cd 40                	int    $0x40
 549:	c3                   	ret    

0000054a <pipe>:
SYSCALL(pipe)
 54a:	b8 04 00 00 00       	mov    $0x4,%eax
 54f:	cd 40                	int    $0x40
 551:	c3                   	ret    

00000552 <read>:
SYSCALL(read)
 552:	b8 05 00 00 00       	mov    $0x5,%eax
 557:	cd 40                	int    $0x40
 559:	c3                   	ret    

0000055a <write>:
SYSCALL(write)
 55a:	b8 10 00 00 00       	mov    $0x10,%eax
 55f:	cd 40                	int    $0x40
 561:	c3                   	ret    

00000562 <close>:
SYSCALL(close)
 562:	b8 15 00 00 00       	mov    $0x15,%eax
 567:	cd 40                	int    $0x40
 569:	c3                   	ret    

0000056a <kill>:
SYSCALL(kill)
 56a:	b8 06 00 00 00       	mov    $0x6,%eax
 56f:	cd 40                	int    $0x40
 571:	c3                   	ret    

00000572 <exec>:
SYSCALL(exec)
 572:	b8 07 00 00 00       	mov    $0x7,%eax
 577:	cd 40                	int    $0x40
 579:	c3                   	ret    

0000057a <open>:
SYSCALL(open)
 57a:	b8 0f 00 00 00       	mov    $0xf,%eax
 57f:	cd 40                	int    $0x40
 581:	c3                   	ret    

00000582 <mknod>:
SYSCALL(mknod)
 582:	b8 11 00 00 00       	mov    $0x11,%eax
 587:	cd 40                	int    $0x40
 589:	c3                   	ret    

0000058a <unlink>:
SYSCALL(unlink)
 58a:	b8 12 00 00 00       	mov    $0x12,%eax
 58f:	cd 40                	int    $0x40
 591:	c3                   	ret    

00000592 <fstat>:
SYSCALL(fstat)
 592:	b8 08 00 00 00       	mov    $0x8,%eax
 597:	cd 40                	int    $0x40
 599:	c3                   	ret    

0000059a <link>:
SYSCALL(link)
 59a:	b8 13 00 00 00       	mov    $0x13,%eax
 59f:	cd 40                	int    $0x40
 5a1:	c3                   	ret    

000005a2 <mkdir>:
SYSCALL(mkdir)
 5a2:	b8 14 00 00 00       	mov    $0x14,%eax
 5a7:	cd 40                	int    $0x40
 5a9:	c3                   	ret    

000005aa <chdir>:
SYSCALL(chdir)
 5aa:	b8 09 00 00 00       	mov    $0x9,%eax
 5af:	cd 40                	int    $0x40
 5b1:	c3                   	ret    

000005b2 <dup>:
SYSCALL(dup)
 5b2:	b8 0a 00 00 00       	mov    $0xa,%eax
 5b7:	cd 40                	int    $0x40
 5b9:	c3                   	ret    

000005ba <getpid>:
SYSCALL(getpid)
 5ba:	b8 0b 00 00 00       	mov    $0xb,%eax
 5bf:	cd 40                	int    $0x40
 5c1:	c3                   	ret    

000005c2 <sbrk>:
SYSCALL(sbrk)
 5c2:	b8 0c 00 00 00       	mov    $0xc,%eax
 5c7:	cd 40                	int    $0x40
 5c9:	c3                   	ret    

000005ca <sleep>:
SYSCALL(sleep)
 5ca:	b8 0d 00 00 00       	mov    $0xd,%eax
 5cf:	cd 40                	int    $0x40
 5d1:	c3                   	ret    

000005d2 <uptime>:
SYSCALL(uptime)
 5d2:	b8 0e 00 00 00       	mov    $0xe,%eax
 5d7:	cd 40                	int    $0x40
 5d9:	c3                   	ret    

000005da <clone>:
SYSCALL(clone)
 5da:	b8 16 00 00 00       	mov    $0x16,%eax
 5df:	cd 40                	int    $0x40
 5e1:	c3                   	ret    

000005e2 <join>:
 5e2:	b8 17 00 00 00       	mov    $0x17,%eax
 5e7:	cd 40                	int    $0x40
 5e9:	c3                   	ret    

000005ea <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 5ea:	55                   	push   %ebp
 5eb:	89 e5                	mov    %esp,%ebp
 5ed:	83 ec 1c             	sub    $0x1c,%esp
 5f0:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 5f3:	6a 01                	push   $0x1
 5f5:	8d 55 f4             	lea    -0xc(%ebp),%edx
 5f8:	52                   	push   %edx
 5f9:	50                   	push   %eax
 5fa:	e8 5b ff ff ff       	call   55a <write>
}
 5ff:	83 c4 10             	add    $0x10,%esp
 602:	c9                   	leave  
 603:	c3                   	ret    

00000604 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 604:	55                   	push   %ebp
 605:	89 e5                	mov    %esp,%ebp
 607:	57                   	push   %edi
 608:	56                   	push   %esi
 609:	53                   	push   %ebx
 60a:	83 ec 2c             	sub    $0x2c,%esp
 60d:	89 45 d0             	mov    %eax,-0x30(%ebp)
 610:	89 d0                	mov    %edx,%eax
 612:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 614:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 618:	0f 95 c1             	setne  %cl
 61b:	c1 ea 1f             	shr    $0x1f,%edx
 61e:	84 d1                	test   %dl,%cl
 620:	74 44                	je     666 <printint+0x62>
    neg = 1;
    x = -xx;
 622:	f7 d8                	neg    %eax
 624:	89 c1                	mov    %eax,%ecx
    neg = 1;
 626:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 62d:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 632:	89 c8                	mov    %ecx,%eax
 634:	ba 00 00 00 00       	mov    $0x0,%edx
 639:	f7 f6                	div    %esi
 63b:	89 df                	mov    %ebx,%edi
 63d:	83 c3 01             	add    $0x1,%ebx
 640:	0f b6 92 94 0a 00 00 	movzbl 0xa94(%edx),%edx
 647:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 64b:	89 ca                	mov    %ecx,%edx
 64d:	89 c1                	mov    %eax,%ecx
 64f:	39 d6                	cmp    %edx,%esi
 651:	76 df                	jbe    632 <printint+0x2e>
  if(neg)
 653:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 657:	74 31                	je     68a <printint+0x86>
    buf[i++] = '-';
 659:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 65e:	8d 5f 02             	lea    0x2(%edi),%ebx
 661:	8b 75 d0             	mov    -0x30(%ebp),%esi
 664:	eb 17                	jmp    67d <printint+0x79>
    x = xx;
 666:	89 c1                	mov    %eax,%ecx
  neg = 0;
 668:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 66f:	eb bc                	jmp    62d <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 671:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 676:	89 f0                	mov    %esi,%eax
 678:	e8 6d ff ff ff       	call   5ea <putc>
  while(--i >= 0)
 67d:	83 eb 01             	sub    $0x1,%ebx
 680:	79 ef                	jns    671 <printint+0x6d>
}
 682:	83 c4 2c             	add    $0x2c,%esp
 685:	5b                   	pop    %ebx
 686:	5e                   	pop    %esi
 687:	5f                   	pop    %edi
 688:	5d                   	pop    %ebp
 689:	c3                   	ret    
 68a:	8b 75 d0             	mov    -0x30(%ebp),%esi
 68d:	eb ee                	jmp    67d <printint+0x79>

0000068f <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 68f:	55                   	push   %ebp
 690:	89 e5                	mov    %esp,%ebp
 692:	57                   	push   %edi
 693:	56                   	push   %esi
 694:	53                   	push   %ebx
 695:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 698:	8d 45 10             	lea    0x10(%ebp),%eax
 69b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 69e:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 6a3:	bb 00 00 00 00       	mov    $0x0,%ebx
 6a8:	eb 14                	jmp    6be <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 6aa:	89 fa                	mov    %edi,%edx
 6ac:	8b 45 08             	mov    0x8(%ebp),%eax
 6af:	e8 36 ff ff ff       	call   5ea <putc>
 6b4:	eb 05                	jmp    6bb <printf+0x2c>
      }
    } else if(state == '%'){
 6b6:	83 fe 25             	cmp    $0x25,%esi
 6b9:	74 25                	je     6e0 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 6bb:	83 c3 01             	add    $0x1,%ebx
 6be:	8b 45 0c             	mov    0xc(%ebp),%eax
 6c1:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 6c5:	84 c0                	test   %al,%al
 6c7:	0f 84 20 01 00 00    	je     7ed <printf+0x15e>
    c = fmt[i] & 0xff;
 6cd:	0f be f8             	movsbl %al,%edi
 6d0:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 6d3:	85 f6                	test   %esi,%esi
 6d5:	75 df                	jne    6b6 <printf+0x27>
      if(c == '%'){
 6d7:	83 f8 25             	cmp    $0x25,%eax
 6da:	75 ce                	jne    6aa <printf+0x1b>
        state = '%';
 6dc:	89 c6                	mov    %eax,%esi
 6de:	eb db                	jmp    6bb <printf+0x2c>
      if(c == 'd'){
 6e0:	83 f8 25             	cmp    $0x25,%eax
 6e3:	0f 84 cf 00 00 00    	je     7b8 <printf+0x129>
 6e9:	0f 8c dd 00 00 00    	jl     7cc <printf+0x13d>
 6ef:	83 f8 78             	cmp    $0x78,%eax
 6f2:	0f 8f d4 00 00 00    	jg     7cc <printf+0x13d>
 6f8:	83 f8 63             	cmp    $0x63,%eax
 6fb:	0f 8c cb 00 00 00    	jl     7cc <printf+0x13d>
 701:	83 e8 63             	sub    $0x63,%eax
 704:	83 f8 15             	cmp    $0x15,%eax
 707:	0f 87 bf 00 00 00    	ja     7cc <printf+0x13d>
 70d:	ff 24 85 3c 0a 00 00 	jmp    *0xa3c(,%eax,4)
        printint(fd, *ap, 10, 1);
 714:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 717:	8b 17                	mov    (%edi),%edx
 719:	83 ec 0c             	sub    $0xc,%esp
 71c:	6a 01                	push   $0x1
 71e:	b9 0a 00 00 00       	mov    $0xa,%ecx
 723:	8b 45 08             	mov    0x8(%ebp),%eax
 726:	e8 d9 fe ff ff       	call   604 <printint>
        ap++;
 72b:	83 c7 04             	add    $0x4,%edi
 72e:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 731:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 734:	be 00 00 00 00       	mov    $0x0,%esi
 739:	eb 80                	jmp    6bb <printf+0x2c>
        printint(fd, *ap, 16, 0);
 73b:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 73e:	8b 17                	mov    (%edi),%edx
 740:	83 ec 0c             	sub    $0xc,%esp
 743:	6a 00                	push   $0x0
 745:	b9 10 00 00 00       	mov    $0x10,%ecx
 74a:	8b 45 08             	mov    0x8(%ebp),%eax
 74d:	e8 b2 fe ff ff       	call   604 <printint>
        ap++;
 752:	83 c7 04             	add    $0x4,%edi
 755:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 758:	83 c4 10             	add    $0x10,%esp
      state = 0;
 75b:	be 00 00 00 00       	mov    $0x0,%esi
 760:	e9 56 ff ff ff       	jmp    6bb <printf+0x2c>
        s = (char*)*ap;
 765:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 768:	8b 30                	mov    (%eax),%esi
        ap++;
 76a:	83 c0 04             	add    $0x4,%eax
 76d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 770:	85 f6                	test   %esi,%esi
 772:	75 15                	jne    789 <printf+0xfa>
          s = "(null)";
 774:	be 32 0a 00 00       	mov    $0xa32,%esi
 779:	eb 0e                	jmp    789 <printf+0xfa>
          putc(fd, *s);
 77b:	0f be d2             	movsbl %dl,%edx
 77e:	8b 45 08             	mov    0x8(%ebp),%eax
 781:	e8 64 fe ff ff       	call   5ea <putc>
          s++;
 786:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 789:	0f b6 16             	movzbl (%esi),%edx
 78c:	84 d2                	test   %dl,%dl
 78e:	75 eb                	jne    77b <printf+0xec>
      state = 0;
 790:	be 00 00 00 00       	mov    $0x0,%esi
 795:	e9 21 ff ff ff       	jmp    6bb <printf+0x2c>
        putc(fd, *ap);
 79a:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 79d:	0f be 17             	movsbl (%edi),%edx
 7a0:	8b 45 08             	mov    0x8(%ebp),%eax
 7a3:	e8 42 fe ff ff       	call   5ea <putc>
        ap++;
 7a8:	83 c7 04             	add    $0x4,%edi
 7ab:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 7ae:	be 00 00 00 00       	mov    $0x0,%esi
 7b3:	e9 03 ff ff ff       	jmp    6bb <printf+0x2c>
        putc(fd, c);
 7b8:	89 fa                	mov    %edi,%edx
 7ba:	8b 45 08             	mov    0x8(%ebp),%eax
 7bd:	e8 28 fe ff ff       	call   5ea <putc>
      state = 0;
 7c2:	be 00 00 00 00       	mov    $0x0,%esi
 7c7:	e9 ef fe ff ff       	jmp    6bb <printf+0x2c>
        putc(fd, '%');
 7cc:	ba 25 00 00 00       	mov    $0x25,%edx
 7d1:	8b 45 08             	mov    0x8(%ebp),%eax
 7d4:	e8 11 fe ff ff       	call   5ea <putc>
        putc(fd, c);
 7d9:	89 fa                	mov    %edi,%edx
 7db:	8b 45 08             	mov    0x8(%ebp),%eax
 7de:	e8 07 fe ff ff       	call   5ea <putc>
      state = 0;
 7e3:	be 00 00 00 00       	mov    $0x0,%esi
 7e8:	e9 ce fe ff ff       	jmp    6bb <printf+0x2c>
    }
  }
}
 7ed:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7f0:	5b                   	pop    %ebx
 7f1:	5e                   	pop    %esi
 7f2:	5f                   	pop    %edi
 7f3:	5d                   	pop    %ebp
 7f4:	c3                   	ret    

000007f5 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7f5:	55                   	push   %ebp
 7f6:	89 e5                	mov    %esp,%ebp
 7f8:	57                   	push   %edi
 7f9:	56                   	push   %esi
 7fa:	53                   	push   %ebx
 7fb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7fe:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 801:	a1 60 0f 00 00       	mov    0xf60,%eax
 806:	eb 02                	jmp    80a <free+0x15>
 808:	89 d0                	mov    %edx,%eax
 80a:	39 c8                	cmp    %ecx,%eax
 80c:	73 04                	jae    812 <free+0x1d>
 80e:	39 08                	cmp    %ecx,(%eax)
 810:	77 12                	ja     824 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 812:	8b 10                	mov    (%eax),%edx
 814:	39 c2                	cmp    %eax,%edx
 816:	77 f0                	ja     808 <free+0x13>
 818:	39 c8                	cmp    %ecx,%eax
 81a:	72 08                	jb     824 <free+0x2f>
 81c:	39 ca                	cmp    %ecx,%edx
 81e:	77 04                	ja     824 <free+0x2f>
 820:	89 d0                	mov    %edx,%eax
 822:	eb e6                	jmp    80a <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 824:	8b 73 fc             	mov    -0x4(%ebx),%esi
 827:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 82a:	8b 10                	mov    (%eax),%edx
 82c:	39 d7                	cmp    %edx,%edi
 82e:	74 19                	je     849 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 830:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 833:	8b 50 04             	mov    0x4(%eax),%edx
 836:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 839:	39 ce                	cmp    %ecx,%esi
 83b:	74 1b                	je     858 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 83d:	89 08                	mov    %ecx,(%eax)
  freep = p;
 83f:	a3 60 0f 00 00       	mov    %eax,0xf60
}
 844:	5b                   	pop    %ebx
 845:	5e                   	pop    %esi
 846:	5f                   	pop    %edi
 847:	5d                   	pop    %ebp
 848:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 849:	03 72 04             	add    0x4(%edx),%esi
 84c:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 84f:	8b 10                	mov    (%eax),%edx
 851:	8b 12                	mov    (%edx),%edx
 853:	89 53 f8             	mov    %edx,-0x8(%ebx)
 856:	eb db                	jmp    833 <free+0x3e>
    p->s.size += bp->s.size;
 858:	03 53 fc             	add    -0x4(%ebx),%edx
 85b:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 85e:	8b 53 f8             	mov    -0x8(%ebx),%edx
 861:	89 10                	mov    %edx,(%eax)
 863:	eb da                	jmp    83f <free+0x4a>

00000865 <morecore>:

static Header*
morecore(uint nu)
{
 865:	55                   	push   %ebp
 866:	89 e5                	mov    %esp,%ebp
 868:	53                   	push   %ebx
 869:	83 ec 04             	sub    $0x4,%esp
 86c:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 86e:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 873:	77 05                	ja     87a <morecore+0x15>
    nu = 4096;
 875:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 87a:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 881:	83 ec 0c             	sub    $0xc,%esp
 884:	50                   	push   %eax
 885:	e8 38 fd ff ff       	call   5c2 <sbrk>
  if(p == (char*)-1)
 88a:	83 c4 10             	add    $0x10,%esp
 88d:	83 f8 ff             	cmp    $0xffffffff,%eax
 890:	74 1c                	je     8ae <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 892:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 895:	83 c0 08             	add    $0x8,%eax
 898:	83 ec 0c             	sub    $0xc,%esp
 89b:	50                   	push   %eax
 89c:	e8 54 ff ff ff       	call   7f5 <free>
  return freep;
 8a1:	a1 60 0f 00 00       	mov    0xf60,%eax
 8a6:	83 c4 10             	add    $0x10,%esp
}
 8a9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8ac:	c9                   	leave  
 8ad:	c3                   	ret    
    return 0;
 8ae:	b8 00 00 00 00       	mov    $0x0,%eax
 8b3:	eb f4                	jmp    8a9 <morecore+0x44>

000008b5 <malloc>:

void*
malloc(uint nbytes)
{
 8b5:	55                   	push   %ebp
 8b6:	89 e5                	mov    %esp,%ebp
 8b8:	53                   	push   %ebx
 8b9:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8bc:	8b 45 08             	mov    0x8(%ebp),%eax
 8bf:	8d 58 07             	lea    0x7(%eax),%ebx
 8c2:	c1 eb 03             	shr    $0x3,%ebx
 8c5:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 8c8:	8b 0d 60 0f 00 00    	mov    0xf60,%ecx
 8ce:	85 c9                	test   %ecx,%ecx
 8d0:	74 04                	je     8d6 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8d2:	8b 01                	mov    (%ecx),%eax
 8d4:	eb 4a                	jmp    920 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 8d6:	c7 05 60 0f 00 00 64 	movl   $0xf64,0xf60
 8dd:	0f 00 00 
 8e0:	c7 05 64 0f 00 00 64 	movl   $0xf64,0xf64
 8e7:	0f 00 00 
    base.s.size = 0;
 8ea:	c7 05 68 0f 00 00 00 	movl   $0x0,0xf68
 8f1:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 8f4:	b9 64 0f 00 00       	mov    $0xf64,%ecx
 8f9:	eb d7                	jmp    8d2 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 8fb:	74 19                	je     916 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 8fd:	29 da                	sub    %ebx,%edx
 8ff:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 902:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 905:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 908:	89 0d 60 0f 00 00    	mov    %ecx,0xf60
      return (void*)(p + 1);
 90e:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 911:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 914:	c9                   	leave  
 915:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 916:	8b 10                	mov    (%eax),%edx
 918:	89 11                	mov    %edx,(%ecx)
 91a:	eb ec                	jmp    908 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 91c:	89 c1                	mov    %eax,%ecx
 91e:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 920:	8b 50 04             	mov    0x4(%eax),%edx
 923:	39 da                	cmp    %ebx,%edx
 925:	73 d4                	jae    8fb <malloc+0x46>
    if(p == freep)
 927:	39 05 60 0f 00 00    	cmp    %eax,0xf60
 92d:	75 ed                	jne    91c <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 92f:	89 d8                	mov    %ebx,%eax
 931:	e8 2f ff ff ff       	call   865 <morecore>
 936:	85 c0                	test   %eax,%eax
 938:	75 e2                	jne    91c <malloc+0x67>
 93a:	eb d5                	jmp    911 <malloc+0x5c>
