
_test_3:     file format elf32-i386


Disassembly of section .text:

00000000 <worker>:
   free(p);
   exit();
}

void
worker(void *arg1, void *arg2) {
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 0c             	sub    $0xc,%esp
   assert(write(3, "hello\n", 6) == 6);
   6:	6a 06                	push   $0x6
   8:	68 cc 08 00 00       	push   $0x8cc
   d:	6a 03                	push   $0x3
   f:	e8 d3 04 00 00       	call   4e7 <write>
  14:	83 c4 10             	add    $0x10,%esp
  17:	83 f8 06             	cmp    $0x6,%eax
  1a:	74 49                	je     65 <worker+0x65>
  1c:	6a 34                	push   $0x34
  1e:	68 d3 08 00 00       	push   $0x8d3
  23:	68 dc 08 00 00       	push   $0x8dc
  28:	6a 01                	push   $0x1
  2a:	e8 ed 05 00 00       	call   61c <printf>
  2f:	83 c4 0c             	add    $0xc,%esp
  32:	68 e4 08 00 00       	push   $0x8e4
  37:	68 00 09 00 00       	push   $0x900
  3c:	6a 01                	push   $0x1
  3e:	e8 d9 05 00 00       	call   61c <printf>
  43:	83 c4 08             	add    $0x8,%esp
  46:	68 14 09 00 00       	push   $0x914
  4b:	6a 01                	push   $0x1
  4d:	e8 ca 05 00 00       	call   61c <printf>
  52:	83 c4 04             	add    $0x4,%esp
  55:	ff 35 70 0d 00 00    	push   0xd70
  5b:	e8 97 04 00 00       	call   4f7 <kill>
  60:	e8 62 04 00 00       	call   4c7 <exit>
   xchg(&newfd, open("tmp2", O_WRONLY|O_CREATE));
  65:	83 ec 08             	sub    $0x8,%esp
  68:	68 01 02 00 00       	push   $0x201
  6d:	68 21 09 00 00       	push   $0x921
  72:	e8 90 04 00 00       	call   507 <open>
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
  77:	f0 87 05 6c 0d 00 00 	lock xchg %eax,0xd6c
   exit();
  7e:	e8 44 04 00 00       	call   4c7 <exit>

00000083 <main>:
{
  83:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  87:	83 e4 f0             	and    $0xfffffff0,%esp
  8a:	ff 71 fc             	push   -0x4(%ecx)
  8d:	55                   	push   %ebp
  8e:	89 e5                	mov    %esp,%ebp
  90:	56                   	push   %esi
  91:	53                   	push   %ebx
  92:	51                   	push   %ecx
  93:	83 ec 1c             	sub    $0x1c,%esp
   ppid = getpid();
  96:	e8 ac 04 00 00       	call   547 <getpid>
  9b:	a3 70 0d 00 00       	mov    %eax,0xd70
   void *stack, *p = malloc(PGSIZE * 2);
  a0:	83 ec 0c             	sub    $0xc,%esp
  a3:	68 00 20 00 00       	push   $0x2000
  a8:	e8 95 07 00 00       	call   842 <malloc>
   assert(p != NULL);
  ad:	83 c4 10             	add    $0x10,%esp
  b0:	85 c0                	test   %eax,%eax
  b2:	74 7d                	je     131 <main+0xae>
  b4:	89 c3                	mov    %eax,%ebx
   if((uint)p % PGSIZE)
  b6:	25 ff 0f 00 00       	and    $0xfff,%eax
  bb:	0f 84 b9 00 00 00    	je     17a <main+0xf7>
     stack = p + (PGSIZE - (uint)p % PGSIZE);
  c1:	be 00 10 00 00       	mov    $0x1000,%esi
  c6:	29 c6                	sub    %eax,%esi
  c8:	01 de                	add    %ebx,%esi
   int fd = open("tmp", O_WRONLY|O_CREATE);
  ca:	83 ec 08             	sub    $0x8,%esp
  cd:	68 01 02 00 00       	push   $0x201
  d2:	68 30 09 00 00       	push   $0x930
  d7:	e8 2b 04 00 00       	call   507 <open>
   assert(fd == 3);
  dc:	83 c4 10             	add    $0x10,%esp
  df:	83 f8 03             	cmp    $0x3,%eax
  e2:	0f 84 99 00 00 00    	je     181 <main+0xfe>
  e8:	6a 24                	push   $0x24
  ea:	68 d3 08 00 00       	push   $0x8d3
  ef:	68 dc 08 00 00       	push   $0x8dc
  f4:	6a 01                	push   $0x1
  f6:	e8 21 05 00 00       	call   61c <printf>
  fb:	83 c4 0c             	add    $0xc,%esp
  fe:	68 34 09 00 00       	push   $0x934
 103:	68 00 09 00 00       	push   $0x900
 108:	6a 01                	push   $0x1
 10a:	e8 0d 05 00 00       	call   61c <printf>
 10f:	83 c4 08             	add    $0x8,%esp
 112:	68 14 09 00 00       	push   $0x914
 117:	6a 01                	push   $0x1
 119:	e8 fe 04 00 00       	call   61c <printf>
 11e:	83 c4 04             	add    $0x4,%esp
 121:	ff 35 70 0d 00 00    	push   0xd70
 127:	e8 cb 03 00 00       	call   4f7 <kill>
 12c:	e8 96 03 00 00       	call   4c7 <exit>
   assert(p != NULL);
 131:	6a 1d                	push   $0x1d
 133:	68 d3 08 00 00       	push   $0x8d3
 138:	68 dc 08 00 00       	push   $0x8dc
 13d:	6a 01                	push   $0x1
 13f:	e8 d8 04 00 00       	call   61c <printf>
 144:	83 c4 0c             	add    $0xc,%esp
 147:	68 26 09 00 00       	push   $0x926
 14c:	68 00 09 00 00       	push   $0x900
 151:	6a 01                	push   $0x1
 153:	e8 c4 04 00 00       	call   61c <printf>
 158:	83 c4 08             	add    $0x8,%esp
 15b:	68 14 09 00 00       	push   $0x914
 160:	6a 01                	push   $0x1
 162:	e8 b5 04 00 00       	call   61c <printf>
 167:	83 c4 04             	add    $0x4,%esp
 16a:	ff 35 70 0d 00 00    	push   0xd70
 170:	e8 82 03 00 00       	call   4f7 <kill>
 175:	e8 4d 03 00 00       	call   4c7 <exit>
     stack = p;
 17a:	89 de                	mov    %ebx,%esi
 17c:	e9 49 ff ff ff       	jmp    ca <main+0x47>
   int clone_pid = clone(worker, 0, 0, stack);
 181:	56                   	push   %esi
 182:	6a 00                	push   $0x0
 184:	6a 00                	push   $0x0
 186:	68 00 00 00 00       	push   $0x0
 18b:	e8 d7 03 00 00       	call   567 <clone>
 190:	89 c6                	mov    %eax,%esi
   assert(clone_pid > 0);
 192:	83 c4 10             	add    $0x10,%esp
 195:	85 c0                	test   %eax,%eax
 197:	7e 73                	jle    20c <main+0x189>
   while(!newfd);
 199:	a1 6c 0d 00 00       	mov    0xd6c,%eax
 19e:	85 c0                	test   %eax,%eax
 1a0:	74 f7                	je     199 <main+0x116>
   assert(write(newfd, "goodbye\n", 8) == -1);
 1a2:	a1 6c 0d 00 00       	mov    0xd6c,%eax
 1a7:	83 ec 04             	sub    $0x4,%esp
 1aa:	6a 08                	push   $0x8
 1ac:	68 4a 09 00 00       	push   $0x94a
 1b1:	50                   	push   %eax
 1b2:	e8 30 03 00 00       	call   4e7 <write>
 1b7:	83 c4 10             	add    $0x10,%esp
 1ba:	83 f8 ff             	cmp    $0xffffffff,%eax
 1bd:	0f 84 92 00 00 00    	je     255 <main+0x1d2>
 1c3:	6a 28                	push   $0x28
 1c5:	68 d3 08 00 00       	push   $0x8d3
 1ca:	68 dc 08 00 00       	push   $0x8dc
 1cf:	6a 01                	push   $0x1
 1d1:	e8 46 04 00 00       	call   61c <printf>
 1d6:	83 c4 0c             	add    $0xc,%esp
 1d9:	68 78 09 00 00       	push   $0x978
 1de:	68 00 09 00 00       	push   $0x900
 1e3:	6a 01                	push   $0x1
 1e5:	e8 32 04 00 00       	call   61c <printf>
 1ea:	83 c4 08             	add    $0x8,%esp
 1ed:	68 14 09 00 00       	push   $0x914
 1f2:	6a 01                	push   $0x1
 1f4:	e8 23 04 00 00       	call   61c <printf>
 1f9:	83 c4 04             	add    $0x4,%esp
 1fc:	ff 35 70 0d 00 00    	push   0xd70
 202:	e8 f0 02 00 00       	call   4f7 <kill>
 207:	e8 bb 02 00 00       	call   4c7 <exit>
   assert(clone_pid > 0);
 20c:	6a 26                	push   $0x26
 20e:	68 d3 08 00 00       	push   $0x8d3
 213:	68 dc 08 00 00       	push   $0x8dc
 218:	6a 01                	push   $0x1
 21a:	e8 fd 03 00 00       	call   61c <printf>
 21f:	83 c4 0c             	add    $0xc,%esp
 222:	68 3c 09 00 00       	push   $0x93c
 227:	68 00 09 00 00       	push   $0x900
 22c:	6a 01                	push   $0x1
 22e:	e8 e9 03 00 00       	call   61c <printf>
 233:	83 c4 08             	add    $0x8,%esp
 236:	68 14 09 00 00       	push   $0x914
 23b:	6a 01                	push   $0x1
 23d:	e8 da 03 00 00       	call   61c <printf>
 242:	83 c4 04             	add    $0x4,%esp
 245:	ff 35 70 0d 00 00    	push   0xd70
 24b:	e8 a7 02 00 00       	call   4f7 <kill>
 250:	e8 72 02 00 00       	call   4c7 <exit>
   printf(1, "TEST PASSED\n");
 255:	83 ec 08             	sub    $0x8,%esp
 258:	68 53 09 00 00       	push   $0x953
 25d:	6a 01                	push   $0x1
 25f:	e8 b8 03 00 00       	call   61c <printf>
   int join_pid = join(&join_stack);
 264:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 267:	89 04 24             	mov    %eax,(%esp)
 26a:	e8 00 03 00 00       	call   56f <join>
   assert(join_pid == clone_pid);
 26f:	83 c4 10             	add    $0x10,%esp
 272:	39 c6                	cmp    %eax,%esi
 274:	74 49                	je     2bf <main+0x23c>
 276:	6a 2d                	push   $0x2d
 278:	68 d3 08 00 00       	push   $0x8d3
 27d:	68 dc 08 00 00       	push   $0x8dc
 282:	6a 01                	push   $0x1
 284:	e8 93 03 00 00       	call   61c <printf>
 289:	83 c4 0c             	add    $0xc,%esp
 28c:	68 60 09 00 00       	push   $0x960
 291:	68 00 09 00 00       	push   $0x900
 296:	6a 01                	push   $0x1
 298:	e8 7f 03 00 00       	call   61c <printf>
 29d:	83 c4 08             	add    $0x8,%esp
 2a0:	68 14 09 00 00       	push   $0x914
 2a5:	6a 01                	push   $0x1
 2a7:	e8 70 03 00 00       	call   61c <printf>
 2ac:	83 c4 04             	add    $0x4,%esp
 2af:	ff 35 70 0d 00 00    	push   0xd70
 2b5:	e8 3d 02 00 00       	call   4f7 <kill>
 2ba:	e8 08 02 00 00       	call   4c7 <exit>
   free(p);
 2bf:	83 ec 0c             	sub    $0xc,%esp
 2c2:	53                   	push   %ebx
 2c3:	e8 ba 04 00 00       	call   782 <free>
   exit();
 2c8:	e8 fa 01 00 00       	call   4c7 <exit>

000002cd <test_and_set>:
#include "fcntl.h"
#include "user.h"
#include "x86.h"
#include "mmu.h"

int test_and_set(int *old_ptr, int new_ptr) {
 2cd:	55                   	push   %ebp
 2ce:	89 e5                	mov    %esp,%ebp
 2d0:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *old_ptr;
 2d3:	8b 10                	mov    (%eax),%edx
  *old_ptr = new_ptr;
 2d5:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 2d8:	89 08                	mov    %ecx,(%eax)
  return old;
}
 2da:	89 d0                	mov    %edx,%eax
 2dc:	5d                   	pop    %ebp
 2dd:	c3                   	ret    

000002de <thread_create>:

  // I can't remember if there was something else to do here but I'm sure I'll find out


  return new_pid;
}
 2de:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2e3:	c3                   	ret    

000002e4 <thread_join>:

int thread_join() {
  return 0;
}
 2e4:	b8 00 00 00 00       	mov    $0x0,%eax
 2e9:	c3                   	ret    

000002ea <lock_acquire>:

void lock_acquire(lock_t *lock){
 2ea:	55                   	push   %ebp
 2eb:	89 e5                	mov    %esp,%ebp
 2ed:	53                   	push   %ebx
 2ee:	83 ec 04             	sub    $0x4,%esp
 2f1:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 2f4:	83 ec 08             	sub    $0x8,%esp
 2f7:	6a 01                	push   $0x1
 2f9:	53                   	push   %ebx
 2fa:	e8 ce ff ff ff       	call   2cd <test_and_set>
 2ff:	83 c4 10             	add    $0x10,%esp
 302:	83 f8 01             	cmp    $0x1,%eax
 305:	74 ed                	je     2f4 <lock_acquire+0xa>
    ;
}
 307:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 30a:	c9                   	leave  
 30b:	c3                   	ret    

0000030c <lock_release>:

void lock_release(lock_t *lock) {
 30c:	55                   	push   %ebp
 30d:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 30f:	8b 45 08             	mov    0x8(%ebp),%eax
 312:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 318:	5d                   	pop    %ebp
 319:	c3                   	ret    

0000031a <lock_init>:

void lock_init(lock_t *lock) {
 31a:	55                   	push   %ebp
 31b:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 31d:	8b 45 08             	mov    0x8(%ebp),%eax
 320:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 326:	5d                   	pop    %ebp
 327:	c3                   	ret    

00000328 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 328:	55                   	push   %ebp
 329:	89 e5                	mov    %esp,%ebp
 32b:	56                   	push   %esi
 32c:	53                   	push   %ebx
 32d:	8b 75 08             	mov    0x8(%ebp),%esi
 330:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 333:	89 f0                	mov    %esi,%eax
 335:	89 d1                	mov    %edx,%ecx
 337:	83 c2 01             	add    $0x1,%edx
 33a:	89 c3                	mov    %eax,%ebx
 33c:	83 c0 01             	add    $0x1,%eax
 33f:	0f b6 09             	movzbl (%ecx),%ecx
 342:	88 0b                	mov    %cl,(%ebx)
 344:	84 c9                	test   %cl,%cl
 346:	75 ed                	jne    335 <strcpy+0xd>
    ;
  return os;
}
 348:	89 f0                	mov    %esi,%eax
 34a:	5b                   	pop    %ebx
 34b:	5e                   	pop    %esi
 34c:	5d                   	pop    %ebp
 34d:	c3                   	ret    

0000034e <strcmp>:

int
strcmp(const char *p, const char *q)
{
 34e:	55                   	push   %ebp
 34f:	89 e5                	mov    %esp,%ebp
 351:	8b 4d 08             	mov    0x8(%ebp),%ecx
 354:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 357:	eb 06                	jmp    35f <strcmp+0x11>
    p++, q++;
 359:	83 c1 01             	add    $0x1,%ecx
 35c:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 35f:	0f b6 01             	movzbl (%ecx),%eax
 362:	84 c0                	test   %al,%al
 364:	74 04                	je     36a <strcmp+0x1c>
 366:	3a 02                	cmp    (%edx),%al
 368:	74 ef                	je     359 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 36a:	0f b6 c0             	movzbl %al,%eax
 36d:	0f b6 12             	movzbl (%edx),%edx
 370:	29 d0                	sub    %edx,%eax
}
 372:	5d                   	pop    %ebp
 373:	c3                   	ret    

00000374 <strlen>:

uint
strlen(const char *s)
{
 374:	55                   	push   %ebp
 375:	89 e5                	mov    %esp,%ebp
 377:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 37a:	b8 00 00 00 00       	mov    $0x0,%eax
 37f:	eb 03                	jmp    384 <strlen+0x10>
 381:	83 c0 01             	add    $0x1,%eax
 384:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 388:	75 f7                	jne    381 <strlen+0xd>
    ;
  return n;
}
 38a:	5d                   	pop    %ebp
 38b:	c3                   	ret    

0000038c <memset>:

void*
memset(void *dst, int c, uint n)
{
 38c:	55                   	push   %ebp
 38d:	89 e5                	mov    %esp,%ebp
 38f:	57                   	push   %edi
 390:	8b 55 08             	mov    0x8(%ebp),%edx
  asm volatile("cld; rep stosb" :
 393:	89 d7                	mov    %edx,%edi
 395:	8b 4d 10             	mov    0x10(%ebp),%ecx
 398:	8b 45 0c             	mov    0xc(%ebp),%eax
 39b:	fc                   	cld    
 39c:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 39e:	89 d0                	mov    %edx,%eax
 3a0:	8b 7d fc             	mov    -0x4(%ebp),%edi
 3a3:	c9                   	leave  
 3a4:	c3                   	ret    

000003a5 <strchr>:

char*
strchr(const char *s, char c)
{
 3a5:	55                   	push   %ebp
 3a6:	89 e5                	mov    %esp,%ebp
 3a8:	8b 45 08             	mov    0x8(%ebp),%eax
 3ab:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 3af:	eb 03                	jmp    3b4 <strchr+0xf>
 3b1:	83 c0 01             	add    $0x1,%eax
 3b4:	0f b6 10             	movzbl (%eax),%edx
 3b7:	84 d2                	test   %dl,%dl
 3b9:	74 06                	je     3c1 <strchr+0x1c>
    if(*s == c)
 3bb:	38 ca                	cmp    %cl,%dl
 3bd:	75 f2                	jne    3b1 <strchr+0xc>
 3bf:	eb 05                	jmp    3c6 <strchr+0x21>
      return (char*)s;
  return 0;
 3c1:	b8 00 00 00 00       	mov    $0x0,%eax
}
 3c6:	5d                   	pop    %ebp
 3c7:	c3                   	ret    

000003c8 <gets>:

char*
gets(char *buf, int max)
{
 3c8:	55                   	push   %ebp
 3c9:	89 e5                	mov    %esp,%ebp
 3cb:	57                   	push   %edi
 3cc:	56                   	push   %esi
 3cd:	53                   	push   %ebx
 3ce:	83 ec 1c             	sub    $0x1c,%esp
 3d1:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 3d4:	bb 00 00 00 00       	mov    $0x0,%ebx
 3d9:	89 de                	mov    %ebx,%esi
 3db:	83 c3 01             	add    $0x1,%ebx
 3de:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 3e1:	7d 2e                	jge    411 <gets+0x49>
    cc = read(0, &c, 1);
 3e3:	83 ec 04             	sub    $0x4,%esp
 3e6:	6a 01                	push   $0x1
 3e8:	8d 45 e7             	lea    -0x19(%ebp),%eax
 3eb:	50                   	push   %eax
 3ec:	6a 00                	push   $0x0
 3ee:	e8 ec 00 00 00       	call   4df <read>
    if(cc < 1)
 3f3:	83 c4 10             	add    $0x10,%esp
 3f6:	85 c0                	test   %eax,%eax
 3f8:	7e 17                	jle    411 <gets+0x49>
      break;
    buf[i++] = c;
 3fa:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 3fe:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 401:	3c 0a                	cmp    $0xa,%al
 403:	0f 94 c2             	sete   %dl
 406:	3c 0d                	cmp    $0xd,%al
 408:	0f 94 c0             	sete   %al
 40b:	08 c2                	or     %al,%dl
 40d:	74 ca                	je     3d9 <gets+0x11>
    buf[i++] = c;
 40f:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 411:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 415:	89 f8                	mov    %edi,%eax
 417:	8d 65 f4             	lea    -0xc(%ebp),%esp
 41a:	5b                   	pop    %ebx
 41b:	5e                   	pop    %esi
 41c:	5f                   	pop    %edi
 41d:	5d                   	pop    %ebp
 41e:	c3                   	ret    

0000041f <stat>:

int
stat(const char *n, struct stat *st)
{
 41f:	55                   	push   %ebp
 420:	89 e5                	mov    %esp,%ebp
 422:	56                   	push   %esi
 423:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 424:	83 ec 08             	sub    $0x8,%esp
 427:	6a 00                	push   $0x0
 429:	ff 75 08             	push   0x8(%ebp)
 42c:	e8 d6 00 00 00       	call   507 <open>
  if(fd < 0)
 431:	83 c4 10             	add    $0x10,%esp
 434:	85 c0                	test   %eax,%eax
 436:	78 24                	js     45c <stat+0x3d>
 438:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 43a:	83 ec 08             	sub    $0x8,%esp
 43d:	ff 75 0c             	push   0xc(%ebp)
 440:	50                   	push   %eax
 441:	e8 d9 00 00 00       	call   51f <fstat>
 446:	89 c6                	mov    %eax,%esi
  close(fd);
 448:	89 1c 24             	mov    %ebx,(%esp)
 44b:	e8 9f 00 00 00       	call   4ef <close>
  return r;
 450:	83 c4 10             	add    $0x10,%esp
}
 453:	89 f0                	mov    %esi,%eax
 455:	8d 65 f8             	lea    -0x8(%ebp),%esp
 458:	5b                   	pop    %ebx
 459:	5e                   	pop    %esi
 45a:	5d                   	pop    %ebp
 45b:	c3                   	ret    
    return -1;
 45c:	be ff ff ff ff       	mov    $0xffffffff,%esi
 461:	eb f0                	jmp    453 <stat+0x34>

00000463 <atoi>:

int
atoi(const char *s)
{
 463:	55                   	push   %ebp
 464:	89 e5                	mov    %esp,%ebp
 466:	53                   	push   %ebx
 467:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 46a:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 46f:	eb 10                	jmp    481 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 471:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 474:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 477:	83 c1 01             	add    $0x1,%ecx
 47a:	0f be c0             	movsbl %al,%eax
 47d:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 481:	0f b6 01             	movzbl (%ecx),%eax
 484:	8d 58 d0             	lea    -0x30(%eax),%ebx
 487:	80 fb 09             	cmp    $0x9,%bl
 48a:	76 e5                	jbe    471 <atoi+0xe>
  return n;
}
 48c:	89 d0                	mov    %edx,%eax
 48e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 491:	c9                   	leave  
 492:	c3                   	ret    

00000493 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 493:	55                   	push   %ebp
 494:	89 e5                	mov    %esp,%ebp
 496:	56                   	push   %esi
 497:	53                   	push   %ebx
 498:	8b 75 08             	mov    0x8(%ebp),%esi
 49b:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 49e:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 4a1:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 4a3:	eb 0d                	jmp    4b2 <memmove+0x1f>
    *dst++ = *src++;
 4a5:	0f b6 01             	movzbl (%ecx),%eax
 4a8:	88 02                	mov    %al,(%edx)
 4aa:	8d 49 01             	lea    0x1(%ecx),%ecx
 4ad:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 4b0:	89 d8                	mov    %ebx,%eax
 4b2:	8d 58 ff             	lea    -0x1(%eax),%ebx
 4b5:	85 c0                	test   %eax,%eax
 4b7:	7f ec                	jg     4a5 <memmove+0x12>
  return vdst;
}
 4b9:	89 f0                	mov    %esi,%eax
 4bb:	5b                   	pop    %ebx
 4bc:	5e                   	pop    %esi
 4bd:	5d                   	pop    %ebp
 4be:	c3                   	ret    

000004bf <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4bf:	b8 01 00 00 00       	mov    $0x1,%eax
 4c4:	cd 40                	int    $0x40
 4c6:	c3                   	ret    

000004c7 <exit>:
SYSCALL(exit)
 4c7:	b8 02 00 00 00       	mov    $0x2,%eax
 4cc:	cd 40                	int    $0x40
 4ce:	c3                   	ret    

000004cf <wait>:
SYSCALL(wait)
 4cf:	b8 03 00 00 00       	mov    $0x3,%eax
 4d4:	cd 40                	int    $0x40
 4d6:	c3                   	ret    

000004d7 <pipe>:
SYSCALL(pipe)
 4d7:	b8 04 00 00 00       	mov    $0x4,%eax
 4dc:	cd 40                	int    $0x40
 4de:	c3                   	ret    

000004df <read>:
SYSCALL(read)
 4df:	b8 05 00 00 00       	mov    $0x5,%eax
 4e4:	cd 40                	int    $0x40
 4e6:	c3                   	ret    

000004e7 <write>:
SYSCALL(write)
 4e7:	b8 10 00 00 00       	mov    $0x10,%eax
 4ec:	cd 40                	int    $0x40
 4ee:	c3                   	ret    

000004ef <close>:
SYSCALL(close)
 4ef:	b8 15 00 00 00       	mov    $0x15,%eax
 4f4:	cd 40                	int    $0x40
 4f6:	c3                   	ret    

000004f7 <kill>:
SYSCALL(kill)
 4f7:	b8 06 00 00 00       	mov    $0x6,%eax
 4fc:	cd 40                	int    $0x40
 4fe:	c3                   	ret    

000004ff <exec>:
SYSCALL(exec)
 4ff:	b8 07 00 00 00       	mov    $0x7,%eax
 504:	cd 40                	int    $0x40
 506:	c3                   	ret    

00000507 <open>:
SYSCALL(open)
 507:	b8 0f 00 00 00       	mov    $0xf,%eax
 50c:	cd 40                	int    $0x40
 50e:	c3                   	ret    

0000050f <mknod>:
SYSCALL(mknod)
 50f:	b8 11 00 00 00       	mov    $0x11,%eax
 514:	cd 40                	int    $0x40
 516:	c3                   	ret    

00000517 <unlink>:
SYSCALL(unlink)
 517:	b8 12 00 00 00       	mov    $0x12,%eax
 51c:	cd 40                	int    $0x40
 51e:	c3                   	ret    

0000051f <fstat>:
SYSCALL(fstat)
 51f:	b8 08 00 00 00       	mov    $0x8,%eax
 524:	cd 40                	int    $0x40
 526:	c3                   	ret    

00000527 <link>:
SYSCALL(link)
 527:	b8 13 00 00 00       	mov    $0x13,%eax
 52c:	cd 40                	int    $0x40
 52e:	c3                   	ret    

0000052f <mkdir>:
SYSCALL(mkdir)
 52f:	b8 14 00 00 00       	mov    $0x14,%eax
 534:	cd 40                	int    $0x40
 536:	c3                   	ret    

00000537 <chdir>:
SYSCALL(chdir)
 537:	b8 09 00 00 00       	mov    $0x9,%eax
 53c:	cd 40                	int    $0x40
 53e:	c3                   	ret    

0000053f <dup>:
SYSCALL(dup)
 53f:	b8 0a 00 00 00       	mov    $0xa,%eax
 544:	cd 40                	int    $0x40
 546:	c3                   	ret    

00000547 <getpid>:
SYSCALL(getpid)
 547:	b8 0b 00 00 00       	mov    $0xb,%eax
 54c:	cd 40                	int    $0x40
 54e:	c3                   	ret    

0000054f <sbrk>:
SYSCALL(sbrk)
 54f:	b8 0c 00 00 00       	mov    $0xc,%eax
 554:	cd 40                	int    $0x40
 556:	c3                   	ret    

00000557 <sleep>:
SYSCALL(sleep)
 557:	b8 0d 00 00 00       	mov    $0xd,%eax
 55c:	cd 40                	int    $0x40
 55e:	c3                   	ret    

0000055f <uptime>:
SYSCALL(uptime)
 55f:	b8 0e 00 00 00       	mov    $0xe,%eax
 564:	cd 40                	int    $0x40
 566:	c3                   	ret    

00000567 <clone>:
SYSCALL(clone)
 567:	b8 16 00 00 00       	mov    $0x16,%eax
 56c:	cd 40                	int    $0x40
 56e:	c3                   	ret    

0000056f <join>:
 56f:	b8 17 00 00 00       	mov    $0x17,%eax
 574:	cd 40                	int    $0x40
 576:	c3                   	ret    

00000577 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 577:	55                   	push   %ebp
 578:	89 e5                	mov    %esp,%ebp
 57a:	83 ec 1c             	sub    $0x1c,%esp
 57d:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 580:	6a 01                	push   $0x1
 582:	8d 55 f4             	lea    -0xc(%ebp),%edx
 585:	52                   	push   %edx
 586:	50                   	push   %eax
 587:	e8 5b ff ff ff       	call   4e7 <write>
}
 58c:	83 c4 10             	add    $0x10,%esp
 58f:	c9                   	leave  
 590:	c3                   	ret    

00000591 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 591:	55                   	push   %ebp
 592:	89 e5                	mov    %esp,%ebp
 594:	57                   	push   %edi
 595:	56                   	push   %esi
 596:	53                   	push   %ebx
 597:	83 ec 2c             	sub    $0x2c,%esp
 59a:	89 45 d0             	mov    %eax,-0x30(%ebp)
 59d:	89 d0                	mov    %edx,%eax
 59f:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 5a1:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 5a5:	0f 95 c1             	setne  %cl
 5a8:	c1 ea 1f             	shr    $0x1f,%edx
 5ab:	84 d1                	test   %dl,%cl
 5ad:	74 44                	je     5f3 <printint+0x62>
    neg = 1;
    x = -xx;
 5af:	f7 d8                	neg    %eax
 5b1:	89 c1                	mov    %eax,%ecx
    neg = 1;
 5b3:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 5ba:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 5bf:	89 c8                	mov    %ecx,%eax
 5c1:	ba 00 00 00 00       	mov    $0x0,%edx
 5c6:	f7 f6                	div    %esi
 5c8:	89 df                	mov    %ebx,%edi
 5ca:	83 c3 01             	add    $0x1,%ebx
 5cd:	0f b6 92 fc 09 00 00 	movzbl 0x9fc(%edx),%edx
 5d4:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 5d8:	89 ca                	mov    %ecx,%edx
 5da:	89 c1                	mov    %eax,%ecx
 5dc:	39 d6                	cmp    %edx,%esi
 5de:	76 df                	jbe    5bf <printint+0x2e>
  if(neg)
 5e0:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 5e4:	74 31                	je     617 <printint+0x86>
    buf[i++] = '-';
 5e6:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 5eb:	8d 5f 02             	lea    0x2(%edi),%ebx
 5ee:	8b 75 d0             	mov    -0x30(%ebp),%esi
 5f1:	eb 17                	jmp    60a <printint+0x79>
    x = xx;
 5f3:	89 c1                	mov    %eax,%ecx
  neg = 0;
 5f5:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 5fc:	eb bc                	jmp    5ba <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 5fe:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 603:	89 f0                	mov    %esi,%eax
 605:	e8 6d ff ff ff       	call   577 <putc>
  while(--i >= 0)
 60a:	83 eb 01             	sub    $0x1,%ebx
 60d:	79 ef                	jns    5fe <printint+0x6d>
}
 60f:	83 c4 2c             	add    $0x2c,%esp
 612:	5b                   	pop    %ebx
 613:	5e                   	pop    %esi
 614:	5f                   	pop    %edi
 615:	5d                   	pop    %ebp
 616:	c3                   	ret    
 617:	8b 75 d0             	mov    -0x30(%ebp),%esi
 61a:	eb ee                	jmp    60a <printint+0x79>

0000061c <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 61c:	55                   	push   %ebp
 61d:	89 e5                	mov    %esp,%ebp
 61f:	57                   	push   %edi
 620:	56                   	push   %esi
 621:	53                   	push   %ebx
 622:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 625:	8d 45 10             	lea    0x10(%ebp),%eax
 628:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 62b:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 630:	bb 00 00 00 00       	mov    $0x0,%ebx
 635:	eb 14                	jmp    64b <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 637:	89 fa                	mov    %edi,%edx
 639:	8b 45 08             	mov    0x8(%ebp),%eax
 63c:	e8 36 ff ff ff       	call   577 <putc>
 641:	eb 05                	jmp    648 <printf+0x2c>
      }
    } else if(state == '%'){
 643:	83 fe 25             	cmp    $0x25,%esi
 646:	74 25                	je     66d <printf+0x51>
  for(i = 0; fmt[i]; i++){
 648:	83 c3 01             	add    $0x1,%ebx
 64b:	8b 45 0c             	mov    0xc(%ebp),%eax
 64e:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 652:	84 c0                	test   %al,%al
 654:	0f 84 20 01 00 00    	je     77a <printf+0x15e>
    c = fmt[i] & 0xff;
 65a:	0f be f8             	movsbl %al,%edi
 65d:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 660:	85 f6                	test   %esi,%esi
 662:	75 df                	jne    643 <printf+0x27>
      if(c == '%'){
 664:	83 f8 25             	cmp    $0x25,%eax
 667:	75 ce                	jne    637 <printf+0x1b>
        state = '%';
 669:	89 c6                	mov    %eax,%esi
 66b:	eb db                	jmp    648 <printf+0x2c>
      if(c == 'd'){
 66d:	83 f8 25             	cmp    $0x25,%eax
 670:	0f 84 cf 00 00 00    	je     745 <printf+0x129>
 676:	0f 8c dd 00 00 00    	jl     759 <printf+0x13d>
 67c:	83 f8 78             	cmp    $0x78,%eax
 67f:	0f 8f d4 00 00 00    	jg     759 <printf+0x13d>
 685:	83 f8 63             	cmp    $0x63,%eax
 688:	0f 8c cb 00 00 00    	jl     759 <printf+0x13d>
 68e:	83 e8 63             	sub    $0x63,%eax
 691:	83 f8 15             	cmp    $0x15,%eax
 694:	0f 87 bf 00 00 00    	ja     759 <printf+0x13d>
 69a:	ff 24 85 a4 09 00 00 	jmp    *0x9a4(,%eax,4)
        printint(fd, *ap, 10, 1);
 6a1:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6a4:	8b 17                	mov    (%edi),%edx
 6a6:	83 ec 0c             	sub    $0xc,%esp
 6a9:	6a 01                	push   $0x1
 6ab:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6b0:	8b 45 08             	mov    0x8(%ebp),%eax
 6b3:	e8 d9 fe ff ff       	call   591 <printint>
        ap++;
 6b8:	83 c7 04             	add    $0x4,%edi
 6bb:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 6be:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 6c1:	be 00 00 00 00       	mov    $0x0,%esi
 6c6:	eb 80                	jmp    648 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 6c8:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6cb:	8b 17                	mov    (%edi),%edx
 6cd:	83 ec 0c             	sub    $0xc,%esp
 6d0:	6a 00                	push   $0x0
 6d2:	b9 10 00 00 00       	mov    $0x10,%ecx
 6d7:	8b 45 08             	mov    0x8(%ebp),%eax
 6da:	e8 b2 fe ff ff       	call   591 <printint>
        ap++;
 6df:	83 c7 04             	add    $0x4,%edi
 6e2:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 6e5:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6e8:	be 00 00 00 00       	mov    $0x0,%esi
 6ed:	e9 56 ff ff ff       	jmp    648 <printf+0x2c>
        s = (char*)*ap;
 6f2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6f5:	8b 30                	mov    (%eax),%esi
        ap++;
 6f7:	83 c0 04             	add    $0x4,%eax
 6fa:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 6fd:	85 f6                	test   %esi,%esi
 6ff:	75 15                	jne    716 <printf+0xfa>
          s = "(null)";
 701:	be 9b 09 00 00       	mov    $0x99b,%esi
 706:	eb 0e                	jmp    716 <printf+0xfa>
          putc(fd, *s);
 708:	0f be d2             	movsbl %dl,%edx
 70b:	8b 45 08             	mov    0x8(%ebp),%eax
 70e:	e8 64 fe ff ff       	call   577 <putc>
          s++;
 713:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 716:	0f b6 16             	movzbl (%esi),%edx
 719:	84 d2                	test   %dl,%dl
 71b:	75 eb                	jne    708 <printf+0xec>
      state = 0;
 71d:	be 00 00 00 00       	mov    $0x0,%esi
 722:	e9 21 ff ff ff       	jmp    648 <printf+0x2c>
        putc(fd, *ap);
 727:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 72a:	0f be 17             	movsbl (%edi),%edx
 72d:	8b 45 08             	mov    0x8(%ebp),%eax
 730:	e8 42 fe ff ff       	call   577 <putc>
        ap++;
 735:	83 c7 04             	add    $0x4,%edi
 738:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 73b:	be 00 00 00 00       	mov    $0x0,%esi
 740:	e9 03 ff ff ff       	jmp    648 <printf+0x2c>
        putc(fd, c);
 745:	89 fa                	mov    %edi,%edx
 747:	8b 45 08             	mov    0x8(%ebp),%eax
 74a:	e8 28 fe ff ff       	call   577 <putc>
      state = 0;
 74f:	be 00 00 00 00       	mov    $0x0,%esi
 754:	e9 ef fe ff ff       	jmp    648 <printf+0x2c>
        putc(fd, '%');
 759:	ba 25 00 00 00       	mov    $0x25,%edx
 75e:	8b 45 08             	mov    0x8(%ebp),%eax
 761:	e8 11 fe ff ff       	call   577 <putc>
        putc(fd, c);
 766:	89 fa                	mov    %edi,%edx
 768:	8b 45 08             	mov    0x8(%ebp),%eax
 76b:	e8 07 fe ff ff       	call   577 <putc>
      state = 0;
 770:	be 00 00 00 00       	mov    $0x0,%esi
 775:	e9 ce fe ff ff       	jmp    648 <printf+0x2c>
    }
  }
}
 77a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 77d:	5b                   	pop    %ebx
 77e:	5e                   	pop    %esi
 77f:	5f                   	pop    %edi
 780:	5d                   	pop    %ebp
 781:	c3                   	ret    

00000782 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 782:	55                   	push   %ebp
 783:	89 e5                	mov    %esp,%ebp
 785:	57                   	push   %edi
 786:	56                   	push   %esi
 787:	53                   	push   %ebx
 788:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 78b:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 78e:	a1 74 0d 00 00       	mov    0xd74,%eax
 793:	eb 02                	jmp    797 <free+0x15>
 795:	89 d0                	mov    %edx,%eax
 797:	39 c8                	cmp    %ecx,%eax
 799:	73 04                	jae    79f <free+0x1d>
 79b:	39 08                	cmp    %ecx,(%eax)
 79d:	77 12                	ja     7b1 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 79f:	8b 10                	mov    (%eax),%edx
 7a1:	39 c2                	cmp    %eax,%edx
 7a3:	77 f0                	ja     795 <free+0x13>
 7a5:	39 c8                	cmp    %ecx,%eax
 7a7:	72 08                	jb     7b1 <free+0x2f>
 7a9:	39 ca                	cmp    %ecx,%edx
 7ab:	77 04                	ja     7b1 <free+0x2f>
 7ad:	89 d0                	mov    %edx,%eax
 7af:	eb e6                	jmp    797 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7b1:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7b4:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7b7:	8b 10                	mov    (%eax),%edx
 7b9:	39 d7                	cmp    %edx,%edi
 7bb:	74 19                	je     7d6 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 7bd:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7c0:	8b 50 04             	mov    0x4(%eax),%edx
 7c3:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7c6:	39 ce                	cmp    %ecx,%esi
 7c8:	74 1b                	je     7e5 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 7ca:	89 08                	mov    %ecx,(%eax)
  freep = p;
 7cc:	a3 74 0d 00 00       	mov    %eax,0xd74
}
 7d1:	5b                   	pop    %ebx
 7d2:	5e                   	pop    %esi
 7d3:	5f                   	pop    %edi
 7d4:	5d                   	pop    %ebp
 7d5:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 7d6:	03 72 04             	add    0x4(%edx),%esi
 7d9:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7dc:	8b 10                	mov    (%eax),%edx
 7de:	8b 12                	mov    (%edx),%edx
 7e0:	89 53 f8             	mov    %edx,-0x8(%ebx)
 7e3:	eb db                	jmp    7c0 <free+0x3e>
    p->s.size += bp->s.size;
 7e5:	03 53 fc             	add    -0x4(%ebx),%edx
 7e8:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7eb:	8b 53 f8             	mov    -0x8(%ebx),%edx
 7ee:	89 10                	mov    %edx,(%eax)
 7f0:	eb da                	jmp    7cc <free+0x4a>

000007f2 <morecore>:

static Header*
morecore(uint nu)
{
 7f2:	55                   	push   %ebp
 7f3:	89 e5                	mov    %esp,%ebp
 7f5:	53                   	push   %ebx
 7f6:	83 ec 04             	sub    $0x4,%esp
 7f9:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 7fb:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 800:	77 05                	ja     807 <morecore+0x15>
    nu = 4096;
 802:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 807:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 80e:	83 ec 0c             	sub    $0xc,%esp
 811:	50                   	push   %eax
 812:	e8 38 fd ff ff       	call   54f <sbrk>
  if(p == (char*)-1)
 817:	83 c4 10             	add    $0x10,%esp
 81a:	83 f8 ff             	cmp    $0xffffffff,%eax
 81d:	74 1c                	je     83b <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 81f:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 822:	83 c0 08             	add    $0x8,%eax
 825:	83 ec 0c             	sub    $0xc,%esp
 828:	50                   	push   %eax
 829:	e8 54 ff ff ff       	call   782 <free>
  return freep;
 82e:	a1 74 0d 00 00       	mov    0xd74,%eax
 833:	83 c4 10             	add    $0x10,%esp
}
 836:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 839:	c9                   	leave  
 83a:	c3                   	ret    
    return 0;
 83b:	b8 00 00 00 00       	mov    $0x0,%eax
 840:	eb f4                	jmp    836 <morecore+0x44>

00000842 <malloc>:

void*
malloc(uint nbytes)
{
 842:	55                   	push   %ebp
 843:	89 e5                	mov    %esp,%ebp
 845:	53                   	push   %ebx
 846:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 849:	8b 45 08             	mov    0x8(%ebp),%eax
 84c:	8d 58 07             	lea    0x7(%eax),%ebx
 84f:	c1 eb 03             	shr    $0x3,%ebx
 852:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 855:	8b 0d 74 0d 00 00    	mov    0xd74,%ecx
 85b:	85 c9                	test   %ecx,%ecx
 85d:	74 04                	je     863 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 85f:	8b 01                	mov    (%ecx),%eax
 861:	eb 4a                	jmp    8ad <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 863:	c7 05 74 0d 00 00 78 	movl   $0xd78,0xd74
 86a:	0d 00 00 
 86d:	c7 05 78 0d 00 00 78 	movl   $0xd78,0xd78
 874:	0d 00 00 
    base.s.size = 0;
 877:	c7 05 7c 0d 00 00 00 	movl   $0x0,0xd7c
 87e:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 881:	b9 78 0d 00 00       	mov    $0xd78,%ecx
 886:	eb d7                	jmp    85f <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 888:	74 19                	je     8a3 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 88a:	29 da                	sub    %ebx,%edx
 88c:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 88f:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 892:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 895:	89 0d 74 0d 00 00    	mov    %ecx,0xd74
      return (void*)(p + 1);
 89b:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 89e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8a1:	c9                   	leave  
 8a2:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 8a3:	8b 10                	mov    (%eax),%edx
 8a5:	89 11                	mov    %edx,(%ecx)
 8a7:	eb ec                	jmp    895 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8a9:	89 c1                	mov    %eax,%ecx
 8ab:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 8ad:	8b 50 04             	mov    0x4(%eax),%edx
 8b0:	39 da                	cmp    %ebx,%edx
 8b2:	73 d4                	jae    888 <malloc+0x46>
    if(p == freep)
 8b4:	39 05 74 0d 00 00    	cmp    %eax,0xd74
 8ba:	75 ed                	jne    8a9 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 8bc:	89 d8                	mov    %ebx,%eax
 8be:	e8 2f ff ff ff       	call   7f2 <morecore>
 8c3:	85 c0                	test   %eax,%eax
 8c5:	75 e2                	jne    8a9 <malloc+0x67>
 8c7:	eb d5                	jmp    89e <malloc+0x5c>
