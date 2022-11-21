
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
   6:	a1 04 0d 00 00       	mov    0xd04,%eax
   b:	83 f8 01             	cmp    $0x1,%eax
   e:	74 49                	je     59 <worker+0x59>
  10:	6a 2e                	push   $0x2e
  12:	68 5c 08 00 00       	push   $0x85c
  17:	68 66 08 00 00       	push   $0x866
  1c:	6a 01                	push   $0x1
  1e:	e8 89 05 00 00       	call   5ac <printf>
  23:	83 c4 0c             	add    $0xc,%esp
  26:	68 6e 08 00 00       	push   $0x86e
  2b:	68 7a 08 00 00       	push   $0x87a
  30:	6a 01                	push   $0x1
  32:	e8 75 05 00 00       	call   5ac <printf>
  37:	83 c4 08             	add    $0x8,%esp
  3a:	68 8e 08 00 00       	push   $0x88e
  3f:	6a 01                	push   $0x1
  41:	e8 66 05 00 00       	call   5ac <printf>
  46:	83 c4 04             	add    $0x4,%esp
  49:	ff 35 08 0d 00 00    	push   0xd08
  4f:	e8 33 04 00 00       	call   487 <kill>
  54:	e8 fe 03 00 00       	call   457 <exit>
   global += 4;
  59:	a1 04 0d 00 00       	mov    0xd04,%eax
  5e:	83 c0 04             	add    $0x4,%eax
  61:	a3 04 0d 00 00       	mov    %eax,0xd04
   exit();
  66:	e8 ec 03 00 00       	call   457 <exit>

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
  7e:	e8 54 04 00 00       	call   4d7 <getpid>
  83:	a3 08 0d 00 00       	mov    %eax,0xd08
   for(i = 0; i < 10; i++) {
  88:	be 00 00 00 00       	mov    $0x0,%esi
  8d:	83 fe 09             	cmp    $0x9,%esi
  90:	0f 8f 7c 01 00 00    	jg     212 <main+0x1a7>
      global = 1;
  96:	c7 05 04 0d 00 00 01 	movl   $0x1,0xd04
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
  ba:	e8 aa 01 00 00       	call   269 <thread_join>
      assert(join_pid == thread_pid);
  bf:	39 c3                	cmp    %eax,%ebx
  c1:	75 74                	jne    137 <main+0xcc>
      assert(global == 5);
  c3:	a1 04 0d 00 00       	mov    0xd04,%eax
  c8:	83 f8 05             	cmp    $0x5,%eax
  cb:	0f 85 af 00 00 00    	jne    180 <main+0x115>
      assert((uint)sbrk(0) < (150 * 4096) && "shouldn't even come close");
  d1:	83 ec 0c             	sub    $0xc,%esp
  d4:	6a 00                	push   $0x0
  d6:	e8 04 04 00 00       	call   4df <sbrk>
  db:	83 c4 10             	add    $0x10,%esp
  de:	3d ff 5f 09 00       	cmp    $0x95fff,%eax
  e3:	0f 87 e0 00 00 00    	ja     1c9 <main+0x15e>
   for(i = 0; i < 10; i++) {
  e9:	83 c6 01             	add    $0x1,%esi
  ec:	eb 9f                	jmp    8d <main+0x22>
      assert(thread_pid > 0);
  ee:	6a 20                	push   $0x20
  f0:	68 5c 08 00 00       	push   $0x85c
  f5:	68 66 08 00 00       	push   $0x866
  fa:	6a 01                	push   $0x1
  fc:	e8 ab 04 00 00       	call   5ac <printf>
 101:	83 c4 0c             	add    $0xc,%esp
 104:	68 9b 08 00 00       	push   $0x89b
 109:	68 7a 08 00 00       	push   $0x87a
 10e:	6a 01                	push   $0x1
 110:	e8 97 04 00 00       	call   5ac <printf>
 115:	83 c4 08             	add    $0x8,%esp
 118:	68 8e 08 00 00       	push   $0x88e
 11d:	6a 01                	push   $0x1
 11f:	e8 88 04 00 00       	call   5ac <printf>
 124:	83 c4 04             	add    $0x4,%esp
 127:	ff 35 08 0d 00 00    	push   0xd08
 12d:	e8 55 03 00 00       	call   487 <kill>
 132:	e8 20 03 00 00       	call   457 <exit>
      assert(join_pid == thread_pid);
 137:	6a 22                	push   $0x22
 139:	68 5c 08 00 00       	push   $0x85c
 13e:	68 66 08 00 00       	push   $0x866
 143:	6a 01                	push   $0x1
 145:	e8 62 04 00 00       	call   5ac <printf>
 14a:	83 c4 0c             	add    $0xc,%esp
 14d:	68 aa 08 00 00       	push   $0x8aa
 152:	68 7a 08 00 00       	push   $0x87a
 157:	6a 01                	push   $0x1
 159:	e8 4e 04 00 00       	call   5ac <printf>
 15e:	83 c4 08             	add    $0x8,%esp
 161:	68 8e 08 00 00       	push   $0x88e
 166:	6a 01                	push   $0x1
 168:	e8 3f 04 00 00       	call   5ac <printf>
 16d:	83 c4 04             	add    $0x4,%esp
 170:	ff 35 08 0d 00 00    	push   0xd08
 176:	e8 0c 03 00 00       	call   487 <kill>
 17b:	e8 d7 02 00 00       	call   457 <exit>
      assert(global == 5);
 180:	6a 23                	push   $0x23
 182:	68 5c 08 00 00       	push   $0x85c
 187:	68 66 08 00 00       	push   $0x866
 18c:	6a 01                	push   $0x1
 18e:	e8 19 04 00 00       	call   5ac <printf>
 193:	83 c4 0c             	add    $0xc,%esp
 196:	68 c1 08 00 00       	push   $0x8c1
 19b:	68 7a 08 00 00       	push   $0x87a
 1a0:	6a 01                	push   $0x1
 1a2:	e8 05 04 00 00       	call   5ac <printf>
 1a7:	83 c4 08             	add    $0x8,%esp
 1aa:	68 8e 08 00 00       	push   $0x88e
 1af:	6a 01                	push   $0x1
 1b1:	e8 f6 03 00 00       	call   5ac <printf>
 1b6:	83 c4 04             	add    $0x4,%esp
 1b9:	ff 35 08 0d 00 00    	push   0xd08
 1bf:	e8 c3 02 00 00       	call   487 <kill>
 1c4:	e8 8e 02 00 00       	call   457 <exit>
      assert((uint)sbrk(0) < (150 * 4096) && "shouldn't even come close");
 1c9:	6a 25                	push   $0x25
 1cb:	68 5c 08 00 00       	push   $0x85c
 1d0:	68 66 08 00 00       	push   $0x866
 1d5:	6a 01                	push   $0x1
 1d7:	e8 d0 03 00 00       	call   5ac <printf>
 1dc:	83 c4 0c             	add    $0xc,%esp
 1df:	68 dc 08 00 00       	push   $0x8dc
 1e4:	68 7a 08 00 00       	push   $0x87a
 1e9:	6a 01                	push   $0x1
 1eb:	e8 bc 03 00 00       	call   5ac <printf>
 1f0:	83 c4 08             	add    $0x8,%esp
 1f3:	68 8e 08 00 00       	push   $0x88e
 1f8:	6a 01                	push   $0x1
 1fa:	e8 ad 03 00 00       	call   5ac <printf>
 1ff:	83 c4 04             	add    $0x4,%esp
 202:	ff 35 08 0d 00 00    	push   0xd08
 208:	e8 7a 02 00 00       	call   487 <kill>
 20d:	e8 45 02 00 00       	call   457 <exit>
   printf(1, "TEST PASSED\n");
 212:	83 ec 08             	sub    $0x8,%esp
 215:	68 cd 08 00 00       	push   $0x8cd
 21a:	6a 01                	push   $0x1
 21c:	e8 8b 03 00 00       	call   5ac <printf>
   exit();
 221:	e8 31 02 00 00       	call   457 <exit>

00000226 <test_and_set>:
#include "fcntl.h"
#include "user.h"
#include "x86.h"
#include "mmu.h"

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
 23a:	83 ec 14             	sub    $0x14,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE*2);
 23d:	68 00 20 00 00       	push   $0x2000
 242:	e8 8b 05 00 00       	call   7d2 <malloc>
  if(n_stack == 0){
 247:	83 c4 10             	add    $0x10,%esp
 24a:	85 c0                	test   %eax,%eax
 24c:	74 14                	je     262 <thread_create+0x2b>
    return -1;
  }
  int new_pid = clone(start_routine, arg1, arg2, n_stack); // TODO: is this the right way to call it?
 24e:	50                   	push   %eax
 24f:	ff 75 10             	push   0x10(%ebp)
 252:	ff 75 0c             	push   0xc(%ebp)
 255:	ff 75 08             	push   0x8(%ebp)
 258:	e8 9a 02 00 00       	call   4f7 <clone>


  // I can't remember if there was something else to do here but I'm sure I'll find out


  return new_pid;
 25d:	83 c4 10             	add    $0x10,%esp
}
 260:	c9                   	leave  
 261:	c3                   	ret    
    return -1;
 262:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 267:	eb f7                	jmp    260 <thread_create+0x29>

00000269 <thread_join>:

int thread_join() {
 269:	55                   	push   %ebp
 26a:	89 e5                	mov    %esp,%ebp
 26c:	83 ec 24             	sub    $0x24,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 26f:	8d 45 f4             	lea    -0xc(%ebp),%eax
 272:	50                   	push   %eax
 273:	e8 87 02 00 00       	call   4ff <join>
  
  return pid;
}
 278:	c9                   	leave  
 279:	c3                   	ret    

0000027a <lock_acquire>:

void lock_acquire(lock_t *lock){
 27a:	55                   	push   %ebp
 27b:	89 e5                	mov    %esp,%ebp
 27d:	53                   	push   %ebx
 27e:	83 ec 04             	sub    $0x4,%esp
 281:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 284:	83 ec 08             	sub    $0x8,%esp
 287:	6a 01                	push   $0x1
 289:	53                   	push   %ebx
 28a:	e8 97 ff ff ff       	call   226 <test_and_set>
 28f:	83 c4 10             	add    $0x10,%esp
 292:	83 f8 01             	cmp    $0x1,%eax
 295:	74 ed                	je     284 <lock_acquire+0xa>
    ;
}
 297:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 29a:	c9                   	leave  
 29b:	c3                   	ret    

0000029c <lock_release>:

void lock_release(lock_t *lock) {
 29c:	55                   	push   %ebp
 29d:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 29f:	8b 45 08             	mov    0x8(%ebp),%eax
 2a2:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 2a8:	5d                   	pop    %ebp
 2a9:	c3                   	ret    

000002aa <lock_init>:

void lock_init(lock_t *lock) {
 2aa:	55                   	push   %ebp
 2ab:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 2ad:	8b 45 08             	mov    0x8(%ebp),%eax
 2b0:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 2b6:	5d                   	pop    %ebp
 2b7:	c3                   	ret    

000002b8 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 2b8:	55                   	push   %ebp
 2b9:	89 e5                	mov    %esp,%ebp
 2bb:	56                   	push   %esi
 2bc:	53                   	push   %ebx
 2bd:	8b 75 08             	mov    0x8(%ebp),%esi
 2c0:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 2c3:	89 f0                	mov    %esi,%eax
 2c5:	89 d1                	mov    %edx,%ecx
 2c7:	83 c2 01             	add    $0x1,%edx
 2ca:	89 c3                	mov    %eax,%ebx
 2cc:	83 c0 01             	add    $0x1,%eax
 2cf:	0f b6 09             	movzbl (%ecx),%ecx
 2d2:	88 0b                	mov    %cl,(%ebx)
 2d4:	84 c9                	test   %cl,%cl
 2d6:	75 ed                	jne    2c5 <strcpy+0xd>
    ;
  return os;
}
 2d8:	89 f0                	mov    %esi,%eax
 2da:	5b                   	pop    %ebx
 2db:	5e                   	pop    %esi
 2dc:	5d                   	pop    %ebp
 2dd:	c3                   	ret    

000002de <strcmp>:

int
strcmp(const char *p, const char *q)
{
 2de:	55                   	push   %ebp
 2df:	89 e5                	mov    %esp,%ebp
 2e1:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2e4:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 2e7:	eb 06                	jmp    2ef <strcmp+0x11>
    p++, q++;
 2e9:	83 c1 01             	add    $0x1,%ecx
 2ec:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 2ef:	0f b6 01             	movzbl (%ecx),%eax
 2f2:	84 c0                	test   %al,%al
 2f4:	74 04                	je     2fa <strcmp+0x1c>
 2f6:	3a 02                	cmp    (%edx),%al
 2f8:	74 ef                	je     2e9 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 2fa:	0f b6 c0             	movzbl %al,%eax
 2fd:	0f b6 12             	movzbl (%edx),%edx
 300:	29 d0                	sub    %edx,%eax
}
 302:	5d                   	pop    %ebp
 303:	c3                   	ret    

00000304 <strlen>:

uint
strlen(const char *s)
{
 304:	55                   	push   %ebp
 305:	89 e5                	mov    %esp,%ebp
 307:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 30a:	b8 00 00 00 00       	mov    $0x0,%eax
 30f:	eb 03                	jmp    314 <strlen+0x10>
 311:	83 c0 01             	add    $0x1,%eax
 314:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 318:	75 f7                	jne    311 <strlen+0xd>
    ;
  return n;
}
 31a:	5d                   	pop    %ebp
 31b:	c3                   	ret    

0000031c <memset>:

void*
memset(void *dst, int c, uint n)
{
 31c:	55                   	push   %ebp
 31d:	89 e5                	mov    %esp,%ebp
 31f:	57                   	push   %edi
 320:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 323:	89 d7                	mov    %edx,%edi
 325:	8b 4d 10             	mov    0x10(%ebp),%ecx
 328:	8b 45 0c             	mov    0xc(%ebp),%eax
 32b:	fc                   	cld    
 32c:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 32e:	89 d0                	mov    %edx,%eax
 330:	8b 7d fc             	mov    -0x4(%ebp),%edi
 333:	c9                   	leave  
 334:	c3                   	ret    

00000335 <strchr>:

char*
strchr(const char *s, char c)
{
 335:	55                   	push   %ebp
 336:	89 e5                	mov    %esp,%ebp
 338:	8b 45 08             	mov    0x8(%ebp),%eax
 33b:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 33f:	eb 03                	jmp    344 <strchr+0xf>
 341:	83 c0 01             	add    $0x1,%eax
 344:	0f b6 10             	movzbl (%eax),%edx
 347:	84 d2                	test   %dl,%dl
 349:	74 06                	je     351 <strchr+0x1c>
    if(*s == c)
 34b:	38 ca                	cmp    %cl,%dl
 34d:	75 f2                	jne    341 <strchr+0xc>
 34f:	eb 05                	jmp    356 <strchr+0x21>
      return (char*)s;
  return 0;
 351:	b8 00 00 00 00       	mov    $0x0,%eax
}
 356:	5d                   	pop    %ebp
 357:	c3                   	ret    

00000358 <gets>:

char*
gets(char *buf, int max)
{
 358:	55                   	push   %ebp
 359:	89 e5                	mov    %esp,%ebp
 35b:	57                   	push   %edi
 35c:	56                   	push   %esi
 35d:	53                   	push   %ebx
 35e:	83 ec 1c             	sub    $0x1c,%esp
 361:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 364:	bb 00 00 00 00       	mov    $0x0,%ebx
 369:	89 de                	mov    %ebx,%esi
 36b:	83 c3 01             	add    $0x1,%ebx
 36e:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 371:	7d 2e                	jge    3a1 <gets+0x49>
    cc = read(0, &c, 1);
 373:	83 ec 04             	sub    $0x4,%esp
 376:	6a 01                	push   $0x1
 378:	8d 45 e7             	lea    -0x19(%ebp),%eax
 37b:	50                   	push   %eax
 37c:	6a 00                	push   $0x0
 37e:	e8 ec 00 00 00       	call   46f <read>
    if(cc < 1)
 383:	83 c4 10             	add    $0x10,%esp
 386:	85 c0                	test   %eax,%eax
 388:	7e 17                	jle    3a1 <gets+0x49>
      break;
    buf[i++] = c;
 38a:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 38e:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 391:	3c 0a                	cmp    $0xa,%al
 393:	0f 94 c2             	sete   %dl
 396:	3c 0d                	cmp    $0xd,%al
 398:	0f 94 c0             	sete   %al
 39b:	08 c2                	or     %al,%dl
 39d:	74 ca                	je     369 <gets+0x11>
    buf[i++] = c;
 39f:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 3a1:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 3a5:	89 f8                	mov    %edi,%eax
 3a7:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3aa:	5b                   	pop    %ebx
 3ab:	5e                   	pop    %esi
 3ac:	5f                   	pop    %edi
 3ad:	5d                   	pop    %ebp
 3ae:	c3                   	ret    

000003af <stat>:

int
stat(const char *n, struct stat *st)
{
 3af:	55                   	push   %ebp
 3b0:	89 e5                	mov    %esp,%ebp
 3b2:	56                   	push   %esi
 3b3:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 3b4:	83 ec 08             	sub    $0x8,%esp
 3b7:	6a 00                	push   $0x0
 3b9:	ff 75 08             	push   0x8(%ebp)
 3bc:	e8 d6 00 00 00       	call   497 <open>
  if(fd < 0)
 3c1:	83 c4 10             	add    $0x10,%esp
 3c4:	85 c0                	test   %eax,%eax
 3c6:	78 24                	js     3ec <stat+0x3d>
 3c8:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 3ca:	83 ec 08             	sub    $0x8,%esp
 3cd:	ff 75 0c             	push   0xc(%ebp)
 3d0:	50                   	push   %eax
 3d1:	e8 d9 00 00 00       	call   4af <fstat>
 3d6:	89 c6                	mov    %eax,%esi
  close(fd);
 3d8:	89 1c 24             	mov    %ebx,(%esp)
 3db:	e8 9f 00 00 00       	call   47f <close>
  return r;
 3e0:	83 c4 10             	add    $0x10,%esp
}
 3e3:	89 f0                	mov    %esi,%eax
 3e5:	8d 65 f8             	lea    -0x8(%ebp),%esp
 3e8:	5b                   	pop    %ebx
 3e9:	5e                   	pop    %esi
 3ea:	5d                   	pop    %ebp
 3eb:	c3                   	ret    
    return -1;
 3ec:	be ff ff ff ff       	mov    $0xffffffff,%esi
 3f1:	eb f0                	jmp    3e3 <stat+0x34>

000003f3 <atoi>:

int
atoi(const char *s)
{
 3f3:	55                   	push   %ebp
 3f4:	89 e5                	mov    %esp,%ebp
 3f6:	53                   	push   %ebx
 3f7:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 3fa:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 3ff:	eb 10                	jmp    411 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 401:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 404:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 407:	83 c1 01             	add    $0x1,%ecx
 40a:	0f be c0             	movsbl %al,%eax
 40d:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 411:	0f b6 01             	movzbl (%ecx),%eax
 414:	8d 58 d0             	lea    -0x30(%eax),%ebx
 417:	80 fb 09             	cmp    $0x9,%bl
 41a:	76 e5                	jbe    401 <atoi+0xe>
  return n;
}
 41c:	89 d0                	mov    %edx,%eax
 41e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 421:	c9                   	leave  
 422:	c3                   	ret    

00000423 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 423:	55                   	push   %ebp
 424:	89 e5                	mov    %esp,%ebp
 426:	56                   	push   %esi
 427:	53                   	push   %ebx
 428:	8b 75 08             	mov    0x8(%ebp),%esi
 42b:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 42e:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 431:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 433:	eb 0d                	jmp    442 <memmove+0x1f>
    *dst++ = *src++;
 435:	0f b6 01             	movzbl (%ecx),%eax
 438:	88 02                	mov    %al,(%edx)
 43a:	8d 49 01             	lea    0x1(%ecx),%ecx
 43d:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 440:	89 d8                	mov    %ebx,%eax
 442:	8d 58 ff             	lea    -0x1(%eax),%ebx
 445:	85 c0                	test   %eax,%eax
 447:	7f ec                	jg     435 <memmove+0x12>
  return vdst;
}
 449:	89 f0                	mov    %esi,%eax
 44b:	5b                   	pop    %ebx
 44c:	5e                   	pop    %esi
 44d:	5d                   	pop    %ebp
 44e:	c3                   	ret    

0000044f <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 44f:	b8 01 00 00 00       	mov    $0x1,%eax
 454:	cd 40                	int    $0x40
 456:	c3                   	ret    

00000457 <exit>:
SYSCALL(exit)
 457:	b8 02 00 00 00       	mov    $0x2,%eax
 45c:	cd 40                	int    $0x40
 45e:	c3                   	ret    

0000045f <wait>:
SYSCALL(wait)
 45f:	b8 03 00 00 00       	mov    $0x3,%eax
 464:	cd 40                	int    $0x40
 466:	c3                   	ret    

00000467 <pipe>:
SYSCALL(pipe)
 467:	b8 04 00 00 00       	mov    $0x4,%eax
 46c:	cd 40                	int    $0x40
 46e:	c3                   	ret    

0000046f <read>:
SYSCALL(read)
 46f:	b8 05 00 00 00       	mov    $0x5,%eax
 474:	cd 40                	int    $0x40
 476:	c3                   	ret    

00000477 <write>:
SYSCALL(write)
 477:	b8 10 00 00 00       	mov    $0x10,%eax
 47c:	cd 40                	int    $0x40
 47e:	c3                   	ret    

0000047f <close>:
SYSCALL(close)
 47f:	b8 15 00 00 00       	mov    $0x15,%eax
 484:	cd 40                	int    $0x40
 486:	c3                   	ret    

00000487 <kill>:
SYSCALL(kill)
 487:	b8 06 00 00 00       	mov    $0x6,%eax
 48c:	cd 40                	int    $0x40
 48e:	c3                   	ret    

0000048f <exec>:
SYSCALL(exec)
 48f:	b8 07 00 00 00       	mov    $0x7,%eax
 494:	cd 40                	int    $0x40
 496:	c3                   	ret    

00000497 <open>:
SYSCALL(open)
 497:	b8 0f 00 00 00       	mov    $0xf,%eax
 49c:	cd 40                	int    $0x40
 49e:	c3                   	ret    

0000049f <mknod>:
SYSCALL(mknod)
 49f:	b8 11 00 00 00       	mov    $0x11,%eax
 4a4:	cd 40                	int    $0x40
 4a6:	c3                   	ret    

000004a7 <unlink>:
SYSCALL(unlink)
 4a7:	b8 12 00 00 00       	mov    $0x12,%eax
 4ac:	cd 40                	int    $0x40
 4ae:	c3                   	ret    

000004af <fstat>:
SYSCALL(fstat)
 4af:	b8 08 00 00 00       	mov    $0x8,%eax
 4b4:	cd 40                	int    $0x40
 4b6:	c3                   	ret    

000004b7 <link>:
SYSCALL(link)
 4b7:	b8 13 00 00 00       	mov    $0x13,%eax
 4bc:	cd 40                	int    $0x40
 4be:	c3                   	ret    

000004bf <mkdir>:
SYSCALL(mkdir)
 4bf:	b8 14 00 00 00       	mov    $0x14,%eax
 4c4:	cd 40                	int    $0x40
 4c6:	c3                   	ret    

000004c7 <chdir>:
SYSCALL(chdir)
 4c7:	b8 09 00 00 00       	mov    $0x9,%eax
 4cc:	cd 40                	int    $0x40
 4ce:	c3                   	ret    

000004cf <dup>:
SYSCALL(dup)
 4cf:	b8 0a 00 00 00       	mov    $0xa,%eax
 4d4:	cd 40                	int    $0x40
 4d6:	c3                   	ret    

000004d7 <getpid>:
SYSCALL(getpid)
 4d7:	b8 0b 00 00 00       	mov    $0xb,%eax
 4dc:	cd 40                	int    $0x40
 4de:	c3                   	ret    

000004df <sbrk>:
SYSCALL(sbrk)
 4df:	b8 0c 00 00 00       	mov    $0xc,%eax
 4e4:	cd 40                	int    $0x40
 4e6:	c3                   	ret    

000004e7 <sleep>:
SYSCALL(sleep)
 4e7:	b8 0d 00 00 00       	mov    $0xd,%eax
 4ec:	cd 40                	int    $0x40
 4ee:	c3                   	ret    

000004ef <uptime>:
SYSCALL(uptime)
 4ef:	b8 0e 00 00 00       	mov    $0xe,%eax
 4f4:	cd 40                	int    $0x40
 4f6:	c3                   	ret    

000004f7 <clone>:
SYSCALL(clone)
 4f7:	b8 16 00 00 00       	mov    $0x16,%eax
 4fc:	cd 40                	int    $0x40
 4fe:	c3                   	ret    

000004ff <join>:
 4ff:	b8 17 00 00 00       	mov    $0x17,%eax
 504:	cd 40                	int    $0x40
 506:	c3                   	ret    

00000507 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 507:	55                   	push   %ebp
 508:	89 e5                	mov    %esp,%ebp
 50a:	83 ec 1c             	sub    $0x1c,%esp
 50d:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 510:	6a 01                	push   $0x1
 512:	8d 55 f4             	lea    -0xc(%ebp),%edx
 515:	52                   	push   %edx
 516:	50                   	push   %eax
 517:	e8 5b ff ff ff       	call   477 <write>
}
 51c:	83 c4 10             	add    $0x10,%esp
 51f:	c9                   	leave  
 520:	c3                   	ret    

00000521 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 521:	55                   	push   %ebp
 522:	89 e5                	mov    %esp,%ebp
 524:	57                   	push   %edi
 525:	56                   	push   %esi
 526:	53                   	push   %ebx
 527:	83 ec 2c             	sub    $0x2c,%esp
 52a:	89 45 d0             	mov    %eax,-0x30(%ebp)
 52d:	89 d0                	mov    %edx,%eax
 52f:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 531:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 535:	0f 95 c1             	setne  %cl
 538:	c1 ea 1f             	shr    $0x1f,%edx
 53b:	84 d1                	test   %dl,%cl
 53d:	74 44                	je     583 <printint+0x62>
    neg = 1;
    x = -xx;
 53f:	f7 d8                	neg    %eax
 541:	89 c1                	mov    %eax,%ecx
    neg = 1;
 543:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 54a:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 54f:	89 c8                	mov    %ecx,%eax
 551:	ba 00 00 00 00       	mov    $0x0,%edx
 556:	f7 f6                	div    %esi
 558:	89 df                	mov    %ebx,%edi
 55a:	83 c3 01             	add    $0x1,%ebx
 55d:	0f b6 92 78 09 00 00 	movzbl 0x978(%edx),%edx
 564:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 568:	89 ca                	mov    %ecx,%edx
 56a:	89 c1                	mov    %eax,%ecx
 56c:	39 d6                	cmp    %edx,%esi
 56e:	76 df                	jbe    54f <printint+0x2e>
  if(neg)
 570:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 574:	74 31                	je     5a7 <printint+0x86>
    buf[i++] = '-';
 576:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 57b:	8d 5f 02             	lea    0x2(%edi),%ebx
 57e:	8b 75 d0             	mov    -0x30(%ebp),%esi
 581:	eb 17                	jmp    59a <printint+0x79>
    x = xx;
 583:	89 c1                	mov    %eax,%ecx
  neg = 0;
 585:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 58c:	eb bc                	jmp    54a <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 58e:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 593:	89 f0                	mov    %esi,%eax
 595:	e8 6d ff ff ff       	call   507 <putc>
  while(--i >= 0)
 59a:	83 eb 01             	sub    $0x1,%ebx
 59d:	79 ef                	jns    58e <printint+0x6d>
}
 59f:	83 c4 2c             	add    $0x2c,%esp
 5a2:	5b                   	pop    %ebx
 5a3:	5e                   	pop    %esi
 5a4:	5f                   	pop    %edi
 5a5:	5d                   	pop    %ebp
 5a6:	c3                   	ret    
 5a7:	8b 75 d0             	mov    -0x30(%ebp),%esi
 5aa:	eb ee                	jmp    59a <printint+0x79>

000005ac <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5ac:	55                   	push   %ebp
 5ad:	89 e5                	mov    %esp,%ebp
 5af:	57                   	push   %edi
 5b0:	56                   	push   %esi
 5b1:	53                   	push   %ebx
 5b2:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 5b5:	8d 45 10             	lea    0x10(%ebp),%eax
 5b8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 5bb:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 5c0:	bb 00 00 00 00       	mov    $0x0,%ebx
 5c5:	eb 14                	jmp    5db <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 5c7:	89 fa                	mov    %edi,%edx
 5c9:	8b 45 08             	mov    0x8(%ebp),%eax
 5cc:	e8 36 ff ff ff       	call   507 <putc>
 5d1:	eb 05                	jmp    5d8 <printf+0x2c>
      }
    } else if(state == '%'){
 5d3:	83 fe 25             	cmp    $0x25,%esi
 5d6:	74 25                	je     5fd <printf+0x51>
  for(i = 0; fmt[i]; i++){
 5d8:	83 c3 01             	add    $0x1,%ebx
 5db:	8b 45 0c             	mov    0xc(%ebp),%eax
 5de:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 5e2:	84 c0                	test   %al,%al
 5e4:	0f 84 20 01 00 00    	je     70a <printf+0x15e>
    c = fmt[i] & 0xff;
 5ea:	0f be f8             	movsbl %al,%edi
 5ed:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 5f0:	85 f6                	test   %esi,%esi
 5f2:	75 df                	jne    5d3 <printf+0x27>
      if(c == '%'){
 5f4:	83 f8 25             	cmp    $0x25,%eax
 5f7:	75 ce                	jne    5c7 <printf+0x1b>
        state = '%';
 5f9:	89 c6                	mov    %eax,%esi
 5fb:	eb db                	jmp    5d8 <printf+0x2c>
      if(c == 'd'){
 5fd:	83 f8 25             	cmp    $0x25,%eax
 600:	0f 84 cf 00 00 00    	je     6d5 <printf+0x129>
 606:	0f 8c dd 00 00 00    	jl     6e9 <printf+0x13d>
 60c:	83 f8 78             	cmp    $0x78,%eax
 60f:	0f 8f d4 00 00 00    	jg     6e9 <printf+0x13d>
 615:	83 f8 63             	cmp    $0x63,%eax
 618:	0f 8c cb 00 00 00    	jl     6e9 <printf+0x13d>
 61e:	83 e8 63             	sub    $0x63,%eax
 621:	83 f8 15             	cmp    $0x15,%eax
 624:	0f 87 bf 00 00 00    	ja     6e9 <printf+0x13d>
 62a:	ff 24 85 20 09 00 00 	jmp    *0x920(,%eax,4)
        printint(fd, *ap, 10, 1);
 631:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 634:	8b 17                	mov    (%edi),%edx
 636:	83 ec 0c             	sub    $0xc,%esp
 639:	6a 01                	push   $0x1
 63b:	b9 0a 00 00 00       	mov    $0xa,%ecx
 640:	8b 45 08             	mov    0x8(%ebp),%eax
 643:	e8 d9 fe ff ff       	call   521 <printint>
        ap++;
 648:	83 c7 04             	add    $0x4,%edi
 64b:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 64e:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 651:	be 00 00 00 00       	mov    $0x0,%esi
 656:	eb 80                	jmp    5d8 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 658:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 65b:	8b 17                	mov    (%edi),%edx
 65d:	83 ec 0c             	sub    $0xc,%esp
 660:	6a 00                	push   $0x0
 662:	b9 10 00 00 00       	mov    $0x10,%ecx
 667:	8b 45 08             	mov    0x8(%ebp),%eax
 66a:	e8 b2 fe ff ff       	call   521 <printint>
        ap++;
 66f:	83 c7 04             	add    $0x4,%edi
 672:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 675:	83 c4 10             	add    $0x10,%esp
      state = 0;
 678:	be 00 00 00 00       	mov    $0x0,%esi
 67d:	e9 56 ff ff ff       	jmp    5d8 <printf+0x2c>
        s = (char*)*ap;
 682:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 685:	8b 30                	mov    (%eax),%esi
        ap++;
 687:	83 c0 04             	add    $0x4,%eax
 68a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 68d:	85 f6                	test   %esi,%esi
 68f:	75 15                	jne    6a6 <printf+0xfa>
          s = "(null)";
 691:	be 18 09 00 00       	mov    $0x918,%esi
 696:	eb 0e                	jmp    6a6 <printf+0xfa>
          putc(fd, *s);
 698:	0f be d2             	movsbl %dl,%edx
 69b:	8b 45 08             	mov    0x8(%ebp),%eax
 69e:	e8 64 fe ff ff       	call   507 <putc>
          s++;
 6a3:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 6a6:	0f b6 16             	movzbl (%esi),%edx
 6a9:	84 d2                	test   %dl,%dl
 6ab:	75 eb                	jne    698 <printf+0xec>
      state = 0;
 6ad:	be 00 00 00 00       	mov    $0x0,%esi
 6b2:	e9 21 ff ff ff       	jmp    5d8 <printf+0x2c>
        putc(fd, *ap);
 6b7:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6ba:	0f be 17             	movsbl (%edi),%edx
 6bd:	8b 45 08             	mov    0x8(%ebp),%eax
 6c0:	e8 42 fe ff ff       	call   507 <putc>
        ap++;
 6c5:	83 c7 04             	add    $0x4,%edi
 6c8:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 6cb:	be 00 00 00 00       	mov    $0x0,%esi
 6d0:	e9 03 ff ff ff       	jmp    5d8 <printf+0x2c>
        putc(fd, c);
 6d5:	89 fa                	mov    %edi,%edx
 6d7:	8b 45 08             	mov    0x8(%ebp),%eax
 6da:	e8 28 fe ff ff       	call   507 <putc>
      state = 0;
 6df:	be 00 00 00 00       	mov    $0x0,%esi
 6e4:	e9 ef fe ff ff       	jmp    5d8 <printf+0x2c>
        putc(fd, '%');
 6e9:	ba 25 00 00 00       	mov    $0x25,%edx
 6ee:	8b 45 08             	mov    0x8(%ebp),%eax
 6f1:	e8 11 fe ff ff       	call   507 <putc>
        putc(fd, c);
 6f6:	89 fa                	mov    %edi,%edx
 6f8:	8b 45 08             	mov    0x8(%ebp),%eax
 6fb:	e8 07 fe ff ff       	call   507 <putc>
      state = 0;
 700:	be 00 00 00 00       	mov    $0x0,%esi
 705:	e9 ce fe ff ff       	jmp    5d8 <printf+0x2c>
    }
  }
}
 70a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 70d:	5b                   	pop    %ebx
 70e:	5e                   	pop    %esi
 70f:	5f                   	pop    %edi
 710:	5d                   	pop    %ebp
 711:	c3                   	ret    

00000712 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 712:	55                   	push   %ebp
 713:	89 e5                	mov    %esp,%ebp
 715:	57                   	push   %edi
 716:	56                   	push   %esi
 717:	53                   	push   %ebx
 718:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 71b:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 71e:	a1 0c 0d 00 00       	mov    0xd0c,%eax
 723:	eb 02                	jmp    727 <free+0x15>
 725:	89 d0                	mov    %edx,%eax
 727:	39 c8                	cmp    %ecx,%eax
 729:	73 04                	jae    72f <free+0x1d>
 72b:	39 08                	cmp    %ecx,(%eax)
 72d:	77 12                	ja     741 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 72f:	8b 10                	mov    (%eax),%edx
 731:	39 c2                	cmp    %eax,%edx
 733:	77 f0                	ja     725 <free+0x13>
 735:	39 c8                	cmp    %ecx,%eax
 737:	72 08                	jb     741 <free+0x2f>
 739:	39 ca                	cmp    %ecx,%edx
 73b:	77 04                	ja     741 <free+0x2f>
 73d:	89 d0                	mov    %edx,%eax
 73f:	eb e6                	jmp    727 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 741:	8b 73 fc             	mov    -0x4(%ebx),%esi
 744:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 747:	8b 10                	mov    (%eax),%edx
 749:	39 d7                	cmp    %edx,%edi
 74b:	74 19                	je     766 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 74d:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 750:	8b 50 04             	mov    0x4(%eax),%edx
 753:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 756:	39 ce                	cmp    %ecx,%esi
 758:	74 1b                	je     775 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 75a:	89 08                	mov    %ecx,(%eax)
  freep = p;
 75c:	a3 0c 0d 00 00       	mov    %eax,0xd0c
}
 761:	5b                   	pop    %ebx
 762:	5e                   	pop    %esi
 763:	5f                   	pop    %edi
 764:	5d                   	pop    %ebp
 765:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 766:	03 72 04             	add    0x4(%edx),%esi
 769:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 76c:	8b 10                	mov    (%eax),%edx
 76e:	8b 12                	mov    (%edx),%edx
 770:	89 53 f8             	mov    %edx,-0x8(%ebx)
 773:	eb db                	jmp    750 <free+0x3e>
    p->s.size += bp->s.size;
 775:	03 53 fc             	add    -0x4(%ebx),%edx
 778:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 77b:	8b 53 f8             	mov    -0x8(%ebx),%edx
 77e:	89 10                	mov    %edx,(%eax)
 780:	eb da                	jmp    75c <free+0x4a>

00000782 <morecore>:

static Header*
morecore(uint nu)
{
 782:	55                   	push   %ebp
 783:	89 e5                	mov    %esp,%ebp
 785:	53                   	push   %ebx
 786:	83 ec 04             	sub    $0x4,%esp
 789:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 78b:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 790:	77 05                	ja     797 <morecore+0x15>
    nu = 4096;
 792:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 797:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 79e:	83 ec 0c             	sub    $0xc,%esp
 7a1:	50                   	push   %eax
 7a2:	e8 38 fd ff ff       	call   4df <sbrk>
  if(p == (char*)-1)
 7a7:	83 c4 10             	add    $0x10,%esp
 7aa:	83 f8 ff             	cmp    $0xffffffff,%eax
 7ad:	74 1c                	je     7cb <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 7af:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 7b2:	83 c0 08             	add    $0x8,%eax
 7b5:	83 ec 0c             	sub    $0xc,%esp
 7b8:	50                   	push   %eax
 7b9:	e8 54 ff ff ff       	call   712 <free>
  return freep;
 7be:	a1 0c 0d 00 00       	mov    0xd0c,%eax
 7c3:	83 c4 10             	add    $0x10,%esp
}
 7c6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 7c9:	c9                   	leave  
 7ca:	c3                   	ret    
    return 0;
 7cb:	b8 00 00 00 00       	mov    $0x0,%eax
 7d0:	eb f4                	jmp    7c6 <morecore+0x44>

000007d2 <malloc>:

void*
malloc(uint nbytes)
{
 7d2:	55                   	push   %ebp
 7d3:	89 e5                	mov    %esp,%ebp
 7d5:	53                   	push   %ebx
 7d6:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7d9:	8b 45 08             	mov    0x8(%ebp),%eax
 7dc:	8d 58 07             	lea    0x7(%eax),%ebx
 7df:	c1 eb 03             	shr    $0x3,%ebx
 7e2:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 7e5:	8b 0d 0c 0d 00 00    	mov    0xd0c,%ecx
 7eb:	85 c9                	test   %ecx,%ecx
 7ed:	74 04                	je     7f3 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7ef:	8b 01                	mov    (%ecx),%eax
 7f1:	eb 4a                	jmp    83d <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 7f3:	c7 05 0c 0d 00 00 10 	movl   $0xd10,0xd0c
 7fa:	0d 00 00 
 7fd:	c7 05 10 0d 00 00 10 	movl   $0xd10,0xd10
 804:	0d 00 00 
    base.s.size = 0;
 807:	c7 05 14 0d 00 00 00 	movl   $0x0,0xd14
 80e:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 811:	b9 10 0d 00 00       	mov    $0xd10,%ecx
 816:	eb d7                	jmp    7ef <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 818:	74 19                	je     833 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 81a:	29 da                	sub    %ebx,%edx
 81c:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 81f:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 822:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 825:	89 0d 0c 0d 00 00    	mov    %ecx,0xd0c
      return (void*)(p + 1);
 82b:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 82e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 831:	c9                   	leave  
 832:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 833:	8b 10                	mov    (%eax),%edx
 835:	89 11                	mov    %edx,(%ecx)
 837:	eb ec                	jmp    825 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 839:	89 c1                	mov    %eax,%ecx
 83b:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 83d:	8b 50 04             	mov    0x4(%eax),%edx
 840:	39 da                	cmp    %ebx,%edx
 842:	73 d4                	jae    818 <malloc+0x46>
    if(p == freep)
 844:	39 05 0c 0d 00 00    	cmp    %eax,0xd0c
 84a:	75 ed                	jne    839 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 84c:	89 d8                	mov    %ebx,%eax
 84e:	e8 2f ff ff ff       	call   782 <morecore>
 853:	85 c0                	test   %eax,%eax
 855:	75 e2                	jne    839 <malloc+0x67>
 857:	eb d5                	jmp    82e <malloc+0x5c>
