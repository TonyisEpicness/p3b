
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
  18:	a1 fc 0c 00 00       	mov    0xcfc,%eax
  1d:	83 f8 01             	cmp    $0x1,%eax
  20:	0f 85 9c 00 00 00    	jne    c2 <worker+0xc2>
   global++;
  26:	83 c0 01             	add    $0x1,%eax
  29:	a3 fc 0c 00 00       	mov    %eax,0xcfc
   // no exit() in thread
}
  2e:	c9                   	leave  
  2f:	c3                   	ret    
   assert(tmp1 == 42);
  30:	6a 2c                	push   $0x2c
  32:	68 84 08 00 00       	push   $0x884
  37:	68 8e 08 00 00       	push   $0x88e
  3c:	6a 01                	push   $0x1
  3e:	e8 94 05 00 00       	call   5d7 <printf>
  43:	83 c4 0c             	add    $0xc,%esp
  46:	68 96 08 00 00       	push   $0x896
  4b:	68 a1 08 00 00       	push   $0x8a1
  50:	6a 01                	push   $0x1
  52:	e8 80 05 00 00       	call   5d7 <printf>
  57:	83 c4 08             	add    $0x8,%esp
  5a:	68 b5 08 00 00       	push   $0x8b5
  5f:	6a 01                	push   $0x1
  61:	e8 71 05 00 00       	call   5d7 <printf>
  66:	83 c4 04             	add    $0x4,%esp
  69:	ff 35 00 0d 00 00    	push   0xd00
  6f:	e8 3e 04 00 00       	call   4b2 <kill>
  74:	e8 09 04 00 00       	call   482 <exit>
   assert(tmp2 == 24);
  79:	6a 2d                	push   $0x2d
  7b:	68 84 08 00 00       	push   $0x884
  80:	68 8e 08 00 00       	push   $0x88e
  85:	6a 01                	push   $0x1
  87:	e8 4b 05 00 00       	call   5d7 <printf>
  8c:	83 c4 0c             	add    $0xc,%esp
  8f:	68 c2 08 00 00       	push   $0x8c2
  94:	68 a1 08 00 00       	push   $0x8a1
  99:	6a 01                	push   $0x1
  9b:	e8 37 05 00 00       	call   5d7 <printf>
  a0:	83 c4 08             	add    $0x8,%esp
  a3:	68 b5 08 00 00       	push   $0x8b5
  a8:	6a 01                	push   $0x1
  aa:	e8 28 05 00 00       	call   5d7 <printf>
  af:	83 c4 04             	add    $0x4,%esp
  b2:	ff 35 00 0d 00 00    	push   0xd00
  b8:	e8 f5 03 00 00       	call   4b2 <kill>
  bd:	e8 c0 03 00 00       	call   482 <exit>
   assert(global == 1);
  c2:	6a 2e                	push   $0x2e
  c4:	68 84 08 00 00       	push   $0x884
  c9:	68 8e 08 00 00       	push   $0x88e
  ce:	6a 01                	push   $0x1
  d0:	e8 02 05 00 00       	call   5d7 <printf>
  d5:	83 c4 0c             	add    $0xc,%esp
  d8:	68 cd 08 00 00       	push   $0x8cd
  dd:	68 a1 08 00 00       	push   $0x8a1
  e2:	6a 01                	push   $0x1
  e4:	e8 ee 04 00 00       	call   5d7 <printf>
  e9:	83 c4 08             	add    $0x8,%esp
  ec:	68 b5 08 00 00       	push   $0x8b5
  f1:	6a 01                	push   $0x1
  f3:	e8 df 04 00 00       	call   5d7 <printf>
  f8:	83 c4 04             	add    $0x4,%esp
  fb:	ff 35 00 0d 00 00    	push   0xd00
 101:	e8 ac 03 00 00       	call   4b2 <kill>
 106:	e8 77 03 00 00       	call   482 <exit>

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
 11d:	e8 e0 03 00 00       	call   502 <getpid>
 122:	a3 00 0d 00 00       	mov    %eax,0xd00
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
 153:	e8 47 01 00 00       	call   29f <thread_join>
   assert(join_pid == thread_pid);
 158:	39 c3                	cmp    %eax,%ebx
 15a:	0f 85 9f 00 00 00    	jne    1ff <main+0xf4>
   assert(global == 2);
 160:	83 3d fc 0c 00 00 02 	cmpl   $0x2,0xcfc
 167:	0f 84 db 00 00 00    	je     248 <main+0x13d>
 16d:	6a 22                	push   $0x22
 16f:	68 84 08 00 00       	push   $0x884
 174:	68 8e 08 00 00       	push   $0x88e
 179:	6a 01                	push   $0x1
 17b:	e8 57 04 00 00       	call   5d7 <printf>
 180:	83 c4 0c             	add    $0xc,%esp
 183:	68 ff 08 00 00       	push   $0x8ff
 188:	68 a1 08 00 00       	push   $0x8a1
 18d:	6a 01                	push   $0x1
 18f:	e8 43 04 00 00       	call   5d7 <printf>
 194:	83 c4 08             	add    $0x8,%esp
 197:	68 b5 08 00 00       	push   $0x8b5
 19c:	6a 01                	push   $0x1
 19e:	e8 34 04 00 00       	call   5d7 <printf>
 1a3:	83 c4 04             	add    $0x4,%esp
 1a6:	ff 35 00 0d 00 00    	push   0xd00
 1ac:	e8 01 03 00 00       	call   4b2 <kill>
 1b1:	e8 cc 02 00 00       	call   482 <exit>
   assert(thread_pid > 0);
 1b6:	6a 1e                	push   $0x1e
 1b8:	68 84 08 00 00       	push   $0x884
 1bd:	68 8e 08 00 00       	push   $0x88e
 1c2:	6a 01                	push   $0x1
 1c4:	e8 0e 04 00 00       	call   5d7 <printf>
 1c9:	83 c4 0c             	add    $0xc,%esp
 1cc:	68 d9 08 00 00       	push   $0x8d9
 1d1:	68 a1 08 00 00       	push   $0x8a1
 1d6:	6a 01                	push   $0x1
 1d8:	e8 fa 03 00 00       	call   5d7 <printf>
 1dd:	83 c4 08             	add    $0x8,%esp
 1e0:	68 b5 08 00 00       	push   $0x8b5
 1e5:	6a 01                	push   $0x1
 1e7:	e8 eb 03 00 00       	call   5d7 <printf>
 1ec:	83 c4 04             	add    $0x4,%esp
 1ef:	ff 35 00 0d 00 00    	push   0xd00
 1f5:	e8 b8 02 00 00       	call   4b2 <kill>
 1fa:	e8 83 02 00 00       	call   482 <exit>
   assert(join_pid == thread_pid);
 1ff:	6a 21                	push   $0x21
 201:	68 84 08 00 00       	push   $0x884
 206:	68 8e 08 00 00       	push   $0x88e
 20b:	6a 01                	push   $0x1
 20d:	e8 c5 03 00 00       	call   5d7 <printf>
 212:	83 c4 0c             	add    $0xc,%esp
 215:	68 e8 08 00 00       	push   $0x8e8
 21a:	68 a1 08 00 00       	push   $0x8a1
 21f:	6a 01                	push   $0x1
 221:	e8 b1 03 00 00       	call   5d7 <printf>
 226:	83 c4 08             	add    $0x8,%esp
 229:	68 b5 08 00 00       	push   $0x8b5
 22e:	6a 01                	push   $0x1
 230:	e8 a2 03 00 00       	call   5d7 <printf>
 235:	83 c4 04             	add    $0x4,%esp
 238:	ff 35 00 0d 00 00    	push   0xd00
 23e:	e8 6f 02 00 00       	call   4b2 <kill>
 243:	e8 3a 02 00 00       	call   482 <exit>
   printf(1, "TEST PASSED\n");
 248:	83 ec 08             	sub    $0x8,%esp
 24b:	68 0b 09 00 00       	push   $0x90b
 250:	6a 01                	push   $0x1
 252:	e8 80 03 00 00       	call   5d7 <printf>
   exit();
 257:	e8 26 02 00 00       	call   482 <exit>

0000025c <test_and_set>:
#include "fcntl.h"
#include "user.h"
#include "x86.h"
#include "mmu.h"

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
  void *n_stack = malloc(PGSIZE);
 273:	68 00 10 00 00       	push   $0x1000
 278:	e8 80 05 00 00       	call   7fd <malloc>
  if(n_stack == 0){
 27d:	83 c4 10             	add    $0x10,%esp
 280:	85 c0                	test   %eax,%eax
 282:	74 14                	je     298 <thread_create+0x2b>
    return -1;
  }
  int new_pid = clone(start_routine, arg1, arg2, n_stack); // TODO: is this the right way to call it?
 284:	50                   	push   %eax
 285:	ff 75 10             	push   0x10(%ebp)
 288:	ff 75 0c             	push   0xc(%ebp)
 28b:	ff 75 08             	push   0x8(%ebp)
 28e:	e8 8f 02 00 00       	call   522 <clone>


  // I can't remember if there was something else to do here but I'm sure I'll find out


  return new_pid;
 293:	83 c4 10             	add    $0x10,%esp
}
 296:	c9                   	leave  
 297:	c3                   	ret    
    return -1;
 298:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 29d:	eb f7                	jmp    296 <thread_create+0x29>

0000029f <thread_join>:

int thread_join() {
  return 0;
}
 29f:	b8 00 00 00 00       	mov    $0x0,%eax
 2a4:	c3                   	ret    

000002a5 <lock_acquire>:

void lock_acquire(lock_t *lock){
 2a5:	55                   	push   %ebp
 2a6:	89 e5                	mov    %esp,%ebp
 2a8:	53                   	push   %ebx
 2a9:	83 ec 04             	sub    $0x4,%esp
 2ac:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 2af:	83 ec 08             	sub    $0x8,%esp
 2b2:	6a 01                	push   $0x1
 2b4:	53                   	push   %ebx
 2b5:	e8 a2 ff ff ff       	call   25c <test_and_set>
 2ba:	83 c4 10             	add    $0x10,%esp
 2bd:	83 f8 01             	cmp    $0x1,%eax
 2c0:	74 ed                	je     2af <lock_acquire+0xa>
    ;
}
 2c2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2c5:	c9                   	leave  
 2c6:	c3                   	ret    

000002c7 <lock_release>:

void lock_release(lock_t *lock) {
 2c7:	55                   	push   %ebp
 2c8:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 2ca:	8b 45 08             	mov    0x8(%ebp),%eax
 2cd:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 2d3:	5d                   	pop    %ebp
 2d4:	c3                   	ret    

000002d5 <lock_init>:

void lock_init(lock_t *lock) {
 2d5:	55                   	push   %ebp
 2d6:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 2d8:	8b 45 08             	mov    0x8(%ebp),%eax
 2db:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 2e1:	5d                   	pop    %ebp
 2e2:	c3                   	ret    

000002e3 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 2e3:	55                   	push   %ebp
 2e4:	89 e5                	mov    %esp,%ebp
 2e6:	56                   	push   %esi
 2e7:	53                   	push   %ebx
 2e8:	8b 75 08             	mov    0x8(%ebp),%esi
 2eb:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 2ee:	89 f0                	mov    %esi,%eax
 2f0:	89 d1                	mov    %edx,%ecx
 2f2:	83 c2 01             	add    $0x1,%edx
 2f5:	89 c3                	mov    %eax,%ebx
 2f7:	83 c0 01             	add    $0x1,%eax
 2fa:	0f b6 09             	movzbl (%ecx),%ecx
 2fd:	88 0b                	mov    %cl,(%ebx)
 2ff:	84 c9                	test   %cl,%cl
 301:	75 ed                	jne    2f0 <strcpy+0xd>
    ;
  return os;
}
 303:	89 f0                	mov    %esi,%eax
 305:	5b                   	pop    %ebx
 306:	5e                   	pop    %esi
 307:	5d                   	pop    %ebp
 308:	c3                   	ret    

00000309 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 309:	55                   	push   %ebp
 30a:	89 e5                	mov    %esp,%ebp
 30c:	8b 4d 08             	mov    0x8(%ebp),%ecx
 30f:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 312:	eb 06                	jmp    31a <strcmp+0x11>
    p++, q++;
 314:	83 c1 01             	add    $0x1,%ecx
 317:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 31a:	0f b6 01             	movzbl (%ecx),%eax
 31d:	84 c0                	test   %al,%al
 31f:	74 04                	je     325 <strcmp+0x1c>
 321:	3a 02                	cmp    (%edx),%al
 323:	74 ef                	je     314 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 325:	0f b6 c0             	movzbl %al,%eax
 328:	0f b6 12             	movzbl (%edx),%edx
 32b:	29 d0                	sub    %edx,%eax
}
 32d:	5d                   	pop    %ebp
 32e:	c3                   	ret    

0000032f <strlen>:

uint
strlen(const char *s)
{
 32f:	55                   	push   %ebp
 330:	89 e5                	mov    %esp,%ebp
 332:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 335:	b8 00 00 00 00       	mov    $0x0,%eax
 33a:	eb 03                	jmp    33f <strlen+0x10>
 33c:	83 c0 01             	add    $0x1,%eax
 33f:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 343:	75 f7                	jne    33c <strlen+0xd>
    ;
  return n;
}
 345:	5d                   	pop    %ebp
 346:	c3                   	ret    

00000347 <memset>:

void*
memset(void *dst, int c, uint n)
{
 347:	55                   	push   %ebp
 348:	89 e5                	mov    %esp,%ebp
 34a:	57                   	push   %edi
 34b:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 34e:	89 d7                	mov    %edx,%edi
 350:	8b 4d 10             	mov    0x10(%ebp),%ecx
 353:	8b 45 0c             	mov    0xc(%ebp),%eax
 356:	fc                   	cld    
 357:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 359:	89 d0                	mov    %edx,%eax
 35b:	8b 7d fc             	mov    -0x4(%ebp),%edi
 35e:	c9                   	leave  
 35f:	c3                   	ret    

00000360 <strchr>:

char*
strchr(const char *s, char c)
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	8b 45 08             	mov    0x8(%ebp),%eax
 366:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 36a:	eb 03                	jmp    36f <strchr+0xf>
 36c:	83 c0 01             	add    $0x1,%eax
 36f:	0f b6 10             	movzbl (%eax),%edx
 372:	84 d2                	test   %dl,%dl
 374:	74 06                	je     37c <strchr+0x1c>
    if(*s == c)
 376:	38 ca                	cmp    %cl,%dl
 378:	75 f2                	jne    36c <strchr+0xc>
 37a:	eb 05                	jmp    381 <strchr+0x21>
      return (char*)s;
  return 0;
 37c:	b8 00 00 00 00       	mov    $0x0,%eax
}
 381:	5d                   	pop    %ebp
 382:	c3                   	ret    

00000383 <gets>:

char*
gets(char *buf, int max)
{
 383:	55                   	push   %ebp
 384:	89 e5                	mov    %esp,%ebp
 386:	57                   	push   %edi
 387:	56                   	push   %esi
 388:	53                   	push   %ebx
 389:	83 ec 1c             	sub    $0x1c,%esp
 38c:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 38f:	bb 00 00 00 00       	mov    $0x0,%ebx
 394:	89 de                	mov    %ebx,%esi
 396:	83 c3 01             	add    $0x1,%ebx
 399:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 39c:	7d 2e                	jge    3cc <gets+0x49>
    cc = read(0, &c, 1);
 39e:	83 ec 04             	sub    $0x4,%esp
 3a1:	6a 01                	push   $0x1
 3a3:	8d 45 e7             	lea    -0x19(%ebp),%eax
 3a6:	50                   	push   %eax
 3a7:	6a 00                	push   $0x0
 3a9:	e8 ec 00 00 00       	call   49a <read>
    if(cc < 1)
 3ae:	83 c4 10             	add    $0x10,%esp
 3b1:	85 c0                	test   %eax,%eax
 3b3:	7e 17                	jle    3cc <gets+0x49>
      break;
    buf[i++] = c;
 3b5:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 3b9:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 3bc:	3c 0a                	cmp    $0xa,%al
 3be:	0f 94 c2             	sete   %dl
 3c1:	3c 0d                	cmp    $0xd,%al
 3c3:	0f 94 c0             	sete   %al
 3c6:	08 c2                	or     %al,%dl
 3c8:	74 ca                	je     394 <gets+0x11>
    buf[i++] = c;
 3ca:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 3cc:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 3d0:	89 f8                	mov    %edi,%eax
 3d2:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3d5:	5b                   	pop    %ebx
 3d6:	5e                   	pop    %esi
 3d7:	5f                   	pop    %edi
 3d8:	5d                   	pop    %ebp
 3d9:	c3                   	ret    

000003da <stat>:

int
stat(const char *n, struct stat *st)
{
 3da:	55                   	push   %ebp
 3db:	89 e5                	mov    %esp,%ebp
 3dd:	56                   	push   %esi
 3de:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 3df:	83 ec 08             	sub    $0x8,%esp
 3e2:	6a 00                	push   $0x0
 3e4:	ff 75 08             	push   0x8(%ebp)
 3e7:	e8 d6 00 00 00       	call   4c2 <open>
  if(fd < 0)
 3ec:	83 c4 10             	add    $0x10,%esp
 3ef:	85 c0                	test   %eax,%eax
 3f1:	78 24                	js     417 <stat+0x3d>
 3f3:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 3f5:	83 ec 08             	sub    $0x8,%esp
 3f8:	ff 75 0c             	push   0xc(%ebp)
 3fb:	50                   	push   %eax
 3fc:	e8 d9 00 00 00       	call   4da <fstat>
 401:	89 c6                	mov    %eax,%esi
  close(fd);
 403:	89 1c 24             	mov    %ebx,(%esp)
 406:	e8 9f 00 00 00       	call   4aa <close>
  return r;
 40b:	83 c4 10             	add    $0x10,%esp
}
 40e:	89 f0                	mov    %esi,%eax
 410:	8d 65 f8             	lea    -0x8(%ebp),%esp
 413:	5b                   	pop    %ebx
 414:	5e                   	pop    %esi
 415:	5d                   	pop    %ebp
 416:	c3                   	ret    
    return -1;
 417:	be ff ff ff ff       	mov    $0xffffffff,%esi
 41c:	eb f0                	jmp    40e <stat+0x34>

0000041e <atoi>:

int
atoi(const char *s)
{
 41e:	55                   	push   %ebp
 41f:	89 e5                	mov    %esp,%ebp
 421:	53                   	push   %ebx
 422:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 425:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 42a:	eb 10                	jmp    43c <atoi+0x1e>
    n = n*10 + *s++ - '0';
 42c:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 42f:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 432:	83 c1 01             	add    $0x1,%ecx
 435:	0f be c0             	movsbl %al,%eax
 438:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 43c:	0f b6 01             	movzbl (%ecx),%eax
 43f:	8d 58 d0             	lea    -0x30(%eax),%ebx
 442:	80 fb 09             	cmp    $0x9,%bl
 445:	76 e5                	jbe    42c <atoi+0xe>
  return n;
}
 447:	89 d0                	mov    %edx,%eax
 449:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 44c:	c9                   	leave  
 44d:	c3                   	ret    

0000044e <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 44e:	55                   	push   %ebp
 44f:	89 e5                	mov    %esp,%ebp
 451:	56                   	push   %esi
 452:	53                   	push   %ebx
 453:	8b 75 08             	mov    0x8(%ebp),%esi
 456:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 459:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 45c:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 45e:	eb 0d                	jmp    46d <memmove+0x1f>
    *dst++ = *src++;
 460:	0f b6 01             	movzbl (%ecx),%eax
 463:	88 02                	mov    %al,(%edx)
 465:	8d 49 01             	lea    0x1(%ecx),%ecx
 468:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 46b:	89 d8                	mov    %ebx,%eax
 46d:	8d 58 ff             	lea    -0x1(%eax),%ebx
 470:	85 c0                	test   %eax,%eax
 472:	7f ec                	jg     460 <memmove+0x12>
  return vdst;
}
 474:	89 f0                	mov    %esi,%eax
 476:	5b                   	pop    %ebx
 477:	5e                   	pop    %esi
 478:	5d                   	pop    %ebp
 479:	c3                   	ret    

0000047a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 47a:	b8 01 00 00 00       	mov    $0x1,%eax
 47f:	cd 40                	int    $0x40
 481:	c3                   	ret    

00000482 <exit>:
SYSCALL(exit)
 482:	b8 02 00 00 00       	mov    $0x2,%eax
 487:	cd 40                	int    $0x40
 489:	c3                   	ret    

0000048a <wait>:
SYSCALL(wait)
 48a:	b8 03 00 00 00       	mov    $0x3,%eax
 48f:	cd 40                	int    $0x40
 491:	c3                   	ret    

00000492 <pipe>:
SYSCALL(pipe)
 492:	b8 04 00 00 00       	mov    $0x4,%eax
 497:	cd 40                	int    $0x40
 499:	c3                   	ret    

0000049a <read>:
SYSCALL(read)
 49a:	b8 05 00 00 00       	mov    $0x5,%eax
 49f:	cd 40                	int    $0x40
 4a1:	c3                   	ret    

000004a2 <write>:
SYSCALL(write)
 4a2:	b8 10 00 00 00       	mov    $0x10,%eax
 4a7:	cd 40                	int    $0x40
 4a9:	c3                   	ret    

000004aa <close>:
SYSCALL(close)
 4aa:	b8 15 00 00 00       	mov    $0x15,%eax
 4af:	cd 40                	int    $0x40
 4b1:	c3                   	ret    

000004b2 <kill>:
SYSCALL(kill)
 4b2:	b8 06 00 00 00       	mov    $0x6,%eax
 4b7:	cd 40                	int    $0x40
 4b9:	c3                   	ret    

000004ba <exec>:
SYSCALL(exec)
 4ba:	b8 07 00 00 00       	mov    $0x7,%eax
 4bf:	cd 40                	int    $0x40
 4c1:	c3                   	ret    

000004c2 <open>:
SYSCALL(open)
 4c2:	b8 0f 00 00 00       	mov    $0xf,%eax
 4c7:	cd 40                	int    $0x40
 4c9:	c3                   	ret    

000004ca <mknod>:
SYSCALL(mknod)
 4ca:	b8 11 00 00 00       	mov    $0x11,%eax
 4cf:	cd 40                	int    $0x40
 4d1:	c3                   	ret    

000004d2 <unlink>:
SYSCALL(unlink)
 4d2:	b8 12 00 00 00       	mov    $0x12,%eax
 4d7:	cd 40                	int    $0x40
 4d9:	c3                   	ret    

000004da <fstat>:
SYSCALL(fstat)
 4da:	b8 08 00 00 00       	mov    $0x8,%eax
 4df:	cd 40                	int    $0x40
 4e1:	c3                   	ret    

000004e2 <link>:
SYSCALL(link)
 4e2:	b8 13 00 00 00       	mov    $0x13,%eax
 4e7:	cd 40                	int    $0x40
 4e9:	c3                   	ret    

000004ea <mkdir>:
SYSCALL(mkdir)
 4ea:	b8 14 00 00 00       	mov    $0x14,%eax
 4ef:	cd 40                	int    $0x40
 4f1:	c3                   	ret    

000004f2 <chdir>:
SYSCALL(chdir)
 4f2:	b8 09 00 00 00       	mov    $0x9,%eax
 4f7:	cd 40                	int    $0x40
 4f9:	c3                   	ret    

000004fa <dup>:
SYSCALL(dup)
 4fa:	b8 0a 00 00 00       	mov    $0xa,%eax
 4ff:	cd 40                	int    $0x40
 501:	c3                   	ret    

00000502 <getpid>:
SYSCALL(getpid)
 502:	b8 0b 00 00 00       	mov    $0xb,%eax
 507:	cd 40                	int    $0x40
 509:	c3                   	ret    

0000050a <sbrk>:
SYSCALL(sbrk)
 50a:	b8 0c 00 00 00       	mov    $0xc,%eax
 50f:	cd 40                	int    $0x40
 511:	c3                   	ret    

00000512 <sleep>:
SYSCALL(sleep)
 512:	b8 0d 00 00 00       	mov    $0xd,%eax
 517:	cd 40                	int    $0x40
 519:	c3                   	ret    

0000051a <uptime>:
SYSCALL(uptime)
 51a:	b8 0e 00 00 00       	mov    $0xe,%eax
 51f:	cd 40                	int    $0x40
 521:	c3                   	ret    

00000522 <clone>:
SYSCALL(clone)
 522:	b8 16 00 00 00       	mov    $0x16,%eax
 527:	cd 40                	int    $0x40
 529:	c3                   	ret    

0000052a <join>:
 52a:	b8 17 00 00 00       	mov    $0x17,%eax
 52f:	cd 40                	int    $0x40
 531:	c3                   	ret    

00000532 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 532:	55                   	push   %ebp
 533:	89 e5                	mov    %esp,%ebp
 535:	83 ec 1c             	sub    $0x1c,%esp
 538:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 53b:	6a 01                	push   $0x1
 53d:	8d 55 f4             	lea    -0xc(%ebp),%edx
 540:	52                   	push   %edx
 541:	50                   	push   %eax
 542:	e8 5b ff ff ff       	call   4a2 <write>
}
 547:	83 c4 10             	add    $0x10,%esp
 54a:	c9                   	leave  
 54b:	c3                   	ret    

0000054c <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 54c:	55                   	push   %ebp
 54d:	89 e5                	mov    %esp,%ebp
 54f:	57                   	push   %edi
 550:	56                   	push   %esi
 551:	53                   	push   %ebx
 552:	83 ec 2c             	sub    $0x2c,%esp
 555:	89 45 d0             	mov    %eax,-0x30(%ebp)
 558:	89 d0                	mov    %edx,%eax
 55a:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 55c:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 560:	0f 95 c1             	setne  %cl
 563:	c1 ea 1f             	shr    $0x1f,%edx
 566:	84 d1                	test   %dl,%cl
 568:	74 44                	je     5ae <printint+0x62>
    neg = 1;
    x = -xx;
 56a:	f7 d8                	neg    %eax
 56c:	89 c1                	mov    %eax,%ecx
    neg = 1;
 56e:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 575:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 57a:	89 c8                	mov    %ecx,%eax
 57c:	ba 00 00 00 00       	mov    $0x0,%edx
 581:	f7 f6                	div    %esi
 583:	89 df                	mov    %ebx,%edi
 585:	83 c3 01             	add    $0x1,%ebx
 588:	0f b6 92 78 09 00 00 	movzbl 0x978(%edx),%edx
 58f:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 593:	89 ca                	mov    %ecx,%edx
 595:	89 c1                	mov    %eax,%ecx
 597:	39 d6                	cmp    %edx,%esi
 599:	76 df                	jbe    57a <printint+0x2e>
  if(neg)
 59b:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 59f:	74 31                	je     5d2 <printint+0x86>
    buf[i++] = '-';
 5a1:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 5a6:	8d 5f 02             	lea    0x2(%edi),%ebx
 5a9:	8b 75 d0             	mov    -0x30(%ebp),%esi
 5ac:	eb 17                	jmp    5c5 <printint+0x79>
    x = xx;
 5ae:	89 c1                	mov    %eax,%ecx
  neg = 0;
 5b0:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 5b7:	eb bc                	jmp    575 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 5b9:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 5be:	89 f0                	mov    %esi,%eax
 5c0:	e8 6d ff ff ff       	call   532 <putc>
  while(--i >= 0)
 5c5:	83 eb 01             	sub    $0x1,%ebx
 5c8:	79 ef                	jns    5b9 <printint+0x6d>
}
 5ca:	83 c4 2c             	add    $0x2c,%esp
 5cd:	5b                   	pop    %ebx
 5ce:	5e                   	pop    %esi
 5cf:	5f                   	pop    %edi
 5d0:	5d                   	pop    %ebp
 5d1:	c3                   	ret    
 5d2:	8b 75 d0             	mov    -0x30(%ebp),%esi
 5d5:	eb ee                	jmp    5c5 <printint+0x79>

000005d7 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5d7:	55                   	push   %ebp
 5d8:	89 e5                	mov    %esp,%ebp
 5da:	57                   	push   %edi
 5db:	56                   	push   %esi
 5dc:	53                   	push   %ebx
 5dd:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 5e0:	8d 45 10             	lea    0x10(%ebp),%eax
 5e3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 5e6:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 5eb:	bb 00 00 00 00       	mov    $0x0,%ebx
 5f0:	eb 14                	jmp    606 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 5f2:	89 fa                	mov    %edi,%edx
 5f4:	8b 45 08             	mov    0x8(%ebp),%eax
 5f7:	e8 36 ff ff ff       	call   532 <putc>
 5fc:	eb 05                	jmp    603 <printf+0x2c>
      }
    } else if(state == '%'){
 5fe:	83 fe 25             	cmp    $0x25,%esi
 601:	74 25                	je     628 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 603:	83 c3 01             	add    $0x1,%ebx
 606:	8b 45 0c             	mov    0xc(%ebp),%eax
 609:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 60d:	84 c0                	test   %al,%al
 60f:	0f 84 20 01 00 00    	je     735 <printf+0x15e>
    c = fmt[i] & 0xff;
 615:	0f be f8             	movsbl %al,%edi
 618:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 61b:	85 f6                	test   %esi,%esi
 61d:	75 df                	jne    5fe <printf+0x27>
      if(c == '%'){
 61f:	83 f8 25             	cmp    $0x25,%eax
 622:	75 ce                	jne    5f2 <printf+0x1b>
        state = '%';
 624:	89 c6                	mov    %eax,%esi
 626:	eb db                	jmp    603 <printf+0x2c>
      if(c == 'd'){
 628:	83 f8 25             	cmp    $0x25,%eax
 62b:	0f 84 cf 00 00 00    	je     700 <printf+0x129>
 631:	0f 8c dd 00 00 00    	jl     714 <printf+0x13d>
 637:	83 f8 78             	cmp    $0x78,%eax
 63a:	0f 8f d4 00 00 00    	jg     714 <printf+0x13d>
 640:	83 f8 63             	cmp    $0x63,%eax
 643:	0f 8c cb 00 00 00    	jl     714 <printf+0x13d>
 649:	83 e8 63             	sub    $0x63,%eax
 64c:	83 f8 15             	cmp    $0x15,%eax
 64f:	0f 87 bf 00 00 00    	ja     714 <printf+0x13d>
 655:	ff 24 85 20 09 00 00 	jmp    *0x920(,%eax,4)
        printint(fd, *ap, 10, 1);
 65c:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 65f:	8b 17                	mov    (%edi),%edx
 661:	83 ec 0c             	sub    $0xc,%esp
 664:	6a 01                	push   $0x1
 666:	b9 0a 00 00 00       	mov    $0xa,%ecx
 66b:	8b 45 08             	mov    0x8(%ebp),%eax
 66e:	e8 d9 fe ff ff       	call   54c <printint>
        ap++;
 673:	83 c7 04             	add    $0x4,%edi
 676:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 679:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 67c:	be 00 00 00 00       	mov    $0x0,%esi
 681:	eb 80                	jmp    603 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 683:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 686:	8b 17                	mov    (%edi),%edx
 688:	83 ec 0c             	sub    $0xc,%esp
 68b:	6a 00                	push   $0x0
 68d:	b9 10 00 00 00       	mov    $0x10,%ecx
 692:	8b 45 08             	mov    0x8(%ebp),%eax
 695:	e8 b2 fe ff ff       	call   54c <printint>
        ap++;
 69a:	83 c7 04             	add    $0x4,%edi
 69d:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 6a0:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6a3:	be 00 00 00 00       	mov    $0x0,%esi
 6a8:	e9 56 ff ff ff       	jmp    603 <printf+0x2c>
        s = (char*)*ap;
 6ad:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6b0:	8b 30                	mov    (%eax),%esi
        ap++;
 6b2:	83 c0 04             	add    $0x4,%eax
 6b5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 6b8:	85 f6                	test   %esi,%esi
 6ba:	75 15                	jne    6d1 <printf+0xfa>
          s = "(null)";
 6bc:	be 18 09 00 00       	mov    $0x918,%esi
 6c1:	eb 0e                	jmp    6d1 <printf+0xfa>
          putc(fd, *s);
 6c3:	0f be d2             	movsbl %dl,%edx
 6c6:	8b 45 08             	mov    0x8(%ebp),%eax
 6c9:	e8 64 fe ff ff       	call   532 <putc>
          s++;
 6ce:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 6d1:	0f b6 16             	movzbl (%esi),%edx
 6d4:	84 d2                	test   %dl,%dl
 6d6:	75 eb                	jne    6c3 <printf+0xec>
      state = 0;
 6d8:	be 00 00 00 00       	mov    $0x0,%esi
 6dd:	e9 21 ff ff ff       	jmp    603 <printf+0x2c>
        putc(fd, *ap);
 6e2:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6e5:	0f be 17             	movsbl (%edi),%edx
 6e8:	8b 45 08             	mov    0x8(%ebp),%eax
 6eb:	e8 42 fe ff ff       	call   532 <putc>
        ap++;
 6f0:	83 c7 04             	add    $0x4,%edi
 6f3:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 6f6:	be 00 00 00 00       	mov    $0x0,%esi
 6fb:	e9 03 ff ff ff       	jmp    603 <printf+0x2c>
        putc(fd, c);
 700:	89 fa                	mov    %edi,%edx
 702:	8b 45 08             	mov    0x8(%ebp),%eax
 705:	e8 28 fe ff ff       	call   532 <putc>
      state = 0;
 70a:	be 00 00 00 00       	mov    $0x0,%esi
 70f:	e9 ef fe ff ff       	jmp    603 <printf+0x2c>
        putc(fd, '%');
 714:	ba 25 00 00 00       	mov    $0x25,%edx
 719:	8b 45 08             	mov    0x8(%ebp),%eax
 71c:	e8 11 fe ff ff       	call   532 <putc>
        putc(fd, c);
 721:	89 fa                	mov    %edi,%edx
 723:	8b 45 08             	mov    0x8(%ebp),%eax
 726:	e8 07 fe ff ff       	call   532 <putc>
      state = 0;
 72b:	be 00 00 00 00       	mov    $0x0,%esi
 730:	e9 ce fe ff ff       	jmp    603 <printf+0x2c>
    }
  }
}
 735:	8d 65 f4             	lea    -0xc(%ebp),%esp
 738:	5b                   	pop    %ebx
 739:	5e                   	pop    %esi
 73a:	5f                   	pop    %edi
 73b:	5d                   	pop    %ebp
 73c:	c3                   	ret    

0000073d <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 73d:	55                   	push   %ebp
 73e:	89 e5                	mov    %esp,%ebp
 740:	57                   	push   %edi
 741:	56                   	push   %esi
 742:	53                   	push   %ebx
 743:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 746:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 749:	a1 04 0d 00 00       	mov    0xd04,%eax
 74e:	eb 02                	jmp    752 <free+0x15>
 750:	89 d0                	mov    %edx,%eax
 752:	39 c8                	cmp    %ecx,%eax
 754:	73 04                	jae    75a <free+0x1d>
 756:	39 08                	cmp    %ecx,(%eax)
 758:	77 12                	ja     76c <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 75a:	8b 10                	mov    (%eax),%edx
 75c:	39 c2                	cmp    %eax,%edx
 75e:	77 f0                	ja     750 <free+0x13>
 760:	39 c8                	cmp    %ecx,%eax
 762:	72 08                	jb     76c <free+0x2f>
 764:	39 ca                	cmp    %ecx,%edx
 766:	77 04                	ja     76c <free+0x2f>
 768:	89 d0                	mov    %edx,%eax
 76a:	eb e6                	jmp    752 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 76c:	8b 73 fc             	mov    -0x4(%ebx),%esi
 76f:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 772:	8b 10                	mov    (%eax),%edx
 774:	39 d7                	cmp    %edx,%edi
 776:	74 19                	je     791 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 778:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 77b:	8b 50 04             	mov    0x4(%eax),%edx
 77e:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 781:	39 ce                	cmp    %ecx,%esi
 783:	74 1b                	je     7a0 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 785:	89 08                	mov    %ecx,(%eax)
  freep = p;
 787:	a3 04 0d 00 00       	mov    %eax,0xd04
}
 78c:	5b                   	pop    %ebx
 78d:	5e                   	pop    %esi
 78e:	5f                   	pop    %edi
 78f:	5d                   	pop    %ebp
 790:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 791:	03 72 04             	add    0x4(%edx),%esi
 794:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 797:	8b 10                	mov    (%eax),%edx
 799:	8b 12                	mov    (%edx),%edx
 79b:	89 53 f8             	mov    %edx,-0x8(%ebx)
 79e:	eb db                	jmp    77b <free+0x3e>
    p->s.size += bp->s.size;
 7a0:	03 53 fc             	add    -0x4(%ebx),%edx
 7a3:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7a6:	8b 53 f8             	mov    -0x8(%ebx),%edx
 7a9:	89 10                	mov    %edx,(%eax)
 7ab:	eb da                	jmp    787 <free+0x4a>

000007ad <morecore>:

static Header*
morecore(uint nu)
{
 7ad:	55                   	push   %ebp
 7ae:	89 e5                	mov    %esp,%ebp
 7b0:	53                   	push   %ebx
 7b1:	83 ec 04             	sub    $0x4,%esp
 7b4:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 7b6:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 7bb:	77 05                	ja     7c2 <morecore+0x15>
    nu = 4096;
 7bd:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 7c2:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 7c9:	83 ec 0c             	sub    $0xc,%esp
 7cc:	50                   	push   %eax
 7cd:	e8 38 fd ff ff       	call   50a <sbrk>
  if(p == (char*)-1)
 7d2:	83 c4 10             	add    $0x10,%esp
 7d5:	83 f8 ff             	cmp    $0xffffffff,%eax
 7d8:	74 1c                	je     7f6 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 7da:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 7dd:	83 c0 08             	add    $0x8,%eax
 7e0:	83 ec 0c             	sub    $0xc,%esp
 7e3:	50                   	push   %eax
 7e4:	e8 54 ff ff ff       	call   73d <free>
  return freep;
 7e9:	a1 04 0d 00 00       	mov    0xd04,%eax
 7ee:	83 c4 10             	add    $0x10,%esp
}
 7f1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 7f4:	c9                   	leave  
 7f5:	c3                   	ret    
    return 0;
 7f6:	b8 00 00 00 00       	mov    $0x0,%eax
 7fb:	eb f4                	jmp    7f1 <morecore+0x44>

000007fd <malloc>:

void*
malloc(uint nbytes)
{
 7fd:	55                   	push   %ebp
 7fe:	89 e5                	mov    %esp,%ebp
 800:	53                   	push   %ebx
 801:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 804:	8b 45 08             	mov    0x8(%ebp),%eax
 807:	8d 58 07             	lea    0x7(%eax),%ebx
 80a:	c1 eb 03             	shr    $0x3,%ebx
 80d:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 810:	8b 0d 04 0d 00 00    	mov    0xd04,%ecx
 816:	85 c9                	test   %ecx,%ecx
 818:	74 04                	je     81e <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 81a:	8b 01                	mov    (%ecx),%eax
 81c:	eb 4a                	jmp    868 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 81e:	c7 05 04 0d 00 00 08 	movl   $0xd08,0xd04
 825:	0d 00 00 
 828:	c7 05 08 0d 00 00 08 	movl   $0xd08,0xd08
 82f:	0d 00 00 
    base.s.size = 0;
 832:	c7 05 0c 0d 00 00 00 	movl   $0x0,0xd0c
 839:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 83c:	b9 08 0d 00 00       	mov    $0xd08,%ecx
 841:	eb d7                	jmp    81a <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 843:	74 19                	je     85e <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 845:	29 da                	sub    %ebx,%edx
 847:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 84a:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 84d:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 850:	89 0d 04 0d 00 00    	mov    %ecx,0xd04
      return (void*)(p + 1);
 856:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 859:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 85c:	c9                   	leave  
 85d:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 85e:	8b 10                	mov    (%eax),%edx
 860:	89 11                	mov    %edx,(%ecx)
 862:	eb ec                	jmp    850 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 864:	89 c1                	mov    %eax,%ecx
 866:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 868:	8b 50 04             	mov    0x4(%eax),%edx
 86b:	39 da                	cmp    %ebx,%edx
 86d:	73 d4                	jae    843 <malloc+0x46>
    if(p == freep)
 86f:	39 05 04 0d 00 00    	cmp    %eax,0xd04
 875:	75 ed                	jne    864 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 877:	89 d8                	mov    %ebx,%eax
 879:	e8 2f ff ff ff       	call   7ad <morecore>
 87e:	85 c0                	test   %eax,%eax
 880:	75 e2                	jne    864 <malloc+0x67>
 882:	eb d5                	jmp    859 <malloc+0x5c>
