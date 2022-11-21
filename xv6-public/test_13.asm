
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
  57:	83 3d 3c 0f 00 00 01 	cmpl   $0x1,0xf3c
  5e:	0f 84 db 00 00 00    	je     13f <worker+0x104>
  64:	6a 40                	push   $0x40
  66:	68 60 0a 00 00       	push   $0xa60
  6b:	68 6a 0a 00 00       	push   $0xa6a
  70:	6a 01                	push   $0x1
  72:	e8 3b 07 00 00       	call   7b2 <printf>
  77:	83 c4 0c             	add    $0xc,%esp
  7a:	68 a9 0a 00 00       	push   $0xaa9
  7f:	68 7d 0a 00 00       	push   $0xa7d
  84:	6a 01                	push   $0x1
  86:	e8 27 07 00 00       	call   7b2 <printf>
  8b:	83 c4 08             	add    $0x8,%esp
  8e:	68 91 0a 00 00       	push   $0xa91
  93:	6a 01                	push   $0x1
  95:	e8 18 07 00 00       	call   7b2 <printf>
  9a:	83 c4 04             	add    $0x4,%esp
  9d:	ff 35 40 0f 00 00    	push   0xf40
  a3:	e8 e5 05 00 00       	call   68d <kill>
  a8:	e8 b0 05 00 00       	call   65d <exit>
   assert(tmp1 == 11);
  ad:	6a 3e                	push   $0x3e
  af:	68 60 0a 00 00       	push   $0xa60
  b4:	68 6a 0a 00 00       	push   $0xa6a
  b9:	6a 01                	push   $0x1
  bb:	e8 f2 06 00 00       	call   7b2 <printf>
  c0:	83 c4 0c             	add    $0xc,%esp
  c3:	68 72 0a 00 00       	push   $0xa72
  c8:	68 7d 0a 00 00       	push   $0xa7d
  cd:	6a 01                	push   $0x1
  cf:	e8 de 06 00 00       	call   7b2 <printf>
  d4:	83 c4 08             	add    $0x8,%esp
  d7:	68 91 0a 00 00       	push   $0xa91
  dc:	6a 01                	push   $0x1
  de:	e8 cf 06 00 00       	call   7b2 <printf>
  e3:	83 c4 04             	add    $0x4,%esp
  e6:	ff 35 40 0f 00 00    	push   0xf40
  ec:	e8 9c 05 00 00       	call   68d <kill>
  f1:	e8 67 05 00 00       	call   65d <exit>
   assert(tmp2 == 22);
  f6:	6a 3f                	push   $0x3f
  f8:	68 60 0a 00 00       	push   $0xa60
  fd:	68 6a 0a 00 00       	push   $0xa6a
 102:	6a 01                	push   $0x1
 104:	e8 a9 06 00 00       	call   7b2 <printf>
 109:	83 c4 0c             	add    $0xc,%esp
 10c:	68 9e 0a 00 00       	push   $0xa9e
 111:	68 7d 0a 00 00       	push   $0xa7d
 116:	6a 01                	push   $0x1
 118:	e8 95 06 00 00       	call   7b2 <printf>
 11d:	83 c4 08             	add    $0x8,%esp
 120:	68 91 0a 00 00       	push   $0xa91
 125:	6a 01                	push   $0x1
 127:	e8 86 06 00 00       	call   7b2 <printf>
 12c:	83 c4 04             	add    $0x4,%esp
 12f:	ff 35 40 0f 00 00    	push   0xf40
 135:	e8 53 05 00 00       	call   68d <kill>
 13a:	e8 1e 05 00 00       	call   65d <exit>
   assert(fib(2) == 1);
 13f:	83 ec 0c             	sub    $0xc,%esp
 142:	6a 02                	push   $0x2
 144:	e8 b7 fe ff ff       	call   0 <fib>
 149:	83 c4 10             	add    $0x10,%esp
 14c:	83 f8 01             	cmp    $0x1,%eax
 14f:	74 49                	je     19a <worker+0x15f>
 151:	6a 41                	push   $0x41
 153:	68 60 0a 00 00       	push   $0xa60
 158:	68 6a 0a 00 00       	push   $0xa6a
 15d:	6a 01                	push   $0x1
 15f:	e8 4e 06 00 00       	call   7b2 <printf>
 164:	83 c4 0c             	add    $0xc,%esp
 167:	68 b5 0a 00 00       	push   $0xab5
 16c:	68 7d 0a 00 00       	push   $0xa7d
 171:	6a 01                	push   $0x1
 173:	e8 3a 06 00 00       	call   7b2 <printf>
 178:	83 c4 08             	add    $0x8,%esp
 17b:	68 91 0a 00 00       	push   $0xa91
 180:	6a 01                	push   $0x1
 182:	e8 2b 06 00 00       	call   7b2 <printf>
 187:	83 c4 04             	add    $0x4,%esp
 18a:	ff 35 40 0f 00 00    	push   0xf40
 190:	e8 f8 04 00 00       	call   68d <kill>
 195:	e8 c3 04 00 00       	call   65d <exit>
   assert(fib(3) == 2);
 19a:	83 ec 0c             	sub    $0xc,%esp
 19d:	6a 03                	push   $0x3
 19f:	e8 5c fe ff ff       	call   0 <fib>
 1a4:	83 c4 10             	add    $0x10,%esp
 1a7:	83 f8 02             	cmp    $0x2,%eax
 1aa:	74 49                	je     1f5 <worker+0x1ba>
 1ac:	6a 42                	push   $0x42
 1ae:	68 60 0a 00 00       	push   $0xa60
 1b3:	68 6a 0a 00 00       	push   $0xa6a
 1b8:	6a 01                	push   $0x1
 1ba:	e8 f3 05 00 00       	call   7b2 <printf>
 1bf:	83 c4 0c             	add    $0xc,%esp
 1c2:	68 c1 0a 00 00       	push   $0xac1
 1c7:	68 7d 0a 00 00       	push   $0xa7d
 1cc:	6a 01                	push   $0x1
 1ce:	e8 df 05 00 00       	call   7b2 <printf>
 1d3:	83 c4 08             	add    $0x8,%esp
 1d6:	68 91 0a 00 00       	push   $0xa91
 1db:	6a 01                	push   $0x1
 1dd:	e8 d0 05 00 00       	call   7b2 <printf>
 1e2:	83 c4 04             	add    $0x4,%esp
 1e5:	ff 35 40 0f 00 00    	push   0xf40
 1eb:	e8 9d 04 00 00       	call   68d <kill>
 1f0:	e8 68 04 00 00       	call   65d <exit>
   assert(fib(9) == 34);
 1f5:	83 ec 0c             	sub    $0xc,%esp
 1f8:	6a 09                	push   $0x9
 1fa:	e8 01 fe ff ff       	call   0 <fib>
 1ff:	83 c4 10             	add    $0x10,%esp
 202:	83 f8 22             	cmp    $0x22,%eax
 205:	74 49                	je     250 <worker+0x215>
 207:	6a 43                	push   $0x43
 209:	68 60 0a 00 00       	push   $0xa60
 20e:	68 6a 0a 00 00       	push   $0xa6a
 213:	6a 01                	push   $0x1
 215:	e8 98 05 00 00       	call   7b2 <printf>
 21a:	83 c4 0c             	add    $0xc,%esp
 21d:	68 cd 0a 00 00       	push   $0xacd
 222:	68 7d 0a 00 00       	push   $0xa7d
 227:	6a 01                	push   $0x1
 229:	e8 84 05 00 00       	call   7b2 <printf>
 22e:	83 c4 08             	add    $0x8,%esp
 231:	68 91 0a 00 00       	push   $0xa91
 236:	6a 01                	push   $0x1
 238:	e8 75 05 00 00       	call   7b2 <printf>
 23d:	83 c4 04             	add    $0x4,%esp
 240:	ff 35 40 0f 00 00    	push   0xf40
 246:	e8 42 04 00 00       	call   68d <kill>
 24b:	e8 0d 04 00 00       	call   65d <exit>
   assert(fib(15) == 610);
 250:	83 ec 0c             	sub    $0xc,%esp
 253:	6a 0f                	push   $0xf
 255:	e8 a6 fd ff ff       	call   0 <fib>
 25a:	83 c4 10             	add    $0x10,%esp
 25d:	3d 62 02 00 00       	cmp    $0x262,%eax
 262:	74 49                	je     2ad <worker+0x272>
 264:	6a 44                	push   $0x44
 266:	68 60 0a 00 00       	push   $0xa60
 26b:	68 6a 0a 00 00       	push   $0xa6a
 270:	6a 01                	push   $0x1
 272:	e8 3b 05 00 00       	call   7b2 <printf>
 277:	83 c4 0c             	add    $0xc,%esp
 27a:	68 da 0a 00 00       	push   $0xada
 27f:	68 7d 0a 00 00       	push   $0xa7d
 284:	6a 01                	push   $0x1
 286:	e8 27 05 00 00       	call   7b2 <printf>
 28b:	83 c4 08             	add    $0x8,%esp
 28e:	68 91 0a 00 00       	push   $0xa91
 293:	6a 01                	push   $0x1
 295:	e8 18 05 00 00       	call   7b2 <printf>
 29a:	83 c4 04             	add    $0x4,%esp
 29d:	ff 35 40 0f 00 00    	push   0xf40
 2a3:	e8 e5 03 00 00       	call   68d <kill>
 2a8:	e8 b0 03 00 00       	call   65d <exit>
   exit();
 2ad:	e8 ab 03 00 00       	call   65d <exit>

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
 2c4:	e8 14 04 00 00       	call   6dd <getpid>
 2c9:	a3 40 0f 00 00       	mov    %eax,0xf40
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
 2f5:	39 1d 38 0f 00 00    	cmp    %ebx,0xf38
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
 324:	68 60 0a 00 00       	push   $0xa60
 329:	68 6a 0a 00 00       	push   $0xa6a
 32e:	6a 01                	push   $0x1
 330:	e8 7d 04 00 00       	call   7b2 <printf>
 335:	83 c4 0c             	add    $0xc,%esp
 338:	68 e9 0a 00 00       	push   $0xae9
 33d:	68 7d 0a 00 00       	push   $0xa7d
 342:	6a 01                	push   $0x1
 344:	e8 69 04 00 00       	call   7b2 <printf>
 349:	83 c4 08             	add    $0x8,%esp
 34c:	68 91 0a 00 00       	push   $0xa91
 351:	6a 01                	push   $0x1
 353:	e8 5a 04 00 00       	call   7b2 <printf>
 358:	83 c4 04             	add    $0x4,%esp
 35b:	ff 35 40 0f 00 00    	push   0xf40
 361:	e8 27 03 00 00       	call   68d <kill>
 366:	e8 f2 02 00 00       	call   65d <exit>
      assert(thread_pid > 0);
 36b:	6a 2e                	push   $0x2e
 36d:	68 60 0a 00 00       	push   $0xa60
 372:	68 6a 0a 00 00       	push   $0xa6a
 377:	6a 01                	push   $0x1
 379:	e8 34 04 00 00       	call   7b2 <printf>
 37e:	83 c4 0c             	add    $0xc,%esp
 381:	68 fb 0a 00 00       	push   $0xafb
 386:	68 7d 0a 00 00       	push   $0xa7d
 38b:	6a 01                	push   $0x1
 38d:	e8 20 04 00 00       	call   7b2 <printf>
 392:	83 c4 08             	add    $0x8,%esp
 395:	68 91 0a 00 00       	push   $0xa91
 39a:	6a 01                	push   $0x1
 39c:	e8 11 04 00 00       	call   7b2 <printf>
 3a1:	83 c4 04             	add    $0x4,%esp
 3a4:	ff 35 40 0f 00 00    	push   0xf40
 3aa:	e8 de 02 00 00       	call   68d <kill>
 3af:	e8 a9 02 00 00       	call   65d <exit>
   for (int i = 0; i < num_threads; i++) {
 3b4:	bb 00 00 00 00       	mov    $0x0,%ebx
 3b9:	39 1d 38 0f 00 00    	cmp    %ebx,0xf38
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
 3d1:	68 60 0a 00 00       	push   $0xa60
 3d6:	68 6a 0a 00 00       	push   $0xa6a
 3db:	6a 01                	push   $0x1
 3dd:	e8 d0 03 00 00       	call   7b2 <printf>
 3e2:	83 c4 0c             	add    $0xc,%esp
 3e5:	68 0a 0b 00 00       	push   $0xb0a
 3ea:	68 7d 0a 00 00       	push   $0xa7d
 3ef:	6a 01                	push   $0x1
 3f1:	e8 bc 03 00 00       	call   7b2 <printf>
 3f6:	83 c4 08             	add    $0x8,%esp
 3f9:	68 91 0a 00 00       	push   $0xa91
 3fe:	6a 01                	push   $0x1
 400:	e8 ad 03 00 00       	call   7b2 <printf>
 405:	83 c4 04             	add    $0x4,%esp
 408:	ff 35 40 0f 00 00    	push   0xf40
 40e:	e8 7a 02 00 00       	call   68d <kill>
 413:	e8 45 02 00 00       	call   65d <exit>
   printf(1, "TEST PASSED\n");
 418:	83 ec 08             	sub    $0x8,%esp
 41b:	68 17 0b 00 00       	push   $0xb17
 420:	6a 01                	push   $0x1
 422:	e8 8b 03 00 00       	call   7b2 <printf>
   exit();
 427:	e8 31 02 00 00       	call   65d <exit>

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
  void *n_stack = malloc(PGSIZE*2);
 443:	68 00 20 00 00       	push   $0x2000
 448:	e8 8b 05 00 00       	call   9d8 <malloc>
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
 45e:	e8 9a 02 00 00       	call   6fd <clone>


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
 46f:	55                   	push   %ebp
 470:	89 e5                	mov    %esp,%ebp
 472:	83 ec 24             	sub    $0x24,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 475:	8d 45 f4             	lea    -0xc(%ebp),%eax
 478:	50                   	push   %eax
 479:	e8 87 02 00 00       	call   705 <join>
  
  return pid;
}
 47e:	c9                   	leave  
 47f:	c3                   	ret    

00000480 <lock_acquire>:

void lock_acquire(lock_t *lock){
 480:	55                   	push   %ebp
 481:	89 e5                	mov    %esp,%ebp
 483:	53                   	push   %ebx
 484:	83 ec 04             	sub    $0x4,%esp
 487:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 48a:	83 ec 08             	sub    $0x8,%esp
 48d:	6a 01                	push   $0x1
 48f:	53                   	push   %ebx
 490:	e8 97 ff ff ff       	call   42c <test_and_set>
 495:	83 c4 10             	add    $0x10,%esp
 498:	83 f8 01             	cmp    $0x1,%eax
 49b:	74 ed                	je     48a <lock_acquire+0xa>
    ;
}
 49d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4a0:	c9                   	leave  
 4a1:	c3                   	ret    

000004a2 <lock_release>:

void lock_release(lock_t *lock) {
 4a2:	55                   	push   %ebp
 4a3:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 4a5:	8b 45 08             	mov    0x8(%ebp),%eax
 4a8:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 4ae:	5d                   	pop    %ebp
 4af:	c3                   	ret    

000004b0 <lock_init>:

void lock_init(lock_t *lock) {
 4b0:	55                   	push   %ebp
 4b1:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 4b3:	8b 45 08             	mov    0x8(%ebp),%eax
 4b6:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 4bc:	5d                   	pop    %ebp
 4bd:	c3                   	ret    

000004be <strcpy>:

char*
strcpy(char *s, const char *t)
{
 4be:	55                   	push   %ebp
 4bf:	89 e5                	mov    %esp,%ebp
 4c1:	56                   	push   %esi
 4c2:	53                   	push   %ebx
 4c3:	8b 75 08             	mov    0x8(%ebp),%esi
 4c6:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 4c9:	89 f0                	mov    %esi,%eax
 4cb:	89 d1                	mov    %edx,%ecx
 4cd:	83 c2 01             	add    $0x1,%edx
 4d0:	89 c3                	mov    %eax,%ebx
 4d2:	83 c0 01             	add    $0x1,%eax
 4d5:	0f b6 09             	movzbl (%ecx),%ecx
 4d8:	88 0b                	mov    %cl,(%ebx)
 4da:	84 c9                	test   %cl,%cl
 4dc:	75 ed                	jne    4cb <strcpy+0xd>
    ;
  return os;
}
 4de:	89 f0                	mov    %esi,%eax
 4e0:	5b                   	pop    %ebx
 4e1:	5e                   	pop    %esi
 4e2:	5d                   	pop    %ebp
 4e3:	c3                   	ret    

000004e4 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 4e4:	55                   	push   %ebp
 4e5:	89 e5                	mov    %esp,%ebp
 4e7:	8b 4d 08             	mov    0x8(%ebp),%ecx
 4ea:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 4ed:	eb 06                	jmp    4f5 <strcmp+0x11>
    p++, q++;
 4ef:	83 c1 01             	add    $0x1,%ecx
 4f2:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 4f5:	0f b6 01             	movzbl (%ecx),%eax
 4f8:	84 c0                	test   %al,%al
 4fa:	74 04                	je     500 <strcmp+0x1c>
 4fc:	3a 02                	cmp    (%edx),%al
 4fe:	74 ef                	je     4ef <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 500:	0f b6 c0             	movzbl %al,%eax
 503:	0f b6 12             	movzbl (%edx),%edx
 506:	29 d0                	sub    %edx,%eax
}
 508:	5d                   	pop    %ebp
 509:	c3                   	ret    

0000050a <strlen>:

uint
strlen(const char *s)
{
 50a:	55                   	push   %ebp
 50b:	89 e5                	mov    %esp,%ebp
 50d:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 510:	b8 00 00 00 00       	mov    $0x0,%eax
 515:	eb 03                	jmp    51a <strlen+0x10>
 517:	83 c0 01             	add    $0x1,%eax
 51a:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 51e:	75 f7                	jne    517 <strlen+0xd>
    ;
  return n;
}
 520:	5d                   	pop    %ebp
 521:	c3                   	ret    

00000522 <memset>:

void*
memset(void *dst, int c, uint n)
{
 522:	55                   	push   %ebp
 523:	89 e5                	mov    %esp,%ebp
 525:	57                   	push   %edi
 526:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 529:	89 d7                	mov    %edx,%edi
 52b:	8b 4d 10             	mov    0x10(%ebp),%ecx
 52e:	8b 45 0c             	mov    0xc(%ebp),%eax
 531:	fc                   	cld    
 532:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 534:	89 d0                	mov    %edx,%eax
 536:	8b 7d fc             	mov    -0x4(%ebp),%edi
 539:	c9                   	leave  
 53a:	c3                   	ret    

0000053b <strchr>:

char*
strchr(const char *s, char c)
{
 53b:	55                   	push   %ebp
 53c:	89 e5                	mov    %esp,%ebp
 53e:	8b 45 08             	mov    0x8(%ebp),%eax
 541:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 545:	eb 03                	jmp    54a <strchr+0xf>
 547:	83 c0 01             	add    $0x1,%eax
 54a:	0f b6 10             	movzbl (%eax),%edx
 54d:	84 d2                	test   %dl,%dl
 54f:	74 06                	je     557 <strchr+0x1c>
    if(*s == c)
 551:	38 ca                	cmp    %cl,%dl
 553:	75 f2                	jne    547 <strchr+0xc>
 555:	eb 05                	jmp    55c <strchr+0x21>
      return (char*)s;
  return 0;
 557:	b8 00 00 00 00       	mov    $0x0,%eax
}
 55c:	5d                   	pop    %ebp
 55d:	c3                   	ret    

0000055e <gets>:

char*
gets(char *buf, int max)
{
 55e:	55                   	push   %ebp
 55f:	89 e5                	mov    %esp,%ebp
 561:	57                   	push   %edi
 562:	56                   	push   %esi
 563:	53                   	push   %ebx
 564:	83 ec 1c             	sub    $0x1c,%esp
 567:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 56a:	bb 00 00 00 00       	mov    $0x0,%ebx
 56f:	89 de                	mov    %ebx,%esi
 571:	83 c3 01             	add    $0x1,%ebx
 574:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 577:	7d 2e                	jge    5a7 <gets+0x49>
    cc = read(0, &c, 1);
 579:	83 ec 04             	sub    $0x4,%esp
 57c:	6a 01                	push   $0x1
 57e:	8d 45 e7             	lea    -0x19(%ebp),%eax
 581:	50                   	push   %eax
 582:	6a 00                	push   $0x0
 584:	e8 ec 00 00 00       	call   675 <read>
    if(cc < 1)
 589:	83 c4 10             	add    $0x10,%esp
 58c:	85 c0                	test   %eax,%eax
 58e:	7e 17                	jle    5a7 <gets+0x49>
      break;
    buf[i++] = c;
 590:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 594:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 597:	3c 0a                	cmp    $0xa,%al
 599:	0f 94 c2             	sete   %dl
 59c:	3c 0d                	cmp    $0xd,%al
 59e:	0f 94 c0             	sete   %al
 5a1:	08 c2                	or     %al,%dl
 5a3:	74 ca                	je     56f <gets+0x11>
    buf[i++] = c;
 5a5:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 5a7:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 5ab:	89 f8                	mov    %edi,%eax
 5ad:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5b0:	5b                   	pop    %ebx
 5b1:	5e                   	pop    %esi
 5b2:	5f                   	pop    %edi
 5b3:	5d                   	pop    %ebp
 5b4:	c3                   	ret    

000005b5 <stat>:

int
stat(const char *n, struct stat *st)
{
 5b5:	55                   	push   %ebp
 5b6:	89 e5                	mov    %esp,%ebp
 5b8:	56                   	push   %esi
 5b9:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 5ba:	83 ec 08             	sub    $0x8,%esp
 5bd:	6a 00                	push   $0x0
 5bf:	ff 75 08             	push   0x8(%ebp)
 5c2:	e8 d6 00 00 00       	call   69d <open>
  if(fd < 0)
 5c7:	83 c4 10             	add    $0x10,%esp
 5ca:	85 c0                	test   %eax,%eax
 5cc:	78 24                	js     5f2 <stat+0x3d>
 5ce:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 5d0:	83 ec 08             	sub    $0x8,%esp
 5d3:	ff 75 0c             	push   0xc(%ebp)
 5d6:	50                   	push   %eax
 5d7:	e8 d9 00 00 00       	call   6b5 <fstat>
 5dc:	89 c6                	mov    %eax,%esi
  close(fd);
 5de:	89 1c 24             	mov    %ebx,(%esp)
 5e1:	e8 9f 00 00 00       	call   685 <close>
  return r;
 5e6:	83 c4 10             	add    $0x10,%esp
}
 5e9:	89 f0                	mov    %esi,%eax
 5eb:	8d 65 f8             	lea    -0x8(%ebp),%esp
 5ee:	5b                   	pop    %ebx
 5ef:	5e                   	pop    %esi
 5f0:	5d                   	pop    %ebp
 5f1:	c3                   	ret    
    return -1;
 5f2:	be ff ff ff ff       	mov    $0xffffffff,%esi
 5f7:	eb f0                	jmp    5e9 <stat+0x34>

000005f9 <atoi>:

int
atoi(const char *s)
{
 5f9:	55                   	push   %ebp
 5fa:	89 e5                	mov    %esp,%ebp
 5fc:	53                   	push   %ebx
 5fd:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 600:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 605:	eb 10                	jmp    617 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 607:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 60a:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 60d:	83 c1 01             	add    $0x1,%ecx
 610:	0f be c0             	movsbl %al,%eax
 613:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 617:	0f b6 01             	movzbl (%ecx),%eax
 61a:	8d 58 d0             	lea    -0x30(%eax),%ebx
 61d:	80 fb 09             	cmp    $0x9,%bl
 620:	76 e5                	jbe    607 <atoi+0xe>
  return n;
}
 622:	89 d0                	mov    %edx,%eax
 624:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 627:	c9                   	leave  
 628:	c3                   	ret    

00000629 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 629:	55                   	push   %ebp
 62a:	89 e5                	mov    %esp,%ebp
 62c:	56                   	push   %esi
 62d:	53                   	push   %ebx
 62e:	8b 75 08             	mov    0x8(%ebp),%esi
 631:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 634:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 637:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 639:	eb 0d                	jmp    648 <memmove+0x1f>
    *dst++ = *src++;
 63b:	0f b6 01             	movzbl (%ecx),%eax
 63e:	88 02                	mov    %al,(%edx)
 640:	8d 49 01             	lea    0x1(%ecx),%ecx
 643:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 646:	89 d8                	mov    %ebx,%eax
 648:	8d 58 ff             	lea    -0x1(%eax),%ebx
 64b:	85 c0                	test   %eax,%eax
 64d:	7f ec                	jg     63b <memmove+0x12>
  return vdst;
}
 64f:	89 f0                	mov    %esi,%eax
 651:	5b                   	pop    %ebx
 652:	5e                   	pop    %esi
 653:	5d                   	pop    %ebp
 654:	c3                   	ret    

00000655 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 655:	b8 01 00 00 00       	mov    $0x1,%eax
 65a:	cd 40                	int    $0x40
 65c:	c3                   	ret    

0000065d <exit>:
SYSCALL(exit)
 65d:	b8 02 00 00 00       	mov    $0x2,%eax
 662:	cd 40                	int    $0x40
 664:	c3                   	ret    

00000665 <wait>:
SYSCALL(wait)
 665:	b8 03 00 00 00       	mov    $0x3,%eax
 66a:	cd 40                	int    $0x40
 66c:	c3                   	ret    

0000066d <pipe>:
SYSCALL(pipe)
 66d:	b8 04 00 00 00       	mov    $0x4,%eax
 672:	cd 40                	int    $0x40
 674:	c3                   	ret    

00000675 <read>:
SYSCALL(read)
 675:	b8 05 00 00 00       	mov    $0x5,%eax
 67a:	cd 40                	int    $0x40
 67c:	c3                   	ret    

0000067d <write>:
SYSCALL(write)
 67d:	b8 10 00 00 00       	mov    $0x10,%eax
 682:	cd 40                	int    $0x40
 684:	c3                   	ret    

00000685 <close>:
SYSCALL(close)
 685:	b8 15 00 00 00       	mov    $0x15,%eax
 68a:	cd 40                	int    $0x40
 68c:	c3                   	ret    

0000068d <kill>:
SYSCALL(kill)
 68d:	b8 06 00 00 00       	mov    $0x6,%eax
 692:	cd 40                	int    $0x40
 694:	c3                   	ret    

00000695 <exec>:
SYSCALL(exec)
 695:	b8 07 00 00 00       	mov    $0x7,%eax
 69a:	cd 40                	int    $0x40
 69c:	c3                   	ret    

0000069d <open>:
SYSCALL(open)
 69d:	b8 0f 00 00 00       	mov    $0xf,%eax
 6a2:	cd 40                	int    $0x40
 6a4:	c3                   	ret    

000006a5 <mknod>:
SYSCALL(mknod)
 6a5:	b8 11 00 00 00       	mov    $0x11,%eax
 6aa:	cd 40                	int    $0x40
 6ac:	c3                   	ret    

000006ad <unlink>:
SYSCALL(unlink)
 6ad:	b8 12 00 00 00       	mov    $0x12,%eax
 6b2:	cd 40                	int    $0x40
 6b4:	c3                   	ret    

000006b5 <fstat>:
SYSCALL(fstat)
 6b5:	b8 08 00 00 00       	mov    $0x8,%eax
 6ba:	cd 40                	int    $0x40
 6bc:	c3                   	ret    

000006bd <link>:
SYSCALL(link)
 6bd:	b8 13 00 00 00       	mov    $0x13,%eax
 6c2:	cd 40                	int    $0x40
 6c4:	c3                   	ret    

000006c5 <mkdir>:
SYSCALL(mkdir)
 6c5:	b8 14 00 00 00       	mov    $0x14,%eax
 6ca:	cd 40                	int    $0x40
 6cc:	c3                   	ret    

000006cd <chdir>:
SYSCALL(chdir)
 6cd:	b8 09 00 00 00       	mov    $0x9,%eax
 6d2:	cd 40                	int    $0x40
 6d4:	c3                   	ret    

000006d5 <dup>:
SYSCALL(dup)
 6d5:	b8 0a 00 00 00       	mov    $0xa,%eax
 6da:	cd 40                	int    $0x40
 6dc:	c3                   	ret    

000006dd <getpid>:
SYSCALL(getpid)
 6dd:	b8 0b 00 00 00       	mov    $0xb,%eax
 6e2:	cd 40                	int    $0x40
 6e4:	c3                   	ret    

000006e5 <sbrk>:
SYSCALL(sbrk)
 6e5:	b8 0c 00 00 00       	mov    $0xc,%eax
 6ea:	cd 40                	int    $0x40
 6ec:	c3                   	ret    

000006ed <sleep>:
SYSCALL(sleep)
 6ed:	b8 0d 00 00 00       	mov    $0xd,%eax
 6f2:	cd 40                	int    $0x40
 6f4:	c3                   	ret    

000006f5 <uptime>:
SYSCALL(uptime)
 6f5:	b8 0e 00 00 00       	mov    $0xe,%eax
 6fa:	cd 40                	int    $0x40
 6fc:	c3                   	ret    

000006fd <clone>:
SYSCALL(clone)
 6fd:	b8 16 00 00 00       	mov    $0x16,%eax
 702:	cd 40                	int    $0x40
 704:	c3                   	ret    

00000705 <join>:
 705:	b8 17 00 00 00       	mov    $0x17,%eax
 70a:	cd 40                	int    $0x40
 70c:	c3                   	ret    

0000070d <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 70d:	55                   	push   %ebp
 70e:	89 e5                	mov    %esp,%ebp
 710:	83 ec 1c             	sub    $0x1c,%esp
 713:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 716:	6a 01                	push   $0x1
 718:	8d 55 f4             	lea    -0xc(%ebp),%edx
 71b:	52                   	push   %edx
 71c:	50                   	push   %eax
 71d:	e8 5b ff ff ff       	call   67d <write>
}
 722:	83 c4 10             	add    $0x10,%esp
 725:	c9                   	leave  
 726:	c3                   	ret    

00000727 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 727:	55                   	push   %ebp
 728:	89 e5                	mov    %esp,%ebp
 72a:	57                   	push   %edi
 72b:	56                   	push   %esi
 72c:	53                   	push   %ebx
 72d:	83 ec 2c             	sub    $0x2c,%esp
 730:	89 45 d0             	mov    %eax,-0x30(%ebp)
 733:	89 d0                	mov    %edx,%eax
 735:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 737:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 73b:	0f 95 c1             	setne  %cl
 73e:	c1 ea 1f             	shr    $0x1f,%edx
 741:	84 d1                	test   %dl,%cl
 743:	74 44                	je     789 <printint+0x62>
    neg = 1;
    x = -xx;
 745:	f7 d8                	neg    %eax
 747:	89 c1                	mov    %eax,%ecx
    neg = 1;
 749:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 750:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 755:	89 c8                	mov    %ecx,%eax
 757:	ba 00 00 00 00       	mov    $0x0,%edx
 75c:	f7 f6                	div    %esi
 75e:	89 df                	mov    %ebx,%edi
 760:	83 c3 01             	add    $0x1,%ebx
 763:	0f b6 92 84 0b 00 00 	movzbl 0xb84(%edx),%edx
 76a:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 76e:	89 ca                	mov    %ecx,%edx
 770:	89 c1                	mov    %eax,%ecx
 772:	39 d6                	cmp    %edx,%esi
 774:	76 df                	jbe    755 <printint+0x2e>
  if(neg)
 776:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 77a:	74 31                	je     7ad <printint+0x86>
    buf[i++] = '-';
 77c:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 781:	8d 5f 02             	lea    0x2(%edi),%ebx
 784:	8b 75 d0             	mov    -0x30(%ebp),%esi
 787:	eb 17                	jmp    7a0 <printint+0x79>
    x = xx;
 789:	89 c1                	mov    %eax,%ecx
  neg = 0;
 78b:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 792:	eb bc                	jmp    750 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 794:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 799:	89 f0                	mov    %esi,%eax
 79b:	e8 6d ff ff ff       	call   70d <putc>
  while(--i >= 0)
 7a0:	83 eb 01             	sub    $0x1,%ebx
 7a3:	79 ef                	jns    794 <printint+0x6d>
}
 7a5:	83 c4 2c             	add    $0x2c,%esp
 7a8:	5b                   	pop    %ebx
 7a9:	5e                   	pop    %esi
 7aa:	5f                   	pop    %edi
 7ab:	5d                   	pop    %ebp
 7ac:	c3                   	ret    
 7ad:	8b 75 d0             	mov    -0x30(%ebp),%esi
 7b0:	eb ee                	jmp    7a0 <printint+0x79>

000007b2 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 7b2:	55                   	push   %ebp
 7b3:	89 e5                	mov    %esp,%ebp
 7b5:	57                   	push   %edi
 7b6:	56                   	push   %esi
 7b7:	53                   	push   %ebx
 7b8:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 7bb:	8d 45 10             	lea    0x10(%ebp),%eax
 7be:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 7c1:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 7c6:	bb 00 00 00 00       	mov    $0x0,%ebx
 7cb:	eb 14                	jmp    7e1 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 7cd:	89 fa                	mov    %edi,%edx
 7cf:	8b 45 08             	mov    0x8(%ebp),%eax
 7d2:	e8 36 ff ff ff       	call   70d <putc>
 7d7:	eb 05                	jmp    7de <printf+0x2c>
      }
    } else if(state == '%'){
 7d9:	83 fe 25             	cmp    $0x25,%esi
 7dc:	74 25                	je     803 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 7de:	83 c3 01             	add    $0x1,%ebx
 7e1:	8b 45 0c             	mov    0xc(%ebp),%eax
 7e4:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 7e8:	84 c0                	test   %al,%al
 7ea:	0f 84 20 01 00 00    	je     910 <printf+0x15e>
    c = fmt[i] & 0xff;
 7f0:	0f be f8             	movsbl %al,%edi
 7f3:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 7f6:	85 f6                	test   %esi,%esi
 7f8:	75 df                	jne    7d9 <printf+0x27>
      if(c == '%'){
 7fa:	83 f8 25             	cmp    $0x25,%eax
 7fd:	75 ce                	jne    7cd <printf+0x1b>
        state = '%';
 7ff:	89 c6                	mov    %eax,%esi
 801:	eb db                	jmp    7de <printf+0x2c>
      if(c == 'd'){
 803:	83 f8 25             	cmp    $0x25,%eax
 806:	0f 84 cf 00 00 00    	je     8db <printf+0x129>
 80c:	0f 8c dd 00 00 00    	jl     8ef <printf+0x13d>
 812:	83 f8 78             	cmp    $0x78,%eax
 815:	0f 8f d4 00 00 00    	jg     8ef <printf+0x13d>
 81b:	83 f8 63             	cmp    $0x63,%eax
 81e:	0f 8c cb 00 00 00    	jl     8ef <printf+0x13d>
 824:	83 e8 63             	sub    $0x63,%eax
 827:	83 f8 15             	cmp    $0x15,%eax
 82a:	0f 87 bf 00 00 00    	ja     8ef <printf+0x13d>
 830:	ff 24 85 2c 0b 00 00 	jmp    *0xb2c(,%eax,4)
        printint(fd, *ap, 10, 1);
 837:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 83a:	8b 17                	mov    (%edi),%edx
 83c:	83 ec 0c             	sub    $0xc,%esp
 83f:	6a 01                	push   $0x1
 841:	b9 0a 00 00 00       	mov    $0xa,%ecx
 846:	8b 45 08             	mov    0x8(%ebp),%eax
 849:	e8 d9 fe ff ff       	call   727 <printint>
        ap++;
 84e:	83 c7 04             	add    $0x4,%edi
 851:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 854:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 857:	be 00 00 00 00       	mov    $0x0,%esi
 85c:	eb 80                	jmp    7de <printf+0x2c>
        printint(fd, *ap, 16, 0);
 85e:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 861:	8b 17                	mov    (%edi),%edx
 863:	83 ec 0c             	sub    $0xc,%esp
 866:	6a 00                	push   $0x0
 868:	b9 10 00 00 00       	mov    $0x10,%ecx
 86d:	8b 45 08             	mov    0x8(%ebp),%eax
 870:	e8 b2 fe ff ff       	call   727 <printint>
        ap++;
 875:	83 c7 04             	add    $0x4,%edi
 878:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 87b:	83 c4 10             	add    $0x10,%esp
      state = 0;
 87e:	be 00 00 00 00       	mov    $0x0,%esi
 883:	e9 56 ff ff ff       	jmp    7de <printf+0x2c>
        s = (char*)*ap;
 888:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 88b:	8b 30                	mov    (%eax),%esi
        ap++;
 88d:	83 c0 04             	add    $0x4,%eax
 890:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 893:	85 f6                	test   %esi,%esi
 895:	75 15                	jne    8ac <printf+0xfa>
          s = "(null)";
 897:	be 24 0b 00 00       	mov    $0xb24,%esi
 89c:	eb 0e                	jmp    8ac <printf+0xfa>
          putc(fd, *s);
 89e:	0f be d2             	movsbl %dl,%edx
 8a1:	8b 45 08             	mov    0x8(%ebp),%eax
 8a4:	e8 64 fe ff ff       	call   70d <putc>
          s++;
 8a9:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 8ac:	0f b6 16             	movzbl (%esi),%edx
 8af:	84 d2                	test   %dl,%dl
 8b1:	75 eb                	jne    89e <printf+0xec>
      state = 0;
 8b3:	be 00 00 00 00       	mov    $0x0,%esi
 8b8:	e9 21 ff ff ff       	jmp    7de <printf+0x2c>
        putc(fd, *ap);
 8bd:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 8c0:	0f be 17             	movsbl (%edi),%edx
 8c3:	8b 45 08             	mov    0x8(%ebp),%eax
 8c6:	e8 42 fe ff ff       	call   70d <putc>
        ap++;
 8cb:	83 c7 04             	add    $0x4,%edi
 8ce:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 8d1:	be 00 00 00 00       	mov    $0x0,%esi
 8d6:	e9 03 ff ff ff       	jmp    7de <printf+0x2c>
        putc(fd, c);
 8db:	89 fa                	mov    %edi,%edx
 8dd:	8b 45 08             	mov    0x8(%ebp),%eax
 8e0:	e8 28 fe ff ff       	call   70d <putc>
      state = 0;
 8e5:	be 00 00 00 00       	mov    $0x0,%esi
 8ea:	e9 ef fe ff ff       	jmp    7de <printf+0x2c>
        putc(fd, '%');
 8ef:	ba 25 00 00 00       	mov    $0x25,%edx
 8f4:	8b 45 08             	mov    0x8(%ebp),%eax
 8f7:	e8 11 fe ff ff       	call   70d <putc>
        putc(fd, c);
 8fc:	89 fa                	mov    %edi,%edx
 8fe:	8b 45 08             	mov    0x8(%ebp),%eax
 901:	e8 07 fe ff ff       	call   70d <putc>
      state = 0;
 906:	be 00 00 00 00       	mov    $0x0,%esi
 90b:	e9 ce fe ff ff       	jmp    7de <printf+0x2c>
    }
  }
}
 910:	8d 65 f4             	lea    -0xc(%ebp),%esp
 913:	5b                   	pop    %ebx
 914:	5e                   	pop    %esi
 915:	5f                   	pop    %edi
 916:	5d                   	pop    %ebp
 917:	c3                   	ret    

00000918 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 918:	55                   	push   %ebp
 919:	89 e5                	mov    %esp,%ebp
 91b:	57                   	push   %edi
 91c:	56                   	push   %esi
 91d:	53                   	push   %ebx
 91e:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 921:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 924:	a1 44 0f 00 00       	mov    0xf44,%eax
 929:	eb 02                	jmp    92d <free+0x15>
 92b:	89 d0                	mov    %edx,%eax
 92d:	39 c8                	cmp    %ecx,%eax
 92f:	73 04                	jae    935 <free+0x1d>
 931:	39 08                	cmp    %ecx,(%eax)
 933:	77 12                	ja     947 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 935:	8b 10                	mov    (%eax),%edx
 937:	39 c2                	cmp    %eax,%edx
 939:	77 f0                	ja     92b <free+0x13>
 93b:	39 c8                	cmp    %ecx,%eax
 93d:	72 08                	jb     947 <free+0x2f>
 93f:	39 ca                	cmp    %ecx,%edx
 941:	77 04                	ja     947 <free+0x2f>
 943:	89 d0                	mov    %edx,%eax
 945:	eb e6                	jmp    92d <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 947:	8b 73 fc             	mov    -0x4(%ebx),%esi
 94a:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 94d:	8b 10                	mov    (%eax),%edx
 94f:	39 d7                	cmp    %edx,%edi
 951:	74 19                	je     96c <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 953:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 956:	8b 50 04             	mov    0x4(%eax),%edx
 959:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 95c:	39 ce                	cmp    %ecx,%esi
 95e:	74 1b                	je     97b <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 960:	89 08                	mov    %ecx,(%eax)
  freep = p;
 962:	a3 44 0f 00 00       	mov    %eax,0xf44
}
 967:	5b                   	pop    %ebx
 968:	5e                   	pop    %esi
 969:	5f                   	pop    %edi
 96a:	5d                   	pop    %ebp
 96b:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 96c:	03 72 04             	add    0x4(%edx),%esi
 96f:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 972:	8b 10                	mov    (%eax),%edx
 974:	8b 12                	mov    (%edx),%edx
 976:	89 53 f8             	mov    %edx,-0x8(%ebx)
 979:	eb db                	jmp    956 <free+0x3e>
    p->s.size += bp->s.size;
 97b:	03 53 fc             	add    -0x4(%ebx),%edx
 97e:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 981:	8b 53 f8             	mov    -0x8(%ebx),%edx
 984:	89 10                	mov    %edx,(%eax)
 986:	eb da                	jmp    962 <free+0x4a>

00000988 <morecore>:

static Header*
morecore(uint nu)
{
 988:	55                   	push   %ebp
 989:	89 e5                	mov    %esp,%ebp
 98b:	53                   	push   %ebx
 98c:	83 ec 04             	sub    $0x4,%esp
 98f:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 991:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 996:	77 05                	ja     99d <morecore+0x15>
    nu = 4096;
 998:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 99d:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 9a4:	83 ec 0c             	sub    $0xc,%esp
 9a7:	50                   	push   %eax
 9a8:	e8 38 fd ff ff       	call   6e5 <sbrk>
  if(p == (char*)-1)
 9ad:	83 c4 10             	add    $0x10,%esp
 9b0:	83 f8 ff             	cmp    $0xffffffff,%eax
 9b3:	74 1c                	je     9d1 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 9b5:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 9b8:	83 c0 08             	add    $0x8,%eax
 9bb:	83 ec 0c             	sub    $0xc,%esp
 9be:	50                   	push   %eax
 9bf:	e8 54 ff ff ff       	call   918 <free>
  return freep;
 9c4:	a1 44 0f 00 00       	mov    0xf44,%eax
 9c9:	83 c4 10             	add    $0x10,%esp
}
 9cc:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 9cf:	c9                   	leave  
 9d0:	c3                   	ret    
    return 0;
 9d1:	b8 00 00 00 00       	mov    $0x0,%eax
 9d6:	eb f4                	jmp    9cc <morecore+0x44>

000009d8 <malloc>:

void*
malloc(uint nbytes)
{
 9d8:	55                   	push   %ebp
 9d9:	89 e5                	mov    %esp,%ebp
 9db:	53                   	push   %ebx
 9dc:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9df:	8b 45 08             	mov    0x8(%ebp),%eax
 9e2:	8d 58 07             	lea    0x7(%eax),%ebx
 9e5:	c1 eb 03             	shr    $0x3,%ebx
 9e8:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 9eb:	8b 0d 44 0f 00 00    	mov    0xf44,%ecx
 9f1:	85 c9                	test   %ecx,%ecx
 9f3:	74 04                	je     9f9 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9f5:	8b 01                	mov    (%ecx),%eax
 9f7:	eb 4a                	jmp    a43 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 9f9:	c7 05 44 0f 00 00 48 	movl   $0xf48,0xf44
 a00:	0f 00 00 
 a03:	c7 05 48 0f 00 00 48 	movl   $0xf48,0xf48
 a0a:	0f 00 00 
    base.s.size = 0;
 a0d:	c7 05 4c 0f 00 00 00 	movl   $0x0,0xf4c
 a14:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 a17:	b9 48 0f 00 00       	mov    $0xf48,%ecx
 a1c:	eb d7                	jmp    9f5 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 a1e:	74 19                	je     a39 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 a20:	29 da                	sub    %ebx,%edx
 a22:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 a25:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 a28:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 a2b:	89 0d 44 0f 00 00    	mov    %ecx,0xf44
      return (void*)(p + 1);
 a31:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 a34:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 a37:	c9                   	leave  
 a38:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 a39:	8b 10                	mov    (%eax),%edx
 a3b:	89 11                	mov    %edx,(%ecx)
 a3d:	eb ec                	jmp    a2b <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a3f:	89 c1                	mov    %eax,%ecx
 a41:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 a43:	8b 50 04             	mov    0x4(%eax),%edx
 a46:	39 da                	cmp    %ebx,%edx
 a48:	73 d4                	jae    a1e <malloc+0x46>
    if(p == freep)
 a4a:	39 05 44 0f 00 00    	cmp    %eax,0xf44
 a50:	75 ed                	jne    a3f <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 a52:	89 d8                	mov    %ebx,%eax
 a54:	e8 2f ff ff ff       	call   988 <morecore>
 a59:	85 c0                	test   %eax,%eax
 a5b:	75 e2                	jne    a3f <malloc+0x67>
 a5d:	eb d5                	jmp    a34 <malloc+0x5c>
