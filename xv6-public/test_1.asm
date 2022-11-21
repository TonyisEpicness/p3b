
_test_1:     file format elf32-i386


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
   assert(global == 1);
   6:	a1 f8 0c 00 00       	mov    0xcf8,%eax
   b:	83 f8 01             	cmp    $0x1,%eax
   e:	74 49                	je     59 <worker+0x59>
  10:	6a 30                	push   $0x30
  12:	68 88 08 00 00       	push   $0x888
  17:	68 91 08 00 00       	push   $0x891
  1c:	6a 01                	push   $0x1
  1e:	e8 b7 05 00 00       	call   5da <printf>
  23:	83 c4 0c             	add    $0xc,%esp
  26:	68 99 08 00 00       	push   $0x899
  2b:	68 a5 08 00 00       	push   $0x8a5
  30:	6a 01                	push   $0x1
  32:	e8 a3 05 00 00       	call   5da <printf>
  37:	83 c4 08             	add    $0x8,%esp
  3a:	68 b9 08 00 00       	push   $0x8b9
  3f:	6a 01                	push   $0x1
  41:	e8 94 05 00 00       	call   5da <printf>
  46:	83 c4 04             	add    $0x4,%esp
  49:	ff 35 00 0d 00 00    	push   0xd00
  4f:	e8 61 04 00 00       	call   4b5 <kill>
  54:	e8 2c 04 00 00       	call   485 <exit>
   global = 5;
  59:	c7 05 f8 0c 00 00 05 	movl   $0x5,0xcf8
  60:	00 00 00 
   exit();
  63:	e8 1d 04 00 00       	call   485 <exit>

00000068 <main>:
{
  68:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  6c:	83 e4 f0             	and    $0xfffffff0,%esp
  6f:	ff 71 fc             	push   -0x4(%ecx)
  72:	55                   	push   %ebp
  73:	89 e5                	mov    %esp,%ebp
  75:	56                   	push   %esi
  76:	53                   	push   %ebx
  77:	51                   	push   %ecx
  78:	83 ec 1c             	sub    $0x1c,%esp
   ppid = getpid();
  7b:	e8 85 04 00 00       	call   505 <getpid>
  80:	a3 00 0d 00 00       	mov    %eax,0xd00
   void *stack, *p = malloc(PGSIZE*2);
  85:	83 ec 0c             	sub    $0xc,%esp
  88:	68 00 20 00 00       	push   $0x2000
  8d:	e8 6e 07 00 00       	call   800 <malloc>
   assert(p != NULL);
  92:	83 c4 10             	add    $0x10,%esp
  95:	85 c0                	test   %eax,%eax
  97:	0f 84 a9 00 00 00    	je     146 <main+0xde>
  9d:	89 c3                	mov    %eax,%ebx
   if((uint)p % PGSIZE)
  9f:	89 c2                	mov    %eax,%edx
  a1:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
  a7:	74 09                	je     b2 <main+0x4a>
     stack = p + (PGSIZE - (uint)p % PGSIZE);
  a9:	b8 00 10 00 00       	mov    $0x1000,%eax
  ae:	29 d0                	sub    %edx,%eax
  b0:	01 d8                	add    %ebx,%eax
   int clone_pid = clone(worker, 0, 0, stack);
  b2:	50                   	push   %eax
  b3:	6a 00                	push   $0x0
  b5:	6a 00                	push   $0x0
  b7:	68 00 00 00 00       	push   $0x0
  bc:	e8 64 04 00 00       	call   525 <clone>
  c1:	89 c6                	mov    %eax,%esi
   assert(clone_pid > 0);
  c3:	83 c4 10             	add    $0x10,%esp
  c6:	85 c0                	test   %eax,%eax
  c8:	0f 8e c1 00 00 00    	jle    18f <main+0x127>
   while(global != 5);
  ce:	a1 f8 0c 00 00       	mov    0xcf8,%eax
  d3:	83 f8 05             	cmp    $0x5,%eax
  d6:	75 f6                	jne    ce <main+0x66>
   printf(1, "TEST PASSED\n");
  d8:	83 ec 08             	sub    $0x8,%esp
  db:	68 de 08 00 00       	push   $0x8de
  e0:	6a 01                	push   $0x1
  e2:	e8 f3 04 00 00       	call   5da <printf>
   int join_pid = join(&join_stack);
  e7:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  ea:	89 04 24             	mov    %eax,(%esp)
  ed:	e8 3b 04 00 00       	call   52d <join>
   assert(join_pid == clone_pid);
  f2:	83 c4 10             	add    $0x10,%esp
  f5:	39 c6                	cmp    %eax,%esi
  f7:	0f 84 db 00 00 00    	je     1d8 <main+0x170>
  fd:	6a 29                	push   $0x29
  ff:	68 88 08 00 00       	push   $0x888
 104:	68 91 08 00 00       	push   $0x891
 109:	6a 01                	push   $0x1
 10b:	e8 ca 04 00 00       	call   5da <printf>
 110:	83 c4 0c             	add    $0xc,%esp
 113:	68 eb 08 00 00       	push   $0x8eb
 118:	68 a5 08 00 00       	push   $0x8a5
 11d:	6a 01                	push   $0x1
 11f:	e8 b6 04 00 00       	call   5da <printf>
 124:	83 c4 08             	add    $0x8,%esp
 127:	68 b9 08 00 00       	push   $0x8b9
 12c:	6a 01                	push   $0x1
 12e:	e8 a7 04 00 00       	call   5da <printf>
 133:	83 c4 04             	add    $0x4,%esp
 136:	ff 35 00 0d 00 00    	push   0xd00
 13c:	e8 74 03 00 00       	call   4b5 <kill>
 141:	e8 3f 03 00 00       	call   485 <exit>
   assert(p != NULL);
 146:	6a 1c                	push   $0x1c
 148:	68 88 08 00 00       	push   $0x888
 14d:	68 91 08 00 00       	push   $0x891
 152:	6a 01                	push   $0x1
 154:	e8 81 04 00 00       	call   5da <printf>
 159:	83 c4 0c             	add    $0xc,%esp
 15c:	68 c6 08 00 00       	push   $0x8c6
 161:	68 a5 08 00 00       	push   $0x8a5
 166:	6a 01                	push   $0x1
 168:	e8 6d 04 00 00       	call   5da <printf>
 16d:	83 c4 08             	add    $0x8,%esp
 170:	68 b9 08 00 00       	push   $0x8b9
 175:	6a 01                	push   $0x1
 177:	e8 5e 04 00 00       	call   5da <printf>
 17c:	83 c4 04             	add    $0x4,%esp
 17f:	ff 35 00 0d 00 00    	push   0xd00
 185:	e8 2b 03 00 00       	call   4b5 <kill>
 18a:	e8 f6 02 00 00       	call   485 <exit>
   assert(clone_pid > 0);
 18f:	6a 23                	push   $0x23
 191:	68 88 08 00 00       	push   $0x888
 196:	68 91 08 00 00       	push   $0x891
 19b:	6a 01                	push   $0x1
 19d:	e8 38 04 00 00       	call   5da <printf>
 1a2:	83 c4 0c             	add    $0xc,%esp
 1a5:	68 d0 08 00 00       	push   $0x8d0
 1aa:	68 a5 08 00 00       	push   $0x8a5
 1af:	6a 01                	push   $0x1
 1b1:	e8 24 04 00 00       	call   5da <printf>
 1b6:	83 c4 08             	add    $0x8,%esp
 1b9:	68 b9 08 00 00       	push   $0x8b9
 1be:	6a 01                	push   $0x1
 1c0:	e8 15 04 00 00       	call   5da <printf>
 1c5:	83 c4 04             	add    $0x4,%esp
 1c8:	ff 35 00 0d 00 00    	push   0xd00
 1ce:	e8 e2 02 00 00       	call   4b5 <kill>
 1d3:	e8 ad 02 00 00       	call   485 <exit>
   free(p);
 1d8:	83 ec 0c             	sub    $0xc,%esp
 1db:	53                   	push   %ebx
 1dc:	e8 5f 05 00 00       	call   740 <free>
   exit();
 1e1:	e8 9f 02 00 00       	call   485 <exit>

000001e6 <test_and_set>:
  int flag;
};

struct thread_ref *threads[64];

int test_and_set(int *old_ptr, int new_ptr) {
 1e6:	55                   	push   %ebp
 1e7:	89 e5                	mov    %esp,%ebp
 1e9:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *old_ptr;
 1ec:	8b 10                	mov    (%eax),%edx
  *old_ptr = new_ptr;
 1ee:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 1f1:	89 08                	mov    %ecx,(%eax)
  return old;
}
 1f3:	89 d0                	mov    %edx,%eax
 1f5:	5d                   	pop    %ebp
 1f6:	c3                   	ret    

000001f7 <thread_create>:

// a wrapper func for clone
int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 1f7:	55                   	push   %ebp
 1f8:	89 e5                	mov    %esp,%ebp
 1fa:	53                   	push   %ebx
 1fb:	83 ec 10             	sub    $0x10,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE*2);
 1fe:	68 00 20 00 00       	push   $0x2000
 203:	e8 f8 05 00 00       	call   800 <malloc>
  if(n_stack == 0){
 208:	83 c4 10             	add    $0x10,%esp
 20b:	85 c0                	test   %eax,%eax
 20d:	74 41                	je     250 <thread_create+0x59>
 20f:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  int new_pid = clone(start_routine, arg1, arg2, n_stack);
 211:	50                   	push   %eax
 212:	ff 75 10             	push   0x10(%ebp)
 215:	ff 75 0c             	push   0xc(%ebp)
 218:	ff 75 08             	push   0x8(%ebp)
 21b:	e8 05 03 00 00       	call   525 <clone>

  for(int i=0; i<64; i++){
 220:	83 c4 10             	add    $0x10,%esp
 223:	ba 00 00 00 00       	mov    $0x0,%edx
 228:	eb 03                	jmp    22d <thread_create+0x36>
 22a:	83 c2 01             	add    $0x1,%edx
 22d:	83 fa 3f             	cmp    $0x3f,%edx
 230:	7f 19                	jg     24b <thread_create+0x54>
    if(threads[i]->flag==0){
 232:	8b 0c 95 20 0d 00 00 	mov    0xd20(,%edx,4),%ecx
 239:	83 79 08 00          	cmpl   $0x0,0x8(%ecx)
 23d:	75 eb                	jne    22a <thread_create+0x33>
      threads[i]->maddr = n_stack;
 23f:	89 19                	mov    %ebx,(%ecx)
      threads[i]->pg1addr = n_stack;
 241:	8b 14 95 20 0d 00 00 	mov    0xd20(,%edx,4),%edx
 248:	89 5a 04             	mov    %ebx,0x4(%edx)
      break;
    }
  }

  return new_pid;
}
 24b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 24e:	c9                   	leave  
 24f:	c3                   	ret    
    return -1;
 250:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 255:	eb f4                	jmp    24b <thread_create+0x54>

00000257 <thread_join>:

//TODO: fix
int thread_join() {
 257:	55                   	push   %ebp
 258:	89 e5                	mov    %esp,%ebp
 25a:	56                   	push   %esi
 25b:	53                   	push   %ebx
 25c:	83 ec 1c             	sub    $0x1c,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 25f:	8d 45 f4             	lea    -0xc(%ebp),%eax
 262:	50                   	push   %eax
 263:	e8 c5 02 00 00       	call   52d <join>
 268:	89 c6                	mov    %eax,%esi
  for(int i=0; i<64; i++){
 26a:	83 c4 10             	add    $0x10,%esp
 26d:	bb 00 00 00 00       	mov    $0x0,%ebx
 272:	eb 03                	jmp    277 <thread_join+0x20>
 274:	83 c3 01             	add    $0x1,%ebx
 277:	83 fb 3f             	cmp    $0x3f,%ebx
 27a:	7f 23                	jg     29f <thread_join+0x48>
    if((threads[i]->flag==1) && (stk_addr == threads[i]->pg1addr)){
 27c:	8b 04 9d 20 0d 00 00 	mov    0xd20(,%ebx,4),%eax
 283:	83 78 08 01          	cmpl   $0x1,0x8(%eax)
 287:	75 eb                	jne    274 <thread_join+0x1d>
 289:	8b 55 f4             	mov    -0xc(%ebp),%edx
 28c:	39 50 04             	cmp    %edx,0x4(%eax)
 28f:	75 e3                	jne    274 <thread_join+0x1d>
      free(stk_addr);
 291:	83 ec 0c             	sub    $0xc,%esp
 294:	52                   	push   %edx
 295:	e8 a6 04 00 00       	call   740 <free>
 29a:	83 c4 10             	add    $0x10,%esp
 29d:	eb d5                	jmp    274 <thread_join+0x1d>
    }
  }
  return pid;
}
 29f:	89 f0                	mov    %esi,%eax
 2a1:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2a4:	5b                   	pop    %ebx
 2a5:	5e                   	pop    %esi
 2a6:	5d                   	pop    %ebp
 2a7:	c3                   	ret    

000002a8 <lock_acquire>:

void lock_acquire(lock_t *lock){
 2a8:	55                   	push   %ebp
 2a9:	89 e5                	mov    %esp,%ebp
 2ab:	53                   	push   %ebx
 2ac:	83 ec 04             	sub    $0x4,%esp
 2af:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 2b2:	83 ec 08             	sub    $0x8,%esp
 2b5:	6a 01                	push   $0x1
 2b7:	53                   	push   %ebx
 2b8:	e8 29 ff ff ff       	call   1e6 <test_and_set>
 2bd:	83 c4 10             	add    $0x10,%esp
 2c0:	83 f8 01             	cmp    $0x1,%eax
 2c3:	74 ed                	je     2b2 <lock_acquire+0xa>
    ;
}
 2c5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2c8:	c9                   	leave  
 2c9:	c3                   	ret    

000002ca <lock_release>:

void lock_release(lock_t *lock) {
 2ca:	55                   	push   %ebp
 2cb:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 2cd:	8b 45 08             	mov    0x8(%ebp),%eax
 2d0:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 2d6:	5d                   	pop    %ebp
 2d7:	c3                   	ret    

000002d8 <lock_init>:

void lock_init(lock_t *lock) {
 2d8:	55                   	push   %ebp
 2d9:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 2db:	8b 45 08             	mov    0x8(%ebp),%eax
 2de:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 2e4:	5d                   	pop    %ebp
 2e5:	c3                   	ret    

000002e6 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 2e6:	55                   	push   %ebp
 2e7:	89 e5                	mov    %esp,%ebp
 2e9:	56                   	push   %esi
 2ea:	53                   	push   %ebx
 2eb:	8b 75 08             	mov    0x8(%ebp),%esi
 2ee:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 2f1:	89 f0                	mov    %esi,%eax
 2f3:	89 d1                	mov    %edx,%ecx
 2f5:	83 c2 01             	add    $0x1,%edx
 2f8:	89 c3                	mov    %eax,%ebx
 2fa:	83 c0 01             	add    $0x1,%eax
 2fd:	0f b6 09             	movzbl (%ecx),%ecx
 300:	88 0b                	mov    %cl,(%ebx)
 302:	84 c9                	test   %cl,%cl
 304:	75 ed                	jne    2f3 <strcpy+0xd>
    ;
  return os;
}
 306:	89 f0                	mov    %esi,%eax
 308:	5b                   	pop    %ebx
 309:	5e                   	pop    %esi
 30a:	5d                   	pop    %ebp
 30b:	c3                   	ret    

0000030c <strcmp>:

int
strcmp(const char *p, const char *q)
{
 30c:	55                   	push   %ebp
 30d:	89 e5                	mov    %esp,%ebp
 30f:	8b 4d 08             	mov    0x8(%ebp),%ecx
 312:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 315:	eb 06                	jmp    31d <strcmp+0x11>
    p++, q++;
 317:	83 c1 01             	add    $0x1,%ecx
 31a:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 31d:	0f b6 01             	movzbl (%ecx),%eax
 320:	84 c0                	test   %al,%al
 322:	74 04                	je     328 <strcmp+0x1c>
 324:	3a 02                	cmp    (%edx),%al
 326:	74 ef                	je     317 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 328:	0f b6 c0             	movzbl %al,%eax
 32b:	0f b6 12             	movzbl (%edx),%edx
 32e:	29 d0                	sub    %edx,%eax
}
 330:	5d                   	pop    %ebp
 331:	c3                   	ret    

00000332 <strlen>:

uint
strlen(const char *s)
{
 332:	55                   	push   %ebp
 333:	89 e5                	mov    %esp,%ebp
 335:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 338:	b8 00 00 00 00       	mov    $0x0,%eax
 33d:	eb 03                	jmp    342 <strlen+0x10>
 33f:	83 c0 01             	add    $0x1,%eax
 342:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 346:	75 f7                	jne    33f <strlen+0xd>
    ;
  return n;
}
 348:	5d                   	pop    %ebp
 349:	c3                   	ret    

0000034a <memset>:

void*
memset(void *dst, int c, uint n)
{
 34a:	55                   	push   %ebp
 34b:	89 e5                	mov    %esp,%ebp
 34d:	57                   	push   %edi
 34e:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 351:	89 d7                	mov    %edx,%edi
 353:	8b 4d 10             	mov    0x10(%ebp),%ecx
 356:	8b 45 0c             	mov    0xc(%ebp),%eax
 359:	fc                   	cld    
 35a:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 35c:	89 d0                	mov    %edx,%eax
 35e:	8b 7d fc             	mov    -0x4(%ebp),%edi
 361:	c9                   	leave  
 362:	c3                   	ret    

00000363 <strchr>:

char*
strchr(const char *s, char c)
{
 363:	55                   	push   %ebp
 364:	89 e5                	mov    %esp,%ebp
 366:	8b 45 08             	mov    0x8(%ebp),%eax
 369:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 36d:	eb 03                	jmp    372 <strchr+0xf>
 36f:	83 c0 01             	add    $0x1,%eax
 372:	0f b6 10             	movzbl (%eax),%edx
 375:	84 d2                	test   %dl,%dl
 377:	74 06                	je     37f <strchr+0x1c>
    if(*s == c)
 379:	38 ca                	cmp    %cl,%dl
 37b:	75 f2                	jne    36f <strchr+0xc>
 37d:	eb 05                	jmp    384 <strchr+0x21>
      return (char*)s;
  return 0;
 37f:	b8 00 00 00 00       	mov    $0x0,%eax
}
 384:	5d                   	pop    %ebp
 385:	c3                   	ret    

00000386 <gets>:

char*
gets(char *buf, int max)
{
 386:	55                   	push   %ebp
 387:	89 e5                	mov    %esp,%ebp
 389:	57                   	push   %edi
 38a:	56                   	push   %esi
 38b:	53                   	push   %ebx
 38c:	83 ec 1c             	sub    $0x1c,%esp
 38f:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 392:	bb 00 00 00 00       	mov    $0x0,%ebx
 397:	89 de                	mov    %ebx,%esi
 399:	83 c3 01             	add    $0x1,%ebx
 39c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 39f:	7d 2e                	jge    3cf <gets+0x49>
    cc = read(0, &c, 1);
 3a1:	83 ec 04             	sub    $0x4,%esp
 3a4:	6a 01                	push   $0x1
 3a6:	8d 45 e7             	lea    -0x19(%ebp),%eax
 3a9:	50                   	push   %eax
 3aa:	6a 00                	push   $0x0
 3ac:	e8 ec 00 00 00       	call   49d <read>
    if(cc < 1)
 3b1:	83 c4 10             	add    $0x10,%esp
 3b4:	85 c0                	test   %eax,%eax
 3b6:	7e 17                	jle    3cf <gets+0x49>
      break;
    buf[i++] = c;
 3b8:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 3bc:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 3bf:	3c 0a                	cmp    $0xa,%al
 3c1:	0f 94 c2             	sete   %dl
 3c4:	3c 0d                	cmp    $0xd,%al
 3c6:	0f 94 c0             	sete   %al
 3c9:	08 c2                	or     %al,%dl
 3cb:	74 ca                	je     397 <gets+0x11>
    buf[i++] = c;
 3cd:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 3cf:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 3d3:	89 f8                	mov    %edi,%eax
 3d5:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3d8:	5b                   	pop    %ebx
 3d9:	5e                   	pop    %esi
 3da:	5f                   	pop    %edi
 3db:	5d                   	pop    %ebp
 3dc:	c3                   	ret    

000003dd <stat>:

int
stat(const char *n, struct stat *st)
{
 3dd:	55                   	push   %ebp
 3de:	89 e5                	mov    %esp,%ebp
 3e0:	56                   	push   %esi
 3e1:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 3e2:	83 ec 08             	sub    $0x8,%esp
 3e5:	6a 00                	push   $0x0
 3e7:	ff 75 08             	push   0x8(%ebp)
 3ea:	e8 d6 00 00 00       	call   4c5 <open>
  if(fd < 0)
 3ef:	83 c4 10             	add    $0x10,%esp
 3f2:	85 c0                	test   %eax,%eax
 3f4:	78 24                	js     41a <stat+0x3d>
 3f6:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 3f8:	83 ec 08             	sub    $0x8,%esp
 3fb:	ff 75 0c             	push   0xc(%ebp)
 3fe:	50                   	push   %eax
 3ff:	e8 d9 00 00 00       	call   4dd <fstat>
 404:	89 c6                	mov    %eax,%esi
  close(fd);
 406:	89 1c 24             	mov    %ebx,(%esp)
 409:	e8 9f 00 00 00       	call   4ad <close>
  return r;
 40e:	83 c4 10             	add    $0x10,%esp
}
 411:	89 f0                	mov    %esi,%eax
 413:	8d 65 f8             	lea    -0x8(%ebp),%esp
 416:	5b                   	pop    %ebx
 417:	5e                   	pop    %esi
 418:	5d                   	pop    %ebp
 419:	c3                   	ret    
    return -1;
 41a:	be ff ff ff ff       	mov    $0xffffffff,%esi
 41f:	eb f0                	jmp    411 <stat+0x34>

00000421 <atoi>:

int
atoi(const char *s)
{
 421:	55                   	push   %ebp
 422:	89 e5                	mov    %esp,%ebp
 424:	53                   	push   %ebx
 425:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 428:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 42d:	eb 10                	jmp    43f <atoi+0x1e>
    n = n*10 + *s++ - '0';
 42f:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 432:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 435:	83 c1 01             	add    $0x1,%ecx
 438:	0f be c0             	movsbl %al,%eax
 43b:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 43f:	0f b6 01             	movzbl (%ecx),%eax
 442:	8d 58 d0             	lea    -0x30(%eax),%ebx
 445:	80 fb 09             	cmp    $0x9,%bl
 448:	76 e5                	jbe    42f <atoi+0xe>
  return n;
}
 44a:	89 d0                	mov    %edx,%eax
 44c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 44f:	c9                   	leave  
 450:	c3                   	ret    

00000451 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 451:	55                   	push   %ebp
 452:	89 e5                	mov    %esp,%ebp
 454:	56                   	push   %esi
 455:	53                   	push   %ebx
 456:	8b 75 08             	mov    0x8(%ebp),%esi
 459:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 45c:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 45f:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 461:	eb 0d                	jmp    470 <memmove+0x1f>
    *dst++ = *src++;
 463:	0f b6 01             	movzbl (%ecx),%eax
 466:	88 02                	mov    %al,(%edx)
 468:	8d 49 01             	lea    0x1(%ecx),%ecx
 46b:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 46e:	89 d8                	mov    %ebx,%eax
 470:	8d 58 ff             	lea    -0x1(%eax),%ebx
 473:	85 c0                	test   %eax,%eax
 475:	7f ec                	jg     463 <memmove+0x12>
  return vdst;
}
 477:	89 f0                	mov    %esi,%eax
 479:	5b                   	pop    %ebx
 47a:	5e                   	pop    %esi
 47b:	5d                   	pop    %ebp
 47c:	c3                   	ret    

0000047d <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 47d:	b8 01 00 00 00       	mov    $0x1,%eax
 482:	cd 40                	int    $0x40
 484:	c3                   	ret    

00000485 <exit>:
SYSCALL(exit)
 485:	b8 02 00 00 00       	mov    $0x2,%eax
 48a:	cd 40                	int    $0x40
 48c:	c3                   	ret    

0000048d <wait>:
SYSCALL(wait)
 48d:	b8 03 00 00 00       	mov    $0x3,%eax
 492:	cd 40                	int    $0x40
 494:	c3                   	ret    

00000495 <pipe>:
SYSCALL(pipe)
 495:	b8 04 00 00 00       	mov    $0x4,%eax
 49a:	cd 40                	int    $0x40
 49c:	c3                   	ret    

0000049d <read>:
SYSCALL(read)
 49d:	b8 05 00 00 00       	mov    $0x5,%eax
 4a2:	cd 40                	int    $0x40
 4a4:	c3                   	ret    

000004a5 <write>:
SYSCALL(write)
 4a5:	b8 10 00 00 00       	mov    $0x10,%eax
 4aa:	cd 40                	int    $0x40
 4ac:	c3                   	ret    

000004ad <close>:
SYSCALL(close)
 4ad:	b8 15 00 00 00       	mov    $0x15,%eax
 4b2:	cd 40                	int    $0x40
 4b4:	c3                   	ret    

000004b5 <kill>:
SYSCALL(kill)
 4b5:	b8 06 00 00 00       	mov    $0x6,%eax
 4ba:	cd 40                	int    $0x40
 4bc:	c3                   	ret    

000004bd <exec>:
SYSCALL(exec)
 4bd:	b8 07 00 00 00       	mov    $0x7,%eax
 4c2:	cd 40                	int    $0x40
 4c4:	c3                   	ret    

000004c5 <open>:
SYSCALL(open)
 4c5:	b8 0f 00 00 00       	mov    $0xf,%eax
 4ca:	cd 40                	int    $0x40
 4cc:	c3                   	ret    

000004cd <mknod>:
SYSCALL(mknod)
 4cd:	b8 11 00 00 00       	mov    $0x11,%eax
 4d2:	cd 40                	int    $0x40
 4d4:	c3                   	ret    

000004d5 <unlink>:
SYSCALL(unlink)
 4d5:	b8 12 00 00 00       	mov    $0x12,%eax
 4da:	cd 40                	int    $0x40
 4dc:	c3                   	ret    

000004dd <fstat>:
SYSCALL(fstat)
 4dd:	b8 08 00 00 00       	mov    $0x8,%eax
 4e2:	cd 40                	int    $0x40
 4e4:	c3                   	ret    

000004e5 <link>:
SYSCALL(link)
 4e5:	b8 13 00 00 00       	mov    $0x13,%eax
 4ea:	cd 40                	int    $0x40
 4ec:	c3                   	ret    

000004ed <mkdir>:
SYSCALL(mkdir)
 4ed:	b8 14 00 00 00       	mov    $0x14,%eax
 4f2:	cd 40                	int    $0x40
 4f4:	c3                   	ret    

000004f5 <chdir>:
SYSCALL(chdir)
 4f5:	b8 09 00 00 00       	mov    $0x9,%eax
 4fa:	cd 40                	int    $0x40
 4fc:	c3                   	ret    

000004fd <dup>:
SYSCALL(dup)
 4fd:	b8 0a 00 00 00       	mov    $0xa,%eax
 502:	cd 40                	int    $0x40
 504:	c3                   	ret    

00000505 <getpid>:
SYSCALL(getpid)
 505:	b8 0b 00 00 00       	mov    $0xb,%eax
 50a:	cd 40                	int    $0x40
 50c:	c3                   	ret    

0000050d <sbrk>:
SYSCALL(sbrk)
 50d:	b8 0c 00 00 00       	mov    $0xc,%eax
 512:	cd 40                	int    $0x40
 514:	c3                   	ret    

00000515 <sleep>:
SYSCALL(sleep)
 515:	b8 0d 00 00 00       	mov    $0xd,%eax
 51a:	cd 40                	int    $0x40
 51c:	c3                   	ret    

0000051d <uptime>:
SYSCALL(uptime)
 51d:	b8 0e 00 00 00       	mov    $0xe,%eax
 522:	cd 40                	int    $0x40
 524:	c3                   	ret    

00000525 <clone>:
SYSCALL(clone)
 525:	b8 16 00 00 00       	mov    $0x16,%eax
 52a:	cd 40                	int    $0x40
 52c:	c3                   	ret    

0000052d <join>:
 52d:	b8 17 00 00 00       	mov    $0x17,%eax
 532:	cd 40                	int    $0x40
 534:	c3                   	ret    

00000535 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 535:	55                   	push   %ebp
 536:	89 e5                	mov    %esp,%ebp
 538:	83 ec 1c             	sub    $0x1c,%esp
 53b:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 53e:	6a 01                	push   $0x1
 540:	8d 55 f4             	lea    -0xc(%ebp),%edx
 543:	52                   	push   %edx
 544:	50                   	push   %eax
 545:	e8 5b ff ff ff       	call   4a5 <write>
}
 54a:	83 c4 10             	add    $0x10,%esp
 54d:	c9                   	leave  
 54e:	c3                   	ret    

0000054f <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 54f:	55                   	push   %ebp
 550:	89 e5                	mov    %esp,%ebp
 552:	57                   	push   %edi
 553:	56                   	push   %esi
 554:	53                   	push   %ebx
 555:	83 ec 2c             	sub    $0x2c,%esp
 558:	89 45 d0             	mov    %eax,-0x30(%ebp)
 55b:	89 d0                	mov    %edx,%eax
 55d:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 55f:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 563:	0f 95 c1             	setne  %cl
 566:	c1 ea 1f             	shr    $0x1f,%edx
 569:	84 d1                	test   %dl,%cl
 56b:	74 44                	je     5b1 <printint+0x62>
    neg = 1;
    x = -xx;
 56d:	f7 d8                	neg    %eax
 56f:	89 c1                	mov    %eax,%ecx
    neg = 1;
 571:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 578:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 57d:	89 c8                	mov    %ecx,%eax
 57f:	ba 00 00 00 00       	mov    $0x0,%edx
 584:	f7 f6                	div    %esi
 586:	89 df                	mov    %ebx,%edi
 588:	83 c3 01             	add    $0x1,%ebx
 58b:	0f b6 92 60 09 00 00 	movzbl 0x960(%edx),%edx
 592:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 596:	89 ca                	mov    %ecx,%edx
 598:	89 c1                	mov    %eax,%ecx
 59a:	39 d6                	cmp    %edx,%esi
 59c:	76 df                	jbe    57d <printint+0x2e>
  if(neg)
 59e:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 5a2:	74 31                	je     5d5 <printint+0x86>
    buf[i++] = '-';
 5a4:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 5a9:	8d 5f 02             	lea    0x2(%edi),%ebx
 5ac:	8b 75 d0             	mov    -0x30(%ebp),%esi
 5af:	eb 17                	jmp    5c8 <printint+0x79>
    x = xx;
 5b1:	89 c1                	mov    %eax,%ecx
  neg = 0;
 5b3:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 5ba:	eb bc                	jmp    578 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 5bc:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 5c1:	89 f0                	mov    %esi,%eax
 5c3:	e8 6d ff ff ff       	call   535 <putc>
  while(--i >= 0)
 5c8:	83 eb 01             	sub    $0x1,%ebx
 5cb:	79 ef                	jns    5bc <printint+0x6d>
}
 5cd:	83 c4 2c             	add    $0x2c,%esp
 5d0:	5b                   	pop    %ebx
 5d1:	5e                   	pop    %esi
 5d2:	5f                   	pop    %edi
 5d3:	5d                   	pop    %ebp
 5d4:	c3                   	ret    
 5d5:	8b 75 d0             	mov    -0x30(%ebp),%esi
 5d8:	eb ee                	jmp    5c8 <printint+0x79>

000005da <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5da:	55                   	push   %ebp
 5db:	89 e5                	mov    %esp,%ebp
 5dd:	57                   	push   %edi
 5de:	56                   	push   %esi
 5df:	53                   	push   %ebx
 5e0:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 5e3:	8d 45 10             	lea    0x10(%ebp),%eax
 5e6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 5e9:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 5ee:	bb 00 00 00 00       	mov    $0x0,%ebx
 5f3:	eb 14                	jmp    609 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 5f5:	89 fa                	mov    %edi,%edx
 5f7:	8b 45 08             	mov    0x8(%ebp),%eax
 5fa:	e8 36 ff ff ff       	call   535 <putc>
 5ff:	eb 05                	jmp    606 <printf+0x2c>
      }
    } else if(state == '%'){
 601:	83 fe 25             	cmp    $0x25,%esi
 604:	74 25                	je     62b <printf+0x51>
  for(i = 0; fmt[i]; i++){
 606:	83 c3 01             	add    $0x1,%ebx
 609:	8b 45 0c             	mov    0xc(%ebp),%eax
 60c:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 610:	84 c0                	test   %al,%al
 612:	0f 84 20 01 00 00    	je     738 <printf+0x15e>
    c = fmt[i] & 0xff;
 618:	0f be f8             	movsbl %al,%edi
 61b:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 61e:	85 f6                	test   %esi,%esi
 620:	75 df                	jne    601 <printf+0x27>
      if(c == '%'){
 622:	83 f8 25             	cmp    $0x25,%eax
 625:	75 ce                	jne    5f5 <printf+0x1b>
        state = '%';
 627:	89 c6                	mov    %eax,%esi
 629:	eb db                	jmp    606 <printf+0x2c>
      if(c == 'd'){
 62b:	83 f8 25             	cmp    $0x25,%eax
 62e:	0f 84 cf 00 00 00    	je     703 <printf+0x129>
 634:	0f 8c dd 00 00 00    	jl     717 <printf+0x13d>
 63a:	83 f8 78             	cmp    $0x78,%eax
 63d:	0f 8f d4 00 00 00    	jg     717 <printf+0x13d>
 643:	83 f8 63             	cmp    $0x63,%eax
 646:	0f 8c cb 00 00 00    	jl     717 <printf+0x13d>
 64c:	83 e8 63             	sub    $0x63,%eax
 64f:	83 f8 15             	cmp    $0x15,%eax
 652:	0f 87 bf 00 00 00    	ja     717 <printf+0x13d>
 658:	ff 24 85 08 09 00 00 	jmp    *0x908(,%eax,4)
        printint(fd, *ap, 10, 1);
 65f:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 662:	8b 17                	mov    (%edi),%edx
 664:	83 ec 0c             	sub    $0xc,%esp
 667:	6a 01                	push   $0x1
 669:	b9 0a 00 00 00       	mov    $0xa,%ecx
 66e:	8b 45 08             	mov    0x8(%ebp),%eax
 671:	e8 d9 fe ff ff       	call   54f <printint>
        ap++;
 676:	83 c7 04             	add    $0x4,%edi
 679:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 67c:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 67f:	be 00 00 00 00       	mov    $0x0,%esi
 684:	eb 80                	jmp    606 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 686:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 689:	8b 17                	mov    (%edi),%edx
 68b:	83 ec 0c             	sub    $0xc,%esp
 68e:	6a 00                	push   $0x0
 690:	b9 10 00 00 00       	mov    $0x10,%ecx
 695:	8b 45 08             	mov    0x8(%ebp),%eax
 698:	e8 b2 fe ff ff       	call   54f <printint>
        ap++;
 69d:	83 c7 04             	add    $0x4,%edi
 6a0:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 6a3:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6a6:	be 00 00 00 00       	mov    $0x0,%esi
 6ab:	e9 56 ff ff ff       	jmp    606 <printf+0x2c>
        s = (char*)*ap;
 6b0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6b3:	8b 30                	mov    (%eax),%esi
        ap++;
 6b5:	83 c0 04             	add    $0x4,%eax
 6b8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 6bb:	85 f6                	test   %esi,%esi
 6bd:	75 15                	jne    6d4 <printf+0xfa>
          s = "(null)";
 6bf:	be 01 09 00 00       	mov    $0x901,%esi
 6c4:	eb 0e                	jmp    6d4 <printf+0xfa>
          putc(fd, *s);
 6c6:	0f be d2             	movsbl %dl,%edx
 6c9:	8b 45 08             	mov    0x8(%ebp),%eax
 6cc:	e8 64 fe ff ff       	call   535 <putc>
          s++;
 6d1:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 6d4:	0f b6 16             	movzbl (%esi),%edx
 6d7:	84 d2                	test   %dl,%dl
 6d9:	75 eb                	jne    6c6 <printf+0xec>
      state = 0;
 6db:	be 00 00 00 00       	mov    $0x0,%esi
 6e0:	e9 21 ff ff ff       	jmp    606 <printf+0x2c>
        putc(fd, *ap);
 6e5:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6e8:	0f be 17             	movsbl (%edi),%edx
 6eb:	8b 45 08             	mov    0x8(%ebp),%eax
 6ee:	e8 42 fe ff ff       	call   535 <putc>
        ap++;
 6f3:	83 c7 04             	add    $0x4,%edi
 6f6:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 6f9:	be 00 00 00 00       	mov    $0x0,%esi
 6fe:	e9 03 ff ff ff       	jmp    606 <printf+0x2c>
        putc(fd, c);
 703:	89 fa                	mov    %edi,%edx
 705:	8b 45 08             	mov    0x8(%ebp),%eax
 708:	e8 28 fe ff ff       	call   535 <putc>
      state = 0;
 70d:	be 00 00 00 00       	mov    $0x0,%esi
 712:	e9 ef fe ff ff       	jmp    606 <printf+0x2c>
        putc(fd, '%');
 717:	ba 25 00 00 00       	mov    $0x25,%edx
 71c:	8b 45 08             	mov    0x8(%ebp),%eax
 71f:	e8 11 fe ff ff       	call   535 <putc>
        putc(fd, c);
 724:	89 fa                	mov    %edi,%edx
 726:	8b 45 08             	mov    0x8(%ebp),%eax
 729:	e8 07 fe ff ff       	call   535 <putc>
      state = 0;
 72e:	be 00 00 00 00       	mov    $0x0,%esi
 733:	e9 ce fe ff ff       	jmp    606 <printf+0x2c>
    }
  }
}
 738:	8d 65 f4             	lea    -0xc(%ebp),%esp
 73b:	5b                   	pop    %ebx
 73c:	5e                   	pop    %esi
 73d:	5f                   	pop    %edi
 73e:	5d                   	pop    %ebp
 73f:	c3                   	ret    

00000740 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 740:	55                   	push   %ebp
 741:	89 e5                	mov    %esp,%ebp
 743:	57                   	push   %edi
 744:	56                   	push   %esi
 745:	53                   	push   %ebx
 746:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 749:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 74c:	a1 20 0e 00 00       	mov    0xe20,%eax
 751:	eb 02                	jmp    755 <free+0x15>
 753:	89 d0                	mov    %edx,%eax
 755:	39 c8                	cmp    %ecx,%eax
 757:	73 04                	jae    75d <free+0x1d>
 759:	39 08                	cmp    %ecx,(%eax)
 75b:	77 12                	ja     76f <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 75d:	8b 10                	mov    (%eax),%edx
 75f:	39 c2                	cmp    %eax,%edx
 761:	77 f0                	ja     753 <free+0x13>
 763:	39 c8                	cmp    %ecx,%eax
 765:	72 08                	jb     76f <free+0x2f>
 767:	39 ca                	cmp    %ecx,%edx
 769:	77 04                	ja     76f <free+0x2f>
 76b:	89 d0                	mov    %edx,%eax
 76d:	eb e6                	jmp    755 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 76f:	8b 73 fc             	mov    -0x4(%ebx),%esi
 772:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 775:	8b 10                	mov    (%eax),%edx
 777:	39 d7                	cmp    %edx,%edi
 779:	74 19                	je     794 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 77b:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 77e:	8b 50 04             	mov    0x4(%eax),%edx
 781:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 784:	39 ce                	cmp    %ecx,%esi
 786:	74 1b                	je     7a3 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 788:	89 08                	mov    %ecx,(%eax)
  freep = p;
 78a:	a3 20 0e 00 00       	mov    %eax,0xe20
}
 78f:	5b                   	pop    %ebx
 790:	5e                   	pop    %esi
 791:	5f                   	pop    %edi
 792:	5d                   	pop    %ebp
 793:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 794:	03 72 04             	add    0x4(%edx),%esi
 797:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 79a:	8b 10                	mov    (%eax),%edx
 79c:	8b 12                	mov    (%edx),%edx
 79e:	89 53 f8             	mov    %edx,-0x8(%ebx)
 7a1:	eb db                	jmp    77e <free+0x3e>
    p->s.size += bp->s.size;
 7a3:	03 53 fc             	add    -0x4(%ebx),%edx
 7a6:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7a9:	8b 53 f8             	mov    -0x8(%ebx),%edx
 7ac:	89 10                	mov    %edx,(%eax)
 7ae:	eb da                	jmp    78a <free+0x4a>

000007b0 <morecore>:

static Header*
morecore(uint nu)
{
 7b0:	55                   	push   %ebp
 7b1:	89 e5                	mov    %esp,%ebp
 7b3:	53                   	push   %ebx
 7b4:	83 ec 04             	sub    $0x4,%esp
 7b7:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 7b9:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 7be:	77 05                	ja     7c5 <morecore+0x15>
    nu = 4096;
 7c0:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 7c5:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 7cc:	83 ec 0c             	sub    $0xc,%esp
 7cf:	50                   	push   %eax
 7d0:	e8 38 fd ff ff       	call   50d <sbrk>
  if(p == (char*)-1)
 7d5:	83 c4 10             	add    $0x10,%esp
 7d8:	83 f8 ff             	cmp    $0xffffffff,%eax
 7db:	74 1c                	je     7f9 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 7dd:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 7e0:	83 c0 08             	add    $0x8,%eax
 7e3:	83 ec 0c             	sub    $0xc,%esp
 7e6:	50                   	push   %eax
 7e7:	e8 54 ff ff ff       	call   740 <free>
  return freep;
 7ec:	a1 20 0e 00 00       	mov    0xe20,%eax
 7f1:	83 c4 10             	add    $0x10,%esp
}
 7f4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 7f7:	c9                   	leave  
 7f8:	c3                   	ret    
    return 0;
 7f9:	b8 00 00 00 00       	mov    $0x0,%eax
 7fe:	eb f4                	jmp    7f4 <morecore+0x44>

00000800 <malloc>:

void*
malloc(uint nbytes)
{
 800:	55                   	push   %ebp
 801:	89 e5                	mov    %esp,%ebp
 803:	53                   	push   %ebx
 804:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 807:	8b 45 08             	mov    0x8(%ebp),%eax
 80a:	8d 58 07             	lea    0x7(%eax),%ebx
 80d:	c1 eb 03             	shr    $0x3,%ebx
 810:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 813:	8b 0d 20 0e 00 00    	mov    0xe20,%ecx
 819:	85 c9                	test   %ecx,%ecx
 81b:	74 04                	je     821 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 81d:	8b 01                	mov    (%ecx),%eax
 81f:	eb 4a                	jmp    86b <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 821:	c7 05 20 0e 00 00 24 	movl   $0xe24,0xe20
 828:	0e 00 00 
 82b:	c7 05 24 0e 00 00 24 	movl   $0xe24,0xe24
 832:	0e 00 00 
    base.s.size = 0;
 835:	c7 05 28 0e 00 00 00 	movl   $0x0,0xe28
 83c:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 83f:	b9 24 0e 00 00       	mov    $0xe24,%ecx
 844:	eb d7                	jmp    81d <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 846:	74 19                	je     861 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 848:	29 da                	sub    %ebx,%edx
 84a:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 84d:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 850:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 853:	89 0d 20 0e 00 00    	mov    %ecx,0xe20
      return (void*)(p + 1);
 859:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 85c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 85f:	c9                   	leave  
 860:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 861:	8b 10                	mov    (%eax),%edx
 863:	89 11                	mov    %edx,(%ecx)
 865:	eb ec                	jmp    853 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 867:	89 c1                	mov    %eax,%ecx
 869:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 86b:	8b 50 04             	mov    0x4(%eax),%edx
 86e:	39 da                	cmp    %ebx,%edx
 870:	73 d4                	jae    846 <malloc+0x46>
    if(p == freep)
 872:	39 05 20 0e 00 00    	cmp    %eax,0xe20
 878:	75 ed                	jne    867 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 87a:	89 d8                	mov    %ebx,%eax
 87c:	e8 2f ff ff ff       	call   7b0 <morecore>
 881:	85 c0                	test   %eax,%eax
 883:	75 e2                	jne    867 <malloc+0x67>
 885:	eb d5                	jmp    85c <malloc+0x5c>
