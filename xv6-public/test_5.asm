
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
  1c:	a1 0c 0e 00 00       	mov    0xe0c,%eax
  21:	83 f8 01             	cmp    $0x1,%eax
  24:	0f 84 db 00 00 00    	je     105 <worker+0x105>
  2a:	6a 38                	push   $0x38
  2c:	68 6c 09 00 00       	push   $0x96c
  31:	68 75 09 00 00       	push   $0x975
  36:	6a 01                	push   $0x1
  38:	e8 7f 06 00 00       	call   6bc <printf>
  3d:	83 c4 0c             	add    $0xc,%esp
  40:	68 b4 09 00 00       	push   $0x9b4
  45:	68 88 09 00 00       	push   $0x988
  4a:	6a 01                	push   $0x1
  4c:	e8 6b 06 00 00       	call   6bc <printf>
  51:	83 c4 08             	add    $0x8,%esp
  54:	68 9c 09 00 00       	push   $0x99c
  59:	6a 01                	push   $0x1
  5b:	e8 5c 06 00 00       	call   6bc <printf>
  60:	83 c4 04             	add    $0x4,%esp
  63:	ff 35 10 0e 00 00    	push   0xe10
  69:	e8 29 05 00 00       	call   597 <kill>
  6e:	e8 f4 04 00 00       	call   567 <exit>
   assert(tmp1 == 42);
  73:	6a 36                	push   $0x36
  75:	68 6c 09 00 00       	push   $0x96c
  7a:	68 75 09 00 00       	push   $0x975
  7f:	6a 01                	push   $0x1
  81:	e8 36 06 00 00       	call   6bc <printf>
  86:	83 c4 0c             	add    $0xc,%esp
  89:	68 7d 09 00 00       	push   $0x97d
  8e:	68 88 09 00 00       	push   $0x988
  93:	6a 01                	push   $0x1
  95:	e8 22 06 00 00       	call   6bc <printf>
  9a:	83 c4 08             	add    $0x8,%esp
  9d:	68 9c 09 00 00       	push   $0x99c
  a2:	6a 01                	push   $0x1
  a4:	e8 13 06 00 00       	call   6bc <printf>
  a9:	83 c4 04             	add    $0x4,%esp
  ac:	ff 35 10 0e 00 00    	push   0xe10
  b2:	e8 e0 04 00 00       	call   597 <kill>
  b7:	e8 ab 04 00 00       	call   567 <exit>
   assert(tmp2 == 24);
  bc:	6a 37                	push   $0x37
  be:	68 6c 09 00 00       	push   $0x96c
  c3:	68 75 09 00 00       	push   $0x975
  c8:	6a 01                	push   $0x1
  ca:	e8 ed 05 00 00       	call   6bc <printf>
  cf:	83 c4 0c             	add    $0xc,%esp
  d2:	68 a9 09 00 00       	push   $0x9a9
  d7:	68 88 09 00 00       	push   $0x988
  dc:	6a 01                	push   $0x1
  de:	e8 d9 05 00 00       	call   6bc <printf>
  e3:	83 c4 08             	add    $0x8,%esp
  e6:	68 9c 09 00 00       	push   $0x99c
  eb:	6a 01                	push   $0x1
  ed:	e8 ca 05 00 00       	call   6bc <printf>
  f2:	83 c4 04             	add    $0x4,%esp
  f5:	ff 35 10 0e 00 00    	push   0xe10
  fb:	e8 97 04 00 00       	call   597 <kill>
 100:	e8 62 04 00 00       	call   567 <exit>
   global++;
 105:	83 c0 01             	add    $0x1,%eax
 108:	a3 0c 0e 00 00       	mov    %eax,0xe0c
   exit();
 10d:	e8 55 04 00 00       	call   567 <exit>

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
 126:	e8 bc 04 00 00       	call   5e7 <getpid>
 12b:	a3 10 0e 00 00       	mov    %eax,0xe10
   void *stack, *p = malloc(PGSIZE * 2);
 130:	83 ec 0c             	sub    $0xc,%esp
 133:	68 00 20 00 00       	push   $0x2000
 138:	e8 a5 07 00 00       	call   8e2 <malloc>
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
 15a:	68 6c 09 00 00       	push   $0x96c
 15f:	68 75 09 00 00       	push   $0x975
 164:	6a 01                	push   $0x1
 166:	e8 51 05 00 00       	call   6bc <printf>
 16b:	83 c4 0c             	add    $0xc,%esp
 16e:	68 c0 09 00 00       	push   $0x9c0
 173:	68 88 09 00 00       	push   $0x988
 178:	6a 01                	push   $0x1
 17a:	e8 3d 05 00 00       	call   6bc <printf>
 17f:	83 c4 08             	add    $0x8,%esp
 182:	68 9c 09 00 00       	push   $0x99c
 187:	6a 01                	push   $0x1
 189:	e8 2e 05 00 00       	call   6bc <printf>
 18e:	83 c4 04             	add    $0x4,%esp
 191:	ff 35 10 0e 00 00    	push   0xe10
 197:	e8 fb 03 00 00       	call   597 <kill>
 19c:	e8 c6 03 00 00       	call   567 <exit>
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
 1bf:	e8 43 04 00 00       	call   607 <clone>
 1c4:	89 c6                	mov    %eax,%esi
   assert(clone_pid > 0);
 1c6:	83 c4 10             	add    $0x10,%esp
 1c9:	85 c0                	test   %eax,%eax
 1cb:	7e 69                	jle    236 <main+0x124>
   int join_pid = join(&join_stack);
 1cd:	83 ec 0c             	sub    $0xc,%esp
 1d0:	8d 45 dc             	lea    -0x24(%ebp),%eax
 1d3:	50                   	push   %eax
 1d4:	e8 36 04 00 00       	call   60f <join>
   assert(join_pid == clone_pid);
 1d9:	83 c4 10             	add    $0x10,%esp
 1dc:	39 c6                	cmp    %eax,%esi
 1de:	0f 85 9b 00 00 00    	jne    27f <main+0x16d>
   assert(stack == join_stack);
 1e4:	39 7d dc             	cmp    %edi,-0x24(%ebp)
 1e7:	0f 84 db 00 00 00    	je     2c8 <main+0x1b6>
 1ed:	6a 2a                	push   $0x2a
 1ef:	68 6c 09 00 00       	push   $0x96c
 1f4:	68 75 09 00 00       	push   $0x975
 1f9:	6a 01                	push   $0x1
 1fb:	e8 bc 04 00 00       	call   6bc <printf>
 200:	83 c4 0c             	add    $0xc,%esp
 203:	68 ee 09 00 00       	push   $0x9ee
 208:	68 88 09 00 00       	push   $0x988
 20d:	6a 01                	push   $0x1
 20f:	e8 a8 04 00 00       	call   6bc <printf>
 214:	83 c4 08             	add    $0x8,%esp
 217:	68 9c 09 00 00       	push   $0x99c
 21c:	6a 01                	push   $0x1
 21e:	e8 99 04 00 00       	call   6bc <printf>
 223:	83 c4 04             	add    $0x4,%esp
 226:	ff 35 10 0e 00 00    	push   0xe10
 22c:	e8 66 03 00 00       	call   597 <kill>
 231:	e8 31 03 00 00       	call   567 <exit>
   assert(clone_pid > 0);
 236:	6a 25                	push   $0x25
 238:	68 6c 09 00 00       	push   $0x96c
 23d:	68 75 09 00 00       	push   $0x975
 242:	6a 01                	push   $0x1
 244:	e8 73 04 00 00       	call   6bc <printf>
 249:	83 c4 0c             	add    $0xc,%esp
 24c:	68 ca 09 00 00       	push   $0x9ca
 251:	68 88 09 00 00       	push   $0x988
 256:	6a 01                	push   $0x1
 258:	e8 5f 04 00 00       	call   6bc <printf>
 25d:	83 c4 08             	add    $0x8,%esp
 260:	68 9c 09 00 00       	push   $0x99c
 265:	6a 01                	push   $0x1
 267:	e8 50 04 00 00       	call   6bc <printf>
 26c:	83 c4 04             	add    $0x4,%esp
 26f:	ff 35 10 0e 00 00    	push   0xe10
 275:	e8 1d 03 00 00       	call   597 <kill>
 27a:	e8 e8 02 00 00       	call   567 <exit>
   assert(join_pid == clone_pid);
 27f:	6a 29                	push   $0x29
 281:	68 6c 09 00 00       	push   $0x96c
 286:	68 75 09 00 00       	push   $0x975
 28b:	6a 01                	push   $0x1
 28d:	e8 2a 04 00 00       	call   6bc <printf>
 292:	83 c4 0c             	add    $0xc,%esp
 295:	68 d8 09 00 00       	push   $0x9d8
 29a:	68 88 09 00 00       	push   $0x988
 29f:	6a 01                	push   $0x1
 2a1:	e8 16 04 00 00       	call   6bc <printf>
 2a6:	83 c4 08             	add    $0x8,%esp
 2a9:	68 9c 09 00 00       	push   $0x99c
 2ae:	6a 01                	push   $0x1
 2b0:	e8 07 04 00 00       	call   6bc <printf>
 2b5:	83 c4 04             	add    $0x4,%esp
 2b8:	ff 35 10 0e 00 00    	push   0xe10
 2be:	e8 d4 02 00 00       	call   597 <kill>
 2c3:	e8 9f 02 00 00       	call   567 <exit>
   assert(global == 2);
 2c8:	83 3d 0c 0e 00 00 02 	cmpl   $0x2,0xe0c
 2cf:	74 49                	je     31a <main+0x208>
 2d1:	6a 2b                	push   $0x2b
 2d3:	68 6c 09 00 00       	push   $0x96c
 2d8:	68 75 09 00 00       	push   $0x975
 2dd:	6a 01                	push   $0x1
 2df:	e8 d8 03 00 00       	call   6bc <printf>
 2e4:	83 c4 0c             	add    $0xc,%esp
 2e7:	68 02 0a 00 00       	push   $0xa02
 2ec:	68 88 09 00 00       	push   $0x988
 2f1:	6a 01                	push   $0x1
 2f3:	e8 c4 03 00 00       	call   6bc <printf>
 2f8:	83 c4 08             	add    $0x8,%esp
 2fb:	68 9c 09 00 00       	push   $0x99c
 300:	6a 01                	push   $0x1
 302:	e8 b5 03 00 00       	call   6bc <printf>
 307:	83 c4 04             	add    $0x4,%esp
 30a:	ff 35 10 0e 00 00    	push   0xe10
 310:	e8 82 02 00 00       	call   597 <kill>
 315:	e8 4d 02 00 00       	call   567 <exit>
   printf(1, "TEST PASSED\n");
 31a:	83 ec 08             	sub    $0x8,%esp
 31d:	68 0e 0a 00 00       	push   $0xa0e
 322:	6a 01                	push   $0x1
 324:	e8 93 03 00 00       	call   6bc <printf>
   free(p);
 329:	89 1c 24             	mov    %ebx,(%esp)
 32c:	e8 f1 04 00 00       	call   822 <free>
   exit();
 331:	e8 31 02 00 00       	call   567 <exit>

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
  void *n_stack = malloc(PGSIZE*2);
 34d:	68 00 20 00 00       	push   $0x2000
 352:	e8 8b 05 00 00       	call   8e2 <malloc>
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
 368:	e8 9a 02 00 00       	call   607 <clone>


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
 379:	55                   	push   %ebp
 37a:	89 e5                	mov    %esp,%ebp
 37c:	83 ec 24             	sub    $0x24,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 37f:	8d 45 f4             	lea    -0xc(%ebp),%eax
 382:	50                   	push   %eax
 383:	e8 87 02 00 00       	call   60f <join>
  
  return pid;
}
 388:	c9                   	leave  
 389:	c3                   	ret    

0000038a <lock_acquire>:

void lock_acquire(lock_t *lock){
 38a:	55                   	push   %ebp
 38b:	89 e5                	mov    %esp,%ebp
 38d:	53                   	push   %ebx
 38e:	83 ec 04             	sub    $0x4,%esp
 391:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 394:	83 ec 08             	sub    $0x8,%esp
 397:	6a 01                	push   $0x1
 399:	53                   	push   %ebx
 39a:	e8 97 ff ff ff       	call   336 <test_and_set>
 39f:	83 c4 10             	add    $0x10,%esp
 3a2:	83 f8 01             	cmp    $0x1,%eax
 3a5:	74 ed                	je     394 <lock_acquire+0xa>
    ;
}
 3a7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3aa:	c9                   	leave  
 3ab:	c3                   	ret    

000003ac <lock_release>:

void lock_release(lock_t *lock) {
 3ac:	55                   	push   %ebp
 3ad:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 3af:	8b 45 08             	mov    0x8(%ebp),%eax
 3b2:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 3b8:	5d                   	pop    %ebp
 3b9:	c3                   	ret    

000003ba <lock_init>:

void lock_init(lock_t *lock) {
 3ba:	55                   	push   %ebp
 3bb:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 3bd:	8b 45 08             	mov    0x8(%ebp),%eax
 3c0:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 3c6:	5d                   	pop    %ebp
 3c7:	c3                   	ret    

000003c8 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 3c8:	55                   	push   %ebp
 3c9:	89 e5                	mov    %esp,%ebp
 3cb:	56                   	push   %esi
 3cc:	53                   	push   %ebx
 3cd:	8b 75 08             	mov    0x8(%ebp),%esi
 3d0:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 3d3:	89 f0                	mov    %esi,%eax
 3d5:	89 d1                	mov    %edx,%ecx
 3d7:	83 c2 01             	add    $0x1,%edx
 3da:	89 c3                	mov    %eax,%ebx
 3dc:	83 c0 01             	add    $0x1,%eax
 3df:	0f b6 09             	movzbl (%ecx),%ecx
 3e2:	88 0b                	mov    %cl,(%ebx)
 3e4:	84 c9                	test   %cl,%cl
 3e6:	75 ed                	jne    3d5 <strcpy+0xd>
    ;
  return os;
}
 3e8:	89 f0                	mov    %esi,%eax
 3ea:	5b                   	pop    %ebx
 3eb:	5e                   	pop    %esi
 3ec:	5d                   	pop    %ebp
 3ed:	c3                   	ret    

000003ee <strcmp>:

int
strcmp(const char *p, const char *q)
{
 3ee:	55                   	push   %ebp
 3ef:	89 e5                	mov    %esp,%ebp
 3f1:	8b 4d 08             	mov    0x8(%ebp),%ecx
 3f4:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 3f7:	eb 06                	jmp    3ff <strcmp+0x11>
    p++, q++;
 3f9:	83 c1 01             	add    $0x1,%ecx
 3fc:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 3ff:	0f b6 01             	movzbl (%ecx),%eax
 402:	84 c0                	test   %al,%al
 404:	74 04                	je     40a <strcmp+0x1c>
 406:	3a 02                	cmp    (%edx),%al
 408:	74 ef                	je     3f9 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 40a:	0f b6 c0             	movzbl %al,%eax
 40d:	0f b6 12             	movzbl (%edx),%edx
 410:	29 d0                	sub    %edx,%eax
}
 412:	5d                   	pop    %ebp
 413:	c3                   	ret    

00000414 <strlen>:

uint
strlen(const char *s)
{
 414:	55                   	push   %ebp
 415:	89 e5                	mov    %esp,%ebp
 417:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 41a:	b8 00 00 00 00       	mov    $0x0,%eax
 41f:	eb 03                	jmp    424 <strlen+0x10>
 421:	83 c0 01             	add    $0x1,%eax
 424:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 428:	75 f7                	jne    421 <strlen+0xd>
    ;
  return n;
}
 42a:	5d                   	pop    %ebp
 42b:	c3                   	ret    

0000042c <memset>:

void*
memset(void *dst, int c, uint n)
{
 42c:	55                   	push   %ebp
 42d:	89 e5                	mov    %esp,%ebp
 42f:	57                   	push   %edi
 430:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 433:	89 d7                	mov    %edx,%edi
 435:	8b 4d 10             	mov    0x10(%ebp),%ecx
 438:	8b 45 0c             	mov    0xc(%ebp),%eax
 43b:	fc                   	cld    
 43c:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 43e:	89 d0                	mov    %edx,%eax
 440:	8b 7d fc             	mov    -0x4(%ebp),%edi
 443:	c9                   	leave  
 444:	c3                   	ret    

00000445 <strchr>:

char*
strchr(const char *s, char c)
{
 445:	55                   	push   %ebp
 446:	89 e5                	mov    %esp,%ebp
 448:	8b 45 08             	mov    0x8(%ebp),%eax
 44b:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 44f:	eb 03                	jmp    454 <strchr+0xf>
 451:	83 c0 01             	add    $0x1,%eax
 454:	0f b6 10             	movzbl (%eax),%edx
 457:	84 d2                	test   %dl,%dl
 459:	74 06                	je     461 <strchr+0x1c>
    if(*s == c)
 45b:	38 ca                	cmp    %cl,%dl
 45d:	75 f2                	jne    451 <strchr+0xc>
 45f:	eb 05                	jmp    466 <strchr+0x21>
      return (char*)s;
  return 0;
 461:	b8 00 00 00 00       	mov    $0x0,%eax
}
 466:	5d                   	pop    %ebp
 467:	c3                   	ret    

00000468 <gets>:

char*
gets(char *buf, int max)
{
 468:	55                   	push   %ebp
 469:	89 e5                	mov    %esp,%ebp
 46b:	57                   	push   %edi
 46c:	56                   	push   %esi
 46d:	53                   	push   %ebx
 46e:	83 ec 1c             	sub    $0x1c,%esp
 471:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 474:	bb 00 00 00 00       	mov    $0x0,%ebx
 479:	89 de                	mov    %ebx,%esi
 47b:	83 c3 01             	add    $0x1,%ebx
 47e:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 481:	7d 2e                	jge    4b1 <gets+0x49>
    cc = read(0, &c, 1);
 483:	83 ec 04             	sub    $0x4,%esp
 486:	6a 01                	push   $0x1
 488:	8d 45 e7             	lea    -0x19(%ebp),%eax
 48b:	50                   	push   %eax
 48c:	6a 00                	push   $0x0
 48e:	e8 ec 00 00 00       	call   57f <read>
    if(cc < 1)
 493:	83 c4 10             	add    $0x10,%esp
 496:	85 c0                	test   %eax,%eax
 498:	7e 17                	jle    4b1 <gets+0x49>
      break;
    buf[i++] = c;
 49a:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 49e:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 4a1:	3c 0a                	cmp    $0xa,%al
 4a3:	0f 94 c2             	sete   %dl
 4a6:	3c 0d                	cmp    $0xd,%al
 4a8:	0f 94 c0             	sete   %al
 4ab:	08 c2                	or     %al,%dl
 4ad:	74 ca                	je     479 <gets+0x11>
    buf[i++] = c;
 4af:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 4b1:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 4b5:	89 f8                	mov    %edi,%eax
 4b7:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4ba:	5b                   	pop    %ebx
 4bb:	5e                   	pop    %esi
 4bc:	5f                   	pop    %edi
 4bd:	5d                   	pop    %ebp
 4be:	c3                   	ret    

000004bf <stat>:

int
stat(const char *n, struct stat *st)
{
 4bf:	55                   	push   %ebp
 4c0:	89 e5                	mov    %esp,%ebp
 4c2:	56                   	push   %esi
 4c3:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4c4:	83 ec 08             	sub    $0x8,%esp
 4c7:	6a 00                	push   $0x0
 4c9:	ff 75 08             	push   0x8(%ebp)
 4cc:	e8 d6 00 00 00       	call   5a7 <open>
  if(fd < 0)
 4d1:	83 c4 10             	add    $0x10,%esp
 4d4:	85 c0                	test   %eax,%eax
 4d6:	78 24                	js     4fc <stat+0x3d>
 4d8:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 4da:	83 ec 08             	sub    $0x8,%esp
 4dd:	ff 75 0c             	push   0xc(%ebp)
 4e0:	50                   	push   %eax
 4e1:	e8 d9 00 00 00       	call   5bf <fstat>
 4e6:	89 c6                	mov    %eax,%esi
  close(fd);
 4e8:	89 1c 24             	mov    %ebx,(%esp)
 4eb:	e8 9f 00 00 00       	call   58f <close>
  return r;
 4f0:	83 c4 10             	add    $0x10,%esp
}
 4f3:	89 f0                	mov    %esi,%eax
 4f5:	8d 65 f8             	lea    -0x8(%ebp),%esp
 4f8:	5b                   	pop    %ebx
 4f9:	5e                   	pop    %esi
 4fa:	5d                   	pop    %ebp
 4fb:	c3                   	ret    
    return -1;
 4fc:	be ff ff ff ff       	mov    $0xffffffff,%esi
 501:	eb f0                	jmp    4f3 <stat+0x34>

00000503 <atoi>:

int
atoi(const char *s)
{
 503:	55                   	push   %ebp
 504:	89 e5                	mov    %esp,%ebp
 506:	53                   	push   %ebx
 507:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 50a:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 50f:	eb 10                	jmp    521 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 511:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 514:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 517:	83 c1 01             	add    $0x1,%ecx
 51a:	0f be c0             	movsbl %al,%eax
 51d:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 521:	0f b6 01             	movzbl (%ecx),%eax
 524:	8d 58 d0             	lea    -0x30(%eax),%ebx
 527:	80 fb 09             	cmp    $0x9,%bl
 52a:	76 e5                	jbe    511 <atoi+0xe>
  return n;
}
 52c:	89 d0                	mov    %edx,%eax
 52e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 531:	c9                   	leave  
 532:	c3                   	ret    

00000533 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 533:	55                   	push   %ebp
 534:	89 e5                	mov    %esp,%ebp
 536:	56                   	push   %esi
 537:	53                   	push   %ebx
 538:	8b 75 08             	mov    0x8(%ebp),%esi
 53b:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 53e:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 541:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 543:	eb 0d                	jmp    552 <memmove+0x1f>
    *dst++ = *src++;
 545:	0f b6 01             	movzbl (%ecx),%eax
 548:	88 02                	mov    %al,(%edx)
 54a:	8d 49 01             	lea    0x1(%ecx),%ecx
 54d:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 550:	89 d8                	mov    %ebx,%eax
 552:	8d 58 ff             	lea    -0x1(%eax),%ebx
 555:	85 c0                	test   %eax,%eax
 557:	7f ec                	jg     545 <memmove+0x12>
  return vdst;
}
 559:	89 f0                	mov    %esi,%eax
 55b:	5b                   	pop    %ebx
 55c:	5e                   	pop    %esi
 55d:	5d                   	pop    %ebp
 55e:	c3                   	ret    

0000055f <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 55f:	b8 01 00 00 00       	mov    $0x1,%eax
 564:	cd 40                	int    $0x40
 566:	c3                   	ret    

00000567 <exit>:
SYSCALL(exit)
 567:	b8 02 00 00 00       	mov    $0x2,%eax
 56c:	cd 40                	int    $0x40
 56e:	c3                   	ret    

0000056f <wait>:
SYSCALL(wait)
 56f:	b8 03 00 00 00       	mov    $0x3,%eax
 574:	cd 40                	int    $0x40
 576:	c3                   	ret    

00000577 <pipe>:
SYSCALL(pipe)
 577:	b8 04 00 00 00       	mov    $0x4,%eax
 57c:	cd 40                	int    $0x40
 57e:	c3                   	ret    

0000057f <read>:
SYSCALL(read)
 57f:	b8 05 00 00 00       	mov    $0x5,%eax
 584:	cd 40                	int    $0x40
 586:	c3                   	ret    

00000587 <write>:
SYSCALL(write)
 587:	b8 10 00 00 00       	mov    $0x10,%eax
 58c:	cd 40                	int    $0x40
 58e:	c3                   	ret    

0000058f <close>:
SYSCALL(close)
 58f:	b8 15 00 00 00       	mov    $0x15,%eax
 594:	cd 40                	int    $0x40
 596:	c3                   	ret    

00000597 <kill>:
SYSCALL(kill)
 597:	b8 06 00 00 00       	mov    $0x6,%eax
 59c:	cd 40                	int    $0x40
 59e:	c3                   	ret    

0000059f <exec>:
SYSCALL(exec)
 59f:	b8 07 00 00 00       	mov    $0x7,%eax
 5a4:	cd 40                	int    $0x40
 5a6:	c3                   	ret    

000005a7 <open>:
SYSCALL(open)
 5a7:	b8 0f 00 00 00       	mov    $0xf,%eax
 5ac:	cd 40                	int    $0x40
 5ae:	c3                   	ret    

000005af <mknod>:
SYSCALL(mknod)
 5af:	b8 11 00 00 00       	mov    $0x11,%eax
 5b4:	cd 40                	int    $0x40
 5b6:	c3                   	ret    

000005b7 <unlink>:
SYSCALL(unlink)
 5b7:	b8 12 00 00 00       	mov    $0x12,%eax
 5bc:	cd 40                	int    $0x40
 5be:	c3                   	ret    

000005bf <fstat>:
SYSCALL(fstat)
 5bf:	b8 08 00 00 00       	mov    $0x8,%eax
 5c4:	cd 40                	int    $0x40
 5c6:	c3                   	ret    

000005c7 <link>:
SYSCALL(link)
 5c7:	b8 13 00 00 00       	mov    $0x13,%eax
 5cc:	cd 40                	int    $0x40
 5ce:	c3                   	ret    

000005cf <mkdir>:
SYSCALL(mkdir)
 5cf:	b8 14 00 00 00       	mov    $0x14,%eax
 5d4:	cd 40                	int    $0x40
 5d6:	c3                   	ret    

000005d7 <chdir>:
SYSCALL(chdir)
 5d7:	b8 09 00 00 00       	mov    $0x9,%eax
 5dc:	cd 40                	int    $0x40
 5de:	c3                   	ret    

000005df <dup>:
SYSCALL(dup)
 5df:	b8 0a 00 00 00       	mov    $0xa,%eax
 5e4:	cd 40                	int    $0x40
 5e6:	c3                   	ret    

000005e7 <getpid>:
SYSCALL(getpid)
 5e7:	b8 0b 00 00 00       	mov    $0xb,%eax
 5ec:	cd 40                	int    $0x40
 5ee:	c3                   	ret    

000005ef <sbrk>:
SYSCALL(sbrk)
 5ef:	b8 0c 00 00 00       	mov    $0xc,%eax
 5f4:	cd 40                	int    $0x40
 5f6:	c3                   	ret    

000005f7 <sleep>:
SYSCALL(sleep)
 5f7:	b8 0d 00 00 00       	mov    $0xd,%eax
 5fc:	cd 40                	int    $0x40
 5fe:	c3                   	ret    

000005ff <uptime>:
SYSCALL(uptime)
 5ff:	b8 0e 00 00 00       	mov    $0xe,%eax
 604:	cd 40                	int    $0x40
 606:	c3                   	ret    

00000607 <clone>:
SYSCALL(clone)
 607:	b8 16 00 00 00       	mov    $0x16,%eax
 60c:	cd 40                	int    $0x40
 60e:	c3                   	ret    

0000060f <join>:
 60f:	b8 17 00 00 00       	mov    $0x17,%eax
 614:	cd 40                	int    $0x40
 616:	c3                   	ret    

00000617 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 617:	55                   	push   %ebp
 618:	89 e5                	mov    %esp,%ebp
 61a:	83 ec 1c             	sub    $0x1c,%esp
 61d:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 620:	6a 01                	push   $0x1
 622:	8d 55 f4             	lea    -0xc(%ebp),%edx
 625:	52                   	push   %edx
 626:	50                   	push   %eax
 627:	e8 5b ff ff ff       	call   587 <write>
}
 62c:	83 c4 10             	add    $0x10,%esp
 62f:	c9                   	leave  
 630:	c3                   	ret    

00000631 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 631:	55                   	push   %ebp
 632:	89 e5                	mov    %esp,%ebp
 634:	57                   	push   %edi
 635:	56                   	push   %esi
 636:	53                   	push   %ebx
 637:	83 ec 2c             	sub    $0x2c,%esp
 63a:	89 45 d0             	mov    %eax,-0x30(%ebp)
 63d:	89 d0                	mov    %edx,%eax
 63f:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 641:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 645:	0f 95 c1             	setne  %cl
 648:	c1 ea 1f             	shr    $0x1f,%edx
 64b:	84 d1                	test   %dl,%cl
 64d:	74 44                	je     693 <printint+0x62>
    neg = 1;
    x = -xx;
 64f:	f7 d8                	neg    %eax
 651:	89 c1                	mov    %eax,%ecx
    neg = 1;
 653:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 65a:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 65f:	89 c8                	mov    %ecx,%eax
 661:	ba 00 00 00 00       	mov    $0x0,%edx
 666:	f7 f6                	div    %esi
 668:	89 df                	mov    %ebx,%edi
 66a:	83 c3 01             	add    $0x1,%ebx
 66d:	0f b6 92 7c 0a 00 00 	movzbl 0xa7c(%edx),%edx
 674:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 678:	89 ca                	mov    %ecx,%edx
 67a:	89 c1                	mov    %eax,%ecx
 67c:	39 d6                	cmp    %edx,%esi
 67e:	76 df                	jbe    65f <printint+0x2e>
  if(neg)
 680:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 684:	74 31                	je     6b7 <printint+0x86>
    buf[i++] = '-';
 686:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 68b:	8d 5f 02             	lea    0x2(%edi),%ebx
 68e:	8b 75 d0             	mov    -0x30(%ebp),%esi
 691:	eb 17                	jmp    6aa <printint+0x79>
    x = xx;
 693:	89 c1                	mov    %eax,%ecx
  neg = 0;
 695:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 69c:	eb bc                	jmp    65a <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 69e:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 6a3:	89 f0                	mov    %esi,%eax
 6a5:	e8 6d ff ff ff       	call   617 <putc>
  while(--i >= 0)
 6aa:	83 eb 01             	sub    $0x1,%ebx
 6ad:	79 ef                	jns    69e <printint+0x6d>
}
 6af:	83 c4 2c             	add    $0x2c,%esp
 6b2:	5b                   	pop    %ebx
 6b3:	5e                   	pop    %esi
 6b4:	5f                   	pop    %edi
 6b5:	5d                   	pop    %ebp
 6b6:	c3                   	ret    
 6b7:	8b 75 d0             	mov    -0x30(%ebp),%esi
 6ba:	eb ee                	jmp    6aa <printint+0x79>

000006bc <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 6bc:	55                   	push   %ebp
 6bd:	89 e5                	mov    %esp,%ebp
 6bf:	57                   	push   %edi
 6c0:	56                   	push   %esi
 6c1:	53                   	push   %ebx
 6c2:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 6c5:	8d 45 10             	lea    0x10(%ebp),%eax
 6c8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 6cb:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 6d0:	bb 00 00 00 00       	mov    $0x0,%ebx
 6d5:	eb 14                	jmp    6eb <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 6d7:	89 fa                	mov    %edi,%edx
 6d9:	8b 45 08             	mov    0x8(%ebp),%eax
 6dc:	e8 36 ff ff ff       	call   617 <putc>
 6e1:	eb 05                	jmp    6e8 <printf+0x2c>
      }
    } else if(state == '%'){
 6e3:	83 fe 25             	cmp    $0x25,%esi
 6e6:	74 25                	je     70d <printf+0x51>
  for(i = 0; fmt[i]; i++){
 6e8:	83 c3 01             	add    $0x1,%ebx
 6eb:	8b 45 0c             	mov    0xc(%ebp),%eax
 6ee:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 6f2:	84 c0                	test   %al,%al
 6f4:	0f 84 20 01 00 00    	je     81a <printf+0x15e>
    c = fmt[i] & 0xff;
 6fa:	0f be f8             	movsbl %al,%edi
 6fd:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 700:	85 f6                	test   %esi,%esi
 702:	75 df                	jne    6e3 <printf+0x27>
      if(c == '%'){
 704:	83 f8 25             	cmp    $0x25,%eax
 707:	75 ce                	jne    6d7 <printf+0x1b>
        state = '%';
 709:	89 c6                	mov    %eax,%esi
 70b:	eb db                	jmp    6e8 <printf+0x2c>
      if(c == 'd'){
 70d:	83 f8 25             	cmp    $0x25,%eax
 710:	0f 84 cf 00 00 00    	je     7e5 <printf+0x129>
 716:	0f 8c dd 00 00 00    	jl     7f9 <printf+0x13d>
 71c:	83 f8 78             	cmp    $0x78,%eax
 71f:	0f 8f d4 00 00 00    	jg     7f9 <printf+0x13d>
 725:	83 f8 63             	cmp    $0x63,%eax
 728:	0f 8c cb 00 00 00    	jl     7f9 <printf+0x13d>
 72e:	83 e8 63             	sub    $0x63,%eax
 731:	83 f8 15             	cmp    $0x15,%eax
 734:	0f 87 bf 00 00 00    	ja     7f9 <printf+0x13d>
 73a:	ff 24 85 24 0a 00 00 	jmp    *0xa24(,%eax,4)
        printint(fd, *ap, 10, 1);
 741:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 744:	8b 17                	mov    (%edi),%edx
 746:	83 ec 0c             	sub    $0xc,%esp
 749:	6a 01                	push   $0x1
 74b:	b9 0a 00 00 00       	mov    $0xa,%ecx
 750:	8b 45 08             	mov    0x8(%ebp),%eax
 753:	e8 d9 fe ff ff       	call   631 <printint>
        ap++;
 758:	83 c7 04             	add    $0x4,%edi
 75b:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 75e:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 761:	be 00 00 00 00       	mov    $0x0,%esi
 766:	eb 80                	jmp    6e8 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 768:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 76b:	8b 17                	mov    (%edi),%edx
 76d:	83 ec 0c             	sub    $0xc,%esp
 770:	6a 00                	push   $0x0
 772:	b9 10 00 00 00       	mov    $0x10,%ecx
 777:	8b 45 08             	mov    0x8(%ebp),%eax
 77a:	e8 b2 fe ff ff       	call   631 <printint>
        ap++;
 77f:	83 c7 04             	add    $0x4,%edi
 782:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 785:	83 c4 10             	add    $0x10,%esp
      state = 0;
 788:	be 00 00 00 00       	mov    $0x0,%esi
 78d:	e9 56 ff ff ff       	jmp    6e8 <printf+0x2c>
        s = (char*)*ap;
 792:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 795:	8b 30                	mov    (%eax),%esi
        ap++;
 797:	83 c0 04             	add    $0x4,%eax
 79a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 79d:	85 f6                	test   %esi,%esi
 79f:	75 15                	jne    7b6 <printf+0xfa>
          s = "(null)";
 7a1:	be 1b 0a 00 00       	mov    $0xa1b,%esi
 7a6:	eb 0e                	jmp    7b6 <printf+0xfa>
          putc(fd, *s);
 7a8:	0f be d2             	movsbl %dl,%edx
 7ab:	8b 45 08             	mov    0x8(%ebp),%eax
 7ae:	e8 64 fe ff ff       	call   617 <putc>
          s++;
 7b3:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 7b6:	0f b6 16             	movzbl (%esi),%edx
 7b9:	84 d2                	test   %dl,%dl
 7bb:	75 eb                	jne    7a8 <printf+0xec>
      state = 0;
 7bd:	be 00 00 00 00       	mov    $0x0,%esi
 7c2:	e9 21 ff ff ff       	jmp    6e8 <printf+0x2c>
        putc(fd, *ap);
 7c7:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7ca:	0f be 17             	movsbl (%edi),%edx
 7cd:	8b 45 08             	mov    0x8(%ebp),%eax
 7d0:	e8 42 fe ff ff       	call   617 <putc>
        ap++;
 7d5:	83 c7 04             	add    $0x4,%edi
 7d8:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 7db:	be 00 00 00 00       	mov    $0x0,%esi
 7e0:	e9 03 ff ff ff       	jmp    6e8 <printf+0x2c>
        putc(fd, c);
 7e5:	89 fa                	mov    %edi,%edx
 7e7:	8b 45 08             	mov    0x8(%ebp),%eax
 7ea:	e8 28 fe ff ff       	call   617 <putc>
      state = 0;
 7ef:	be 00 00 00 00       	mov    $0x0,%esi
 7f4:	e9 ef fe ff ff       	jmp    6e8 <printf+0x2c>
        putc(fd, '%');
 7f9:	ba 25 00 00 00       	mov    $0x25,%edx
 7fe:	8b 45 08             	mov    0x8(%ebp),%eax
 801:	e8 11 fe ff ff       	call   617 <putc>
        putc(fd, c);
 806:	89 fa                	mov    %edi,%edx
 808:	8b 45 08             	mov    0x8(%ebp),%eax
 80b:	e8 07 fe ff ff       	call   617 <putc>
      state = 0;
 810:	be 00 00 00 00       	mov    $0x0,%esi
 815:	e9 ce fe ff ff       	jmp    6e8 <printf+0x2c>
    }
  }
}
 81a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 81d:	5b                   	pop    %ebx
 81e:	5e                   	pop    %esi
 81f:	5f                   	pop    %edi
 820:	5d                   	pop    %ebp
 821:	c3                   	ret    

00000822 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 822:	55                   	push   %ebp
 823:	89 e5                	mov    %esp,%ebp
 825:	57                   	push   %edi
 826:	56                   	push   %esi
 827:	53                   	push   %ebx
 828:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 82b:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 82e:	a1 14 0e 00 00       	mov    0xe14,%eax
 833:	eb 02                	jmp    837 <free+0x15>
 835:	89 d0                	mov    %edx,%eax
 837:	39 c8                	cmp    %ecx,%eax
 839:	73 04                	jae    83f <free+0x1d>
 83b:	39 08                	cmp    %ecx,(%eax)
 83d:	77 12                	ja     851 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 83f:	8b 10                	mov    (%eax),%edx
 841:	39 c2                	cmp    %eax,%edx
 843:	77 f0                	ja     835 <free+0x13>
 845:	39 c8                	cmp    %ecx,%eax
 847:	72 08                	jb     851 <free+0x2f>
 849:	39 ca                	cmp    %ecx,%edx
 84b:	77 04                	ja     851 <free+0x2f>
 84d:	89 d0                	mov    %edx,%eax
 84f:	eb e6                	jmp    837 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 851:	8b 73 fc             	mov    -0x4(%ebx),%esi
 854:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 857:	8b 10                	mov    (%eax),%edx
 859:	39 d7                	cmp    %edx,%edi
 85b:	74 19                	je     876 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 85d:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 860:	8b 50 04             	mov    0x4(%eax),%edx
 863:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 866:	39 ce                	cmp    %ecx,%esi
 868:	74 1b                	je     885 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 86a:	89 08                	mov    %ecx,(%eax)
  freep = p;
 86c:	a3 14 0e 00 00       	mov    %eax,0xe14
}
 871:	5b                   	pop    %ebx
 872:	5e                   	pop    %esi
 873:	5f                   	pop    %edi
 874:	5d                   	pop    %ebp
 875:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 876:	03 72 04             	add    0x4(%edx),%esi
 879:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 87c:	8b 10                	mov    (%eax),%edx
 87e:	8b 12                	mov    (%edx),%edx
 880:	89 53 f8             	mov    %edx,-0x8(%ebx)
 883:	eb db                	jmp    860 <free+0x3e>
    p->s.size += bp->s.size;
 885:	03 53 fc             	add    -0x4(%ebx),%edx
 888:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 88b:	8b 53 f8             	mov    -0x8(%ebx),%edx
 88e:	89 10                	mov    %edx,(%eax)
 890:	eb da                	jmp    86c <free+0x4a>

00000892 <morecore>:

static Header*
morecore(uint nu)
{
 892:	55                   	push   %ebp
 893:	89 e5                	mov    %esp,%ebp
 895:	53                   	push   %ebx
 896:	83 ec 04             	sub    $0x4,%esp
 899:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 89b:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 8a0:	77 05                	ja     8a7 <morecore+0x15>
    nu = 4096;
 8a2:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 8a7:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 8ae:	83 ec 0c             	sub    $0xc,%esp
 8b1:	50                   	push   %eax
 8b2:	e8 38 fd ff ff       	call   5ef <sbrk>
  if(p == (char*)-1)
 8b7:	83 c4 10             	add    $0x10,%esp
 8ba:	83 f8 ff             	cmp    $0xffffffff,%eax
 8bd:	74 1c                	je     8db <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 8bf:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 8c2:	83 c0 08             	add    $0x8,%eax
 8c5:	83 ec 0c             	sub    $0xc,%esp
 8c8:	50                   	push   %eax
 8c9:	e8 54 ff ff ff       	call   822 <free>
  return freep;
 8ce:	a1 14 0e 00 00       	mov    0xe14,%eax
 8d3:	83 c4 10             	add    $0x10,%esp
}
 8d6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8d9:	c9                   	leave  
 8da:	c3                   	ret    
    return 0;
 8db:	b8 00 00 00 00       	mov    $0x0,%eax
 8e0:	eb f4                	jmp    8d6 <morecore+0x44>

000008e2 <malloc>:

void*
malloc(uint nbytes)
{
 8e2:	55                   	push   %ebp
 8e3:	89 e5                	mov    %esp,%ebp
 8e5:	53                   	push   %ebx
 8e6:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8e9:	8b 45 08             	mov    0x8(%ebp),%eax
 8ec:	8d 58 07             	lea    0x7(%eax),%ebx
 8ef:	c1 eb 03             	shr    $0x3,%ebx
 8f2:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 8f5:	8b 0d 14 0e 00 00    	mov    0xe14,%ecx
 8fb:	85 c9                	test   %ecx,%ecx
 8fd:	74 04                	je     903 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8ff:	8b 01                	mov    (%ecx),%eax
 901:	eb 4a                	jmp    94d <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 903:	c7 05 14 0e 00 00 18 	movl   $0xe18,0xe14
 90a:	0e 00 00 
 90d:	c7 05 18 0e 00 00 18 	movl   $0xe18,0xe18
 914:	0e 00 00 
    base.s.size = 0;
 917:	c7 05 1c 0e 00 00 00 	movl   $0x0,0xe1c
 91e:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 921:	b9 18 0e 00 00       	mov    $0xe18,%ecx
 926:	eb d7                	jmp    8ff <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 928:	74 19                	je     943 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 92a:	29 da                	sub    %ebx,%edx
 92c:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 92f:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 932:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 935:	89 0d 14 0e 00 00    	mov    %ecx,0xe14
      return (void*)(p + 1);
 93b:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 93e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 941:	c9                   	leave  
 942:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 943:	8b 10                	mov    (%eax),%edx
 945:	89 11                	mov    %edx,(%ecx)
 947:	eb ec                	jmp    935 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 949:	89 c1                	mov    %eax,%ecx
 94b:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 94d:	8b 50 04             	mov    0x4(%eax),%edx
 950:	39 da                	cmp    %ebx,%edx
 952:	73 d4                	jae    928 <malloc+0x46>
    if(p == freep)
 954:	39 05 14 0e 00 00    	cmp    %eax,0xe14
 95a:	75 ed                	jne    949 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 95c:	89 d8                	mov    %ebx,%eax
 95e:	e8 2f ff ff ff       	call   892 <morecore>
 963:	85 c0                	test   %eax,%eax
 965:	75 e2                	jne    949 <malloc+0x67>
 967:	eb d5                	jmp    93e <malloc+0x5c>
