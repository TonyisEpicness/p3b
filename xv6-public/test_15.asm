
_test_15:     file format elf32-i386


Disassembly of section .text:

00000000 <worker>:
   printf(1, "TEST PASSED\n");
   exit();
}

void
worker(void *arg1, void *arg2) {
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	53                   	push   %ebx
   4:	83 ec 04             	sub    $0x4,%esp
   int i, j, tmp;
   for (i = 0; i < loops; i++) {
   7:	bb 00 00 00 00       	mov    $0x0,%ebx
   c:	eb 23                	jmp    31 <worker+0x31>
      lock_acquire(&lock);
      tmp = global;
      for(j = 0; j < 50; j++); // take some time
   e:	83 c0 01             	add    $0x1,%eax
  11:	83 f8 31             	cmp    $0x31,%eax
  14:	7e f8                	jle    e <worker+0xe>
      global = tmp + 1;
  16:	8d 42 01             	lea    0x1(%edx),%eax
  19:	a3 04 0d 00 00       	mov    %eax,0xd04
      lock_release(&lock);
  1e:	83 ec 0c             	sub    $0xc,%esp
  21:	68 00 0d 00 00       	push   $0xd00
  26:	e8 81 02 00 00       	call   2ac <lock_release>
   for (i = 0; i < loops; i++) {
  2b:	83 c3 01             	add    $0x1,%ebx
  2e:	83 c4 10             	add    $0x10,%esp
  31:	39 1d dc 0c 00 00    	cmp    %ebx,0xcdc
  37:	7e 1d                	jle    56 <worker+0x56>
      lock_acquire(&lock);
  39:	83 ec 0c             	sub    $0xc,%esp
  3c:	68 00 0d 00 00       	push   $0xd00
  41:	e8 44 02 00 00       	call   28a <lock_acquire>
      tmp = global;
  46:	8b 15 04 0d 00 00    	mov    0xd04,%edx
      for(j = 0; j < 50; j++); // take some time
  4c:	83 c4 10             	add    $0x10,%esp
  4f:	b8 00 00 00 00       	mov    $0x0,%eax
  54:	eb bb                	jmp    11 <worker+0x11>
   }
   exit();
  56:	e8 0c 04 00 00       	call   467 <exit>

0000005b <main>:
{
  5b:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  5f:	83 e4 f0             	and    $0xfffffff0,%esp
  62:	ff 71 fc             	push   -0x4(%ecx)
  65:	55                   	push   %ebp
  66:	89 e5                	mov    %esp,%ebp
  68:	53                   	push   %ebx
  69:	51                   	push   %ecx
   ppid = getpid();
  6a:	e8 78 04 00 00       	call   4e7 <getpid>
  6f:	a3 08 0d 00 00       	mov    %eax,0xd08
   lock_init(&lock);
  74:	83 ec 0c             	sub    $0xc,%esp
  77:	68 00 0d 00 00       	push   $0xd00
  7c:	e8 39 02 00 00       	call   2ba <lock_init>
   for (i = 0; i < num_threads; i++) {
  81:	83 c4 10             	add    $0x10,%esp
  84:	bb 00 00 00 00       	mov    $0x0,%ebx
  89:	eb 03                	jmp    8e <main+0x33>
  8b:	83 c3 01             	add    $0x1,%ebx
  8e:	39 1d e0 0c 00 00    	cmp    %ebx,0xce0
  94:	7e 61                	jle    f7 <main+0x9c>
      int thread_pid = thread_create(worker, 0, 0);
  96:	83 ec 04             	sub    $0x4,%esp
  99:	6a 00                	push   $0x0
  9b:	6a 00                	push   $0x0
  9d:	68 00 00 00 00       	push   $0x0
  a2:	e8 32 01 00 00       	call   1d9 <thread_create>
      assert(thread_pid > 0);
  a7:	83 c4 10             	add    $0x10,%esp
  aa:	85 c0                	test   %eax,%eax
  ac:	7f dd                	jg     8b <main+0x30>
  ae:	6a 25                	push   $0x25
  b0:	68 6c 08 00 00       	push   $0x86c
  b5:	68 76 08 00 00       	push   $0x876
  ba:	6a 01                	push   $0x1
  bc:	e8 fb 04 00 00       	call   5bc <printf>
  c1:	83 c4 0c             	add    $0xc,%esp
  c4:	68 7e 08 00 00       	push   $0x87e
  c9:	68 8d 08 00 00       	push   $0x88d
  ce:	6a 01                	push   $0x1
  d0:	e8 e7 04 00 00       	call   5bc <printf>
  d5:	83 c4 08             	add    $0x8,%esp
  d8:	68 a1 08 00 00       	push   $0x8a1
  dd:	6a 01                	push   $0x1
  df:	e8 d8 04 00 00       	call   5bc <printf>
  e4:	83 c4 04             	add    $0x4,%esp
  e7:	ff 35 08 0d 00 00    	push   0xd08
  ed:	e8 a5 03 00 00       	call   497 <kill>
  f2:	e8 70 03 00 00       	call   467 <exit>
   for (i = 0; i < num_threads; i++) {
  f7:	bb 00 00 00 00       	mov    $0x0,%ebx
  fc:	a1 e0 0c 00 00       	mov    0xce0,%eax
 101:	39 d8                	cmp    %ebx,%eax
 103:	7e 57                	jle    15c <main+0x101>
      int join_pid = thread_join();
 105:	e8 2f 01 00 00       	call   239 <thread_join>
      assert(join_pid > 0);
 10a:	85 c0                	test   %eax,%eax
 10c:	7e 05                	jle    113 <main+0xb8>
   for (i = 0; i < num_threads; i++) {
 10e:	83 c3 01             	add    $0x1,%ebx
 111:	eb e9                	jmp    fc <main+0xa1>
      assert(join_pid > 0);
 113:	6a 2a                	push   $0x2a
 115:	68 6c 08 00 00       	push   $0x86c
 11a:	68 76 08 00 00       	push   $0x876
 11f:	6a 01                	push   $0x1
 121:	e8 96 04 00 00       	call   5bc <printf>
 126:	83 c4 0c             	add    $0xc,%esp
 129:	68 ae 08 00 00       	push   $0x8ae
 12e:	68 8d 08 00 00       	push   $0x88d
 133:	6a 01                	push   $0x1
 135:	e8 82 04 00 00       	call   5bc <printf>
 13a:	83 c4 08             	add    $0x8,%esp
 13d:	68 a1 08 00 00       	push   $0x8a1
 142:	6a 01                	push   $0x1
 144:	e8 73 04 00 00       	call   5bc <printf>
 149:	83 c4 04             	add    $0x4,%esp
 14c:	ff 35 08 0d 00 00    	push   0xd08
 152:	e8 40 03 00 00       	call   497 <kill>
 157:	e8 0b 03 00 00       	call   467 <exit>
   assert(global == num_threads * loops);
 15c:	0f af 05 dc 0c 00 00 	imul   0xcdc,%eax
 163:	3b 05 04 0d 00 00    	cmp    0xd04,%eax
 169:	74 49                	je     1b4 <main+0x159>
 16b:	6a 2d                	push   $0x2d
 16d:	68 6c 08 00 00       	push   $0x86c
 172:	68 76 08 00 00       	push   $0x876
 177:	6a 01                	push   $0x1
 179:	e8 3e 04 00 00       	call   5bc <printf>
 17e:	83 c4 0c             	add    $0xc,%esp
 181:	68 bb 08 00 00       	push   $0x8bb
 186:	68 8d 08 00 00       	push   $0x88d
 18b:	6a 01                	push   $0x1
 18d:	e8 2a 04 00 00       	call   5bc <printf>
 192:	83 c4 08             	add    $0x8,%esp
 195:	68 a1 08 00 00       	push   $0x8a1
 19a:	6a 01                	push   $0x1
 19c:	e8 1b 04 00 00       	call   5bc <printf>
 1a1:	83 c4 04             	add    $0x4,%esp
 1a4:	ff 35 08 0d 00 00    	push   0xd08
 1aa:	e8 e8 02 00 00       	call   497 <kill>
 1af:	e8 b3 02 00 00       	call   467 <exit>
   printf(1, "TEST PASSED\n");
 1b4:	83 ec 08             	sub    $0x8,%esp
 1b7:	68 d9 08 00 00       	push   $0x8d9
 1bc:	6a 01                	push   $0x1
 1be:	e8 f9 03 00 00       	call   5bc <printf>
   exit();
 1c3:	e8 9f 02 00 00       	call   467 <exit>

000001c8 <test_and_set>:
  int flag;
};

struct thread_ref *threads[64];

int test_and_set(int *old_ptr, int new_ptr) {
 1c8:	55                   	push   %ebp
 1c9:	89 e5                	mov    %esp,%ebp
 1cb:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *old_ptr;
 1ce:	8b 10                	mov    (%eax),%edx
  *old_ptr = new_ptr;
 1d0:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 1d3:	89 08                	mov    %ecx,(%eax)
  return old;
}
 1d5:	89 d0                	mov    %edx,%eax
 1d7:	5d                   	pop    %ebp
 1d8:	c3                   	ret    

000001d9 <thread_create>:

// a wrapper func for clone
int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 1d9:	55                   	push   %ebp
 1da:	89 e5                	mov    %esp,%ebp
 1dc:	53                   	push   %ebx
 1dd:	83 ec 10             	sub    $0x10,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE*2);
 1e0:	68 00 20 00 00       	push   $0x2000
 1e5:	e8 f8 05 00 00       	call   7e2 <malloc>
  if(n_stack == 0){
 1ea:	83 c4 10             	add    $0x10,%esp
 1ed:	85 c0                	test   %eax,%eax
 1ef:	74 41                	je     232 <thread_create+0x59>
 1f1:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  int new_pid = clone(start_routine, arg1, arg2, n_stack);
 1f3:	50                   	push   %eax
 1f4:	ff 75 10             	push   0x10(%ebp)
 1f7:	ff 75 0c             	push   0xc(%ebp)
 1fa:	ff 75 08             	push   0x8(%ebp)
 1fd:	e8 05 03 00 00       	call   507 <clone>

  for(int i=0; i<64; i++){
 202:	83 c4 10             	add    $0x10,%esp
 205:	ba 00 00 00 00       	mov    $0x0,%edx
 20a:	eb 03                	jmp    20f <thread_create+0x36>
 20c:	83 c2 01             	add    $0x1,%edx
 20f:	83 fa 3f             	cmp    $0x3f,%edx
 212:	7f 19                	jg     22d <thread_create+0x54>
    if(threads[i]->flag==0){
 214:	8b 0c 95 20 0d 00 00 	mov    0xd20(,%edx,4),%ecx
 21b:	83 79 08 00          	cmpl   $0x0,0x8(%ecx)
 21f:	75 eb                	jne    20c <thread_create+0x33>
      threads[i]->maddr = n_stack;
 221:	89 19                	mov    %ebx,(%ecx)
      threads[i]->pg1addr = n_stack;
 223:	8b 14 95 20 0d 00 00 	mov    0xd20(,%edx,4),%edx
 22a:	89 5a 04             	mov    %ebx,0x4(%edx)
      break;
    }
  }

  return new_pid;
}
 22d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 230:	c9                   	leave  
 231:	c3                   	ret    
    return -1;
 232:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 237:	eb f4                	jmp    22d <thread_create+0x54>

00000239 <thread_join>:

//TODO: fix
int thread_join() {
 239:	55                   	push   %ebp
 23a:	89 e5                	mov    %esp,%ebp
 23c:	56                   	push   %esi
 23d:	53                   	push   %ebx
 23e:	83 ec 1c             	sub    $0x1c,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 241:	8d 45 f4             	lea    -0xc(%ebp),%eax
 244:	50                   	push   %eax
 245:	e8 c5 02 00 00       	call   50f <join>
 24a:	89 c6                	mov    %eax,%esi
  for(int i=0; i<64; i++){
 24c:	83 c4 10             	add    $0x10,%esp
 24f:	bb 00 00 00 00       	mov    $0x0,%ebx
 254:	eb 03                	jmp    259 <thread_join+0x20>
 256:	83 c3 01             	add    $0x1,%ebx
 259:	83 fb 3f             	cmp    $0x3f,%ebx
 25c:	7f 23                	jg     281 <thread_join+0x48>
    if((threads[i]->flag==1) && (stk_addr == threads[i]->pg1addr)){
 25e:	8b 04 9d 20 0d 00 00 	mov    0xd20(,%ebx,4),%eax
 265:	83 78 08 01          	cmpl   $0x1,0x8(%eax)
 269:	75 eb                	jne    256 <thread_join+0x1d>
 26b:	8b 55 f4             	mov    -0xc(%ebp),%edx
 26e:	39 50 04             	cmp    %edx,0x4(%eax)
 271:	75 e3                	jne    256 <thread_join+0x1d>
      free(stk_addr);
 273:	83 ec 0c             	sub    $0xc,%esp
 276:	52                   	push   %edx
 277:	e8 a6 04 00 00       	call   722 <free>
 27c:	83 c4 10             	add    $0x10,%esp
 27f:	eb d5                	jmp    256 <thread_join+0x1d>
    }
  }
  return pid;
}
 281:	89 f0                	mov    %esi,%eax
 283:	8d 65 f8             	lea    -0x8(%ebp),%esp
 286:	5b                   	pop    %ebx
 287:	5e                   	pop    %esi
 288:	5d                   	pop    %ebp
 289:	c3                   	ret    

0000028a <lock_acquire>:

void lock_acquire(lock_t *lock){
 28a:	55                   	push   %ebp
 28b:	89 e5                	mov    %esp,%ebp
 28d:	53                   	push   %ebx
 28e:	83 ec 04             	sub    $0x4,%esp
 291:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 294:	83 ec 08             	sub    $0x8,%esp
 297:	6a 01                	push   $0x1
 299:	53                   	push   %ebx
 29a:	e8 29 ff ff ff       	call   1c8 <test_and_set>
 29f:	83 c4 10             	add    $0x10,%esp
 2a2:	83 f8 01             	cmp    $0x1,%eax
 2a5:	74 ed                	je     294 <lock_acquire+0xa>
    ;
}
 2a7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2aa:	c9                   	leave  
 2ab:	c3                   	ret    

000002ac <lock_release>:

void lock_release(lock_t *lock) {
 2ac:	55                   	push   %ebp
 2ad:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 2af:	8b 45 08             	mov    0x8(%ebp),%eax
 2b2:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 2b8:	5d                   	pop    %ebp
 2b9:	c3                   	ret    

000002ba <lock_init>:

void lock_init(lock_t *lock) {
 2ba:	55                   	push   %ebp
 2bb:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 2bd:	8b 45 08             	mov    0x8(%ebp),%eax
 2c0:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 2c6:	5d                   	pop    %ebp
 2c7:	c3                   	ret    

000002c8 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 2c8:	55                   	push   %ebp
 2c9:	89 e5                	mov    %esp,%ebp
 2cb:	56                   	push   %esi
 2cc:	53                   	push   %ebx
 2cd:	8b 75 08             	mov    0x8(%ebp),%esi
 2d0:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 2d3:	89 f0                	mov    %esi,%eax
 2d5:	89 d1                	mov    %edx,%ecx
 2d7:	83 c2 01             	add    $0x1,%edx
 2da:	89 c3                	mov    %eax,%ebx
 2dc:	83 c0 01             	add    $0x1,%eax
 2df:	0f b6 09             	movzbl (%ecx),%ecx
 2e2:	88 0b                	mov    %cl,(%ebx)
 2e4:	84 c9                	test   %cl,%cl
 2e6:	75 ed                	jne    2d5 <strcpy+0xd>
    ;
  return os;
}
 2e8:	89 f0                	mov    %esi,%eax
 2ea:	5b                   	pop    %ebx
 2eb:	5e                   	pop    %esi
 2ec:	5d                   	pop    %ebp
 2ed:	c3                   	ret    

000002ee <strcmp>:

int
strcmp(const char *p, const char *q)
{
 2ee:	55                   	push   %ebp
 2ef:	89 e5                	mov    %esp,%ebp
 2f1:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2f4:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 2f7:	eb 06                	jmp    2ff <strcmp+0x11>
    p++, q++;
 2f9:	83 c1 01             	add    $0x1,%ecx
 2fc:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 2ff:	0f b6 01             	movzbl (%ecx),%eax
 302:	84 c0                	test   %al,%al
 304:	74 04                	je     30a <strcmp+0x1c>
 306:	3a 02                	cmp    (%edx),%al
 308:	74 ef                	je     2f9 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 30a:	0f b6 c0             	movzbl %al,%eax
 30d:	0f b6 12             	movzbl (%edx),%edx
 310:	29 d0                	sub    %edx,%eax
}
 312:	5d                   	pop    %ebp
 313:	c3                   	ret    

00000314 <strlen>:

uint
strlen(const char *s)
{
 314:	55                   	push   %ebp
 315:	89 e5                	mov    %esp,%ebp
 317:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 31a:	b8 00 00 00 00       	mov    $0x0,%eax
 31f:	eb 03                	jmp    324 <strlen+0x10>
 321:	83 c0 01             	add    $0x1,%eax
 324:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 328:	75 f7                	jne    321 <strlen+0xd>
    ;
  return n;
}
 32a:	5d                   	pop    %ebp
 32b:	c3                   	ret    

0000032c <memset>:

void*
memset(void *dst, int c, uint n)
{
 32c:	55                   	push   %ebp
 32d:	89 e5                	mov    %esp,%ebp
 32f:	57                   	push   %edi
 330:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 333:	89 d7                	mov    %edx,%edi
 335:	8b 4d 10             	mov    0x10(%ebp),%ecx
 338:	8b 45 0c             	mov    0xc(%ebp),%eax
 33b:	fc                   	cld    
 33c:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 33e:	89 d0                	mov    %edx,%eax
 340:	8b 7d fc             	mov    -0x4(%ebp),%edi
 343:	c9                   	leave  
 344:	c3                   	ret    

00000345 <strchr>:

char*
strchr(const char *s, char c)
{
 345:	55                   	push   %ebp
 346:	89 e5                	mov    %esp,%ebp
 348:	8b 45 08             	mov    0x8(%ebp),%eax
 34b:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 34f:	eb 03                	jmp    354 <strchr+0xf>
 351:	83 c0 01             	add    $0x1,%eax
 354:	0f b6 10             	movzbl (%eax),%edx
 357:	84 d2                	test   %dl,%dl
 359:	74 06                	je     361 <strchr+0x1c>
    if(*s == c)
 35b:	38 ca                	cmp    %cl,%dl
 35d:	75 f2                	jne    351 <strchr+0xc>
 35f:	eb 05                	jmp    366 <strchr+0x21>
      return (char*)s;
  return 0;
 361:	b8 00 00 00 00       	mov    $0x0,%eax
}
 366:	5d                   	pop    %ebp
 367:	c3                   	ret    

00000368 <gets>:

char*
gets(char *buf, int max)
{
 368:	55                   	push   %ebp
 369:	89 e5                	mov    %esp,%ebp
 36b:	57                   	push   %edi
 36c:	56                   	push   %esi
 36d:	53                   	push   %ebx
 36e:	83 ec 1c             	sub    $0x1c,%esp
 371:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 374:	bb 00 00 00 00       	mov    $0x0,%ebx
 379:	89 de                	mov    %ebx,%esi
 37b:	83 c3 01             	add    $0x1,%ebx
 37e:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 381:	7d 2e                	jge    3b1 <gets+0x49>
    cc = read(0, &c, 1);
 383:	83 ec 04             	sub    $0x4,%esp
 386:	6a 01                	push   $0x1
 388:	8d 45 e7             	lea    -0x19(%ebp),%eax
 38b:	50                   	push   %eax
 38c:	6a 00                	push   $0x0
 38e:	e8 ec 00 00 00       	call   47f <read>
    if(cc < 1)
 393:	83 c4 10             	add    $0x10,%esp
 396:	85 c0                	test   %eax,%eax
 398:	7e 17                	jle    3b1 <gets+0x49>
      break;
    buf[i++] = c;
 39a:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 39e:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 3a1:	3c 0a                	cmp    $0xa,%al
 3a3:	0f 94 c2             	sete   %dl
 3a6:	3c 0d                	cmp    $0xd,%al
 3a8:	0f 94 c0             	sete   %al
 3ab:	08 c2                	or     %al,%dl
 3ad:	74 ca                	je     379 <gets+0x11>
    buf[i++] = c;
 3af:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 3b1:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 3b5:	89 f8                	mov    %edi,%eax
 3b7:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3ba:	5b                   	pop    %ebx
 3bb:	5e                   	pop    %esi
 3bc:	5f                   	pop    %edi
 3bd:	5d                   	pop    %ebp
 3be:	c3                   	ret    

000003bf <stat>:

int
stat(const char *n, struct stat *st)
{
 3bf:	55                   	push   %ebp
 3c0:	89 e5                	mov    %esp,%ebp
 3c2:	56                   	push   %esi
 3c3:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 3c4:	83 ec 08             	sub    $0x8,%esp
 3c7:	6a 00                	push   $0x0
 3c9:	ff 75 08             	push   0x8(%ebp)
 3cc:	e8 d6 00 00 00       	call   4a7 <open>
  if(fd < 0)
 3d1:	83 c4 10             	add    $0x10,%esp
 3d4:	85 c0                	test   %eax,%eax
 3d6:	78 24                	js     3fc <stat+0x3d>
 3d8:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 3da:	83 ec 08             	sub    $0x8,%esp
 3dd:	ff 75 0c             	push   0xc(%ebp)
 3e0:	50                   	push   %eax
 3e1:	e8 d9 00 00 00       	call   4bf <fstat>
 3e6:	89 c6                	mov    %eax,%esi
  close(fd);
 3e8:	89 1c 24             	mov    %ebx,(%esp)
 3eb:	e8 9f 00 00 00       	call   48f <close>
  return r;
 3f0:	83 c4 10             	add    $0x10,%esp
}
 3f3:	89 f0                	mov    %esi,%eax
 3f5:	8d 65 f8             	lea    -0x8(%ebp),%esp
 3f8:	5b                   	pop    %ebx
 3f9:	5e                   	pop    %esi
 3fa:	5d                   	pop    %ebp
 3fb:	c3                   	ret    
    return -1;
 3fc:	be ff ff ff ff       	mov    $0xffffffff,%esi
 401:	eb f0                	jmp    3f3 <stat+0x34>

00000403 <atoi>:

int
atoi(const char *s)
{
 403:	55                   	push   %ebp
 404:	89 e5                	mov    %esp,%ebp
 406:	53                   	push   %ebx
 407:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 40a:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 40f:	eb 10                	jmp    421 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 411:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 414:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 417:	83 c1 01             	add    $0x1,%ecx
 41a:	0f be c0             	movsbl %al,%eax
 41d:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 421:	0f b6 01             	movzbl (%ecx),%eax
 424:	8d 58 d0             	lea    -0x30(%eax),%ebx
 427:	80 fb 09             	cmp    $0x9,%bl
 42a:	76 e5                	jbe    411 <atoi+0xe>
  return n;
}
 42c:	89 d0                	mov    %edx,%eax
 42e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 431:	c9                   	leave  
 432:	c3                   	ret    

00000433 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 433:	55                   	push   %ebp
 434:	89 e5                	mov    %esp,%ebp
 436:	56                   	push   %esi
 437:	53                   	push   %ebx
 438:	8b 75 08             	mov    0x8(%ebp),%esi
 43b:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 43e:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 441:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 443:	eb 0d                	jmp    452 <memmove+0x1f>
    *dst++ = *src++;
 445:	0f b6 01             	movzbl (%ecx),%eax
 448:	88 02                	mov    %al,(%edx)
 44a:	8d 49 01             	lea    0x1(%ecx),%ecx
 44d:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 450:	89 d8                	mov    %ebx,%eax
 452:	8d 58 ff             	lea    -0x1(%eax),%ebx
 455:	85 c0                	test   %eax,%eax
 457:	7f ec                	jg     445 <memmove+0x12>
  return vdst;
}
 459:	89 f0                	mov    %esi,%eax
 45b:	5b                   	pop    %ebx
 45c:	5e                   	pop    %esi
 45d:	5d                   	pop    %ebp
 45e:	c3                   	ret    

0000045f <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 45f:	b8 01 00 00 00       	mov    $0x1,%eax
 464:	cd 40                	int    $0x40
 466:	c3                   	ret    

00000467 <exit>:
SYSCALL(exit)
 467:	b8 02 00 00 00       	mov    $0x2,%eax
 46c:	cd 40                	int    $0x40
 46e:	c3                   	ret    

0000046f <wait>:
SYSCALL(wait)
 46f:	b8 03 00 00 00       	mov    $0x3,%eax
 474:	cd 40                	int    $0x40
 476:	c3                   	ret    

00000477 <pipe>:
SYSCALL(pipe)
 477:	b8 04 00 00 00       	mov    $0x4,%eax
 47c:	cd 40                	int    $0x40
 47e:	c3                   	ret    

0000047f <read>:
SYSCALL(read)
 47f:	b8 05 00 00 00       	mov    $0x5,%eax
 484:	cd 40                	int    $0x40
 486:	c3                   	ret    

00000487 <write>:
SYSCALL(write)
 487:	b8 10 00 00 00       	mov    $0x10,%eax
 48c:	cd 40                	int    $0x40
 48e:	c3                   	ret    

0000048f <close>:
SYSCALL(close)
 48f:	b8 15 00 00 00       	mov    $0x15,%eax
 494:	cd 40                	int    $0x40
 496:	c3                   	ret    

00000497 <kill>:
SYSCALL(kill)
 497:	b8 06 00 00 00       	mov    $0x6,%eax
 49c:	cd 40                	int    $0x40
 49e:	c3                   	ret    

0000049f <exec>:
SYSCALL(exec)
 49f:	b8 07 00 00 00       	mov    $0x7,%eax
 4a4:	cd 40                	int    $0x40
 4a6:	c3                   	ret    

000004a7 <open>:
SYSCALL(open)
 4a7:	b8 0f 00 00 00       	mov    $0xf,%eax
 4ac:	cd 40                	int    $0x40
 4ae:	c3                   	ret    

000004af <mknod>:
SYSCALL(mknod)
 4af:	b8 11 00 00 00       	mov    $0x11,%eax
 4b4:	cd 40                	int    $0x40
 4b6:	c3                   	ret    

000004b7 <unlink>:
SYSCALL(unlink)
 4b7:	b8 12 00 00 00       	mov    $0x12,%eax
 4bc:	cd 40                	int    $0x40
 4be:	c3                   	ret    

000004bf <fstat>:
SYSCALL(fstat)
 4bf:	b8 08 00 00 00       	mov    $0x8,%eax
 4c4:	cd 40                	int    $0x40
 4c6:	c3                   	ret    

000004c7 <link>:
SYSCALL(link)
 4c7:	b8 13 00 00 00       	mov    $0x13,%eax
 4cc:	cd 40                	int    $0x40
 4ce:	c3                   	ret    

000004cf <mkdir>:
SYSCALL(mkdir)
 4cf:	b8 14 00 00 00       	mov    $0x14,%eax
 4d4:	cd 40                	int    $0x40
 4d6:	c3                   	ret    

000004d7 <chdir>:
SYSCALL(chdir)
 4d7:	b8 09 00 00 00       	mov    $0x9,%eax
 4dc:	cd 40                	int    $0x40
 4de:	c3                   	ret    

000004df <dup>:
SYSCALL(dup)
 4df:	b8 0a 00 00 00       	mov    $0xa,%eax
 4e4:	cd 40                	int    $0x40
 4e6:	c3                   	ret    

000004e7 <getpid>:
SYSCALL(getpid)
 4e7:	b8 0b 00 00 00       	mov    $0xb,%eax
 4ec:	cd 40                	int    $0x40
 4ee:	c3                   	ret    

000004ef <sbrk>:
SYSCALL(sbrk)
 4ef:	b8 0c 00 00 00       	mov    $0xc,%eax
 4f4:	cd 40                	int    $0x40
 4f6:	c3                   	ret    

000004f7 <sleep>:
SYSCALL(sleep)
 4f7:	b8 0d 00 00 00       	mov    $0xd,%eax
 4fc:	cd 40                	int    $0x40
 4fe:	c3                   	ret    

000004ff <uptime>:
SYSCALL(uptime)
 4ff:	b8 0e 00 00 00       	mov    $0xe,%eax
 504:	cd 40                	int    $0x40
 506:	c3                   	ret    

00000507 <clone>:
SYSCALL(clone)
 507:	b8 16 00 00 00       	mov    $0x16,%eax
 50c:	cd 40                	int    $0x40
 50e:	c3                   	ret    

0000050f <join>:
 50f:	b8 17 00 00 00       	mov    $0x17,%eax
 514:	cd 40                	int    $0x40
 516:	c3                   	ret    

00000517 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 517:	55                   	push   %ebp
 518:	89 e5                	mov    %esp,%ebp
 51a:	83 ec 1c             	sub    $0x1c,%esp
 51d:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 520:	6a 01                	push   $0x1
 522:	8d 55 f4             	lea    -0xc(%ebp),%edx
 525:	52                   	push   %edx
 526:	50                   	push   %eax
 527:	e8 5b ff ff ff       	call   487 <write>
}
 52c:	83 c4 10             	add    $0x10,%esp
 52f:	c9                   	leave  
 530:	c3                   	ret    

00000531 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 531:	55                   	push   %ebp
 532:	89 e5                	mov    %esp,%ebp
 534:	57                   	push   %edi
 535:	56                   	push   %esi
 536:	53                   	push   %ebx
 537:	83 ec 2c             	sub    $0x2c,%esp
 53a:	89 45 d0             	mov    %eax,-0x30(%ebp)
 53d:	89 d0                	mov    %edx,%eax
 53f:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 541:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 545:	0f 95 c1             	setne  %cl
 548:	c1 ea 1f             	shr    $0x1f,%edx
 54b:	84 d1                	test   %dl,%cl
 54d:	74 44                	je     593 <printint+0x62>
    neg = 1;
    x = -xx;
 54f:	f7 d8                	neg    %eax
 551:	89 c1                	mov    %eax,%ecx
    neg = 1;
 553:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 55a:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 55f:	89 c8                	mov    %ecx,%eax
 561:	ba 00 00 00 00       	mov    $0x0,%edx
 566:	f7 f6                	div    %esi
 568:	89 df                	mov    %ebx,%edi
 56a:	83 c3 01             	add    $0x1,%ebx
 56d:	0f b6 92 48 09 00 00 	movzbl 0x948(%edx),%edx
 574:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 578:	89 ca                	mov    %ecx,%edx
 57a:	89 c1                	mov    %eax,%ecx
 57c:	39 d6                	cmp    %edx,%esi
 57e:	76 df                	jbe    55f <printint+0x2e>
  if(neg)
 580:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 584:	74 31                	je     5b7 <printint+0x86>
    buf[i++] = '-';
 586:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 58b:	8d 5f 02             	lea    0x2(%edi),%ebx
 58e:	8b 75 d0             	mov    -0x30(%ebp),%esi
 591:	eb 17                	jmp    5aa <printint+0x79>
    x = xx;
 593:	89 c1                	mov    %eax,%ecx
  neg = 0;
 595:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 59c:	eb bc                	jmp    55a <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 59e:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 5a3:	89 f0                	mov    %esi,%eax
 5a5:	e8 6d ff ff ff       	call   517 <putc>
  while(--i >= 0)
 5aa:	83 eb 01             	sub    $0x1,%ebx
 5ad:	79 ef                	jns    59e <printint+0x6d>
}
 5af:	83 c4 2c             	add    $0x2c,%esp
 5b2:	5b                   	pop    %ebx
 5b3:	5e                   	pop    %esi
 5b4:	5f                   	pop    %edi
 5b5:	5d                   	pop    %ebp
 5b6:	c3                   	ret    
 5b7:	8b 75 d0             	mov    -0x30(%ebp),%esi
 5ba:	eb ee                	jmp    5aa <printint+0x79>

000005bc <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5bc:	55                   	push   %ebp
 5bd:	89 e5                	mov    %esp,%ebp
 5bf:	57                   	push   %edi
 5c0:	56                   	push   %esi
 5c1:	53                   	push   %ebx
 5c2:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 5c5:	8d 45 10             	lea    0x10(%ebp),%eax
 5c8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 5cb:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 5d0:	bb 00 00 00 00       	mov    $0x0,%ebx
 5d5:	eb 14                	jmp    5eb <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 5d7:	89 fa                	mov    %edi,%edx
 5d9:	8b 45 08             	mov    0x8(%ebp),%eax
 5dc:	e8 36 ff ff ff       	call   517 <putc>
 5e1:	eb 05                	jmp    5e8 <printf+0x2c>
      }
    } else if(state == '%'){
 5e3:	83 fe 25             	cmp    $0x25,%esi
 5e6:	74 25                	je     60d <printf+0x51>
  for(i = 0; fmt[i]; i++){
 5e8:	83 c3 01             	add    $0x1,%ebx
 5eb:	8b 45 0c             	mov    0xc(%ebp),%eax
 5ee:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 5f2:	84 c0                	test   %al,%al
 5f4:	0f 84 20 01 00 00    	je     71a <printf+0x15e>
    c = fmt[i] & 0xff;
 5fa:	0f be f8             	movsbl %al,%edi
 5fd:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 600:	85 f6                	test   %esi,%esi
 602:	75 df                	jne    5e3 <printf+0x27>
      if(c == '%'){
 604:	83 f8 25             	cmp    $0x25,%eax
 607:	75 ce                	jne    5d7 <printf+0x1b>
        state = '%';
 609:	89 c6                	mov    %eax,%esi
 60b:	eb db                	jmp    5e8 <printf+0x2c>
      if(c == 'd'){
 60d:	83 f8 25             	cmp    $0x25,%eax
 610:	0f 84 cf 00 00 00    	je     6e5 <printf+0x129>
 616:	0f 8c dd 00 00 00    	jl     6f9 <printf+0x13d>
 61c:	83 f8 78             	cmp    $0x78,%eax
 61f:	0f 8f d4 00 00 00    	jg     6f9 <printf+0x13d>
 625:	83 f8 63             	cmp    $0x63,%eax
 628:	0f 8c cb 00 00 00    	jl     6f9 <printf+0x13d>
 62e:	83 e8 63             	sub    $0x63,%eax
 631:	83 f8 15             	cmp    $0x15,%eax
 634:	0f 87 bf 00 00 00    	ja     6f9 <printf+0x13d>
 63a:	ff 24 85 f0 08 00 00 	jmp    *0x8f0(,%eax,4)
        printint(fd, *ap, 10, 1);
 641:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 644:	8b 17                	mov    (%edi),%edx
 646:	83 ec 0c             	sub    $0xc,%esp
 649:	6a 01                	push   $0x1
 64b:	b9 0a 00 00 00       	mov    $0xa,%ecx
 650:	8b 45 08             	mov    0x8(%ebp),%eax
 653:	e8 d9 fe ff ff       	call   531 <printint>
        ap++;
 658:	83 c7 04             	add    $0x4,%edi
 65b:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 65e:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 661:	be 00 00 00 00       	mov    $0x0,%esi
 666:	eb 80                	jmp    5e8 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 668:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 66b:	8b 17                	mov    (%edi),%edx
 66d:	83 ec 0c             	sub    $0xc,%esp
 670:	6a 00                	push   $0x0
 672:	b9 10 00 00 00       	mov    $0x10,%ecx
 677:	8b 45 08             	mov    0x8(%ebp),%eax
 67a:	e8 b2 fe ff ff       	call   531 <printint>
        ap++;
 67f:	83 c7 04             	add    $0x4,%edi
 682:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 685:	83 c4 10             	add    $0x10,%esp
      state = 0;
 688:	be 00 00 00 00       	mov    $0x0,%esi
 68d:	e9 56 ff ff ff       	jmp    5e8 <printf+0x2c>
        s = (char*)*ap;
 692:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 695:	8b 30                	mov    (%eax),%esi
        ap++;
 697:	83 c0 04             	add    $0x4,%eax
 69a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 69d:	85 f6                	test   %esi,%esi
 69f:	75 15                	jne    6b6 <printf+0xfa>
          s = "(null)";
 6a1:	be e6 08 00 00       	mov    $0x8e6,%esi
 6a6:	eb 0e                	jmp    6b6 <printf+0xfa>
          putc(fd, *s);
 6a8:	0f be d2             	movsbl %dl,%edx
 6ab:	8b 45 08             	mov    0x8(%ebp),%eax
 6ae:	e8 64 fe ff ff       	call   517 <putc>
          s++;
 6b3:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 6b6:	0f b6 16             	movzbl (%esi),%edx
 6b9:	84 d2                	test   %dl,%dl
 6bb:	75 eb                	jne    6a8 <printf+0xec>
      state = 0;
 6bd:	be 00 00 00 00       	mov    $0x0,%esi
 6c2:	e9 21 ff ff ff       	jmp    5e8 <printf+0x2c>
        putc(fd, *ap);
 6c7:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6ca:	0f be 17             	movsbl (%edi),%edx
 6cd:	8b 45 08             	mov    0x8(%ebp),%eax
 6d0:	e8 42 fe ff ff       	call   517 <putc>
        ap++;
 6d5:	83 c7 04             	add    $0x4,%edi
 6d8:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 6db:	be 00 00 00 00       	mov    $0x0,%esi
 6e0:	e9 03 ff ff ff       	jmp    5e8 <printf+0x2c>
        putc(fd, c);
 6e5:	89 fa                	mov    %edi,%edx
 6e7:	8b 45 08             	mov    0x8(%ebp),%eax
 6ea:	e8 28 fe ff ff       	call   517 <putc>
      state = 0;
 6ef:	be 00 00 00 00       	mov    $0x0,%esi
 6f4:	e9 ef fe ff ff       	jmp    5e8 <printf+0x2c>
        putc(fd, '%');
 6f9:	ba 25 00 00 00       	mov    $0x25,%edx
 6fe:	8b 45 08             	mov    0x8(%ebp),%eax
 701:	e8 11 fe ff ff       	call   517 <putc>
        putc(fd, c);
 706:	89 fa                	mov    %edi,%edx
 708:	8b 45 08             	mov    0x8(%ebp),%eax
 70b:	e8 07 fe ff ff       	call   517 <putc>
      state = 0;
 710:	be 00 00 00 00       	mov    $0x0,%esi
 715:	e9 ce fe ff ff       	jmp    5e8 <printf+0x2c>
    }
  }
}
 71a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 71d:	5b                   	pop    %ebx
 71e:	5e                   	pop    %esi
 71f:	5f                   	pop    %edi
 720:	5d                   	pop    %ebp
 721:	c3                   	ret    

00000722 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 722:	55                   	push   %ebp
 723:	89 e5                	mov    %esp,%ebp
 725:	57                   	push   %edi
 726:	56                   	push   %esi
 727:	53                   	push   %ebx
 728:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 72b:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 72e:	a1 20 0e 00 00       	mov    0xe20,%eax
 733:	eb 02                	jmp    737 <free+0x15>
 735:	89 d0                	mov    %edx,%eax
 737:	39 c8                	cmp    %ecx,%eax
 739:	73 04                	jae    73f <free+0x1d>
 73b:	39 08                	cmp    %ecx,(%eax)
 73d:	77 12                	ja     751 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 73f:	8b 10                	mov    (%eax),%edx
 741:	39 c2                	cmp    %eax,%edx
 743:	77 f0                	ja     735 <free+0x13>
 745:	39 c8                	cmp    %ecx,%eax
 747:	72 08                	jb     751 <free+0x2f>
 749:	39 ca                	cmp    %ecx,%edx
 74b:	77 04                	ja     751 <free+0x2f>
 74d:	89 d0                	mov    %edx,%eax
 74f:	eb e6                	jmp    737 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 751:	8b 73 fc             	mov    -0x4(%ebx),%esi
 754:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 757:	8b 10                	mov    (%eax),%edx
 759:	39 d7                	cmp    %edx,%edi
 75b:	74 19                	je     776 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 75d:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 760:	8b 50 04             	mov    0x4(%eax),%edx
 763:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 766:	39 ce                	cmp    %ecx,%esi
 768:	74 1b                	je     785 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 76a:	89 08                	mov    %ecx,(%eax)
  freep = p;
 76c:	a3 20 0e 00 00       	mov    %eax,0xe20
}
 771:	5b                   	pop    %ebx
 772:	5e                   	pop    %esi
 773:	5f                   	pop    %edi
 774:	5d                   	pop    %ebp
 775:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 776:	03 72 04             	add    0x4(%edx),%esi
 779:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 77c:	8b 10                	mov    (%eax),%edx
 77e:	8b 12                	mov    (%edx),%edx
 780:	89 53 f8             	mov    %edx,-0x8(%ebx)
 783:	eb db                	jmp    760 <free+0x3e>
    p->s.size += bp->s.size;
 785:	03 53 fc             	add    -0x4(%ebx),%edx
 788:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 78b:	8b 53 f8             	mov    -0x8(%ebx),%edx
 78e:	89 10                	mov    %edx,(%eax)
 790:	eb da                	jmp    76c <free+0x4a>

00000792 <morecore>:

static Header*
morecore(uint nu)
{
 792:	55                   	push   %ebp
 793:	89 e5                	mov    %esp,%ebp
 795:	53                   	push   %ebx
 796:	83 ec 04             	sub    $0x4,%esp
 799:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 79b:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 7a0:	77 05                	ja     7a7 <morecore+0x15>
    nu = 4096;
 7a2:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 7a7:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 7ae:	83 ec 0c             	sub    $0xc,%esp
 7b1:	50                   	push   %eax
 7b2:	e8 38 fd ff ff       	call   4ef <sbrk>
  if(p == (char*)-1)
 7b7:	83 c4 10             	add    $0x10,%esp
 7ba:	83 f8 ff             	cmp    $0xffffffff,%eax
 7bd:	74 1c                	je     7db <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 7bf:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 7c2:	83 c0 08             	add    $0x8,%eax
 7c5:	83 ec 0c             	sub    $0xc,%esp
 7c8:	50                   	push   %eax
 7c9:	e8 54 ff ff ff       	call   722 <free>
  return freep;
 7ce:	a1 20 0e 00 00       	mov    0xe20,%eax
 7d3:	83 c4 10             	add    $0x10,%esp
}
 7d6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 7d9:	c9                   	leave  
 7da:	c3                   	ret    
    return 0;
 7db:	b8 00 00 00 00       	mov    $0x0,%eax
 7e0:	eb f4                	jmp    7d6 <morecore+0x44>

000007e2 <malloc>:

void*
malloc(uint nbytes)
{
 7e2:	55                   	push   %ebp
 7e3:	89 e5                	mov    %esp,%ebp
 7e5:	53                   	push   %ebx
 7e6:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7e9:	8b 45 08             	mov    0x8(%ebp),%eax
 7ec:	8d 58 07             	lea    0x7(%eax),%ebx
 7ef:	c1 eb 03             	shr    $0x3,%ebx
 7f2:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 7f5:	8b 0d 20 0e 00 00    	mov    0xe20,%ecx
 7fb:	85 c9                	test   %ecx,%ecx
 7fd:	74 04                	je     803 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7ff:	8b 01                	mov    (%ecx),%eax
 801:	eb 4a                	jmp    84d <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 803:	c7 05 20 0e 00 00 24 	movl   $0xe24,0xe20
 80a:	0e 00 00 
 80d:	c7 05 24 0e 00 00 24 	movl   $0xe24,0xe24
 814:	0e 00 00 
    base.s.size = 0;
 817:	c7 05 28 0e 00 00 00 	movl   $0x0,0xe28
 81e:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 821:	b9 24 0e 00 00       	mov    $0xe24,%ecx
 826:	eb d7                	jmp    7ff <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 828:	74 19                	je     843 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 82a:	29 da                	sub    %ebx,%edx
 82c:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 82f:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 832:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 835:	89 0d 20 0e 00 00    	mov    %ecx,0xe20
      return (void*)(p + 1);
 83b:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 83e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 841:	c9                   	leave  
 842:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 843:	8b 10                	mov    (%eax),%edx
 845:	89 11                	mov    %edx,(%ecx)
 847:	eb ec                	jmp    835 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 849:	89 c1                	mov    %eax,%ecx
 84b:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 84d:	8b 50 04             	mov    0x4(%eax),%edx
 850:	39 da                	cmp    %ebx,%edx
 852:	73 d4                	jae    828 <malloc+0x46>
    if(p == freep)
 854:	39 05 20 0e 00 00    	cmp    %eax,0xe20
 85a:	75 ed                	jne    849 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 85c:	89 d8                	mov    %ebx,%eax
 85e:	e8 2f ff ff ff       	call   792 <morecore>
 863:	85 c0                	test   %eax,%eax
 865:	75 e2                	jne    849 <malloc+0x67>
 867:	eb d5                	jmp    83e <malloc+0x5c>
