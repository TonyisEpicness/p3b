
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
  26:	e8 89 02 00 00       	call   2b4 <lock_release>
   for (i = 0; i < loops; i++) {
  2b:	83 c3 01             	add    $0x1,%ebx
  2e:	83 c4 10             	add    $0x10,%esp
  31:	39 1d e0 0c 00 00    	cmp    %ebx,0xce0
  37:	7e 1d                	jle    56 <worker+0x56>
      lock_acquire(&lock);
  39:	83 ec 0c             	sub    $0xc,%esp
  3c:	68 00 0d 00 00       	push   $0xd00
  41:	e8 4c 02 00 00       	call   292 <lock_acquire>
      tmp = global;
  46:	8b 15 04 0d 00 00    	mov    0xd04,%edx
      for(j = 0; j < 50; j++); // take some time
  4c:	83 c4 10             	add    $0x10,%esp
  4f:	b8 00 00 00 00       	mov    $0x0,%eax
  54:	eb bb                	jmp    11 <worker+0x11>
   }
   exit();
  56:	e8 14 04 00 00       	call   46f <exit>

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
  6a:	e8 80 04 00 00       	call   4ef <getpid>
  6f:	a3 08 0d 00 00       	mov    %eax,0xd08
   lock_init(&lock);
  74:	83 ec 0c             	sub    $0xc,%esp
  77:	68 00 0d 00 00       	push   $0xd00
  7c:	e8 41 02 00 00       	call   2c2 <lock_init>
   for (i = 0; i < num_threads; i++) {
  81:	83 c4 10             	add    $0x10,%esp
  84:	bb 00 00 00 00       	mov    $0x0,%ebx
  89:	eb 03                	jmp    8e <main+0x33>
  8b:	83 c3 01             	add    $0x1,%ebx
  8e:	39 1d e4 0c 00 00    	cmp    %ebx,0xce4
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
  b0:	68 74 08 00 00       	push   $0x874
  b5:	68 7e 08 00 00       	push   $0x87e
  ba:	6a 01                	push   $0x1
  bc:	e8 03 05 00 00       	call   5c4 <printf>
  c1:	83 c4 0c             	add    $0xc,%esp
  c4:	68 86 08 00 00       	push   $0x886
  c9:	68 95 08 00 00       	push   $0x895
  ce:	6a 01                	push   $0x1
  d0:	e8 ef 04 00 00       	call   5c4 <printf>
  d5:	83 c4 08             	add    $0x8,%esp
  d8:	68 a9 08 00 00       	push   $0x8a9
  dd:	6a 01                	push   $0x1
  df:	e8 e0 04 00 00       	call   5c4 <printf>
  e4:	83 c4 04             	add    $0x4,%esp
  e7:	ff 35 08 0d 00 00    	push   0xd08
  ed:	e8 ad 03 00 00       	call   49f <kill>
  f2:	e8 78 03 00 00       	call   46f <exit>
   for (i = 0; i < num_threads; i++) {
  f7:	bb 00 00 00 00       	mov    $0x0,%ebx
  fc:	a1 e4 0c 00 00       	mov    0xce4,%eax
 101:	39 d8                	cmp    %ebx,%eax
 103:	7e 57                	jle    15c <main+0x101>
      int join_pid = thread_join();
 105:	e8 37 01 00 00       	call   241 <thread_join>
      assert(join_pid > 0);
 10a:	85 c0                	test   %eax,%eax
 10c:	7e 05                	jle    113 <main+0xb8>
   for (i = 0; i < num_threads; i++) {
 10e:	83 c3 01             	add    $0x1,%ebx
 111:	eb e9                	jmp    fc <main+0xa1>
      assert(join_pid > 0);
 113:	6a 2a                	push   $0x2a
 115:	68 74 08 00 00       	push   $0x874
 11a:	68 7e 08 00 00       	push   $0x87e
 11f:	6a 01                	push   $0x1
 121:	e8 9e 04 00 00       	call   5c4 <printf>
 126:	83 c4 0c             	add    $0xc,%esp
 129:	68 b6 08 00 00       	push   $0x8b6
 12e:	68 95 08 00 00       	push   $0x895
 133:	6a 01                	push   $0x1
 135:	e8 8a 04 00 00       	call   5c4 <printf>
 13a:	83 c4 08             	add    $0x8,%esp
 13d:	68 a9 08 00 00       	push   $0x8a9
 142:	6a 01                	push   $0x1
 144:	e8 7b 04 00 00       	call   5c4 <printf>
 149:	83 c4 04             	add    $0x4,%esp
 14c:	ff 35 08 0d 00 00    	push   0xd08
 152:	e8 48 03 00 00       	call   49f <kill>
 157:	e8 13 03 00 00       	call   46f <exit>
   assert(global == num_threads * loops);
 15c:	0f af 05 e0 0c 00 00 	imul   0xce0,%eax
 163:	3b 05 04 0d 00 00    	cmp    0xd04,%eax
 169:	74 49                	je     1b4 <main+0x159>
 16b:	6a 2d                	push   $0x2d
 16d:	68 74 08 00 00       	push   $0x874
 172:	68 7e 08 00 00       	push   $0x87e
 177:	6a 01                	push   $0x1
 179:	e8 46 04 00 00       	call   5c4 <printf>
 17e:	83 c4 0c             	add    $0xc,%esp
 181:	68 c3 08 00 00       	push   $0x8c3
 186:	68 95 08 00 00       	push   $0x895
 18b:	6a 01                	push   $0x1
 18d:	e8 32 04 00 00       	call   5c4 <printf>
 192:	83 c4 08             	add    $0x8,%esp
 195:	68 a9 08 00 00       	push   $0x8a9
 19a:	6a 01                	push   $0x1
 19c:	e8 23 04 00 00       	call   5c4 <printf>
 1a1:	83 c4 04             	add    $0x4,%esp
 1a4:	ff 35 08 0d 00 00    	push   0xd08
 1aa:	e8 f0 02 00 00       	call   49f <kill>
 1af:	e8 bb 02 00 00       	call   46f <exit>
   printf(1, "TEST PASSED\n");
 1b4:	83 ec 08             	sub    $0x8,%esp
 1b7:	68 e1 08 00 00       	push   $0x8e1
 1bc:	6a 01                	push   $0x1
 1be:	e8 01 04 00 00       	call   5c4 <printf>
   exit();
 1c3:	e8 a7 02 00 00       	call   46f <exit>

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
 1dc:	83 ec 14             	sub    $0x14,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE*2);
 1df:	68 00 20 00 00       	push   $0x2000
 1e4:	e8 01 06 00 00       	call   7ea <malloc>
  if(n_stack == 0){
 1e9:	83 c4 10             	add    $0x10,%esp
 1ec:	85 c0                	test   %eax,%eax
 1ee:	74 4a                	je     23a <thread_create+0x61>
    return -1;
  }
  
  for(int i=0; i<64; i++){
 1f0:	ba 00 00 00 00       	mov    $0x0,%edx
 1f5:	eb 03                	jmp    1fa <thread_create+0x21>
 1f7:	83 c2 01             	add    $0x1,%edx
 1fa:	83 fa 3f             	cmp    $0x3f,%edx
 1fd:	7f 27                	jg     226 <thread_create+0x4d>
    if(threads[i]->flag==0){
 1ff:	8b 0c 95 20 0d 00 00 	mov    0xd20(,%edx,4),%ecx
 206:	83 79 08 00          	cmpl   $0x0,0x8(%ecx)
 20a:	75 eb                	jne    1f7 <thread_create+0x1e>
      threads[i]->maddr = n_stack;
 20c:	89 01                	mov    %eax,(%ecx)
      threads[i]->pg1addr = n_stack;
 20e:	8b 0c 95 20 0d 00 00 	mov    0xd20(,%edx,4),%ecx
 215:	89 41 04             	mov    %eax,0x4(%ecx)
      threads[i]->flag = 1;
 218:	8b 14 95 20 0d 00 00 	mov    0xd20(,%edx,4),%edx
 21f:	c7 42 08 01 00 00 00 	movl   $0x1,0x8(%edx)
      break;
    }
  }
  
  int new_pid = clone(start_routine, arg1, arg2, n_stack); // TODO: is this the right way to call it?
 226:	50                   	push   %eax
 227:	ff 75 10             	push   0x10(%ebp)
 22a:	ff 75 0c             	push   0xc(%ebp)
 22d:	ff 75 08             	push   0x8(%ebp)
 230:	e8 da 02 00 00       	call   50f <clone>

  // I can't remember if there was something else to do here but I'm sure I'll find out



  return new_pid;
 235:	83 c4 10             	add    $0x10,%esp
}
 238:	c9                   	leave  
 239:	c3                   	ret    
    return -1;
 23a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 23f:	eb f7                	jmp    238 <thread_create+0x5f>

00000241 <thread_join>:

//TODO: fix
int thread_join() {
 241:	55                   	push   %ebp
 242:	89 e5                	mov    %esp,%ebp
 244:	56                   	push   %esi
 245:	53                   	push   %ebx
 246:	83 ec 1c             	sub    $0x1c,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 249:	8d 45 f4             	lea    -0xc(%ebp),%eax
 24c:	50                   	push   %eax
 24d:	e8 c5 02 00 00       	call   517 <join>
 252:	89 c6                	mov    %eax,%esi
  for(int i=0; i<64; i++){
 254:	83 c4 10             	add    $0x10,%esp
 257:	bb 00 00 00 00       	mov    $0x0,%ebx
 25c:	eb 03                	jmp    261 <thread_join+0x20>
 25e:	83 c3 01             	add    $0x1,%ebx
 261:	83 fb 3f             	cmp    $0x3f,%ebx
 264:	7f 23                	jg     289 <thread_join+0x48>
    if((threads[i]->flag==1) && (stk_addr == threads[i]->pg1addr)){
 266:	8b 04 9d 20 0d 00 00 	mov    0xd20(,%ebx,4),%eax
 26d:	83 78 08 01          	cmpl   $0x1,0x8(%eax)
 271:	75 eb                	jne    25e <thread_join+0x1d>
 273:	8b 55 f4             	mov    -0xc(%ebp),%edx
 276:	39 50 04             	cmp    %edx,0x4(%eax)
 279:	75 e3                	jne    25e <thread_join+0x1d>
      free(stk_addr);
 27b:	83 ec 0c             	sub    $0xc,%esp
 27e:	52                   	push   %edx
 27f:	e8 a6 04 00 00       	call   72a <free>
 284:	83 c4 10             	add    $0x10,%esp
 287:	eb d5                	jmp    25e <thread_join+0x1d>
    }
  }
  return pid;
}
 289:	89 f0                	mov    %esi,%eax
 28b:	8d 65 f8             	lea    -0x8(%ebp),%esp
 28e:	5b                   	pop    %ebx
 28f:	5e                   	pop    %esi
 290:	5d                   	pop    %ebp
 291:	c3                   	ret    

00000292 <lock_acquire>:

void lock_acquire(lock_t *lock){
 292:	55                   	push   %ebp
 293:	89 e5                	mov    %esp,%ebp
 295:	53                   	push   %ebx
 296:	83 ec 04             	sub    $0x4,%esp
 299:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 29c:	83 ec 08             	sub    $0x8,%esp
 29f:	6a 01                	push   $0x1
 2a1:	53                   	push   %ebx
 2a2:	e8 21 ff ff ff       	call   1c8 <test_and_set>
 2a7:	83 c4 10             	add    $0x10,%esp
 2aa:	83 f8 01             	cmp    $0x1,%eax
 2ad:	74 ed                	je     29c <lock_acquire+0xa>
    ;
}
 2af:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2b2:	c9                   	leave  
 2b3:	c3                   	ret    

000002b4 <lock_release>:

void lock_release(lock_t *lock) {
 2b4:	55                   	push   %ebp
 2b5:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 2b7:	8b 45 08             	mov    0x8(%ebp),%eax
 2ba:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 2c0:	5d                   	pop    %ebp
 2c1:	c3                   	ret    

000002c2 <lock_init>:

void lock_init(lock_t *lock) {
 2c2:	55                   	push   %ebp
 2c3:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 2c5:	8b 45 08             	mov    0x8(%ebp),%eax
 2c8:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 2ce:	5d                   	pop    %ebp
 2cf:	c3                   	ret    

000002d0 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 2d0:	55                   	push   %ebp
 2d1:	89 e5                	mov    %esp,%ebp
 2d3:	56                   	push   %esi
 2d4:	53                   	push   %ebx
 2d5:	8b 75 08             	mov    0x8(%ebp),%esi
 2d8:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 2db:	89 f0                	mov    %esi,%eax
 2dd:	89 d1                	mov    %edx,%ecx
 2df:	83 c2 01             	add    $0x1,%edx
 2e2:	89 c3                	mov    %eax,%ebx
 2e4:	83 c0 01             	add    $0x1,%eax
 2e7:	0f b6 09             	movzbl (%ecx),%ecx
 2ea:	88 0b                	mov    %cl,(%ebx)
 2ec:	84 c9                	test   %cl,%cl
 2ee:	75 ed                	jne    2dd <strcpy+0xd>
    ;
  return os;
}
 2f0:	89 f0                	mov    %esi,%eax
 2f2:	5b                   	pop    %ebx
 2f3:	5e                   	pop    %esi
 2f4:	5d                   	pop    %ebp
 2f5:	c3                   	ret    

000002f6 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 2f6:	55                   	push   %ebp
 2f7:	89 e5                	mov    %esp,%ebp
 2f9:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2fc:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 2ff:	eb 06                	jmp    307 <strcmp+0x11>
    p++, q++;
 301:	83 c1 01             	add    $0x1,%ecx
 304:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 307:	0f b6 01             	movzbl (%ecx),%eax
 30a:	84 c0                	test   %al,%al
 30c:	74 04                	je     312 <strcmp+0x1c>
 30e:	3a 02                	cmp    (%edx),%al
 310:	74 ef                	je     301 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 312:	0f b6 c0             	movzbl %al,%eax
 315:	0f b6 12             	movzbl (%edx),%edx
 318:	29 d0                	sub    %edx,%eax
}
 31a:	5d                   	pop    %ebp
 31b:	c3                   	ret    

0000031c <strlen>:

uint
strlen(const char *s)
{
 31c:	55                   	push   %ebp
 31d:	89 e5                	mov    %esp,%ebp
 31f:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 322:	b8 00 00 00 00       	mov    $0x0,%eax
 327:	eb 03                	jmp    32c <strlen+0x10>
 329:	83 c0 01             	add    $0x1,%eax
 32c:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 330:	75 f7                	jne    329 <strlen+0xd>
    ;
  return n;
}
 332:	5d                   	pop    %ebp
 333:	c3                   	ret    

00000334 <memset>:

void*
memset(void *dst, int c, uint n)
{
 334:	55                   	push   %ebp
 335:	89 e5                	mov    %esp,%ebp
 337:	57                   	push   %edi
 338:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 33b:	89 d7                	mov    %edx,%edi
 33d:	8b 4d 10             	mov    0x10(%ebp),%ecx
 340:	8b 45 0c             	mov    0xc(%ebp),%eax
 343:	fc                   	cld    
 344:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 346:	89 d0                	mov    %edx,%eax
 348:	8b 7d fc             	mov    -0x4(%ebp),%edi
 34b:	c9                   	leave  
 34c:	c3                   	ret    

0000034d <strchr>:

char*
strchr(const char *s, char c)
{
 34d:	55                   	push   %ebp
 34e:	89 e5                	mov    %esp,%ebp
 350:	8b 45 08             	mov    0x8(%ebp),%eax
 353:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 357:	eb 03                	jmp    35c <strchr+0xf>
 359:	83 c0 01             	add    $0x1,%eax
 35c:	0f b6 10             	movzbl (%eax),%edx
 35f:	84 d2                	test   %dl,%dl
 361:	74 06                	je     369 <strchr+0x1c>
    if(*s == c)
 363:	38 ca                	cmp    %cl,%dl
 365:	75 f2                	jne    359 <strchr+0xc>
 367:	eb 05                	jmp    36e <strchr+0x21>
      return (char*)s;
  return 0;
 369:	b8 00 00 00 00       	mov    $0x0,%eax
}
 36e:	5d                   	pop    %ebp
 36f:	c3                   	ret    

00000370 <gets>:

char*
gets(char *buf, int max)
{
 370:	55                   	push   %ebp
 371:	89 e5                	mov    %esp,%ebp
 373:	57                   	push   %edi
 374:	56                   	push   %esi
 375:	53                   	push   %ebx
 376:	83 ec 1c             	sub    $0x1c,%esp
 379:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 37c:	bb 00 00 00 00       	mov    $0x0,%ebx
 381:	89 de                	mov    %ebx,%esi
 383:	83 c3 01             	add    $0x1,%ebx
 386:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 389:	7d 2e                	jge    3b9 <gets+0x49>
    cc = read(0, &c, 1);
 38b:	83 ec 04             	sub    $0x4,%esp
 38e:	6a 01                	push   $0x1
 390:	8d 45 e7             	lea    -0x19(%ebp),%eax
 393:	50                   	push   %eax
 394:	6a 00                	push   $0x0
 396:	e8 ec 00 00 00       	call   487 <read>
    if(cc < 1)
 39b:	83 c4 10             	add    $0x10,%esp
 39e:	85 c0                	test   %eax,%eax
 3a0:	7e 17                	jle    3b9 <gets+0x49>
      break;
    buf[i++] = c;
 3a2:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 3a6:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 3a9:	3c 0a                	cmp    $0xa,%al
 3ab:	0f 94 c2             	sete   %dl
 3ae:	3c 0d                	cmp    $0xd,%al
 3b0:	0f 94 c0             	sete   %al
 3b3:	08 c2                	or     %al,%dl
 3b5:	74 ca                	je     381 <gets+0x11>
    buf[i++] = c;
 3b7:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 3b9:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 3bd:	89 f8                	mov    %edi,%eax
 3bf:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3c2:	5b                   	pop    %ebx
 3c3:	5e                   	pop    %esi
 3c4:	5f                   	pop    %edi
 3c5:	5d                   	pop    %ebp
 3c6:	c3                   	ret    

000003c7 <stat>:

int
stat(const char *n, struct stat *st)
{
 3c7:	55                   	push   %ebp
 3c8:	89 e5                	mov    %esp,%ebp
 3ca:	56                   	push   %esi
 3cb:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 3cc:	83 ec 08             	sub    $0x8,%esp
 3cf:	6a 00                	push   $0x0
 3d1:	ff 75 08             	push   0x8(%ebp)
 3d4:	e8 d6 00 00 00       	call   4af <open>
  if(fd < 0)
 3d9:	83 c4 10             	add    $0x10,%esp
 3dc:	85 c0                	test   %eax,%eax
 3de:	78 24                	js     404 <stat+0x3d>
 3e0:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 3e2:	83 ec 08             	sub    $0x8,%esp
 3e5:	ff 75 0c             	push   0xc(%ebp)
 3e8:	50                   	push   %eax
 3e9:	e8 d9 00 00 00       	call   4c7 <fstat>
 3ee:	89 c6                	mov    %eax,%esi
  close(fd);
 3f0:	89 1c 24             	mov    %ebx,(%esp)
 3f3:	e8 9f 00 00 00       	call   497 <close>
  return r;
 3f8:	83 c4 10             	add    $0x10,%esp
}
 3fb:	89 f0                	mov    %esi,%eax
 3fd:	8d 65 f8             	lea    -0x8(%ebp),%esp
 400:	5b                   	pop    %ebx
 401:	5e                   	pop    %esi
 402:	5d                   	pop    %ebp
 403:	c3                   	ret    
    return -1;
 404:	be ff ff ff ff       	mov    $0xffffffff,%esi
 409:	eb f0                	jmp    3fb <stat+0x34>

0000040b <atoi>:

int
atoi(const char *s)
{
 40b:	55                   	push   %ebp
 40c:	89 e5                	mov    %esp,%ebp
 40e:	53                   	push   %ebx
 40f:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 412:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 417:	eb 10                	jmp    429 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 419:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 41c:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 41f:	83 c1 01             	add    $0x1,%ecx
 422:	0f be c0             	movsbl %al,%eax
 425:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 429:	0f b6 01             	movzbl (%ecx),%eax
 42c:	8d 58 d0             	lea    -0x30(%eax),%ebx
 42f:	80 fb 09             	cmp    $0x9,%bl
 432:	76 e5                	jbe    419 <atoi+0xe>
  return n;
}
 434:	89 d0                	mov    %edx,%eax
 436:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 439:	c9                   	leave  
 43a:	c3                   	ret    

0000043b <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 43b:	55                   	push   %ebp
 43c:	89 e5                	mov    %esp,%ebp
 43e:	56                   	push   %esi
 43f:	53                   	push   %ebx
 440:	8b 75 08             	mov    0x8(%ebp),%esi
 443:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 446:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 449:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 44b:	eb 0d                	jmp    45a <memmove+0x1f>
    *dst++ = *src++;
 44d:	0f b6 01             	movzbl (%ecx),%eax
 450:	88 02                	mov    %al,(%edx)
 452:	8d 49 01             	lea    0x1(%ecx),%ecx
 455:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 458:	89 d8                	mov    %ebx,%eax
 45a:	8d 58 ff             	lea    -0x1(%eax),%ebx
 45d:	85 c0                	test   %eax,%eax
 45f:	7f ec                	jg     44d <memmove+0x12>
  return vdst;
}
 461:	89 f0                	mov    %esi,%eax
 463:	5b                   	pop    %ebx
 464:	5e                   	pop    %esi
 465:	5d                   	pop    %ebp
 466:	c3                   	ret    

00000467 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 467:	b8 01 00 00 00       	mov    $0x1,%eax
 46c:	cd 40                	int    $0x40
 46e:	c3                   	ret    

0000046f <exit>:
SYSCALL(exit)
 46f:	b8 02 00 00 00       	mov    $0x2,%eax
 474:	cd 40                	int    $0x40
 476:	c3                   	ret    

00000477 <wait>:
SYSCALL(wait)
 477:	b8 03 00 00 00       	mov    $0x3,%eax
 47c:	cd 40                	int    $0x40
 47e:	c3                   	ret    

0000047f <pipe>:
SYSCALL(pipe)
 47f:	b8 04 00 00 00       	mov    $0x4,%eax
 484:	cd 40                	int    $0x40
 486:	c3                   	ret    

00000487 <read>:
SYSCALL(read)
 487:	b8 05 00 00 00       	mov    $0x5,%eax
 48c:	cd 40                	int    $0x40
 48e:	c3                   	ret    

0000048f <write>:
SYSCALL(write)
 48f:	b8 10 00 00 00       	mov    $0x10,%eax
 494:	cd 40                	int    $0x40
 496:	c3                   	ret    

00000497 <close>:
SYSCALL(close)
 497:	b8 15 00 00 00       	mov    $0x15,%eax
 49c:	cd 40                	int    $0x40
 49e:	c3                   	ret    

0000049f <kill>:
SYSCALL(kill)
 49f:	b8 06 00 00 00       	mov    $0x6,%eax
 4a4:	cd 40                	int    $0x40
 4a6:	c3                   	ret    

000004a7 <exec>:
SYSCALL(exec)
 4a7:	b8 07 00 00 00       	mov    $0x7,%eax
 4ac:	cd 40                	int    $0x40
 4ae:	c3                   	ret    

000004af <open>:
SYSCALL(open)
 4af:	b8 0f 00 00 00       	mov    $0xf,%eax
 4b4:	cd 40                	int    $0x40
 4b6:	c3                   	ret    

000004b7 <mknod>:
SYSCALL(mknod)
 4b7:	b8 11 00 00 00       	mov    $0x11,%eax
 4bc:	cd 40                	int    $0x40
 4be:	c3                   	ret    

000004bf <unlink>:
SYSCALL(unlink)
 4bf:	b8 12 00 00 00       	mov    $0x12,%eax
 4c4:	cd 40                	int    $0x40
 4c6:	c3                   	ret    

000004c7 <fstat>:
SYSCALL(fstat)
 4c7:	b8 08 00 00 00       	mov    $0x8,%eax
 4cc:	cd 40                	int    $0x40
 4ce:	c3                   	ret    

000004cf <link>:
SYSCALL(link)
 4cf:	b8 13 00 00 00       	mov    $0x13,%eax
 4d4:	cd 40                	int    $0x40
 4d6:	c3                   	ret    

000004d7 <mkdir>:
SYSCALL(mkdir)
 4d7:	b8 14 00 00 00       	mov    $0x14,%eax
 4dc:	cd 40                	int    $0x40
 4de:	c3                   	ret    

000004df <chdir>:
SYSCALL(chdir)
 4df:	b8 09 00 00 00       	mov    $0x9,%eax
 4e4:	cd 40                	int    $0x40
 4e6:	c3                   	ret    

000004e7 <dup>:
SYSCALL(dup)
 4e7:	b8 0a 00 00 00       	mov    $0xa,%eax
 4ec:	cd 40                	int    $0x40
 4ee:	c3                   	ret    

000004ef <getpid>:
SYSCALL(getpid)
 4ef:	b8 0b 00 00 00       	mov    $0xb,%eax
 4f4:	cd 40                	int    $0x40
 4f6:	c3                   	ret    

000004f7 <sbrk>:
SYSCALL(sbrk)
 4f7:	b8 0c 00 00 00       	mov    $0xc,%eax
 4fc:	cd 40                	int    $0x40
 4fe:	c3                   	ret    

000004ff <sleep>:
SYSCALL(sleep)
 4ff:	b8 0d 00 00 00       	mov    $0xd,%eax
 504:	cd 40                	int    $0x40
 506:	c3                   	ret    

00000507 <uptime>:
SYSCALL(uptime)
 507:	b8 0e 00 00 00       	mov    $0xe,%eax
 50c:	cd 40                	int    $0x40
 50e:	c3                   	ret    

0000050f <clone>:
SYSCALL(clone)
 50f:	b8 16 00 00 00       	mov    $0x16,%eax
 514:	cd 40                	int    $0x40
 516:	c3                   	ret    

00000517 <join>:
 517:	b8 17 00 00 00       	mov    $0x17,%eax
 51c:	cd 40                	int    $0x40
 51e:	c3                   	ret    

0000051f <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 51f:	55                   	push   %ebp
 520:	89 e5                	mov    %esp,%ebp
 522:	83 ec 1c             	sub    $0x1c,%esp
 525:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 528:	6a 01                	push   $0x1
 52a:	8d 55 f4             	lea    -0xc(%ebp),%edx
 52d:	52                   	push   %edx
 52e:	50                   	push   %eax
 52f:	e8 5b ff ff ff       	call   48f <write>
}
 534:	83 c4 10             	add    $0x10,%esp
 537:	c9                   	leave  
 538:	c3                   	ret    

00000539 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 539:	55                   	push   %ebp
 53a:	89 e5                	mov    %esp,%ebp
 53c:	57                   	push   %edi
 53d:	56                   	push   %esi
 53e:	53                   	push   %ebx
 53f:	83 ec 2c             	sub    $0x2c,%esp
 542:	89 45 d0             	mov    %eax,-0x30(%ebp)
 545:	89 d0                	mov    %edx,%eax
 547:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 549:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 54d:	0f 95 c1             	setne  %cl
 550:	c1 ea 1f             	shr    $0x1f,%edx
 553:	84 d1                	test   %dl,%cl
 555:	74 44                	je     59b <printint+0x62>
    neg = 1;
    x = -xx;
 557:	f7 d8                	neg    %eax
 559:	89 c1                	mov    %eax,%ecx
    neg = 1;
 55b:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 562:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 567:	89 c8                	mov    %ecx,%eax
 569:	ba 00 00 00 00       	mov    $0x0,%edx
 56e:	f7 f6                	div    %esi
 570:	89 df                	mov    %ebx,%edi
 572:	83 c3 01             	add    $0x1,%ebx
 575:	0f b6 92 50 09 00 00 	movzbl 0x950(%edx),%edx
 57c:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 580:	89 ca                	mov    %ecx,%edx
 582:	89 c1                	mov    %eax,%ecx
 584:	39 d6                	cmp    %edx,%esi
 586:	76 df                	jbe    567 <printint+0x2e>
  if(neg)
 588:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 58c:	74 31                	je     5bf <printint+0x86>
    buf[i++] = '-';
 58e:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 593:	8d 5f 02             	lea    0x2(%edi),%ebx
 596:	8b 75 d0             	mov    -0x30(%ebp),%esi
 599:	eb 17                	jmp    5b2 <printint+0x79>
    x = xx;
 59b:	89 c1                	mov    %eax,%ecx
  neg = 0;
 59d:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 5a4:	eb bc                	jmp    562 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 5a6:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 5ab:	89 f0                	mov    %esi,%eax
 5ad:	e8 6d ff ff ff       	call   51f <putc>
  while(--i >= 0)
 5b2:	83 eb 01             	sub    $0x1,%ebx
 5b5:	79 ef                	jns    5a6 <printint+0x6d>
}
 5b7:	83 c4 2c             	add    $0x2c,%esp
 5ba:	5b                   	pop    %ebx
 5bb:	5e                   	pop    %esi
 5bc:	5f                   	pop    %edi
 5bd:	5d                   	pop    %ebp
 5be:	c3                   	ret    
 5bf:	8b 75 d0             	mov    -0x30(%ebp),%esi
 5c2:	eb ee                	jmp    5b2 <printint+0x79>

000005c4 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5c4:	55                   	push   %ebp
 5c5:	89 e5                	mov    %esp,%ebp
 5c7:	57                   	push   %edi
 5c8:	56                   	push   %esi
 5c9:	53                   	push   %ebx
 5ca:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 5cd:	8d 45 10             	lea    0x10(%ebp),%eax
 5d0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 5d3:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 5d8:	bb 00 00 00 00       	mov    $0x0,%ebx
 5dd:	eb 14                	jmp    5f3 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 5df:	89 fa                	mov    %edi,%edx
 5e1:	8b 45 08             	mov    0x8(%ebp),%eax
 5e4:	e8 36 ff ff ff       	call   51f <putc>
 5e9:	eb 05                	jmp    5f0 <printf+0x2c>
      }
    } else if(state == '%'){
 5eb:	83 fe 25             	cmp    $0x25,%esi
 5ee:	74 25                	je     615 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 5f0:	83 c3 01             	add    $0x1,%ebx
 5f3:	8b 45 0c             	mov    0xc(%ebp),%eax
 5f6:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 5fa:	84 c0                	test   %al,%al
 5fc:	0f 84 20 01 00 00    	je     722 <printf+0x15e>
    c = fmt[i] & 0xff;
 602:	0f be f8             	movsbl %al,%edi
 605:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 608:	85 f6                	test   %esi,%esi
 60a:	75 df                	jne    5eb <printf+0x27>
      if(c == '%'){
 60c:	83 f8 25             	cmp    $0x25,%eax
 60f:	75 ce                	jne    5df <printf+0x1b>
        state = '%';
 611:	89 c6                	mov    %eax,%esi
 613:	eb db                	jmp    5f0 <printf+0x2c>
      if(c == 'd'){
 615:	83 f8 25             	cmp    $0x25,%eax
 618:	0f 84 cf 00 00 00    	je     6ed <printf+0x129>
 61e:	0f 8c dd 00 00 00    	jl     701 <printf+0x13d>
 624:	83 f8 78             	cmp    $0x78,%eax
 627:	0f 8f d4 00 00 00    	jg     701 <printf+0x13d>
 62d:	83 f8 63             	cmp    $0x63,%eax
 630:	0f 8c cb 00 00 00    	jl     701 <printf+0x13d>
 636:	83 e8 63             	sub    $0x63,%eax
 639:	83 f8 15             	cmp    $0x15,%eax
 63c:	0f 87 bf 00 00 00    	ja     701 <printf+0x13d>
 642:	ff 24 85 f8 08 00 00 	jmp    *0x8f8(,%eax,4)
        printint(fd, *ap, 10, 1);
 649:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 64c:	8b 17                	mov    (%edi),%edx
 64e:	83 ec 0c             	sub    $0xc,%esp
 651:	6a 01                	push   $0x1
 653:	b9 0a 00 00 00       	mov    $0xa,%ecx
 658:	8b 45 08             	mov    0x8(%ebp),%eax
 65b:	e8 d9 fe ff ff       	call   539 <printint>
        ap++;
 660:	83 c7 04             	add    $0x4,%edi
 663:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 666:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 669:	be 00 00 00 00       	mov    $0x0,%esi
 66e:	eb 80                	jmp    5f0 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 670:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 673:	8b 17                	mov    (%edi),%edx
 675:	83 ec 0c             	sub    $0xc,%esp
 678:	6a 00                	push   $0x0
 67a:	b9 10 00 00 00       	mov    $0x10,%ecx
 67f:	8b 45 08             	mov    0x8(%ebp),%eax
 682:	e8 b2 fe ff ff       	call   539 <printint>
        ap++;
 687:	83 c7 04             	add    $0x4,%edi
 68a:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 68d:	83 c4 10             	add    $0x10,%esp
      state = 0;
 690:	be 00 00 00 00       	mov    $0x0,%esi
 695:	e9 56 ff ff ff       	jmp    5f0 <printf+0x2c>
        s = (char*)*ap;
 69a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 69d:	8b 30                	mov    (%eax),%esi
        ap++;
 69f:	83 c0 04             	add    $0x4,%eax
 6a2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 6a5:	85 f6                	test   %esi,%esi
 6a7:	75 15                	jne    6be <printf+0xfa>
          s = "(null)";
 6a9:	be ee 08 00 00       	mov    $0x8ee,%esi
 6ae:	eb 0e                	jmp    6be <printf+0xfa>
          putc(fd, *s);
 6b0:	0f be d2             	movsbl %dl,%edx
 6b3:	8b 45 08             	mov    0x8(%ebp),%eax
 6b6:	e8 64 fe ff ff       	call   51f <putc>
          s++;
 6bb:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 6be:	0f b6 16             	movzbl (%esi),%edx
 6c1:	84 d2                	test   %dl,%dl
 6c3:	75 eb                	jne    6b0 <printf+0xec>
      state = 0;
 6c5:	be 00 00 00 00       	mov    $0x0,%esi
 6ca:	e9 21 ff ff ff       	jmp    5f0 <printf+0x2c>
        putc(fd, *ap);
 6cf:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6d2:	0f be 17             	movsbl (%edi),%edx
 6d5:	8b 45 08             	mov    0x8(%ebp),%eax
 6d8:	e8 42 fe ff ff       	call   51f <putc>
        ap++;
 6dd:	83 c7 04             	add    $0x4,%edi
 6e0:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 6e3:	be 00 00 00 00       	mov    $0x0,%esi
 6e8:	e9 03 ff ff ff       	jmp    5f0 <printf+0x2c>
        putc(fd, c);
 6ed:	89 fa                	mov    %edi,%edx
 6ef:	8b 45 08             	mov    0x8(%ebp),%eax
 6f2:	e8 28 fe ff ff       	call   51f <putc>
      state = 0;
 6f7:	be 00 00 00 00       	mov    $0x0,%esi
 6fc:	e9 ef fe ff ff       	jmp    5f0 <printf+0x2c>
        putc(fd, '%');
 701:	ba 25 00 00 00       	mov    $0x25,%edx
 706:	8b 45 08             	mov    0x8(%ebp),%eax
 709:	e8 11 fe ff ff       	call   51f <putc>
        putc(fd, c);
 70e:	89 fa                	mov    %edi,%edx
 710:	8b 45 08             	mov    0x8(%ebp),%eax
 713:	e8 07 fe ff ff       	call   51f <putc>
      state = 0;
 718:	be 00 00 00 00       	mov    $0x0,%esi
 71d:	e9 ce fe ff ff       	jmp    5f0 <printf+0x2c>
    }
  }
}
 722:	8d 65 f4             	lea    -0xc(%ebp),%esp
 725:	5b                   	pop    %ebx
 726:	5e                   	pop    %esi
 727:	5f                   	pop    %edi
 728:	5d                   	pop    %ebp
 729:	c3                   	ret    

0000072a <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 72a:	55                   	push   %ebp
 72b:	89 e5                	mov    %esp,%ebp
 72d:	57                   	push   %edi
 72e:	56                   	push   %esi
 72f:	53                   	push   %ebx
 730:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 733:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 736:	a1 20 0e 00 00       	mov    0xe20,%eax
 73b:	eb 02                	jmp    73f <free+0x15>
 73d:	89 d0                	mov    %edx,%eax
 73f:	39 c8                	cmp    %ecx,%eax
 741:	73 04                	jae    747 <free+0x1d>
 743:	39 08                	cmp    %ecx,(%eax)
 745:	77 12                	ja     759 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 747:	8b 10                	mov    (%eax),%edx
 749:	39 c2                	cmp    %eax,%edx
 74b:	77 f0                	ja     73d <free+0x13>
 74d:	39 c8                	cmp    %ecx,%eax
 74f:	72 08                	jb     759 <free+0x2f>
 751:	39 ca                	cmp    %ecx,%edx
 753:	77 04                	ja     759 <free+0x2f>
 755:	89 d0                	mov    %edx,%eax
 757:	eb e6                	jmp    73f <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 759:	8b 73 fc             	mov    -0x4(%ebx),%esi
 75c:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 75f:	8b 10                	mov    (%eax),%edx
 761:	39 d7                	cmp    %edx,%edi
 763:	74 19                	je     77e <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 765:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 768:	8b 50 04             	mov    0x4(%eax),%edx
 76b:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 76e:	39 ce                	cmp    %ecx,%esi
 770:	74 1b                	je     78d <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 772:	89 08                	mov    %ecx,(%eax)
  freep = p;
 774:	a3 20 0e 00 00       	mov    %eax,0xe20
}
 779:	5b                   	pop    %ebx
 77a:	5e                   	pop    %esi
 77b:	5f                   	pop    %edi
 77c:	5d                   	pop    %ebp
 77d:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 77e:	03 72 04             	add    0x4(%edx),%esi
 781:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 784:	8b 10                	mov    (%eax),%edx
 786:	8b 12                	mov    (%edx),%edx
 788:	89 53 f8             	mov    %edx,-0x8(%ebx)
 78b:	eb db                	jmp    768 <free+0x3e>
    p->s.size += bp->s.size;
 78d:	03 53 fc             	add    -0x4(%ebx),%edx
 790:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 793:	8b 53 f8             	mov    -0x8(%ebx),%edx
 796:	89 10                	mov    %edx,(%eax)
 798:	eb da                	jmp    774 <free+0x4a>

0000079a <morecore>:

static Header*
morecore(uint nu)
{
 79a:	55                   	push   %ebp
 79b:	89 e5                	mov    %esp,%ebp
 79d:	53                   	push   %ebx
 79e:	83 ec 04             	sub    $0x4,%esp
 7a1:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 7a3:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 7a8:	77 05                	ja     7af <morecore+0x15>
    nu = 4096;
 7aa:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 7af:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 7b6:	83 ec 0c             	sub    $0xc,%esp
 7b9:	50                   	push   %eax
 7ba:	e8 38 fd ff ff       	call   4f7 <sbrk>
  if(p == (char*)-1)
 7bf:	83 c4 10             	add    $0x10,%esp
 7c2:	83 f8 ff             	cmp    $0xffffffff,%eax
 7c5:	74 1c                	je     7e3 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 7c7:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 7ca:	83 c0 08             	add    $0x8,%eax
 7cd:	83 ec 0c             	sub    $0xc,%esp
 7d0:	50                   	push   %eax
 7d1:	e8 54 ff ff ff       	call   72a <free>
  return freep;
 7d6:	a1 20 0e 00 00       	mov    0xe20,%eax
 7db:	83 c4 10             	add    $0x10,%esp
}
 7de:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 7e1:	c9                   	leave  
 7e2:	c3                   	ret    
    return 0;
 7e3:	b8 00 00 00 00       	mov    $0x0,%eax
 7e8:	eb f4                	jmp    7de <morecore+0x44>

000007ea <malloc>:

void*
malloc(uint nbytes)
{
 7ea:	55                   	push   %ebp
 7eb:	89 e5                	mov    %esp,%ebp
 7ed:	53                   	push   %ebx
 7ee:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7f1:	8b 45 08             	mov    0x8(%ebp),%eax
 7f4:	8d 58 07             	lea    0x7(%eax),%ebx
 7f7:	c1 eb 03             	shr    $0x3,%ebx
 7fa:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 7fd:	8b 0d 20 0e 00 00    	mov    0xe20,%ecx
 803:	85 c9                	test   %ecx,%ecx
 805:	74 04                	je     80b <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 807:	8b 01                	mov    (%ecx),%eax
 809:	eb 4a                	jmp    855 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 80b:	c7 05 20 0e 00 00 24 	movl   $0xe24,0xe20
 812:	0e 00 00 
 815:	c7 05 24 0e 00 00 24 	movl   $0xe24,0xe24
 81c:	0e 00 00 
    base.s.size = 0;
 81f:	c7 05 28 0e 00 00 00 	movl   $0x0,0xe28
 826:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 829:	b9 24 0e 00 00       	mov    $0xe24,%ecx
 82e:	eb d7                	jmp    807 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 830:	74 19                	je     84b <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 832:	29 da                	sub    %ebx,%edx
 834:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 837:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 83a:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 83d:	89 0d 20 0e 00 00    	mov    %ecx,0xe20
      return (void*)(p + 1);
 843:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 846:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 849:	c9                   	leave  
 84a:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 84b:	8b 10                	mov    (%eax),%edx
 84d:	89 11                	mov    %edx,(%ecx)
 84f:	eb ec                	jmp    83d <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 851:	89 c1                	mov    %eax,%ecx
 853:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 855:	8b 50 04             	mov    0x4(%eax),%edx
 858:	39 da                	cmp    %ebx,%edx
 85a:	73 d4                	jae    830 <malloc+0x46>
    if(p == freep)
 85c:	39 05 20 0e 00 00    	cmp    %eax,0xe20
 862:	75 ed                	jne    851 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 864:	89 d8                	mov    %ebx,%eax
 866:	e8 2f ff ff ff       	call   79a <morecore>
 86b:	85 c0                	test   %eax,%eax
 86d:	75 e2                	jne    851 <malloc+0x67>
 86f:	eb d5                	jmp    846 <malloc+0x5c>
