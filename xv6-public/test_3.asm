
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
   8:	68 00 09 00 00       	push   $0x900
   d:	6a 03                	push   $0x3
   f:	e8 0a 05 00 00       	call   51e <write>
  14:	83 c4 10             	add    $0x10,%esp
  17:	83 f8 06             	cmp    $0x6,%eax
  1a:	74 49                	je     65 <worker+0x65>
  1c:	6a 34                	push   $0x34
  1e:	68 07 09 00 00       	push   $0x907
  23:	68 10 09 00 00       	push   $0x910
  28:	6a 01                	push   $0x1
  2a:	e8 24 06 00 00       	call   653 <printf>
  2f:	83 c4 0c             	add    $0xc,%esp
  32:	68 18 09 00 00       	push   $0x918
  37:	68 34 09 00 00       	push   $0x934
  3c:	6a 01                	push   $0x1
  3e:	e8 10 06 00 00       	call   653 <printf>
  43:	83 c4 08             	add    $0x8,%esp
  46:	68 48 09 00 00       	push   $0x948
  4b:	6a 01                	push   $0x1
  4d:	e8 01 06 00 00       	call   653 <printf>
  52:	83 c4 04             	add    $0x4,%esp
  55:	ff 35 c0 0d 00 00    	push   0xdc0
  5b:	e8 ce 04 00 00       	call   52e <kill>
  60:	e8 99 04 00 00       	call   4fe <exit>
   xchg(&newfd, open("tmp2", O_WRONLY|O_CREATE));
  65:	83 ec 08             	sub    $0x8,%esp
  68:	68 01 02 00 00       	push   $0x201
  6d:	68 55 09 00 00       	push   $0x955
  72:	e8 c7 04 00 00       	call   53e <open>
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
  77:	f0 87 05 bc 0d 00 00 	lock xchg %eax,0xdbc
   exit();
  7e:	e8 7b 04 00 00       	call   4fe <exit>

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
  96:	e8 e3 04 00 00       	call   57e <getpid>
  9b:	a3 c0 0d 00 00       	mov    %eax,0xdc0
   void *stack, *p = malloc(PGSIZE * 2);
  a0:	83 ec 0c             	sub    $0xc,%esp
  a3:	68 00 20 00 00       	push   $0x2000
  a8:	e8 cc 07 00 00       	call   879 <malloc>
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
  d2:	68 64 09 00 00       	push   $0x964
  d7:	e8 62 04 00 00       	call   53e <open>
   assert(fd == 3);
  dc:	83 c4 10             	add    $0x10,%esp
  df:	83 f8 03             	cmp    $0x3,%eax
  e2:	0f 84 99 00 00 00    	je     181 <main+0xfe>
  e8:	6a 24                	push   $0x24
  ea:	68 07 09 00 00       	push   $0x907
  ef:	68 10 09 00 00       	push   $0x910
  f4:	6a 01                	push   $0x1
  f6:	e8 58 05 00 00       	call   653 <printf>
  fb:	83 c4 0c             	add    $0xc,%esp
  fe:	68 68 09 00 00       	push   $0x968
 103:	68 34 09 00 00       	push   $0x934
 108:	6a 01                	push   $0x1
 10a:	e8 44 05 00 00       	call   653 <printf>
 10f:	83 c4 08             	add    $0x8,%esp
 112:	68 48 09 00 00       	push   $0x948
 117:	6a 01                	push   $0x1
 119:	e8 35 05 00 00       	call   653 <printf>
 11e:	83 c4 04             	add    $0x4,%esp
 121:	ff 35 c0 0d 00 00    	push   0xdc0
 127:	e8 02 04 00 00       	call   52e <kill>
 12c:	e8 cd 03 00 00       	call   4fe <exit>
   assert(p != NULL);
 131:	6a 1d                	push   $0x1d
 133:	68 07 09 00 00       	push   $0x907
 138:	68 10 09 00 00       	push   $0x910
 13d:	6a 01                	push   $0x1
 13f:	e8 0f 05 00 00       	call   653 <printf>
 144:	83 c4 0c             	add    $0xc,%esp
 147:	68 5a 09 00 00       	push   $0x95a
 14c:	68 34 09 00 00       	push   $0x934
 151:	6a 01                	push   $0x1
 153:	e8 fb 04 00 00       	call   653 <printf>
 158:	83 c4 08             	add    $0x8,%esp
 15b:	68 48 09 00 00       	push   $0x948
 160:	6a 01                	push   $0x1
 162:	e8 ec 04 00 00       	call   653 <printf>
 167:	83 c4 04             	add    $0x4,%esp
 16a:	ff 35 c0 0d 00 00    	push   0xdc0
 170:	e8 b9 03 00 00       	call   52e <kill>
 175:	e8 84 03 00 00       	call   4fe <exit>
     stack = p;
 17a:	89 de                	mov    %ebx,%esi
 17c:	e9 49 ff ff ff       	jmp    ca <main+0x47>
   int clone_pid = clone(worker, 0, 0, stack);
 181:	56                   	push   %esi
 182:	6a 00                	push   $0x0
 184:	6a 00                	push   $0x0
 186:	68 00 00 00 00       	push   $0x0
 18b:	e8 0e 04 00 00       	call   59e <clone>
 190:	89 c6                	mov    %eax,%esi
   assert(clone_pid > 0);
 192:	83 c4 10             	add    $0x10,%esp
 195:	85 c0                	test   %eax,%eax
 197:	7e 73                	jle    20c <main+0x189>
   while(!newfd);
 199:	a1 bc 0d 00 00       	mov    0xdbc,%eax
 19e:	85 c0                	test   %eax,%eax
 1a0:	74 f7                	je     199 <main+0x116>
   assert(write(newfd, "goodbye\n", 8) == -1);
 1a2:	a1 bc 0d 00 00       	mov    0xdbc,%eax
 1a7:	83 ec 04             	sub    $0x4,%esp
 1aa:	6a 08                	push   $0x8
 1ac:	68 7e 09 00 00       	push   $0x97e
 1b1:	50                   	push   %eax
 1b2:	e8 67 03 00 00       	call   51e <write>
 1b7:	83 c4 10             	add    $0x10,%esp
 1ba:	83 f8 ff             	cmp    $0xffffffff,%eax
 1bd:	0f 84 92 00 00 00    	je     255 <main+0x1d2>
 1c3:	6a 28                	push   $0x28
 1c5:	68 07 09 00 00       	push   $0x907
 1ca:	68 10 09 00 00       	push   $0x910
 1cf:	6a 01                	push   $0x1
 1d1:	e8 7d 04 00 00       	call   653 <printf>
 1d6:	83 c4 0c             	add    $0xc,%esp
 1d9:	68 ac 09 00 00       	push   $0x9ac
 1de:	68 34 09 00 00       	push   $0x934
 1e3:	6a 01                	push   $0x1
 1e5:	e8 69 04 00 00       	call   653 <printf>
 1ea:	83 c4 08             	add    $0x8,%esp
 1ed:	68 48 09 00 00       	push   $0x948
 1f2:	6a 01                	push   $0x1
 1f4:	e8 5a 04 00 00       	call   653 <printf>
 1f9:	83 c4 04             	add    $0x4,%esp
 1fc:	ff 35 c0 0d 00 00    	push   0xdc0
 202:	e8 27 03 00 00       	call   52e <kill>
 207:	e8 f2 02 00 00       	call   4fe <exit>
   assert(clone_pid > 0);
 20c:	6a 26                	push   $0x26
 20e:	68 07 09 00 00       	push   $0x907
 213:	68 10 09 00 00       	push   $0x910
 218:	6a 01                	push   $0x1
 21a:	e8 34 04 00 00       	call   653 <printf>
 21f:	83 c4 0c             	add    $0xc,%esp
 222:	68 70 09 00 00       	push   $0x970
 227:	68 34 09 00 00       	push   $0x934
 22c:	6a 01                	push   $0x1
 22e:	e8 20 04 00 00       	call   653 <printf>
 233:	83 c4 08             	add    $0x8,%esp
 236:	68 48 09 00 00       	push   $0x948
 23b:	6a 01                	push   $0x1
 23d:	e8 11 04 00 00       	call   653 <printf>
 242:	83 c4 04             	add    $0x4,%esp
 245:	ff 35 c0 0d 00 00    	push   0xdc0
 24b:	e8 de 02 00 00       	call   52e <kill>
 250:	e8 a9 02 00 00       	call   4fe <exit>
   printf(1, "TEST PASSED\n");
 255:	83 ec 08             	sub    $0x8,%esp
 258:	68 87 09 00 00       	push   $0x987
 25d:	6a 01                	push   $0x1
 25f:	e8 ef 03 00 00       	call   653 <printf>
   int join_pid = join(&join_stack);
 264:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 267:	89 04 24             	mov    %eax,(%esp)
 26a:	e8 37 03 00 00       	call   5a6 <join>
   assert(join_pid == clone_pid);
 26f:	83 c4 10             	add    $0x10,%esp
 272:	39 c6                	cmp    %eax,%esi
 274:	74 49                	je     2bf <main+0x23c>
 276:	6a 2d                	push   $0x2d
 278:	68 07 09 00 00       	push   $0x907
 27d:	68 10 09 00 00       	push   $0x910
 282:	6a 01                	push   $0x1
 284:	e8 ca 03 00 00       	call   653 <printf>
 289:	83 c4 0c             	add    $0xc,%esp
 28c:	68 94 09 00 00       	push   $0x994
 291:	68 34 09 00 00       	push   $0x934
 296:	6a 01                	push   $0x1
 298:	e8 b6 03 00 00       	call   653 <printf>
 29d:	83 c4 08             	add    $0x8,%esp
 2a0:	68 48 09 00 00       	push   $0x948
 2a5:	6a 01                	push   $0x1
 2a7:	e8 a7 03 00 00       	call   653 <printf>
 2ac:	83 c4 04             	add    $0x4,%esp
 2af:	ff 35 c0 0d 00 00    	push   0xdc0
 2b5:	e8 74 02 00 00       	call   52e <kill>
 2ba:	e8 3f 02 00 00       	call   4fe <exit>
   free(p);
 2bf:	83 ec 0c             	sub    $0xc,%esp
 2c2:	53                   	push   %ebx
 2c3:	e8 f1 04 00 00       	call   7b9 <free>
   exit();
 2c8:	e8 31 02 00 00       	call   4fe <exit>

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
  void *n_stack = malloc(PGSIZE*2);
 2e4:	68 00 20 00 00       	push   $0x2000
 2e9:	e8 8b 05 00 00       	call   879 <malloc>
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
 2ff:	e8 9a 02 00 00       	call   59e <clone>


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
 310:	55                   	push   %ebp
 311:	89 e5                	mov    %esp,%ebp
 313:	83 ec 24             	sub    $0x24,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 316:	8d 45 f4             	lea    -0xc(%ebp),%eax
 319:	50                   	push   %eax
 31a:	e8 87 02 00 00       	call   5a6 <join>
  
  return pid;
}
 31f:	c9                   	leave  
 320:	c3                   	ret    

00000321 <lock_acquire>:

void lock_acquire(lock_t *lock){
 321:	55                   	push   %ebp
 322:	89 e5                	mov    %esp,%ebp
 324:	53                   	push   %ebx
 325:	83 ec 04             	sub    $0x4,%esp
 328:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 32b:	83 ec 08             	sub    $0x8,%esp
 32e:	6a 01                	push   $0x1
 330:	53                   	push   %ebx
 331:	e8 97 ff ff ff       	call   2cd <test_and_set>
 336:	83 c4 10             	add    $0x10,%esp
 339:	83 f8 01             	cmp    $0x1,%eax
 33c:	74 ed                	je     32b <lock_acquire+0xa>
    ;
}
 33e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 341:	c9                   	leave  
 342:	c3                   	ret    

00000343 <lock_release>:

void lock_release(lock_t *lock) {
 343:	55                   	push   %ebp
 344:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 346:	8b 45 08             	mov    0x8(%ebp),%eax
 349:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 34f:	5d                   	pop    %ebp
 350:	c3                   	ret    

00000351 <lock_init>:

void lock_init(lock_t *lock) {
 351:	55                   	push   %ebp
 352:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 354:	8b 45 08             	mov    0x8(%ebp),%eax
 357:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 35d:	5d                   	pop    %ebp
 35e:	c3                   	ret    

0000035f <strcpy>:

char*
strcpy(char *s, const char *t)
{
 35f:	55                   	push   %ebp
 360:	89 e5                	mov    %esp,%ebp
 362:	56                   	push   %esi
 363:	53                   	push   %ebx
 364:	8b 75 08             	mov    0x8(%ebp),%esi
 367:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 36a:	89 f0                	mov    %esi,%eax
 36c:	89 d1                	mov    %edx,%ecx
 36e:	83 c2 01             	add    $0x1,%edx
 371:	89 c3                	mov    %eax,%ebx
 373:	83 c0 01             	add    $0x1,%eax
 376:	0f b6 09             	movzbl (%ecx),%ecx
 379:	88 0b                	mov    %cl,(%ebx)
 37b:	84 c9                	test   %cl,%cl
 37d:	75 ed                	jne    36c <strcpy+0xd>
    ;
  return os;
}
 37f:	89 f0                	mov    %esi,%eax
 381:	5b                   	pop    %ebx
 382:	5e                   	pop    %esi
 383:	5d                   	pop    %ebp
 384:	c3                   	ret    

00000385 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 385:	55                   	push   %ebp
 386:	89 e5                	mov    %esp,%ebp
 388:	8b 4d 08             	mov    0x8(%ebp),%ecx
 38b:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 38e:	eb 06                	jmp    396 <strcmp+0x11>
    p++, q++;
 390:	83 c1 01             	add    $0x1,%ecx
 393:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 396:	0f b6 01             	movzbl (%ecx),%eax
 399:	84 c0                	test   %al,%al
 39b:	74 04                	je     3a1 <strcmp+0x1c>
 39d:	3a 02                	cmp    (%edx),%al
 39f:	74 ef                	je     390 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 3a1:	0f b6 c0             	movzbl %al,%eax
 3a4:	0f b6 12             	movzbl (%edx),%edx
 3a7:	29 d0                	sub    %edx,%eax
}
 3a9:	5d                   	pop    %ebp
 3aa:	c3                   	ret    

000003ab <strlen>:

uint
strlen(const char *s)
{
 3ab:	55                   	push   %ebp
 3ac:	89 e5                	mov    %esp,%ebp
 3ae:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 3b1:	b8 00 00 00 00       	mov    $0x0,%eax
 3b6:	eb 03                	jmp    3bb <strlen+0x10>
 3b8:	83 c0 01             	add    $0x1,%eax
 3bb:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 3bf:	75 f7                	jne    3b8 <strlen+0xd>
    ;
  return n;
}
 3c1:	5d                   	pop    %ebp
 3c2:	c3                   	ret    

000003c3 <memset>:

void*
memset(void *dst, int c, uint n)
{
 3c3:	55                   	push   %ebp
 3c4:	89 e5                	mov    %esp,%ebp
 3c6:	57                   	push   %edi
 3c7:	8b 55 08             	mov    0x8(%ebp),%edx
  asm volatile("cld; rep stosb" :
 3ca:	89 d7                	mov    %edx,%edi
 3cc:	8b 4d 10             	mov    0x10(%ebp),%ecx
 3cf:	8b 45 0c             	mov    0xc(%ebp),%eax
 3d2:	fc                   	cld    
 3d3:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 3d5:	89 d0                	mov    %edx,%eax
 3d7:	8b 7d fc             	mov    -0x4(%ebp),%edi
 3da:	c9                   	leave  
 3db:	c3                   	ret    

000003dc <strchr>:

char*
strchr(const char *s, char c)
{
 3dc:	55                   	push   %ebp
 3dd:	89 e5                	mov    %esp,%ebp
 3df:	8b 45 08             	mov    0x8(%ebp),%eax
 3e2:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 3e6:	eb 03                	jmp    3eb <strchr+0xf>
 3e8:	83 c0 01             	add    $0x1,%eax
 3eb:	0f b6 10             	movzbl (%eax),%edx
 3ee:	84 d2                	test   %dl,%dl
 3f0:	74 06                	je     3f8 <strchr+0x1c>
    if(*s == c)
 3f2:	38 ca                	cmp    %cl,%dl
 3f4:	75 f2                	jne    3e8 <strchr+0xc>
 3f6:	eb 05                	jmp    3fd <strchr+0x21>
      return (char*)s;
  return 0;
 3f8:	b8 00 00 00 00       	mov    $0x0,%eax
}
 3fd:	5d                   	pop    %ebp
 3fe:	c3                   	ret    

000003ff <gets>:

char*
gets(char *buf, int max)
{
 3ff:	55                   	push   %ebp
 400:	89 e5                	mov    %esp,%ebp
 402:	57                   	push   %edi
 403:	56                   	push   %esi
 404:	53                   	push   %ebx
 405:	83 ec 1c             	sub    $0x1c,%esp
 408:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 40b:	bb 00 00 00 00       	mov    $0x0,%ebx
 410:	89 de                	mov    %ebx,%esi
 412:	83 c3 01             	add    $0x1,%ebx
 415:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 418:	7d 2e                	jge    448 <gets+0x49>
    cc = read(0, &c, 1);
 41a:	83 ec 04             	sub    $0x4,%esp
 41d:	6a 01                	push   $0x1
 41f:	8d 45 e7             	lea    -0x19(%ebp),%eax
 422:	50                   	push   %eax
 423:	6a 00                	push   $0x0
 425:	e8 ec 00 00 00       	call   516 <read>
    if(cc < 1)
 42a:	83 c4 10             	add    $0x10,%esp
 42d:	85 c0                	test   %eax,%eax
 42f:	7e 17                	jle    448 <gets+0x49>
      break;
    buf[i++] = c;
 431:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 435:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 438:	3c 0a                	cmp    $0xa,%al
 43a:	0f 94 c2             	sete   %dl
 43d:	3c 0d                	cmp    $0xd,%al
 43f:	0f 94 c0             	sete   %al
 442:	08 c2                	or     %al,%dl
 444:	74 ca                	je     410 <gets+0x11>
    buf[i++] = c;
 446:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 448:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 44c:	89 f8                	mov    %edi,%eax
 44e:	8d 65 f4             	lea    -0xc(%ebp),%esp
 451:	5b                   	pop    %ebx
 452:	5e                   	pop    %esi
 453:	5f                   	pop    %edi
 454:	5d                   	pop    %ebp
 455:	c3                   	ret    

00000456 <stat>:

int
stat(const char *n, struct stat *st)
{
 456:	55                   	push   %ebp
 457:	89 e5                	mov    %esp,%ebp
 459:	56                   	push   %esi
 45a:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 45b:	83 ec 08             	sub    $0x8,%esp
 45e:	6a 00                	push   $0x0
 460:	ff 75 08             	push   0x8(%ebp)
 463:	e8 d6 00 00 00       	call   53e <open>
  if(fd < 0)
 468:	83 c4 10             	add    $0x10,%esp
 46b:	85 c0                	test   %eax,%eax
 46d:	78 24                	js     493 <stat+0x3d>
 46f:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 471:	83 ec 08             	sub    $0x8,%esp
 474:	ff 75 0c             	push   0xc(%ebp)
 477:	50                   	push   %eax
 478:	e8 d9 00 00 00       	call   556 <fstat>
 47d:	89 c6                	mov    %eax,%esi
  close(fd);
 47f:	89 1c 24             	mov    %ebx,(%esp)
 482:	e8 9f 00 00 00       	call   526 <close>
  return r;
 487:	83 c4 10             	add    $0x10,%esp
}
 48a:	89 f0                	mov    %esi,%eax
 48c:	8d 65 f8             	lea    -0x8(%ebp),%esp
 48f:	5b                   	pop    %ebx
 490:	5e                   	pop    %esi
 491:	5d                   	pop    %ebp
 492:	c3                   	ret    
    return -1;
 493:	be ff ff ff ff       	mov    $0xffffffff,%esi
 498:	eb f0                	jmp    48a <stat+0x34>

0000049a <atoi>:

int
atoi(const char *s)
{
 49a:	55                   	push   %ebp
 49b:	89 e5                	mov    %esp,%ebp
 49d:	53                   	push   %ebx
 49e:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 4a1:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 4a6:	eb 10                	jmp    4b8 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 4a8:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 4ab:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 4ae:	83 c1 01             	add    $0x1,%ecx
 4b1:	0f be c0             	movsbl %al,%eax
 4b4:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 4b8:	0f b6 01             	movzbl (%ecx),%eax
 4bb:	8d 58 d0             	lea    -0x30(%eax),%ebx
 4be:	80 fb 09             	cmp    $0x9,%bl
 4c1:	76 e5                	jbe    4a8 <atoi+0xe>
  return n;
}
 4c3:	89 d0                	mov    %edx,%eax
 4c5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4c8:	c9                   	leave  
 4c9:	c3                   	ret    

000004ca <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 4ca:	55                   	push   %ebp
 4cb:	89 e5                	mov    %esp,%ebp
 4cd:	56                   	push   %esi
 4ce:	53                   	push   %ebx
 4cf:	8b 75 08             	mov    0x8(%ebp),%esi
 4d2:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 4d5:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 4d8:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 4da:	eb 0d                	jmp    4e9 <memmove+0x1f>
    *dst++ = *src++;
 4dc:	0f b6 01             	movzbl (%ecx),%eax
 4df:	88 02                	mov    %al,(%edx)
 4e1:	8d 49 01             	lea    0x1(%ecx),%ecx
 4e4:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 4e7:	89 d8                	mov    %ebx,%eax
 4e9:	8d 58 ff             	lea    -0x1(%eax),%ebx
 4ec:	85 c0                	test   %eax,%eax
 4ee:	7f ec                	jg     4dc <memmove+0x12>
  return vdst;
}
 4f0:	89 f0                	mov    %esi,%eax
 4f2:	5b                   	pop    %ebx
 4f3:	5e                   	pop    %esi
 4f4:	5d                   	pop    %ebp
 4f5:	c3                   	ret    

000004f6 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4f6:	b8 01 00 00 00       	mov    $0x1,%eax
 4fb:	cd 40                	int    $0x40
 4fd:	c3                   	ret    

000004fe <exit>:
SYSCALL(exit)
 4fe:	b8 02 00 00 00       	mov    $0x2,%eax
 503:	cd 40                	int    $0x40
 505:	c3                   	ret    

00000506 <wait>:
SYSCALL(wait)
 506:	b8 03 00 00 00       	mov    $0x3,%eax
 50b:	cd 40                	int    $0x40
 50d:	c3                   	ret    

0000050e <pipe>:
SYSCALL(pipe)
 50e:	b8 04 00 00 00       	mov    $0x4,%eax
 513:	cd 40                	int    $0x40
 515:	c3                   	ret    

00000516 <read>:
SYSCALL(read)
 516:	b8 05 00 00 00       	mov    $0x5,%eax
 51b:	cd 40                	int    $0x40
 51d:	c3                   	ret    

0000051e <write>:
SYSCALL(write)
 51e:	b8 10 00 00 00       	mov    $0x10,%eax
 523:	cd 40                	int    $0x40
 525:	c3                   	ret    

00000526 <close>:
SYSCALL(close)
 526:	b8 15 00 00 00       	mov    $0x15,%eax
 52b:	cd 40                	int    $0x40
 52d:	c3                   	ret    

0000052e <kill>:
SYSCALL(kill)
 52e:	b8 06 00 00 00       	mov    $0x6,%eax
 533:	cd 40                	int    $0x40
 535:	c3                   	ret    

00000536 <exec>:
SYSCALL(exec)
 536:	b8 07 00 00 00       	mov    $0x7,%eax
 53b:	cd 40                	int    $0x40
 53d:	c3                   	ret    

0000053e <open>:
SYSCALL(open)
 53e:	b8 0f 00 00 00       	mov    $0xf,%eax
 543:	cd 40                	int    $0x40
 545:	c3                   	ret    

00000546 <mknod>:
SYSCALL(mknod)
 546:	b8 11 00 00 00       	mov    $0x11,%eax
 54b:	cd 40                	int    $0x40
 54d:	c3                   	ret    

0000054e <unlink>:
SYSCALL(unlink)
 54e:	b8 12 00 00 00       	mov    $0x12,%eax
 553:	cd 40                	int    $0x40
 555:	c3                   	ret    

00000556 <fstat>:
SYSCALL(fstat)
 556:	b8 08 00 00 00       	mov    $0x8,%eax
 55b:	cd 40                	int    $0x40
 55d:	c3                   	ret    

0000055e <link>:
SYSCALL(link)
 55e:	b8 13 00 00 00       	mov    $0x13,%eax
 563:	cd 40                	int    $0x40
 565:	c3                   	ret    

00000566 <mkdir>:
SYSCALL(mkdir)
 566:	b8 14 00 00 00       	mov    $0x14,%eax
 56b:	cd 40                	int    $0x40
 56d:	c3                   	ret    

0000056e <chdir>:
SYSCALL(chdir)
 56e:	b8 09 00 00 00       	mov    $0x9,%eax
 573:	cd 40                	int    $0x40
 575:	c3                   	ret    

00000576 <dup>:
SYSCALL(dup)
 576:	b8 0a 00 00 00       	mov    $0xa,%eax
 57b:	cd 40                	int    $0x40
 57d:	c3                   	ret    

0000057e <getpid>:
SYSCALL(getpid)
 57e:	b8 0b 00 00 00       	mov    $0xb,%eax
 583:	cd 40                	int    $0x40
 585:	c3                   	ret    

00000586 <sbrk>:
SYSCALL(sbrk)
 586:	b8 0c 00 00 00       	mov    $0xc,%eax
 58b:	cd 40                	int    $0x40
 58d:	c3                   	ret    

0000058e <sleep>:
SYSCALL(sleep)
 58e:	b8 0d 00 00 00       	mov    $0xd,%eax
 593:	cd 40                	int    $0x40
 595:	c3                   	ret    

00000596 <uptime>:
SYSCALL(uptime)
 596:	b8 0e 00 00 00       	mov    $0xe,%eax
 59b:	cd 40                	int    $0x40
 59d:	c3                   	ret    

0000059e <clone>:
SYSCALL(clone)
 59e:	b8 16 00 00 00       	mov    $0x16,%eax
 5a3:	cd 40                	int    $0x40
 5a5:	c3                   	ret    

000005a6 <join>:
 5a6:	b8 17 00 00 00       	mov    $0x17,%eax
 5ab:	cd 40                	int    $0x40
 5ad:	c3                   	ret    

000005ae <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 5ae:	55                   	push   %ebp
 5af:	89 e5                	mov    %esp,%ebp
 5b1:	83 ec 1c             	sub    $0x1c,%esp
 5b4:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 5b7:	6a 01                	push   $0x1
 5b9:	8d 55 f4             	lea    -0xc(%ebp),%edx
 5bc:	52                   	push   %edx
 5bd:	50                   	push   %eax
 5be:	e8 5b ff ff ff       	call   51e <write>
}
 5c3:	83 c4 10             	add    $0x10,%esp
 5c6:	c9                   	leave  
 5c7:	c3                   	ret    

000005c8 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 5c8:	55                   	push   %ebp
 5c9:	89 e5                	mov    %esp,%ebp
 5cb:	57                   	push   %edi
 5cc:	56                   	push   %esi
 5cd:	53                   	push   %ebx
 5ce:	83 ec 2c             	sub    $0x2c,%esp
 5d1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5d4:	89 d0                	mov    %edx,%eax
 5d6:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 5d8:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 5dc:	0f 95 c1             	setne  %cl
 5df:	c1 ea 1f             	shr    $0x1f,%edx
 5e2:	84 d1                	test   %dl,%cl
 5e4:	74 44                	je     62a <printint+0x62>
    neg = 1;
    x = -xx;
 5e6:	f7 d8                	neg    %eax
 5e8:	89 c1                	mov    %eax,%ecx
    neg = 1;
 5ea:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 5f1:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 5f6:	89 c8                	mov    %ecx,%eax
 5f8:	ba 00 00 00 00       	mov    $0x0,%edx
 5fd:	f7 f6                	div    %esi
 5ff:	89 df                	mov    %ebx,%edi
 601:	83 c3 01             	add    $0x1,%ebx
 604:	0f b6 92 30 0a 00 00 	movzbl 0xa30(%edx),%edx
 60b:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 60f:	89 ca                	mov    %ecx,%edx
 611:	89 c1                	mov    %eax,%ecx
 613:	39 d6                	cmp    %edx,%esi
 615:	76 df                	jbe    5f6 <printint+0x2e>
  if(neg)
 617:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 61b:	74 31                	je     64e <printint+0x86>
    buf[i++] = '-';
 61d:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 622:	8d 5f 02             	lea    0x2(%edi),%ebx
 625:	8b 75 d0             	mov    -0x30(%ebp),%esi
 628:	eb 17                	jmp    641 <printint+0x79>
    x = xx;
 62a:	89 c1                	mov    %eax,%ecx
  neg = 0;
 62c:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 633:	eb bc                	jmp    5f1 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 635:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 63a:	89 f0                	mov    %esi,%eax
 63c:	e8 6d ff ff ff       	call   5ae <putc>
  while(--i >= 0)
 641:	83 eb 01             	sub    $0x1,%ebx
 644:	79 ef                	jns    635 <printint+0x6d>
}
 646:	83 c4 2c             	add    $0x2c,%esp
 649:	5b                   	pop    %ebx
 64a:	5e                   	pop    %esi
 64b:	5f                   	pop    %edi
 64c:	5d                   	pop    %ebp
 64d:	c3                   	ret    
 64e:	8b 75 d0             	mov    -0x30(%ebp),%esi
 651:	eb ee                	jmp    641 <printint+0x79>

00000653 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 653:	55                   	push   %ebp
 654:	89 e5                	mov    %esp,%ebp
 656:	57                   	push   %edi
 657:	56                   	push   %esi
 658:	53                   	push   %ebx
 659:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 65c:	8d 45 10             	lea    0x10(%ebp),%eax
 65f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 662:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 667:	bb 00 00 00 00       	mov    $0x0,%ebx
 66c:	eb 14                	jmp    682 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 66e:	89 fa                	mov    %edi,%edx
 670:	8b 45 08             	mov    0x8(%ebp),%eax
 673:	e8 36 ff ff ff       	call   5ae <putc>
 678:	eb 05                	jmp    67f <printf+0x2c>
      }
    } else if(state == '%'){
 67a:	83 fe 25             	cmp    $0x25,%esi
 67d:	74 25                	je     6a4 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 67f:	83 c3 01             	add    $0x1,%ebx
 682:	8b 45 0c             	mov    0xc(%ebp),%eax
 685:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 689:	84 c0                	test   %al,%al
 68b:	0f 84 20 01 00 00    	je     7b1 <printf+0x15e>
    c = fmt[i] & 0xff;
 691:	0f be f8             	movsbl %al,%edi
 694:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 697:	85 f6                	test   %esi,%esi
 699:	75 df                	jne    67a <printf+0x27>
      if(c == '%'){
 69b:	83 f8 25             	cmp    $0x25,%eax
 69e:	75 ce                	jne    66e <printf+0x1b>
        state = '%';
 6a0:	89 c6                	mov    %eax,%esi
 6a2:	eb db                	jmp    67f <printf+0x2c>
      if(c == 'd'){
 6a4:	83 f8 25             	cmp    $0x25,%eax
 6a7:	0f 84 cf 00 00 00    	je     77c <printf+0x129>
 6ad:	0f 8c dd 00 00 00    	jl     790 <printf+0x13d>
 6b3:	83 f8 78             	cmp    $0x78,%eax
 6b6:	0f 8f d4 00 00 00    	jg     790 <printf+0x13d>
 6bc:	83 f8 63             	cmp    $0x63,%eax
 6bf:	0f 8c cb 00 00 00    	jl     790 <printf+0x13d>
 6c5:	83 e8 63             	sub    $0x63,%eax
 6c8:	83 f8 15             	cmp    $0x15,%eax
 6cb:	0f 87 bf 00 00 00    	ja     790 <printf+0x13d>
 6d1:	ff 24 85 d8 09 00 00 	jmp    *0x9d8(,%eax,4)
        printint(fd, *ap, 10, 1);
 6d8:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6db:	8b 17                	mov    (%edi),%edx
 6dd:	83 ec 0c             	sub    $0xc,%esp
 6e0:	6a 01                	push   $0x1
 6e2:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6e7:	8b 45 08             	mov    0x8(%ebp),%eax
 6ea:	e8 d9 fe ff ff       	call   5c8 <printint>
        ap++;
 6ef:	83 c7 04             	add    $0x4,%edi
 6f2:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 6f5:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 6f8:	be 00 00 00 00       	mov    $0x0,%esi
 6fd:	eb 80                	jmp    67f <printf+0x2c>
        printint(fd, *ap, 16, 0);
 6ff:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 702:	8b 17                	mov    (%edi),%edx
 704:	83 ec 0c             	sub    $0xc,%esp
 707:	6a 00                	push   $0x0
 709:	b9 10 00 00 00       	mov    $0x10,%ecx
 70e:	8b 45 08             	mov    0x8(%ebp),%eax
 711:	e8 b2 fe ff ff       	call   5c8 <printint>
        ap++;
 716:	83 c7 04             	add    $0x4,%edi
 719:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 71c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 71f:	be 00 00 00 00       	mov    $0x0,%esi
 724:	e9 56 ff ff ff       	jmp    67f <printf+0x2c>
        s = (char*)*ap;
 729:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 72c:	8b 30                	mov    (%eax),%esi
        ap++;
 72e:	83 c0 04             	add    $0x4,%eax
 731:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 734:	85 f6                	test   %esi,%esi
 736:	75 15                	jne    74d <printf+0xfa>
          s = "(null)";
 738:	be cf 09 00 00       	mov    $0x9cf,%esi
 73d:	eb 0e                	jmp    74d <printf+0xfa>
          putc(fd, *s);
 73f:	0f be d2             	movsbl %dl,%edx
 742:	8b 45 08             	mov    0x8(%ebp),%eax
 745:	e8 64 fe ff ff       	call   5ae <putc>
          s++;
 74a:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 74d:	0f b6 16             	movzbl (%esi),%edx
 750:	84 d2                	test   %dl,%dl
 752:	75 eb                	jne    73f <printf+0xec>
      state = 0;
 754:	be 00 00 00 00       	mov    $0x0,%esi
 759:	e9 21 ff ff ff       	jmp    67f <printf+0x2c>
        putc(fd, *ap);
 75e:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 761:	0f be 17             	movsbl (%edi),%edx
 764:	8b 45 08             	mov    0x8(%ebp),%eax
 767:	e8 42 fe ff ff       	call   5ae <putc>
        ap++;
 76c:	83 c7 04             	add    $0x4,%edi
 76f:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 772:	be 00 00 00 00       	mov    $0x0,%esi
 777:	e9 03 ff ff ff       	jmp    67f <printf+0x2c>
        putc(fd, c);
 77c:	89 fa                	mov    %edi,%edx
 77e:	8b 45 08             	mov    0x8(%ebp),%eax
 781:	e8 28 fe ff ff       	call   5ae <putc>
      state = 0;
 786:	be 00 00 00 00       	mov    $0x0,%esi
 78b:	e9 ef fe ff ff       	jmp    67f <printf+0x2c>
        putc(fd, '%');
 790:	ba 25 00 00 00       	mov    $0x25,%edx
 795:	8b 45 08             	mov    0x8(%ebp),%eax
 798:	e8 11 fe ff ff       	call   5ae <putc>
        putc(fd, c);
 79d:	89 fa                	mov    %edi,%edx
 79f:	8b 45 08             	mov    0x8(%ebp),%eax
 7a2:	e8 07 fe ff ff       	call   5ae <putc>
      state = 0;
 7a7:	be 00 00 00 00       	mov    $0x0,%esi
 7ac:	e9 ce fe ff ff       	jmp    67f <printf+0x2c>
    }
  }
}
 7b1:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7b4:	5b                   	pop    %ebx
 7b5:	5e                   	pop    %esi
 7b6:	5f                   	pop    %edi
 7b7:	5d                   	pop    %ebp
 7b8:	c3                   	ret    

000007b9 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7b9:	55                   	push   %ebp
 7ba:	89 e5                	mov    %esp,%ebp
 7bc:	57                   	push   %edi
 7bd:	56                   	push   %esi
 7be:	53                   	push   %ebx
 7bf:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7c2:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7c5:	a1 c4 0d 00 00       	mov    0xdc4,%eax
 7ca:	eb 02                	jmp    7ce <free+0x15>
 7cc:	89 d0                	mov    %edx,%eax
 7ce:	39 c8                	cmp    %ecx,%eax
 7d0:	73 04                	jae    7d6 <free+0x1d>
 7d2:	39 08                	cmp    %ecx,(%eax)
 7d4:	77 12                	ja     7e8 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7d6:	8b 10                	mov    (%eax),%edx
 7d8:	39 c2                	cmp    %eax,%edx
 7da:	77 f0                	ja     7cc <free+0x13>
 7dc:	39 c8                	cmp    %ecx,%eax
 7de:	72 08                	jb     7e8 <free+0x2f>
 7e0:	39 ca                	cmp    %ecx,%edx
 7e2:	77 04                	ja     7e8 <free+0x2f>
 7e4:	89 d0                	mov    %edx,%eax
 7e6:	eb e6                	jmp    7ce <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7e8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7eb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7ee:	8b 10                	mov    (%eax),%edx
 7f0:	39 d7                	cmp    %edx,%edi
 7f2:	74 19                	je     80d <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 7f4:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7f7:	8b 50 04             	mov    0x4(%eax),%edx
 7fa:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7fd:	39 ce                	cmp    %ecx,%esi
 7ff:	74 1b                	je     81c <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 801:	89 08                	mov    %ecx,(%eax)
  freep = p;
 803:	a3 c4 0d 00 00       	mov    %eax,0xdc4
}
 808:	5b                   	pop    %ebx
 809:	5e                   	pop    %esi
 80a:	5f                   	pop    %edi
 80b:	5d                   	pop    %ebp
 80c:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 80d:	03 72 04             	add    0x4(%edx),%esi
 810:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 813:	8b 10                	mov    (%eax),%edx
 815:	8b 12                	mov    (%edx),%edx
 817:	89 53 f8             	mov    %edx,-0x8(%ebx)
 81a:	eb db                	jmp    7f7 <free+0x3e>
    p->s.size += bp->s.size;
 81c:	03 53 fc             	add    -0x4(%ebx),%edx
 81f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 822:	8b 53 f8             	mov    -0x8(%ebx),%edx
 825:	89 10                	mov    %edx,(%eax)
 827:	eb da                	jmp    803 <free+0x4a>

00000829 <morecore>:

static Header*
morecore(uint nu)
{
 829:	55                   	push   %ebp
 82a:	89 e5                	mov    %esp,%ebp
 82c:	53                   	push   %ebx
 82d:	83 ec 04             	sub    $0x4,%esp
 830:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 832:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 837:	77 05                	ja     83e <morecore+0x15>
    nu = 4096;
 839:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 83e:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 845:	83 ec 0c             	sub    $0xc,%esp
 848:	50                   	push   %eax
 849:	e8 38 fd ff ff       	call   586 <sbrk>
  if(p == (char*)-1)
 84e:	83 c4 10             	add    $0x10,%esp
 851:	83 f8 ff             	cmp    $0xffffffff,%eax
 854:	74 1c                	je     872 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 856:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 859:	83 c0 08             	add    $0x8,%eax
 85c:	83 ec 0c             	sub    $0xc,%esp
 85f:	50                   	push   %eax
 860:	e8 54 ff ff ff       	call   7b9 <free>
  return freep;
 865:	a1 c4 0d 00 00       	mov    0xdc4,%eax
 86a:	83 c4 10             	add    $0x10,%esp
}
 86d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 870:	c9                   	leave  
 871:	c3                   	ret    
    return 0;
 872:	b8 00 00 00 00       	mov    $0x0,%eax
 877:	eb f4                	jmp    86d <morecore+0x44>

00000879 <malloc>:

void*
malloc(uint nbytes)
{
 879:	55                   	push   %ebp
 87a:	89 e5                	mov    %esp,%ebp
 87c:	53                   	push   %ebx
 87d:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 880:	8b 45 08             	mov    0x8(%ebp),%eax
 883:	8d 58 07             	lea    0x7(%eax),%ebx
 886:	c1 eb 03             	shr    $0x3,%ebx
 889:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 88c:	8b 0d c4 0d 00 00    	mov    0xdc4,%ecx
 892:	85 c9                	test   %ecx,%ecx
 894:	74 04                	je     89a <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 896:	8b 01                	mov    (%ecx),%eax
 898:	eb 4a                	jmp    8e4 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 89a:	c7 05 c4 0d 00 00 c8 	movl   $0xdc8,0xdc4
 8a1:	0d 00 00 
 8a4:	c7 05 c8 0d 00 00 c8 	movl   $0xdc8,0xdc8
 8ab:	0d 00 00 
    base.s.size = 0;
 8ae:	c7 05 cc 0d 00 00 00 	movl   $0x0,0xdcc
 8b5:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 8b8:	b9 c8 0d 00 00       	mov    $0xdc8,%ecx
 8bd:	eb d7                	jmp    896 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 8bf:	74 19                	je     8da <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 8c1:	29 da                	sub    %ebx,%edx
 8c3:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8c6:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 8c9:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 8cc:	89 0d c4 0d 00 00    	mov    %ecx,0xdc4
      return (void*)(p + 1);
 8d2:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 8d5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8d8:	c9                   	leave  
 8d9:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 8da:	8b 10                	mov    (%eax),%edx
 8dc:	89 11                	mov    %edx,(%ecx)
 8de:	eb ec                	jmp    8cc <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8e0:	89 c1                	mov    %eax,%ecx
 8e2:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 8e4:	8b 50 04             	mov    0x4(%eax),%edx
 8e7:	39 da                	cmp    %ebx,%edx
 8e9:	73 d4                	jae    8bf <malloc+0x46>
    if(p == freep)
 8eb:	39 05 c4 0d 00 00    	cmp    %eax,0xdc4
 8f1:	75 ed                	jne    8e0 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 8f3:	89 d8                	mov    %ebx,%eax
 8f5:	e8 2f ff ff ff       	call   829 <morecore>
 8fa:	85 c0                	test   %eax,%eax
 8fc:	75 e2                	jne    8e0 <malloc+0x67>
 8fe:	eb d5                	jmp    8d5 <malloc+0x5c>
