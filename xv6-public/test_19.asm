
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
  18:	a1 d0 0f 00 00       	mov    0xfd0,%eax
  1d:	83 f8 02             	cmp    $0x2,%eax
  20:	0f 85 9c 00 00 00    	jne    c2 <nested_worker+0xc2>
   global++;
  26:	83 c0 01             	add    $0x1,%eax
  29:	a3 d0 0f 00 00       	mov    %eax,0xfd0
   // no exit() in thread
}
  2e:	c9                   	leave  
  2f:	c3                   	ret    
   assert(arg1_int == 42);
  30:	6a 2b                	push   $0x2b
  32:	68 c8 0a 00 00       	push   $0xac8
  37:	68 d2 0a 00 00       	push   $0xad2
  3c:	6a 01                	push   $0x1
  3e:	e8 d5 07 00 00       	call   818 <printf>
  43:	83 c4 0c             	add    $0xc,%esp
  46:	68 da 0a 00 00       	push   $0xada
  4b:	68 e9 0a 00 00       	push   $0xae9
  50:	6a 01                	push   $0x1
  52:	e8 c1 07 00 00       	call   818 <printf>
  57:	83 c4 08             	add    $0x8,%esp
  5a:	68 fd 0a 00 00       	push   $0xafd
  5f:	6a 01                	push   $0x1
  61:	e8 b2 07 00 00       	call   818 <printf>
  66:	83 c4 04             	add    $0x4,%esp
  69:	ff 35 d4 0f 00 00    	push   0xfd4
  6f:	e8 7f 06 00 00       	call   6f3 <kill>
  74:	e8 4a 06 00 00       	call   6c3 <exit>
   assert(arg2_int == 24);
  79:	6a 2c                	push   $0x2c
  7b:	68 c8 0a 00 00       	push   $0xac8
  80:	68 d2 0a 00 00       	push   $0xad2
  85:	6a 01                	push   $0x1
  87:	e8 8c 07 00 00       	call   818 <printf>
  8c:	83 c4 0c             	add    $0xc,%esp
  8f:	68 0a 0b 00 00       	push   $0xb0a
  94:	68 e9 0a 00 00       	push   $0xae9
  99:	6a 01                	push   $0x1
  9b:	e8 78 07 00 00       	call   818 <printf>
  a0:	83 c4 08             	add    $0x8,%esp
  a3:	68 fd 0a 00 00       	push   $0xafd
  a8:	6a 01                	push   $0x1
  aa:	e8 69 07 00 00       	call   818 <printf>
  af:	83 c4 04             	add    $0x4,%esp
  b2:	ff 35 d4 0f 00 00    	push   0xfd4
  b8:	e8 36 06 00 00       	call   6f3 <kill>
  bd:	e8 01 06 00 00       	call   6c3 <exit>
   assert(global == 2);
  c2:	6a 2d                	push   $0x2d
  c4:	68 c8 0a 00 00       	push   $0xac8
  c9:	68 d2 0a 00 00       	push   $0xad2
  ce:	6a 01                	push   $0x1
  d0:	e8 43 07 00 00       	call   818 <printf>
  d5:	83 c4 0c             	add    $0xc,%esp
  d8:	68 19 0b 00 00       	push   $0xb19
  dd:	68 e9 0a 00 00       	push   $0xae9
  e2:	6a 01                	push   $0x1
  e4:	e8 2f 07 00 00       	call   818 <printf>
  e9:	83 c4 08             	add    $0x8,%esp
  ec:	68 fd 0a 00 00       	push   $0xafd
  f1:	6a 01                	push   $0x1
  f3:	e8 20 07 00 00       	call   818 <printf>
  f8:	83 c4 04             	add    $0x4,%esp
  fb:	ff 35 d4 0f 00 00    	push   0xfd4
 101:	e8 ed 05 00 00       	call   6f3 <kill>
 106:	e8 b8 05 00 00       	call   6c3 <exit>

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
 130:	a1 d0 0f 00 00       	mov    0xfd0,%eax
 135:	83 f8 01             	cmp    $0x1,%eax
 138:	0f 84 db 00 00 00    	je     219 <worker+0x10e>
 13e:	6a 38                	push   $0x38
 140:	68 c8 0a 00 00       	push   $0xac8
 145:	68 d2 0a 00 00       	push   $0xad2
 14a:	6a 01                	push   $0x1
 14c:	e8 c7 06 00 00       	call   818 <printf>
 151:	83 c4 0c             	add    $0xc,%esp
 154:	68 3b 0b 00 00       	push   $0xb3b
 159:	68 e9 0a 00 00       	push   $0xae9
 15e:	6a 01                	push   $0x1
 160:	e8 b3 06 00 00       	call   818 <printf>
 165:	83 c4 08             	add    $0x8,%esp
 168:	68 fd 0a 00 00       	push   $0xafd
 16d:	6a 01                	push   $0x1
 16f:	e8 a4 06 00 00       	call   818 <printf>
 174:	83 c4 04             	add    $0x4,%esp
 177:	ff 35 d4 0f 00 00    	push   0xfd4
 17d:	e8 71 05 00 00       	call   6f3 <kill>
 182:	e8 3c 05 00 00       	call   6c3 <exit>
   assert(tmp1 == 42);
 187:	6a 36                	push   $0x36
 189:	68 c8 0a 00 00       	push   $0xac8
 18e:	68 d2 0a 00 00       	push   $0xad2
 193:	6a 01                	push   $0x1
 195:	e8 7e 06 00 00       	call   818 <printf>
 19a:	83 c4 0c             	add    $0xc,%esp
 19d:	68 25 0b 00 00       	push   $0xb25
 1a2:	68 e9 0a 00 00       	push   $0xae9
 1a7:	6a 01                	push   $0x1
 1a9:	e8 6a 06 00 00       	call   818 <printf>
 1ae:	83 c4 08             	add    $0x8,%esp
 1b1:	68 fd 0a 00 00       	push   $0xafd
 1b6:	6a 01                	push   $0x1
 1b8:	e8 5b 06 00 00       	call   818 <printf>
 1bd:	83 c4 04             	add    $0x4,%esp
 1c0:	ff 35 d4 0f 00 00    	push   0xfd4
 1c6:	e8 28 05 00 00       	call   6f3 <kill>
 1cb:	e8 f3 04 00 00       	call   6c3 <exit>
   assert(tmp2 == 24);
 1d0:	6a 37                	push   $0x37
 1d2:	68 c8 0a 00 00       	push   $0xac8
 1d7:	68 d2 0a 00 00       	push   $0xad2
 1dc:	6a 01                	push   $0x1
 1de:	e8 35 06 00 00       	call   818 <printf>
 1e3:	83 c4 0c             	add    $0xc,%esp
 1e6:	68 30 0b 00 00       	push   $0xb30
 1eb:	68 e9 0a 00 00       	push   $0xae9
 1f0:	6a 01                	push   $0x1
 1f2:	e8 21 06 00 00       	call   818 <printf>
 1f7:	83 c4 08             	add    $0x8,%esp
 1fa:	68 fd 0a 00 00       	push   $0xafd
 1ff:	6a 01                	push   $0x1
 201:	e8 12 06 00 00       	call   818 <printf>
 206:	83 c4 04             	add    $0x4,%esp
 209:	ff 35 d4 0f 00 00    	push   0xfd4
 20f:	e8 df 04 00 00       	call   6f3 <kill>
 214:	e8 aa 04 00 00       	call   6c3 <exit>
   global++;
 219:	83 c0 01             	add    $0x1,%eax
 21c:	a3 d0 0f 00 00       	mov    %eax,0xfd0

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
 248:	68 c8 0a 00 00       	push   $0xac8
 24d:	68 d2 0a 00 00       	push   $0xad2
 252:	6a 01                	push   $0x1
 254:	e8 bf 05 00 00       	call   818 <printf>
 259:	83 c4 0c             	add    $0xc,%esp
 25c:	68 47 0b 00 00       	push   $0xb47
 261:	68 e9 0a 00 00       	push   $0xae9
 266:	6a 01                	push   $0x1
 268:	e8 ab 05 00 00       	call   818 <printf>
 26d:	83 c4 08             	add    $0x8,%esp
 270:	68 fd 0a 00 00       	push   $0xafd
 275:	6a 01                	push   $0x1
 277:	e8 9c 05 00 00       	call   818 <printf>
 27c:	83 c4 04             	add    $0x4,%esp
 27f:	ff 35 d4 0f 00 00    	push   0xfd4
 285:	e8 69 04 00 00       	call   6f3 <kill>
 28a:	e8 34 04 00 00       	call   6c3 <exit>
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
 2ac:	68 c8 0a 00 00       	push   $0xac8
 2b1:	68 d2 0a 00 00       	push   $0xad2
 2b6:	6a 01                	push   $0x1
 2b8:	e8 5b 05 00 00       	call   818 <printf>
 2bd:	83 c4 0c             	add    $0xc,%esp
 2c0:	68 a0 0b 00 00       	push   $0xba0
 2c5:	68 e9 0a 00 00       	push   $0xae9
 2ca:	6a 01                	push   $0x1
 2cc:	e8 47 05 00 00       	call   818 <printf>
 2d1:	83 c4 08             	add    $0x8,%esp
 2d4:	68 fd 0a 00 00       	push   $0xafd
 2d9:	6a 01                	push   $0x1
 2db:	e8 38 05 00 00       	call   818 <printf>
 2e0:	83 c4 04             	add    $0x4,%esp
 2e3:	ff 35 d4 0f 00 00    	push   0xfd4
 2e9:	e8 05 04 00 00       	call   6f3 <kill>
 2ee:	e8 d0 03 00 00       	call   6c3 <exit>
   assert(nested_join_pid)
 2f3:	6a 40                	push   $0x40
 2f5:	68 c8 0a 00 00       	push   $0xac8
 2fa:	68 d2 0a 00 00       	push   $0xad2
 2ff:	6a 01                	push   $0x1
 301:	e8 12 05 00 00       	call   818 <printf>
 306:	83 c4 0c             	add    $0xc,%esp
 309:	68 5d 0b 00 00       	push   $0xb5d
 30e:	68 e9 0a 00 00       	push   $0xae9
 313:	6a 01                	push   $0x1
 315:	e8 fe 04 00 00       	call   818 <printf>
 31a:	83 c4 08             	add    $0x8,%esp
 31d:	68 fd 0a 00 00       	push   $0xafd
 322:	6a 01                	push   $0x1
 324:	e8 ef 04 00 00       	call   818 <printf>
 329:	83 c4 04             	add    $0x4,%esp
 32c:	ff 35 d4 0f 00 00    	push   0xfd4
 332:	e8 bc 03 00 00       	call   6f3 <kill>
 337:	e8 87 03 00 00       	call   6c3 <exit>
   exit();
 33c:	e8 82 03 00 00       	call   6c3 <exit>

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
 353:	e8 eb 03 00 00       	call   743 <getpid>
 358:	a3 d4 0f 00 00       	mov    %eax,0xfd4
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
 396:	83 3d d0 0f 00 00 03 	cmpl   $0x3,0xfd0
 39d:	0f 84 db 00 00 00    	je     47e <main+0x13d>
 3a3:	6a 22                	push   $0x22
 3a5:	68 c8 0a 00 00       	push   $0xac8
 3aa:	68 d2 0a 00 00       	push   $0xad2
 3af:	6a 01                	push   $0x1
 3b1:	e8 62 04 00 00       	call   818 <printf>
 3b6:	83 c4 0c             	add    $0xc,%esp
 3b9:	68 84 0b 00 00       	push   $0xb84
 3be:	68 e9 0a 00 00       	push   $0xae9
 3c3:	6a 01                	push   $0x1
 3c5:	e8 4e 04 00 00       	call   818 <printf>
 3ca:	83 c4 08             	add    $0x8,%esp
 3cd:	68 fd 0a 00 00       	push   $0xafd
 3d2:	6a 01                	push   $0x1
 3d4:	e8 3f 04 00 00       	call   818 <printf>
 3d9:	83 c4 04             	add    $0x4,%esp
 3dc:	ff 35 d4 0f 00 00    	push   0xfd4
 3e2:	e8 0c 03 00 00       	call   6f3 <kill>
 3e7:	e8 d7 02 00 00       	call   6c3 <exit>
   assert(thread_pid > 0);
 3ec:	6a 1e                	push   $0x1e
 3ee:	68 c8 0a 00 00       	push   $0xac8
 3f3:	68 d2 0a 00 00       	push   $0xad2
 3f8:	6a 01                	push   $0x1
 3fa:	e8 19 04 00 00       	call   818 <printf>
 3ff:	83 c4 0c             	add    $0xc,%esp
 402:	68 4e 0b 00 00       	push   $0xb4e
 407:	68 e9 0a 00 00       	push   $0xae9
 40c:	6a 01                	push   $0x1
 40e:	e8 05 04 00 00       	call   818 <printf>
 413:	83 c4 08             	add    $0x8,%esp
 416:	68 fd 0a 00 00       	push   $0xafd
 41b:	6a 01                	push   $0x1
 41d:	e8 f6 03 00 00       	call   818 <printf>
 422:	83 c4 04             	add    $0x4,%esp
 425:	ff 35 d4 0f 00 00    	push   0xfd4
 42b:	e8 c3 02 00 00       	call   6f3 <kill>
 430:	e8 8e 02 00 00       	call   6c3 <exit>
   assert(join_pid == thread_pid);
 435:	6a 21                	push   $0x21
 437:	68 c8 0a 00 00       	push   $0xac8
 43c:	68 d2 0a 00 00       	push   $0xad2
 441:	6a 01                	push   $0x1
 443:	e8 d0 03 00 00       	call   818 <printf>
 448:	83 c4 0c             	add    $0xc,%esp
 44b:	68 6d 0b 00 00       	push   $0xb6d
 450:	68 e9 0a 00 00       	push   $0xae9
 455:	6a 01                	push   $0x1
 457:	e8 bc 03 00 00       	call   818 <printf>
 45c:	83 c4 08             	add    $0x8,%esp
 45f:	68 fd 0a 00 00       	push   $0xafd
 464:	6a 01                	push   $0x1
 466:	e8 ad 03 00 00       	call   818 <printf>
 46b:	83 c4 04             	add    $0x4,%esp
 46e:	ff 35 d4 0f 00 00    	push   0xfd4
 474:	e8 7a 02 00 00       	call   6f3 <kill>
 479:	e8 45 02 00 00       	call   6c3 <exit>
   printf(1, "TEST PASSED\n");
 47e:	83 ec 08             	sub    $0x8,%esp
 481:	68 90 0b 00 00       	push   $0xb90
 486:	6a 01                	push   $0x1
 488:	e8 8b 03 00 00       	call   818 <printf>
   exit();
 48d:	e8 31 02 00 00       	call   6c3 <exit>

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
  void *n_stack = malloc(PGSIZE*2);
 4a9:	68 00 20 00 00       	push   $0x2000
 4ae:	e8 8b 05 00 00       	call   a3e <malloc>
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
 4c4:	e8 9a 02 00 00       	call   763 <clone>


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
 4d5:	55                   	push   %ebp
 4d6:	89 e5                	mov    %esp,%ebp
 4d8:	83 ec 24             	sub    $0x24,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 4db:	8d 45 f4             	lea    -0xc(%ebp),%eax
 4de:	50                   	push   %eax
 4df:	e8 87 02 00 00       	call   76b <join>
  
  return pid;
}
 4e4:	c9                   	leave  
 4e5:	c3                   	ret    

000004e6 <lock_acquire>:

void lock_acquire(lock_t *lock){
 4e6:	55                   	push   %ebp
 4e7:	89 e5                	mov    %esp,%ebp
 4e9:	53                   	push   %ebx
 4ea:	83 ec 04             	sub    $0x4,%esp
 4ed:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 4f0:	83 ec 08             	sub    $0x8,%esp
 4f3:	6a 01                	push   $0x1
 4f5:	53                   	push   %ebx
 4f6:	e8 97 ff ff ff       	call   492 <test_and_set>
 4fb:	83 c4 10             	add    $0x10,%esp
 4fe:	83 f8 01             	cmp    $0x1,%eax
 501:	74 ed                	je     4f0 <lock_acquire+0xa>
    ;
}
 503:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 506:	c9                   	leave  
 507:	c3                   	ret    

00000508 <lock_release>:

void lock_release(lock_t *lock) {
 508:	55                   	push   %ebp
 509:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 50b:	8b 45 08             	mov    0x8(%ebp),%eax
 50e:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 514:	5d                   	pop    %ebp
 515:	c3                   	ret    

00000516 <lock_init>:

void lock_init(lock_t *lock) {
 516:	55                   	push   %ebp
 517:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 519:	8b 45 08             	mov    0x8(%ebp),%eax
 51c:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 522:	5d                   	pop    %ebp
 523:	c3                   	ret    

00000524 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 524:	55                   	push   %ebp
 525:	89 e5                	mov    %esp,%ebp
 527:	56                   	push   %esi
 528:	53                   	push   %ebx
 529:	8b 75 08             	mov    0x8(%ebp),%esi
 52c:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 52f:	89 f0                	mov    %esi,%eax
 531:	89 d1                	mov    %edx,%ecx
 533:	83 c2 01             	add    $0x1,%edx
 536:	89 c3                	mov    %eax,%ebx
 538:	83 c0 01             	add    $0x1,%eax
 53b:	0f b6 09             	movzbl (%ecx),%ecx
 53e:	88 0b                	mov    %cl,(%ebx)
 540:	84 c9                	test   %cl,%cl
 542:	75 ed                	jne    531 <strcpy+0xd>
    ;
  return os;
}
 544:	89 f0                	mov    %esi,%eax
 546:	5b                   	pop    %ebx
 547:	5e                   	pop    %esi
 548:	5d                   	pop    %ebp
 549:	c3                   	ret    

0000054a <strcmp>:

int
strcmp(const char *p, const char *q)
{
 54a:	55                   	push   %ebp
 54b:	89 e5                	mov    %esp,%ebp
 54d:	8b 4d 08             	mov    0x8(%ebp),%ecx
 550:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 553:	eb 06                	jmp    55b <strcmp+0x11>
    p++, q++;
 555:	83 c1 01             	add    $0x1,%ecx
 558:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 55b:	0f b6 01             	movzbl (%ecx),%eax
 55e:	84 c0                	test   %al,%al
 560:	74 04                	je     566 <strcmp+0x1c>
 562:	3a 02                	cmp    (%edx),%al
 564:	74 ef                	je     555 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 566:	0f b6 c0             	movzbl %al,%eax
 569:	0f b6 12             	movzbl (%edx),%edx
 56c:	29 d0                	sub    %edx,%eax
}
 56e:	5d                   	pop    %ebp
 56f:	c3                   	ret    

00000570 <strlen>:

uint
strlen(const char *s)
{
 570:	55                   	push   %ebp
 571:	89 e5                	mov    %esp,%ebp
 573:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 576:	b8 00 00 00 00       	mov    $0x0,%eax
 57b:	eb 03                	jmp    580 <strlen+0x10>
 57d:	83 c0 01             	add    $0x1,%eax
 580:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 584:	75 f7                	jne    57d <strlen+0xd>
    ;
  return n;
}
 586:	5d                   	pop    %ebp
 587:	c3                   	ret    

00000588 <memset>:

void*
memset(void *dst, int c, uint n)
{
 588:	55                   	push   %ebp
 589:	89 e5                	mov    %esp,%ebp
 58b:	57                   	push   %edi
 58c:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 58f:	89 d7                	mov    %edx,%edi
 591:	8b 4d 10             	mov    0x10(%ebp),%ecx
 594:	8b 45 0c             	mov    0xc(%ebp),%eax
 597:	fc                   	cld    
 598:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 59a:	89 d0                	mov    %edx,%eax
 59c:	8b 7d fc             	mov    -0x4(%ebp),%edi
 59f:	c9                   	leave  
 5a0:	c3                   	ret    

000005a1 <strchr>:

char*
strchr(const char *s, char c)
{
 5a1:	55                   	push   %ebp
 5a2:	89 e5                	mov    %esp,%ebp
 5a4:	8b 45 08             	mov    0x8(%ebp),%eax
 5a7:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 5ab:	eb 03                	jmp    5b0 <strchr+0xf>
 5ad:	83 c0 01             	add    $0x1,%eax
 5b0:	0f b6 10             	movzbl (%eax),%edx
 5b3:	84 d2                	test   %dl,%dl
 5b5:	74 06                	je     5bd <strchr+0x1c>
    if(*s == c)
 5b7:	38 ca                	cmp    %cl,%dl
 5b9:	75 f2                	jne    5ad <strchr+0xc>
 5bb:	eb 05                	jmp    5c2 <strchr+0x21>
      return (char*)s;
  return 0;
 5bd:	b8 00 00 00 00       	mov    $0x0,%eax
}
 5c2:	5d                   	pop    %ebp
 5c3:	c3                   	ret    

000005c4 <gets>:

char*
gets(char *buf, int max)
{
 5c4:	55                   	push   %ebp
 5c5:	89 e5                	mov    %esp,%ebp
 5c7:	57                   	push   %edi
 5c8:	56                   	push   %esi
 5c9:	53                   	push   %ebx
 5ca:	83 ec 1c             	sub    $0x1c,%esp
 5cd:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 5d0:	bb 00 00 00 00       	mov    $0x0,%ebx
 5d5:	89 de                	mov    %ebx,%esi
 5d7:	83 c3 01             	add    $0x1,%ebx
 5da:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 5dd:	7d 2e                	jge    60d <gets+0x49>
    cc = read(0, &c, 1);
 5df:	83 ec 04             	sub    $0x4,%esp
 5e2:	6a 01                	push   $0x1
 5e4:	8d 45 e7             	lea    -0x19(%ebp),%eax
 5e7:	50                   	push   %eax
 5e8:	6a 00                	push   $0x0
 5ea:	e8 ec 00 00 00       	call   6db <read>
    if(cc < 1)
 5ef:	83 c4 10             	add    $0x10,%esp
 5f2:	85 c0                	test   %eax,%eax
 5f4:	7e 17                	jle    60d <gets+0x49>
      break;
    buf[i++] = c;
 5f6:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 5fa:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 5fd:	3c 0a                	cmp    $0xa,%al
 5ff:	0f 94 c2             	sete   %dl
 602:	3c 0d                	cmp    $0xd,%al
 604:	0f 94 c0             	sete   %al
 607:	08 c2                	or     %al,%dl
 609:	74 ca                	je     5d5 <gets+0x11>
    buf[i++] = c;
 60b:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 60d:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 611:	89 f8                	mov    %edi,%eax
 613:	8d 65 f4             	lea    -0xc(%ebp),%esp
 616:	5b                   	pop    %ebx
 617:	5e                   	pop    %esi
 618:	5f                   	pop    %edi
 619:	5d                   	pop    %ebp
 61a:	c3                   	ret    

0000061b <stat>:

int
stat(const char *n, struct stat *st)
{
 61b:	55                   	push   %ebp
 61c:	89 e5                	mov    %esp,%ebp
 61e:	56                   	push   %esi
 61f:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 620:	83 ec 08             	sub    $0x8,%esp
 623:	6a 00                	push   $0x0
 625:	ff 75 08             	push   0x8(%ebp)
 628:	e8 d6 00 00 00       	call   703 <open>
  if(fd < 0)
 62d:	83 c4 10             	add    $0x10,%esp
 630:	85 c0                	test   %eax,%eax
 632:	78 24                	js     658 <stat+0x3d>
 634:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 636:	83 ec 08             	sub    $0x8,%esp
 639:	ff 75 0c             	push   0xc(%ebp)
 63c:	50                   	push   %eax
 63d:	e8 d9 00 00 00       	call   71b <fstat>
 642:	89 c6                	mov    %eax,%esi
  close(fd);
 644:	89 1c 24             	mov    %ebx,(%esp)
 647:	e8 9f 00 00 00       	call   6eb <close>
  return r;
 64c:	83 c4 10             	add    $0x10,%esp
}
 64f:	89 f0                	mov    %esi,%eax
 651:	8d 65 f8             	lea    -0x8(%ebp),%esp
 654:	5b                   	pop    %ebx
 655:	5e                   	pop    %esi
 656:	5d                   	pop    %ebp
 657:	c3                   	ret    
    return -1;
 658:	be ff ff ff ff       	mov    $0xffffffff,%esi
 65d:	eb f0                	jmp    64f <stat+0x34>

0000065f <atoi>:

int
atoi(const char *s)
{
 65f:	55                   	push   %ebp
 660:	89 e5                	mov    %esp,%ebp
 662:	53                   	push   %ebx
 663:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 666:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 66b:	eb 10                	jmp    67d <atoi+0x1e>
    n = n*10 + *s++ - '0';
 66d:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 670:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 673:	83 c1 01             	add    $0x1,%ecx
 676:	0f be c0             	movsbl %al,%eax
 679:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 67d:	0f b6 01             	movzbl (%ecx),%eax
 680:	8d 58 d0             	lea    -0x30(%eax),%ebx
 683:	80 fb 09             	cmp    $0x9,%bl
 686:	76 e5                	jbe    66d <atoi+0xe>
  return n;
}
 688:	89 d0                	mov    %edx,%eax
 68a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 68d:	c9                   	leave  
 68e:	c3                   	ret    

0000068f <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 68f:	55                   	push   %ebp
 690:	89 e5                	mov    %esp,%ebp
 692:	56                   	push   %esi
 693:	53                   	push   %ebx
 694:	8b 75 08             	mov    0x8(%ebp),%esi
 697:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 69a:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 69d:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 69f:	eb 0d                	jmp    6ae <memmove+0x1f>
    *dst++ = *src++;
 6a1:	0f b6 01             	movzbl (%ecx),%eax
 6a4:	88 02                	mov    %al,(%edx)
 6a6:	8d 49 01             	lea    0x1(%ecx),%ecx
 6a9:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 6ac:	89 d8                	mov    %ebx,%eax
 6ae:	8d 58 ff             	lea    -0x1(%eax),%ebx
 6b1:	85 c0                	test   %eax,%eax
 6b3:	7f ec                	jg     6a1 <memmove+0x12>
  return vdst;
}
 6b5:	89 f0                	mov    %esi,%eax
 6b7:	5b                   	pop    %ebx
 6b8:	5e                   	pop    %esi
 6b9:	5d                   	pop    %ebp
 6ba:	c3                   	ret    

000006bb <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 6bb:	b8 01 00 00 00       	mov    $0x1,%eax
 6c0:	cd 40                	int    $0x40
 6c2:	c3                   	ret    

000006c3 <exit>:
SYSCALL(exit)
 6c3:	b8 02 00 00 00       	mov    $0x2,%eax
 6c8:	cd 40                	int    $0x40
 6ca:	c3                   	ret    

000006cb <wait>:
SYSCALL(wait)
 6cb:	b8 03 00 00 00       	mov    $0x3,%eax
 6d0:	cd 40                	int    $0x40
 6d2:	c3                   	ret    

000006d3 <pipe>:
SYSCALL(pipe)
 6d3:	b8 04 00 00 00       	mov    $0x4,%eax
 6d8:	cd 40                	int    $0x40
 6da:	c3                   	ret    

000006db <read>:
SYSCALL(read)
 6db:	b8 05 00 00 00       	mov    $0x5,%eax
 6e0:	cd 40                	int    $0x40
 6e2:	c3                   	ret    

000006e3 <write>:
SYSCALL(write)
 6e3:	b8 10 00 00 00       	mov    $0x10,%eax
 6e8:	cd 40                	int    $0x40
 6ea:	c3                   	ret    

000006eb <close>:
SYSCALL(close)
 6eb:	b8 15 00 00 00       	mov    $0x15,%eax
 6f0:	cd 40                	int    $0x40
 6f2:	c3                   	ret    

000006f3 <kill>:
SYSCALL(kill)
 6f3:	b8 06 00 00 00       	mov    $0x6,%eax
 6f8:	cd 40                	int    $0x40
 6fa:	c3                   	ret    

000006fb <exec>:
SYSCALL(exec)
 6fb:	b8 07 00 00 00       	mov    $0x7,%eax
 700:	cd 40                	int    $0x40
 702:	c3                   	ret    

00000703 <open>:
SYSCALL(open)
 703:	b8 0f 00 00 00       	mov    $0xf,%eax
 708:	cd 40                	int    $0x40
 70a:	c3                   	ret    

0000070b <mknod>:
SYSCALL(mknod)
 70b:	b8 11 00 00 00       	mov    $0x11,%eax
 710:	cd 40                	int    $0x40
 712:	c3                   	ret    

00000713 <unlink>:
SYSCALL(unlink)
 713:	b8 12 00 00 00       	mov    $0x12,%eax
 718:	cd 40                	int    $0x40
 71a:	c3                   	ret    

0000071b <fstat>:
SYSCALL(fstat)
 71b:	b8 08 00 00 00       	mov    $0x8,%eax
 720:	cd 40                	int    $0x40
 722:	c3                   	ret    

00000723 <link>:
SYSCALL(link)
 723:	b8 13 00 00 00       	mov    $0x13,%eax
 728:	cd 40                	int    $0x40
 72a:	c3                   	ret    

0000072b <mkdir>:
SYSCALL(mkdir)
 72b:	b8 14 00 00 00       	mov    $0x14,%eax
 730:	cd 40                	int    $0x40
 732:	c3                   	ret    

00000733 <chdir>:
SYSCALL(chdir)
 733:	b8 09 00 00 00       	mov    $0x9,%eax
 738:	cd 40                	int    $0x40
 73a:	c3                   	ret    

0000073b <dup>:
SYSCALL(dup)
 73b:	b8 0a 00 00 00       	mov    $0xa,%eax
 740:	cd 40                	int    $0x40
 742:	c3                   	ret    

00000743 <getpid>:
SYSCALL(getpid)
 743:	b8 0b 00 00 00       	mov    $0xb,%eax
 748:	cd 40                	int    $0x40
 74a:	c3                   	ret    

0000074b <sbrk>:
SYSCALL(sbrk)
 74b:	b8 0c 00 00 00       	mov    $0xc,%eax
 750:	cd 40                	int    $0x40
 752:	c3                   	ret    

00000753 <sleep>:
SYSCALL(sleep)
 753:	b8 0d 00 00 00       	mov    $0xd,%eax
 758:	cd 40                	int    $0x40
 75a:	c3                   	ret    

0000075b <uptime>:
SYSCALL(uptime)
 75b:	b8 0e 00 00 00       	mov    $0xe,%eax
 760:	cd 40                	int    $0x40
 762:	c3                   	ret    

00000763 <clone>:
SYSCALL(clone)
 763:	b8 16 00 00 00       	mov    $0x16,%eax
 768:	cd 40                	int    $0x40
 76a:	c3                   	ret    

0000076b <join>:
 76b:	b8 17 00 00 00       	mov    $0x17,%eax
 770:	cd 40                	int    $0x40
 772:	c3                   	ret    

00000773 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 773:	55                   	push   %ebp
 774:	89 e5                	mov    %esp,%ebp
 776:	83 ec 1c             	sub    $0x1c,%esp
 779:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 77c:	6a 01                	push   $0x1
 77e:	8d 55 f4             	lea    -0xc(%ebp),%edx
 781:	52                   	push   %edx
 782:	50                   	push   %eax
 783:	e8 5b ff ff ff       	call   6e3 <write>
}
 788:	83 c4 10             	add    $0x10,%esp
 78b:	c9                   	leave  
 78c:	c3                   	ret    

0000078d <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 78d:	55                   	push   %ebp
 78e:	89 e5                	mov    %esp,%ebp
 790:	57                   	push   %edi
 791:	56                   	push   %esi
 792:	53                   	push   %ebx
 793:	83 ec 2c             	sub    $0x2c,%esp
 796:	89 45 d0             	mov    %eax,-0x30(%ebp)
 799:	89 d0                	mov    %edx,%eax
 79b:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 79d:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 7a1:	0f 95 c1             	setne  %cl
 7a4:	c1 ea 1f             	shr    $0x1f,%edx
 7a7:	84 d1                	test   %dl,%cl
 7a9:	74 44                	je     7ef <printint+0x62>
    neg = 1;
    x = -xx;
 7ab:	f7 d8                	neg    %eax
 7ad:	89 c1                	mov    %eax,%ecx
    neg = 1;
 7af:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 7b6:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 7bb:	89 c8                	mov    %ecx,%eax
 7bd:	ba 00 00 00 00       	mov    $0x0,%edx
 7c2:	f7 f6                	div    %esi
 7c4:	89 df                	mov    %ebx,%edi
 7c6:	83 c3 01             	add    $0x1,%ebx
 7c9:	0f b6 92 24 0c 00 00 	movzbl 0xc24(%edx),%edx
 7d0:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 7d4:	89 ca                	mov    %ecx,%edx
 7d6:	89 c1                	mov    %eax,%ecx
 7d8:	39 d6                	cmp    %edx,%esi
 7da:	76 df                	jbe    7bb <printint+0x2e>
  if(neg)
 7dc:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 7e0:	74 31                	je     813 <printint+0x86>
    buf[i++] = '-';
 7e2:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 7e7:	8d 5f 02             	lea    0x2(%edi),%ebx
 7ea:	8b 75 d0             	mov    -0x30(%ebp),%esi
 7ed:	eb 17                	jmp    806 <printint+0x79>
    x = xx;
 7ef:	89 c1                	mov    %eax,%ecx
  neg = 0;
 7f1:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 7f8:	eb bc                	jmp    7b6 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 7fa:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 7ff:	89 f0                	mov    %esi,%eax
 801:	e8 6d ff ff ff       	call   773 <putc>
  while(--i >= 0)
 806:	83 eb 01             	sub    $0x1,%ebx
 809:	79 ef                	jns    7fa <printint+0x6d>
}
 80b:	83 c4 2c             	add    $0x2c,%esp
 80e:	5b                   	pop    %ebx
 80f:	5e                   	pop    %esi
 810:	5f                   	pop    %edi
 811:	5d                   	pop    %ebp
 812:	c3                   	ret    
 813:	8b 75 d0             	mov    -0x30(%ebp),%esi
 816:	eb ee                	jmp    806 <printint+0x79>

00000818 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 818:	55                   	push   %ebp
 819:	89 e5                	mov    %esp,%ebp
 81b:	57                   	push   %edi
 81c:	56                   	push   %esi
 81d:	53                   	push   %ebx
 81e:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 821:	8d 45 10             	lea    0x10(%ebp),%eax
 824:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 827:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 82c:	bb 00 00 00 00       	mov    $0x0,%ebx
 831:	eb 14                	jmp    847 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 833:	89 fa                	mov    %edi,%edx
 835:	8b 45 08             	mov    0x8(%ebp),%eax
 838:	e8 36 ff ff ff       	call   773 <putc>
 83d:	eb 05                	jmp    844 <printf+0x2c>
      }
    } else if(state == '%'){
 83f:	83 fe 25             	cmp    $0x25,%esi
 842:	74 25                	je     869 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 844:	83 c3 01             	add    $0x1,%ebx
 847:	8b 45 0c             	mov    0xc(%ebp),%eax
 84a:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 84e:	84 c0                	test   %al,%al
 850:	0f 84 20 01 00 00    	je     976 <printf+0x15e>
    c = fmt[i] & 0xff;
 856:	0f be f8             	movsbl %al,%edi
 859:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 85c:	85 f6                	test   %esi,%esi
 85e:	75 df                	jne    83f <printf+0x27>
      if(c == '%'){
 860:	83 f8 25             	cmp    $0x25,%eax
 863:	75 ce                	jne    833 <printf+0x1b>
        state = '%';
 865:	89 c6                	mov    %eax,%esi
 867:	eb db                	jmp    844 <printf+0x2c>
      if(c == 'd'){
 869:	83 f8 25             	cmp    $0x25,%eax
 86c:	0f 84 cf 00 00 00    	je     941 <printf+0x129>
 872:	0f 8c dd 00 00 00    	jl     955 <printf+0x13d>
 878:	83 f8 78             	cmp    $0x78,%eax
 87b:	0f 8f d4 00 00 00    	jg     955 <printf+0x13d>
 881:	83 f8 63             	cmp    $0x63,%eax
 884:	0f 8c cb 00 00 00    	jl     955 <printf+0x13d>
 88a:	83 e8 63             	sub    $0x63,%eax
 88d:	83 f8 15             	cmp    $0x15,%eax
 890:	0f 87 bf 00 00 00    	ja     955 <printf+0x13d>
 896:	ff 24 85 cc 0b 00 00 	jmp    *0xbcc(,%eax,4)
        printint(fd, *ap, 10, 1);
 89d:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 8a0:	8b 17                	mov    (%edi),%edx
 8a2:	83 ec 0c             	sub    $0xc,%esp
 8a5:	6a 01                	push   $0x1
 8a7:	b9 0a 00 00 00       	mov    $0xa,%ecx
 8ac:	8b 45 08             	mov    0x8(%ebp),%eax
 8af:	e8 d9 fe ff ff       	call   78d <printint>
        ap++;
 8b4:	83 c7 04             	add    $0x4,%edi
 8b7:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 8ba:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 8bd:	be 00 00 00 00       	mov    $0x0,%esi
 8c2:	eb 80                	jmp    844 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 8c4:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 8c7:	8b 17                	mov    (%edi),%edx
 8c9:	83 ec 0c             	sub    $0xc,%esp
 8cc:	6a 00                	push   $0x0
 8ce:	b9 10 00 00 00       	mov    $0x10,%ecx
 8d3:	8b 45 08             	mov    0x8(%ebp),%eax
 8d6:	e8 b2 fe ff ff       	call   78d <printint>
        ap++;
 8db:	83 c7 04             	add    $0x4,%edi
 8de:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 8e1:	83 c4 10             	add    $0x10,%esp
      state = 0;
 8e4:	be 00 00 00 00       	mov    $0x0,%esi
 8e9:	e9 56 ff ff ff       	jmp    844 <printf+0x2c>
        s = (char*)*ap;
 8ee:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8f1:	8b 30                	mov    (%eax),%esi
        ap++;
 8f3:	83 c0 04             	add    $0x4,%eax
 8f6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 8f9:	85 f6                	test   %esi,%esi
 8fb:	75 15                	jne    912 <printf+0xfa>
          s = "(null)";
 8fd:	be c5 0b 00 00       	mov    $0xbc5,%esi
 902:	eb 0e                	jmp    912 <printf+0xfa>
          putc(fd, *s);
 904:	0f be d2             	movsbl %dl,%edx
 907:	8b 45 08             	mov    0x8(%ebp),%eax
 90a:	e8 64 fe ff ff       	call   773 <putc>
          s++;
 90f:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 912:	0f b6 16             	movzbl (%esi),%edx
 915:	84 d2                	test   %dl,%dl
 917:	75 eb                	jne    904 <printf+0xec>
      state = 0;
 919:	be 00 00 00 00       	mov    $0x0,%esi
 91e:	e9 21 ff ff ff       	jmp    844 <printf+0x2c>
        putc(fd, *ap);
 923:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 926:	0f be 17             	movsbl (%edi),%edx
 929:	8b 45 08             	mov    0x8(%ebp),%eax
 92c:	e8 42 fe ff ff       	call   773 <putc>
        ap++;
 931:	83 c7 04             	add    $0x4,%edi
 934:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 937:	be 00 00 00 00       	mov    $0x0,%esi
 93c:	e9 03 ff ff ff       	jmp    844 <printf+0x2c>
        putc(fd, c);
 941:	89 fa                	mov    %edi,%edx
 943:	8b 45 08             	mov    0x8(%ebp),%eax
 946:	e8 28 fe ff ff       	call   773 <putc>
      state = 0;
 94b:	be 00 00 00 00       	mov    $0x0,%esi
 950:	e9 ef fe ff ff       	jmp    844 <printf+0x2c>
        putc(fd, '%');
 955:	ba 25 00 00 00       	mov    $0x25,%edx
 95a:	8b 45 08             	mov    0x8(%ebp),%eax
 95d:	e8 11 fe ff ff       	call   773 <putc>
        putc(fd, c);
 962:	89 fa                	mov    %edi,%edx
 964:	8b 45 08             	mov    0x8(%ebp),%eax
 967:	e8 07 fe ff ff       	call   773 <putc>
      state = 0;
 96c:	be 00 00 00 00       	mov    $0x0,%esi
 971:	e9 ce fe ff ff       	jmp    844 <printf+0x2c>
    }
  }
}
 976:	8d 65 f4             	lea    -0xc(%ebp),%esp
 979:	5b                   	pop    %ebx
 97a:	5e                   	pop    %esi
 97b:	5f                   	pop    %edi
 97c:	5d                   	pop    %ebp
 97d:	c3                   	ret    

0000097e <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 97e:	55                   	push   %ebp
 97f:	89 e5                	mov    %esp,%ebp
 981:	57                   	push   %edi
 982:	56                   	push   %esi
 983:	53                   	push   %ebx
 984:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 987:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 98a:	a1 d8 0f 00 00       	mov    0xfd8,%eax
 98f:	eb 02                	jmp    993 <free+0x15>
 991:	89 d0                	mov    %edx,%eax
 993:	39 c8                	cmp    %ecx,%eax
 995:	73 04                	jae    99b <free+0x1d>
 997:	39 08                	cmp    %ecx,(%eax)
 999:	77 12                	ja     9ad <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 99b:	8b 10                	mov    (%eax),%edx
 99d:	39 c2                	cmp    %eax,%edx
 99f:	77 f0                	ja     991 <free+0x13>
 9a1:	39 c8                	cmp    %ecx,%eax
 9a3:	72 08                	jb     9ad <free+0x2f>
 9a5:	39 ca                	cmp    %ecx,%edx
 9a7:	77 04                	ja     9ad <free+0x2f>
 9a9:	89 d0                	mov    %edx,%eax
 9ab:	eb e6                	jmp    993 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 9ad:	8b 73 fc             	mov    -0x4(%ebx),%esi
 9b0:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 9b3:	8b 10                	mov    (%eax),%edx
 9b5:	39 d7                	cmp    %edx,%edi
 9b7:	74 19                	je     9d2 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 9b9:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 9bc:	8b 50 04             	mov    0x4(%eax),%edx
 9bf:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 9c2:	39 ce                	cmp    %ecx,%esi
 9c4:	74 1b                	je     9e1 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 9c6:	89 08                	mov    %ecx,(%eax)
  freep = p;
 9c8:	a3 d8 0f 00 00       	mov    %eax,0xfd8
}
 9cd:	5b                   	pop    %ebx
 9ce:	5e                   	pop    %esi
 9cf:	5f                   	pop    %edi
 9d0:	5d                   	pop    %ebp
 9d1:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 9d2:	03 72 04             	add    0x4(%edx),%esi
 9d5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 9d8:	8b 10                	mov    (%eax),%edx
 9da:	8b 12                	mov    (%edx),%edx
 9dc:	89 53 f8             	mov    %edx,-0x8(%ebx)
 9df:	eb db                	jmp    9bc <free+0x3e>
    p->s.size += bp->s.size;
 9e1:	03 53 fc             	add    -0x4(%ebx),%edx
 9e4:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 9e7:	8b 53 f8             	mov    -0x8(%ebx),%edx
 9ea:	89 10                	mov    %edx,(%eax)
 9ec:	eb da                	jmp    9c8 <free+0x4a>

000009ee <morecore>:

static Header*
morecore(uint nu)
{
 9ee:	55                   	push   %ebp
 9ef:	89 e5                	mov    %esp,%ebp
 9f1:	53                   	push   %ebx
 9f2:	83 ec 04             	sub    $0x4,%esp
 9f5:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 9f7:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 9fc:	77 05                	ja     a03 <morecore+0x15>
    nu = 4096;
 9fe:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 a03:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 a0a:	83 ec 0c             	sub    $0xc,%esp
 a0d:	50                   	push   %eax
 a0e:	e8 38 fd ff ff       	call   74b <sbrk>
  if(p == (char*)-1)
 a13:	83 c4 10             	add    $0x10,%esp
 a16:	83 f8 ff             	cmp    $0xffffffff,%eax
 a19:	74 1c                	je     a37 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 a1b:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 a1e:	83 c0 08             	add    $0x8,%eax
 a21:	83 ec 0c             	sub    $0xc,%esp
 a24:	50                   	push   %eax
 a25:	e8 54 ff ff ff       	call   97e <free>
  return freep;
 a2a:	a1 d8 0f 00 00       	mov    0xfd8,%eax
 a2f:	83 c4 10             	add    $0x10,%esp
}
 a32:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 a35:	c9                   	leave  
 a36:	c3                   	ret    
    return 0;
 a37:	b8 00 00 00 00       	mov    $0x0,%eax
 a3c:	eb f4                	jmp    a32 <morecore+0x44>

00000a3e <malloc>:

void*
malloc(uint nbytes)
{
 a3e:	55                   	push   %ebp
 a3f:	89 e5                	mov    %esp,%ebp
 a41:	53                   	push   %ebx
 a42:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a45:	8b 45 08             	mov    0x8(%ebp),%eax
 a48:	8d 58 07             	lea    0x7(%eax),%ebx
 a4b:	c1 eb 03             	shr    $0x3,%ebx
 a4e:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 a51:	8b 0d d8 0f 00 00    	mov    0xfd8,%ecx
 a57:	85 c9                	test   %ecx,%ecx
 a59:	74 04                	je     a5f <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a5b:	8b 01                	mov    (%ecx),%eax
 a5d:	eb 4a                	jmp    aa9 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 a5f:	c7 05 d8 0f 00 00 dc 	movl   $0xfdc,0xfd8
 a66:	0f 00 00 
 a69:	c7 05 dc 0f 00 00 dc 	movl   $0xfdc,0xfdc
 a70:	0f 00 00 
    base.s.size = 0;
 a73:	c7 05 e0 0f 00 00 00 	movl   $0x0,0xfe0
 a7a:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 a7d:	b9 dc 0f 00 00       	mov    $0xfdc,%ecx
 a82:	eb d7                	jmp    a5b <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 a84:	74 19                	je     a9f <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 a86:	29 da                	sub    %ebx,%edx
 a88:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 a8b:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 a8e:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 a91:	89 0d d8 0f 00 00    	mov    %ecx,0xfd8
      return (void*)(p + 1);
 a97:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 a9a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 a9d:	c9                   	leave  
 a9e:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 a9f:	8b 10                	mov    (%eax),%edx
 aa1:	89 11                	mov    %edx,(%ecx)
 aa3:	eb ec                	jmp    a91 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 aa5:	89 c1                	mov    %eax,%ecx
 aa7:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 aa9:	8b 50 04             	mov    0x4(%eax),%edx
 aac:	39 da                	cmp    %ebx,%edx
 aae:	73 d4                	jae    a84 <malloc+0x46>
    if(p == freep)
 ab0:	39 05 d8 0f 00 00    	cmp    %eax,0xfd8
 ab6:	75 ed                	jne    aa5 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 ab8:	89 d8                	mov    %ebx,%eax
 aba:	e8 2f ff ff ff       	call   9ee <morecore>
 abf:	85 c0                	test   %eax,%eax
 ac1:	75 e2                	jne    aa5 <malloc+0x67>
 ac3:	eb d5                	jmp    a9a <malloc+0x5c>
