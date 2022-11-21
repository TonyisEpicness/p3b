
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
  18:	a1 7c 0f 00 00       	mov    0xf7c,%eax
  1d:	83 f8 02             	cmp    $0x2,%eax
  20:	0f 85 9c 00 00 00    	jne    c2 <nested_worker+0xc2>
   global++;
  26:	83 c0 01             	add    $0x1,%eax
  29:	a3 7c 0f 00 00       	mov    %eax,0xf7c
   // no exit() in thread
}
  2e:	c9                   	leave  
  2f:	c3                   	ret    
   assert(arg1_int == 42);
  30:	6a 2b                	push   $0x2b
  32:	68 90 0a 00 00       	push   $0xa90
  37:	68 9a 0a 00 00       	push   $0xa9a
  3c:	6a 01                	push   $0x1
  3e:	e8 9e 07 00 00       	call   7e1 <printf>
  43:	83 c4 0c             	add    $0xc,%esp
  46:	68 a2 0a 00 00       	push   $0xaa2
  4b:	68 b1 0a 00 00       	push   $0xab1
  50:	6a 01                	push   $0x1
  52:	e8 8a 07 00 00       	call   7e1 <printf>
  57:	83 c4 08             	add    $0x8,%esp
  5a:	68 c5 0a 00 00       	push   $0xac5
  5f:	6a 01                	push   $0x1
  61:	e8 7b 07 00 00       	call   7e1 <printf>
  66:	83 c4 04             	add    $0x4,%esp
  69:	ff 35 80 0f 00 00    	push   0xf80
  6f:	e8 48 06 00 00       	call   6bc <kill>
  74:	e8 13 06 00 00       	call   68c <exit>
   assert(arg2_int == 24);
  79:	6a 2c                	push   $0x2c
  7b:	68 90 0a 00 00       	push   $0xa90
  80:	68 9a 0a 00 00       	push   $0xa9a
  85:	6a 01                	push   $0x1
  87:	e8 55 07 00 00       	call   7e1 <printf>
  8c:	83 c4 0c             	add    $0xc,%esp
  8f:	68 d2 0a 00 00       	push   $0xad2
  94:	68 b1 0a 00 00       	push   $0xab1
  99:	6a 01                	push   $0x1
  9b:	e8 41 07 00 00       	call   7e1 <printf>
  a0:	83 c4 08             	add    $0x8,%esp
  a3:	68 c5 0a 00 00       	push   $0xac5
  a8:	6a 01                	push   $0x1
  aa:	e8 32 07 00 00       	call   7e1 <printf>
  af:	83 c4 04             	add    $0x4,%esp
  b2:	ff 35 80 0f 00 00    	push   0xf80
  b8:	e8 ff 05 00 00       	call   6bc <kill>
  bd:	e8 ca 05 00 00       	call   68c <exit>
   assert(global == 2);
  c2:	6a 2d                	push   $0x2d
  c4:	68 90 0a 00 00       	push   $0xa90
  c9:	68 9a 0a 00 00       	push   $0xa9a
  ce:	6a 01                	push   $0x1
  d0:	e8 0c 07 00 00       	call   7e1 <printf>
  d5:	83 c4 0c             	add    $0xc,%esp
  d8:	68 e1 0a 00 00       	push   $0xae1
  dd:	68 b1 0a 00 00       	push   $0xab1
  e2:	6a 01                	push   $0x1
  e4:	e8 f8 06 00 00       	call   7e1 <printf>
  e9:	83 c4 08             	add    $0x8,%esp
  ec:	68 c5 0a 00 00       	push   $0xac5
  f1:	6a 01                	push   $0x1
  f3:	e8 e9 06 00 00       	call   7e1 <printf>
  f8:	83 c4 04             	add    $0x4,%esp
  fb:	ff 35 80 0f 00 00    	push   0xf80
 101:	e8 b6 05 00 00       	call   6bc <kill>
 106:	e8 81 05 00 00       	call   68c <exit>

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
 130:	a1 7c 0f 00 00       	mov    0xf7c,%eax
 135:	83 f8 01             	cmp    $0x1,%eax
 138:	0f 84 db 00 00 00    	je     219 <worker+0x10e>
 13e:	6a 38                	push   $0x38
 140:	68 90 0a 00 00       	push   $0xa90
 145:	68 9a 0a 00 00       	push   $0xa9a
 14a:	6a 01                	push   $0x1
 14c:	e8 90 06 00 00       	call   7e1 <printf>
 151:	83 c4 0c             	add    $0xc,%esp
 154:	68 03 0b 00 00       	push   $0xb03
 159:	68 b1 0a 00 00       	push   $0xab1
 15e:	6a 01                	push   $0x1
 160:	e8 7c 06 00 00       	call   7e1 <printf>
 165:	83 c4 08             	add    $0x8,%esp
 168:	68 c5 0a 00 00       	push   $0xac5
 16d:	6a 01                	push   $0x1
 16f:	e8 6d 06 00 00       	call   7e1 <printf>
 174:	83 c4 04             	add    $0x4,%esp
 177:	ff 35 80 0f 00 00    	push   0xf80
 17d:	e8 3a 05 00 00       	call   6bc <kill>
 182:	e8 05 05 00 00       	call   68c <exit>
   assert(tmp1 == 42);
 187:	6a 36                	push   $0x36
 189:	68 90 0a 00 00       	push   $0xa90
 18e:	68 9a 0a 00 00       	push   $0xa9a
 193:	6a 01                	push   $0x1
 195:	e8 47 06 00 00       	call   7e1 <printf>
 19a:	83 c4 0c             	add    $0xc,%esp
 19d:	68 ed 0a 00 00       	push   $0xaed
 1a2:	68 b1 0a 00 00       	push   $0xab1
 1a7:	6a 01                	push   $0x1
 1a9:	e8 33 06 00 00       	call   7e1 <printf>
 1ae:	83 c4 08             	add    $0x8,%esp
 1b1:	68 c5 0a 00 00       	push   $0xac5
 1b6:	6a 01                	push   $0x1
 1b8:	e8 24 06 00 00       	call   7e1 <printf>
 1bd:	83 c4 04             	add    $0x4,%esp
 1c0:	ff 35 80 0f 00 00    	push   0xf80
 1c6:	e8 f1 04 00 00       	call   6bc <kill>
 1cb:	e8 bc 04 00 00       	call   68c <exit>
   assert(tmp2 == 24);
 1d0:	6a 37                	push   $0x37
 1d2:	68 90 0a 00 00       	push   $0xa90
 1d7:	68 9a 0a 00 00       	push   $0xa9a
 1dc:	6a 01                	push   $0x1
 1de:	e8 fe 05 00 00       	call   7e1 <printf>
 1e3:	83 c4 0c             	add    $0xc,%esp
 1e6:	68 f8 0a 00 00       	push   $0xaf8
 1eb:	68 b1 0a 00 00       	push   $0xab1
 1f0:	6a 01                	push   $0x1
 1f2:	e8 ea 05 00 00       	call   7e1 <printf>
 1f7:	83 c4 08             	add    $0x8,%esp
 1fa:	68 c5 0a 00 00       	push   $0xac5
 1ff:	6a 01                	push   $0x1
 201:	e8 db 05 00 00       	call   7e1 <printf>
 206:	83 c4 04             	add    $0x4,%esp
 209:	ff 35 80 0f 00 00    	push   0xf80
 20f:	e8 a8 04 00 00       	call   6bc <kill>
 214:	e8 73 04 00 00       	call   68c <exit>
   global++;
 219:	83 c0 01             	add    $0x1,%eax
 21c:	a3 7c 0f 00 00       	mov    %eax,0xf7c

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
 248:	68 90 0a 00 00       	push   $0xa90
 24d:	68 9a 0a 00 00       	push   $0xa9a
 252:	6a 01                	push   $0x1
 254:	e8 88 05 00 00       	call   7e1 <printf>
 259:	83 c4 0c             	add    $0xc,%esp
 25c:	68 0f 0b 00 00       	push   $0xb0f
 261:	68 b1 0a 00 00       	push   $0xab1
 266:	6a 01                	push   $0x1
 268:	e8 74 05 00 00       	call   7e1 <printf>
 26d:	83 c4 08             	add    $0x8,%esp
 270:	68 c5 0a 00 00       	push   $0xac5
 275:	6a 01                	push   $0x1
 277:	e8 65 05 00 00       	call   7e1 <printf>
 27c:	83 c4 04             	add    $0x4,%esp
 27f:	ff 35 80 0f 00 00    	push   0xf80
 285:	e8 32 04 00 00       	call   6bc <kill>
 28a:	e8 fd 03 00 00       	call   68c <exit>
   for(int j=0;j<10000;j++);
 28f:	83 c0 01             	add    $0x1,%eax
 292:	3d 0f 27 00 00       	cmp    $0x270f,%eax
 297:	7e f6                	jle    28f <worker+0x184>

   int nested_join_pid = thread_join();
 299:	e8 0b 02 00 00       	call   4a9 <thread_join>
   assert(nested_join_pid)
 29e:	85 c0                	test   %eax,%eax
 2a0:	74 51                	je     2f3 <worker+0x1e8>
   assert(nested_join_pid == nested_thread_pid);
 2a2:	39 c3                	cmp    %eax,%ebx
 2a4:	0f 84 92 00 00 00    	je     33c <worker+0x231>
 2aa:	6a 41                	push   $0x41
 2ac:	68 90 0a 00 00       	push   $0xa90
 2b1:	68 9a 0a 00 00       	push   $0xa9a
 2b6:	6a 01                	push   $0x1
 2b8:	e8 24 05 00 00       	call   7e1 <printf>
 2bd:	83 c4 0c             	add    $0xc,%esp
 2c0:	68 68 0b 00 00       	push   $0xb68
 2c5:	68 b1 0a 00 00       	push   $0xab1
 2ca:	6a 01                	push   $0x1
 2cc:	e8 10 05 00 00       	call   7e1 <printf>
 2d1:	83 c4 08             	add    $0x8,%esp
 2d4:	68 c5 0a 00 00       	push   $0xac5
 2d9:	6a 01                	push   $0x1
 2db:	e8 01 05 00 00       	call   7e1 <printf>
 2e0:	83 c4 04             	add    $0x4,%esp
 2e3:	ff 35 80 0f 00 00    	push   0xf80
 2e9:	e8 ce 03 00 00       	call   6bc <kill>
 2ee:	e8 99 03 00 00       	call   68c <exit>
   assert(nested_join_pid)
 2f3:	6a 40                	push   $0x40
 2f5:	68 90 0a 00 00       	push   $0xa90
 2fa:	68 9a 0a 00 00       	push   $0xa9a
 2ff:	6a 01                	push   $0x1
 301:	e8 db 04 00 00       	call   7e1 <printf>
 306:	83 c4 0c             	add    $0xc,%esp
 309:	68 25 0b 00 00       	push   $0xb25
 30e:	68 b1 0a 00 00       	push   $0xab1
 313:	6a 01                	push   $0x1
 315:	e8 c7 04 00 00       	call   7e1 <printf>
 31a:	83 c4 08             	add    $0x8,%esp
 31d:	68 c5 0a 00 00       	push   $0xac5
 322:	6a 01                	push   $0x1
 324:	e8 b8 04 00 00       	call   7e1 <printf>
 329:	83 c4 04             	add    $0x4,%esp
 32c:	ff 35 80 0f 00 00    	push   0xf80
 332:	e8 85 03 00 00       	call   6bc <kill>
 337:	e8 50 03 00 00       	call   68c <exit>
   exit();
 33c:	e8 4b 03 00 00       	call   68c <exit>

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
 353:	e8 b4 03 00 00       	call   70c <getpid>
 358:	a3 80 0f 00 00       	mov    %eax,0xf80
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
 389:	e8 1b 01 00 00       	call   4a9 <thread_join>
   assert(join_pid == thread_pid);
 38e:	39 c3                	cmp    %eax,%ebx
 390:	0f 85 9f 00 00 00    	jne    435 <main+0xf4>
   assert(global == 3);
 396:	83 3d 7c 0f 00 00 03 	cmpl   $0x3,0xf7c
 39d:	0f 84 db 00 00 00    	je     47e <main+0x13d>
 3a3:	6a 22                	push   $0x22
 3a5:	68 90 0a 00 00       	push   $0xa90
 3aa:	68 9a 0a 00 00       	push   $0xa9a
 3af:	6a 01                	push   $0x1
 3b1:	e8 2b 04 00 00       	call   7e1 <printf>
 3b6:	83 c4 0c             	add    $0xc,%esp
 3b9:	68 4c 0b 00 00       	push   $0xb4c
 3be:	68 b1 0a 00 00       	push   $0xab1
 3c3:	6a 01                	push   $0x1
 3c5:	e8 17 04 00 00       	call   7e1 <printf>
 3ca:	83 c4 08             	add    $0x8,%esp
 3cd:	68 c5 0a 00 00       	push   $0xac5
 3d2:	6a 01                	push   $0x1
 3d4:	e8 08 04 00 00       	call   7e1 <printf>
 3d9:	83 c4 04             	add    $0x4,%esp
 3dc:	ff 35 80 0f 00 00    	push   0xf80
 3e2:	e8 d5 02 00 00       	call   6bc <kill>
 3e7:	e8 a0 02 00 00       	call   68c <exit>
   assert(thread_pid > 0);
 3ec:	6a 1e                	push   $0x1e
 3ee:	68 90 0a 00 00       	push   $0xa90
 3f3:	68 9a 0a 00 00       	push   $0xa9a
 3f8:	6a 01                	push   $0x1
 3fa:	e8 e2 03 00 00       	call   7e1 <printf>
 3ff:	83 c4 0c             	add    $0xc,%esp
 402:	68 16 0b 00 00       	push   $0xb16
 407:	68 b1 0a 00 00       	push   $0xab1
 40c:	6a 01                	push   $0x1
 40e:	e8 ce 03 00 00       	call   7e1 <printf>
 413:	83 c4 08             	add    $0x8,%esp
 416:	68 c5 0a 00 00       	push   $0xac5
 41b:	6a 01                	push   $0x1
 41d:	e8 bf 03 00 00       	call   7e1 <printf>
 422:	83 c4 04             	add    $0x4,%esp
 425:	ff 35 80 0f 00 00    	push   0xf80
 42b:	e8 8c 02 00 00       	call   6bc <kill>
 430:	e8 57 02 00 00       	call   68c <exit>
   assert(join_pid == thread_pid);
 435:	6a 21                	push   $0x21
 437:	68 90 0a 00 00       	push   $0xa90
 43c:	68 9a 0a 00 00       	push   $0xa9a
 441:	6a 01                	push   $0x1
 443:	e8 99 03 00 00       	call   7e1 <printf>
 448:	83 c4 0c             	add    $0xc,%esp
 44b:	68 35 0b 00 00       	push   $0xb35
 450:	68 b1 0a 00 00       	push   $0xab1
 455:	6a 01                	push   $0x1
 457:	e8 85 03 00 00       	call   7e1 <printf>
 45c:	83 c4 08             	add    $0x8,%esp
 45f:	68 c5 0a 00 00       	push   $0xac5
 464:	6a 01                	push   $0x1
 466:	e8 76 03 00 00       	call   7e1 <printf>
 46b:	83 c4 04             	add    $0x4,%esp
 46e:	ff 35 80 0f 00 00    	push   0xf80
 474:	e8 43 02 00 00       	call   6bc <kill>
 479:	e8 0e 02 00 00       	call   68c <exit>
   printf(1, "TEST PASSED\n");
 47e:	83 ec 08             	sub    $0x8,%esp
 481:	68 58 0b 00 00       	push   $0xb58
 486:	6a 01                	push   $0x1
 488:	e8 54 03 00 00       	call   7e1 <printf>
   exit();
 48d:	e8 fa 01 00 00       	call   68c <exit>

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

  // I can't remember if there was something else to do here but I'm sure I'll find out


  return new_pid;
}
 4a3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 4a8:	c3                   	ret    

000004a9 <thread_join>:

int thread_join() {
  return 0;
}
 4a9:	b8 00 00 00 00       	mov    $0x0,%eax
 4ae:	c3                   	ret    

000004af <lock_acquire>:

void lock_acquire(lock_t *lock){
 4af:	55                   	push   %ebp
 4b0:	89 e5                	mov    %esp,%ebp
 4b2:	53                   	push   %ebx
 4b3:	83 ec 04             	sub    $0x4,%esp
 4b6:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 4b9:	83 ec 08             	sub    $0x8,%esp
 4bc:	6a 01                	push   $0x1
 4be:	53                   	push   %ebx
 4bf:	e8 ce ff ff ff       	call   492 <test_and_set>
 4c4:	83 c4 10             	add    $0x10,%esp
 4c7:	83 f8 01             	cmp    $0x1,%eax
 4ca:	74 ed                	je     4b9 <lock_acquire+0xa>
    ;
}
 4cc:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4cf:	c9                   	leave  
 4d0:	c3                   	ret    

000004d1 <lock_release>:

void lock_release(lock_t *lock) {
 4d1:	55                   	push   %ebp
 4d2:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 4d4:	8b 45 08             	mov    0x8(%ebp),%eax
 4d7:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 4dd:	5d                   	pop    %ebp
 4de:	c3                   	ret    

000004df <lock_init>:

void lock_init(lock_t *lock) {
 4df:	55                   	push   %ebp
 4e0:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 4e2:	8b 45 08             	mov    0x8(%ebp),%eax
 4e5:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 4eb:	5d                   	pop    %ebp
 4ec:	c3                   	ret    

000004ed <strcpy>:

char*
strcpy(char *s, const char *t)
{
 4ed:	55                   	push   %ebp
 4ee:	89 e5                	mov    %esp,%ebp
 4f0:	56                   	push   %esi
 4f1:	53                   	push   %ebx
 4f2:	8b 75 08             	mov    0x8(%ebp),%esi
 4f5:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 4f8:	89 f0                	mov    %esi,%eax
 4fa:	89 d1                	mov    %edx,%ecx
 4fc:	83 c2 01             	add    $0x1,%edx
 4ff:	89 c3                	mov    %eax,%ebx
 501:	83 c0 01             	add    $0x1,%eax
 504:	0f b6 09             	movzbl (%ecx),%ecx
 507:	88 0b                	mov    %cl,(%ebx)
 509:	84 c9                	test   %cl,%cl
 50b:	75 ed                	jne    4fa <strcpy+0xd>
    ;
  return os;
}
 50d:	89 f0                	mov    %esi,%eax
 50f:	5b                   	pop    %ebx
 510:	5e                   	pop    %esi
 511:	5d                   	pop    %ebp
 512:	c3                   	ret    

00000513 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 513:	55                   	push   %ebp
 514:	89 e5                	mov    %esp,%ebp
 516:	8b 4d 08             	mov    0x8(%ebp),%ecx
 519:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 51c:	eb 06                	jmp    524 <strcmp+0x11>
    p++, q++;
 51e:	83 c1 01             	add    $0x1,%ecx
 521:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 524:	0f b6 01             	movzbl (%ecx),%eax
 527:	84 c0                	test   %al,%al
 529:	74 04                	je     52f <strcmp+0x1c>
 52b:	3a 02                	cmp    (%edx),%al
 52d:	74 ef                	je     51e <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 52f:	0f b6 c0             	movzbl %al,%eax
 532:	0f b6 12             	movzbl (%edx),%edx
 535:	29 d0                	sub    %edx,%eax
}
 537:	5d                   	pop    %ebp
 538:	c3                   	ret    

00000539 <strlen>:

uint
strlen(const char *s)
{
 539:	55                   	push   %ebp
 53a:	89 e5                	mov    %esp,%ebp
 53c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 53f:	b8 00 00 00 00       	mov    $0x0,%eax
 544:	eb 03                	jmp    549 <strlen+0x10>
 546:	83 c0 01             	add    $0x1,%eax
 549:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 54d:	75 f7                	jne    546 <strlen+0xd>
    ;
  return n;
}
 54f:	5d                   	pop    %ebp
 550:	c3                   	ret    

00000551 <memset>:

void*
memset(void *dst, int c, uint n)
{
 551:	55                   	push   %ebp
 552:	89 e5                	mov    %esp,%ebp
 554:	57                   	push   %edi
 555:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 558:	89 d7                	mov    %edx,%edi
 55a:	8b 4d 10             	mov    0x10(%ebp),%ecx
 55d:	8b 45 0c             	mov    0xc(%ebp),%eax
 560:	fc                   	cld    
 561:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 563:	89 d0                	mov    %edx,%eax
 565:	8b 7d fc             	mov    -0x4(%ebp),%edi
 568:	c9                   	leave  
 569:	c3                   	ret    

0000056a <strchr>:

char*
strchr(const char *s, char c)
{
 56a:	55                   	push   %ebp
 56b:	89 e5                	mov    %esp,%ebp
 56d:	8b 45 08             	mov    0x8(%ebp),%eax
 570:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 574:	eb 03                	jmp    579 <strchr+0xf>
 576:	83 c0 01             	add    $0x1,%eax
 579:	0f b6 10             	movzbl (%eax),%edx
 57c:	84 d2                	test   %dl,%dl
 57e:	74 06                	je     586 <strchr+0x1c>
    if(*s == c)
 580:	38 ca                	cmp    %cl,%dl
 582:	75 f2                	jne    576 <strchr+0xc>
 584:	eb 05                	jmp    58b <strchr+0x21>
      return (char*)s;
  return 0;
 586:	b8 00 00 00 00       	mov    $0x0,%eax
}
 58b:	5d                   	pop    %ebp
 58c:	c3                   	ret    

0000058d <gets>:

char*
gets(char *buf, int max)
{
 58d:	55                   	push   %ebp
 58e:	89 e5                	mov    %esp,%ebp
 590:	57                   	push   %edi
 591:	56                   	push   %esi
 592:	53                   	push   %ebx
 593:	83 ec 1c             	sub    $0x1c,%esp
 596:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 599:	bb 00 00 00 00       	mov    $0x0,%ebx
 59e:	89 de                	mov    %ebx,%esi
 5a0:	83 c3 01             	add    $0x1,%ebx
 5a3:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 5a6:	7d 2e                	jge    5d6 <gets+0x49>
    cc = read(0, &c, 1);
 5a8:	83 ec 04             	sub    $0x4,%esp
 5ab:	6a 01                	push   $0x1
 5ad:	8d 45 e7             	lea    -0x19(%ebp),%eax
 5b0:	50                   	push   %eax
 5b1:	6a 00                	push   $0x0
 5b3:	e8 ec 00 00 00       	call   6a4 <read>
    if(cc < 1)
 5b8:	83 c4 10             	add    $0x10,%esp
 5bb:	85 c0                	test   %eax,%eax
 5bd:	7e 17                	jle    5d6 <gets+0x49>
      break;
    buf[i++] = c;
 5bf:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 5c3:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 5c6:	3c 0a                	cmp    $0xa,%al
 5c8:	0f 94 c2             	sete   %dl
 5cb:	3c 0d                	cmp    $0xd,%al
 5cd:	0f 94 c0             	sete   %al
 5d0:	08 c2                	or     %al,%dl
 5d2:	74 ca                	je     59e <gets+0x11>
    buf[i++] = c;
 5d4:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 5d6:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 5da:	89 f8                	mov    %edi,%eax
 5dc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5df:	5b                   	pop    %ebx
 5e0:	5e                   	pop    %esi
 5e1:	5f                   	pop    %edi
 5e2:	5d                   	pop    %ebp
 5e3:	c3                   	ret    

000005e4 <stat>:

int
stat(const char *n, struct stat *st)
{
 5e4:	55                   	push   %ebp
 5e5:	89 e5                	mov    %esp,%ebp
 5e7:	56                   	push   %esi
 5e8:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 5e9:	83 ec 08             	sub    $0x8,%esp
 5ec:	6a 00                	push   $0x0
 5ee:	ff 75 08             	push   0x8(%ebp)
 5f1:	e8 d6 00 00 00       	call   6cc <open>
  if(fd < 0)
 5f6:	83 c4 10             	add    $0x10,%esp
 5f9:	85 c0                	test   %eax,%eax
 5fb:	78 24                	js     621 <stat+0x3d>
 5fd:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 5ff:	83 ec 08             	sub    $0x8,%esp
 602:	ff 75 0c             	push   0xc(%ebp)
 605:	50                   	push   %eax
 606:	e8 d9 00 00 00       	call   6e4 <fstat>
 60b:	89 c6                	mov    %eax,%esi
  close(fd);
 60d:	89 1c 24             	mov    %ebx,(%esp)
 610:	e8 9f 00 00 00       	call   6b4 <close>
  return r;
 615:	83 c4 10             	add    $0x10,%esp
}
 618:	89 f0                	mov    %esi,%eax
 61a:	8d 65 f8             	lea    -0x8(%ebp),%esp
 61d:	5b                   	pop    %ebx
 61e:	5e                   	pop    %esi
 61f:	5d                   	pop    %ebp
 620:	c3                   	ret    
    return -1;
 621:	be ff ff ff ff       	mov    $0xffffffff,%esi
 626:	eb f0                	jmp    618 <stat+0x34>

00000628 <atoi>:

int
atoi(const char *s)
{
 628:	55                   	push   %ebp
 629:	89 e5                	mov    %esp,%ebp
 62b:	53                   	push   %ebx
 62c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 62f:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 634:	eb 10                	jmp    646 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 636:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 639:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 63c:	83 c1 01             	add    $0x1,%ecx
 63f:	0f be c0             	movsbl %al,%eax
 642:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 646:	0f b6 01             	movzbl (%ecx),%eax
 649:	8d 58 d0             	lea    -0x30(%eax),%ebx
 64c:	80 fb 09             	cmp    $0x9,%bl
 64f:	76 e5                	jbe    636 <atoi+0xe>
  return n;
}
 651:	89 d0                	mov    %edx,%eax
 653:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 656:	c9                   	leave  
 657:	c3                   	ret    

00000658 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 658:	55                   	push   %ebp
 659:	89 e5                	mov    %esp,%ebp
 65b:	56                   	push   %esi
 65c:	53                   	push   %ebx
 65d:	8b 75 08             	mov    0x8(%ebp),%esi
 660:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 663:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 666:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 668:	eb 0d                	jmp    677 <memmove+0x1f>
    *dst++ = *src++;
 66a:	0f b6 01             	movzbl (%ecx),%eax
 66d:	88 02                	mov    %al,(%edx)
 66f:	8d 49 01             	lea    0x1(%ecx),%ecx
 672:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 675:	89 d8                	mov    %ebx,%eax
 677:	8d 58 ff             	lea    -0x1(%eax),%ebx
 67a:	85 c0                	test   %eax,%eax
 67c:	7f ec                	jg     66a <memmove+0x12>
  return vdst;
}
 67e:	89 f0                	mov    %esi,%eax
 680:	5b                   	pop    %ebx
 681:	5e                   	pop    %esi
 682:	5d                   	pop    %ebp
 683:	c3                   	ret    

00000684 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 684:	b8 01 00 00 00       	mov    $0x1,%eax
 689:	cd 40                	int    $0x40
 68b:	c3                   	ret    

0000068c <exit>:
SYSCALL(exit)
 68c:	b8 02 00 00 00       	mov    $0x2,%eax
 691:	cd 40                	int    $0x40
 693:	c3                   	ret    

00000694 <wait>:
SYSCALL(wait)
 694:	b8 03 00 00 00       	mov    $0x3,%eax
 699:	cd 40                	int    $0x40
 69b:	c3                   	ret    

0000069c <pipe>:
SYSCALL(pipe)
 69c:	b8 04 00 00 00       	mov    $0x4,%eax
 6a1:	cd 40                	int    $0x40
 6a3:	c3                   	ret    

000006a4 <read>:
SYSCALL(read)
 6a4:	b8 05 00 00 00       	mov    $0x5,%eax
 6a9:	cd 40                	int    $0x40
 6ab:	c3                   	ret    

000006ac <write>:
SYSCALL(write)
 6ac:	b8 10 00 00 00       	mov    $0x10,%eax
 6b1:	cd 40                	int    $0x40
 6b3:	c3                   	ret    

000006b4 <close>:
SYSCALL(close)
 6b4:	b8 15 00 00 00       	mov    $0x15,%eax
 6b9:	cd 40                	int    $0x40
 6bb:	c3                   	ret    

000006bc <kill>:
SYSCALL(kill)
 6bc:	b8 06 00 00 00       	mov    $0x6,%eax
 6c1:	cd 40                	int    $0x40
 6c3:	c3                   	ret    

000006c4 <exec>:
SYSCALL(exec)
 6c4:	b8 07 00 00 00       	mov    $0x7,%eax
 6c9:	cd 40                	int    $0x40
 6cb:	c3                   	ret    

000006cc <open>:
SYSCALL(open)
 6cc:	b8 0f 00 00 00       	mov    $0xf,%eax
 6d1:	cd 40                	int    $0x40
 6d3:	c3                   	ret    

000006d4 <mknod>:
SYSCALL(mknod)
 6d4:	b8 11 00 00 00       	mov    $0x11,%eax
 6d9:	cd 40                	int    $0x40
 6db:	c3                   	ret    

000006dc <unlink>:
SYSCALL(unlink)
 6dc:	b8 12 00 00 00       	mov    $0x12,%eax
 6e1:	cd 40                	int    $0x40
 6e3:	c3                   	ret    

000006e4 <fstat>:
SYSCALL(fstat)
 6e4:	b8 08 00 00 00       	mov    $0x8,%eax
 6e9:	cd 40                	int    $0x40
 6eb:	c3                   	ret    

000006ec <link>:
SYSCALL(link)
 6ec:	b8 13 00 00 00       	mov    $0x13,%eax
 6f1:	cd 40                	int    $0x40
 6f3:	c3                   	ret    

000006f4 <mkdir>:
SYSCALL(mkdir)
 6f4:	b8 14 00 00 00       	mov    $0x14,%eax
 6f9:	cd 40                	int    $0x40
 6fb:	c3                   	ret    

000006fc <chdir>:
SYSCALL(chdir)
 6fc:	b8 09 00 00 00       	mov    $0x9,%eax
 701:	cd 40                	int    $0x40
 703:	c3                   	ret    

00000704 <dup>:
SYSCALL(dup)
 704:	b8 0a 00 00 00       	mov    $0xa,%eax
 709:	cd 40                	int    $0x40
 70b:	c3                   	ret    

0000070c <getpid>:
SYSCALL(getpid)
 70c:	b8 0b 00 00 00       	mov    $0xb,%eax
 711:	cd 40                	int    $0x40
 713:	c3                   	ret    

00000714 <sbrk>:
SYSCALL(sbrk)
 714:	b8 0c 00 00 00       	mov    $0xc,%eax
 719:	cd 40                	int    $0x40
 71b:	c3                   	ret    

0000071c <sleep>:
SYSCALL(sleep)
 71c:	b8 0d 00 00 00       	mov    $0xd,%eax
 721:	cd 40                	int    $0x40
 723:	c3                   	ret    

00000724 <uptime>:
SYSCALL(uptime)
 724:	b8 0e 00 00 00       	mov    $0xe,%eax
 729:	cd 40                	int    $0x40
 72b:	c3                   	ret    

0000072c <clone>:
SYSCALL(clone)
 72c:	b8 16 00 00 00       	mov    $0x16,%eax
 731:	cd 40                	int    $0x40
 733:	c3                   	ret    

00000734 <join>:
 734:	b8 17 00 00 00       	mov    $0x17,%eax
 739:	cd 40                	int    $0x40
 73b:	c3                   	ret    

0000073c <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 73c:	55                   	push   %ebp
 73d:	89 e5                	mov    %esp,%ebp
 73f:	83 ec 1c             	sub    $0x1c,%esp
 742:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 745:	6a 01                	push   $0x1
 747:	8d 55 f4             	lea    -0xc(%ebp),%edx
 74a:	52                   	push   %edx
 74b:	50                   	push   %eax
 74c:	e8 5b ff ff ff       	call   6ac <write>
}
 751:	83 c4 10             	add    $0x10,%esp
 754:	c9                   	leave  
 755:	c3                   	ret    

00000756 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 756:	55                   	push   %ebp
 757:	89 e5                	mov    %esp,%ebp
 759:	57                   	push   %edi
 75a:	56                   	push   %esi
 75b:	53                   	push   %ebx
 75c:	83 ec 2c             	sub    $0x2c,%esp
 75f:	89 45 d0             	mov    %eax,-0x30(%ebp)
 762:	89 d0                	mov    %edx,%eax
 764:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 766:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 76a:	0f 95 c1             	setne  %cl
 76d:	c1 ea 1f             	shr    $0x1f,%edx
 770:	84 d1                	test   %dl,%cl
 772:	74 44                	je     7b8 <printint+0x62>
    neg = 1;
    x = -xx;
 774:	f7 d8                	neg    %eax
 776:	89 c1                	mov    %eax,%ecx
    neg = 1;
 778:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 77f:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 784:	89 c8                	mov    %ecx,%eax
 786:	ba 00 00 00 00       	mov    $0x0,%edx
 78b:	f7 f6                	div    %esi
 78d:	89 df                	mov    %ebx,%edi
 78f:	83 c3 01             	add    $0x1,%ebx
 792:	0f b6 92 ec 0b 00 00 	movzbl 0xbec(%edx),%edx
 799:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 79d:	89 ca                	mov    %ecx,%edx
 79f:	89 c1                	mov    %eax,%ecx
 7a1:	39 d6                	cmp    %edx,%esi
 7a3:	76 df                	jbe    784 <printint+0x2e>
  if(neg)
 7a5:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 7a9:	74 31                	je     7dc <printint+0x86>
    buf[i++] = '-';
 7ab:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 7b0:	8d 5f 02             	lea    0x2(%edi),%ebx
 7b3:	8b 75 d0             	mov    -0x30(%ebp),%esi
 7b6:	eb 17                	jmp    7cf <printint+0x79>
    x = xx;
 7b8:	89 c1                	mov    %eax,%ecx
  neg = 0;
 7ba:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 7c1:	eb bc                	jmp    77f <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 7c3:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 7c8:	89 f0                	mov    %esi,%eax
 7ca:	e8 6d ff ff ff       	call   73c <putc>
  while(--i >= 0)
 7cf:	83 eb 01             	sub    $0x1,%ebx
 7d2:	79 ef                	jns    7c3 <printint+0x6d>
}
 7d4:	83 c4 2c             	add    $0x2c,%esp
 7d7:	5b                   	pop    %ebx
 7d8:	5e                   	pop    %esi
 7d9:	5f                   	pop    %edi
 7da:	5d                   	pop    %ebp
 7db:	c3                   	ret    
 7dc:	8b 75 d0             	mov    -0x30(%ebp),%esi
 7df:	eb ee                	jmp    7cf <printint+0x79>

000007e1 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 7e1:	55                   	push   %ebp
 7e2:	89 e5                	mov    %esp,%ebp
 7e4:	57                   	push   %edi
 7e5:	56                   	push   %esi
 7e6:	53                   	push   %ebx
 7e7:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 7ea:	8d 45 10             	lea    0x10(%ebp),%eax
 7ed:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 7f0:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 7f5:	bb 00 00 00 00       	mov    $0x0,%ebx
 7fa:	eb 14                	jmp    810 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 7fc:	89 fa                	mov    %edi,%edx
 7fe:	8b 45 08             	mov    0x8(%ebp),%eax
 801:	e8 36 ff ff ff       	call   73c <putc>
 806:	eb 05                	jmp    80d <printf+0x2c>
      }
    } else if(state == '%'){
 808:	83 fe 25             	cmp    $0x25,%esi
 80b:	74 25                	je     832 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 80d:	83 c3 01             	add    $0x1,%ebx
 810:	8b 45 0c             	mov    0xc(%ebp),%eax
 813:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 817:	84 c0                	test   %al,%al
 819:	0f 84 20 01 00 00    	je     93f <printf+0x15e>
    c = fmt[i] & 0xff;
 81f:	0f be f8             	movsbl %al,%edi
 822:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 825:	85 f6                	test   %esi,%esi
 827:	75 df                	jne    808 <printf+0x27>
      if(c == '%'){
 829:	83 f8 25             	cmp    $0x25,%eax
 82c:	75 ce                	jne    7fc <printf+0x1b>
        state = '%';
 82e:	89 c6                	mov    %eax,%esi
 830:	eb db                	jmp    80d <printf+0x2c>
      if(c == 'd'){
 832:	83 f8 25             	cmp    $0x25,%eax
 835:	0f 84 cf 00 00 00    	je     90a <printf+0x129>
 83b:	0f 8c dd 00 00 00    	jl     91e <printf+0x13d>
 841:	83 f8 78             	cmp    $0x78,%eax
 844:	0f 8f d4 00 00 00    	jg     91e <printf+0x13d>
 84a:	83 f8 63             	cmp    $0x63,%eax
 84d:	0f 8c cb 00 00 00    	jl     91e <printf+0x13d>
 853:	83 e8 63             	sub    $0x63,%eax
 856:	83 f8 15             	cmp    $0x15,%eax
 859:	0f 87 bf 00 00 00    	ja     91e <printf+0x13d>
 85f:	ff 24 85 94 0b 00 00 	jmp    *0xb94(,%eax,4)
        printint(fd, *ap, 10, 1);
 866:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 869:	8b 17                	mov    (%edi),%edx
 86b:	83 ec 0c             	sub    $0xc,%esp
 86e:	6a 01                	push   $0x1
 870:	b9 0a 00 00 00       	mov    $0xa,%ecx
 875:	8b 45 08             	mov    0x8(%ebp),%eax
 878:	e8 d9 fe ff ff       	call   756 <printint>
        ap++;
 87d:	83 c7 04             	add    $0x4,%edi
 880:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 883:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 886:	be 00 00 00 00       	mov    $0x0,%esi
 88b:	eb 80                	jmp    80d <printf+0x2c>
        printint(fd, *ap, 16, 0);
 88d:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 890:	8b 17                	mov    (%edi),%edx
 892:	83 ec 0c             	sub    $0xc,%esp
 895:	6a 00                	push   $0x0
 897:	b9 10 00 00 00       	mov    $0x10,%ecx
 89c:	8b 45 08             	mov    0x8(%ebp),%eax
 89f:	e8 b2 fe ff ff       	call   756 <printint>
        ap++;
 8a4:	83 c7 04             	add    $0x4,%edi
 8a7:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 8aa:	83 c4 10             	add    $0x10,%esp
      state = 0;
 8ad:	be 00 00 00 00       	mov    $0x0,%esi
 8b2:	e9 56 ff ff ff       	jmp    80d <printf+0x2c>
        s = (char*)*ap;
 8b7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8ba:	8b 30                	mov    (%eax),%esi
        ap++;
 8bc:	83 c0 04             	add    $0x4,%eax
 8bf:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 8c2:	85 f6                	test   %esi,%esi
 8c4:	75 15                	jne    8db <printf+0xfa>
          s = "(null)";
 8c6:	be 8d 0b 00 00       	mov    $0xb8d,%esi
 8cb:	eb 0e                	jmp    8db <printf+0xfa>
          putc(fd, *s);
 8cd:	0f be d2             	movsbl %dl,%edx
 8d0:	8b 45 08             	mov    0x8(%ebp),%eax
 8d3:	e8 64 fe ff ff       	call   73c <putc>
          s++;
 8d8:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 8db:	0f b6 16             	movzbl (%esi),%edx
 8de:	84 d2                	test   %dl,%dl
 8e0:	75 eb                	jne    8cd <printf+0xec>
      state = 0;
 8e2:	be 00 00 00 00       	mov    $0x0,%esi
 8e7:	e9 21 ff ff ff       	jmp    80d <printf+0x2c>
        putc(fd, *ap);
 8ec:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 8ef:	0f be 17             	movsbl (%edi),%edx
 8f2:	8b 45 08             	mov    0x8(%ebp),%eax
 8f5:	e8 42 fe ff ff       	call   73c <putc>
        ap++;
 8fa:	83 c7 04             	add    $0x4,%edi
 8fd:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 900:	be 00 00 00 00       	mov    $0x0,%esi
 905:	e9 03 ff ff ff       	jmp    80d <printf+0x2c>
        putc(fd, c);
 90a:	89 fa                	mov    %edi,%edx
 90c:	8b 45 08             	mov    0x8(%ebp),%eax
 90f:	e8 28 fe ff ff       	call   73c <putc>
      state = 0;
 914:	be 00 00 00 00       	mov    $0x0,%esi
 919:	e9 ef fe ff ff       	jmp    80d <printf+0x2c>
        putc(fd, '%');
 91e:	ba 25 00 00 00       	mov    $0x25,%edx
 923:	8b 45 08             	mov    0x8(%ebp),%eax
 926:	e8 11 fe ff ff       	call   73c <putc>
        putc(fd, c);
 92b:	89 fa                	mov    %edi,%edx
 92d:	8b 45 08             	mov    0x8(%ebp),%eax
 930:	e8 07 fe ff ff       	call   73c <putc>
      state = 0;
 935:	be 00 00 00 00       	mov    $0x0,%esi
 93a:	e9 ce fe ff ff       	jmp    80d <printf+0x2c>
    }
  }
}
 93f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 942:	5b                   	pop    %ebx
 943:	5e                   	pop    %esi
 944:	5f                   	pop    %edi
 945:	5d                   	pop    %ebp
 946:	c3                   	ret    

00000947 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 947:	55                   	push   %ebp
 948:	89 e5                	mov    %esp,%ebp
 94a:	57                   	push   %edi
 94b:	56                   	push   %esi
 94c:	53                   	push   %ebx
 94d:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 950:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 953:	a1 84 0f 00 00       	mov    0xf84,%eax
 958:	eb 02                	jmp    95c <free+0x15>
 95a:	89 d0                	mov    %edx,%eax
 95c:	39 c8                	cmp    %ecx,%eax
 95e:	73 04                	jae    964 <free+0x1d>
 960:	39 08                	cmp    %ecx,(%eax)
 962:	77 12                	ja     976 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 964:	8b 10                	mov    (%eax),%edx
 966:	39 c2                	cmp    %eax,%edx
 968:	77 f0                	ja     95a <free+0x13>
 96a:	39 c8                	cmp    %ecx,%eax
 96c:	72 08                	jb     976 <free+0x2f>
 96e:	39 ca                	cmp    %ecx,%edx
 970:	77 04                	ja     976 <free+0x2f>
 972:	89 d0                	mov    %edx,%eax
 974:	eb e6                	jmp    95c <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 976:	8b 73 fc             	mov    -0x4(%ebx),%esi
 979:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 97c:	8b 10                	mov    (%eax),%edx
 97e:	39 d7                	cmp    %edx,%edi
 980:	74 19                	je     99b <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 982:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 985:	8b 50 04             	mov    0x4(%eax),%edx
 988:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 98b:	39 ce                	cmp    %ecx,%esi
 98d:	74 1b                	je     9aa <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 98f:	89 08                	mov    %ecx,(%eax)
  freep = p;
 991:	a3 84 0f 00 00       	mov    %eax,0xf84
}
 996:	5b                   	pop    %ebx
 997:	5e                   	pop    %esi
 998:	5f                   	pop    %edi
 999:	5d                   	pop    %ebp
 99a:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 99b:	03 72 04             	add    0x4(%edx),%esi
 99e:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 9a1:	8b 10                	mov    (%eax),%edx
 9a3:	8b 12                	mov    (%edx),%edx
 9a5:	89 53 f8             	mov    %edx,-0x8(%ebx)
 9a8:	eb db                	jmp    985 <free+0x3e>
    p->s.size += bp->s.size;
 9aa:	03 53 fc             	add    -0x4(%ebx),%edx
 9ad:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 9b0:	8b 53 f8             	mov    -0x8(%ebx),%edx
 9b3:	89 10                	mov    %edx,(%eax)
 9b5:	eb da                	jmp    991 <free+0x4a>

000009b7 <morecore>:

static Header*
morecore(uint nu)
{
 9b7:	55                   	push   %ebp
 9b8:	89 e5                	mov    %esp,%ebp
 9ba:	53                   	push   %ebx
 9bb:	83 ec 04             	sub    $0x4,%esp
 9be:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 9c0:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 9c5:	77 05                	ja     9cc <morecore+0x15>
    nu = 4096;
 9c7:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 9cc:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 9d3:	83 ec 0c             	sub    $0xc,%esp
 9d6:	50                   	push   %eax
 9d7:	e8 38 fd ff ff       	call   714 <sbrk>
  if(p == (char*)-1)
 9dc:	83 c4 10             	add    $0x10,%esp
 9df:	83 f8 ff             	cmp    $0xffffffff,%eax
 9e2:	74 1c                	je     a00 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 9e4:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 9e7:	83 c0 08             	add    $0x8,%eax
 9ea:	83 ec 0c             	sub    $0xc,%esp
 9ed:	50                   	push   %eax
 9ee:	e8 54 ff ff ff       	call   947 <free>
  return freep;
 9f3:	a1 84 0f 00 00       	mov    0xf84,%eax
 9f8:	83 c4 10             	add    $0x10,%esp
}
 9fb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 9fe:	c9                   	leave  
 9ff:	c3                   	ret    
    return 0;
 a00:	b8 00 00 00 00       	mov    $0x0,%eax
 a05:	eb f4                	jmp    9fb <morecore+0x44>

00000a07 <malloc>:

void*
malloc(uint nbytes)
{
 a07:	55                   	push   %ebp
 a08:	89 e5                	mov    %esp,%ebp
 a0a:	53                   	push   %ebx
 a0b:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a0e:	8b 45 08             	mov    0x8(%ebp),%eax
 a11:	8d 58 07             	lea    0x7(%eax),%ebx
 a14:	c1 eb 03             	shr    $0x3,%ebx
 a17:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 a1a:	8b 0d 84 0f 00 00    	mov    0xf84,%ecx
 a20:	85 c9                	test   %ecx,%ecx
 a22:	74 04                	je     a28 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a24:	8b 01                	mov    (%ecx),%eax
 a26:	eb 4a                	jmp    a72 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 a28:	c7 05 84 0f 00 00 88 	movl   $0xf88,0xf84
 a2f:	0f 00 00 
 a32:	c7 05 88 0f 00 00 88 	movl   $0xf88,0xf88
 a39:	0f 00 00 
    base.s.size = 0;
 a3c:	c7 05 8c 0f 00 00 00 	movl   $0x0,0xf8c
 a43:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 a46:	b9 88 0f 00 00       	mov    $0xf88,%ecx
 a4b:	eb d7                	jmp    a24 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 a4d:	74 19                	je     a68 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 a4f:	29 da                	sub    %ebx,%edx
 a51:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 a54:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 a57:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 a5a:	89 0d 84 0f 00 00    	mov    %ecx,0xf84
      return (void*)(p + 1);
 a60:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 a63:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 a66:	c9                   	leave  
 a67:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 a68:	8b 10                	mov    (%eax),%edx
 a6a:	89 11                	mov    %edx,(%ecx)
 a6c:	eb ec                	jmp    a5a <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a6e:	89 c1                	mov    %eax,%ecx
 a70:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 a72:	8b 50 04             	mov    0x4(%eax),%edx
 a75:	39 da                	cmp    %ebx,%edx
 a77:	73 d4                	jae    a4d <malloc+0x46>
    if(p == freep)
 a79:	39 05 84 0f 00 00    	cmp    %eax,0xf84
 a7f:	75 ed                	jne    a6e <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 a81:	89 d8                	mov    %ebx,%eax
 a83:	e8 2f ff ff ff       	call   9b7 <morecore>
 a88:	85 c0                	test   %eax,%eax
 a8a:	75 e2                	jne    a6e <malloc+0x67>
 a8c:	eb d5                	jmp    a63 <malloc+0x5c>
