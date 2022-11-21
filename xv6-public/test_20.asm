
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
   6:	68 94 0e 00 00       	push   $0xe94
   b:	e8 03 04 00 00       	call   413 <lock_acquire>
   assert((unsigned int)sbrk(0) == size);
  10:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  17:	e8 5c 06 00 00       	call   678 <sbrk>
  1c:	83 c4 10             	add    $0x10,%esp
  1f:	3b 05 98 0e 00 00    	cmp    0xe98,%eax
  25:	74 49                	je     70 <worker2+0x70>
  27:	6a 31                	push   $0x31
  29:	68 f4 09 00 00       	push   $0x9f4
  2e:	68 fe 09 00 00       	push   $0x9fe
  33:	6a 01                	push   $0x1
  35:	e8 0b 07 00 00       	call   745 <printf>
  3a:	83 c4 0c             	add    $0xc,%esp
  3d:	68 06 0a 00 00       	push   $0xa06
  42:	68 24 0a 00 00       	push   $0xa24
  47:	6a 01                	push   $0x1
  49:	e8 f7 06 00 00       	call   745 <printf>
  4e:	83 c4 08             	add    $0x8,%esp
  51:	68 38 0a 00 00       	push   $0xa38
  56:	6a 01                	push   $0x1
  58:	e8 e8 06 00 00       	call   745 <printf>
  5d:	83 c4 04             	add    $0x4,%esp
  60:	ff 35 a0 0e 00 00    	push   0xea0
  66:	e8 b5 05 00 00       	call   620 <kill>
  6b:	e8 80 05 00 00       	call   5f0 <exit>
   global++;
  70:	83 05 9c 0e 00 00 01 	addl   $0x1,0xe9c
   lock_release(&lock);
  77:	83 ec 0c             	sub    $0xc,%esp
  7a:	68 94 0e 00 00       	push   $0xe94
  7f:	e8 b1 03 00 00       	call   435 <lock_release>

   
   lock_acquire(&lock2);
  84:	c7 04 24 90 0e 00 00 	movl   $0xe90,(%esp)
  8b:	e8 83 03 00 00       	call   413 <lock_acquire>
   assert((unsigned int)sbrk(0) == size);
  90:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  97:	e8 dc 05 00 00       	call   678 <sbrk>
  9c:	83 c4 10             	add    $0x10,%esp
  9f:	3b 05 98 0e 00 00    	cmp    0xe98,%eax
  a5:	74 49                	je     f0 <worker2+0xf0>
  a7:	6a 37                	push   $0x37
  a9:	68 f4 09 00 00       	push   $0x9f4
  ae:	68 fe 09 00 00       	push   $0x9fe
  b3:	6a 01                	push   $0x1
  b5:	e8 8b 06 00 00       	call   745 <printf>
  ba:	83 c4 0c             	add    $0xc,%esp
  bd:	68 06 0a 00 00       	push   $0xa06
  c2:	68 24 0a 00 00       	push   $0xa24
  c7:	6a 01                	push   $0x1
  c9:	e8 77 06 00 00       	call   745 <printf>
  ce:	83 c4 08             	add    $0x8,%esp
  d1:	68 38 0a 00 00       	push   $0xa38
  d6:	6a 01                	push   $0x1
  d8:	e8 68 06 00 00       	call   745 <printf>
  dd:	83 c4 04             	add    $0x4,%esp
  e0:	ff 35 a0 0e 00 00    	push   0xea0
  e6:	e8 35 05 00 00       	call   620 <kill>
  eb:	e8 00 05 00 00       	call   5f0 <exit>
   global++;
  f0:	83 05 9c 0e 00 00 01 	addl   $0x1,0xe9c
   lock_release(&lock2);
  f7:	83 ec 0c             	sub    $0xc,%esp
  fa:	68 90 0e 00 00       	push   $0xe90
  ff:	e8 31 03 00 00       	call   435 <lock_release>

   
   exit();
 104:	e8 e7 04 00 00       	call   5f0 <exit>

00000109 <worker>:
}


void worker(void *arg1, void *arg2) {
 109:	55                   	push   %ebp
 10a:	89 e5                	mov    %esp,%ebp
 10c:	83 ec 14             	sub    $0x14,%esp
   lock_init(&lock);
 10f:	68 94 0e 00 00       	push   $0xe94
 114:	e8 2a 03 00 00       	call   443 <lock_init>
   lock_init(&lock2);
 119:	c7 04 24 90 0e 00 00 	movl   $0xe90,(%esp)
 120:	e8 1e 03 00 00       	call   443 <lock_init>
   lock_acquire(&lock);
 125:	c7 04 24 94 0e 00 00 	movl   $0xe94,(%esp)
 12c:	e8 e2 02 00 00       	call   413 <lock_acquire>
   lock_acquire(&lock2);
 131:	c7 04 24 90 0e 00 00 	movl   $0xe90,(%esp)
 138:	e8 d6 02 00 00       	call   413 <lock_acquire>

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
 15a:	e8 19 05 00 00       	call   678 <sbrk>
 15f:	a3 98 0e 00 00       	mov    %eax,0xe98

   while (global < num_threads) {
 164:	83 c4 10             	add    $0x10,%esp
 167:	eb 71                	jmp    1da <worker+0xd1>
    assert(nested_thread_id > 0);
 169:	6a 47                	push   $0x47
 16b:	68 f4 09 00 00       	push   $0x9f4
 170:	68 fe 09 00 00       	push   $0x9fe
 175:	6a 01                	push   $0x1
 177:	e8 c9 05 00 00       	call   745 <printf>
 17c:	83 c4 0c             	add    $0xc,%esp
 17f:	68 45 0a 00 00       	push   $0xa45
 184:	68 24 0a 00 00       	push   $0xa24
 189:	6a 01                	push   $0x1
 18b:	e8 b5 05 00 00       	call   745 <printf>
 190:	83 c4 08             	add    $0x8,%esp
 193:	68 38 0a 00 00       	push   $0xa38
 198:	6a 01                	push   $0x1
 19a:	e8 a6 05 00 00       	call   745 <printf>
 19f:	83 c4 04             	add    $0x4,%esp
 1a2:	ff 35 a0 0e 00 00    	push   0xea0
 1a8:	e8 73 04 00 00       	call   620 <kill>
 1ad:	e8 3e 04 00 00       	call   5f0 <exit>
      lock_release(&lock);
 1b2:	83 ec 0c             	sub    $0xc,%esp
 1b5:	68 94 0e 00 00       	push   $0xe94
 1ba:	e8 76 02 00 00       	call   435 <lock_release>
      sleep(100);
 1bf:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 1c6:	e8 b5 04 00 00       	call   680 <sleep>
      lock_acquire(&lock);
 1cb:	c7 04 24 94 0e 00 00 	movl   $0xe94,(%esp)
 1d2:	e8 3c 02 00 00       	call   413 <lock_acquire>
 1d7:	83 c4 10             	add    $0x10,%esp
   while (global < num_threads) {
 1da:	a1 8c 0e 00 00       	mov    0xe8c,%eax
 1df:	39 05 9c 0e 00 00    	cmp    %eax,0xe9c
 1e5:	7c cb                	jl     1b2 <worker+0xa9>
   }

   global = 0;
 1e7:	c7 05 9c 0e 00 00 00 	movl   $0x0,0xe9c
 1ee:	00 00 00 
   sbrk(10000);
 1f1:	83 ec 0c             	sub    $0xc,%esp
 1f4:	68 10 27 00 00       	push   $0x2710
 1f9:	e8 7a 04 00 00       	call   678 <sbrk>
   size = (unsigned int)sbrk(0);
 1fe:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 205:	e8 6e 04 00 00       	call   678 <sbrk>
 20a:	a3 98 0e 00 00       	mov    %eax,0xe98
   lock_release(&lock);
 20f:	c7 04 24 94 0e 00 00 	movl   $0xe94,(%esp)
 216:	e8 1a 02 00 00       	call   435 <lock_release>

   while (global < num_threads) {
 21b:	83 c4 10             	add    $0x10,%esp
 21e:	eb 28                	jmp    248 <worker+0x13f>
      lock_release(&lock2);
 220:	83 ec 0c             	sub    $0xc,%esp
 223:	68 90 0e 00 00       	push   $0xe90
 228:	e8 08 02 00 00       	call   435 <lock_release>
      sleep(100);
 22d:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 234:	e8 47 04 00 00       	call   680 <sleep>
      lock_acquire(&lock2);
 239:	c7 04 24 90 0e 00 00 	movl   $0xe90,(%esp)
 240:	e8 ce 01 00 00       	call   413 <lock_acquire>
 245:	83 c4 10             	add    $0x10,%esp
   while (global < num_threads) {
 248:	a1 8c 0e 00 00       	mov    0xe8c,%eax
 24d:	39 05 9c 0e 00 00    	cmp    %eax,0xe9c
 253:	7c cb                	jl     220 <worker+0x117>
   }
   lock_release(&lock2);
 255:	83 ec 0c             	sub    $0xc,%esp
 258:	68 90 0e 00 00       	push   $0xe90
 25d:	e8 d3 01 00 00       	call   435 <lock_release>

   int nested_join_pid = thread_join();
 262:	e8 9b 01 00 00       	call   402 <thread_join>
   assert(nested_join_pid > 0);
 267:	83 c4 10             	add    $0x10,%esp
 26a:	85 c0                	test   %eax,%eax
 26c:	7e 05                	jle    273 <worker+0x16a>




   exit();
 26e:	e8 7d 03 00 00       	call   5f0 <exit>
   assert(nested_join_pid > 0);
 273:	6a 5d                	push   $0x5d
 275:	68 f4 09 00 00       	push   $0x9f4
 27a:	68 fe 09 00 00       	push   $0x9fe
 27f:	6a 01                	push   $0x1
 281:	e8 bf 04 00 00       	call   745 <printf>
 286:	83 c4 0c             	add    $0xc,%esp
 289:	68 5a 0a 00 00       	push   $0xa5a
 28e:	68 24 0a 00 00       	push   $0xa24
 293:	6a 01                	push   $0x1
 295:	e8 ab 04 00 00       	call   745 <printf>
 29a:	83 c4 08             	add    $0x8,%esp
 29d:	68 38 0a 00 00       	push   $0xa38
 2a2:	6a 01                	push   $0x1
 2a4:	e8 9c 04 00 00       	call   745 <printf>
 2a9:	83 c4 04             	add    $0x4,%esp
 2ac:	ff 35 a0 0e 00 00    	push   0xea0
 2b2:	e8 69 03 00 00       	call   620 <kill>
 2b7:	e8 34 03 00 00       	call   5f0 <exit>

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
 2cd:	e8 9e 03 00 00       	call   670 <getpid>
 2d2:	a3 a0 0e 00 00       	mov    %eax,0xea0
   int arg1 = 11, arg2 = 22;
 2d7:	c7 45 f4 0b 00 00 00 	movl   $0xb,-0xc(%ebp)
 2de:	c7 45 f0 16 00 00 00 	movl   $0x16,-0x10(%ebp)
   size = (unsigned int)sbrk(0);
 2e5:	83 ec 0c             	sub    $0xc,%esp
 2e8:	6a 00                	push   $0x0
 2ea:	e8 89 03 00 00       	call   678 <sbrk>
 2ef:	a3 98 0e 00 00       	mov    %eax,0xe98
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
 31c:	68 7d 0a 00 00       	push   $0xa7d
 321:	6a 01                	push   $0x1
 323:	e8 1d 04 00 00       	call   745 <printf>
   exit();
 328:	e8 c3 02 00 00       	call   5f0 <exit>
   assert(thread_pid > 0);
 32d:	6a 24                	push   $0x24
 32f:	68 f4 09 00 00       	push   $0x9f4
 334:	68 fe 09 00 00       	push   $0x9fe
 339:	6a 01                	push   $0x1
 33b:	e8 05 04 00 00       	call   745 <printf>
 340:	83 c4 0c             	add    $0xc,%esp
 343:	68 6e 0a 00 00       	push   $0xa6e
 348:	68 24 0a 00 00       	push   $0xa24
 34d:	6a 01                	push   $0x1
 34f:	e8 f1 03 00 00       	call   745 <printf>
 354:	83 c4 08             	add    $0x8,%esp
 357:	68 38 0a 00 00       	push   $0xa38
 35c:	6a 01                	push   $0x1
 35e:	e8 e2 03 00 00       	call   745 <printf>
 363:	83 c4 04             	add    $0x4,%esp
 366:	ff 35 a0 0e 00 00    	push   0xea0
 36c:	e8 af 02 00 00       	call   620 <kill>
 371:	e8 7a 02 00 00       	call   5f0 <exit>
   assert(join_pid > 0);
 376:	6a 27                	push   $0x27
 378:	68 f4 09 00 00       	push   $0x9f4
 37d:	68 fe 09 00 00       	push   $0x9fe
 382:	6a 01                	push   $0x1
 384:	e8 bc 03 00 00       	call   745 <printf>
 389:	83 c4 0c             	add    $0xc,%esp
 38c:	68 61 0a 00 00       	push   $0xa61
 391:	68 24 0a 00 00       	push   $0xa24
 396:	6a 01                	push   $0x1
 398:	e8 a8 03 00 00       	call   745 <printf>
 39d:	83 c4 08             	add    $0x8,%esp
 3a0:	68 38 0a 00 00       	push   $0xa38
 3a5:	6a 01                	push   $0x1
 3a7:	e8 99 03 00 00       	call   745 <printf>
 3ac:	83 c4 04             	add    $0x4,%esp
 3af:	ff 35 a0 0e 00 00    	push   0xea0
 3b5:	e8 66 02 00 00       	call   620 <kill>
 3ba:	e8 31 02 00 00       	call   5f0 <exit>

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
  void *n_stack = malloc(PGSIZE*2);
 3d6:	68 00 20 00 00       	push   $0x2000
 3db:	e8 8b 05 00 00       	call   96b <malloc>
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
 3f1:	e8 9a 02 00 00       	call   690 <clone>


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
 402:	55                   	push   %ebp
 403:	89 e5                	mov    %esp,%ebp
 405:	83 ec 24             	sub    $0x24,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 408:	8d 45 f4             	lea    -0xc(%ebp),%eax
 40b:	50                   	push   %eax
 40c:	e8 87 02 00 00       	call   698 <join>
  
  return pid;
}
 411:	c9                   	leave  
 412:	c3                   	ret    

00000413 <lock_acquire>:

void lock_acquire(lock_t *lock){
 413:	55                   	push   %ebp
 414:	89 e5                	mov    %esp,%ebp
 416:	53                   	push   %ebx
 417:	83 ec 04             	sub    $0x4,%esp
 41a:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 41d:	83 ec 08             	sub    $0x8,%esp
 420:	6a 01                	push   $0x1
 422:	53                   	push   %ebx
 423:	e8 97 ff ff ff       	call   3bf <test_and_set>
 428:	83 c4 10             	add    $0x10,%esp
 42b:	83 f8 01             	cmp    $0x1,%eax
 42e:	74 ed                	je     41d <lock_acquire+0xa>
    ;
}
 430:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 433:	c9                   	leave  
 434:	c3                   	ret    

00000435 <lock_release>:

void lock_release(lock_t *lock) {
 435:	55                   	push   %ebp
 436:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 438:	8b 45 08             	mov    0x8(%ebp),%eax
 43b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 441:	5d                   	pop    %ebp
 442:	c3                   	ret    

00000443 <lock_init>:

void lock_init(lock_t *lock) {
 443:	55                   	push   %ebp
 444:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 446:	8b 45 08             	mov    0x8(%ebp),%eax
 449:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 44f:	5d                   	pop    %ebp
 450:	c3                   	ret    

00000451 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 451:	55                   	push   %ebp
 452:	89 e5                	mov    %esp,%ebp
 454:	56                   	push   %esi
 455:	53                   	push   %ebx
 456:	8b 75 08             	mov    0x8(%ebp),%esi
 459:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 45c:	89 f0                	mov    %esi,%eax
 45e:	89 d1                	mov    %edx,%ecx
 460:	83 c2 01             	add    $0x1,%edx
 463:	89 c3                	mov    %eax,%ebx
 465:	83 c0 01             	add    $0x1,%eax
 468:	0f b6 09             	movzbl (%ecx),%ecx
 46b:	88 0b                	mov    %cl,(%ebx)
 46d:	84 c9                	test   %cl,%cl
 46f:	75 ed                	jne    45e <strcpy+0xd>
    ;
  return os;
}
 471:	89 f0                	mov    %esi,%eax
 473:	5b                   	pop    %ebx
 474:	5e                   	pop    %esi
 475:	5d                   	pop    %ebp
 476:	c3                   	ret    

00000477 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 477:	55                   	push   %ebp
 478:	89 e5                	mov    %esp,%ebp
 47a:	8b 4d 08             	mov    0x8(%ebp),%ecx
 47d:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 480:	eb 06                	jmp    488 <strcmp+0x11>
    p++, q++;
 482:	83 c1 01             	add    $0x1,%ecx
 485:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 488:	0f b6 01             	movzbl (%ecx),%eax
 48b:	84 c0                	test   %al,%al
 48d:	74 04                	je     493 <strcmp+0x1c>
 48f:	3a 02                	cmp    (%edx),%al
 491:	74 ef                	je     482 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 493:	0f b6 c0             	movzbl %al,%eax
 496:	0f b6 12             	movzbl (%edx),%edx
 499:	29 d0                	sub    %edx,%eax
}
 49b:	5d                   	pop    %ebp
 49c:	c3                   	ret    

0000049d <strlen>:

uint
strlen(const char *s)
{
 49d:	55                   	push   %ebp
 49e:	89 e5                	mov    %esp,%ebp
 4a0:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 4a3:	b8 00 00 00 00       	mov    $0x0,%eax
 4a8:	eb 03                	jmp    4ad <strlen+0x10>
 4aa:	83 c0 01             	add    $0x1,%eax
 4ad:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 4b1:	75 f7                	jne    4aa <strlen+0xd>
    ;
  return n;
}
 4b3:	5d                   	pop    %ebp
 4b4:	c3                   	ret    

000004b5 <memset>:

void*
memset(void *dst, int c, uint n)
{
 4b5:	55                   	push   %ebp
 4b6:	89 e5                	mov    %esp,%ebp
 4b8:	57                   	push   %edi
 4b9:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 4bc:	89 d7                	mov    %edx,%edi
 4be:	8b 4d 10             	mov    0x10(%ebp),%ecx
 4c1:	8b 45 0c             	mov    0xc(%ebp),%eax
 4c4:	fc                   	cld    
 4c5:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 4c7:	89 d0                	mov    %edx,%eax
 4c9:	8b 7d fc             	mov    -0x4(%ebp),%edi
 4cc:	c9                   	leave  
 4cd:	c3                   	ret    

000004ce <strchr>:

char*
strchr(const char *s, char c)
{
 4ce:	55                   	push   %ebp
 4cf:	89 e5                	mov    %esp,%ebp
 4d1:	8b 45 08             	mov    0x8(%ebp),%eax
 4d4:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 4d8:	eb 03                	jmp    4dd <strchr+0xf>
 4da:	83 c0 01             	add    $0x1,%eax
 4dd:	0f b6 10             	movzbl (%eax),%edx
 4e0:	84 d2                	test   %dl,%dl
 4e2:	74 06                	je     4ea <strchr+0x1c>
    if(*s == c)
 4e4:	38 ca                	cmp    %cl,%dl
 4e6:	75 f2                	jne    4da <strchr+0xc>
 4e8:	eb 05                	jmp    4ef <strchr+0x21>
      return (char*)s;
  return 0;
 4ea:	b8 00 00 00 00       	mov    $0x0,%eax
}
 4ef:	5d                   	pop    %ebp
 4f0:	c3                   	ret    

000004f1 <gets>:

char*
gets(char *buf, int max)
{
 4f1:	55                   	push   %ebp
 4f2:	89 e5                	mov    %esp,%ebp
 4f4:	57                   	push   %edi
 4f5:	56                   	push   %esi
 4f6:	53                   	push   %ebx
 4f7:	83 ec 1c             	sub    $0x1c,%esp
 4fa:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 4fd:	bb 00 00 00 00       	mov    $0x0,%ebx
 502:	89 de                	mov    %ebx,%esi
 504:	83 c3 01             	add    $0x1,%ebx
 507:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 50a:	7d 2e                	jge    53a <gets+0x49>
    cc = read(0, &c, 1);
 50c:	83 ec 04             	sub    $0x4,%esp
 50f:	6a 01                	push   $0x1
 511:	8d 45 e7             	lea    -0x19(%ebp),%eax
 514:	50                   	push   %eax
 515:	6a 00                	push   $0x0
 517:	e8 ec 00 00 00       	call   608 <read>
    if(cc < 1)
 51c:	83 c4 10             	add    $0x10,%esp
 51f:	85 c0                	test   %eax,%eax
 521:	7e 17                	jle    53a <gets+0x49>
      break;
    buf[i++] = c;
 523:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 527:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 52a:	3c 0a                	cmp    $0xa,%al
 52c:	0f 94 c2             	sete   %dl
 52f:	3c 0d                	cmp    $0xd,%al
 531:	0f 94 c0             	sete   %al
 534:	08 c2                	or     %al,%dl
 536:	74 ca                	je     502 <gets+0x11>
    buf[i++] = c;
 538:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 53a:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 53e:	89 f8                	mov    %edi,%eax
 540:	8d 65 f4             	lea    -0xc(%ebp),%esp
 543:	5b                   	pop    %ebx
 544:	5e                   	pop    %esi
 545:	5f                   	pop    %edi
 546:	5d                   	pop    %ebp
 547:	c3                   	ret    

00000548 <stat>:

int
stat(const char *n, struct stat *st)
{
 548:	55                   	push   %ebp
 549:	89 e5                	mov    %esp,%ebp
 54b:	56                   	push   %esi
 54c:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 54d:	83 ec 08             	sub    $0x8,%esp
 550:	6a 00                	push   $0x0
 552:	ff 75 08             	push   0x8(%ebp)
 555:	e8 d6 00 00 00       	call   630 <open>
  if(fd < 0)
 55a:	83 c4 10             	add    $0x10,%esp
 55d:	85 c0                	test   %eax,%eax
 55f:	78 24                	js     585 <stat+0x3d>
 561:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 563:	83 ec 08             	sub    $0x8,%esp
 566:	ff 75 0c             	push   0xc(%ebp)
 569:	50                   	push   %eax
 56a:	e8 d9 00 00 00       	call   648 <fstat>
 56f:	89 c6                	mov    %eax,%esi
  close(fd);
 571:	89 1c 24             	mov    %ebx,(%esp)
 574:	e8 9f 00 00 00       	call   618 <close>
  return r;
 579:	83 c4 10             	add    $0x10,%esp
}
 57c:	89 f0                	mov    %esi,%eax
 57e:	8d 65 f8             	lea    -0x8(%ebp),%esp
 581:	5b                   	pop    %ebx
 582:	5e                   	pop    %esi
 583:	5d                   	pop    %ebp
 584:	c3                   	ret    
    return -1;
 585:	be ff ff ff ff       	mov    $0xffffffff,%esi
 58a:	eb f0                	jmp    57c <stat+0x34>

0000058c <atoi>:

int
atoi(const char *s)
{
 58c:	55                   	push   %ebp
 58d:	89 e5                	mov    %esp,%ebp
 58f:	53                   	push   %ebx
 590:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 593:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 598:	eb 10                	jmp    5aa <atoi+0x1e>
    n = n*10 + *s++ - '0';
 59a:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 59d:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 5a0:	83 c1 01             	add    $0x1,%ecx
 5a3:	0f be c0             	movsbl %al,%eax
 5a6:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 5aa:	0f b6 01             	movzbl (%ecx),%eax
 5ad:	8d 58 d0             	lea    -0x30(%eax),%ebx
 5b0:	80 fb 09             	cmp    $0x9,%bl
 5b3:	76 e5                	jbe    59a <atoi+0xe>
  return n;
}
 5b5:	89 d0                	mov    %edx,%eax
 5b7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5ba:	c9                   	leave  
 5bb:	c3                   	ret    

000005bc <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 5bc:	55                   	push   %ebp
 5bd:	89 e5                	mov    %esp,%ebp
 5bf:	56                   	push   %esi
 5c0:	53                   	push   %ebx
 5c1:	8b 75 08             	mov    0x8(%ebp),%esi
 5c4:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 5c7:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 5ca:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 5cc:	eb 0d                	jmp    5db <memmove+0x1f>
    *dst++ = *src++;
 5ce:	0f b6 01             	movzbl (%ecx),%eax
 5d1:	88 02                	mov    %al,(%edx)
 5d3:	8d 49 01             	lea    0x1(%ecx),%ecx
 5d6:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 5d9:	89 d8                	mov    %ebx,%eax
 5db:	8d 58 ff             	lea    -0x1(%eax),%ebx
 5de:	85 c0                	test   %eax,%eax
 5e0:	7f ec                	jg     5ce <memmove+0x12>
  return vdst;
}
 5e2:	89 f0                	mov    %esi,%eax
 5e4:	5b                   	pop    %ebx
 5e5:	5e                   	pop    %esi
 5e6:	5d                   	pop    %ebp
 5e7:	c3                   	ret    

000005e8 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 5e8:	b8 01 00 00 00       	mov    $0x1,%eax
 5ed:	cd 40                	int    $0x40
 5ef:	c3                   	ret    

000005f0 <exit>:
SYSCALL(exit)
 5f0:	b8 02 00 00 00       	mov    $0x2,%eax
 5f5:	cd 40                	int    $0x40
 5f7:	c3                   	ret    

000005f8 <wait>:
SYSCALL(wait)
 5f8:	b8 03 00 00 00       	mov    $0x3,%eax
 5fd:	cd 40                	int    $0x40
 5ff:	c3                   	ret    

00000600 <pipe>:
SYSCALL(pipe)
 600:	b8 04 00 00 00       	mov    $0x4,%eax
 605:	cd 40                	int    $0x40
 607:	c3                   	ret    

00000608 <read>:
SYSCALL(read)
 608:	b8 05 00 00 00       	mov    $0x5,%eax
 60d:	cd 40                	int    $0x40
 60f:	c3                   	ret    

00000610 <write>:
SYSCALL(write)
 610:	b8 10 00 00 00       	mov    $0x10,%eax
 615:	cd 40                	int    $0x40
 617:	c3                   	ret    

00000618 <close>:
SYSCALL(close)
 618:	b8 15 00 00 00       	mov    $0x15,%eax
 61d:	cd 40                	int    $0x40
 61f:	c3                   	ret    

00000620 <kill>:
SYSCALL(kill)
 620:	b8 06 00 00 00       	mov    $0x6,%eax
 625:	cd 40                	int    $0x40
 627:	c3                   	ret    

00000628 <exec>:
SYSCALL(exec)
 628:	b8 07 00 00 00       	mov    $0x7,%eax
 62d:	cd 40                	int    $0x40
 62f:	c3                   	ret    

00000630 <open>:
SYSCALL(open)
 630:	b8 0f 00 00 00       	mov    $0xf,%eax
 635:	cd 40                	int    $0x40
 637:	c3                   	ret    

00000638 <mknod>:
SYSCALL(mknod)
 638:	b8 11 00 00 00       	mov    $0x11,%eax
 63d:	cd 40                	int    $0x40
 63f:	c3                   	ret    

00000640 <unlink>:
SYSCALL(unlink)
 640:	b8 12 00 00 00       	mov    $0x12,%eax
 645:	cd 40                	int    $0x40
 647:	c3                   	ret    

00000648 <fstat>:
SYSCALL(fstat)
 648:	b8 08 00 00 00       	mov    $0x8,%eax
 64d:	cd 40                	int    $0x40
 64f:	c3                   	ret    

00000650 <link>:
SYSCALL(link)
 650:	b8 13 00 00 00       	mov    $0x13,%eax
 655:	cd 40                	int    $0x40
 657:	c3                   	ret    

00000658 <mkdir>:
SYSCALL(mkdir)
 658:	b8 14 00 00 00       	mov    $0x14,%eax
 65d:	cd 40                	int    $0x40
 65f:	c3                   	ret    

00000660 <chdir>:
SYSCALL(chdir)
 660:	b8 09 00 00 00       	mov    $0x9,%eax
 665:	cd 40                	int    $0x40
 667:	c3                   	ret    

00000668 <dup>:
SYSCALL(dup)
 668:	b8 0a 00 00 00       	mov    $0xa,%eax
 66d:	cd 40                	int    $0x40
 66f:	c3                   	ret    

00000670 <getpid>:
SYSCALL(getpid)
 670:	b8 0b 00 00 00       	mov    $0xb,%eax
 675:	cd 40                	int    $0x40
 677:	c3                   	ret    

00000678 <sbrk>:
SYSCALL(sbrk)
 678:	b8 0c 00 00 00       	mov    $0xc,%eax
 67d:	cd 40                	int    $0x40
 67f:	c3                   	ret    

00000680 <sleep>:
SYSCALL(sleep)
 680:	b8 0d 00 00 00       	mov    $0xd,%eax
 685:	cd 40                	int    $0x40
 687:	c3                   	ret    

00000688 <uptime>:
SYSCALL(uptime)
 688:	b8 0e 00 00 00       	mov    $0xe,%eax
 68d:	cd 40                	int    $0x40
 68f:	c3                   	ret    

00000690 <clone>:
SYSCALL(clone)
 690:	b8 16 00 00 00       	mov    $0x16,%eax
 695:	cd 40                	int    $0x40
 697:	c3                   	ret    

00000698 <join>:
 698:	b8 17 00 00 00       	mov    $0x17,%eax
 69d:	cd 40                	int    $0x40
 69f:	c3                   	ret    

000006a0 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 6a0:	55                   	push   %ebp
 6a1:	89 e5                	mov    %esp,%ebp
 6a3:	83 ec 1c             	sub    $0x1c,%esp
 6a6:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 6a9:	6a 01                	push   $0x1
 6ab:	8d 55 f4             	lea    -0xc(%ebp),%edx
 6ae:	52                   	push   %edx
 6af:	50                   	push   %eax
 6b0:	e8 5b ff ff ff       	call   610 <write>
}
 6b5:	83 c4 10             	add    $0x10,%esp
 6b8:	c9                   	leave  
 6b9:	c3                   	ret    

000006ba <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 6ba:	55                   	push   %ebp
 6bb:	89 e5                	mov    %esp,%ebp
 6bd:	57                   	push   %edi
 6be:	56                   	push   %esi
 6bf:	53                   	push   %ebx
 6c0:	83 ec 2c             	sub    $0x2c,%esp
 6c3:	89 45 d0             	mov    %eax,-0x30(%ebp)
 6c6:	89 d0                	mov    %edx,%eax
 6c8:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 6ca:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 6ce:	0f 95 c1             	setne  %cl
 6d1:	c1 ea 1f             	shr    $0x1f,%edx
 6d4:	84 d1                	test   %dl,%cl
 6d6:	74 44                	je     71c <printint+0x62>
    neg = 1;
    x = -xx;
 6d8:	f7 d8                	neg    %eax
 6da:	89 c1                	mov    %eax,%ecx
    neg = 1;
 6dc:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 6e3:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 6e8:	89 c8                	mov    %ecx,%eax
 6ea:	ba 00 00 00 00       	mov    $0x0,%edx
 6ef:	f7 f6                	div    %esi
 6f1:	89 df                	mov    %ebx,%edi
 6f3:	83 c3 01             	add    $0x1,%ebx
 6f6:	0f b6 92 ec 0a 00 00 	movzbl 0xaec(%edx),%edx
 6fd:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 701:	89 ca                	mov    %ecx,%edx
 703:	89 c1                	mov    %eax,%ecx
 705:	39 d6                	cmp    %edx,%esi
 707:	76 df                	jbe    6e8 <printint+0x2e>
  if(neg)
 709:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 70d:	74 31                	je     740 <printint+0x86>
    buf[i++] = '-';
 70f:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 714:	8d 5f 02             	lea    0x2(%edi),%ebx
 717:	8b 75 d0             	mov    -0x30(%ebp),%esi
 71a:	eb 17                	jmp    733 <printint+0x79>
    x = xx;
 71c:	89 c1                	mov    %eax,%ecx
  neg = 0;
 71e:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 725:	eb bc                	jmp    6e3 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 727:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 72c:	89 f0                	mov    %esi,%eax
 72e:	e8 6d ff ff ff       	call   6a0 <putc>
  while(--i >= 0)
 733:	83 eb 01             	sub    $0x1,%ebx
 736:	79 ef                	jns    727 <printint+0x6d>
}
 738:	83 c4 2c             	add    $0x2c,%esp
 73b:	5b                   	pop    %ebx
 73c:	5e                   	pop    %esi
 73d:	5f                   	pop    %edi
 73e:	5d                   	pop    %ebp
 73f:	c3                   	ret    
 740:	8b 75 d0             	mov    -0x30(%ebp),%esi
 743:	eb ee                	jmp    733 <printint+0x79>

00000745 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 745:	55                   	push   %ebp
 746:	89 e5                	mov    %esp,%ebp
 748:	57                   	push   %edi
 749:	56                   	push   %esi
 74a:	53                   	push   %ebx
 74b:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 74e:	8d 45 10             	lea    0x10(%ebp),%eax
 751:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 754:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 759:	bb 00 00 00 00       	mov    $0x0,%ebx
 75e:	eb 14                	jmp    774 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 760:	89 fa                	mov    %edi,%edx
 762:	8b 45 08             	mov    0x8(%ebp),%eax
 765:	e8 36 ff ff ff       	call   6a0 <putc>
 76a:	eb 05                	jmp    771 <printf+0x2c>
      }
    } else if(state == '%'){
 76c:	83 fe 25             	cmp    $0x25,%esi
 76f:	74 25                	je     796 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 771:	83 c3 01             	add    $0x1,%ebx
 774:	8b 45 0c             	mov    0xc(%ebp),%eax
 777:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 77b:	84 c0                	test   %al,%al
 77d:	0f 84 20 01 00 00    	je     8a3 <printf+0x15e>
    c = fmt[i] & 0xff;
 783:	0f be f8             	movsbl %al,%edi
 786:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 789:	85 f6                	test   %esi,%esi
 78b:	75 df                	jne    76c <printf+0x27>
      if(c == '%'){
 78d:	83 f8 25             	cmp    $0x25,%eax
 790:	75 ce                	jne    760 <printf+0x1b>
        state = '%';
 792:	89 c6                	mov    %eax,%esi
 794:	eb db                	jmp    771 <printf+0x2c>
      if(c == 'd'){
 796:	83 f8 25             	cmp    $0x25,%eax
 799:	0f 84 cf 00 00 00    	je     86e <printf+0x129>
 79f:	0f 8c dd 00 00 00    	jl     882 <printf+0x13d>
 7a5:	83 f8 78             	cmp    $0x78,%eax
 7a8:	0f 8f d4 00 00 00    	jg     882 <printf+0x13d>
 7ae:	83 f8 63             	cmp    $0x63,%eax
 7b1:	0f 8c cb 00 00 00    	jl     882 <printf+0x13d>
 7b7:	83 e8 63             	sub    $0x63,%eax
 7ba:	83 f8 15             	cmp    $0x15,%eax
 7bd:	0f 87 bf 00 00 00    	ja     882 <printf+0x13d>
 7c3:	ff 24 85 94 0a 00 00 	jmp    *0xa94(,%eax,4)
        printint(fd, *ap, 10, 1);
 7ca:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7cd:	8b 17                	mov    (%edi),%edx
 7cf:	83 ec 0c             	sub    $0xc,%esp
 7d2:	6a 01                	push   $0x1
 7d4:	b9 0a 00 00 00       	mov    $0xa,%ecx
 7d9:	8b 45 08             	mov    0x8(%ebp),%eax
 7dc:	e8 d9 fe ff ff       	call   6ba <printint>
        ap++;
 7e1:	83 c7 04             	add    $0x4,%edi
 7e4:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 7e7:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 7ea:	be 00 00 00 00       	mov    $0x0,%esi
 7ef:	eb 80                	jmp    771 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 7f1:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7f4:	8b 17                	mov    (%edi),%edx
 7f6:	83 ec 0c             	sub    $0xc,%esp
 7f9:	6a 00                	push   $0x0
 7fb:	b9 10 00 00 00       	mov    $0x10,%ecx
 800:	8b 45 08             	mov    0x8(%ebp),%eax
 803:	e8 b2 fe ff ff       	call   6ba <printint>
        ap++;
 808:	83 c7 04             	add    $0x4,%edi
 80b:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 80e:	83 c4 10             	add    $0x10,%esp
      state = 0;
 811:	be 00 00 00 00       	mov    $0x0,%esi
 816:	e9 56 ff ff ff       	jmp    771 <printf+0x2c>
        s = (char*)*ap;
 81b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 81e:	8b 30                	mov    (%eax),%esi
        ap++;
 820:	83 c0 04             	add    $0x4,%eax
 823:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 826:	85 f6                	test   %esi,%esi
 828:	75 15                	jne    83f <printf+0xfa>
          s = "(null)";
 82a:	be 8a 0a 00 00       	mov    $0xa8a,%esi
 82f:	eb 0e                	jmp    83f <printf+0xfa>
          putc(fd, *s);
 831:	0f be d2             	movsbl %dl,%edx
 834:	8b 45 08             	mov    0x8(%ebp),%eax
 837:	e8 64 fe ff ff       	call   6a0 <putc>
          s++;
 83c:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 83f:	0f b6 16             	movzbl (%esi),%edx
 842:	84 d2                	test   %dl,%dl
 844:	75 eb                	jne    831 <printf+0xec>
      state = 0;
 846:	be 00 00 00 00       	mov    $0x0,%esi
 84b:	e9 21 ff ff ff       	jmp    771 <printf+0x2c>
        putc(fd, *ap);
 850:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 853:	0f be 17             	movsbl (%edi),%edx
 856:	8b 45 08             	mov    0x8(%ebp),%eax
 859:	e8 42 fe ff ff       	call   6a0 <putc>
        ap++;
 85e:	83 c7 04             	add    $0x4,%edi
 861:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 864:	be 00 00 00 00       	mov    $0x0,%esi
 869:	e9 03 ff ff ff       	jmp    771 <printf+0x2c>
        putc(fd, c);
 86e:	89 fa                	mov    %edi,%edx
 870:	8b 45 08             	mov    0x8(%ebp),%eax
 873:	e8 28 fe ff ff       	call   6a0 <putc>
      state = 0;
 878:	be 00 00 00 00       	mov    $0x0,%esi
 87d:	e9 ef fe ff ff       	jmp    771 <printf+0x2c>
        putc(fd, '%');
 882:	ba 25 00 00 00       	mov    $0x25,%edx
 887:	8b 45 08             	mov    0x8(%ebp),%eax
 88a:	e8 11 fe ff ff       	call   6a0 <putc>
        putc(fd, c);
 88f:	89 fa                	mov    %edi,%edx
 891:	8b 45 08             	mov    0x8(%ebp),%eax
 894:	e8 07 fe ff ff       	call   6a0 <putc>
      state = 0;
 899:	be 00 00 00 00       	mov    $0x0,%esi
 89e:	e9 ce fe ff ff       	jmp    771 <printf+0x2c>
    }
  }
}
 8a3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 8a6:	5b                   	pop    %ebx
 8a7:	5e                   	pop    %esi
 8a8:	5f                   	pop    %edi
 8a9:	5d                   	pop    %ebp
 8aa:	c3                   	ret    

000008ab <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 8ab:	55                   	push   %ebp
 8ac:	89 e5                	mov    %esp,%ebp
 8ae:	57                   	push   %edi
 8af:	56                   	push   %esi
 8b0:	53                   	push   %ebx
 8b1:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 8b4:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8b7:	a1 a4 0e 00 00       	mov    0xea4,%eax
 8bc:	eb 02                	jmp    8c0 <free+0x15>
 8be:	89 d0                	mov    %edx,%eax
 8c0:	39 c8                	cmp    %ecx,%eax
 8c2:	73 04                	jae    8c8 <free+0x1d>
 8c4:	39 08                	cmp    %ecx,(%eax)
 8c6:	77 12                	ja     8da <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8c8:	8b 10                	mov    (%eax),%edx
 8ca:	39 c2                	cmp    %eax,%edx
 8cc:	77 f0                	ja     8be <free+0x13>
 8ce:	39 c8                	cmp    %ecx,%eax
 8d0:	72 08                	jb     8da <free+0x2f>
 8d2:	39 ca                	cmp    %ecx,%edx
 8d4:	77 04                	ja     8da <free+0x2f>
 8d6:	89 d0                	mov    %edx,%eax
 8d8:	eb e6                	jmp    8c0 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 8da:	8b 73 fc             	mov    -0x4(%ebx),%esi
 8dd:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 8e0:	8b 10                	mov    (%eax),%edx
 8e2:	39 d7                	cmp    %edx,%edi
 8e4:	74 19                	je     8ff <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 8e6:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 8e9:	8b 50 04             	mov    0x4(%eax),%edx
 8ec:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 8ef:	39 ce                	cmp    %ecx,%esi
 8f1:	74 1b                	je     90e <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 8f3:	89 08                	mov    %ecx,(%eax)
  freep = p;
 8f5:	a3 a4 0e 00 00       	mov    %eax,0xea4
}
 8fa:	5b                   	pop    %ebx
 8fb:	5e                   	pop    %esi
 8fc:	5f                   	pop    %edi
 8fd:	5d                   	pop    %ebp
 8fe:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 8ff:	03 72 04             	add    0x4(%edx),%esi
 902:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 905:	8b 10                	mov    (%eax),%edx
 907:	8b 12                	mov    (%edx),%edx
 909:	89 53 f8             	mov    %edx,-0x8(%ebx)
 90c:	eb db                	jmp    8e9 <free+0x3e>
    p->s.size += bp->s.size;
 90e:	03 53 fc             	add    -0x4(%ebx),%edx
 911:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 914:	8b 53 f8             	mov    -0x8(%ebx),%edx
 917:	89 10                	mov    %edx,(%eax)
 919:	eb da                	jmp    8f5 <free+0x4a>

0000091b <morecore>:

static Header*
morecore(uint nu)
{
 91b:	55                   	push   %ebp
 91c:	89 e5                	mov    %esp,%ebp
 91e:	53                   	push   %ebx
 91f:	83 ec 04             	sub    $0x4,%esp
 922:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 924:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 929:	77 05                	ja     930 <morecore+0x15>
    nu = 4096;
 92b:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 930:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 937:	83 ec 0c             	sub    $0xc,%esp
 93a:	50                   	push   %eax
 93b:	e8 38 fd ff ff       	call   678 <sbrk>
  if(p == (char*)-1)
 940:	83 c4 10             	add    $0x10,%esp
 943:	83 f8 ff             	cmp    $0xffffffff,%eax
 946:	74 1c                	je     964 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 948:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 94b:	83 c0 08             	add    $0x8,%eax
 94e:	83 ec 0c             	sub    $0xc,%esp
 951:	50                   	push   %eax
 952:	e8 54 ff ff ff       	call   8ab <free>
  return freep;
 957:	a1 a4 0e 00 00       	mov    0xea4,%eax
 95c:	83 c4 10             	add    $0x10,%esp
}
 95f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 962:	c9                   	leave  
 963:	c3                   	ret    
    return 0;
 964:	b8 00 00 00 00       	mov    $0x0,%eax
 969:	eb f4                	jmp    95f <morecore+0x44>

0000096b <malloc>:

void*
malloc(uint nbytes)
{
 96b:	55                   	push   %ebp
 96c:	89 e5                	mov    %esp,%ebp
 96e:	53                   	push   %ebx
 96f:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 972:	8b 45 08             	mov    0x8(%ebp),%eax
 975:	8d 58 07             	lea    0x7(%eax),%ebx
 978:	c1 eb 03             	shr    $0x3,%ebx
 97b:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 97e:	8b 0d a4 0e 00 00    	mov    0xea4,%ecx
 984:	85 c9                	test   %ecx,%ecx
 986:	74 04                	je     98c <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 988:	8b 01                	mov    (%ecx),%eax
 98a:	eb 4a                	jmp    9d6 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 98c:	c7 05 a4 0e 00 00 a8 	movl   $0xea8,0xea4
 993:	0e 00 00 
 996:	c7 05 a8 0e 00 00 a8 	movl   $0xea8,0xea8
 99d:	0e 00 00 
    base.s.size = 0;
 9a0:	c7 05 ac 0e 00 00 00 	movl   $0x0,0xeac
 9a7:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 9aa:	b9 a8 0e 00 00       	mov    $0xea8,%ecx
 9af:	eb d7                	jmp    988 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 9b1:	74 19                	je     9cc <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 9b3:	29 da                	sub    %ebx,%edx
 9b5:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 9b8:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 9bb:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 9be:	89 0d a4 0e 00 00    	mov    %ecx,0xea4
      return (void*)(p + 1);
 9c4:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 9c7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 9ca:	c9                   	leave  
 9cb:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 9cc:	8b 10                	mov    (%eax),%edx
 9ce:	89 11                	mov    %edx,(%ecx)
 9d0:	eb ec                	jmp    9be <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9d2:	89 c1                	mov    %eax,%ecx
 9d4:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 9d6:	8b 50 04             	mov    0x4(%eax),%edx
 9d9:	39 da                	cmp    %ebx,%edx
 9db:	73 d4                	jae    9b1 <malloc+0x46>
    if(p == freep)
 9dd:	39 05 a4 0e 00 00    	cmp    %eax,0xea4
 9e3:	75 ed                	jne    9d2 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 9e5:	89 d8                	mov    %ebx,%eax
 9e7:	e8 2f ff ff ff       	call   91b <morecore>
 9ec:	85 c0                	test   %eax,%eax
 9ee:	75 e2                	jne    9d2 <malloc+0x67>
 9f0:	eb d5                	jmp    9c7 <malloc+0x5c>
