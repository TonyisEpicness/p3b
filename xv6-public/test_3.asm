
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
   8:	68 f8 08 00 00       	push   $0x8f8
   d:	6a 03                	push   $0x3
   f:	e8 ff 04 00 00       	call   513 <write>
  14:	83 c4 10             	add    $0x10,%esp
  17:	83 f8 06             	cmp    $0x6,%eax
  1a:	74 49                	je     65 <worker+0x65>
  1c:	6a 34                	push   $0x34
  1e:	68 ff 08 00 00       	push   $0x8ff
  23:	68 08 09 00 00       	push   $0x908
  28:	6a 01                	push   $0x1
  2a:	e8 19 06 00 00       	call   648 <printf>
  2f:	83 c4 0c             	add    $0xc,%esp
  32:	68 10 09 00 00       	push   $0x910
  37:	68 2c 09 00 00       	push   $0x92c
  3c:	6a 01                	push   $0x1
  3e:	e8 05 06 00 00       	call   648 <printf>
  43:	83 c4 08             	add    $0x8,%esp
  46:	68 40 09 00 00       	push   $0x940
  4b:	6a 01                	push   $0x1
  4d:	e8 f6 05 00 00       	call   648 <printf>
  52:	83 c4 04             	add    $0x4,%esp
  55:	ff 35 ac 0d 00 00    	push   0xdac
  5b:	e8 c3 04 00 00       	call   523 <kill>
  60:	e8 8e 04 00 00       	call   4f3 <exit>
   xchg(&newfd, open("tmp2", O_WRONLY|O_CREATE));
  65:	83 ec 08             	sub    $0x8,%esp
  68:	68 01 02 00 00       	push   $0x201
  6d:	68 4d 09 00 00       	push   $0x94d
  72:	e8 bc 04 00 00       	call   533 <open>
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
  77:	f0 87 05 a8 0d 00 00 	lock xchg %eax,0xda8
   exit();
  7e:	e8 70 04 00 00       	call   4f3 <exit>

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
  96:	e8 d8 04 00 00       	call   573 <getpid>
  9b:	a3 ac 0d 00 00       	mov    %eax,0xdac
   void *stack, *p = malloc(PGSIZE * 2);
  a0:	83 ec 0c             	sub    $0xc,%esp
  a3:	68 00 20 00 00       	push   $0x2000
  a8:	e8 c1 07 00 00       	call   86e <malloc>
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
  d2:	68 5c 09 00 00       	push   $0x95c
  d7:	e8 57 04 00 00       	call   533 <open>
   assert(fd == 3);
  dc:	83 c4 10             	add    $0x10,%esp
  df:	83 f8 03             	cmp    $0x3,%eax
  e2:	0f 84 99 00 00 00    	je     181 <main+0xfe>
  e8:	6a 24                	push   $0x24
  ea:	68 ff 08 00 00       	push   $0x8ff
  ef:	68 08 09 00 00       	push   $0x908
  f4:	6a 01                	push   $0x1
  f6:	e8 4d 05 00 00       	call   648 <printf>
  fb:	83 c4 0c             	add    $0xc,%esp
  fe:	68 60 09 00 00       	push   $0x960
 103:	68 2c 09 00 00       	push   $0x92c
 108:	6a 01                	push   $0x1
 10a:	e8 39 05 00 00       	call   648 <printf>
 10f:	83 c4 08             	add    $0x8,%esp
 112:	68 40 09 00 00       	push   $0x940
 117:	6a 01                	push   $0x1
 119:	e8 2a 05 00 00       	call   648 <printf>
 11e:	83 c4 04             	add    $0x4,%esp
 121:	ff 35 ac 0d 00 00    	push   0xdac
 127:	e8 f7 03 00 00       	call   523 <kill>
 12c:	e8 c2 03 00 00       	call   4f3 <exit>
   assert(p != NULL);
 131:	6a 1d                	push   $0x1d
 133:	68 ff 08 00 00       	push   $0x8ff
 138:	68 08 09 00 00       	push   $0x908
 13d:	6a 01                	push   $0x1
 13f:	e8 04 05 00 00       	call   648 <printf>
 144:	83 c4 0c             	add    $0xc,%esp
 147:	68 52 09 00 00       	push   $0x952
 14c:	68 2c 09 00 00       	push   $0x92c
 151:	6a 01                	push   $0x1
 153:	e8 f0 04 00 00       	call   648 <printf>
 158:	83 c4 08             	add    $0x8,%esp
 15b:	68 40 09 00 00       	push   $0x940
 160:	6a 01                	push   $0x1
 162:	e8 e1 04 00 00       	call   648 <printf>
 167:	83 c4 04             	add    $0x4,%esp
 16a:	ff 35 ac 0d 00 00    	push   0xdac
 170:	e8 ae 03 00 00       	call   523 <kill>
 175:	e8 79 03 00 00       	call   4f3 <exit>
     stack = p;
 17a:	89 de                	mov    %ebx,%esi
 17c:	e9 49 ff ff ff       	jmp    ca <main+0x47>
   int clone_pid = clone(worker, 0, 0, stack);
 181:	56                   	push   %esi
 182:	6a 00                	push   $0x0
 184:	6a 00                	push   $0x0
 186:	68 00 00 00 00       	push   $0x0
 18b:	e8 03 04 00 00       	call   593 <clone>
 190:	89 c6                	mov    %eax,%esi
   assert(clone_pid > 0);
 192:	83 c4 10             	add    $0x10,%esp
 195:	85 c0                	test   %eax,%eax
 197:	7e 73                	jle    20c <main+0x189>
   while(!newfd);
 199:	a1 a8 0d 00 00       	mov    0xda8,%eax
 19e:	85 c0                	test   %eax,%eax
 1a0:	74 f7                	je     199 <main+0x116>
   assert(write(newfd, "goodbye\n", 8) == -1);
 1a2:	a1 a8 0d 00 00       	mov    0xda8,%eax
 1a7:	83 ec 04             	sub    $0x4,%esp
 1aa:	6a 08                	push   $0x8
 1ac:	68 76 09 00 00       	push   $0x976
 1b1:	50                   	push   %eax
 1b2:	e8 5c 03 00 00       	call   513 <write>
 1b7:	83 c4 10             	add    $0x10,%esp
 1ba:	83 f8 ff             	cmp    $0xffffffff,%eax
 1bd:	0f 84 92 00 00 00    	je     255 <main+0x1d2>
 1c3:	6a 28                	push   $0x28
 1c5:	68 ff 08 00 00       	push   $0x8ff
 1ca:	68 08 09 00 00       	push   $0x908
 1cf:	6a 01                	push   $0x1
 1d1:	e8 72 04 00 00       	call   648 <printf>
 1d6:	83 c4 0c             	add    $0xc,%esp
 1d9:	68 a4 09 00 00       	push   $0x9a4
 1de:	68 2c 09 00 00       	push   $0x92c
 1e3:	6a 01                	push   $0x1
 1e5:	e8 5e 04 00 00       	call   648 <printf>
 1ea:	83 c4 08             	add    $0x8,%esp
 1ed:	68 40 09 00 00       	push   $0x940
 1f2:	6a 01                	push   $0x1
 1f4:	e8 4f 04 00 00       	call   648 <printf>
 1f9:	83 c4 04             	add    $0x4,%esp
 1fc:	ff 35 ac 0d 00 00    	push   0xdac
 202:	e8 1c 03 00 00       	call   523 <kill>
 207:	e8 e7 02 00 00       	call   4f3 <exit>
   assert(clone_pid > 0);
 20c:	6a 26                	push   $0x26
 20e:	68 ff 08 00 00       	push   $0x8ff
 213:	68 08 09 00 00       	push   $0x908
 218:	6a 01                	push   $0x1
 21a:	e8 29 04 00 00       	call   648 <printf>
 21f:	83 c4 0c             	add    $0xc,%esp
 222:	68 68 09 00 00       	push   $0x968
 227:	68 2c 09 00 00       	push   $0x92c
 22c:	6a 01                	push   $0x1
 22e:	e8 15 04 00 00       	call   648 <printf>
 233:	83 c4 08             	add    $0x8,%esp
 236:	68 40 09 00 00       	push   $0x940
 23b:	6a 01                	push   $0x1
 23d:	e8 06 04 00 00       	call   648 <printf>
 242:	83 c4 04             	add    $0x4,%esp
 245:	ff 35 ac 0d 00 00    	push   0xdac
 24b:	e8 d3 02 00 00       	call   523 <kill>
 250:	e8 9e 02 00 00       	call   4f3 <exit>
   printf(1, "TEST PASSED\n");
 255:	83 ec 08             	sub    $0x8,%esp
 258:	68 7f 09 00 00       	push   $0x97f
 25d:	6a 01                	push   $0x1
 25f:	e8 e4 03 00 00       	call   648 <printf>
   int join_pid = join(&join_stack);
 264:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 267:	89 04 24             	mov    %eax,(%esp)
 26a:	e8 2c 03 00 00       	call   59b <join>
   assert(join_pid == clone_pid);
 26f:	83 c4 10             	add    $0x10,%esp
 272:	39 c6                	cmp    %eax,%esi
 274:	74 49                	je     2bf <main+0x23c>
 276:	6a 2d                	push   $0x2d
 278:	68 ff 08 00 00       	push   $0x8ff
 27d:	68 08 09 00 00       	push   $0x908
 282:	6a 01                	push   $0x1
 284:	e8 bf 03 00 00       	call   648 <printf>
 289:	83 c4 0c             	add    $0xc,%esp
 28c:	68 8c 09 00 00       	push   $0x98c
 291:	68 2c 09 00 00       	push   $0x92c
 296:	6a 01                	push   $0x1
 298:	e8 ab 03 00 00       	call   648 <printf>
 29d:	83 c4 08             	add    $0x8,%esp
 2a0:	68 40 09 00 00       	push   $0x940
 2a5:	6a 01                	push   $0x1
 2a7:	e8 9c 03 00 00       	call   648 <printf>
 2ac:	83 c4 04             	add    $0x4,%esp
 2af:	ff 35 ac 0d 00 00    	push   0xdac
 2b5:	e8 69 02 00 00       	call   523 <kill>
 2ba:	e8 34 02 00 00       	call   4f3 <exit>
   free(p);
 2bf:	83 ec 0c             	sub    $0xc,%esp
 2c2:	53                   	push   %ebx
 2c3:	e8 e6 04 00 00       	call   7ae <free>
   exit();
 2c8:	e8 26 02 00 00       	call   4f3 <exit>

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

// a wrapper func for clone
int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 2de:	55                   	push   %ebp
 2df:	89 e5                	mov    %esp,%ebp
 2e1:	83 ec 14             	sub    $0x14,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE);
 2e4:	68 00 10 00 00       	push   $0x1000
 2e9:	e8 80 05 00 00       	call   86e <malloc>
  if(n_stack == 0){
 2ee:	83 c4 10             	add    $0x10,%esp
 2f1:	85 c0                	test   %eax,%eax
 2f3:	74 14                	je     309 <thread_create+0x2b>
    return -1;
  }
  int new_pid = clone(start_routine, arg1, arg2, n_stack); // TODO: is this the right way to call it?
 2f5:	50                   	push   %eax
 2f6:	ff 75 10             	push   0x10(%ebp)
 2f9:	ff 75 0c             	push   0xc(%ebp)
 2fc:	ff 75 08             	push   0x8(%ebp)
 2ff:	e8 8f 02 00 00       	call   593 <clone>


  // I can't remember if there was something else to do here but I'm sure I'll find out


  return new_pid;
 304:	83 c4 10             	add    $0x10,%esp
}
 307:	c9                   	leave  
 308:	c3                   	ret    
    return -1;
 309:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 30e:	eb f7                	jmp    307 <thread_create+0x29>

00000310 <thread_join>:

int thread_join() {
  return 0;
}
 310:	b8 00 00 00 00       	mov    $0x0,%eax
 315:	c3                   	ret    

00000316 <lock_acquire>:

void lock_acquire(lock_t *lock){
 316:	55                   	push   %ebp
 317:	89 e5                	mov    %esp,%ebp
 319:	53                   	push   %ebx
 31a:	83 ec 04             	sub    $0x4,%esp
 31d:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 320:	83 ec 08             	sub    $0x8,%esp
 323:	6a 01                	push   $0x1
 325:	53                   	push   %ebx
 326:	e8 a2 ff ff ff       	call   2cd <test_and_set>
 32b:	83 c4 10             	add    $0x10,%esp
 32e:	83 f8 01             	cmp    $0x1,%eax
 331:	74 ed                	je     320 <lock_acquire+0xa>
    ;
}
 333:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 336:	c9                   	leave  
 337:	c3                   	ret    

00000338 <lock_release>:

void lock_release(lock_t *lock) {
 338:	55                   	push   %ebp
 339:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 33b:	8b 45 08             	mov    0x8(%ebp),%eax
 33e:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 344:	5d                   	pop    %ebp
 345:	c3                   	ret    

00000346 <lock_init>:

void lock_init(lock_t *lock) {
 346:	55                   	push   %ebp
 347:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 349:	8b 45 08             	mov    0x8(%ebp),%eax
 34c:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 352:	5d                   	pop    %ebp
 353:	c3                   	ret    

00000354 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 354:	55                   	push   %ebp
 355:	89 e5                	mov    %esp,%ebp
 357:	56                   	push   %esi
 358:	53                   	push   %ebx
 359:	8b 75 08             	mov    0x8(%ebp),%esi
 35c:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 35f:	89 f0                	mov    %esi,%eax
 361:	89 d1                	mov    %edx,%ecx
 363:	83 c2 01             	add    $0x1,%edx
 366:	89 c3                	mov    %eax,%ebx
 368:	83 c0 01             	add    $0x1,%eax
 36b:	0f b6 09             	movzbl (%ecx),%ecx
 36e:	88 0b                	mov    %cl,(%ebx)
 370:	84 c9                	test   %cl,%cl
 372:	75 ed                	jne    361 <strcpy+0xd>
    ;
  return os;
}
 374:	89 f0                	mov    %esi,%eax
 376:	5b                   	pop    %ebx
 377:	5e                   	pop    %esi
 378:	5d                   	pop    %ebp
 379:	c3                   	ret    

0000037a <strcmp>:

int
strcmp(const char *p, const char *q)
{
 37a:	55                   	push   %ebp
 37b:	89 e5                	mov    %esp,%ebp
 37d:	8b 4d 08             	mov    0x8(%ebp),%ecx
 380:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 383:	eb 06                	jmp    38b <strcmp+0x11>
    p++, q++;
 385:	83 c1 01             	add    $0x1,%ecx
 388:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 38b:	0f b6 01             	movzbl (%ecx),%eax
 38e:	84 c0                	test   %al,%al
 390:	74 04                	je     396 <strcmp+0x1c>
 392:	3a 02                	cmp    (%edx),%al
 394:	74 ef                	je     385 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 396:	0f b6 c0             	movzbl %al,%eax
 399:	0f b6 12             	movzbl (%edx),%edx
 39c:	29 d0                	sub    %edx,%eax
}
 39e:	5d                   	pop    %ebp
 39f:	c3                   	ret    

000003a0 <strlen>:

uint
strlen(const char *s)
{
 3a0:	55                   	push   %ebp
 3a1:	89 e5                	mov    %esp,%ebp
 3a3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 3a6:	b8 00 00 00 00       	mov    $0x0,%eax
 3ab:	eb 03                	jmp    3b0 <strlen+0x10>
 3ad:	83 c0 01             	add    $0x1,%eax
 3b0:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 3b4:	75 f7                	jne    3ad <strlen+0xd>
    ;
  return n;
}
 3b6:	5d                   	pop    %ebp
 3b7:	c3                   	ret    

000003b8 <memset>:

void*
memset(void *dst, int c, uint n)
{
 3b8:	55                   	push   %ebp
 3b9:	89 e5                	mov    %esp,%ebp
 3bb:	57                   	push   %edi
 3bc:	8b 55 08             	mov    0x8(%ebp),%edx
  asm volatile("cld; rep stosb" :
 3bf:	89 d7                	mov    %edx,%edi
 3c1:	8b 4d 10             	mov    0x10(%ebp),%ecx
 3c4:	8b 45 0c             	mov    0xc(%ebp),%eax
 3c7:	fc                   	cld    
 3c8:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 3ca:	89 d0                	mov    %edx,%eax
 3cc:	8b 7d fc             	mov    -0x4(%ebp),%edi
 3cf:	c9                   	leave  
 3d0:	c3                   	ret    

000003d1 <strchr>:

char*
strchr(const char *s, char c)
{
 3d1:	55                   	push   %ebp
 3d2:	89 e5                	mov    %esp,%ebp
 3d4:	8b 45 08             	mov    0x8(%ebp),%eax
 3d7:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 3db:	eb 03                	jmp    3e0 <strchr+0xf>
 3dd:	83 c0 01             	add    $0x1,%eax
 3e0:	0f b6 10             	movzbl (%eax),%edx
 3e3:	84 d2                	test   %dl,%dl
 3e5:	74 06                	je     3ed <strchr+0x1c>
    if(*s == c)
 3e7:	38 ca                	cmp    %cl,%dl
 3e9:	75 f2                	jne    3dd <strchr+0xc>
 3eb:	eb 05                	jmp    3f2 <strchr+0x21>
      return (char*)s;
  return 0;
 3ed:	b8 00 00 00 00       	mov    $0x0,%eax
}
 3f2:	5d                   	pop    %ebp
 3f3:	c3                   	ret    

000003f4 <gets>:

char*
gets(char *buf, int max)
{
 3f4:	55                   	push   %ebp
 3f5:	89 e5                	mov    %esp,%ebp
 3f7:	57                   	push   %edi
 3f8:	56                   	push   %esi
 3f9:	53                   	push   %ebx
 3fa:	83 ec 1c             	sub    $0x1c,%esp
 3fd:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 400:	bb 00 00 00 00       	mov    $0x0,%ebx
 405:	89 de                	mov    %ebx,%esi
 407:	83 c3 01             	add    $0x1,%ebx
 40a:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 40d:	7d 2e                	jge    43d <gets+0x49>
    cc = read(0, &c, 1);
 40f:	83 ec 04             	sub    $0x4,%esp
 412:	6a 01                	push   $0x1
 414:	8d 45 e7             	lea    -0x19(%ebp),%eax
 417:	50                   	push   %eax
 418:	6a 00                	push   $0x0
 41a:	e8 ec 00 00 00       	call   50b <read>
    if(cc < 1)
 41f:	83 c4 10             	add    $0x10,%esp
 422:	85 c0                	test   %eax,%eax
 424:	7e 17                	jle    43d <gets+0x49>
      break;
    buf[i++] = c;
 426:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 42a:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 42d:	3c 0a                	cmp    $0xa,%al
 42f:	0f 94 c2             	sete   %dl
 432:	3c 0d                	cmp    $0xd,%al
 434:	0f 94 c0             	sete   %al
 437:	08 c2                	or     %al,%dl
 439:	74 ca                	je     405 <gets+0x11>
    buf[i++] = c;
 43b:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 43d:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 441:	89 f8                	mov    %edi,%eax
 443:	8d 65 f4             	lea    -0xc(%ebp),%esp
 446:	5b                   	pop    %ebx
 447:	5e                   	pop    %esi
 448:	5f                   	pop    %edi
 449:	5d                   	pop    %ebp
 44a:	c3                   	ret    

0000044b <stat>:

int
stat(const char *n, struct stat *st)
{
 44b:	55                   	push   %ebp
 44c:	89 e5                	mov    %esp,%ebp
 44e:	56                   	push   %esi
 44f:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 450:	83 ec 08             	sub    $0x8,%esp
 453:	6a 00                	push   $0x0
 455:	ff 75 08             	push   0x8(%ebp)
 458:	e8 d6 00 00 00       	call   533 <open>
  if(fd < 0)
 45d:	83 c4 10             	add    $0x10,%esp
 460:	85 c0                	test   %eax,%eax
 462:	78 24                	js     488 <stat+0x3d>
 464:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 466:	83 ec 08             	sub    $0x8,%esp
 469:	ff 75 0c             	push   0xc(%ebp)
 46c:	50                   	push   %eax
 46d:	e8 d9 00 00 00       	call   54b <fstat>
 472:	89 c6                	mov    %eax,%esi
  close(fd);
 474:	89 1c 24             	mov    %ebx,(%esp)
 477:	e8 9f 00 00 00       	call   51b <close>
  return r;
 47c:	83 c4 10             	add    $0x10,%esp
}
 47f:	89 f0                	mov    %esi,%eax
 481:	8d 65 f8             	lea    -0x8(%ebp),%esp
 484:	5b                   	pop    %ebx
 485:	5e                   	pop    %esi
 486:	5d                   	pop    %ebp
 487:	c3                   	ret    
    return -1;
 488:	be ff ff ff ff       	mov    $0xffffffff,%esi
 48d:	eb f0                	jmp    47f <stat+0x34>

0000048f <atoi>:

int
atoi(const char *s)
{
 48f:	55                   	push   %ebp
 490:	89 e5                	mov    %esp,%ebp
 492:	53                   	push   %ebx
 493:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 496:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 49b:	eb 10                	jmp    4ad <atoi+0x1e>
    n = n*10 + *s++ - '0';
 49d:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 4a0:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 4a3:	83 c1 01             	add    $0x1,%ecx
 4a6:	0f be c0             	movsbl %al,%eax
 4a9:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 4ad:	0f b6 01             	movzbl (%ecx),%eax
 4b0:	8d 58 d0             	lea    -0x30(%eax),%ebx
 4b3:	80 fb 09             	cmp    $0x9,%bl
 4b6:	76 e5                	jbe    49d <atoi+0xe>
  return n;
}
 4b8:	89 d0                	mov    %edx,%eax
 4ba:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4bd:	c9                   	leave  
 4be:	c3                   	ret    

000004bf <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 4bf:	55                   	push   %ebp
 4c0:	89 e5                	mov    %esp,%ebp
 4c2:	56                   	push   %esi
 4c3:	53                   	push   %ebx
 4c4:	8b 75 08             	mov    0x8(%ebp),%esi
 4c7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 4ca:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 4cd:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 4cf:	eb 0d                	jmp    4de <memmove+0x1f>
    *dst++ = *src++;
 4d1:	0f b6 01             	movzbl (%ecx),%eax
 4d4:	88 02                	mov    %al,(%edx)
 4d6:	8d 49 01             	lea    0x1(%ecx),%ecx
 4d9:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 4dc:	89 d8                	mov    %ebx,%eax
 4de:	8d 58 ff             	lea    -0x1(%eax),%ebx
 4e1:	85 c0                	test   %eax,%eax
 4e3:	7f ec                	jg     4d1 <memmove+0x12>
  return vdst;
}
 4e5:	89 f0                	mov    %esi,%eax
 4e7:	5b                   	pop    %ebx
 4e8:	5e                   	pop    %esi
 4e9:	5d                   	pop    %ebp
 4ea:	c3                   	ret    

000004eb <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4eb:	b8 01 00 00 00       	mov    $0x1,%eax
 4f0:	cd 40                	int    $0x40
 4f2:	c3                   	ret    

000004f3 <exit>:
SYSCALL(exit)
 4f3:	b8 02 00 00 00       	mov    $0x2,%eax
 4f8:	cd 40                	int    $0x40
 4fa:	c3                   	ret    

000004fb <wait>:
SYSCALL(wait)
 4fb:	b8 03 00 00 00       	mov    $0x3,%eax
 500:	cd 40                	int    $0x40
 502:	c3                   	ret    

00000503 <pipe>:
SYSCALL(pipe)
 503:	b8 04 00 00 00       	mov    $0x4,%eax
 508:	cd 40                	int    $0x40
 50a:	c3                   	ret    

0000050b <read>:
SYSCALL(read)
 50b:	b8 05 00 00 00       	mov    $0x5,%eax
 510:	cd 40                	int    $0x40
 512:	c3                   	ret    

00000513 <write>:
SYSCALL(write)
 513:	b8 10 00 00 00       	mov    $0x10,%eax
 518:	cd 40                	int    $0x40
 51a:	c3                   	ret    

0000051b <close>:
SYSCALL(close)
 51b:	b8 15 00 00 00       	mov    $0x15,%eax
 520:	cd 40                	int    $0x40
 522:	c3                   	ret    

00000523 <kill>:
SYSCALL(kill)
 523:	b8 06 00 00 00       	mov    $0x6,%eax
 528:	cd 40                	int    $0x40
 52a:	c3                   	ret    

0000052b <exec>:
SYSCALL(exec)
 52b:	b8 07 00 00 00       	mov    $0x7,%eax
 530:	cd 40                	int    $0x40
 532:	c3                   	ret    

00000533 <open>:
SYSCALL(open)
 533:	b8 0f 00 00 00       	mov    $0xf,%eax
 538:	cd 40                	int    $0x40
 53a:	c3                   	ret    

0000053b <mknod>:
SYSCALL(mknod)
 53b:	b8 11 00 00 00       	mov    $0x11,%eax
 540:	cd 40                	int    $0x40
 542:	c3                   	ret    

00000543 <unlink>:
SYSCALL(unlink)
 543:	b8 12 00 00 00       	mov    $0x12,%eax
 548:	cd 40                	int    $0x40
 54a:	c3                   	ret    

0000054b <fstat>:
SYSCALL(fstat)
 54b:	b8 08 00 00 00       	mov    $0x8,%eax
 550:	cd 40                	int    $0x40
 552:	c3                   	ret    

00000553 <link>:
SYSCALL(link)
 553:	b8 13 00 00 00       	mov    $0x13,%eax
 558:	cd 40                	int    $0x40
 55a:	c3                   	ret    

0000055b <mkdir>:
SYSCALL(mkdir)
 55b:	b8 14 00 00 00       	mov    $0x14,%eax
 560:	cd 40                	int    $0x40
 562:	c3                   	ret    

00000563 <chdir>:
SYSCALL(chdir)
 563:	b8 09 00 00 00       	mov    $0x9,%eax
 568:	cd 40                	int    $0x40
 56a:	c3                   	ret    

0000056b <dup>:
SYSCALL(dup)
 56b:	b8 0a 00 00 00       	mov    $0xa,%eax
 570:	cd 40                	int    $0x40
 572:	c3                   	ret    

00000573 <getpid>:
SYSCALL(getpid)
 573:	b8 0b 00 00 00       	mov    $0xb,%eax
 578:	cd 40                	int    $0x40
 57a:	c3                   	ret    

0000057b <sbrk>:
SYSCALL(sbrk)
 57b:	b8 0c 00 00 00       	mov    $0xc,%eax
 580:	cd 40                	int    $0x40
 582:	c3                   	ret    

00000583 <sleep>:
SYSCALL(sleep)
 583:	b8 0d 00 00 00       	mov    $0xd,%eax
 588:	cd 40                	int    $0x40
 58a:	c3                   	ret    

0000058b <uptime>:
SYSCALL(uptime)
 58b:	b8 0e 00 00 00       	mov    $0xe,%eax
 590:	cd 40                	int    $0x40
 592:	c3                   	ret    

00000593 <clone>:
SYSCALL(clone)
 593:	b8 16 00 00 00       	mov    $0x16,%eax
 598:	cd 40                	int    $0x40
 59a:	c3                   	ret    

0000059b <join>:
 59b:	b8 17 00 00 00       	mov    $0x17,%eax
 5a0:	cd 40                	int    $0x40
 5a2:	c3                   	ret    

000005a3 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 5a3:	55                   	push   %ebp
 5a4:	89 e5                	mov    %esp,%ebp
 5a6:	83 ec 1c             	sub    $0x1c,%esp
 5a9:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 5ac:	6a 01                	push   $0x1
 5ae:	8d 55 f4             	lea    -0xc(%ebp),%edx
 5b1:	52                   	push   %edx
 5b2:	50                   	push   %eax
 5b3:	e8 5b ff ff ff       	call   513 <write>
}
 5b8:	83 c4 10             	add    $0x10,%esp
 5bb:	c9                   	leave  
 5bc:	c3                   	ret    

000005bd <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 5bd:	55                   	push   %ebp
 5be:	89 e5                	mov    %esp,%ebp
 5c0:	57                   	push   %edi
 5c1:	56                   	push   %esi
 5c2:	53                   	push   %ebx
 5c3:	83 ec 2c             	sub    $0x2c,%esp
 5c6:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5c9:	89 d0                	mov    %edx,%eax
 5cb:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 5cd:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 5d1:	0f 95 c1             	setne  %cl
 5d4:	c1 ea 1f             	shr    $0x1f,%edx
 5d7:	84 d1                	test   %dl,%cl
 5d9:	74 44                	je     61f <printint+0x62>
    neg = 1;
    x = -xx;
 5db:	f7 d8                	neg    %eax
 5dd:	89 c1                	mov    %eax,%ecx
    neg = 1;
 5df:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 5e6:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 5eb:	89 c8                	mov    %ecx,%eax
 5ed:	ba 00 00 00 00       	mov    $0x0,%edx
 5f2:	f7 f6                	div    %esi
 5f4:	89 df                	mov    %ebx,%edi
 5f6:	83 c3 01             	add    $0x1,%ebx
 5f9:	0f b6 92 28 0a 00 00 	movzbl 0xa28(%edx),%edx
 600:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 604:	89 ca                	mov    %ecx,%edx
 606:	89 c1                	mov    %eax,%ecx
 608:	39 d6                	cmp    %edx,%esi
 60a:	76 df                	jbe    5eb <printint+0x2e>
  if(neg)
 60c:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 610:	74 31                	je     643 <printint+0x86>
    buf[i++] = '-';
 612:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 617:	8d 5f 02             	lea    0x2(%edi),%ebx
 61a:	8b 75 d0             	mov    -0x30(%ebp),%esi
 61d:	eb 17                	jmp    636 <printint+0x79>
    x = xx;
 61f:	89 c1                	mov    %eax,%ecx
  neg = 0;
 621:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 628:	eb bc                	jmp    5e6 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 62a:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 62f:	89 f0                	mov    %esi,%eax
 631:	e8 6d ff ff ff       	call   5a3 <putc>
  while(--i >= 0)
 636:	83 eb 01             	sub    $0x1,%ebx
 639:	79 ef                	jns    62a <printint+0x6d>
}
 63b:	83 c4 2c             	add    $0x2c,%esp
 63e:	5b                   	pop    %ebx
 63f:	5e                   	pop    %esi
 640:	5f                   	pop    %edi
 641:	5d                   	pop    %ebp
 642:	c3                   	ret    
 643:	8b 75 d0             	mov    -0x30(%ebp),%esi
 646:	eb ee                	jmp    636 <printint+0x79>

00000648 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 648:	55                   	push   %ebp
 649:	89 e5                	mov    %esp,%ebp
 64b:	57                   	push   %edi
 64c:	56                   	push   %esi
 64d:	53                   	push   %ebx
 64e:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 651:	8d 45 10             	lea    0x10(%ebp),%eax
 654:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 657:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 65c:	bb 00 00 00 00       	mov    $0x0,%ebx
 661:	eb 14                	jmp    677 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 663:	89 fa                	mov    %edi,%edx
 665:	8b 45 08             	mov    0x8(%ebp),%eax
 668:	e8 36 ff ff ff       	call   5a3 <putc>
 66d:	eb 05                	jmp    674 <printf+0x2c>
      }
    } else if(state == '%'){
 66f:	83 fe 25             	cmp    $0x25,%esi
 672:	74 25                	je     699 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 674:	83 c3 01             	add    $0x1,%ebx
 677:	8b 45 0c             	mov    0xc(%ebp),%eax
 67a:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 67e:	84 c0                	test   %al,%al
 680:	0f 84 20 01 00 00    	je     7a6 <printf+0x15e>
    c = fmt[i] & 0xff;
 686:	0f be f8             	movsbl %al,%edi
 689:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 68c:	85 f6                	test   %esi,%esi
 68e:	75 df                	jne    66f <printf+0x27>
      if(c == '%'){
 690:	83 f8 25             	cmp    $0x25,%eax
 693:	75 ce                	jne    663 <printf+0x1b>
        state = '%';
 695:	89 c6                	mov    %eax,%esi
 697:	eb db                	jmp    674 <printf+0x2c>
      if(c == 'd'){
 699:	83 f8 25             	cmp    $0x25,%eax
 69c:	0f 84 cf 00 00 00    	je     771 <printf+0x129>
 6a2:	0f 8c dd 00 00 00    	jl     785 <printf+0x13d>
 6a8:	83 f8 78             	cmp    $0x78,%eax
 6ab:	0f 8f d4 00 00 00    	jg     785 <printf+0x13d>
 6b1:	83 f8 63             	cmp    $0x63,%eax
 6b4:	0f 8c cb 00 00 00    	jl     785 <printf+0x13d>
 6ba:	83 e8 63             	sub    $0x63,%eax
 6bd:	83 f8 15             	cmp    $0x15,%eax
 6c0:	0f 87 bf 00 00 00    	ja     785 <printf+0x13d>
 6c6:	ff 24 85 d0 09 00 00 	jmp    *0x9d0(,%eax,4)
        printint(fd, *ap, 10, 1);
 6cd:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6d0:	8b 17                	mov    (%edi),%edx
 6d2:	83 ec 0c             	sub    $0xc,%esp
 6d5:	6a 01                	push   $0x1
 6d7:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6dc:	8b 45 08             	mov    0x8(%ebp),%eax
 6df:	e8 d9 fe ff ff       	call   5bd <printint>
        ap++;
 6e4:	83 c7 04             	add    $0x4,%edi
 6e7:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 6ea:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 6ed:	be 00 00 00 00       	mov    $0x0,%esi
 6f2:	eb 80                	jmp    674 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 6f4:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6f7:	8b 17                	mov    (%edi),%edx
 6f9:	83 ec 0c             	sub    $0xc,%esp
 6fc:	6a 00                	push   $0x0
 6fe:	b9 10 00 00 00       	mov    $0x10,%ecx
 703:	8b 45 08             	mov    0x8(%ebp),%eax
 706:	e8 b2 fe ff ff       	call   5bd <printint>
        ap++;
 70b:	83 c7 04             	add    $0x4,%edi
 70e:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 711:	83 c4 10             	add    $0x10,%esp
      state = 0;
 714:	be 00 00 00 00       	mov    $0x0,%esi
 719:	e9 56 ff ff ff       	jmp    674 <printf+0x2c>
        s = (char*)*ap;
 71e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 721:	8b 30                	mov    (%eax),%esi
        ap++;
 723:	83 c0 04             	add    $0x4,%eax
 726:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 729:	85 f6                	test   %esi,%esi
 72b:	75 15                	jne    742 <printf+0xfa>
          s = "(null)";
 72d:	be c7 09 00 00       	mov    $0x9c7,%esi
 732:	eb 0e                	jmp    742 <printf+0xfa>
          putc(fd, *s);
 734:	0f be d2             	movsbl %dl,%edx
 737:	8b 45 08             	mov    0x8(%ebp),%eax
 73a:	e8 64 fe ff ff       	call   5a3 <putc>
          s++;
 73f:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 742:	0f b6 16             	movzbl (%esi),%edx
 745:	84 d2                	test   %dl,%dl
 747:	75 eb                	jne    734 <printf+0xec>
      state = 0;
 749:	be 00 00 00 00       	mov    $0x0,%esi
 74e:	e9 21 ff ff ff       	jmp    674 <printf+0x2c>
        putc(fd, *ap);
 753:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 756:	0f be 17             	movsbl (%edi),%edx
 759:	8b 45 08             	mov    0x8(%ebp),%eax
 75c:	e8 42 fe ff ff       	call   5a3 <putc>
        ap++;
 761:	83 c7 04             	add    $0x4,%edi
 764:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 767:	be 00 00 00 00       	mov    $0x0,%esi
 76c:	e9 03 ff ff ff       	jmp    674 <printf+0x2c>
        putc(fd, c);
 771:	89 fa                	mov    %edi,%edx
 773:	8b 45 08             	mov    0x8(%ebp),%eax
 776:	e8 28 fe ff ff       	call   5a3 <putc>
      state = 0;
 77b:	be 00 00 00 00       	mov    $0x0,%esi
 780:	e9 ef fe ff ff       	jmp    674 <printf+0x2c>
        putc(fd, '%');
 785:	ba 25 00 00 00       	mov    $0x25,%edx
 78a:	8b 45 08             	mov    0x8(%ebp),%eax
 78d:	e8 11 fe ff ff       	call   5a3 <putc>
        putc(fd, c);
 792:	89 fa                	mov    %edi,%edx
 794:	8b 45 08             	mov    0x8(%ebp),%eax
 797:	e8 07 fe ff ff       	call   5a3 <putc>
      state = 0;
 79c:	be 00 00 00 00       	mov    $0x0,%esi
 7a1:	e9 ce fe ff ff       	jmp    674 <printf+0x2c>
    }
  }
}
 7a6:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7a9:	5b                   	pop    %ebx
 7aa:	5e                   	pop    %esi
 7ab:	5f                   	pop    %edi
 7ac:	5d                   	pop    %ebp
 7ad:	c3                   	ret    

000007ae <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7ae:	55                   	push   %ebp
 7af:	89 e5                	mov    %esp,%ebp
 7b1:	57                   	push   %edi
 7b2:	56                   	push   %esi
 7b3:	53                   	push   %ebx
 7b4:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7b7:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7ba:	a1 b0 0d 00 00       	mov    0xdb0,%eax
 7bf:	eb 02                	jmp    7c3 <free+0x15>
 7c1:	89 d0                	mov    %edx,%eax
 7c3:	39 c8                	cmp    %ecx,%eax
 7c5:	73 04                	jae    7cb <free+0x1d>
 7c7:	39 08                	cmp    %ecx,(%eax)
 7c9:	77 12                	ja     7dd <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7cb:	8b 10                	mov    (%eax),%edx
 7cd:	39 c2                	cmp    %eax,%edx
 7cf:	77 f0                	ja     7c1 <free+0x13>
 7d1:	39 c8                	cmp    %ecx,%eax
 7d3:	72 08                	jb     7dd <free+0x2f>
 7d5:	39 ca                	cmp    %ecx,%edx
 7d7:	77 04                	ja     7dd <free+0x2f>
 7d9:	89 d0                	mov    %edx,%eax
 7db:	eb e6                	jmp    7c3 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7dd:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7e0:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7e3:	8b 10                	mov    (%eax),%edx
 7e5:	39 d7                	cmp    %edx,%edi
 7e7:	74 19                	je     802 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 7e9:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7ec:	8b 50 04             	mov    0x4(%eax),%edx
 7ef:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7f2:	39 ce                	cmp    %ecx,%esi
 7f4:	74 1b                	je     811 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 7f6:	89 08                	mov    %ecx,(%eax)
  freep = p;
 7f8:	a3 b0 0d 00 00       	mov    %eax,0xdb0
}
 7fd:	5b                   	pop    %ebx
 7fe:	5e                   	pop    %esi
 7ff:	5f                   	pop    %edi
 800:	5d                   	pop    %ebp
 801:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 802:	03 72 04             	add    0x4(%edx),%esi
 805:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 808:	8b 10                	mov    (%eax),%edx
 80a:	8b 12                	mov    (%edx),%edx
 80c:	89 53 f8             	mov    %edx,-0x8(%ebx)
 80f:	eb db                	jmp    7ec <free+0x3e>
    p->s.size += bp->s.size;
 811:	03 53 fc             	add    -0x4(%ebx),%edx
 814:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 817:	8b 53 f8             	mov    -0x8(%ebx),%edx
 81a:	89 10                	mov    %edx,(%eax)
 81c:	eb da                	jmp    7f8 <free+0x4a>

0000081e <morecore>:

static Header*
morecore(uint nu)
{
 81e:	55                   	push   %ebp
 81f:	89 e5                	mov    %esp,%ebp
 821:	53                   	push   %ebx
 822:	83 ec 04             	sub    $0x4,%esp
 825:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 827:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 82c:	77 05                	ja     833 <morecore+0x15>
    nu = 4096;
 82e:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 833:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 83a:	83 ec 0c             	sub    $0xc,%esp
 83d:	50                   	push   %eax
 83e:	e8 38 fd ff ff       	call   57b <sbrk>
  if(p == (char*)-1)
 843:	83 c4 10             	add    $0x10,%esp
 846:	83 f8 ff             	cmp    $0xffffffff,%eax
 849:	74 1c                	je     867 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 84b:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 84e:	83 c0 08             	add    $0x8,%eax
 851:	83 ec 0c             	sub    $0xc,%esp
 854:	50                   	push   %eax
 855:	e8 54 ff ff ff       	call   7ae <free>
  return freep;
 85a:	a1 b0 0d 00 00       	mov    0xdb0,%eax
 85f:	83 c4 10             	add    $0x10,%esp
}
 862:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 865:	c9                   	leave  
 866:	c3                   	ret    
    return 0;
 867:	b8 00 00 00 00       	mov    $0x0,%eax
 86c:	eb f4                	jmp    862 <morecore+0x44>

0000086e <malloc>:

void*
malloc(uint nbytes)
{
 86e:	55                   	push   %ebp
 86f:	89 e5                	mov    %esp,%ebp
 871:	53                   	push   %ebx
 872:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 875:	8b 45 08             	mov    0x8(%ebp),%eax
 878:	8d 58 07             	lea    0x7(%eax),%ebx
 87b:	c1 eb 03             	shr    $0x3,%ebx
 87e:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 881:	8b 0d b0 0d 00 00    	mov    0xdb0,%ecx
 887:	85 c9                	test   %ecx,%ecx
 889:	74 04                	je     88f <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 88b:	8b 01                	mov    (%ecx),%eax
 88d:	eb 4a                	jmp    8d9 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 88f:	c7 05 b0 0d 00 00 b4 	movl   $0xdb4,0xdb0
 896:	0d 00 00 
 899:	c7 05 b4 0d 00 00 b4 	movl   $0xdb4,0xdb4
 8a0:	0d 00 00 
    base.s.size = 0;
 8a3:	c7 05 b8 0d 00 00 00 	movl   $0x0,0xdb8
 8aa:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 8ad:	b9 b4 0d 00 00       	mov    $0xdb4,%ecx
 8b2:	eb d7                	jmp    88b <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 8b4:	74 19                	je     8cf <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 8b6:	29 da                	sub    %ebx,%edx
 8b8:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8bb:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 8be:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 8c1:	89 0d b0 0d 00 00    	mov    %ecx,0xdb0
      return (void*)(p + 1);
 8c7:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 8ca:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8cd:	c9                   	leave  
 8ce:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 8cf:	8b 10                	mov    (%eax),%edx
 8d1:	89 11                	mov    %edx,(%ecx)
 8d3:	eb ec                	jmp    8c1 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8d5:	89 c1                	mov    %eax,%ecx
 8d7:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 8d9:	8b 50 04             	mov    0x4(%eax),%edx
 8dc:	39 da                	cmp    %ebx,%edx
 8de:	73 d4                	jae    8b4 <malloc+0x46>
    if(p == freep)
 8e0:	39 05 b0 0d 00 00    	cmp    %eax,0xdb0
 8e6:	75 ed                	jne    8d5 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 8e8:	89 d8                	mov    %ebx,%eax
 8ea:	e8 2f ff ff ff       	call   81e <morecore>
 8ef:	85 c0                	test   %eax,%eax
 8f1:	75 e2                	jne    8d5 <malloc+0x67>
 8f3:	eb d5                	jmp    8ca <malloc+0x5c>
