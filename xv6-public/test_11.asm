
_test_11:     file format elf32-i386


Disassembly of section .text:

00000000 <worker>:
   printf(1, "TEST PASSED\n");
   exit();
}

void
worker(void *arg1, void *arg2) {
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 08             	sub    $0x8,%esp
   assert(global == 1);
   6:	a1 80 0d 00 00       	mov    0xd80,%eax
   b:	83 f8 01             	cmp    $0x1,%eax
   e:	74 49                	je     59 <worker+0x59>
  10:	6a 2e                	push   $0x2e
  12:	68 c8 08 00 00       	push   $0x8c8
  17:	68 d2 08 00 00       	push   $0x8d2
  1c:	6a 01                	push   $0x1
  1e:	e8 f7 05 00 00       	call   61a <printf>
  23:	83 c4 0c             	add    $0xc,%esp
  26:	68 da 08 00 00       	push   $0x8da
  2b:	68 e6 08 00 00       	push   $0x8e6
  30:	6a 01                	push   $0x1
  32:	e8 e3 05 00 00       	call   61a <printf>
  37:	83 c4 08             	add    $0x8,%esp
  3a:	68 fa 08 00 00       	push   $0x8fa
  3f:	6a 01                	push   $0x1
  41:	e8 d4 05 00 00       	call   61a <printf>
  46:	83 c4 04             	add    $0x4,%esp
  49:	ff 35 84 0d 00 00    	push   0xd84
  4f:	e8 a1 04 00 00       	call   4f5 <kill>
  54:	e8 6c 04 00 00       	call   4c5 <exit>
   global += 4;
  59:	a1 80 0d 00 00       	mov    0xd80,%eax
  5e:	83 c0 04             	add    $0x4,%eax
  61:	a3 80 0d 00 00       	mov    %eax,0xd80
   exit();
  66:	e8 5a 04 00 00       	call   4c5 <exit>

0000006b <main>:
{
  6b:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  6f:	83 e4 f0             	and    $0xfffffff0,%esp
  72:	ff 71 fc             	push   -0x4(%ecx)
  75:	55                   	push   %ebp
  76:	89 e5                	mov    %esp,%ebp
  78:	56                   	push   %esi
  79:	53                   	push   %ebx
  7a:	51                   	push   %ecx
  7b:	83 ec 0c             	sub    $0xc,%esp
   ppid = getpid();
  7e:	e8 c2 04 00 00       	call   545 <getpid>
  83:	a3 84 0d 00 00       	mov    %eax,0xd84
   for(i = 0; i < 10; i++) {
  88:	be 00 00 00 00       	mov    $0x0,%esi
  8d:	83 fe 09             	cmp    $0x9,%esi
  90:	0f 8f 7c 01 00 00    	jg     212 <main+0x1a7>
      global = 1;
  96:	c7 05 80 0d 00 00 01 	movl   $0x1,0xd80
  9d:	00 00 00 
      thread_pid = thread_create(worker, 0, 0);
  a0:	83 ec 04             	sub    $0x4,%esp
  a3:	6a 00                	push   $0x0
  a5:	6a 00                	push   $0x0
  a7:	68 00 00 00 00       	push   $0x0
  ac:	e8 86 01 00 00       	call   237 <thread_create>
  b1:	89 c3                	mov    %eax,%ebx
      assert(thread_pid > 0);
  b3:	83 c4 10             	add    $0x10,%esp
  b6:	85 c0                	test   %eax,%eax
  b8:	7e 34                	jle    ee <main+0x83>
      join_pid = thread_join();
  ba:	e8 d8 01 00 00       	call   297 <thread_join>
      assert(join_pid == thread_pid);
  bf:	39 c3                	cmp    %eax,%ebx
  c1:	75 74                	jne    137 <main+0xcc>
      assert(global == 5);
  c3:	a1 80 0d 00 00       	mov    0xd80,%eax
  c8:	83 f8 05             	cmp    $0x5,%eax
  cb:	0f 85 af 00 00 00    	jne    180 <main+0x115>
      assert((uint)sbrk(0) < (150 * 4096) && "shouldn't even come close");
  d1:	83 ec 0c             	sub    $0xc,%esp
  d4:	6a 00                	push   $0x0
  d6:	e8 72 04 00 00       	call   54d <sbrk>
  db:	83 c4 10             	add    $0x10,%esp
  de:	3d ff 5f 09 00       	cmp    $0x95fff,%eax
  e3:	0f 87 e0 00 00 00    	ja     1c9 <main+0x15e>
   for(i = 0; i < 10; i++) {
  e9:	83 c6 01             	add    $0x1,%esi
  ec:	eb 9f                	jmp    8d <main+0x22>
      assert(thread_pid > 0);
  ee:	6a 20                	push   $0x20
  f0:	68 c8 08 00 00       	push   $0x8c8
  f5:	68 d2 08 00 00       	push   $0x8d2
  fa:	6a 01                	push   $0x1
  fc:	e8 19 05 00 00       	call   61a <printf>
 101:	83 c4 0c             	add    $0xc,%esp
 104:	68 07 09 00 00       	push   $0x907
 109:	68 e6 08 00 00       	push   $0x8e6
 10e:	6a 01                	push   $0x1
 110:	e8 05 05 00 00       	call   61a <printf>
 115:	83 c4 08             	add    $0x8,%esp
 118:	68 fa 08 00 00       	push   $0x8fa
 11d:	6a 01                	push   $0x1
 11f:	e8 f6 04 00 00       	call   61a <printf>
 124:	83 c4 04             	add    $0x4,%esp
 127:	ff 35 84 0d 00 00    	push   0xd84
 12d:	e8 c3 03 00 00       	call   4f5 <kill>
 132:	e8 8e 03 00 00       	call   4c5 <exit>
      assert(join_pid == thread_pid);
 137:	6a 22                	push   $0x22
 139:	68 c8 08 00 00       	push   $0x8c8
 13e:	68 d2 08 00 00       	push   $0x8d2
 143:	6a 01                	push   $0x1
 145:	e8 d0 04 00 00       	call   61a <printf>
 14a:	83 c4 0c             	add    $0xc,%esp
 14d:	68 16 09 00 00       	push   $0x916
 152:	68 e6 08 00 00       	push   $0x8e6
 157:	6a 01                	push   $0x1
 159:	e8 bc 04 00 00       	call   61a <printf>
 15e:	83 c4 08             	add    $0x8,%esp
 161:	68 fa 08 00 00       	push   $0x8fa
 166:	6a 01                	push   $0x1
 168:	e8 ad 04 00 00       	call   61a <printf>
 16d:	83 c4 04             	add    $0x4,%esp
 170:	ff 35 84 0d 00 00    	push   0xd84
 176:	e8 7a 03 00 00       	call   4f5 <kill>
 17b:	e8 45 03 00 00       	call   4c5 <exit>
      assert(global == 5);
 180:	6a 23                	push   $0x23
 182:	68 c8 08 00 00       	push   $0x8c8
 187:	68 d2 08 00 00       	push   $0x8d2
 18c:	6a 01                	push   $0x1
 18e:	e8 87 04 00 00       	call   61a <printf>
 193:	83 c4 0c             	add    $0xc,%esp
 196:	68 2d 09 00 00       	push   $0x92d
 19b:	68 e6 08 00 00       	push   $0x8e6
 1a0:	6a 01                	push   $0x1
 1a2:	e8 73 04 00 00       	call   61a <printf>
 1a7:	83 c4 08             	add    $0x8,%esp
 1aa:	68 fa 08 00 00       	push   $0x8fa
 1af:	6a 01                	push   $0x1
 1b1:	e8 64 04 00 00       	call   61a <printf>
 1b6:	83 c4 04             	add    $0x4,%esp
 1b9:	ff 35 84 0d 00 00    	push   0xd84
 1bf:	e8 31 03 00 00       	call   4f5 <kill>
 1c4:	e8 fc 02 00 00       	call   4c5 <exit>
      assert((uint)sbrk(0) < (150 * 4096) && "shouldn't even come close");
 1c9:	6a 25                	push   $0x25
 1cb:	68 c8 08 00 00       	push   $0x8c8
 1d0:	68 d2 08 00 00       	push   $0x8d2
 1d5:	6a 01                	push   $0x1
 1d7:	e8 3e 04 00 00       	call   61a <printf>
 1dc:	83 c4 0c             	add    $0xc,%esp
 1df:	68 48 09 00 00       	push   $0x948
 1e4:	68 e6 08 00 00       	push   $0x8e6
 1e9:	6a 01                	push   $0x1
 1eb:	e8 2a 04 00 00       	call   61a <printf>
 1f0:	83 c4 08             	add    $0x8,%esp
 1f3:	68 fa 08 00 00       	push   $0x8fa
 1f8:	6a 01                	push   $0x1
 1fa:	e8 1b 04 00 00       	call   61a <printf>
 1ff:	83 c4 04             	add    $0x4,%esp
 202:	ff 35 84 0d 00 00    	push   0xd84
 208:	e8 e8 02 00 00       	call   4f5 <kill>
 20d:	e8 b3 02 00 00       	call   4c5 <exit>
   printf(1, "TEST PASSED\n");
 212:	83 ec 08             	sub    $0x8,%esp
 215:	68 39 09 00 00       	push   $0x939
 21a:	6a 01                	push   $0x1
 21c:	e8 f9 03 00 00       	call   61a <printf>
   exit();
 221:	e8 9f 02 00 00       	call   4c5 <exit>

00000226 <test_and_set>:
  int flag;
};

struct thread_ref *threads[64];

int test_and_set(int *old_ptr, int new_ptr) {
 226:	55                   	push   %ebp
 227:	89 e5                	mov    %esp,%ebp
 229:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *old_ptr;
 22c:	8b 10                	mov    (%eax),%edx
  *old_ptr = new_ptr;
 22e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 231:	89 08                	mov    %ecx,(%eax)
  return old;
}
 233:	89 d0                	mov    %edx,%eax
 235:	5d                   	pop    %ebp
 236:	c3                   	ret    

00000237 <thread_create>:

// a wrapper func for clone
int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 237:	55                   	push   %ebp
 238:	89 e5                	mov    %esp,%ebp
 23a:	53                   	push   %ebx
 23b:	83 ec 10             	sub    $0x10,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE*2);
 23e:	68 00 20 00 00       	push   $0x2000
 243:	e8 f8 05 00 00       	call   840 <malloc>
  if(n_stack == 0){
 248:	83 c4 10             	add    $0x10,%esp
 24b:	85 c0                	test   %eax,%eax
 24d:	74 41                	je     290 <thread_create+0x59>
 24f:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  int new_pid = clone(start_routine, arg1, arg2, n_stack);
 251:	50                   	push   %eax
 252:	ff 75 10             	push   0x10(%ebp)
 255:	ff 75 0c             	push   0xc(%ebp)
 258:	ff 75 08             	push   0x8(%ebp)
 25b:	e8 05 03 00 00       	call   565 <clone>

  for(int i=0; i<64; i++){
 260:	83 c4 10             	add    $0x10,%esp
 263:	ba 00 00 00 00       	mov    $0x0,%edx
 268:	eb 03                	jmp    26d <thread_create+0x36>
 26a:	83 c2 01             	add    $0x1,%edx
 26d:	83 fa 3f             	cmp    $0x3f,%edx
 270:	7f 19                	jg     28b <thread_create+0x54>
    if(threads[i]->flag==0){
 272:	8b 0c 95 a0 0d 00 00 	mov    0xda0(,%edx,4),%ecx
 279:	83 79 08 00          	cmpl   $0x0,0x8(%ecx)
 27d:	75 eb                	jne    26a <thread_create+0x33>
      threads[i]->maddr = n_stack;
 27f:	89 19                	mov    %ebx,(%ecx)
      threads[i]->pg1addr = n_stack;
 281:	8b 14 95 a0 0d 00 00 	mov    0xda0(,%edx,4),%edx
 288:	89 5a 04             	mov    %ebx,0x4(%edx)
      break;
    }
  }

  return new_pid;
}
 28b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 28e:	c9                   	leave  
 28f:	c3                   	ret    
    return -1;
 290:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 295:	eb f4                	jmp    28b <thread_create+0x54>

00000297 <thread_join>:

//TODO: fix
int thread_join() {
 297:	55                   	push   %ebp
 298:	89 e5                	mov    %esp,%ebp
 29a:	56                   	push   %esi
 29b:	53                   	push   %ebx
 29c:	83 ec 1c             	sub    $0x1c,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 29f:	8d 45 f4             	lea    -0xc(%ebp),%eax
 2a2:	50                   	push   %eax
 2a3:	e8 c5 02 00 00       	call   56d <join>
 2a8:	89 c6                	mov    %eax,%esi
  for(int i=0; i<64; i++){
 2aa:	83 c4 10             	add    $0x10,%esp
 2ad:	bb 00 00 00 00       	mov    $0x0,%ebx
 2b2:	eb 03                	jmp    2b7 <thread_join+0x20>
 2b4:	83 c3 01             	add    $0x1,%ebx
 2b7:	83 fb 3f             	cmp    $0x3f,%ebx
 2ba:	7f 23                	jg     2df <thread_join+0x48>
    if((threads[i]->flag==1) && (stk_addr == threads[i]->pg1addr)){
 2bc:	8b 04 9d a0 0d 00 00 	mov    0xda0(,%ebx,4),%eax
 2c3:	83 78 08 01          	cmpl   $0x1,0x8(%eax)
 2c7:	75 eb                	jne    2b4 <thread_join+0x1d>
 2c9:	8b 55 f4             	mov    -0xc(%ebp),%edx
 2cc:	39 50 04             	cmp    %edx,0x4(%eax)
 2cf:	75 e3                	jne    2b4 <thread_join+0x1d>
      free(stk_addr);
 2d1:	83 ec 0c             	sub    $0xc,%esp
 2d4:	52                   	push   %edx
 2d5:	e8 a6 04 00 00       	call   780 <free>
 2da:	83 c4 10             	add    $0x10,%esp
 2dd:	eb d5                	jmp    2b4 <thread_join+0x1d>
    }
  }
  return pid;
}
 2df:	89 f0                	mov    %esi,%eax
 2e1:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2e4:	5b                   	pop    %ebx
 2e5:	5e                   	pop    %esi
 2e6:	5d                   	pop    %ebp
 2e7:	c3                   	ret    

000002e8 <lock_acquire>:

void lock_acquire(lock_t *lock){
 2e8:	55                   	push   %ebp
 2e9:	89 e5                	mov    %esp,%ebp
 2eb:	53                   	push   %ebx
 2ec:	83 ec 04             	sub    $0x4,%esp
 2ef:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 2f2:	83 ec 08             	sub    $0x8,%esp
 2f5:	6a 01                	push   $0x1
 2f7:	53                   	push   %ebx
 2f8:	e8 29 ff ff ff       	call   226 <test_and_set>
 2fd:	83 c4 10             	add    $0x10,%esp
 300:	83 f8 01             	cmp    $0x1,%eax
 303:	74 ed                	je     2f2 <lock_acquire+0xa>
    ;
}
 305:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 308:	c9                   	leave  
 309:	c3                   	ret    

0000030a <lock_release>:

void lock_release(lock_t *lock) {
 30a:	55                   	push   %ebp
 30b:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 30d:	8b 45 08             	mov    0x8(%ebp),%eax
 310:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 316:	5d                   	pop    %ebp
 317:	c3                   	ret    

00000318 <lock_init>:

void lock_init(lock_t *lock) {
 318:	55                   	push   %ebp
 319:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 31b:	8b 45 08             	mov    0x8(%ebp),%eax
 31e:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 324:	5d                   	pop    %ebp
 325:	c3                   	ret    

00000326 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 326:	55                   	push   %ebp
 327:	89 e5                	mov    %esp,%ebp
 329:	56                   	push   %esi
 32a:	53                   	push   %ebx
 32b:	8b 75 08             	mov    0x8(%ebp),%esi
 32e:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 331:	89 f0                	mov    %esi,%eax
 333:	89 d1                	mov    %edx,%ecx
 335:	83 c2 01             	add    $0x1,%edx
 338:	89 c3                	mov    %eax,%ebx
 33a:	83 c0 01             	add    $0x1,%eax
 33d:	0f b6 09             	movzbl (%ecx),%ecx
 340:	88 0b                	mov    %cl,(%ebx)
 342:	84 c9                	test   %cl,%cl
 344:	75 ed                	jne    333 <strcpy+0xd>
    ;
  return os;
}
 346:	89 f0                	mov    %esi,%eax
 348:	5b                   	pop    %ebx
 349:	5e                   	pop    %esi
 34a:	5d                   	pop    %ebp
 34b:	c3                   	ret    

0000034c <strcmp>:

int
strcmp(const char *p, const char *q)
{
 34c:	55                   	push   %ebp
 34d:	89 e5                	mov    %esp,%ebp
 34f:	8b 4d 08             	mov    0x8(%ebp),%ecx
 352:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 355:	eb 06                	jmp    35d <strcmp+0x11>
    p++, q++;
 357:	83 c1 01             	add    $0x1,%ecx
 35a:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 35d:	0f b6 01             	movzbl (%ecx),%eax
 360:	84 c0                	test   %al,%al
 362:	74 04                	je     368 <strcmp+0x1c>
 364:	3a 02                	cmp    (%edx),%al
 366:	74 ef                	je     357 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 368:	0f b6 c0             	movzbl %al,%eax
 36b:	0f b6 12             	movzbl (%edx),%edx
 36e:	29 d0                	sub    %edx,%eax
}
 370:	5d                   	pop    %ebp
 371:	c3                   	ret    

00000372 <strlen>:

uint
strlen(const char *s)
{
 372:	55                   	push   %ebp
 373:	89 e5                	mov    %esp,%ebp
 375:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 378:	b8 00 00 00 00       	mov    $0x0,%eax
 37d:	eb 03                	jmp    382 <strlen+0x10>
 37f:	83 c0 01             	add    $0x1,%eax
 382:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 386:	75 f7                	jne    37f <strlen+0xd>
    ;
  return n;
}
 388:	5d                   	pop    %ebp
 389:	c3                   	ret    

0000038a <memset>:

void*
memset(void *dst, int c, uint n)
{
 38a:	55                   	push   %ebp
 38b:	89 e5                	mov    %esp,%ebp
 38d:	57                   	push   %edi
 38e:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 391:	89 d7                	mov    %edx,%edi
 393:	8b 4d 10             	mov    0x10(%ebp),%ecx
 396:	8b 45 0c             	mov    0xc(%ebp),%eax
 399:	fc                   	cld    
 39a:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 39c:	89 d0                	mov    %edx,%eax
 39e:	8b 7d fc             	mov    -0x4(%ebp),%edi
 3a1:	c9                   	leave  
 3a2:	c3                   	ret    

000003a3 <strchr>:

char*
strchr(const char *s, char c)
{
 3a3:	55                   	push   %ebp
 3a4:	89 e5                	mov    %esp,%ebp
 3a6:	8b 45 08             	mov    0x8(%ebp),%eax
 3a9:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 3ad:	eb 03                	jmp    3b2 <strchr+0xf>
 3af:	83 c0 01             	add    $0x1,%eax
 3b2:	0f b6 10             	movzbl (%eax),%edx
 3b5:	84 d2                	test   %dl,%dl
 3b7:	74 06                	je     3bf <strchr+0x1c>
    if(*s == c)
 3b9:	38 ca                	cmp    %cl,%dl
 3bb:	75 f2                	jne    3af <strchr+0xc>
 3bd:	eb 05                	jmp    3c4 <strchr+0x21>
      return (char*)s;
  return 0;
 3bf:	b8 00 00 00 00       	mov    $0x0,%eax
}
 3c4:	5d                   	pop    %ebp
 3c5:	c3                   	ret    

000003c6 <gets>:

char*
gets(char *buf, int max)
{
 3c6:	55                   	push   %ebp
 3c7:	89 e5                	mov    %esp,%ebp
 3c9:	57                   	push   %edi
 3ca:	56                   	push   %esi
 3cb:	53                   	push   %ebx
 3cc:	83 ec 1c             	sub    $0x1c,%esp
 3cf:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 3d2:	bb 00 00 00 00       	mov    $0x0,%ebx
 3d7:	89 de                	mov    %ebx,%esi
 3d9:	83 c3 01             	add    $0x1,%ebx
 3dc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 3df:	7d 2e                	jge    40f <gets+0x49>
    cc = read(0, &c, 1);
 3e1:	83 ec 04             	sub    $0x4,%esp
 3e4:	6a 01                	push   $0x1
 3e6:	8d 45 e7             	lea    -0x19(%ebp),%eax
 3e9:	50                   	push   %eax
 3ea:	6a 00                	push   $0x0
 3ec:	e8 ec 00 00 00       	call   4dd <read>
    if(cc < 1)
 3f1:	83 c4 10             	add    $0x10,%esp
 3f4:	85 c0                	test   %eax,%eax
 3f6:	7e 17                	jle    40f <gets+0x49>
      break;
    buf[i++] = c;
 3f8:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 3fc:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 3ff:	3c 0a                	cmp    $0xa,%al
 401:	0f 94 c2             	sete   %dl
 404:	3c 0d                	cmp    $0xd,%al
 406:	0f 94 c0             	sete   %al
 409:	08 c2                	or     %al,%dl
 40b:	74 ca                	je     3d7 <gets+0x11>
    buf[i++] = c;
 40d:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 40f:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 413:	89 f8                	mov    %edi,%eax
 415:	8d 65 f4             	lea    -0xc(%ebp),%esp
 418:	5b                   	pop    %ebx
 419:	5e                   	pop    %esi
 41a:	5f                   	pop    %edi
 41b:	5d                   	pop    %ebp
 41c:	c3                   	ret    

0000041d <stat>:

int
stat(const char *n, struct stat *st)
{
 41d:	55                   	push   %ebp
 41e:	89 e5                	mov    %esp,%ebp
 420:	56                   	push   %esi
 421:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 422:	83 ec 08             	sub    $0x8,%esp
 425:	6a 00                	push   $0x0
 427:	ff 75 08             	push   0x8(%ebp)
 42a:	e8 d6 00 00 00       	call   505 <open>
  if(fd < 0)
 42f:	83 c4 10             	add    $0x10,%esp
 432:	85 c0                	test   %eax,%eax
 434:	78 24                	js     45a <stat+0x3d>
 436:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 438:	83 ec 08             	sub    $0x8,%esp
 43b:	ff 75 0c             	push   0xc(%ebp)
 43e:	50                   	push   %eax
 43f:	e8 d9 00 00 00       	call   51d <fstat>
 444:	89 c6                	mov    %eax,%esi
  close(fd);
 446:	89 1c 24             	mov    %ebx,(%esp)
 449:	e8 9f 00 00 00       	call   4ed <close>
  return r;
 44e:	83 c4 10             	add    $0x10,%esp
}
 451:	89 f0                	mov    %esi,%eax
 453:	8d 65 f8             	lea    -0x8(%ebp),%esp
 456:	5b                   	pop    %ebx
 457:	5e                   	pop    %esi
 458:	5d                   	pop    %ebp
 459:	c3                   	ret    
    return -1;
 45a:	be ff ff ff ff       	mov    $0xffffffff,%esi
 45f:	eb f0                	jmp    451 <stat+0x34>

00000461 <atoi>:

int
atoi(const char *s)
{
 461:	55                   	push   %ebp
 462:	89 e5                	mov    %esp,%ebp
 464:	53                   	push   %ebx
 465:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 468:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 46d:	eb 10                	jmp    47f <atoi+0x1e>
    n = n*10 + *s++ - '0';
 46f:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 472:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 475:	83 c1 01             	add    $0x1,%ecx
 478:	0f be c0             	movsbl %al,%eax
 47b:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 47f:	0f b6 01             	movzbl (%ecx),%eax
 482:	8d 58 d0             	lea    -0x30(%eax),%ebx
 485:	80 fb 09             	cmp    $0x9,%bl
 488:	76 e5                	jbe    46f <atoi+0xe>
  return n;
}
 48a:	89 d0                	mov    %edx,%eax
 48c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 48f:	c9                   	leave  
 490:	c3                   	ret    

00000491 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 491:	55                   	push   %ebp
 492:	89 e5                	mov    %esp,%ebp
 494:	56                   	push   %esi
 495:	53                   	push   %ebx
 496:	8b 75 08             	mov    0x8(%ebp),%esi
 499:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 49c:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 49f:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 4a1:	eb 0d                	jmp    4b0 <memmove+0x1f>
    *dst++ = *src++;
 4a3:	0f b6 01             	movzbl (%ecx),%eax
 4a6:	88 02                	mov    %al,(%edx)
 4a8:	8d 49 01             	lea    0x1(%ecx),%ecx
 4ab:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 4ae:	89 d8                	mov    %ebx,%eax
 4b0:	8d 58 ff             	lea    -0x1(%eax),%ebx
 4b3:	85 c0                	test   %eax,%eax
 4b5:	7f ec                	jg     4a3 <memmove+0x12>
  return vdst;
}
 4b7:	89 f0                	mov    %esi,%eax
 4b9:	5b                   	pop    %ebx
 4ba:	5e                   	pop    %esi
 4bb:	5d                   	pop    %ebp
 4bc:	c3                   	ret    

000004bd <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4bd:	b8 01 00 00 00       	mov    $0x1,%eax
 4c2:	cd 40                	int    $0x40
 4c4:	c3                   	ret    

000004c5 <exit>:
SYSCALL(exit)
 4c5:	b8 02 00 00 00       	mov    $0x2,%eax
 4ca:	cd 40                	int    $0x40
 4cc:	c3                   	ret    

000004cd <wait>:
SYSCALL(wait)
 4cd:	b8 03 00 00 00       	mov    $0x3,%eax
 4d2:	cd 40                	int    $0x40
 4d4:	c3                   	ret    

000004d5 <pipe>:
SYSCALL(pipe)
 4d5:	b8 04 00 00 00       	mov    $0x4,%eax
 4da:	cd 40                	int    $0x40
 4dc:	c3                   	ret    

000004dd <read>:
SYSCALL(read)
 4dd:	b8 05 00 00 00       	mov    $0x5,%eax
 4e2:	cd 40                	int    $0x40
 4e4:	c3                   	ret    

000004e5 <write>:
SYSCALL(write)
 4e5:	b8 10 00 00 00       	mov    $0x10,%eax
 4ea:	cd 40                	int    $0x40
 4ec:	c3                   	ret    

000004ed <close>:
SYSCALL(close)
 4ed:	b8 15 00 00 00       	mov    $0x15,%eax
 4f2:	cd 40                	int    $0x40
 4f4:	c3                   	ret    

000004f5 <kill>:
SYSCALL(kill)
 4f5:	b8 06 00 00 00       	mov    $0x6,%eax
 4fa:	cd 40                	int    $0x40
 4fc:	c3                   	ret    

000004fd <exec>:
SYSCALL(exec)
 4fd:	b8 07 00 00 00       	mov    $0x7,%eax
 502:	cd 40                	int    $0x40
 504:	c3                   	ret    

00000505 <open>:
SYSCALL(open)
 505:	b8 0f 00 00 00       	mov    $0xf,%eax
 50a:	cd 40                	int    $0x40
 50c:	c3                   	ret    

0000050d <mknod>:
SYSCALL(mknod)
 50d:	b8 11 00 00 00       	mov    $0x11,%eax
 512:	cd 40                	int    $0x40
 514:	c3                   	ret    

00000515 <unlink>:
SYSCALL(unlink)
 515:	b8 12 00 00 00       	mov    $0x12,%eax
 51a:	cd 40                	int    $0x40
 51c:	c3                   	ret    

0000051d <fstat>:
SYSCALL(fstat)
 51d:	b8 08 00 00 00       	mov    $0x8,%eax
 522:	cd 40                	int    $0x40
 524:	c3                   	ret    

00000525 <link>:
SYSCALL(link)
 525:	b8 13 00 00 00       	mov    $0x13,%eax
 52a:	cd 40                	int    $0x40
 52c:	c3                   	ret    

0000052d <mkdir>:
SYSCALL(mkdir)
 52d:	b8 14 00 00 00       	mov    $0x14,%eax
 532:	cd 40                	int    $0x40
 534:	c3                   	ret    

00000535 <chdir>:
SYSCALL(chdir)
 535:	b8 09 00 00 00       	mov    $0x9,%eax
 53a:	cd 40                	int    $0x40
 53c:	c3                   	ret    

0000053d <dup>:
SYSCALL(dup)
 53d:	b8 0a 00 00 00       	mov    $0xa,%eax
 542:	cd 40                	int    $0x40
 544:	c3                   	ret    

00000545 <getpid>:
SYSCALL(getpid)
 545:	b8 0b 00 00 00       	mov    $0xb,%eax
 54a:	cd 40                	int    $0x40
 54c:	c3                   	ret    

0000054d <sbrk>:
SYSCALL(sbrk)
 54d:	b8 0c 00 00 00       	mov    $0xc,%eax
 552:	cd 40                	int    $0x40
 554:	c3                   	ret    

00000555 <sleep>:
SYSCALL(sleep)
 555:	b8 0d 00 00 00       	mov    $0xd,%eax
 55a:	cd 40                	int    $0x40
 55c:	c3                   	ret    

0000055d <uptime>:
SYSCALL(uptime)
 55d:	b8 0e 00 00 00       	mov    $0xe,%eax
 562:	cd 40                	int    $0x40
 564:	c3                   	ret    

00000565 <clone>:
SYSCALL(clone)
 565:	b8 16 00 00 00       	mov    $0x16,%eax
 56a:	cd 40                	int    $0x40
 56c:	c3                   	ret    

0000056d <join>:
 56d:	b8 17 00 00 00       	mov    $0x17,%eax
 572:	cd 40                	int    $0x40
 574:	c3                   	ret    

00000575 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 575:	55                   	push   %ebp
 576:	89 e5                	mov    %esp,%ebp
 578:	83 ec 1c             	sub    $0x1c,%esp
 57b:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 57e:	6a 01                	push   $0x1
 580:	8d 55 f4             	lea    -0xc(%ebp),%edx
 583:	52                   	push   %edx
 584:	50                   	push   %eax
 585:	e8 5b ff ff ff       	call   4e5 <write>
}
 58a:	83 c4 10             	add    $0x10,%esp
 58d:	c9                   	leave  
 58e:	c3                   	ret    

0000058f <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 58f:	55                   	push   %ebp
 590:	89 e5                	mov    %esp,%ebp
 592:	57                   	push   %edi
 593:	56                   	push   %esi
 594:	53                   	push   %ebx
 595:	83 ec 2c             	sub    $0x2c,%esp
 598:	89 45 d0             	mov    %eax,-0x30(%ebp)
 59b:	89 d0                	mov    %edx,%eax
 59d:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 59f:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 5a3:	0f 95 c1             	setne  %cl
 5a6:	c1 ea 1f             	shr    $0x1f,%edx
 5a9:	84 d1                	test   %dl,%cl
 5ab:	74 44                	je     5f1 <printint+0x62>
    neg = 1;
    x = -xx;
 5ad:	f7 d8                	neg    %eax
 5af:	89 c1                	mov    %eax,%ecx
    neg = 1;
 5b1:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 5b8:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 5bd:	89 c8                	mov    %ecx,%eax
 5bf:	ba 00 00 00 00       	mov    $0x0,%edx
 5c4:	f7 f6                	div    %esi
 5c6:	89 df                	mov    %ebx,%edi
 5c8:	83 c3 01             	add    $0x1,%ebx
 5cb:	0f b6 92 e4 09 00 00 	movzbl 0x9e4(%edx),%edx
 5d2:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 5d6:	89 ca                	mov    %ecx,%edx
 5d8:	89 c1                	mov    %eax,%ecx
 5da:	39 d6                	cmp    %edx,%esi
 5dc:	76 df                	jbe    5bd <printint+0x2e>
  if(neg)
 5de:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 5e2:	74 31                	je     615 <printint+0x86>
    buf[i++] = '-';
 5e4:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 5e9:	8d 5f 02             	lea    0x2(%edi),%ebx
 5ec:	8b 75 d0             	mov    -0x30(%ebp),%esi
 5ef:	eb 17                	jmp    608 <printint+0x79>
    x = xx;
 5f1:	89 c1                	mov    %eax,%ecx
  neg = 0;
 5f3:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 5fa:	eb bc                	jmp    5b8 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 5fc:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 601:	89 f0                	mov    %esi,%eax
 603:	e8 6d ff ff ff       	call   575 <putc>
  while(--i >= 0)
 608:	83 eb 01             	sub    $0x1,%ebx
 60b:	79 ef                	jns    5fc <printint+0x6d>
}
 60d:	83 c4 2c             	add    $0x2c,%esp
 610:	5b                   	pop    %ebx
 611:	5e                   	pop    %esi
 612:	5f                   	pop    %edi
 613:	5d                   	pop    %ebp
 614:	c3                   	ret    
 615:	8b 75 d0             	mov    -0x30(%ebp),%esi
 618:	eb ee                	jmp    608 <printint+0x79>

0000061a <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 61a:	55                   	push   %ebp
 61b:	89 e5                	mov    %esp,%ebp
 61d:	57                   	push   %edi
 61e:	56                   	push   %esi
 61f:	53                   	push   %ebx
 620:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 623:	8d 45 10             	lea    0x10(%ebp),%eax
 626:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 629:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 62e:	bb 00 00 00 00       	mov    $0x0,%ebx
 633:	eb 14                	jmp    649 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 635:	89 fa                	mov    %edi,%edx
 637:	8b 45 08             	mov    0x8(%ebp),%eax
 63a:	e8 36 ff ff ff       	call   575 <putc>
 63f:	eb 05                	jmp    646 <printf+0x2c>
      }
    } else if(state == '%'){
 641:	83 fe 25             	cmp    $0x25,%esi
 644:	74 25                	je     66b <printf+0x51>
  for(i = 0; fmt[i]; i++){
 646:	83 c3 01             	add    $0x1,%ebx
 649:	8b 45 0c             	mov    0xc(%ebp),%eax
 64c:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 650:	84 c0                	test   %al,%al
 652:	0f 84 20 01 00 00    	je     778 <printf+0x15e>
    c = fmt[i] & 0xff;
 658:	0f be f8             	movsbl %al,%edi
 65b:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 65e:	85 f6                	test   %esi,%esi
 660:	75 df                	jne    641 <printf+0x27>
      if(c == '%'){
 662:	83 f8 25             	cmp    $0x25,%eax
 665:	75 ce                	jne    635 <printf+0x1b>
        state = '%';
 667:	89 c6                	mov    %eax,%esi
 669:	eb db                	jmp    646 <printf+0x2c>
      if(c == 'd'){
 66b:	83 f8 25             	cmp    $0x25,%eax
 66e:	0f 84 cf 00 00 00    	je     743 <printf+0x129>
 674:	0f 8c dd 00 00 00    	jl     757 <printf+0x13d>
 67a:	83 f8 78             	cmp    $0x78,%eax
 67d:	0f 8f d4 00 00 00    	jg     757 <printf+0x13d>
 683:	83 f8 63             	cmp    $0x63,%eax
 686:	0f 8c cb 00 00 00    	jl     757 <printf+0x13d>
 68c:	83 e8 63             	sub    $0x63,%eax
 68f:	83 f8 15             	cmp    $0x15,%eax
 692:	0f 87 bf 00 00 00    	ja     757 <printf+0x13d>
 698:	ff 24 85 8c 09 00 00 	jmp    *0x98c(,%eax,4)
        printint(fd, *ap, 10, 1);
 69f:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6a2:	8b 17                	mov    (%edi),%edx
 6a4:	83 ec 0c             	sub    $0xc,%esp
 6a7:	6a 01                	push   $0x1
 6a9:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6ae:	8b 45 08             	mov    0x8(%ebp),%eax
 6b1:	e8 d9 fe ff ff       	call   58f <printint>
        ap++;
 6b6:	83 c7 04             	add    $0x4,%edi
 6b9:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 6bc:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 6bf:	be 00 00 00 00       	mov    $0x0,%esi
 6c4:	eb 80                	jmp    646 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 6c6:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6c9:	8b 17                	mov    (%edi),%edx
 6cb:	83 ec 0c             	sub    $0xc,%esp
 6ce:	6a 00                	push   $0x0
 6d0:	b9 10 00 00 00       	mov    $0x10,%ecx
 6d5:	8b 45 08             	mov    0x8(%ebp),%eax
 6d8:	e8 b2 fe ff ff       	call   58f <printint>
        ap++;
 6dd:	83 c7 04             	add    $0x4,%edi
 6e0:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 6e3:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6e6:	be 00 00 00 00       	mov    $0x0,%esi
 6eb:	e9 56 ff ff ff       	jmp    646 <printf+0x2c>
        s = (char*)*ap;
 6f0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6f3:	8b 30                	mov    (%eax),%esi
        ap++;
 6f5:	83 c0 04             	add    $0x4,%eax
 6f8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 6fb:	85 f6                	test   %esi,%esi
 6fd:	75 15                	jne    714 <printf+0xfa>
          s = "(null)";
 6ff:	be 84 09 00 00       	mov    $0x984,%esi
 704:	eb 0e                	jmp    714 <printf+0xfa>
          putc(fd, *s);
 706:	0f be d2             	movsbl %dl,%edx
 709:	8b 45 08             	mov    0x8(%ebp),%eax
 70c:	e8 64 fe ff ff       	call   575 <putc>
          s++;
 711:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 714:	0f b6 16             	movzbl (%esi),%edx
 717:	84 d2                	test   %dl,%dl
 719:	75 eb                	jne    706 <printf+0xec>
      state = 0;
 71b:	be 00 00 00 00       	mov    $0x0,%esi
 720:	e9 21 ff ff ff       	jmp    646 <printf+0x2c>
        putc(fd, *ap);
 725:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 728:	0f be 17             	movsbl (%edi),%edx
 72b:	8b 45 08             	mov    0x8(%ebp),%eax
 72e:	e8 42 fe ff ff       	call   575 <putc>
        ap++;
 733:	83 c7 04             	add    $0x4,%edi
 736:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 739:	be 00 00 00 00       	mov    $0x0,%esi
 73e:	e9 03 ff ff ff       	jmp    646 <printf+0x2c>
        putc(fd, c);
 743:	89 fa                	mov    %edi,%edx
 745:	8b 45 08             	mov    0x8(%ebp),%eax
 748:	e8 28 fe ff ff       	call   575 <putc>
      state = 0;
 74d:	be 00 00 00 00       	mov    $0x0,%esi
 752:	e9 ef fe ff ff       	jmp    646 <printf+0x2c>
        putc(fd, '%');
 757:	ba 25 00 00 00       	mov    $0x25,%edx
 75c:	8b 45 08             	mov    0x8(%ebp),%eax
 75f:	e8 11 fe ff ff       	call   575 <putc>
        putc(fd, c);
 764:	89 fa                	mov    %edi,%edx
 766:	8b 45 08             	mov    0x8(%ebp),%eax
 769:	e8 07 fe ff ff       	call   575 <putc>
      state = 0;
 76e:	be 00 00 00 00       	mov    $0x0,%esi
 773:	e9 ce fe ff ff       	jmp    646 <printf+0x2c>
    }
  }
}
 778:	8d 65 f4             	lea    -0xc(%ebp),%esp
 77b:	5b                   	pop    %ebx
 77c:	5e                   	pop    %esi
 77d:	5f                   	pop    %edi
 77e:	5d                   	pop    %ebp
 77f:	c3                   	ret    

00000780 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 780:	55                   	push   %ebp
 781:	89 e5                	mov    %esp,%ebp
 783:	57                   	push   %edi
 784:	56                   	push   %esi
 785:	53                   	push   %ebx
 786:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 789:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 78c:	a1 a0 0e 00 00       	mov    0xea0,%eax
 791:	eb 02                	jmp    795 <free+0x15>
 793:	89 d0                	mov    %edx,%eax
 795:	39 c8                	cmp    %ecx,%eax
 797:	73 04                	jae    79d <free+0x1d>
 799:	39 08                	cmp    %ecx,(%eax)
 79b:	77 12                	ja     7af <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 79d:	8b 10                	mov    (%eax),%edx
 79f:	39 c2                	cmp    %eax,%edx
 7a1:	77 f0                	ja     793 <free+0x13>
 7a3:	39 c8                	cmp    %ecx,%eax
 7a5:	72 08                	jb     7af <free+0x2f>
 7a7:	39 ca                	cmp    %ecx,%edx
 7a9:	77 04                	ja     7af <free+0x2f>
 7ab:	89 d0                	mov    %edx,%eax
 7ad:	eb e6                	jmp    795 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7af:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7b2:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7b5:	8b 10                	mov    (%eax),%edx
 7b7:	39 d7                	cmp    %edx,%edi
 7b9:	74 19                	je     7d4 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 7bb:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7be:	8b 50 04             	mov    0x4(%eax),%edx
 7c1:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7c4:	39 ce                	cmp    %ecx,%esi
 7c6:	74 1b                	je     7e3 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 7c8:	89 08                	mov    %ecx,(%eax)
  freep = p;
 7ca:	a3 a0 0e 00 00       	mov    %eax,0xea0
}
 7cf:	5b                   	pop    %ebx
 7d0:	5e                   	pop    %esi
 7d1:	5f                   	pop    %edi
 7d2:	5d                   	pop    %ebp
 7d3:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 7d4:	03 72 04             	add    0x4(%edx),%esi
 7d7:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7da:	8b 10                	mov    (%eax),%edx
 7dc:	8b 12                	mov    (%edx),%edx
 7de:	89 53 f8             	mov    %edx,-0x8(%ebx)
 7e1:	eb db                	jmp    7be <free+0x3e>
    p->s.size += bp->s.size;
 7e3:	03 53 fc             	add    -0x4(%ebx),%edx
 7e6:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7e9:	8b 53 f8             	mov    -0x8(%ebx),%edx
 7ec:	89 10                	mov    %edx,(%eax)
 7ee:	eb da                	jmp    7ca <free+0x4a>

000007f0 <morecore>:

static Header*
morecore(uint nu)
{
 7f0:	55                   	push   %ebp
 7f1:	89 e5                	mov    %esp,%ebp
 7f3:	53                   	push   %ebx
 7f4:	83 ec 04             	sub    $0x4,%esp
 7f7:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 7f9:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 7fe:	77 05                	ja     805 <morecore+0x15>
    nu = 4096;
 800:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 805:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 80c:	83 ec 0c             	sub    $0xc,%esp
 80f:	50                   	push   %eax
 810:	e8 38 fd ff ff       	call   54d <sbrk>
  if(p == (char*)-1)
 815:	83 c4 10             	add    $0x10,%esp
 818:	83 f8 ff             	cmp    $0xffffffff,%eax
 81b:	74 1c                	je     839 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 81d:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 820:	83 c0 08             	add    $0x8,%eax
 823:	83 ec 0c             	sub    $0xc,%esp
 826:	50                   	push   %eax
 827:	e8 54 ff ff ff       	call   780 <free>
  return freep;
 82c:	a1 a0 0e 00 00       	mov    0xea0,%eax
 831:	83 c4 10             	add    $0x10,%esp
}
 834:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 837:	c9                   	leave  
 838:	c3                   	ret    
    return 0;
 839:	b8 00 00 00 00       	mov    $0x0,%eax
 83e:	eb f4                	jmp    834 <morecore+0x44>

00000840 <malloc>:

void*
malloc(uint nbytes)
{
 840:	55                   	push   %ebp
 841:	89 e5                	mov    %esp,%ebp
 843:	53                   	push   %ebx
 844:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 847:	8b 45 08             	mov    0x8(%ebp),%eax
 84a:	8d 58 07             	lea    0x7(%eax),%ebx
 84d:	c1 eb 03             	shr    $0x3,%ebx
 850:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 853:	8b 0d a0 0e 00 00    	mov    0xea0,%ecx
 859:	85 c9                	test   %ecx,%ecx
 85b:	74 04                	je     861 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 85d:	8b 01                	mov    (%ecx),%eax
 85f:	eb 4a                	jmp    8ab <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 861:	c7 05 a0 0e 00 00 a4 	movl   $0xea4,0xea0
 868:	0e 00 00 
 86b:	c7 05 a4 0e 00 00 a4 	movl   $0xea4,0xea4
 872:	0e 00 00 
    base.s.size = 0;
 875:	c7 05 a8 0e 00 00 00 	movl   $0x0,0xea8
 87c:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 87f:	b9 a4 0e 00 00       	mov    $0xea4,%ecx
 884:	eb d7                	jmp    85d <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 886:	74 19                	je     8a1 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 888:	29 da                	sub    %ebx,%edx
 88a:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 88d:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 890:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 893:	89 0d a0 0e 00 00    	mov    %ecx,0xea0
      return (void*)(p + 1);
 899:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 89c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 89f:	c9                   	leave  
 8a0:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 8a1:	8b 10                	mov    (%eax),%edx
 8a3:	89 11                	mov    %edx,(%ecx)
 8a5:	eb ec                	jmp    893 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8a7:	89 c1                	mov    %eax,%ecx
 8a9:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 8ab:	8b 50 04             	mov    0x4(%eax),%edx
 8ae:	39 da                	cmp    %ebx,%edx
 8b0:	73 d4                	jae    886 <malloc+0x46>
    if(p == freep)
 8b2:	39 05 a0 0e 00 00    	cmp    %eax,0xea0
 8b8:	75 ed                	jne    8a7 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 8ba:	89 d8                	mov    %ebx,%eax
 8bc:	e8 2f ff ff ff       	call   7f0 <morecore>
 8c1:	85 c0                	test   %eax,%eax
 8c3:	75 e2                	jne    8a7 <malloc+0x67>
 8c5:	eb d5                	jmp    89c <malloc+0x5c>
