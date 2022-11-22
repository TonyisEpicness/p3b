
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
   6:	a1 fc 0c 00 00       	mov    0xcfc,%eax
   b:	83 f8 01             	cmp    $0x1,%eax
   e:	74 49                	je     59 <worker+0x59>
  10:	6a 30                	push   $0x30
  12:	68 90 08 00 00       	push   $0x890
  17:	68 99 08 00 00       	push   $0x899
  1c:	6a 01                	push   $0x1
  1e:	e8 bf 05 00 00       	call   5e2 <printf>
  23:	83 c4 0c             	add    $0xc,%esp
  26:	68 a1 08 00 00       	push   $0x8a1
  2b:	68 ad 08 00 00       	push   $0x8ad
  30:	6a 01                	push   $0x1
  32:	e8 ab 05 00 00       	call   5e2 <printf>
  37:	83 c4 08             	add    $0x8,%esp
  3a:	68 c1 08 00 00       	push   $0x8c1
  3f:	6a 01                	push   $0x1
  41:	e8 9c 05 00 00       	call   5e2 <printf>
  46:	83 c4 04             	add    $0x4,%esp
  49:	ff 35 00 0d 00 00    	push   0xd00
  4f:	e8 69 04 00 00       	call   4bd <kill>
  54:	e8 34 04 00 00       	call   48d <exit>
   global = 5;
  59:	c7 05 fc 0c 00 00 05 	movl   $0x5,0xcfc
  60:	00 00 00 
   exit();
  63:	e8 25 04 00 00       	call   48d <exit>

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
  7b:	e8 8d 04 00 00       	call   50d <getpid>
  80:	a3 00 0d 00 00       	mov    %eax,0xd00
   void *stack, *p = malloc(PGSIZE*2);
  85:	83 ec 0c             	sub    $0xc,%esp
  88:	68 00 20 00 00       	push   $0x2000
  8d:	e8 76 07 00 00       	call   808 <malloc>
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
  bc:	e8 6c 04 00 00       	call   52d <clone>
  c1:	89 c6                	mov    %eax,%esi
   assert(clone_pid > 0);
  c3:	83 c4 10             	add    $0x10,%esp
  c6:	85 c0                	test   %eax,%eax
  c8:	0f 8e c1 00 00 00    	jle    18f <main+0x127>
   while(global != 5);
  ce:	a1 fc 0c 00 00       	mov    0xcfc,%eax
  d3:	83 f8 05             	cmp    $0x5,%eax
  d6:	75 f6                	jne    ce <main+0x66>
   printf(1, "TEST PASSED\n");
  d8:	83 ec 08             	sub    $0x8,%esp
  db:	68 e6 08 00 00       	push   $0x8e6
  e0:	6a 01                	push   $0x1
  e2:	e8 fb 04 00 00       	call   5e2 <printf>
   int join_pid = join(&join_stack);
  e7:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  ea:	89 04 24             	mov    %eax,(%esp)
  ed:	e8 43 04 00 00       	call   535 <join>
   assert(join_pid == clone_pid);
  f2:	83 c4 10             	add    $0x10,%esp
  f5:	39 c6                	cmp    %eax,%esi
  f7:	0f 84 db 00 00 00    	je     1d8 <main+0x170>
  fd:	6a 29                	push   $0x29
  ff:	68 90 08 00 00       	push   $0x890
 104:	68 99 08 00 00       	push   $0x899
 109:	6a 01                	push   $0x1
 10b:	e8 d2 04 00 00       	call   5e2 <printf>
 110:	83 c4 0c             	add    $0xc,%esp
 113:	68 f3 08 00 00       	push   $0x8f3
 118:	68 ad 08 00 00       	push   $0x8ad
 11d:	6a 01                	push   $0x1
 11f:	e8 be 04 00 00       	call   5e2 <printf>
 124:	83 c4 08             	add    $0x8,%esp
 127:	68 c1 08 00 00       	push   $0x8c1
 12c:	6a 01                	push   $0x1
 12e:	e8 af 04 00 00       	call   5e2 <printf>
 133:	83 c4 04             	add    $0x4,%esp
 136:	ff 35 00 0d 00 00    	push   0xd00
 13c:	e8 7c 03 00 00       	call   4bd <kill>
 141:	e8 47 03 00 00       	call   48d <exit>
   assert(p != NULL);
 146:	6a 1c                	push   $0x1c
 148:	68 90 08 00 00       	push   $0x890
 14d:	68 99 08 00 00       	push   $0x899
 152:	6a 01                	push   $0x1
 154:	e8 89 04 00 00       	call   5e2 <printf>
 159:	83 c4 0c             	add    $0xc,%esp
 15c:	68 ce 08 00 00       	push   $0x8ce
 161:	68 ad 08 00 00       	push   $0x8ad
 166:	6a 01                	push   $0x1
 168:	e8 75 04 00 00       	call   5e2 <printf>
 16d:	83 c4 08             	add    $0x8,%esp
 170:	68 c1 08 00 00       	push   $0x8c1
 175:	6a 01                	push   $0x1
 177:	e8 66 04 00 00       	call   5e2 <printf>
 17c:	83 c4 04             	add    $0x4,%esp
 17f:	ff 35 00 0d 00 00    	push   0xd00
 185:	e8 33 03 00 00       	call   4bd <kill>
 18a:	e8 fe 02 00 00       	call   48d <exit>
   assert(clone_pid > 0);
 18f:	6a 23                	push   $0x23
 191:	68 90 08 00 00       	push   $0x890
 196:	68 99 08 00 00       	push   $0x899
 19b:	6a 01                	push   $0x1
 19d:	e8 40 04 00 00       	call   5e2 <printf>
 1a2:	83 c4 0c             	add    $0xc,%esp
 1a5:	68 d8 08 00 00       	push   $0x8d8
 1aa:	68 ad 08 00 00       	push   $0x8ad
 1af:	6a 01                	push   $0x1
 1b1:	e8 2c 04 00 00       	call   5e2 <printf>
 1b6:	83 c4 08             	add    $0x8,%esp
 1b9:	68 c1 08 00 00       	push   $0x8c1
 1be:	6a 01                	push   $0x1
 1c0:	e8 1d 04 00 00       	call   5e2 <printf>
 1c5:	83 c4 04             	add    $0x4,%esp
 1c8:	ff 35 00 0d 00 00    	push   0xd00
 1ce:	e8 ea 02 00 00       	call   4bd <kill>
 1d3:	e8 b5 02 00 00       	call   48d <exit>
   free(p);
 1d8:	83 ec 0c             	sub    $0xc,%esp
 1db:	53                   	push   %ebx
 1dc:	e8 67 05 00 00       	call   748 <free>
   exit();
 1e1:	e8 a7 02 00 00       	call   48d <exit>

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
 1fa:	83 ec 14             	sub    $0x14,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE*2);
 1fd:	68 00 20 00 00       	push   $0x2000
 202:	e8 01 06 00 00       	call   808 <malloc>
  if(n_stack == 0){
 207:	83 c4 10             	add    $0x10,%esp
 20a:	85 c0                	test   %eax,%eax
 20c:	74 4a                	je     258 <thread_create+0x61>
    return -1;
  }
  
  for(int i=0; i<64; i++){
 20e:	ba 00 00 00 00       	mov    $0x0,%edx
 213:	eb 03                	jmp    218 <thread_create+0x21>
 215:	83 c2 01             	add    $0x1,%edx
 218:	83 fa 3f             	cmp    $0x3f,%edx
 21b:	7f 27                	jg     244 <thread_create+0x4d>
    if(threads[i]->flag==0){
 21d:	8b 0c 95 20 0d 00 00 	mov    0xd20(,%edx,4),%ecx
 224:	83 79 08 00          	cmpl   $0x0,0x8(%ecx)
 228:	75 eb                	jne    215 <thread_create+0x1e>
      threads[i]->maddr = n_stack;
 22a:	89 01                	mov    %eax,(%ecx)
      threads[i]->pg1addr = n_stack;
 22c:	8b 0c 95 20 0d 00 00 	mov    0xd20(,%edx,4),%ecx
 233:	89 41 04             	mov    %eax,0x4(%ecx)
      threads[i]->flag = 1;
 236:	8b 14 95 20 0d 00 00 	mov    0xd20(,%edx,4),%edx
 23d:	c7 42 08 01 00 00 00 	movl   $0x1,0x8(%edx)
      break;
    }
  }
  
  int new_pid = clone(start_routine, arg1, arg2, n_stack); // TODO: is this the right way to call it?
 244:	50                   	push   %eax
 245:	ff 75 10             	push   0x10(%ebp)
 248:	ff 75 0c             	push   0xc(%ebp)
 24b:	ff 75 08             	push   0x8(%ebp)
 24e:	e8 da 02 00 00       	call   52d <clone>

  // I can't remember if there was something else to do here but I'm sure I'll find out



  return new_pid;
 253:	83 c4 10             	add    $0x10,%esp
}
 256:	c9                   	leave  
 257:	c3                   	ret    
    return -1;
 258:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 25d:	eb f7                	jmp    256 <thread_create+0x5f>

0000025f <thread_join>:

//TODO: fix
int thread_join() {
 25f:	55                   	push   %ebp
 260:	89 e5                	mov    %esp,%ebp
 262:	56                   	push   %esi
 263:	53                   	push   %ebx
 264:	83 ec 1c             	sub    $0x1c,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 267:	8d 45 f4             	lea    -0xc(%ebp),%eax
 26a:	50                   	push   %eax
 26b:	e8 c5 02 00 00       	call   535 <join>
 270:	89 c6                	mov    %eax,%esi
  for(int i=0; i<64; i++){
 272:	83 c4 10             	add    $0x10,%esp
 275:	bb 00 00 00 00       	mov    $0x0,%ebx
 27a:	eb 03                	jmp    27f <thread_join+0x20>
 27c:	83 c3 01             	add    $0x1,%ebx
 27f:	83 fb 3f             	cmp    $0x3f,%ebx
 282:	7f 23                	jg     2a7 <thread_join+0x48>
    if((threads[i]->flag==1) && (stk_addr == threads[i]->pg1addr)){
 284:	8b 04 9d 20 0d 00 00 	mov    0xd20(,%ebx,4),%eax
 28b:	83 78 08 01          	cmpl   $0x1,0x8(%eax)
 28f:	75 eb                	jne    27c <thread_join+0x1d>
 291:	8b 55 f4             	mov    -0xc(%ebp),%edx
 294:	39 50 04             	cmp    %edx,0x4(%eax)
 297:	75 e3                	jne    27c <thread_join+0x1d>
      free(stk_addr);
 299:	83 ec 0c             	sub    $0xc,%esp
 29c:	52                   	push   %edx
 29d:	e8 a6 04 00 00       	call   748 <free>
 2a2:	83 c4 10             	add    $0x10,%esp
 2a5:	eb d5                	jmp    27c <thread_join+0x1d>
    }
  }
  return pid;
}
 2a7:	89 f0                	mov    %esi,%eax
 2a9:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2ac:	5b                   	pop    %ebx
 2ad:	5e                   	pop    %esi
 2ae:	5d                   	pop    %ebp
 2af:	c3                   	ret    

000002b0 <lock_acquire>:

void lock_acquire(lock_t *lock){
 2b0:	55                   	push   %ebp
 2b1:	89 e5                	mov    %esp,%ebp
 2b3:	53                   	push   %ebx
 2b4:	83 ec 04             	sub    $0x4,%esp
 2b7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 2ba:	83 ec 08             	sub    $0x8,%esp
 2bd:	6a 01                	push   $0x1
 2bf:	53                   	push   %ebx
 2c0:	e8 21 ff ff ff       	call   1e6 <test_and_set>
 2c5:	83 c4 10             	add    $0x10,%esp
 2c8:	83 f8 01             	cmp    $0x1,%eax
 2cb:	74 ed                	je     2ba <lock_acquire+0xa>
    ;
}
 2cd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2d0:	c9                   	leave  
 2d1:	c3                   	ret    

000002d2 <lock_release>:

void lock_release(lock_t *lock) {
 2d2:	55                   	push   %ebp
 2d3:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 2d5:	8b 45 08             	mov    0x8(%ebp),%eax
 2d8:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 2de:	5d                   	pop    %ebp
 2df:	c3                   	ret    

000002e0 <lock_init>:

void lock_init(lock_t *lock) {
 2e0:	55                   	push   %ebp
 2e1:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 2e3:	8b 45 08             	mov    0x8(%ebp),%eax
 2e6:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 2ec:	5d                   	pop    %ebp
 2ed:	c3                   	ret    

000002ee <strcpy>:

char*
strcpy(char *s, const char *t)
{
 2ee:	55                   	push   %ebp
 2ef:	89 e5                	mov    %esp,%ebp
 2f1:	56                   	push   %esi
 2f2:	53                   	push   %ebx
 2f3:	8b 75 08             	mov    0x8(%ebp),%esi
 2f6:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 2f9:	89 f0                	mov    %esi,%eax
 2fb:	89 d1                	mov    %edx,%ecx
 2fd:	83 c2 01             	add    $0x1,%edx
 300:	89 c3                	mov    %eax,%ebx
 302:	83 c0 01             	add    $0x1,%eax
 305:	0f b6 09             	movzbl (%ecx),%ecx
 308:	88 0b                	mov    %cl,(%ebx)
 30a:	84 c9                	test   %cl,%cl
 30c:	75 ed                	jne    2fb <strcpy+0xd>
    ;
  return os;
}
 30e:	89 f0                	mov    %esi,%eax
 310:	5b                   	pop    %ebx
 311:	5e                   	pop    %esi
 312:	5d                   	pop    %ebp
 313:	c3                   	ret    

00000314 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 314:	55                   	push   %ebp
 315:	89 e5                	mov    %esp,%ebp
 317:	8b 4d 08             	mov    0x8(%ebp),%ecx
 31a:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 31d:	eb 06                	jmp    325 <strcmp+0x11>
    p++, q++;
 31f:	83 c1 01             	add    $0x1,%ecx
 322:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 325:	0f b6 01             	movzbl (%ecx),%eax
 328:	84 c0                	test   %al,%al
 32a:	74 04                	je     330 <strcmp+0x1c>
 32c:	3a 02                	cmp    (%edx),%al
 32e:	74 ef                	je     31f <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 330:	0f b6 c0             	movzbl %al,%eax
 333:	0f b6 12             	movzbl (%edx),%edx
 336:	29 d0                	sub    %edx,%eax
}
 338:	5d                   	pop    %ebp
 339:	c3                   	ret    

0000033a <strlen>:

uint
strlen(const char *s)
{
 33a:	55                   	push   %ebp
 33b:	89 e5                	mov    %esp,%ebp
 33d:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 340:	b8 00 00 00 00       	mov    $0x0,%eax
 345:	eb 03                	jmp    34a <strlen+0x10>
 347:	83 c0 01             	add    $0x1,%eax
 34a:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 34e:	75 f7                	jne    347 <strlen+0xd>
    ;
  return n;
}
 350:	5d                   	pop    %ebp
 351:	c3                   	ret    

00000352 <memset>:

void*
memset(void *dst, int c, uint n)
{
 352:	55                   	push   %ebp
 353:	89 e5                	mov    %esp,%ebp
 355:	57                   	push   %edi
 356:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 359:	89 d7                	mov    %edx,%edi
 35b:	8b 4d 10             	mov    0x10(%ebp),%ecx
 35e:	8b 45 0c             	mov    0xc(%ebp),%eax
 361:	fc                   	cld    
 362:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 364:	89 d0                	mov    %edx,%eax
 366:	8b 7d fc             	mov    -0x4(%ebp),%edi
 369:	c9                   	leave  
 36a:	c3                   	ret    

0000036b <strchr>:

char*
strchr(const char *s, char c)
{
 36b:	55                   	push   %ebp
 36c:	89 e5                	mov    %esp,%ebp
 36e:	8b 45 08             	mov    0x8(%ebp),%eax
 371:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 375:	eb 03                	jmp    37a <strchr+0xf>
 377:	83 c0 01             	add    $0x1,%eax
 37a:	0f b6 10             	movzbl (%eax),%edx
 37d:	84 d2                	test   %dl,%dl
 37f:	74 06                	je     387 <strchr+0x1c>
    if(*s == c)
 381:	38 ca                	cmp    %cl,%dl
 383:	75 f2                	jne    377 <strchr+0xc>
 385:	eb 05                	jmp    38c <strchr+0x21>
      return (char*)s;
  return 0;
 387:	b8 00 00 00 00       	mov    $0x0,%eax
}
 38c:	5d                   	pop    %ebp
 38d:	c3                   	ret    

0000038e <gets>:

char*
gets(char *buf, int max)
{
 38e:	55                   	push   %ebp
 38f:	89 e5                	mov    %esp,%ebp
 391:	57                   	push   %edi
 392:	56                   	push   %esi
 393:	53                   	push   %ebx
 394:	83 ec 1c             	sub    $0x1c,%esp
 397:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 39a:	bb 00 00 00 00       	mov    $0x0,%ebx
 39f:	89 de                	mov    %ebx,%esi
 3a1:	83 c3 01             	add    $0x1,%ebx
 3a4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 3a7:	7d 2e                	jge    3d7 <gets+0x49>
    cc = read(0, &c, 1);
 3a9:	83 ec 04             	sub    $0x4,%esp
 3ac:	6a 01                	push   $0x1
 3ae:	8d 45 e7             	lea    -0x19(%ebp),%eax
 3b1:	50                   	push   %eax
 3b2:	6a 00                	push   $0x0
 3b4:	e8 ec 00 00 00       	call   4a5 <read>
    if(cc < 1)
 3b9:	83 c4 10             	add    $0x10,%esp
 3bc:	85 c0                	test   %eax,%eax
 3be:	7e 17                	jle    3d7 <gets+0x49>
      break;
    buf[i++] = c;
 3c0:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 3c4:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 3c7:	3c 0a                	cmp    $0xa,%al
 3c9:	0f 94 c2             	sete   %dl
 3cc:	3c 0d                	cmp    $0xd,%al
 3ce:	0f 94 c0             	sete   %al
 3d1:	08 c2                	or     %al,%dl
 3d3:	74 ca                	je     39f <gets+0x11>
    buf[i++] = c;
 3d5:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 3d7:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 3db:	89 f8                	mov    %edi,%eax
 3dd:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3e0:	5b                   	pop    %ebx
 3e1:	5e                   	pop    %esi
 3e2:	5f                   	pop    %edi
 3e3:	5d                   	pop    %ebp
 3e4:	c3                   	ret    

000003e5 <stat>:

int
stat(const char *n, struct stat *st)
{
 3e5:	55                   	push   %ebp
 3e6:	89 e5                	mov    %esp,%ebp
 3e8:	56                   	push   %esi
 3e9:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 3ea:	83 ec 08             	sub    $0x8,%esp
 3ed:	6a 00                	push   $0x0
 3ef:	ff 75 08             	push   0x8(%ebp)
 3f2:	e8 d6 00 00 00       	call   4cd <open>
  if(fd < 0)
 3f7:	83 c4 10             	add    $0x10,%esp
 3fa:	85 c0                	test   %eax,%eax
 3fc:	78 24                	js     422 <stat+0x3d>
 3fe:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 400:	83 ec 08             	sub    $0x8,%esp
 403:	ff 75 0c             	push   0xc(%ebp)
 406:	50                   	push   %eax
 407:	e8 d9 00 00 00       	call   4e5 <fstat>
 40c:	89 c6                	mov    %eax,%esi
  close(fd);
 40e:	89 1c 24             	mov    %ebx,(%esp)
 411:	e8 9f 00 00 00       	call   4b5 <close>
  return r;
 416:	83 c4 10             	add    $0x10,%esp
}
 419:	89 f0                	mov    %esi,%eax
 41b:	8d 65 f8             	lea    -0x8(%ebp),%esp
 41e:	5b                   	pop    %ebx
 41f:	5e                   	pop    %esi
 420:	5d                   	pop    %ebp
 421:	c3                   	ret    
    return -1;
 422:	be ff ff ff ff       	mov    $0xffffffff,%esi
 427:	eb f0                	jmp    419 <stat+0x34>

00000429 <atoi>:

int
atoi(const char *s)
{
 429:	55                   	push   %ebp
 42a:	89 e5                	mov    %esp,%ebp
 42c:	53                   	push   %ebx
 42d:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 430:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 435:	eb 10                	jmp    447 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 437:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 43a:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 43d:	83 c1 01             	add    $0x1,%ecx
 440:	0f be c0             	movsbl %al,%eax
 443:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 447:	0f b6 01             	movzbl (%ecx),%eax
 44a:	8d 58 d0             	lea    -0x30(%eax),%ebx
 44d:	80 fb 09             	cmp    $0x9,%bl
 450:	76 e5                	jbe    437 <atoi+0xe>
  return n;
}
 452:	89 d0                	mov    %edx,%eax
 454:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 457:	c9                   	leave  
 458:	c3                   	ret    

00000459 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 459:	55                   	push   %ebp
 45a:	89 e5                	mov    %esp,%ebp
 45c:	56                   	push   %esi
 45d:	53                   	push   %ebx
 45e:	8b 75 08             	mov    0x8(%ebp),%esi
 461:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 464:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 467:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 469:	eb 0d                	jmp    478 <memmove+0x1f>
    *dst++ = *src++;
 46b:	0f b6 01             	movzbl (%ecx),%eax
 46e:	88 02                	mov    %al,(%edx)
 470:	8d 49 01             	lea    0x1(%ecx),%ecx
 473:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 476:	89 d8                	mov    %ebx,%eax
 478:	8d 58 ff             	lea    -0x1(%eax),%ebx
 47b:	85 c0                	test   %eax,%eax
 47d:	7f ec                	jg     46b <memmove+0x12>
  return vdst;
}
 47f:	89 f0                	mov    %esi,%eax
 481:	5b                   	pop    %ebx
 482:	5e                   	pop    %esi
 483:	5d                   	pop    %ebp
 484:	c3                   	ret    

00000485 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 485:	b8 01 00 00 00       	mov    $0x1,%eax
 48a:	cd 40                	int    $0x40
 48c:	c3                   	ret    

0000048d <exit>:
SYSCALL(exit)
 48d:	b8 02 00 00 00       	mov    $0x2,%eax
 492:	cd 40                	int    $0x40
 494:	c3                   	ret    

00000495 <wait>:
SYSCALL(wait)
 495:	b8 03 00 00 00       	mov    $0x3,%eax
 49a:	cd 40                	int    $0x40
 49c:	c3                   	ret    

0000049d <pipe>:
SYSCALL(pipe)
 49d:	b8 04 00 00 00       	mov    $0x4,%eax
 4a2:	cd 40                	int    $0x40
 4a4:	c3                   	ret    

000004a5 <read>:
SYSCALL(read)
 4a5:	b8 05 00 00 00       	mov    $0x5,%eax
 4aa:	cd 40                	int    $0x40
 4ac:	c3                   	ret    

000004ad <write>:
SYSCALL(write)
 4ad:	b8 10 00 00 00       	mov    $0x10,%eax
 4b2:	cd 40                	int    $0x40
 4b4:	c3                   	ret    

000004b5 <close>:
SYSCALL(close)
 4b5:	b8 15 00 00 00       	mov    $0x15,%eax
 4ba:	cd 40                	int    $0x40
 4bc:	c3                   	ret    

000004bd <kill>:
SYSCALL(kill)
 4bd:	b8 06 00 00 00       	mov    $0x6,%eax
 4c2:	cd 40                	int    $0x40
 4c4:	c3                   	ret    

000004c5 <exec>:
SYSCALL(exec)
 4c5:	b8 07 00 00 00       	mov    $0x7,%eax
 4ca:	cd 40                	int    $0x40
 4cc:	c3                   	ret    

000004cd <open>:
SYSCALL(open)
 4cd:	b8 0f 00 00 00       	mov    $0xf,%eax
 4d2:	cd 40                	int    $0x40
 4d4:	c3                   	ret    

000004d5 <mknod>:
SYSCALL(mknod)
 4d5:	b8 11 00 00 00       	mov    $0x11,%eax
 4da:	cd 40                	int    $0x40
 4dc:	c3                   	ret    

000004dd <unlink>:
SYSCALL(unlink)
 4dd:	b8 12 00 00 00       	mov    $0x12,%eax
 4e2:	cd 40                	int    $0x40
 4e4:	c3                   	ret    

000004e5 <fstat>:
SYSCALL(fstat)
 4e5:	b8 08 00 00 00       	mov    $0x8,%eax
 4ea:	cd 40                	int    $0x40
 4ec:	c3                   	ret    

000004ed <link>:
SYSCALL(link)
 4ed:	b8 13 00 00 00       	mov    $0x13,%eax
 4f2:	cd 40                	int    $0x40
 4f4:	c3                   	ret    

000004f5 <mkdir>:
SYSCALL(mkdir)
 4f5:	b8 14 00 00 00       	mov    $0x14,%eax
 4fa:	cd 40                	int    $0x40
 4fc:	c3                   	ret    

000004fd <chdir>:
SYSCALL(chdir)
 4fd:	b8 09 00 00 00       	mov    $0x9,%eax
 502:	cd 40                	int    $0x40
 504:	c3                   	ret    

00000505 <dup>:
SYSCALL(dup)
 505:	b8 0a 00 00 00       	mov    $0xa,%eax
 50a:	cd 40                	int    $0x40
 50c:	c3                   	ret    

0000050d <getpid>:
SYSCALL(getpid)
 50d:	b8 0b 00 00 00       	mov    $0xb,%eax
 512:	cd 40                	int    $0x40
 514:	c3                   	ret    

00000515 <sbrk>:
SYSCALL(sbrk)
 515:	b8 0c 00 00 00       	mov    $0xc,%eax
 51a:	cd 40                	int    $0x40
 51c:	c3                   	ret    

0000051d <sleep>:
SYSCALL(sleep)
 51d:	b8 0d 00 00 00       	mov    $0xd,%eax
 522:	cd 40                	int    $0x40
 524:	c3                   	ret    

00000525 <uptime>:
SYSCALL(uptime)
 525:	b8 0e 00 00 00       	mov    $0xe,%eax
 52a:	cd 40                	int    $0x40
 52c:	c3                   	ret    

0000052d <clone>:
SYSCALL(clone)
 52d:	b8 16 00 00 00       	mov    $0x16,%eax
 532:	cd 40                	int    $0x40
 534:	c3                   	ret    

00000535 <join>:
 535:	b8 17 00 00 00       	mov    $0x17,%eax
 53a:	cd 40                	int    $0x40
 53c:	c3                   	ret    

0000053d <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 53d:	55                   	push   %ebp
 53e:	89 e5                	mov    %esp,%ebp
 540:	83 ec 1c             	sub    $0x1c,%esp
 543:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 546:	6a 01                	push   $0x1
 548:	8d 55 f4             	lea    -0xc(%ebp),%edx
 54b:	52                   	push   %edx
 54c:	50                   	push   %eax
 54d:	e8 5b ff ff ff       	call   4ad <write>
}
 552:	83 c4 10             	add    $0x10,%esp
 555:	c9                   	leave  
 556:	c3                   	ret    

00000557 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 557:	55                   	push   %ebp
 558:	89 e5                	mov    %esp,%ebp
 55a:	57                   	push   %edi
 55b:	56                   	push   %esi
 55c:	53                   	push   %ebx
 55d:	83 ec 2c             	sub    $0x2c,%esp
 560:	89 45 d0             	mov    %eax,-0x30(%ebp)
 563:	89 d0                	mov    %edx,%eax
 565:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 567:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 56b:	0f 95 c1             	setne  %cl
 56e:	c1 ea 1f             	shr    $0x1f,%edx
 571:	84 d1                	test   %dl,%cl
 573:	74 44                	je     5b9 <printint+0x62>
    neg = 1;
    x = -xx;
 575:	f7 d8                	neg    %eax
 577:	89 c1                	mov    %eax,%ecx
    neg = 1;
 579:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 580:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 585:	89 c8                	mov    %ecx,%eax
 587:	ba 00 00 00 00       	mov    $0x0,%edx
 58c:	f7 f6                	div    %esi
 58e:	89 df                	mov    %ebx,%edi
 590:	83 c3 01             	add    $0x1,%ebx
 593:	0f b6 92 68 09 00 00 	movzbl 0x968(%edx),%edx
 59a:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 59e:	89 ca                	mov    %ecx,%edx
 5a0:	89 c1                	mov    %eax,%ecx
 5a2:	39 d6                	cmp    %edx,%esi
 5a4:	76 df                	jbe    585 <printint+0x2e>
  if(neg)
 5a6:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 5aa:	74 31                	je     5dd <printint+0x86>
    buf[i++] = '-';
 5ac:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 5b1:	8d 5f 02             	lea    0x2(%edi),%ebx
 5b4:	8b 75 d0             	mov    -0x30(%ebp),%esi
 5b7:	eb 17                	jmp    5d0 <printint+0x79>
    x = xx;
 5b9:	89 c1                	mov    %eax,%ecx
  neg = 0;
 5bb:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 5c2:	eb bc                	jmp    580 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 5c4:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 5c9:	89 f0                	mov    %esi,%eax
 5cb:	e8 6d ff ff ff       	call   53d <putc>
  while(--i >= 0)
 5d0:	83 eb 01             	sub    $0x1,%ebx
 5d3:	79 ef                	jns    5c4 <printint+0x6d>
}
 5d5:	83 c4 2c             	add    $0x2c,%esp
 5d8:	5b                   	pop    %ebx
 5d9:	5e                   	pop    %esi
 5da:	5f                   	pop    %edi
 5db:	5d                   	pop    %ebp
 5dc:	c3                   	ret    
 5dd:	8b 75 d0             	mov    -0x30(%ebp),%esi
 5e0:	eb ee                	jmp    5d0 <printint+0x79>

000005e2 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5e2:	55                   	push   %ebp
 5e3:	89 e5                	mov    %esp,%ebp
 5e5:	57                   	push   %edi
 5e6:	56                   	push   %esi
 5e7:	53                   	push   %ebx
 5e8:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 5eb:	8d 45 10             	lea    0x10(%ebp),%eax
 5ee:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 5f1:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 5f6:	bb 00 00 00 00       	mov    $0x0,%ebx
 5fb:	eb 14                	jmp    611 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 5fd:	89 fa                	mov    %edi,%edx
 5ff:	8b 45 08             	mov    0x8(%ebp),%eax
 602:	e8 36 ff ff ff       	call   53d <putc>
 607:	eb 05                	jmp    60e <printf+0x2c>
      }
    } else if(state == '%'){
 609:	83 fe 25             	cmp    $0x25,%esi
 60c:	74 25                	je     633 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 60e:	83 c3 01             	add    $0x1,%ebx
 611:	8b 45 0c             	mov    0xc(%ebp),%eax
 614:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 618:	84 c0                	test   %al,%al
 61a:	0f 84 20 01 00 00    	je     740 <printf+0x15e>
    c = fmt[i] & 0xff;
 620:	0f be f8             	movsbl %al,%edi
 623:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 626:	85 f6                	test   %esi,%esi
 628:	75 df                	jne    609 <printf+0x27>
      if(c == '%'){
 62a:	83 f8 25             	cmp    $0x25,%eax
 62d:	75 ce                	jne    5fd <printf+0x1b>
        state = '%';
 62f:	89 c6                	mov    %eax,%esi
 631:	eb db                	jmp    60e <printf+0x2c>
      if(c == 'd'){
 633:	83 f8 25             	cmp    $0x25,%eax
 636:	0f 84 cf 00 00 00    	je     70b <printf+0x129>
 63c:	0f 8c dd 00 00 00    	jl     71f <printf+0x13d>
 642:	83 f8 78             	cmp    $0x78,%eax
 645:	0f 8f d4 00 00 00    	jg     71f <printf+0x13d>
 64b:	83 f8 63             	cmp    $0x63,%eax
 64e:	0f 8c cb 00 00 00    	jl     71f <printf+0x13d>
 654:	83 e8 63             	sub    $0x63,%eax
 657:	83 f8 15             	cmp    $0x15,%eax
 65a:	0f 87 bf 00 00 00    	ja     71f <printf+0x13d>
 660:	ff 24 85 10 09 00 00 	jmp    *0x910(,%eax,4)
        printint(fd, *ap, 10, 1);
 667:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 66a:	8b 17                	mov    (%edi),%edx
 66c:	83 ec 0c             	sub    $0xc,%esp
 66f:	6a 01                	push   $0x1
 671:	b9 0a 00 00 00       	mov    $0xa,%ecx
 676:	8b 45 08             	mov    0x8(%ebp),%eax
 679:	e8 d9 fe ff ff       	call   557 <printint>
        ap++;
 67e:	83 c7 04             	add    $0x4,%edi
 681:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 684:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 687:	be 00 00 00 00       	mov    $0x0,%esi
 68c:	eb 80                	jmp    60e <printf+0x2c>
        printint(fd, *ap, 16, 0);
 68e:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 691:	8b 17                	mov    (%edi),%edx
 693:	83 ec 0c             	sub    $0xc,%esp
 696:	6a 00                	push   $0x0
 698:	b9 10 00 00 00       	mov    $0x10,%ecx
 69d:	8b 45 08             	mov    0x8(%ebp),%eax
 6a0:	e8 b2 fe ff ff       	call   557 <printint>
        ap++;
 6a5:	83 c7 04             	add    $0x4,%edi
 6a8:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 6ab:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6ae:	be 00 00 00 00       	mov    $0x0,%esi
 6b3:	e9 56 ff ff ff       	jmp    60e <printf+0x2c>
        s = (char*)*ap;
 6b8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6bb:	8b 30                	mov    (%eax),%esi
        ap++;
 6bd:	83 c0 04             	add    $0x4,%eax
 6c0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 6c3:	85 f6                	test   %esi,%esi
 6c5:	75 15                	jne    6dc <printf+0xfa>
          s = "(null)";
 6c7:	be 09 09 00 00       	mov    $0x909,%esi
 6cc:	eb 0e                	jmp    6dc <printf+0xfa>
          putc(fd, *s);
 6ce:	0f be d2             	movsbl %dl,%edx
 6d1:	8b 45 08             	mov    0x8(%ebp),%eax
 6d4:	e8 64 fe ff ff       	call   53d <putc>
          s++;
 6d9:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 6dc:	0f b6 16             	movzbl (%esi),%edx
 6df:	84 d2                	test   %dl,%dl
 6e1:	75 eb                	jne    6ce <printf+0xec>
      state = 0;
 6e3:	be 00 00 00 00       	mov    $0x0,%esi
 6e8:	e9 21 ff ff ff       	jmp    60e <printf+0x2c>
        putc(fd, *ap);
 6ed:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6f0:	0f be 17             	movsbl (%edi),%edx
 6f3:	8b 45 08             	mov    0x8(%ebp),%eax
 6f6:	e8 42 fe ff ff       	call   53d <putc>
        ap++;
 6fb:	83 c7 04             	add    $0x4,%edi
 6fe:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 701:	be 00 00 00 00       	mov    $0x0,%esi
 706:	e9 03 ff ff ff       	jmp    60e <printf+0x2c>
        putc(fd, c);
 70b:	89 fa                	mov    %edi,%edx
 70d:	8b 45 08             	mov    0x8(%ebp),%eax
 710:	e8 28 fe ff ff       	call   53d <putc>
      state = 0;
 715:	be 00 00 00 00       	mov    $0x0,%esi
 71a:	e9 ef fe ff ff       	jmp    60e <printf+0x2c>
        putc(fd, '%');
 71f:	ba 25 00 00 00       	mov    $0x25,%edx
 724:	8b 45 08             	mov    0x8(%ebp),%eax
 727:	e8 11 fe ff ff       	call   53d <putc>
        putc(fd, c);
 72c:	89 fa                	mov    %edi,%edx
 72e:	8b 45 08             	mov    0x8(%ebp),%eax
 731:	e8 07 fe ff ff       	call   53d <putc>
      state = 0;
 736:	be 00 00 00 00       	mov    $0x0,%esi
 73b:	e9 ce fe ff ff       	jmp    60e <printf+0x2c>
    }
  }
}
 740:	8d 65 f4             	lea    -0xc(%ebp),%esp
 743:	5b                   	pop    %ebx
 744:	5e                   	pop    %esi
 745:	5f                   	pop    %edi
 746:	5d                   	pop    %ebp
 747:	c3                   	ret    

00000748 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 748:	55                   	push   %ebp
 749:	89 e5                	mov    %esp,%ebp
 74b:	57                   	push   %edi
 74c:	56                   	push   %esi
 74d:	53                   	push   %ebx
 74e:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 751:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 754:	a1 20 0e 00 00       	mov    0xe20,%eax
 759:	eb 02                	jmp    75d <free+0x15>
 75b:	89 d0                	mov    %edx,%eax
 75d:	39 c8                	cmp    %ecx,%eax
 75f:	73 04                	jae    765 <free+0x1d>
 761:	39 08                	cmp    %ecx,(%eax)
 763:	77 12                	ja     777 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 765:	8b 10                	mov    (%eax),%edx
 767:	39 c2                	cmp    %eax,%edx
 769:	77 f0                	ja     75b <free+0x13>
 76b:	39 c8                	cmp    %ecx,%eax
 76d:	72 08                	jb     777 <free+0x2f>
 76f:	39 ca                	cmp    %ecx,%edx
 771:	77 04                	ja     777 <free+0x2f>
 773:	89 d0                	mov    %edx,%eax
 775:	eb e6                	jmp    75d <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 777:	8b 73 fc             	mov    -0x4(%ebx),%esi
 77a:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 77d:	8b 10                	mov    (%eax),%edx
 77f:	39 d7                	cmp    %edx,%edi
 781:	74 19                	je     79c <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 783:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 786:	8b 50 04             	mov    0x4(%eax),%edx
 789:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 78c:	39 ce                	cmp    %ecx,%esi
 78e:	74 1b                	je     7ab <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 790:	89 08                	mov    %ecx,(%eax)
  freep = p;
 792:	a3 20 0e 00 00       	mov    %eax,0xe20
}
 797:	5b                   	pop    %ebx
 798:	5e                   	pop    %esi
 799:	5f                   	pop    %edi
 79a:	5d                   	pop    %ebp
 79b:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 79c:	03 72 04             	add    0x4(%edx),%esi
 79f:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7a2:	8b 10                	mov    (%eax),%edx
 7a4:	8b 12                	mov    (%edx),%edx
 7a6:	89 53 f8             	mov    %edx,-0x8(%ebx)
 7a9:	eb db                	jmp    786 <free+0x3e>
    p->s.size += bp->s.size;
 7ab:	03 53 fc             	add    -0x4(%ebx),%edx
 7ae:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7b1:	8b 53 f8             	mov    -0x8(%ebx),%edx
 7b4:	89 10                	mov    %edx,(%eax)
 7b6:	eb da                	jmp    792 <free+0x4a>

000007b8 <morecore>:

static Header*
morecore(uint nu)
{
 7b8:	55                   	push   %ebp
 7b9:	89 e5                	mov    %esp,%ebp
 7bb:	53                   	push   %ebx
 7bc:	83 ec 04             	sub    $0x4,%esp
 7bf:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 7c1:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 7c6:	77 05                	ja     7cd <morecore+0x15>
    nu = 4096;
 7c8:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 7cd:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 7d4:	83 ec 0c             	sub    $0xc,%esp
 7d7:	50                   	push   %eax
 7d8:	e8 38 fd ff ff       	call   515 <sbrk>
  if(p == (char*)-1)
 7dd:	83 c4 10             	add    $0x10,%esp
 7e0:	83 f8 ff             	cmp    $0xffffffff,%eax
 7e3:	74 1c                	je     801 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 7e5:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 7e8:	83 c0 08             	add    $0x8,%eax
 7eb:	83 ec 0c             	sub    $0xc,%esp
 7ee:	50                   	push   %eax
 7ef:	e8 54 ff ff ff       	call   748 <free>
  return freep;
 7f4:	a1 20 0e 00 00       	mov    0xe20,%eax
 7f9:	83 c4 10             	add    $0x10,%esp
}
 7fc:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 7ff:	c9                   	leave  
 800:	c3                   	ret    
    return 0;
 801:	b8 00 00 00 00       	mov    $0x0,%eax
 806:	eb f4                	jmp    7fc <morecore+0x44>

00000808 <malloc>:

void*
malloc(uint nbytes)
{
 808:	55                   	push   %ebp
 809:	89 e5                	mov    %esp,%ebp
 80b:	53                   	push   %ebx
 80c:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 80f:	8b 45 08             	mov    0x8(%ebp),%eax
 812:	8d 58 07             	lea    0x7(%eax),%ebx
 815:	c1 eb 03             	shr    $0x3,%ebx
 818:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 81b:	8b 0d 20 0e 00 00    	mov    0xe20,%ecx
 821:	85 c9                	test   %ecx,%ecx
 823:	74 04                	je     829 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 825:	8b 01                	mov    (%ecx),%eax
 827:	eb 4a                	jmp    873 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 829:	c7 05 20 0e 00 00 24 	movl   $0xe24,0xe20
 830:	0e 00 00 
 833:	c7 05 24 0e 00 00 24 	movl   $0xe24,0xe24
 83a:	0e 00 00 
    base.s.size = 0;
 83d:	c7 05 28 0e 00 00 00 	movl   $0x0,0xe28
 844:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 847:	b9 24 0e 00 00       	mov    $0xe24,%ecx
 84c:	eb d7                	jmp    825 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 84e:	74 19                	je     869 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 850:	29 da                	sub    %ebx,%edx
 852:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 855:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 858:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 85b:	89 0d 20 0e 00 00    	mov    %ecx,0xe20
      return (void*)(p + 1);
 861:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 864:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 867:	c9                   	leave  
 868:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 869:	8b 10                	mov    (%eax),%edx
 86b:	89 11                	mov    %edx,(%ecx)
 86d:	eb ec                	jmp    85b <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 86f:	89 c1                	mov    %eax,%ecx
 871:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 873:	8b 50 04             	mov    0x4(%eax),%edx
 876:	39 da                	cmp    %ebx,%edx
 878:	73 d4                	jae    84e <malloc+0x46>
    if(p == freep)
 87a:	39 05 20 0e 00 00    	cmp    %eax,0xe20
 880:	75 ed                	jne    86f <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 882:	89 d8                	mov    %ebx,%eax
 884:	e8 2f ff ff ff       	call   7b8 <morecore>
 889:	85 c0                	test   %eax,%eax
 88b:	75 e2                	jne    86f <malloc+0x67>
 88d:	eb d5                	jmp    864 <malloc+0x5c>
