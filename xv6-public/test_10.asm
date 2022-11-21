
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
  1c:	a1 1c 0d 00 00       	mov    0xd1c,%eax
  21:	83 f8 01             	cmp    $0x1,%eax
  24:	0f 84 db 00 00 00    	je     105 <worker+0x105>
  2a:	6a 2f                	push   $0x2f
  2c:	68 98 08 00 00       	push   $0x898
  31:	68 a2 08 00 00       	push   $0x8a2
  36:	6a 01                	push   $0x1
  38:	e8 ac 05 00 00       	call   5e9 <printf>
  3d:	83 c4 0c             	add    $0xc,%esp
  40:	68 e9 08 00 00       	push   $0x8e9
  45:	68 b9 08 00 00       	push   $0x8b9
  4a:	6a 01                	push   $0x1
  4c:	e8 98 05 00 00       	call   5e9 <printf>
  51:	83 c4 08             	add    $0x8,%esp
  54:	68 cd 08 00 00       	push   $0x8cd
  59:	6a 01                	push   $0x1
  5b:	e8 89 05 00 00       	call   5e9 <printf>
  60:	83 c4 04             	add    $0x4,%esp
  63:	ff 35 20 0d 00 00    	push   0xd20
  69:	e8 56 04 00 00       	call   4c4 <kill>
  6e:	e8 21 04 00 00       	call   494 <exit>
   assert(arg1_int == 35);
  73:	6a 2d                	push   $0x2d
  75:	68 98 08 00 00       	push   $0x898
  7a:	68 a2 08 00 00       	push   $0x8a2
  7f:	6a 01                	push   $0x1
  81:	e8 63 05 00 00       	call   5e9 <printf>
  86:	83 c4 0c             	add    $0xc,%esp
  89:	68 aa 08 00 00       	push   $0x8aa
  8e:	68 b9 08 00 00       	push   $0x8b9
  93:	6a 01                	push   $0x1
  95:	e8 4f 05 00 00       	call   5e9 <printf>
  9a:	83 c4 08             	add    $0x8,%esp
  9d:	68 cd 08 00 00       	push   $0x8cd
  a2:	6a 01                	push   $0x1
  a4:	e8 40 05 00 00       	call   5e9 <printf>
  a9:	83 c4 04             	add    $0x4,%esp
  ac:	ff 35 20 0d 00 00    	push   0xd20
  b2:	e8 0d 04 00 00       	call   4c4 <kill>
  b7:	e8 d8 03 00 00       	call   494 <exit>
   assert(arg2_int == 42);
  bc:	6a 2e                	push   $0x2e
  be:	68 98 08 00 00       	push   $0x898
  c3:	68 a2 08 00 00       	push   $0x8a2
  c8:	6a 01                	push   $0x1
  ca:	e8 1a 05 00 00       	call   5e9 <printf>
  cf:	83 c4 0c             	add    $0xc,%esp
  d2:	68 da 08 00 00       	push   $0x8da
  d7:	68 b9 08 00 00       	push   $0x8b9
  dc:	6a 01                	push   $0x1
  de:	e8 06 05 00 00       	call   5e9 <printf>
  e3:	83 c4 08             	add    $0x8,%esp
  e6:	68 cd 08 00 00       	push   $0x8cd
  eb:	6a 01                	push   $0x1
  ed:	e8 f7 04 00 00       	call   5e9 <printf>
  f2:	83 c4 04             	add    $0x4,%esp
  f5:	ff 35 20 0d 00 00    	push   0xd20
  fb:	e8 c4 03 00 00       	call   4c4 <kill>
 100:	e8 8f 03 00 00       	call   494 <exit>
   global++;
 105:	83 c0 01             	add    $0x1,%eax
 108:	a3 1c 0d 00 00       	mov    %eax,0xd1c
   exit();
 10d:	e8 82 03 00 00       	call   494 <exit>

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
 124:	e8 eb 03 00 00       	call   514 <getpid>
 129:	a3 20 0d 00 00       	mov    %eax,0xd20
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
 15a:	e8 47 01 00 00       	call   2a6 <thread_join>
   assert(join_pid == thread_pid);
 15f:	39 c3                	cmp    %eax,%ebx
 161:	0f 85 9f 00 00 00    	jne    206 <main+0xf4>
   assert(global == 2);
 167:	83 3d 1c 0d 00 00 02 	cmpl   $0x2,0xd1c
 16e:	0f 84 db 00 00 00    	je     24f <main+0x13d>
 174:	6a 23                	push   $0x23
 176:	68 98 08 00 00       	push   $0x898
 17b:	68 a2 08 00 00       	push   $0x8a2
 180:	6a 01                	push   $0x1
 182:	e8 62 04 00 00       	call   5e9 <printf>
 187:	83 c4 0c             	add    $0xc,%esp
 18a:	68 1b 09 00 00       	push   $0x91b
 18f:	68 b9 08 00 00       	push   $0x8b9
 194:	6a 01                	push   $0x1
 196:	e8 4e 04 00 00       	call   5e9 <printf>
 19b:	83 c4 08             	add    $0x8,%esp
 19e:	68 cd 08 00 00       	push   $0x8cd
 1a3:	6a 01                	push   $0x1
 1a5:	e8 3f 04 00 00       	call   5e9 <printf>
 1aa:	83 c4 04             	add    $0x4,%esp
 1ad:	ff 35 20 0d 00 00    	push   0xd20
 1b3:	e8 0c 03 00 00       	call   4c4 <kill>
 1b8:	e8 d7 02 00 00       	call   494 <exit>
   assert(thread_pid > 0);
 1bd:	6a 1f                	push   $0x1f
 1bf:	68 98 08 00 00       	push   $0x898
 1c4:	68 a2 08 00 00       	push   $0x8a2
 1c9:	6a 01                	push   $0x1
 1cb:	e8 19 04 00 00       	call   5e9 <printf>
 1d0:	83 c4 0c             	add    $0xc,%esp
 1d3:	68 f5 08 00 00       	push   $0x8f5
 1d8:	68 b9 08 00 00       	push   $0x8b9
 1dd:	6a 01                	push   $0x1
 1df:	e8 05 04 00 00       	call   5e9 <printf>
 1e4:	83 c4 08             	add    $0x8,%esp
 1e7:	68 cd 08 00 00       	push   $0x8cd
 1ec:	6a 01                	push   $0x1
 1ee:	e8 f6 03 00 00       	call   5e9 <printf>
 1f3:	83 c4 04             	add    $0x4,%esp
 1f6:	ff 35 20 0d 00 00    	push   0xd20
 1fc:	e8 c3 02 00 00       	call   4c4 <kill>
 201:	e8 8e 02 00 00       	call   494 <exit>
   assert(join_pid == thread_pid);
 206:	6a 22                	push   $0x22
 208:	68 98 08 00 00       	push   $0x898
 20d:	68 a2 08 00 00       	push   $0x8a2
 212:	6a 01                	push   $0x1
 214:	e8 d0 03 00 00       	call   5e9 <printf>
 219:	83 c4 0c             	add    $0xc,%esp
 21c:	68 04 09 00 00       	push   $0x904
 221:	68 b9 08 00 00       	push   $0x8b9
 226:	6a 01                	push   $0x1
 228:	e8 bc 03 00 00       	call   5e9 <printf>
 22d:	83 c4 08             	add    $0x8,%esp
 230:	68 cd 08 00 00       	push   $0x8cd
 235:	6a 01                	push   $0x1
 237:	e8 ad 03 00 00       	call   5e9 <printf>
 23c:	83 c4 04             	add    $0x4,%esp
 23f:	ff 35 20 0d 00 00    	push   0xd20
 245:	e8 7a 02 00 00       	call   4c4 <kill>
 24a:	e8 45 02 00 00       	call   494 <exit>
   printf(1, "TEST PASSED\n");
 24f:	83 ec 08             	sub    $0x8,%esp
 252:	68 27 09 00 00       	push   $0x927
 257:	6a 01                	push   $0x1
 259:	e8 8b 03 00 00       	call   5e9 <printf>
   exit();
 25e:	e8 31 02 00 00       	call   494 <exit>

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
  void *n_stack = malloc(PGSIZE*2);
 27a:	68 00 20 00 00       	push   $0x2000
 27f:	e8 8b 05 00 00       	call   80f <malloc>
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
 295:	e8 9a 02 00 00       	call   534 <clone>


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
 2a6:	55                   	push   %ebp
 2a7:	89 e5                	mov    %esp,%ebp
 2a9:	83 ec 24             	sub    $0x24,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 2ac:	8d 45 f4             	lea    -0xc(%ebp),%eax
 2af:	50                   	push   %eax
 2b0:	e8 87 02 00 00       	call   53c <join>
  
  return pid;
}
 2b5:	c9                   	leave  
 2b6:	c3                   	ret    

000002b7 <lock_acquire>:

void lock_acquire(lock_t *lock){
 2b7:	55                   	push   %ebp
 2b8:	89 e5                	mov    %esp,%ebp
 2ba:	53                   	push   %ebx
 2bb:	83 ec 04             	sub    $0x4,%esp
 2be:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 2c1:	83 ec 08             	sub    $0x8,%esp
 2c4:	6a 01                	push   $0x1
 2c6:	53                   	push   %ebx
 2c7:	e8 97 ff ff ff       	call   263 <test_and_set>
 2cc:	83 c4 10             	add    $0x10,%esp
 2cf:	83 f8 01             	cmp    $0x1,%eax
 2d2:	74 ed                	je     2c1 <lock_acquire+0xa>
    ;
}
 2d4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2d7:	c9                   	leave  
 2d8:	c3                   	ret    

000002d9 <lock_release>:

void lock_release(lock_t *lock) {
 2d9:	55                   	push   %ebp
 2da:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 2dc:	8b 45 08             	mov    0x8(%ebp),%eax
 2df:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 2e5:	5d                   	pop    %ebp
 2e6:	c3                   	ret    

000002e7 <lock_init>:

void lock_init(lock_t *lock) {
 2e7:	55                   	push   %ebp
 2e8:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 2ea:	8b 45 08             	mov    0x8(%ebp),%eax
 2ed:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 2f3:	5d                   	pop    %ebp
 2f4:	c3                   	ret    

000002f5 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 2f5:	55                   	push   %ebp
 2f6:	89 e5                	mov    %esp,%ebp
 2f8:	56                   	push   %esi
 2f9:	53                   	push   %ebx
 2fa:	8b 75 08             	mov    0x8(%ebp),%esi
 2fd:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 300:	89 f0                	mov    %esi,%eax
 302:	89 d1                	mov    %edx,%ecx
 304:	83 c2 01             	add    $0x1,%edx
 307:	89 c3                	mov    %eax,%ebx
 309:	83 c0 01             	add    $0x1,%eax
 30c:	0f b6 09             	movzbl (%ecx),%ecx
 30f:	88 0b                	mov    %cl,(%ebx)
 311:	84 c9                	test   %cl,%cl
 313:	75 ed                	jne    302 <strcpy+0xd>
    ;
  return os;
}
 315:	89 f0                	mov    %esi,%eax
 317:	5b                   	pop    %ebx
 318:	5e                   	pop    %esi
 319:	5d                   	pop    %ebp
 31a:	c3                   	ret    

0000031b <strcmp>:

int
strcmp(const char *p, const char *q)
{
 31b:	55                   	push   %ebp
 31c:	89 e5                	mov    %esp,%ebp
 31e:	8b 4d 08             	mov    0x8(%ebp),%ecx
 321:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 324:	eb 06                	jmp    32c <strcmp+0x11>
    p++, q++;
 326:	83 c1 01             	add    $0x1,%ecx
 329:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 32c:	0f b6 01             	movzbl (%ecx),%eax
 32f:	84 c0                	test   %al,%al
 331:	74 04                	je     337 <strcmp+0x1c>
 333:	3a 02                	cmp    (%edx),%al
 335:	74 ef                	je     326 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 337:	0f b6 c0             	movzbl %al,%eax
 33a:	0f b6 12             	movzbl (%edx),%edx
 33d:	29 d0                	sub    %edx,%eax
}
 33f:	5d                   	pop    %ebp
 340:	c3                   	ret    

00000341 <strlen>:

uint
strlen(const char *s)
{
 341:	55                   	push   %ebp
 342:	89 e5                	mov    %esp,%ebp
 344:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 347:	b8 00 00 00 00       	mov    $0x0,%eax
 34c:	eb 03                	jmp    351 <strlen+0x10>
 34e:	83 c0 01             	add    $0x1,%eax
 351:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 355:	75 f7                	jne    34e <strlen+0xd>
    ;
  return n;
}
 357:	5d                   	pop    %ebp
 358:	c3                   	ret    

00000359 <memset>:

void*
memset(void *dst, int c, uint n)
{
 359:	55                   	push   %ebp
 35a:	89 e5                	mov    %esp,%ebp
 35c:	57                   	push   %edi
 35d:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 360:	89 d7                	mov    %edx,%edi
 362:	8b 4d 10             	mov    0x10(%ebp),%ecx
 365:	8b 45 0c             	mov    0xc(%ebp),%eax
 368:	fc                   	cld    
 369:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 36b:	89 d0                	mov    %edx,%eax
 36d:	8b 7d fc             	mov    -0x4(%ebp),%edi
 370:	c9                   	leave  
 371:	c3                   	ret    

00000372 <strchr>:

char*
strchr(const char *s, char c)
{
 372:	55                   	push   %ebp
 373:	89 e5                	mov    %esp,%ebp
 375:	8b 45 08             	mov    0x8(%ebp),%eax
 378:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 37c:	eb 03                	jmp    381 <strchr+0xf>
 37e:	83 c0 01             	add    $0x1,%eax
 381:	0f b6 10             	movzbl (%eax),%edx
 384:	84 d2                	test   %dl,%dl
 386:	74 06                	je     38e <strchr+0x1c>
    if(*s == c)
 388:	38 ca                	cmp    %cl,%dl
 38a:	75 f2                	jne    37e <strchr+0xc>
 38c:	eb 05                	jmp    393 <strchr+0x21>
      return (char*)s;
  return 0;
 38e:	b8 00 00 00 00       	mov    $0x0,%eax
}
 393:	5d                   	pop    %ebp
 394:	c3                   	ret    

00000395 <gets>:

char*
gets(char *buf, int max)
{
 395:	55                   	push   %ebp
 396:	89 e5                	mov    %esp,%ebp
 398:	57                   	push   %edi
 399:	56                   	push   %esi
 39a:	53                   	push   %ebx
 39b:	83 ec 1c             	sub    $0x1c,%esp
 39e:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 3a1:	bb 00 00 00 00       	mov    $0x0,%ebx
 3a6:	89 de                	mov    %ebx,%esi
 3a8:	83 c3 01             	add    $0x1,%ebx
 3ab:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 3ae:	7d 2e                	jge    3de <gets+0x49>
    cc = read(0, &c, 1);
 3b0:	83 ec 04             	sub    $0x4,%esp
 3b3:	6a 01                	push   $0x1
 3b5:	8d 45 e7             	lea    -0x19(%ebp),%eax
 3b8:	50                   	push   %eax
 3b9:	6a 00                	push   $0x0
 3bb:	e8 ec 00 00 00       	call   4ac <read>
    if(cc < 1)
 3c0:	83 c4 10             	add    $0x10,%esp
 3c3:	85 c0                	test   %eax,%eax
 3c5:	7e 17                	jle    3de <gets+0x49>
      break;
    buf[i++] = c;
 3c7:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 3cb:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 3ce:	3c 0a                	cmp    $0xa,%al
 3d0:	0f 94 c2             	sete   %dl
 3d3:	3c 0d                	cmp    $0xd,%al
 3d5:	0f 94 c0             	sete   %al
 3d8:	08 c2                	or     %al,%dl
 3da:	74 ca                	je     3a6 <gets+0x11>
    buf[i++] = c;
 3dc:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 3de:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 3e2:	89 f8                	mov    %edi,%eax
 3e4:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3e7:	5b                   	pop    %ebx
 3e8:	5e                   	pop    %esi
 3e9:	5f                   	pop    %edi
 3ea:	5d                   	pop    %ebp
 3eb:	c3                   	ret    

000003ec <stat>:

int
stat(const char *n, struct stat *st)
{
 3ec:	55                   	push   %ebp
 3ed:	89 e5                	mov    %esp,%ebp
 3ef:	56                   	push   %esi
 3f0:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 3f1:	83 ec 08             	sub    $0x8,%esp
 3f4:	6a 00                	push   $0x0
 3f6:	ff 75 08             	push   0x8(%ebp)
 3f9:	e8 d6 00 00 00       	call   4d4 <open>
  if(fd < 0)
 3fe:	83 c4 10             	add    $0x10,%esp
 401:	85 c0                	test   %eax,%eax
 403:	78 24                	js     429 <stat+0x3d>
 405:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 407:	83 ec 08             	sub    $0x8,%esp
 40a:	ff 75 0c             	push   0xc(%ebp)
 40d:	50                   	push   %eax
 40e:	e8 d9 00 00 00       	call   4ec <fstat>
 413:	89 c6                	mov    %eax,%esi
  close(fd);
 415:	89 1c 24             	mov    %ebx,(%esp)
 418:	e8 9f 00 00 00       	call   4bc <close>
  return r;
 41d:	83 c4 10             	add    $0x10,%esp
}
 420:	89 f0                	mov    %esi,%eax
 422:	8d 65 f8             	lea    -0x8(%ebp),%esp
 425:	5b                   	pop    %ebx
 426:	5e                   	pop    %esi
 427:	5d                   	pop    %ebp
 428:	c3                   	ret    
    return -1;
 429:	be ff ff ff ff       	mov    $0xffffffff,%esi
 42e:	eb f0                	jmp    420 <stat+0x34>

00000430 <atoi>:

int
atoi(const char *s)
{
 430:	55                   	push   %ebp
 431:	89 e5                	mov    %esp,%ebp
 433:	53                   	push   %ebx
 434:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 437:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 43c:	eb 10                	jmp    44e <atoi+0x1e>
    n = n*10 + *s++ - '0';
 43e:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 441:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 444:	83 c1 01             	add    $0x1,%ecx
 447:	0f be c0             	movsbl %al,%eax
 44a:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 44e:	0f b6 01             	movzbl (%ecx),%eax
 451:	8d 58 d0             	lea    -0x30(%eax),%ebx
 454:	80 fb 09             	cmp    $0x9,%bl
 457:	76 e5                	jbe    43e <atoi+0xe>
  return n;
}
 459:	89 d0                	mov    %edx,%eax
 45b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 45e:	c9                   	leave  
 45f:	c3                   	ret    

00000460 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 460:	55                   	push   %ebp
 461:	89 e5                	mov    %esp,%ebp
 463:	56                   	push   %esi
 464:	53                   	push   %ebx
 465:	8b 75 08             	mov    0x8(%ebp),%esi
 468:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 46b:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 46e:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 470:	eb 0d                	jmp    47f <memmove+0x1f>
    *dst++ = *src++;
 472:	0f b6 01             	movzbl (%ecx),%eax
 475:	88 02                	mov    %al,(%edx)
 477:	8d 49 01             	lea    0x1(%ecx),%ecx
 47a:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 47d:	89 d8                	mov    %ebx,%eax
 47f:	8d 58 ff             	lea    -0x1(%eax),%ebx
 482:	85 c0                	test   %eax,%eax
 484:	7f ec                	jg     472 <memmove+0x12>
  return vdst;
}
 486:	89 f0                	mov    %esi,%eax
 488:	5b                   	pop    %ebx
 489:	5e                   	pop    %esi
 48a:	5d                   	pop    %ebp
 48b:	c3                   	ret    

0000048c <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 48c:	b8 01 00 00 00       	mov    $0x1,%eax
 491:	cd 40                	int    $0x40
 493:	c3                   	ret    

00000494 <exit>:
SYSCALL(exit)
 494:	b8 02 00 00 00       	mov    $0x2,%eax
 499:	cd 40                	int    $0x40
 49b:	c3                   	ret    

0000049c <wait>:
SYSCALL(wait)
 49c:	b8 03 00 00 00       	mov    $0x3,%eax
 4a1:	cd 40                	int    $0x40
 4a3:	c3                   	ret    

000004a4 <pipe>:
SYSCALL(pipe)
 4a4:	b8 04 00 00 00       	mov    $0x4,%eax
 4a9:	cd 40                	int    $0x40
 4ab:	c3                   	ret    

000004ac <read>:
SYSCALL(read)
 4ac:	b8 05 00 00 00       	mov    $0x5,%eax
 4b1:	cd 40                	int    $0x40
 4b3:	c3                   	ret    

000004b4 <write>:
SYSCALL(write)
 4b4:	b8 10 00 00 00       	mov    $0x10,%eax
 4b9:	cd 40                	int    $0x40
 4bb:	c3                   	ret    

000004bc <close>:
SYSCALL(close)
 4bc:	b8 15 00 00 00       	mov    $0x15,%eax
 4c1:	cd 40                	int    $0x40
 4c3:	c3                   	ret    

000004c4 <kill>:
SYSCALL(kill)
 4c4:	b8 06 00 00 00       	mov    $0x6,%eax
 4c9:	cd 40                	int    $0x40
 4cb:	c3                   	ret    

000004cc <exec>:
SYSCALL(exec)
 4cc:	b8 07 00 00 00       	mov    $0x7,%eax
 4d1:	cd 40                	int    $0x40
 4d3:	c3                   	ret    

000004d4 <open>:
SYSCALL(open)
 4d4:	b8 0f 00 00 00       	mov    $0xf,%eax
 4d9:	cd 40                	int    $0x40
 4db:	c3                   	ret    

000004dc <mknod>:
SYSCALL(mknod)
 4dc:	b8 11 00 00 00       	mov    $0x11,%eax
 4e1:	cd 40                	int    $0x40
 4e3:	c3                   	ret    

000004e4 <unlink>:
SYSCALL(unlink)
 4e4:	b8 12 00 00 00       	mov    $0x12,%eax
 4e9:	cd 40                	int    $0x40
 4eb:	c3                   	ret    

000004ec <fstat>:
SYSCALL(fstat)
 4ec:	b8 08 00 00 00       	mov    $0x8,%eax
 4f1:	cd 40                	int    $0x40
 4f3:	c3                   	ret    

000004f4 <link>:
SYSCALL(link)
 4f4:	b8 13 00 00 00       	mov    $0x13,%eax
 4f9:	cd 40                	int    $0x40
 4fb:	c3                   	ret    

000004fc <mkdir>:
SYSCALL(mkdir)
 4fc:	b8 14 00 00 00       	mov    $0x14,%eax
 501:	cd 40                	int    $0x40
 503:	c3                   	ret    

00000504 <chdir>:
SYSCALL(chdir)
 504:	b8 09 00 00 00       	mov    $0x9,%eax
 509:	cd 40                	int    $0x40
 50b:	c3                   	ret    

0000050c <dup>:
SYSCALL(dup)
 50c:	b8 0a 00 00 00       	mov    $0xa,%eax
 511:	cd 40                	int    $0x40
 513:	c3                   	ret    

00000514 <getpid>:
SYSCALL(getpid)
 514:	b8 0b 00 00 00       	mov    $0xb,%eax
 519:	cd 40                	int    $0x40
 51b:	c3                   	ret    

0000051c <sbrk>:
SYSCALL(sbrk)
 51c:	b8 0c 00 00 00       	mov    $0xc,%eax
 521:	cd 40                	int    $0x40
 523:	c3                   	ret    

00000524 <sleep>:
SYSCALL(sleep)
 524:	b8 0d 00 00 00       	mov    $0xd,%eax
 529:	cd 40                	int    $0x40
 52b:	c3                   	ret    

0000052c <uptime>:
SYSCALL(uptime)
 52c:	b8 0e 00 00 00       	mov    $0xe,%eax
 531:	cd 40                	int    $0x40
 533:	c3                   	ret    

00000534 <clone>:
SYSCALL(clone)
 534:	b8 16 00 00 00       	mov    $0x16,%eax
 539:	cd 40                	int    $0x40
 53b:	c3                   	ret    

0000053c <join>:
 53c:	b8 17 00 00 00       	mov    $0x17,%eax
 541:	cd 40                	int    $0x40
 543:	c3                   	ret    

00000544 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 544:	55                   	push   %ebp
 545:	89 e5                	mov    %esp,%ebp
 547:	83 ec 1c             	sub    $0x1c,%esp
 54a:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 54d:	6a 01                	push   $0x1
 54f:	8d 55 f4             	lea    -0xc(%ebp),%edx
 552:	52                   	push   %edx
 553:	50                   	push   %eax
 554:	e8 5b ff ff ff       	call   4b4 <write>
}
 559:	83 c4 10             	add    $0x10,%esp
 55c:	c9                   	leave  
 55d:	c3                   	ret    

0000055e <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 55e:	55                   	push   %ebp
 55f:	89 e5                	mov    %esp,%ebp
 561:	57                   	push   %edi
 562:	56                   	push   %esi
 563:	53                   	push   %ebx
 564:	83 ec 2c             	sub    $0x2c,%esp
 567:	89 45 d0             	mov    %eax,-0x30(%ebp)
 56a:	89 d0                	mov    %edx,%eax
 56c:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 56e:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 572:	0f 95 c1             	setne  %cl
 575:	c1 ea 1f             	shr    $0x1f,%edx
 578:	84 d1                	test   %dl,%cl
 57a:	74 44                	je     5c0 <printint+0x62>
    neg = 1;
    x = -xx;
 57c:	f7 d8                	neg    %eax
 57e:	89 c1                	mov    %eax,%ecx
    neg = 1;
 580:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 587:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 58c:	89 c8                	mov    %ecx,%eax
 58e:	ba 00 00 00 00       	mov    $0x0,%edx
 593:	f7 f6                	div    %esi
 595:	89 df                	mov    %ebx,%edi
 597:	83 c3 01             	add    $0x1,%ebx
 59a:	0f b6 92 94 09 00 00 	movzbl 0x994(%edx),%edx
 5a1:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 5a5:	89 ca                	mov    %ecx,%edx
 5a7:	89 c1                	mov    %eax,%ecx
 5a9:	39 d6                	cmp    %edx,%esi
 5ab:	76 df                	jbe    58c <printint+0x2e>
  if(neg)
 5ad:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 5b1:	74 31                	je     5e4 <printint+0x86>
    buf[i++] = '-';
 5b3:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 5b8:	8d 5f 02             	lea    0x2(%edi),%ebx
 5bb:	8b 75 d0             	mov    -0x30(%ebp),%esi
 5be:	eb 17                	jmp    5d7 <printint+0x79>
    x = xx;
 5c0:	89 c1                	mov    %eax,%ecx
  neg = 0;
 5c2:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 5c9:	eb bc                	jmp    587 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 5cb:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 5d0:	89 f0                	mov    %esi,%eax
 5d2:	e8 6d ff ff ff       	call   544 <putc>
  while(--i >= 0)
 5d7:	83 eb 01             	sub    $0x1,%ebx
 5da:	79 ef                	jns    5cb <printint+0x6d>
}
 5dc:	83 c4 2c             	add    $0x2c,%esp
 5df:	5b                   	pop    %ebx
 5e0:	5e                   	pop    %esi
 5e1:	5f                   	pop    %edi
 5e2:	5d                   	pop    %ebp
 5e3:	c3                   	ret    
 5e4:	8b 75 d0             	mov    -0x30(%ebp),%esi
 5e7:	eb ee                	jmp    5d7 <printint+0x79>

000005e9 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5e9:	55                   	push   %ebp
 5ea:	89 e5                	mov    %esp,%ebp
 5ec:	57                   	push   %edi
 5ed:	56                   	push   %esi
 5ee:	53                   	push   %ebx
 5ef:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 5f2:	8d 45 10             	lea    0x10(%ebp),%eax
 5f5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 5f8:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 5fd:	bb 00 00 00 00       	mov    $0x0,%ebx
 602:	eb 14                	jmp    618 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 604:	89 fa                	mov    %edi,%edx
 606:	8b 45 08             	mov    0x8(%ebp),%eax
 609:	e8 36 ff ff ff       	call   544 <putc>
 60e:	eb 05                	jmp    615 <printf+0x2c>
      }
    } else if(state == '%'){
 610:	83 fe 25             	cmp    $0x25,%esi
 613:	74 25                	je     63a <printf+0x51>
  for(i = 0; fmt[i]; i++){
 615:	83 c3 01             	add    $0x1,%ebx
 618:	8b 45 0c             	mov    0xc(%ebp),%eax
 61b:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 61f:	84 c0                	test   %al,%al
 621:	0f 84 20 01 00 00    	je     747 <printf+0x15e>
    c = fmt[i] & 0xff;
 627:	0f be f8             	movsbl %al,%edi
 62a:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 62d:	85 f6                	test   %esi,%esi
 62f:	75 df                	jne    610 <printf+0x27>
      if(c == '%'){
 631:	83 f8 25             	cmp    $0x25,%eax
 634:	75 ce                	jne    604 <printf+0x1b>
        state = '%';
 636:	89 c6                	mov    %eax,%esi
 638:	eb db                	jmp    615 <printf+0x2c>
      if(c == 'd'){
 63a:	83 f8 25             	cmp    $0x25,%eax
 63d:	0f 84 cf 00 00 00    	je     712 <printf+0x129>
 643:	0f 8c dd 00 00 00    	jl     726 <printf+0x13d>
 649:	83 f8 78             	cmp    $0x78,%eax
 64c:	0f 8f d4 00 00 00    	jg     726 <printf+0x13d>
 652:	83 f8 63             	cmp    $0x63,%eax
 655:	0f 8c cb 00 00 00    	jl     726 <printf+0x13d>
 65b:	83 e8 63             	sub    $0x63,%eax
 65e:	83 f8 15             	cmp    $0x15,%eax
 661:	0f 87 bf 00 00 00    	ja     726 <printf+0x13d>
 667:	ff 24 85 3c 09 00 00 	jmp    *0x93c(,%eax,4)
        printint(fd, *ap, 10, 1);
 66e:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 671:	8b 17                	mov    (%edi),%edx
 673:	83 ec 0c             	sub    $0xc,%esp
 676:	6a 01                	push   $0x1
 678:	b9 0a 00 00 00       	mov    $0xa,%ecx
 67d:	8b 45 08             	mov    0x8(%ebp),%eax
 680:	e8 d9 fe ff ff       	call   55e <printint>
        ap++;
 685:	83 c7 04             	add    $0x4,%edi
 688:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 68b:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 68e:	be 00 00 00 00       	mov    $0x0,%esi
 693:	eb 80                	jmp    615 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 695:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 698:	8b 17                	mov    (%edi),%edx
 69a:	83 ec 0c             	sub    $0xc,%esp
 69d:	6a 00                	push   $0x0
 69f:	b9 10 00 00 00       	mov    $0x10,%ecx
 6a4:	8b 45 08             	mov    0x8(%ebp),%eax
 6a7:	e8 b2 fe ff ff       	call   55e <printint>
        ap++;
 6ac:	83 c7 04             	add    $0x4,%edi
 6af:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 6b2:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6b5:	be 00 00 00 00       	mov    $0x0,%esi
 6ba:	e9 56 ff ff ff       	jmp    615 <printf+0x2c>
        s = (char*)*ap;
 6bf:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6c2:	8b 30                	mov    (%eax),%esi
        ap++;
 6c4:	83 c0 04             	add    $0x4,%eax
 6c7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 6ca:	85 f6                	test   %esi,%esi
 6cc:	75 15                	jne    6e3 <printf+0xfa>
          s = "(null)";
 6ce:	be 34 09 00 00       	mov    $0x934,%esi
 6d3:	eb 0e                	jmp    6e3 <printf+0xfa>
          putc(fd, *s);
 6d5:	0f be d2             	movsbl %dl,%edx
 6d8:	8b 45 08             	mov    0x8(%ebp),%eax
 6db:	e8 64 fe ff ff       	call   544 <putc>
          s++;
 6e0:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 6e3:	0f b6 16             	movzbl (%esi),%edx
 6e6:	84 d2                	test   %dl,%dl
 6e8:	75 eb                	jne    6d5 <printf+0xec>
      state = 0;
 6ea:	be 00 00 00 00       	mov    $0x0,%esi
 6ef:	e9 21 ff ff ff       	jmp    615 <printf+0x2c>
        putc(fd, *ap);
 6f4:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6f7:	0f be 17             	movsbl (%edi),%edx
 6fa:	8b 45 08             	mov    0x8(%ebp),%eax
 6fd:	e8 42 fe ff ff       	call   544 <putc>
        ap++;
 702:	83 c7 04             	add    $0x4,%edi
 705:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 708:	be 00 00 00 00       	mov    $0x0,%esi
 70d:	e9 03 ff ff ff       	jmp    615 <printf+0x2c>
        putc(fd, c);
 712:	89 fa                	mov    %edi,%edx
 714:	8b 45 08             	mov    0x8(%ebp),%eax
 717:	e8 28 fe ff ff       	call   544 <putc>
      state = 0;
 71c:	be 00 00 00 00       	mov    $0x0,%esi
 721:	e9 ef fe ff ff       	jmp    615 <printf+0x2c>
        putc(fd, '%');
 726:	ba 25 00 00 00       	mov    $0x25,%edx
 72b:	8b 45 08             	mov    0x8(%ebp),%eax
 72e:	e8 11 fe ff ff       	call   544 <putc>
        putc(fd, c);
 733:	89 fa                	mov    %edi,%edx
 735:	8b 45 08             	mov    0x8(%ebp),%eax
 738:	e8 07 fe ff ff       	call   544 <putc>
      state = 0;
 73d:	be 00 00 00 00       	mov    $0x0,%esi
 742:	e9 ce fe ff ff       	jmp    615 <printf+0x2c>
    }
  }
}
 747:	8d 65 f4             	lea    -0xc(%ebp),%esp
 74a:	5b                   	pop    %ebx
 74b:	5e                   	pop    %esi
 74c:	5f                   	pop    %edi
 74d:	5d                   	pop    %ebp
 74e:	c3                   	ret    

0000074f <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 74f:	55                   	push   %ebp
 750:	89 e5                	mov    %esp,%ebp
 752:	57                   	push   %edi
 753:	56                   	push   %esi
 754:	53                   	push   %ebx
 755:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 758:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 75b:	a1 24 0d 00 00       	mov    0xd24,%eax
 760:	eb 02                	jmp    764 <free+0x15>
 762:	89 d0                	mov    %edx,%eax
 764:	39 c8                	cmp    %ecx,%eax
 766:	73 04                	jae    76c <free+0x1d>
 768:	39 08                	cmp    %ecx,(%eax)
 76a:	77 12                	ja     77e <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 76c:	8b 10                	mov    (%eax),%edx
 76e:	39 c2                	cmp    %eax,%edx
 770:	77 f0                	ja     762 <free+0x13>
 772:	39 c8                	cmp    %ecx,%eax
 774:	72 08                	jb     77e <free+0x2f>
 776:	39 ca                	cmp    %ecx,%edx
 778:	77 04                	ja     77e <free+0x2f>
 77a:	89 d0                	mov    %edx,%eax
 77c:	eb e6                	jmp    764 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 77e:	8b 73 fc             	mov    -0x4(%ebx),%esi
 781:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 784:	8b 10                	mov    (%eax),%edx
 786:	39 d7                	cmp    %edx,%edi
 788:	74 19                	je     7a3 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 78a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 78d:	8b 50 04             	mov    0x4(%eax),%edx
 790:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 793:	39 ce                	cmp    %ecx,%esi
 795:	74 1b                	je     7b2 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 797:	89 08                	mov    %ecx,(%eax)
  freep = p;
 799:	a3 24 0d 00 00       	mov    %eax,0xd24
}
 79e:	5b                   	pop    %ebx
 79f:	5e                   	pop    %esi
 7a0:	5f                   	pop    %edi
 7a1:	5d                   	pop    %ebp
 7a2:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 7a3:	03 72 04             	add    0x4(%edx),%esi
 7a6:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7a9:	8b 10                	mov    (%eax),%edx
 7ab:	8b 12                	mov    (%edx),%edx
 7ad:	89 53 f8             	mov    %edx,-0x8(%ebx)
 7b0:	eb db                	jmp    78d <free+0x3e>
    p->s.size += bp->s.size;
 7b2:	03 53 fc             	add    -0x4(%ebx),%edx
 7b5:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7b8:	8b 53 f8             	mov    -0x8(%ebx),%edx
 7bb:	89 10                	mov    %edx,(%eax)
 7bd:	eb da                	jmp    799 <free+0x4a>

000007bf <morecore>:

static Header*
morecore(uint nu)
{
 7bf:	55                   	push   %ebp
 7c0:	89 e5                	mov    %esp,%ebp
 7c2:	53                   	push   %ebx
 7c3:	83 ec 04             	sub    $0x4,%esp
 7c6:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 7c8:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 7cd:	77 05                	ja     7d4 <morecore+0x15>
    nu = 4096;
 7cf:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 7d4:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 7db:	83 ec 0c             	sub    $0xc,%esp
 7de:	50                   	push   %eax
 7df:	e8 38 fd ff ff       	call   51c <sbrk>
  if(p == (char*)-1)
 7e4:	83 c4 10             	add    $0x10,%esp
 7e7:	83 f8 ff             	cmp    $0xffffffff,%eax
 7ea:	74 1c                	je     808 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 7ec:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 7ef:	83 c0 08             	add    $0x8,%eax
 7f2:	83 ec 0c             	sub    $0xc,%esp
 7f5:	50                   	push   %eax
 7f6:	e8 54 ff ff ff       	call   74f <free>
  return freep;
 7fb:	a1 24 0d 00 00       	mov    0xd24,%eax
 800:	83 c4 10             	add    $0x10,%esp
}
 803:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 806:	c9                   	leave  
 807:	c3                   	ret    
    return 0;
 808:	b8 00 00 00 00       	mov    $0x0,%eax
 80d:	eb f4                	jmp    803 <morecore+0x44>

0000080f <malloc>:

void*
malloc(uint nbytes)
{
 80f:	55                   	push   %ebp
 810:	89 e5                	mov    %esp,%ebp
 812:	53                   	push   %ebx
 813:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 816:	8b 45 08             	mov    0x8(%ebp),%eax
 819:	8d 58 07             	lea    0x7(%eax),%ebx
 81c:	c1 eb 03             	shr    $0x3,%ebx
 81f:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 822:	8b 0d 24 0d 00 00    	mov    0xd24,%ecx
 828:	85 c9                	test   %ecx,%ecx
 82a:	74 04                	je     830 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 82c:	8b 01                	mov    (%ecx),%eax
 82e:	eb 4a                	jmp    87a <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 830:	c7 05 24 0d 00 00 28 	movl   $0xd28,0xd24
 837:	0d 00 00 
 83a:	c7 05 28 0d 00 00 28 	movl   $0xd28,0xd28
 841:	0d 00 00 
    base.s.size = 0;
 844:	c7 05 2c 0d 00 00 00 	movl   $0x0,0xd2c
 84b:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 84e:	b9 28 0d 00 00       	mov    $0xd28,%ecx
 853:	eb d7                	jmp    82c <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 855:	74 19                	je     870 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 857:	29 da                	sub    %ebx,%edx
 859:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 85c:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 85f:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 862:	89 0d 24 0d 00 00    	mov    %ecx,0xd24
      return (void*)(p + 1);
 868:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 86b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 86e:	c9                   	leave  
 86f:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 870:	8b 10                	mov    (%eax),%edx
 872:	89 11                	mov    %edx,(%ecx)
 874:	eb ec                	jmp    862 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 876:	89 c1                	mov    %eax,%ecx
 878:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 87a:	8b 50 04             	mov    0x4(%eax),%edx
 87d:	39 da                	cmp    %ebx,%edx
 87f:	73 d4                	jae    855 <malloc+0x46>
    if(p == freep)
 881:	39 05 24 0d 00 00    	cmp    %eax,0xd24
 887:	75 ed                	jne    876 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 889:	89 d8                	mov    %ebx,%eax
 88b:	e8 2f ff ff ff       	call   7bf <morecore>
 890:	85 c0                	test   %eax,%eax
 892:	75 e2                	jne    876 <malloc+0x67>
 894:	eb d5                	jmp    86b <malloc+0x5c>
