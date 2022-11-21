
_test_16:     file format elf32-i386


Disassembly of section .text:

00000000 <nested_worker>:
   printf(1, "TEST PASSED\n");
   exit();
}


void nested_worker(void *arg1, void *arg2){
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
  11:	75 60                	jne    73 <nested_worker+0x73>
   assert(arg2_int == 42);
  13:	83 fa 2a             	cmp    $0x2a,%edx
  16:	0f 85 a0 00 00 00    	jne    bc <nested_worker+0xbc>
   assert(global == 2);
  1c:	a1 9c 0e 00 00       	mov    0xe9c,%eax
  21:	83 f8 02             	cmp    $0x2,%eax
  24:	0f 84 db 00 00 00    	je     105 <nested_worker+0x105>
  2a:	6a 30                	push   $0x30
  2c:	68 e8 09 00 00       	push   $0x9e8
  31:	68 f2 09 00 00       	push   $0x9f2
  36:	6a 01                	push   $0x1
  38:	e8 fc 06 00 00       	call   739 <printf>
  3d:	83 c4 0c             	add    $0xc,%esp
  40:	68 39 0a 00 00       	push   $0xa39
  45:	68 09 0a 00 00       	push   $0xa09
  4a:	6a 01                	push   $0x1
  4c:	e8 e8 06 00 00       	call   739 <printf>
  51:	83 c4 08             	add    $0x8,%esp
  54:	68 1d 0a 00 00       	push   $0xa1d
  59:	6a 01                	push   $0x1
  5b:	e8 d9 06 00 00       	call   739 <printf>
  60:	83 c4 04             	add    $0x4,%esp
  63:	ff 35 a0 0e 00 00    	push   0xea0
  69:	e8 a6 05 00 00       	call   614 <kill>
  6e:	e8 71 05 00 00       	call   5e4 <exit>
   assert(arg1_int == 35);
  73:	6a 2e                	push   $0x2e
  75:	68 e8 09 00 00       	push   $0x9e8
  7a:	68 f2 09 00 00       	push   $0x9f2
  7f:	6a 01                	push   $0x1
  81:	e8 b3 06 00 00       	call   739 <printf>
  86:	83 c4 0c             	add    $0xc,%esp
  89:	68 fa 09 00 00       	push   $0x9fa
  8e:	68 09 0a 00 00       	push   $0xa09
  93:	6a 01                	push   $0x1
  95:	e8 9f 06 00 00       	call   739 <printf>
  9a:	83 c4 08             	add    $0x8,%esp
  9d:	68 1d 0a 00 00       	push   $0xa1d
  a2:	6a 01                	push   $0x1
  a4:	e8 90 06 00 00       	call   739 <printf>
  a9:	83 c4 04             	add    $0x4,%esp
  ac:	ff 35 a0 0e 00 00    	push   0xea0
  b2:	e8 5d 05 00 00       	call   614 <kill>
  b7:	e8 28 05 00 00       	call   5e4 <exit>
   assert(arg2_int == 42);
  bc:	6a 2f                	push   $0x2f
  be:	68 e8 09 00 00       	push   $0x9e8
  c3:	68 f2 09 00 00       	push   $0x9f2
  c8:	6a 01                	push   $0x1
  ca:	e8 6a 06 00 00       	call   739 <printf>
  cf:	83 c4 0c             	add    $0xc,%esp
  d2:	68 2a 0a 00 00       	push   $0xa2a
  d7:	68 09 0a 00 00       	push   $0xa09
  dc:	6a 01                	push   $0x1
  de:	e8 56 06 00 00       	call   739 <printf>
  e3:	83 c4 08             	add    $0x8,%esp
  e6:	68 1d 0a 00 00       	push   $0xa1d
  eb:	6a 01                	push   $0x1
  ed:	e8 47 06 00 00       	call   739 <printf>
  f2:	83 c4 04             	add    $0x4,%esp
  f5:	ff 35 a0 0e 00 00    	push   0xea0
  fb:	e8 14 05 00 00       	call   614 <kill>
 100:	e8 df 04 00 00       	call   5e4 <exit>
   global++;
 105:	83 c0 01             	add    $0x1,%eax
 108:	a3 9c 0e 00 00       	mov    %eax,0xe9c
   exit();
 10d:	e8 d2 04 00 00       	call   5e4 <exit>

00000112 <worker>:
}

void
worker(void *arg1, void *arg2) {
 112:	55                   	push   %ebp
 113:	89 e5                	mov    %esp,%ebp
 115:	53                   	push   %ebx
 116:	83 ec 14             	sub    $0x14,%esp
   int arg1_int = *(int*)arg1;
 119:	8b 45 08             	mov    0x8(%ebp),%eax
 11c:	8b 00                	mov    (%eax),%eax
 11e:	89 45 f4             	mov    %eax,-0xc(%ebp)
   int arg2_int = *(int*)arg2;
 121:	8b 55 0c             	mov    0xc(%ebp),%edx
 124:	8b 12                	mov    (%edx),%edx
 126:	89 55 f0             	mov    %edx,-0x10(%ebp)
   assert(arg1_int == 35);
 129:	83 f8 23             	cmp    $0x23,%eax
 12c:	75 60                	jne    18e <worker+0x7c>
   assert(arg2_int == 42);
 12e:	83 fa 2a             	cmp    $0x2a,%edx
 131:	0f 85 a0 00 00 00    	jne    1d7 <worker+0xc5>
   assert(global == 1);
 137:	a1 9c 0e 00 00       	mov    0xe9c,%eax
 13c:	83 f8 01             	cmp    $0x1,%eax
 13f:	0f 84 db 00 00 00    	je     220 <worker+0x10e>
 145:	6a 3b                	push   $0x3b
 147:	68 e8 09 00 00       	push   $0x9e8
 14c:	68 f2 09 00 00       	push   $0x9f2
 151:	6a 01                	push   $0x1
 153:	e8 e1 05 00 00       	call   739 <printf>
 158:	83 c4 0c             	add    $0xc,%esp
 15b:	68 45 0a 00 00       	push   $0xa45
 160:	68 09 0a 00 00       	push   $0xa09
 165:	6a 01                	push   $0x1
 167:	e8 cd 05 00 00       	call   739 <printf>
 16c:	83 c4 08             	add    $0x8,%esp
 16f:	68 1d 0a 00 00       	push   $0xa1d
 174:	6a 01                	push   $0x1
 176:	e8 be 05 00 00       	call   739 <printf>
 17b:	83 c4 04             	add    $0x4,%esp
 17e:	ff 35 a0 0e 00 00    	push   0xea0
 184:	e8 8b 04 00 00       	call   614 <kill>
 189:	e8 56 04 00 00       	call   5e4 <exit>
   assert(arg1_int == 35);
 18e:	6a 39                	push   $0x39
 190:	68 e8 09 00 00       	push   $0x9e8
 195:	68 f2 09 00 00       	push   $0x9f2
 19a:	6a 01                	push   $0x1
 19c:	e8 98 05 00 00       	call   739 <printf>
 1a1:	83 c4 0c             	add    $0xc,%esp
 1a4:	68 fa 09 00 00       	push   $0x9fa
 1a9:	68 09 0a 00 00       	push   $0xa09
 1ae:	6a 01                	push   $0x1
 1b0:	e8 84 05 00 00       	call   739 <printf>
 1b5:	83 c4 08             	add    $0x8,%esp
 1b8:	68 1d 0a 00 00       	push   $0xa1d
 1bd:	6a 01                	push   $0x1
 1bf:	e8 75 05 00 00       	call   739 <printf>
 1c4:	83 c4 04             	add    $0x4,%esp
 1c7:	ff 35 a0 0e 00 00    	push   0xea0
 1cd:	e8 42 04 00 00       	call   614 <kill>
 1d2:	e8 0d 04 00 00       	call   5e4 <exit>
   assert(arg2_int == 42);
 1d7:	6a 3a                	push   $0x3a
 1d9:	68 e8 09 00 00       	push   $0x9e8
 1de:	68 f2 09 00 00       	push   $0x9f2
 1e3:	6a 01                	push   $0x1
 1e5:	e8 4f 05 00 00       	call   739 <printf>
 1ea:	83 c4 0c             	add    $0xc,%esp
 1ed:	68 2a 0a 00 00       	push   $0xa2a
 1f2:	68 09 0a 00 00       	push   $0xa09
 1f7:	6a 01                	push   $0x1
 1f9:	e8 3b 05 00 00       	call   739 <printf>
 1fe:	83 c4 08             	add    $0x8,%esp
 201:	68 1d 0a 00 00       	push   $0xa1d
 206:	6a 01                	push   $0x1
 208:	e8 2c 05 00 00       	call   739 <printf>
 20d:	83 c4 04             	add    $0x4,%esp
 210:	ff 35 a0 0e 00 00    	push   0xea0
 216:	e8 f9 03 00 00       	call   614 <kill>
 21b:	e8 c4 03 00 00       	call   5e4 <exit>
   global++;
 220:	83 c0 01             	add    $0x1,%eax
 223:	a3 9c 0e 00 00       	mov    %eax,0xe9c
   int nested_thread_pid = thread_create(nested_worker, &arg1_int, &arg2_int);
 228:	83 ec 04             	sub    $0x4,%esp
 22b:	8d 45 f0             	lea    -0x10(%ebp),%eax
 22e:	50                   	push   %eax
 22f:	8d 45 f4             	lea    -0xc(%ebp),%eax
 232:	50                   	push   %eax
 233:	68 00 00 00 00       	push   $0x0
 238:	e8 be 01 00 00       	call   3fb <thread_create>
 23d:	89 c3                	mov    %eax,%ebx
   int nested_join_pid = thread_join();
 23f:	e8 bd 01 00 00       	call   401 <thread_join>
   assert(nested_join_pid == nested_thread_pid);
 244:	83 c4 10             	add    $0x10,%esp
 247:	39 c3                	cmp    %eax,%ebx
 249:	74 49                	je     294 <worker+0x182>
 24b:	6a 3f                	push   $0x3f
 24d:	68 e8 09 00 00       	push   $0x9e8
 252:	68 f2 09 00 00       	push   $0x9f2
 257:	6a 01                	push   $0x1
 259:	e8 db 04 00 00       	call   739 <printf>
 25e:	83 c4 0c             	add    $0xc,%esp
 261:	68 90 0a 00 00       	push   $0xa90
 266:	68 09 0a 00 00       	push   $0xa09
 26b:	6a 01                	push   $0x1
 26d:	e8 c7 04 00 00       	call   739 <printf>
 272:	83 c4 08             	add    $0x8,%esp
 275:	68 1d 0a 00 00       	push   $0xa1d
 27a:	6a 01                	push   $0x1
 27c:	e8 b8 04 00 00       	call   739 <printf>
 281:	83 c4 04             	add    $0x4,%esp
 284:	ff 35 a0 0e 00 00    	push   0xea0
 28a:	e8 85 03 00 00       	call   614 <kill>
 28f:	e8 50 03 00 00       	call   5e4 <exit>
   exit();
 294:	e8 4b 03 00 00       	call   5e4 <exit>

00000299 <main>:
{
 299:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 29d:	83 e4 f0             	and    $0xfffffff0,%esp
 2a0:	ff 71 fc             	push   -0x4(%ecx)
 2a3:	55                   	push   %ebp
 2a4:	89 e5                	mov    %esp,%ebp
 2a6:	53                   	push   %ebx
 2a7:	51                   	push   %ecx
 2a8:	83 ec 10             	sub    $0x10,%esp
   ppid = getpid();
 2ab:	e8 b4 03 00 00       	call   664 <getpid>
 2b0:	a3 a0 0e 00 00       	mov    %eax,0xea0
   int arg1 = 35;
 2b5:	c7 45 f4 23 00 00 00 	movl   $0x23,-0xc(%ebp)
   int arg2 = 42;
 2bc:	c7 45 f0 2a 00 00 00 	movl   $0x2a,-0x10(%ebp)
   int thread_pid = thread_create(worker, &arg1, &arg2);
 2c3:	83 ec 04             	sub    $0x4,%esp
 2c6:	8d 45 f0             	lea    -0x10(%ebp),%eax
 2c9:	50                   	push   %eax
 2ca:	8d 45 f4             	lea    -0xc(%ebp),%eax
 2cd:	50                   	push   %eax
 2ce:	68 12 01 00 00       	push   $0x112
 2d3:	e8 23 01 00 00       	call   3fb <thread_create>
   assert(thread_pid > 0);
 2d8:	83 c4 10             	add    $0x10,%esp
 2db:	85 c0                	test   %eax,%eax
 2dd:	7e 65                	jle    344 <main+0xab>
 2df:	89 c3                	mov    %eax,%ebx
   int join_pid = thread_join();
 2e1:	e8 1b 01 00 00       	call   401 <thread_join>
   assert(join_pid == thread_pid);
 2e6:	39 c3                	cmp    %eax,%ebx
 2e8:	0f 85 9f 00 00 00    	jne    38d <main+0xf4>
   assert(global == 3);
 2ee:	83 3d 9c 0e 00 00 03 	cmpl   $0x3,0xe9c
 2f5:	0f 84 db 00 00 00    	je     3d6 <main+0x13d>
 2fb:	6a 24                	push   $0x24
 2fd:	68 e8 09 00 00       	push   $0x9e8
 302:	68 f2 09 00 00       	push   $0x9f2
 307:	6a 01                	push   $0x1
 309:	e8 2b 04 00 00       	call   739 <printf>
 30e:	83 c4 0c             	add    $0xc,%esp
 311:	68 77 0a 00 00       	push   $0xa77
 316:	68 09 0a 00 00       	push   $0xa09
 31b:	6a 01                	push   $0x1
 31d:	e8 17 04 00 00       	call   739 <printf>
 322:	83 c4 08             	add    $0x8,%esp
 325:	68 1d 0a 00 00       	push   $0xa1d
 32a:	6a 01                	push   $0x1
 32c:	e8 08 04 00 00       	call   739 <printf>
 331:	83 c4 04             	add    $0x4,%esp
 334:	ff 35 a0 0e 00 00    	push   0xea0
 33a:	e8 d5 02 00 00       	call   614 <kill>
 33f:	e8 a0 02 00 00       	call   5e4 <exit>
   assert(thread_pid > 0);
 344:	6a 20                	push   $0x20
 346:	68 e8 09 00 00       	push   $0x9e8
 34b:	68 f2 09 00 00       	push   $0x9f2
 350:	6a 01                	push   $0x1
 352:	e8 e2 03 00 00       	call   739 <printf>
 357:	83 c4 0c             	add    $0xc,%esp
 35a:	68 51 0a 00 00       	push   $0xa51
 35f:	68 09 0a 00 00       	push   $0xa09
 364:	6a 01                	push   $0x1
 366:	e8 ce 03 00 00       	call   739 <printf>
 36b:	83 c4 08             	add    $0x8,%esp
 36e:	68 1d 0a 00 00       	push   $0xa1d
 373:	6a 01                	push   $0x1
 375:	e8 bf 03 00 00       	call   739 <printf>
 37a:	83 c4 04             	add    $0x4,%esp
 37d:	ff 35 a0 0e 00 00    	push   0xea0
 383:	e8 8c 02 00 00       	call   614 <kill>
 388:	e8 57 02 00 00       	call   5e4 <exit>
   assert(join_pid == thread_pid);
 38d:	6a 23                	push   $0x23
 38f:	68 e8 09 00 00       	push   $0x9e8
 394:	68 f2 09 00 00       	push   $0x9f2
 399:	6a 01                	push   $0x1
 39b:	e8 99 03 00 00       	call   739 <printf>
 3a0:	83 c4 0c             	add    $0xc,%esp
 3a3:	68 60 0a 00 00       	push   $0xa60
 3a8:	68 09 0a 00 00       	push   $0xa09
 3ad:	6a 01                	push   $0x1
 3af:	e8 85 03 00 00       	call   739 <printf>
 3b4:	83 c4 08             	add    $0x8,%esp
 3b7:	68 1d 0a 00 00       	push   $0xa1d
 3bc:	6a 01                	push   $0x1
 3be:	e8 76 03 00 00       	call   739 <printf>
 3c3:	83 c4 04             	add    $0x4,%esp
 3c6:	ff 35 a0 0e 00 00    	push   0xea0
 3cc:	e8 43 02 00 00       	call   614 <kill>
 3d1:	e8 0e 02 00 00       	call   5e4 <exit>
   printf(1, "TEST PASSED\n");
 3d6:	83 ec 08             	sub    $0x8,%esp
 3d9:	68 83 0a 00 00       	push   $0xa83
 3de:	6a 01                	push   $0x1
 3e0:	e8 54 03 00 00       	call   739 <printf>
   exit();
 3e5:	e8 fa 01 00 00       	call   5e4 <exit>

000003ea <test_and_set>:
#include "fcntl.h"
#include "user.h"
#include "x86.h"
#include "mmu.h"

int test_and_set(int *old_ptr, int new_ptr) {
 3ea:	55                   	push   %ebp
 3eb:	89 e5                	mov    %esp,%ebp
 3ed:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *old_ptr;
 3f0:	8b 10                	mov    (%eax),%edx
  *old_ptr = new_ptr;
 3f2:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 3f5:	89 08                	mov    %ecx,(%eax)
  return old;
}
 3f7:	89 d0                	mov    %edx,%eax
 3f9:	5d                   	pop    %ebp
 3fa:	c3                   	ret    

000003fb <thread_create>:

  // I can't remember if there was something else to do here but I'm sure I'll find out


  return new_pid;
}
 3fb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 400:	c3                   	ret    

00000401 <thread_join>:

int thread_join() {
  return 0;
}
 401:	b8 00 00 00 00       	mov    $0x0,%eax
 406:	c3                   	ret    

00000407 <lock_acquire>:

void lock_acquire(lock_t *lock){
 407:	55                   	push   %ebp
 408:	89 e5                	mov    %esp,%ebp
 40a:	53                   	push   %ebx
 40b:	83 ec 04             	sub    $0x4,%esp
 40e:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 411:	83 ec 08             	sub    $0x8,%esp
 414:	6a 01                	push   $0x1
 416:	53                   	push   %ebx
 417:	e8 ce ff ff ff       	call   3ea <test_and_set>
 41c:	83 c4 10             	add    $0x10,%esp
 41f:	83 f8 01             	cmp    $0x1,%eax
 422:	74 ed                	je     411 <lock_acquire+0xa>
    ;
}
 424:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 427:	c9                   	leave  
 428:	c3                   	ret    

00000429 <lock_release>:

void lock_release(lock_t *lock) {
 429:	55                   	push   %ebp
 42a:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 42c:	8b 45 08             	mov    0x8(%ebp),%eax
 42f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 435:	5d                   	pop    %ebp
 436:	c3                   	ret    

00000437 <lock_init>:

void lock_init(lock_t *lock) {
 437:	55                   	push   %ebp
 438:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 43a:	8b 45 08             	mov    0x8(%ebp),%eax
 43d:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 443:	5d                   	pop    %ebp
 444:	c3                   	ret    

00000445 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 445:	55                   	push   %ebp
 446:	89 e5                	mov    %esp,%ebp
 448:	56                   	push   %esi
 449:	53                   	push   %ebx
 44a:	8b 75 08             	mov    0x8(%ebp),%esi
 44d:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 450:	89 f0                	mov    %esi,%eax
 452:	89 d1                	mov    %edx,%ecx
 454:	83 c2 01             	add    $0x1,%edx
 457:	89 c3                	mov    %eax,%ebx
 459:	83 c0 01             	add    $0x1,%eax
 45c:	0f b6 09             	movzbl (%ecx),%ecx
 45f:	88 0b                	mov    %cl,(%ebx)
 461:	84 c9                	test   %cl,%cl
 463:	75 ed                	jne    452 <strcpy+0xd>
    ;
  return os;
}
 465:	89 f0                	mov    %esi,%eax
 467:	5b                   	pop    %ebx
 468:	5e                   	pop    %esi
 469:	5d                   	pop    %ebp
 46a:	c3                   	ret    

0000046b <strcmp>:

int
strcmp(const char *p, const char *q)
{
 46b:	55                   	push   %ebp
 46c:	89 e5                	mov    %esp,%ebp
 46e:	8b 4d 08             	mov    0x8(%ebp),%ecx
 471:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 474:	eb 06                	jmp    47c <strcmp+0x11>
    p++, q++;
 476:	83 c1 01             	add    $0x1,%ecx
 479:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 47c:	0f b6 01             	movzbl (%ecx),%eax
 47f:	84 c0                	test   %al,%al
 481:	74 04                	je     487 <strcmp+0x1c>
 483:	3a 02                	cmp    (%edx),%al
 485:	74 ef                	je     476 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 487:	0f b6 c0             	movzbl %al,%eax
 48a:	0f b6 12             	movzbl (%edx),%edx
 48d:	29 d0                	sub    %edx,%eax
}
 48f:	5d                   	pop    %ebp
 490:	c3                   	ret    

00000491 <strlen>:

uint
strlen(const char *s)
{
 491:	55                   	push   %ebp
 492:	89 e5                	mov    %esp,%ebp
 494:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 497:	b8 00 00 00 00       	mov    $0x0,%eax
 49c:	eb 03                	jmp    4a1 <strlen+0x10>
 49e:	83 c0 01             	add    $0x1,%eax
 4a1:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 4a5:	75 f7                	jne    49e <strlen+0xd>
    ;
  return n;
}
 4a7:	5d                   	pop    %ebp
 4a8:	c3                   	ret    

000004a9 <memset>:

void*
memset(void *dst, int c, uint n)
{
 4a9:	55                   	push   %ebp
 4aa:	89 e5                	mov    %esp,%ebp
 4ac:	57                   	push   %edi
 4ad:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 4b0:	89 d7                	mov    %edx,%edi
 4b2:	8b 4d 10             	mov    0x10(%ebp),%ecx
 4b5:	8b 45 0c             	mov    0xc(%ebp),%eax
 4b8:	fc                   	cld    
 4b9:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 4bb:	89 d0                	mov    %edx,%eax
 4bd:	8b 7d fc             	mov    -0x4(%ebp),%edi
 4c0:	c9                   	leave  
 4c1:	c3                   	ret    

000004c2 <strchr>:

char*
strchr(const char *s, char c)
{
 4c2:	55                   	push   %ebp
 4c3:	89 e5                	mov    %esp,%ebp
 4c5:	8b 45 08             	mov    0x8(%ebp),%eax
 4c8:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 4cc:	eb 03                	jmp    4d1 <strchr+0xf>
 4ce:	83 c0 01             	add    $0x1,%eax
 4d1:	0f b6 10             	movzbl (%eax),%edx
 4d4:	84 d2                	test   %dl,%dl
 4d6:	74 06                	je     4de <strchr+0x1c>
    if(*s == c)
 4d8:	38 ca                	cmp    %cl,%dl
 4da:	75 f2                	jne    4ce <strchr+0xc>
 4dc:	eb 05                	jmp    4e3 <strchr+0x21>
      return (char*)s;
  return 0;
 4de:	b8 00 00 00 00       	mov    $0x0,%eax
}
 4e3:	5d                   	pop    %ebp
 4e4:	c3                   	ret    

000004e5 <gets>:

char*
gets(char *buf, int max)
{
 4e5:	55                   	push   %ebp
 4e6:	89 e5                	mov    %esp,%ebp
 4e8:	57                   	push   %edi
 4e9:	56                   	push   %esi
 4ea:	53                   	push   %ebx
 4eb:	83 ec 1c             	sub    $0x1c,%esp
 4ee:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 4f1:	bb 00 00 00 00       	mov    $0x0,%ebx
 4f6:	89 de                	mov    %ebx,%esi
 4f8:	83 c3 01             	add    $0x1,%ebx
 4fb:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 4fe:	7d 2e                	jge    52e <gets+0x49>
    cc = read(0, &c, 1);
 500:	83 ec 04             	sub    $0x4,%esp
 503:	6a 01                	push   $0x1
 505:	8d 45 e7             	lea    -0x19(%ebp),%eax
 508:	50                   	push   %eax
 509:	6a 00                	push   $0x0
 50b:	e8 ec 00 00 00       	call   5fc <read>
    if(cc < 1)
 510:	83 c4 10             	add    $0x10,%esp
 513:	85 c0                	test   %eax,%eax
 515:	7e 17                	jle    52e <gets+0x49>
      break;
    buf[i++] = c;
 517:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 51b:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 51e:	3c 0a                	cmp    $0xa,%al
 520:	0f 94 c2             	sete   %dl
 523:	3c 0d                	cmp    $0xd,%al
 525:	0f 94 c0             	sete   %al
 528:	08 c2                	or     %al,%dl
 52a:	74 ca                	je     4f6 <gets+0x11>
    buf[i++] = c;
 52c:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 52e:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 532:	89 f8                	mov    %edi,%eax
 534:	8d 65 f4             	lea    -0xc(%ebp),%esp
 537:	5b                   	pop    %ebx
 538:	5e                   	pop    %esi
 539:	5f                   	pop    %edi
 53a:	5d                   	pop    %ebp
 53b:	c3                   	ret    

0000053c <stat>:

int
stat(const char *n, struct stat *st)
{
 53c:	55                   	push   %ebp
 53d:	89 e5                	mov    %esp,%ebp
 53f:	56                   	push   %esi
 540:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 541:	83 ec 08             	sub    $0x8,%esp
 544:	6a 00                	push   $0x0
 546:	ff 75 08             	push   0x8(%ebp)
 549:	e8 d6 00 00 00       	call   624 <open>
  if(fd < 0)
 54e:	83 c4 10             	add    $0x10,%esp
 551:	85 c0                	test   %eax,%eax
 553:	78 24                	js     579 <stat+0x3d>
 555:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 557:	83 ec 08             	sub    $0x8,%esp
 55a:	ff 75 0c             	push   0xc(%ebp)
 55d:	50                   	push   %eax
 55e:	e8 d9 00 00 00       	call   63c <fstat>
 563:	89 c6                	mov    %eax,%esi
  close(fd);
 565:	89 1c 24             	mov    %ebx,(%esp)
 568:	e8 9f 00 00 00       	call   60c <close>
  return r;
 56d:	83 c4 10             	add    $0x10,%esp
}
 570:	89 f0                	mov    %esi,%eax
 572:	8d 65 f8             	lea    -0x8(%ebp),%esp
 575:	5b                   	pop    %ebx
 576:	5e                   	pop    %esi
 577:	5d                   	pop    %ebp
 578:	c3                   	ret    
    return -1;
 579:	be ff ff ff ff       	mov    $0xffffffff,%esi
 57e:	eb f0                	jmp    570 <stat+0x34>

00000580 <atoi>:

int
atoi(const char *s)
{
 580:	55                   	push   %ebp
 581:	89 e5                	mov    %esp,%ebp
 583:	53                   	push   %ebx
 584:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 587:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 58c:	eb 10                	jmp    59e <atoi+0x1e>
    n = n*10 + *s++ - '0';
 58e:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 591:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 594:	83 c1 01             	add    $0x1,%ecx
 597:	0f be c0             	movsbl %al,%eax
 59a:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 59e:	0f b6 01             	movzbl (%ecx),%eax
 5a1:	8d 58 d0             	lea    -0x30(%eax),%ebx
 5a4:	80 fb 09             	cmp    $0x9,%bl
 5a7:	76 e5                	jbe    58e <atoi+0xe>
  return n;
}
 5a9:	89 d0                	mov    %edx,%eax
 5ab:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5ae:	c9                   	leave  
 5af:	c3                   	ret    

000005b0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 5b0:	55                   	push   %ebp
 5b1:	89 e5                	mov    %esp,%ebp
 5b3:	56                   	push   %esi
 5b4:	53                   	push   %ebx
 5b5:	8b 75 08             	mov    0x8(%ebp),%esi
 5b8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 5bb:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 5be:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 5c0:	eb 0d                	jmp    5cf <memmove+0x1f>
    *dst++ = *src++;
 5c2:	0f b6 01             	movzbl (%ecx),%eax
 5c5:	88 02                	mov    %al,(%edx)
 5c7:	8d 49 01             	lea    0x1(%ecx),%ecx
 5ca:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 5cd:	89 d8                	mov    %ebx,%eax
 5cf:	8d 58 ff             	lea    -0x1(%eax),%ebx
 5d2:	85 c0                	test   %eax,%eax
 5d4:	7f ec                	jg     5c2 <memmove+0x12>
  return vdst;
}
 5d6:	89 f0                	mov    %esi,%eax
 5d8:	5b                   	pop    %ebx
 5d9:	5e                   	pop    %esi
 5da:	5d                   	pop    %ebp
 5db:	c3                   	ret    

000005dc <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 5dc:	b8 01 00 00 00       	mov    $0x1,%eax
 5e1:	cd 40                	int    $0x40
 5e3:	c3                   	ret    

000005e4 <exit>:
SYSCALL(exit)
 5e4:	b8 02 00 00 00       	mov    $0x2,%eax
 5e9:	cd 40                	int    $0x40
 5eb:	c3                   	ret    

000005ec <wait>:
SYSCALL(wait)
 5ec:	b8 03 00 00 00       	mov    $0x3,%eax
 5f1:	cd 40                	int    $0x40
 5f3:	c3                   	ret    

000005f4 <pipe>:
SYSCALL(pipe)
 5f4:	b8 04 00 00 00       	mov    $0x4,%eax
 5f9:	cd 40                	int    $0x40
 5fb:	c3                   	ret    

000005fc <read>:
SYSCALL(read)
 5fc:	b8 05 00 00 00       	mov    $0x5,%eax
 601:	cd 40                	int    $0x40
 603:	c3                   	ret    

00000604 <write>:
SYSCALL(write)
 604:	b8 10 00 00 00       	mov    $0x10,%eax
 609:	cd 40                	int    $0x40
 60b:	c3                   	ret    

0000060c <close>:
SYSCALL(close)
 60c:	b8 15 00 00 00       	mov    $0x15,%eax
 611:	cd 40                	int    $0x40
 613:	c3                   	ret    

00000614 <kill>:
SYSCALL(kill)
 614:	b8 06 00 00 00       	mov    $0x6,%eax
 619:	cd 40                	int    $0x40
 61b:	c3                   	ret    

0000061c <exec>:
SYSCALL(exec)
 61c:	b8 07 00 00 00       	mov    $0x7,%eax
 621:	cd 40                	int    $0x40
 623:	c3                   	ret    

00000624 <open>:
SYSCALL(open)
 624:	b8 0f 00 00 00       	mov    $0xf,%eax
 629:	cd 40                	int    $0x40
 62b:	c3                   	ret    

0000062c <mknod>:
SYSCALL(mknod)
 62c:	b8 11 00 00 00       	mov    $0x11,%eax
 631:	cd 40                	int    $0x40
 633:	c3                   	ret    

00000634 <unlink>:
SYSCALL(unlink)
 634:	b8 12 00 00 00       	mov    $0x12,%eax
 639:	cd 40                	int    $0x40
 63b:	c3                   	ret    

0000063c <fstat>:
SYSCALL(fstat)
 63c:	b8 08 00 00 00       	mov    $0x8,%eax
 641:	cd 40                	int    $0x40
 643:	c3                   	ret    

00000644 <link>:
SYSCALL(link)
 644:	b8 13 00 00 00       	mov    $0x13,%eax
 649:	cd 40                	int    $0x40
 64b:	c3                   	ret    

0000064c <mkdir>:
SYSCALL(mkdir)
 64c:	b8 14 00 00 00       	mov    $0x14,%eax
 651:	cd 40                	int    $0x40
 653:	c3                   	ret    

00000654 <chdir>:
SYSCALL(chdir)
 654:	b8 09 00 00 00       	mov    $0x9,%eax
 659:	cd 40                	int    $0x40
 65b:	c3                   	ret    

0000065c <dup>:
SYSCALL(dup)
 65c:	b8 0a 00 00 00       	mov    $0xa,%eax
 661:	cd 40                	int    $0x40
 663:	c3                   	ret    

00000664 <getpid>:
SYSCALL(getpid)
 664:	b8 0b 00 00 00       	mov    $0xb,%eax
 669:	cd 40                	int    $0x40
 66b:	c3                   	ret    

0000066c <sbrk>:
SYSCALL(sbrk)
 66c:	b8 0c 00 00 00       	mov    $0xc,%eax
 671:	cd 40                	int    $0x40
 673:	c3                   	ret    

00000674 <sleep>:
SYSCALL(sleep)
 674:	b8 0d 00 00 00       	mov    $0xd,%eax
 679:	cd 40                	int    $0x40
 67b:	c3                   	ret    

0000067c <uptime>:
SYSCALL(uptime)
 67c:	b8 0e 00 00 00       	mov    $0xe,%eax
 681:	cd 40                	int    $0x40
 683:	c3                   	ret    

00000684 <clone>:
SYSCALL(clone)
 684:	b8 16 00 00 00       	mov    $0x16,%eax
 689:	cd 40                	int    $0x40
 68b:	c3                   	ret    

0000068c <join>:
 68c:	b8 17 00 00 00       	mov    $0x17,%eax
 691:	cd 40                	int    $0x40
 693:	c3                   	ret    

00000694 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 694:	55                   	push   %ebp
 695:	89 e5                	mov    %esp,%ebp
 697:	83 ec 1c             	sub    $0x1c,%esp
 69a:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 69d:	6a 01                	push   $0x1
 69f:	8d 55 f4             	lea    -0xc(%ebp),%edx
 6a2:	52                   	push   %edx
 6a3:	50                   	push   %eax
 6a4:	e8 5b ff ff ff       	call   604 <write>
}
 6a9:	83 c4 10             	add    $0x10,%esp
 6ac:	c9                   	leave  
 6ad:	c3                   	ret    

000006ae <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 6ae:	55                   	push   %ebp
 6af:	89 e5                	mov    %esp,%ebp
 6b1:	57                   	push   %edi
 6b2:	56                   	push   %esi
 6b3:	53                   	push   %ebx
 6b4:	83 ec 2c             	sub    $0x2c,%esp
 6b7:	89 45 d0             	mov    %eax,-0x30(%ebp)
 6ba:	89 d0                	mov    %edx,%eax
 6bc:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 6be:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 6c2:	0f 95 c1             	setne  %cl
 6c5:	c1 ea 1f             	shr    $0x1f,%edx
 6c8:	84 d1                	test   %dl,%cl
 6ca:	74 44                	je     710 <printint+0x62>
    neg = 1;
    x = -xx;
 6cc:	f7 d8                	neg    %eax
 6ce:	89 c1                	mov    %eax,%ecx
    neg = 1;
 6d0:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 6d7:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 6dc:	89 c8                	mov    %ecx,%eax
 6de:	ba 00 00 00 00       	mov    $0x0,%edx
 6e3:	f7 f6                	div    %esi
 6e5:	89 df                	mov    %ebx,%edi
 6e7:	83 c3 01             	add    $0x1,%ebx
 6ea:	0f b6 92 14 0b 00 00 	movzbl 0xb14(%edx),%edx
 6f1:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 6f5:	89 ca                	mov    %ecx,%edx
 6f7:	89 c1                	mov    %eax,%ecx
 6f9:	39 d6                	cmp    %edx,%esi
 6fb:	76 df                	jbe    6dc <printint+0x2e>
  if(neg)
 6fd:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 701:	74 31                	je     734 <printint+0x86>
    buf[i++] = '-';
 703:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 708:	8d 5f 02             	lea    0x2(%edi),%ebx
 70b:	8b 75 d0             	mov    -0x30(%ebp),%esi
 70e:	eb 17                	jmp    727 <printint+0x79>
    x = xx;
 710:	89 c1                	mov    %eax,%ecx
  neg = 0;
 712:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 719:	eb bc                	jmp    6d7 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 71b:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 720:	89 f0                	mov    %esi,%eax
 722:	e8 6d ff ff ff       	call   694 <putc>
  while(--i >= 0)
 727:	83 eb 01             	sub    $0x1,%ebx
 72a:	79 ef                	jns    71b <printint+0x6d>
}
 72c:	83 c4 2c             	add    $0x2c,%esp
 72f:	5b                   	pop    %ebx
 730:	5e                   	pop    %esi
 731:	5f                   	pop    %edi
 732:	5d                   	pop    %ebp
 733:	c3                   	ret    
 734:	8b 75 d0             	mov    -0x30(%ebp),%esi
 737:	eb ee                	jmp    727 <printint+0x79>

00000739 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 739:	55                   	push   %ebp
 73a:	89 e5                	mov    %esp,%ebp
 73c:	57                   	push   %edi
 73d:	56                   	push   %esi
 73e:	53                   	push   %ebx
 73f:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 742:	8d 45 10             	lea    0x10(%ebp),%eax
 745:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 748:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 74d:	bb 00 00 00 00       	mov    $0x0,%ebx
 752:	eb 14                	jmp    768 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 754:	89 fa                	mov    %edi,%edx
 756:	8b 45 08             	mov    0x8(%ebp),%eax
 759:	e8 36 ff ff ff       	call   694 <putc>
 75e:	eb 05                	jmp    765 <printf+0x2c>
      }
    } else if(state == '%'){
 760:	83 fe 25             	cmp    $0x25,%esi
 763:	74 25                	je     78a <printf+0x51>
  for(i = 0; fmt[i]; i++){
 765:	83 c3 01             	add    $0x1,%ebx
 768:	8b 45 0c             	mov    0xc(%ebp),%eax
 76b:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 76f:	84 c0                	test   %al,%al
 771:	0f 84 20 01 00 00    	je     897 <printf+0x15e>
    c = fmt[i] & 0xff;
 777:	0f be f8             	movsbl %al,%edi
 77a:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 77d:	85 f6                	test   %esi,%esi
 77f:	75 df                	jne    760 <printf+0x27>
      if(c == '%'){
 781:	83 f8 25             	cmp    $0x25,%eax
 784:	75 ce                	jne    754 <printf+0x1b>
        state = '%';
 786:	89 c6                	mov    %eax,%esi
 788:	eb db                	jmp    765 <printf+0x2c>
      if(c == 'd'){
 78a:	83 f8 25             	cmp    $0x25,%eax
 78d:	0f 84 cf 00 00 00    	je     862 <printf+0x129>
 793:	0f 8c dd 00 00 00    	jl     876 <printf+0x13d>
 799:	83 f8 78             	cmp    $0x78,%eax
 79c:	0f 8f d4 00 00 00    	jg     876 <printf+0x13d>
 7a2:	83 f8 63             	cmp    $0x63,%eax
 7a5:	0f 8c cb 00 00 00    	jl     876 <printf+0x13d>
 7ab:	83 e8 63             	sub    $0x63,%eax
 7ae:	83 f8 15             	cmp    $0x15,%eax
 7b1:	0f 87 bf 00 00 00    	ja     876 <printf+0x13d>
 7b7:	ff 24 85 bc 0a 00 00 	jmp    *0xabc(,%eax,4)
        printint(fd, *ap, 10, 1);
 7be:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7c1:	8b 17                	mov    (%edi),%edx
 7c3:	83 ec 0c             	sub    $0xc,%esp
 7c6:	6a 01                	push   $0x1
 7c8:	b9 0a 00 00 00       	mov    $0xa,%ecx
 7cd:	8b 45 08             	mov    0x8(%ebp),%eax
 7d0:	e8 d9 fe ff ff       	call   6ae <printint>
        ap++;
 7d5:	83 c7 04             	add    $0x4,%edi
 7d8:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 7db:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 7de:	be 00 00 00 00       	mov    $0x0,%esi
 7e3:	eb 80                	jmp    765 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 7e5:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7e8:	8b 17                	mov    (%edi),%edx
 7ea:	83 ec 0c             	sub    $0xc,%esp
 7ed:	6a 00                	push   $0x0
 7ef:	b9 10 00 00 00       	mov    $0x10,%ecx
 7f4:	8b 45 08             	mov    0x8(%ebp),%eax
 7f7:	e8 b2 fe ff ff       	call   6ae <printint>
        ap++;
 7fc:	83 c7 04             	add    $0x4,%edi
 7ff:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 802:	83 c4 10             	add    $0x10,%esp
      state = 0;
 805:	be 00 00 00 00       	mov    $0x0,%esi
 80a:	e9 56 ff ff ff       	jmp    765 <printf+0x2c>
        s = (char*)*ap;
 80f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 812:	8b 30                	mov    (%eax),%esi
        ap++;
 814:	83 c0 04             	add    $0x4,%eax
 817:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 81a:	85 f6                	test   %esi,%esi
 81c:	75 15                	jne    833 <printf+0xfa>
          s = "(null)";
 81e:	be b5 0a 00 00       	mov    $0xab5,%esi
 823:	eb 0e                	jmp    833 <printf+0xfa>
          putc(fd, *s);
 825:	0f be d2             	movsbl %dl,%edx
 828:	8b 45 08             	mov    0x8(%ebp),%eax
 82b:	e8 64 fe ff ff       	call   694 <putc>
          s++;
 830:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 833:	0f b6 16             	movzbl (%esi),%edx
 836:	84 d2                	test   %dl,%dl
 838:	75 eb                	jne    825 <printf+0xec>
      state = 0;
 83a:	be 00 00 00 00       	mov    $0x0,%esi
 83f:	e9 21 ff ff ff       	jmp    765 <printf+0x2c>
        putc(fd, *ap);
 844:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 847:	0f be 17             	movsbl (%edi),%edx
 84a:	8b 45 08             	mov    0x8(%ebp),%eax
 84d:	e8 42 fe ff ff       	call   694 <putc>
        ap++;
 852:	83 c7 04             	add    $0x4,%edi
 855:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 858:	be 00 00 00 00       	mov    $0x0,%esi
 85d:	e9 03 ff ff ff       	jmp    765 <printf+0x2c>
        putc(fd, c);
 862:	89 fa                	mov    %edi,%edx
 864:	8b 45 08             	mov    0x8(%ebp),%eax
 867:	e8 28 fe ff ff       	call   694 <putc>
      state = 0;
 86c:	be 00 00 00 00       	mov    $0x0,%esi
 871:	e9 ef fe ff ff       	jmp    765 <printf+0x2c>
        putc(fd, '%');
 876:	ba 25 00 00 00       	mov    $0x25,%edx
 87b:	8b 45 08             	mov    0x8(%ebp),%eax
 87e:	e8 11 fe ff ff       	call   694 <putc>
        putc(fd, c);
 883:	89 fa                	mov    %edi,%edx
 885:	8b 45 08             	mov    0x8(%ebp),%eax
 888:	e8 07 fe ff ff       	call   694 <putc>
      state = 0;
 88d:	be 00 00 00 00       	mov    $0x0,%esi
 892:	e9 ce fe ff ff       	jmp    765 <printf+0x2c>
    }
  }
}
 897:	8d 65 f4             	lea    -0xc(%ebp),%esp
 89a:	5b                   	pop    %ebx
 89b:	5e                   	pop    %esi
 89c:	5f                   	pop    %edi
 89d:	5d                   	pop    %ebp
 89e:	c3                   	ret    

0000089f <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 89f:	55                   	push   %ebp
 8a0:	89 e5                	mov    %esp,%ebp
 8a2:	57                   	push   %edi
 8a3:	56                   	push   %esi
 8a4:	53                   	push   %ebx
 8a5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 8a8:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8ab:	a1 a4 0e 00 00       	mov    0xea4,%eax
 8b0:	eb 02                	jmp    8b4 <free+0x15>
 8b2:	89 d0                	mov    %edx,%eax
 8b4:	39 c8                	cmp    %ecx,%eax
 8b6:	73 04                	jae    8bc <free+0x1d>
 8b8:	39 08                	cmp    %ecx,(%eax)
 8ba:	77 12                	ja     8ce <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8bc:	8b 10                	mov    (%eax),%edx
 8be:	39 c2                	cmp    %eax,%edx
 8c0:	77 f0                	ja     8b2 <free+0x13>
 8c2:	39 c8                	cmp    %ecx,%eax
 8c4:	72 08                	jb     8ce <free+0x2f>
 8c6:	39 ca                	cmp    %ecx,%edx
 8c8:	77 04                	ja     8ce <free+0x2f>
 8ca:	89 d0                	mov    %edx,%eax
 8cc:	eb e6                	jmp    8b4 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 8ce:	8b 73 fc             	mov    -0x4(%ebx),%esi
 8d1:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 8d4:	8b 10                	mov    (%eax),%edx
 8d6:	39 d7                	cmp    %edx,%edi
 8d8:	74 19                	je     8f3 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 8da:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 8dd:	8b 50 04             	mov    0x4(%eax),%edx
 8e0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 8e3:	39 ce                	cmp    %ecx,%esi
 8e5:	74 1b                	je     902 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 8e7:	89 08                	mov    %ecx,(%eax)
  freep = p;
 8e9:	a3 a4 0e 00 00       	mov    %eax,0xea4
}
 8ee:	5b                   	pop    %ebx
 8ef:	5e                   	pop    %esi
 8f0:	5f                   	pop    %edi
 8f1:	5d                   	pop    %ebp
 8f2:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 8f3:	03 72 04             	add    0x4(%edx),%esi
 8f6:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 8f9:	8b 10                	mov    (%eax),%edx
 8fb:	8b 12                	mov    (%edx),%edx
 8fd:	89 53 f8             	mov    %edx,-0x8(%ebx)
 900:	eb db                	jmp    8dd <free+0x3e>
    p->s.size += bp->s.size;
 902:	03 53 fc             	add    -0x4(%ebx),%edx
 905:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 908:	8b 53 f8             	mov    -0x8(%ebx),%edx
 90b:	89 10                	mov    %edx,(%eax)
 90d:	eb da                	jmp    8e9 <free+0x4a>

0000090f <morecore>:

static Header*
morecore(uint nu)
{
 90f:	55                   	push   %ebp
 910:	89 e5                	mov    %esp,%ebp
 912:	53                   	push   %ebx
 913:	83 ec 04             	sub    $0x4,%esp
 916:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 918:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 91d:	77 05                	ja     924 <morecore+0x15>
    nu = 4096;
 91f:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 924:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 92b:	83 ec 0c             	sub    $0xc,%esp
 92e:	50                   	push   %eax
 92f:	e8 38 fd ff ff       	call   66c <sbrk>
  if(p == (char*)-1)
 934:	83 c4 10             	add    $0x10,%esp
 937:	83 f8 ff             	cmp    $0xffffffff,%eax
 93a:	74 1c                	je     958 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 93c:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 93f:	83 c0 08             	add    $0x8,%eax
 942:	83 ec 0c             	sub    $0xc,%esp
 945:	50                   	push   %eax
 946:	e8 54 ff ff ff       	call   89f <free>
  return freep;
 94b:	a1 a4 0e 00 00       	mov    0xea4,%eax
 950:	83 c4 10             	add    $0x10,%esp
}
 953:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 956:	c9                   	leave  
 957:	c3                   	ret    
    return 0;
 958:	b8 00 00 00 00       	mov    $0x0,%eax
 95d:	eb f4                	jmp    953 <morecore+0x44>

0000095f <malloc>:

void*
malloc(uint nbytes)
{
 95f:	55                   	push   %ebp
 960:	89 e5                	mov    %esp,%ebp
 962:	53                   	push   %ebx
 963:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 966:	8b 45 08             	mov    0x8(%ebp),%eax
 969:	8d 58 07             	lea    0x7(%eax),%ebx
 96c:	c1 eb 03             	shr    $0x3,%ebx
 96f:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 972:	8b 0d a4 0e 00 00    	mov    0xea4,%ecx
 978:	85 c9                	test   %ecx,%ecx
 97a:	74 04                	je     980 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 97c:	8b 01                	mov    (%ecx),%eax
 97e:	eb 4a                	jmp    9ca <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 980:	c7 05 a4 0e 00 00 a8 	movl   $0xea8,0xea4
 987:	0e 00 00 
 98a:	c7 05 a8 0e 00 00 a8 	movl   $0xea8,0xea8
 991:	0e 00 00 
    base.s.size = 0;
 994:	c7 05 ac 0e 00 00 00 	movl   $0x0,0xeac
 99b:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 99e:	b9 a8 0e 00 00       	mov    $0xea8,%ecx
 9a3:	eb d7                	jmp    97c <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 9a5:	74 19                	je     9c0 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 9a7:	29 da                	sub    %ebx,%edx
 9a9:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 9ac:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 9af:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 9b2:	89 0d a4 0e 00 00    	mov    %ecx,0xea4
      return (void*)(p + 1);
 9b8:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 9bb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 9be:	c9                   	leave  
 9bf:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 9c0:	8b 10                	mov    (%eax),%edx
 9c2:	89 11                	mov    %edx,(%ecx)
 9c4:	eb ec                	jmp    9b2 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9c6:	89 c1                	mov    %eax,%ecx
 9c8:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 9ca:	8b 50 04             	mov    0x4(%eax),%edx
 9cd:	39 da                	cmp    %ebx,%edx
 9cf:	73 d4                	jae    9a5 <malloc+0x46>
    if(p == freep)
 9d1:	39 05 a4 0e 00 00    	cmp    %eax,0xea4
 9d7:	75 ed                	jne    9c6 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 9d9:	89 d8                	mov    %ebx,%eax
 9db:	e8 2f ff ff ff       	call   90f <morecore>
 9e0:	85 c0                	test   %eax,%eax
 9e2:	75 e2                	jne    9c6 <malloc+0x67>
 9e4:	eb d5                	jmp    9bb <malloc+0x5c>
