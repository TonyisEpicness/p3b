
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
  18:	a1 90 0d 00 00       	mov    0xd90,%eax
  1d:	83 f8 01             	cmp    $0x1,%eax
  20:	0f 85 9c 00 00 00    	jne    c2 <worker+0xc2>
   global++;
  26:	83 c0 01             	add    $0x1,%eax
  29:	a3 90 0d 00 00       	mov    %eax,0xd90
   // no exit() in thread
}
  2e:	c9                   	leave  
  2f:	c3                   	ret    
   assert(tmp1 == 42);
  30:	6a 2c                	push   $0x2c
  32:	68 00 09 00 00       	push   $0x900
  37:	68 0a 09 00 00       	push   $0x90a
  3c:	6a 01                	push   $0x1
  3e:	e8 0d 06 00 00       	call   650 <printf>
  43:	83 c4 0c             	add    $0xc,%esp
  46:	68 12 09 00 00       	push   $0x912
  4b:	68 1d 09 00 00       	push   $0x91d
  50:	6a 01                	push   $0x1
  52:	e8 f9 05 00 00       	call   650 <printf>
  57:	83 c4 08             	add    $0x8,%esp
  5a:	68 31 09 00 00       	push   $0x931
  5f:	6a 01                	push   $0x1
  61:	e8 ea 05 00 00       	call   650 <printf>
  66:	83 c4 04             	add    $0x4,%esp
  69:	ff 35 a0 0d 00 00    	push   0xda0
  6f:	e8 b7 04 00 00       	call   52b <kill>
  74:	e8 82 04 00 00       	call   4fb <exit>
   assert(tmp2 == 24);
  79:	6a 2d                	push   $0x2d
  7b:	68 00 09 00 00       	push   $0x900
  80:	68 0a 09 00 00       	push   $0x90a
  85:	6a 01                	push   $0x1
  87:	e8 c4 05 00 00       	call   650 <printf>
  8c:	83 c4 0c             	add    $0xc,%esp
  8f:	68 3e 09 00 00       	push   $0x93e
  94:	68 1d 09 00 00       	push   $0x91d
  99:	6a 01                	push   $0x1
  9b:	e8 b0 05 00 00       	call   650 <printf>
  a0:	83 c4 08             	add    $0x8,%esp
  a3:	68 31 09 00 00       	push   $0x931
  a8:	6a 01                	push   $0x1
  aa:	e8 a1 05 00 00       	call   650 <printf>
  af:	83 c4 04             	add    $0x4,%esp
  b2:	ff 35 a0 0d 00 00    	push   0xda0
  b8:	e8 6e 04 00 00       	call   52b <kill>
  bd:	e8 39 04 00 00       	call   4fb <exit>
   assert(global == 1);
  c2:	6a 2e                	push   $0x2e
  c4:	68 00 09 00 00       	push   $0x900
  c9:	68 0a 09 00 00       	push   $0x90a
  ce:	6a 01                	push   $0x1
  d0:	e8 7b 05 00 00       	call   650 <printf>
  d5:	83 c4 0c             	add    $0xc,%esp
  d8:	68 49 09 00 00       	push   $0x949
  dd:	68 1d 09 00 00       	push   $0x91d
  e2:	6a 01                	push   $0x1
  e4:	e8 67 05 00 00       	call   650 <printf>
  e9:	83 c4 08             	add    $0x8,%esp
  ec:	68 31 09 00 00       	push   $0x931
  f1:	6a 01                	push   $0x1
  f3:	e8 58 05 00 00       	call   650 <printf>
  f8:	83 c4 04             	add    $0x4,%esp
  fb:	ff 35 a0 0d 00 00    	push   0xda0
 101:	e8 25 04 00 00       	call   52b <kill>
 106:	e8 f0 03 00 00       	call   4fb <exit>

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
 11d:	e8 59 04 00 00       	call   57b <getpid>
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
 153:	e8 75 01 00 00       	call   2cd <thread_join>
   assert(join_pid == thread_pid);
 158:	39 c3                	cmp    %eax,%ebx
 15a:	0f 85 9f 00 00 00    	jne    1ff <main+0xf4>
   assert(global == 2);
 160:	83 3d 90 0d 00 00 02 	cmpl   $0x2,0xd90
 167:	0f 84 db 00 00 00    	je     248 <main+0x13d>
 16d:	6a 22                	push   $0x22
 16f:	68 00 09 00 00       	push   $0x900
 174:	68 0a 09 00 00       	push   $0x90a
 179:	6a 01                	push   $0x1
 17b:	e8 d0 04 00 00       	call   650 <printf>
 180:	83 c4 0c             	add    $0xc,%esp
 183:	68 7b 09 00 00       	push   $0x97b
 188:	68 1d 09 00 00       	push   $0x91d
 18d:	6a 01                	push   $0x1
 18f:	e8 bc 04 00 00       	call   650 <printf>
 194:	83 c4 08             	add    $0x8,%esp
 197:	68 31 09 00 00       	push   $0x931
 19c:	6a 01                	push   $0x1
 19e:	e8 ad 04 00 00       	call   650 <printf>
 1a3:	83 c4 04             	add    $0x4,%esp
 1a6:	ff 35 a0 0d 00 00    	push   0xda0
 1ac:	e8 7a 03 00 00       	call   52b <kill>
 1b1:	e8 45 03 00 00       	call   4fb <exit>
   assert(thread_pid > 0);
 1b6:	6a 1e                	push   $0x1e
 1b8:	68 00 09 00 00       	push   $0x900
 1bd:	68 0a 09 00 00       	push   $0x90a
 1c2:	6a 01                	push   $0x1
 1c4:	e8 87 04 00 00       	call   650 <printf>
 1c9:	83 c4 0c             	add    $0xc,%esp
 1cc:	68 55 09 00 00       	push   $0x955
 1d1:	68 1d 09 00 00       	push   $0x91d
 1d6:	6a 01                	push   $0x1
 1d8:	e8 73 04 00 00       	call   650 <printf>
 1dd:	83 c4 08             	add    $0x8,%esp
 1e0:	68 31 09 00 00       	push   $0x931
 1e5:	6a 01                	push   $0x1
 1e7:	e8 64 04 00 00       	call   650 <printf>
 1ec:	83 c4 04             	add    $0x4,%esp
 1ef:	ff 35 a0 0d 00 00    	push   0xda0
 1f5:	e8 31 03 00 00       	call   52b <kill>
 1fa:	e8 fc 02 00 00       	call   4fb <exit>
   assert(join_pid == thread_pid);
 1ff:	6a 21                	push   $0x21
 201:	68 00 09 00 00       	push   $0x900
 206:	68 0a 09 00 00       	push   $0x90a
 20b:	6a 01                	push   $0x1
 20d:	e8 3e 04 00 00       	call   650 <printf>
 212:	83 c4 0c             	add    $0xc,%esp
 215:	68 64 09 00 00       	push   $0x964
 21a:	68 1d 09 00 00       	push   $0x91d
 21f:	6a 01                	push   $0x1
 221:	e8 2a 04 00 00       	call   650 <printf>
 226:	83 c4 08             	add    $0x8,%esp
 229:	68 31 09 00 00       	push   $0x931
 22e:	6a 01                	push   $0x1
 230:	e8 1b 04 00 00       	call   650 <printf>
 235:	83 c4 04             	add    $0x4,%esp
 238:	ff 35 a0 0d 00 00    	push   0xda0
 23e:	e8 e8 02 00 00       	call   52b <kill>
 243:	e8 b3 02 00 00       	call   4fb <exit>
   printf(1, "TEST PASSED\n");
 248:	83 ec 08             	sub    $0x8,%esp
 24b:	68 87 09 00 00       	push   $0x987
 250:	6a 01                	push   $0x1
 252:	e8 f9 03 00 00       	call   650 <printf>
   exit();
 257:	e8 9f 02 00 00       	call   4fb <exit>

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
 270:	53                   	push   %ebx
 271:	83 ec 10             	sub    $0x10,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE*2);
 274:	68 00 20 00 00       	push   $0x2000
 279:	e8 f8 05 00 00       	call   876 <malloc>
  if(n_stack == 0){
 27e:	83 c4 10             	add    $0x10,%esp
 281:	85 c0                	test   %eax,%eax
 283:	74 41                	je     2c6 <thread_create+0x59>
 285:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  int new_pid = clone(start_routine, arg1, arg2, n_stack);
 287:	50                   	push   %eax
 288:	ff 75 10             	push   0x10(%ebp)
 28b:	ff 75 0c             	push   0xc(%ebp)
 28e:	ff 75 08             	push   0x8(%ebp)
 291:	e8 05 03 00 00       	call   59b <clone>

  for(int i=0; i<64; i++){
 296:	83 c4 10             	add    $0x10,%esp
 299:	ba 00 00 00 00       	mov    $0x0,%edx
 29e:	eb 03                	jmp    2a3 <thread_create+0x36>
 2a0:	83 c2 01             	add    $0x1,%edx
 2a3:	83 fa 3f             	cmp    $0x3f,%edx
 2a6:	7f 19                	jg     2c1 <thread_create+0x54>
    if(threads[i]->flag==0){
 2a8:	8b 0c 95 c0 0d 00 00 	mov    0xdc0(,%edx,4),%ecx
 2af:	83 79 08 00          	cmpl   $0x0,0x8(%ecx)
 2b3:	75 eb                	jne    2a0 <thread_create+0x33>
      threads[i]->maddr = n_stack;
 2b5:	89 19                	mov    %ebx,(%ecx)
      threads[i]->pg1addr = n_stack;
 2b7:	8b 14 95 c0 0d 00 00 	mov    0xdc0(,%edx,4),%edx
 2be:	89 5a 04             	mov    %ebx,0x4(%edx)
      break;
    }
  }

  return new_pid;
}
 2c1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2c4:	c9                   	leave  
 2c5:	c3                   	ret    
    return -1;
 2c6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2cb:	eb f4                	jmp    2c1 <thread_create+0x54>

000002cd <thread_join>:

//TODO: fix
int thread_join() {
 2cd:	55                   	push   %ebp
 2ce:	89 e5                	mov    %esp,%ebp
 2d0:	56                   	push   %esi
 2d1:	53                   	push   %ebx
 2d2:	83 ec 1c             	sub    $0x1c,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 2d5:	8d 45 f4             	lea    -0xc(%ebp),%eax
 2d8:	50                   	push   %eax
 2d9:	e8 c5 02 00 00       	call   5a3 <join>
 2de:	89 c6                	mov    %eax,%esi
  for(int i=0; i<64; i++){
 2e0:	83 c4 10             	add    $0x10,%esp
 2e3:	bb 00 00 00 00       	mov    $0x0,%ebx
 2e8:	eb 03                	jmp    2ed <thread_join+0x20>
 2ea:	83 c3 01             	add    $0x1,%ebx
 2ed:	83 fb 3f             	cmp    $0x3f,%ebx
 2f0:	7f 23                	jg     315 <thread_join+0x48>
    if((threads[i]->flag==1) && (stk_addr == threads[i]->pg1addr)){
 2f2:	8b 04 9d c0 0d 00 00 	mov    0xdc0(,%ebx,4),%eax
 2f9:	83 78 08 01          	cmpl   $0x1,0x8(%eax)
 2fd:	75 eb                	jne    2ea <thread_join+0x1d>
 2ff:	8b 55 f4             	mov    -0xc(%ebp),%edx
 302:	39 50 04             	cmp    %edx,0x4(%eax)
 305:	75 e3                	jne    2ea <thread_join+0x1d>
      free(stk_addr);
 307:	83 ec 0c             	sub    $0xc,%esp
 30a:	52                   	push   %edx
 30b:	e8 a6 04 00 00       	call   7b6 <free>
 310:	83 c4 10             	add    $0x10,%esp
 313:	eb d5                	jmp    2ea <thread_join+0x1d>
    }
  }
  return pid;
}
 315:	89 f0                	mov    %esi,%eax
 317:	8d 65 f8             	lea    -0x8(%ebp),%esp
 31a:	5b                   	pop    %ebx
 31b:	5e                   	pop    %esi
 31c:	5d                   	pop    %ebp
 31d:	c3                   	ret    

0000031e <lock_acquire>:

void lock_acquire(lock_t *lock){
 31e:	55                   	push   %ebp
 31f:	89 e5                	mov    %esp,%ebp
 321:	53                   	push   %ebx
 322:	83 ec 04             	sub    $0x4,%esp
 325:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 328:	83 ec 08             	sub    $0x8,%esp
 32b:	6a 01                	push   $0x1
 32d:	53                   	push   %ebx
 32e:	e8 29 ff ff ff       	call   25c <test_and_set>
 333:	83 c4 10             	add    $0x10,%esp
 336:	83 f8 01             	cmp    $0x1,%eax
 339:	74 ed                	je     328 <lock_acquire+0xa>
    ;
}
 33b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 33e:	c9                   	leave  
 33f:	c3                   	ret    

00000340 <lock_release>:

void lock_release(lock_t *lock) {
 340:	55                   	push   %ebp
 341:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 343:	8b 45 08             	mov    0x8(%ebp),%eax
 346:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 34c:	5d                   	pop    %ebp
 34d:	c3                   	ret    

0000034e <lock_init>:

void lock_init(lock_t *lock) {
 34e:	55                   	push   %ebp
 34f:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 351:	8b 45 08             	mov    0x8(%ebp),%eax
 354:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 35a:	5d                   	pop    %ebp
 35b:	c3                   	ret    

0000035c <strcpy>:

char*
strcpy(char *s, const char *t)
{
 35c:	55                   	push   %ebp
 35d:	89 e5                	mov    %esp,%ebp
 35f:	56                   	push   %esi
 360:	53                   	push   %ebx
 361:	8b 75 08             	mov    0x8(%ebp),%esi
 364:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 367:	89 f0                	mov    %esi,%eax
 369:	89 d1                	mov    %edx,%ecx
 36b:	83 c2 01             	add    $0x1,%edx
 36e:	89 c3                	mov    %eax,%ebx
 370:	83 c0 01             	add    $0x1,%eax
 373:	0f b6 09             	movzbl (%ecx),%ecx
 376:	88 0b                	mov    %cl,(%ebx)
 378:	84 c9                	test   %cl,%cl
 37a:	75 ed                	jne    369 <strcpy+0xd>
    ;
  return os;
}
 37c:	89 f0                	mov    %esi,%eax
 37e:	5b                   	pop    %ebx
 37f:	5e                   	pop    %esi
 380:	5d                   	pop    %ebp
 381:	c3                   	ret    

00000382 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 382:	55                   	push   %ebp
 383:	89 e5                	mov    %esp,%ebp
 385:	8b 4d 08             	mov    0x8(%ebp),%ecx
 388:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 38b:	eb 06                	jmp    393 <strcmp+0x11>
    p++, q++;
 38d:	83 c1 01             	add    $0x1,%ecx
 390:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 393:	0f b6 01             	movzbl (%ecx),%eax
 396:	84 c0                	test   %al,%al
 398:	74 04                	je     39e <strcmp+0x1c>
 39a:	3a 02                	cmp    (%edx),%al
 39c:	74 ef                	je     38d <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 39e:	0f b6 c0             	movzbl %al,%eax
 3a1:	0f b6 12             	movzbl (%edx),%edx
 3a4:	29 d0                	sub    %edx,%eax
}
 3a6:	5d                   	pop    %ebp
 3a7:	c3                   	ret    

000003a8 <strlen>:

uint
strlen(const char *s)
{
 3a8:	55                   	push   %ebp
 3a9:	89 e5                	mov    %esp,%ebp
 3ab:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 3ae:	b8 00 00 00 00       	mov    $0x0,%eax
 3b3:	eb 03                	jmp    3b8 <strlen+0x10>
 3b5:	83 c0 01             	add    $0x1,%eax
 3b8:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 3bc:	75 f7                	jne    3b5 <strlen+0xd>
    ;
  return n;
}
 3be:	5d                   	pop    %ebp
 3bf:	c3                   	ret    

000003c0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 3c0:	55                   	push   %ebp
 3c1:	89 e5                	mov    %esp,%ebp
 3c3:	57                   	push   %edi
 3c4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 3c7:	89 d7                	mov    %edx,%edi
 3c9:	8b 4d 10             	mov    0x10(%ebp),%ecx
 3cc:	8b 45 0c             	mov    0xc(%ebp),%eax
 3cf:	fc                   	cld    
 3d0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 3d2:	89 d0                	mov    %edx,%eax
 3d4:	8b 7d fc             	mov    -0x4(%ebp),%edi
 3d7:	c9                   	leave  
 3d8:	c3                   	ret    

000003d9 <strchr>:

char*
strchr(const char *s, char c)
{
 3d9:	55                   	push   %ebp
 3da:	89 e5                	mov    %esp,%ebp
 3dc:	8b 45 08             	mov    0x8(%ebp),%eax
 3df:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 3e3:	eb 03                	jmp    3e8 <strchr+0xf>
 3e5:	83 c0 01             	add    $0x1,%eax
 3e8:	0f b6 10             	movzbl (%eax),%edx
 3eb:	84 d2                	test   %dl,%dl
 3ed:	74 06                	je     3f5 <strchr+0x1c>
    if(*s == c)
 3ef:	38 ca                	cmp    %cl,%dl
 3f1:	75 f2                	jne    3e5 <strchr+0xc>
 3f3:	eb 05                	jmp    3fa <strchr+0x21>
      return (char*)s;
  return 0;
 3f5:	b8 00 00 00 00       	mov    $0x0,%eax
}
 3fa:	5d                   	pop    %ebp
 3fb:	c3                   	ret    

000003fc <gets>:

char*
gets(char *buf, int max)
{
 3fc:	55                   	push   %ebp
 3fd:	89 e5                	mov    %esp,%ebp
 3ff:	57                   	push   %edi
 400:	56                   	push   %esi
 401:	53                   	push   %ebx
 402:	83 ec 1c             	sub    $0x1c,%esp
 405:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 408:	bb 00 00 00 00       	mov    $0x0,%ebx
 40d:	89 de                	mov    %ebx,%esi
 40f:	83 c3 01             	add    $0x1,%ebx
 412:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 415:	7d 2e                	jge    445 <gets+0x49>
    cc = read(0, &c, 1);
 417:	83 ec 04             	sub    $0x4,%esp
 41a:	6a 01                	push   $0x1
 41c:	8d 45 e7             	lea    -0x19(%ebp),%eax
 41f:	50                   	push   %eax
 420:	6a 00                	push   $0x0
 422:	e8 ec 00 00 00       	call   513 <read>
    if(cc < 1)
 427:	83 c4 10             	add    $0x10,%esp
 42a:	85 c0                	test   %eax,%eax
 42c:	7e 17                	jle    445 <gets+0x49>
      break;
    buf[i++] = c;
 42e:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 432:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 435:	3c 0a                	cmp    $0xa,%al
 437:	0f 94 c2             	sete   %dl
 43a:	3c 0d                	cmp    $0xd,%al
 43c:	0f 94 c0             	sete   %al
 43f:	08 c2                	or     %al,%dl
 441:	74 ca                	je     40d <gets+0x11>
    buf[i++] = c;
 443:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 445:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 449:	89 f8                	mov    %edi,%eax
 44b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 44e:	5b                   	pop    %ebx
 44f:	5e                   	pop    %esi
 450:	5f                   	pop    %edi
 451:	5d                   	pop    %ebp
 452:	c3                   	ret    

00000453 <stat>:

int
stat(const char *n, struct stat *st)
{
 453:	55                   	push   %ebp
 454:	89 e5                	mov    %esp,%ebp
 456:	56                   	push   %esi
 457:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 458:	83 ec 08             	sub    $0x8,%esp
 45b:	6a 00                	push   $0x0
 45d:	ff 75 08             	push   0x8(%ebp)
 460:	e8 d6 00 00 00       	call   53b <open>
  if(fd < 0)
 465:	83 c4 10             	add    $0x10,%esp
 468:	85 c0                	test   %eax,%eax
 46a:	78 24                	js     490 <stat+0x3d>
 46c:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 46e:	83 ec 08             	sub    $0x8,%esp
 471:	ff 75 0c             	push   0xc(%ebp)
 474:	50                   	push   %eax
 475:	e8 d9 00 00 00       	call   553 <fstat>
 47a:	89 c6                	mov    %eax,%esi
  close(fd);
 47c:	89 1c 24             	mov    %ebx,(%esp)
 47f:	e8 9f 00 00 00       	call   523 <close>
  return r;
 484:	83 c4 10             	add    $0x10,%esp
}
 487:	89 f0                	mov    %esi,%eax
 489:	8d 65 f8             	lea    -0x8(%ebp),%esp
 48c:	5b                   	pop    %ebx
 48d:	5e                   	pop    %esi
 48e:	5d                   	pop    %ebp
 48f:	c3                   	ret    
    return -1;
 490:	be ff ff ff ff       	mov    $0xffffffff,%esi
 495:	eb f0                	jmp    487 <stat+0x34>

00000497 <atoi>:

int
atoi(const char *s)
{
 497:	55                   	push   %ebp
 498:	89 e5                	mov    %esp,%ebp
 49a:	53                   	push   %ebx
 49b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 49e:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 4a3:	eb 10                	jmp    4b5 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 4a5:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 4a8:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 4ab:	83 c1 01             	add    $0x1,%ecx
 4ae:	0f be c0             	movsbl %al,%eax
 4b1:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 4b5:	0f b6 01             	movzbl (%ecx),%eax
 4b8:	8d 58 d0             	lea    -0x30(%eax),%ebx
 4bb:	80 fb 09             	cmp    $0x9,%bl
 4be:	76 e5                	jbe    4a5 <atoi+0xe>
  return n;
}
 4c0:	89 d0                	mov    %edx,%eax
 4c2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4c5:	c9                   	leave  
 4c6:	c3                   	ret    

000004c7 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 4c7:	55                   	push   %ebp
 4c8:	89 e5                	mov    %esp,%ebp
 4ca:	56                   	push   %esi
 4cb:	53                   	push   %ebx
 4cc:	8b 75 08             	mov    0x8(%ebp),%esi
 4cf:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 4d2:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 4d5:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 4d7:	eb 0d                	jmp    4e6 <memmove+0x1f>
    *dst++ = *src++;
 4d9:	0f b6 01             	movzbl (%ecx),%eax
 4dc:	88 02                	mov    %al,(%edx)
 4de:	8d 49 01             	lea    0x1(%ecx),%ecx
 4e1:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 4e4:	89 d8                	mov    %ebx,%eax
 4e6:	8d 58 ff             	lea    -0x1(%eax),%ebx
 4e9:	85 c0                	test   %eax,%eax
 4eb:	7f ec                	jg     4d9 <memmove+0x12>
  return vdst;
}
 4ed:	89 f0                	mov    %esi,%eax
 4ef:	5b                   	pop    %ebx
 4f0:	5e                   	pop    %esi
 4f1:	5d                   	pop    %ebp
 4f2:	c3                   	ret    

000004f3 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4f3:	b8 01 00 00 00       	mov    $0x1,%eax
 4f8:	cd 40                	int    $0x40
 4fa:	c3                   	ret    

000004fb <exit>:
SYSCALL(exit)
 4fb:	b8 02 00 00 00       	mov    $0x2,%eax
 500:	cd 40                	int    $0x40
 502:	c3                   	ret    

00000503 <wait>:
SYSCALL(wait)
 503:	b8 03 00 00 00       	mov    $0x3,%eax
 508:	cd 40                	int    $0x40
 50a:	c3                   	ret    

0000050b <pipe>:
SYSCALL(pipe)
 50b:	b8 04 00 00 00       	mov    $0x4,%eax
 510:	cd 40                	int    $0x40
 512:	c3                   	ret    

00000513 <read>:
SYSCALL(read)
 513:	b8 05 00 00 00       	mov    $0x5,%eax
 518:	cd 40                	int    $0x40
 51a:	c3                   	ret    

0000051b <write>:
SYSCALL(write)
 51b:	b8 10 00 00 00       	mov    $0x10,%eax
 520:	cd 40                	int    $0x40
 522:	c3                   	ret    

00000523 <close>:
SYSCALL(close)
 523:	b8 15 00 00 00       	mov    $0x15,%eax
 528:	cd 40                	int    $0x40
 52a:	c3                   	ret    

0000052b <kill>:
SYSCALL(kill)
 52b:	b8 06 00 00 00       	mov    $0x6,%eax
 530:	cd 40                	int    $0x40
 532:	c3                   	ret    

00000533 <exec>:
SYSCALL(exec)
 533:	b8 07 00 00 00       	mov    $0x7,%eax
 538:	cd 40                	int    $0x40
 53a:	c3                   	ret    

0000053b <open>:
SYSCALL(open)
 53b:	b8 0f 00 00 00       	mov    $0xf,%eax
 540:	cd 40                	int    $0x40
 542:	c3                   	ret    

00000543 <mknod>:
SYSCALL(mknod)
 543:	b8 11 00 00 00       	mov    $0x11,%eax
 548:	cd 40                	int    $0x40
 54a:	c3                   	ret    

0000054b <unlink>:
SYSCALL(unlink)
 54b:	b8 12 00 00 00       	mov    $0x12,%eax
 550:	cd 40                	int    $0x40
 552:	c3                   	ret    

00000553 <fstat>:
SYSCALL(fstat)
 553:	b8 08 00 00 00       	mov    $0x8,%eax
 558:	cd 40                	int    $0x40
 55a:	c3                   	ret    

0000055b <link>:
SYSCALL(link)
 55b:	b8 13 00 00 00       	mov    $0x13,%eax
 560:	cd 40                	int    $0x40
 562:	c3                   	ret    

00000563 <mkdir>:
SYSCALL(mkdir)
 563:	b8 14 00 00 00       	mov    $0x14,%eax
 568:	cd 40                	int    $0x40
 56a:	c3                   	ret    

0000056b <chdir>:
SYSCALL(chdir)
 56b:	b8 09 00 00 00       	mov    $0x9,%eax
 570:	cd 40                	int    $0x40
 572:	c3                   	ret    

00000573 <dup>:
SYSCALL(dup)
 573:	b8 0a 00 00 00       	mov    $0xa,%eax
 578:	cd 40                	int    $0x40
 57a:	c3                   	ret    

0000057b <getpid>:
SYSCALL(getpid)
 57b:	b8 0b 00 00 00       	mov    $0xb,%eax
 580:	cd 40                	int    $0x40
 582:	c3                   	ret    

00000583 <sbrk>:
SYSCALL(sbrk)
 583:	b8 0c 00 00 00       	mov    $0xc,%eax
 588:	cd 40                	int    $0x40
 58a:	c3                   	ret    

0000058b <sleep>:
SYSCALL(sleep)
 58b:	b8 0d 00 00 00       	mov    $0xd,%eax
 590:	cd 40                	int    $0x40
 592:	c3                   	ret    

00000593 <uptime>:
SYSCALL(uptime)
 593:	b8 0e 00 00 00       	mov    $0xe,%eax
 598:	cd 40                	int    $0x40
 59a:	c3                   	ret    

0000059b <clone>:
SYSCALL(clone)
 59b:	b8 16 00 00 00       	mov    $0x16,%eax
 5a0:	cd 40                	int    $0x40
 5a2:	c3                   	ret    

000005a3 <join>:
 5a3:	b8 17 00 00 00       	mov    $0x17,%eax
 5a8:	cd 40                	int    $0x40
 5aa:	c3                   	ret    

000005ab <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 5ab:	55                   	push   %ebp
 5ac:	89 e5                	mov    %esp,%ebp
 5ae:	83 ec 1c             	sub    $0x1c,%esp
 5b1:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 5b4:	6a 01                	push   $0x1
 5b6:	8d 55 f4             	lea    -0xc(%ebp),%edx
 5b9:	52                   	push   %edx
 5ba:	50                   	push   %eax
 5bb:	e8 5b ff ff ff       	call   51b <write>
}
 5c0:	83 c4 10             	add    $0x10,%esp
 5c3:	c9                   	leave  
 5c4:	c3                   	ret    

000005c5 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 5c5:	55                   	push   %ebp
 5c6:	89 e5                	mov    %esp,%ebp
 5c8:	57                   	push   %edi
 5c9:	56                   	push   %esi
 5ca:	53                   	push   %ebx
 5cb:	83 ec 2c             	sub    $0x2c,%esp
 5ce:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5d1:	89 d0                	mov    %edx,%eax
 5d3:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 5d5:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 5d9:	0f 95 c1             	setne  %cl
 5dc:	c1 ea 1f             	shr    $0x1f,%edx
 5df:	84 d1                	test   %dl,%cl
 5e1:	74 44                	je     627 <printint+0x62>
    neg = 1;
    x = -xx;
 5e3:	f7 d8                	neg    %eax
 5e5:	89 c1                	mov    %eax,%ecx
    neg = 1;
 5e7:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 5ee:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 5f3:	89 c8                	mov    %ecx,%eax
 5f5:	ba 00 00 00 00       	mov    $0x0,%edx
 5fa:	f7 f6                	div    %esi
 5fc:	89 df                	mov    %ebx,%edi
 5fe:	83 c3 01             	add    $0x1,%ebx
 601:	0f b6 92 f4 09 00 00 	movzbl 0x9f4(%edx),%edx
 608:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 60c:	89 ca                	mov    %ecx,%edx
 60e:	89 c1                	mov    %eax,%ecx
 610:	39 d6                	cmp    %edx,%esi
 612:	76 df                	jbe    5f3 <printint+0x2e>
  if(neg)
 614:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 618:	74 31                	je     64b <printint+0x86>
    buf[i++] = '-';
 61a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 61f:	8d 5f 02             	lea    0x2(%edi),%ebx
 622:	8b 75 d0             	mov    -0x30(%ebp),%esi
 625:	eb 17                	jmp    63e <printint+0x79>
    x = xx;
 627:	89 c1                	mov    %eax,%ecx
  neg = 0;
 629:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 630:	eb bc                	jmp    5ee <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 632:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 637:	89 f0                	mov    %esi,%eax
 639:	e8 6d ff ff ff       	call   5ab <putc>
  while(--i >= 0)
 63e:	83 eb 01             	sub    $0x1,%ebx
 641:	79 ef                	jns    632 <printint+0x6d>
}
 643:	83 c4 2c             	add    $0x2c,%esp
 646:	5b                   	pop    %ebx
 647:	5e                   	pop    %esi
 648:	5f                   	pop    %edi
 649:	5d                   	pop    %ebp
 64a:	c3                   	ret    
 64b:	8b 75 d0             	mov    -0x30(%ebp),%esi
 64e:	eb ee                	jmp    63e <printint+0x79>

00000650 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 650:	55                   	push   %ebp
 651:	89 e5                	mov    %esp,%ebp
 653:	57                   	push   %edi
 654:	56                   	push   %esi
 655:	53                   	push   %ebx
 656:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 659:	8d 45 10             	lea    0x10(%ebp),%eax
 65c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 65f:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 664:	bb 00 00 00 00       	mov    $0x0,%ebx
 669:	eb 14                	jmp    67f <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 66b:	89 fa                	mov    %edi,%edx
 66d:	8b 45 08             	mov    0x8(%ebp),%eax
 670:	e8 36 ff ff ff       	call   5ab <putc>
 675:	eb 05                	jmp    67c <printf+0x2c>
      }
    } else if(state == '%'){
 677:	83 fe 25             	cmp    $0x25,%esi
 67a:	74 25                	je     6a1 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 67c:	83 c3 01             	add    $0x1,%ebx
 67f:	8b 45 0c             	mov    0xc(%ebp),%eax
 682:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 686:	84 c0                	test   %al,%al
 688:	0f 84 20 01 00 00    	je     7ae <printf+0x15e>
    c = fmt[i] & 0xff;
 68e:	0f be f8             	movsbl %al,%edi
 691:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 694:	85 f6                	test   %esi,%esi
 696:	75 df                	jne    677 <printf+0x27>
      if(c == '%'){
 698:	83 f8 25             	cmp    $0x25,%eax
 69b:	75 ce                	jne    66b <printf+0x1b>
        state = '%';
 69d:	89 c6                	mov    %eax,%esi
 69f:	eb db                	jmp    67c <printf+0x2c>
      if(c == 'd'){
 6a1:	83 f8 25             	cmp    $0x25,%eax
 6a4:	0f 84 cf 00 00 00    	je     779 <printf+0x129>
 6aa:	0f 8c dd 00 00 00    	jl     78d <printf+0x13d>
 6b0:	83 f8 78             	cmp    $0x78,%eax
 6b3:	0f 8f d4 00 00 00    	jg     78d <printf+0x13d>
 6b9:	83 f8 63             	cmp    $0x63,%eax
 6bc:	0f 8c cb 00 00 00    	jl     78d <printf+0x13d>
 6c2:	83 e8 63             	sub    $0x63,%eax
 6c5:	83 f8 15             	cmp    $0x15,%eax
 6c8:	0f 87 bf 00 00 00    	ja     78d <printf+0x13d>
 6ce:	ff 24 85 9c 09 00 00 	jmp    *0x99c(,%eax,4)
        printint(fd, *ap, 10, 1);
 6d5:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6d8:	8b 17                	mov    (%edi),%edx
 6da:	83 ec 0c             	sub    $0xc,%esp
 6dd:	6a 01                	push   $0x1
 6df:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6e4:	8b 45 08             	mov    0x8(%ebp),%eax
 6e7:	e8 d9 fe ff ff       	call   5c5 <printint>
        ap++;
 6ec:	83 c7 04             	add    $0x4,%edi
 6ef:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 6f2:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 6f5:	be 00 00 00 00       	mov    $0x0,%esi
 6fa:	eb 80                	jmp    67c <printf+0x2c>
        printint(fd, *ap, 16, 0);
 6fc:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6ff:	8b 17                	mov    (%edi),%edx
 701:	83 ec 0c             	sub    $0xc,%esp
 704:	6a 00                	push   $0x0
 706:	b9 10 00 00 00       	mov    $0x10,%ecx
 70b:	8b 45 08             	mov    0x8(%ebp),%eax
 70e:	e8 b2 fe ff ff       	call   5c5 <printint>
        ap++;
 713:	83 c7 04             	add    $0x4,%edi
 716:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 719:	83 c4 10             	add    $0x10,%esp
      state = 0;
 71c:	be 00 00 00 00       	mov    $0x0,%esi
 721:	e9 56 ff ff ff       	jmp    67c <printf+0x2c>
        s = (char*)*ap;
 726:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 729:	8b 30                	mov    (%eax),%esi
        ap++;
 72b:	83 c0 04             	add    $0x4,%eax
 72e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 731:	85 f6                	test   %esi,%esi
 733:	75 15                	jne    74a <printf+0xfa>
          s = "(null)";
 735:	be 94 09 00 00       	mov    $0x994,%esi
 73a:	eb 0e                	jmp    74a <printf+0xfa>
          putc(fd, *s);
 73c:	0f be d2             	movsbl %dl,%edx
 73f:	8b 45 08             	mov    0x8(%ebp),%eax
 742:	e8 64 fe ff ff       	call   5ab <putc>
          s++;
 747:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 74a:	0f b6 16             	movzbl (%esi),%edx
 74d:	84 d2                	test   %dl,%dl
 74f:	75 eb                	jne    73c <printf+0xec>
      state = 0;
 751:	be 00 00 00 00       	mov    $0x0,%esi
 756:	e9 21 ff ff ff       	jmp    67c <printf+0x2c>
        putc(fd, *ap);
 75b:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 75e:	0f be 17             	movsbl (%edi),%edx
 761:	8b 45 08             	mov    0x8(%ebp),%eax
 764:	e8 42 fe ff ff       	call   5ab <putc>
        ap++;
 769:	83 c7 04             	add    $0x4,%edi
 76c:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 76f:	be 00 00 00 00       	mov    $0x0,%esi
 774:	e9 03 ff ff ff       	jmp    67c <printf+0x2c>
        putc(fd, c);
 779:	89 fa                	mov    %edi,%edx
 77b:	8b 45 08             	mov    0x8(%ebp),%eax
 77e:	e8 28 fe ff ff       	call   5ab <putc>
      state = 0;
 783:	be 00 00 00 00       	mov    $0x0,%esi
 788:	e9 ef fe ff ff       	jmp    67c <printf+0x2c>
        putc(fd, '%');
 78d:	ba 25 00 00 00       	mov    $0x25,%edx
 792:	8b 45 08             	mov    0x8(%ebp),%eax
 795:	e8 11 fe ff ff       	call   5ab <putc>
        putc(fd, c);
 79a:	89 fa                	mov    %edi,%edx
 79c:	8b 45 08             	mov    0x8(%ebp),%eax
 79f:	e8 07 fe ff ff       	call   5ab <putc>
      state = 0;
 7a4:	be 00 00 00 00       	mov    $0x0,%esi
 7a9:	e9 ce fe ff ff       	jmp    67c <printf+0x2c>
    }
  }
}
 7ae:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7b1:	5b                   	pop    %ebx
 7b2:	5e                   	pop    %esi
 7b3:	5f                   	pop    %edi
 7b4:	5d                   	pop    %ebp
 7b5:	c3                   	ret    

000007b6 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7b6:	55                   	push   %ebp
 7b7:	89 e5                	mov    %esp,%ebp
 7b9:	57                   	push   %edi
 7ba:	56                   	push   %esi
 7bb:	53                   	push   %ebx
 7bc:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7bf:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7c2:	a1 c0 0e 00 00       	mov    0xec0,%eax
 7c7:	eb 02                	jmp    7cb <free+0x15>
 7c9:	89 d0                	mov    %edx,%eax
 7cb:	39 c8                	cmp    %ecx,%eax
 7cd:	73 04                	jae    7d3 <free+0x1d>
 7cf:	39 08                	cmp    %ecx,(%eax)
 7d1:	77 12                	ja     7e5 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7d3:	8b 10                	mov    (%eax),%edx
 7d5:	39 c2                	cmp    %eax,%edx
 7d7:	77 f0                	ja     7c9 <free+0x13>
 7d9:	39 c8                	cmp    %ecx,%eax
 7db:	72 08                	jb     7e5 <free+0x2f>
 7dd:	39 ca                	cmp    %ecx,%edx
 7df:	77 04                	ja     7e5 <free+0x2f>
 7e1:	89 d0                	mov    %edx,%eax
 7e3:	eb e6                	jmp    7cb <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7e5:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7e8:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7eb:	8b 10                	mov    (%eax),%edx
 7ed:	39 d7                	cmp    %edx,%edi
 7ef:	74 19                	je     80a <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 7f1:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7f4:	8b 50 04             	mov    0x4(%eax),%edx
 7f7:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7fa:	39 ce                	cmp    %ecx,%esi
 7fc:	74 1b                	je     819 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 7fe:	89 08                	mov    %ecx,(%eax)
  freep = p;
 800:	a3 c0 0e 00 00       	mov    %eax,0xec0
}
 805:	5b                   	pop    %ebx
 806:	5e                   	pop    %esi
 807:	5f                   	pop    %edi
 808:	5d                   	pop    %ebp
 809:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 80a:	03 72 04             	add    0x4(%edx),%esi
 80d:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 810:	8b 10                	mov    (%eax),%edx
 812:	8b 12                	mov    (%edx),%edx
 814:	89 53 f8             	mov    %edx,-0x8(%ebx)
 817:	eb db                	jmp    7f4 <free+0x3e>
    p->s.size += bp->s.size;
 819:	03 53 fc             	add    -0x4(%ebx),%edx
 81c:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 81f:	8b 53 f8             	mov    -0x8(%ebx),%edx
 822:	89 10                	mov    %edx,(%eax)
 824:	eb da                	jmp    800 <free+0x4a>

00000826 <morecore>:

static Header*
morecore(uint nu)
{
 826:	55                   	push   %ebp
 827:	89 e5                	mov    %esp,%ebp
 829:	53                   	push   %ebx
 82a:	83 ec 04             	sub    $0x4,%esp
 82d:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 82f:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 834:	77 05                	ja     83b <morecore+0x15>
    nu = 4096;
 836:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 83b:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 842:	83 ec 0c             	sub    $0xc,%esp
 845:	50                   	push   %eax
 846:	e8 38 fd ff ff       	call   583 <sbrk>
  if(p == (char*)-1)
 84b:	83 c4 10             	add    $0x10,%esp
 84e:	83 f8 ff             	cmp    $0xffffffff,%eax
 851:	74 1c                	je     86f <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 853:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 856:	83 c0 08             	add    $0x8,%eax
 859:	83 ec 0c             	sub    $0xc,%esp
 85c:	50                   	push   %eax
 85d:	e8 54 ff ff ff       	call   7b6 <free>
  return freep;
 862:	a1 c0 0e 00 00       	mov    0xec0,%eax
 867:	83 c4 10             	add    $0x10,%esp
}
 86a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 86d:	c9                   	leave  
 86e:	c3                   	ret    
    return 0;
 86f:	b8 00 00 00 00       	mov    $0x0,%eax
 874:	eb f4                	jmp    86a <morecore+0x44>

00000876 <malloc>:

void*
malloc(uint nbytes)
{
 876:	55                   	push   %ebp
 877:	89 e5                	mov    %esp,%ebp
 879:	53                   	push   %ebx
 87a:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 87d:	8b 45 08             	mov    0x8(%ebp),%eax
 880:	8d 58 07             	lea    0x7(%eax),%ebx
 883:	c1 eb 03             	shr    $0x3,%ebx
 886:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 889:	8b 0d c0 0e 00 00    	mov    0xec0,%ecx
 88f:	85 c9                	test   %ecx,%ecx
 891:	74 04                	je     897 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 893:	8b 01                	mov    (%ecx),%eax
 895:	eb 4a                	jmp    8e1 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 897:	c7 05 c0 0e 00 00 c4 	movl   $0xec4,0xec0
 89e:	0e 00 00 
 8a1:	c7 05 c4 0e 00 00 c4 	movl   $0xec4,0xec4
 8a8:	0e 00 00 
    base.s.size = 0;
 8ab:	c7 05 c8 0e 00 00 00 	movl   $0x0,0xec8
 8b2:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 8b5:	b9 c4 0e 00 00       	mov    $0xec4,%ecx
 8ba:	eb d7                	jmp    893 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 8bc:	74 19                	je     8d7 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 8be:	29 da                	sub    %ebx,%edx
 8c0:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8c3:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 8c6:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 8c9:	89 0d c0 0e 00 00    	mov    %ecx,0xec0
      return (void*)(p + 1);
 8cf:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 8d2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8d5:	c9                   	leave  
 8d6:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 8d7:	8b 10                	mov    (%eax),%edx
 8d9:	89 11                	mov    %edx,(%ecx)
 8db:	eb ec                	jmp    8c9 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8dd:	89 c1                	mov    %eax,%ecx
 8df:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 8e1:	8b 50 04             	mov    0x4(%eax),%edx
 8e4:	39 da                	cmp    %ebx,%edx
 8e6:	73 d4                	jae    8bc <malloc+0x46>
    if(p == freep)
 8e8:	39 05 c0 0e 00 00    	cmp    %eax,0xec0
 8ee:	75 ed                	jne    8dd <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 8f0:	89 d8                	mov    %ebx,%eax
 8f2:	e8 2f ff ff ff       	call   826 <morecore>
 8f7:	85 c0                	test   %eax,%eax
 8f9:	75 e2                	jne    8dd <malloc+0x67>
 8fb:	eb d5                	jmp    8d2 <malloc+0x5c>
