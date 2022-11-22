
_test_14:     file format elf32-i386


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
   int tmp1 = *(int*)arg1;
   int tmp2 = *(int*)arg2;
   6:	8b 45 0c             	mov    0xc(%ebp),%eax
   9:	8b 10                	mov    (%eax),%edx
   assert(tmp1 == 42);
   b:	8b 45 08             	mov    0x8(%ebp),%eax
   e:	83 38 2a             	cmpl   $0x2a,(%eax)
  11:	75 1d                	jne    30 <worker+0x30>
   assert(tmp2 == 24);
  13:	83 fa 18             	cmp    $0x18,%edx
  16:	75 61                	jne    79 <worker+0x79>
   assert(global == 1);
  18:	a1 94 0d 00 00       	mov    0xd94,%eax
  1d:	83 f8 01             	cmp    $0x1,%eax
  20:	0f 85 9c 00 00 00    	jne    c2 <worker+0xc2>
   global++;
  26:	83 c0 01             	add    $0x1,%eax
  29:	a3 94 0d 00 00       	mov    %eax,0xd94
   // no exit() in thread
}
  2e:	c9                   	leave  
  2f:	c3                   	ret    
   assert(tmp1 == 42);
  30:	6a 2c                	push   $0x2c
  32:	68 08 09 00 00       	push   $0x908
  37:	68 12 09 00 00       	push   $0x912
  3c:	6a 01                	push   $0x1
  3e:	e8 15 06 00 00       	call   658 <printf>
  43:	83 c4 0c             	add    $0xc,%esp
  46:	68 1a 09 00 00       	push   $0x91a
  4b:	68 25 09 00 00       	push   $0x925
  50:	6a 01                	push   $0x1
  52:	e8 01 06 00 00       	call   658 <printf>
  57:	83 c4 08             	add    $0x8,%esp
  5a:	68 39 09 00 00       	push   $0x939
  5f:	6a 01                	push   $0x1
  61:	e8 f2 05 00 00       	call   658 <printf>
  66:	83 c4 04             	add    $0x4,%esp
  69:	ff 35 a0 0d 00 00    	push   0xda0
  6f:	e8 bf 04 00 00       	call   533 <kill>
  74:	e8 8a 04 00 00       	call   503 <exit>
   assert(tmp2 == 24);
  79:	6a 2d                	push   $0x2d
  7b:	68 08 09 00 00       	push   $0x908
  80:	68 12 09 00 00       	push   $0x912
  85:	6a 01                	push   $0x1
  87:	e8 cc 05 00 00       	call   658 <printf>
  8c:	83 c4 0c             	add    $0xc,%esp
  8f:	68 46 09 00 00       	push   $0x946
  94:	68 25 09 00 00       	push   $0x925
  99:	6a 01                	push   $0x1
  9b:	e8 b8 05 00 00       	call   658 <printf>
  a0:	83 c4 08             	add    $0x8,%esp
  a3:	68 39 09 00 00       	push   $0x939
  a8:	6a 01                	push   $0x1
  aa:	e8 a9 05 00 00       	call   658 <printf>
  af:	83 c4 04             	add    $0x4,%esp
  b2:	ff 35 a0 0d 00 00    	push   0xda0
  b8:	e8 76 04 00 00       	call   533 <kill>
  bd:	e8 41 04 00 00       	call   503 <exit>
   assert(global == 1);
  c2:	6a 2e                	push   $0x2e
  c4:	68 08 09 00 00       	push   $0x908
  c9:	68 12 09 00 00       	push   $0x912
  ce:	6a 01                	push   $0x1
  d0:	e8 83 05 00 00       	call   658 <printf>
  d5:	83 c4 0c             	add    $0xc,%esp
  d8:	68 51 09 00 00       	push   $0x951
  dd:	68 25 09 00 00       	push   $0x925
  e2:	6a 01                	push   $0x1
  e4:	e8 6f 05 00 00       	call   658 <printf>
  e9:	83 c4 08             	add    $0x8,%esp
  ec:	68 39 09 00 00       	push   $0x939
  f1:	6a 01                	push   $0x1
  f3:	e8 60 05 00 00       	call   658 <printf>
  f8:	83 c4 04             	add    $0x4,%esp
  fb:	ff 35 a0 0d 00 00    	push   0xda0
 101:	e8 2d 04 00 00       	call   533 <kill>
 106:	e8 f8 03 00 00       	call   503 <exit>

0000010b <main>:
{
 10b:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 10f:	83 e4 f0             	and    $0xfffffff0,%esp
 112:	ff 71 fc             	push   -0x4(%ecx)
 115:	55                   	push   %ebp
 116:	89 e5                	mov    %esp,%ebp
 118:	53                   	push   %ebx
 119:	51                   	push   %ecx
 11a:	83 ec 10             	sub    $0x10,%esp
   ppid = getpid();
 11d:	e8 61 04 00 00       	call   583 <getpid>
 122:	a3 a0 0d 00 00       	mov    %eax,0xda0
   int arg1 = 42, arg2 = 24;
 127:	c7 45 f4 2a 00 00 00 	movl   $0x2a,-0xc(%ebp)
 12e:	c7 45 f0 18 00 00 00 	movl   $0x18,-0x10(%ebp)
   int thread_pid = thread_create(worker, &arg1, &arg2);
 135:	83 ec 04             	sub    $0x4,%esp
 138:	8d 45 f0             	lea    -0x10(%ebp),%eax
 13b:	50                   	push   %eax
 13c:	8d 45 f4             	lea    -0xc(%ebp),%eax
 13f:	50                   	push   %eax
 140:	68 00 00 00 00       	push   $0x0
 145:	e8 23 01 00 00       	call   26d <thread_create>
   assert(thread_pid > 0);
 14a:	83 c4 10             	add    $0x10,%esp
 14d:	85 c0                	test   %eax,%eax
 14f:	7e 65                	jle    1b6 <main+0xab>
 151:	89 c3                	mov    %eax,%ebx
   int join_pid = thread_join();
 153:	e8 7d 01 00 00       	call   2d5 <thread_join>
   assert(join_pid == thread_pid);
 158:	39 c3                	cmp    %eax,%ebx
 15a:	0f 85 9f 00 00 00    	jne    1ff <main+0xf4>
   assert(global == 2);
 160:	83 3d 94 0d 00 00 02 	cmpl   $0x2,0xd94
 167:	0f 84 db 00 00 00    	je     248 <main+0x13d>
 16d:	6a 22                	push   $0x22
 16f:	68 08 09 00 00       	push   $0x908
 174:	68 12 09 00 00       	push   $0x912
 179:	6a 01                	push   $0x1
 17b:	e8 d8 04 00 00       	call   658 <printf>
 180:	83 c4 0c             	add    $0xc,%esp
 183:	68 83 09 00 00       	push   $0x983
 188:	68 25 09 00 00       	push   $0x925
 18d:	6a 01                	push   $0x1
 18f:	e8 c4 04 00 00       	call   658 <printf>
 194:	83 c4 08             	add    $0x8,%esp
 197:	68 39 09 00 00       	push   $0x939
 19c:	6a 01                	push   $0x1
 19e:	e8 b5 04 00 00       	call   658 <printf>
 1a3:	83 c4 04             	add    $0x4,%esp
 1a6:	ff 35 a0 0d 00 00    	push   0xda0
 1ac:	e8 82 03 00 00       	call   533 <kill>
 1b1:	e8 4d 03 00 00       	call   503 <exit>
   assert(thread_pid > 0);
 1b6:	6a 1e                	push   $0x1e
 1b8:	68 08 09 00 00       	push   $0x908
 1bd:	68 12 09 00 00       	push   $0x912
 1c2:	6a 01                	push   $0x1
 1c4:	e8 8f 04 00 00       	call   658 <printf>
 1c9:	83 c4 0c             	add    $0xc,%esp
 1cc:	68 5d 09 00 00       	push   $0x95d
 1d1:	68 25 09 00 00       	push   $0x925
 1d6:	6a 01                	push   $0x1
 1d8:	e8 7b 04 00 00       	call   658 <printf>
 1dd:	83 c4 08             	add    $0x8,%esp
 1e0:	68 39 09 00 00       	push   $0x939
 1e5:	6a 01                	push   $0x1
 1e7:	e8 6c 04 00 00       	call   658 <printf>
 1ec:	83 c4 04             	add    $0x4,%esp
 1ef:	ff 35 a0 0d 00 00    	push   0xda0
 1f5:	e8 39 03 00 00       	call   533 <kill>
 1fa:	e8 04 03 00 00       	call   503 <exit>
   assert(join_pid == thread_pid);
 1ff:	6a 21                	push   $0x21
 201:	68 08 09 00 00       	push   $0x908
 206:	68 12 09 00 00       	push   $0x912
 20b:	6a 01                	push   $0x1
 20d:	e8 46 04 00 00       	call   658 <printf>
 212:	83 c4 0c             	add    $0xc,%esp
 215:	68 6c 09 00 00       	push   $0x96c
 21a:	68 25 09 00 00       	push   $0x925
 21f:	6a 01                	push   $0x1
 221:	e8 32 04 00 00       	call   658 <printf>
 226:	83 c4 08             	add    $0x8,%esp
 229:	68 39 09 00 00       	push   $0x939
 22e:	6a 01                	push   $0x1
 230:	e8 23 04 00 00       	call   658 <printf>
 235:	83 c4 04             	add    $0x4,%esp
 238:	ff 35 a0 0d 00 00    	push   0xda0
 23e:	e8 f0 02 00 00       	call   533 <kill>
 243:	e8 bb 02 00 00       	call   503 <exit>
   printf(1, "TEST PASSED\n");
 248:	83 ec 08             	sub    $0x8,%esp
 24b:	68 8f 09 00 00       	push   $0x98f
 250:	6a 01                	push   $0x1
 252:	e8 01 04 00 00       	call   658 <printf>
   exit();
 257:	e8 a7 02 00 00       	call   503 <exit>

0000025c <test_and_set>:
  int flag;
};

struct thread_ref *threads[64];

int test_and_set(int *old_ptr, int new_ptr) {
 25c:	55                   	push   %ebp
 25d:	89 e5                	mov    %esp,%ebp
 25f:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *old_ptr;
 262:	8b 10                	mov    (%eax),%edx
  *old_ptr = new_ptr;
 264:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 267:	89 08                	mov    %ecx,(%eax)
  return old;
}
 269:	89 d0                	mov    %edx,%eax
 26b:	5d                   	pop    %ebp
 26c:	c3                   	ret    

0000026d <thread_create>:

// a wrapper func for clone
int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 26d:	55                   	push   %ebp
 26e:	89 e5                	mov    %esp,%ebp
 270:	83 ec 14             	sub    $0x14,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE*2);
 273:	68 00 20 00 00       	push   $0x2000
 278:	e8 01 06 00 00       	call   87e <malloc>
  if(n_stack == 0){
 27d:	83 c4 10             	add    $0x10,%esp
 280:	85 c0                	test   %eax,%eax
 282:	74 4a                	je     2ce <thread_create+0x61>
    return -1;
  }
  
  for(int i=0; i<64; i++){
 284:	ba 00 00 00 00       	mov    $0x0,%edx
 289:	eb 03                	jmp    28e <thread_create+0x21>
 28b:	83 c2 01             	add    $0x1,%edx
 28e:	83 fa 3f             	cmp    $0x3f,%edx
 291:	7f 27                	jg     2ba <thread_create+0x4d>
    if(threads[i]->flag==0){
 293:	8b 0c 95 c0 0d 00 00 	mov    0xdc0(,%edx,4),%ecx
 29a:	83 79 08 00          	cmpl   $0x0,0x8(%ecx)
 29e:	75 eb                	jne    28b <thread_create+0x1e>
      threads[i]->maddr = n_stack;
 2a0:	89 01                	mov    %eax,(%ecx)
      threads[i]->pg1addr = n_stack;
 2a2:	8b 0c 95 c0 0d 00 00 	mov    0xdc0(,%edx,4),%ecx
 2a9:	89 41 04             	mov    %eax,0x4(%ecx)
      threads[i]->flag = 1;
 2ac:	8b 14 95 c0 0d 00 00 	mov    0xdc0(,%edx,4),%edx
 2b3:	c7 42 08 01 00 00 00 	movl   $0x1,0x8(%edx)
      break;
    }
  }
  
  int new_pid = clone(start_routine, arg1, arg2, n_stack); // TODO: is this the right way to call it?
 2ba:	50                   	push   %eax
 2bb:	ff 75 10             	push   0x10(%ebp)
 2be:	ff 75 0c             	push   0xc(%ebp)
 2c1:	ff 75 08             	push   0x8(%ebp)
 2c4:	e8 da 02 00 00       	call   5a3 <clone>

  // I can't remember if there was something else to do here but I'm sure I'll find out



  return new_pid;
 2c9:	83 c4 10             	add    $0x10,%esp
}
 2cc:	c9                   	leave  
 2cd:	c3                   	ret    
    return -1;
 2ce:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2d3:	eb f7                	jmp    2cc <thread_create+0x5f>

000002d5 <thread_join>:

//TODO: fix
int thread_join() {
 2d5:	55                   	push   %ebp
 2d6:	89 e5                	mov    %esp,%ebp
 2d8:	56                   	push   %esi
 2d9:	53                   	push   %ebx
 2da:	83 ec 1c             	sub    $0x1c,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 2dd:	8d 45 f4             	lea    -0xc(%ebp),%eax
 2e0:	50                   	push   %eax
 2e1:	e8 c5 02 00 00       	call   5ab <join>
 2e6:	89 c6                	mov    %eax,%esi
  for(int i=0; i<64; i++){
 2e8:	83 c4 10             	add    $0x10,%esp
 2eb:	bb 00 00 00 00       	mov    $0x0,%ebx
 2f0:	eb 03                	jmp    2f5 <thread_join+0x20>
 2f2:	83 c3 01             	add    $0x1,%ebx
 2f5:	83 fb 3f             	cmp    $0x3f,%ebx
 2f8:	7f 23                	jg     31d <thread_join+0x48>
    if((threads[i]->flag==1) && (stk_addr == threads[i]->pg1addr)){
 2fa:	8b 04 9d c0 0d 00 00 	mov    0xdc0(,%ebx,4),%eax
 301:	83 78 08 01          	cmpl   $0x1,0x8(%eax)
 305:	75 eb                	jne    2f2 <thread_join+0x1d>
 307:	8b 55 f4             	mov    -0xc(%ebp),%edx
 30a:	39 50 04             	cmp    %edx,0x4(%eax)
 30d:	75 e3                	jne    2f2 <thread_join+0x1d>
      free(stk_addr);
 30f:	83 ec 0c             	sub    $0xc,%esp
 312:	52                   	push   %edx
 313:	e8 a6 04 00 00       	call   7be <free>
 318:	83 c4 10             	add    $0x10,%esp
 31b:	eb d5                	jmp    2f2 <thread_join+0x1d>
    }
  }
  return pid;
}
 31d:	89 f0                	mov    %esi,%eax
 31f:	8d 65 f8             	lea    -0x8(%ebp),%esp
 322:	5b                   	pop    %ebx
 323:	5e                   	pop    %esi
 324:	5d                   	pop    %ebp
 325:	c3                   	ret    

00000326 <lock_acquire>:

void lock_acquire(lock_t *lock){
 326:	55                   	push   %ebp
 327:	89 e5                	mov    %esp,%ebp
 329:	53                   	push   %ebx
 32a:	83 ec 04             	sub    $0x4,%esp
 32d:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 330:	83 ec 08             	sub    $0x8,%esp
 333:	6a 01                	push   $0x1
 335:	53                   	push   %ebx
 336:	e8 21 ff ff ff       	call   25c <test_and_set>
 33b:	83 c4 10             	add    $0x10,%esp
 33e:	83 f8 01             	cmp    $0x1,%eax
 341:	74 ed                	je     330 <lock_acquire+0xa>
    ;
}
 343:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 346:	c9                   	leave  
 347:	c3                   	ret    

00000348 <lock_release>:

void lock_release(lock_t *lock) {
 348:	55                   	push   %ebp
 349:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 34b:	8b 45 08             	mov    0x8(%ebp),%eax
 34e:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 354:	5d                   	pop    %ebp
 355:	c3                   	ret    

00000356 <lock_init>:

void lock_init(lock_t *lock) {
 356:	55                   	push   %ebp
 357:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 359:	8b 45 08             	mov    0x8(%ebp),%eax
 35c:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 362:	5d                   	pop    %ebp
 363:	c3                   	ret    

00000364 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 364:	55                   	push   %ebp
 365:	89 e5                	mov    %esp,%ebp
 367:	56                   	push   %esi
 368:	53                   	push   %ebx
 369:	8b 75 08             	mov    0x8(%ebp),%esi
 36c:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 36f:	89 f0                	mov    %esi,%eax
 371:	89 d1                	mov    %edx,%ecx
 373:	83 c2 01             	add    $0x1,%edx
 376:	89 c3                	mov    %eax,%ebx
 378:	83 c0 01             	add    $0x1,%eax
 37b:	0f b6 09             	movzbl (%ecx),%ecx
 37e:	88 0b                	mov    %cl,(%ebx)
 380:	84 c9                	test   %cl,%cl
 382:	75 ed                	jne    371 <strcpy+0xd>
    ;
  return os;
}
 384:	89 f0                	mov    %esi,%eax
 386:	5b                   	pop    %ebx
 387:	5e                   	pop    %esi
 388:	5d                   	pop    %ebp
 389:	c3                   	ret    

0000038a <strcmp>:

int
strcmp(const char *p, const char *q)
{
 38a:	55                   	push   %ebp
 38b:	89 e5                	mov    %esp,%ebp
 38d:	8b 4d 08             	mov    0x8(%ebp),%ecx
 390:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 393:	eb 06                	jmp    39b <strcmp+0x11>
    p++, q++;
 395:	83 c1 01             	add    $0x1,%ecx
 398:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 39b:	0f b6 01             	movzbl (%ecx),%eax
 39e:	84 c0                	test   %al,%al
 3a0:	74 04                	je     3a6 <strcmp+0x1c>
 3a2:	3a 02                	cmp    (%edx),%al
 3a4:	74 ef                	je     395 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 3a6:	0f b6 c0             	movzbl %al,%eax
 3a9:	0f b6 12             	movzbl (%edx),%edx
 3ac:	29 d0                	sub    %edx,%eax
}
 3ae:	5d                   	pop    %ebp
 3af:	c3                   	ret    

000003b0 <strlen>:

uint
strlen(const char *s)
{
 3b0:	55                   	push   %ebp
 3b1:	89 e5                	mov    %esp,%ebp
 3b3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 3b6:	b8 00 00 00 00       	mov    $0x0,%eax
 3bb:	eb 03                	jmp    3c0 <strlen+0x10>
 3bd:	83 c0 01             	add    $0x1,%eax
 3c0:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 3c4:	75 f7                	jne    3bd <strlen+0xd>
    ;
  return n;
}
 3c6:	5d                   	pop    %ebp
 3c7:	c3                   	ret    

000003c8 <memset>:

void*
memset(void *dst, int c, uint n)
{
 3c8:	55                   	push   %ebp
 3c9:	89 e5                	mov    %esp,%ebp
 3cb:	57                   	push   %edi
 3cc:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 3cf:	89 d7                	mov    %edx,%edi
 3d1:	8b 4d 10             	mov    0x10(%ebp),%ecx
 3d4:	8b 45 0c             	mov    0xc(%ebp),%eax
 3d7:	fc                   	cld    
 3d8:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 3da:	89 d0                	mov    %edx,%eax
 3dc:	8b 7d fc             	mov    -0x4(%ebp),%edi
 3df:	c9                   	leave  
 3e0:	c3                   	ret    

000003e1 <strchr>:

char*
strchr(const char *s, char c)
{
 3e1:	55                   	push   %ebp
 3e2:	89 e5                	mov    %esp,%ebp
 3e4:	8b 45 08             	mov    0x8(%ebp),%eax
 3e7:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 3eb:	eb 03                	jmp    3f0 <strchr+0xf>
 3ed:	83 c0 01             	add    $0x1,%eax
 3f0:	0f b6 10             	movzbl (%eax),%edx
 3f3:	84 d2                	test   %dl,%dl
 3f5:	74 06                	je     3fd <strchr+0x1c>
    if(*s == c)
 3f7:	38 ca                	cmp    %cl,%dl
 3f9:	75 f2                	jne    3ed <strchr+0xc>
 3fb:	eb 05                	jmp    402 <strchr+0x21>
      return (char*)s;
  return 0;
 3fd:	b8 00 00 00 00       	mov    $0x0,%eax
}
 402:	5d                   	pop    %ebp
 403:	c3                   	ret    

00000404 <gets>:

char*
gets(char *buf, int max)
{
 404:	55                   	push   %ebp
 405:	89 e5                	mov    %esp,%ebp
 407:	57                   	push   %edi
 408:	56                   	push   %esi
 409:	53                   	push   %ebx
 40a:	83 ec 1c             	sub    $0x1c,%esp
 40d:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 410:	bb 00 00 00 00       	mov    $0x0,%ebx
 415:	89 de                	mov    %ebx,%esi
 417:	83 c3 01             	add    $0x1,%ebx
 41a:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 41d:	7d 2e                	jge    44d <gets+0x49>
    cc = read(0, &c, 1);
 41f:	83 ec 04             	sub    $0x4,%esp
 422:	6a 01                	push   $0x1
 424:	8d 45 e7             	lea    -0x19(%ebp),%eax
 427:	50                   	push   %eax
 428:	6a 00                	push   $0x0
 42a:	e8 ec 00 00 00       	call   51b <read>
    if(cc < 1)
 42f:	83 c4 10             	add    $0x10,%esp
 432:	85 c0                	test   %eax,%eax
 434:	7e 17                	jle    44d <gets+0x49>
      break;
    buf[i++] = c;
 436:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 43a:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 43d:	3c 0a                	cmp    $0xa,%al
 43f:	0f 94 c2             	sete   %dl
 442:	3c 0d                	cmp    $0xd,%al
 444:	0f 94 c0             	sete   %al
 447:	08 c2                	or     %al,%dl
 449:	74 ca                	je     415 <gets+0x11>
    buf[i++] = c;
 44b:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 44d:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 451:	89 f8                	mov    %edi,%eax
 453:	8d 65 f4             	lea    -0xc(%ebp),%esp
 456:	5b                   	pop    %ebx
 457:	5e                   	pop    %esi
 458:	5f                   	pop    %edi
 459:	5d                   	pop    %ebp
 45a:	c3                   	ret    

0000045b <stat>:

int
stat(const char *n, struct stat *st)
{
 45b:	55                   	push   %ebp
 45c:	89 e5                	mov    %esp,%ebp
 45e:	56                   	push   %esi
 45f:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 460:	83 ec 08             	sub    $0x8,%esp
 463:	6a 00                	push   $0x0
 465:	ff 75 08             	push   0x8(%ebp)
 468:	e8 d6 00 00 00       	call   543 <open>
  if(fd < 0)
 46d:	83 c4 10             	add    $0x10,%esp
 470:	85 c0                	test   %eax,%eax
 472:	78 24                	js     498 <stat+0x3d>
 474:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 476:	83 ec 08             	sub    $0x8,%esp
 479:	ff 75 0c             	push   0xc(%ebp)
 47c:	50                   	push   %eax
 47d:	e8 d9 00 00 00       	call   55b <fstat>
 482:	89 c6                	mov    %eax,%esi
  close(fd);
 484:	89 1c 24             	mov    %ebx,(%esp)
 487:	e8 9f 00 00 00       	call   52b <close>
  return r;
 48c:	83 c4 10             	add    $0x10,%esp
}
 48f:	89 f0                	mov    %esi,%eax
 491:	8d 65 f8             	lea    -0x8(%ebp),%esp
 494:	5b                   	pop    %ebx
 495:	5e                   	pop    %esi
 496:	5d                   	pop    %ebp
 497:	c3                   	ret    
    return -1;
 498:	be ff ff ff ff       	mov    $0xffffffff,%esi
 49d:	eb f0                	jmp    48f <stat+0x34>

0000049f <atoi>:

int
atoi(const char *s)
{
 49f:	55                   	push   %ebp
 4a0:	89 e5                	mov    %esp,%ebp
 4a2:	53                   	push   %ebx
 4a3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 4a6:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 4ab:	eb 10                	jmp    4bd <atoi+0x1e>
    n = n*10 + *s++ - '0';
 4ad:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 4b0:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 4b3:	83 c1 01             	add    $0x1,%ecx
 4b6:	0f be c0             	movsbl %al,%eax
 4b9:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 4bd:	0f b6 01             	movzbl (%ecx),%eax
 4c0:	8d 58 d0             	lea    -0x30(%eax),%ebx
 4c3:	80 fb 09             	cmp    $0x9,%bl
 4c6:	76 e5                	jbe    4ad <atoi+0xe>
  return n;
}
 4c8:	89 d0                	mov    %edx,%eax
 4ca:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4cd:	c9                   	leave  
 4ce:	c3                   	ret    

000004cf <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 4cf:	55                   	push   %ebp
 4d0:	89 e5                	mov    %esp,%ebp
 4d2:	56                   	push   %esi
 4d3:	53                   	push   %ebx
 4d4:	8b 75 08             	mov    0x8(%ebp),%esi
 4d7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 4da:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 4dd:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 4df:	eb 0d                	jmp    4ee <memmove+0x1f>
    *dst++ = *src++;
 4e1:	0f b6 01             	movzbl (%ecx),%eax
 4e4:	88 02                	mov    %al,(%edx)
 4e6:	8d 49 01             	lea    0x1(%ecx),%ecx
 4e9:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 4ec:	89 d8                	mov    %ebx,%eax
 4ee:	8d 58 ff             	lea    -0x1(%eax),%ebx
 4f1:	85 c0                	test   %eax,%eax
 4f3:	7f ec                	jg     4e1 <memmove+0x12>
  return vdst;
}
 4f5:	89 f0                	mov    %esi,%eax
 4f7:	5b                   	pop    %ebx
 4f8:	5e                   	pop    %esi
 4f9:	5d                   	pop    %ebp
 4fa:	c3                   	ret    

000004fb <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4fb:	b8 01 00 00 00       	mov    $0x1,%eax
 500:	cd 40                	int    $0x40
 502:	c3                   	ret    

00000503 <exit>:
SYSCALL(exit)
 503:	b8 02 00 00 00       	mov    $0x2,%eax
 508:	cd 40                	int    $0x40
 50a:	c3                   	ret    

0000050b <wait>:
SYSCALL(wait)
 50b:	b8 03 00 00 00       	mov    $0x3,%eax
 510:	cd 40                	int    $0x40
 512:	c3                   	ret    

00000513 <pipe>:
SYSCALL(pipe)
 513:	b8 04 00 00 00       	mov    $0x4,%eax
 518:	cd 40                	int    $0x40
 51a:	c3                   	ret    

0000051b <read>:
SYSCALL(read)
 51b:	b8 05 00 00 00       	mov    $0x5,%eax
 520:	cd 40                	int    $0x40
 522:	c3                   	ret    

00000523 <write>:
SYSCALL(write)
 523:	b8 10 00 00 00       	mov    $0x10,%eax
 528:	cd 40                	int    $0x40
 52a:	c3                   	ret    

0000052b <close>:
SYSCALL(close)
 52b:	b8 15 00 00 00       	mov    $0x15,%eax
 530:	cd 40                	int    $0x40
 532:	c3                   	ret    

00000533 <kill>:
SYSCALL(kill)
 533:	b8 06 00 00 00       	mov    $0x6,%eax
 538:	cd 40                	int    $0x40
 53a:	c3                   	ret    

0000053b <exec>:
SYSCALL(exec)
 53b:	b8 07 00 00 00       	mov    $0x7,%eax
 540:	cd 40                	int    $0x40
 542:	c3                   	ret    

00000543 <open>:
SYSCALL(open)
 543:	b8 0f 00 00 00       	mov    $0xf,%eax
 548:	cd 40                	int    $0x40
 54a:	c3                   	ret    

0000054b <mknod>:
SYSCALL(mknod)
 54b:	b8 11 00 00 00       	mov    $0x11,%eax
 550:	cd 40                	int    $0x40
 552:	c3                   	ret    

00000553 <unlink>:
SYSCALL(unlink)
 553:	b8 12 00 00 00       	mov    $0x12,%eax
 558:	cd 40                	int    $0x40
 55a:	c3                   	ret    

0000055b <fstat>:
SYSCALL(fstat)
 55b:	b8 08 00 00 00       	mov    $0x8,%eax
 560:	cd 40                	int    $0x40
 562:	c3                   	ret    

00000563 <link>:
SYSCALL(link)
 563:	b8 13 00 00 00       	mov    $0x13,%eax
 568:	cd 40                	int    $0x40
 56a:	c3                   	ret    

0000056b <mkdir>:
SYSCALL(mkdir)
 56b:	b8 14 00 00 00       	mov    $0x14,%eax
 570:	cd 40                	int    $0x40
 572:	c3                   	ret    

00000573 <chdir>:
SYSCALL(chdir)
 573:	b8 09 00 00 00       	mov    $0x9,%eax
 578:	cd 40                	int    $0x40
 57a:	c3                   	ret    

0000057b <dup>:
SYSCALL(dup)
 57b:	b8 0a 00 00 00       	mov    $0xa,%eax
 580:	cd 40                	int    $0x40
 582:	c3                   	ret    

00000583 <getpid>:
SYSCALL(getpid)
 583:	b8 0b 00 00 00       	mov    $0xb,%eax
 588:	cd 40                	int    $0x40
 58a:	c3                   	ret    

0000058b <sbrk>:
SYSCALL(sbrk)
 58b:	b8 0c 00 00 00       	mov    $0xc,%eax
 590:	cd 40                	int    $0x40
 592:	c3                   	ret    

00000593 <sleep>:
SYSCALL(sleep)
 593:	b8 0d 00 00 00       	mov    $0xd,%eax
 598:	cd 40                	int    $0x40
 59a:	c3                   	ret    

0000059b <uptime>:
SYSCALL(uptime)
 59b:	b8 0e 00 00 00       	mov    $0xe,%eax
 5a0:	cd 40                	int    $0x40
 5a2:	c3                   	ret    

000005a3 <clone>:
SYSCALL(clone)
 5a3:	b8 16 00 00 00       	mov    $0x16,%eax
 5a8:	cd 40                	int    $0x40
 5aa:	c3                   	ret    

000005ab <join>:
 5ab:	b8 17 00 00 00       	mov    $0x17,%eax
 5b0:	cd 40                	int    $0x40
 5b2:	c3                   	ret    

000005b3 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 5b3:	55                   	push   %ebp
 5b4:	89 e5                	mov    %esp,%ebp
 5b6:	83 ec 1c             	sub    $0x1c,%esp
 5b9:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 5bc:	6a 01                	push   $0x1
 5be:	8d 55 f4             	lea    -0xc(%ebp),%edx
 5c1:	52                   	push   %edx
 5c2:	50                   	push   %eax
 5c3:	e8 5b ff ff ff       	call   523 <write>
}
 5c8:	83 c4 10             	add    $0x10,%esp
 5cb:	c9                   	leave  
 5cc:	c3                   	ret    

000005cd <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 5cd:	55                   	push   %ebp
 5ce:	89 e5                	mov    %esp,%ebp
 5d0:	57                   	push   %edi
 5d1:	56                   	push   %esi
 5d2:	53                   	push   %ebx
 5d3:	83 ec 2c             	sub    $0x2c,%esp
 5d6:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5d9:	89 d0                	mov    %edx,%eax
 5db:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 5dd:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 5e1:	0f 95 c1             	setne  %cl
 5e4:	c1 ea 1f             	shr    $0x1f,%edx
 5e7:	84 d1                	test   %dl,%cl
 5e9:	74 44                	je     62f <printint+0x62>
    neg = 1;
    x = -xx;
 5eb:	f7 d8                	neg    %eax
 5ed:	89 c1                	mov    %eax,%ecx
    neg = 1;
 5ef:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 5f6:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 5fb:	89 c8                	mov    %ecx,%eax
 5fd:	ba 00 00 00 00       	mov    $0x0,%edx
 602:	f7 f6                	div    %esi
 604:	89 df                	mov    %ebx,%edi
 606:	83 c3 01             	add    $0x1,%ebx
 609:	0f b6 92 fc 09 00 00 	movzbl 0x9fc(%edx),%edx
 610:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 614:	89 ca                	mov    %ecx,%edx
 616:	89 c1                	mov    %eax,%ecx
 618:	39 d6                	cmp    %edx,%esi
 61a:	76 df                	jbe    5fb <printint+0x2e>
  if(neg)
 61c:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 620:	74 31                	je     653 <printint+0x86>
    buf[i++] = '-';
 622:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 627:	8d 5f 02             	lea    0x2(%edi),%ebx
 62a:	8b 75 d0             	mov    -0x30(%ebp),%esi
 62d:	eb 17                	jmp    646 <printint+0x79>
    x = xx;
 62f:	89 c1                	mov    %eax,%ecx
  neg = 0;
 631:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 638:	eb bc                	jmp    5f6 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 63a:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 63f:	89 f0                	mov    %esi,%eax
 641:	e8 6d ff ff ff       	call   5b3 <putc>
  while(--i >= 0)
 646:	83 eb 01             	sub    $0x1,%ebx
 649:	79 ef                	jns    63a <printint+0x6d>
}
 64b:	83 c4 2c             	add    $0x2c,%esp
 64e:	5b                   	pop    %ebx
 64f:	5e                   	pop    %esi
 650:	5f                   	pop    %edi
 651:	5d                   	pop    %ebp
 652:	c3                   	ret    
 653:	8b 75 d0             	mov    -0x30(%ebp),%esi
 656:	eb ee                	jmp    646 <printint+0x79>

00000658 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 658:	55                   	push   %ebp
 659:	89 e5                	mov    %esp,%ebp
 65b:	57                   	push   %edi
 65c:	56                   	push   %esi
 65d:	53                   	push   %ebx
 65e:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 661:	8d 45 10             	lea    0x10(%ebp),%eax
 664:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 667:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 66c:	bb 00 00 00 00       	mov    $0x0,%ebx
 671:	eb 14                	jmp    687 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 673:	89 fa                	mov    %edi,%edx
 675:	8b 45 08             	mov    0x8(%ebp),%eax
 678:	e8 36 ff ff ff       	call   5b3 <putc>
 67d:	eb 05                	jmp    684 <printf+0x2c>
      }
    } else if(state == '%'){
 67f:	83 fe 25             	cmp    $0x25,%esi
 682:	74 25                	je     6a9 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 684:	83 c3 01             	add    $0x1,%ebx
 687:	8b 45 0c             	mov    0xc(%ebp),%eax
 68a:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 68e:	84 c0                	test   %al,%al
 690:	0f 84 20 01 00 00    	je     7b6 <printf+0x15e>
    c = fmt[i] & 0xff;
 696:	0f be f8             	movsbl %al,%edi
 699:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 69c:	85 f6                	test   %esi,%esi
 69e:	75 df                	jne    67f <printf+0x27>
      if(c == '%'){
 6a0:	83 f8 25             	cmp    $0x25,%eax
 6a3:	75 ce                	jne    673 <printf+0x1b>
        state = '%';
 6a5:	89 c6                	mov    %eax,%esi
 6a7:	eb db                	jmp    684 <printf+0x2c>
      if(c == 'd'){
 6a9:	83 f8 25             	cmp    $0x25,%eax
 6ac:	0f 84 cf 00 00 00    	je     781 <printf+0x129>
 6b2:	0f 8c dd 00 00 00    	jl     795 <printf+0x13d>
 6b8:	83 f8 78             	cmp    $0x78,%eax
 6bb:	0f 8f d4 00 00 00    	jg     795 <printf+0x13d>
 6c1:	83 f8 63             	cmp    $0x63,%eax
 6c4:	0f 8c cb 00 00 00    	jl     795 <printf+0x13d>
 6ca:	83 e8 63             	sub    $0x63,%eax
 6cd:	83 f8 15             	cmp    $0x15,%eax
 6d0:	0f 87 bf 00 00 00    	ja     795 <printf+0x13d>
 6d6:	ff 24 85 a4 09 00 00 	jmp    *0x9a4(,%eax,4)
        printint(fd, *ap, 10, 1);
 6dd:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6e0:	8b 17                	mov    (%edi),%edx
 6e2:	83 ec 0c             	sub    $0xc,%esp
 6e5:	6a 01                	push   $0x1
 6e7:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6ec:	8b 45 08             	mov    0x8(%ebp),%eax
 6ef:	e8 d9 fe ff ff       	call   5cd <printint>
        ap++;
 6f4:	83 c7 04             	add    $0x4,%edi
 6f7:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 6fa:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 6fd:	be 00 00 00 00       	mov    $0x0,%esi
 702:	eb 80                	jmp    684 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 704:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 707:	8b 17                	mov    (%edi),%edx
 709:	83 ec 0c             	sub    $0xc,%esp
 70c:	6a 00                	push   $0x0
 70e:	b9 10 00 00 00       	mov    $0x10,%ecx
 713:	8b 45 08             	mov    0x8(%ebp),%eax
 716:	e8 b2 fe ff ff       	call   5cd <printint>
        ap++;
 71b:	83 c7 04             	add    $0x4,%edi
 71e:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 721:	83 c4 10             	add    $0x10,%esp
      state = 0;
 724:	be 00 00 00 00       	mov    $0x0,%esi
 729:	e9 56 ff ff ff       	jmp    684 <printf+0x2c>
        s = (char*)*ap;
 72e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 731:	8b 30                	mov    (%eax),%esi
        ap++;
 733:	83 c0 04             	add    $0x4,%eax
 736:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 739:	85 f6                	test   %esi,%esi
 73b:	75 15                	jne    752 <printf+0xfa>
          s = "(null)";
 73d:	be 9c 09 00 00       	mov    $0x99c,%esi
 742:	eb 0e                	jmp    752 <printf+0xfa>
          putc(fd, *s);
 744:	0f be d2             	movsbl %dl,%edx
 747:	8b 45 08             	mov    0x8(%ebp),%eax
 74a:	e8 64 fe ff ff       	call   5b3 <putc>
          s++;
 74f:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 752:	0f b6 16             	movzbl (%esi),%edx
 755:	84 d2                	test   %dl,%dl
 757:	75 eb                	jne    744 <printf+0xec>
      state = 0;
 759:	be 00 00 00 00       	mov    $0x0,%esi
 75e:	e9 21 ff ff ff       	jmp    684 <printf+0x2c>
        putc(fd, *ap);
 763:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 766:	0f be 17             	movsbl (%edi),%edx
 769:	8b 45 08             	mov    0x8(%ebp),%eax
 76c:	e8 42 fe ff ff       	call   5b3 <putc>
        ap++;
 771:	83 c7 04             	add    $0x4,%edi
 774:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 777:	be 00 00 00 00       	mov    $0x0,%esi
 77c:	e9 03 ff ff ff       	jmp    684 <printf+0x2c>
        putc(fd, c);
 781:	89 fa                	mov    %edi,%edx
 783:	8b 45 08             	mov    0x8(%ebp),%eax
 786:	e8 28 fe ff ff       	call   5b3 <putc>
      state = 0;
 78b:	be 00 00 00 00       	mov    $0x0,%esi
 790:	e9 ef fe ff ff       	jmp    684 <printf+0x2c>
        putc(fd, '%');
 795:	ba 25 00 00 00       	mov    $0x25,%edx
 79a:	8b 45 08             	mov    0x8(%ebp),%eax
 79d:	e8 11 fe ff ff       	call   5b3 <putc>
        putc(fd, c);
 7a2:	89 fa                	mov    %edi,%edx
 7a4:	8b 45 08             	mov    0x8(%ebp),%eax
 7a7:	e8 07 fe ff ff       	call   5b3 <putc>
      state = 0;
 7ac:	be 00 00 00 00       	mov    $0x0,%esi
 7b1:	e9 ce fe ff ff       	jmp    684 <printf+0x2c>
    }
  }
}
 7b6:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7b9:	5b                   	pop    %ebx
 7ba:	5e                   	pop    %esi
 7bb:	5f                   	pop    %edi
 7bc:	5d                   	pop    %ebp
 7bd:	c3                   	ret    

000007be <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7be:	55                   	push   %ebp
 7bf:	89 e5                	mov    %esp,%ebp
 7c1:	57                   	push   %edi
 7c2:	56                   	push   %esi
 7c3:	53                   	push   %ebx
 7c4:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7c7:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7ca:	a1 c0 0e 00 00       	mov    0xec0,%eax
 7cf:	eb 02                	jmp    7d3 <free+0x15>
 7d1:	89 d0                	mov    %edx,%eax
 7d3:	39 c8                	cmp    %ecx,%eax
 7d5:	73 04                	jae    7db <free+0x1d>
 7d7:	39 08                	cmp    %ecx,(%eax)
 7d9:	77 12                	ja     7ed <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7db:	8b 10                	mov    (%eax),%edx
 7dd:	39 c2                	cmp    %eax,%edx
 7df:	77 f0                	ja     7d1 <free+0x13>
 7e1:	39 c8                	cmp    %ecx,%eax
 7e3:	72 08                	jb     7ed <free+0x2f>
 7e5:	39 ca                	cmp    %ecx,%edx
 7e7:	77 04                	ja     7ed <free+0x2f>
 7e9:	89 d0                	mov    %edx,%eax
 7eb:	eb e6                	jmp    7d3 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7ed:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7f0:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7f3:	8b 10                	mov    (%eax),%edx
 7f5:	39 d7                	cmp    %edx,%edi
 7f7:	74 19                	je     812 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 7f9:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7fc:	8b 50 04             	mov    0x4(%eax),%edx
 7ff:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 802:	39 ce                	cmp    %ecx,%esi
 804:	74 1b                	je     821 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 806:	89 08                	mov    %ecx,(%eax)
  freep = p;
 808:	a3 c0 0e 00 00       	mov    %eax,0xec0
}
 80d:	5b                   	pop    %ebx
 80e:	5e                   	pop    %esi
 80f:	5f                   	pop    %edi
 810:	5d                   	pop    %ebp
 811:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 812:	03 72 04             	add    0x4(%edx),%esi
 815:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 818:	8b 10                	mov    (%eax),%edx
 81a:	8b 12                	mov    (%edx),%edx
 81c:	89 53 f8             	mov    %edx,-0x8(%ebx)
 81f:	eb db                	jmp    7fc <free+0x3e>
    p->s.size += bp->s.size;
 821:	03 53 fc             	add    -0x4(%ebx),%edx
 824:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 827:	8b 53 f8             	mov    -0x8(%ebx),%edx
 82a:	89 10                	mov    %edx,(%eax)
 82c:	eb da                	jmp    808 <free+0x4a>

0000082e <morecore>:

static Header*
morecore(uint nu)
{
 82e:	55                   	push   %ebp
 82f:	89 e5                	mov    %esp,%ebp
 831:	53                   	push   %ebx
 832:	83 ec 04             	sub    $0x4,%esp
 835:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 837:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 83c:	77 05                	ja     843 <morecore+0x15>
    nu = 4096;
 83e:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 843:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 84a:	83 ec 0c             	sub    $0xc,%esp
 84d:	50                   	push   %eax
 84e:	e8 38 fd ff ff       	call   58b <sbrk>
  if(p == (char*)-1)
 853:	83 c4 10             	add    $0x10,%esp
 856:	83 f8 ff             	cmp    $0xffffffff,%eax
 859:	74 1c                	je     877 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 85b:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 85e:	83 c0 08             	add    $0x8,%eax
 861:	83 ec 0c             	sub    $0xc,%esp
 864:	50                   	push   %eax
 865:	e8 54 ff ff ff       	call   7be <free>
  return freep;
 86a:	a1 c0 0e 00 00       	mov    0xec0,%eax
 86f:	83 c4 10             	add    $0x10,%esp
}
 872:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 875:	c9                   	leave  
 876:	c3                   	ret    
    return 0;
 877:	b8 00 00 00 00       	mov    $0x0,%eax
 87c:	eb f4                	jmp    872 <morecore+0x44>

0000087e <malloc>:

void*
malloc(uint nbytes)
{
 87e:	55                   	push   %ebp
 87f:	89 e5                	mov    %esp,%ebp
 881:	53                   	push   %ebx
 882:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 885:	8b 45 08             	mov    0x8(%ebp),%eax
 888:	8d 58 07             	lea    0x7(%eax),%ebx
 88b:	c1 eb 03             	shr    $0x3,%ebx
 88e:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 891:	8b 0d c0 0e 00 00    	mov    0xec0,%ecx
 897:	85 c9                	test   %ecx,%ecx
 899:	74 04                	je     89f <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 89b:	8b 01                	mov    (%ecx),%eax
 89d:	eb 4a                	jmp    8e9 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 89f:	c7 05 c0 0e 00 00 c4 	movl   $0xec4,0xec0
 8a6:	0e 00 00 
 8a9:	c7 05 c4 0e 00 00 c4 	movl   $0xec4,0xec4
 8b0:	0e 00 00 
    base.s.size = 0;
 8b3:	c7 05 c8 0e 00 00 00 	movl   $0x0,0xec8
 8ba:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 8bd:	b9 c4 0e 00 00       	mov    $0xec4,%ecx
 8c2:	eb d7                	jmp    89b <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 8c4:	74 19                	je     8df <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 8c6:	29 da                	sub    %ebx,%edx
 8c8:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8cb:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 8ce:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 8d1:	89 0d c0 0e 00 00    	mov    %ecx,0xec0
      return (void*)(p + 1);
 8d7:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 8da:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8dd:	c9                   	leave  
 8de:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 8df:	8b 10                	mov    (%eax),%edx
 8e1:	89 11                	mov    %edx,(%ecx)
 8e3:	eb ec                	jmp    8d1 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8e5:	89 c1                	mov    %eax,%ecx
 8e7:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 8e9:	8b 50 04             	mov    0x4(%eax),%edx
 8ec:	39 da                	cmp    %ebx,%edx
 8ee:	73 d4                	jae    8c4 <malloc+0x46>
    if(p == freep)
 8f0:	39 05 c0 0e 00 00    	cmp    %eax,0xec0
 8f6:	75 ed                	jne    8e5 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 8f8:	89 d8                	mov    %ebx,%eax
 8fa:	e8 2f ff ff ff       	call   82e <morecore>
 8ff:	85 c0                	test   %eax,%eax
 901:	75 e2                	jne    8e5 <malloc+0x67>
 903:	eb d5                	jmp    8da <malloc+0x5c>
