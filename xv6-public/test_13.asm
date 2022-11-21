
_test_13:     file format elf32-i386


Disassembly of section .text:

00000000 <fib>:
   exit(); \
}

void worker(void *arg1, void *arg2);

unsigned int fib(unsigned int n) {
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	56                   	push   %esi
   4:	53                   	push   %ebx
   5:	8b 5d 08             	mov    0x8(%ebp),%ebx
   if (n == 0) {
   8:	85 db                	test   %ebx,%ebx
   a:	74 05                	je     11 <fib+0x11>
      return 0;
   } else if (n == 1) {
   c:	83 fb 01             	cmp    $0x1,%ebx
   f:	75 09                	jne    1a <fib+0x1a>
      return 1;
   } else {
      return fib(n - 1) + fib(n - 2);
   }
}
  11:	89 d8                	mov    %ebx,%eax
  13:	8d 65 f8             	lea    -0x8(%ebp),%esp
  16:	5b                   	pop    %ebx
  17:	5e                   	pop    %esi
  18:	5d                   	pop    %ebp
  19:	c3                   	ret    
      return fib(n - 1) + fib(n - 2);
  1a:	83 ec 0c             	sub    $0xc,%esp
  1d:	8d 43 ff             	lea    -0x1(%ebx),%eax
  20:	50                   	push   %eax
  21:	e8 da ff ff ff       	call   0 <fib>
  26:	89 c6                	mov    %eax,%esi
  28:	83 eb 02             	sub    $0x2,%ebx
  2b:	89 1c 24             	mov    %ebx,(%esp)
  2e:	e8 cd ff ff ff       	call   0 <fib>
  33:	83 c4 10             	add    $0x10,%esp
  36:	8d 1c 06             	lea    (%esi,%eax,1),%ebx
  39:	eb d6                	jmp    11 <fib+0x11>

0000003b <worker>:
   printf(1, "TEST PASSED\n");
   exit();
}

void
worker(void *arg1, void *arg2) {
  3b:	55                   	push   %ebp
  3c:	89 e5                	mov    %esp,%ebp
  3e:	83 ec 08             	sub    $0x8,%esp
   int tmp1 = *(int*)arg1;
   int tmp2 = *(int*)arg2;
  41:	8b 45 0c             	mov    0xc(%ebp),%eax
  44:	8b 10                	mov    (%eax),%edx
   assert(tmp1 == 11);
  46:	8b 45 08             	mov    0x8(%ebp),%eax
  49:	83 38 0b             	cmpl   $0xb,(%eax)
  4c:	75 5f                	jne    ad <worker+0x72>
   assert(tmp2 == 22);
  4e:	83 fa 16             	cmp    $0x16,%edx
  51:	0f 85 9f 00 00 00    	jne    f6 <worker+0xbb>
   assert(global == 1);
  57:	83 3d e8 0e 00 00 01 	cmpl   $0x1,0xee8
  5e:	0f 84 db 00 00 00    	je     13f <worker+0x104>
  64:	6a 40                	push   $0x40
  66:	68 28 0a 00 00       	push   $0xa28
  6b:	68 32 0a 00 00       	push   $0xa32
  70:	6a 01                	push   $0x1
  72:	e8 04 07 00 00       	call   77b <printf>
  77:	83 c4 0c             	add    $0xc,%esp
  7a:	68 71 0a 00 00       	push   $0xa71
  7f:	68 45 0a 00 00       	push   $0xa45
  84:	6a 01                	push   $0x1
  86:	e8 f0 06 00 00       	call   77b <printf>
  8b:	83 c4 08             	add    $0x8,%esp
  8e:	68 59 0a 00 00       	push   $0xa59
  93:	6a 01                	push   $0x1
  95:	e8 e1 06 00 00       	call   77b <printf>
  9a:	83 c4 04             	add    $0x4,%esp
  9d:	ff 35 ec 0e 00 00    	push   0xeec
  a3:	e8 ae 05 00 00       	call   656 <kill>
  a8:	e8 79 05 00 00       	call   626 <exit>
   assert(tmp1 == 11);
  ad:	6a 3e                	push   $0x3e
  af:	68 28 0a 00 00       	push   $0xa28
  b4:	68 32 0a 00 00       	push   $0xa32
  b9:	6a 01                	push   $0x1
  bb:	e8 bb 06 00 00       	call   77b <printf>
  c0:	83 c4 0c             	add    $0xc,%esp
  c3:	68 3a 0a 00 00       	push   $0xa3a
  c8:	68 45 0a 00 00       	push   $0xa45
  cd:	6a 01                	push   $0x1
  cf:	e8 a7 06 00 00       	call   77b <printf>
  d4:	83 c4 08             	add    $0x8,%esp
  d7:	68 59 0a 00 00       	push   $0xa59
  dc:	6a 01                	push   $0x1
  de:	e8 98 06 00 00       	call   77b <printf>
  e3:	83 c4 04             	add    $0x4,%esp
  e6:	ff 35 ec 0e 00 00    	push   0xeec
  ec:	e8 65 05 00 00       	call   656 <kill>
  f1:	e8 30 05 00 00       	call   626 <exit>
   assert(tmp2 == 22);
  f6:	6a 3f                	push   $0x3f
  f8:	68 28 0a 00 00       	push   $0xa28
  fd:	68 32 0a 00 00       	push   $0xa32
 102:	6a 01                	push   $0x1
 104:	e8 72 06 00 00       	call   77b <printf>
 109:	83 c4 0c             	add    $0xc,%esp
 10c:	68 66 0a 00 00       	push   $0xa66
 111:	68 45 0a 00 00       	push   $0xa45
 116:	6a 01                	push   $0x1
 118:	e8 5e 06 00 00       	call   77b <printf>
 11d:	83 c4 08             	add    $0x8,%esp
 120:	68 59 0a 00 00       	push   $0xa59
 125:	6a 01                	push   $0x1
 127:	e8 4f 06 00 00       	call   77b <printf>
 12c:	83 c4 04             	add    $0x4,%esp
 12f:	ff 35 ec 0e 00 00    	push   0xeec
 135:	e8 1c 05 00 00       	call   656 <kill>
 13a:	e8 e7 04 00 00       	call   626 <exit>
   assert(fib(2) == 1);
 13f:	83 ec 0c             	sub    $0xc,%esp
 142:	6a 02                	push   $0x2
 144:	e8 b7 fe ff ff       	call   0 <fib>
 149:	83 c4 10             	add    $0x10,%esp
 14c:	83 f8 01             	cmp    $0x1,%eax
 14f:	74 49                	je     19a <worker+0x15f>
 151:	6a 41                	push   $0x41
 153:	68 28 0a 00 00       	push   $0xa28
 158:	68 32 0a 00 00       	push   $0xa32
 15d:	6a 01                	push   $0x1
 15f:	e8 17 06 00 00       	call   77b <printf>
 164:	83 c4 0c             	add    $0xc,%esp
 167:	68 7d 0a 00 00       	push   $0xa7d
 16c:	68 45 0a 00 00       	push   $0xa45
 171:	6a 01                	push   $0x1
 173:	e8 03 06 00 00       	call   77b <printf>
 178:	83 c4 08             	add    $0x8,%esp
 17b:	68 59 0a 00 00       	push   $0xa59
 180:	6a 01                	push   $0x1
 182:	e8 f4 05 00 00       	call   77b <printf>
 187:	83 c4 04             	add    $0x4,%esp
 18a:	ff 35 ec 0e 00 00    	push   0xeec
 190:	e8 c1 04 00 00       	call   656 <kill>
 195:	e8 8c 04 00 00       	call   626 <exit>
   assert(fib(3) == 2);
 19a:	83 ec 0c             	sub    $0xc,%esp
 19d:	6a 03                	push   $0x3
 19f:	e8 5c fe ff ff       	call   0 <fib>
 1a4:	83 c4 10             	add    $0x10,%esp
 1a7:	83 f8 02             	cmp    $0x2,%eax
 1aa:	74 49                	je     1f5 <worker+0x1ba>
 1ac:	6a 42                	push   $0x42
 1ae:	68 28 0a 00 00       	push   $0xa28
 1b3:	68 32 0a 00 00       	push   $0xa32
 1b8:	6a 01                	push   $0x1
 1ba:	e8 bc 05 00 00       	call   77b <printf>
 1bf:	83 c4 0c             	add    $0xc,%esp
 1c2:	68 89 0a 00 00       	push   $0xa89
 1c7:	68 45 0a 00 00       	push   $0xa45
 1cc:	6a 01                	push   $0x1
 1ce:	e8 a8 05 00 00       	call   77b <printf>
 1d3:	83 c4 08             	add    $0x8,%esp
 1d6:	68 59 0a 00 00       	push   $0xa59
 1db:	6a 01                	push   $0x1
 1dd:	e8 99 05 00 00       	call   77b <printf>
 1e2:	83 c4 04             	add    $0x4,%esp
 1e5:	ff 35 ec 0e 00 00    	push   0xeec
 1eb:	e8 66 04 00 00       	call   656 <kill>
 1f0:	e8 31 04 00 00       	call   626 <exit>
   assert(fib(9) == 34);
 1f5:	83 ec 0c             	sub    $0xc,%esp
 1f8:	6a 09                	push   $0x9
 1fa:	e8 01 fe ff ff       	call   0 <fib>
 1ff:	83 c4 10             	add    $0x10,%esp
 202:	83 f8 22             	cmp    $0x22,%eax
 205:	74 49                	je     250 <worker+0x215>
 207:	6a 43                	push   $0x43
 209:	68 28 0a 00 00       	push   $0xa28
 20e:	68 32 0a 00 00       	push   $0xa32
 213:	6a 01                	push   $0x1
 215:	e8 61 05 00 00       	call   77b <printf>
 21a:	83 c4 0c             	add    $0xc,%esp
 21d:	68 95 0a 00 00       	push   $0xa95
 222:	68 45 0a 00 00       	push   $0xa45
 227:	6a 01                	push   $0x1
 229:	e8 4d 05 00 00       	call   77b <printf>
 22e:	83 c4 08             	add    $0x8,%esp
 231:	68 59 0a 00 00       	push   $0xa59
 236:	6a 01                	push   $0x1
 238:	e8 3e 05 00 00       	call   77b <printf>
 23d:	83 c4 04             	add    $0x4,%esp
 240:	ff 35 ec 0e 00 00    	push   0xeec
 246:	e8 0b 04 00 00       	call   656 <kill>
 24b:	e8 d6 03 00 00       	call   626 <exit>
   assert(fib(15) == 610);
 250:	83 ec 0c             	sub    $0xc,%esp
 253:	6a 0f                	push   $0xf
 255:	e8 a6 fd ff ff       	call   0 <fib>
 25a:	83 c4 10             	add    $0x10,%esp
 25d:	3d 62 02 00 00       	cmp    $0x262,%eax
 262:	74 49                	je     2ad <worker+0x272>
 264:	6a 44                	push   $0x44
 266:	68 28 0a 00 00       	push   $0xa28
 26b:	68 32 0a 00 00       	push   $0xa32
 270:	6a 01                	push   $0x1
 272:	e8 04 05 00 00       	call   77b <printf>
 277:	83 c4 0c             	add    $0xc,%esp
 27a:	68 a2 0a 00 00       	push   $0xaa2
 27f:	68 45 0a 00 00       	push   $0xa45
 284:	6a 01                	push   $0x1
 286:	e8 f0 04 00 00       	call   77b <printf>
 28b:	83 c4 08             	add    $0x8,%esp
 28e:	68 59 0a 00 00       	push   $0xa59
 293:	6a 01                	push   $0x1
 295:	e8 e1 04 00 00       	call   77b <printf>
 29a:	83 c4 04             	add    $0x4,%esp
 29d:	ff 35 ec 0e 00 00    	push   0xeec
 2a3:	e8 ae 03 00 00       	call   656 <kill>
 2a8:	e8 79 03 00 00       	call   626 <exit>
   exit();
 2ad:	e8 74 03 00 00       	call   626 <exit>

000002b2 <main>:
{
 2b2:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 2b6:	83 e4 f0             	and    $0xfffffff0,%esp
 2b9:	ff 71 fc             	push   -0x4(%ecx)
 2bc:	55                   	push   %ebp
 2bd:	89 e5                	mov    %esp,%ebp
 2bf:	53                   	push   %ebx
 2c0:	51                   	push   %ecx
 2c1:	83 ec 10             	sub    $0x10,%esp
   ppid = getpid();
 2c4:	e8 dd 03 00 00       	call   6a6 <getpid>
 2c9:	a3 ec 0e 00 00       	mov    %eax,0xeec
   assert(fib(28) == 317811);
 2ce:	83 ec 0c             	sub    $0xc,%esp
 2d1:	6a 1c                	push   $0x1c
 2d3:	e8 28 fd ff ff       	call   0 <fib>
 2d8:	83 c4 10             	add    $0x10,%esp
 2db:	3d 73 d9 04 00       	cmp    $0x4d973,%eax
 2e0:	75 40                	jne    322 <main+0x70>
   int arg1 = 11, arg2 = 22;
 2e2:	c7 45 f4 0b 00 00 00 	movl   $0xb,-0xc(%ebp)
 2e9:	c7 45 f0 16 00 00 00 	movl   $0x16,-0x10(%ebp)
   for (int i = 0; i < num_threads; i++) {
 2f0:	bb 00 00 00 00       	mov    $0x0,%ebx
 2f5:	39 1d e4 0e 00 00    	cmp    %ebx,0xee4
 2fb:	0f 8e b3 00 00 00    	jle    3b4 <main+0x102>
      int thread_pid = thread_create(worker, &arg1, &arg2);
 301:	83 ec 04             	sub    $0x4,%esp
 304:	8d 45 f0             	lea    -0x10(%ebp),%eax
 307:	50                   	push   %eax
 308:	8d 45 f4             	lea    -0xc(%ebp),%eax
 30b:	50                   	push   %eax
 30c:	68 3b 00 00 00       	push   $0x3b
 311:	e8 27 01 00 00       	call   43d <thread_create>
      assert(thread_pid > 0);
 316:	83 c4 10             	add    $0x10,%esp
 319:	85 c0                	test   %eax,%eax
 31b:	7e 4e                	jle    36b <main+0xb9>
   for (int i = 0; i < num_threads; i++) {
 31d:	83 c3 01             	add    $0x1,%ebx
 320:	eb d3                	jmp    2f5 <main+0x43>
   assert(fib(28) == 317811);
 322:	6a 28                	push   $0x28
 324:	68 28 0a 00 00       	push   $0xa28
 329:	68 32 0a 00 00       	push   $0xa32
 32e:	6a 01                	push   $0x1
 330:	e8 46 04 00 00       	call   77b <printf>
 335:	83 c4 0c             	add    $0xc,%esp
 338:	68 b1 0a 00 00       	push   $0xab1
 33d:	68 45 0a 00 00       	push   $0xa45
 342:	6a 01                	push   $0x1
 344:	e8 32 04 00 00       	call   77b <printf>
 349:	83 c4 08             	add    $0x8,%esp
 34c:	68 59 0a 00 00       	push   $0xa59
 351:	6a 01                	push   $0x1
 353:	e8 23 04 00 00       	call   77b <printf>
 358:	83 c4 04             	add    $0x4,%esp
 35b:	ff 35 ec 0e 00 00    	push   0xeec
 361:	e8 f0 02 00 00       	call   656 <kill>
 366:	e8 bb 02 00 00       	call   626 <exit>
      assert(thread_pid > 0);
 36b:	6a 2e                	push   $0x2e
 36d:	68 28 0a 00 00       	push   $0xa28
 372:	68 32 0a 00 00       	push   $0xa32
 377:	6a 01                	push   $0x1
 379:	e8 fd 03 00 00       	call   77b <printf>
 37e:	83 c4 0c             	add    $0xc,%esp
 381:	68 c3 0a 00 00       	push   $0xac3
 386:	68 45 0a 00 00       	push   $0xa45
 38b:	6a 01                	push   $0x1
 38d:	e8 e9 03 00 00       	call   77b <printf>
 392:	83 c4 08             	add    $0x8,%esp
 395:	68 59 0a 00 00       	push   $0xa59
 39a:	6a 01                	push   $0x1
 39c:	e8 da 03 00 00       	call   77b <printf>
 3a1:	83 c4 04             	add    $0x4,%esp
 3a4:	ff 35 ec 0e 00 00    	push   0xeec
 3aa:	e8 a7 02 00 00       	call   656 <kill>
 3af:	e8 72 02 00 00       	call   626 <exit>
   for (int i = 0; i < num_threads; i++) {
 3b4:	bb 00 00 00 00       	mov    $0x0,%ebx
 3b9:	39 1d e4 0e 00 00    	cmp    %ebx,0xee4
 3bf:	7e 57                	jle    418 <main+0x166>
      int join_pid = thread_join();
 3c1:	e8 7d 00 00 00       	call   443 <thread_join>
      assert(join_pid > 0);
 3c6:	85 c0                	test   %eax,%eax
 3c8:	7e 05                	jle    3cf <main+0x11d>
   for (int i = 0; i < num_threads; i++) {
 3ca:	83 c3 01             	add    $0x1,%ebx
 3cd:	eb ea                	jmp    3b9 <main+0x107>
      assert(join_pid > 0);
 3cf:	6a 33                	push   $0x33
 3d1:	68 28 0a 00 00       	push   $0xa28
 3d6:	68 32 0a 00 00       	push   $0xa32
 3db:	6a 01                	push   $0x1
 3dd:	e8 99 03 00 00       	call   77b <printf>
 3e2:	83 c4 0c             	add    $0xc,%esp
 3e5:	68 d2 0a 00 00       	push   $0xad2
 3ea:	68 45 0a 00 00       	push   $0xa45
 3ef:	6a 01                	push   $0x1
 3f1:	e8 85 03 00 00       	call   77b <printf>
 3f6:	83 c4 08             	add    $0x8,%esp
 3f9:	68 59 0a 00 00       	push   $0xa59
 3fe:	6a 01                	push   $0x1
 400:	e8 76 03 00 00       	call   77b <printf>
 405:	83 c4 04             	add    $0x4,%esp
 408:	ff 35 ec 0e 00 00    	push   0xeec
 40e:	e8 43 02 00 00       	call   656 <kill>
 413:	e8 0e 02 00 00       	call   626 <exit>
   printf(1, "TEST PASSED\n");
 418:	83 ec 08             	sub    $0x8,%esp
 41b:	68 df 0a 00 00       	push   $0xadf
 420:	6a 01                	push   $0x1
 422:	e8 54 03 00 00       	call   77b <printf>
   exit();
 427:	e8 fa 01 00 00       	call   626 <exit>

0000042c <test_and_set>:
#include "fcntl.h"
#include "user.h"
#include "x86.h"
#include "mmu.h"

int test_and_set(int *old_ptr, int new_ptr) {
 42c:	55                   	push   %ebp
 42d:	89 e5                	mov    %esp,%ebp
 42f:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *old_ptr;
 432:	8b 10                	mov    (%eax),%edx
  *old_ptr = new_ptr;
 434:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 437:	89 08                	mov    %ecx,(%eax)
  return old;
}
 439:	89 d0                	mov    %edx,%eax
 43b:	5d                   	pop    %ebp
 43c:	c3                   	ret    

0000043d <thread_create>:

  // I can't remember if there was something else to do here but I'm sure I'll find out


  return new_pid;
}
 43d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 442:	c3                   	ret    

00000443 <thread_join>:

int thread_join() {
  return 0;
}
 443:	b8 00 00 00 00       	mov    $0x0,%eax
 448:	c3                   	ret    

00000449 <lock_acquire>:

void lock_acquire(lock_t *lock){
 449:	55                   	push   %ebp
 44a:	89 e5                	mov    %esp,%ebp
 44c:	53                   	push   %ebx
 44d:	83 ec 04             	sub    $0x4,%esp
 450:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 453:	83 ec 08             	sub    $0x8,%esp
 456:	6a 01                	push   $0x1
 458:	53                   	push   %ebx
 459:	e8 ce ff ff ff       	call   42c <test_and_set>
 45e:	83 c4 10             	add    $0x10,%esp
 461:	83 f8 01             	cmp    $0x1,%eax
 464:	74 ed                	je     453 <lock_acquire+0xa>
    ;
}
 466:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 469:	c9                   	leave  
 46a:	c3                   	ret    

0000046b <lock_release>:

void lock_release(lock_t *lock) {
 46b:	55                   	push   %ebp
 46c:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 46e:	8b 45 08             	mov    0x8(%ebp),%eax
 471:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 477:	5d                   	pop    %ebp
 478:	c3                   	ret    

00000479 <lock_init>:

void lock_init(lock_t *lock) {
 479:	55                   	push   %ebp
 47a:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 47c:	8b 45 08             	mov    0x8(%ebp),%eax
 47f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 485:	5d                   	pop    %ebp
 486:	c3                   	ret    

00000487 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 487:	55                   	push   %ebp
 488:	89 e5                	mov    %esp,%ebp
 48a:	56                   	push   %esi
 48b:	53                   	push   %ebx
 48c:	8b 75 08             	mov    0x8(%ebp),%esi
 48f:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 492:	89 f0                	mov    %esi,%eax
 494:	89 d1                	mov    %edx,%ecx
 496:	83 c2 01             	add    $0x1,%edx
 499:	89 c3                	mov    %eax,%ebx
 49b:	83 c0 01             	add    $0x1,%eax
 49e:	0f b6 09             	movzbl (%ecx),%ecx
 4a1:	88 0b                	mov    %cl,(%ebx)
 4a3:	84 c9                	test   %cl,%cl
 4a5:	75 ed                	jne    494 <strcpy+0xd>
    ;
  return os;
}
 4a7:	89 f0                	mov    %esi,%eax
 4a9:	5b                   	pop    %ebx
 4aa:	5e                   	pop    %esi
 4ab:	5d                   	pop    %ebp
 4ac:	c3                   	ret    

000004ad <strcmp>:

int
strcmp(const char *p, const char *q)
{
 4ad:	55                   	push   %ebp
 4ae:	89 e5                	mov    %esp,%ebp
 4b0:	8b 4d 08             	mov    0x8(%ebp),%ecx
 4b3:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 4b6:	eb 06                	jmp    4be <strcmp+0x11>
    p++, q++;
 4b8:	83 c1 01             	add    $0x1,%ecx
 4bb:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 4be:	0f b6 01             	movzbl (%ecx),%eax
 4c1:	84 c0                	test   %al,%al
 4c3:	74 04                	je     4c9 <strcmp+0x1c>
 4c5:	3a 02                	cmp    (%edx),%al
 4c7:	74 ef                	je     4b8 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 4c9:	0f b6 c0             	movzbl %al,%eax
 4cc:	0f b6 12             	movzbl (%edx),%edx
 4cf:	29 d0                	sub    %edx,%eax
}
 4d1:	5d                   	pop    %ebp
 4d2:	c3                   	ret    

000004d3 <strlen>:

uint
strlen(const char *s)
{
 4d3:	55                   	push   %ebp
 4d4:	89 e5                	mov    %esp,%ebp
 4d6:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 4d9:	b8 00 00 00 00       	mov    $0x0,%eax
 4de:	eb 03                	jmp    4e3 <strlen+0x10>
 4e0:	83 c0 01             	add    $0x1,%eax
 4e3:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 4e7:	75 f7                	jne    4e0 <strlen+0xd>
    ;
  return n;
}
 4e9:	5d                   	pop    %ebp
 4ea:	c3                   	ret    

000004eb <memset>:

void*
memset(void *dst, int c, uint n)
{
 4eb:	55                   	push   %ebp
 4ec:	89 e5                	mov    %esp,%ebp
 4ee:	57                   	push   %edi
 4ef:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 4f2:	89 d7                	mov    %edx,%edi
 4f4:	8b 4d 10             	mov    0x10(%ebp),%ecx
 4f7:	8b 45 0c             	mov    0xc(%ebp),%eax
 4fa:	fc                   	cld    
 4fb:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 4fd:	89 d0                	mov    %edx,%eax
 4ff:	8b 7d fc             	mov    -0x4(%ebp),%edi
 502:	c9                   	leave  
 503:	c3                   	ret    

00000504 <strchr>:

char*
strchr(const char *s, char c)
{
 504:	55                   	push   %ebp
 505:	89 e5                	mov    %esp,%ebp
 507:	8b 45 08             	mov    0x8(%ebp),%eax
 50a:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 50e:	eb 03                	jmp    513 <strchr+0xf>
 510:	83 c0 01             	add    $0x1,%eax
 513:	0f b6 10             	movzbl (%eax),%edx
 516:	84 d2                	test   %dl,%dl
 518:	74 06                	je     520 <strchr+0x1c>
    if(*s == c)
 51a:	38 ca                	cmp    %cl,%dl
 51c:	75 f2                	jne    510 <strchr+0xc>
 51e:	eb 05                	jmp    525 <strchr+0x21>
      return (char*)s;
  return 0;
 520:	b8 00 00 00 00       	mov    $0x0,%eax
}
 525:	5d                   	pop    %ebp
 526:	c3                   	ret    

00000527 <gets>:

char*
gets(char *buf, int max)
{
 527:	55                   	push   %ebp
 528:	89 e5                	mov    %esp,%ebp
 52a:	57                   	push   %edi
 52b:	56                   	push   %esi
 52c:	53                   	push   %ebx
 52d:	83 ec 1c             	sub    $0x1c,%esp
 530:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 533:	bb 00 00 00 00       	mov    $0x0,%ebx
 538:	89 de                	mov    %ebx,%esi
 53a:	83 c3 01             	add    $0x1,%ebx
 53d:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 540:	7d 2e                	jge    570 <gets+0x49>
    cc = read(0, &c, 1);
 542:	83 ec 04             	sub    $0x4,%esp
 545:	6a 01                	push   $0x1
 547:	8d 45 e7             	lea    -0x19(%ebp),%eax
 54a:	50                   	push   %eax
 54b:	6a 00                	push   $0x0
 54d:	e8 ec 00 00 00       	call   63e <read>
    if(cc < 1)
 552:	83 c4 10             	add    $0x10,%esp
 555:	85 c0                	test   %eax,%eax
 557:	7e 17                	jle    570 <gets+0x49>
      break;
    buf[i++] = c;
 559:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 55d:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 560:	3c 0a                	cmp    $0xa,%al
 562:	0f 94 c2             	sete   %dl
 565:	3c 0d                	cmp    $0xd,%al
 567:	0f 94 c0             	sete   %al
 56a:	08 c2                	or     %al,%dl
 56c:	74 ca                	je     538 <gets+0x11>
    buf[i++] = c;
 56e:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 570:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 574:	89 f8                	mov    %edi,%eax
 576:	8d 65 f4             	lea    -0xc(%ebp),%esp
 579:	5b                   	pop    %ebx
 57a:	5e                   	pop    %esi
 57b:	5f                   	pop    %edi
 57c:	5d                   	pop    %ebp
 57d:	c3                   	ret    

0000057e <stat>:

int
stat(const char *n, struct stat *st)
{
 57e:	55                   	push   %ebp
 57f:	89 e5                	mov    %esp,%ebp
 581:	56                   	push   %esi
 582:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 583:	83 ec 08             	sub    $0x8,%esp
 586:	6a 00                	push   $0x0
 588:	ff 75 08             	push   0x8(%ebp)
 58b:	e8 d6 00 00 00       	call   666 <open>
  if(fd < 0)
 590:	83 c4 10             	add    $0x10,%esp
 593:	85 c0                	test   %eax,%eax
 595:	78 24                	js     5bb <stat+0x3d>
 597:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 599:	83 ec 08             	sub    $0x8,%esp
 59c:	ff 75 0c             	push   0xc(%ebp)
 59f:	50                   	push   %eax
 5a0:	e8 d9 00 00 00       	call   67e <fstat>
 5a5:	89 c6                	mov    %eax,%esi
  close(fd);
 5a7:	89 1c 24             	mov    %ebx,(%esp)
 5aa:	e8 9f 00 00 00       	call   64e <close>
  return r;
 5af:	83 c4 10             	add    $0x10,%esp
}
 5b2:	89 f0                	mov    %esi,%eax
 5b4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 5b7:	5b                   	pop    %ebx
 5b8:	5e                   	pop    %esi
 5b9:	5d                   	pop    %ebp
 5ba:	c3                   	ret    
    return -1;
 5bb:	be ff ff ff ff       	mov    $0xffffffff,%esi
 5c0:	eb f0                	jmp    5b2 <stat+0x34>

000005c2 <atoi>:

int
atoi(const char *s)
{
 5c2:	55                   	push   %ebp
 5c3:	89 e5                	mov    %esp,%ebp
 5c5:	53                   	push   %ebx
 5c6:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 5c9:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 5ce:	eb 10                	jmp    5e0 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 5d0:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 5d3:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 5d6:	83 c1 01             	add    $0x1,%ecx
 5d9:	0f be c0             	movsbl %al,%eax
 5dc:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 5e0:	0f b6 01             	movzbl (%ecx),%eax
 5e3:	8d 58 d0             	lea    -0x30(%eax),%ebx
 5e6:	80 fb 09             	cmp    $0x9,%bl
 5e9:	76 e5                	jbe    5d0 <atoi+0xe>
  return n;
}
 5eb:	89 d0                	mov    %edx,%eax
 5ed:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5f0:	c9                   	leave  
 5f1:	c3                   	ret    

000005f2 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 5f2:	55                   	push   %ebp
 5f3:	89 e5                	mov    %esp,%ebp
 5f5:	56                   	push   %esi
 5f6:	53                   	push   %ebx
 5f7:	8b 75 08             	mov    0x8(%ebp),%esi
 5fa:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 5fd:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 600:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 602:	eb 0d                	jmp    611 <memmove+0x1f>
    *dst++ = *src++;
 604:	0f b6 01             	movzbl (%ecx),%eax
 607:	88 02                	mov    %al,(%edx)
 609:	8d 49 01             	lea    0x1(%ecx),%ecx
 60c:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 60f:	89 d8                	mov    %ebx,%eax
 611:	8d 58 ff             	lea    -0x1(%eax),%ebx
 614:	85 c0                	test   %eax,%eax
 616:	7f ec                	jg     604 <memmove+0x12>
  return vdst;
}
 618:	89 f0                	mov    %esi,%eax
 61a:	5b                   	pop    %ebx
 61b:	5e                   	pop    %esi
 61c:	5d                   	pop    %ebp
 61d:	c3                   	ret    

0000061e <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 61e:	b8 01 00 00 00       	mov    $0x1,%eax
 623:	cd 40                	int    $0x40
 625:	c3                   	ret    

00000626 <exit>:
SYSCALL(exit)
 626:	b8 02 00 00 00       	mov    $0x2,%eax
 62b:	cd 40                	int    $0x40
 62d:	c3                   	ret    

0000062e <wait>:
SYSCALL(wait)
 62e:	b8 03 00 00 00       	mov    $0x3,%eax
 633:	cd 40                	int    $0x40
 635:	c3                   	ret    

00000636 <pipe>:
SYSCALL(pipe)
 636:	b8 04 00 00 00       	mov    $0x4,%eax
 63b:	cd 40                	int    $0x40
 63d:	c3                   	ret    

0000063e <read>:
SYSCALL(read)
 63e:	b8 05 00 00 00       	mov    $0x5,%eax
 643:	cd 40                	int    $0x40
 645:	c3                   	ret    

00000646 <write>:
SYSCALL(write)
 646:	b8 10 00 00 00       	mov    $0x10,%eax
 64b:	cd 40                	int    $0x40
 64d:	c3                   	ret    

0000064e <close>:
SYSCALL(close)
 64e:	b8 15 00 00 00       	mov    $0x15,%eax
 653:	cd 40                	int    $0x40
 655:	c3                   	ret    

00000656 <kill>:
SYSCALL(kill)
 656:	b8 06 00 00 00       	mov    $0x6,%eax
 65b:	cd 40                	int    $0x40
 65d:	c3                   	ret    

0000065e <exec>:
SYSCALL(exec)
 65e:	b8 07 00 00 00       	mov    $0x7,%eax
 663:	cd 40                	int    $0x40
 665:	c3                   	ret    

00000666 <open>:
SYSCALL(open)
 666:	b8 0f 00 00 00       	mov    $0xf,%eax
 66b:	cd 40                	int    $0x40
 66d:	c3                   	ret    

0000066e <mknod>:
SYSCALL(mknod)
 66e:	b8 11 00 00 00       	mov    $0x11,%eax
 673:	cd 40                	int    $0x40
 675:	c3                   	ret    

00000676 <unlink>:
SYSCALL(unlink)
 676:	b8 12 00 00 00       	mov    $0x12,%eax
 67b:	cd 40                	int    $0x40
 67d:	c3                   	ret    

0000067e <fstat>:
SYSCALL(fstat)
 67e:	b8 08 00 00 00       	mov    $0x8,%eax
 683:	cd 40                	int    $0x40
 685:	c3                   	ret    

00000686 <link>:
SYSCALL(link)
 686:	b8 13 00 00 00       	mov    $0x13,%eax
 68b:	cd 40                	int    $0x40
 68d:	c3                   	ret    

0000068e <mkdir>:
SYSCALL(mkdir)
 68e:	b8 14 00 00 00       	mov    $0x14,%eax
 693:	cd 40                	int    $0x40
 695:	c3                   	ret    

00000696 <chdir>:
SYSCALL(chdir)
 696:	b8 09 00 00 00       	mov    $0x9,%eax
 69b:	cd 40                	int    $0x40
 69d:	c3                   	ret    

0000069e <dup>:
SYSCALL(dup)
 69e:	b8 0a 00 00 00       	mov    $0xa,%eax
 6a3:	cd 40                	int    $0x40
 6a5:	c3                   	ret    

000006a6 <getpid>:
SYSCALL(getpid)
 6a6:	b8 0b 00 00 00       	mov    $0xb,%eax
 6ab:	cd 40                	int    $0x40
 6ad:	c3                   	ret    

000006ae <sbrk>:
SYSCALL(sbrk)
 6ae:	b8 0c 00 00 00       	mov    $0xc,%eax
 6b3:	cd 40                	int    $0x40
 6b5:	c3                   	ret    

000006b6 <sleep>:
SYSCALL(sleep)
 6b6:	b8 0d 00 00 00       	mov    $0xd,%eax
 6bb:	cd 40                	int    $0x40
 6bd:	c3                   	ret    

000006be <uptime>:
SYSCALL(uptime)
 6be:	b8 0e 00 00 00       	mov    $0xe,%eax
 6c3:	cd 40                	int    $0x40
 6c5:	c3                   	ret    

000006c6 <clone>:
SYSCALL(clone)
 6c6:	b8 16 00 00 00       	mov    $0x16,%eax
 6cb:	cd 40                	int    $0x40
 6cd:	c3                   	ret    

000006ce <join>:
 6ce:	b8 17 00 00 00       	mov    $0x17,%eax
 6d3:	cd 40                	int    $0x40
 6d5:	c3                   	ret    

000006d6 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 6d6:	55                   	push   %ebp
 6d7:	89 e5                	mov    %esp,%ebp
 6d9:	83 ec 1c             	sub    $0x1c,%esp
 6dc:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 6df:	6a 01                	push   $0x1
 6e1:	8d 55 f4             	lea    -0xc(%ebp),%edx
 6e4:	52                   	push   %edx
 6e5:	50                   	push   %eax
 6e6:	e8 5b ff ff ff       	call   646 <write>
}
 6eb:	83 c4 10             	add    $0x10,%esp
 6ee:	c9                   	leave  
 6ef:	c3                   	ret    

000006f0 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 6f0:	55                   	push   %ebp
 6f1:	89 e5                	mov    %esp,%ebp
 6f3:	57                   	push   %edi
 6f4:	56                   	push   %esi
 6f5:	53                   	push   %ebx
 6f6:	83 ec 2c             	sub    $0x2c,%esp
 6f9:	89 45 d0             	mov    %eax,-0x30(%ebp)
 6fc:	89 d0                	mov    %edx,%eax
 6fe:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 700:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 704:	0f 95 c1             	setne  %cl
 707:	c1 ea 1f             	shr    $0x1f,%edx
 70a:	84 d1                	test   %dl,%cl
 70c:	74 44                	je     752 <printint+0x62>
    neg = 1;
    x = -xx;
 70e:	f7 d8                	neg    %eax
 710:	89 c1                	mov    %eax,%ecx
    neg = 1;
 712:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 719:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 71e:	89 c8                	mov    %ecx,%eax
 720:	ba 00 00 00 00       	mov    $0x0,%edx
 725:	f7 f6                	div    %esi
 727:	89 df                	mov    %ebx,%edi
 729:	83 c3 01             	add    $0x1,%ebx
 72c:	0f b6 92 4c 0b 00 00 	movzbl 0xb4c(%edx),%edx
 733:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 737:	89 ca                	mov    %ecx,%edx
 739:	89 c1                	mov    %eax,%ecx
 73b:	39 d6                	cmp    %edx,%esi
 73d:	76 df                	jbe    71e <printint+0x2e>
  if(neg)
 73f:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 743:	74 31                	je     776 <printint+0x86>
    buf[i++] = '-';
 745:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 74a:	8d 5f 02             	lea    0x2(%edi),%ebx
 74d:	8b 75 d0             	mov    -0x30(%ebp),%esi
 750:	eb 17                	jmp    769 <printint+0x79>
    x = xx;
 752:	89 c1                	mov    %eax,%ecx
  neg = 0;
 754:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 75b:	eb bc                	jmp    719 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 75d:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 762:	89 f0                	mov    %esi,%eax
 764:	e8 6d ff ff ff       	call   6d6 <putc>
  while(--i >= 0)
 769:	83 eb 01             	sub    $0x1,%ebx
 76c:	79 ef                	jns    75d <printint+0x6d>
}
 76e:	83 c4 2c             	add    $0x2c,%esp
 771:	5b                   	pop    %ebx
 772:	5e                   	pop    %esi
 773:	5f                   	pop    %edi
 774:	5d                   	pop    %ebp
 775:	c3                   	ret    
 776:	8b 75 d0             	mov    -0x30(%ebp),%esi
 779:	eb ee                	jmp    769 <printint+0x79>

0000077b <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 77b:	55                   	push   %ebp
 77c:	89 e5                	mov    %esp,%ebp
 77e:	57                   	push   %edi
 77f:	56                   	push   %esi
 780:	53                   	push   %ebx
 781:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 784:	8d 45 10             	lea    0x10(%ebp),%eax
 787:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 78a:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 78f:	bb 00 00 00 00       	mov    $0x0,%ebx
 794:	eb 14                	jmp    7aa <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 796:	89 fa                	mov    %edi,%edx
 798:	8b 45 08             	mov    0x8(%ebp),%eax
 79b:	e8 36 ff ff ff       	call   6d6 <putc>
 7a0:	eb 05                	jmp    7a7 <printf+0x2c>
      }
    } else if(state == '%'){
 7a2:	83 fe 25             	cmp    $0x25,%esi
 7a5:	74 25                	je     7cc <printf+0x51>
  for(i = 0; fmt[i]; i++){
 7a7:	83 c3 01             	add    $0x1,%ebx
 7aa:	8b 45 0c             	mov    0xc(%ebp),%eax
 7ad:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 7b1:	84 c0                	test   %al,%al
 7b3:	0f 84 20 01 00 00    	je     8d9 <printf+0x15e>
    c = fmt[i] & 0xff;
 7b9:	0f be f8             	movsbl %al,%edi
 7bc:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 7bf:	85 f6                	test   %esi,%esi
 7c1:	75 df                	jne    7a2 <printf+0x27>
      if(c == '%'){
 7c3:	83 f8 25             	cmp    $0x25,%eax
 7c6:	75 ce                	jne    796 <printf+0x1b>
        state = '%';
 7c8:	89 c6                	mov    %eax,%esi
 7ca:	eb db                	jmp    7a7 <printf+0x2c>
      if(c == 'd'){
 7cc:	83 f8 25             	cmp    $0x25,%eax
 7cf:	0f 84 cf 00 00 00    	je     8a4 <printf+0x129>
 7d5:	0f 8c dd 00 00 00    	jl     8b8 <printf+0x13d>
 7db:	83 f8 78             	cmp    $0x78,%eax
 7de:	0f 8f d4 00 00 00    	jg     8b8 <printf+0x13d>
 7e4:	83 f8 63             	cmp    $0x63,%eax
 7e7:	0f 8c cb 00 00 00    	jl     8b8 <printf+0x13d>
 7ed:	83 e8 63             	sub    $0x63,%eax
 7f0:	83 f8 15             	cmp    $0x15,%eax
 7f3:	0f 87 bf 00 00 00    	ja     8b8 <printf+0x13d>
 7f9:	ff 24 85 f4 0a 00 00 	jmp    *0xaf4(,%eax,4)
        printint(fd, *ap, 10, 1);
 800:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 803:	8b 17                	mov    (%edi),%edx
 805:	83 ec 0c             	sub    $0xc,%esp
 808:	6a 01                	push   $0x1
 80a:	b9 0a 00 00 00       	mov    $0xa,%ecx
 80f:	8b 45 08             	mov    0x8(%ebp),%eax
 812:	e8 d9 fe ff ff       	call   6f0 <printint>
        ap++;
 817:	83 c7 04             	add    $0x4,%edi
 81a:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 81d:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 820:	be 00 00 00 00       	mov    $0x0,%esi
 825:	eb 80                	jmp    7a7 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 827:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 82a:	8b 17                	mov    (%edi),%edx
 82c:	83 ec 0c             	sub    $0xc,%esp
 82f:	6a 00                	push   $0x0
 831:	b9 10 00 00 00       	mov    $0x10,%ecx
 836:	8b 45 08             	mov    0x8(%ebp),%eax
 839:	e8 b2 fe ff ff       	call   6f0 <printint>
        ap++;
 83e:	83 c7 04             	add    $0x4,%edi
 841:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 844:	83 c4 10             	add    $0x10,%esp
      state = 0;
 847:	be 00 00 00 00       	mov    $0x0,%esi
 84c:	e9 56 ff ff ff       	jmp    7a7 <printf+0x2c>
        s = (char*)*ap;
 851:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 854:	8b 30                	mov    (%eax),%esi
        ap++;
 856:	83 c0 04             	add    $0x4,%eax
 859:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 85c:	85 f6                	test   %esi,%esi
 85e:	75 15                	jne    875 <printf+0xfa>
          s = "(null)";
 860:	be ec 0a 00 00       	mov    $0xaec,%esi
 865:	eb 0e                	jmp    875 <printf+0xfa>
          putc(fd, *s);
 867:	0f be d2             	movsbl %dl,%edx
 86a:	8b 45 08             	mov    0x8(%ebp),%eax
 86d:	e8 64 fe ff ff       	call   6d6 <putc>
          s++;
 872:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 875:	0f b6 16             	movzbl (%esi),%edx
 878:	84 d2                	test   %dl,%dl
 87a:	75 eb                	jne    867 <printf+0xec>
      state = 0;
 87c:	be 00 00 00 00       	mov    $0x0,%esi
 881:	e9 21 ff ff ff       	jmp    7a7 <printf+0x2c>
        putc(fd, *ap);
 886:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 889:	0f be 17             	movsbl (%edi),%edx
 88c:	8b 45 08             	mov    0x8(%ebp),%eax
 88f:	e8 42 fe ff ff       	call   6d6 <putc>
        ap++;
 894:	83 c7 04             	add    $0x4,%edi
 897:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 89a:	be 00 00 00 00       	mov    $0x0,%esi
 89f:	e9 03 ff ff ff       	jmp    7a7 <printf+0x2c>
        putc(fd, c);
 8a4:	89 fa                	mov    %edi,%edx
 8a6:	8b 45 08             	mov    0x8(%ebp),%eax
 8a9:	e8 28 fe ff ff       	call   6d6 <putc>
      state = 0;
 8ae:	be 00 00 00 00       	mov    $0x0,%esi
 8b3:	e9 ef fe ff ff       	jmp    7a7 <printf+0x2c>
        putc(fd, '%');
 8b8:	ba 25 00 00 00       	mov    $0x25,%edx
 8bd:	8b 45 08             	mov    0x8(%ebp),%eax
 8c0:	e8 11 fe ff ff       	call   6d6 <putc>
        putc(fd, c);
 8c5:	89 fa                	mov    %edi,%edx
 8c7:	8b 45 08             	mov    0x8(%ebp),%eax
 8ca:	e8 07 fe ff ff       	call   6d6 <putc>
      state = 0;
 8cf:	be 00 00 00 00       	mov    $0x0,%esi
 8d4:	e9 ce fe ff ff       	jmp    7a7 <printf+0x2c>
    }
  }
}
 8d9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 8dc:	5b                   	pop    %ebx
 8dd:	5e                   	pop    %esi
 8de:	5f                   	pop    %edi
 8df:	5d                   	pop    %ebp
 8e0:	c3                   	ret    

000008e1 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 8e1:	55                   	push   %ebp
 8e2:	89 e5                	mov    %esp,%ebp
 8e4:	57                   	push   %edi
 8e5:	56                   	push   %esi
 8e6:	53                   	push   %ebx
 8e7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 8ea:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8ed:	a1 f0 0e 00 00       	mov    0xef0,%eax
 8f2:	eb 02                	jmp    8f6 <free+0x15>
 8f4:	89 d0                	mov    %edx,%eax
 8f6:	39 c8                	cmp    %ecx,%eax
 8f8:	73 04                	jae    8fe <free+0x1d>
 8fa:	39 08                	cmp    %ecx,(%eax)
 8fc:	77 12                	ja     910 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8fe:	8b 10                	mov    (%eax),%edx
 900:	39 c2                	cmp    %eax,%edx
 902:	77 f0                	ja     8f4 <free+0x13>
 904:	39 c8                	cmp    %ecx,%eax
 906:	72 08                	jb     910 <free+0x2f>
 908:	39 ca                	cmp    %ecx,%edx
 90a:	77 04                	ja     910 <free+0x2f>
 90c:	89 d0                	mov    %edx,%eax
 90e:	eb e6                	jmp    8f6 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 910:	8b 73 fc             	mov    -0x4(%ebx),%esi
 913:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 916:	8b 10                	mov    (%eax),%edx
 918:	39 d7                	cmp    %edx,%edi
 91a:	74 19                	je     935 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 91c:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 91f:	8b 50 04             	mov    0x4(%eax),%edx
 922:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 925:	39 ce                	cmp    %ecx,%esi
 927:	74 1b                	je     944 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 929:	89 08                	mov    %ecx,(%eax)
  freep = p;
 92b:	a3 f0 0e 00 00       	mov    %eax,0xef0
}
 930:	5b                   	pop    %ebx
 931:	5e                   	pop    %esi
 932:	5f                   	pop    %edi
 933:	5d                   	pop    %ebp
 934:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 935:	03 72 04             	add    0x4(%edx),%esi
 938:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 93b:	8b 10                	mov    (%eax),%edx
 93d:	8b 12                	mov    (%edx),%edx
 93f:	89 53 f8             	mov    %edx,-0x8(%ebx)
 942:	eb db                	jmp    91f <free+0x3e>
    p->s.size += bp->s.size;
 944:	03 53 fc             	add    -0x4(%ebx),%edx
 947:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 94a:	8b 53 f8             	mov    -0x8(%ebx),%edx
 94d:	89 10                	mov    %edx,(%eax)
 94f:	eb da                	jmp    92b <free+0x4a>

00000951 <morecore>:

static Header*
morecore(uint nu)
{
 951:	55                   	push   %ebp
 952:	89 e5                	mov    %esp,%ebp
 954:	53                   	push   %ebx
 955:	83 ec 04             	sub    $0x4,%esp
 958:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 95a:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 95f:	77 05                	ja     966 <morecore+0x15>
    nu = 4096;
 961:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 966:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 96d:	83 ec 0c             	sub    $0xc,%esp
 970:	50                   	push   %eax
 971:	e8 38 fd ff ff       	call   6ae <sbrk>
  if(p == (char*)-1)
 976:	83 c4 10             	add    $0x10,%esp
 979:	83 f8 ff             	cmp    $0xffffffff,%eax
 97c:	74 1c                	je     99a <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 97e:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 981:	83 c0 08             	add    $0x8,%eax
 984:	83 ec 0c             	sub    $0xc,%esp
 987:	50                   	push   %eax
 988:	e8 54 ff ff ff       	call   8e1 <free>
  return freep;
 98d:	a1 f0 0e 00 00       	mov    0xef0,%eax
 992:	83 c4 10             	add    $0x10,%esp
}
 995:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 998:	c9                   	leave  
 999:	c3                   	ret    
    return 0;
 99a:	b8 00 00 00 00       	mov    $0x0,%eax
 99f:	eb f4                	jmp    995 <morecore+0x44>

000009a1 <malloc>:

void*
malloc(uint nbytes)
{
 9a1:	55                   	push   %ebp
 9a2:	89 e5                	mov    %esp,%ebp
 9a4:	53                   	push   %ebx
 9a5:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9a8:	8b 45 08             	mov    0x8(%ebp),%eax
 9ab:	8d 58 07             	lea    0x7(%eax),%ebx
 9ae:	c1 eb 03             	shr    $0x3,%ebx
 9b1:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 9b4:	8b 0d f0 0e 00 00    	mov    0xef0,%ecx
 9ba:	85 c9                	test   %ecx,%ecx
 9bc:	74 04                	je     9c2 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9be:	8b 01                	mov    (%ecx),%eax
 9c0:	eb 4a                	jmp    a0c <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 9c2:	c7 05 f0 0e 00 00 f4 	movl   $0xef4,0xef0
 9c9:	0e 00 00 
 9cc:	c7 05 f4 0e 00 00 f4 	movl   $0xef4,0xef4
 9d3:	0e 00 00 
    base.s.size = 0;
 9d6:	c7 05 f8 0e 00 00 00 	movl   $0x0,0xef8
 9dd:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 9e0:	b9 f4 0e 00 00       	mov    $0xef4,%ecx
 9e5:	eb d7                	jmp    9be <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 9e7:	74 19                	je     a02 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 9e9:	29 da                	sub    %ebx,%edx
 9eb:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 9ee:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 9f1:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 9f4:	89 0d f0 0e 00 00    	mov    %ecx,0xef0
      return (void*)(p + 1);
 9fa:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 9fd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 a00:	c9                   	leave  
 a01:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 a02:	8b 10                	mov    (%eax),%edx
 a04:	89 11                	mov    %edx,(%ecx)
 a06:	eb ec                	jmp    9f4 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a08:	89 c1                	mov    %eax,%ecx
 a0a:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 a0c:	8b 50 04             	mov    0x4(%eax),%edx
 a0f:	39 da                	cmp    %ebx,%edx
 a11:	73 d4                	jae    9e7 <malloc+0x46>
    if(p == freep)
 a13:	39 05 f0 0e 00 00    	cmp    %eax,0xef0
 a19:	75 ed                	jne    a08 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 a1b:	89 d8                	mov    %ebx,%eax
 a1d:	e8 2f ff ff ff       	call   951 <morecore>
 a22:	85 c0                	test   %eax,%eax
 a24:	75 e2                	jne    a08 <malloc+0x67>
 a26:	eb d5                	jmp    9fd <malloc+0x5c>
