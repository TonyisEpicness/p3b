
_test_19:     file format elf32-i386


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
   assert(arg1_int == 42);
   b:	8b 45 08             	mov    0x8(%ebp),%eax
   e:	83 38 2a             	cmpl   $0x2a,(%eax)
  11:	75 1d                	jne    30 <nested_worker+0x30>
   assert(arg2_int == 24);
  13:	83 fa 18             	cmp    $0x18,%edx
  16:	75 61                	jne    79 <nested_worker+0x79>
   assert(global == 2);
  18:	a1 b8 0f 00 00       	mov    0xfb8,%eax
  1d:	83 f8 02             	cmp    $0x2,%eax
  20:	0f 85 9c 00 00 00    	jne    c2 <nested_worker+0xc2>
   global++;
  26:	83 c0 01             	add    $0x1,%eax
  29:	a3 b8 0f 00 00       	mov    %eax,0xfb8
   // no exit() in thread
}
  2e:	c9                   	leave  
  2f:	c3                   	ret    
   assert(arg1_int == 42);
  30:	6a 2b                	push   $0x2b
  32:	68 bc 0a 00 00       	push   $0xabc
  37:	68 c6 0a 00 00       	push   $0xac6
  3c:	6a 01                	push   $0x1
  3e:	e8 ca 07 00 00       	call   80d <printf>
  43:	83 c4 0c             	add    $0xc,%esp
  46:	68 ce 0a 00 00       	push   $0xace
  4b:	68 dd 0a 00 00       	push   $0xadd
  50:	6a 01                	push   $0x1
  52:	e8 b6 07 00 00       	call   80d <printf>
  57:	83 c4 08             	add    $0x8,%esp
  5a:	68 f1 0a 00 00       	push   $0xaf1
  5f:	6a 01                	push   $0x1
  61:	e8 a7 07 00 00       	call   80d <printf>
  66:	83 c4 04             	add    $0x4,%esp
  69:	ff 35 bc 0f 00 00    	push   0xfbc
  6f:	e8 74 06 00 00       	call   6e8 <kill>
  74:	e8 3f 06 00 00       	call   6b8 <exit>
   assert(arg2_int == 24);
  79:	6a 2c                	push   $0x2c
  7b:	68 bc 0a 00 00       	push   $0xabc
  80:	68 c6 0a 00 00       	push   $0xac6
  85:	6a 01                	push   $0x1
  87:	e8 81 07 00 00       	call   80d <printf>
  8c:	83 c4 0c             	add    $0xc,%esp
  8f:	68 fe 0a 00 00       	push   $0xafe
  94:	68 dd 0a 00 00       	push   $0xadd
  99:	6a 01                	push   $0x1
  9b:	e8 6d 07 00 00       	call   80d <printf>
  a0:	83 c4 08             	add    $0x8,%esp
  a3:	68 f1 0a 00 00       	push   $0xaf1
  a8:	6a 01                	push   $0x1
  aa:	e8 5e 07 00 00       	call   80d <printf>
  af:	83 c4 04             	add    $0x4,%esp
  b2:	ff 35 bc 0f 00 00    	push   0xfbc
  b8:	e8 2b 06 00 00       	call   6e8 <kill>
  bd:	e8 f6 05 00 00       	call   6b8 <exit>
   assert(global == 2);
  c2:	6a 2d                	push   $0x2d
  c4:	68 bc 0a 00 00       	push   $0xabc
  c9:	68 c6 0a 00 00       	push   $0xac6
  ce:	6a 01                	push   $0x1
  d0:	e8 38 07 00 00       	call   80d <printf>
  d5:	83 c4 0c             	add    $0xc,%esp
  d8:	68 0d 0b 00 00       	push   $0xb0d
  dd:	68 dd 0a 00 00       	push   $0xadd
  e2:	6a 01                	push   $0x1
  e4:	e8 24 07 00 00       	call   80d <printf>
  e9:	83 c4 08             	add    $0x8,%esp
  ec:	68 f1 0a 00 00       	push   $0xaf1
  f1:	6a 01                	push   $0x1
  f3:	e8 15 07 00 00       	call   80d <printf>
  f8:	83 c4 04             	add    $0x4,%esp
  fb:	ff 35 bc 0f 00 00    	push   0xfbc
 101:	e8 e2 05 00 00       	call   6e8 <kill>
 106:	e8 ad 05 00 00       	call   6b8 <exit>

0000010b <worker>:

void
worker(void *arg1, void *arg2) {
 10b:	55                   	push   %ebp
 10c:	89 e5                	mov    %esp,%ebp
 10e:	53                   	push   %ebx
 10f:	83 ec 14             	sub    $0x14,%esp
   int tmp1 = *(int*)arg1;
 112:	8b 45 08             	mov    0x8(%ebp),%eax
 115:	8b 00                	mov    (%eax),%eax
 117:	89 45 f4             	mov    %eax,-0xc(%ebp)
   int tmp2 = *(int*)arg2;
 11a:	8b 55 0c             	mov    0xc(%ebp),%edx
 11d:	8b 12                	mov    (%edx),%edx
 11f:	89 55 f0             	mov    %edx,-0x10(%ebp)
   assert(tmp1 == 42);
 122:	83 f8 2a             	cmp    $0x2a,%eax
 125:	75 60                	jne    187 <worker+0x7c>
   assert(tmp2 == 24);
 127:	83 fa 18             	cmp    $0x18,%edx
 12a:	0f 85 a0 00 00 00    	jne    1d0 <worker+0xc5>
   assert(global == 1);
 130:	a1 b8 0f 00 00       	mov    0xfb8,%eax
 135:	83 f8 01             	cmp    $0x1,%eax
 138:	0f 84 db 00 00 00    	je     219 <worker+0x10e>
 13e:	6a 38                	push   $0x38
 140:	68 bc 0a 00 00       	push   $0xabc
 145:	68 c6 0a 00 00       	push   $0xac6
 14a:	6a 01                	push   $0x1
 14c:	e8 bc 06 00 00       	call   80d <printf>
 151:	83 c4 0c             	add    $0xc,%esp
 154:	68 2f 0b 00 00       	push   $0xb2f
 159:	68 dd 0a 00 00       	push   $0xadd
 15e:	6a 01                	push   $0x1
 160:	e8 a8 06 00 00       	call   80d <printf>
 165:	83 c4 08             	add    $0x8,%esp
 168:	68 f1 0a 00 00       	push   $0xaf1
 16d:	6a 01                	push   $0x1
 16f:	e8 99 06 00 00       	call   80d <printf>
 174:	83 c4 04             	add    $0x4,%esp
 177:	ff 35 bc 0f 00 00    	push   0xfbc
 17d:	e8 66 05 00 00       	call   6e8 <kill>
 182:	e8 31 05 00 00       	call   6b8 <exit>
   assert(tmp1 == 42);
 187:	6a 36                	push   $0x36
 189:	68 bc 0a 00 00       	push   $0xabc
 18e:	68 c6 0a 00 00       	push   $0xac6
 193:	6a 01                	push   $0x1
 195:	e8 73 06 00 00       	call   80d <printf>
 19a:	83 c4 0c             	add    $0xc,%esp
 19d:	68 19 0b 00 00       	push   $0xb19
 1a2:	68 dd 0a 00 00       	push   $0xadd
 1a7:	6a 01                	push   $0x1
 1a9:	e8 5f 06 00 00       	call   80d <printf>
 1ae:	83 c4 08             	add    $0x8,%esp
 1b1:	68 f1 0a 00 00       	push   $0xaf1
 1b6:	6a 01                	push   $0x1
 1b8:	e8 50 06 00 00       	call   80d <printf>
 1bd:	83 c4 04             	add    $0x4,%esp
 1c0:	ff 35 bc 0f 00 00    	push   0xfbc
 1c6:	e8 1d 05 00 00       	call   6e8 <kill>
 1cb:	e8 e8 04 00 00       	call   6b8 <exit>
   assert(tmp2 == 24);
 1d0:	6a 37                	push   $0x37
 1d2:	68 bc 0a 00 00       	push   $0xabc
 1d7:	68 c6 0a 00 00       	push   $0xac6
 1dc:	6a 01                	push   $0x1
 1de:	e8 2a 06 00 00       	call   80d <printf>
 1e3:	83 c4 0c             	add    $0xc,%esp
 1e6:	68 24 0b 00 00       	push   $0xb24
 1eb:	68 dd 0a 00 00       	push   $0xadd
 1f0:	6a 01                	push   $0x1
 1f2:	e8 16 06 00 00       	call   80d <printf>
 1f7:	83 c4 08             	add    $0x8,%esp
 1fa:	68 f1 0a 00 00       	push   $0xaf1
 1ff:	6a 01                	push   $0x1
 201:	e8 07 06 00 00       	call   80d <printf>
 206:	83 c4 04             	add    $0x4,%esp
 209:	ff 35 bc 0f 00 00    	push   0xfbc
 20f:	e8 d4 04 00 00       	call   6e8 <kill>
 214:	e8 9f 04 00 00       	call   6b8 <exit>
   global++;
 219:	83 c0 01             	add    $0x1,%eax
 21c:	a3 b8 0f 00 00       	mov    %eax,0xfb8

   int nested_thread_pid = thread_create(nested_worker, &tmp1, &tmp2);
 221:	83 ec 04             	sub    $0x4,%esp
 224:	8d 45 f0             	lea    -0x10(%ebp),%eax
 227:	50                   	push   %eax
 228:	8d 45 f4             	lea    -0xc(%ebp),%eax
 22b:	50                   	push   %eax
 22c:	68 00 00 00 00       	push   $0x0
 231:	e8 6d 02 00 00       	call   4a3 <thread_create>
 236:	89 c3                	mov    %eax,%ebx
   assert(nested_thread_pid > 0);
 238:	83 c4 10             	add    $0x10,%esp
 23b:	85 c0                	test   %eax,%eax
 23d:	7e 07                	jle    246 <worker+0x13b>
   for(int j=0;j<10000;j++);
 23f:	b8 00 00 00 00       	mov    $0x0,%eax
 244:	eb 4c                	jmp    292 <worker+0x187>
   assert(nested_thread_pid > 0);
 246:	6a 3c                	push   $0x3c
 248:	68 bc 0a 00 00       	push   $0xabc
 24d:	68 c6 0a 00 00       	push   $0xac6
 252:	6a 01                	push   $0x1
 254:	e8 b4 05 00 00       	call   80d <printf>
 259:	83 c4 0c             	add    $0xc,%esp
 25c:	68 3b 0b 00 00       	push   $0xb3b
 261:	68 dd 0a 00 00       	push   $0xadd
 266:	6a 01                	push   $0x1
 268:	e8 a0 05 00 00       	call   80d <printf>
 26d:	83 c4 08             	add    $0x8,%esp
 270:	68 f1 0a 00 00       	push   $0xaf1
 275:	6a 01                	push   $0x1
 277:	e8 91 05 00 00       	call   80d <printf>
 27c:	83 c4 04             	add    $0x4,%esp
 27f:	ff 35 bc 0f 00 00    	push   0xfbc
 285:	e8 5e 04 00 00       	call   6e8 <kill>
 28a:	e8 29 04 00 00       	call   6b8 <exit>
   for(int j=0;j<10000;j++);
 28f:	83 c0 01             	add    $0x1,%eax
 292:	3d 0f 27 00 00       	cmp    $0x270f,%eax
 297:	7e f6                	jle    28f <worker+0x184>

   int nested_join_pid = thread_join();
 299:	e8 37 02 00 00       	call   4d5 <thread_join>
   assert(nested_join_pid)
 29e:	85 c0                	test   %eax,%eax
 2a0:	74 51                	je     2f3 <worker+0x1e8>
   assert(nested_join_pid == nested_thread_pid);
 2a2:	39 c3                	cmp    %eax,%ebx
 2a4:	0f 84 92 00 00 00    	je     33c <worker+0x231>
 2aa:	6a 41                	push   $0x41
 2ac:	68 bc 0a 00 00       	push   $0xabc
 2b1:	68 c6 0a 00 00       	push   $0xac6
 2b6:	6a 01                	push   $0x1
 2b8:	e8 50 05 00 00       	call   80d <printf>
 2bd:	83 c4 0c             	add    $0xc,%esp
 2c0:	68 94 0b 00 00       	push   $0xb94
 2c5:	68 dd 0a 00 00       	push   $0xadd
 2ca:	6a 01                	push   $0x1
 2cc:	e8 3c 05 00 00       	call   80d <printf>
 2d1:	83 c4 08             	add    $0x8,%esp
 2d4:	68 f1 0a 00 00       	push   $0xaf1
 2d9:	6a 01                	push   $0x1
 2db:	e8 2d 05 00 00       	call   80d <printf>
 2e0:	83 c4 04             	add    $0x4,%esp
 2e3:	ff 35 bc 0f 00 00    	push   0xfbc
 2e9:	e8 fa 03 00 00       	call   6e8 <kill>
 2ee:	e8 c5 03 00 00       	call   6b8 <exit>
   assert(nested_join_pid)
 2f3:	6a 40                	push   $0x40
 2f5:	68 bc 0a 00 00       	push   $0xabc
 2fa:	68 c6 0a 00 00       	push   $0xac6
 2ff:	6a 01                	push   $0x1
 301:	e8 07 05 00 00       	call   80d <printf>
 306:	83 c4 0c             	add    $0xc,%esp
 309:	68 51 0b 00 00       	push   $0xb51
 30e:	68 dd 0a 00 00       	push   $0xadd
 313:	6a 01                	push   $0x1
 315:	e8 f3 04 00 00       	call   80d <printf>
 31a:	83 c4 08             	add    $0x8,%esp
 31d:	68 f1 0a 00 00       	push   $0xaf1
 322:	6a 01                	push   $0x1
 324:	e8 e4 04 00 00       	call   80d <printf>
 329:	83 c4 04             	add    $0x4,%esp
 32c:	ff 35 bc 0f 00 00    	push   0xfbc
 332:	e8 b1 03 00 00       	call   6e8 <kill>
 337:	e8 7c 03 00 00       	call   6b8 <exit>
   exit();
 33c:	e8 77 03 00 00       	call   6b8 <exit>

00000341 <main>:
{
 341:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 345:	83 e4 f0             	and    $0xfffffff0,%esp
 348:	ff 71 fc             	push   -0x4(%ecx)
 34b:	55                   	push   %ebp
 34c:	89 e5                	mov    %esp,%ebp
 34e:	53                   	push   %ebx
 34f:	51                   	push   %ecx
 350:	83 ec 10             	sub    $0x10,%esp
   ppid = getpid();
 353:	e8 e0 03 00 00       	call   738 <getpid>
 358:	a3 bc 0f 00 00       	mov    %eax,0xfbc
   int arg1 = 42, arg2 = 24;
 35d:	c7 45 f4 2a 00 00 00 	movl   $0x2a,-0xc(%ebp)
 364:	c7 45 f0 18 00 00 00 	movl   $0x18,-0x10(%ebp)
   int thread_pid = thread_create(worker, &arg1, &arg2);
 36b:	83 ec 04             	sub    $0x4,%esp
 36e:	8d 45 f0             	lea    -0x10(%ebp),%eax
 371:	50                   	push   %eax
 372:	8d 45 f4             	lea    -0xc(%ebp),%eax
 375:	50                   	push   %eax
 376:	68 0b 01 00 00       	push   $0x10b
 37b:	e8 23 01 00 00       	call   4a3 <thread_create>
   assert(thread_pid > 0);
 380:	83 c4 10             	add    $0x10,%esp
 383:	85 c0                	test   %eax,%eax
 385:	7e 65                	jle    3ec <main+0xab>
 387:	89 c3                	mov    %eax,%ebx
   int join_pid = thread_join();
 389:	e8 47 01 00 00       	call   4d5 <thread_join>
   assert(join_pid == thread_pid);
 38e:	39 c3                	cmp    %eax,%ebx
 390:	0f 85 9f 00 00 00    	jne    435 <main+0xf4>
   assert(global == 3);
 396:	83 3d b8 0f 00 00 03 	cmpl   $0x3,0xfb8
 39d:	0f 84 db 00 00 00    	je     47e <main+0x13d>
 3a3:	6a 22                	push   $0x22
 3a5:	68 bc 0a 00 00       	push   $0xabc
 3aa:	68 c6 0a 00 00       	push   $0xac6
 3af:	6a 01                	push   $0x1
 3b1:	e8 57 04 00 00       	call   80d <printf>
 3b6:	83 c4 0c             	add    $0xc,%esp
 3b9:	68 78 0b 00 00       	push   $0xb78
 3be:	68 dd 0a 00 00       	push   $0xadd
 3c3:	6a 01                	push   $0x1
 3c5:	e8 43 04 00 00       	call   80d <printf>
 3ca:	83 c4 08             	add    $0x8,%esp
 3cd:	68 f1 0a 00 00       	push   $0xaf1
 3d2:	6a 01                	push   $0x1
 3d4:	e8 34 04 00 00       	call   80d <printf>
 3d9:	83 c4 04             	add    $0x4,%esp
 3dc:	ff 35 bc 0f 00 00    	push   0xfbc
 3e2:	e8 01 03 00 00       	call   6e8 <kill>
 3e7:	e8 cc 02 00 00       	call   6b8 <exit>
   assert(thread_pid > 0);
 3ec:	6a 1e                	push   $0x1e
 3ee:	68 bc 0a 00 00       	push   $0xabc
 3f3:	68 c6 0a 00 00       	push   $0xac6
 3f8:	6a 01                	push   $0x1
 3fa:	e8 0e 04 00 00       	call   80d <printf>
 3ff:	83 c4 0c             	add    $0xc,%esp
 402:	68 42 0b 00 00       	push   $0xb42
 407:	68 dd 0a 00 00       	push   $0xadd
 40c:	6a 01                	push   $0x1
 40e:	e8 fa 03 00 00       	call   80d <printf>
 413:	83 c4 08             	add    $0x8,%esp
 416:	68 f1 0a 00 00       	push   $0xaf1
 41b:	6a 01                	push   $0x1
 41d:	e8 eb 03 00 00       	call   80d <printf>
 422:	83 c4 04             	add    $0x4,%esp
 425:	ff 35 bc 0f 00 00    	push   0xfbc
 42b:	e8 b8 02 00 00       	call   6e8 <kill>
 430:	e8 83 02 00 00       	call   6b8 <exit>
   assert(join_pid == thread_pid);
 435:	6a 21                	push   $0x21
 437:	68 bc 0a 00 00       	push   $0xabc
 43c:	68 c6 0a 00 00       	push   $0xac6
 441:	6a 01                	push   $0x1
 443:	e8 c5 03 00 00       	call   80d <printf>
 448:	83 c4 0c             	add    $0xc,%esp
 44b:	68 61 0b 00 00       	push   $0xb61
 450:	68 dd 0a 00 00       	push   $0xadd
 455:	6a 01                	push   $0x1
 457:	e8 b1 03 00 00       	call   80d <printf>
 45c:	83 c4 08             	add    $0x8,%esp
 45f:	68 f1 0a 00 00       	push   $0xaf1
 464:	6a 01                	push   $0x1
 466:	e8 a2 03 00 00       	call   80d <printf>
 46b:	83 c4 04             	add    $0x4,%esp
 46e:	ff 35 bc 0f 00 00    	push   0xfbc
 474:	e8 6f 02 00 00       	call   6e8 <kill>
 479:	e8 3a 02 00 00       	call   6b8 <exit>
   printf(1, "TEST PASSED\n");
 47e:	83 ec 08             	sub    $0x8,%esp
 481:	68 84 0b 00 00       	push   $0xb84
 486:	6a 01                	push   $0x1
 488:	e8 80 03 00 00       	call   80d <printf>
   exit();
 48d:	e8 26 02 00 00       	call   6b8 <exit>

00000492 <test_and_set>:
#include "fcntl.h"
#include "user.h"
#include "x86.h"
#include "mmu.h"

int test_and_set(int *old_ptr, int new_ptr) {
 492:	55                   	push   %ebp
 493:	89 e5                	mov    %esp,%ebp
 495:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *old_ptr;
 498:	8b 10                	mov    (%eax),%edx
  *old_ptr = new_ptr;
 49a:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 49d:	89 08                	mov    %ecx,(%eax)
  return old;
}
 49f:	89 d0                	mov    %edx,%eax
 4a1:	5d                   	pop    %ebp
 4a2:	c3                   	ret    

000004a3 <thread_create>:

// a wrapper func for clone
int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 4a3:	55                   	push   %ebp
 4a4:	89 e5                	mov    %esp,%ebp
 4a6:	83 ec 14             	sub    $0x14,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE);
 4a9:	68 00 10 00 00       	push   $0x1000
 4ae:	e8 80 05 00 00       	call   a33 <malloc>
  if(n_stack == 0){
 4b3:	83 c4 10             	add    $0x10,%esp
 4b6:	85 c0                	test   %eax,%eax
 4b8:	74 14                	je     4ce <thread_create+0x2b>
    return -1;
  }
  int new_pid = clone(start_routine, arg1, arg2, n_stack); // TODO: is this the right way to call it?
 4ba:	50                   	push   %eax
 4bb:	ff 75 10             	push   0x10(%ebp)
 4be:	ff 75 0c             	push   0xc(%ebp)
 4c1:	ff 75 08             	push   0x8(%ebp)
 4c4:	e8 8f 02 00 00       	call   758 <clone>


  // I can't remember if there was something else to do here but I'm sure I'll find out


  return new_pid;
 4c9:	83 c4 10             	add    $0x10,%esp
}
 4cc:	c9                   	leave  
 4cd:	c3                   	ret    
    return -1;
 4ce:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 4d3:	eb f7                	jmp    4cc <thread_create+0x29>

000004d5 <thread_join>:

int thread_join() {
  return 0;
}
 4d5:	b8 00 00 00 00       	mov    $0x0,%eax
 4da:	c3                   	ret    

000004db <lock_acquire>:

void lock_acquire(lock_t *lock){
 4db:	55                   	push   %ebp
 4dc:	89 e5                	mov    %esp,%ebp
 4de:	53                   	push   %ebx
 4df:	83 ec 04             	sub    $0x4,%esp
 4e2:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 4e5:	83 ec 08             	sub    $0x8,%esp
 4e8:	6a 01                	push   $0x1
 4ea:	53                   	push   %ebx
 4eb:	e8 a2 ff ff ff       	call   492 <test_and_set>
 4f0:	83 c4 10             	add    $0x10,%esp
 4f3:	83 f8 01             	cmp    $0x1,%eax
 4f6:	74 ed                	je     4e5 <lock_acquire+0xa>
    ;
}
 4f8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4fb:	c9                   	leave  
 4fc:	c3                   	ret    

000004fd <lock_release>:

void lock_release(lock_t *lock) {
 4fd:	55                   	push   %ebp
 4fe:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 500:	8b 45 08             	mov    0x8(%ebp),%eax
 503:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 509:	5d                   	pop    %ebp
 50a:	c3                   	ret    

0000050b <lock_init>:

void lock_init(lock_t *lock) {
 50b:	55                   	push   %ebp
 50c:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 50e:	8b 45 08             	mov    0x8(%ebp),%eax
 511:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 517:	5d                   	pop    %ebp
 518:	c3                   	ret    

00000519 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 519:	55                   	push   %ebp
 51a:	89 e5                	mov    %esp,%ebp
 51c:	56                   	push   %esi
 51d:	53                   	push   %ebx
 51e:	8b 75 08             	mov    0x8(%ebp),%esi
 521:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 524:	89 f0                	mov    %esi,%eax
 526:	89 d1                	mov    %edx,%ecx
 528:	83 c2 01             	add    $0x1,%edx
 52b:	89 c3                	mov    %eax,%ebx
 52d:	83 c0 01             	add    $0x1,%eax
 530:	0f b6 09             	movzbl (%ecx),%ecx
 533:	88 0b                	mov    %cl,(%ebx)
 535:	84 c9                	test   %cl,%cl
 537:	75 ed                	jne    526 <strcpy+0xd>
    ;
  return os;
}
 539:	89 f0                	mov    %esi,%eax
 53b:	5b                   	pop    %ebx
 53c:	5e                   	pop    %esi
 53d:	5d                   	pop    %ebp
 53e:	c3                   	ret    

0000053f <strcmp>:

int
strcmp(const char *p, const char *q)
{
 53f:	55                   	push   %ebp
 540:	89 e5                	mov    %esp,%ebp
 542:	8b 4d 08             	mov    0x8(%ebp),%ecx
 545:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 548:	eb 06                	jmp    550 <strcmp+0x11>
    p++, q++;
 54a:	83 c1 01             	add    $0x1,%ecx
 54d:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 550:	0f b6 01             	movzbl (%ecx),%eax
 553:	84 c0                	test   %al,%al
 555:	74 04                	je     55b <strcmp+0x1c>
 557:	3a 02                	cmp    (%edx),%al
 559:	74 ef                	je     54a <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 55b:	0f b6 c0             	movzbl %al,%eax
 55e:	0f b6 12             	movzbl (%edx),%edx
 561:	29 d0                	sub    %edx,%eax
}
 563:	5d                   	pop    %ebp
 564:	c3                   	ret    

00000565 <strlen>:

uint
strlen(const char *s)
{
 565:	55                   	push   %ebp
 566:	89 e5                	mov    %esp,%ebp
 568:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 56b:	b8 00 00 00 00       	mov    $0x0,%eax
 570:	eb 03                	jmp    575 <strlen+0x10>
 572:	83 c0 01             	add    $0x1,%eax
 575:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 579:	75 f7                	jne    572 <strlen+0xd>
    ;
  return n;
}
 57b:	5d                   	pop    %ebp
 57c:	c3                   	ret    

0000057d <memset>:

void*
memset(void *dst, int c, uint n)
{
 57d:	55                   	push   %ebp
 57e:	89 e5                	mov    %esp,%ebp
 580:	57                   	push   %edi
 581:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 584:	89 d7                	mov    %edx,%edi
 586:	8b 4d 10             	mov    0x10(%ebp),%ecx
 589:	8b 45 0c             	mov    0xc(%ebp),%eax
 58c:	fc                   	cld    
 58d:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 58f:	89 d0                	mov    %edx,%eax
 591:	8b 7d fc             	mov    -0x4(%ebp),%edi
 594:	c9                   	leave  
 595:	c3                   	ret    

00000596 <strchr>:

char*
strchr(const char *s, char c)
{
 596:	55                   	push   %ebp
 597:	89 e5                	mov    %esp,%ebp
 599:	8b 45 08             	mov    0x8(%ebp),%eax
 59c:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 5a0:	eb 03                	jmp    5a5 <strchr+0xf>
 5a2:	83 c0 01             	add    $0x1,%eax
 5a5:	0f b6 10             	movzbl (%eax),%edx
 5a8:	84 d2                	test   %dl,%dl
 5aa:	74 06                	je     5b2 <strchr+0x1c>
    if(*s == c)
 5ac:	38 ca                	cmp    %cl,%dl
 5ae:	75 f2                	jne    5a2 <strchr+0xc>
 5b0:	eb 05                	jmp    5b7 <strchr+0x21>
      return (char*)s;
  return 0;
 5b2:	b8 00 00 00 00       	mov    $0x0,%eax
}
 5b7:	5d                   	pop    %ebp
 5b8:	c3                   	ret    

000005b9 <gets>:

char*
gets(char *buf, int max)
{
 5b9:	55                   	push   %ebp
 5ba:	89 e5                	mov    %esp,%ebp
 5bc:	57                   	push   %edi
 5bd:	56                   	push   %esi
 5be:	53                   	push   %ebx
 5bf:	83 ec 1c             	sub    $0x1c,%esp
 5c2:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 5c5:	bb 00 00 00 00       	mov    $0x0,%ebx
 5ca:	89 de                	mov    %ebx,%esi
 5cc:	83 c3 01             	add    $0x1,%ebx
 5cf:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 5d2:	7d 2e                	jge    602 <gets+0x49>
    cc = read(0, &c, 1);
 5d4:	83 ec 04             	sub    $0x4,%esp
 5d7:	6a 01                	push   $0x1
 5d9:	8d 45 e7             	lea    -0x19(%ebp),%eax
 5dc:	50                   	push   %eax
 5dd:	6a 00                	push   $0x0
 5df:	e8 ec 00 00 00       	call   6d0 <read>
    if(cc < 1)
 5e4:	83 c4 10             	add    $0x10,%esp
 5e7:	85 c0                	test   %eax,%eax
 5e9:	7e 17                	jle    602 <gets+0x49>
      break;
    buf[i++] = c;
 5eb:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 5ef:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 5f2:	3c 0a                	cmp    $0xa,%al
 5f4:	0f 94 c2             	sete   %dl
 5f7:	3c 0d                	cmp    $0xd,%al
 5f9:	0f 94 c0             	sete   %al
 5fc:	08 c2                	or     %al,%dl
 5fe:	74 ca                	je     5ca <gets+0x11>
    buf[i++] = c;
 600:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 602:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 606:	89 f8                	mov    %edi,%eax
 608:	8d 65 f4             	lea    -0xc(%ebp),%esp
 60b:	5b                   	pop    %ebx
 60c:	5e                   	pop    %esi
 60d:	5f                   	pop    %edi
 60e:	5d                   	pop    %ebp
 60f:	c3                   	ret    

00000610 <stat>:

int
stat(const char *n, struct stat *st)
{
 610:	55                   	push   %ebp
 611:	89 e5                	mov    %esp,%ebp
 613:	56                   	push   %esi
 614:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 615:	83 ec 08             	sub    $0x8,%esp
 618:	6a 00                	push   $0x0
 61a:	ff 75 08             	push   0x8(%ebp)
 61d:	e8 d6 00 00 00       	call   6f8 <open>
  if(fd < 0)
 622:	83 c4 10             	add    $0x10,%esp
 625:	85 c0                	test   %eax,%eax
 627:	78 24                	js     64d <stat+0x3d>
 629:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 62b:	83 ec 08             	sub    $0x8,%esp
 62e:	ff 75 0c             	push   0xc(%ebp)
 631:	50                   	push   %eax
 632:	e8 d9 00 00 00       	call   710 <fstat>
 637:	89 c6                	mov    %eax,%esi
  close(fd);
 639:	89 1c 24             	mov    %ebx,(%esp)
 63c:	e8 9f 00 00 00       	call   6e0 <close>
  return r;
 641:	83 c4 10             	add    $0x10,%esp
}
 644:	89 f0                	mov    %esi,%eax
 646:	8d 65 f8             	lea    -0x8(%ebp),%esp
 649:	5b                   	pop    %ebx
 64a:	5e                   	pop    %esi
 64b:	5d                   	pop    %ebp
 64c:	c3                   	ret    
    return -1;
 64d:	be ff ff ff ff       	mov    $0xffffffff,%esi
 652:	eb f0                	jmp    644 <stat+0x34>

00000654 <atoi>:

int
atoi(const char *s)
{
 654:	55                   	push   %ebp
 655:	89 e5                	mov    %esp,%ebp
 657:	53                   	push   %ebx
 658:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 65b:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 660:	eb 10                	jmp    672 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 662:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 665:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 668:	83 c1 01             	add    $0x1,%ecx
 66b:	0f be c0             	movsbl %al,%eax
 66e:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 672:	0f b6 01             	movzbl (%ecx),%eax
 675:	8d 58 d0             	lea    -0x30(%eax),%ebx
 678:	80 fb 09             	cmp    $0x9,%bl
 67b:	76 e5                	jbe    662 <atoi+0xe>
  return n;
}
 67d:	89 d0                	mov    %edx,%eax
 67f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 682:	c9                   	leave  
 683:	c3                   	ret    

00000684 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 684:	55                   	push   %ebp
 685:	89 e5                	mov    %esp,%ebp
 687:	56                   	push   %esi
 688:	53                   	push   %ebx
 689:	8b 75 08             	mov    0x8(%ebp),%esi
 68c:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 68f:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 692:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 694:	eb 0d                	jmp    6a3 <memmove+0x1f>
    *dst++ = *src++;
 696:	0f b6 01             	movzbl (%ecx),%eax
 699:	88 02                	mov    %al,(%edx)
 69b:	8d 49 01             	lea    0x1(%ecx),%ecx
 69e:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 6a1:	89 d8                	mov    %ebx,%eax
 6a3:	8d 58 ff             	lea    -0x1(%eax),%ebx
 6a6:	85 c0                	test   %eax,%eax
 6a8:	7f ec                	jg     696 <memmove+0x12>
  return vdst;
}
 6aa:	89 f0                	mov    %esi,%eax
 6ac:	5b                   	pop    %ebx
 6ad:	5e                   	pop    %esi
 6ae:	5d                   	pop    %ebp
 6af:	c3                   	ret    

000006b0 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 6b0:	b8 01 00 00 00       	mov    $0x1,%eax
 6b5:	cd 40                	int    $0x40
 6b7:	c3                   	ret    

000006b8 <exit>:
SYSCALL(exit)
 6b8:	b8 02 00 00 00       	mov    $0x2,%eax
 6bd:	cd 40                	int    $0x40
 6bf:	c3                   	ret    

000006c0 <wait>:
SYSCALL(wait)
 6c0:	b8 03 00 00 00       	mov    $0x3,%eax
 6c5:	cd 40                	int    $0x40
 6c7:	c3                   	ret    

000006c8 <pipe>:
SYSCALL(pipe)
 6c8:	b8 04 00 00 00       	mov    $0x4,%eax
 6cd:	cd 40                	int    $0x40
 6cf:	c3                   	ret    

000006d0 <read>:
SYSCALL(read)
 6d0:	b8 05 00 00 00       	mov    $0x5,%eax
 6d5:	cd 40                	int    $0x40
 6d7:	c3                   	ret    

000006d8 <write>:
SYSCALL(write)
 6d8:	b8 10 00 00 00       	mov    $0x10,%eax
 6dd:	cd 40                	int    $0x40
 6df:	c3                   	ret    

000006e0 <close>:
SYSCALL(close)
 6e0:	b8 15 00 00 00       	mov    $0x15,%eax
 6e5:	cd 40                	int    $0x40
 6e7:	c3                   	ret    

000006e8 <kill>:
SYSCALL(kill)
 6e8:	b8 06 00 00 00       	mov    $0x6,%eax
 6ed:	cd 40                	int    $0x40
 6ef:	c3                   	ret    

000006f0 <exec>:
SYSCALL(exec)
 6f0:	b8 07 00 00 00       	mov    $0x7,%eax
 6f5:	cd 40                	int    $0x40
 6f7:	c3                   	ret    

000006f8 <open>:
SYSCALL(open)
 6f8:	b8 0f 00 00 00       	mov    $0xf,%eax
 6fd:	cd 40                	int    $0x40
 6ff:	c3                   	ret    

00000700 <mknod>:
SYSCALL(mknod)
 700:	b8 11 00 00 00       	mov    $0x11,%eax
 705:	cd 40                	int    $0x40
 707:	c3                   	ret    

00000708 <unlink>:
SYSCALL(unlink)
 708:	b8 12 00 00 00       	mov    $0x12,%eax
 70d:	cd 40                	int    $0x40
 70f:	c3                   	ret    

00000710 <fstat>:
SYSCALL(fstat)
 710:	b8 08 00 00 00       	mov    $0x8,%eax
 715:	cd 40                	int    $0x40
 717:	c3                   	ret    

00000718 <link>:
SYSCALL(link)
 718:	b8 13 00 00 00       	mov    $0x13,%eax
 71d:	cd 40                	int    $0x40
 71f:	c3                   	ret    

00000720 <mkdir>:
SYSCALL(mkdir)
 720:	b8 14 00 00 00       	mov    $0x14,%eax
 725:	cd 40                	int    $0x40
 727:	c3                   	ret    

00000728 <chdir>:
SYSCALL(chdir)
 728:	b8 09 00 00 00       	mov    $0x9,%eax
 72d:	cd 40                	int    $0x40
 72f:	c3                   	ret    

00000730 <dup>:
SYSCALL(dup)
 730:	b8 0a 00 00 00       	mov    $0xa,%eax
 735:	cd 40                	int    $0x40
 737:	c3                   	ret    

00000738 <getpid>:
SYSCALL(getpid)
 738:	b8 0b 00 00 00       	mov    $0xb,%eax
 73d:	cd 40                	int    $0x40
 73f:	c3                   	ret    

00000740 <sbrk>:
SYSCALL(sbrk)
 740:	b8 0c 00 00 00       	mov    $0xc,%eax
 745:	cd 40                	int    $0x40
 747:	c3                   	ret    

00000748 <sleep>:
SYSCALL(sleep)
 748:	b8 0d 00 00 00       	mov    $0xd,%eax
 74d:	cd 40                	int    $0x40
 74f:	c3                   	ret    

00000750 <uptime>:
SYSCALL(uptime)
 750:	b8 0e 00 00 00       	mov    $0xe,%eax
 755:	cd 40                	int    $0x40
 757:	c3                   	ret    

00000758 <clone>:
SYSCALL(clone)
 758:	b8 16 00 00 00       	mov    $0x16,%eax
 75d:	cd 40                	int    $0x40
 75f:	c3                   	ret    

00000760 <join>:
 760:	b8 17 00 00 00       	mov    $0x17,%eax
 765:	cd 40                	int    $0x40
 767:	c3                   	ret    

00000768 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 768:	55                   	push   %ebp
 769:	89 e5                	mov    %esp,%ebp
 76b:	83 ec 1c             	sub    $0x1c,%esp
 76e:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 771:	6a 01                	push   $0x1
 773:	8d 55 f4             	lea    -0xc(%ebp),%edx
 776:	52                   	push   %edx
 777:	50                   	push   %eax
 778:	e8 5b ff ff ff       	call   6d8 <write>
}
 77d:	83 c4 10             	add    $0x10,%esp
 780:	c9                   	leave  
 781:	c3                   	ret    

00000782 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 782:	55                   	push   %ebp
 783:	89 e5                	mov    %esp,%ebp
 785:	57                   	push   %edi
 786:	56                   	push   %esi
 787:	53                   	push   %ebx
 788:	83 ec 2c             	sub    $0x2c,%esp
 78b:	89 45 d0             	mov    %eax,-0x30(%ebp)
 78e:	89 d0                	mov    %edx,%eax
 790:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 792:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 796:	0f 95 c1             	setne  %cl
 799:	c1 ea 1f             	shr    $0x1f,%edx
 79c:	84 d1                	test   %dl,%cl
 79e:	74 44                	je     7e4 <printint+0x62>
    neg = 1;
    x = -xx;
 7a0:	f7 d8                	neg    %eax
 7a2:	89 c1                	mov    %eax,%ecx
    neg = 1;
 7a4:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 7ab:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 7b0:	89 c8                	mov    %ecx,%eax
 7b2:	ba 00 00 00 00       	mov    $0x0,%edx
 7b7:	f7 f6                	div    %esi
 7b9:	89 df                	mov    %ebx,%edi
 7bb:	83 c3 01             	add    $0x1,%ebx
 7be:	0f b6 92 18 0c 00 00 	movzbl 0xc18(%edx),%edx
 7c5:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 7c9:	89 ca                	mov    %ecx,%edx
 7cb:	89 c1                	mov    %eax,%ecx
 7cd:	39 d6                	cmp    %edx,%esi
 7cf:	76 df                	jbe    7b0 <printint+0x2e>
  if(neg)
 7d1:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 7d5:	74 31                	je     808 <printint+0x86>
    buf[i++] = '-';
 7d7:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 7dc:	8d 5f 02             	lea    0x2(%edi),%ebx
 7df:	8b 75 d0             	mov    -0x30(%ebp),%esi
 7e2:	eb 17                	jmp    7fb <printint+0x79>
    x = xx;
 7e4:	89 c1                	mov    %eax,%ecx
  neg = 0;
 7e6:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 7ed:	eb bc                	jmp    7ab <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 7ef:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 7f4:	89 f0                	mov    %esi,%eax
 7f6:	e8 6d ff ff ff       	call   768 <putc>
  while(--i >= 0)
 7fb:	83 eb 01             	sub    $0x1,%ebx
 7fe:	79 ef                	jns    7ef <printint+0x6d>
}
 800:	83 c4 2c             	add    $0x2c,%esp
 803:	5b                   	pop    %ebx
 804:	5e                   	pop    %esi
 805:	5f                   	pop    %edi
 806:	5d                   	pop    %ebp
 807:	c3                   	ret    
 808:	8b 75 d0             	mov    -0x30(%ebp),%esi
 80b:	eb ee                	jmp    7fb <printint+0x79>

0000080d <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 80d:	55                   	push   %ebp
 80e:	89 e5                	mov    %esp,%ebp
 810:	57                   	push   %edi
 811:	56                   	push   %esi
 812:	53                   	push   %ebx
 813:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 816:	8d 45 10             	lea    0x10(%ebp),%eax
 819:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 81c:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 821:	bb 00 00 00 00       	mov    $0x0,%ebx
 826:	eb 14                	jmp    83c <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 828:	89 fa                	mov    %edi,%edx
 82a:	8b 45 08             	mov    0x8(%ebp),%eax
 82d:	e8 36 ff ff ff       	call   768 <putc>
 832:	eb 05                	jmp    839 <printf+0x2c>
      }
    } else if(state == '%'){
 834:	83 fe 25             	cmp    $0x25,%esi
 837:	74 25                	je     85e <printf+0x51>
  for(i = 0; fmt[i]; i++){
 839:	83 c3 01             	add    $0x1,%ebx
 83c:	8b 45 0c             	mov    0xc(%ebp),%eax
 83f:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 843:	84 c0                	test   %al,%al
 845:	0f 84 20 01 00 00    	je     96b <printf+0x15e>
    c = fmt[i] & 0xff;
 84b:	0f be f8             	movsbl %al,%edi
 84e:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 851:	85 f6                	test   %esi,%esi
 853:	75 df                	jne    834 <printf+0x27>
      if(c == '%'){
 855:	83 f8 25             	cmp    $0x25,%eax
 858:	75 ce                	jne    828 <printf+0x1b>
        state = '%';
 85a:	89 c6                	mov    %eax,%esi
 85c:	eb db                	jmp    839 <printf+0x2c>
      if(c == 'd'){
 85e:	83 f8 25             	cmp    $0x25,%eax
 861:	0f 84 cf 00 00 00    	je     936 <printf+0x129>
 867:	0f 8c dd 00 00 00    	jl     94a <printf+0x13d>
 86d:	83 f8 78             	cmp    $0x78,%eax
 870:	0f 8f d4 00 00 00    	jg     94a <printf+0x13d>
 876:	83 f8 63             	cmp    $0x63,%eax
 879:	0f 8c cb 00 00 00    	jl     94a <printf+0x13d>
 87f:	83 e8 63             	sub    $0x63,%eax
 882:	83 f8 15             	cmp    $0x15,%eax
 885:	0f 87 bf 00 00 00    	ja     94a <printf+0x13d>
 88b:	ff 24 85 c0 0b 00 00 	jmp    *0xbc0(,%eax,4)
        printint(fd, *ap, 10, 1);
 892:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 895:	8b 17                	mov    (%edi),%edx
 897:	83 ec 0c             	sub    $0xc,%esp
 89a:	6a 01                	push   $0x1
 89c:	b9 0a 00 00 00       	mov    $0xa,%ecx
 8a1:	8b 45 08             	mov    0x8(%ebp),%eax
 8a4:	e8 d9 fe ff ff       	call   782 <printint>
        ap++;
 8a9:	83 c7 04             	add    $0x4,%edi
 8ac:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 8af:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 8b2:	be 00 00 00 00       	mov    $0x0,%esi
 8b7:	eb 80                	jmp    839 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 8b9:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 8bc:	8b 17                	mov    (%edi),%edx
 8be:	83 ec 0c             	sub    $0xc,%esp
 8c1:	6a 00                	push   $0x0
 8c3:	b9 10 00 00 00       	mov    $0x10,%ecx
 8c8:	8b 45 08             	mov    0x8(%ebp),%eax
 8cb:	e8 b2 fe ff ff       	call   782 <printint>
        ap++;
 8d0:	83 c7 04             	add    $0x4,%edi
 8d3:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 8d6:	83 c4 10             	add    $0x10,%esp
      state = 0;
 8d9:	be 00 00 00 00       	mov    $0x0,%esi
 8de:	e9 56 ff ff ff       	jmp    839 <printf+0x2c>
        s = (char*)*ap;
 8e3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8e6:	8b 30                	mov    (%eax),%esi
        ap++;
 8e8:	83 c0 04             	add    $0x4,%eax
 8eb:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 8ee:	85 f6                	test   %esi,%esi
 8f0:	75 15                	jne    907 <printf+0xfa>
          s = "(null)";
 8f2:	be b9 0b 00 00       	mov    $0xbb9,%esi
 8f7:	eb 0e                	jmp    907 <printf+0xfa>
          putc(fd, *s);
 8f9:	0f be d2             	movsbl %dl,%edx
 8fc:	8b 45 08             	mov    0x8(%ebp),%eax
 8ff:	e8 64 fe ff ff       	call   768 <putc>
          s++;
 904:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 907:	0f b6 16             	movzbl (%esi),%edx
 90a:	84 d2                	test   %dl,%dl
 90c:	75 eb                	jne    8f9 <printf+0xec>
      state = 0;
 90e:	be 00 00 00 00       	mov    $0x0,%esi
 913:	e9 21 ff ff ff       	jmp    839 <printf+0x2c>
        putc(fd, *ap);
 918:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 91b:	0f be 17             	movsbl (%edi),%edx
 91e:	8b 45 08             	mov    0x8(%ebp),%eax
 921:	e8 42 fe ff ff       	call   768 <putc>
        ap++;
 926:	83 c7 04             	add    $0x4,%edi
 929:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 92c:	be 00 00 00 00       	mov    $0x0,%esi
 931:	e9 03 ff ff ff       	jmp    839 <printf+0x2c>
        putc(fd, c);
 936:	89 fa                	mov    %edi,%edx
 938:	8b 45 08             	mov    0x8(%ebp),%eax
 93b:	e8 28 fe ff ff       	call   768 <putc>
      state = 0;
 940:	be 00 00 00 00       	mov    $0x0,%esi
 945:	e9 ef fe ff ff       	jmp    839 <printf+0x2c>
        putc(fd, '%');
 94a:	ba 25 00 00 00       	mov    $0x25,%edx
 94f:	8b 45 08             	mov    0x8(%ebp),%eax
 952:	e8 11 fe ff ff       	call   768 <putc>
        putc(fd, c);
 957:	89 fa                	mov    %edi,%edx
 959:	8b 45 08             	mov    0x8(%ebp),%eax
 95c:	e8 07 fe ff ff       	call   768 <putc>
      state = 0;
 961:	be 00 00 00 00       	mov    $0x0,%esi
 966:	e9 ce fe ff ff       	jmp    839 <printf+0x2c>
    }
  }
}
 96b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 96e:	5b                   	pop    %ebx
 96f:	5e                   	pop    %esi
 970:	5f                   	pop    %edi
 971:	5d                   	pop    %ebp
 972:	c3                   	ret    

00000973 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 973:	55                   	push   %ebp
 974:	89 e5                	mov    %esp,%ebp
 976:	57                   	push   %edi
 977:	56                   	push   %esi
 978:	53                   	push   %ebx
 979:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 97c:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 97f:	a1 c0 0f 00 00       	mov    0xfc0,%eax
 984:	eb 02                	jmp    988 <free+0x15>
 986:	89 d0                	mov    %edx,%eax
 988:	39 c8                	cmp    %ecx,%eax
 98a:	73 04                	jae    990 <free+0x1d>
 98c:	39 08                	cmp    %ecx,(%eax)
 98e:	77 12                	ja     9a2 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 990:	8b 10                	mov    (%eax),%edx
 992:	39 c2                	cmp    %eax,%edx
 994:	77 f0                	ja     986 <free+0x13>
 996:	39 c8                	cmp    %ecx,%eax
 998:	72 08                	jb     9a2 <free+0x2f>
 99a:	39 ca                	cmp    %ecx,%edx
 99c:	77 04                	ja     9a2 <free+0x2f>
 99e:	89 d0                	mov    %edx,%eax
 9a0:	eb e6                	jmp    988 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 9a2:	8b 73 fc             	mov    -0x4(%ebx),%esi
 9a5:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 9a8:	8b 10                	mov    (%eax),%edx
 9aa:	39 d7                	cmp    %edx,%edi
 9ac:	74 19                	je     9c7 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 9ae:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 9b1:	8b 50 04             	mov    0x4(%eax),%edx
 9b4:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 9b7:	39 ce                	cmp    %ecx,%esi
 9b9:	74 1b                	je     9d6 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 9bb:	89 08                	mov    %ecx,(%eax)
  freep = p;
 9bd:	a3 c0 0f 00 00       	mov    %eax,0xfc0
}
 9c2:	5b                   	pop    %ebx
 9c3:	5e                   	pop    %esi
 9c4:	5f                   	pop    %edi
 9c5:	5d                   	pop    %ebp
 9c6:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 9c7:	03 72 04             	add    0x4(%edx),%esi
 9ca:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 9cd:	8b 10                	mov    (%eax),%edx
 9cf:	8b 12                	mov    (%edx),%edx
 9d1:	89 53 f8             	mov    %edx,-0x8(%ebx)
 9d4:	eb db                	jmp    9b1 <free+0x3e>
    p->s.size += bp->s.size;
 9d6:	03 53 fc             	add    -0x4(%ebx),%edx
 9d9:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 9dc:	8b 53 f8             	mov    -0x8(%ebx),%edx
 9df:	89 10                	mov    %edx,(%eax)
 9e1:	eb da                	jmp    9bd <free+0x4a>

000009e3 <morecore>:

static Header*
morecore(uint nu)
{
 9e3:	55                   	push   %ebp
 9e4:	89 e5                	mov    %esp,%ebp
 9e6:	53                   	push   %ebx
 9e7:	83 ec 04             	sub    $0x4,%esp
 9ea:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 9ec:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 9f1:	77 05                	ja     9f8 <morecore+0x15>
    nu = 4096;
 9f3:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 9f8:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 9ff:	83 ec 0c             	sub    $0xc,%esp
 a02:	50                   	push   %eax
 a03:	e8 38 fd ff ff       	call   740 <sbrk>
  if(p == (char*)-1)
 a08:	83 c4 10             	add    $0x10,%esp
 a0b:	83 f8 ff             	cmp    $0xffffffff,%eax
 a0e:	74 1c                	je     a2c <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 a10:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 a13:	83 c0 08             	add    $0x8,%eax
 a16:	83 ec 0c             	sub    $0xc,%esp
 a19:	50                   	push   %eax
 a1a:	e8 54 ff ff ff       	call   973 <free>
  return freep;
 a1f:	a1 c0 0f 00 00       	mov    0xfc0,%eax
 a24:	83 c4 10             	add    $0x10,%esp
}
 a27:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 a2a:	c9                   	leave  
 a2b:	c3                   	ret    
    return 0;
 a2c:	b8 00 00 00 00       	mov    $0x0,%eax
 a31:	eb f4                	jmp    a27 <morecore+0x44>

00000a33 <malloc>:

void*
malloc(uint nbytes)
{
 a33:	55                   	push   %ebp
 a34:	89 e5                	mov    %esp,%ebp
 a36:	53                   	push   %ebx
 a37:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a3a:	8b 45 08             	mov    0x8(%ebp),%eax
 a3d:	8d 58 07             	lea    0x7(%eax),%ebx
 a40:	c1 eb 03             	shr    $0x3,%ebx
 a43:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 a46:	8b 0d c0 0f 00 00    	mov    0xfc0,%ecx
 a4c:	85 c9                	test   %ecx,%ecx
 a4e:	74 04                	je     a54 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a50:	8b 01                	mov    (%ecx),%eax
 a52:	eb 4a                	jmp    a9e <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 a54:	c7 05 c0 0f 00 00 c4 	movl   $0xfc4,0xfc0
 a5b:	0f 00 00 
 a5e:	c7 05 c4 0f 00 00 c4 	movl   $0xfc4,0xfc4
 a65:	0f 00 00 
    base.s.size = 0;
 a68:	c7 05 c8 0f 00 00 00 	movl   $0x0,0xfc8
 a6f:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 a72:	b9 c4 0f 00 00       	mov    $0xfc4,%ecx
 a77:	eb d7                	jmp    a50 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 a79:	74 19                	je     a94 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 a7b:	29 da                	sub    %ebx,%edx
 a7d:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 a80:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 a83:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 a86:	89 0d c0 0f 00 00    	mov    %ecx,0xfc0
      return (void*)(p + 1);
 a8c:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 a8f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 a92:	c9                   	leave  
 a93:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 a94:	8b 10                	mov    (%eax),%edx
 a96:	89 11                	mov    %edx,(%ecx)
 a98:	eb ec                	jmp    a86 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a9a:	89 c1                	mov    %eax,%ecx
 a9c:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 a9e:	8b 50 04             	mov    0x4(%eax),%edx
 aa1:	39 da                	cmp    %ebx,%edx
 aa3:	73 d4                	jae    a79 <malloc+0x46>
    if(p == freep)
 aa5:	39 05 c0 0f 00 00    	cmp    %eax,0xfc0
 aab:	75 ed                	jne    a9a <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 aad:	89 d8                	mov    %ebx,%eax
 aaf:	e8 2f ff ff ff       	call   9e3 <morecore>
 ab4:	85 c0                	test   %eax,%eax
 ab6:	75 e2                	jne    a9a <malloc+0x67>
 ab8:	eb d5                	jmp    a8f <malloc+0x5c>
