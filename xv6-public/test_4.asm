
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
   6:	e8 7e 04 00 00       	call   489 <exit>

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
  1e:	e8 e6 04 00 00       	call   509 <getpid>
  23:	a3 1c 0d 00 00       	mov    %eax,0xd1c
   void *stack, *p = malloc(PGSIZE * 2);
  28:	83 ec 0c             	sub    $0xc,%esp
  2b:	68 00 20 00 00       	push   $0x2000
  30:	e8 cf 07 00 00       	call   804 <malloc>
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
  52:	e8 d2 04 00 00       	call   529 <clone>
  57:	83 c4 10             	add    $0x10,%esp
  5a:	83 f8 ff             	cmp    $0xffffffff,%eax
  5d:	0f 84 92 00 00 00    	je     f5 <main+0xea>
  63:	6a 21                	push   $0x21
  65:	68 8c 08 00 00       	push   $0x88c
  6a:	68 95 08 00 00       	push   $0x895
  6f:	6a 01                	push   $0x1
  71:	e8 68 05 00 00       	call   5de <printf>
  76:	83 c4 0c             	add    $0xc,%esp
  79:	68 f0 08 00 00       	push   $0x8f0
  7e:	68 a7 08 00 00       	push   $0x8a7
  83:	6a 01                	push   $0x1
  85:	e8 54 05 00 00       	call   5de <printf>
  8a:	83 c4 08             	add    $0x8,%esp
  8d:	68 bb 08 00 00       	push   $0x8bb
  92:	6a 01                	push   $0x1
  94:	e8 45 05 00 00       	call   5de <printf>
  99:	83 c4 04             	add    $0x4,%esp
  9c:	ff 35 1c 0d 00 00    	push   0xd1c
  a2:	e8 12 04 00 00       	call   4b9 <kill>
  a7:	e8 dd 03 00 00       	call   489 <exit>
   assert(p != NULL);
  ac:	6a 1b                	push   $0x1b
  ae:	68 8c 08 00 00       	push   $0x88c
  b3:	68 95 08 00 00       	push   $0x895
  b8:	6a 01                	push   $0x1
  ba:	e8 1f 05 00 00       	call   5de <printf>
  bf:	83 c4 0c             	add    $0xc,%esp
  c2:	68 9d 08 00 00       	push   $0x89d
  c7:	68 a7 08 00 00       	push   $0x8a7
  cc:	6a 01                	push   $0x1
  ce:	e8 0b 05 00 00       	call   5de <printf>
  d3:	83 c4 08             	add    $0x8,%esp
  d6:	68 bb 08 00 00       	push   $0x8bb
  db:	6a 01                	push   $0x1
  dd:	e8 fc 04 00 00       	call   5de <printf>
  e2:	83 c4 04             	add    $0x4,%esp
  e5:	ff 35 1c 0d 00 00    	push   0xd1c
  eb:	e8 c9 03 00 00       	call   4b9 <kill>
  f0:	e8 94 03 00 00       	call   489 <exit>
   stack = sbrk(0);
  f5:	83 ec 0c             	sub    $0xc,%esp
  f8:	6a 00                	push   $0x0
  fa:	e8 12 04 00 00       	call   511 <sbrk>
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
 11c:	e8 f0 03 00 00       	call   511 <sbrk>
 121:	89 c2                	mov    %eax,%edx
 123:	89 f0                	mov    %esi,%eax
 125:	29 d0                	sub    %edx,%eax
 127:	05 00 08 00 00       	add    $0x800,%eax
 12c:	89 04 24             	mov    %eax,(%esp)
 12f:	e8 dd 03 00 00       	call   511 <sbrk>
   assert((uint)stack % PGSIZE == 0);
 134:	83 c4 10             	add    $0x10,%esp
 137:	f7 c6 ff 0f 00 00    	test   $0xfff,%esi
 13d:	74 49                	je     188 <main+0x17d>
 13f:	6a 27                	push   $0x27
 141:	68 8c 08 00 00       	push   $0x88c
 146:	68 95 08 00 00       	push   $0x895
 14b:	6a 01                	push   $0x1
 14d:	e8 8c 04 00 00       	call   5de <printf>
 152:	83 c4 0c             	add    $0xc,%esp
 155:	68 c8 08 00 00       	push   $0x8c8
 15a:	68 a7 08 00 00       	push   $0x8a7
 15f:	6a 01                	push   $0x1
 161:	e8 78 04 00 00       	call   5de <printf>
 166:	83 c4 08             	add    $0x8,%esp
 169:	68 bb 08 00 00       	push   $0x8bb
 16e:	6a 01                	push   $0x1
 170:	e8 69 04 00 00       	call   5de <printf>
 175:	83 c4 04             	add    $0x4,%esp
 178:	ff 35 1c 0d 00 00    	push   0xd1c
 17e:	e8 36 03 00 00       	call   4b9 <kill>
 183:	e8 01 03 00 00       	call   489 <exit>
   assert((uint)sbrk(0) - (uint)stack == PGSIZE/2);
 188:	83 ec 0c             	sub    $0xc,%esp
 18b:	6a 00                	push   $0x0
 18d:	e8 7f 03 00 00       	call   511 <sbrk>
 192:	29 f0                	sub    %esi,%eax
 194:	83 c4 10             	add    $0x10,%esp
 197:	3d 00 08 00 00       	cmp    $0x800,%eax
 19c:	74 49                	je     1e7 <main+0x1dc>
 19e:	6a 28                	push   $0x28
 1a0:	68 8c 08 00 00       	push   $0x88c
 1a5:	68 95 08 00 00       	push   $0x895
 1aa:	6a 01                	push   $0x1
 1ac:	e8 2d 04 00 00       	call   5de <printf>
 1b1:	83 c4 0c             	add    $0xc,%esp
 1b4:	68 14 09 00 00       	push   $0x914
 1b9:	68 a7 08 00 00       	push   $0x8a7
 1be:	6a 01                	push   $0x1
 1c0:	e8 19 04 00 00       	call   5de <printf>
 1c5:	83 c4 08             	add    $0x8,%esp
 1c8:	68 bb 08 00 00       	push   $0x8bb
 1cd:	6a 01                	push   $0x1
 1cf:	e8 0a 04 00 00       	call   5de <printf>
 1d4:	83 c4 04             	add    $0x4,%esp
 1d7:	ff 35 1c 0d 00 00    	push   0xd1c
 1dd:	e8 d7 02 00 00       	call   4b9 <kill>
 1e2:	e8 a2 02 00 00       	call   489 <exit>
   assert(clone(worker, 0, 0, stack) == -1);
 1e7:	56                   	push   %esi
 1e8:	6a 00                	push   $0x0
 1ea:	6a 00                	push   $0x0
 1ec:	68 00 00 00 00       	push   $0x0
 1f1:	e8 33 03 00 00       	call   529 <clone>
 1f6:	83 c4 10             	add    $0x10,%esp
 1f9:	83 f8 ff             	cmp    $0xffffffff,%eax
 1fc:	74 49                	je     247 <main+0x23c>
 1fe:	6a 2a                	push   $0x2a
 200:	68 8c 08 00 00       	push   $0x88c
 205:	68 95 08 00 00       	push   $0x895
 20a:	6a 01                	push   $0x1
 20c:	e8 cd 03 00 00       	call   5de <printf>
 211:	83 c4 0c             	add    $0xc,%esp
 214:	68 f0 08 00 00       	push   $0x8f0
 219:	68 a7 08 00 00       	push   $0x8a7
 21e:	6a 01                	push   $0x1
 220:	e8 b9 03 00 00       	call   5de <printf>
 225:	83 c4 08             	add    $0x8,%esp
 228:	68 bb 08 00 00       	push   $0x8bb
 22d:	6a 01                	push   $0x1
 22f:	e8 aa 03 00 00       	call   5de <printf>
 234:	83 c4 04             	add    $0x4,%esp
 237:	ff 35 1c 0d 00 00    	push   0xd1c
 23d:	e8 77 02 00 00       	call   4b9 <kill>
 242:	e8 42 02 00 00       	call   489 <exit>
   printf(1, "TEST PASSED\n");
 247:	83 ec 08             	sub    $0x8,%esp
 24a:	68 e2 08 00 00       	push   $0x8e2
 24f:	6a 01                	push   $0x1
 251:	e8 88 03 00 00       	call   5de <printf>
   free(p);
 256:	89 1c 24             	mov    %ebx,(%esp)
 259:	e8 e6 04 00 00       	call   744 <free>
   exit();
 25e:	e8 26 02 00 00       	call   489 <exit>

00000263 <test_and_set>:
#include "fcntl.h"
#include "user.h"
#include "x86.h"
#include "mmu.h"

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
  void *n_stack = malloc(PGSIZE);
 27a:	68 00 10 00 00       	push   $0x1000
 27f:	e8 80 05 00 00       	call   804 <malloc>
  if(n_stack == 0){
 284:	83 c4 10             	add    $0x10,%esp
 287:	85 c0                	test   %eax,%eax
 289:	74 14                	je     29f <thread_create+0x2b>
    return -1;
  }
  int new_pid = clone(start_routine, arg1, arg2, n_stack); // TODO: is this the right way to call it?
 28b:	50                   	push   %eax
 28c:	ff 75 10             	push   0x10(%ebp)
 28f:	ff 75 0c             	push   0xc(%ebp)
 292:	ff 75 08             	push   0x8(%ebp)
 295:	e8 8f 02 00 00       	call   529 <clone>


  // I can't remember if there was something else to do here but I'm sure I'll find out


  return new_pid;
 29a:	83 c4 10             	add    $0x10,%esp
}
 29d:	c9                   	leave  
 29e:	c3                   	ret    
    return -1;
 29f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2a4:	eb f7                	jmp    29d <thread_create+0x29>

000002a6 <thread_join>:

int thread_join() {
  return 0;
}
 2a6:	b8 00 00 00 00       	mov    $0x0,%eax
 2ab:	c3                   	ret    

000002ac <lock_acquire>:

void lock_acquire(lock_t *lock){
 2ac:	55                   	push   %ebp
 2ad:	89 e5                	mov    %esp,%ebp
 2af:	53                   	push   %ebx
 2b0:	83 ec 04             	sub    $0x4,%esp
 2b3:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 2b6:	83 ec 08             	sub    $0x8,%esp
 2b9:	6a 01                	push   $0x1
 2bb:	53                   	push   %ebx
 2bc:	e8 a2 ff ff ff       	call   263 <test_and_set>
 2c1:	83 c4 10             	add    $0x10,%esp
 2c4:	83 f8 01             	cmp    $0x1,%eax
 2c7:	74 ed                	je     2b6 <lock_acquire+0xa>
    ;
}
 2c9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2cc:	c9                   	leave  
 2cd:	c3                   	ret    

000002ce <lock_release>:

void lock_release(lock_t *lock) {
 2ce:	55                   	push   %ebp
 2cf:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 2d1:	8b 45 08             	mov    0x8(%ebp),%eax
 2d4:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 2da:	5d                   	pop    %ebp
 2db:	c3                   	ret    

000002dc <lock_init>:

void lock_init(lock_t *lock) {
 2dc:	55                   	push   %ebp
 2dd:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 2df:	8b 45 08             	mov    0x8(%ebp),%eax
 2e2:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 2e8:	5d                   	pop    %ebp
 2e9:	c3                   	ret    

000002ea <strcpy>:

char*
strcpy(char *s, const char *t)
{
 2ea:	55                   	push   %ebp
 2eb:	89 e5                	mov    %esp,%ebp
 2ed:	56                   	push   %esi
 2ee:	53                   	push   %ebx
 2ef:	8b 75 08             	mov    0x8(%ebp),%esi
 2f2:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 2f5:	89 f0                	mov    %esi,%eax
 2f7:	89 d1                	mov    %edx,%ecx
 2f9:	83 c2 01             	add    $0x1,%edx
 2fc:	89 c3                	mov    %eax,%ebx
 2fe:	83 c0 01             	add    $0x1,%eax
 301:	0f b6 09             	movzbl (%ecx),%ecx
 304:	88 0b                	mov    %cl,(%ebx)
 306:	84 c9                	test   %cl,%cl
 308:	75 ed                	jne    2f7 <strcpy+0xd>
    ;
  return os;
}
 30a:	89 f0                	mov    %esi,%eax
 30c:	5b                   	pop    %ebx
 30d:	5e                   	pop    %esi
 30e:	5d                   	pop    %ebp
 30f:	c3                   	ret    

00000310 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 310:	55                   	push   %ebp
 311:	89 e5                	mov    %esp,%ebp
 313:	8b 4d 08             	mov    0x8(%ebp),%ecx
 316:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 319:	eb 06                	jmp    321 <strcmp+0x11>
    p++, q++;
 31b:	83 c1 01             	add    $0x1,%ecx
 31e:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 321:	0f b6 01             	movzbl (%ecx),%eax
 324:	84 c0                	test   %al,%al
 326:	74 04                	je     32c <strcmp+0x1c>
 328:	3a 02                	cmp    (%edx),%al
 32a:	74 ef                	je     31b <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 32c:	0f b6 c0             	movzbl %al,%eax
 32f:	0f b6 12             	movzbl (%edx),%edx
 332:	29 d0                	sub    %edx,%eax
}
 334:	5d                   	pop    %ebp
 335:	c3                   	ret    

00000336 <strlen>:

uint
strlen(const char *s)
{
 336:	55                   	push   %ebp
 337:	89 e5                	mov    %esp,%ebp
 339:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 33c:	b8 00 00 00 00       	mov    $0x0,%eax
 341:	eb 03                	jmp    346 <strlen+0x10>
 343:	83 c0 01             	add    $0x1,%eax
 346:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 34a:	75 f7                	jne    343 <strlen+0xd>
    ;
  return n;
}
 34c:	5d                   	pop    %ebp
 34d:	c3                   	ret    

0000034e <memset>:

void*
memset(void *dst, int c, uint n)
{
 34e:	55                   	push   %ebp
 34f:	89 e5                	mov    %esp,%ebp
 351:	57                   	push   %edi
 352:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 355:	89 d7                	mov    %edx,%edi
 357:	8b 4d 10             	mov    0x10(%ebp),%ecx
 35a:	8b 45 0c             	mov    0xc(%ebp),%eax
 35d:	fc                   	cld    
 35e:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 360:	89 d0                	mov    %edx,%eax
 362:	8b 7d fc             	mov    -0x4(%ebp),%edi
 365:	c9                   	leave  
 366:	c3                   	ret    

00000367 <strchr>:

char*
strchr(const char *s, char c)
{
 367:	55                   	push   %ebp
 368:	89 e5                	mov    %esp,%ebp
 36a:	8b 45 08             	mov    0x8(%ebp),%eax
 36d:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 371:	eb 03                	jmp    376 <strchr+0xf>
 373:	83 c0 01             	add    $0x1,%eax
 376:	0f b6 10             	movzbl (%eax),%edx
 379:	84 d2                	test   %dl,%dl
 37b:	74 06                	je     383 <strchr+0x1c>
    if(*s == c)
 37d:	38 ca                	cmp    %cl,%dl
 37f:	75 f2                	jne    373 <strchr+0xc>
 381:	eb 05                	jmp    388 <strchr+0x21>
      return (char*)s;
  return 0;
 383:	b8 00 00 00 00       	mov    $0x0,%eax
}
 388:	5d                   	pop    %ebp
 389:	c3                   	ret    

0000038a <gets>:

char*
gets(char *buf, int max)
{
 38a:	55                   	push   %ebp
 38b:	89 e5                	mov    %esp,%ebp
 38d:	57                   	push   %edi
 38e:	56                   	push   %esi
 38f:	53                   	push   %ebx
 390:	83 ec 1c             	sub    $0x1c,%esp
 393:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 396:	bb 00 00 00 00       	mov    $0x0,%ebx
 39b:	89 de                	mov    %ebx,%esi
 39d:	83 c3 01             	add    $0x1,%ebx
 3a0:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 3a3:	7d 2e                	jge    3d3 <gets+0x49>
    cc = read(0, &c, 1);
 3a5:	83 ec 04             	sub    $0x4,%esp
 3a8:	6a 01                	push   $0x1
 3aa:	8d 45 e7             	lea    -0x19(%ebp),%eax
 3ad:	50                   	push   %eax
 3ae:	6a 00                	push   $0x0
 3b0:	e8 ec 00 00 00       	call   4a1 <read>
    if(cc < 1)
 3b5:	83 c4 10             	add    $0x10,%esp
 3b8:	85 c0                	test   %eax,%eax
 3ba:	7e 17                	jle    3d3 <gets+0x49>
      break;
    buf[i++] = c;
 3bc:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 3c0:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 3c3:	3c 0a                	cmp    $0xa,%al
 3c5:	0f 94 c2             	sete   %dl
 3c8:	3c 0d                	cmp    $0xd,%al
 3ca:	0f 94 c0             	sete   %al
 3cd:	08 c2                	or     %al,%dl
 3cf:	74 ca                	je     39b <gets+0x11>
    buf[i++] = c;
 3d1:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 3d3:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 3d7:	89 f8                	mov    %edi,%eax
 3d9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3dc:	5b                   	pop    %ebx
 3dd:	5e                   	pop    %esi
 3de:	5f                   	pop    %edi
 3df:	5d                   	pop    %ebp
 3e0:	c3                   	ret    

000003e1 <stat>:

int
stat(const char *n, struct stat *st)
{
 3e1:	55                   	push   %ebp
 3e2:	89 e5                	mov    %esp,%ebp
 3e4:	56                   	push   %esi
 3e5:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 3e6:	83 ec 08             	sub    $0x8,%esp
 3e9:	6a 00                	push   $0x0
 3eb:	ff 75 08             	push   0x8(%ebp)
 3ee:	e8 d6 00 00 00       	call   4c9 <open>
  if(fd < 0)
 3f3:	83 c4 10             	add    $0x10,%esp
 3f6:	85 c0                	test   %eax,%eax
 3f8:	78 24                	js     41e <stat+0x3d>
 3fa:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 3fc:	83 ec 08             	sub    $0x8,%esp
 3ff:	ff 75 0c             	push   0xc(%ebp)
 402:	50                   	push   %eax
 403:	e8 d9 00 00 00       	call   4e1 <fstat>
 408:	89 c6                	mov    %eax,%esi
  close(fd);
 40a:	89 1c 24             	mov    %ebx,(%esp)
 40d:	e8 9f 00 00 00       	call   4b1 <close>
  return r;
 412:	83 c4 10             	add    $0x10,%esp
}
 415:	89 f0                	mov    %esi,%eax
 417:	8d 65 f8             	lea    -0x8(%ebp),%esp
 41a:	5b                   	pop    %ebx
 41b:	5e                   	pop    %esi
 41c:	5d                   	pop    %ebp
 41d:	c3                   	ret    
    return -1;
 41e:	be ff ff ff ff       	mov    $0xffffffff,%esi
 423:	eb f0                	jmp    415 <stat+0x34>

00000425 <atoi>:

int
atoi(const char *s)
{
 425:	55                   	push   %ebp
 426:	89 e5                	mov    %esp,%ebp
 428:	53                   	push   %ebx
 429:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 42c:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 431:	eb 10                	jmp    443 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 433:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 436:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 439:	83 c1 01             	add    $0x1,%ecx
 43c:	0f be c0             	movsbl %al,%eax
 43f:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 443:	0f b6 01             	movzbl (%ecx),%eax
 446:	8d 58 d0             	lea    -0x30(%eax),%ebx
 449:	80 fb 09             	cmp    $0x9,%bl
 44c:	76 e5                	jbe    433 <atoi+0xe>
  return n;
}
 44e:	89 d0                	mov    %edx,%eax
 450:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 453:	c9                   	leave  
 454:	c3                   	ret    

00000455 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 455:	55                   	push   %ebp
 456:	89 e5                	mov    %esp,%ebp
 458:	56                   	push   %esi
 459:	53                   	push   %ebx
 45a:	8b 75 08             	mov    0x8(%ebp),%esi
 45d:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 460:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 463:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 465:	eb 0d                	jmp    474 <memmove+0x1f>
    *dst++ = *src++;
 467:	0f b6 01             	movzbl (%ecx),%eax
 46a:	88 02                	mov    %al,(%edx)
 46c:	8d 49 01             	lea    0x1(%ecx),%ecx
 46f:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 472:	89 d8                	mov    %ebx,%eax
 474:	8d 58 ff             	lea    -0x1(%eax),%ebx
 477:	85 c0                	test   %eax,%eax
 479:	7f ec                	jg     467 <memmove+0x12>
  return vdst;
}
 47b:	89 f0                	mov    %esi,%eax
 47d:	5b                   	pop    %ebx
 47e:	5e                   	pop    %esi
 47f:	5d                   	pop    %ebp
 480:	c3                   	ret    

00000481 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 481:	b8 01 00 00 00       	mov    $0x1,%eax
 486:	cd 40                	int    $0x40
 488:	c3                   	ret    

00000489 <exit>:
SYSCALL(exit)
 489:	b8 02 00 00 00       	mov    $0x2,%eax
 48e:	cd 40                	int    $0x40
 490:	c3                   	ret    

00000491 <wait>:
SYSCALL(wait)
 491:	b8 03 00 00 00       	mov    $0x3,%eax
 496:	cd 40                	int    $0x40
 498:	c3                   	ret    

00000499 <pipe>:
SYSCALL(pipe)
 499:	b8 04 00 00 00       	mov    $0x4,%eax
 49e:	cd 40                	int    $0x40
 4a0:	c3                   	ret    

000004a1 <read>:
SYSCALL(read)
 4a1:	b8 05 00 00 00       	mov    $0x5,%eax
 4a6:	cd 40                	int    $0x40
 4a8:	c3                   	ret    

000004a9 <write>:
SYSCALL(write)
 4a9:	b8 10 00 00 00       	mov    $0x10,%eax
 4ae:	cd 40                	int    $0x40
 4b0:	c3                   	ret    

000004b1 <close>:
SYSCALL(close)
 4b1:	b8 15 00 00 00       	mov    $0x15,%eax
 4b6:	cd 40                	int    $0x40
 4b8:	c3                   	ret    

000004b9 <kill>:
SYSCALL(kill)
 4b9:	b8 06 00 00 00       	mov    $0x6,%eax
 4be:	cd 40                	int    $0x40
 4c0:	c3                   	ret    

000004c1 <exec>:
SYSCALL(exec)
 4c1:	b8 07 00 00 00       	mov    $0x7,%eax
 4c6:	cd 40                	int    $0x40
 4c8:	c3                   	ret    

000004c9 <open>:
SYSCALL(open)
 4c9:	b8 0f 00 00 00       	mov    $0xf,%eax
 4ce:	cd 40                	int    $0x40
 4d0:	c3                   	ret    

000004d1 <mknod>:
SYSCALL(mknod)
 4d1:	b8 11 00 00 00       	mov    $0x11,%eax
 4d6:	cd 40                	int    $0x40
 4d8:	c3                   	ret    

000004d9 <unlink>:
SYSCALL(unlink)
 4d9:	b8 12 00 00 00       	mov    $0x12,%eax
 4de:	cd 40                	int    $0x40
 4e0:	c3                   	ret    

000004e1 <fstat>:
SYSCALL(fstat)
 4e1:	b8 08 00 00 00       	mov    $0x8,%eax
 4e6:	cd 40                	int    $0x40
 4e8:	c3                   	ret    

000004e9 <link>:
SYSCALL(link)
 4e9:	b8 13 00 00 00       	mov    $0x13,%eax
 4ee:	cd 40                	int    $0x40
 4f0:	c3                   	ret    

000004f1 <mkdir>:
SYSCALL(mkdir)
 4f1:	b8 14 00 00 00       	mov    $0x14,%eax
 4f6:	cd 40                	int    $0x40
 4f8:	c3                   	ret    

000004f9 <chdir>:
SYSCALL(chdir)
 4f9:	b8 09 00 00 00       	mov    $0x9,%eax
 4fe:	cd 40                	int    $0x40
 500:	c3                   	ret    

00000501 <dup>:
SYSCALL(dup)
 501:	b8 0a 00 00 00       	mov    $0xa,%eax
 506:	cd 40                	int    $0x40
 508:	c3                   	ret    

00000509 <getpid>:
SYSCALL(getpid)
 509:	b8 0b 00 00 00       	mov    $0xb,%eax
 50e:	cd 40                	int    $0x40
 510:	c3                   	ret    

00000511 <sbrk>:
SYSCALL(sbrk)
 511:	b8 0c 00 00 00       	mov    $0xc,%eax
 516:	cd 40                	int    $0x40
 518:	c3                   	ret    

00000519 <sleep>:
SYSCALL(sleep)
 519:	b8 0d 00 00 00       	mov    $0xd,%eax
 51e:	cd 40                	int    $0x40
 520:	c3                   	ret    

00000521 <uptime>:
SYSCALL(uptime)
 521:	b8 0e 00 00 00       	mov    $0xe,%eax
 526:	cd 40                	int    $0x40
 528:	c3                   	ret    

00000529 <clone>:
SYSCALL(clone)
 529:	b8 16 00 00 00       	mov    $0x16,%eax
 52e:	cd 40                	int    $0x40
 530:	c3                   	ret    

00000531 <join>:
 531:	b8 17 00 00 00       	mov    $0x17,%eax
 536:	cd 40                	int    $0x40
 538:	c3                   	ret    

00000539 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 539:	55                   	push   %ebp
 53a:	89 e5                	mov    %esp,%ebp
 53c:	83 ec 1c             	sub    $0x1c,%esp
 53f:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 542:	6a 01                	push   $0x1
 544:	8d 55 f4             	lea    -0xc(%ebp),%edx
 547:	52                   	push   %edx
 548:	50                   	push   %eax
 549:	e8 5b ff ff ff       	call   4a9 <write>
}
 54e:	83 c4 10             	add    $0x10,%esp
 551:	c9                   	leave  
 552:	c3                   	ret    

00000553 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 553:	55                   	push   %ebp
 554:	89 e5                	mov    %esp,%ebp
 556:	57                   	push   %edi
 557:	56                   	push   %esi
 558:	53                   	push   %ebx
 559:	83 ec 2c             	sub    $0x2c,%esp
 55c:	89 45 d0             	mov    %eax,-0x30(%ebp)
 55f:	89 d0                	mov    %edx,%eax
 561:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 563:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 567:	0f 95 c1             	setne  %cl
 56a:	c1 ea 1f             	shr    $0x1f,%edx
 56d:	84 d1                	test   %dl,%cl
 56f:	74 44                	je     5b5 <printint+0x62>
    neg = 1;
    x = -xx;
 571:	f7 d8                	neg    %eax
 573:	89 c1                	mov    %eax,%ecx
    neg = 1;
 575:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 57c:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 581:	89 c8                	mov    %ecx,%eax
 583:	ba 00 00 00 00       	mov    $0x0,%edx
 588:	f7 f6                	div    %esi
 58a:	89 df                	mov    %ebx,%edi
 58c:	83 c3 01             	add    $0x1,%ebx
 58f:	0f b6 92 9c 09 00 00 	movzbl 0x99c(%edx),%edx
 596:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 59a:	89 ca                	mov    %ecx,%edx
 59c:	89 c1                	mov    %eax,%ecx
 59e:	39 d6                	cmp    %edx,%esi
 5a0:	76 df                	jbe    581 <printint+0x2e>
  if(neg)
 5a2:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 5a6:	74 31                	je     5d9 <printint+0x86>
    buf[i++] = '-';
 5a8:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 5ad:	8d 5f 02             	lea    0x2(%edi),%ebx
 5b0:	8b 75 d0             	mov    -0x30(%ebp),%esi
 5b3:	eb 17                	jmp    5cc <printint+0x79>
    x = xx;
 5b5:	89 c1                	mov    %eax,%ecx
  neg = 0;
 5b7:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 5be:	eb bc                	jmp    57c <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 5c0:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 5c5:	89 f0                	mov    %esi,%eax
 5c7:	e8 6d ff ff ff       	call   539 <putc>
  while(--i >= 0)
 5cc:	83 eb 01             	sub    $0x1,%ebx
 5cf:	79 ef                	jns    5c0 <printint+0x6d>
}
 5d1:	83 c4 2c             	add    $0x2c,%esp
 5d4:	5b                   	pop    %ebx
 5d5:	5e                   	pop    %esi
 5d6:	5f                   	pop    %edi
 5d7:	5d                   	pop    %ebp
 5d8:	c3                   	ret    
 5d9:	8b 75 d0             	mov    -0x30(%ebp),%esi
 5dc:	eb ee                	jmp    5cc <printint+0x79>

000005de <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5de:	55                   	push   %ebp
 5df:	89 e5                	mov    %esp,%ebp
 5e1:	57                   	push   %edi
 5e2:	56                   	push   %esi
 5e3:	53                   	push   %ebx
 5e4:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 5e7:	8d 45 10             	lea    0x10(%ebp),%eax
 5ea:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 5ed:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 5f2:	bb 00 00 00 00       	mov    $0x0,%ebx
 5f7:	eb 14                	jmp    60d <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 5f9:	89 fa                	mov    %edi,%edx
 5fb:	8b 45 08             	mov    0x8(%ebp),%eax
 5fe:	e8 36 ff ff ff       	call   539 <putc>
 603:	eb 05                	jmp    60a <printf+0x2c>
      }
    } else if(state == '%'){
 605:	83 fe 25             	cmp    $0x25,%esi
 608:	74 25                	je     62f <printf+0x51>
  for(i = 0; fmt[i]; i++){
 60a:	83 c3 01             	add    $0x1,%ebx
 60d:	8b 45 0c             	mov    0xc(%ebp),%eax
 610:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 614:	84 c0                	test   %al,%al
 616:	0f 84 20 01 00 00    	je     73c <printf+0x15e>
    c = fmt[i] & 0xff;
 61c:	0f be f8             	movsbl %al,%edi
 61f:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 622:	85 f6                	test   %esi,%esi
 624:	75 df                	jne    605 <printf+0x27>
      if(c == '%'){
 626:	83 f8 25             	cmp    $0x25,%eax
 629:	75 ce                	jne    5f9 <printf+0x1b>
        state = '%';
 62b:	89 c6                	mov    %eax,%esi
 62d:	eb db                	jmp    60a <printf+0x2c>
      if(c == 'd'){
 62f:	83 f8 25             	cmp    $0x25,%eax
 632:	0f 84 cf 00 00 00    	je     707 <printf+0x129>
 638:	0f 8c dd 00 00 00    	jl     71b <printf+0x13d>
 63e:	83 f8 78             	cmp    $0x78,%eax
 641:	0f 8f d4 00 00 00    	jg     71b <printf+0x13d>
 647:	83 f8 63             	cmp    $0x63,%eax
 64a:	0f 8c cb 00 00 00    	jl     71b <printf+0x13d>
 650:	83 e8 63             	sub    $0x63,%eax
 653:	83 f8 15             	cmp    $0x15,%eax
 656:	0f 87 bf 00 00 00    	ja     71b <printf+0x13d>
 65c:	ff 24 85 44 09 00 00 	jmp    *0x944(,%eax,4)
        printint(fd, *ap, 10, 1);
 663:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 666:	8b 17                	mov    (%edi),%edx
 668:	83 ec 0c             	sub    $0xc,%esp
 66b:	6a 01                	push   $0x1
 66d:	b9 0a 00 00 00       	mov    $0xa,%ecx
 672:	8b 45 08             	mov    0x8(%ebp),%eax
 675:	e8 d9 fe ff ff       	call   553 <printint>
        ap++;
 67a:	83 c7 04             	add    $0x4,%edi
 67d:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 680:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 683:	be 00 00 00 00       	mov    $0x0,%esi
 688:	eb 80                	jmp    60a <printf+0x2c>
        printint(fd, *ap, 16, 0);
 68a:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 68d:	8b 17                	mov    (%edi),%edx
 68f:	83 ec 0c             	sub    $0xc,%esp
 692:	6a 00                	push   $0x0
 694:	b9 10 00 00 00       	mov    $0x10,%ecx
 699:	8b 45 08             	mov    0x8(%ebp),%eax
 69c:	e8 b2 fe ff ff       	call   553 <printint>
        ap++;
 6a1:	83 c7 04             	add    $0x4,%edi
 6a4:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 6a7:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6aa:	be 00 00 00 00       	mov    $0x0,%esi
 6af:	e9 56 ff ff ff       	jmp    60a <printf+0x2c>
        s = (char*)*ap;
 6b4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6b7:	8b 30                	mov    (%eax),%esi
        ap++;
 6b9:	83 c0 04             	add    $0x4,%eax
 6bc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 6bf:	85 f6                	test   %esi,%esi
 6c1:	75 15                	jne    6d8 <printf+0xfa>
          s = "(null)";
 6c3:	be 3c 09 00 00       	mov    $0x93c,%esi
 6c8:	eb 0e                	jmp    6d8 <printf+0xfa>
          putc(fd, *s);
 6ca:	0f be d2             	movsbl %dl,%edx
 6cd:	8b 45 08             	mov    0x8(%ebp),%eax
 6d0:	e8 64 fe ff ff       	call   539 <putc>
          s++;
 6d5:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 6d8:	0f b6 16             	movzbl (%esi),%edx
 6db:	84 d2                	test   %dl,%dl
 6dd:	75 eb                	jne    6ca <printf+0xec>
      state = 0;
 6df:	be 00 00 00 00       	mov    $0x0,%esi
 6e4:	e9 21 ff ff ff       	jmp    60a <printf+0x2c>
        putc(fd, *ap);
 6e9:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6ec:	0f be 17             	movsbl (%edi),%edx
 6ef:	8b 45 08             	mov    0x8(%ebp),%eax
 6f2:	e8 42 fe ff ff       	call   539 <putc>
        ap++;
 6f7:	83 c7 04             	add    $0x4,%edi
 6fa:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 6fd:	be 00 00 00 00       	mov    $0x0,%esi
 702:	e9 03 ff ff ff       	jmp    60a <printf+0x2c>
        putc(fd, c);
 707:	89 fa                	mov    %edi,%edx
 709:	8b 45 08             	mov    0x8(%ebp),%eax
 70c:	e8 28 fe ff ff       	call   539 <putc>
      state = 0;
 711:	be 00 00 00 00       	mov    $0x0,%esi
 716:	e9 ef fe ff ff       	jmp    60a <printf+0x2c>
        putc(fd, '%');
 71b:	ba 25 00 00 00       	mov    $0x25,%edx
 720:	8b 45 08             	mov    0x8(%ebp),%eax
 723:	e8 11 fe ff ff       	call   539 <putc>
        putc(fd, c);
 728:	89 fa                	mov    %edi,%edx
 72a:	8b 45 08             	mov    0x8(%ebp),%eax
 72d:	e8 07 fe ff ff       	call   539 <putc>
      state = 0;
 732:	be 00 00 00 00       	mov    $0x0,%esi
 737:	e9 ce fe ff ff       	jmp    60a <printf+0x2c>
    }
  }
}
 73c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 73f:	5b                   	pop    %ebx
 740:	5e                   	pop    %esi
 741:	5f                   	pop    %edi
 742:	5d                   	pop    %ebp
 743:	c3                   	ret    

00000744 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 744:	55                   	push   %ebp
 745:	89 e5                	mov    %esp,%ebp
 747:	57                   	push   %edi
 748:	56                   	push   %esi
 749:	53                   	push   %ebx
 74a:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 74d:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 750:	a1 20 0d 00 00       	mov    0xd20,%eax
 755:	eb 02                	jmp    759 <free+0x15>
 757:	89 d0                	mov    %edx,%eax
 759:	39 c8                	cmp    %ecx,%eax
 75b:	73 04                	jae    761 <free+0x1d>
 75d:	39 08                	cmp    %ecx,(%eax)
 75f:	77 12                	ja     773 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 761:	8b 10                	mov    (%eax),%edx
 763:	39 c2                	cmp    %eax,%edx
 765:	77 f0                	ja     757 <free+0x13>
 767:	39 c8                	cmp    %ecx,%eax
 769:	72 08                	jb     773 <free+0x2f>
 76b:	39 ca                	cmp    %ecx,%edx
 76d:	77 04                	ja     773 <free+0x2f>
 76f:	89 d0                	mov    %edx,%eax
 771:	eb e6                	jmp    759 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 773:	8b 73 fc             	mov    -0x4(%ebx),%esi
 776:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 779:	8b 10                	mov    (%eax),%edx
 77b:	39 d7                	cmp    %edx,%edi
 77d:	74 19                	je     798 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 77f:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 782:	8b 50 04             	mov    0x4(%eax),%edx
 785:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 788:	39 ce                	cmp    %ecx,%esi
 78a:	74 1b                	je     7a7 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 78c:	89 08                	mov    %ecx,(%eax)
  freep = p;
 78e:	a3 20 0d 00 00       	mov    %eax,0xd20
}
 793:	5b                   	pop    %ebx
 794:	5e                   	pop    %esi
 795:	5f                   	pop    %edi
 796:	5d                   	pop    %ebp
 797:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 798:	03 72 04             	add    0x4(%edx),%esi
 79b:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 79e:	8b 10                	mov    (%eax),%edx
 7a0:	8b 12                	mov    (%edx),%edx
 7a2:	89 53 f8             	mov    %edx,-0x8(%ebx)
 7a5:	eb db                	jmp    782 <free+0x3e>
    p->s.size += bp->s.size;
 7a7:	03 53 fc             	add    -0x4(%ebx),%edx
 7aa:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7ad:	8b 53 f8             	mov    -0x8(%ebx),%edx
 7b0:	89 10                	mov    %edx,(%eax)
 7b2:	eb da                	jmp    78e <free+0x4a>

000007b4 <morecore>:

static Header*
morecore(uint nu)
{
 7b4:	55                   	push   %ebp
 7b5:	89 e5                	mov    %esp,%ebp
 7b7:	53                   	push   %ebx
 7b8:	83 ec 04             	sub    $0x4,%esp
 7bb:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 7bd:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 7c2:	77 05                	ja     7c9 <morecore+0x15>
    nu = 4096;
 7c4:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 7c9:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 7d0:	83 ec 0c             	sub    $0xc,%esp
 7d3:	50                   	push   %eax
 7d4:	e8 38 fd ff ff       	call   511 <sbrk>
  if(p == (char*)-1)
 7d9:	83 c4 10             	add    $0x10,%esp
 7dc:	83 f8 ff             	cmp    $0xffffffff,%eax
 7df:	74 1c                	je     7fd <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 7e1:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 7e4:	83 c0 08             	add    $0x8,%eax
 7e7:	83 ec 0c             	sub    $0xc,%esp
 7ea:	50                   	push   %eax
 7eb:	e8 54 ff ff ff       	call   744 <free>
  return freep;
 7f0:	a1 20 0d 00 00       	mov    0xd20,%eax
 7f5:	83 c4 10             	add    $0x10,%esp
}
 7f8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 7fb:	c9                   	leave  
 7fc:	c3                   	ret    
    return 0;
 7fd:	b8 00 00 00 00       	mov    $0x0,%eax
 802:	eb f4                	jmp    7f8 <morecore+0x44>

00000804 <malloc>:

void*
malloc(uint nbytes)
{
 804:	55                   	push   %ebp
 805:	89 e5                	mov    %esp,%ebp
 807:	53                   	push   %ebx
 808:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 80b:	8b 45 08             	mov    0x8(%ebp),%eax
 80e:	8d 58 07             	lea    0x7(%eax),%ebx
 811:	c1 eb 03             	shr    $0x3,%ebx
 814:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 817:	8b 0d 20 0d 00 00    	mov    0xd20,%ecx
 81d:	85 c9                	test   %ecx,%ecx
 81f:	74 04                	je     825 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 821:	8b 01                	mov    (%ecx),%eax
 823:	eb 4a                	jmp    86f <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 825:	c7 05 20 0d 00 00 24 	movl   $0xd24,0xd20
 82c:	0d 00 00 
 82f:	c7 05 24 0d 00 00 24 	movl   $0xd24,0xd24
 836:	0d 00 00 
    base.s.size = 0;
 839:	c7 05 28 0d 00 00 00 	movl   $0x0,0xd28
 840:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 843:	b9 24 0d 00 00       	mov    $0xd24,%ecx
 848:	eb d7                	jmp    821 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 84a:	74 19                	je     865 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 84c:	29 da                	sub    %ebx,%edx
 84e:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 851:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 854:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 857:	89 0d 20 0d 00 00    	mov    %ecx,0xd20
      return (void*)(p + 1);
 85d:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 860:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 863:	c9                   	leave  
 864:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 865:	8b 10                	mov    (%eax),%edx
 867:	89 11                	mov    %edx,(%ecx)
 869:	eb ec                	jmp    857 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 86b:	89 c1                	mov    %eax,%ecx
 86d:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 86f:	8b 50 04             	mov    0x4(%eax),%edx
 872:	39 da                	cmp    %ebx,%edx
 874:	73 d4                	jae    84a <malloc+0x46>
    if(p == freep)
 876:	39 05 20 0d 00 00    	cmp    %eax,0xd20
 87c:	75 ed                	jne    86b <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 87e:	89 d8                	mov    %ebx,%eax
 880:	e8 2f ff ff ff       	call   7b4 <morecore>
 885:	85 c0                	test   %eax,%eax
 887:	75 e2                	jne    86b <malloc+0x67>
 889:	eb d5                	jmp    860 <malloc+0x5c>
