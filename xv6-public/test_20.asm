
_test_20:     file format elf32-i386


Disassembly of section .text:

00000000 <worker2>:
   printf(1, "TEST PASSED\n");
   exit();
}

void worker2(void *arg1, void *arg2)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 14             	sub    $0x14,%esp
   lock_acquire(&lock);
   6:	68 7c 0e 00 00       	push   $0xe7c
   b:	e8 f8 03 00 00       	call   408 <lock_acquire>
   assert((unsigned int)sbrk(0) == size);
  10:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  17:	e8 51 06 00 00       	call   66d <sbrk>
  1c:	83 c4 10             	add    $0x10,%esp
  1f:	3b 05 80 0e 00 00    	cmp    0xe80,%eax
  25:	74 49                	je     70 <worker2+0x70>
  27:	6a 31                	push   $0x31
  29:	68 e8 09 00 00       	push   $0x9e8
  2e:	68 f2 09 00 00       	push   $0x9f2
  33:	6a 01                	push   $0x1
  35:	e8 00 07 00 00       	call   73a <printf>
  3a:	83 c4 0c             	add    $0xc,%esp
  3d:	68 fa 09 00 00       	push   $0x9fa
  42:	68 18 0a 00 00       	push   $0xa18
  47:	6a 01                	push   $0x1
  49:	e8 ec 06 00 00       	call   73a <printf>
  4e:	83 c4 08             	add    $0x8,%esp
  51:	68 2c 0a 00 00       	push   $0xa2c
  56:	6a 01                	push   $0x1
  58:	e8 dd 06 00 00       	call   73a <printf>
  5d:	83 c4 04             	add    $0x4,%esp
  60:	ff 35 88 0e 00 00    	push   0xe88
  66:	e8 aa 05 00 00       	call   615 <kill>
  6b:	e8 75 05 00 00       	call   5e5 <exit>
   global++;
  70:	83 05 84 0e 00 00 01 	addl   $0x1,0xe84
   lock_release(&lock);
  77:	83 ec 0c             	sub    $0xc,%esp
  7a:	68 7c 0e 00 00       	push   $0xe7c
  7f:	e8 a6 03 00 00       	call   42a <lock_release>

   
   lock_acquire(&lock2);
  84:	c7 04 24 78 0e 00 00 	movl   $0xe78,(%esp)
  8b:	e8 78 03 00 00       	call   408 <lock_acquire>
   assert((unsigned int)sbrk(0) == size);
  90:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  97:	e8 d1 05 00 00       	call   66d <sbrk>
  9c:	83 c4 10             	add    $0x10,%esp
  9f:	3b 05 80 0e 00 00    	cmp    0xe80,%eax
  a5:	74 49                	je     f0 <worker2+0xf0>
  a7:	6a 37                	push   $0x37
  a9:	68 e8 09 00 00       	push   $0x9e8
  ae:	68 f2 09 00 00       	push   $0x9f2
  b3:	6a 01                	push   $0x1
  b5:	e8 80 06 00 00       	call   73a <printf>
  ba:	83 c4 0c             	add    $0xc,%esp
  bd:	68 fa 09 00 00       	push   $0x9fa
  c2:	68 18 0a 00 00       	push   $0xa18
  c7:	6a 01                	push   $0x1
  c9:	e8 6c 06 00 00       	call   73a <printf>
  ce:	83 c4 08             	add    $0x8,%esp
  d1:	68 2c 0a 00 00       	push   $0xa2c
  d6:	6a 01                	push   $0x1
  d8:	e8 5d 06 00 00       	call   73a <printf>
  dd:	83 c4 04             	add    $0x4,%esp
  e0:	ff 35 88 0e 00 00    	push   0xe88
  e6:	e8 2a 05 00 00       	call   615 <kill>
  eb:	e8 f5 04 00 00       	call   5e5 <exit>
   global++;
  f0:	83 05 84 0e 00 00 01 	addl   $0x1,0xe84
   lock_release(&lock2);
  f7:	83 ec 0c             	sub    $0xc,%esp
  fa:	68 78 0e 00 00       	push   $0xe78
  ff:	e8 26 03 00 00       	call   42a <lock_release>

   
   exit();
 104:	e8 dc 04 00 00       	call   5e5 <exit>

00000109 <worker>:
}


void worker(void *arg1, void *arg2) {
 109:	55                   	push   %ebp
 10a:	89 e5                	mov    %esp,%ebp
 10c:	83 ec 14             	sub    $0x14,%esp
   lock_init(&lock);
 10f:	68 7c 0e 00 00       	push   $0xe7c
 114:	e8 1f 03 00 00       	call   438 <lock_init>
   lock_init(&lock2);
 119:	c7 04 24 78 0e 00 00 	movl   $0xe78,(%esp)
 120:	e8 13 03 00 00       	call   438 <lock_init>
   lock_acquire(&lock);
 125:	c7 04 24 7c 0e 00 00 	movl   $0xe7c,(%esp)
 12c:	e8 d7 02 00 00       	call   408 <lock_acquire>
   lock_acquire(&lock2);
 131:	c7 04 24 78 0e 00 00 	movl   $0xe78,(%esp)
 138:	e8 cb 02 00 00       	call   408 <lock_acquire>

   int nested_thread_id = thread_create(worker2, 0, 0);
 13d:	83 c4 0c             	add    $0xc,%esp
 140:	6a 00                	push   $0x0
 142:	6a 00                	push   $0x0
 144:	68 00 00 00 00       	push   $0x0
 149:	e8 82 02 00 00       	call   3d0 <thread_create>
    assert(nested_thread_id > 0);
 14e:	83 c4 10             	add    $0x10,%esp
 151:	85 c0                	test   %eax,%eax
 153:	7e 14                	jle    169 <worker+0x60>
   size = (unsigned int)sbrk(0);
 155:	83 ec 0c             	sub    $0xc,%esp
 158:	6a 00                	push   $0x0
 15a:	e8 0e 05 00 00       	call   66d <sbrk>
 15f:	a3 80 0e 00 00       	mov    %eax,0xe80

   while (global < num_threads) {
 164:	83 c4 10             	add    $0x10,%esp
 167:	eb 71                	jmp    1da <worker+0xd1>
    assert(nested_thread_id > 0);
 169:	6a 47                	push   $0x47
 16b:	68 e8 09 00 00       	push   $0x9e8
 170:	68 f2 09 00 00       	push   $0x9f2
 175:	6a 01                	push   $0x1
 177:	e8 be 05 00 00       	call   73a <printf>
 17c:	83 c4 0c             	add    $0xc,%esp
 17f:	68 39 0a 00 00       	push   $0xa39
 184:	68 18 0a 00 00       	push   $0xa18
 189:	6a 01                	push   $0x1
 18b:	e8 aa 05 00 00       	call   73a <printf>
 190:	83 c4 08             	add    $0x8,%esp
 193:	68 2c 0a 00 00       	push   $0xa2c
 198:	6a 01                	push   $0x1
 19a:	e8 9b 05 00 00       	call   73a <printf>
 19f:	83 c4 04             	add    $0x4,%esp
 1a2:	ff 35 88 0e 00 00    	push   0xe88
 1a8:	e8 68 04 00 00       	call   615 <kill>
 1ad:	e8 33 04 00 00       	call   5e5 <exit>
      lock_release(&lock);
 1b2:	83 ec 0c             	sub    $0xc,%esp
 1b5:	68 7c 0e 00 00       	push   $0xe7c
 1ba:	e8 6b 02 00 00       	call   42a <lock_release>
      sleep(100);
 1bf:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 1c6:	e8 aa 04 00 00       	call   675 <sleep>
      lock_acquire(&lock);
 1cb:	c7 04 24 7c 0e 00 00 	movl   $0xe7c,(%esp)
 1d2:	e8 31 02 00 00       	call   408 <lock_acquire>
 1d7:	83 c4 10             	add    $0x10,%esp
   while (global < num_threads) {
 1da:	a1 74 0e 00 00       	mov    0xe74,%eax
 1df:	39 05 84 0e 00 00    	cmp    %eax,0xe84
 1e5:	7c cb                	jl     1b2 <worker+0xa9>
   }

   global = 0;
 1e7:	c7 05 84 0e 00 00 00 	movl   $0x0,0xe84
 1ee:	00 00 00 
   sbrk(10000);
 1f1:	83 ec 0c             	sub    $0xc,%esp
 1f4:	68 10 27 00 00       	push   $0x2710
 1f9:	e8 6f 04 00 00       	call   66d <sbrk>
   size = (unsigned int)sbrk(0);
 1fe:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 205:	e8 63 04 00 00       	call   66d <sbrk>
 20a:	a3 80 0e 00 00       	mov    %eax,0xe80
   lock_release(&lock);
 20f:	c7 04 24 7c 0e 00 00 	movl   $0xe7c,(%esp)
 216:	e8 0f 02 00 00       	call   42a <lock_release>

   while (global < num_threads) {
 21b:	83 c4 10             	add    $0x10,%esp
 21e:	eb 28                	jmp    248 <worker+0x13f>
      lock_release(&lock2);
 220:	83 ec 0c             	sub    $0xc,%esp
 223:	68 78 0e 00 00       	push   $0xe78
 228:	e8 fd 01 00 00       	call   42a <lock_release>
      sleep(100);
 22d:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 234:	e8 3c 04 00 00       	call   675 <sleep>
      lock_acquire(&lock2);
 239:	c7 04 24 78 0e 00 00 	movl   $0xe78,(%esp)
 240:	e8 c3 01 00 00       	call   408 <lock_acquire>
 245:	83 c4 10             	add    $0x10,%esp
   while (global < num_threads) {
 248:	a1 74 0e 00 00       	mov    0xe74,%eax
 24d:	39 05 84 0e 00 00    	cmp    %eax,0xe84
 253:	7c cb                	jl     220 <worker+0x117>
   }
   lock_release(&lock2);
 255:	83 ec 0c             	sub    $0xc,%esp
 258:	68 78 0e 00 00       	push   $0xe78
 25d:	e8 c8 01 00 00       	call   42a <lock_release>

   int nested_join_pid = thread_join();
 262:	e8 9b 01 00 00       	call   402 <thread_join>
   assert(nested_join_pid > 0);
 267:	83 c4 10             	add    $0x10,%esp
 26a:	85 c0                	test   %eax,%eax
 26c:	7e 05                	jle    273 <worker+0x16a>




   exit();
 26e:	e8 72 03 00 00       	call   5e5 <exit>
   assert(nested_join_pid > 0);
 273:	6a 5d                	push   $0x5d
 275:	68 e8 09 00 00       	push   $0x9e8
 27a:	68 f2 09 00 00       	push   $0x9f2
 27f:	6a 01                	push   $0x1
 281:	e8 b4 04 00 00       	call   73a <printf>
 286:	83 c4 0c             	add    $0xc,%esp
 289:	68 4e 0a 00 00       	push   $0xa4e
 28e:	68 18 0a 00 00       	push   $0xa18
 293:	6a 01                	push   $0x1
 295:	e8 a0 04 00 00       	call   73a <printf>
 29a:	83 c4 08             	add    $0x8,%esp
 29d:	68 2c 0a 00 00       	push   $0xa2c
 2a2:	6a 01                	push   $0x1
 2a4:	e8 91 04 00 00       	call   73a <printf>
 2a9:	83 c4 04             	add    $0x4,%esp
 2ac:	ff 35 88 0e 00 00    	push   0xe88
 2b2:	e8 5e 03 00 00       	call   615 <kill>
 2b7:	e8 29 03 00 00       	call   5e5 <exit>

000002bc <main>:
{
 2bc:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 2c0:	83 e4 f0             	and    $0xfffffff0,%esp
 2c3:	ff 71 fc             	push   -0x4(%ecx)
 2c6:	55                   	push   %ebp
 2c7:	89 e5                	mov    %esp,%ebp
 2c9:	51                   	push   %ecx
 2ca:	83 ec 14             	sub    $0x14,%esp
   ppid = getpid();
 2cd:	e8 93 03 00 00       	call   665 <getpid>
 2d2:	a3 88 0e 00 00       	mov    %eax,0xe88
   int arg1 = 11, arg2 = 22;
 2d7:	c7 45 f4 0b 00 00 00 	movl   $0xb,-0xc(%ebp)
 2de:	c7 45 f0 16 00 00 00 	movl   $0x16,-0x10(%ebp)
   size = (unsigned int)sbrk(0);
 2e5:	83 ec 0c             	sub    $0xc,%esp
 2e8:	6a 00                	push   $0x0
 2ea:	e8 7e 03 00 00       	call   66d <sbrk>
 2ef:	a3 80 0e 00 00       	mov    %eax,0xe80
   int thread_pid = thread_create(worker, &arg1, &arg2);
 2f4:	83 c4 0c             	add    $0xc,%esp
 2f7:	8d 45 f0             	lea    -0x10(%ebp),%eax
 2fa:	50                   	push   %eax
 2fb:	8d 45 f4             	lea    -0xc(%ebp),%eax
 2fe:	50                   	push   %eax
 2ff:	68 09 01 00 00       	push   $0x109
 304:	e8 c7 00 00 00       	call   3d0 <thread_create>
   assert(thread_pid > 0);
 309:	83 c4 10             	add    $0x10,%esp
 30c:	85 c0                	test   %eax,%eax
 30e:	7e 1d                	jle    32d <main+0x71>
   int join_pid = thread_join();
 310:	e8 ed 00 00 00       	call   402 <thread_join>
   assert(join_pid > 0);
 315:	85 c0                	test   %eax,%eax
 317:	7e 5d                	jle    376 <main+0xba>
   printf(1, "TEST PASSED\n");
 319:	83 ec 08             	sub    $0x8,%esp
 31c:	68 71 0a 00 00       	push   $0xa71
 321:	6a 01                	push   $0x1
 323:	e8 12 04 00 00       	call   73a <printf>
   exit();
 328:	e8 b8 02 00 00       	call   5e5 <exit>
   assert(thread_pid > 0);
 32d:	6a 24                	push   $0x24
 32f:	68 e8 09 00 00       	push   $0x9e8
 334:	68 f2 09 00 00       	push   $0x9f2
 339:	6a 01                	push   $0x1
 33b:	e8 fa 03 00 00       	call   73a <printf>
 340:	83 c4 0c             	add    $0xc,%esp
 343:	68 62 0a 00 00       	push   $0xa62
 348:	68 18 0a 00 00       	push   $0xa18
 34d:	6a 01                	push   $0x1
 34f:	e8 e6 03 00 00       	call   73a <printf>
 354:	83 c4 08             	add    $0x8,%esp
 357:	68 2c 0a 00 00       	push   $0xa2c
 35c:	6a 01                	push   $0x1
 35e:	e8 d7 03 00 00       	call   73a <printf>
 363:	83 c4 04             	add    $0x4,%esp
 366:	ff 35 88 0e 00 00    	push   0xe88
 36c:	e8 a4 02 00 00       	call   615 <kill>
 371:	e8 6f 02 00 00       	call   5e5 <exit>
   assert(join_pid > 0);
 376:	6a 27                	push   $0x27
 378:	68 e8 09 00 00       	push   $0x9e8
 37d:	68 f2 09 00 00       	push   $0x9f2
 382:	6a 01                	push   $0x1
 384:	e8 b1 03 00 00       	call   73a <printf>
 389:	83 c4 0c             	add    $0xc,%esp
 38c:	68 55 0a 00 00       	push   $0xa55
 391:	68 18 0a 00 00       	push   $0xa18
 396:	6a 01                	push   $0x1
 398:	e8 9d 03 00 00       	call   73a <printf>
 39d:	83 c4 08             	add    $0x8,%esp
 3a0:	68 2c 0a 00 00       	push   $0xa2c
 3a5:	6a 01                	push   $0x1
 3a7:	e8 8e 03 00 00       	call   73a <printf>
 3ac:	83 c4 04             	add    $0x4,%esp
 3af:	ff 35 88 0e 00 00    	push   0xe88
 3b5:	e8 5b 02 00 00       	call   615 <kill>
 3ba:	e8 26 02 00 00       	call   5e5 <exit>

000003bf <test_and_set>:
#include "fcntl.h"
#include "user.h"
#include "x86.h"
#include "mmu.h"

int test_and_set(int *old_ptr, int new_ptr) {
 3bf:	55                   	push   %ebp
 3c0:	89 e5                	mov    %esp,%ebp
 3c2:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *old_ptr;
 3c5:	8b 10                	mov    (%eax),%edx
  *old_ptr = new_ptr;
 3c7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 3ca:	89 08                	mov    %ecx,(%eax)
  return old;
}
 3cc:	89 d0                	mov    %edx,%eax
 3ce:	5d                   	pop    %ebp
 3cf:	c3                   	ret    

000003d0 <thread_create>:

// a wrapper func for clone
int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 3d0:	55                   	push   %ebp
 3d1:	89 e5                	mov    %esp,%ebp
 3d3:	83 ec 14             	sub    $0x14,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE);
 3d6:	68 00 10 00 00       	push   $0x1000
 3db:	e8 80 05 00 00       	call   960 <malloc>
  if(n_stack == 0){
 3e0:	83 c4 10             	add    $0x10,%esp
 3e3:	85 c0                	test   %eax,%eax
 3e5:	74 14                	je     3fb <thread_create+0x2b>
    return -1;
  }
  int new_pid = clone(start_routine, arg1, arg2, n_stack); // TODO: is this the right way to call it?
 3e7:	50                   	push   %eax
 3e8:	ff 75 10             	push   0x10(%ebp)
 3eb:	ff 75 0c             	push   0xc(%ebp)
 3ee:	ff 75 08             	push   0x8(%ebp)
 3f1:	e8 8f 02 00 00       	call   685 <clone>


  // I can't remember if there was something else to do here but I'm sure I'll find out


  return new_pid;
 3f6:	83 c4 10             	add    $0x10,%esp
}
 3f9:	c9                   	leave  
 3fa:	c3                   	ret    
    return -1;
 3fb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 400:	eb f7                	jmp    3f9 <thread_create+0x29>

00000402 <thread_join>:

int thread_join() {
  return 0;
}
 402:	b8 00 00 00 00       	mov    $0x0,%eax
 407:	c3                   	ret    

00000408 <lock_acquire>:

void lock_acquire(lock_t *lock){
 408:	55                   	push   %ebp
 409:	89 e5                	mov    %esp,%ebp
 40b:	53                   	push   %ebx
 40c:	83 ec 04             	sub    $0x4,%esp
 40f:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 412:	83 ec 08             	sub    $0x8,%esp
 415:	6a 01                	push   $0x1
 417:	53                   	push   %ebx
 418:	e8 a2 ff ff ff       	call   3bf <test_and_set>
 41d:	83 c4 10             	add    $0x10,%esp
 420:	83 f8 01             	cmp    $0x1,%eax
 423:	74 ed                	je     412 <lock_acquire+0xa>
    ;
}
 425:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 428:	c9                   	leave  
 429:	c3                   	ret    

0000042a <lock_release>:

void lock_release(lock_t *lock) {
 42a:	55                   	push   %ebp
 42b:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 42d:	8b 45 08             	mov    0x8(%ebp),%eax
 430:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 436:	5d                   	pop    %ebp
 437:	c3                   	ret    

00000438 <lock_init>:

void lock_init(lock_t *lock) {
 438:	55                   	push   %ebp
 439:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 43b:	8b 45 08             	mov    0x8(%ebp),%eax
 43e:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 444:	5d                   	pop    %ebp
 445:	c3                   	ret    

00000446 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 446:	55                   	push   %ebp
 447:	89 e5                	mov    %esp,%ebp
 449:	56                   	push   %esi
 44a:	53                   	push   %ebx
 44b:	8b 75 08             	mov    0x8(%ebp),%esi
 44e:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 451:	89 f0                	mov    %esi,%eax
 453:	89 d1                	mov    %edx,%ecx
 455:	83 c2 01             	add    $0x1,%edx
 458:	89 c3                	mov    %eax,%ebx
 45a:	83 c0 01             	add    $0x1,%eax
 45d:	0f b6 09             	movzbl (%ecx),%ecx
 460:	88 0b                	mov    %cl,(%ebx)
 462:	84 c9                	test   %cl,%cl
 464:	75 ed                	jne    453 <strcpy+0xd>
    ;
  return os;
}
 466:	89 f0                	mov    %esi,%eax
 468:	5b                   	pop    %ebx
 469:	5e                   	pop    %esi
 46a:	5d                   	pop    %ebp
 46b:	c3                   	ret    

0000046c <strcmp>:

int
strcmp(const char *p, const char *q)
{
 46c:	55                   	push   %ebp
 46d:	89 e5                	mov    %esp,%ebp
 46f:	8b 4d 08             	mov    0x8(%ebp),%ecx
 472:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 475:	eb 06                	jmp    47d <strcmp+0x11>
    p++, q++;
 477:	83 c1 01             	add    $0x1,%ecx
 47a:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 47d:	0f b6 01             	movzbl (%ecx),%eax
 480:	84 c0                	test   %al,%al
 482:	74 04                	je     488 <strcmp+0x1c>
 484:	3a 02                	cmp    (%edx),%al
 486:	74 ef                	je     477 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 488:	0f b6 c0             	movzbl %al,%eax
 48b:	0f b6 12             	movzbl (%edx),%edx
 48e:	29 d0                	sub    %edx,%eax
}
 490:	5d                   	pop    %ebp
 491:	c3                   	ret    

00000492 <strlen>:

uint
strlen(const char *s)
{
 492:	55                   	push   %ebp
 493:	89 e5                	mov    %esp,%ebp
 495:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 498:	b8 00 00 00 00       	mov    $0x0,%eax
 49d:	eb 03                	jmp    4a2 <strlen+0x10>
 49f:	83 c0 01             	add    $0x1,%eax
 4a2:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 4a6:	75 f7                	jne    49f <strlen+0xd>
    ;
  return n;
}
 4a8:	5d                   	pop    %ebp
 4a9:	c3                   	ret    

000004aa <memset>:

void*
memset(void *dst, int c, uint n)
{
 4aa:	55                   	push   %ebp
 4ab:	89 e5                	mov    %esp,%ebp
 4ad:	57                   	push   %edi
 4ae:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 4b1:	89 d7                	mov    %edx,%edi
 4b3:	8b 4d 10             	mov    0x10(%ebp),%ecx
 4b6:	8b 45 0c             	mov    0xc(%ebp),%eax
 4b9:	fc                   	cld    
 4ba:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 4bc:	89 d0                	mov    %edx,%eax
 4be:	8b 7d fc             	mov    -0x4(%ebp),%edi
 4c1:	c9                   	leave  
 4c2:	c3                   	ret    

000004c3 <strchr>:

char*
strchr(const char *s, char c)
{
 4c3:	55                   	push   %ebp
 4c4:	89 e5                	mov    %esp,%ebp
 4c6:	8b 45 08             	mov    0x8(%ebp),%eax
 4c9:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 4cd:	eb 03                	jmp    4d2 <strchr+0xf>
 4cf:	83 c0 01             	add    $0x1,%eax
 4d2:	0f b6 10             	movzbl (%eax),%edx
 4d5:	84 d2                	test   %dl,%dl
 4d7:	74 06                	je     4df <strchr+0x1c>
    if(*s == c)
 4d9:	38 ca                	cmp    %cl,%dl
 4db:	75 f2                	jne    4cf <strchr+0xc>
 4dd:	eb 05                	jmp    4e4 <strchr+0x21>
      return (char*)s;
  return 0;
 4df:	b8 00 00 00 00       	mov    $0x0,%eax
}
 4e4:	5d                   	pop    %ebp
 4e5:	c3                   	ret    

000004e6 <gets>:

char*
gets(char *buf, int max)
{
 4e6:	55                   	push   %ebp
 4e7:	89 e5                	mov    %esp,%ebp
 4e9:	57                   	push   %edi
 4ea:	56                   	push   %esi
 4eb:	53                   	push   %ebx
 4ec:	83 ec 1c             	sub    $0x1c,%esp
 4ef:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 4f2:	bb 00 00 00 00       	mov    $0x0,%ebx
 4f7:	89 de                	mov    %ebx,%esi
 4f9:	83 c3 01             	add    $0x1,%ebx
 4fc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 4ff:	7d 2e                	jge    52f <gets+0x49>
    cc = read(0, &c, 1);
 501:	83 ec 04             	sub    $0x4,%esp
 504:	6a 01                	push   $0x1
 506:	8d 45 e7             	lea    -0x19(%ebp),%eax
 509:	50                   	push   %eax
 50a:	6a 00                	push   $0x0
 50c:	e8 ec 00 00 00       	call   5fd <read>
    if(cc < 1)
 511:	83 c4 10             	add    $0x10,%esp
 514:	85 c0                	test   %eax,%eax
 516:	7e 17                	jle    52f <gets+0x49>
      break;
    buf[i++] = c;
 518:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 51c:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 51f:	3c 0a                	cmp    $0xa,%al
 521:	0f 94 c2             	sete   %dl
 524:	3c 0d                	cmp    $0xd,%al
 526:	0f 94 c0             	sete   %al
 529:	08 c2                	or     %al,%dl
 52b:	74 ca                	je     4f7 <gets+0x11>
    buf[i++] = c;
 52d:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 52f:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 533:	89 f8                	mov    %edi,%eax
 535:	8d 65 f4             	lea    -0xc(%ebp),%esp
 538:	5b                   	pop    %ebx
 539:	5e                   	pop    %esi
 53a:	5f                   	pop    %edi
 53b:	5d                   	pop    %ebp
 53c:	c3                   	ret    

0000053d <stat>:

int
stat(const char *n, struct stat *st)
{
 53d:	55                   	push   %ebp
 53e:	89 e5                	mov    %esp,%ebp
 540:	56                   	push   %esi
 541:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 542:	83 ec 08             	sub    $0x8,%esp
 545:	6a 00                	push   $0x0
 547:	ff 75 08             	push   0x8(%ebp)
 54a:	e8 d6 00 00 00       	call   625 <open>
  if(fd < 0)
 54f:	83 c4 10             	add    $0x10,%esp
 552:	85 c0                	test   %eax,%eax
 554:	78 24                	js     57a <stat+0x3d>
 556:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 558:	83 ec 08             	sub    $0x8,%esp
 55b:	ff 75 0c             	push   0xc(%ebp)
 55e:	50                   	push   %eax
 55f:	e8 d9 00 00 00       	call   63d <fstat>
 564:	89 c6                	mov    %eax,%esi
  close(fd);
 566:	89 1c 24             	mov    %ebx,(%esp)
 569:	e8 9f 00 00 00       	call   60d <close>
  return r;
 56e:	83 c4 10             	add    $0x10,%esp
}
 571:	89 f0                	mov    %esi,%eax
 573:	8d 65 f8             	lea    -0x8(%ebp),%esp
 576:	5b                   	pop    %ebx
 577:	5e                   	pop    %esi
 578:	5d                   	pop    %ebp
 579:	c3                   	ret    
    return -1;
 57a:	be ff ff ff ff       	mov    $0xffffffff,%esi
 57f:	eb f0                	jmp    571 <stat+0x34>

00000581 <atoi>:

int
atoi(const char *s)
{
 581:	55                   	push   %ebp
 582:	89 e5                	mov    %esp,%ebp
 584:	53                   	push   %ebx
 585:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 588:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 58d:	eb 10                	jmp    59f <atoi+0x1e>
    n = n*10 + *s++ - '0';
 58f:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 592:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 595:	83 c1 01             	add    $0x1,%ecx
 598:	0f be c0             	movsbl %al,%eax
 59b:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 59f:	0f b6 01             	movzbl (%ecx),%eax
 5a2:	8d 58 d0             	lea    -0x30(%eax),%ebx
 5a5:	80 fb 09             	cmp    $0x9,%bl
 5a8:	76 e5                	jbe    58f <atoi+0xe>
  return n;
}
 5aa:	89 d0                	mov    %edx,%eax
 5ac:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5af:	c9                   	leave  
 5b0:	c3                   	ret    

000005b1 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 5b1:	55                   	push   %ebp
 5b2:	89 e5                	mov    %esp,%ebp
 5b4:	56                   	push   %esi
 5b5:	53                   	push   %ebx
 5b6:	8b 75 08             	mov    0x8(%ebp),%esi
 5b9:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 5bc:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 5bf:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 5c1:	eb 0d                	jmp    5d0 <memmove+0x1f>
    *dst++ = *src++;
 5c3:	0f b6 01             	movzbl (%ecx),%eax
 5c6:	88 02                	mov    %al,(%edx)
 5c8:	8d 49 01             	lea    0x1(%ecx),%ecx
 5cb:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 5ce:	89 d8                	mov    %ebx,%eax
 5d0:	8d 58 ff             	lea    -0x1(%eax),%ebx
 5d3:	85 c0                	test   %eax,%eax
 5d5:	7f ec                	jg     5c3 <memmove+0x12>
  return vdst;
}
 5d7:	89 f0                	mov    %esi,%eax
 5d9:	5b                   	pop    %ebx
 5da:	5e                   	pop    %esi
 5db:	5d                   	pop    %ebp
 5dc:	c3                   	ret    

000005dd <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 5dd:	b8 01 00 00 00       	mov    $0x1,%eax
 5e2:	cd 40                	int    $0x40
 5e4:	c3                   	ret    

000005e5 <exit>:
SYSCALL(exit)
 5e5:	b8 02 00 00 00       	mov    $0x2,%eax
 5ea:	cd 40                	int    $0x40
 5ec:	c3                   	ret    

000005ed <wait>:
SYSCALL(wait)
 5ed:	b8 03 00 00 00       	mov    $0x3,%eax
 5f2:	cd 40                	int    $0x40
 5f4:	c3                   	ret    

000005f5 <pipe>:
SYSCALL(pipe)
 5f5:	b8 04 00 00 00       	mov    $0x4,%eax
 5fa:	cd 40                	int    $0x40
 5fc:	c3                   	ret    

000005fd <read>:
SYSCALL(read)
 5fd:	b8 05 00 00 00       	mov    $0x5,%eax
 602:	cd 40                	int    $0x40
 604:	c3                   	ret    

00000605 <write>:
SYSCALL(write)
 605:	b8 10 00 00 00       	mov    $0x10,%eax
 60a:	cd 40                	int    $0x40
 60c:	c3                   	ret    

0000060d <close>:
SYSCALL(close)
 60d:	b8 15 00 00 00       	mov    $0x15,%eax
 612:	cd 40                	int    $0x40
 614:	c3                   	ret    

00000615 <kill>:
SYSCALL(kill)
 615:	b8 06 00 00 00       	mov    $0x6,%eax
 61a:	cd 40                	int    $0x40
 61c:	c3                   	ret    

0000061d <exec>:
SYSCALL(exec)
 61d:	b8 07 00 00 00       	mov    $0x7,%eax
 622:	cd 40                	int    $0x40
 624:	c3                   	ret    

00000625 <open>:
SYSCALL(open)
 625:	b8 0f 00 00 00       	mov    $0xf,%eax
 62a:	cd 40                	int    $0x40
 62c:	c3                   	ret    

0000062d <mknod>:
SYSCALL(mknod)
 62d:	b8 11 00 00 00       	mov    $0x11,%eax
 632:	cd 40                	int    $0x40
 634:	c3                   	ret    

00000635 <unlink>:
SYSCALL(unlink)
 635:	b8 12 00 00 00       	mov    $0x12,%eax
 63a:	cd 40                	int    $0x40
 63c:	c3                   	ret    

0000063d <fstat>:
SYSCALL(fstat)
 63d:	b8 08 00 00 00       	mov    $0x8,%eax
 642:	cd 40                	int    $0x40
 644:	c3                   	ret    

00000645 <link>:
SYSCALL(link)
 645:	b8 13 00 00 00       	mov    $0x13,%eax
 64a:	cd 40                	int    $0x40
 64c:	c3                   	ret    

0000064d <mkdir>:
SYSCALL(mkdir)
 64d:	b8 14 00 00 00       	mov    $0x14,%eax
 652:	cd 40                	int    $0x40
 654:	c3                   	ret    

00000655 <chdir>:
SYSCALL(chdir)
 655:	b8 09 00 00 00       	mov    $0x9,%eax
 65a:	cd 40                	int    $0x40
 65c:	c3                   	ret    

0000065d <dup>:
SYSCALL(dup)
 65d:	b8 0a 00 00 00       	mov    $0xa,%eax
 662:	cd 40                	int    $0x40
 664:	c3                   	ret    

00000665 <getpid>:
SYSCALL(getpid)
 665:	b8 0b 00 00 00       	mov    $0xb,%eax
 66a:	cd 40                	int    $0x40
 66c:	c3                   	ret    

0000066d <sbrk>:
SYSCALL(sbrk)
 66d:	b8 0c 00 00 00       	mov    $0xc,%eax
 672:	cd 40                	int    $0x40
 674:	c3                   	ret    

00000675 <sleep>:
SYSCALL(sleep)
 675:	b8 0d 00 00 00       	mov    $0xd,%eax
 67a:	cd 40                	int    $0x40
 67c:	c3                   	ret    

0000067d <uptime>:
SYSCALL(uptime)
 67d:	b8 0e 00 00 00       	mov    $0xe,%eax
 682:	cd 40                	int    $0x40
 684:	c3                   	ret    

00000685 <clone>:
SYSCALL(clone)
 685:	b8 16 00 00 00       	mov    $0x16,%eax
 68a:	cd 40                	int    $0x40
 68c:	c3                   	ret    

0000068d <join>:
 68d:	b8 17 00 00 00       	mov    $0x17,%eax
 692:	cd 40                	int    $0x40
 694:	c3                   	ret    

00000695 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 695:	55                   	push   %ebp
 696:	89 e5                	mov    %esp,%ebp
 698:	83 ec 1c             	sub    $0x1c,%esp
 69b:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 69e:	6a 01                	push   $0x1
 6a0:	8d 55 f4             	lea    -0xc(%ebp),%edx
 6a3:	52                   	push   %edx
 6a4:	50                   	push   %eax
 6a5:	e8 5b ff ff ff       	call   605 <write>
}
 6aa:	83 c4 10             	add    $0x10,%esp
 6ad:	c9                   	leave  
 6ae:	c3                   	ret    

000006af <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 6af:	55                   	push   %ebp
 6b0:	89 e5                	mov    %esp,%ebp
 6b2:	57                   	push   %edi
 6b3:	56                   	push   %esi
 6b4:	53                   	push   %ebx
 6b5:	83 ec 2c             	sub    $0x2c,%esp
 6b8:	89 45 d0             	mov    %eax,-0x30(%ebp)
 6bb:	89 d0                	mov    %edx,%eax
 6bd:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 6bf:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 6c3:	0f 95 c1             	setne  %cl
 6c6:	c1 ea 1f             	shr    $0x1f,%edx
 6c9:	84 d1                	test   %dl,%cl
 6cb:	74 44                	je     711 <printint+0x62>
    neg = 1;
    x = -xx;
 6cd:	f7 d8                	neg    %eax
 6cf:	89 c1                	mov    %eax,%ecx
    neg = 1;
 6d1:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 6d8:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 6dd:	89 c8                	mov    %ecx,%eax
 6df:	ba 00 00 00 00       	mov    $0x0,%edx
 6e4:	f7 f6                	div    %esi
 6e6:	89 df                	mov    %ebx,%edi
 6e8:	83 c3 01             	add    $0x1,%ebx
 6eb:	0f b6 92 e0 0a 00 00 	movzbl 0xae0(%edx),%edx
 6f2:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 6f6:	89 ca                	mov    %ecx,%edx
 6f8:	89 c1                	mov    %eax,%ecx
 6fa:	39 d6                	cmp    %edx,%esi
 6fc:	76 df                	jbe    6dd <printint+0x2e>
  if(neg)
 6fe:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 702:	74 31                	je     735 <printint+0x86>
    buf[i++] = '-';
 704:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 709:	8d 5f 02             	lea    0x2(%edi),%ebx
 70c:	8b 75 d0             	mov    -0x30(%ebp),%esi
 70f:	eb 17                	jmp    728 <printint+0x79>
    x = xx;
 711:	89 c1                	mov    %eax,%ecx
  neg = 0;
 713:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 71a:	eb bc                	jmp    6d8 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 71c:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 721:	89 f0                	mov    %esi,%eax
 723:	e8 6d ff ff ff       	call   695 <putc>
  while(--i >= 0)
 728:	83 eb 01             	sub    $0x1,%ebx
 72b:	79 ef                	jns    71c <printint+0x6d>
}
 72d:	83 c4 2c             	add    $0x2c,%esp
 730:	5b                   	pop    %ebx
 731:	5e                   	pop    %esi
 732:	5f                   	pop    %edi
 733:	5d                   	pop    %ebp
 734:	c3                   	ret    
 735:	8b 75 d0             	mov    -0x30(%ebp),%esi
 738:	eb ee                	jmp    728 <printint+0x79>

0000073a <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 73a:	55                   	push   %ebp
 73b:	89 e5                	mov    %esp,%ebp
 73d:	57                   	push   %edi
 73e:	56                   	push   %esi
 73f:	53                   	push   %ebx
 740:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 743:	8d 45 10             	lea    0x10(%ebp),%eax
 746:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 749:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 74e:	bb 00 00 00 00       	mov    $0x0,%ebx
 753:	eb 14                	jmp    769 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 755:	89 fa                	mov    %edi,%edx
 757:	8b 45 08             	mov    0x8(%ebp),%eax
 75a:	e8 36 ff ff ff       	call   695 <putc>
 75f:	eb 05                	jmp    766 <printf+0x2c>
      }
    } else if(state == '%'){
 761:	83 fe 25             	cmp    $0x25,%esi
 764:	74 25                	je     78b <printf+0x51>
  for(i = 0; fmt[i]; i++){
 766:	83 c3 01             	add    $0x1,%ebx
 769:	8b 45 0c             	mov    0xc(%ebp),%eax
 76c:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 770:	84 c0                	test   %al,%al
 772:	0f 84 20 01 00 00    	je     898 <printf+0x15e>
    c = fmt[i] & 0xff;
 778:	0f be f8             	movsbl %al,%edi
 77b:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 77e:	85 f6                	test   %esi,%esi
 780:	75 df                	jne    761 <printf+0x27>
      if(c == '%'){
 782:	83 f8 25             	cmp    $0x25,%eax
 785:	75 ce                	jne    755 <printf+0x1b>
        state = '%';
 787:	89 c6                	mov    %eax,%esi
 789:	eb db                	jmp    766 <printf+0x2c>
      if(c == 'd'){
 78b:	83 f8 25             	cmp    $0x25,%eax
 78e:	0f 84 cf 00 00 00    	je     863 <printf+0x129>
 794:	0f 8c dd 00 00 00    	jl     877 <printf+0x13d>
 79a:	83 f8 78             	cmp    $0x78,%eax
 79d:	0f 8f d4 00 00 00    	jg     877 <printf+0x13d>
 7a3:	83 f8 63             	cmp    $0x63,%eax
 7a6:	0f 8c cb 00 00 00    	jl     877 <printf+0x13d>
 7ac:	83 e8 63             	sub    $0x63,%eax
 7af:	83 f8 15             	cmp    $0x15,%eax
 7b2:	0f 87 bf 00 00 00    	ja     877 <printf+0x13d>
 7b8:	ff 24 85 88 0a 00 00 	jmp    *0xa88(,%eax,4)
        printint(fd, *ap, 10, 1);
 7bf:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7c2:	8b 17                	mov    (%edi),%edx
 7c4:	83 ec 0c             	sub    $0xc,%esp
 7c7:	6a 01                	push   $0x1
 7c9:	b9 0a 00 00 00       	mov    $0xa,%ecx
 7ce:	8b 45 08             	mov    0x8(%ebp),%eax
 7d1:	e8 d9 fe ff ff       	call   6af <printint>
        ap++;
 7d6:	83 c7 04             	add    $0x4,%edi
 7d9:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 7dc:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 7df:	be 00 00 00 00       	mov    $0x0,%esi
 7e4:	eb 80                	jmp    766 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 7e6:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7e9:	8b 17                	mov    (%edi),%edx
 7eb:	83 ec 0c             	sub    $0xc,%esp
 7ee:	6a 00                	push   $0x0
 7f0:	b9 10 00 00 00       	mov    $0x10,%ecx
 7f5:	8b 45 08             	mov    0x8(%ebp),%eax
 7f8:	e8 b2 fe ff ff       	call   6af <printint>
        ap++;
 7fd:	83 c7 04             	add    $0x4,%edi
 800:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 803:	83 c4 10             	add    $0x10,%esp
      state = 0;
 806:	be 00 00 00 00       	mov    $0x0,%esi
 80b:	e9 56 ff ff ff       	jmp    766 <printf+0x2c>
        s = (char*)*ap;
 810:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 813:	8b 30                	mov    (%eax),%esi
        ap++;
 815:	83 c0 04             	add    $0x4,%eax
 818:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 81b:	85 f6                	test   %esi,%esi
 81d:	75 15                	jne    834 <printf+0xfa>
          s = "(null)";
 81f:	be 7e 0a 00 00       	mov    $0xa7e,%esi
 824:	eb 0e                	jmp    834 <printf+0xfa>
          putc(fd, *s);
 826:	0f be d2             	movsbl %dl,%edx
 829:	8b 45 08             	mov    0x8(%ebp),%eax
 82c:	e8 64 fe ff ff       	call   695 <putc>
          s++;
 831:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 834:	0f b6 16             	movzbl (%esi),%edx
 837:	84 d2                	test   %dl,%dl
 839:	75 eb                	jne    826 <printf+0xec>
      state = 0;
 83b:	be 00 00 00 00       	mov    $0x0,%esi
 840:	e9 21 ff ff ff       	jmp    766 <printf+0x2c>
        putc(fd, *ap);
 845:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 848:	0f be 17             	movsbl (%edi),%edx
 84b:	8b 45 08             	mov    0x8(%ebp),%eax
 84e:	e8 42 fe ff ff       	call   695 <putc>
        ap++;
 853:	83 c7 04             	add    $0x4,%edi
 856:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 859:	be 00 00 00 00       	mov    $0x0,%esi
 85e:	e9 03 ff ff ff       	jmp    766 <printf+0x2c>
        putc(fd, c);
 863:	89 fa                	mov    %edi,%edx
 865:	8b 45 08             	mov    0x8(%ebp),%eax
 868:	e8 28 fe ff ff       	call   695 <putc>
      state = 0;
 86d:	be 00 00 00 00       	mov    $0x0,%esi
 872:	e9 ef fe ff ff       	jmp    766 <printf+0x2c>
        putc(fd, '%');
 877:	ba 25 00 00 00       	mov    $0x25,%edx
 87c:	8b 45 08             	mov    0x8(%ebp),%eax
 87f:	e8 11 fe ff ff       	call   695 <putc>
        putc(fd, c);
 884:	89 fa                	mov    %edi,%edx
 886:	8b 45 08             	mov    0x8(%ebp),%eax
 889:	e8 07 fe ff ff       	call   695 <putc>
      state = 0;
 88e:	be 00 00 00 00       	mov    $0x0,%esi
 893:	e9 ce fe ff ff       	jmp    766 <printf+0x2c>
    }
  }
}
 898:	8d 65 f4             	lea    -0xc(%ebp),%esp
 89b:	5b                   	pop    %ebx
 89c:	5e                   	pop    %esi
 89d:	5f                   	pop    %edi
 89e:	5d                   	pop    %ebp
 89f:	c3                   	ret    

000008a0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 8a0:	55                   	push   %ebp
 8a1:	89 e5                	mov    %esp,%ebp
 8a3:	57                   	push   %edi
 8a4:	56                   	push   %esi
 8a5:	53                   	push   %ebx
 8a6:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 8a9:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8ac:	a1 8c 0e 00 00       	mov    0xe8c,%eax
 8b1:	eb 02                	jmp    8b5 <free+0x15>
 8b3:	89 d0                	mov    %edx,%eax
 8b5:	39 c8                	cmp    %ecx,%eax
 8b7:	73 04                	jae    8bd <free+0x1d>
 8b9:	39 08                	cmp    %ecx,(%eax)
 8bb:	77 12                	ja     8cf <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8bd:	8b 10                	mov    (%eax),%edx
 8bf:	39 c2                	cmp    %eax,%edx
 8c1:	77 f0                	ja     8b3 <free+0x13>
 8c3:	39 c8                	cmp    %ecx,%eax
 8c5:	72 08                	jb     8cf <free+0x2f>
 8c7:	39 ca                	cmp    %ecx,%edx
 8c9:	77 04                	ja     8cf <free+0x2f>
 8cb:	89 d0                	mov    %edx,%eax
 8cd:	eb e6                	jmp    8b5 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 8cf:	8b 73 fc             	mov    -0x4(%ebx),%esi
 8d2:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 8d5:	8b 10                	mov    (%eax),%edx
 8d7:	39 d7                	cmp    %edx,%edi
 8d9:	74 19                	je     8f4 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 8db:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 8de:	8b 50 04             	mov    0x4(%eax),%edx
 8e1:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 8e4:	39 ce                	cmp    %ecx,%esi
 8e6:	74 1b                	je     903 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 8e8:	89 08                	mov    %ecx,(%eax)
  freep = p;
 8ea:	a3 8c 0e 00 00       	mov    %eax,0xe8c
}
 8ef:	5b                   	pop    %ebx
 8f0:	5e                   	pop    %esi
 8f1:	5f                   	pop    %edi
 8f2:	5d                   	pop    %ebp
 8f3:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 8f4:	03 72 04             	add    0x4(%edx),%esi
 8f7:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 8fa:	8b 10                	mov    (%eax),%edx
 8fc:	8b 12                	mov    (%edx),%edx
 8fe:	89 53 f8             	mov    %edx,-0x8(%ebx)
 901:	eb db                	jmp    8de <free+0x3e>
    p->s.size += bp->s.size;
 903:	03 53 fc             	add    -0x4(%ebx),%edx
 906:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 909:	8b 53 f8             	mov    -0x8(%ebx),%edx
 90c:	89 10                	mov    %edx,(%eax)
 90e:	eb da                	jmp    8ea <free+0x4a>

00000910 <morecore>:

static Header*
morecore(uint nu)
{
 910:	55                   	push   %ebp
 911:	89 e5                	mov    %esp,%ebp
 913:	53                   	push   %ebx
 914:	83 ec 04             	sub    $0x4,%esp
 917:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 919:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 91e:	77 05                	ja     925 <morecore+0x15>
    nu = 4096;
 920:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 925:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 92c:	83 ec 0c             	sub    $0xc,%esp
 92f:	50                   	push   %eax
 930:	e8 38 fd ff ff       	call   66d <sbrk>
  if(p == (char*)-1)
 935:	83 c4 10             	add    $0x10,%esp
 938:	83 f8 ff             	cmp    $0xffffffff,%eax
 93b:	74 1c                	je     959 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 93d:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 940:	83 c0 08             	add    $0x8,%eax
 943:	83 ec 0c             	sub    $0xc,%esp
 946:	50                   	push   %eax
 947:	e8 54 ff ff ff       	call   8a0 <free>
  return freep;
 94c:	a1 8c 0e 00 00       	mov    0xe8c,%eax
 951:	83 c4 10             	add    $0x10,%esp
}
 954:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 957:	c9                   	leave  
 958:	c3                   	ret    
    return 0;
 959:	b8 00 00 00 00       	mov    $0x0,%eax
 95e:	eb f4                	jmp    954 <morecore+0x44>

00000960 <malloc>:

void*
malloc(uint nbytes)
{
 960:	55                   	push   %ebp
 961:	89 e5                	mov    %esp,%ebp
 963:	53                   	push   %ebx
 964:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 967:	8b 45 08             	mov    0x8(%ebp),%eax
 96a:	8d 58 07             	lea    0x7(%eax),%ebx
 96d:	c1 eb 03             	shr    $0x3,%ebx
 970:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 973:	8b 0d 8c 0e 00 00    	mov    0xe8c,%ecx
 979:	85 c9                	test   %ecx,%ecx
 97b:	74 04                	je     981 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 97d:	8b 01                	mov    (%ecx),%eax
 97f:	eb 4a                	jmp    9cb <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 981:	c7 05 8c 0e 00 00 90 	movl   $0xe90,0xe8c
 988:	0e 00 00 
 98b:	c7 05 90 0e 00 00 90 	movl   $0xe90,0xe90
 992:	0e 00 00 
    base.s.size = 0;
 995:	c7 05 94 0e 00 00 00 	movl   $0x0,0xe94
 99c:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 99f:	b9 90 0e 00 00       	mov    $0xe90,%ecx
 9a4:	eb d7                	jmp    97d <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 9a6:	74 19                	je     9c1 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 9a8:	29 da                	sub    %ebx,%edx
 9aa:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 9ad:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 9b0:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 9b3:	89 0d 8c 0e 00 00    	mov    %ecx,0xe8c
      return (void*)(p + 1);
 9b9:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 9bc:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 9bf:	c9                   	leave  
 9c0:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 9c1:	8b 10                	mov    (%eax),%edx
 9c3:	89 11                	mov    %edx,(%ecx)
 9c5:	eb ec                	jmp    9b3 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9c7:	89 c1                	mov    %eax,%ecx
 9c9:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 9cb:	8b 50 04             	mov    0x4(%eax),%edx
 9ce:	39 da                	cmp    %ebx,%edx
 9d0:	73 d4                	jae    9a6 <malloc+0x46>
    if(p == freep)
 9d2:	39 05 8c 0e 00 00    	cmp    %eax,0xe8c
 9d8:	75 ed                	jne    9c7 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 9da:	89 d8                	mov    %ebx,%eax
 9dc:	e8 2f ff ff ff       	call   910 <morecore>
 9e1:	85 c0                	test   %eax,%eax
 9e3:	75 e2                	jne    9c7 <malloc+0x67>
 9e5:	eb d5                	jmp    9bc <malloc+0x5c>
