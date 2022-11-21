
_test_4:     file format elf32-i386


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
   exit();
   6:	e8 f7 04 00 00       	call   502 <exit>

0000000b <main>:
{
   b:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   f:	83 e4 f0             	and    $0xfffffff0,%esp
  12:	ff 71 fc             	push   -0x4(%ecx)
  15:	55                   	push   %ebp
  16:	89 e5                	mov    %esp,%ebp
  18:	56                   	push   %esi
  19:	53                   	push   %ebx
  1a:	51                   	push   %ecx
  1b:	83 ec 0c             	sub    $0xc,%esp
   ppid = getpid();
  1e:	e8 5f 05 00 00       	call   582 <getpid>
  23:	a3 c0 0d 00 00       	mov    %eax,0xdc0
   void *stack, *p = malloc(PGSIZE * 2);
  28:	83 ec 0c             	sub    $0xc,%esp
  2b:	68 00 20 00 00       	push   $0x2000
  30:	e8 48 08 00 00       	call   87d <malloc>
   assert(p != NULL);
  35:	83 c4 10             	add    $0x10,%esp
  38:	85 c0                	test   %eax,%eax
  3a:	74 70                	je     ac <main+0xa1>
  3c:	89 c3                	mov    %eax,%ebx
   if((uint)p % PGSIZE == 0)
  3e:	a9 ff 0f 00 00       	test   $0xfff,%eax
  43:	75 03                	jne    48 <main+0x3d>
     stack = p + 4;
  45:	8d 40 04             	lea    0x4(%eax),%eax
   assert(clone(worker, 0, 0, stack) == -1);
  48:	50                   	push   %eax
  49:	6a 00                	push   $0x0
  4b:	6a 00                	push   $0x0
  4d:	68 00 00 00 00       	push   $0x0
  52:	e8 4b 05 00 00       	call   5a2 <clone>
  57:	83 c4 10             	add    $0x10,%esp
  5a:	83 f8 ff             	cmp    $0xffffffff,%eax
  5d:	0f 84 92 00 00 00    	je     f5 <main+0xea>
  63:	6a 21                	push   $0x21
  65:	68 04 09 00 00       	push   $0x904
  6a:	68 0d 09 00 00       	push   $0x90d
  6f:	6a 01                	push   $0x1
  71:	e8 e1 05 00 00       	call   657 <printf>
  76:	83 c4 0c             	add    $0xc,%esp
  79:	68 68 09 00 00       	push   $0x968
  7e:	68 1f 09 00 00       	push   $0x91f
  83:	6a 01                	push   $0x1
  85:	e8 cd 05 00 00       	call   657 <printf>
  8a:	83 c4 08             	add    $0x8,%esp
  8d:	68 33 09 00 00       	push   $0x933
  92:	6a 01                	push   $0x1
  94:	e8 be 05 00 00       	call   657 <printf>
  99:	83 c4 04             	add    $0x4,%esp
  9c:	ff 35 c0 0d 00 00    	push   0xdc0
  a2:	e8 8b 04 00 00       	call   532 <kill>
  a7:	e8 56 04 00 00       	call   502 <exit>
   assert(p != NULL);
  ac:	6a 1b                	push   $0x1b
  ae:	68 04 09 00 00       	push   $0x904
  b3:	68 0d 09 00 00       	push   $0x90d
  b8:	6a 01                	push   $0x1
  ba:	e8 98 05 00 00       	call   657 <printf>
  bf:	83 c4 0c             	add    $0xc,%esp
  c2:	68 15 09 00 00       	push   $0x915
  c7:	68 1f 09 00 00       	push   $0x91f
  cc:	6a 01                	push   $0x1
  ce:	e8 84 05 00 00       	call   657 <printf>
  d3:	83 c4 08             	add    $0x8,%esp
  d6:	68 33 09 00 00       	push   $0x933
  db:	6a 01                	push   $0x1
  dd:	e8 75 05 00 00       	call   657 <printf>
  e2:	83 c4 04             	add    $0x4,%esp
  e5:	ff 35 c0 0d 00 00    	push   0xdc0
  eb:	e8 42 04 00 00       	call   532 <kill>
  f0:	e8 0d 04 00 00       	call   502 <exit>
   stack = sbrk(0);
  f5:	83 ec 0c             	sub    $0xc,%esp
  f8:	6a 00                	push   $0x0
  fa:	e8 8b 04 00 00       	call   58a <sbrk>
  ff:	89 c6                	mov    %eax,%esi
   if((uint)stack % PGSIZE)
 101:	83 c4 10             	add    $0x10,%esp
 104:	89 c2                	mov    %eax,%edx
 106:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 10c:	74 09                	je     117 <main+0x10c>
     stack = stack + (PGSIZE - (uint)stack % PGSIZE);
 10e:	b8 00 10 00 00       	mov    $0x1000,%eax
 113:	29 d0                	sub    %edx,%eax
 115:	01 c6                	add    %eax,%esi
   sbrk( ((uint)stack - (uint)sbrk(0)) + PGSIZE/2 );
 117:	83 ec 0c             	sub    $0xc,%esp
 11a:	6a 00                	push   $0x0
 11c:	e8 69 04 00 00       	call   58a <sbrk>
 121:	89 c2                	mov    %eax,%edx
 123:	89 f0                	mov    %esi,%eax
 125:	29 d0                	sub    %edx,%eax
 127:	05 00 08 00 00       	add    $0x800,%eax
 12c:	89 04 24             	mov    %eax,(%esp)
 12f:	e8 56 04 00 00       	call   58a <sbrk>
   assert((uint)stack % PGSIZE == 0);
 134:	83 c4 10             	add    $0x10,%esp
 137:	f7 c6 ff 0f 00 00    	test   $0xfff,%esi
 13d:	74 49                	je     188 <main+0x17d>
 13f:	6a 27                	push   $0x27
 141:	68 04 09 00 00       	push   $0x904
 146:	68 0d 09 00 00       	push   $0x90d
 14b:	6a 01                	push   $0x1
 14d:	e8 05 05 00 00       	call   657 <printf>
 152:	83 c4 0c             	add    $0xc,%esp
 155:	68 40 09 00 00       	push   $0x940
 15a:	68 1f 09 00 00       	push   $0x91f
 15f:	6a 01                	push   $0x1
 161:	e8 f1 04 00 00       	call   657 <printf>
 166:	83 c4 08             	add    $0x8,%esp
 169:	68 33 09 00 00       	push   $0x933
 16e:	6a 01                	push   $0x1
 170:	e8 e2 04 00 00       	call   657 <printf>
 175:	83 c4 04             	add    $0x4,%esp
 178:	ff 35 c0 0d 00 00    	push   0xdc0
 17e:	e8 af 03 00 00       	call   532 <kill>
 183:	e8 7a 03 00 00       	call   502 <exit>
   assert((uint)sbrk(0) - (uint)stack == PGSIZE/2);
 188:	83 ec 0c             	sub    $0xc,%esp
 18b:	6a 00                	push   $0x0
 18d:	e8 f8 03 00 00       	call   58a <sbrk>
 192:	29 f0                	sub    %esi,%eax
 194:	83 c4 10             	add    $0x10,%esp
 197:	3d 00 08 00 00       	cmp    $0x800,%eax
 19c:	74 49                	je     1e7 <main+0x1dc>
 19e:	6a 28                	push   $0x28
 1a0:	68 04 09 00 00       	push   $0x904
 1a5:	68 0d 09 00 00       	push   $0x90d
 1aa:	6a 01                	push   $0x1
 1ac:	e8 a6 04 00 00       	call   657 <printf>
 1b1:	83 c4 0c             	add    $0xc,%esp
 1b4:	68 8c 09 00 00       	push   $0x98c
 1b9:	68 1f 09 00 00       	push   $0x91f
 1be:	6a 01                	push   $0x1
 1c0:	e8 92 04 00 00       	call   657 <printf>
 1c5:	83 c4 08             	add    $0x8,%esp
 1c8:	68 33 09 00 00       	push   $0x933
 1cd:	6a 01                	push   $0x1
 1cf:	e8 83 04 00 00       	call   657 <printf>
 1d4:	83 c4 04             	add    $0x4,%esp
 1d7:	ff 35 c0 0d 00 00    	push   0xdc0
 1dd:	e8 50 03 00 00       	call   532 <kill>
 1e2:	e8 1b 03 00 00       	call   502 <exit>
   assert(clone(worker, 0, 0, stack) == -1);
 1e7:	56                   	push   %esi
 1e8:	6a 00                	push   $0x0
 1ea:	6a 00                	push   $0x0
 1ec:	68 00 00 00 00       	push   $0x0
 1f1:	e8 ac 03 00 00       	call   5a2 <clone>
 1f6:	83 c4 10             	add    $0x10,%esp
 1f9:	83 f8 ff             	cmp    $0xffffffff,%eax
 1fc:	74 49                	je     247 <main+0x23c>
 1fe:	6a 2a                	push   $0x2a
 200:	68 04 09 00 00       	push   $0x904
 205:	68 0d 09 00 00       	push   $0x90d
 20a:	6a 01                	push   $0x1
 20c:	e8 46 04 00 00       	call   657 <printf>
 211:	83 c4 0c             	add    $0xc,%esp
 214:	68 68 09 00 00       	push   $0x968
 219:	68 1f 09 00 00       	push   $0x91f
 21e:	6a 01                	push   $0x1
 220:	e8 32 04 00 00       	call   657 <printf>
 225:	83 c4 08             	add    $0x8,%esp
 228:	68 33 09 00 00       	push   $0x933
 22d:	6a 01                	push   $0x1
 22f:	e8 23 04 00 00       	call   657 <printf>
 234:	83 c4 04             	add    $0x4,%esp
 237:	ff 35 c0 0d 00 00    	push   0xdc0
 23d:	e8 f0 02 00 00       	call   532 <kill>
 242:	e8 bb 02 00 00       	call   502 <exit>
   printf(1, "TEST PASSED\n");
 247:	83 ec 08             	sub    $0x8,%esp
 24a:	68 5a 09 00 00       	push   $0x95a
 24f:	6a 01                	push   $0x1
 251:	e8 01 04 00 00       	call   657 <printf>
   free(p);
 256:	89 1c 24             	mov    %ebx,(%esp)
 259:	e8 5f 05 00 00       	call   7bd <free>
   exit();
 25e:	e8 9f 02 00 00       	call   502 <exit>

00000263 <test_and_set>:
  int flag;
};

struct thread_ref *threads[64];

int test_and_set(int *old_ptr, int new_ptr) {
 263:	55                   	push   %ebp
 264:	89 e5                	mov    %esp,%ebp
 266:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *old_ptr;
 269:	8b 10                	mov    (%eax),%edx
  *old_ptr = new_ptr;
 26b:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 26e:	89 08                	mov    %ecx,(%eax)
  return old;
}
 270:	89 d0                	mov    %edx,%eax
 272:	5d                   	pop    %ebp
 273:	c3                   	ret    

00000274 <thread_create>:

// a wrapper func for clone
int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 274:	55                   	push   %ebp
 275:	89 e5                	mov    %esp,%ebp
 277:	53                   	push   %ebx
 278:	83 ec 10             	sub    $0x10,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE*2);
 27b:	68 00 20 00 00       	push   $0x2000
 280:	e8 f8 05 00 00       	call   87d <malloc>
  if(n_stack == 0){
 285:	83 c4 10             	add    $0x10,%esp
 288:	85 c0                	test   %eax,%eax
 28a:	74 41                	je     2cd <thread_create+0x59>
 28c:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  int new_pid = clone(start_routine, arg1, arg2, n_stack);
 28e:	50                   	push   %eax
 28f:	ff 75 10             	push   0x10(%ebp)
 292:	ff 75 0c             	push   0xc(%ebp)
 295:	ff 75 08             	push   0x8(%ebp)
 298:	e8 05 03 00 00       	call   5a2 <clone>

  for(int i=0; i<64; i++){
 29d:	83 c4 10             	add    $0x10,%esp
 2a0:	ba 00 00 00 00       	mov    $0x0,%edx
 2a5:	eb 03                	jmp    2aa <thread_create+0x36>
 2a7:	83 c2 01             	add    $0x1,%edx
 2aa:	83 fa 3f             	cmp    $0x3f,%edx
 2ad:	7f 19                	jg     2c8 <thread_create+0x54>
    if(threads[i]->flag==0){
 2af:	8b 0c 95 e0 0d 00 00 	mov    0xde0(,%edx,4),%ecx
 2b6:	83 79 08 00          	cmpl   $0x0,0x8(%ecx)
 2ba:	75 eb                	jne    2a7 <thread_create+0x33>
      threads[i]->maddr = n_stack;
 2bc:	89 19                	mov    %ebx,(%ecx)
      threads[i]->pg1addr = n_stack;
 2be:	8b 14 95 e0 0d 00 00 	mov    0xde0(,%edx,4),%edx
 2c5:	89 5a 04             	mov    %ebx,0x4(%edx)
      break;
    }
  }

  return new_pid;
}
 2c8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2cb:	c9                   	leave  
 2cc:	c3                   	ret    
    return -1;
 2cd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2d2:	eb f4                	jmp    2c8 <thread_create+0x54>

000002d4 <thread_join>:

//TODO: fix
int thread_join() {
 2d4:	55                   	push   %ebp
 2d5:	89 e5                	mov    %esp,%ebp
 2d7:	56                   	push   %esi
 2d8:	53                   	push   %ebx
 2d9:	83 ec 1c             	sub    $0x1c,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 2dc:	8d 45 f4             	lea    -0xc(%ebp),%eax
 2df:	50                   	push   %eax
 2e0:	e8 c5 02 00 00       	call   5aa <join>
 2e5:	89 c6                	mov    %eax,%esi
  for(int i=0; i<64; i++){
 2e7:	83 c4 10             	add    $0x10,%esp
 2ea:	bb 00 00 00 00       	mov    $0x0,%ebx
 2ef:	eb 03                	jmp    2f4 <thread_join+0x20>
 2f1:	83 c3 01             	add    $0x1,%ebx
 2f4:	83 fb 3f             	cmp    $0x3f,%ebx
 2f7:	7f 23                	jg     31c <thread_join+0x48>
    if((threads[i]->flag==1) && (stk_addr == threads[i]->pg1addr)){
 2f9:	8b 04 9d e0 0d 00 00 	mov    0xde0(,%ebx,4),%eax
 300:	83 78 08 01          	cmpl   $0x1,0x8(%eax)
 304:	75 eb                	jne    2f1 <thread_join+0x1d>
 306:	8b 55 f4             	mov    -0xc(%ebp),%edx
 309:	39 50 04             	cmp    %edx,0x4(%eax)
 30c:	75 e3                	jne    2f1 <thread_join+0x1d>
      free(stk_addr);
 30e:	83 ec 0c             	sub    $0xc,%esp
 311:	52                   	push   %edx
 312:	e8 a6 04 00 00       	call   7bd <free>
 317:	83 c4 10             	add    $0x10,%esp
 31a:	eb d5                	jmp    2f1 <thread_join+0x1d>
    }
  }
  return pid;
}
 31c:	89 f0                	mov    %esi,%eax
 31e:	8d 65 f8             	lea    -0x8(%ebp),%esp
 321:	5b                   	pop    %ebx
 322:	5e                   	pop    %esi
 323:	5d                   	pop    %ebp
 324:	c3                   	ret    

00000325 <lock_acquire>:

void lock_acquire(lock_t *lock){
 325:	55                   	push   %ebp
 326:	89 e5                	mov    %esp,%ebp
 328:	53                   	push   %ebx
 329:	83 ec 04             	sub    $0x4,%esp
 32c:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 32f:	83 ec 08             	sub    $0x8,%esp
 332:	6a 01                	push   $0x1
 334:	53                   	push   %ebx
 335:	e8 29 ff ff ff       	call   263 <test_and_set>
 33a:	83 c4 10             	add    $0x10,%esp
 33d:	83 f8 01             	cmp    $0x1,%eax
 340:	74 ed                	je     32f <lock_acquire+0xa>
    ;
}
 342:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 345:	c9                   	leave  
 346:	c3                   	ret    

00000347 <lock_release>:

void lock_release(lock_t *lock) {
 347:	55                   	push   %ebp
 348:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 34a:	8b 45 08             	mov    0x8(%ebp),%eax
 34d:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 353:	5d                   	pop    %ebp
 354:	c3                   	ret    

00000355 <lock_init>:

void lock_init(lock_t *lock) {
 355:	55                   	push   %ebp
 356:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 358:	8b 45 08             	mov    0x8(%ebp),%eax
 35b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 361:	5d                   	pop    %ebp
 362:	c3                   	ret    

00000363 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 363:	55                   	push   %ebp
 364:	89 e5                	mov    %esp,%ebp
 366:	56                   	push   %esi
 367:	53                   	push   %ebx
 368:	8b 75 08             	mov    0x8(%ebp),%esi
 36b:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 36e:	89 f0                	mov    %esi,%eax
 370:	89 d1                	mov    %edx,%ecx
 372:	83 c2 01             	add    $0x1,%edx
 375:	89 c3                	mov    %eax,%ebx
 377:	83 c0 01             	add    $0x1,%eax
 37a:	0f b6 09             	movzbl (%ecx),%ecx
 37d:	88 0b                	mov    %cl,(%ebx)
 37f:	84 c9                	test   %cl,%cl
 381:	75 ed                	jne    370 <strcpy+0xd>
    ;
  return os;
}
 383:	89 f0                	mov    %esi,%eax
 385:	5b                   	pop    %ebx
 386:	5e                   	pop    %esi
 387:	5d                   	pop    %ebp
 388:	c3                   	ret    

00000389 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 389:	55                   	push   %ebp
 38a:	89 e5                	mov    %esp,%ebp
 38c:	8b 4d 08             	mov    0x8(%ebp),%ecx
 38f:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 392:	eb 06                	jmp    39a <strcmp+0x11>
    p++, q++;
 394:	83 c1 01             	add    $0x1,%ecx
 397:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 39a:	0f b6 01             	movzbl (%ecx),%eax
 39d:	84 c0                	test   %al,%al
 39f:	74 04                	je     3a5 <strcmp+0x1c>
 3a1:	3a 02                	cmp    (%edx),%al
 3a3:	74 ef                	je     394 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 3a5:	0f b6 c0             	movzbl %al,%eax
 3a8:	0f b6 12             	movzbl (%edx),%edx
 3ab:	29 d0                	sub    %edx,%eax
}
 3ad:	5d                   	pop    %ebp
 3ae:	c3                   	ret    

000003af <strlen>:

uint
strlen(const char *s)
{
 3af:	55                   	push   %ebp
 3b0:	89 e5                	mov    %esp,%ebp
 3b2:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 3b5:	b8 00 00 00 00       	mov    $0x0,%eax
 3ba:	eb 03                	jmp    3bf <strlen+0x10>
 3bc:	83 c0 01             	add    $0x1,%eax
 3bf:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 3c3:	75 f7                	jne    3bc <strlen+0xd>
    ;
  return n;
}
 3c5:	5d                   	pop    %ebp
 3c6:	c3                   	ret    

000003c7 <memset>:

void*
memset(void *dst, int c, uint n)
{
 3c7:	55                   	push   %ebp
 3c8:	89 e5                	mov    %esp,%ebp
 3ca:	57                   	push   %edi
 3cb:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 3ce:	89 d7                	mov    %edx,%edi
 3d0:	8b 4d 10             	mov    0x10(%ebp),%ecx
 3d3:	8b 45 0c             	mov    0xc(%ebp),%eax
 3d6:	fc                   	cld    
 3d7:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 3d9:	89 d0                	mov    %edx,%eax
 3db:	8b 7d fc             	mov    -0x4(%ebp),%edi
 3de:	c9                   	leave  
 3df:	c3                   	ret    

000003e0 <strchr>:

char*
strchr(const char *s, char c)
{
 3e0:	55                   	push   %ebp
 3e1:	89 e5                	mov    %esp,%ebp
 3e3:	8b 45 08             	mov    0x8(%ebp),%eax
 3e6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 3ea:	eb 03                	jmp    3ef <strchr+0xf>
 3ec:	83 c0 01             	add    $0x1,%eax
 3ef:	0f b6 10             	movzbl (%eax),%edx
 3f2:	84 d2                	test   %dl,%dl
 3f4:	74 06                	je     3fc <strchr+0x1c>
    if(*s == c)
 3f6:	38 ca                	cmp    %cl,%dl
 3f8:	75 f2                	jne    3ec <strchr+0xc>
 3fa:	eb 05                	jmp    401 <strchr+0x21>
      return (char*)s;
  return 0;
 3fc:	b8 00 00 00 00       	mov    $0x0,%eax
}
 401:	5d                   	pop    %ebp
 402:	c3                   	ret    

00000403 <gets>:

char*
gets(char *buf, int max)
{
 403:	55                   	push   %ebp
 404:	89 e5                	mov    %esp,%ebp
 406:	57                   	push   %edi
 407:	56                   	push   %esi
 408:	53                   	push   %ebx
 409:	83 ec 1c             	sub    $0x1c,%esp
 40c:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 40f:	bb 00 00 00 00       	mov    $0x0,%ebx
 414:	89 de                	mov    %ebx,%esi
 416:	83 c3 01             	add    $0x1,%ebx
 419:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 41c:	7d 2e                	jge    44c <gets+0x49>
    cc = read(0, &c, 1);
 41e:	83 ec 04             	sub    $0x4,%esp
 421:	6a 01                	push   $0x1
 423:	8d 45 e7             	lea    -0x19(%ebp),%eax
 426:	50                   	push   %eax
 427:	6a 00                	push   $0x0
 429:	e8 ec 00 00 00       	call   51a <read>
    if(cc < 1)
 42e:	83 c4 10             	add    $0x10,%esp
 431:	85 c0                	test   %eax,%eax
 433:	7e 17                	jle    44c <gets+0x49>
      break;
    buf[i++] = c;
 435:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 439:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 43c:	3c 0a                	cmp    $0xa,%al
 43e:	0f 94 c2             	sete   %dl
 441:	3c 0d                	cmp    $0xd,%al
 443:	0f 94 c0             	sete   %al
 446:	08 c2                	or     %al,%dl
 448:	74 ca                	je     414 <gets+0x11>
    buf[i++] = c;
 44a:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 44c:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 450:	89 f8                	mov    %edi,%eax
 452:	8d 65 f4             	lea    -0xc(%ebp),%esp
 455:	5b                   	pop    %ebx
 456:	5e                   	pop    %esi
 457:	5f                   	pop    %edi
 458:	5d                   	pop    %ebp
 459:	c3                   	ret    

0000045a <stat>:

int
stat(const char *n, struct stat *st)
{
 45a:	55                   	push   %ebp
 45b:	89 e5                	mov    %esp,%ebp
 45d:	56                   	push   %esi
 45e:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 45f:	83 ec 08             	sub    $0x8,%esp
 462:	6a 00                	push   $0x0
 464:	ff 75 08             	push   0x8(%ebp)
 467:	e8 d6 00 00 00       	call   542 <open>
  if(fd < 0)
 46c:	83 c4 10             	add    $0x10,%esp
 46f:	85 c0                	test   %eax,%eax
 471:	78 24                	js     497 <stat+0x3d>
 473:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 475:	83 ec 08             	sub    $0x8,%esp
 478:	ff 75 0c             	push   0xc(%ebp)
 47b:	50                   	push   %eax
 47c:	e8 d9 00 00 00       	call   55a <fstat>
 481:	89 c6                	mov    %eax,%esi
  close(fd);
 483:	89 1c 24             	mov    %ebx,(%esp)
 486:	e8 9f 00 00 00       	call   52a <close>
  return r;
 48b:	83 c4 10             	add    $0x10,%esp
}
 48e:	89 f0                	mov    %esi,%eax
 490:	8d 65 f8             	lea    -0x8(%ebp),%esp
 493:	5b                   	pop    %ebx
 494:	5e                   	pop    %esi
 495:	5d                   	pop    %ebp
 496:	c3                   	ret    
    return -1;
 497:	be ff ff ff ff       	mov    $0xffffffff,%esi
 49c:	eb f0                	jmp    48e <stat+0x34>

0000049e <atoi>:

int
atoi(const char *s)
{
 49e:	55                   	push   %ebp
 49f:	89 e5                	mov    %esp,%ebp
 4a1:	53                   	push   %ebx
 4a2:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 4a5:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 4aa:	eb 10                	jmp    4bc <atoi+0x1e>
    n = n*10 + *s++ - '0';
 4ac:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 4af:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 4b2:	83 c1 01             	add    $0x1,%ecx
 4b5:	0f be c0             	movsbl %al,%eax
 4b8:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 4bc:	0f b6 01             	movzbl (%ecx),%eax
 4bf:	8d 58 d0             	lea    -0x30(%eax),%ebx
 4c2:	80 fb 09             	cmp    $0x9,%bl
 4c5:	76 e5                	jbe    4ac <atoi+0xe>
  return n;
}
 4c7:	89 d0                	mov    %edx,%eax
 4c9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4cc:	c9                   	leave  
 4cd:	c3                   	ret    

000004ce <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 4ce:	55                   	push   %ebp
 4cf:	89 e5                	mov    %esp,%ebp
 4d1:	56                   	push   %esi
 4d2:	53                   	push   %ebx
 4d3:	8b 75 08             	mov    0x8(%ebp),%esi
 4d6:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 4d9:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 4dc:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 4de:	eb 0d                	jmp    4ed <memmove+0x1f>
    *dst++ = *src++;
 4e0:	0f b6 01             	movzbl (%ecx),%eax
 4e3:	88 02                	mov    %al,(%edx)
 4e5:	8d 49 01             	lea    0x1(%ecx),%ecx
 4e8:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 4eb:	89 d8                	mov    %ebx,%eax
 4ed:	8d 58 ff             	lea    -0x1(%eax),%ebx
 4f0:	85 c0                	test   %eax,%eax
 4f2:	7f ec                	jg     4e0 <memmove+0x12>
  return vdst;
}
 4f4:	89 f0                	mov    %esi,%eax
 4f6:	5b                   	pop    %ebx
 4f7:	5e                   	pop    %esi
 4f8:	5d                   	pop    %ebp
 4f9:	c3                   	ret    

000004fa <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4fa:	b8 01 00 00 00       	mov    $0x1,%eax
 4ff:	cd 40                	int    $0x40
 501:	c3                   	ret    

00000502 <exit>:
SYSCALL(exit)
 502:	b8 02 00 00 00       	mov    $0x2,%eax
 507:	cd 40                	int    $0x40
 509:	c3                   	ret    

0000050a <wait>:
SYSCALL(wait)
 50a:	b8 03 00 00 00       	mov    $0x3,%eax
 50f:	cd 40                	int    $0x40
 511:	c3                   	ret    

00000512 <pipe>:
SYSCALL(pipe)
 512:	b8 04 00 00 00       	mov    $0x4,%eax
 517:	cd 40                	int    $0x40
 519:	c3                   	ret    

0000051a <read>:
SYSCALL(read)
 51a:	b8 05 00 00 00       	mov    $0x5,%eax
 51f:	cd 40                	int    $0x40
 521:	c3                   	ret    

00000522 <write>:
SYSCALL(write)
 522:	b8 10 00 00 00       	mov    $0x10,%eax
 527:	cd 40                	int    $0x40
 529:	c3                   	ret    

0000052a <close>:
SYSCALL(close)
 52a:	b8 15 00 00 00       	mov    $0x15,%eax
 52f:	cd 40                	int    $0x40
 531:	c3                   	ret    

00000532 <kill>:
SYSCALL(kill)
 532:	b8 06 00 00 00       	mov    $0x6,%eax
 537:	cd 40                	int    $0x40
 539:	c3                   	ret    

0000053a <exec>:
SYSCALL(exec)
 53a:	b8 07 00 00 00       	mov    $0x7,%eax
 53f:	cd 40                	int    $0x40
 541:	c3                   	ret    

00000542 <open>:
SYSCALL(open)
 542:	b8 0f 00 00 00       	mov    $0xf,%eax
 547:	cd 40                	int    $0x40
 549:	c3                   	ret    

0000054a <mknod>:
SYSCALL(mknod)
 54a:	b8 11 00 00 00       	mov    $0x11,%eax
 54f:	cd 40                	int    $0x40
 551:	c3                   	ret    

00000552 <unlink>:
SYSCALL(unlink)
 552:	b8 12 00 00 00       	mov    $0x12,%eax
 557:	cd 40                	int    $0x40
 559:	c3                   	ret    

0000055a <fstat>:
SYSCALL(fstat)
 55a:	b8 08 00 00 00       	mov    $0x8,%eax
 55f:	cd 40                	int    $0x40
 561:	c3                   	ret    

00000562 <link>:
SYSCALL(link)
 562:	b8 13 00 00 00       	mov    $0x13,%eax
 567:	cd 40                	int    $0x40
 569:	c3                   	ret    

0000056a <mkdir>:
SYSCALL(mkdir)
 56a:	b8 14 00 00 00       	mov    $0x14,%eax
 56f:	cd 40                	int    $0x40
 571:	c3                   	ret    

00000572 <chdir>:
SYSCALL(chdir)
 572:	b8 09 00 00 00       	mov    $0x9,%eax
 577:	cd 40                	int    $0x40
 579:	c3                   	ret    

0000057a <dup>:
SYSCALL(dup)
 57a:	b8 0a 00 00 00       	mov    $0xa,%eax
 57f:	cd 40                	int    $0x40
 581:	c3                   	ret    

00000582 <getpid>:
SYSCALL(getpid)
 582:	b8 0b 00 00 00       	mov    $0xb,%eax
 587:	cd 40                	int    $0x40
 589:	c3                   	ret    

0000058a <sbrk>:
SYSCALL(sbrk)
 58a:	b8 0c 00 00 00       	mov    $0xc,%eax
 58f:	cd 40                	int    $0x40
 591:	c3                   	ret    

00000592 <sleep>:
SYSCALL(sleep)
 592:	b8 0d 00 00 00       	mov    $0xd,%eax
 597:	cd 40                	int    $0x40
 599:	c3                   	ret    

0000059a <uptime>:
SYSCALL(uptime)
 59a:	b8 0e 00 00 00       	mov    $0xe,%eax
 59f:	cd 40                	int    $0x40
 5a1:	c3                   	ret    

000005a2 <clone>:
SYSCALL(clone)
 5a2:	b8 16 00 00 00       	mov    $0x16,%eax
 5a7:	cd 40                	int    $0x40
 5a9:	c3                   	ret    

000005aa <join>:
 5aa:	b8 17 00 00 00       	mov    $0x17,%eax
 5af:	cd 40                	int    $0x40
 5b1:	c3                   	ret    

000005b2 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 5b2:	55                   	push   %ebp
 5b3:	89 e5                	mov    %esp,%ebp
 5b5:	83 ec 1c             	sub    $0x1c,%esp
 5b8:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 5bb:	6a 01                	push   $0x1
 5bd:	8d 55 f4             	lea    -0xc(%ebp),%edx
 5c0:	52                   	push   %edx
 5c1:	50                   	push   %eax
 5c2:	e8 5b ff ff ff       	call   522 <write>
}
 5c7:	83 c4 10             	add    $0x10,%esp
 5ca:	c9                   	leave  
 5cb:	c3                   	ret    

000005cc <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 5cc:	55                   	push   %ebp
 5cd:	89 e5                	mov    %esp,%ebp
 5cf:	57                   	push   %edi
 5d0:	56                   	push   %esi
 5d1:	53                   	push   %ebx
 5d2:	83 ec 2c             	sub    $0x2c,%esp
 5d5:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5d8:	89 d0                	mov    %edx,%eax
 5da:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 5dc:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 5e0:	0f 95 c1             	setne  %cl
 5e3:	c1 ea 1f             	shr    $0x1f,%edx
 5e6:	84 d1                	test   %dl,%cl
 5e8:	74 44                	je     62e <printint+0x62>
    neg = 1;
    x = -xx;
 5ea:	f7 d8                	neg    %eax
 5ec:	89 c1                	mov    %eax,%ecx
    neg = 1;
 5ee:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 5f5:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 5fa:	89 c8                	mov    %ecx,%eax
 5fc:	ba 00 00 00 00       	mov    $0x0,%edx
 601:	f7 f6                	div    %esi
 603:	89 df                	mov    %ebx,%edi
 605:	83 c3 01             	add    $0x1,%ebx
 608:	0f b6 92 14 0a 00 00 	movzbl 0xa14(%edx),%edx
 60f:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 613:	89 ca                	mov    %ecx,%edx
 615:	89 c1                	mov    %eax,%ecx
 617:	39 d6                	cmp    %edx,%esi
 619:	76 df                	jbe    5fa <printint+0x2e>
  if(neg)
 61b:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 61f:	74 31                	je     652 <printint+0x86>
    buf[i++] = '-';
 621:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 626:	8d 5f 02             	lea    0x2(%edi),%ebx
 629:	8b 75 d0             	mov    -0x30(%ebp),%esi
 62c:	eb 17                	jmp    645 <printint+0x79>
    x = xx;
 62e:	89 c1                	mov    %eax,%ecx
  neg = 0;
 630:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 637:	eb bc                	jmp    5f5 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 639:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 63e:	89 f0                	mov    %esi,%eax
 640:	e8 6d ff ff ff       	call   5b2 <putc>
  while(--i >= 0)
 645:	83 eb 01             	sub    $0x1,%ebx
 648:	79 ef                	jns    639 <printint+0x6d>
}
 64a:	83 c4 2c             	add    $0x2c,%esp
 64d:	5b                   	pop    %ebx
 64e:	5e                   	pop    %esi
 64f:	5f                   	pop    %edi
 650:	5d                   	pop    %ebp
 651:	c3                   	ret    
 652:	8b 75 d0             	mov    -0x30(%ebp),%esi
 655:	eb ee                	jmp    645 <printint+0x79>

00000657 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 657:	55                   	push   %ebp
 658:	89 e5                	mov    %esp,%ebp
 65a:	57                   	push   %edi
 65b:	56                   	push   %esi
 65c:	53                   	push   %ebx
 65d:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 660:	8d 45 10             	lea    0x10(%ebp),%eax
 663:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 666:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 66b:	bb 00 00 00 00       	mov    $0x0,%ebx
 670:	eb 14                	jmp    686 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 672:	89 fa                	mov    %edi,%edx
 674:	8b 45 08             	mov    0x8(%ebp),%eax
 677:	e8 36 ff ff ff       	call   5b2 <putc>
 67c:	eb 05                	jmp    683 <printf+0x2c>
      }
    } else if(state == '%'){
 67e:	83 fe 25             	cmp    $0x25,%esi
 681:	74 25                	je     6a8 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 683:	83 c3 01             	add    $0x1,%ebx
 686:	8b 45 0c             	mov    0xc(%ebp),%eax
 689:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 68d:	84 c0                	test   %al,%al
 68f:	0f 84 20 01 00 00    	je     7b5 <printf+0x15e>
    c = fmt[i] & 0xff;
 695:	0f be f8             	movsbl %al,%edi
 698:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 69b:	85 f6                	test   %esi,%esi
 69d:	75 df                	jne    67e <printf+0x27>
      if(c == '%'){
 69f:	83 f8 25             	cmp    $0x25,%eax
 6a2:	75 ce                	jne    672 <printf+0x1b>
        state = '%';
 6a4:	89 c6                	mov    %eax,%esi
 6a6:	eb db                	jmp    683 <printf+0x2c>
      if(c == 'd'){
 6a8:	83 f8 25             	cmp    $0x25,%eax
 6ab:	0f 84 cf 00 00 00    	je     780 <printf+0x129>
 6b1:	0f 8c dd 00 00 00    	jl     794 <printf+0x13d>
 6b7:	83 f8 78             	cmp    $0x78,%eax
 6ba:	0f 8f d4 00 00 00    	jg     794 <printf+0x13d>
 6c0:	83 f8 63             	cmp    $0x63,%eax
 6c3:	0f 8c cb 00 00 00    	jl     794 <printf+0x13d>
 6c9:	83 e8 63             	sub    $0x63,%eax
 6cc:	83 f8 15             	cmp    $0x15,%eax
 6cf:	0f 87 bf 00 00 00    	ja     794 <printf+0x13d>
 6d5:	ff 24 85 bc 09 00 00 	jmp    *0x9bc(,%eax,4)
        printint(fd, *ap, 10, 1);
 6dc:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6df:	8b 17                	mov    (%edi),%edx
 6e1:	83 ec 0c             	sub    $0xc,%esp
 6e4:	6a 01                	push   $0x1
 6e6:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6eb:	8b 45 08             	mov    0x8(%ebp),%eax
 6ee:	e8 d9 fe ff ff       	call   5cc <printint>
        ap++;
 6f3:	83 c7 04             	add    $0x4,%edi
 6f6:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 6f9:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 6fc:	be 00 00 00 00       	mov    $0x0,%esi
 701:	eb 80                	jmp    683 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 703:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 706:	8b 17                	mov    (%edi),%edx
 708:	83 ec 0c             	sub    $0xc,%esp
 70b:	6a 00                	push   $0x0
 70d:	b9 10 00 00 00       	mov    $0x10,%ecx
 712:	8b 45 08             	mov    0x8(%ebp),%eax
 715:	e8 b2 fe ff ff       	call   5cc <printint>
        ap++;
 71a:	83 c7 04             	add    $0x4,%edi
 71d:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 720:	83 c4 10             	add    $0x10,%esp
      state = 0;
 723:	be 00 00 00 00       	mov    $0x0,%esi
 728:	e9 56 ff ff ff       	jmp    683 <printf+0x2c>
        s = (char*)*ap;
 72d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 730:	8b 30                	mov    (%eax),%esi
        ap++;
 732:	83 c0 04             	add    $0x4,%eax
 735:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 738:	85 f6                	test   %esi,%esi
 73a:	75 15                	jne    751 <printf+0xfa>
          s = "(null)";
 73c:	be b4 09 00 00       	mov    $0x9b4,%esi
 741:	eb 0e                	jmp    751 <printf+0xfa>
          putc(fd, *s);
 743:	0f be d2             	movsbl %dl,%edx
 746:	8b 45 08             	mov    0x8(%ebp),%eax
 749:	e8 64 fe ff ff       	call   5b2 <putc>
          s++;
 74e:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 751:	0f b6 16             	movzbl (%esi),%edx
 754:	84 d2                	test   %dl,%dl
 756:	75 eb                	jne    743 <printf+0xec>
      state = 0;
 758:	be 00 00 00 00       	mov    $0x0,%esi
 75d:	e9 21 ff ff ff       	jmp    683 <printf+0x2c>
        putc(fd, *ap);
 762:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 765:	0f be 17             	movsbl (%edi),%edx
 768:	8b 45 08             	mov    0x8(%ebp),%eax
 76b:	e8 42 fe ff ff       	call   5b2 <putc>
        ap++;
 770:	83 c7 04             	add    $0x4,%edi
 773:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 776:	be 00 00 00 00       	mov    $0x0,%esi
 77b:	e9 03 ff ff ff       	jmp    683 <printf+0x2c>
        putc(fd, c);
 780:	89 fa                	mov    %edi,%edx
 782:	8b 45 08             	mov    0x8(%ebp),%eax
 785:	e8 28 fe ff ff       	call   5b2 <putc>
      state = 0;
 78a:	be 00 00 00 00       	mov    $0x0,%esi
 78f:	e9 ef fe ff ff       	jmp    683 <printf+0x2c>
        putc(fd, '%');
 794:	ba 25 00 00 00       	mov    $0x25,%edx
 799:	8b 45 08             	mov    0x8(%ebp),%eax
 79c:	e8 11 fe ff ff       	call   5b2 <putc>
        putc(fd, c);
 7a1:	89 fa                	mov    %edi,%edx
 7a3:	8b 45 08             	mov    0x8(%ebp),%eax
 7a6:	e8 07 fe ff ff       	call   5b2 <putc>
      state = 0;
 7ab:	be 00 00 00 00       	mov    $0x0,%esi
 7b0:	e9 ce fe ff ff       	jmp    683 <printf+0x2c>
    }
  }
}
 7b5:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7b8:	5b                   	pop    %ebx
 7b9:	5e                   	pop    %esi
 7ba:	5f                   	pop    %edi
 7bb:	5d                   	pop    %ebp
 7bc:	c3                   	ret    

000007bd <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7bd:	55                   	push   %ebp
 7be:	89 e5                	mov    %esp,%ebp
 7c0:	57                   	push   %edi
 7c1:	56                   	push   %esi
 7c2:	53                   	push   %ebx
 7c3:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7c6:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7c9:	a1 e0 0e 00 00       	mov    0xee0,%eax
 7ce:	eb 02                	jmp    7d2 <free+0x15>
 7d0:	89 d0                	mov    %edx,%eax
 7d2:	39 c8                	cmp    %ecx,%eax
 7d4:	73 04                	jae    7da <free+0x1d>
 7d6:	39 08                	cmp    %ecx,(%eax)
 7d8:	77 12                	ja     7ec <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7da:	8b 10                	mov    (%eax),%edx
 7dc:	39 c2                	cmp    %eax,%edx
 7de:	77 f0                	ja     7d0 <free+0x13>
 7e0:	39 c8                	cmp    %ecx,%eax
 7e2:	72 08                	jb     7ec <free+0x2f>
 7e4:	39 ca                	cmp    %ecx,%edx
 7e6:	77 04                	ja     7ec <free+0x2f>
 7e8:	89 d0                	mov    %edx,%eax
 7ea:	eb e6                	jmp    7d2 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7ec:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7ef:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7f2:	8b 10                	mov    (%eax),%edx
 7f4:	39 d7                	cmp    %edx,%edi
 7f6:	74 19                	je     811 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 7f8:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7fb:	8b 50 04             	mov    0x4(%eax),%edx
 7fe:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 801:	39 ce                	cmp    %ecx,%esi
 803:	74 1b                	je     820 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 805:	89 08                	mov    %ecx,(%eax)
  freep = p;
 807:	a3 e0 0e 00 00       	mov    %eax,0xee0
}
 80c:	5b                   	pop    %ebx
 80d:	5e                   	pop    %esi
 80e:	5f                   	pop    %edi
 80f:	5d                   	pop    %ebp
 810:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 811:	03 72 04             	add    0x4(%edx),%esi
 814:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 817:	8b 10                	mov    (%eax),%edx
 819:	8b 12                	mov    (%edx),%edx
 81b:	89 53 f8             	mov    %edx,-0x8(%ebx)
 81e:	eb db                	jmp    7fb <free+0x3e>
    p->s.size += bp->s.size;
 820:	03 53 fc             	add    -0x4(%ebx),%edx
 823:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 826:	8b 53 f8             	mov    -0x8(%ebx),%edx
 829:	89 10                	mov    %edx,(%eax)
 82b:	eb da                	jmp    807 <free+0x4a>

0000082d <morecore>:

static Header*
morecore(uint nu)
{
 82d:	55                   	push   %ebp
 82e:	89 e5                	mov    %esp,%ebp
 830:	53                   	push   %ebx
 831:	83 ec 04             	sub    $0x4,%esp
 834:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 836:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 83b:	77 05                	ja     842 <morecore+0x15>
    nu = 4096;
 83d:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 842:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 849:	83 ec 0c             	sub    $0xc,%esp
 84c:	50                   	push   %eax
 84d:	e8 38 fd ff ff       	call   58a <sbrk>
  if(p == (char*)-1)
 852:	83 c4 10             	add    $0x10,%esp
 855:	83 f8 ff             	cmp    $0xffffffff,%eax
 858:	74 1c                	je     876 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 85a:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 85d:	83 c0 08             	add    $0x8,%eax
 860:	83 ec 0c             	sub    $0xc,%esp
 863:	50                   	push   %eax
 864:	e8 54 ff ff ff       	call   7bd <free>
  return freep;
 869:	a1 e0 0e 00 00       	mov    0xee0,%eax
 86e:	83 c4 10             	add    $0x10,%esp
}
 871:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 874:	c9                   	leave  
 875:	c3                   	ret    
    return 0;
 876:	b8 00 00 00 00       	mov    $0x0,%eax
 87b:	eb f4                	jmp    871 <morecore+0x44>

0000087d <malloc>:

void*
malloc(uint nbytes)
{
 87d:	55                   	push   %ebp
 87e:	89 e5                	mov    %esp,%ebp
 880:	53                   	push   %ebx
 881:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 884:	8b 45 08             	mov    0x8(%ebp),%eax
 887:	8d 58 07             	lea    0x7(%eax),%ebx
 88a:	c1 eb 03             	shr    $0x3,%ebx
 88d:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 890:	8b 0d e0 0e 00 00    	mov    0xee0,%ecx
 896:	85 c9                	test   %ecx,%ecx
 898:	74 04                	je     89e <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 89a:	8b 01                	mov    (%ecx),%eax
 89c:	eb 4a                	jmp    8e8 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 89e:	c7 05 e0 0e 00 00 e4 	movl   $0xee4,0xee0
 8a5:	0e 00 00 
 8a8:	c7 05 e4 0e 00 00 e4 	movl   $0xee4,0xee4
 8af:	0e 00 00 
    base.s.size = 0;
 8b2:	c7 05 e8 0e 00 00 00 	movl   $0x0,0xee8
 8b9:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 8bc:	b9 e4 0e 00 00       	mov    $0xee4,%ecx
 8c1:	eb d7                	jmp    89a <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 8c3:	74 19                	je     8de <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 8c5:	29 da                	sub    %ebx,%edx
 8c7:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8ca:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 8cd:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 8d0:	89 0d e0 0e 00 00    	mov    %ecx,0xee0
      return (void*)(p + 1);
 8d6:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 8d9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8dc:	c9                   	leave  
 8dd:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 8de:	8b 10                	mov    (%eax),%edx
 8e0:	89 11                	mov    %edx,(%ecx)
 8e2:	eb ec                	jmp    8d0 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8e4:	89 c1                	mov    %eax,%ecx
 8e6:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 8e8:	8b 50 04             	mov    0x4(%eax),%edx
 8eb:	39 da                	cmp    %ebx,%edx
 8ed:	73 d4                	jae    8c3 <malloc+0x46>
    if(p == freep)
 8ef:	39 05 e0 0e 00 00    	cmp    %eax,0xee0
 8f5:	75 ed                	jne    8e4 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 8f7:	89 d8                	mov    %ebx,%eax
 8f9:	e8 2f ff ff ff       	call   82d <morecore>
 8fe:	85 c0                	test   %eax,%eax
 900:	75 e2                	jne    8e4 <malloc+0x67>
 902:	eb d5                	jmp    8d9 <malloc+0x5c>
