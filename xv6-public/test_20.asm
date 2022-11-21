
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
   6:	68 40 0e 00 00       	push   $0xe40
   b:	e8 cc 03 00 00       	call   3dc <lock_acquire>
   assert((unsigned int)sbrk(0) == size);
  10:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  17:	e8 25 06 00 00       	call   641 <sbrk>
  1c:	83 c4 10             	add    $0x10,%esp
  1f:	3b 05 44 0e 00 00    	cmp    0xe44,%eax
  25:	74 49                	je     70 <worker2+0x70>
  27:	6a 31                	push   $0x31
  29:	68 bc 09 00 00       	push   $0x9bc
  2e:	68 c6 09 00 00       	push   $0x9c6
  33:	6a 01                	push   $0x1
  35:	e8 d4 06 00 00       	call   70e <printf>
  3a:	83 c4 0c             	add    $0xc,%esp
  3d:	68 ce 09 00 00       	push   $0x9ce
  42:	68 ec 09 00 00       	push   $0x9ec
  47:	6a 01                	push   $0x1
  49:	e8 c0 06 00 00       	call   70e <printf>
  4e:	83 c4 08             	add    $0x8,%esp
  51:	68 00 0a 00 00       	push   $0xa00
  56:	6a 01                	push   $0x1
  58:	e8 b1 06 00 00       	call   70e <printf>
  5d:	83 c4 04             	add    $0x4,%esp
  60:	ff 35 4c 0e 00 00    	push   0xe4c
  66:	e8 7e 05 00 00       	call   5e9 <kill>
  6b:	e8 49 05 00 00       	call   5b9 <exit>
   global++;
  70:	83 05 48 0e 00 00 01 	addl   $0x1,0xe48
   lock_release(&lock);
  77:	83 ec 0c             	sub    $0xc,%esp
  7a:	68 40 0e 00 00       	push   $0xe40
  7f:	e8 7a 03 00 00       	call   3fe <lock_release>

   
   lock_acquire(&lock2);
  84:	c7 04 24 3c 0e 00 00 	movl   $0xe3c,(%esp)
  8b:	e8 4c 03 00 00       	call   3dc <lock_acquire>
   assert((unsigned int)sbrk(0) == size);
  90:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  97:	e8 a5 05 00 00       	call   641 <sbrk>
  9c:	83 c4 10             	add    $0x10,%esp
  9f:	3b 05 44 0e 00 00    	cmp    0xe44,%eax
  a5:	74 49                	je     f0 <worker2+0xf0>
  a7:	6a 37                	push   $0x37
  a9:	68 bc 09 00 00       	push   $0x9bc
  ae:	68 c6 09 00 00       	push   $0x9c6
  b3:	6a 01                	push   $0x1
  b5:	e8 54 06 00 00       	call   70e <printf>
  ba:	83 c4 0c             	add    $0xc,%esp
  bd:	68 ce 09 00 00       	push   $0x9ce
  c2:	68 ec 09 00 00       	push   $0x9ec
  c7:	6a 01                	push   $0x1
  c9:	e8 40 06 00 00       	call   70e <printf>
  ce:	83 c4 08             	add    $0x8,%esp
  d1:	68 00 0a 00 00       	push   $0xa00
  d6:	6a 01                	push   $0x1
  d8:	e8 31 06 00 00       	call   70e <printf>
  dd:	83 c4 04             	add    $0x4,%esp
  e0:	ff 35 4c 0e 00 00    	push   0xe4c
  e6:	e8 fe 04 00 00       	call   5e9 <kill>
  eb:	e8 c9 04 00 00       	call   5b9 <exit>
   global++;
  f0:	83 05 48 0e 00 00 01 	addl   $0x1,0xe48
   lock_release(&lock2);
  f7:	83 ec 0c             	sub    $0xc,%esp
  fa:	68 3c 0e 00 00       	push   $0xe3c
  ff:	e8 fa 02 00 00       	call   3fe <lock_release>

   
   exit();
 104:	e8 b0 04 00 00       	call   5b9 <exit>

00000109 <worker>:
}


void worker(void *arg1, void *arg2) {
 109:	55                   	push   %ebp
 10a:	89 e5                	mov    %esp,%ebp
 10c:	83 ec 14             	sub    $0x14,%esp
   lock_init(&lock);
 10f:	68 40 0e 00 00       	push   $0xe40
 114:	e8 f3 02 00 00       	call   40c <lock_init>
   lock_init(&lock2);
 119:	c7 04 24 3c 0e 00 00 	movl   $0xe3c,(%esp)
 120:	e8 e7 02 00 00       	call   40c <lock_init>
   lock_acquire(&lock);
 125:	c7 04 24 40 0e 00 00 	movl   $0xe40,(%esp)
 12c:	e8 ab 02 00 00       	call   3dc <lock_acquire>
   lock_acquire(&lock2);
 131:	c7 04 24 3c 0e 00 00 	movl   $0xe3c,(%esp)
 138:	e8 9f 02 00 00       	call   3dc <lock_acquire>

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
 15a:	e8 e2 04 00 00       	call   641 <sbrk>
 15f:	a3 44 0e 00 00       	mov    %eax,0xe44

   while (global < num_threads) {
 164:	83 c4 10             	add    $0x10,%esp
 167:	eb 71                	jmp    1da <worker+0xd1>
    assert(nested_thread_id > 0);
 169:	6a 47                	push   $0x47
 16b:	68 bc 09 00 00       	push   $0x9bc
 170:	68 c6 09 00 00       	push   $0x9c6
 175:	6a 01                	push   $0x1
 177:	e8 92 05 00 00       	call   70e <printf>
 17c:	83 c4 0c             	add    $0xc,%esp
 17f:	68 0d 0a 00 00       	push   $0xa0d
 184:	68 ec 09 00 00       	push   $0x9ec
 189:	6a 01                	push   $0x1
 18b:	e8 7e 05 00 00       	call   70e <printf>
 190:	83 c4 08             	add    $0x8,%esp
 193:	68 00 0a 00 00       	push   $0xa00
 198:	6a 01                	push   $0x1
 19a:	e8 6f 05 00 00       	call   70e <printf>
 19f:	83 c4 04             	add    $0x4,%esp
 1a2:	ff 35 4c 0e 00 00    	push   0xe4c
 1a8:	e8 3c 04 00 00       	call   5e9 <kill>
 1ad:	e8 07 04 00 00       	call   5b9 <exit>
      lock_release(&lock);
 1b2:	83 ec 0c             	sub    $0xc,%esp
 1b5:	68 40 0e 00 00       	push   $0xe40
 1ba:	e8 3f 02 00 00       	call   3fe <lock_release>
      sleep(100);
 1bf:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 1c6:	e8 7e 04 00 00       	call   649 <sleep>
      lock_acquire(&lock);
 1cb:	c7 04 24 40 0e 00 00 	movl   $0xe40,(%esp)
 1d2:	e8 05 02 00 00       	call   3dc <lock_acquire>
 1d7:	83 c4 10             	add    $0x10,%esp
   while (global < num_threads) {
 1da:	a1 38 0e 00 00       	mov    0xe38,%eax
 1df:	39 05 48 0e 00 00    	cmp    %eax,0xe48
 1e5:	7c cb                	jl     1b2 <worker+0xa9>
   }

   global = 0;
 1e7:	c7 05 48 0e 00 00 00 	movl   $0x0,0xe48
 1ee:	00 00 00 
   sbrk(10000);
 1f1:	83 ec 0c             	sub    $0xc,%esp
 1f4:	68 10 27 00 00       	push   $0x2710
 1f9:	e8 43 04 00 00       	call   641 <sbrk>
   size = (unsigned int)sbrk(0);
 1fe:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 205:	e8 37 04 00 00       	call   641 <sbrk>
 20a:	a3 44 0e 00 00       	mov    %eax,0xe44
   lock_release(&lock);
 20f:	c7 04 24 40 0e 00 00 	movl   $0xe40,(%esp)
 216:	e8 e3 01 00 00       	call   3fe <lock_release>

   while (global < num_threads) {
 21b:	83 c4 10             	add    $0x10,%esp
 21e:	eb 28                	jmp    248 <worker+0x13f>
      lock_release(&lock2);
 220:	83 ec 0c             	sub    $0xc,%esp
 223:	68 3c 0e 00 00       	push   $0xe3c
 228:	e8 d1 01 00 00       	call   3fe <lock_release>
      sleep(100);
 22d:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 234:	e8 10 04 00 00       	call   649 <sleep>
      lock_acquire(&lock2);
 239:	c7 04 24 3c 0e 00 00 	movl   $0xe3c,(%esp)
 240:	e8 97 01 00 00       	call   3dc <lock_acquire>
 245:	83 c4 10             	add    $0x10,%esp
   while (global < num_threads) {
 248:	a1 38 0e 00 00       	mov    0xe38,%eax
 24d:	39 05 48 0e 00 00    	cmp    %eax,0xe48
 253:	7c cb                	jl     220 <worker+0x117>
   }
   lock_release(&lock2);
 255:	83 ec 0c             	sub    $0xc,%esp
 258:	68 3c 0e 00 00       	push   $0xe3c
 25d:	e8 9c 01 00 00       	call   3fe <lock_release>

   int nested_join_pid = thread_join();
 262:	e8 6f 01 00 00       	call   3d6 <thread_join>
   assert(nested_join_pid > 0);
 267:	83 c4 10             	add    $0x10,%esp
 26a:	85 c0                	test   %eax,%eax
 26c:	7e 05                	jle    273 <worker+0x16a>




   exit();
 26e:	e8 46 03 00 00       	call   5b9 <exit>
   assert(nested_join_pid > 0);
 273:	6a 5d                	push   $0x5d
 275:	68 bc 09 00 00       	push   $0x9bc
 27a:	68 c6 09 00 00       	push   $0x9c6
 27f:	6a 01                	push   $0x1
 281:	e8 88 04 00 00       	call   70e <printf>
 286:	83 c4 0c             	add    $0xc,%esp
 289:	68 22 0a 00 00       	push   $0xa22
 28e:	68 ec 09 00 00       	push   $0x9ec
 293:	6a 01                	push   $0x1
 295:	e8 74 04 00 00       	call   70e <printf>
 29a:	83 c4 08             	add    $0x8,%esp
 29d:	68 00 0a 00 00       	push   $0xa00
 2a2:	6a 01                	push   $0x1
 2a4:	e8 65 04 00 00       	call   70e <printf>
 2a9:	83 c4 04             	add    $0x4,%esp
 2ac:	ff 35 4c 0e 00 00    	push   0xe4c
 2b2:	e8 32 03 00 00       	call   5e9 <kill>
 2b7:	e8 fd 02 00 00       	call   5b9 <exit>

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
 2cd:	e8 67 03 00 00       	call   639 <getpid>
 2d2:	a3 4c 0e 00 00       	mov    %eax,0xe4c
   int arg1 = 11, arg2 = 22;
 2d7:	c7 45 f4 0b 00 00 00 	movl   $0xb,-0xc(%ebp)
 2de:	c7 45 f0 16 00 00 00 	movl   $0x16,-0x10(%ebp)
   size = (unsigned int)sbrk(0);
 2e5:	83 ec 0c             	sub    $0xc,%esp
 2e8:	6a 00                	push   $0x0
 2ea:	e8 52 03 00 00       	call   641 <sbrk>
 2ef:	a3 44 0e 00 00       	mov    %eax,0xe44
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
 310:	e8 c1 00 00 00       	call   3d6 <thread_join>
   assert(join_pid > 0);
 315:	85 c0                	test   %eax,%eax
 317:	7e 5d                	jle    376 <main+0xba>
   printf(1, "TEST PASSED\n");
 319:	83 ec 08             	sub    $0x8,%esp
 31c:	68 45 0a 00 00       	push   $0xa45
 321:	6a 01                	push   $0x1
 323:	e8 e6 03 00 00       	call   70e <printf>
   exit();
 328:	e8 8c 02 00 00       	call   5b9 <exit>
   assert(thread_pid > 0);
 32d:	6a 24                	push   $0x24
 32f:	68 bc 09 00 00       	push   $0x9bc
 334:	68 c6 09 00 00       	push   $0x9c6
 339:	6a 01                	push   $0x1
 33b:	e8 ce 03 00 00       	call   70e <printf>
 340:	83 c4 0c             	add    $0xc,%esp
 343:	68 36 0a 00 00       	push   $0xa36
 348:	68 ec 09 00 00       	push   $0x9ec
 34d:	6a 01                	push   $0x1
 34f:	e8 ba 03 00 00       	call   70e <printf>
 354:	83 c4 08             	add    $0x8,%esp
 357:	68 00 0a 00 00       	push   $0xa00
 35c:	6a 01                	push   $0x1
 35e:	e8 ab 03 00 00       	call   70e <printf>
 363:	83 c4 04             	add    $0x4,%esp
 366:	ff 35 4c 0e 00 00    	push   0xe4c
 36c:	e8 78 02 00 00       	call   5e9 <kill>
 371:	e8 43 02 00 00       	call   5b9 <exit>
   assert(join_pid > 0);
 376:	6a 27                	push   $0x27
 378:	68 bc 09 00 00       	push   $0x9bc
 37d:	68 c6 09 00 00       	push   $0x9c6
 382:	6a 01                	push   $0x1
 384:	e8 85 03 00 00       	call   70e <printf>
 389:	83 c4 0c             	add    $0xc,%esp
 38c:	68 29 0a 00 00       	push   $0xa29
 391:	68 ec 09 00 00       	push   $0x9ec
 396:	6a 01                	push   $0x1
 398:	e8 71 03 00 00       	call   70e <printf>
 39d:	83 c4 08             	add    $0x8,%esp
 3a0:	68 00 0a 00 00       	push   $0xa00
 3a5:	6a 01                	push   $0x1
 3a7:	e8 62 03 00 00       	call   70e <printf>
 3ac:	83 c4 04             	add    $0x4,%esp
 3af:	ff 35 4c 0e 00 00    	push   0xe4c
 3b5:	e8 2f 02 00 00       	call   5e9 <kill>
 3ba:	e8 fa 01 00 00       	call   5b9 <exit>

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

  // I can't remember if there was something else to do here but I'm sure I'll find out


  return new_pid;
}
 3d0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 3d5:	c3                   	ret    

000003d6 <thread_join>:

int thread_join() {
  return 0;
}
 3d6:	b8 00 00 00 00       	mov    $0x0,%eax
 3db:	c3                   	ret    

000003dc <lock_acquire>:

void lock_acquire(lock_t *lock){
 3dc:	55                   	push   %ebp
 3dd:	89 e5                	mov    %esp,%ebp
 3df:	53                   	push   %ebx
 3e0:	83 ec 04             	sub    $0x4,%esp
 3e3:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 3e6:	83 ec 08             	sub    $0x8,%esp
 3e9:	6a 01                	push   $0x1
 3eb:	53                   	push   %ebx
 3ec:	e8 ce ff ff ff       	call   3bf <test_and_set>
 3f1:	83 c4 10             	add    $0x10,%esp
 3f4:	83 f8 01             	cmp    $0x1,%eax
 3f7:	74 ed                	je     3e6 <lock_acquire+0xa>
    ;
}
 3f9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3fc:	c9                   	leave  
 3fd:	c3                   	ret    

000003fe <lock_release>:

void lock_release(lock_t *lock) {
 3fe:	55                   	push   %ebp
 3ff:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 401:	8b 45 08             	mov    0x8(%ebp),%eax
 404:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 40a:	5d                   	pop    %ebp
 40b:	c3                   	ret    

0000040c <lock_init>:

void lock_init(lock_t *lock) {
 40c:	55                   	push   %ebp
 40d:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 40f:	8b 45 08             	mov    0x8(%ebp),%eax
 412:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 418:	5d                   	pop    %ebp
 419:	c3                   	ret    

0000041a <strcpy>:

char*
strcpy(char *s, const char *t)
{
 41a:	55                   	push   %ebp
 41b:	89 e5                	mov    %esp,%ebp
 41d:	56                   	push   %esi
 41e:	53                   	push   %ebx
 41f:	8b 75 08             	mov    0x8(%ebp),%esi
 422:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 425:	89 f0                	mov    %esi,%eax
 427:	89 d1                	mov    %edx,%ecx
 429:	83 c2 01             	add    $0x1,%edx
 42c:	89 c3                	mov    %eax,%ebx
 42e:	83 c0 01             	add    $0x1,%eax
 431:	0f b6 09             	movzbl (%ecx),%ecx
 434:	88 0b                	mov    %cl,(%ebx)
 436:	84 c9                	test   %cl,%cl
 438:	75 ed                	jne    427 <strcpy+0xd>
    ;
  return os;
}
 43a:	89 f0                	mov    %esi,%eax
 43c:	5b                   	pop    %ebx
 43d:	5e                   	pop    %esi
 43e:	5d                   	pop    %ebp
 43f:	c3                   	ret    

00000440 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 440:	55                   	push   %ebp
 441:	89 e5                	mov    %esp,%ebp
 443:	8b 4d 08             	mov    0x8(%ebp),%ecx
 446:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 449:	eb 06                	jmp    451 <strcmp+0x11>
    p++, q++;
 44b:	83 c1 01             	add    $0x1,%ecx
 44e:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 451:	0f b6 01             	movzbl (%ecx),%eax
 454:	84 c0                	test   %al,%al
 456:	74 04                	je     45c <strcmp+0x1c>
 458:	3a 02                	cmp    (%edx),%al
 45a:	74 ef                	je     44b <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 45c:	0f b6 c0             	movzbl %al,%eax
 45f:	0f b6 12             	movzbl (%edx),%edx
 462:	29 d0                	sub    %edx,%eax
}
 464:	5d                   	pop    %ebp
 465:	c3                   	ret    

00000466 <strlen>:

uint
strlen(const char *s)
{
 466:	55                   	push   %ebp
 467:	89 e5                	mov    %esp,%ebp
 469:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 46c:	b8 00 00 00 00       	mov    $0x0,%eax
 471:	eb 03                	jmp    476 <strlen+0x10>
 473:	83 c0 01             	add    $0x1,%eax
 476:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 47a:	75 f7                	jne    473 <strlen+0xd>
    ;
  return n;
}
 47c:	5d                   	pop    %ebp
 47d:	c3                   	ret    

0000047e <memset>:

void*
memset(void *dst, int c, uint n)
{
 47e:	55                   	push   %ebp
 47f:	89 e5                	mov    %esp,%ebp
 481:	57                   	push   %edi
 482:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 485:	89 d7                	mov    %edx,%edi
 487:	8b 4d 10             	mov    0x10(%ebp),%ecx
 48a:	8b 45 0c             	mov    0xc(%ebp),%eax
 48d:	fc                   	cld    
 48e:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 490:	89 d0                	mov    %edx,%eax
 492:	8b 7d fc             	mov    -0x4(%ebp),%edi
 495:	c9                   	leave  
 496:	c3                   	ret    

00000497 <strchr>:

char*
strchr(const char *s, char c)
{
 497:	55                   	push   %ebp
 498:	89 e5                	mov    %esp,%ebp
 49a:	8b 45 08             	mov    0x8(%ebp),%eax
 49d:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 4a1:	eb 03                	jmp    4a6 <strchr+0xf>
 4a3:	83 c0 01             	add    $0x1,%eax
 4a6:	0f b6 10             	movzbl (%eax),%edx
 4a9:	84 d2                	test   %dl,%dl
 4ab:	74 06                	je     4b3 <strchr+0x1c>
    if(*s == c)
 4ad:	38 ca                	cmp    %cl,%dl
 4af:	75 f2                	jne    4a3 <strchr+0xc>
 4b1:	eb 05                	jmp    4b8 <strchr+0x21>
      return (char*)s;
  return 0;
 4b3:	b8 00 00 00 00       	mov    $0x0,%eax
}
 4b8:	5d                   	pop    %ebp
 4b9:	c3                   	ret    

000004ba <gets>:

char*
gets(char *buf, int max)
{
 4ba:	55                   	push   %ebp
 4bb:	89 e5                	mov    %esp,%ebp
 4bd:	57                   	push   %edi
 4be:	56                   	push   %esi
 4bf:	53                   	push   %ebx
 4c0:	83 ec 1c             	sub    $0x1c,%esp
 4c3:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 4c6:	bb 00 00 00 00       	mov    $0x0,%ebx
 4cb:	89 de                	mov    %ebx,%esi
 4cd:	83 c3 01             	add    $0x1,%ebx
 4d0:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 4d3:	7d 2e                	jge    503 <gets+0x49>
    cc = read(0, &c, 1);
 4d5:	83 ec 04             	sub    $0x4,%esp
 4d8:	6a 01                	push   $0x1
 4da:	8d 45 e7             	lea    -0x19(%ebp),%eax
 4dd:	50                   	push   %eax
 4de:	6a 00                	push   $0x0
 4e0:	e8 ec 00 00 00       	call   5d1 <read>
    if(cc < 1)
 4e5:	83 c4 10             	add    $0x10,%esp
 4e8:	85 c0                	test   %eax,%eax
 4ea:	7e 17                	jle    503 <gets+0x49>
      break;
    buf[i++] = c;
 4ec:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 4f0:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 4f3:	3c 0a                	cmp    $0xa,%al
 4f5:	0f 94 c2             	sete   %dl
 4f8:	3c 0d                	cmp    $0xd,%al
 4fa:	0f 94 c0             	sete   %al
 4fd:	08 c2                	or     %al,%dl
 4ff:	74 ca                	je     4cb <gets+0x11>
    buf[i++] = c;
 501:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 503:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 507:	89 f8                	mov    %edi,%eax
 509:	8d 65 f4             	lea    -0xc(%ebp),%esp
 50c:	5b                   	pop    %ebx
 50d:	5e                   	pop    %esi
 50e:	5f                   	pop    %edi
 50f:	5d                   	pop    %ebp
 510:	c3                   	ret    

00000511 <stat>:

int
stat(const char *n, struct stat *st)
{
 511:	55                   	push   %ebp
 512:	89 e5                	mov    %esp,%ebp
 514:	56                   	push   %esi
 515:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 516:	83 ec 08             	sub    $0x8,%esp
 519:	6a 00                	push   $0x0
 51b:	ff 75 08             	push   0x8(%ebp)
 51e:	e8 d6 00 00 00       	call   5f9 <open>
  if(fd < 0)
 523:	83 c4 10             	add    $0x10,%esp
 526:	85 c0                	test   %eax,%eax
 528:	78 24                	js     54e <stat+0x3d>
 52a:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 52c:	83 ec 08             	sub    $0x8,%esp
 52f:	ff 75 0c             	push   0xc(%ebp)
 532:	50                   	push   %eax
 533:	e8 d9 00 00 00       	call   611 <fstat>
 538:	89 c6                	mov    %eax,%esi
  close(fd);
 53a:	89 1c 24             	mov    %ebx,(%esp)
 53d:	e8 9f 00 00 00       	call   5e1 <close>
  return r;
 542:	83 c4 10             	add    $0x10,%esp
}
 545:	89 f0                	mov    %esi,%eax
 547:	8d 65 f8             	lea    -0x8(%ebp),%esp
 54a:	5b                   	pop    %ebx
 54b:	5e                   	pop    %esi
 54c:	5d                   	pop    %ebp
 54d:	c3                   	ret    
    return -1;
 54e:	be ff ff ff ff       	mov    $0xffffffff,%esi
 553:	eb f0                	jmp    545 <stat+0x34>

00000555 <atoi>:

int
atoi(const char *s)
{
 555:	55                   	push   %ebp
 556:	89 e5                	mov    %esp,%ebp
 558:	53                   	push   %ebx
 559:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 55c:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 561:	eb 10                	jmp    573 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 563:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 566:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 569:	83 c1 01             	add    $0x1,%ecx
 56c:	0f be c0             	movsbl %al,%eax
 56f:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 573:	0f b6 01             	movzbl (%ecx),%eax
 576:	8d 58 d0             	lea    -0x30(%eax),%ebx
 579:	80 fb 09             	cmp    $0x9,%bl
 57c:	76 e5                	jbe    563 <atoi+0xe>
  return n;
}
 57e:	89 d0                	mov    %edx,%eax
 580:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 583:	c9                   	leave  
 584:	c3                   	ret    

00000585 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 585:	55                   	push   %ebp
 586:	89 e5                	mov    %esp,%ebp
 588:	56                   	push   %esi
 589:	53                   	push   %ebx
 58a:	8b 75 08             	mov    0x8(%ebp),%esi
 58d:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 590:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 593:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 595:	eb 0d                	jmp    5a4 <memmove+0x1f>
    *dst++ = *src++;
 597:	0f b6 01             	movzbl (%ecx),%eax
 59a:	88 02                	mov    %al,(%edx)
 59c:	8d 49 01             	lea    0x1(%ecx),%ecx
 59f:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 5a2:	89 d8                	mov    %ebx,%eax
 5a4:	8d 58 ff             	lea    -0x1(%eax),%ebx
 5a7:	85 c0                	test   %eax,%eax
 5a9:	7f ec                	jg     597 <memmove+0x12>
  return vdst;
}
 5ab:	89 f0                	mov    %esi,%eax
 5ad:	5b                   	pop    %ebx
 5ae:	5e                   	pop    %esi
 5af:	5d                   	pop    %ebp
 5b0:	c3                   	ret    

000005b1 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 5b1:	b8 01 00 00 00       	mov    $0x1,%eax
 5b6:	cd 40                	int    $0x40
 5b8:	c3                   	ret    

000005b9 <exit>:
SYSCALL(exit)
 5b9:	b8 02 00 00 00       	mov    $0x2,%eax
 5be:	cd 40                	int    $0x40
 5c0:	c3                   	ret    

000005c1 <wait>:
SYSCALL(wait)
 5c1:	b8 03 00 00 00       	mov    $0x3,%eax
 5c6:	cd 40                	int    $0x40
 5c8:	c3                   	ret    

000005c9 <pipe>:
SYSCALL(pipe)
 5c9:	b8 04 00 00 00       	mov    $0x4,%eax
 5ce:	cd 40                	int    $0x40
 5d0:	c3                   	ret    

000005d1 <read>:
SYSCALL(read)
 5d1:	b8 05 00 00 00       	mov    $0x5,%eax
 5d6:	cd 40                	int    $0x40
 5d8:	c3                   	ret    

000005d9 <write>:
SYSCALL(write)
 5d9:	b8 10 00 00 00       	mov    $0x10,%eax
 5de:	cd 40                	int    $0x40
 5e0:	c3                   	ret    

000005e1 <close>:
SYSCALL(close)
 5e1:	b8 15 00 00 00       	mov    $0x15,%eax
 5e6:	cd 40                	int    $0x40
 5e8:	c3                   	ret    

000005e9 <kill>:
SYSCALL(kill)
 5e9:	b8 06 00 00 00       	mov    $0x6,%eax
 5ee:	cd 40                	int    $0x40
 5f0:	c3                   	ret    

000005f1 <exec>:
SYSCALL(exec)
 5f1:	b8 07 00 00 00       	mov    $0x7,%eax
 5f6:	cd 40                	int    $0x40
 5f8:	c3                   	ret    

000005f9 <open>:
SYSCALL(open)
 5f9:	b8 0f 00 00 00       	mov    $0xf,%eax
 5fe:	cd 40                	int    $0x40
 600:	c3                   	ret    

00000601 <mknod>:
SYSCALL(mknod)
 601:	b8 11 00 00 00       	mov    $0x11,%eax
 606:	cd 40                	int    $0x40
 608:	c3                   	ret    

00000609 <unlink>:
SYSCALL(unlink)
 609:	b8 12 00 00 00       	mov    $0x12,%eax
 60e:	cd 40                	int    $0x40
 610:	c3                   	ret    

00000611 <fstat>:
SYSCALL(fstat)
 611:	b8 08 00 00 00       	mov    $0x8,%eax
 616:	cd 40                	int    $0x40
 618:	c3                   	ret    

00000619 <link>:
SYSCALL(link)
 619:	b8 13 00 00 00       	mov    $0x13,%eax
 61e:	cd 40                	int    $0x40
 620:	c3                   	ret    

00000621 <mkdir>:
SYSCALL(mkdir)
 621:	b8 14 00 00 00       	mov    $0x14,%eax
 626:	cd 40                	int    $0x40
 628:	c3                   	ret    

00000629 <chdir>:
SYSCALL(chdir)
 629:	b8 09 00 00 00       	mov    $0x9,%eax
 62e:	cd 40                	int    $0x40
 630:	c3                   	ret    

00000631 <dup>:
SYSCALL(dup)
 631:	b8 0a 00 00 00       	mov    $0xa,%eax
 636:	cd 40                	int    $0x40
 638:	c3                   	ret    

00000639 <getpid>:
SYSCALL(getpid)
 639:	b8 0b 00 00 00       	mov    $0xb,%eax
 63e:	cd 40                	int    $0x40
 640:	c3                   	ret    

00000641 <sbrk>:
SYSCALL(sbrk)
 641:	b8 0c 00 00 00       	mov    $0xc,%eax
 646:	cd 40                	int    $0x40
 648:	c3                   	ret    

00000649 <sleep>:
SYSCALL(sleep)
 649:	b8 0d 00 00 00       	mov    $0xd,%eax
 64e:	cd 40                	int    $0x40
 650:	c3                   	ret    

00000651 <uptime>:
SYSCALL(uptime)
 651:	b8 0e 00 00 00       	mov    $0xe,%eax
 656:	cd 40                	int    $0x40
 658:	c3                   	ret    

00000659 <clone>:
SYSCALL(clone)
 659:	b8 16 00 00 00       	mov    $0x16,%eax
 65e:	cd 40                	int    $0x40
 660:	c3                   	ret    

00000661 <join>:
 661:	b8 17 00 00 00       	mov    $0x17,%eax
 666:	cd 40                	int    $0x40
 668:	c3                   	ret    

00000669 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 669:	55                   	push   %ebp
 66a:	89 e5                	mov    %esp,%ebp
 66c:	83 ec 1c             	sub    $0x1c,%esp
 66f:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 672:	6a 01                	push   $0x1
 674:	8d 55 f4             	lea    -0xc(%ebp),%edx
 677:	52                   	push   %edx
 678:	50                   	push   %eax
 679:	e8 5b ff ff ff       	call   5d9 <write>
}
 67e:	83 c4 10             	add    $0x10,%esp
 681:	c9                   	leave  
 682:	c3                   	ret    

00000683 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 683:	55                   	push   %ebp
 684:	89 e5                	mov    %esp,%ebp
 686:	57                   	push   %edi
 687:	56                   	push   %esi
 688:	53                   	push   %ebx
 689:	83 ec 2c             	sub    $0x2c,%esp
 68c:	89 45 d0             	mov    %eax,-0x30(%ebp)
 68f:	89 d0                	mov    %edx,%eax
 691:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 693:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 697:	0f 95 c1             	setne  %cl
 69a:	c1 ea 1f             	shr    $0x1f,%edx
 69d:	84 d1                	test   %dl,%cl
 69f:	74 44                	je     6e5 <printint+0x62>
    neg = 1;
    x = -xx;
 6a1:	f7 d8                	neg    %eax
 6a3:	89 c1                	mov    %eax,%ecx
    neg = 1;
 6a5:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 6ac:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 6b1:	89 c8                	mov    %ecx,%eax
 6b3:	ba 00 00 00 00       	mov    $0x0,%edx
 6b8:	f7 f6                	div    %esi
 6ba:	89 df                	mov    %ebx,%edi
 6bc:	83 c3 01             	add    $0x1,%ebx
 6bf:	0f b6 92 b4 0a 00 00 	movzbl 0xab4(%edx),%edx
 6c6:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 6ca:	89 ca                	mov    %ecx,%edx
 6cc:	89 c1                	mov    %eax,%ecx
 6ce:	39 d6                	cmp    %edx,%esi
 6d0:	76 df                	jbe    6b1 <printint+0x2e>
  if(neg)
 6d2:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 6d6:	74 31                	je     709 <printint+0x86>
    buf[i++] = '-';
 6d8:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 6dd:	8d 5f 02             	lea    0x2(%edi),%ebx
 6e0:	8b 75 d0             	mov    -0x30(%ebp),%esi
 6e3:	eb 17                	jmp    6fc <printint+0x79>
    x = xx;
 6e5:	89 c1                	mov    %eax,%ecx
  neg = 0;
 6e7:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 6ee:	eb bc                	jmp    6ac <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 6f0:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 6f5:	89 f0                	mov    %esi,%eax
 6f7:	e8 6d ff ff ff       	call   669 <putc>
  while(--i >= 0)
 6fc:	83 eb 01             	sub    $0x1,%ebx
 6ff:	79 ef                	jns    6f0 <printint+0x6d>
}
 701:	83 c4 2c             	add    $0x2c,%esp
 704:	5b                   	pop    %ebx
 705:	5e                   	pop    %esi
 706:	5f                   	pop    %edi
 707:	5d                   	pop    %ebp
 708:	c3                   	ret    
 709:	8b 75 d0             	mov    -0x30(%ebp),%esi
 70c:	eb ee                	jmp    6fc <printint+0x79>

0000070e <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 70e:	55                   	push   %ebp
 70f:	89 e5                	mov    %esp,%ebp
 711:	57                   	push   %edi
 712:	56                   	push   %esi
 713:	53                   	push   %ebx
 714:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 717:	8d 45 10             	lea    0x10(%ebp),%eax
 71a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 71d:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 722:	bb 00 00 00 00       	mov    $0x0,%ebx
 727:	eb 14                	jmp    73d <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 729:	89 fa                	mov    %edi,%edx
 72b:	8b 45 08             	mov    0x8(%ebp),%eax
 72e:	e8 36 ff ff ff       	call   669 <putc>
 733:	eb 05                	jmp    73a <printf+0x2c>
      }
    } else if(state == '%'){
 735:	83 fe 25             	cmp    $0x25,%esi
 738:	74 25                	je     75f <printf+0x51>
  for(i = 0; fmt[i]; i++){
 73a:	83 c3 01             	add    $0x1,%ebx
 73d:	8b 45 0c             	mov    0xc(%ebp),%eax
 740:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 744:	84 c0                	test   %al,%al
 746:	0f 84 20 01 00 00    	je     86c <printf+0x15e>
    c = fmt[i] & 0xff;
 74c:	0f be f8             	movsbl %al,%edi
 74f:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 752:	85 f6                	test   %esi,%esi
 754:	75 df                	jne    735 <printf+0x27>
      if(c == '%'){
 756:	83 f8 25             	cmp    $0x25,%eax
 759:	75 ce                	jne    729 <printf+0x1b>
        state = '%';
 75b:	89 c6                	mov    %eax,%esi
 75d:	eb db                	jmp    73a <printf+0x2c>
      if(c == 'd'){
 75f:	83 f8 25             	cmp    $0x25,%eax
 762:	0f 84 cf 00 00 00    	je     837 <printf+0x129>
 768:	0f 8c dd 00 00 00    	jl     84b <printf+0x13d>
 76e:	83 f8 78             	cmp    $0x78,%eax
 771:	0f 8f d4 00 00 00    	jg     84b <printf+0x13d>
 777:	83 f8 63             	cmp    $0x63,%eax
 77a:	0f 8c cb 00 00 00    	jl     84b <printf+0x13d>
 780:	83 e8 63             	sub    $0x63,%eax
 783:	83 f8 15             	cmp    $0x15,%eax
 786:	0f 87 bf 00 00 00    	ja     84b <printf+0x13d>
 78c:	ff 24 85 5c 0a 00 00 	jmp    *0xa5c(,%eax,4)
        printint(fd, *ap, 10, 1);
 793:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 796:	8b 17                	mov    (%edi),%edx
 798:	83 ec 0c             	sub    $0xc,%esp
 79b:	6a 01                	push   $0x1
 79d:	b9 0a 00 00 00       	mov    $0xa,%ecx
 7a2:	8b 45 08             	mov    0x8(%ebp),%eax
 7a5:	e8 d9 fe ff ff       	call   683 <printint>
        ap++;
 7aa:	83 c7 04             	add    $0x4,%edi
 7ad:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 7b0:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 7b3:	be 00 00 00 00       	mov    $0x0,%esi
 7b8:	eb 80                	jmp    73a <printf+0x2c>
        printint(fd, *ap, 16, 0);
 7ba:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7bd:	8b 17                	mov    (%edi),%edx
 7bf:	83 ec 0c             	sub    $0xc,%esp
 7c2:	6a 00                	push   $0x0
 7c4:	b9 10 00 00 00       	mov    $0x10,%ecx
 7c9:	8b 45 08             	mov    0x8(%ebp),%eax
 7cc:	e8 b2 fe ff ff       	call   683 <printint>
        ap++;
 7d1:	83 c7 04             	add    $0x4,%edi
 7d4:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 7d7:	83 c4 10             	add    $0x10,%esp
      state = 0;
 7da:	be 00 00 00 00       	mov    $0x0,%esi
 7df:	e9 56 ff ff ff       	jmp    73a <printf+0x2c>
        s = (char*)*ap;
 7e4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 7e7:	8b 30                	mov    (%eax),%esi
        ap++;
 7e9:	83 c0 04             	add    $0x4,%eax
 7ec:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 7ef:	85 f6                	test   %esi,%esi
 7f1:	75 15                	jne    808 <printf+0xfa>
          s = "(null)";
 7f3:	be 52 0a 00 00       	mov    $0xa52,%esi
 7f8:	eb 0e                	jmp    808 <printf+0xfa>
          putc(fd, *s);
 7fa:	0f be d2             	movsbl %dl,%edx
 7fd:	8b 45 08             	mov    0x8(%ebp),%eax
 800:	e8 64 fe ff ff       	call   669 <putc>
          s++;
 805:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 808:	0f b6 16             	movzbl (%esi),%edx
 80b:	84 d2                	test   %dl,%dl
 80d:	75 eb                	jne    7fa <printf+0xec>
      state = 0;
 80f:	be 00 00 00 00       	mov    $0x0,%esi
 814:	e9 21 ff ff ff       	jmp    73a <printf+0x2c>
        putc(fd, *ap);
 819:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 81c:	0f be 17             	movsbl (%edi),%edx
 81f:	8b 45 08             	mov    0x8(%ebp),%eax
 822:	e8 42 fe ff ff       	call   669 <putc>
        ap++;
 827:	83 c7 04             	add    $0x4,%edi
 82a:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 82d:	be 00 00 00 00       	mov    $0x0,%esi
 832:	e9 03 ff ff ff       	jmp    73a <printf+0x2c>
        putc(fd, c);
 837:	89 fa                	mov    %edi,%edx
 839:	8b 45 08             	mov    0x8(%ebp),%eax
 83c:	e8 28 fe ff ff       	call   669 <putc>
      state = 0;
 841:	be 00 00 00 00       	mov    $0x0,%esi
 846:	e9 ef fe ff ff       	jmp    73a <printf+0x2c>
        putc(fd, '%');
 84b:	ba 25 00 00 00       	mov    $0x25,%edx
 850:	8b 45 08             	mov    0x8(%ebp),%eax
 853:	e8 11 fe ff ff       	call   669 <putc>
        putc(fd, c);
 858:	89 fa                	mov    %edi,%edx
 85a:	8b 45 08             	mov    0x8(%ebp),%eax
 85d:	e8 07 fe ff ff       	call   669 <putc>
      state = 0;
 862:	be 00 00 00 00       	mov    $0x0,%esi
 867:	e9 ce fe ff ff       	jmp    73a <printf+0x2c>
    }
  }
}
 86c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 86f:	5b                   	pop    %ebx
 870:	5e                   	pop    %esi
 871:	5f                   	pop    %edi
 872:	5d                   	pop    %ebp
 873:	c3                   	ret    

00000874 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 874:	55                   	push   %ebp
 875:	89 e5                	mov    %esp,%ebp
 877:	57                   	push   %edi
 878:	56                   	push   %esi
 879:	53                   	push   %ebx
 87a:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 87d:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 880:	a1 50 0e 00 00       	mov    0xe50,%eax
 885:	eb 02                	jmp    889 <free+0x15>
 887:	89 d0                	mov    %edx,%eax
 889:	39 c8                	cmp    %ecx,%eax
 88b:	73 04                	jae    891 <free+0x1d>
 88d:	39 08                	cmp    %ecx,(%eax)
 88f:	77 12                	ja     8a3 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 891:	8b 10                	mov    (%eax),%edx
 893:	39 c2                	cmp    %eax,%edx
 895:	77 f0                	ja     887 <free+0x13>
 897:	39 c8                	cmp    %ecx,%eax
 899:	72 08                	jb     8a3 <free+0x2f>
 89b:	39 ca                	cmp    %ecx,%edx
 89d:	77 04                	ja     8a3 <free+0x2f>
 89f:	89 d0                	mov    %edx,%eax
 8a1:	eb e6                	jmp    889 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 8a3:	8b 73 fc             	mov    -0x4(%ebx),%esi
 8a6:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 8a9:	8b 10                	mov    (%eax),%edx
 8ab:	39 d7                	cmp    %edx,%edi
 8ad:	74 19                	je     8c8 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 8af:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 8b2:	8b 50 04             	mov    0x4(%eax),%edx
 8b5:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 8b8:	39 ce                	cmp    %ecx,%esi
 8ba:	74 1b                	je     8d7 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 8bc:	89 08                	mov    %ecx,(%eax)
  freep = p;
 8be:	a3 50 0e 00 00       	mov    %eax,0xe50
}
 8c3:	5b                   	pop    %ebx
 8c4:	5e                   	pop    %esi
 8c5:	5f                   	pop    %edi
 8c6:	5d                   	pop    %ebp
 8c7:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 8c8:	03 72 04             	add    0x4(%edx),%esi
 8cb:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 8ce:	8b 10                	mov    (%eax),%edx
 8d0:	8b 12                	mov    (%edx),%edx
 8d2:	89 53 f8             	mov    %edx,-0x8(%ebx)
 8d5:	eb db                	jmp    8b2 <free+0x3e>
    p->s.size += bp->s.size;
 8d7:	03 53 fc             	add    -0x4(%ebx),%edx
 8da:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 8dd:	8b 53 f8             	mov    -0x8(%ebx),%edx
 8e0:	89 10                	mov    %edx,(%eax)
 8e2:	eb da                	jmp    8be <free+0x4a>

000008e4 <morecore>:

static Header*
morecore(uint nu)
{
 8e4:	55                   	push   %ebp
 8e5:	89 e5                	mov    %esp,%ebp
 8e7:	53                   	push   %ebx
 8e8:	83 ec 04             	sub    $0x4,%esp
 8eb:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 8ed:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 8f2:	77 05                	ja     8f9 <morecore+0x15>
    nu = 4096;
 8f4:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 8f9:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 900:	83 ec 0c             	sub    $0xc,%esp
 903:	50                   	push   %eax
 904:	e8 38 fd ff ff       	call   641 <sbrk>
  if(p == (char*)-1)
 909:	83 c4 10             	add    $0x10,%esp
 90c:	83 f8 ff             	cmp    $0xffffffff,%eax
 90f:	74 1c                	je     92d <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 911:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 914:	83 c0 08             	add    $0x8,%eax
 917:	83 ec 0c             	sub    $0xc,%esp
 91a:	50                   	push   %eax
 91b:	e8 54 ff ff ff       	call   874 <free>
  return freep;
 920:	a1 50 0e 00 00       	mov    0xe50,%eax
 925:	83 c4 10             	add    $0x10,%esp
}
 928:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 92b:	c9                   	leave  
 92c:	c3                   	ret    
    return 0;
 92d:	b8 00 00 00 00       	mov    $0x0,%eax
 932:	eb f4                	jmp    928 <morecore+0x44>

00000934 <malloc>:

void*
malloc(uint nbytes)
{
 934:	55                   	push   %ebp
 935:	89 e5                	mov    %esp,%ebp
 937:	53                   	push   %ebx
 938:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 93b:	8b 45 08             	mov    0x8(%ebp),%eax
 93e:	8d 58 07             	lea    0x7(%eax),%ebx
 941:	c1 eb 03             	shr    $0x3,%ebx
 944:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 947:	8b 0d 50 0e 00 00    	mov    0xe50,%ecx
 94d:	85 c9                	test   %ecx,%ecx
 94f:	74 04                	je     955 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 951:	8b 01                	mov    (%ecx),%eax
 953:	eb 4a                	jmp    99f <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 955:	c7 05 50 0e 00 00 54 	movl   $0xe54,0xe50
 95c:	0e 00 00 
 95f:	c7 05 54 0e 00 00 54 	movl   $0xe54,0xe54
 966:	0e 00 00 
    base.s.size = 0;
 969:	c7 05 58 0e 00 00 00 	movl   $0x0,0xe58
 970:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 973:	b9 54 0e 00 00       	mov    $0xe54,%ecx
 978:	eb d7                	jmp    951 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 97a:	74 19                	je     995 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 97c:	29 da                	sub    %ebx,%edx
 97e:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 981:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 984:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 987:	89 0d 50 0e 00 00    	mov    %ecx,0xe50
      return (void*)(p + 1);
 98d:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 990:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 993:	c9                   	leave  
 994:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 995:	8b 10                	mov    (%eax),%edx
 997:	89 11                	mov    %edx,(%ecx)
 999:	eb ec                	jmp    987 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 99b:	89 c1                	mov    %eax,%ecx
 99d:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 99f:	8b 50 04             	mov    0x4(%eax),%edx
 9a2:	39 da                	cmp    %ebx,%edx
 9a4:	73 d4                	jae    97a <malloc+0x46>
    if(p == freep)
 9a6:	39 05 50 0e 00 00    	cmp    %eax,0xe50
 9ac:	75 ed                	jne    99b <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 9ae:	89 d8                	mov    %ebx,%eax
 9b0:	e8 2f ff ff ff       	call   8e4 <morecore>
 9b5:	85 c0                	test   %eax,%eax
 9b7:	75 e2                	jne    99b <malloc+0x67>
 9b9:	eb d5                	jmp    990 <malloc+0x5c>
