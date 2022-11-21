
_test_5:     file format elf32-i386


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
   int tmp1 = *(int*)arg1;
   int tmp2 = *(int*)arg2;
   6:	8b 45 0c             	mov    0xc(%ebp),%eax
   9:	8b 10                	mov    (%eax),%edx
   assert(tmp1 == 42);
   b:	8b 45 08             	mov    0x8(%ebp),%eax
   e:	83 38 2a             	cmpl   $0x2a,(%eax)
  11:	75 60                	jne    73 <worker+0x73>
   assert(tmp2 == 24);
  13:	83 fa 18             	cmp    $0x18,%edx
  16:	0f 85 a0 00 00 00    	jne    bc <worker+0xbc>
   assert(global == 1);
  1c:	a1 f4 0d 00 00       	mov    0xdf4,%eax
  21:	83 f8 01             	cmp    $0x1,%eax
  24:	0f 84 db 00 00 00    	je     105 <worker+0x105>
  2a:	6a 38                	push   $0x38
  2c:	68 60 09 00 00       	push   $0x960
  31:	68 69 09 00 00       	push   $0x969
  36:	6a 01                	push   $0x1
  38:	e8 74 06 00 00       	call   6b1 <printf>
  3d:	83 c4 0c             	add    $0xc,%esp
  40:	68 a8 09 00 00       	push   $0x9a8
  45:	68 7c 09 00 00       	push   $0x97c
  4a:	6a 01                	push   $0x1
  4c:	e8 60 06 00 00       	call   6b1 <printf>
  51:	83 c4 08             	add    $0x8,%esp
  54:	68 90 09 00 00       	push   $0x990
  59:	6a 01                	push   $0x1
  5b:	e8 51 06 00 00       	call   6b1 <printf>
  60:	83 c4 04             	add    $0x4,%esp
  63:	ff 35 f8 0d 00 00    	push   0xdf8
  69:	e8 1e 05 00 00       	call   58c <kill>
  6e:	e8 e9 04 00 00       	call   55c <exit>
   assert(tmp1 == 42);
  73:	6a 36                	push   $0x36
  75:	68 60 09 00 00       	push   $0x960
  7a:	68 69 09 00 00       	push   $0x969
  7f:	6a 01                	push   $0x1
  81:	e8 2b 06 00 00       	call   6b1 <printf>
  86:	83 c4 0c             	add    $0xc,%esp
  89:	68 71 09 00 00       	push   $0x971
  8e:	68 7c 09 00 00       	push   $0x97c
  93:	6a 01                	push   $0x1
  95:	e8 17 06 00 00       	call   6b1 <printf>
  9a:	83 c4 08             	add    $0x8,%esp
  9d:	68 90 09 00 00       	push   $0x990
  a2:	6a 01                	push   $0x1
  a4:	e8 08 06 00 00       	call   6b1 <printf>
  a9:	83 c4 04             	add    $0x4,%esp
  ac:	ff 35 f8 0d 00 00    	push   0xdf8
  b2:	e8 d5 04 00 00       	call   58c <kill>
  b7:	e8 a0 04 00 00       	call   55c <exit>
   assert(tmp2 == 24);
  bc:	6a 37                	push   $0x37
  be:	68 60 09 00 00       	push   $0x960
  c3:	68 69 09 00 00       	push   $0x969
  c8:	6a 01                	push   $0x1
  ca:	e8 e2 05 00 00       	call   6b1 <printf>
  cf:	83 c4 0c             	add    $0xc,%esp
  d2:	68 9d 09 00 00       	push   $0x99d
  d7:	68 7c 09 00 00       	push   $0x97c
  dc:	6a 01                	push   $0x1
  de:	e8 ce 05 00 00       	call   6b1 <printf>
  e3:	83 c4 08             	add    $0x8,%esp
  e6:	68 90 09 00 00       	push   $0x990
  eb:	6a 01                	push   $0x1
  ed:	e8 bf 05 00 00       	call   6b1 <printf>
  f2:	83 c4 04             	add    $0x4,%esp
  f5:	ff 35 f8 0d 00 00    	push   0xdf8
  fb:	e8 8c 04 00 00       	call   58c <kill>
 100:	e8 57 04 00 00       	call   55c <exit>
   global++;
 105:	83 c0 01             	add    $0x1,%eax
 108:	a3 f4 0d 00 00       	mov    %eax,0xdf4
   exit();
 10d:	e8 4a 04 00 00       	call   55c <exit>

00000112 <main>:
{
 112:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 116:	83 e4 f0             	and    $0xfffffff0,%esp
 119:	ff 71 fc             	push   -0x4(%ecx)
 11c:	55                   	push   %ebp
 11d:	89 e5                	mov    %esp,%ebp
 11f:	57                   	push   %edi
 120:	56                   	push   %esi
 121:	53                   	push   %ebx
 122:	51                   	push   %ecx
 123:	83 ec 18             	sub    $0x18,%esp
   ppid = getpid();
 126:	e8 b1 04 00 00       	call   5dc <getpid>
 12b:	a3 f8 0d 00 00       	mov    %eax,0xdf8
   void *stack, *p = malloc(PGSIZE * 2);
 130:	83 ec 0c             	sub    $0xc,%esp
 133:	68 00 20 00 00       	push   $0x2000
 138:	e8 9a 07 00 00       	call   8d7 <malloc>
   assert(p != NULL);
 13d:	83 c4 10             	add    $0x10,%esp
 140:	85 c0                	test   %eax,%eax
 142:	74 14                	je     158 <main+0x46>
 144:	89 c3                	mov    %eax,%ebx
   if((uint)p % PGSIZE)
 146:	25 ff 0f 00 00       	and    $0xfff,%eax
 14b:	74 54                	je     1a1 <main+0x8f>
     stack = p + (PGSIZE - (uint)p % PGSIZE);
 14d:	bf 00 10 00 00       	mov    $0x1000,%edi
 152:	29 c7                	sub    %eax,%edi
 154:	01 df                	add    %ebx,%edi
 156:	eb 4b                	jmp    1a3 <main+0x91>
   assert(p != NULL);
 158:	6a 1d                	push   $0x1d
 15a:	68 60 09 00 00       	push   $0x960
 15f:	68 69 09 00 00       	push   $0x969
 164:	6a 01                	push   $0x1
 166:	e8 46 05 00 00       	call   6b1 <printf>
 16b:	83 c4 0c             	add    $0xc,%esp
 16e:	68 b4 09 00 00       	push   $0x9b4
 173:	68 7c 09 00 00       	push   $0x97c
 178:	6a 01                	push   $0x1
 17a:	e8 32 05 00 00       	call   6b1 <printf>
 17f:	83 c4 08             	add    $0x8,%esp
 182:	68 90 09 00 00       	push   $0x990
 187:	6a 01                	push   $0x1
 189:	e8 23 05 00 00       	call   6b1 <printf>
 18e:	83 c4 04             	add    $0x4,%esp
 191:	ff 35 f8 0d 00 00    	push   0xdf8
 197:	e8 f0 03 00 00       	call   58c <kill>
 19c:	e8 bb 03 00 00       	call   55c <exit>
     stack = p;
 1a1:	89 df                	mov    %ebx,%edi
   int arg1 = 42, arg2 = 24;
 1a3:	c7 45 e4 2a 00 00 00 	movl   $0x2a,-0x1c(%ebp)
 1aa:	c7 45 e0 18 00 00 00 	movl   $0x18,-0x20(%ebp)
   int clone_pid = clone(worker, &arg1, &arg2, stack);
 1b1:	57                   	push   %edi
 1b2:	8d 45 e0             	lea    -0x20(%ebp),%eax
 1b5:	50                   	push   %eax
 1b6:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 1b9:	50                   	push   %eax
 1ba:	68 00 00 00 00       	push   $0x0
 1bf:	e8 38 04 00 00       	call   5fc <clone>
 1c4:	89 c6                	mov    %eax,%esi
   assert(clone_pid > 0);
 1c6:	83 c4 10             	add    $0x10,%esp
 1c9:	85 c0                	test   %eax,%eax
 1cb:	7e 69                	jle    236 <main+0x124>
   int join_pid = join(&join_stack);
 1cd:	83 ec 0c             	sub    $0xc,%esp
 1d0:	8d 45 dc             	lea    -0x24(%ebp),%eax
 1d3:	50                   	push   %eax
 1d4:	e8 2b 04 00 00       	call   604 <join>
   assert(join_pid == clone_pid);
 1d9:	83 c4 10             	add    $0x10,%esp
 1dc:	39 c6                	cmp    %eax,%esi
 1de:	0f 85 9b 00 00 00    	jne    27f <main+0x16d>
   assert(stack == join_stack);
 1e4:	39 7d dc             	cmp    %edi,-0x24(%ebp)
 1e7:	0f 84 db 00 00 00    	je     2c8 <main+0x1b6>
 1ed:	6a 2a                	push   $0x2a
 1ef:	68 60 09 00 00       	push   $0x960
 1f4:	68 69 09 00 00       	push   $0x969
 1f9:	6a 01                	push   $0x1
 1fb:	e8 b1 04 00 00       	call   6b1 <printf>
 200:	83 c4 0c             	add    $0xc,%esp
 203:	68 e2 09 00 00       	push   $0x9e2
 208:	68 7c 09 00 00       	push   $0x97c
 20d:	6a 01                	push   $0x1
 20f:	e8 9d 04 00 00       	call   6b1 <printf>
 214:	83 c4 08             	add    $0x8,%esp
 217:	68 90 09 00 00       	push   $0x990
 21c:	6a 01                	push   $0x1
 21e:	e8 8e 04 00 00       	call   6b1 <printf>
 223:	83 c4 04             	add    $0x4,%esp
 226:	ff 35 f8 0d 00 00    	push   0xdf8
 22c:	e8 5b 03 00 00       	call   58c <kill>
 231:	e8 26 03 00 00       	call   55c <exit>
   assert(clone_pid > 0);
 236:	6a 25                	push   $0x25
 238:	68 60 09 00 00       	push   $0x960
 23d:	68 69 09 00 00       	push   $0x969
 242:	6a 01                	push   $0x1
 244:	e8 68 04 00 00       	call   6b1 <printf>
 249:	83 c4 0c             	add    $0xc,%esp
 24c:	68 be 09 00 00       	push   $0x9be
 251:	68 7c 09 00 00       	push   $0x97c
 256:	6a 01                	push   $0x1
 258:	e8 54 04 00 00       	call   6b1 <printf>
 25d:	83 c4 08             	add    $0x8,%esp
 260:	68 90 09 00 00       	push   $0x990
 265:	6a 01                	push   $0x1
 267:	e8 45 04 00 00       	call   6b1 <printf>
 26c:	83 c4 04             	add    $0x4,%esp
 26f:	ff 35 f8 0d 00 00    	push   0xdf8
 275:	e8 12 03 00 00       	call   58c <kill>
 27a:	e8 dd 02 00 00       	call   55c <exit>
   assert(join_pid == clone_pid);
 27f:	6a 29                	push   $0x29
 281:	68 60 09 00 00       	push   $0x960
 286:	68 69 09 00 00       	push   $0x969
 28b:	6a 01                	push   $0x1
 28d:	e8 1f 04 00 00       	call   6b1 <printf>
 292:	83 c4 0c             	add    $0xc,%esp
 295:	68 cc 09 00 00       	push   $0x9cc
 29a:	68 7c 09 00 00       	push   $0x97c
 29f:	6a 01                	push   $0x1
 2a1:	e8 0b 04 00 00       	call   6b1 <printf>
 2a6:	83 c4 08             	add    $0x8,%esp
 2a9:	68 90 09 00 00       	push   $0x990
 2ae:	6a 01                	push   $0x1
 2b0:	e8 fc 03 00 00       	call   6b1 <printf>
 2b5:	83 c4 04             	add    $0x4,%esp
 2b8:	ff 35 f8 0d 00 00    	push   0xdf8
 2be:	e8 c9 02 00 00       	call   58c <kill>
 2c3:	e8 94 02 00 00       	call   55c <exit>
   assert(global == 2);
 2c8:	83 3d f4 0d 00 00 02 	cmpl   $0x2,0xdf4
 2cf:	74 49                	je     31a <main+0x208>
 2d1:	6a 2b                	push   $0x2b
 2d3:	68 60 09 00 00       	push   $0x960
 2d8:	68 69 09 00 00       	push   $0x969
 2dd:	6a 01                	push   $0x1
 2df:	e8 cd 03 00 00       	call   6b1 <printf>
 2e4:	83 c4 0c             	add    $0xc,%esp
 2e7:	68 f6 09 00 00       	push   $0x9f6
 2ec:	68 7c 09 00 00       	push   $0x97c
 2f1:	6a 01                	push   $0x1
 2f3:	e8 b9 03 00 00       	call   6b1 <printf>
 2f8:	83 c4 08             	add    $0x8,%esp
 2fb:	68 90 09 00 00       	push   $0x990
 300:	6a 01                	push   $0x1
 302:	e8 aa 03 00 00       	call   6b1 <printf>
 307:	83 c4 04             	add    $0x4,%esp
 30a:	ff 35 f8 0d 00 00    	push   0xdf8
 310:	e8 77 02 00 00       	call   58c <kill>
 315:	e8 42 02 00 00       	call   55c <exit>
   printf(1, "TEST PASSED\n");
 31a:	83 ec 08             	sub    $0x8,%esp
 31d:	68 02 0a 00 00       	push   $0xa02
 322:	6a 01                	push   $0x1
 324:	e8 88 03 00 00       	call   6b1 <printf>
   free(p);
 329:	89 1c 24             	mov    %ebx,(%esp)
 32c:	e8 e6 04 00 00       	call   817 <free>
   exit();
 331:	e8 26 02 00 00       	call   55c <exit>

00000336 <test_and_set>:
#include "fcntl.h"
#include "user.h"
#include "x86.h"
#include "mmu.h"

int test_and_set(int *old_ptr, int new_ptr) {
 336:	55                   	push   %ebp
 337:	89 e5                	mov    %esp,%ebp
 339:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *old_ptr;
 33c:	8b 10                	mov    (%eax),%edx
  *old_ptr = new_ptr;
 33e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 341:	89 08                	mov    %ecx,(%eax)
  return old;
}
 343:	89 d0                	mov    %edx,%eax
 345:	5d                   	pop    %ebp
 346:	c3                   	ret    

00000347 <thread_create>:

// a wrapper func for clone
int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 347:	55                   	push   %ebp
 348:	89 e5                	mov    %esp,%ebp
 34a:	83 ec 14             	sub    $0x14,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE);
 34d:	68 00 10 00 00       	push   $0x1000
 352:	e8 80 05 00 00       	call   8d7 <malloc>
  if(n_stack == 0){
 357:	83 c4 10             	add    $0x10,%esp
 35a:	85 c0                	test   %eax,%eax
 35c:	74 14                	je     372 <thread_create+0x2b>
    return -1;
  }
  int new_pid = clone(start_routine, arg1, arg2, n_stack); // TODO: is this the right way to call it?
 35e:	50                   	push   %eax
 35f:	ff 75 10             	push   0x10(%ebp)
 362:	ff 75 0c             	push   0xc(%ebp)
 365:	ff 75 08             	push   0x8(%ebp)
 368:	e8 8f 02 00 00       	call   5fc <clone>


  // I can't remember if there was something else to do here but I'm sure I'll find out


  return new_pid;
 36d:	83 c4 10             	add    $0x10,%esp
}
 370:	c9                   	leave  
 371:	c3                   	ret    
    return -1;
 372:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 377:	eb f7                	jmp    370 <thread_create+0x29>

00000379 <thread_join>:

int thread_join() {
  return 0;
}
 379:	b8 00 00 00 00       	mov    $0x0,%eax
 37e:	c3                   	ret    

0000037f <lock_acquire>:

void lock_acquire(lock_t *lock){
 37f:	55                   	push   %ebp
 380:	89 e5                	mov    %esp,%ebp
 382:	53                   	push   %ebx
 383:	83 ec 04             	sub    $0x4,%esp
 386:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 389:	83 ec 08             	sub    $0x8,%esp
 38c:	6a 01                	push   $0x1
 38e:	53                   	push   %ebx
 38f:	e8 a2 ff ff ff       	call   336 <test_and_set>
 394:	83 c4 10             	add    $0x10,%esp
 397:	83 f8 01             	cmp    $0x1,%eax
 39a:	74 ed                	je     389 <lock_acquire+0xa>
    ;
}
 39c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 39f:	c9                   	leave  
 3a0:	c3                   	ret    

000003a1 <lock_release>:

void lock_release(lock_t *lock) {
 3a1:	55                   	push   %ebp
 3a2:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 3a4:	8b 45 08             	mov    0x8(%ebp),%eax
 3a7:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 3ad:	5d                   	pop    %ebp
 3ae:	c3                   	ret    

000003af <lock_init>:

void lock_init(lock_t *lock) {
 3af:	55                   	push   %ebp
 3b0:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 3b2:	8b 45 08             	mov    0x8(%ebp),%eax
 3b5:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 3bb:	5d                   	pop    %ebp
 3bc:	c3                   	ret    

000003bd <strcpy>:

char*
strcpy(char *s, const char *t)
{
 3bd:	55                   	push   %ebp
 3be:	89 e5                	mov    %esp,%ebp
 3c0:	56                   	push   %esi
 3c1:	53                   	push   %ebx
 3c2:	8b 75 08             	mov    0x8(%ebp),%esi
 3c5:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 3c8:	89 f0                	mov    %esi,%eax
 3ca:	89 d1                	mov    %edx,%ecx
 3cc:	83 c2 01             	add    $0x1,%edx
 3cf:	89 c3                	mov    %eax,%ebx
 3d1:	83 c0 01             	add    $0x1,%eax
 3d4:	0f b6 09             	movzbl (%ecx),%ecx
 3d7:	88 0b                	mov    %cl,(%ebx)
 3d9:	84 c9                	test   %cl,%cl
 3db:	75 ed                	jne    3ca <strcpy+0xd>
    ;
  return os;
}
 3dd:	89 f0                	mov    %esi,%eax
 3df:	5b                   	pop    %ebx
 3e0:	5e                   	pop    %esi
 3e1:	5d                   	pop    %ebp
 3e2:	c3                   	ret    

000003e3 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 3e3:	55                   	push   %ebp
 3e4:	89 e5                	mov    %esp,%ebp
 3e6:	8b 4d 08             	mov    0x8(%ebp),%ecx
 3e9:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 3ec:	eb 06                	jmp    3f4 <strcmp+0x11>
    p++, q++;
 3ee:	83 c1 01             	add    $0x1,%ecx
 3f1:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 3f4:	0f b6 01             	movzbl (%ecx),%eax
 3f7:	84 c0                	test   %al,%al
 3f9:	74 04                	je     3ff <strcmp+0x1c>
 3fb:	3a 02                	cmp    (%edx),%al
 3fd:	74 ef                	je     3ee <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 3ff:	0f b6 c0             	movzbl %al,%eax
 402:	0f b6 12             	movzbl (%edx),%edx
 405:	29 d0                	sub    %edx,%eax
}
 407:	5d                   	pop    %ebp
 408:	c3                   	ret    

00000409 <strlen>:

uint
strlen(const char *s)
{
 409:	55                   	push   %ebp
 40a:	89 e5                	mov    %esp,%ebp
 40c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 40f:	b8 00 00 00 00       	mov    $0x0,%eax
 414:	eb 03                	jmp    419 <strlen+0x10>
 416:	83 c0 01             	add    $0x1,%eax
 419:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 41d:	75 f7                	jne    416 <strlen+0xd>
    ;
  return n;
}
 41f:	5d                   	pop    %ebp
 420:	c3                   	ret    

00000421 <memset>:

void*
memset(void *dst, int c, uint n)
{
 421:	55                   	push   %ebp
 422:	89 e5                	mov    %esp,%ebp
 424:	57                   	push   %edi
 425:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 428:	89 d7                	mov    %edx,%edi
 42a:	8b 4d 10             	mov    0x10(%ebp),%ecx
 42d:	8b 45 0c             	mov    0xc(%ebp),%eax
 430:	fc                   	cld    
 431:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 433:	89 d0                	mov    %edx,%eax
 435:	8b 7d fc             	mov    -0x4(%ebp),%edi
 438:	c9                   	leave  
 439:	c3                   	ret    

0000043a <strchr>:

char*
strchr(const char *s, char c)
{
 43a:	55                   	push   %ebp
 43b:	89 e5                	mov    %esp,%ebp
 43d:	8b 45 08             	mov    0x8(%ebp),%eax
 440:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 444:	eb 03                	jmp    449 <strchr+0xf>
 446:	83 c0 01             	add    $0x1,%eax
 449:	0f b6 10             	movzbl (%eax),%edx
 44c:	84 d2                	test   %dl,%dl
 44e:	74 06                	je     456 <strchr+0x1c>
    if(*s == c)
 450:	38 ca                	cmp    %cl,%dl
 452:	75 f2                	jne    446 <strchr+0xc>
 454:	eb 05                	jmp    45b <strchr+0x21>
      return (char*)s;
  return 0;
 456:	b8 00 00 00 00       	mov    $0x0,%eax
}
 45b:	5d                   	pop    %ebp
 45c:	c3                   	ret    

0000045d <gets>:

char*
gets(char *buf, int max)
{
 45d:	55                   	push   %ebp
 45e:	89 e5                	mov    %esp,%ebp
 460:	57                   	push   %edi
 461:	56                   	push   %esi
 462:	53                   	push   %ebx
 463:	83 ec 1c             	sub    $0x1c,%esp
 466:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 469:	bb 00 00 00 00       	mov    $0x0,%ebx
 46e:	89 de                	mov    %ebx,%esi
 470:	83 c3 01             	add    $0x1,%ebx
 473:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 476:	7d 2e                	jge    4a6 <gets+0x49>
    cc = read(0, &c, 1);
 478:	83 ec 04             	sub    $0x4,%esp
 47b:	6a 01                	push   $0x1
 47d:	8d 45 e7             	lea    -0x19(%ebp),%eax
 480:	50                   	push   %eax
 481:	6a 00                	push   $0x0
 483:	e8 ec 00 00 00       	call   574 <read>
    if(cc < 1)
 488:	83 c4 10             	add    $0x10,%esp
 48b:	85 c0                	test   %eax,%eax
 48d:	7e 17                	jle    4a6 <gets+0x49>
      break;
    buf[i++] = c;
 48f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 493:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 496:	3c 0a                	cmp    $0xa,%al
 498:	0f 94 c2             	sete   %dl
 49b:	3c 0d                	cmp    $0xd,%al
 49d:	0f 94 c0             	sete   %al
 4a0:	08 c2                	or     %al,%dl
 4a2:	74 ca                	je     46e <gets+0x11>
    buf[i++] = c;
 4a4:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 4a6:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 4aa:	89 f8                	mov    %edi,%eax
 4ac:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4af:	5b                   	pop    %ebx
 4b0:	5e                   	pop    %esi
 4b1:	5f                   	pop    %edi
 4b2:	5d                   	pop    %ebp
 4b3:	c3                   	ret    

000004b4 <stat>:

int
stat(const char *n, struct stat *st)
{
 4b4:	55                   	push   %ebp
 4b5:	89 e5                	mov    %esp,%ebp
 4b7:	56                   	push   %esi
 4b8:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4b9:	83 ec 08             	sub    $0x8,%esp
 4bc:	6a 00                	push   $0x0
 4be:	ff 75 08             	push   0x8(%ebp)
 4c1:	e8 d6 00 00 00       	call   59c <open>
  if(fd < 0)
 4c6:	83 c4 10             	add    $0x10,%esp
 4c9:	85 c0                	test   %eax,%eax
 4cb:	78 24                	js     4f1 <stat+0x3d>
 4cd:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 4cf:	83 ec 08             	sub    $0x8,%esp
 4d2:	ff 75 0c             	push   0xc(%ebp)
 4d5:	50                   	push   %eax
 4d6:	e8 d9 00 00 00       	call   5b4 <fstat>
 4db:	89 c6                	mov    %eax,%esi
  close(fd);
 4dd:	89 1c 24             	mov    %ebx,(%esp)
 4e0:	e8 9f 00 00 00       	call   584 <close>
  return r;
 4e5:	83 c4 10             	add    $0x10,%esp
}
 4e8:	89 f0                	mov    %esi,%eax
 4ea:	8d 65 f8             	lea    -0x8(%ebp),%esp
 4ed:	5b                   	pop    %ebx
 4ee:	5e                   	pop    %esi
 4ef:	5d                   	pop    %ebp
 4f0:	c3                   	ret    
    return -1;
 4f1:	be ff ff ff ff       	mov    $0xffffffff,%esi
 4f6:	eb f0                	jmp    4e8 <stat+0x34>

000004f8 <atoi>:

int
atoi(const char *s)
{
 4f8:	55                   	push   %ebp
 4f9:	89 e5                	mov    %esp,%ebp
 4fb:	53                   	push   %ebx
 4fc:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 4ff:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 504:	eb 10                	jmp    516 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 506:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 509:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 50c:	83 c1 01             	add    $0x1,%ecx
 50f:	0f be c0             	movsbl %al,%eax
 512:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 516:	0f b6 01             	movzbl (%ecx),%eax
 519:	8d 58 d0             	lea    -0x30(%eax),%ebx
 51c:	80 fb 09             	cmp    $0x9,%bl
 51f:	76 e5                	jbe    506 <atoi+0xe>
  return n;
}
 521:	89 d0                	mov    %edx,%eax
 523:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 526:	c9                   	leave  
 527:	c3                   	ret    

00000528 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 528:	55                   	push   %ebp
 529:	89 e5                	mov    %esp,%ebp
 52b:	56                   	push   %esi
 52c:	53                   	push   %ebx
 52d:	8b 75 08             	mov    0x8(%ebp),%esi
 530:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 533:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 536:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 538:	eb 0d                	jmp    547 <memmove+0x1f>
    *dst++ = *src++;
 53a:	0f b6 01             	movzbl (%ecx),%eax
 53d:	88 02                	mov    %al,(%edx)
 53f:	8d 49 01             	lea    0x1(%ecx),%ecx
 542:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 545:	89 d8                	mov    %ebx,%eax
 547:	8d 58 ff             	lea    -0x1(%eax),%ebx
 54a:	85 c0                	test   %eax,%eax
 54c:	7f ec                	jg     53a <memmove+0x12>
  return vdst;
}
 54e:	89 f0                	mov    %esi,%eax
 550:	5b                   	pop    %ebx
 551:	5e                   	pop    %esi
 552:	5d                   	pop    %ebp
 553:	c3                   	ret    

00000554 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 554:	b8 01 00 00 00       	mov    $0x1,%eax
 559:	cd 40                	int    $0x40
 55b:	c3                   	ret    

0000055c <exit>:
SYSCALL(exit)
 55c:	b8 02 00 00 00       	mov    $0x2,%eax
 561:	cd 40                	int    $0x40
 563:	c3                   	ret    

00000564 <wait>:
SYSCALL(wait)
 564:	b8 03 00 00 00       	mov    $0x3,%eax
 569:	cd 40                	int    $0x40
 56b:	c3                   	ret    

0000056c <pipe>:
SYSCALL(pipe)
 56c:	b8 04 00 00 00       	mov    $0x4,%eax
 571:	cd 40                	int    $0x40
 573:	c3                   	ret    

00000574 <read>:
SYSCALL(read)
 574:	b8 05 00 00 00       	mov    $0x5,%eax
 579:	cd 40                	int    $0x40
 57b:	c3                   	ret    

0000057c <write>:
SYSCALL(write)
 57c:	b8 10 00 00 00       	mov    $0x10,%eax
 581:	cd 40                	int    $0x40
 583:	c3                   	ret    

00000584 <close>:
SYSCALL(close)
 584:	b8 15 00 00 00       	mov    $0x15,%eax
 589:	cd 40                	int    $0x40
 58b:	c3                   	ret    

0000058c <kill>:
SYSCALL(kill)
 58c:	b8 06 00 00 00       	mov    $0x6,%eax
 591:	cd 40                	int    $0x40
 593:	c3                   	ret    

00000594 <exec>:
SYSCALL(exec)
 594:	b8 07 00 00 00       	mov    $0x7,%eax
 599:	cd 40                	int    $0x40
 59b:	c3                   	ret    

0000059c <open>:
SYSCALL(open)
 59c:	b8 0f 00 00 00       	mov    $0xf,%eax
 5a1:	cd 40                	int    $0x40
 5a3:	c3                   	ret    

000005a4 <mknod>:
SYSCALL(mknod)
 5a4:	b8 11 00 00 00       	mov    $0x11,%eax
 5a9:	cd 40                	int    $0x40
 5ab:	c3                   	ret    

000005ac <unlink>:
SYSCALL(unlink)
 5ac:	b8 12 00 00 00       	mov    $0x12,%eax
 5b1:	cd 40                	int    $0x40
 5b3:	c3                   	ret    

000005b4 <fstat>:
SYSCALL(fstat)
 5b4:	b8 08 00 00 00       	mov    $0x8,%eax
 5b9:	cd 40                	int    $0x40
 5bb:	c3                   	ret    

000005bc <link>:
SYSCALL(link)
 5bc:	b8 13 00 00 00       	mov    $0x13,%eax
 5c1:	cd 40                	int    $0x40
 5c3:	c3                   	ret    

000005c4 <mkdir>:
SYSCALL(mkdir)
 5c4:	b8 14 00 00 00       	mov    $0x14,%eax
 5c9:	cd 40                	int    $0x40
 5cb:	c3                   	ret    

000005cc <chdir>:
SYSCALL(chdir)
 5cc:	b8 09 00 00 00       	mov    $0x9,%eax
 5d1:	cd 40                	int    $0x40
 5d3:	c3                   	ret    

000005d4 <dup>:
SYSCALL(dup)
 5d4:	b8 0a 00 00 00       	mov    $0xa,%eax
 5d9:	cd 40                	int    $0x40
 5db:	c3                   	ret    

000005dc <getpid>:
SYSCALL(getpid)
 5dc:	b8 0b 00 00 00       	mov    $0xb,%eax
 5e1:	cd 40                	int    $0x40
 5e3:	c3                   	ret    

000005e4 <sbrk>:
SYSCALL(sbrk)
 5e4:	b8 0c 00 00 00       	mov    $0xc,%eax
 5e9:	cd 40                	int    $0x40
 5eb:	c3                   	ret    

000005ec <sleep>:
SYSCALL(sleep)
 5ec:	b8 0d 00 00 00       	mov    $0xd,%eax
 5f1:	cd 40                	int    $0x40
 5f3:	c3                   	ret    

000005f4 <uptime>:
SYSCALL(uptime)
 5f4:	b8 0e 00 00 00       	mov    $0xe,%eax
 5f9:	cd 40                	int    $0x40
 5fb:	c3                   	ret    

000005fc <clone>:
SYSCALL(clone)
 5fc:	b8 16 00 00 00       	mov    $0x16,%eax
 601:	cd 40                	int    $0x40
 603:	c3                   	ret    

00000604 <join>:
 604:	b8 17 00 00 00       	mov    $0x17,%eax
 609:	cd 40                	int    $0x40
 60b:	c3                   	ret    

0000060c <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 60c:	55                   	push   %ebp
 60d:	89 e5                	mov    %esp,%ebp
 60f:	83 ec 1c             	sub    $0x1c,%esp
 612:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 615:	6a 01                	push   $0x1
 617:	8d 55 f4             	lea    -0xc(%ebp),%edx
 61a:	52                   	push   %edx
 61b:	50                   	push   %eax
 61c:	e8 5b ff ff ff       	call   57c <write>
}
 621:	83 c4 10             	add    $0x10,%esp
 624:	c9                   	leave  
 625:	c3                   	ret    

00000626 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 626:	55                   	push   %ebp
 627:	89 e5                	mov    %esp,%ebp
 629:	57                   	push   %edi
 62a:	56                   	push   %esi
 62b:	53                   	push   %ebx
 62c:	83 ec 2c             	sub    $0x2c,%esp
 62f:	89 45 d0             	mov    %eax,-0x30(%ebp)
 632:	89 d0                	mov    %edx,%eax
 634:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 636:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 63a:	0f 95 c1             	setne  %cl
 63d:	c1 ea 1f             	shr    $0x1f,%edx
 640:	84 d1                	test   %dl,%cl
 642:	74 44                	je     688 <printint+0x62>
    neg = 1;
    x = -xx;
 644:	f7 d8                	neg    %eax
 646:	89 c1                	mov    %eax,%ecx
    neg = 1;
 648:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 64f:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 654:	89 c8                	mov    %ecx,%eax
 656:	ba 00 00 00 00       	mov    $0x0,%edx
 65b:	f7 f6                	div    %esi
 65d:	89 df                	mov    %ebx,%edi
 65f:	83 c3 01             	add    $0x1,%ebx
 662:	0f b6 92 70 0a 00 00 	movzbl 0xa70(%edx),%edx
 669:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 66d:	89 ca                	mov    %ecx,%edx
 66f:	89 c1                	mov    %eax,%ecx
 671:	39 d6                	cmp    %edx,%esi
 673:	76 df                	jbe    654 <printint+0x2e>
  if(neg)
 675:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 679:	74 31                	je     6ac <printint+0x86>
    buf[i++] = '-';
 67b:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 680:	8d 5f 02             	lea    0x2(%edi),%ebx
 683:	8b 75 d0             	mov    -0x30(%ebp),%esi
 686:	eb 17                	jmp    69f <printint+0x79>
    x = xx;
 688:	89 c1                	mov    %eax,%ecx
  neg = 0;
 68a:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 691:	eb bc                	jmp    64f <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 693:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 698:	89 f0                	mov    %esi,%eax
 69a:	e8 6d ff ff ff       	call   60c <putc>
  while(--i >= 0)
 69f:	83 eb 01             	sub    $0x1,%ebx
 6a2:	79 ef                	jns    693 <printint+0x6d>
}
 6a4:	83 c4 2c             	add    $0x2c,%esp
 6a7:	5b                   	pop    %ebx
 6a8:	5e                   	pop    %esi
 6a9:	5f                   	pop    %edi
 6aa:	5d                   	pop    %ebp
 6ab:	c3                   	ret    
 6ac:	8b 75 d0             	mov    -0x30(%ebp),%esi
 6af:	eb ee                	jmp    69f <printint+0x79>

000006b1 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 6b1:	55                   	push   %ebp
 6b2:	89 e5                	mov    %esp,%ebp
 6b4:	57                   	push   %edi
 6b5:	56                   	push   %esi
 6b6:	53                   	push   %ebx
 6b7:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 6ba:	8d 45 10             	lea    0x10(%ebp),%eax
 6bd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 6c0:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 6c5:	bb 00 00 00 00       	mov    $0x0,%ebx
 6ca:	eb 14                	jmp    6e0 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 6cc:	89 fa                	mov    %edi,%edx
 6ce:	8b 45 08             	mov    0x8(%ebp),%eax
 6d1:	e8 36 ff ff ff       	call   60c <putc>
 6d6:	eb 05                	jmp    6dd <printf+0x2c>
      }
    } else if(state == '%'){
 6d8:	83 fe 25             	cmp    $0x25,%esi
 6db:	74 25                	je     702 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 6dd:	83 c3 01             	add    $0x1,%ebx
 6e0:	8b 45 0c             	mov    0xc(%ebp),%eax
 6e3:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 6e7:	84 c0                	test   %al,%al
 6e9:	0f 84 20 01 00 00    	je     80f <printf+0x15e>
    c = fmt[i] & 0xff;
 6ef:	0f be f8             	movsbl %al,%edi
 6f2:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 6f5:	85 f6                	test   %esi,%esi
 6f7:	75 df                	jne    6d8 <printf+0x27>
      if(c == '%'){
 6f9:	83 f8 25             	cmp    $0x25,%eax
 6fc:	75 ce                	jne    6cc <printf+0x1b>
        state = '%';
 6fe:	89 c6                	mov    %eax,%esi
 700:	eb db                	jmp    6dd <printf+0x2c>
      if(c == 'd'){
 702:	83 f8 25             	cmp    $0x25,%eax
 705:	0f 84 cf 00 00 00    	je     7da <printf+0x129>
 70b:	0f 8c dd 00 00 00    	jl     7ee <printf+0x13d>
 711:	83 f8 78             	cmp    $0x78,%eax
 714:	0f 8f d4 00 00 00    	jg     7ee <printf+0x13d>
 71a:	83 f8 63             	cmp    $0x63,%eax
 71d:	0f 8c cb 00 00 00    	jl     7ee <printf+0x13d>
 723:	83 e8 63             	sub    $0x63,%eax
 726:	83 f8 15             	cmp    $0x15,%eax
 729:	0f 87 bf 00 00 00    	ja     7ee <printf+0x13d>
 72f:	ff 24 85 18 0a 00 00 	jmp    *0xa18(,%eax,4)
        printint(fd, *ap, 10, 1);
 736:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 739:	8b 17                	mov    (%edi),%edx
 73b:	83 ec 0c             	sub    $0xc,%esp
 73e:	6a 01                	push   $0x1
 740:	b9 0a 00 00 00       	mov    $0xa,%ecx
 745:	8b 45 08             	mov    0x8(%ebp),%eax
 748:	e8 d9 fe ff ff       	call   626 <printint>
        ap++;
 74d:	83 c7 04             	add    $0x4,%edi
 750:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 753:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 756:	be 00 00 00 00       	mov    $0x0,%esi
 75b:	eb 80                	jmp    6dd <printf+0x2c>
        printint(fd, *ap, 16, 0);
 75d:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 760:	8b 17                	mov    (%edi),%edx
 762:	83 ec 0c             	sub    $0xc,%esp
 765:	6a 00                	push   $0x0
 767:	b9 10 00 00 00       	mov    $0x10,%ecx
 76c:	8b 45 08             	mov    0x8(%ebp),%eax
 76f:	e8 b2 fe ff ff       	call   626 <printint>
        ap++;
 774:	83 c7 04             	add    $0x4,%edi
 777:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 77a:	83 c4 10             	add    $0x10,%esp
      state = 0;
 77d:	be 00 00 00 00       	mov    $0x0,%esi
 782:	e9 56 ff ff ff       	jmp    6dd <printf+0x2c>
        s = (char*)*ap;
 787:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 78a:	8b 30                	mov    (%eax),%esi
        ap++;
 78c:	83 c0 04             	add    $0x4,%eax
 78f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 792:	85 f6                	test   %esi,%esi
 794:	75 15                	jne    7ab <printf+0xfa>
          s = "(null)";
 796:	be 0f 0a 00 00       	mov    $0xa0f,%esi
 79b:	eb 0e                	jmp    7ab <printf+0xfa>
          putc(fd, *s);
 79d:	0f be d2             	movsbl %dl,%edx
 7a0:	8b 45 08             	mov    0x8(%ebp),%eax
 7a3:	e8 64 fe ff ff       	call   60c <putc>
          s++;
 7a8:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 7ab:	0f b6 16             	movzbl (%esi),%edx
 7ae:	84 d2                	test   %dl,%dl
 7b0:	75 eb                	jne    79d <printf+0xec>
      state = 0;
 7b2:	be 00 00 00 00       	mov    $0x0,%esi
 7b7:	e9 21 ff ff ff       	jmp    6dd <printf+0x2c>
        putc(fd, *ap);
 7bc:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7bf:	0f be 17             	movsbl (%edi),%edx
 7c2:	8b 45 08             	mov    0x8(%ebp),%eax
 7c5:	e8 42 fe ff ff       	call   60c <putc>
        ap++;
 7ca:	83 c7 04             	add    $0x4,%edi
 7cd:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 7d0:	be 00 00 00 00       	mov    $0x0,%esi
 7d5:	e9 03 ff ff ff       	jmp    6dd <printf+0x2c>
        putc(fd, c);
 7da:	89 fa                	mov    %edi,%edx
 7dc:	8b 45 08             	mov    0x8(%ebp),%eax
 7df:	e8 28 fe ff ff       	call   60c <putc>
      state = 0;
 7e4:	be 00 00 00 00       	mov    $0x0,%esi
 7e9:	e9 ef fe ff ff       	jmp    6dd <printf+0x2c>
        putc(fd, '%');
 7ee:	ba 25 00 00 00       	mov    $0x25,%edx
 7f3:	8b 45 08             	mov    0x8(%ebp),%eax
 7f6:	e8 11 fe ff ff       	call   60c <putc>
        putc(fd, c);
 7fb:	89 fa                	mov    %edi,%edx
 7fd:	8b 45 08             	mov    0x8(%ebp),%eax
 800:	e8 07 fe ff ff       	call   60c <putc>
      state = 0;
 805:	be 00 00 00 00       	mov    $0x0,%esi
 80a:	e9 ce fe ff ff       	jmp    6dd <printf+0x2c>
    }
  }
}
 80f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 812:	5b                   	pop    %ebx
 813:	5e                   	pop    %esi
 814:	5f                   	pop    %edi
 815:	5d                   	pop    %ebp
 816:	c3                   	ret    

00000817 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 817:	55                   	push   %ebp
 818:	89 e5                	mov    %esp,%ebp
 81a:	57                   	push   %edi
 81b:	56                   	push   %esi
 81c:	53                   	push   %ebx
 81d:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 820:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 823:	a1 fc 0d 00 00       	mov    0xdfc,%eax
 828:	eb 02                	jmp    82c <free+0x15>
 82a:	89 d0                	mov    %edx,%eax
 82c:	39 c8                	cmp    %ecx,%eax
 82e:	73 04                	jae    834 <free+0x1d>
 830:	39 08                	cmp    %ecx,(%eax)
 832:	77 12                	ja     846 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 834:	8b 10                	mov    (%eax),%edx
 836:	39 c2                	cmp    %eax,%edx
 838:	77 f0                	ja     82a <free+0x13>
 83a:	39 c8                	cmp    %ecx,%eax
 83c:	72 08                	jb     846 <free+0x2f>
 83e:	39 ca                	cmp    %ecx,%edx
 840:	77 04                	ja     846 <free+0x2f>
 842:	89 d0                	mov    %edx,%eax
 844:	eb e6                	jmp    82c <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 846:	8b 73 fc             	mov    -0x4(%ebx),%esi
 849:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 84c:	8b 10                	mov    (%eax),%edx
 84e:	39 d7                	cmp    %edx,%edi
 850:	74 19                	je     86b <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 852:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 855:	8b 50 04             	mov    0x4(%eax),%edx
 858:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 85b:	39 ce                	cmp    %ecx,%esi
 85d:	74 1b                	je     87a <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 85f:	89 08                	mov    %ecx,(%eax)
  freep = p;
 861:	a3 fc 0d 00 00       	mov    %eax,0xdfc
}
 866:	5b                   	pop    %ebx
 867:	5e                   	pop    %esi
 868:	5f                   	pop    %edi
 869:	5d                   	pop    %ebp
 86a:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 86b:	03 72 04             	add    0x4(%edx),%esi
 86e:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 871:	8b 10                	mov    (%eax),%edx
 873:	8b 12                	mov    (%edx),%edx
 875:	89 53 f8             	mov    %edx,-0x8(%ebx)
 878:	eb db                	jmp    855 <free+0x3e>
    p->s.size += bp->s.size;
 87a:	03 53 fc             	add    -0x4(%ebx),%edx
 87d:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 880:	8b 53 f8             	mov    -0x8(%ebx),%edx
 883:	89 10                	mov    %edx,(%eax)
 885:	eb da                	jmp    861 <free+0x4a>

00000887 <morecore>:

static Header*
morecore(uint nu)
{
 887:	55                   	push   %ebp
 888:	89 e5                	mov    %esp,%ebp
 88a:	53                   	push   %ebx
 88b:	83 ec 04             	sub    $0x4,%esp
 88e:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 890:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 895:	77 05                	ja     89c <morecore+0x15>
    nu = 4096;
 897:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 89c:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 8a3:	83 ec 0c             	sub    $0xc,%esp
 8a6:	50                   	push   %eax
 8a7:	e8 38 fd ff ff       	call   5e4 <sbrk>
  if(p == (char*)-1)
 8ac:	83 c4 10             	add    $0x10,%esp
 8af:	83 f8 ff             	cmp    $0xffffffff,%eax
 8b2:	74 1c                	je     8d0 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 8b4:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 8b7:	83 c0 08             	add    $0x8,%eax
 8ba:	83 ec 0c             	sub    $0xc,%esp
 8bd:	50                   	push   %eax
 8be:	e8 54 ff ff ff       	call   817 <free>
  return freep;
 8c3:	a1 fc 0d 00 00       	mov    0xdfc,%eax
 8c8:	83 c4 10             	add    $0x10,%esp
}
 8cb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8ce:	c9                   	leave  
 8cf:	c3                   	ret    
    return 0;
 8d0:	b8 00 00 00 00       	mov    $0x0,%eax
 8d5:	eb f4                	jmp    8cb <morecore+0x44>

000008d7 <malloc>:

void*
malloc(uint nbytes)
{
 8d7:	55                   	push   %ebp
 8d8:	89 e5                	mov    %esp,%ebp
 8da:	53                   	push   %ebx
 8db:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8de:	8b 45 08             	mov    0x8(%ebp),%eax
 8e1:	8d 58 07             	lea    0x7(%eax),%ebx
 8e4:	c1 eb 03             	shr    $0x3,%ebx
 8e7:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 8ea:	8b 0d fc 0d 00 00    	mov    0xdfc,%ecx
 8f0:	85 c9                	test   %ecx,%ecx
 8f2:	74 04                	je     8f8 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8f4:	8b 01                	mov    (%ecx),%eax
 8f6:	eb 4a                	jmp    942 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 8f8:	c7 05 fc 0d 00 00 00 	movl   $0xe00,0xdfc
 8ff:	0e 00 00 
 902:	c7 05 00 0e 00 00 00 	movl   $0xe00,0xe00
 909:	0e 00 00 
    base.s.size = 0;
 90c:	c7 05 04 0e 00 00 00 	movl   $0x0,0xe04
 913:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 916:	b9 00 0e 00 00       	mov    $0xe00,%ecx
 91b:	eb d7                	jmp    8f4 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 91d:	74 19                	je     938 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 91f:	29 da                	sub    %ebx,%edx
 921:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 924:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 927:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 92a:	89 0d fc 0d 00 00    	mov    %ecx,0xdfc
      return (void*)(p + 1);
 930:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 933:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 936:	c9                   	leave  
 937:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 938:	8b 10                	mov    (%eax),%edx
 93a:	89 11                	mov    %edx,(%ecx)
 93c:	eb ec                	jmp    92a <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 93e:	89 c1                	mov    %eax,%ecx
 940:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 942:	8b 50 04             	mov    0x4(%eax),%edx
 945:	39 da                	cmp    %ebx,%edx
 947:	73 d4                	jae    91d <malloc+0x46>
    if(p == freep)
 949:	39 05 fc 0d 00 00    	cmp    %eax,0xdfc
 94f:	75 ed                	jne    93e <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 951:	89 d8                	mov    %ebx,%eax
 953:	e8 2f ff ff ff       	call   887 <morecore>
 958:	85 c0                	test   %eax,%eax
 95a:	75 e2                	jne    93e <malloc+0x67>
 95c:	eb d5                	jmp    933 <malloc+0x5c>
