
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
  18:	a1 c0 0c 00 00       	mov    0xcc0,%eax
  1d:	83 f8 01             	cmp    $0x1,%eax
  20:	0f 85 9c 00 00 00    	jne    c2 <worker+0xc2>
   global++;
  26:	83 c0 01             	add    $0x1,%eax
  29:	a3 c0 0c 00 00       	mov    %eax,0xcc0
   // no exit() in thread
}
  2e:	c9                   	leave  
  2f:	c3                   	ret    
   assert(tmp1 == 42);
  30:	6a 2c                	push   $0x2c
  32:	68 58 08 00 00       	push   $0x858
  37:	68 62 08 00 00       	push   $0x862
  3c:	6a 01                	push   $0x1
  3e:	e8 68 05 00 00       	call   5ab <printf>
  43:	83 c4 0c             	add    $0xc,%esp
  46:	68 6a 08 00 00       	push   $0x86a
  4b:	68 75 08 00 00       	push   $0x875
  50:	6a 01                	push   $0x1
  52:	e8 54 05 00 00       	call   5ab <printf>
  57:	83 c4 08             	add    $0x8,%esp
  5a:	68 89 08 00 00       	push   $0x889
  5f:	6a 01                	push   $0x1
  61:	e8 45 05 00 00       	call   5ab <printf>
  66:	83 c4 04             	add    $0x4,%esp
  69:	ff 35 c4 0c 00 00    	push   0xcc4
  6f:	e8 12 04 00 00       	call   486 <kill>
  74:	e8 dd 03 00 00       	call   456 <exit>
   assert(tmp2 == 24);
  79:	6a 2d                	push   $0x2d
  7b:	68 58 08 00 00       	push   $0x858
  80:	68 62 08 00 00       	push   $0x862
  85:	6a 01                	push   $0x1
  87:	e8 1f 05 00 00       	call   5ab <printf>
  8c:	83 c4 0c             	add    $0xc,%esp
  8f:	68 96 08 00 00       	push   $0x896
  94:	68 75 08 00 00       	push   $0x875
  99:	6a 01                	push   $0x1
  9b:	e8 0b 05 00 00       	call   5ab <printf>
  a0:	83 c4 08             	add    $0x8,%esp
  a3:	68 89 08 00 00       	push   $0x889
  a8:	6a 01                	push   $0x1
  aa:	e8 fc 04 00 00       	call   5ab <printf>
  af:	83 c4 04             	add    $0x4,%esp
  b2:	ff 35 c4 0c 00 00    	push   0xcc4
  b8:	e8 c9 03 00 00       	call   486 <kill>
  bd:	e8 94 03 00 00       	call   456 <exit>
   assert(global == 1);
  c2:	6a 2e                	push   $0x2e
  c4:	68 58 08 00 00       	push   $0x858
  c9:	68 62 08 00 00       	push   $0x862
  ce:	6a 01                	push   $0x1
  d0:	e8 d6 04 00 00       	call   5ab <printf>
  d5:	83 c4 0c             	add    $0xc,%esp
  d8:	68 a1 08 00 00       	push   $0x8a1
  dd:	68 75 08 00 00       	push   $0x875
  e2:	6a 01                	push   $0x1
  e4:	e8 c2 04 00 00       	call   5ab <printf>
  e9:	83 c4 08             	add    $0x8,%esp
  ec:	68 89 08 00 00       	push   $0x889
  f1:	6a 01                	push   $0x1
  f3:	e8 b3 04 00 00       	call   5ab <printf>
  f8:	83 c4 04             	add    $0x4,%esp
  fb:	ff 35 c4 0c 00 00    	push   0xcc4
 101:	e8 80 03 00 00       	call   486 <kill>
 106:	e8 4b 03 00 00       	call   456 <exit>

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
 11d:	e8 b4 03 00 00       	call   4d6 <getpid>
 122:	a3 c4 0c 00 00       	mov    %eax,0xcc4
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
 153:	e8 1b 01 00 00       	call   273 <thread_join>
   assert(join_pid == thread_pid);
 158:	39 c3                	cmp    %eax,%ebx
 15a:	0f 85 9f 00 00 00    	jne    1ff <main+0xf4>
   assert(global == 2);
 160:	83 3d c0 0c 00 00 02 	cmpl   $0x2,0xcc0
 167:	0f 84 db 00 00 00    	je     248 <main+0x13d>
 16d:	6a 22                	push   $0x22
 16f:	68 58 08 00 00       	push   $0x858
 174:	68 62 08 00 00       	push   $0x862
 179:	6a 01                	push   $0x1
 17b:	e8 2b 04 00 00       	call   5ab <printf>
 180:	83 c4 0c             	add    $0xc,%esp
 183:	68 d3 08 00 00       	push   $0x8d3
 188:	68 75 08 00 00       	push   $0x875
 18d:	6a 01                	push   $0x1
 18f:	e8 17 04 00 00       	call   5ab <printf>
 194:	83 c4 08             	add    $0x8,%esp
 197:	68 89 08 00 00       	push   $0x889
 19c:	6a 01                	push   $0x1
 19e:	e8 08 04 00 00       	call   5ab <printf>
 1a3:	83 c4 04             	add    $0x4,%esp
 1a6:	ff 35 c4 0c 00 00    	push   0xcc4
 1ac:	e8 d5 02 00 00       	call   486 <kill>
 1b1:	e8 a0 02 00 00       	call   456 <exit>
   assert(thread_pid > 0);
 1b6:	6a 1e                	push   $0x1e
 1b8:	68 58 08 00 00       	push   $0x858
 1bd:	68 62 08 00 00       	push   $0x862
 1c2:	6a 01                	push   $0x1
 1c4:	e8 e2 03 00 00       	call   5ab <printf>
 1c9:	83 c4 0c             	add    $0xc,%esp
 1cc:	68 ad 08 00 00       	push   $0x8ad
 1d1:	68 75 08 00 00       	push   $0x875
 1d6:	6a 01                	push   $0x1
 1d8:	e8 ce 03 00 00       	call   5ab <printf>
 1dd:	83 c4 08             	add    $0x8,%esp
 1e0:	68 89 08 00 00       	push   $0x889
 1e5:	6a 01                	push   $0x1
 1e7:	e8 bf 03 00 00       	call   5ab <printf>
 1ec:	83 c4 04             	add    $0x4,%esp
 1ef:	ff 35 c4 0c 00 00    	push   0xcc4
 1f5:	e8 8c 02 00 00       	call   486 <kill>
 1fa:	e8 57 02 00 00       	call   456 <exit>
   assert(join_pid == thread_pid);
 1ff:	6a 21                	push   $0x21
 201:	68 58 08 00 00       	push   $0x858
 206:	68 62 08 00 00       	push   $0x862
 20b:	6a 01                	push   $0x1
 20d:	e8 99 03 00 00       	call   5ab <printf>
 212:	83 c4 0c             	add    $0xc,%esp
 215:	68 bc 08 00 00       	push   $0x8bc
 21a:	68 75 08 00 00       	push   $0x875
 21f:	6a 01                	push   $0x1
 221:	e8 85 03 00 00       	call   5ab <printf>
 226:	83 c4 08             	add    $0x8,%esp
 229:	68 89 08 00 00       	push   $0x889
 22e:	6a 01                	push   $0x1
 230:	e8 76 03 00 00       	call   5ab <printf>
 235:	83 c4 04             	add    $0x4,%esp
 238:	ff 35 c4 0c 00 00    	push   0xcc4
 23e:	e8 43 02 00 00       	call   486 <kill>
 243:	e8 0e 02 00 00       	call   456 <exit>
   printf(1, "TEST PASSED\n");
 248:	83 ec 08             	sub    $0x8,%esp
 24b:	68 df 08 00 00       	push   $0x8df
 250:	6a 01                	push   $0x1
 252:	e8 54 03 00 00       	call   5ab <printf>
   exit();
 257:	e8 fa 01 00 00       	call   456 <exit>

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

  // I can't remember if there was something else to do here but I'm sure I'll find out


  return new_pid;
}
 26d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 272:	c3                   	ret    

00000273 <thread_join>:

int thread_join() {
  return 0;
}
 273:	b8 00 00 00 00       	mov    $0x0,%eax
 278:	c3                   	ret    

00000279 <lock_acquire>:

void lock_acquire(lock_t *lock){
 279:	55                   	push   %ebp
 27a:	89 e5                	mov    %esp,%ebp
 27c:	53                   	push   %ebx
 27d:	83 ec 04             	sub    $0x4,%esp
 280:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 283:	83 ec 08             	sub    $0x8,%esp
 286:	6a 01                	push   $0x1
 288:	53                   	push   %ebx
 289:	e8 ce ff ff ff       	call   25c <test_and_set>
 28e:	83 c4 10             	add    $0x10,%esp
 291:	83 f8 01             	cmp    $0x1,%eax
 294:	74 ed                	je     283 <lock_acquire+0xa>
    ;
}
 296:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 299:	c9                   	leave  
 29a:	c3                   	ret    

0000029b <lock_release>:

void lock_release(lock_t *lock) {
 29b:	55                   	push   %ebp
 29c:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 29e:	8b 45 08             	mov    0x8(%ebp),%eax
 2a1:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 2a7:	5d                   	pop    %ebp
 2a8:	c3                   	ret    

000002a9 <lock_init>:

void lock_init(lock_t *lock) {
 2a9:	55                   	push   %ebp
 2aa:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 2ac:	8b 45 08             	mov    0x8(%ebp),%eax
 2af:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 2b5:	5d                   	pop    %ebp
 2b6:	c3                   	ret    

000002b7 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 2b7:	55                   	push   %ebp
 2b8:	89 e5                	mov    %esp,%ebp
 2ba:	56                   	push   %esi
 2bb:	53                   	push   %ebx
 2bc:	8b 75 08             	mov    0x8(%ebp),%esi
 2bf:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 2c2:	89 f0                	mov    %esi,%eax
 2c4:	89 d1                	mov    %edx,%ecx
 2c6:	83 c2 01             	add    $0x1,%edx
 2c9:	89 c3                	mov    %eax,%ebx
 2cb:	83 c0 01             	add    $0x1,%eax
 2ce:	0f b6 09             	movzbl (%ecx),%ecx
 2d1:	88 0b                	mov    %cl,(%ebx)
 2d3:	84 c9                	test   %cl,%cl
 2d5:	75 ed                	jne    2c4 <strcpy+0xd>
    ;
  return os;
}
 2d7:	89 f0                	mov    %esi,%eax
 2d9:	5b                   	pop    %ebx
 2da:	5e                   	pop    %esi
 2db:	5d                   	pop    %ebp
 2dc:	c3                   	ret    

000002dd <strcmp>:

int
strcmp(const char *p, const char *q)
{
 2dd:	55                   	push   %ebp
 2de:	89 e5                	mov    %esp,%ebp
 2e0:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2e3:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 2e6:	eb 06                	jmp    2ee <strcmp+0x11>
    p++, q++;
 2e8:	83 c1 01             	add    $0x1,%ecx
 2eb:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 2ee:	0f b6 01             	movzbl (%ecx),%eax
 2f1:	84 c0                	test   %al,%al
 2f3:	74 04                	je     2f9 <strcmp+0x1c>
 2f5:	3a 02                	cmp    (%edx),%al
 2f7:	74 ef                	je     2e8 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 2f9:	0f b6 c0             	movzbl %al,%eax
 2fc:	0f b6 12             	movzbl (%edx),%edx
 2ff:	29 d0                	sub    %edx,%eax
}
 301:	5d                   	pop    %ebp
 302:	c3                   	ret    

00000303 <strlen>:

uint
strlen(const char *s)
{
 303:	55                   	push   %ebp
 304:	89 e5                	mov    %esp,%ebp
 306:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 309:	b8 00 00 00 00       	mov    $0x0,%eax
 30e:	eb 03                	jmp    313 <strlen+0x10>
 310:	83 c0 01             	add    $0x1,%eax
 313:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 317:	75 f7                	jne    310 <strlen+0xd>
    ;
  return n;
}
 319:	5d                   	pop    %ebp
 31a:	c3                   	ret    

0000031b <memset>:

void*
memset(void *dst, int c, uint n)
{
 31b:	55                   	push   %ebp
 31c:	89 e5                	mov    %esp,%ebp
 31e:	57                   	push   %edi
 31f:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 322:	89 d7                	mov    %edx,%edi
 324:	8b 4d 10             	mov    0x10(%ebp),%ecx
 327:	8b 45 0c             	mov    0xc(%ebp),%eax
 32a:	fc                   	cld    
 32b:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 32d:	89 d0                	mov    %edx,%eax
 32f:	8b 7d fc             	mov    -0x4(%ebp),%edi
 332:	c9                   	leave  
 333:	c3                   	ret    

00000334 <strchr>:

char*
strchr(const char *s, char c)
{
 334:	55                   	push   %ebp
 335:	89 e5                	mov    %esp,%ebp
 337:	8b 45 08             	mov    0x8(%ebp),%eax
 33a:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 33e:	eb 03                	jmp    343 <strchr+0xf>
 340:	83 c0 01             	add    $0x1,%eax
 343:	0f b6 10             	movzbl (%eax),%edx
 346:	84 d2                	test   %dl,%dl
 348:	74 06                	je     350 <strchr+0x1c>
    if(*s == c)
 34a:	38 ca                	cmp    %cl,%dl
 34c:	75 f2                	jne    340 <strchr+0xc>
 34e:	eb 05                	jmp    355 <strchr+0x21>
      return (char*)s;
  return 0;
 350:	b8 00 00 00 00       	mov    $0x0,%eax
}
 355:	5d                   	pop    %ebp
 356:	c3                   	ret    

00000357 <gets>:

char*
gets(char *buf, int max)
{
 357:	55                   	push   %ebp
 358:	89 e5                	mov    %esp,%ebp
 35a:	57                   	push   %edi
 35b:	56                   	push   %esi
 35c:	53                   	push   %ebx
 35d:	83 ec 1c             	sub    $0x1c,%esp
 360:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 363:	bb 00 00 00 00       	mov    $0x0,%ebx
 368:	89 de                	mov    %ebx,%esi
 36a:	83 c3 01             	add    $0x1,%ebx
 36d:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 370:	7d 2e                	jge    3a0 <gets+0x49>
    cc = read(0, &c, 1);
 372:	83 ec 04             	sub    $0x4,%esp
 375:	6a 01                	push   $0x1
 377:	8d 45 e7             	lea    -0x19(%ebp),%eax
 37a:	50                   	push   %eax
 37b:	6a 00                	push   $0x0
 37d:	e8 ec 00 00 00       	call   46e <read>
    if(cc < 1)
 382:	83 c4 10             	add    $0x10,%esp
 385:	85 c0                	test   %eax,%eax
 387:	7e 17                	jle    3a0 <gets+0x49>
      break;
    buf[i++] = c;
 389:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 38d:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 390:	3c 0a                	cmp    $0xa,%al
 392:	0f 94 c2             	sete   %dl
 395:	3c 0d                	cmp    $0xd,%al
 397:	0f 94 c0             	sete   %al
 39a:	08 c2                	or     %al,%dl
 39c:	74 ca                	je     368 <gets+0x11>
    buf[i++] = c;
 39e:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 3a0:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 3a4:	89 f8                	mov    %edi,%eax
 3a6:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3a9:	5b                   	pop    %ebx
 3aa:	5e                   	pop    %esi
 3ab:	5f                   	pop    %edi
 3ac:	5d                   	pop    %ebp
 3ad:	c3                   	ret    

000003ae <stat>:

int
stat(const char *n, struct stat *st)
{
 3ae:	55                   	push   %ebp
 3af:	89 e5                	mov    %esp,%ebp
 3b1:	56                   	push   %esi
 3b2:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 3b3:	83 ec 08             	sub    $0x8,%esp
 3b6:	6a 00                	push   $0x0
 3b8:	ff 75 08             	push   0x8(%ebp)
 3bb:	e8 d6 00 00 00       	call   496 <open>
  if(fd < 0)
 3c0:	83 c4 10             	add    $0x10,%esp
 3c3:	85 c0                	test   %eax,%eax
 3c5:	78 24                	js     3eb <stat+0x3d>
 3c7:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 3c9:	83 ec 08             	sub    $0x8,%esp
 3cc:	ff 75 0c             	push   0xc(%ebp)
 3cf:	50                   	push   %eax
 3d0:	e8 d9 00 00 00       	call   4ae <fstat>
 3d5:	89 c6                	mov    %eax,%esi
  close(fd);
 3d7:	89 1c 24             	mov    %ebx,(%esp)
 3da:	e8 9f 00 00 00       	call   47e <close>
  return r;
 3df:	83 c4 10             	add    $0x10,%esp
}
 3e2:	89 f0                	mov    %esi,%eax
 3e4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 3e7:	5b                   	pop    %ebx
 3e8:	5e                   	pop    %esi
 3e9:	5d                   	pop    %ebp
 3ea:	c3                   	ret    
    return -1;
 3eb:	be ff ff ff ff       	mov    $0xffffffff,%esi
 3f0:	eb f0                	jmp    3e2 <stat+0x34>

000003f2 <atoi>:

int
atoi(const char *s)
{
 3f2:	55                   	push   %ebp
 3f3:	89 e5                	mov    %esp,%ebp
 3f5:	53                   	push   %ebx
 3f6:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 3f9:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 3fe:	eb 10                	jmp    410 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 400:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 403:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 406:	83 c1 01             	add    $0x1,%ecx
 409:	0f be c0             	movsbl %al,%eax
 40c:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 410:	0f b6 01             	movzbl (%ecx),%eax
 413:	8d 58 d0             	lea    -0x30(%eax),%ebx
 416:	80 fb 09             	cmp    $0x9,%bl
 419:	76 e5                	jbe    400 <atoi+0xe>
  return n;
}
 41b:	89 d0                	mov    %edx,%eax
 41d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 420:	c9                   	leave  
 421:	c3                   	ret    

00000422 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 422:	55                   	push   %ebp
 423:	89 e5                	mov    %esp,%ebp
 425:	56                   	push   %esi
 426:	53                   	push   %ebx
 427:	8b 75 08             	mov    0x8(%ebp),%esi
 42a:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 42d:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 430:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 432:	eb 0d                	jmp    441 <memmove+0x1f>
    *dst++ = *src++;
 434:	0f b6 01             	movzbl (%ecx),%eax
 437:	88 02                	mov    %al,(%edx)
 439:	8d 49 01             	lea    0x1(%ecx),%ecx
 43c:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 43f:	89 d8                	mov    %ebx,%eax
 441:	8d 58 ff             	lea    -0x1(%eax),%ebx
 444:	85 c0                	test   %eax,%eax
 446:	7f ec                	jg     434 <memmove+0x12>
  return vdst;
}
 448:	89 f0                	mov    %esi,%eax
 44a:	5b                   	pop    %ebx
 44b:	5e                   	pop    %esi
 44c:	5d                   	pop    %ebp
 44d:	c3                   	ret    

0000044e <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 44e:	b8 01 00 00 00       	mov    $0x1,%eax
 453:	cd 40                	int    $0x40
 455:	c3                   	ret    

00000456 <exit>:
SYSCALL(exit)
 456:	b8 02 00 00 00       	mov    $0x2,%eax
 45b:	cd 40                	int    $0x40
 45d:	c3                   	ret    

0000045e <wait>:
SYSCALL(wait)
 45e:	b8 03 00 00 00       	mov    $0x3,%eax
 463:	cd 40                	int    $0x40
 465:	c3                   	ret    

00000466 <pipe>:
SYSCALL(pipe)
 466:	b8 04 00 00 00       	mov    $0x4,%eax
 46b:	cd 40                	int    $0x40
 46d:	c3                   	ret    

0000046e <read>:
SYSCALL(read)
 46e:	b8 05 00 00 00       	mov    $0x5,%eax
 473:	cd 40                	int    $0x40
 475:	c3                   	ret    

00000476 <write>:
SYSCALL(write)
 476:	b8 10 00 00 00       	mov    $0x10,%eax
 47b:	cd 40                	int    $0x40
 47d:	c3                   	ret    

0000047e <close>:
SYSCALL(close)
 47e:	b8 15 00 00 00       	mov    $0x15,%eax
 483:	cd 40                	int    $0x40
 485:	c3                   	ret    

00000486 <kill>:
SYSCALL(kill)
 486:	b8 06 00 00 00       	mov    $0x6,%eax
 48b:	cd 40                	int    $0x40
 48d:	c3                   	ret    

0000048e <exec>:
SYSCALL(exec)
 48e:	b8 07 00 00 00       	mov    $0x7,%eax
 493:	cd 40                	int    $0x40
 495:	c3                   	ret    

00000496 <open>:
SYSCALL(open)
 496:	b8 0f 00 00 00       	mov    $0xf,%eax
 49b:	cd 40                	int    $0x40
 49d:	c3                   	ret    

0000049e <mknod>:
SYSCALL(mknod)
 49e:	b8 11 00 00 00       	mov    $0x11,%eax
 4a3:	cd 40                	int    $0x40
 4a5:	c3                   	ret    

000004a6 <unlink>:
SYSCALL(unlink)
 4a6:	b8 12 00 00 00       	mov    $0x12,%eax
 4ab:	cd 40                	int    $0x40
 4ad:	c3                   	ret    

000004ae <fstat>:
SYSCALL(fstat)
 4ae:	b8 08 00 00 00       	mov    $0x8,%eax
 4b3:	cd 40                	int    $0x40
 4b5:	c3                   	ret    

000004b6 <link>:
SYSCALL(link)
 4b6:	b8 13 00 00 00       	mov    $0x13,%eax
 4bb:	cd 40                	int    $0x40
 4bd:	c3                   	ret    

000004be <mkdir>:
SYSCALL(mkdir)
 4be:	b8 14 00 00 00       	mov    $0x14,%eax
 4c3:	cd 40                	int    $0x40
 4c5:	c3                   	ret    

000004c6 <chdir>:
SYSCALL(chdir)
 4c6:	b8 09 00 00 00       	mov    $0x9,%eax
 4cb:	cd 40                	int    $0x40
 4cd:	c3                   	ret    

000004ce <dup>:
SYSCALL(dup)
 4ce:	b8 0a 00 00 00       	mov    $0xa,%eax
 4d3:	cd 40                	int    $0x40
 4d5:	c3                   	ret    

000004d6 <getpid>:
SYSCALL(getpid)
 4d6:	b8 0b 00 00 00       	mov    $0xb,%eax
 4db:	cd 40                	int    $0x40
 4dd:	c3                   	ret    

000004de <sbrk>:
SYSCALL(sbrk)
 4de:	b8 0c 00 00 00       	mov    $0xc,%eax
 4e3:	cd 40                	int    $0x40
 4e5:	c3                   	ret    

000004e6 <sleep>:
SYSCALL(sleep)
 4e6:	b8 0d 00 00 00       	mov    $0xd,%eax
 4eb:	cd 40                	int    $0x40
 4ed:	c3                   	ret    

000004ee <uptime>:
SYSCALL(uptime)
 4ee:	b8 0e 00 00 00       	mov    $0xe,%eax
 4f3:	cd 40                	int    $0x40
 4f5:	c3                   	ret    

000004f6 <clone>:
SYSCALL(clone)
 4f6:	b8 16 00 00 00       	mov    $0x16,%eax
 4fb:	cd 40                	int    $0x40
 4fd:	c3                   	ret    

000004fe <join>:
 4fe:	b8 17 00 00 00       	mov    $0x17,%eax
 503:	cd 40                	int    $0x40
 505:	c3                   	ret    

00000506 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 506:	55                   	push   %ebp
 507:	89 e5                	mov    %esp,%ebp
 509:	83 ec 1c             	sub    $0x1c,%esp
 50c:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 50f:	6a 01                	push   $0x1
 511:	8d 55 f4             	lea    -0xc(%ebp),%edx
 514:	52                   	push   %edx
 515:	50                   	push   %eax
 516:	e8 5b ff ff ff       	call   476 <write>
}
 51b:	83 c4 10             	add    $0x10,%esp
 51e:	c9                   	leave  
 51f:	c3                   	ret    

00000520 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 520:	55                   	push   %ebp
 521:	89 e5                	mov    %esp,%ebp
 523:	57                   	push   %edi
 524:	56                   	push   %esi
 525:	53                   	push   %ebx
 526:	83 ec 2c             	sub    $0x2c,%esp
 529:	89 45 d0             	mov    %eax,-0x30(%ebp)
 52c:	89 d0                	mov    %edx,%eax
 52e:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 530:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 534:	0f 95 c1             	setne  %cl
 537:	c1 ea 1f             	shr    $0x1f,%edx
 53a:	84 d1                	test   %dl,%cl
 53c:	74 44                	je     582 <printint+0x62>
    neg = 1;
    x = -xx;
 53e:	f7 d8                	neg    %eax
 540:	89 c1                	mov    %eax,%ecx
    neg = 1;
 542:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 549:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 54e:	89 c8                	mov    %ecx,%eax
 550:	ba 00 00 00 00       	mov    $0x0,%edx
 555:	f7 f6                	div    %esi
 557:	89 df                	mov    %ebx,%edi
 559:	83 c3 01             	add    $0x1,%ebx
 55c:	0f b6 92 4c 09 00 00 	movzbl 0x94c(%edx),%edx
 563:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 567:	89 ca                	mov    %ecx,%edx
 569:	89 c1                	mov    %eax,%ecx
 56b:	39 d6                	cmp    %edx,%esi
 56d:	76 df                	jbe    54e <printint+0x2e>
  if(neg)
 56f:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 573:	74 31                	je     5a6 <printint+0x86>
    buf[i++] = '-';
 575:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 57a:	8d 5f 02             	lea    0x2(%edi),%ebx
 57d:	8b 75 d0             	mov    -0x30(%ebp),%esi
 580:	eb 17                	jmp    599 <printint+0x79>
    x = xx;
 582:	89 c1                	mov    %eax,%ecx
  neg = 0;
 584:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 58b:	eb bc                	jmp    549 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 58d:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 592:	89 f0                	mov    %esi,%eax
 594:	e8 6d ff ff ff       	call   506 <putc>
  while(--i >= 0)
 599:	83 eb 01             	sub    $0x1,%ebx
 59c:	79 ef                	jns    58d <printint+0x6d>
}
 59e:	83 c4 2c             	add    $0x2c,%esp
 5a1:	5b                   	pop    %ebx
 5a2:	5e                   	pop    %esi
 5a3:	5f                   	pop    %edi
 5a4:	5d                   	pop    %ebp
 5a5:	c3                   	ret    
 5a6:	8b 75 d0             	mov    -0x30(%ebp),%esi
 5a9:	eb ee                	jmp    599 <printint+0x79>

000005ab <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5ab:	55                   	push   %ebp
 5ac:	89 e5                	mov    %esp,%ebp
 5ae:	57                   	push   %edi
 5af:	56                   	push   %esi
 5b0:	53                   	push   %ebx
 5b1:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 5b4:	8d 45 10             	lea    0x10(%ebp),%eax
 5b7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 5ba:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 5bf:	bb 00 00 00 00       	mov    $0x0,%ebx
 5c4:	eb 14                	jmp    5da <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 5c6:	89 fa                	mov    %edi,%edx
 5c8:	8b 45 08             	mov    0x8(%ebp),%eax
 5cb:	e8 36 ff ff ff       	call   506 <putc>
 5d0:	eb 05                	jmp    5d7 <printf+0x2c>
      }
    } else if(state == '%'){
 5d2:	83 fe 25             	cmp    $0x25,%esi
 5d5:	74 25                	je     5fc <printf+0x51>
  for(i = 0; fmt[i]; i++){
 5d7:	83 c3 01             	add    $0x1,%ebx
 5da:	8b 45 0c             	mov    0xc(%ebp),%eax
 5dd:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 5e1:	84 c0                	test   %al,%al
 5e3:	0f 84 20 01 00 00    	je     709 <printf+0x15e>
    c = fmt[i] & 0xff;
 5e9:	0f be f8             	movsbl %al,%edi
 5ec:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 5ef:	85 f6                	test   %esi,%esi
 5f1:	75 df                	jne    5d2 <printf+0x27>
      if(c == '%'){
 5f3:	83 f8 25             	cmp    $0x25,%eax
 5f6:	75 ce                	jne    5c6 <printf+0x1b>
        state = '%';
 5f8:	89 c6                	mov    %eax,%esi
 5fa:	eb db                	jmp    5d7 <printf+0x2c>
      if(c == 'd'){
 5fc:	83 f8 25             	cmp    $0x25,%eax
 5ff:	0f 84 cf 00 00 00    	je     6d4 <printf+0x129>
 605:	0f 8c dd 00 00 00    	jl     6e8 <printf+0x13d>
 60b:	83 f8 78             	cmp    $0x78,%eax
 60e:	0f 8f d4 00 00 00    	jg     6e8 <printf+0x13d>
 614:	83 f8 63             	cmp    $0x63,%eax
 617:	0f 8c cb 00 00 00    	jl     6e8 <printf+0x13d>
 61d:	83 e8 63             	sub    $0x63,%eax
 620:	83 f8 15             	cmp    $0x15,%eax
 623:	0f 87 bf 00 00 00    	ja     6e8 <printf+0x13d>
 629:	ff 24 85 f4 08 00 00 	jmp    *0x8f4(,%eax,4)
        printint(fd, *ap, 10, 1);
 630:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 633:	8b 17                	mov    (%edi),%edx
 635:	83 ec 0c             	sub    $0xc,%esp
 638:	6a 01                	push   $0x1
 63a:	b9 0a 00 00 00       	mov    $0xa,%ecx
 63f:	8b 45 08             	mov    0x8(%ebp),%eax
 642:	e8 d9 fe ff ff       	call   520 <printint>
        ap++;
 647:	83 c7 04             	add    $0x4,%edi
 64a:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 64d:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 650:	be 00 00 00 00       	mov    $0x0,%esi
 655:	eb 80                	jmp    5d7 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 657:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 65a:	8b 17                	mov    (%edi),%edx
 65c:	83 ec 0c             	sub    $0xc,%esp
 65f:	6a 00                	push   $0x0
 661:	b9 10 00 00 00       	mov    $0x10,%ecx
 666:	8b 45 08             	mov    0x8(%ebp),%eax
 669:	e8 b2 fe ff ff       	call   520 <printint>
        ap++;
 66e:	83 c7 04             	add    $0x4,%edi
 671:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 674:	83 c4 10             	add    $0x10,%esp
      state = 0;
 677:	be 00 00 00 00       	mov    $0x0,%esi
 67c:	e9 56 ff ff ff       	jmp    5d7 <printf+0x2c>
        s = (char*)*ap;
 681:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 684:	8b 30                	mov    (%eax),%esi
        ap++;
 686:	83 c0 04             	add    $0x4,%eax
 689:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 68c:	85 f6                	test   %esi,%esi
 68e:	75 15                	jne    6a5 <printf+0xfa>
          s = "(null)";
 690:	be ec 08 00 00       	mov    $0x8ec,%esi
 695:	eb 0e                	jmp    6a5 <printf+0xfa>
          putc(fd, *s);
 697:	0f be d2             	movsbl %dl,%edx
 69a:	8b 45 08             	mov    0x8(%ebp),%eax
 69d:	e8 64 fe ff ff       	call   506 <putc>
          s++;
 6a2:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 6a5:	0f b6 16             	movzbl (%esi),%edx
 6a8:	84 d2                	test   %dl,%dl
 6aa:	75 eb                	jne    697 <printf+0xec>
      state = 0;
 6ac:	be 00 00 00 00       	mov    $0x0,%esi
 6b1:	e9 21 ff ff ff       	jmp    5d7 <printf+0x2c>
        putc(fd, *ap);
 6b6:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6b9:	0f be 17             	movsbl (%edi),%edx
 6bc:	8b 45 08             	mov    0x8(%ebp),%eax
 6bf:	e8 42 fe ff ff       	call   506 <putc>
        ap++;
 6c4:	83 c7 04             	add    $0x4,%edi
 6c7:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 6ca:	be 00 00 00 00       	mov    $0x0,%esi
 6cf:	e9 03 ff ff ff       	jmp    5d7 <printf+0x2c>
        putc(fd, c);
 6d4:	89 fa                	mov    %edi,%edx
 6d6:	8b 45 08             	mov    0x8(%ebp),%eax
 6d9:	e8 28 fe ff ff       	call   506 <putc>
      state = 0;
 6de:	be 00 00 00 00       	mov    $0x0,%esi
 6e3:	e9 ef fe ff ff       	jmp    5d7 <printf+0x2c>
        putc(fd, '%');
 6e8:	ba 25 00 00 00       	mov    $0x25,%edx
 6ed:	8b 45 08             	mov    0x8(%ebp),%eax
 6f0:	e8 11 fe ff ff       	call   506 <putc>
        putc(fd, c);
 6f5:	89 fa                	mov    %edi,%edx
 6f7:	8b 45 08             	mov    0x8(%ebp),%eax
 6fa:	e8 07 fe ff ff       	call   506 <putc>
      state = 0;
 6ff:	be 00 00 00 00       	mov    $0x0,%esi
 704:	e9 ce fe ff ff       	jmp    5d7 <printf+0x2c>
    }
  }
}
 709:	8d 65 f4             	lea    -0xc(%ebp),%esp
 70c:	5b                   	pop    %ebx
 70d:	5e                   	pop    %esi
 70e:	5f                   	pop    %edi
 70f:	5d                   	pop    %ebp
 710:	c3                   	ret    

00000711 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 711:	55                   	push   %ebp
 712:	89 e5                	mov    %esp,%ebp
 714:	57                   	push   %edi
 715:	56                   	push   %esi
 716:	53                   	push   %ebx
 717:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 71a:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 71d:	a1 c8 0c 00 00       	mov    0xcc8,%eax
 722:	eb 02                	jmp    726 <free+0x15>
 724:	89 d0                	mov    %edx,%eax
 726:	39 c8                	cmp    %ecx,%eax
 728:	73 04                	jae    72e <free+0x1d>
 72a:	39 08                	cmp    %ecx,(%eax)
 72c:	77 12                	ja     740 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 72e:	8b 10                	mov    (%eax),%edx
 730:	39 c2                	cmp    %eax,%edx
 732:	77 f0                	ja     724 <free+0x13>
 734:	39 c8                	cmp    %ecx,%eax
 736:	72 08                	jb     740 <free+0x2f>
 738:	39 ca                	cmp    %ecx,%edx
 73a:	77 04                	ja     740 <free+0x2f>
 73c:	89 d0                	mov    %edx,%eax
 73e:	eb e6                	jmp    726 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 740:	8b 73 fc             	mov    -0x4(%ebx),%esi
 743:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 746:	8b 10                	mov    (%eax),%edx
 748:	39 d7                	cmp    %edx,%edi
 74a:	74 19                	je     765 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 74c:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 74f:	8b 50 04             	mov    0x4(%eax),%edx
 752:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 755:	39 ce                	cmp    %ecx,%esi
 757:	74 1b                	je     774 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 759:	89 08                	mov    %ecx,(%eax)
  freep = p;
 75b:	a3 c8 0c 00 00       	mov    %eax,0xcc8
}
 760:	5b                   	pop    %ebx
 761:	5e                   	pop    %esi
 762:	5f                   	pop    %edi
 763:	5d                   	pop    %ebp
 764:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 765:	03 72 04             	add    0x4(%edx),%esi
 768:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 76b:	8b 10                	mov    (%eax),%edx
 76d:	8b 12                	mov    (%edx),%edx
 76f:	89 53 f8             	mov    %edx,-0x8(%ebx)
 772:	eb db                	jmp    74f <free+0x3e>
    p->s.size += bp->s.size;
 774:	03 53 fc             	add    -0x4(%ebx),%edx
 777:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 77a:	8b 53 f8             	mov    -0x8(%ebx),%edx
 77d:	89 10                	mov    %edx,(%eax)
 77f:	eb da                	jmp    75b <free+0x4a>

00000781 <morecore>:

static Header*
morecore(uint nu)
{
 781:	55                   	push   %ebp
 782:	89 e5                	mov    %esp,%ebp
 784:	53                   	push   %ebx
 785:	83 ec 04             	sub    $0x4,%esp
 788:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 78a:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 78f:	77 05                	ja     796 <morecore+0x15>
    nu = 4096;
 791:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 796:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 79d:	83 ec 0c             	sub    $0xc,%esp
 7a0:	50                   	push   %eax
 7a1:	e8 38 fd ff ff       	call   4de <sbrk>
  if(p == (char*)-1)
 7a6:	83 c4 10             	add    $0x10,%esp
 7a9:	83 f8 ff             	cmp    $0xffffffff,%eax
 7ac:	74 1c                	je     7ca <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 7ae:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 7b1:	83 c0 08             	add    $0x8,%eax
 7b4:	83 ec 0c             	sub    $0xc,%esp
 7b7:	50                   	push   %eax
 7b8:	e8 54 ff ff ff       	call   711 <free>
  return freep;
 7bd:	a1 c8 0c 00 00       	mov    0xcc8,%eax
 7c2:	83 c4 10             	add    $0x10,%esp
}
 7c5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 7c8:	c9                   	leave  
 7c9:	c3                   	ret    
    return 0;
 7ca:	b8 00 00 00 00       	mov    $0x0,%eax
 7cf:	eb f4                	jmp    7c5 <morecore+0x44>

000007d1 <malloc>:

void*
malloc(uint nbytes)
{
 7d1:	55                   	push   %ebp
 7d2:	89 e5                	mov    %esp,%ebp
 7d4:	53                   	push   %ebx
 7d5:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7d8:	8b 45 08             	mov    0x8(%ebp),%eax
 7db:	8d 58 07             	lea    0x7(%eax),%ebx
 7de:	c1 eb 03             	shr    $0x3,%ebx
 7e1:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 7e4:	8b 0d c8 0c 00 00    	mov    0xcc8,%ecx
 7ea:	85 c9                	test   %ecx,%ecx
 7ec:	74 04                	je     7f2 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7ee:	8b 01                	mov    (%ecx),%eax
 7f0:	eb 4a                	jmp    83c <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 7f2:	c7 05 c8 0c 00 00 cc 	movl   $0xccc,0xcc8
 7f9:	0c 00 00 
 7fc:	c7 05 cc 0c 00 00 cc 	movl   $0xccc,0xccc
 803:	0c 00 00 
    base.s.size = 0;
 806:	c7 05 d0 0c 00 00 00 	movl   $0x0,0xcd0
 80d:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 810:	b9 cc 0c 00 00       	mov    $0xccc,%ecx
 815:	eb d7                	jmp    7ee <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 817:	74 19                	je     832 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 819:	29 da                	sub    %ebx,%edx
 81b:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 81e:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 821:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 824:	89 0d c8 0c 00 00    	mov    %ecx,0xcc8
      return (void*)(p + 1);
 82a:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 82d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 830:	c9                   	leave  
 831:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 832:	8b 10                	mov    (%eax),%edx
 834:	89 11                	mov    %edx,(%ecx)
 836:	eb ec                	jmp    824 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 838:	89 c1                	mov    %eax,%ecx
 83a:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 83c:	8b 50 04             	mov    0x4(%eax),%edx
 83f:	39 da                	cmp    %ebx,%edx
 841:	73 d4                	jae    817 <malloc+0x46>
    if(p == freep)
 843:	39 05 c8 0c 00 00    	cmp    %eax,0xcc8
 849:	75 ed                	jne    838 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 84b:	89 d8                	mov    %ebx,%eax
 84d:	e8 2f ff ff ff       	call   781 <morecore>
 852:	85 c0                	test   %eax,%eax
 854:	75 e2                	jne    838 <malloc+0x67>
 856:	eb d5                	jmp    82d <malloc+0x5c>
