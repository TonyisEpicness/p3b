
_test_10:     file format elf32-i386


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
   int arg1_int = *(int*)arg1;
   int arg2_int = *(int*)arg2;
   6:	8b 45 0c             	mov    0xc(%ebp),%eax
   9:	8b 10                	mov    (%eax),%edx
   assert(arg1_int == 35);
   b:	8b 45 08             	mov    0x8(%ebp),%eax
   e:	83 38 23             	cmpl   $0x23,(%eax)
  11:	75 60                	jne    73 <worker+0x73>
   assert(arg2_int == 42);
  13:	83 fa 2a             	cmp    $0x2a,%edx
  16:	0f 85 a0 00 00 00    	jne    bc <worker+0xbc>
   assert(global == 1);
  1c:	a1 98 0d 00 00       	mov    0xd98,%eax
  21:	83 f8 01             	cmp    $0x1,%eax
  24:	0f 84 db 00 00 00    	je     105 <worker+0x105>
  2a:	6a 2f                	push   $0x2f
  2c:	68 0c 09 00 00       	push   $0x90c
  31:	68 16 09 00 00       	push   $0x916
  36:	6a 01                	push   $0x1
  38:	e8 22 06 00 00       	call   65f <printf>
  3d:	83 c4 0c             	add    $0xc,%esp
  40:	68 5d 09 00 00       	push   $0x95d
  45:	68 2d 09 00 00       	push   $0x92d
  4a:	6a 01                	push   $0x1
  4c:	e8 0e 06 00 00       	call   65f <printf>
  51:	83 c4 08             	add    $0x8,%esp
  54:	68 41 09 00 00       	push   $0x941
  59:	6a 01                	push   $0x1
  5b:	e8 ff 05 00 00       	call   65f <printf>
  60:	83 c4 04             	add    $0x4,%esp
  63:	ff 35 a0 0d 00 00    	push   0xda0
  69:	e8 cc 04 00 00       	call   53a <kill>
  6e:	e8 97 04 00 00       	call   50a <exit>
   assert(arg1_int == 35);
  73:	6a 2d                	push   $0x2d
  75:	68 0c 09 00 00       	push   $0x90c
  7a:	68 16 09 00 00       	push   $0x916
  7f:	6a 01                	push   $0x1
  81:	e8 d9 05 00 00       	call   65f <printf>
  86:	83 c4 0c             	add    $0xc,%esp
  89:	68 1e 09 00 00       	push   $0x91e
  8e:	68 2d 09 00 00       	push   $0x92d
  93:	6a 01                	push   $0x1
  95:	e8 c5 05 00 00       	call   65f <printf>
  9a:	83 c4 08             	add    $0x8,%esp
  9d:	68 41 09 00 00       	push   $0x941
  a2:	6a 01                	push   $0x1
  a4:	e8 b6 05 00 00       	call   65f <printf>
  a9:	83 c4 04             	add    $0x4,%esp
  ac:	ff 35 a0 0d 00 00    	push   0xda0
  b2:	e8 83 04 00 00       	call   53a <kill>
  b7:	e8 4e 04 00 00       	call   50a <exit>
   assert(arg2_int == 42);
  bc:	6a 2e                	push   $0x2e
  be:	68 0c 09 00 00       	push   $0x90c
  c3:	68 16 09 00 00       	push   $0x916
  c8:	6a 01                	push   $0x1
  ca:	e8 90 05 00 00       	call   65f <printf>
  cf:	83 c4 0c             	add    $0xc,%esp
  d2:	68 4e 09 00 00       	push   $0x94e
  d7:	68 2d 09 00 00       	push   $0x92d
  dc:	6a 01                	push   $0x1
  de:	e8 7c 05 00 00       	call   65f <printf>
  e3:	83 c4 08             	add    $0x8,%esp
  e6:	68 41 09 00 00       	push   $0x941
  eb:	6a 01                	push   $0x1
  ed:	e8 6d 05 00 00       	call   65f <printf>
  f2:	83 c4 04             	add    $0x4,%esp
  f5:	ff 35 a0 0d 00 00    	push   0xda0
  fb:	e8 3a 04 00 00       	call   53a <kill>
 100:	e8 05 04 00 00       	call   50a <exit>
   global++;
 105:	83 c0 01             	add    $0x1,%eax
 108:	a3 98 0d 00 00       	mov    %eax,0xd98
   exit();
 10d:	e8 f8 03 00 00       	call   50a <exit>

00000112 <main>:
{
 112:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 116:	83 e4 f0             	and    $0xfffffff0,%esp
 119:	ff 71 fc             	push   -0x4(%ecx)
 11c:	55                   	push   %ebp
 11d:	89 e5                	mov    %esp,%ebp
 11f:	53                   	push   %ebx
 120:	51                   	push   %ecx
 121:	83 ec 10             	sub    $0x10,%esp
   ppid = getpid();
 124:	e8 61 04 00 00       	call   58a <getpid>
 129:	a3 a0 0d 00 00       	mov    %eax,0xda0
   int arg1 = 35;
 12e:	c7 45 f4 23 00 00 00 	movl   $0x23,-0xc(%ebp)
   int arg2 = 42;
 135:	c7 45 f0 2a 00 00 00 	movl   $0x2a,-0x10(%ebp)
   int thread_pid = thread_create(worker, &arg1, &arg2);
 13c:	83 ec 04             	sub    $0x4,%esp
 13f:	8d 45 f0             	lea    -0x10(%ebp),%eax
 142:	50                   	push   %eax
 143:	8d 45 f4             	lea    -0xc(%ebp),%eax
 146:	50                   	push   %eax
 147:	68 00 00 00 00       	push   $0x0
 14c:	e8 23 01 00 00       	call   274 <thread_create>
   assert(thread_pid > 0);
 151:	83 c4 10             	add    $0x10,%esp
 154:	85 c0                	test   %eax,%eax
 156:	7e 65                	jle    1bd <main+0xab>
 158:	89 c3                	mov    %eax,%ebx
   int join_pid = thread_join();
 15a:	e8 7d 01 00 00       	call   2dc <thread_join>
   assert(join_pid == thread_pid);
 15f:	39 c3                	cmp    %eax,%ebx
 161:	0f 85 9f 00 00 00    	jne    206 <main+0xf4>
   assert(global == 2);
 167:	83 3d 98 0d 00 00 02 	cmpl   $0x2,0xd98
 16e:	0f 84 db 00 00 00    	je     24f <main+0x13d>
 174:	6a 23                	push   $0x23
 176:	68 0c 09 00 00       	push   $0x90c
 17b:	68 16 09 00 00       	push   $0x916
 180:	6a 01                	push   $0x1
 182:	e8 d8 04 00 00       	call   65f <printf>
 187:	83 c4 0c             	add    $0xc,%esp
 18a:	68 8f 09 00 00       	push   $0x98f
 18f:	68 2d 09 00 00       	push   $0x92d
 194:	6a 01                	push   $0x1
 196:	e8 c4 04 00 00       	call   65f <printf>
 19b:	83 c4 08             	add    $0x8,%esp
 19e:	68 41 09 00 00       	push   $0x941
 1a3:	6a 01                	push   $0x1
 1a5:	e8 b5 04 00 00       	call   65f <printf>
 1aa:	83 c4 04             	add    $0x4,%esp
 1ad:	ff 35 a0 0d 00 00    	push   0xda0
 1b3:	e8 82 03 00 00       	call   53a <kill>
 1b8:	e8 4d 03 00 00       	call   50a <exit>
   assert(thread_pid > 0);
 1bd:	6a 1f                	push   $0x1f
 1bf:	68 0c 09 00 00       	push   $0x90c
 1c4:	68 16 09 00 00       	push   $0x916
 1c9:	6a 01                	push   $0x1
 1cb:	e8 8f 04 00 00       	call   65f <printf>
 1d0:	83 c4 0c             	add    $0xc,%esp
 1d3:	68 69 09 00 00       	push   $0x969
 1d8:	68 2d 09 00 00       	push   $0x92d
 1dd:	6a 01                	push   $0x1
 1df:	e8 7b 04 00 00       	call   65f <printf>
 1e4:	83 c4 08             	add    $0x8,%esp
 1e7:	68 41 09 00 00       	push   $0x941
 1ec:	6a 01                	push   $0x1
 1ee:	e8 6c 04 00 00       	call   65f <printf>
 1f3:	83 c4 04             	add    $0x4,%esp
 1f6:	ff 35 a0 0d 00 00    	push   0xda0
 1fc:	e8 39 03 00 00       	call   53a <kill>
 201:	e8 04 03 00 00       	call   50a <exit>
   assert(join_pid == thread_pid);
 206:	6a 22                	push   $0x22
 208:	68 0c 09 00 00       	push   $0x90c
 20d:	68 16 09 00 00       	push   $0x916
 212:	6a 01                	push   $0x1
 214:	e8 46 04 00 00       	call   65f <printf>
 219:	83 c4 0c             	add    $0xc,%esp
 21c:	68 78 09 00 00       	push   $0x978
 221:	68 2d 09 00 00       	push   $0x92d
 226:	6a 01                	push   $0x1
 228:	e8 32 04 00 00       	call   65f <printf>
 22d:	83 c4 08             	add    $0x8,%esp
 230:	68 41 09 00 00       	push   $0x941
 235:	6a 01                	push   $0x1
 237:	e8 23 04 00 00       	call   65f <printf>
 23c:	83 c4 04             	add    $0x4,%esp
 23f:	ff 35 a0 0d 00 00    	push   0xda0
 245:	e8 f0 02 00 00       	call   53a <kill>
 24a:	e8 bb 02 00 00       	call   50a <exit>
   printf(1, "TEST PASSED\n");
 24f:	83 ec 08             	sub    $0x8,%esp
 252:	68 9b 09 00 00       	push   $0x99b
 257:	6a 01                	push   $0x1
 259:	e8 01 04 00 00       	call   65f <printf>
   exit();
 25e:	e8 a7 02 00 00       	call   50a <exit>

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
 277:	83 ec 14             	sub    $0x14,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE*2);
 27a:	68 00 20 00 00       	push   $0x2000
 27f:	e8 01 06 00 00       	call   885 <malloc>
  if(n_stack == 0){
 284:	83 c4 10             	add    $0x10,%esp
 287:	85 c0                	test   %eax,%eax
 289:	74 4a                	je     2d5 <thread_create+0x61>
    return -1;
  }
  
  for(int i=0; i<64; i++){
 28b:	ba 00 00 00 00       	mov    $0x0,%edx
 290:	eb 03                	jmp    295 <thread_create+0x21>
 292:	83 c2 01             	add    $0x1,%edx
 295:	83 fa 3f             	cmp    $0x3f,%edx
 298:	7f 27                	jg     2c1 <thread_create+0x4d>
    if(threads[i]->flag==0){
 29a:	8b 0c 95 c0 0d 00 00 	mov    0xdc0(,%edx,4),%ecx
 2a1:	83 79 08 00          	cmpl   $0x0,0x8(%ecx)
 2a5:	75 eb                	jne    292 <thread_create+0x1e>
      threads[i]->maddr = n_stack;
 2a7:	89 01                	mov    %eax,(%ecx)
      threads[i]->pg1addr = n_stack;
 2a9:	8b 0c 95 c0 0d 00 00 	mov    0xdc0(,%edx,4),%ecx
 2b0:	89 41 04             	mov    %eax,0x4(%ecx)
      threads[i]->flag = 1;
 2b3:	8b 14 95 c0 0d 00 00 	mov    0xdc0(,%edx,4),%edx
 2ba:	c7 42 08 01 00 00 00 	movl   $0x1,0x8(%edx)
      break;
    }
  }
  
  int new_pid = clone(start_routine, arg1, arg2, n_stack); // TODO: is this the right way to call it?
 2c1:	50                   	push   %eax
 2c2:	ff 75 10             	push   0x10(%ebp)
 2c5:	ff 75 0c             	push   0xc(%ebp)
 2c8:	ff 75 08             	push   0x8(%ebp)
 2cb:	e8 da 02 00 00       	call   5aa <clone>

  // I can't remember if there was something else to do here but I'm sure I'll find out



  return new_pid;
 2d0:	83 c4 10             	add    $0x10,%esp
}
 2d3:	c9                   	leave  
 2d4:	c3                   	ret    
    return -1;
 2d5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2da:	eb f7                	jmp    2d3 <thread_create+0x5f>

000002dc <thread_join>:

//TODO: fix
int thread_join() {
 2dc:	55                   	push   %ebp
 2dd:	89 e5                	mov    %esp,%ebp
 2df:	56                   	push   %esi
 2e0:	53                   	push   %ebx
 2e1:	83 ec 1c             	sub    $0x1c,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 2e4:	8d 45 f4             	lea    -0xc(%ebp),%eax
 2e7:	50                   	push   %eax
 2e8:	e8 c5 02 00 00       	call   5b2 <join>
 2ed:	89 c6                	mov    %eax,%esi
  for(int i=0; i<64; i++){
 2ef:	83 c4 10             	add    $0x10,%esp
 2f2:	bb 00 00 00 00       	mov    $0x0,%ebx
 2f7:	eb 03                	jmp    2fc <thread_join+0x20>
 2f9:	83 c3 01             	add    $0x1,%ebx
 2fc:	83 fb 3f             	cmp    $0x3f,%ebx
 2ff:	7f 23                	jg     324 <thread_join+0x48>
    if((threads[i]->flag==1) && (stk_addr == threads[i]->pg1addr)){
 301:	8b 04 9d c0 0d 00 00 	mov    0xdc0(,%ebx,4),%eax
 308:	83 78 08 01          	cmpl   $0x1,0x8(%eax)
 30c:	75 eb                	jne    2f9 <thread_join+0x1d>
 30e:	8b 55 f4             	mov    -0xc(%ebp),%edx
 311:	39 50 04             	cmp    %edx,0x4(%eax)
 314:	75 e3                	jne    2f9 <thread_join+0x1d>
      free(stk_addr);
 316:	83 ec 0c             	sub    $0xc,%esp
 319:	52                   	push   %edx
 31a:	e8 a6 04 00 00       	call   7c5 <free>
 31f:	83 c4 10             	add    $0x10,%esp
 322:	eb d5                	jmp    2f9 <thread_join+0x1d>
    }
  }
  return pid;
}
 324:	89 f0                	mov    %esi,%eax
 326:	8d 65 f8             	lea    -0x8(%ebp),%esp
 329:	5b                   	pop    %ebx
 32a:	5e                   	pop    %esi
 32b:	5d                   	pop    %ebp
 32c:	c3                   	ret    

0000032d <lock_acquire>:

void lock_acquire(lock_t *lock){
 32d:	55                   	push   %ebp
 32e:	89 e5                	mov    %esp,%ebp
 330:	53                   	push   %ebx
 331:	83 ec 04             	sub    $0x4,%esp
 334:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 337:	83 ec 08             	sub    $0x8,%esp
 33a:	6a 01                	push   $0x1
 33c:	53                   	push   %ebx
 33d:	e8 21 ff ff ff       	call   263 <test_and_set>
 342:	83 c4 10             	add    $0x10,%esp
 345:	83 f8 01             	cmp    $0x1,%eax
 348:	74 ed                	je     337 <lock_acquire+0xa>
    ;
}
 34a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 34d:	c9                   	leave  
 34e:	c3                   	ret    

0000034f <lock_release>:

void lock_release(lock_t *lock) {
 34f:	55                   	push   %ebp
 350:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 352:	8b 45 08             	mov    0x8(%ebp),%eax
 355:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 35b:	5d                   	pop    %ebp
 35c:	c3                   	ret    

0000035d <lock_init>:

void lock_init(lock_t *lock) {
 35d:	55                   	push   %ebp
 35e:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 360:	8b 45 08             	mov    0x8(%ebp),%eax
 363:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 369:	5d                   	pop    %ebp
 36a:	c3                   	ret    

0000036b <strcpy>:

char*
strcpy(char *s, const char *t)
{
 36b:	55                   	push   %ebp
 36c:	89 e5                	mov    %esp,%ebp
 36e:	56                   	push   %esi
 36f:	53                   	push   %ebx
 370:	8b 75 08             	mov    0x8(%ebp),%esi
 373:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 376:	89 f0                	mov    %esi,%eax
 378:	89 d1                	mov    %edx,%ecx
 37a:	83 c2 01             	add    $0x1,%edx
 37d:	89 c3                	mov    %eax,%ebx
 37f:	83 c0 01             	add    $0x1,%eax
 382:	0f b6 09             	movzbl (%ecx),%ecx
 385:	88 0b                	mov    %cl,(%ebx)
 387:	84 c9                	test   %cl,%cl
 389:	75 ed                	jne    378 <strcpy+0xd>
    ;
  return os;
}
 38b:	89 f0                	mov    %esi,%eax
 38d:	5b                   	pop    %ebx
 38e:	5e                   	pop    %esi
 38f:	5d                   	pop    %ebp
 390:	c3                   	ret    

00000391 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 391:	55                   	push   %ebp
 392:	89 e5                	mov    %esp,%ebp
 394:	8b 4d 08             	mov    0x8(%ebp),%ecx
 397:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 39a:	eb 06                	jmp    3a2 <strcmp+0x11>
    p++, q++;
 39c:	83 c1 01             	add    $0x1,%ecx
 39f:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 3a2:	0f b6 01             	movzbl (%ecx),%eax
 3a5:	84 c0                	test   %al,%al
 3a7:	74 04                	je     3ad <strcmp+0x1c>
 3a9:	3a 02                	cmp    (%edx),%al
 3ab:	74 ef                	je     39c <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 3ad:	0f b6 c0             	movzbl %al,%eax
 3b0:	0f b6 12             	movzbl (%edx),%edx
 3b3:	29 d0                	sub    %edx,%eax
}
 3b5:	5d                   	pop    %ebp
 3b6:	c3                   	ret    

000003b7 <strlen>:

uint
strlen(const char *s)
{
 3b7:	55                   	push   %ebp
 3b8:	89 e5                	mov    %esp,%ebp
 3ba:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 3bd:	b8 00 00 00 00       	mov    $0x0,%eax
 3c2:	eb 03                	jmp    3c7 <strlen+0x10>
 3c4:	83 c0 01             	add    $0x1,%eax
 3c7:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 3cb:	75 f7                	jne    3c4 <strlen+0xd>
    ;
  return n;
}
 3cd:	5d                   	pop    %ebp
 3ce:	c3                   	ret    

000003cf <memset>:

void*
memset(void *dst, int c, uint n)
{
 3cf:	55                   	push   %ebp
 3d0:	89 e5                	mov    %esp,%ebp
 3d2:	57                   	push   %edi
 3d3:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 3d6:	89 d7                	mov    %edx,%edi
 3d8:	8b 4d 10             	mov    0x10(%ebp),%ecx
 3db:	8b 45 0c             	mov    0xc(%ebp),%eax
 3de:	fc                   	cld    
 3df:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 3e1:	89 d0                	mov    %edx,%eax
 3e3:	8b 7d fc             	mov    -0x4(%ebp),%edi
 3e6:	c9                   	leave  
 3e7:	c3                   	ret    

000003e8 <strchr>:

char*
strchr(const char *s, char c)
{
 3e8:	55                   	push   %ebp
 3e9:	89 e5                	mov    %esp,%ebp
 3eb:	8b 45 08             	mov    0x8(%ebp),%eax
 3ee:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 3f2:	eb 03                	jmp    3f7 <strchr+0xf>
 3f4:	83 c0 01             	add    $0x1,%eax
 3f7:	0f b6 10             	movzbl (%eax),%edx
 3fa:	84 d2                	test   %dl,%dl
 3fc:	74 06                	je     404 <strchr+0x1c>
    if(*s == c)
 3fe:	38 ca                	cmp    %cl,%dl
 400:	75 f2                	jne    3f4 <strchr+0xc>
 402:	eb 05                	jmp    409 <strchr+0x21>
      return (char*)s;
  return 0;
 404:	b8 00 00 00 00       	mov    $0x0,%eax
}
 409:	5d                   	pop    %ebp
 40a:	c3                   	ret    

0000040b <gets>:

char*
gets(char *buf, int max)
{
 40b:	55                   	push   %ebp
 40c:	89 e5                	mov    %esp,%ebp
 40e:	57                   	push   %edi
 40f:	56                   	push   %esi
 410:	53                   	push   %ebx
 411:	83 ec 1c             	sub    $0x1c,%esp
 414:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 417:	bb 00 00 00 00       	mov    $0x0,%ebx
 41c:	89 de                	mov    %ebx,%esi
 41e:	83 c3 01             	add    $0x1,%ebx
 421:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 424:	7d 2e                	jge    454 <gets+0x49>
    cc = read(0, &c, 1);
 426:	83 ec 04             	sub    $0x4,%esp
 429:	6a 01                	push   $0x1
 42b:	8d 45 e7             	lea    -0x19(%ebp),%eax
 42e:	50                   	push   %eax
 42f:	6a 00                	push   $0x0
 431:	e8 ec 00 00 00       	call   522 <read>
    if(cc < 1)
 436:	83 c4 10             	add    $0x10,%esp
 439:	85 c0                	test   %eax,%eax
 43b:	7e 17                	jle    454 <gets+0x49>
      break;
    buf[i++] = c;
 43d:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 441:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 444:	3c 0a                	cmp    $0xa,%al
 446:	0f 94 c2             	sete   %dl
 449:	3c 0d                	cmp    $0xd,%al
 44b:	0f 94 c0             	sete   %al
 44e:	08 c2                	or     %al,%dl
 450:	74 ca                	je     41c <gets+0x11>
    buf[i++] = c;
 452:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 454:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 458:	89 f8                	mov    %edi,%eax
 45a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 45d:	5b                   	pop    %ebx
 45e:	5e                   	pop    %esi
 45f:	5f                   	pop    %edi
 460:	5d                   	pop    %ebp
 461:	c3                   	ret    

00000462 <stat>:

int
stat(const char *n, struct stat *st)
{
 462:	55                   	push   %ebp
 463:	89 e5                	mov    %esp,%ebp
 465:	56                   	push   %esi
 466:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 467:	83 ec 08             	sub    $0x8,%esp
 46a:	6a 00                	push   $0x0
 46c:	ff 75 08             	push   0x8(%ebp)
 46f:	e8 d6 00 00 00       	call   54a <open>
  if(fd < 0)
 474:	83 c4 10             	add    $0x10,%esp
 477:	85 c0                	test   %eax,%eax
 479:	78 24                	js     49f <stat+0x3d>
 47b:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 47d:	83 ec 08             	sub    $0x8,%esp
 480:	ff 75 0c             	push   0xc(%ebp)
 483:	50                   	push   %eax
 484:	e8 d9 00 00 00       	call   562 <fstat>
 489:	89 c6                	mov    %eax,%esi
  close(fd);
 48b:	89 1c 24             	mov    %ebx,(%esp)
 48e:	e8 9f 00 00 00       	call   532 <close>
  return r;
 493:	83 c4 10             	add    $0x10,%esp
}
 496:	89 f0                	mov    %esi,%eax
 498:	8d 65 f8             	lea    -0x8(%ebp),%esp
 49b:	5b                   	pop    %ebx
 49c:	5e                   	pop    %esi
 49d:	5d                   	pop    %ebp
 49e:	c3                   	ret    
    return -1;
 49f:	be ff ff ff ff       	mov    $0xffffffff,%esi
 4a4:	eb f0                	jmp    496 <stat+0x34>

000004a6 <atoi>:

int
atoi(const char *s)
{
 4a6:	55                   	push   %ebp
 4a7:	89 e5                	mov    %esp,%ebp
 4a9:	53                   	push   %ebx
 4aa:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 4ad:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 4b2:	eb 10                	jmp    4c4 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 4b4:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 4b7:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 4ba:	83 c1 01             	add    $0x1,%ecx
 4bd:	0f be c0             	movsbl %al,%eax
 4c0:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 4c4:	0f b6 01             	movzbl (%ecx),%eax
 4c7:	8d 58 d0             	lea    -0x30(%eax),%ebx
 4ca:	80 fb 09             	cmp    $0x9,%bl
 4cd:	76 e5                	jbe    4b4 <atoi+0xe>
  return n;
}
 4cf:	89 d0                	mov    %edx,%eax
 4d1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4d4:	c9                   	leave  
 4d5:	c3                   	ret    

000004d6 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 4d6:	55                   	push   %ebp
 4d7:	89 e5                	mov    %esp,%ebp
 4d9:	56                   	push   %esi
 4da:	53                   	push   %ebx
 4db:	8b 75 08             	mov    0x8(%ebp),%esi
 4de:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 4e1:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 4e4:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 4e6:	eb 0d                	jmp    4f5 <memmove+0x1f>
    *dst++ = *src++;
 4e8:	0f b6 01             	movzbl (%ecx),%eax
 4eb:	88 02                	mov    %al,(%edx)
 4ed:	8d 49 01             	lea    0x1(%ecx),%ecx
 4f0:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 4f3:	89 d8                	mov    %ebx,%eax
 4f5:	8d 58 ff             	lea    -0x1(%eax),%ebx
 4f8:	85 c0                	test   %eax,%eax
 4fa:	7f ec                	jg     4e8 <memmove+0x12>
  return vdst;
}
 4fc:	89 f0                	mov    %esi,%eax
 4fe:	5b                   	pop    %ebx
 4ff:	5e                   	pop    %esi
 500:	5d                   	pop    %ebp
 501:	c3                   	ret    

00000502 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 502:	b8 01 00 00 00       	mov    $0x1,%eax
 507:	cd 40                	int    $0x40
 509:	c3                   	ret    

0000050a <exit>:
SYSCALL(exit)
 50a:	b8 02 00 00 00       	mov    $0x2,%eax
 50f:	cd 40                	int    $0x40
 511:	c3                   	ret    

00000512 <wait>:
SYSCALL(wait)
 512:	b8 03 00 00 00       	mov    $0x3,%eax
 517:	cd 40                	int    $0x40
 519:	c3                   	ret    

0000051a <pipe>:
SYSCALL(pipe)
 51a:	b8 04 00 00 00       	mov    $0x4,%eax
 51f:	cd 40                	int    $0x40
 521:	c3                   	ret    

00000522 <read>:
SYSCALL(read)
 522:	b8 05 00 00 00       	mov    $0x5,%eax
 527:	cd 40                	int    $0x40
 529:	c3                   	ret    

0000052a <write>:
SYSCALL(write)
 52a:	b8 10 00 00 00       	mov    $0x10,%eax
 52f:	cd 40                	int    $0x40
 531:	c3                   	ret    

00000532 <close>:
SYSCALL(close)
 532:	b8 15 00 00 00       	mov    $0x15,%eax
 537:	cd 40                	int    $0x40
 539:	c3                   	ret    

0000053a <kill>:
SYSCALL(kill)
 53a:	b8 06 00 00 00       	mov    $0x6,%eax
 53f:	cd 40                	int    $0x40
 541:	c3                   	ret    

00000542 <exec>:
SYSCALL(exec)
 542:	b8 07 00 00 00       	mov    $0x7,%eax
 547:	cd 40                	int    $0x40
 549:	c3                   	ret    

0000054a <open>:
SYSCALL(open)
 54a:	b8 0f 00 00 00       	mov    $0xf,%eax
 54f:	cd 40                	int    $0x40
 551:	c3                   	ret    

00000552 <mknod>:
SYSCALL(mknod)
 552:	b8 11 00 00 00       	mov    $0x11,%eax
 557:	cd 40                	int    $0x40
 559:	c3                   	ret    

0000055a <unlink>:
SYSCALL(unlink)
 55a:	b8 12 00 00 00       	mov    $0x12,%eax
 55f:	cd 40                	int    $0x40
 561:	c3                   	ret    

00000562 <fstat>:
SYSCALL(fstat)
 562:	b8 08 00 00 00       	mov    $0x8,%eax
 567:	cd 40                	int    $0x40
 569:	c3                   	ret    

0000056a <link>:
SYSCALL(link)
 56a:	b8 13 00 00 00       	mov    $0x13,%eax
 56f:	cd 40                	int    $0x40
 571:	c3                   	ret    

00000572 <mkdir>:
SYSCALL(mkdir)
 572:	b8 14 00 00 00       	mov    $0x14,%eax
 577:	cd 40                	int    $0x40
 579:	c3                   	ret    

0000057a <chdir>:
SYSCALL(chdir)
 57a:	b8 09 00 00 00       	mov    $0x9,%eax
 57f:	cd 40                	int    $0x40
 581:	c3                   	ret    

00000582 <dup>:
SYSCALL(dup)
 582:	b8 0a 00 00 00       	mov    $0xa,%eax
 587:	cd 40                	int    $0x40
 589:	c3                   	ret    

0000058a <getpid>:
SYSCALL(getpid)
 58a:	b8 0b 00 00 00       	mov    $0xb,%eax
 58f:	cd 40                	int    $0x40
 591:	c3                   	ret    

00000592 <sbrk>:
SYSCALL(sbrk)
 592:	b8 0c 00 00 00       	mov    $0xc,%eax
 597:	cd 40                	int    $0x40
 599:	c3                   	ret    

0000059a <sleep>:
SYSCALL(sleep)
 59a:	b8 0d 00 00 00       	mov    $0xd,%eax
 59f:	cd 40                	int    $0x40
 5a1:	c3                   	ret    

000005a2 <uptime>:
SYSCALL(uptime)
 5a2:	b8 0e 00 00 00       	mov    $0xe,%eax
 5a7:	cd 40                	int    $0x40
 5a9:	c3                   	ret    

000005aa <clone>:
SYSCALL(clone)
 5aa:	b8 16 00 00 00       	mov    $0x16,%eax
 5af:	cd 40                	int    $0x40
 5b1:	c3                   	ret    

000005b2 <join>:
 5b2:	b8 17 00 00 00       	mov    $0x17,%eax
 5b7:	cd 40                	int    $0x40
 5b9:	c3                   	ret    

000005ba <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 5ba:	55                   	push   %ebp
 5bb:	89 e5                	mov    %esp,%ebp
 5bd:	83 ec 1c             	sub    $0x1c,%esp
 5c0:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 5c3:	6a 01                	push   $0x1
 5c5:	8d 55 f4             	lea    -0xc(%ebp),%edx
 5c8:	52                   	push   %edx
 5c9:	50                   	push   %eax
 5ca:	e8 5b ff ff ff       	call   52a <write>
}
 5cf:	83 c4 10             	add    $0x10,%esp
 5d2:	c9                   	leave  
 5d3:	c3                   	ret    

000005d4 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 5d4:	55                   	push   %ebp
 5d5:	89 e5                	mov    %esp,%ebp
 5d7:	57                   	push   %edi
 5d8:	56                   	push   %esi
 5d9:	53                   	push   %ebx
 5da:	83 ec 2c             	sub    $0x2c,%esp
 5dd:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5e0:	89 d0                	mov    %edx,%eax
 5e2:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 5e4:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 5e8:	0f 95 c1             	setne  %cl
 5eb:	c1 ea 1f             	shr    $0x1f,%edx
 5ee:	84 d1                	test   %dl,%cl
 5f0:	74 44                	je     636 <printint+0x62>
    neg = 1;
    x = -xx;
 5f2:	f7 d8                	neg    %eax
 5f4:	89 c1                	mov    %eax,%ecx
    neg = 1;
 5f6:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 5fd:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 602:	89 c8                	mov    %ecx,%eax
 604:	ba 00 00 00 00       	mov    $0x0,%edx
 609:	f7 f6                	div    %esi
 60b:	89 df                	mov    %ebx,%edi
 60d:	83 c3 01             	add    $0x1,%ebx
 610:	0f b6 92 08 0a 00 00 	movzbl 0xa08(%edx),%edx
 617:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 61b:	89 ca                	mov    %ecx,%edx
 61d:	89 c1                	mov    %eax,%ecx
 61f:	39 d6                	cmp    %edx,%esi
 621:	76 df                	jbe    602 <printint+0x2e>
  if(neg)
 623:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 627:	74 31                	je     65a <printint+0x86>
    buf[i++] = '-';
 629:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 62e:	8d 5f 02             	lea    0x2(%edi),%ebx
 631:	8b 75 d0             	mov    -0x30(%ebp),%esi
 634:	eb 17                	jmp    64d <printint+0x79>
    x = xx;
 636:	89 c1                	mov    %eax,%ecx
  neg = 0;
 638:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 63f:	eb bc                	jmp    5fd <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 641:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 646:	89 f0                	mov    %esi,%eax
 648:	e8 6d ff ff ff       	call   5ba <putc>
  while(--i >= 0)
 64d:	83 eb 01             	sub    $0x1,%ebx
 650:	79 ef                	jns    641 <printint+0x6d>
}
 652:	83 c4 2c             	add    $0x2c,%esp
 655:	5b                   	pop    %ebx
 656:	5e                   	pop    %esi
 657:	5f                   	pop    %edi
 658:	5d                   	pop    %ebp
 659:	c3                   	ret    
 65a:	8b 75 d0             	mov    -0x30(%ebp),%esi
 65d:	eb ee                	jmp    64d <printint+0x79>

0000065f <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 65f:	55                   	push   %ebp
 660:	89 e5                	mov    %esp,%ebp
 662:	57                   	push   %edi
 663:	56                   	push   %esi
 664:	53                   	push   %ebx
 665:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 668:	8d 45 10             	lea    0x10(%ebp),%eax
 66b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 66e:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 673:	bb 00 00 00 00       	mov    $0x0,%ebx
 678:	eb 14                	jmp    68e <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 67a:	89 fa                	mov    %edi,%edx
 67c:	8b 45 08             	mov    0x8(%ebp),%eax
 67f:	e8 36 ff ff ff       	call   5ba <putc>
 684:	eb 05                	jmp    68b <printf+0x2c>
      }
    } else if(state == '%'){
 686:	83 fe 25             	cmp    $0x25,%esi
 689:	74 25                	je     6b0 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 68b:	83 c3 01             	add    $0x1,%ebx
 68e:	8b 45 0c             	mov    0xc(%ebp),%eax
 691:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 695:	84 c0                	test   %al,%al
 697:	0f 84 20 01 00 00    	je     7bd <printf+0x15e>
    c = fmt[i] & 0xff;
 69d:	0f be f8             	movsbl %al,%edi
 6a0:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 6a3:	85 f6                	test   %esi,%esi
 6a5:	75 df                	jne    686 <printf+0x27>
      if(c == '%'){
 6a7:	83 f8 25             	cmp    $0x25,%eax
 6aa:	75 ce                	jne    67a <printf+0x1b>
        state = '%';
 6ac:	89 c6                	mov    %eax,%esi
 6ae:	eb db                	jmp    68b <printf+0x2c>
      if(c == 'd'){
 6b0:	83 f8 25             	cmp    $0x25,%eax
 6b3:	0f 84 cf 00 00 00    	je     788 <printf+0x129>
 6b9:	0f 8c dd 00 00 00    	jl     79c <printf+0x13d>
 6bf:	83 f8 78             	cmp    $0x78,%eax
 6c2:	0f 8f d4 00 00 00    	jg     79c <printf+0x13d>
 6c8:	83 f8 63             	cmp    $0x63,%eax
 6cb:	0f 8c cb 00 00 00    	jl     79c <printf+0x13d>
 6d1:	83 e8 63             	sub    $0x63,%eax
 6d4:	83 f8 15             	cmp    $0x15,%eax
 6d7:	0f 87 bf 00 00 00    	ja     79c <printf+0x13d>
 6dd:	ff 24 85 b0 09 00 00 	jmp    *0x9b0(,%eax,4)
        printint(fd, *ap, 10, 1);
 6e4:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6e7:	8b 17                	mov    (%edi),%edx
 6e9:	83 ec 0c             	sub    $0xc,%esp
 6ec:	6a 01                	push   $0x1
 6ee:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6f3:	8b 45 08             	mov    0x8(%ebp),%eax
 6f6:	e8 d9 fe ff ff       	call   5d4 <printint>
        ap++;
 6fb:	83 c7 04             	add    $0x4,%edi
 6fe:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 701:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 704:	be 00 00 00 00       	mov    $0x0,%esi
 709:	eb 80                	jmp    68b <printf+0x2c>
        printint(fd, *ap, 16, 0);
 70b:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 70e:	8b 17                	mov    (%edi),%edx
 710:	83 ec 0c             	sub    $0xc,%esp
 713:	6a 00                	push   $0x0
 715:	b9 10 00 00 00       	mov    $0x10,%ecx
 71a:	8b 45 08             	mov    0x8(%ebp),%eax
 71d:	e8 b2 fe ff ff       	call   5d4 <printint>
        ap++;
 722:	83 c7 04             	add    $0x4,%edi
 725:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 728:	83 c4 10             	add    $0x10,%esp
      state = 0;
 72b:	be 00 00 00 00       	mov    $0x0,%esi
 730:	e9 56 ff ff ff       	jmp    68b <printf+0x2c>
        s = (char*)*ap;
 735:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 738:	8b 30                	mov    (%eax),%esi
        ap++;
 73a:	83 c0 04             	add    $0x4,%eax
 73d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 740:	85 f6                	test   %esi,%esi
 742:	75 15                	jne    759 <printf+0xfa>
          s = "(null)";
 744:	be a8 09 00 00       	mov    $0x9a8,%esi
 749:	eb 0e                	jmp    759 <printf+0xfa>
          putc(fd, *s);
 74b:	0f be d2             	movsbl %dl,%edx
 74e:	8b 45 08             	mov    0x8(%ebp),%eax
 751:	e8 64 fe ff ff       	call   5ba <putc>
          s++;
 756:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 759:	0f b6 16             	movzbl (%esi),%edx
 75c:	84 d2                	test   %dl,%dl
 75e:	75 eb                	jne    74b <printf+0xec>
      state = 0;
 760:	be 00 00 00 00       	mov    $0x0,%esi
 765:	e9 21 ff ff ff       	jmp    68b <printf+0x2c>
        putc(fd, *ap);
 76a:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 76d:	0f be 17             	movsbl (%edi),%edx
 770:	8b 45 08             	mov    0x8(%ebp),%eax
 773:	e8 42 fe ff ff       	call   5ba <putc>
        ap++;
 778:	83 c7 04             	add    $0x4,%edi
 77b:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 77e:	be 00 00 00 00       	mov    $0x0,%esi
 783:	e9 03 ff ff ff       	jmp    68b <printf+0x2c>
        putc(fd, c);
 788:	89 fa                	mov    %edi,%edx
 78a:	8b 45 08             	mov    0x8(%ebp),%eax
 78d:	e8 28 fe ff ff       	call   5ba <putc>
      state = 0;
 792:	be 00 00 00 00       	mov    $0x0,%esi
 797:	e9 ef fe ff ff       	jmp    68b <printf+0x2c>
        putc(fd, '%');
 79c:	ba 25 00 00 00       	mov    $0x25,%edx
 7a1:	8b 45 08             	mov    0x8(%ebp),%eax
 7a4:	e8 11 fe ff ff       	call   5ba <putc>
        putc(fd, c);
 7a9:	89 fa                	mov    %edi,%edx
 7ab:	8b 45 08             	mov    0x8(%ebp),%eax
 7ae:	e8 07 fe ff ff       	call   5ba <putc>
      state = 0;
 7b3:	be 00 00 00 00       	mov    $0x0,%esi
 7b8:	e9 ce fe ff ff       	jmp    68b <printf+0x2c>
    }
  }
}
 7bd:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7c0:	5b                   	pop    %ebx
 7c1:	5e                   	pop    %esi
 7c2:	5f                   	pop    %edi
 7c3:	5d                   	pop    %ebp
 7c4:	c3                   	ret    

000007c5 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7c5:	55                   	push   %ebp
 7c6:	89 e5                	mov    %esp,%ebp
 7c8:	57                   	push   %edi
 7c9:	56                   	push   %esi
 7ca:	53                   	push   %ebx
 7cb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7ce:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7d1:	a1 c0 0e 00 00       	mov    0xec0,%eax
 7d6:	eb 02                	jmp    7da <free+0x15>
 7d8:	89 d0                	mov    %edx,%eax
 7da:	39 c8                	cmp    %ecx,%eax
 7dc:	73 04                	jae    7e2 <free+0x1d>
 7de:	39 08                	cmp    %ecx,(%eax)
 7e0:	77 12                	ja     7f4 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7e2:	8b 10                	mov    (%eax),%edx
 7e4:	39 c2                	cmp    %eax,%edx
 7e6:	77 f0                	ja     7d8 <free+0x13>
 7e8:	39 c8                	cmp    %ecx,%eax
 7ea:	72 08                	jb     7f4 <free+0x2f>
 7ec:	39 ca                	cmp    %ecx,%edx
 7ee:	77 04                	ja     7f4 <free+0x2f>
 7f0:	89 d0                	mov    %edx,%eax
 7f2:	eb e6                	jmp    7da <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7f4:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7f7:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7fa:	8b 10                	mov    (%eax),%edx
 7fc:	39 d7                	cmp    %edx,%edi
 7fe:	74 19                	je     819 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 800:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 803:	8b 50 04             	mov    0x4(%eax),%edx
 806:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 809:	39 ce                	cmp    %ecx,%esi
 80b:	74 1b                	je     828 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 80d:	89 08                	mov    %ecx,(%eax)
  freep = p;
 80f:	a3 c0 0e 00 00       	mov    %eax,0xec0
}
 814:	5b                   	pop    %ebx
 815:	5e                   	pop    %esi
 816:	5f                   	pop    %edi
 817:	5d                   	pop    %ebp
 818:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 819:	03 72 04             	add    0x4(%edx),%esi
 81c:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 81f:	8b 10                	mov    (%eax),%edx
 821:	8b 12                	mov    (%edx),%edx
 823:	89 53 f8             	mov    %edx,-0x8(%ebx)
 826:	eb db                	jmp    803 <free+0x3e>
    p->s.size += bp->s.size;
 828:	03 53 fc             	add    -0x4(%ebx),%edx
 82b:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 82e:	8b 53 f8             	mov    -0x8(%ebx),%edx
 831:	89 10                	mov    %edx,(%eax)
 833:	eb da                	jmp    80f <free+0x4a>

00000835 <morecore>:

static Header*
morecore(uint nu)
{
 835:	55                   	push   %ebp
 836:	89 e5                	mov    %esp,%ebp
 838:	53                   	push   %ebx
 839:	83 ec 04             	sub    $0x4,%esp
 83c:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 83e:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 843:	77 05                	ja     84a <morecore+0x15>
    nu = 4096;
 845:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 84a:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 851:	83 ec 0c             	sub    $0xc,%esp
 854:	50                   	push   %eax
 855:	e8 38 fd ff ff       	call   592 <sbrk>
  if(p == (char*)-1)
 85a:	83 c4 10             	add    $0x10,%esp
 85d:	83 f8 ff             	cmp    $0xffffffff,%eax
 860:	74 1c                	je     87e <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 862:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 865:	83 c0 08             	add    $0x8,%eax
 868:	83 ec 0c             	sub    $0xc,%esp
 86b:	50                   	push   %eax
 86c:	e8 54 ff ff ff       	call   7c5 <free>
  return freep;
 871:	a1 c0 0e 00 00       	mov    0xec0,%eax
 876:	83 c4 10             	add    $0x10,%esp
}
 879:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 87c:	c9                   	leave  
 87d:	c3                   	ret    
    return 0;
 87e:	b8 00 00 00 00       	mov    $0x0,%eax
 883:	eb f4                	jmp    879 <morecore+0x44>

00000885 <malloc>:

void*
malloc(uint nbytes)
{
 885:	55                   	push   %ebp
 886:	89 e5                	mov    %esp,%ebp
 888:	53                   	push   %ebx
 889:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 88c:	8b 45 08             	mov    0x8(%ebp),%eax
 88f:	8d 58 07             	lea    0x7(%eax),%ebx
 892:	c1 eb 03             	shr    $0x3,%ebx
 895:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 898:	8b 0d c0 0e 00 00    	mov    0xec0,%ecx
 89e:	85 c9                	test   %ecx,%ecx
 8a0:	74 04                	je     8a6 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8a2:	8b 01                	mov    (%ecx),%eax
 8a4:	eb 4a                	jmp    8f0 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 8a6:	c7 05 c0 0e 00 00 c4 	movl   $0xec4,0xec0
 8ad:	0e 00 00 
 8b0:	c7 05 c4 0e 00 00 c4 	movl   $0xec4,0xec4
 8b7:	0e 00 00 
    base.s.size = 0;
 8ba:	c7 05 c8 0e 00 00 00 	movl   $0x0,0xec8
 8c1:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 8c4:	b9 c4 0e 00 00       	mov    $0xec4,%ecx
 8c9:	eb d7                	jmp    8a2 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 8cb:	74 19                	je     8e6 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 8cd:	29 da                	sub    %ebx,%edx
 8cf:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8d2:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 8d5:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 8d8:	89 0d c0 0e 00 00    	mov    %ecx,0xec0
      return (void*)(p + 1);
 8de:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 8e1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8e4:	c9                   	leave  
 8e5:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 8e6:	8b 10                	mov    (%eax),%edx
 8e8:	89 11                	mov    %edx,(%ecx)
 8ea:	eb ec                	jmp    8d8 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8ec:	89 c1                	mov    %eax,%ecx
 8ee:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 8f0:	8b 50 04             	mov    0x4(%eax),%edx
 8f3:	39 da                	cmp    %ebx,%edx
 8f5:	73 d4                	jae    8cb <malloc+0x46>
    if(p == freep)
 8f7:	39 05 c0 0e 00 00    	cmp    %eax,0xec0
 8fd:	75 ed                	jne    8ec <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 8ff:	89 d8                	mov    %ebx,%eax
 901:	e8 2f ff ff ff       	call   835 <morecore>
 906:	85 c0                	test   %eax,%eax
 908:	75 e2                	jne    8ec <malloc+0x67>
 90a:	eb d5                	jmp    8e1 <malloc+0x5c>
