
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
  57:	83 3d 24 0f 00 00 01 	cmpl   $0x1,0xf24
  5e:	0f 84 db 00 00 00    	je     13f <worker+0x104>
  64:	6a 40                	push   $0x40
  66:	68 54 0a 00 00       	push   $0xa54
  6b:	68 5e 0a 00 00       	push   $0xa5e
  70:	6a 01                	push   $0x1
  72:	e8 30 07 00 00       	call   7a7 <printf>
  77:	83 c4 0c             	add    $0xc,%esp
  7a:	68 9d 0a 00 00       	push   $0xa9d
  7f:	68 71 0a 00 00       	push   $0xa71
  84:	6a 01                	push   $0x1
  86:	e8 1c 07 00 00       	call   7a7 <printf>
  8b:	83 c4 08             	add    $0x8,%esp
  8e:	68 85 0a 00 00       	push   $0xa85
  93:	6a 01                	push   $0x1
  95:	e8 0d 07 00 00       	call   7a7 <printf>
  9a:	83 c4 04             	add    $0x4,%esp
  9d:	ff 35 28 0f 00 00    	push   0xf28
  a3:	e8 da 05 00 00       	call   682 <kill>
  a8:	e8 a5 05 00 00       	call   652 <exit>
   assert(tmp1 == 11);
  ad:	6a 3e                	push   $0x3e
  af:	68 54 0a 00 00       	push   $0xa54
  b4:	68 5e 0a 00 00       	push   $0xa5e
  b9:	6a 01                	push   $0x1
  bb:	e8 e7 06 00 00       	call   7a7 <printf>
  c0:	83 c4 0c             	add    $0xc,%esp
  c3:	68 66 0a 00 00       	push   $0xa66
  c8:	68 71 0a 00 00       	push   $0xa71
  cd:	6a 01                	push   $0x1
  cf:	e8 d3 06 00 00       	call   7a7 <printf>
  d4:	83 c4 08             	add    $0x8,%esp
  d7:	68 85 0a 00 00       	push   $0xa85
  dc:	6a 01                	push   $0x1
  de:	e8 c4 06 00 00       	call   7a7 <printf>
  e3:	83 c4 04             	add    $0x4,%esp
  e6:	ff 35 28 0f 00 00    	push   0xf28
  ec:	e8 91 05 00 00       	call   682 <kill>
  f1:	e8 5c 05 00 00       	call   652 <exit>
   assert(tmp2 == 22);
  f6:	6a 3f                	push   $0x3f
  f8:	68 54 0a 00 00       	push   $0xa54
  fd:	68 5e 0a 00 00       	push   $0xa5e
 102:	6a 01                	push   $0x1
 104:	e8 9e 06 00 00       	call   7a7 <printf>
 109:	83 c4 0c             	add    $0xc,%esp
 10c:	68 92 0a 00 00       	push   $0xa92
 111:	68 71 0a 00 00       	push   $0xa71
 116:	6a 01                	push   $0x1
 118:	e8 8a 06 00 00       	call   7a7 <printf>
 11d:	83 c4 08             	add    $0x8,%esp
 120:	68 85 0a 00 00       	push   $0xa85
 125:	6a 01                	push   $0x1
 127:	e8 7b 06 00 00       	call   7a7 <printf>
 12c:	83 c4 04             	add    $0x4,%esp
 12f:	ff 35 28 0f 00 00    	push   0xf28
 135:	e8 48 05 00 00       	call   682 <kill>
 13a:	e8 13 05 00 00       	call   652 <exit>
   assert(fib(2) == 1);
 13f:	83 ec 0c             	sub    $0xc,%esp
 142:	6a 02                	push   $0x2
 144:	e8 b7 fe ff ff       	call   0 <fib>
 149:	83 c4 10             	add    $0x10,%esp
 14c:	83 f8 01             	cmp    $0x1,%eax
 14f:	74 49                	je     19a <worker+0x15f>
 151:	6a 41                	push   $0x41
 153:	68 54 0a 00 00       	push   $0xa54
 158:	68 5e 0a 00 00       	push   $0xa5e
 15d:	6a 01                	push   $0x1
 15f:	e8 43 06 00 00       	call   7a7 <printf>
 164:	83 c4 0c             	add    $0xc,%esp
 167:	68 a9 0a 00 00       	push   $0xaa9
 16c:	68 71 0a 00 00       	push   $0xa71
 171:	6a 01                	push   $0x1
 173:	e8 2f 06 00 00       	call   7a7 <printf>
 178:	83 c4 08             	add    $0x8,%esp
 17b:	68 85 0a 00 00       	push   $0xa85
 180:	6a 01                	push   $0x1
 182:	e8 20 06 00 00       	call   7a7 <printf>
 187:	83 c4 04             	add    $0x4,%esp
 18a:	ff 35 28 0f 00 00    	push   0xf28
 190:	e8 ed 04 00 00       	call   682 <kill>
 195:	e8 b8 04 00 00       	call   652 <exit>
   assert(fib(3) == 2);
 19a:	83 ec 0c             	sub    $0xc,%esp
 19d:	6a 03                	push   $0x3
 19f:	e8 5c fe ff ff       	call   0 <fib>
 1a4:	83 c4 10             	add    $0x10,%esp
 1a7:	83 f8 02             	cmp    $0x2,%eax
 1aa:	74 49                	je     1f5 <worker+0x1ba>
 1ac:	6a 42                	push   $0x42
 1ae:	68 54 0a 00 00       	push   $0xa54
 1b3:	68 5e 0a 00 00       	push   $0xa5e
 1b8:	6a 01                	push   $0x1
 1ba:	e8 e8 05 00 00       	call   7a7 <printf>
 1bf:	83 c4 0c             	add    $0xc,%esp
 1c2:	68 b5 0a 00 00       	push   $0xab5
 1c7:	68 71 0a 00 00       	push   $0xa71
 1cc:	6a 01                	push   $0x1
 1ce:	e8 d4 05 00 00       	call   7a7 <printf>
 1d3:	83 c4 08             	add    $0x8,%esp
 1d6:	68 85 0a 00 00       	push   $0xa85
 1db:	6a 01                	push   $0x1
 1dd:	e8 c5 05 00 00       	call   7a7 <printf>
 1e2:	83 c4 04             	add    $0x4,%esp
 1e5:	ff 35 28 0f 00 00    	push   0xf28
 1eb:	e8 92 04 00 00       	call   682 <kill>
 1f0:	e8 5d 04 00 00       	call   652 <exit>
   assert(fib(9) == 34);
 1f5:	83 ec 0c             	sub    $0xc,%esp
 1f8:	6a 09                	push   $0x9
 1fa:	e8 01 fe ff ff       	call   0 <fib>
 1ff:	83 c4 10             	add    $0x10,%esp
 202:	83 f8 22             	cmp    $0x22,%eax
 205:	74 49                	je     250 <worker+0x215>
 207:	6a 43                	push   $0x43
 209:	68 54 0a 00 00       	push   $0xa54
 20e:	68 5e 0a 00 00       	push   $0xa5e
 213:	6a 01                	push   $0x1
 215:	e8 8d 05 00 00       	call   7a7 <printf>
 21a:	83 c4 0c             	add    $0xc,%esp
 21d:	68 c1 0a 00 00       	push   $0xac1
 222:	68 71 0a 00 00       	push   $0xa71
 227:	6a 01                	push   $0x1
 229:	e8 79 05 00 00       	call   7a7 <printf>
 22e:	83 c4 08             	add    $0x8,%esp
 231:	68 85 0a 00 00       	push   $0xa85
 236:	6a 01                	push   $0x1
 238:	e8 6a 05 00 00       	call   7a7 <printf>
 23d:	83 c4 04             	add    $0x4,%esp
 240:	ff 35 28 0f 00 00    	push   0xf28
 246:	e8 37 04 00 00       	call   682 <kill>
 24b:	e8 02 04 00 00       	call   652 <exit>
   assert(fib(15) == 610);
 250:	83 ec 0c             	sub    $0xc,%esp
 253:	6a 0f                	push   $0xf
 255:	e8 a6 fd ff ff       	call   0 <fib>
 25a:	83 c4 10             	add    $0x10,%esp
 25d:	3d 62 02 00 00       	cmp    $0x262,%eax
 262:	74 49                	je     2ad <worker+0x272>
 264:	6a 44                	push   $0x44
 266:	68 54 0a 00 00       	push   $0xa54
 26b:	68 5e 0a 00 00       	push   $0xa5e
 270:	6a 01                	push   $0x1
 272:	e8 30 05 00 00       	call   7a7 <printf>
 277:	83 c4 0c             	add    $0xc,%esp
 27a:	68 ce 0a 00 00       	push   $0xace
 27f:	68 71 0a 00 00       	push   $0xa71
 284:	6a 01                	push   $0x1
 286:	e8 1c 05 00 00       	call   7a7 <printf>
 28b:	83 c4 08             	add    $0x8,%esp
 28e:	68 85 0a 00 00       	push   $0xa85
 293:	6a 01                	push   $0x1
 295:	e8 0d 05 00 00       	call   7a7 <printf>
 29a:	83 c4 04             	add    $0x4,%esp
 29d:	ff 35 28 0f 00 00    	push   0xf28
 2a3:	e8 da 03 00 00       	call   682 <kill>
 2a8:	e8 a5 03 00 00       	call   652 <exit>
   exit();
 2ad:	e8 a0 03 00 00       	call   652 <exit>

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
 2c4:	e8 09 04 00 00       	call   6d2 <getpid>
 2c9:	a3 28 0f 00 00       	mov    %eax,0xf28
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
 2f5:	39 1d 20 0f 00 00    	cmp    %ebx,0xf20
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
 324:	68 54 0a 00 00       	push   $0xa54
 329:	68 5e 0a 00 00       	push   $0xa5e
 32e:	6a 01                	push   $0x1
 330:	e8 72 04 00 00       	call   7a7 <printf>
 335:	83 c4 0c             	add    $0xc,%esp
 338:	68 dd 0a 00 00       	push   $0xadd
 33d:	68 71 0a 00 00       	push   $0xa71
 342:	6a 01                	push   $0x1
 344:	e8 5e 04 00 00       	call   7a7 <printf>
 349:	83 c4 08             	add    $0x8,%esp
 34c:	68 85 0a 00 00       	push   $0xa85
 351:	6a 01                	push   $0x1
 353:	e8 4f 04 00 00       	call   7a7 <printf>
 358:	83 c4 04             	add    $0x4,%esp
 35b:	ff 35 28 0f 00 00    	push   0xf28
 361:	e8 1c 03 00 00       	call   682 <kill>
 366:	e8 e7 02 00 00       	call   652 <exit>
      assert(thread_pid > 0);
 36b:	6a 2e                	push   $0x2e
 36d:	68 54 0a 00 00       	push   $0xa54
 372:	68 5e 0a 00 00       	push   $0xa5e
 377:	6a 01                	push   $0x1
 379:	e8 29 04 00 00       	call   7a7 <printf>
 37e:	83 c4 0c             	add    $0xc,%esp
 381:	68 ef 0a 00 00       	push   $0xaef
 386:	68 71 0a 00 00       	push   $0xa71
 38b:	6a 01                	push   $0x1
 38d:	e8 15 04 00 00       	call   7a7 <printf>
 392:	83 c4 08             	add    $0x8,%esp
 395:	68 85 0a 00 00       	push   $0xa85
 39a:	6a 01                	push   $0x1
 39c:	e8 06 04 00 00       	call   7a7 <printf>
 3a1:	83 c4 04             	add    $0x4,%esp
 3a4:	ff 35 28 0f 00 00    	push   0xf28
 3aa:	e8 d3 02 00 00       	call   682 <kill>
 3af:	e8 9e 02 00 00       	call   652 <exit>
   for (int i = 0; i < num_threads; i++) {
 3b4:	bb 00 00 00 00       	mov    $0x0,%ebx
 3b9:	39 1d 20 0f 00 00    	cmp    %ebx,0xf20
 3bf:	7e 57                	jle    418 <main+0x166>
      int join_pid = thread_join();
 3c1:	e8 a9 00 00 00       	call   46f <thread_join>
      assert(join_pid > 0);
 3c6:	85 c0                	test   %eax,%eax
 3c8:	7e 05                	jle    3cf <main+0x11d>
   for (int i = 0; i < num_threads; i++) {
 3ca:	83 c3 01             	add    $0x1,%ebx
 3cd:	eb ea                	jmp    3b9 <main+0x107>
      assert(join_pid > 0);
 3cf:	6a 33                	push   $0x33
 3d1:	68 54 0a 00 00       	push   $0xa54
 3d6:	68 5e 0a 00 00       	push   $0xa5e
 3db:	6a 01                	push   $0x1
 3dd:	e8 c5 03 00 00       	call   7a7 <printf>
 3e2:	83 c4 0c             	add    $0xc,%esp
 3e5:	68 fe 0a 00 00       	push   $0xafe
 3ea:	68 71 0a 00 00       	push   $0xa71
 3ef:	6a 01                	push   $0x1
 3f1:	e8 b1 03 00 00       	call   7a7 <printf>
 3f6:	83 c4 08             	add    $0x8,%esp
 3f9:	68 85 0a 00 00       	push   $0xa85
 3fe:	6a 01                	push   $0x1
 400:	e8 a2 03 00 00       	call   7a7 <printf>
 405:	83 c4 04             	add    $0x4,%esp
 408:	ff 35 28 0f 00 00    	push   0xf28
 40e:	e8 6f 02 00 00       	call   682 <kill>
 413:	e8 3a 02 00 00       	call   652 <exit>
   printf(1, "TEST PASSED\n");
 418:	83 ec 08             	sub    $0x8,%esp
 41b:	68 0b 0b 00 00       	push   $0xb0b
 420:	6a 01                	push   $0x1
 422:	e8 80 03 00 00       	call   7a7 <printf>
   exit();
 427:	e8 26 02 00 00       	call   652 <exit>

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

// a wrapper func for clone
int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 43d:	55                   	push   %ebp
 43e:	89 e5                	mov    %esp,%ebp
 440:	83 ec 14             	sub    $0x14,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE);
 443:	68 00 10 00 00       	push   $0x1000
 448:	e8 80 05 00 00       	call   9cd <malloc>
  if(n_stack == 0){
 44d:	83 c4 10             	add    $0x10,%esp
 450:	85 c0                	test   %eax,%eax
 452:	74 14                	je     468 <thread_create+0x2b>
    return -1;
  }
  int new_pid = clone(start_routine, arg1, arg2, n_stack); // TODO: is this the right way to call it?
 454:	50                   	push   %eax
 455:	ff 75 10             	push   0x10(%ebp)
 458:	ff 75 0c             	push   0xc(%ebp)
 45b:	ff 75 08             	push   0x8(%ebp)
 45e:	e8 8f 02 00 00       	call   6f2 <clone>


  // I can't remember if there was something else to do here but I'm sure I'll find out


  return new_pid;
 463:	83 c4 10             	add    $0x10,%esp
}
 466:	c9                   	leave  
 467:	c3                   	ret    
    return -1;
 468:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 46d:	eb f7                	jmp    466 <thread_create+0x29>

0000046f <thread_join>:

int thread_join() {
  return 0;
}
 46f:	b8 00 00 00 00       	mov    $0x0,%eax
 474:	c3                   	ret    

00000475 <lock_acquire>:

void lock_acquire(lock_t *lock){
 475:	55                   	push   %ebp
 476:	89 e5                	mov    %esp,%ebp
 478:	53                   	push   %ebx
 479:	83 ec 04             	sub    $0x4,%esp
 47c:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 47f:	83 ec 08             	sub    $0x8,%esp
 482:	6a 01                	push   $0x1
 484:	53                   	push   %ebx
 485:	e8 a2 ff ff ff       	call   42c <test_and_set>
 48a:	83 c4 10             	add    $0x10,%esp
 48d:	83 f8 01             	cmp    $0x1,%eax
 490:	74 ed                	je     47f <lock_acquire+0xa>
    ;
}
 492:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 495:	c9                   	leave  
 496:	c3                   	ret    

00000497 <lock_release>:

void lock_release(lock_t *lock) {
 497:	55                   	push   %ebp
 498:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 49a:	8b 45 08             	mov    0x8(%ebp),%eax
 49d:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 4a3:	5d                   	pop    %ebp
 4a4:	c3                   	ret    

000004a5 <lock_init>:

void lock_init(lock_t *lock) {
 4a5:	55                   	push   %ebp
 4a6:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 4a8:	8b 45 08             	mov    0x8(%ebp),%eax
 4ab:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 4b1:	5d                   	pop    %ebp
 4b2:	c3                   	ret    

000004b3 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 4b3:	55                   	push   %ebp
 4b4:	89 e5                	mov    %esp,%ebp
 4b6:	56                   	push   %esi
 4b7:	53                   	push   %ebx
 4b8:	8b 75 08             	mov    0x8(%ebp),%esi
 4bb:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 4be:	89 f0                	mov    %esi,%eax
 4c0:	89 d1                	mov    %edx,%ecx
 4c2:	83 c2 01             	add    $0x1,%edx
 4c5:	89 c3                	mov    %eax,%ebx
 4c7:	83 c0 01             	add    $0x1,%eax
 4ca:	0f b6 09             	movzbl (%ecx),%ecx
 4cd:	88 0b                	mov    %cl,(%ebx)
 4cf:	84 c9                	test   %cl,%cl
 4d1:	75 ed                	jne    4c0 <strcpy+0xd>
    ;
  return os;
}
 4d3:	89 f0                	mov    %esi,%eax
 4d5:	5b                   	pop    %ebx
 4d6:	5e                   	pop    %esi
 4d7:	5d                   	pop    %ebp
 4d8:	c3                   	ret    

000004d9 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 4d9:	55                   	push   %ebp
 4da:	89 e5                	mov    %esp,%ebp
 4dc:	8b 4d 08             	mov    0x8(%ebp),%ecx
 4df:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 4e2:	eb 06                	jmp    4ea <strcmp+0x11>
    p++, q++;
 4e4:	83 c1 01             	add    $0x1,%ecx
 4e7:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 4ea:	0f b6 01             	movzbl (%ecx),%eax
 4ed:	84 c0                	test   %al,%al
 4ef:	74 04                	je     4f5 <strcmp+0x1c>
 4f1:	3a 02                	cmp    (%edx),%al
 4f3:	74 ef                	je     4e4 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 4f5:	0f b6 c0             	movzbl %al,%eax
 4f8:	0f b6 12             	movzbl (%edx),%edx
 4fb:	29 d0                	sub    %edx,%eax
}
 4fd:	5d                   	pop    %ebp
 4fe:	c3                   	ret    

000004ff <strlen>:

uint
strlen(const char *s)
{
 4ff:	55                   	push   %ebp
 500:	89 e5                	mov    %esp,%ebp
 502:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 505:	b8 00 00 00 00       	mov    $0x0,%eax
 50a:	eb 03                	jmp    50f <strlen+0x10>
 50c:	83 c0 01             	add    $0x1,%eax
 50f:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 513:	75 f7                	jne    50c <strlen+0xd>
    ;
  return n;
}
 515:	5d                   	pop    %ebp
 516:	c3                   	ret    

00000517 <memset>:

void*
memset(void *dst, int c, uint n)
{
 517:	55                   	push   %ebp
 518:	89 e5                	mov    %esp,%ebp
 51a:	57                   	push   %edi
 51b:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 51e:	89 d7                	mov    %edx,%edi
 520:	8b 4d 10             	mov    0x10(%ebp),%ecx
 523:	8b 45 0c             	mov    0xc(%ebp),%eax
 526:	fc                   	cld    
 527:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 529:	89 d0                	mov    %edx,%eax
 52b:	8b 7d fc             	mov    -0x4(%ebp),%edi
 52e:	c9                   	leave  
 52f:	c3                   	ret    

00000530 <strchr>:

char*
strchr(const char *s, char c)
{
 530:	55                   	push   %ebp
 531:	89 e5                	mov    %esp,%ebp
 533:	8b 45 08             	mov    0x8(%ebp),%eax
 536:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 53a:	eb 03                	jmp    53f <strchr+0xf>
 53c:	83 c0 01             	add    $0x1,%eax
 53f:	0f b6 10             	movzbl (%eax),%edx
 542:	84 d2                	test   %dl,%dl
 544:	74 06                	je     54c <strchr+0x1c>
    if(*s == c)
 546:	38 ca                	cmp    %cl,%dl
 548:	75 f2                	jne    53c <strchr+0xc>
 54a:	eb 05                	jmp    551 <strchr+0x21>
      return (char*)s;
  return 0;
 54c:	b8 00 00 00 00       	mov    $0x0,%eax
}
 551:	5d                   	pop    %ebp
 552:	c3                   	ret    

00000553 <gets>:

char*
gets(char *buf, int max)
{
 553:	55                   	push   %ebp
 554:	89 e5                	mov    %esp,%ebp
 556:	57                   	push   %edi
 557:	56                   	push   %esi
 558:	53                   	push   %ebx
 559:	83 ec 1c             	sub    $0x1c,%esp
 55c:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 55f:	bb 00 00 00 00       	mov    $0x0,%ebx
 564:	89 de                	mov    %ebx,%esi
 566:	83 c3 01             	add    $0x1,%ebx
 569:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 56c:	7d 2e                	jge    59c <gets+0x49>
    cc = read(0, &c, 1);
 56e:	83 ec 04             	sub    $0x4,%esp
 571:	6a 01                	push   $0x1
 573:	8d 45 e7             	lea    -0x19(%ebp),%eax
 576:	50                   	push   %eax
 577:	6a 00                	push   $0x0
 579:	e8 ec 00 00 00       	call   66a <read>
    if(cc < 1)
 57e:	83 c4 10             	add    $0x10,%esp
 581:	85 c0                	test   %eax,%eax
 583:	7e 17                	jle    59c <gets+0x49>
      break;
    buf[i++] = c;
 585:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 589:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 58c:	3c 0a                	cmp    $0xa,%al
 58e:	0f 94 c2             	sete   %dl
 591:	3c 0d                	cmp    $0xd,%al
 593:	0f 94 c0             	sete   %al
 596:	08 c2                	or     %al,%dl
 598:	74 ca                	je     564 <gets+0x11>
    buf[i++] = c;
 59a:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 59c:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 5a0:	89 f8                	mov    %edi,%eax
 5a2:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5a5:	5b                   	pop    %ebx
 5a6:	5e                   	pop    %esi
 5a7:	5f                   	pop    %edi
 5a8:	5d                   	pop    %ebp
 5a9:	c3                   	ret    

000005aa <stat>:

int
stat(const char *n, struct stat *st)
{
 5aa:	55                   	push   %ebp
 5ab:	89 e5                	mov    %esp,%ebp
 5ad:	56                   	push   %esi
 5ae:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 5af:	83 ec 08             	sub    $0x8,%esp
 5b2:	6a 00                	push   $0x0
 5b4:	ff 75 08             	push   0x8(%ebp)
 5b7:	e8 d6 00 00 00       	call   692 <open>
  if(fd < 0)
 5bc:	83 c4 10             	add    $0x10,%esp
 5bf:	85 c0                	test   %eax,%eax
 5c1:	78 24                	js     5e7 <stat+0x3d>
 5c3:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 5c5:	83 ec 08             	sub    $0x8,%esp
 5c8:	ff 75 0c             	push   0xc(%ebp)
 5cb:	50                   	push   %eax
 5cc:	e8 d9 00 00 00       	call   6aa <fstat>
 5d1:	89 c6                	mov    %eax,%esi
  close(fd);
 5d3:	89 1c 24             	mov    %ebx,(%esp)
 5d6:	e8 9f 00 00 00       	call   67a <close>
  return r;
 5db:	83 c4 10             	add    $0x10,%esp
}
 5de:	89 f0                	mov    %esi,%eax
 5e0:	8d 65 f8             	lea    -0x8(%ebp),%esp
 5e3:	5b                   	pop    %ebx
 5e4:	5e                   	pop    %esi
 5e5:	5d                   	pop    %ebp
 5e6:	c3                   	ret    
    return -1;
 5e7:	be ff ff ff ff       	mov    $0xffffffff,%esi
 5ec:	eb f0                	jmp    5de <stat+0x34>

000005ee <atoi>:

int
atoi(const char *s)
{
 5ee:	55                   	push   %ebp
 5ef:	89 e5                	mov    %esp,%ebp
 5f1:	53                   	push   %ebx
 5f2:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 5f5:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 5fa:	eb 10                	jmp    60c <atoi+0x1e>
    n = n*10 + *s++ - '0';
 5fc:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 5ff:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 602:	83 c1 01             	add    $0x1,%ecx
 605:	0f be c0             	movsbl %al,%eax
 608:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 60c:	0f b6 01             	movzbl (%ecx),%eax
 60f:	8d 58 d0             	lea    -0x30(%eax),%ebx
 612:	80 fb 09             	cmp    $0x9,%bl
 615:	76 e5                	jbe    5fc <atoi+0xe>
  return n;
}
 617:	89 d0                	mov    %edx,%eax
 619:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 61c:	c9                   	leave  
 61d:	c3                   	ret    

0000061e <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 61e:	55                   	push   %ebp
 61f:	89 e5                	mov    %esp,%ebp
 621:	56                   	push   %esi
 622:	53                   	push   %ebx
 623:	8b 75 08             	mov    0x8(%ebp),%esi
 626:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 629:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 62c:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 62e:	eb 0d                	jmp    63d <memmove+0x1f>
    *dst++ = *src++;
 630:	0f b6 01             	movzbl (%ecx),%eax
 633:	88 02                	mov    %al,(%edx)
 635:	8d 49 01             	lea    0x1(%ecx),%ecx
 638:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 63b:	89 d8                	mov    %ebx,%eax
 63d:	8d 58 ff             	lea    -0x1(%eax),%ebx
 640:	85 c0                	test   %eax,%eax
 642:	7f ec                	jg     630 <memmove+0x12>
  return vdst;
}
 644:	89 f0                	mov    %esi,%eax
 646:	5b                   	pop    %ebx
 647:	5e                   	pop    %esi
 648:	5d                   	pop    %ebp
 649:	c3                   	ret    

0000064a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 64a:	b8 01 00 00 00       	mov    $0x1,%eax
 64f:	cd 40                	int    $0x40
 651:	c3                   	ret    

00000652 <exit>:
SYSCALL(exit)
 652:	b8 02 00 00 00       	mov    $0x2,%eax
 657:	cd 40                	int    $0x40
 659:	c3                   	ret    

0000065a <wait>:
SYSCALL(wait)
 65a:	b8 03 00 00 00       	mov    $0x3,%eax
 65f:	cd 40                	int    $0x40
 661:	c3                   	ret    

00000662 <pipe>:
SYSCALL(pipe)
 662:	b8 04 00 00 00       	mov    $0x4,%eax
 667:	cd 40                	int    $0x40
 669:	c3                   	ret    

0000066a <read>:
SYSCALL(read)
 66a:	b8 05 00 00 00       	mov    $0x5,%eax
 66f:	cd 40                	int    $0x40
 671:	c3                   	ret    

00000672 <write>:
SYSCALL(write)
 672:	b8 10 00 00 00       	mov    $0x10,%eax
 677:	cd 40                	int    $0x40
 679:	c3                   	ret    

0000067a <close>:
SYSCALL(close)
 67a:	b8 15 00 00 00       	mov    $0x15,%eax
 67f:	cd 40                	int    $0x40
 681:	c3                   	ret    

00000682 <kill>:
SYSCALL(kill)
 682:	b8 06 00 00 00       	mov    $0x6,%eax
 687:	cd 40                	int    $0x40
 689:	c3                   	ret    

0000068a <exec>:
SYSCALL(exec)
 68a:	b8 07 00 00 00       	mov    $0x7,%eax
 68f:	cd 40                	int    $0x40
 691:	c3                   	ret    

00000692 <open>:
SYSCALL(open)
 692:	b8 0f 00 00 00       	mov    $0xf,%eax
 697:	cd 40                	int    $0x40
 699:	c3                   	ret    

0000069a <mknod>:
SYSCALL(mknod)
 69a:	b8 11 00 00 00       	mov    $0x11,%eax
 69f:	cd 40                	int    $0x40
 6a1:	c3                   	ret    

000006a2 <unlink>:
SYSCALL(unlink)
 6a2:	b8 12 00 00 00       	mov    $0x12,%eax
 6a7:	cd 40                	int    $0x40
 6a9:	c3                   	ret    

000006aa <fstat>:
SYSCALL(fstat)
 6aa:	b8 08 00 00 00       	mov    $0x8,%eax
 6af:	cd 40                	int    $0x40
 6b1:	c3                   	ret    

000006b2 <link>:
SYSCALL(link)
 6b2:	b8 13 00 00 00       	mov    $0x13,%eax
 6b7:	cd 40                	int    $0x40
 6b9:	c3                   	ret    

000006ba <mkdir>:
SYSCALL(mkdir)
 6ba:	b8 14 00 00 00       	mov    $0x14,%eax
 6bf:	cd 40                	int    $0x40
 6c1:	c3                   	ret    

000006c2 <chdir>:
SYSCALL(chdir)
 6c2:	b8 09 00 00 00       	mov    $0x9,%eax
 6c7:	cd 40                	int    $0x40
 6c9:	c3                   	ret    

000006ca <dup>:
SYSCALL(dup)
 6ca:	b8 0a 00 00 00       	mov    $0xa,%eax
 6cf:	cd 40                	int    $0x40
 6d1:	c3                   	ret    

000006d2 <getpid>:
SYSCALL(getpid)
 6d2:	b8 0b 00 00 00       	mov    $0xb,%eax
 6d7:	cd 40                	int    $0x40
 6d9:	c3                   	ret    

000006da <sbrk>:
SYSCALL(sbrk)
 6da:	b8 0c 00 00 00       	mov    $0xc,%eax
 6df:	cd 40                	int    $0x40
 6e1:	c3                   	ret    

000006e2 <sleep>:
SYSCALL(sleep)
 6e2:	b8 0d 00 00 00       	mov    $0xd,%eax
 6e7:	cd 40                	int    $0x40
 6e9:	c3                   	ret    

000006ea <uptime>:
SYSCALL(uptime)
 6ea:	b8 0e 00 00 00       	mov    $0xe,%eax
 6ef:	cd 40                	int    $0x40
 6f1:	c3                   	ret    

000006f2 <clone>:
SYSCALL(clone)
 6f2:	b8 16 00 00 00       	mov    $0x16,%eax
 6f7:	cd 40                	int    $0x40
 6f9:	c3                   	ret    

000006fa <join>:
 6fa:	b8 17 00 00 00       	mov    $0x17,%eax
 6ff:	cd 40                	int    $0x40
 701:	c3                   	ret    

00000702 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 702:	55                   	push   %ebp
 703:	89 e5                	mov    %esp,%ebp
 705:	83 ec 1c             	sub    $0x1c,%esp
 708:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 70b:	6a 01                	push   $0x1
 70d:	8d 55 f4             	lea    -0xc(%ebp),%edx
 710:	52                   	push   %edx
 711:	50                   	push   %eax
 712:	e8 5b ff ff ff       	call   672 <write>
}
 717:	83 c4 10             	add    $0x10,%esp
 71a:	c9                   	leave  
 71b:	c3                   	ret    

0000071c <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 71c:	55                   	push   %ebp
 71d:	89 e5                	mov    %esp,%ebp
 71f:	57                   	push   %edi
 720:	56                   	push   %esi
 721:	53                   	push   %ebx
 722:	83 ec 2c             	sub    $0x2c,%esp
 725:	89 45 d0             	mov    %eax,-0x30(%ebp)
 728:	89 d0                	mov    %edx,%eax
 72a:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 72c:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 730:	0f 95 c1             	setne  %cl
 733:	c1 ea 1f             	shr    $0x1f,%edx
 736:	84 d1                	test   %dl,%cl
 738:	74 44                	je     77e <printint+0x62>
    neg = 1;
    x = -xx;
 73a:	f7 d8                	neg    %eax
 73c:	89 c1                	mov    %eax,%ecx
    neg = 1;
 73e:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 745:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 74a:	89 c8                	mov    %ecx,%eax
 74c:	ba 00 00 00 00       	mov    $0x0,%edx
 751:	f7 f6                	div    %esi
 753:	89 df                	mov    %ebx,%edi
 755:	83 c3 01             	add    $0x1,%ebx
 758:	0f b6 92 78 0b 00 00 	movzbl 0xb78(%edx),%edx
 75f:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 763:	89 ca                	mov    %ecx,%edx
 765:	89 c1                	mov    %eax,%ecx
 767:	39 d6                	cmp    %edx,%esi
 769:	76 df                	jbe    74a <printint+0x2e>
  if(neg)
 76b:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 76f:	74 31                	je     7a2 <printint+0x86>
    buf[i++] = '-';
 771:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 776:	8d 5f 02             	lea    0x2(%edi),%ebx
 779:	8b 75 d0             	mov    -0x30(%ebp),%esi
 77c:	eb 17                	jmp    795 <printint+0x79>
    x = xx;
 77e:	89 c1                	mov    %eax,%ecx
  neg = 0;
 780:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 787:	eb bc                	jmp    745 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 789:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 78e:	89 f0                	mov    %esi,%eax
 790:	e8 6d ff ff ff       	call   702 <putc>
  while(--i >= 0)
 795:	83 eb 01             	sub    $0x1,%ebx
 798:	79 ef                	jns    789 <printint+0x6d>
}
 79a:	83 c4 2c             	add    $0x2c,%esp
 79d:	5b                   	pop    %ebx
 79e:	5e                   	pop    %esi
 79f:	5f                   	pop    %edi
 7a0:	5d                   	pop    %ebp
 7a1:	c3                   	ret    
 7a2:	8b 75 d0             	mov    -0x30(%ebp),%esi
 7a5:	eb ee                	jmp    795 <printint+0x79>

000007a7 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 7a7:	55                   	push   %ebp
 7a8:	89 e5                	mov    %esp,%ebp
 7aa:	57                   	push   %edi
 7ab:	56                   	push   %esi
 7ac:	53                   	push   %ebx
 7ad:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 7b0:	8d 45 10             	lea    0x10(%ebp),%eax
 7b3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 7b6:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 7bb:	bb 00 00 00 00       	mov    $0x0,%ebx
 7c0:	eb 14                	jmp    7d6 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 7c2:	89 fa                	mov    %edi,%edx
 7c4:	8b 45 08             	mov    0x8(%ebp),%eax
 7c7:	e8 36 ff ff ff       	call   702 <putc>
 7cc:	eb 05                	jmp    7d3 <printf+0x2c>
      }
    } else if(state == '%'){
 7ce:	83 fe 25             	cmp    $0x25,%esi
 7d1:	74 25                	je     7f8 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 7d3:	83 c3 01             	add    $0x1,%ebx
 7d6:	8b 45 0c             	mov    0xc(%ebp),%eax
 7d9:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 7dd:	84 c0                	test   %al,%al
 7df:	0f 84 20 01 00 00    	je     905 <printf+0x15e>
    c = fmt[i] & 0xff;
 7e5:	0f be f8             	movsbl %al,%edi
 7e8:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 7eb:	85 f6                	test   %esi,%esi
 7ed:	75 df                	jne    7ce <printf+0x27>
      if(c == '%'){
 7ef:	83 f8 25             	cmp    $0x25,%eax
 7f2:	75 ce                	jne    7c2 <printf+0x1b>
        state = '%';
 7f4:	89 c6                	mov    %eax,%esi
 7f6:	eb db                	jmp    7d3 <printf+0x2c>
      if(c == 'd'){
 7f8:	83 f8 25             	cmp    $0x25,%eax
 7fb:	0f 84 cf 00 00 00    	je     8d0 <printf+0x129>
 801:	0f 8c dd 00 00 00    	jl     8e4 <printf+0x13d>
 807:	83 f8 78             	cmp    $0x78,%eax
 80a:	0f 8f d4 00 00 00    	jg     8e4 <printf+0x13d>
 810:	83 f8 63             	cmp    $0x63,%eax
 813:	0f 8c cb 00 00 00    	jl     8e4 <printf+0x13d>
 819:	83 e8 63             	sub    $0x63,%eax
 81c:	83 f8 15             	cmp    $0x15,%eax
 81f:	0f 87 bf 00 00 00    	ja     8e4 <printf+0x13d>
 825:	ff 24 85 20 0b 00 00 	jmp    *0xb20(,%eax,4)
        printint(fd, *ap, 10, 1);
 82c:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 82f:	8b 17                	mov    (%edi),%edx
 831:	83 ec 0c             	sub    $0xc,%esp
 834:	6a 01                	push   $0x1
 836:	b9 0a 00 00 00       	mov    $0xa,%ecx
 83b:	8b 45 08             	mov    0x8(%ebp),%eax
 83e:	e8 d9 fe ff ff       	call   71c <printint>
        ap++;
 843:	83 c7 04             	add    $0x4,%edi
 846:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 849:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 84c:	be 00 00 00 00       	mov    $0x0,%esi
 851:	eb 80                	jmp    7d3 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 853:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 856:	8b 17                	mov    (%edi),%edx
 858:	83 ec 0c             	sub    $0xc,%esp
 85b:	6a 00                	push   $0x0
 85d:	b9 10 00 00 00       	mov    $0x10,%ecx
 862:	8b 45 08             	mov    0x8(%ebp),%eax
 865:	e8 b2 fe ff ff       	call   71c <printint>
        ap++;
 86a:	83 c7 04             	add    $0x4,%edi
 86d:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 870:	83 c4 10             	add    $0x10,%esp
      state = 0;
 873:	be 00 00 00 00       	mov    $0x0,%esi
 878:	e9 56 ff ff ff       	jmp    7d3 <printf+0x2c>
        s = (char*)*ap;
 87d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 880:	8b 30                	mov    (%eax),%esi
        ap++;
 882:	83 c0 04             	add    $0x4,%eax
 885:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 888:	85 f6                	test   %esi,%esi
 88a:	75 15                	jne    8a1 <printf+0xfa>
          s = "(null)";
 88c:	be 18 0b 00 00       	mov    $0xb18,%esi
 891:	eb 0e                	jmp    8a1 <printf+0xfa>
          putc(fd, *s);
 893:	0f be d2             	movsbl %dl,%edx
 896:	8b 45 08             	mov    0x8(%ebp),%eax
 899:	e8 64 fe ff ff       	call   702 <putc>
          s++;
 89e:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 8a1:	0f b6 16             	movzbl (%esi),%edx
 8a4:	84 d2                	test   %dl,%dl
 8a6:	75 eb                	jne    893 <printf+0xec>
      state = 0;
 8a8:	be 00 00 00 00       	mov    $0x0,%esi
 8ad:	e9 21 ff ff ff       	jmp    7d3 <printf+0x2c>
        putc(fd, *ap);
 8b2:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 8b5:	0f be 17             	movsbl (%edi),%edx
 8b8:	8b 45 08             	mov    0x8(%ebp),%eax
 8bb:	e8 42 fe ff ff       	call   702 <putc>
        ap++;
 8c0:	83 c7 04             	add    $0x4,%edi
 8c3:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 8c6:	be 00 00 00 00       	mov    $0x0,%esi
 8cb:	e9 03 ff ff ff       	jmp    7d3 <printf+0x2c>
        putc(fd, c);
 8d0:	89 fa                	mov    %edi,%edx
 8d2:	8b 45 08             	mov    0x8(%ebp),%eax
 8d5:	e8 28 fe ff ff       	call   702 <putc>
      state = 0;
 8da:	be 00 00 00 00       	mov    $0x0,%esi
 8df:	e9 ef fe ff ff       	jmp    7d3 <printf+0x2c>
        putc(fd, '%');
 8e4:	ba 25 00 00 00       	mov    $0x25,%edx
 8e9:	8b 45 08             	mov    0x8(%ebp),%eax
 8ec:	e8 11 fe ff ff       	call   702 <putc>
        putc(fd, c);
 8f1:	89 fa                	mov    %edi,%edx
 8f3:	8b 45 08             	mov    0x8(%ebp),%eax
 8f6:	e8 07 fe ff ff       	call   702 <putc>
      state = 0;
 8fb:	be 00 00 00 00       	mov    $0x0,%esi
 900:	e9 ce fe ff ff       	jmp    7d3 <printf+0x2c>
    }
  }
}
 905:	8d 65 f4             	lea    -0xc(%ebp),%esp
 908:	5b                   	pop    %ebx
 909:	5e                   	pop    %esi
 90a:	5f                   	pop    %edi
 90b:	5d                   	pop    %ebp
 90c:	c3                   	ret    

0000090d <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 90d:	55                   	push   %ebp
 90e:	89 e5                	mov    %esp,%ebp
 910:	57                   	push   %edi
 911:	56                   	push   %esi
 912:	53                   	push   %ebx
 913:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 916:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 919:	a1 2c 0f 00 00       	mov    0xf2c,%eax
 91e:	eb 02                	jmp    922 <free+0x15>
 920:	89 d0                	mov    %edx,%eax
 922:	39 c8                	cmp    %ecx,%eax
 924:	73 04                	jae    92a <free+0x1d>
 926:	39 08                	cmp    %ecx,(%eax)
 928:	77 12                	ja     93c <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 92a:	8b 10                	mov    (%eax),%edx
 92c:	39 c2                	cmp    %eax,%edx
 92e:	77 f0                	ja     920 <free+0x13>
 930:	39 c8                	cmp    %ecx,%eax
 932:	72 08                	jb     93c <free+0x2f>
 934:	39 ca                	cmp    %ecx,%edx
 936:	77 04                	ja     93c <free+0x2f>
 938:	89 d0                	mov    %edx,%eax
 93a:	eb e6                	jmp    922 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 93c:	8b 73 fc             	mov    -0x4(%ebx),%esi
 93f:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 942:	8b 10                	mov    (%eax),%edx
 944:	39 d7                	cmp    %edx,%edi
 946:	74 19                	je     961 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 948:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 94b:	8b 50 04             	mov    0x4(%eax),%edx
 94e:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 951:	39 ce                	cmp    %ecx,%esi
 953:	74 1b                	je     970 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 955:	89 08                	mov    %ecx,(%eax)
  freep = p;
 957:	a3 2c 0f 00 00       	mov    %eax,0xf2c
}
 95c:	5b                   	pop    %ebx
 95d:	5e                   	pop    %esi
 95e:	5f                   	pop    %edi
 95f:	5d                   	pop    %ebp
 960:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 961:	03 72 04             	add    0x4(%edx),%esi
 964:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 967:	8b 10                	mov    (%eax),%edx
 969:	8b 12                	mov    (%edx),%edx
 96b:	89 53 f8             	mov    %edx,-0x8(%ebx)
 96e:	eb db                	jmp    94b <free+0x3e>
    p->s.size += bp->s.size;
 970:	03 53 fc             	add    -0x4(%ebx),%edx
 973:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 976:	8b 53 f8             	mov    -0x8(%ebx),%edx
 979:	89 10                	mov    %edx,(%eax)
 97b:	eb da                	jmp    957 <free+0x4a>

0000097d <morecore>:

static Header*
morecore(uint nu)
{
 97d:	55                   	push   %ebp
 97e:	89 e5                	mov    %esp,%ebp
 980:	53                   	push   %ebx
 981:	83 ec 04             	sub    $0x4,%esp
 984:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 986:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 98b:	77 05                	ja     992 <morecore+0x15>
    nu = 4096;
 98d:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 992:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 999:	83 ec 0c             	sub    $0xc,%esp
 99c:	50                   	push   %eax
 99d:	e8 38 fd ff ff       	call   6da <sbrk>
  if(p == (char*)-1)
 9a2:	83 c4 10             	add    $0x10,%esp
 9a5:	83 f8 ff             	cmp    $0xffffffff,%eax
 9a8:	74 1c                	je     9c6 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 9aa:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 9ad:	83 c0 08             	add    $0x8,%eax
 9b0:	83 ec 0c             	sub    $0xc,%esp
 9b3:	50                   	push   %eax
 9b4:	e8 54 ff ff ff       	call   90d <free>
  return freep;
 9b9:	a1 2c 0f 00 00       	mov    0xf2c,%eax
 9be:	83 c4 10             	add    $0x10,%esp
}
 9c1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 9c4:	c9                   	leave  
 9c5:	c3                   	ret    
    return 0;
 9c6:	b8 00 00 00 00       	mov    $0x0,%eax
 9cb:	eb f4                	jmp    9c1 <morecore+0x44>

000009cd <malloc>:

void*
malloc(uint nbytes)
{
 9cd:	55                   	push   %ebp
 9ce:	89 e5                	mov    %esp,%ebp
 9d0:	53                   	push   %ebx
 9d1:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9d4:	8b 45 08             	mov    0x8(%ebp),%eax
 9d7:	8d 58 07             	lea    0x7(%eax),%ebx
 9da:	c1 eb 03             	shr    $0x3,%ebx
 9dd:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 9e0:	8b 0d 2c 0f 00 00    	mov    0xf2c,%ecx
 9e6:	85 c9                	test   %ecx,%ecx
 9e8:	74 04                	je     9ee <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9ea:	8b 01                	mov    (%ecx),%eax
 9ec:	eb 4a                	jmp    a38 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 9ee:	c7 05 2c 0f 00 00 30 	movl   $0xf30,0xf2c
 9f5:	0f 00 00 
 9f8:	c7 05 30 0f 00 00 30 	movl   $0xf30,0xf30
 9ff:	0f 00 00 
    base.s.size = 0;
 a02:	c7 05 34 0f 00 00 00 	movl   $0x0,0xf34
 a09:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 a0c:	b9 30 0f 00 00       	mov    $0xf30,%ecx
 a11:	eb d7                	jmp    9ea <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 a13:	74 19                	je     a2e <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 a15:	29 da                	sub    %ebx,%edx
 a17:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 a1a:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 a1d:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 a20:	89 0d 2c 0f 00 00    	mov    %ecx,0xf2c
      return (void*)(p + 1);
 a26:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 a29:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 a2c:	c9                   	leave  
 a2d:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 a2e:	8b 10                	mov    (%eax),%edx
 a30:	89 11                	mov    %edx,(%ecx)
 a32:	eb ec                	jmp    a20 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a34:	89 c1                	mov    %eax,%ecx
 a36:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 a38:	8b 50 04             	mov    0x4(%eax),%edx
 a3b:	39 da                	cmp    %ebx,%edx
 a3d:	73 d4                	jae    a13 <malloc+0x46>
    if(p == freep)
 a3f:	39 05 2c 0f 00 00    	cmp    %eax,0xf2c
 a45:	75 ed                	jne    a34 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 a47:	89 d8                	mov    %ebx,%eax
 a49:	e8 2f ff ff ff       	call   97d <morecore>
 a4e:	85 c0                	test   %eax,%eax
 a50:	75 e2                	jne    a34 <malloc+0x67>
 a52:	eb d5                	jmp    a29 <malloc+0x5c>
