
_test_2:     file format elf32-i386


Disassembly of section .text:

00000000 <worker>:
   free(p);
   exit();
}

void
worker(void *arg1, void *arg2) {
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	53                   	push   %ebx
   4:	83 ec 04             	sub    $0x4,%esp
   7:	8b 55 08             	mov    0x8(%ebp),%edx
   a:	8b 45 0c             	mov    0xc(%ebp),%eax
   int tmp1 = *(int*)arg1;
   d:	8b 0a                	mov    (%edx),%ecx
   int tmp2 = *(int*)arg2;
   f:	8b 18                	mov    (%eax),%ebx
   *(int*)arg1 = 44;
  11:	c7 02 2c 00 00 00    	movl   $0x2c,(%edx)
   *(int*)arg2 = 55;
  17:	c7 00 37 00 00 00    	movl   $0x37,(%eax)
   assert(global == 1);
  1d:	a1 08 0d 00 00       	mov    0xd08,%eax
  22:	83 f8 01             	cmp    $0x1,%eax
  25:	74 49                	je     70 <worker+0x70>
  27:	6a 38                	push   $0x38
  29:	68 a8 08 00 00       	push   $0x8a8
  2e:	68 b1 08 00 00       	push   $0x8b1
  33:	6a 01                	push   $0x1
  35:	e8 c0 05 00 00       	call   5fa <printf>
  3a:	83 c4 0c             	add    $0xc,%esp
  3d:	68 b9 08 00 00       	push   $0x8b9
  42:	68 c5 08 00 00       	push   $0x8c5
  47:	6a 01                	push   $0x1
  49:	e8 ac 05 00 00       	call   5fa <printf>
  4e:	83 c4 08             	add    $0x8,%esp
  51:	68 d9 08 00 00       	push   $0x8d9
  56:	6a 01                	push   $0x1
  58:	e8 9d 05 00 00       	call   5fa <printf>
  5d:	83 c4 04             	add    $0x4,%esp
  60:	ff 35 14 0d 00 00    	push   0xd14
  66:	e8 6a 04 00 00       	call   4d5 <kill>
  6b:	e8 35 04 00 00       	call   4a5 <exit>
   global = tmp1 + tmp2;
  70:	01 d9                	add    %ebx,%ecx
  72:	89 0d 08 0d 00 00    	mov    %ecx,0xd08
   exit();
  78:	e8 28 04 00 00       	call   4a5 <exit>

0000007d <main>:
{
  7d:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  81:	83 e4 f0             	and    $0xfffffff0,%esp
  84:	ff 71 fc             	push   -0x4(%ecx)
  87:	55                   	push   %ebp
  88:	89 e5                	mov    %esp,%ebp
  8a:	56                   	push   %esi
  8b:	53                   	push   %ebx
  8c:	51                   	push   %ecx
  8d:	83 ec 1c             	sub    $0x1c,%esp
   ppid = getpid();
  90:	e8 90 04 00 00       	call   525 <getpid>
  95:	a3 14 0d 00 00       	mov    %eax,0xd14
   void *stack, *p = malloc(PGSIZE * 2);
  9a:	83 ec 0c             	sub    $0xc,%esp
  9d:	68 00 20 00 00       	push   $0x2000
  a2:	e8 79 07 00 00       	call   820 <malloc>
   assert(p != NULL);
  a7:	83 c4 10             	add    $0x10,%esp
  aa:	85 c0                	test   %eax,%eax
  ac:	0f 84 a6 00 00 00    	je     158 <main+0xdb>
  b2:	89 c3                	mov    %eax,%ebx
   if((uint)p % PGSIZE)
  b4:	89 c2                	mov    %eax,%edx
  b6:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
  bc:	74 09                	je     c7 <main+0x4a>
     stack = p + (PGSIZE - (uint)p % PGSIZE);
  be:	b8 00 10 00 00       	mov    $0x1000,%eax
  c3:	29 d0                	sub    %edx,%eax
  c5:	01 d8                	add    %ebx,%eax
   int clone_pid = clone(worker, (void*)&arg1, (void*)&arg2, stack);
  c7:	50                   	push   %eax
  c8:	68 0c 0d 00 00       	push   $0xd0c
  cd:	68 10 0d 00 00       	push   $0xd10
  d2:	68 00 00 00 00       	push   $0x0
  d7:	e8 69 04 00 00       	call   545 <clone>
  dc:	89 c6                	mov    %eax,%esi
   assert(clone_pid > 0);
  de:	83 c4 10             	add    $0x10,%esp
  e1:	85 c0                	test   %eax,%eax
  e3:	0f 8e b8 00 00 00    	jle    1a1 <main+0x124>
   while(global != 33);
  e9:	a1 08 0d 00 00       	mov    0xd08,%eax
  ee:	83 f8 21             	cmp    $0x21,%eax
  f1:	75 f6                	jne    e9 <main+0x6c>
   assert(arg1 == 44);
  f3:	a1 10 0d 00 00       	mov    0xd10,%eax
  f8:	83 f8 2c             	cmp    $0x2c,%eax
  fb:	0f 85 e9 00 00 00    	jne    1ea <main+0x16d>
   assert(arg2 == 55);
 101:	a1 0c 0d 00 00       	mov    0xd0c,%eax
 106:	83 f8 37             	cmp    $0x37,%eax
 109:	0f 84 24 01 00 00    	je     233 <main+0x1b6>
 10f:	6a 28                	push   $0x28
 111:	68 a8 08 00 00       	push   $0x8a8
 116:	68 b1 08 00 00       	push   $0x8b1
 11b:	6a 01                	push   $0x1
 11d:	e8 d8 04 00 00       	call   5fa <printf>
 122:	83 c4 0c             	add    $0xc,%esp
 125:	68 09 09 00 00       	push   $0x909
 12a:	68 c5 08 00 00       	push   $0x8c5
 12f:	6a 01                	push   $0x1
 131:	e8 c4 04 00 00       	call   5fa <printf>
 136:	83 c4 08             	add    $0x8,%esp
 139:	68 d9 08 00 00       	push   $0x8d9
 13e:	6a 01                	push   $0x1
 140:	e8 b5 04 00 00       	call   5fa <printf>
 145:	83 c4 04             	add    $0x4,%esp
 148:	ff 35 14 0d 00 00    	push   0xd14
 14e:	e8 82 03 00 00       	call   4d5 <kill>
 153:	e8 4d 03 00 00       	call   4a5 <exit>
   assert(p != NULL);
 158:	6a 1e                	push   $0x1e
 15a:	68 a8 08 00 00       	push   $0x8a8
 15f:	68 b1 08 00 00       	push   $0x8b1
 164:	6a 01                	push   $0x1
 166:	e8 8f 04 00 00       	call   5fa <printf>
 16b:	83 c4 0c             	add    $0xc,%esp
 16e:	68 e6 08 00 00       	push   $0x8e6
 173:	68 c5 08 00 00       	push   $0x8c5
 178:	6a 01                	push   $0x1
 17a:	e8 7b 04 00 00       	call   5fa <printf>
 17f:	83 c4 08             	add    $0x8,%esp
 182:	68 d9 08 00 00       	push   $0x8d9
 187:	6a 01                	push   $0x1
 189:	e8 6c 04 00 00       	call   5fa <printf>
 18e:	83 c4 04             	add    $0x4,%esp
 191:	ff 35 14 0d 00 00    	push   0xd14
 197:	e8 39 03 00 00       	call   4d5 <kill>
 19c:	e8 04 03 00 00       	call   4a5 <exit>
   assert(clone_pid > 0);
 1a1:	6a 25                	push   $0x25
 1a3:	68 a8 08 00 00       	push   $0x8a8
 1a8:	68 b1 08 00 00       	push   $0x8b1
 1ad:	6a 01                	push   $0x1
 1af:	e8 46 04 00 00       	call   5fa <printf>
 1b4:	83 c4 0c             	add    $0xc,%esp
 1b7:	68 f0 08 00 00       	push   $0x8f0
 1bc:	68 c5 08 00 00       	push   $0x8c5
 1c1:	6a 01                	push   $0x1
 1c3:	e8 32 04 00 00       	call   5fa <printf>
 1c8:	83 c4 08             	add    $0x8,%esp
 1cb:	68 d9 08 00 00       	push   $0x8d9
 1d0:	6a 01                	push   $0x1
 1d2:	e8 23 04 00 00       	call   5fa <printf>
 1d7:	83 c4 04             	add    $0x4,%esp
 1da:	ff 35 14 0d 00 00    	push   0xd14
 1e0:	e8 f0 02 00 00       	call   4d5 <kill>
 1e5:	e8 bb 02 00 00       	call   4a5 <exit>
   assert(arg1 == 44);
 1ea:	6a 27                	push   $0x27
 1ec:	68 a8 08 00 00       	push   $0x8a8
 1f1:	68 b1 08 00 00       	push   $0x8b1
 1f6:	6a 01                	push   $0x1
 1f8:	e8 fd 03 00 00       	call   5fa <printf>
 1fd:	83 c4 0c             	add    $0xc,%esp
 200:	68 fe 08 00 00       	push   $0x8fe
 205:	68 c5 08 00 00       	push   $0x8c5
 20a:	6a 01                	push   $0x1
 20c:	e8 e9 03 00 00       	call   5fa <printf>
 211:	83 c4 08             	add    $0x8,%esp
 214:	68 d9 08 00 00       	push   $0x8d9
 219:	6a 01                	push   $0x1
 21b:	e8 da 03 00 00       	call   5fa <printf>
 220:	83 c4 04             	add    $0x4,%esp
 223:	ff 35 14 0d 00 00    	push   0xd14
 229:	e8 a7 02 00 00       	call   4d5 <kill>
 22e:	e8 72 02 00 00       	call   4a5 <exit>
   printf(1, "TEST PASSED\n");
 233:	83 ec 08             	sub    $0x8,%esp
 236:	68 14 09 00 00       	push   $0x914
 23b:	6a 01                	push   $0x1
 23d:	e8 b8 03 00 00       	call   5fa <printf>
   int join_pid = join(&join_stack);
 242:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 245:	89 04 24             	mov    %eax,(%esp)
 248:	e8 00 03 00 00       	call   54d <join>
   assert(join_pid == clone_pid);
 24d:	83 c4 10             	add    $0x10,%esp
 250:	39 c6                	cmp    %eax,%esi
 252:	74 49                	je     29d <main+0x220>
 254:	6a 2d                	push   $0x2d
 256:	68 a8 08 00 00       	push   $0x8a8
 25b:	68 b1 08 00 00       	push   $0x8b1
 260:	6a 01                	push   $0x1
 262:	e8 93 03 00 00       	call   5fa <printf>
 267:	83 c4 0c             	add    $0xc,%esp
 26a:	68 21 09 00 00       	push   $0x921
 26f:	68 c5 08 00 00       	push   $0x8c5
 274:	6a 01                	push   $0x1
 276:	e8 7f 03 00 00       	call   5fa <printf>
 27b:	83 c4 08             	add    $0x8,%esp
 27e:	68 d9 08 00 00       	push   $0x8d9
 283:	6a 01                	push   $0x1
 285:	e8 70 03 00 00       	call   5fa <printf>
 28a:	83 c4 04             	add    $0x4,%esp
 28d:	ff 35 14 0d 00 00    	push   0xd14
 293:	e8 3d 02 00 00       	call   4d5 <kill>
 298:	e8 08 02 00 00       	call   4a5 <exit>
   free(p);
 29d:	83 ec 0c             	sub    $0xc,%esp
 2a0:	53                   	push   %ebx
 2a1:	e8 ba 04 00 00       	call   760 <free>
   exit();
 2a6:	e8 fa 01 00 00       	call   4a5 <exit>

000002ab <test_and_set>:
#include "fcntl.h"
#include "user.h"
#include "x86.h"
#include "mmu.h"

int test_and_set(int *old_ptr, int new_ptr) {
 2ab:	55                   	push   %ebp
 2ac:	89 e5                	mov    %esp,%ebp
 2ae:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *old_ptr;
 2b1:	8b 10                	mov    (%eax),%edx
  *old_ptr = new_ptr;
 2b3:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 2b6:	89 08                	mov    %ecx,(%eax)
  return old;
}
 2b8:	89 d0                	mov    %edx,%eax
 2ba:	5d                   	pop    %ebp
 2bb:	c3                   	ret    

000002bc <thread_create>:

  // I can't remember if there was something else to do here but I'm sure I'll find out


  return new_pid;
}
 2bc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2c1:	c3                   	ret    

000002c2 <thread_join>:

int thread_join() {
  return 0;
}
 2c2:	b8 00 00 00 00       	mov    $0x0,%eax
 2c7:	c3                   	ret    

000002c8 <lock_acquire>:

void lock_acquire(lock_t *lock){
 2c8:	55                   	push   %ebp
 2c9:	89 e5                	mov    %esp,%ebp
 2cb:	53                   	push   %ebx
 2cc:	83 ec 04             	sub    $0x4,%esp
 2cf:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 2d2:	83 ec 08             	sub    $0x8,%esp
 2d5:	6a 01                	push   $0x1
 2d7:	53                   	push   %ebx
 2d8:	e8 ce ff ff ff       	call   2ab <test_and_set>
 2dd:	83 c4 10             	add    $0x10,%esp
 2e0:	83 f8 01             	cmp    $0x1,%eax
 2e3:	74 ed                	je     2d2 <lock_acquire+0xa>
    ;
}
 2e5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2e8:	c9                   	leave  
 2e9:	c3                   	ret    

000002ea <lock_release>:

void lock_release(lock_t *lock) {
 2ea:	55                   	push   %ebp
 2eb:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 2ed:	8b 45 08             	mov    0x8(%ebp),%eax
 2f0:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 2f6:	5d                   	pop    %ebp
 2f7:	c3                   	ret    

000002f8 <lock_init>:

void lock_init(lock_t *lock) {
 2f8:	55                   	push   %ebp
 2f9:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 2fb:	8b 45 08             	mov    0x8(%ebp),%eax
 2fe:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 304:	5d                   	pop    %ebp
 305:	c3                   	ret    

00000306 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 306:	55                   	push   %ebp
 307:	89 e5                	mov    %esp,%ebp
 309:	56                   	push   %esi
 30a:	53                   	push   %ebx
 30b:	8b 75 08             	mov    0x8(%ebp),%esi
 30e:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 311:	89 f0                	mov    %esi,%eax
 313:	89 d1                	mov    %edx,%ecx
 315:	83 c2 01             	add    $0x1,%edx
 318:	89 c3                	mov    %eax,%ebx
 31a:	83 c0 01             	add    $0x1,%eax
 31d:	0f b6 09             	movzbl (%ecx),%ecx
 320:	88 0b                	mov    %cl,(%ebx)
 322:	84 c9                	test   %cl,%cl
 324:	75 ed                	jne    313 <strcpy+0xd>
    ;
  return os;
}
 326:	89 f0                	mov    %esi,%eax
 328:	5b                   	pop    %ebx
 329:	5e                   	pop    %esi
 32a:	5d                   	pop    %ebp
 32b:	c3                   	ret    

0000032c <strcmp>:

int
strcmp(const char *p, const char *q)
{
 32c:	55                   	push   %ebp
 32d:	89 e5                	mov    %esp,%ebp
 32f:	8b 4d 08             	mov    0x8(%ebp),%ecx
 332:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 335:	eb 06                	jmp    33d <strcmp+0x11>
    p++, q++;
 337:	83 c1 01             	add    $0x1,%ecx
 33a:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 33d:	0f b6 01             	movzbl (%ecx),%eax
 340:	84 c0                	test   %al,%al
 342:	74 04                	je     348 <strcmp+0x1c>
 344:	3a 02                	cmp    (%edx),%al
 346:	74 ef                	je     337 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 348:	0f b6 c0             	movzbl %al,%eax
 34b:	0f b6 12             	movzbl (%edx),%edx
 34e:	29 d0                	sub    %edx,%eax
}
 350:	5d                   	pop    %ebp
 351:	c3                   	ret    

00000352 <strlen>:

uint
strlen(const char *s)
{
 352:	55                   	push   %ebp
 353:	89 e5                	mov    %esp,%ebp
 355:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 358:	b8 00 00 00 00       	mov    $0x0,%eax
 35d:	eb 03                	jmp    362 <strlen+0x10>
 35f:	83 c0 01             	add    $0x1,%eax
 362:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 366:	75 f7                	jne    35f <strlen+0xd>
    ;
  return n;
}
 368:	5d                   	pop    %ebp
 369:	c3                   	ret    

0000036a <memset>:

void*
memset(void *dst, int c, uint n)
{
 36a:	55                   	push   %ebp
 36b:	89 e5                	mov    %esp,%ebp
 36d:	57                   	push   %edi
 36e:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 371:	89 d7                	mov    %edx,%edi
 373:	8b 4d 10             	mov    0x10(%ebp),%ecx
 376:	8b 45 0c             	mov    0xc(%ebp),%eax
 379:	fc                   	cld    
 37a:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 37c:	89 d0                	mov    %edx,%eax
 37e:	8b 7d fc             	mov    -0x4(%ebp),%edi
 381:	c9                   	leave  
 382:	c3                   	ret    

00000383 <strchr>:

char*
strchr(const char *s, char c)
{
 383:	55                   	push   %ebp
 384:	89 e5                	mov    %esp,%ebp
 386:	8b 45 08             	mov    0x8(%ebp),%eax
 389:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 38d:	eb 03                	jmp    392 <strchr+0xf>
 38f:	83 c0 01             	add    $0x1,%eax
 392:	0f b6 10             	movzbl (%eax),%edx
 395:	84 d2                	test   %dl,%dl
 397:	74 06                	je     39f <strchr+0x1c>
    if(*s == c)
 399:	38 ca                	cmp    %cl,%dl
 39b:	75 f2                	jne    38f <strchr+0xc>
 39d:	eb 05                	jmp    3a4 <strchr+0x21>
      return (char*)s;
  return 0;
 39f:	b8 00 00 00 00       	mov    $0x0,%eax
}
 3a4:	5d                   	pop    %ebp
 3a5:	c3                   	ret    

000003a6 <gets>:

char*
gets(char *buf, int max)
{
 3a6:	55                   	push   %ebp
 3a7:	89 e5                	mov    %esp,%ebp
 3a9:	57                   	push   %edi
 3aa:	56                   	push   %esi
 3ab:	53                   	push   %ebx
 3ac:	83 ec 1c             	sub    $0x1c,%esp
 3af:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 3b2:	bb 00 00 00 00       	mov    $0x0,%ebx
 3b7:	89 de                	mov    %ebx,%esi
 3b9:	83 c3 01             	add    $0x1,%ebx
 3bc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 3bf:	7d 2e                	jge    3ef <gets+0x49>
    cc = read(0, &c, 1);
 3c1:	83 ec 04             	sub    $0x4,%esp
 3c4:	6a 01                	push   $0x1
 3c6:	8d 45 e7             	lea    -0x19(%ebp),%eax
 3c9:	50                   	push   %eax
 3ca:	6a 00                	push   $0x0
 3cc:	e8 ec 00 00 00       	call   4bd <read>
    if(cc < 1)
 3d1:	83 c4 10             	add    $0x10,%esp
 3d4:	85 c0                	test   %eax,%eax
 3d6:	7e 17                	jle    3ef <gets+0x49>
      break;
    buf[i++] = c;
 3d8:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 3dc:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 3df:	3c 0a                	cmp    $0xa,%al
 3e1:	0f 94 c2             	sete   %dl
 3e4:	3c 0d                	cmp    $0xd,%al
 3e6:	0f 94 c0             	sete   %al
 3e9:	08 c2                	or     %al,%dl
 3eb:	74 ca                	je     3b7 <gets+0x11>
    buf[i++] = c;
 3ed:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 3ef:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 3f3:	89 f8                	mov    %edi,%eax
 3f5:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3f8:	5b                   	pop    %ebx
 3f9:	5e                   	pop    %esi
 3fa:	5f                   	pop    %edi
 3fb:	5d                   	pop    %ebp
 3fc:	c3                   	ret    

000003fd <stat>:

int
stat(const char *n, struct stat *st)
{
 3fd:	55                   	push   %ebp
 3fe:	89 e5                	mov    %esp,%ebp
 400:	56                   	push   %esi
 401:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 402:	83 ec 08             	sub    $0x8,%esp
 405:	6a 00                	push   $0x0
 407:	ff 75 08             	push   0x8(%ebp)
 40a:	e8 d6 00 00 00       	call   4e5 <open>
  if(fd < 0)
 40f:	83 c4 10             	add    $0x10,%esp
 412:	85 c0                	test   %eax,%eax
 414:	78 24                	js     43a <stat+0x3d>
 416:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 418:	83 ec 08             	sub    $0x8,%esp
 41b:	ff 75 0c             	push   0xc(%ebp)
 41e:	50                   	push   %eax
 41f:	e8 d9 00 00 00       	call   4fd <fstat>
 424:	89 c6                	mov    %eax,%esi
  close(fd);
 426:	89 1c 24             	mov    %ebx,(%esp)
 429:	e8 9f 00 00 00       	call   4cd <close>
  return r;
 42e:	83 c4 10             	add    $0x10,%esp
}
 431:	89 f0                	mov    %esi,%eax
 433:	8d 65 f8             	lea    -0x8(%ebp),%esp
 436:	5b                   	pop    %ebx
 437:	5e                   	pop    %esi
 438:	5d                   	pop    %ebp
 439:	c3                   	ret    
    return -1;
 43a:	be ff ff ff ff       	mov    $0xffffffff,%esi
 43f:	eb f0                	jmp    431 <stat+0x34>

00000441 <atoi>:

int
atoi(const char *s)
{
 441:	55                   	push   %ebp
 442:	89 e5                	mov    %esp,%ebp
 444:	53                   	push   %ebx
 445:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 448:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 44d:	eb 10                	jmp    45f <atoi+0x1e>
    n = n*10 + *s++ - '0';
 44f:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 452:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 455:	83 c1 01             	add    $0x1,%ecx
 458:	0f be c0             	movsbl %al,%eax
 45b:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 45f:	0f b6 01             	movzbl (%ecx),%eax
 462:	8d 58 d0             	lea    -0x30(%eax),%ebx
 465:	80 fb 09             	cmp    $0x9,%bl
 468:	76 e5                	jbe    44f <atoi+0xe>
  return n;
}
 46a:	89 d0                	mov    %edx,%eax
 46c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 46f:	c9                   	leave  
 470:	c3                   	ret    

00000471 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 471:	55                   	push   %ebp
 472:	89 e5                	mov    %esp,%ebp
 474:	56                   	push   %esi
 475:	53                   	push   %ebx
 476:	8b 75 08             	mov    0x8(%ebp),%esi
 479:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 47c:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 47f:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 481:	eb 0d                	jmp    490 <memmove+0x1f>
    *dst++ = *src++;
 483:	0f b6 01             	movzbl (%ecx),%eax
 486:	88 02                	mov    %al,(%edx)
 488:	8d 49 01             	lea    0x1(%ecx),%ecx
 48b:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 48e:	89 d8                	mov    %ebx,%eax
 490:	8d 58 ff             	lea    -0x1(%eax),%ebx
 493:	85 c0                	test   %eax,%eax
 495:	7f ec                	jg     483 <memmove+0x12>
  return vdst;
}
 497:	89 f0                	mov    %esi,%eax
 499:	5b                   	pop    %ebx
 49a:	5e                   	pop    %esi
 49b:	5d                   	pop    %ebp
 49c:	c3                   	ret    

0000049d <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 49d:	b8 01 00 00 00       	mov    $0x1,%eax
 4a2:	cd 40                	int    $0x40
 4a4:	c3                   	ret    

000004a5 <exit>:
SYSCALL(exit)
 4a5:	b8 02 00 00 00       	mov    $0x2,%eax
 4aa:	cd 40                	int    $0x40
 4ac:	c3                   	ret    

000004ad <wait>:
SYSCALL(wait)
 4ad:	b8 03 00 00 00       	mov    $0x3,%eax
 4b2:	cd 40                	int    $0x40
 4b4:	c3                   	ret    

000004b5 <pipe>:
SYSCALL(pipe)
 4b5:	b8 04 00 00 00       	mov    $0x4,%eax
 4ba:	cd 40                	int    $0x40
 4bc:	c3                   	ret    

000004bd <read>:
SYSCALL(read)
 4bd:	b8 05 00 00 00       	mov    $0x5,%eax
 4c2:	cd 40                	int    $0x40
 4c4:	c3                   	ret    

000004c5 <write>:
SYSCALL(write)
 4c5:	b8 10 00 00 00       	mov    $0x10,%eax
 4ca:	cd 40                	int    $0x40
 4cc:	c3                   	ret    

000004cd <close>:
SYSCALL(close)
 4cd:	b8 15 00 00 00       	mov    $0x15,%eax
 4d2:	cd 40                	int    $0x40
 4d4:	c3                   	ret    

000004d5 <kill>:
SYSCALL(kill)
 4d5:	b8 06 00 00 00       	mov    $0x6,%eax
 4da:	cd 40                	int    $0x40
 4dc:	c3                   	ret    

000004dd <exec>:
SYSCALL(exec)
 4dd:	b8 07 00 00 00       	mov    $0x7,%eax
 4e2:	cd 40                	int    $0x40
 4e4:	c3                   	ret    

000004e5 <open>:
SYSCALL(open)
 4e5:	b8 0f 00 00 00       	mov    $0xf,%eax
 4ea:	cd 40                	int    $0x40
 4ec:	c3                   	ret    

000004ed <mknod>:
SYSCALL(mknod)
 4ed:	b8 11 00 00 00       	mov    $0x11,%eax
 4f2:	cd 40                	int    $0x40
 4f4:	c3                   	ret    

000004f5 <unlink>:
SYSCALL(unlink)
 4f5:	b8 12 00 00 00       	mov    $0x12,%eax
 4fa:	cd 40                	int    $0x40
 4fc:	c3                   	ret    

000004fd <fstat>:
SYSCALL(fstat)
 4fd:	b8 08 00 00 00       	mov    $0x8,%eax
 502:	cd 40                	int    $0x40
 504:	c3                   	ret    

00000505 <link>:
SYSCALL(link)
 505:	b8 13 00 00 00       	mov    $0x13,%eax
 50a:	cd 40                	int    $0x40
 50c:	c3                   	ret    

0000050d <mkdir>:
SYSCALL(mkdir)
 50d:	b8 14 00 00 00       	mov    $0x14,%eax
 512:	cd 40                	int    $0x40
 514:	c3                   	ret    

00000515 <chdir>:
SYSCALL(chdir)
 515:	b8 09 00 00 00       	mov    $0x9,%eax
 51a:	cd 40                	int    $0x40
 51c:	c3                   	ret    

0000051d <dup>:
SYSCALL(dup)
 51d:	b8 0a 00 00 00       	mov    $0xa,%eax
 522:	cd 40                	int    $0x40
 524:	c3                   	ret    

00000525 <getpid>:
SYSCALL(getpid)
 525:	b8 0b 00 00 00       	mov    $0xb,%eax
 52a:	cd 40                	int    $0x40
 52c:	c3                   	ret    

0000052d <sbrk>:
SYSCALL(sbrk)
 52d:	b8 0c 00 00 00       	mov    $0xc,%eax
 532:	cd 40                	int    $0x40
 534:	c3                   	ret    

00000535 <sleep>:
SYSCALL(sleep)
 535:	b8 0d 00 00 00       	mov    $0xd,%eax
 53a:	cd 40                	int    $0x40
 53c:	c3                   	ret    

0000053d <uptime>:
SYSCALL(uptime)
 53d:	b8 0e 00 00 00       	mov    $0xe,%eax
 542:	cd 40                	int    $0x40
 544:	c3                   	ret    

00000545 <clone>:
SYSCALL(clone)
 545:	b8 16 00 00 00       	mov    $0x16,%eax
 54a:	cd 40                	int    $0x40
 54c:	c3                   	ret    

0000054d <join>:
 54d:	b8 17 00 00 00       	mov    $0x17,%eax
 552:	cd 40                	int    $0x40
 554:	c3                   	ret    

00000555 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 555:	55                   	push   %ebp
 556:	89 e5                	mov    %esp,%ebp
 558:	83 ec 1c             	sub    $0x1c,%esp
 55b:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 55e:	6a 01                	push   $0x1
 560:	8d 55 f4             	lea    -0xc(%ebp),%edx
 563:	52                   	push   %edx
 564:	50                   	push   %eax
 565:	e8 5b ff ff ff       	call   4c5 <write>
}
 56a:	83 c4 10             	add    $0x10,%esp
 56d:	c9                   	leave  
 56e:	c3                   	ret    

0000056f <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 56f:	55                   	push   %ebp
 570:	89 e5                	mov    %esp,%ebp
 572:	57                   	push   %edi
 573:	56                   	push   %esi
 574:	53                   	push   %ebx
 575:	83 ec 2c             	sub    $0x2c,%esp
 578:	89 45 d0             	mov    %eax,-0x30(%ebp)
 57b:	89 d0                	mov    %edx,%eax
 57d:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 57f:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 583:	0f 95 c1             	setne  %cl
 586:	c1 ea 1f             	shr    $0x1f,%edx
 589:	84 d1                	test   %dl,%cl
 58b:	74 44                	je     5d1 <printint+0x62>
    neg = 1;
    x = -xx;
 58d:	f7 d8                	neg    %eax
 58f:	89 c1                	mov    %eax,%ecx
    neg = 1;
 591:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 598:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 59d:	89 c8                	mov    %ecx,%eax
 59f:	ba 00 00 00 00       	mov    $0x0,%edx
 5a4:	f7 f6                	div    %esi
 5a6:	89 df                	mov    %ebx,%edi
 5a8:	83 c3 01             	add    $0x1,%ebx
 5ab:	0f b6 92 98 09 00 00 	movzbl 0x998(%edx),%edx
 5b2:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 5b6:	89 ca                	mov    %ecx,%edx
 5b8:	89 c1                	mov    %eax,%ecx
 5ba:	39 d6                	cmp    %edx,%esi
 5bc:	76 df                	jbe    59d <printint+0x2e>
  if(neg)
 5be:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 5c2:	74 31                	je     5f5 <printint+0x86>
    buf[i++] = '-';
 5c4:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 5c9:	8d 5f 02             	lea    0x2(%edi),%ebx
 5cc:	8b 75 d0             	mov    -0x30(%ebp),%esi
 5cf:	eb 17                	jmp    5e8 <printint+0x79>
    x = xx;
 5d1:	89 c1                	mov    %eax,%ecx
  neg = 0;
 5d3:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 5da:	eb bc                	jmp    598 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 5dc:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 5e1:	89 f0                	mov    %esi,%eax
 5e3:	e8 6d ff ff ff       	call   555 <putc>
  while(--i >= 0)
 5e8:	83 eb 01             	sub    $0x1,%ebx
 5eb:	79 ef                	jns    5dc <printint+0x6d>
}
 5ed:	83 c4 2c             	add    $0x2c,%esp
 5f0:	5b                   	pop    %ebx
 5f1:	5e                   	pop    %esi
 5f2:	5f                   	pop    %edi
 5f3:	5d                   	pop    %ebp
 5f4:	c3                   	ret    
 5f5:	8b 75 d0             	mov    -0x30(%ebp),%esi
 5f8:	eb ee                	jmp    5e8 <printint+0x79>

000005fa <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5fa:	55                   	push   %ebp
 5fb:	89 e5                	mov    %esp,%ebp
 5fd:	57                   	push   %edi
 5fe:	56                   	push   %esi
 5ff:	53                   	push   %ebx
 600:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 603:	8d 45 10             	lea    0x10(%ebp),%eax
 606:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 609:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 60e:	bb 00 00 00 00       	mov    $0x0,%ebx
 613:	eb 14                	jmp    629 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 615:	89 fa                	mov    %edi,%edx
 617:	8b 45 08             	mov    0x8(%ebp),%eax
 61a:	e8 36 ff ff ff       	call   555 <putc>
 61f:	eb 05                	jmp    626 <printf+0x2c>
      }
    } else if(state == '%'){
 621:	83 fe 25             	cmp    $0x25,%esi
 624:	74 25                	je     64b <printf+0x51>
  for(i = 0; fmt[i]; i++){
 626:	83 c3 01             	add    $0x1,%ebx
 629:	8b 45 0c             	mov    0xc(%ebp),%eax
 62c:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 630:	84 c0                	test   %al,%al
 632:	0f 84 20 01 00 00    	je     758 <printf+0x15e>
    c = fmt[i] & 0xff;
 638:	0f be f8             	movsbl %al,%edi
 63b:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 63e:	85 f6                	test   %esi,%esi
 640:	75 df                	jne    621 <printf+0x27>
      if(c == '%'){
 642:	83 f8 25             	cmp    $0x25,%eax
 645:	75 ce                	jne    615 <printf+0x1b>
        state = '%';
 647:	89 c6                	mov    %eax,%esi
 649:	eb db                	jmp    626 <printf+0x2c>
      if(c == 'd'){
 64b:	83 f8 25             	cmp    $0x25,%eax
 64e:	0f 84 cf 00 00 00    	je     723 <printf+0x129>
 654:	0f 8c dd 00 00 00    	jl     737 <printf+0x13d>
 65a:	83 f8 78             	cmp    $0x78,%eax
 65d:	0f 8f d4 00 00 00    	jg     737 <printf+0x13d>
 663:	83 f8 63             	cmp    $0x63,%eax
 666:	0f 8c cb 00 00 00    	jl     737 <printf+0x13d>
 66c:	83 e8 63             	sub    $0x63,%eax
 66f:	83 f8 15             	cmp    $0x15,%eax
 672:	0f 87 bf 00 00 00    	ja     737 <printf+0x13d>
 678:	ff 24 85 40 09 00 00 	jmp    *0x940(,%eax,4)
        printint(fd, *ap, 10, 1);
 67f:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 682:	8b 17                	mov    (%edi),%edx
 684:	83 ec 0c             	sub    $0xc,%esp
 687:	6a 01                	push   $0x1
 689:	b9 0a 00 00 00       	mov    $0xa,%ecx
 68e:	8b 45 08             	mov    0x8(%ebp),%eax
 691:	e8 d9 fe ff ff       	call   56f <printint>
        ap++;
 696:	83 c7 04             	add    $0x4,%edi
 699:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 69c:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 69f:	be 00 00 00 00       	mov    $0x0,%esi
 6a4:	eb 80                	jmp    626 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 6a6:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6a9:	8b 17                	mov    (%edi),%edx
 6ab:	83 ec 0c             	sub    $0xc,%esp
 6ae:	6a 00                	push   $0x0
 6b0:	b9 10 00 00 00       	mov    $0x10,%ecx
 6b5:	8b 45 08             	mov    0x8(%ebp),%eax
 6b8:	e8 b2 fe ff ff       	call   56f <printint>
        ap++;
 6bd:	83 c7 04             	add    $0x4,%edi
 6c0:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 6c3:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6c6:	be 00 00 00 00       	mov    $0x0,%esi
 6cb:	e9 56 ff ff ff       	jmp    626 <printf+0x2c>
        s = (char*)*ap;
 6d0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6d3:	8b 30                	mov    (%eax),%esi
        ap++;
 6d5:	83 c0 04             	add    $0x4,%eax
 6d8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 6db:	85 f6                	test   %esi,%esi
 6dd:	75 15                	jne    6f4 <printf+0xfa>
          s = "(null)";
 6df:	be 37 09 00 00       	mov    $0x937,%esi
 6e4:	eb 0e                	jmp    6f4 <printf+0xfa>
          putc(fd, *s);
 6e6:	0f be d2             	movsbl %dl,%edx
 6e9:	8b 45 08             	mov    0x8(%ebp),%eax
 6ec:	e8 64 fe ff ff       	call   555 <putc>
          s++;
 6f1:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 6f4:	0f b6 16             	movzbl (%esi),%edx
 6f7:	84 d2                	test   %dl,%dl
 6f9:	75 eb                	jne    6e6 <printf+0xec>
      state = 0;
 6fb:	be 00 00 00 00       	mov    $0x0,%esi
 700:	e9 21 ff ff ff       	jmp    626 <printf+0x2c>
        putc(fd, *ap);
 705:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 708:	0f be 17             	movsbl (%edi),%edx
 70b:	8b 45 08             	mov    0x8(%ebp),%eax
 70e:	e8 42 fe ff ff       	call   555 <putc>
        ap++;
 713:	83 c7 04             	add    $0x4,%edi
 716:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 719:	be 00 00 00 00       	mov    $0x0,%esi
 71e:	e9 03 ff ff ff       	jmp    626 <printf+0x2c>
        putc(fd, c);
 723:	89 fa                	mov    %edi,%edx
 725:	8b 45 08             	mov    0x8(%ebp),%eax
 728:	e8 28 fe ff ff       	call   555 <putc>
      state = 0;
 72d:	be 00 00 00 00       	mov    $0x0,%esi
 732:	e9 ef fe ff ff       	jmp    626 <printf+0x2c>
        putc(fd, '%');
 737:	ba 25 00 00 00       	mov    $0x25,%edx
 73c:	8b 45 08             	mov    0x8(%ebp),%eax
 73f:	e8 11 fe ff ff       	call   555 <putc>
        putc(fd, c);
 744:	89 fa                	mov    %edi,%edx
 746:	8b 45 08             	mov    0x8(%ebp),%eax
 749:	e8 07 fe ff ff       	call   555 <putc>
      state = 0;
 74e:	be 00 00 00 00       	mov    $0x0,%esi
 753:	e9 ce fe ff ff       	jmp    626 <printf+0x2c>
    }
  }
}
 758:	8d 65 f4             	lea    -0xc(%ebp),%esp
 75b:	5b                   	pop    %ebx
 75c:	5e                   	pop    %esi
 75d:	5f                   	pop    %edi
 75e:	5d                   	pop    %ebp
 75f:	c3                   	ret    

00000760 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 760:	55                   	push   %ebp
 761:	89 e5                	mov    %esp,%ebp
 763:	57                   	push   %edi
 764:	56                   	push   %esi
 765:	53                   	push   %ebx
 766:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 769:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 76c:	a1 18 0d 00 00       	mov    0xd18,%eax
 771:	eb 02                	jmp    775 <free+0x15>
 773:	89 d0                	mov    %edx,%eax
 775:	39 c8                	cmp    %ecx,%eax
 777:	73 04                	jae    77d <free+0x1d>
 779:	39 08                	cmp    %ecx,(%eax)
 77b:	77 12                	ja     78f <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 77d:	8b 10                	mov    (%eax),%edx
 77f:	39 c2                	cmp    %eax,%edx
 781:	77 f0                	ja     773 <free+0x13>
 783:	39 c8                	cmp    %ecx,%eax
 785:	72 08                	jb     78f <free+0x2f>
 787:	39 ca                	cmp    %ecx,%edx
 789:	77 04                	ja     78f <free+0x2f>
 78b:	89 d0                	mov    %edx,%eax
 78d:	eb e6                	jmp    775 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 78f:	8b 73 fc             	mov    -0x4(%ebx),%esi
 792:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 795:	8b 10                	mov    (%eax),%edx
 797:	39 d7                	cmp    %edx,%edi
 799:	74 19                	je     7b4 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 79b:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 79e:	8b 50 04             	mov    0x4(%eax),%edx
 7a1:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7a4:	39 ce                	cmp    %ecx,%esi
 7a6:	74 1b                	je     7c3 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 7a8:	89 08                	mov    %ecx,(%eax)
  freep = p;
 7aa:	a3 18 0d 00 00       	mov    %eax,0xd18
}
 7af:	5b                   	pop    %ebx
 7b0:	5e                   	pop    %esi
 7b1:	5f                   	pop    %edi
 7b2:	5d                   	pop    %ebp
 7b3:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 7b4:	03 72 04             	add    0x4(%edx),%esi
 7b7:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7ba:	8b 10                	mov    (%eax),%edx
 7bc:	8b 12                	mov    (%edx),%edx
 7be:	89 53 f8             	mov    %edx,-0x8(%ebx)
 7c1:	eb db                	jmp    79e <free+0x3e>
    p->s.size += bp->s.size;
 7c3:	03 53 fc             	add    -0x4(%ebx),%edx
 7c6:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7c9:	8b 53 f8             	mov    -0x8(%ebx),%edx
 7cc:	89 10                	mov    %edx,(%eax)
 7ce:	eb da                	jmp    7aa <free+0x4a>

000007d0 <morecore>:

static Header*
morecore(uint nu)
{
 7d0:	55                   	push   %ebp
 7d1:	89 e5                	mov    %esp,%ebp
 7d3:	53                   	push   %ebx
 7d4:	83 ec 04             	sub    $0x4,%esp
 7d7:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 7d9:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 7de:	77 05                	ja     7e5 <morecore+0x15>
    nu = 4096;
 7e0:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 7e5:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 7ec:	83 ec 0c             	sub    $0xc,%esp
 7ef:	50                   	push   %eax
 7f0:	e8 38 fd ff ff       	call   52d <sbrk>
  if(p == (char*)-1)
 7f5:	83 c4 10             	add    $0x10,%esp
 7f8:	83 f8 ff             	cmp    $0xffffffff,%eax
 7fb:	74 1c                	je     819 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 7fd:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 800:	83 c0 08             	add    $0x8,%eax
 803:	83 ec 0c             	sub    $0xc,%esp
 806:	50                   	push   %eax
 807:	e8 54 ff ff ff       	call   760 <free>
  return freep;
 80c:	a1 18 0d 00 00       	mov    0xd18,%eax
 811:	83 c4 10             	add    $0x10,%esp
}
 814:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 817:	c9                   	leave  
 818:	c3                   	ret    
    return 0;
 819:	b8 00 00 00 00       	mov    $0x0,%eax
 81e:	eb f4                	jmp    814 <morecore+0x44>

00000820 <malloc>:

void*
malloc(uint nbytes)
{
 820:	55                   	push   %ebp
 821:	89 e5                	mov    %esp,%ebp
 823:	53                   	push   %ebx
 824:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 827:	8b 45 08             	mov    0x8(%ebp),%eax
 82a:	8d 58 07             	lea    0x7(%eax),%ebx
 82d:	c1 eb 03             	shr    $0x3,%ebx
 830:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 833:	8b 0d 18 0d 00 00    	mov    0xd18,%ecx
 839:	85 c9                	test   %ecx,%ecx
 83b:	74 04                	je     841 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 83d:	8b 01                	mov    (%ecx),%eax
 83f:	eb 4a                	jmp    88b <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 841:	c7 05 18 0d 00 00 1c 	movl   $0xd1c,0xd18
 848:	0d 00 00 
 84b:	c7 05 1c 0d 00 00 1c 	movl   $0xd1c,0xd1c
 852:	0d 00 00 
    base.s.size = 0;
 855:	c7 05 20 0d 00 00 00 	movl   $0x0,0xd20
 85c:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 85f:	b9 1c 0d 00 00       	mov    $0xd1c,%ecx
 864:	eb d7                	jmp    83d <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 866:	74 19                	je     881 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 868:	29 da                	sub    %ebx,%edx
 86a:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 86d:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 870:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 873:	89 0d 18 0d 00 00    	mov    %ecx,0xd18
      return (void*)(p + 1);
 879:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 87c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 87f:	c9                   	leave  
 880:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 881:	8b 10                	mov    (%eax),%edx
 883:	89 11                	mov    %edx,(%ecx)
 885:	eb ec                	jmp    873 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 887:	89 c1                	mov    %eax,%ecx
 889:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 88b:	8b 50 04             	mov    0x4(%eax),%edx
 88e:	39 da                	cmp    %ebx,%edx
 890:	73 d4                	jae    866 <malloc+0x46>
    if(p == freep)
 892:	39 05 18 0d 00 00    	cmp    %eax,0xd18
 898:	75 ed                	jne    887 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 89a:	89 d8                	mov    %ebx,%eax
 89c:	e8 2f ff ff ff       	call   7d0 <morecore>
 8a1:	85 c0                	test   %eax,%eax
 8a3:	75 e2                	jne    887 <malloc+0x67>
 8a5:	eb d5                	jmp    87c <malloc+0x5c>
