
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
  1d:	a1 5c 0d 00 00       	mov    0xd5c,%eax
  22:	83 f8 01             	cmp    $0x1,%eax
  25:	74 49                	je     70 <worker+0x70>
  27:	6a 38                	push   $0x38
  29:	68 e0 08 00 00       	push   $0x8e0
  2e:	68 e9 08 00 00       	push   $0x8e9
  33:	6a 01                	push   $0x1
  35:	e8 f7 05 00 00       	call   631 <printf>
  3a:	83 c4 0c             	add    $0xc,%esp
  3d:	68 f1 08 00 00       	push   $0x8f1
  42:	68 fd 08 00 00       	push   $0x8fd
  47:	6a 01                	push   $0x1
  49:	e8 e3 05 00 00       	call   631 <printf>
  4e:	83 c4 08             	add    $0x8,%esp
  51:	68 11 09 00 00       	push   $0x911
  56:	6a 01                	push   $0x1
  58:	e8 d4 05 00 00       	call   631 <printf>
  5d:	83 c4 04             	add    $0x4,%esp
  60:	ff 35 68 0d 00 00    	push   0xd68
  66:	e8 a1 04 00 00       	call   50c <kill>
  6b:	e8 6c 04 00 00       	call   4dc <exit>
   global = tmp1 + tmp2;
  70:	01 d9                	add    %ebx,%ecx
  72:	89 0d 5c 0d 00 00    	mov    %ecx,0xd5c
   exit();
  78:	e8 5f 04 00 00       	call   4dc <exit>

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
  90:	e8 c7 04 00 00       	call   55c <getpid>
  95:	a3 68 0d 00 00       	mov    %eax,0xd68
   void *stack, *p = malloc(PGSIZE * 2);
  9a:	83 ec 0c             	sub    $0xc,%esp
  9d:	68 00 20 00 00       	push   $0x2000
  a2:	e8 b0 07 00 00       	call   857 <malloc>
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
  c8:	68 60 0d 00 00       	push   $0xd60
  cd:	68 64 0d 00 00       	push   $0xd64
  d2:	68 00 00 00 00       	push   $0x0
  d7:	e8 a0 04 00 00       	call   57c <clone>
  dc:	89 c6                	mov    %eax,%esi
   assert(clone_pid > 0);
  de:	83 c4 10             	add    $0x10,%esp
  e1:	85 c0                	test   %eax,%eax
  e3:	0f 8e b8 00 00 00    	jle    1a1 <main+0x124>
   while(global != 33);
  e9:	a1 5c 0d 00 00       	mov    0xd5c,%eax
  ee:	83 f8 21             	cmp    $0x21,%eax
  f1:	75 f6                	jne    e9 <main+0x6c>
   assert(arg1 == 44);
  f3:	a1 64 0d 00 00       	mov    0xd64,%eax
  f8:	83 f8 2c             	cmp    $0x2c,%eax
  fb:	0f 85 e9 00 00 00    	jne    1ea <main+0x16d>
   assert(arg2 == 55);
 101:	a1 60 0d 00 00       	mov    0xd60,%eax
 106:	83 f8 37             	cmp    $0x37,%eax
 109:	0f 84 24 01 00 00    	je     233 <main+0x1b6>
 10f:	6a 28                	push   $0x28
 111:	68 e0 08 00 00       	push   $0x8e0
 116:	68 e9 08 00 00       	push   $0x8e9
 11b:	6a 01                	push   $0x1
 11d:	e8 0f 05 00 00       	call   631 <printf>
 122:	83 c4 0c             	add    $0xc,%esp
 125:	68 41 09 00 00       	push   $0x941
 12a:	68 fd 08 00 00       	push   $0x8fd
 12f:	6a 01                	push   $0x1
 131:	e8 fb 04 00 00       	call   631 <printf>
 136:	83 c4 08             	add    $0x8,%esp
 139:	68 11 09 00 00       	push   $0x911
 13e:	6a 01                	push   $0x1
 140:	e8 ec 04 00 00       	call   631 <printf>
 145:	83 c4 04             	add    $0x4,%esp
 148:	ff 35 68 0d 00 00    	push   0xd68
 14e:	e8 b9 03 00 00       	call   50c <kill>
 153:	e8 84 03 00 00       	call   4dc <exit>
   assert(p != NULL);
 158:	6a 1e                	push   $0x1e
 15a:	68 e0 08 00 00       	push   $0x8e0
 15f:	68 e9 08 00 00       	push   $0x8e9
 164:	6a 01                	push   $0x1
 166:	e8 c6 04 00 00       	call   631 <printf>
 16b:	83 c4 0c             	add    $0xc,%esp
 16e:	68 1e 09 00 00       	push   $0x91e
 173:	68 fd 08 00 00       	push   $0x8fd
 178:	6a 01                	push   $0x1
 17a:	e8 b2 04 00 00       	call   631 <printf>
 17f:	83 c4 08             	add    $0x8,%esp
 182:	68 11 09 00 00       	push   $0x911
 187:	6a 01                	push   $0x1
 189:	e8 a3 04 00 00       	call   631 <printf>
 18e:	83 c4 04             	add    $0x4,%esp
 191:	ff 35 68 0d 00 00    	push   0xd68
 197:	e8 70 03 00 00       	call   50c <kill>
 19c:	e8 3b 03 00 00       	call   4dc <exit>
   assert(clone_pid > 0);
 1a1:	6a 25                	push   $0x25
 1a3:	68 e0 08 00 00       	push   $0x8e0
 1a8:	68 e9 08 00 00       	push   $0x8e9
 1ad:	6a 01                	push   $0x1
 1af:	e8 7d 04 00 00       	call   631 <printf>
 1b4:	83 c4 0c             	add    $0xc,%esp
 1b7:	68 28 09 00 00       	push   $0x928
 1bc:	68 fd 08 00 00       	push   $0x8fd
 1c1:	6a 01                	push   $0x1
 1c3:	e8 69 04 00 00       	call   631 <printf>
 1c8:	83 c4 08             	add    $0x8,%esp
 1cb:	68 11 09 00 00       	push   $0x911
 1d0:	6a 01                	push   $0x1
 1d2:	e8 5a 04 00 00       	call   631 <printf>
 1d7:	83 c4 04             	add    $0x4,%esp
 1da:	ff 35 68 0d 00 00    	push   0xd68
 1e0:	e8 27 03 00 00       	call   50c <kill>
 1e5:	e8 f2 02 00 00       	call   4dc <exit>
   assert(arg1 == 44);
 1ea:	6a 27                	push   $0x27
 1ec:	68 e0 08 00 00       	push   $0x8e0
 1f1:	68 e9 08 00 00       	push   $0x8e9
 1f6:	6a 01                	push   $0x1
 1f8:	e8 34 04 00 00       	call   631 <printf>
 1fd:	83 c4 0c             	add    $0xc,%esp
 200:	68 36 09 00 00       	push   $0x936
 205:	68 fd 08 00 00       	push   $0x8fd
 20a:	6a 01                	push   $0x1
 20c:	e8 20 04 00 00       	call   631 <printf>
 211:	83 c4 08             	add    $0x8,%esp
 214:	68 11 09 00 00       	push   $0x911
 219:	6a 01                	push   $0x1
 21b:	e8 11 04 00 00       	call   631 <printf>
 220:	83 c4 04             	add    $0x4,%esp
 223:	ff 35 68 0d 00 00    	push   0xd68
 229:	e8 de 02 00 00       	call   50c <kill>
 22e:	e8 a9 02 00 00       	call   4dc <exit>
   printf(1, "TEST PASSED\n");
 233:	83 ec 08             	sub    $0x8,%esp
 236:	68 4c 09 00 00       	push   $0x94c
 23b:	6a 01                	push   $0x1
 23d:	e8 ef 03 00 00       	call   631 <printf>
   int join_pid = join(&join_stack);
 242:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 245:	89 04 24             	mov    %eax,(%esp)
 248:	e8 37 03 00 00       	call   584 <join>
   assert(join_pid == clone_pid);
 24d:	83 c4 10             	add    $0x10,%esp
 250:	39 c6                	cmp    %eax,%esi
 252:	74 49                	je     29d <main+0x220>
 254:	6a 2d                	push   $0x2d
 256:	68 e0 08 00 00       	push   $0x8e0
 25b:	68 e9 08 00 00       	push   $0x8e9
 260:	6a 01                	push   $0x1
 262:	e8 ca 03 00 00       	call   631 <printf>
 267:	83 c4 0c             	add    $0xc,%esp
 26a:	68 59 09 00 00       	push   $0x959
 26f:	68 fd 08 00 00       	push   $0x8fd
 274:	6a 01                	push   $0x1
 276:	e8 b6 03 00 00       	call   631 <printf>
 27b:	83 c4 08             	add    $0x8,%esp
 27e:	68 11 09 00 00       	push   $0x911
 283:	6a 01                	push   $0x1
 285:	e8 a7 03 00 00       	call   631 <printf>
 28a:	83 c4 04             	add    $0x4,%esp
 28d:	ff 35 68 0d 00 00    	push   0xd68
 293:	e8 74 02 00 00       	call   50c <kill>
 298:	e8 3f 02 00 00       	call   4dc <exit>
   free(p);
 29d:	83 ec 0c             	sub    $0xc,%esp
 2a0:	53                   	push   %ebx
 2a1:	e8 f1 04 00 00       	call   797 <free>
   exit();
 2a6:	e8 31 02 00 00       	call   4dc <exit>

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

// a wrapper func for clone
int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 2bc:	55                   	push   %ebp
 2bd:	89 e5                	mov    %esp,%ebp
 2bf:	83 ec 14             	sub    $0x14,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE*2);
 2c2:	68 00 20 00 00       	push   $0x2000
 2c7:	e8 8b 05 00 00       	call   857 <malloc>
  if(n_stack == 0){
 2cc:	83 c4 10             	add    $0x10,%esp
 2cf:	85 c0                	test   %eax,%eax
 2d1:	74 14                	je     2e7 <thread_create+0x2b>
    return -1;
  }
  int new_pid = clone(start_routine, arg1, arg2, n_stack); // TODO: is this the right way to call it?
 2d3:	50                   	push   %eax
 2d4:	ff 75 10             	push   0x10(%ebp)
 2d7:	ff 75 0c             	push   0xc(%ebp)
 2da:	ff 75 08             	push   0x8(%ebp)
 2dd:	e8 9a 02 00 00       	call   57c <clone>


  // I can't remember if there was something else to do here but I'm sure I'll find out


  return new_pid;
 2e2:	83 c4 10             	add    $0x10,%esp
}
 2e5:	c9                   	leave  
 2e6:	c3                   	ret    
    return -1;
 2e7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2ec:	eb f7                	jmp    2e5 <thread_create+0x29>

000002ee <thread_join>:

int thread_join() {
 2ee:	55                   	push   %ebp
 2ef:	89 e5                	mov    %esp,%ebp
 2f1:	83 ec 24             	sub    $0x24,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 2f4:	8d 45 f4             	lea    -0xc(%ebp),%eax
 2f7:	50                   	push   %eax
 2f8:	e8 87 02 00 00       	call   584 <join>
  
  return pid;
}
 2fd:	c9                   	leave  
 2fe:	c3                   	ret    

000002ff <lock_acquire>:

void lock_acquire(lock_t *lock){
 2ff:	55                   	push   %ebp
 300:	89 e5                	mov    %esp,%ebp
 302:	53                   	push   %ebx
 303:	83 ec 04             	sub    $0x4,%esp
 306:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 309:	83 ec 08             	sub    $0x8,%esp
 30c:	6a 01                	push   $0x1
 30e:	53                   	push   %ebx
 30f:	e8 97 ff ff ff       	call   2ab <test_and_set>
 314:	83 c4 10             	add    $0x10,%esp
 317:	83 f8 01             	cmp    $0x1,%eax
 31a:	74 ed                	je     309 <lock_acquire+0xa>
    ;
}
 31c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 31f:	c9                   	leave  
 320:	c3                   	ret    

00000321 <lock_release>:

void lock_release(lock_t *lock) {
 321:	55                   	push   %ebp
 322:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 324:	8b 45 08             	mov    0x8(%ebp),%eax
 327:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 32d:	5d                   	pop    %ebp
 32e:	c3                   	ret    

0000032f <lock_init>:

void lock_init(lock_t *lock) {
 32f:	55                   	push   %ebp
 330:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 332:	8b 45 08             	mov    0x8(%ebp),%eax
 335:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 33b:	5d                   	pop    %ebp
 33c:	c3                   	ret    

0000033d <strcpy>:

char*
strcpy(char *s, const char *t)
{
 33d:	55                   	push   %ebp
 33e:	89 e5                	mov    %esp,%ebp
 340:	56                   	push   %esi
 341:	53                   	push   %ebx
 342:	8b 75 08             	mov    0x8(%ebp),%esi
 345:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 348:	89 f0                	mov    %esi,%eax
 34a:	89 d1                	mov    %edx,%ecx
 34c:	83 c2 01             	add    $0x1,%edx
 34f:	89 c3                	mov    %eax,%ebx
 351:	83 c0 01             	add    $0x1,%eax
 354:	0f b6 09             	movzbl (%ecx),%ecx
 357:	88 0b                	mov    %cl,(%ebx)
 359:	84 c9                	test   %cl,%cl
 35b:	75 ed                	jne    34a <strcpy+0xd>
    ;
  return os;
}
 35d:	89 f0                	mov    %esi,%eax
 35f:	5b                   	pop    %ebx
 360:	5e                   	pop    %esi
 361:	5d                   	pop    %ebp
 362:	c3                   	ret    

00000363 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 363:	55                   	push   %ebp
 364:	89 e5                	mov    %esp,%ebp
 366:	8b 4d 08             	mov    0x8(%ebp),%ecx
 369:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 36c:	eb 06                	jmp    374 <strcmp+0x11>
    p++, q++;
 36e:	83 c1 01             	add    $0x1,%ecx
 371:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 374:	0f b6 01             	movzbl (%ecx),%eax
 377:	84 c0                	test   %al,%al
 379:	74 04                	je     37f <strcmp+0x1c>
 37b:	3a 02                	cmp    (%edx),%al
 37d:	74 ef                	je     36e <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 37f:	0f b6 c0             	movzbl %al,%eax
 382:	0f b6 12             	movzbl (%edx),%edx
 385:	29 d0                	sub    %edx,%eax
}
 387:	5d                   	pop    %ebp
 388:	c3                   	ret    

00000389 <strlen>:

uint
strlen(const char *s)
{
 389:	55                   	push   %ebp
 38a:	89 e5                	mov    %esp,%ebp
 38c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 38f:	b8 00 00 00 00       	mov    $0x0,%eax
 394:	eb 03                	jmp    399 <strlen+0x10>
 396:	83 c0 01             	add    $0x1,%eax
 399:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 39d:	75 f7                	jne    396 <strlen+0xd>
    ;
  return n;
}
 39f:	5d                   	pop    %ebp
 3a0:	c3                   	ret    

000003a1 <memset>:

void*
memset(void *dst, int c, uint n)
{
 3a1:	55                   	push   %ebp
 3a2:	89 e5                	mov    %esp,%ebp
 3a4:	57                   	push   %edi
 3a5:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 3a8:	89 d7                	mov    %edx,%edi
 3aa:	8b 4d 10             	mov    0x10(%ebp),%ecx
 3ad:	8b 45 0c             	mov    0xc(%ebp),%eax
 3b0:	fc                   	cld    
 3b1:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 3b3:	89 d0                	mov    %edx,%eax
 3b5:	8b 7d fc             	mov    -0x4(%ebp),%edi
 3b8:	c9                   	leave  
 3b9:	c3                   	ret    

000003ba <strchr>:

char*
strchr(const char *s, char c)
{
 3ba:	55                   	push   %ebp
 3bb:	89 e5                	mov    %esp,%ebp
 3bd:	8b 45 08             	mov    0x8(%ebp),%eax
 3c0:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 3c4:	eb 03                	jmp    3c9 <strchr+0xf>
 3c6:	83 c0 01             	add    $0x1,%eax
 3c9:	0f b6 10             	movzbl (%eax),%edx
 3cc:	84 d2                	test   %dl,%dl
 3ce:	74 06                	je     3d6 <strchr+0x1c>
    if(*s == c)
 3d0:	38 ca                	cmp    %cl,%dl
 3d2:	75 f2                	jne    3c6 <strchr+0xc>
 3d4:	eb 05                	jmp    3db <strchr+0x21>
      return (char*)s;
  return 0;
 3d6:	b8 00 00 00 00       	mov    $0x0,%eax
}
 3db:	5d                   	pop    %ebp
 3dc:	c3                   	ret    

000003dd <gets>:

char*
gets(char *buf, int max)
{
 3dd:	55                   	push   %ebp
 3de:	89 e5                	mov    %esp,%ebp
 3e0:	57                   	push   %edi
 3e1:	56                   	push   %esi
 3e2:	53                   	push   %ebx
 3e3:	83 ec 1c             	sub    $0x1c,%esp
 3e6:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 3e9:	bb 00 00 00 00       	mov    $0x0,%ebx
 3ee:	89 de                	mov    %ebx,%esi
 3f0:	83 c3 01             	add    $0x1,%ebx
 3f3:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 3f6:	7d 2e                	jge    426 <gets+0x49>
    cc = read(0, &c, 1);
 3f8:	83 ec 04             	sub    $0x4,%esp
 3fb:	6a 01                	push   $0x1
 3fd:	8d 45 e7             	lea    -0x19(%ebp),%eax
 400:	50                   	push   %eax
 401:	6a 00                	push   $0x0
 403:	e8 ec 00 00 00       	call   4f4 <read>
    if(cc < 1)
 408:	83 c4 10             	add    $0x10,%esp
 40b:	85 c0                	test   %eax,%eax
 40d:	7e 17                	jle    426 <gets+0x49>
      break;
    buf[i++] = c;
 40f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 413:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 416:	3c 0a                	cmp    $0xa,%al
 418:	0f 94 c2             	sete   %dl
 41b:	3c 0d                	cmp    $0xd,%al
 41d:	0f 94 c0             	sete   %al
 420:	08 c2                	or     %al,%dl
 422:	74 ca                	je     3ee <gets+0x11>
    buf[i++] = c;
 424:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 426:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 42a:	89 f8                	mov    %edi,%eax
 42c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 42f:	5b                   	pop    %ebx
 430:	5e                   	pop    %esi
 431:	5f                   	pop    %edi
 432:	5d                   	pop    %ebp
 433:	c3                   	ret    

00000434 <stat>:

int
stat(const char *n, struct stat *st)
{
 434:	55                   	push   %ebp
 435:	89 e5                	mov    %esp,%ebp
 437:	56                   	push   %esi
 438:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 439:	83 ec 08             	sub    $0x8,%esp
 43c:	6a 00                	push   $0x0
 43e:	ff 75 08             	push   0x8(%ebp)
 441:	e8 d6 00 00 00       	call   51c <open>
  if(fd < 0)
 446:	83 c4 10             	add    $0x10,%esp
 449:	85 c0                	test   %eax,%eax
 44b:	78 24                	js     471 <stat+0x3d>
 44d:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 44f:	83 ec 08             	sub    $0x8,%esp
 452:	ff 75 0c             	push   0xc(%ebp)
 455:	50                   	push   %eax
 456:	e8 d9 00 00 00       	call   534 <fstat>
 45b:	89 c6                	mov    %eax,%esi
  close(fd);
 45d:	89 1c 24             	mov    %ebx,(%esp)
 460:	e8 9f 00 00 00       	call   504 <close>
  return r;
 465:	83 c4 10             	add    $0x10,%esp
}
 468:	89 f0                	mov    %esi,%eax
 46a:	8d 65 f8             	lea    -0x8(%ebp),%esp
 46d:	5b                   	pop    %ebx
 46e:	5e                   	pop    %esi
 46f:	5d                   	pop    %ebp
 470:	c3                   	ret    
    return -1;
 471:	be ff ff ff ff       	mov    $0xffffffff,%esi
 476:	eb f0                	jmp    468 <stat+0x34>

00000478 <atoi>:

int
atoi(const char *s)
{
 478:	55                   	push   %ebp
 479:	89 e5                	mov    %esp,%ebp
 47b:	53                   	push   %ebx
 47c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 47f:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 484:	eb 10                	jmp    496 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 486:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 489:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 48c:	83 c1 01             	add    $0x1,%ecx
 48f:	0f be c0             	movsbl %al,%eax
 492:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 496:	0f b6 01             	movzbl (%ecx),%eax
 499:	8d 58 d0             	lea    -0x30(%eax),%ebx
 49c:	80 fb 09             	cmp    $0x9,%bl
 49f:	76 e5                	jbe    486 <atoi+0xe>
  return n;
}
 4a1:	89 d0                	mov    %edx,%eax
 4a3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4a6:	c9                   	leave  
 4a7:	c3                   	ret    

000004a8 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 4a8:	55                   	push   %ebp
 4a9:	89 e5                	mov    %esp,%ebp
 4ab:	56                   	push   %esi
 4ac:	53                   	push   %ebx
 4ad:	8b 75 08             	mov    0x8(%ebp),%esi
 4b0:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 4b3:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 4b6:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 4b8:	eb 0d                	jmp    4c7 <memmove+0x1f>
    *dst++ = *src++;
 4ba:	0f b6 01             	movzbl (%ecx),%eax
 4bd:	88 02                	mov    %al,(%edx)
 4bf:	8d 49 01             	lea    0x1(%ecx),%ecx
 4c2:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 4c5:	89 d8                	mov    %ebx,%eax
 4c7:	8d 58 ff             	lea    -0x1(%eax),%ebx
 4ca:	85 c0                	test   %eax,%eax
 4cc:	7f ec                	jg     4ba <memmove+0x12>
  return vdst;
}
 4ce:	89 f0                	mov    %esi,%eax
 4d0:	5b                   	pop    %ebx
 4d1:	5e                   	pop    %esi
 4d2:	5d                   	pop    %ebp
 4d3:	c3                   	ret    

000004d4 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4d4:	b8 01 00 00 00       	mov    $0x1,%eax
 4d9:	cd 40                	int    $0x40
 4db:	c3                   	ret    

000004dc <exit>:
SYSCALL(exit)
 4dc:	b8 02 00 00 00       	mov    $0x2,%eax
 4e1:	cd 40                	int    $0x40
 4e3:	c3                   	ret    

000004e4 <wait>:
SYSCALL(wait)
 4e4:	b8 03 00 00 00       	mov    $0x3,%eax
 4e9:	cd 40                	int    $0x40
 4eb:	c3                   	ret    

000004ec <pipe>:
SYSCALL(pipe)
 4ec:	b8 04 00 00 00       	mov    $0x4,%eax
 4f1:	cd 40                	int    $0x40
 4f3:	c3                   	ret    

000004f4 <read>:
SYSCALL(read)
 4f4:	b8 05 00 00 00       	mov    $0x5,%eax
 4f9:	cd 40                	int    $0x40
 4fb:	c3                   	ret    

000004fc <write>:
SYSCALL(write)
 4fc:	b8 10 00 00 00       	mov    $0x10,%eax
 501:	cd 40                	int    $0x40
 503:	c3                   	ret    

00000504 <close>:
SYSCALL(close)
 504:	b8 15 00 00 00       	mov    $0x15,%eax
 509:	cd 40                	int    $0x40
 50b:	c3                   	ret    

0000050c <kill>:
SYSCALL(kill)
 50c:	b8 06 00 00 00       	mov    $0x6,%eax
 511:	cd 40                	int    $0x40
 513:	c3                   	ret    

00000514 <exec>:
SYSCALL(exec)
 514:	b8 07 00 00 00       	mov    $0x7,%eax
 519:	cd 40                	int    $0x40
 51b:	c3                   	ret    

0000051c <open>:
SYSCALL(open)
 51c:	b8 0f 00 00 00       	mov    $0xf,%eax
 521:	cd 40                	int    $0x40
 523:	c3                   	ret    

00000524 <mknod>:
SYSCALL(mknod)
 524:	b8 11 00 00 00       	mov    $0x11,%eax
 529:	cd 40                	int    $0x40
 52b:	c3                   	ret    

0000052c <unlink>:
SYSCALL(unlink)
 52c:	b8 12 00 00 00       	mov    $0x12,%eax
 531:	cd 40                	int    $0x40
 533:	c3                   	ret    

00000534 <fstat>:
SYSCALL(fstat)
 534:	b8 08 00 00 00       	mov    $0x8,%eax
 539:	cd 40                	int    $0x40
 53b:	c3                   	ret    

0000053c <link>:
SYSCALL(link)
 53c:	b8 13 00 00 00       	mov    $0x13,%eax
 541:	cd 40                	int    $0x40
 543:	c3                   	ret    

00000544 <mkdir>:
SYSCALL(mkdir)
 544:	b8 14 00 00 00       	mov    $0x14,%eax
 549:	cd 40                	int    $0x40
 54b:	c3                   	ret    

0000054c <chdir>:
SYSCALL(chdir)
 54c:	b8 09 00 00 00       	mov    $0x9,%eax
 551:	cd 40                	int    $0x40
 553:	c3                   	ret    

00000554 <dup>:
SYSCALL(dup)
 554:	b8 0a 00 00 00       	mov    $0xa,%eax
 559:	cd 40                	int    $0x40
 55b:	c3                   	ret    

0000055c <getpid>:
SYSCALL(getpid)
 55c:	b8 0b 00 00 00       	mov    $0xb,%eax
 561:	cd 40                	int    $0x40
 563:	c3                   	ret    

00000564 <sbrk>:
SYSCALL(sbrk)
 564:	b8 0c 00 00 00       	mov    $0xc,%eax
 569:	cd 40                	int    $0x40
 56b:	c3                   	ret    

0000056c <sleep>:
SYSCALL(sleep)
 56c:	b8 0d 00 00 00       	mov    $0xd,%eax
 571:	cd 40                	int    $0x40
 573:	c3                   	ret    

00000574 <uptime>:
SYSCALL(uptime)
 574:	b8 0e 00 00 00       	mov    $0xe,%eax
 579:	cd 40                	int    $0x40
 57b:	c3                   	ret    

0000057c <clone>:
SYSCALL(clone)
 57c:	b8 16 00 00 00       	mov    $0x16,%eax
 581:	cd 40                	int    $0x40
 583:	c3                   	ret    

00000584 <join>:
 584:	b8 17 00 00 00       	mov    $0x17,%eax
 589:	cd 40                	int    $0x40
 58b:	c3                   	ret    

0000058c <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 58c:	55                   	push   %ebp
 58d:	89 e5                	mov    %esp,%ebp
 58f:	83 ec 1c             	sub    $0x1c,%esp
 592:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 595:	6a 01                	push   $0x1
 597:	8d 55 f4             	lea    -0xc(%ebp),%edx
 59a:	52                   	push   %edx
 59b:	50                   	push   %eax
 59c:	e8 5b ff ff ff       	call   4fc <write>
}
 5a1:	83 c4 10             	add    $0x10,%esp
 5a4:	c9                   	leave  
 5a5:	c3                   	ret    

000005a6 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 5a6:	55                   	push   %ebp
 5a7:	89 e5                	mov    %esp,%ebp
 5a9:	57                   	push   %edi
 5aa:	56                   	push   %esi
 5ab:	53                   	push   %ebx
 5ac:	83 ec 2c             	sub    $0x2c,%esp
 5af:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5b2:	89 d0                	mov    %edx,%eax
 5b4:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 5b6:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 5ba:	0f 95 c1             	setne  %cl
 5bd:	c1 ea 1f             	shr    $0x1f,%edx
 5c0:	84 d1                	test   %dl,%cl
 5c2:	74 44                	je     608 <printint+0x62>
    neg = 1;
    x = -xx;
 5c4:	f7 d8                	neg    %eax
 5c6:	89 c1                	mov    %eax,%ecx
    neg = 1;
 5c8:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 5cf:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 5d4:	89 c8                	mov    %ecx,%eax
 5d6:	ba 00 00 00 00       	mov    $0x0,%edx
 5db:	f7 f6                	div    %esi
 5dd:	89 df                	mov    %ebx,%edi
 5df:	83 c3 01             	add    $0x1,%ebx
 5e2:	0f b6 92 d0 09 00 00 	movzbl 0x9d0(%edx),%edx
 5e9:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 5ed:	89 ca                	mov    %ecx,%edx
 5ef:	89 c1                	mov    %eax,%ecx
 5f1:	39 d6                	cmp    %edx,%esi
 5f3:	76 df                	jbe    5d4 <printint+0x2e>
  if(neg)
 5f5:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 5f9:	74 31                	je     62c <printint+0x86>
    buf[i++] = '-';
 5fb:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 600:	8d 5f 02             	lea    0x2(%edi),%ebx
 603:	8b 75 d0             	mov    -0x30(%ebp),%esi
 606:	eb 17                	jmp    61f <printint+0x79>
    x = xx;
 608:	89 c1                	mov    %eax,%ecx
  neg = 0;
 60a:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 611:	eb bc                	jmp    5cf <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 613:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 618:	89 f0                	mov    %esi,%eax
 61a:	e8 6d ff ff ff       	call   58c <putc>
  while(--i >= 0)
 61f:	83 eb 01             	sub    $0x1,%ebx
 622:	79 ef                	jns    613 <printint+0x6d>
}
 624:	83 c4 2c             	add    $0x2c,%esp
 627:	5b                   	pop    %ebx
 628:	5e                   	pop    %esi
 629:	5f                   	pop    %edi
 62a:	5d                   	pop    %ebp
 62b:	c3                   	ret    
 62c:	8b 75 d0             	mov    -0x30(%ebp),%esi
 62f:	eb ee                	jmp    61f <printint+0x79>

00000631 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 631:	55                   	push   %ebp
 632:	89 e5                	mov    %esp,%ebp
 634:	57                   	push   %edi
 635:	56                   	push   %esi
 636:	53                   	push   %ebx
 637:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 63a:	8d 45 10             	lea    0x10(%ebp),%eax
 63d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 640:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 645:	bb 00 00 00 00       	mov    $0x0,%ebx
 64a:	eb 14                	jmp    660 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 64c:	89 fa                	mov    %edi,%edx
 64e:	8b 45 08             	mov    0x8(%ebp),%eax
 651:	e8 36 ff ff ff       	call   58c <putc>
 656:	eb 05                	jmp    65d <printf+0x2c>
      }
    } else if(state == '%'){
 658:	83 fe 25             	cmp    $0x25,%esi
 65b:	74 25                	je     682 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 65d:	83 c3 01             	add    $0x1,%ebx
 660:	8b 45 0c             	mov    0xc(%ebp),%eax
 663:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 667:	84 c0                	test   %al,%al
 669:	0f 84 20 01 00 00    	je     78f <printf+0x15e>
    c = fmt[i] & 0xff;
 66f:	0f be f8             	movsbl %al,%edi
 672:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 675:	85 f6                	test   %esi,%esi
 677:	75 df                	jne    658 <printf+0x27>
      if(c == '%'){
 679:	83 f8 25             	cmp    $0x25,%eax
 67c:	75 ce                	jne    64c <printf+0x1b>
        state = '%';
 67e:	89 c6                	mov    %eax,%esi
 680:	eb db                	jmp    65d <printf+0x2c>
      if(c == 'd'){
 682:	83 f8 25             	cmp    $0x25,%eax
 685:	0f 84 cf 00 00 00    	je     75a <printf+0x129>
 68b:	0f 8c dd 00 00 00    	jl     76e <printf+0x13d>
 691:	83 f8 78             	cmp    $0x78,%eax
 694:	0f 8f d4 00 00 00    	jg     76e <printf+0x13d>
 69a:	83 f8 63             	cmp    $0x63,%eax
 69d:	0f 8c cb 00 00 00    	jl     76e <printf+0x13d>
 6a3:	83 e8 63             	sub    $0x63,%eax
 6a6:	83 f8 15             	cmp    $0x15,%eax
 6a9:	0f 87 bf 00 00 00    	ja     76e <printf+0x13d>
 6af:	ff 24 85 78 09 00 00 	jmp    *0x978(,%eax,4)
        printint(fd, *ap, 10, 1);
 6b6:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6b9:	8b 17                	mov    (%edi),%edx
 6bb:	83 ec 0c             	sub    $0xc,%esp
 6be:	6a 01                	push   $0x1
 6c0:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6c5:	8b 45 08             	mov    0x8(%ebp),%eax
 6c8:	e8 d9 fe ff ff       	call   5a6 <printint>
        ap++;
 6cd:	83 c7 04             	add    $0x4,%edi
 6d0:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 6d3:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 6d6:	be 00 00 00 00       	mov    $0x0,%esi
 6db:	eb 80                	jmp    65d <printf+0x2c>
        printint(fd, *ap, 16, 0);
 6dd:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6e0:	8b 17                	mov    (%edi),%edx
 6e2:	83 ec 0c             	sub    $0xc,%esp
 6e5:	6a 00                	push   $0x0
 6e7:	b9 10 00 00 00       	mov    $0x10,%ecx
 6ec:	8b 45 08             	mov    0x8(%ebp),%eax
 6ef:	e8 b2 fe ff ff       	call   5a6 <printint>
        ap++;
 6f4:	83 c7 04             	add    $0x4,%edi
 6f7:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 6fa:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6fd:	be 00 00 00 00       	mov    $0x0,%esi
 702:	e9 56 ff ff ff       	jmp    65d <printf+0x2c>
        s = (char*)*ap;
 707:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 70a:	8b 30                	mov    (%eax),%esi
        ap++;
 70c:	83 c0 04             	add    $0x4,%eax
 70f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 712:	85 f6                	test   %esi,%esi
 714:	75 15                	jne    72b <printf+0xfa>
          s = "(null)";
 716:	be 6f 09 00 00       	mov    $0x96f,%esi
 71b:	eb 0e                	jmp    72b <printf+0xfa>
          putc(fd, *s);
 71d:	0f be d2             	movsbl %dl,%edx
 720:	8b 45 08             	mov    0x8(%ebp),%eax
 723:	e8 64 fe ff ff       	call   58c <putc>
          s++;
 728:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 72b:	0f b6 16             	movzbl (%esi),%edx
 72e:	84 d2                	test   %dl,%dl
 730:	75 eb                	jne    71d <printf+0xec>
      state = 0;
 732:	be 00 00 00 00       	mov    $0x0,%esi
 737:	e9 21 ff ff ff       	jmp    65d <printf+0x2c>
        putc(fd, *ap);
 73c:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 73f:	0f be 17             	movsbl (%edi),%edx
 742:	8b 45 08             	mov    0x8(%ebp),%eax
 745:	e8 42 fe ff ff       	call   58c <putc>
        ap++;
 74a:	83 c7 04             	add    $0x4,%edi
 74d:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 750:	be 00 00 00 00       	mov    $0x0,%esi
 755:	e9 03 ff ff ff       	jmp    65d <printf+0x2c>
        putc(fd, c);
 75a:	89 fa                	mov    %edi,%edx
 75c:	8b 45 08             	mov    0x8(%ebp),%eax
 75f:	e8 28 fe ff ff       	call   58c <putc>
      state = 0;
 764:	be 00 00 00 00       	mov    $0x0,%esi
 769:	e9 ef fe ff ff       	jmp    65d <printf+0x2c>
        putc(fd, '%');
 76e:	ba 25 00 00 00       	mov    $0x25,%edx
 773:	8b 45 08             	mov    0x8(%ebp),%eax
 776:	e8 11 fe ff ff       	call   58c <putc>
        putc(fd, c);
 77b:	89 fa                	mov    %edi,%edx
 77d:	8b 45 08             	mov    0x8(%ebp),%eax
 780:	e8 07 fe ff ff       	call   58c <putc>
      state = 0;
 785:	be 00 00 00 00       	mov    $0x0,%esi
 78a:	e9 ce fe ff ff       	jmp    65d <printf+0x2c>
    }
  }
}
 78f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 792:	5b                   	pop    %ebx
 793:	5e                   	pop    %esi
 794:	5f                   	pop    %edi
 795:	5d                   	pop    %ebp
 796:	c3                   	ret    

00000797 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 797:	55                   	push   %ebp
 798:	89 e5                	mov    %esp,%ebp
 79a:	57                   	push   %edi
 79b:	56                   	push   %esi
 79c:	53                   	push   %ebx
 79d:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7a0:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7a3:	a1 6c 0d 00 00       	mov    0xd6c,%eax
 7a8:	eb 02                	jmp    7ac <free+0x15>
 7aa:	89 d0                	mov    %edx,%eax
 7ac:	39 c8                	cmp    %ecx,%eax
 7ae:	73 04                	jae    7b4 <free+0x1d>
 7b0:	39 08                	cmp    %ecx,(%eax)
 7b2:	77 12                	ja     7c6 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7b4:	8b 10                	mov    (%eax),%edx
 7b6:	39 c2                	cmp    %eax,%edx
 7b8:	77 f0                	ja     7aa <free+0x13>
 7ba:	39 c8                	cmp    %ecx,%eax
 7bc:	72 08                	jb     7c6 <free+0x2f>
 7be:	39 ca                	cmp    %ecx,%edx
 7c0:	77 04                	ja     7c6 <free+0x2f>
 7c2:	89 d0                	mov    %edx,%eax
 7c4:	eb e6                	jmp    7ac <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7c6:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7c9:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7cc:	8b 10                	mov    (%eax),%edx
 7ce:	39 d7                	cmp    %edx,%edi
 7d0:	74 19                	je     7eb <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 7d2:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7d5:	8b 50 04             	mov    0x4(%eax),%edx
 7d8:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7db:	39 ce                	cmp    %ecx,%esi
 7dd:	74 1b                	je     7fa <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 7df:	89 08                	mov    %ecx,(%eax)
  freep = p;
 7e1:	a3 6c 0d 00 00       	mov    %eax,0xd6c
}
 7e6:	5b                   	pop    %ebx
 7e7:	5e                   	pop    %esi
 7e8:	5f                   	pop    %edi
 7e9:	5d                   	pop    %ebp
 7ea:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 7eb:	03 72 04             	add    0x4(%edx),%esi
 7ee:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7f1:	8b 10                	mov    (%eax),%edx
 7f3:	8b 12                	mov    (%edx),%edx
 7f5:	89 53 f8             	mov    %edx,-0x8(%ebx)
 7f8:	eb db                	jmp    7d5 <free+0x3e>
    p->s.size += bp->s.size;
 7fa:	03 53 fc             	add    -0x4(%ebx),%edx
 7fd:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 800:	8b 53 f8             	mov    -0x8(%ebx),%edx
 803:	89 10                	mov    %edx,(%eax)
 805:	eb da                	jmp    7e1 <free+0x4a>

00000807 <morecore>:

static Header*
morecore(uint nu)
{
 807:	55                   	push   %ebp
 808:	89 e5                	mov    %esp,%ebp
 80a:	53                   	push   %ebx
 80b:	83 ec 04             	sub    $0x4,%esp
 80e:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 810:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 815:	77 05                	ja     81c <morecore+0x15>
    nu = 4096;
 817:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 81c:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 823:	83 ec 0c             	sub    $0xc,%esp
 826:	50                   	push   %eax
 827:	e8 38 fd ff ff       	call   564 <sbrk>
  if(p == (char*)-1)
 82c:	83 c4 10             	add    $0x10,%esp
 82f:	83 f8 ff             	cmp    $0xffffffff,%eax
 832:	74 1c                	je     850 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 834:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 837:	83 c0 08             	add    $0x8,%eax
 83a:	83 ec 0c             	sub    $0xc,%esp
 83d:	50                   	push   %eax
 83e:	e8 54 ff ff ff       	call   797 <free>
  return freep;
 843:	a1 6c 0d 00 00       	mov    0xd6c,%eax
 848:	83 c4 10             	add    $0x10,%esp
}
 84b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 84e:	c9                   	leave  
 84f:	c3                   	ret    
    return 0;
 850:	b8 00 00 00 00       	mov    $0x0,%eax
 855:	eb f4                	jmp    84b <morecore+0x44>

00000857 <malloc>:

void*
malloc(uint nbytes)
{
 857:	55                   	push   %ebp
 858:	89 e5                	mov    %esp,%ebp
 85a:	53                   	push   %ebx
 85b:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 85e:	8b 45 08             	mov    0x8(%ebp),%eax
 861:	8d 58 07             	lea    0x7(%eax),%ebx
 864:	c1 eb 03             	shr    $0x3,%ebx
 867:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 86a:	8b 0d 6c 0d 00 00    	mov    0xd6c,%ecx
 870:	85 c9                	test   %ecx,%ecx
 872:	74 04                	je     878 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 874:	8b 01                	mov    (%ecx),%eax
 876:	eb 4a                	jmp    8c2 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 878:	c7 05 6c 0d 00 00 70 	movl   $0xd70,0xd6c
 87f:	0d 00 00 
 882:	c7 05 70 0d 00 00 70 	movl   $0xd70,0xd70
 889:	0d 00 00 
    base.s.size = 0;
 88c:	c7 05 74 0d 00 00 00 	movl   $0x0,0xd74
 893:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 896:	b9 70 0d 00 00       	mov    $0xd70,%ecx
 89b:	eb d7                	jmp    874 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 89d:	74 19                	je     8b8 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 89f:	29 da                	sub    %ebx,%edx
 8a1:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8a4:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 8a7:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 8aa:	89 0d 6c 0d 00 00    	mov    %ecx,0xd6c
      return (void*)(p + 1);
 8b0:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 8b3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8b6:	c9                   	leave  
 8b7:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 8b8:	8b 10                	mov    (%eax),%edx
 8ba:	89 11                	mov    %edx,(%ecx)
 8bc:	eb ec                	jmp    8aa <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8be:	89 c1                	mov    %eax,%ecx
 8c0:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 8c2:	8b 50 04             	mov    0x4(%eax),%edx
 8c5:	39 da                	cmp    %ebx,%edx
 8c7:	73 d4                	jae    89d <malloc+0x46>
    if(p == freep)
 8c9:	39 05 6c 0d 00 00    	cmp    %eax,0xd6c
 8cf:	75 ed                	jne    8be <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 8d1:	89 d8                	mov    %ebx,%eax
 8d3:	e8 2f ff ff ff       	call   807 <morecore>
 8d8:	85 c0                	test   %eax,%eax
 8da:	75 e2                	jne    8be <malloc+0x67>
 8dc:	eb d5                	jmp    8b3 <malloc+0x5c>
