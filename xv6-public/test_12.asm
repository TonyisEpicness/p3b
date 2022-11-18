
_test_12:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
}

void worker(void *arg1, void *arg2);

int main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	83 ec 18             	sub    $0x18,%esp
   ppid = getpid();
  14:	e8 1a 07 00 00       	call   733 <getpid>

   int arg1 = 11, arg2 = 22;

   lock_init(&lock);
  19:	83 ec 0c             	sub    $0xc,%esp
   int arg1 = 11, arg2 = 22;
  1c:	c7 45 e0 0b 00 00 00 	movl   $0xb,-0x20(%ebp)
   lock_init(&lock);
  23:	68 dc 0f 00 00       	push   $0xfdc
   ppid = getpid();
  28:	a3 e8 0f 00 00       	mov    %eax,0xfe8
   int arg1 = 11, arg2 = 22;
  2d:	c7 45 e4 16 00 00 00 	movl   $0x16,-0x1c(%ebp)
   lock_init(&lock);
  34:	e8 17 04 00 00       	call   450 <lock_init>
   lock_init(&lock2);
  39:	c7 04 24 d8 0f 00 00 	movl   $0xfd8,(%esp)
  40:	e8 0b 04 00 00       	call   450 <lock_init>
   lock_acquire(&lock);
  45:	c7 04 24 dc 0f 00 00 	movl   $0xfdc,(%esp)
  4c:	e8 cf 03 00 00       	call   420 <lock_acquire>
   lock_acquire(&lock2);
  51:	c7 04 24 d8 0f 00 00 	movl   $0xfd8,(%esp)
  58:	e8 c3 03 00 00       	call   420 <lock_acquire>

   for (int i = 0; i < num_threads; i++) {
  5d:	8b 35 d4 0f 00 00    	mov    0xfd4,%esi
  63:	83 c4 10             	add    $0x10,%esp
  66:	85 f6                	test   %esi,%esi
  68:	7e 75                	jle    df <main+0xdf>
  6a:	31 db                	xor    %ebx,%ebx
  6c:	8d 7d e4             	lea    -0x1c(%ebp),%edi
  6f:	8d 75 e0             	lea    -0x20(%ebp),%esi
  72:	eb 0f                	jmp    83 <main+0x83>
  74:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  78:	83 c3 01             	add    $0x1,%ebx
  7b:	39 1d d4 0f 00 00    	cmp    %ebx,0xfd4
  81:	7e 5c                	jle    df <main+0xdf>
      int thread_pid = thread_create(worker, &arg1, &arg2);
  83:	83 ec 04             	sub    $0x4,%esp
  86:	57                   	push   %edi
  87:	56                   	push   %esi
  88:	68 20 02 00 00       	push   $0x220
  8d:	e8 6e 03 00 00       	call   400 <thread_create>
      assert(thread_pid > 0);
  92:	83 c4 10             	add    $0x10,%esp
  95:	85 c0                	test   %eax,%eax
  97:	7f df                	jg     78 <main+0x78>
  99:	6a 28                	push   $0x28
  9b:	68 48 0b 00 00       	push   $0xb48
  a0:	68 52 0b 00 00       	push   $0xb52
  a5:	6a 01                	push   $0x1
  a7:	e8 74 07 00 00       	call   820 <printf>
  ac:	83 c4 0c             	add    $0xc,%esp
  af:	68 99 0b 00 00       	push   $0xb99
   }
   lock_release(&lock2);

   for (int i = 0; i < num_threads; i++) {
      int join_pid = thread_join();
      assert(join_pid > 0);
  b4:	68 78 0b 00 00       	push   $0xb78
  b9:	6a 01                	push   $0x1
  bb:	e8 60 07 00 00       	call   820 <printf>
  c0:	5a                   	pop    %edx
  c1:	59                   	pop    %ecx
  c2:	68 8c 0b 00 00       	push   $0xb8c
  c7:	6a 01                	push   $0x1
  c9:	e8 52 07 00 00       	call   820 <printf>
  ce:	5b                   	pop    %ebx
  cf:	ff 35 e8 0f 00 00    	push   0xfe8
  d5:	e8 09 06 00 00       	call   6e3 <kill>
  da:	e8 d4 05 00 00       	call   6b3 <exit>
   size = (unsigned int)sbrk(0);
  df:	83 ec 0c             	sub    $0xc,%esp
  e2:	6a 00                	push   $0x0
  e4:	e8 52 06 00 00       	call   73b <sbrk>
   while (global < num_threads) {
  e9:	83 c4 10             	add    $0x10,%esp
   size = (unsigned int)sbrk(0);
  ec:	a3 e0 0f 00 00       	mov    %eax,0xfe0
   while (global < num_threads) {
  f1:	a1 d4 0f 00 00       	mov    0xfd4,%eax
  f6:	39 05 e4 0f 00 00    	cmp    %eax,0xfe4
  fc:	7d 37                	jge    135 <main+0x135>
  fe:	66 90                	xchg   %ax,%ax
      lock_release(&lock);
 100:	83 ec 0c             	sub    $0xc,%esp
 103:	68 dc 0f 00 00       	push   $0xfdc
 108:	e8 33 03 00 00       	call   440 <lock_release>
      sleep(100);
 10d:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 114:	e8 2a 06 00 00       	call   743 <sleep>
      lock_acquire(&lock);
 119:	c7 04 24 dc 0f 00 00 	movl   $0xfdc,(%esp)
 120:	e8 fb 02 00 00       	call   420 <lock_acquire>
   while (global < num_threads) {
 125:	a1 d4 0f 00 00       	mov    0xfd4,%eax
 12a:	83 c4 10             	add    $0x10,%esp
 12d:	39 05 e4 0f 00 00    	cmp    %eax,0xfe4
 133:	7c cb                	jl     100 <main+0x100>
   global = 0;
 135:	c7 05 e4 0f 00 00 00 	movl   $0x0,0xfe4
 13c:	00 00 00 
   sbrk(10000);
 13f:	83 ec 0c             	sub    $0xc,%esp
 142:	68 10 27 00 00       	push   $0x2710
 147:	e8 ef 05 00 00       	call   73b <sbrk>
   size = (unsigned int)sbrk(0);
 14c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 153:	e8 e3 05 00 00       	call   73b <sbrk>
   lock_release(&lock);
 158:	c7 04 24 dc 0f 00 00 	movl   $0xfdc,(%esp)
   size = (unsigned int)sbrk(0);
 15f:	a3 e0 0f 00 00       	mov    %eax,0xfe0
   lock_release(&lock);
 164:	e8 d7 02 00 00       	call   440 <lock_release>
   while (global < num_threads) {
 169:	a1 d4 0f 00 00       	mov    0xfd4,%eax
 16e:	83 c4 10             	add    $0x10,%esp
 171:	39 05 e4 0f 00 00    	cmp    %eax,0xfe4
 177:	7d 3c                	jge    1b5 <main+0x1b5>
 179:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      lock_release(&lock2);
 180:	83 ec 0c             	sub    $0xc,%esp
 183:	68 d8 0f 00 00       	push   $0xfd8
 188:	e8 b3 02 00 00       	call   440 <lock_release>
      sleep(100);
 18d:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 194:	e8 aa 05 00 00       	call   743 <sleep>
      lock_acquire(&lock2);
 199:	c7 04 24 d8 0f 00 00 	movl   $0xfd8,(%esp)
 1a0:	e8 7b 02 00 00       	call   420 <lock_acquire>
   while (global < num_threads) {
 1a5:	a1 d4 0f 00 00       	mov    0xfd4,%eax
 1aa:	83 c4 10             	add    $0x10,%esp
 1ad:	39 05 e4 0f 00 00    	cmp    %eax,0xfe4
 1b3:	7c cb                	jl     180 <main+0x180>
   lock_release(&lock2);
 1b5:	83 ec 0c             	sub    $0xc,%esp
 1b8:	68 d8 0f 00 00       	push   $0xfd8
 1bd:	e8 7e 02 00 00       	call   440 <lock_release>
   for (int i = 0; i < num_threads; i++) {
 1c2:	83 c4 10             	add    $0x10,%esp
 1c5:	83 3d d4 0f 00 00 00 	cmpl   $0x0,0xfd4
 1cc:	7e 3e                	jle    20c <main+0x20c>
 1ce:	31 db                	xor    %ebx,%ebx
 1d0:	eb 11                	jmp    1e3 <main+0x1e3>
 1d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1d8:	83 c3 01             	add    $0x1,%ebx
 1db:	39 1d d4 0f 00 00    	cmp    %ebx,0xfd4
 1e1:	7e 29                	jle    20c <main+0x20c>
      int join_pid = thread_join();
 1e3:	e8 28 02 00 00       	call   410 <thread_join>
      assert(join_pid > 0);
 1e8:	85 c0                	test   %eax,%eax
 1ea:	7f ec                	jg     1d8 <main+0x1d8>
 1ec:	6a 41                	push   $0x41
 1ee:	68 48 0b 00 00       	push   $0xb48
 1f3:	68 52 0b 00 00       	push   $0xb52
 1f8:	6a 01                	push   $0x1
 1fa:	e8 21 06 00 00       	call   820 <printf>
 1ff:	83 c4 0c             	add    $0xc,%esp
 202:	68 a8 0b 00 00       	push   $0xba8
 207:	e9 a8 fe ff ff       	jmp    b4 <main+0xb4>
   }

   printf(1, "TEST PASSED\n");
 20c:	50                   	push   %eax
 20d:	50                   	push   %eax
 20e:	68 b5 0b 00 00       	push   $0xbb5
 213:	6a 01                	push   $0x1
 215:	e8 06 06 00 00       	call   820 <printf>
   exit();
 21a:	e8 94 04 00 00       	call   6b3 <exit>
 21f:	90                   	nop

00000220 <worker>:
   
   exit();
}


void worker(void *arg1, void *arg2) {
 220:	55                   	push   %ebp
 221:	89 e5                	mov    %esp,%ebp
 223:	83 ec 14             	sub    $0x14,%esp
   lock_acquire(&lock);
 226:	68 dc 0f 00 00       	push   $0xfdc
 22b:	e8 f0 01 00 00       	call   420 <lock_acquire>
   assert((unsigned int)sbrk(0) == size);
 230:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 237:	e8 ff 04 00 00       	call   73b <sbrk>
 23c:	83 c4 10             	add    $0x10,%esp
 23f:	3b 05 e0 0f 00 00    	cmp    0xfe0,%eax
 245:	74 46                	je     28d <worker+0x6d>
 247:	6a 5b                	push   $0x5b

   


   lock_acquire(&lock2);
   assert((unsigned int)sbrk(0) == size);
 249:	68 48 0b 00 00       	push   $0xb48
 24e:	68 52 0b 00 00       	push   $0xb52
 253:	6a 01                	push   $0x1
 255:	e8 c6 05 00 00       	call   820 <printf>
 25a:	83 c4 0c             	add    $0xc,%esp
 25d:	68 5a 0b 00 00       	push   $0xb5a
 262:	68 78 0b 00 00       	push   $0xb78
 267:	6a 01                	push   $0x1
 269:	e8 b2 05 00 00       	call   820 <printf>
 26e:	58                   	pop    %eax
 26f:	5a                   	pop    %edx
 270:	68 8c 0b 00 00       	push   $0xb8c
 275:	6a 01                	push   $0x1
 277:	e8 a4 05 00 00       	call   820 <printf>
 27c:	59                   	pop    %ecx
 27d:	ff 35 e8 0f 00 00    	push   0xfe8
 283:	e8 5b 04 00 00       	call   6e3 <kill>
 288:	e8 26 04 00 00       	call   6b3 <exit>
   lock_release(&lock);
 28d:	83 ec 0c             	sub    $0xc,%esp
   global++;
 290:	83 05 e4 0f 00 00 01 	addl   $0x1,0xfe4
   lock_release(&lock);
 297:	68 dc 0f 00 00       	push   $0xfdc
 29c:	e8 9f 01 00 00       	call   440 <lock_release>
   lock_acquire(&lock2);
 2a1:	c7 04 24 d8 0f 00 00 	movl   $0xfd8,(%esp)
 2a8:	e8 73 01 00 00       	call   420 <lock_acquire>
   assert((unsigned int)sbrk(0) == size);
 2ad:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 2b4:	e8 82 04 00 00       	call   73b <sbrk>
 2b9:	83 c4 10             	add    $0x10,%esp
 2bc:	3b 05 e0 0f 00 00    	cmp    0xfe0,%eax
 2c2:	74 04                	je     2c8 <worker+0xa8>
 2c4:	6a 63                	push   $0x63
 2c6:	eb 81                	jmp    249 <worker+0x29>
   global++;
   sbrk(10000);
 2c8:	83 ec 0c             	sub    $0xc,%esp
   global++;
 2cb:	83 05 e4 0f 00 00 01 	addl   $0x1,0xfe4
   sbrk(10000);
 2d2:	68 10 27 00 00       	push   $0x2710
 2d7:	e8 5f 04 00 00       	call   73b <sbrk>
   size = (unsigned int)sbrk(0);
 2dc:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 2e3:	e8 53 04 00 00       	call   73b <sbrk>
   lock_release(&lock2);
 2e8:	c7 04 24 d8 0f 00 00 	movl   $0xfd8,(%esp)
   size = (unsigned int)sbrk(0);
 2ef:	a3 e0 0f 00 00       	mov    %eax,0xfe0
   lock_release(&lock2);
 2f4:	e8 47 01 00 00       	call   440 <lock_release>



   exit();
 2f9:	e8 b5 03 00 00       	call   6b3 <exit>
 2fe:	66 90                	xchg   %ax,%ax

00000300 <worker2>:
{
 300:	55                   	push   %ebp
 301:	89 e5                	mov    %esp,%ebp
 303:	83 ec 08             	sub    $0x8,%esp
   int arg2_int = *(int*)arg2;
 306:	8b 45 0c             	mov    0xc(%ebp),%eax
 309:	8b 10                	mov    (%eax),%edx
   assert(arg1_int == 11);
 30b:	8b 45 08             	mov    0x8(%ebp),%eax
 30e:	83 38 0b             	cmpl   $0xb,(%eax)
 311:	75 4b                	jne    35e <worker2+0x5e>
   assert(arg2_int == 22);
 313:	83 fa 16             	cmp    $0x16,%edx
 316:	74 63                	je     37b <worker2+0x7b>
 318:	6a 4d                	push   $0x4d
 31a:	68 48 0b 00 00       	push   $0xb48
 31f:	68 52 0b 00 00       	push   $0xb52
 324:	6a 01                	push   $0x1
 326:	e8 f5 04 00 00       	call   820 <printf>
 32b:	83 c4 0c             	add    $0xc,%esp
 32e:	68 d1 0b 00 00       	push   $0xbd1
 333:	68 78 0b 00 00       	push   $0xb78
 338:	6a 01                	push   $0x1
 33a:	e8 e1 04 00 00       	call   820 <printf>
 33f:	58                   	pop    %eax
 340:	5a                   	pop    %edx
 341:	68 8c 0b 00 00       	push   $0xb8c
 346:	6a 01                	push   $0x1
 348:	e8 d3 04 00 00       	call   820 <printf>
 34d:	59                   	pop    %ecx
 34e:	ff 35 e8 0f 00 00    	push   0xfe8
 354:	e8 8a 03 00 00       	call   6e3 <kill>
 359:	e8 55 03 00 00       	call   6b3 <exit>
   assert(arg1_int == 11);
 35e:	6a 4c                	push   $0x4c
 360:	68 48 0b 00 00       	push   $0xb48
 365:	68 52 0b 00 00       	push   $0xb52
 36a:	6a 01                	push   $0x1
 36c:	e8 af 04 00 00       	call   820 <printf>
 371:	83 c4 0c             	add    $0xc,%esp
 374:	68 c2 0b 00 00       	push   $0xbc2
 379:	eb b8                	jmp    333 <worker2+0x33>
   lock_acquire(&lock2);
 37b:	83 ec 0c             	sub    $0xc,%esp
 37e:	68 d8 0f 00 00       	push   $0xfd8
 383:	e8 98 00 00 00       	call   420 <lock_acquire>
   assert((unsigned int)sbrk(0) == size);
 388:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 38f:	e8 a7 03 00 00       	call   73b <sbrk>
 394:	83 c4 10             	add    $0x10,%esp
 397:	3b 05 e0 0f 00 00    	cmp    0xfe0,%eax
 39d:	74 20                	je     3bf <worker2+0xbf>
 39f:	6a 50                	push   $0x50
 3a1:	68 48 0b 00 00       	push   $0xb48
 3a6:	68 52 0b 00 00       	push   $0xb52
 3ab:	6a 01                	push   $0x1
 3ad:	e8 6e 04 00 00       	call   820 <printf>
 3b2:	83 c4 0c             	add    $0xc,%esp
 3b5:	68 5a 0b 00 00       	push   $0xb5a
 3ba:	e9 74 ff ff ff       	jmp    333 <worker2+0x33>
   lock_release(&lock2);
 3bf:	83 ec 0c             	sub    $0xc,%esp
   global++;
 3c2:	83 05 e4 0f 00 00 01 	addl   $0x1,0xfe4
   lock_release(&lock2);
 3c9:	68 d8 0f 00 00       	push   $0xfd8
 3ce:	e8 6d 00 00 00       	call   440 <lock_release>
   exit();
 3d3:	e8 db 02 00 00       	call   6b3 <exit>
 3d8:	66 90                	xchg   %ax,%ax
 3da:	66 90                	xchg   %ax,%ax
 3dc:	66 90                	xchg   %ax,%ax
 3de:	66 90                	xchg   %ax,%ax

000003e0 <test_and_set>:
#include "stat.h"
#include "fcntl.h"
#include "user.h"
#include "x86.h"

int test_and_set(int *old_ptr, int new_ptr) {
 3e0:	55                   	push   %ebp
 3e1:	89 e5                	mov    %esp,%ebp
 3e3:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *old_ptr;
  *old_ptr = new_ptr;
 3e6:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  int old = *old_ptr;
 3e9:	8b 10                	mov    (%eax),%edx
  *old_ptr = new_ptr;
 3eb:	89 08                	mov    %ecx,(%eax)
  return old;
}
 3ed:	5d                   	pop    %ebp
 3ee:	89 d0                	mov    %edx,%eax
 3f0:	c3                   	ret    
 3f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3ff:	90                   	nop

00000400 <thread_create>:

int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
  return 0;
}
 400:	31 c0                	xor    %eax,%eax
 402:	c3                   	ret    
 403:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 40a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000410 <thread_join>:

int thread_join() {
  return 0;
}
 410:	31 c0                	xor    %eax,%eax
 412:	c3                   	ret    
 413:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 41a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000420 <lock_acquire>:

void lock_acquire(lock_t *lock){
 420:	55                   	push   %ebp
 421:	89 e5                	mov    %esp,%ebp
 423:	8b 45 08             	mov    0x8(%ebp),%eax
  while(test_and_set(&lock->flag, 1) == 1)
 426:	83 38 01             	cmpl   $0x1,(%eax)
 429:	75 05                	jne    430 <lock_acquire+0x10>
 42b:	eb fe                	jmp    42b <lock_acquire+0xb>
 42d:	8d 76 00             	lea    0x0(%esi),%esi
 430:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
    ;
}
 436:	5d                   	pop    %ebp
 437:	c3                   	ret    
 438:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 43f:	90                   	nop

00000440 <lock_release>:

void lock_release(lock_t *lock) {
 440:	55                   	push   %ebp
 441:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 443:	8b 45 08             	mov    0x8(%ebp),%eax
 446:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 44c:	5d                   	pop    %ebp
 44d:	c3                   	ret    
 44e:	66 90                	xchg   %ax,%ax

00000450 <lock_init>:
 450:	55                   	push   %ebp
 451:	89 e5                	mov    %esp,%ebp
 453:	8b 45 08             	mov    0x8(%ebp),%eax
 456:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 45c:	5d                   	pop    %ebp
 45d:	c3                   	ret    
 45e:	66 90                	xchg   %ax,%ax

00000460 <strcpy>:
  lock->flag = 0;
}

char*
strcpy(char *s, const char *t)
{
 460:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 461:	31 c0                	xor    %eax,%eax
{
 463:	89 e5                	mov    %esp,%ebp
 465:	53                   	push   %ebx
 466:	8b 4d 08             	mov    0x8(%ebp),%ecx
 469:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 46c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 470:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 474:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 477:	83 c0 01             	add    $0x1,%eax
 47a:	84 d2                	test   %dl,%dl
 47c:	75 f2                	jne    470 <strcpy+0x10>
    ;
  return os;
}
 47e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 481:	89 c8                	mov    %ecx,%eax
 483:	c9                   	leave  
 484:	c3                   	ret    
 485:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 48c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000490 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 490:	55                   	push   %ebp
 491:	89 e5                	mov    %esp,%ebp
 493:	53                   	push   %ebx
 494:	8b 55 08             	mov    0x8(%ebp),%edx
 497:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 49a:	0f b6 02             	movzbl (%edx),%eax
 49d:	84 c0                	test   %al,%al
 49f:	75 17                	jne    4b8 <strcmp+0x28>
 4a1:	eb 3a                	jmp    4dd <strcmp+0x4d>
 4a3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4a7:	90                   	nop
 4a8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 4ac:	83 c2 01             	add    $0x1,%edx
 4af:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 4b2:	84 c0                	test   %al,%al
 4b4:	74 1a                	je     4d0 <strcmp+0x40>
    p++, q++;
 4b6:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 4b8:	0f b6 19             	movzbl (%ecx),%ebx
 4bb:	38 c3                	cmp    %al,%bl
 4bd:	74 e9                	je     4a8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 4bf:	29 d8                	sub    %ebx,%eax
}
 4c1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4c4:	c9                   	leave  
 4c5:	c3                   	ret    
 4c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4cd:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 4d0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 4d4:	31 c0                	xor    %eax,%eax
 4d6:	29 d8                	sub    %ebx,%eax
}
 4d8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4db:	c9                   	leave  
 4dc:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 4dd:	0f b6 19             	movzbl (%ecx),%ebx
 4e0:	31 c0                	xor    %eax,%eax
 4e2:	eb db                	jmp    4bf <strcmp+0x2f>
 4e4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4eb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4ef:	90                   	nop

000004f0 <strlen>:

uint
strlen(const char *s)
{
 4f0:	55                   	push   %ebp
 4f1:	89 e5                	mov    %esp,%ebp
 4f3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 4f6:	80 3a 00             	cmpb   $0x0,(%edx)
 4f9:	74 15                	je     510 <strlen+0x20>
 4fb:	31 c0                	xor    %eax,%eax
 4fd:	8d 76 00             	lea    0x0(%esi),%esi
 500:	83 c0 01             	add    $0x1,%eax
 503:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 507:	89 c1                	mov    %eax,%ecx
 509:	75 f5                	jne    500 <strlen+0x10>
    ;
  return n;
}
 50b:	89 c8                	mov    %ecx,%eax
 50d:	5d                   	pop    %ebp
 50e:	c3                   	ret    
 50f:	90                   	nop
  for(n = 0; s[n]; n++)
 510:	31 c9                	xor    %ecx,%ecx
}
 512:	5d                   	pop    %ebp
 513:	89 c8                	mov    %ecx,%eax
 515:	c3                   	ret    
 516:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 51d:	8d 76 00             	lea    0x0(%esi),%esi

00000520 <memset>:

void*
memset(void *dst, int c, uint n)
{
 520:	55                   	push   %ebp
 521:	89 e5                	mov    %esp,%ebp
 523:	57                   	push   %edi
 524:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 527:	8b 4d 10             	mov    0x10(%ebp),%ecx
 52a:	8b 45 0c             	mov    0xc(%ebp),%eax
 52d:	89 d7                	mov    %edx,%edi
 52f:	fc                   	cld    
 530:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 532:	8b 7d fc             	mov    -0x4(%ebp),%edi
 535:	89 d0                	mov    %edx,%eax
 537:	c9                   	leave  
 538:	c3                   	ret    
 539:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000540 <strchr>:

char*
strchr(const char *s, char c)
{
 540:	55                   	push   %ebp
 541:	89 e5                	mov    %esp,%ebp
 543:	8b 45 08             	mov    0x8(%ebp),%eax
 546:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 54a:	0f b6 10             	movzbl (%eax),%edx
 54d:	84 d2                	test   %dl,%dl
 54f:	75 12                	jne    563 <strchr+0x23>
 551:	eb 1d                	jmp    570 <strchr+0x30>
 553:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 557:	90                   	nop
 558:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 55c:	83 c0 01             	add    $0x1,%eax
 55f:	84 d2                	test   %dl,%dl
 561:	74 0d                	je     570 <strchr+0x30>
    if(*s == c)
 563:	38 d1                	cmp    %dl,%cl
 565:	75 f1                	jne    558 <strchr+0x18>
      return (char*)s;
  return 0;
}
 567:	5d                   	pop    %ebp
 568:	c3                   	ret    
 569:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 570:	31 c0                	xor    %eax,%eax
}
 572:	5d                   	pop    %ebp
 573:	c3                   	ret    
 574:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 57b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 57f:	90                   	nop

00000580 <gets>:

char*
gets(char *buf, int max)
{
 580:	55                   	push   %ebp
 581:	89 e5                	mov    %esp,%ebp
 583:	57                   	push   %edi
 584:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 585:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 588:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 589:	31 db                	xor    %ebx,%ebx
{
 58b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 58e:	eb 27                	jmp    5b7 <gets+0x37>
    cc = read(0, &c, 1);
 590:	83 ec 04             	sub    $0x4,%esp
 593:	6a 01                	push   $0x1
 595:	57                   	push   %edi
 596:	6a 00                	push   $0x0
 598:	e8 2e 01 00 00       	call   6cb <read>
    if(cc < 1)
 59d:	83 c4 10             	add    $0x10,%esp
 5a0:	85 c0                	test   %eax,%eax
 5a2:	7e 1d                	jle    5c1 <gets+0x41>
      break;
    buf[i++] = c;
 5a4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 5a8:	8b 55 08             	mov    0x8(%ebp),%edx
 5ab:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 5af:	3c 0a                	cmp    $0xa,%al
 5b1:	74 1d                	je     5d0 <gets+0x50>
 5b3:	3c 0d                	cmp    $0xd,%al
 5b5:	74 19                	je     5d0 <gets+0x50>
  for(i=0; i+1 < max; ){
 5b7:	89 de                	mov    %ebx,%esi
 5b9:	83 c3 01             	add    $0x1,%ebx
 5bc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 5bf:	7c cf                	jl     590 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 5c1:	8b 45 08             	mov    0x8(%ebp),%eax
 5c4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 5c8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5cb:	5b                   	pop    %ebx
 5cc:	5e                   	pop    %esi
 5cd:	5f                   	pop    %edi
 5ce:	5d                   	pop    %ebp
 5cf:	c3                   	ret    
  buf[i] = '\0';
 5d0:	8b 45 08             	mov    0x8(%ebp),%eax
 5d3:	89 de                	mov    %ebx,%esi
 5d5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 5d9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5dc:	5b                   	pop    %ebx
 5dd:	5e                   	pop    %esi
 5de:	5f                   	pop    %edi
 5df:	5d                   	pop    %ebp
 5e0:	c3                   	ret    
 5e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5e8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5ef:	90                   	nop

000005f0 <stat>:

int
stat(const char *n, struct stat *st)
{
 5f0:	55                   	push   %ebp
 5f1:	89 e5                	mov    %esp,%ebp
 5f3:	56                   	push   %esi
 5f4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 5f5:	83 ec 08             	sub    $0x8,%esp
 5f8:	6a 00                	push   $0x0
 5fa:	ff 75 08             	push   0x8(%ebp)
 5fd:	e8 f1 00 00 00       	call   6f3 <open>
  if(fd < 0)
 602:	83 c4 10             	add    $0x10,%esp
 605:	85 c0                	test   %eax,%eax
 607:	78 27                	js     630 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 609:	83 ec 08             	sub    $0x8,%esp
 60c:	ff 75 0c             	push   0xc(%ebp)
 60f:	89 c3                	mov    %eax,%ebx
 611:	50                   	push   %eax
 612:	e8 f4 00 00 00       	call   70b <fstat>
  close(fd);
 617:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 61a:	89 c6                	mov    %eax,%esi
  close(fd);
 61c:	e8 ba 00 00 00       	call   6db <close>
  return r;
 621:	83 c4 10             	add    $0x10,%esp
}
 624:	8d 65 f8             	lea    -0x8(%ebp),%esp
 627:	89 f0                	mov    %esi,%eax
 629:	5b                   	pop    %ebx
 62a:	5e                   	pop    %esi
 62b:	5d                   	pop    %ebp
 62c:	c3                   	ret    
 62d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 630:	be ff ff ff ff       	mov    $0xffffffff,%esi
 635:	eb ed                	jmp    624 <stat+0x34>
 637:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 63e:	66 90                	xchg   %ax,%ax

00000640 <atoi>:

int
atoi(const char *s)
{
 640:	55                   	push   %ebp
 641:	89 e5                	mov    %esp,%ebp
 643:	53                   	push   %ebx
 644:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 647:	0f be 02             	movsbl (%edx),%eax
 64a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 64d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 650:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 655:	77 1e                	ja     675 <atoi+0x35>
 657:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 65e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 660:	83 c2 01             	add    $0x1,%edx
 663:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 666:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 66a:	0f be 02             	movsbl (%edx),%eax
 66d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 670:	80 fb 09             	cmp    $0x9,%bl
 673:	76 eb                	jbe    660 <atoi+0x20>
  return n;
}
 675:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 678:	89 c8                	mov    %ecx,%eax
 67a:	c9                   	leave  
 67b:	c3                   	ret    
 67c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000680 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 680:	55                   	push   %ebp
 681:	89 e5                	mov    %esp,%ebp
 683:	57                   	push   %edi
 684:	8b 45 10             	mov    0x10(%ebp),%eax
 687:	8b 55 08             	mov    0x8(%ebp),%edx
 68a:	56                   	push   %esi
 68b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 68e:	85 c0                	test   %eax,%eax
 690:	7e 13                	jle    6a5 <memmove+0x25>
 692:	01 d0                	add    %edx,%eax
  dst = vdst;
 694:	89 d7                	mov    %edx,%edi
 696:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 69d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 6a0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 6a1:	39 f8                	cmp    %edi,%eax
 6a3:	75 fb                	jne    6a0 <memmove+0x20>
  return vdst;
}
 6a5:	5e                   	pop    %esi
 6a6:	89 d0                	mov    %edx,%eax
 6a8:	5f                   	pop    %edi
 6a9:	5d                   	pop    %ebp
 6aa:	c3                   	ret    

000006ab <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 6ab:	b8 01 00 00 00       	mov    $0x1,%eax
 6b0:	cd 40                	int    $0x40
 6b2:	c3                   	ret    

000006b3 <exit>:
SYSCALL(exit)
 6b3:	b8 02 00 00 00       	mov    $0x2,%eax
 6b8:	cd 40                	int    $0x40
 6ba:	c3                   	ret    

000006bb <wait>:
SYSCALL(wait)
 6bb:	b8 03 00 00 00       	mov    $0x3,%eax
 6c0:	cd 40                	int    $0x40
 6c2:	c3                   	ret    

000006c3 <pipe>:
SYSCALL(pipe)
 6c3:	b8 04 00 00 00       	mov    $0x4,%eax
 6c8:	cd 40                	int    $0x40
 6ca:	c3                   	ret    

000006cb <read>:
SYSCALL(read)
 6cb:	b8 05 00 00 00       	mov    $0x5,%eax
 6d0:	cd 40                	int    $0x40
 6d2:	c3                   	ret    

000006d3 <write>:
SYSCALL(write)
 6d3:	b8 10 00 00 00       	mov    $0x10,%eax
 6d8:	cd 40                	int    $0x40
 6da:	c3                   	ret    

000006db <close>:
SYSCALL(close)
 6db:	b8 15 00 00 00       	mov    $0x15,%eax
 6e0:	cd 40                	int    $0x40
 6e2:	c3                   	ret    

000006e3 <kill>:
SYSCALL(kill)
 6e3:	b8 06 00 00 00       	mov    $0x6,%eax
 6e8:	cd 40                	int    $0x40
 6ea:	c3                   	ret    

000006eb <exec>:
SYSCALL(exec)
 6eb:	b8 07 00 00 00       	mov    $0x7,%eax
 6f0:	cd 40                	int    $0x40
 6f2:	c3                   	ret    

000006f3 <open>:
SYSCALL(open)
 6f3:	b8 0f 00 00 00       	mov    $0xf,%eax
 6f8:	cd 40                	int    $0x40
 6fa:	c3                   	ret    

000006fb <mknod>:
SYSCALL(mknod)
 6fb:	b8 11 00 00 00       	mov    $0x11,%eax
 700:	cd 40                	int    $0x40
 702:	c3                   	ret    

00000703 <unlink>:
SYSCALL(unlink)
 703:	b8 12 00 00 00       	mov    $0x12,%eax
 708:	cd 40                	int    $0x40
 70a:	c3                   	ret    

0000070b <fstat>:
SYSCALL(fstat)
 70b:	b8 08 00 00 00       	mov    $0x8,%eax
 710:	cd 40                	int    $0x40
 712:	c3                   	ret    

00000713 <link>:
SYSCALL(link)
 713:	b8 13 00 00 00       	mov    $0x13,%eax
 718:	cd 40                	int    $0x40
 71a:	c3                   	ret    

0000071b <mkdir>:
SYSCALL(mkdir)
 71b:	b8 14 00 00 00       	mov    $0x14,%eax
 720:	cd 40                	int    $0x40
 722:	c3                   	ret    

00000723 <chdir>:
SYSCALL(chdir)
 723:	b8 09 00 00 00       	mov    $0x9,%eax
 728:	cd 40                	int    $0x40
 72a:	c3                   	ret    

0000072b <dup>:
SYSCALL(dup)
 72b:	b8 0a 00 00 00       	mov    $0xa,%eax
 730:	cd 40                	int    $0x40
 732:	c3                   	ret    

00000733 <getpid>:
SYSCALL(getpid)
 733:	b8 0b 00 00 00       	mov    $0xb,%eax
 738:	cd 40                	int    $0x40
 73a:	c3                   	ret    

0000073b <sbrk>:
SYSCALL(sbrk)
 73b:	b8 0c 00 00 00       	mov    $0xc,%eax
 740:	cd 40                	int    $0x40
 742:	c3                   	ret    

00000743 <sleep>:
SYSCALL(sleep)
 743:	b8 0d 00 00 00       	mov    $0xd,%eax
 748:	cd 40                	int    $0x40
 74a:	c3                   	ret    

0000074b <uptime>:
SYSCALL(uptime)
 74b:	b8 0e 00 00 00       	mov    $0xe,%eax
 750:	cd 40                	int    $0x40
 752:	c3                   	ret    

00000753 <clone>:
SYSCALL(clone)
 753:	b8 16 00 00 00       	mov    $0x16,%eax
 758:	cd 40                	int    $0x40
 75a:	c3                   	ret    

0000075b <join>:
 75b:	b8 17 00 00 00       	mov    $0x17,%eax
 760:	cd 40                	int    $0x40
 762:	c3                   	ret    
 763:	66 90                	xchg   %ax,%ax
 765:	66 90                	xchg   %ax,%ax
 767:	66 90                	xchg   %ax,%ax
 769:	66 90                	xchg   %ax,%ax
 76b:	66 90                	xchg   %ax,%ax
 76d:	66 90                	xchg   %ax,%ax
 76f:	90                   	nop

00000770 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 770:	55                   	push   %ebp
 771:	89 e5                	mov    %esp,%ebp
 773:	57                   	push   %edi
 774:	56                   	push   %esi
 775:	53                   	push   %ebx
 776:	83 ec 3c             	sub    $0x3c,%esp
 779:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 77c:	89 d1                	mov    %edx,%ecx
{
 77e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 781:	85 d2                	test   %edx,%edx
 783:	0f 89 7f 00 00 00    	jns    808 <printint+0x98>
 789:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 78d:	74 79                	je     808 <printint+0x98>
    neg = 1;
 78f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 796:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 798:	31 db                	xor    %ebx,%ebx
 79a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 79d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 7a0:	89 c8                	mov    %ecx,%eax
 7a2:	31 d2                	xor    %edx,%edx
 7a4:	89 cf                	mov    %ecx,%edi
 7a6:	f7 75 c4             	divl   -0x3c(%ebp)
 7a9:	0f b6 92 40 0c 00 00 	movzbl 0xc40(%edx),%edx
 7b0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 7b3:	89 d8                	mov    %ebx,%eax
 7b5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 7b8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 7bb:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 7be:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 7c1:	76 dd                	jbe    7a0 <printint+0x30>
  if(neg)
 7c3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 7c6:	85 c9                	test   %ecx,%ecx
 7c8:	74 0c                	je     7d6 <printint+0x66>
    buf[i++] = '-';
 7ca:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 7cf:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 7d1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 7d6:	8b 7d b8             	mov    -0x48(%ebp),%edi
 7d9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 7dd:	eb 07                	jmp    7e6 <printint+0x76>
 7df:	90                   	nop
    putc(fd, buf[i]);
 7e0:	0f b6 13             	movzbl (%ebx),%edx
 7e3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 7e6:	83 ec 04             	sub    $0x4,%esp
 7e9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 7ec:	6a 01                	push   $0x1
 7ee:	56                   	push   %esi
 7ef:	57                   	push   %edi
 7f0:	e8 de fe ff ff       	call   6d3 <write>
  while(--i >= 0)
 7f5:	83 c4 10             	add    $0x10,%esp
 7f8:	39 de                	cmp    %ebx,%esi
 7fa:	75 e4                	jne    7e0 <printint+0x70>
}
 7fc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7ff:	5b                   	pop    %ebx
 800:	5e                   	pop    %esi
 801:	5f                   	pop    %edi
 802:	5d                   	pop    %ebp
 803:	c3                   	ret    
 804:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 808:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 80f:	eb 87                	jmp    798 <printint+0x28>
 811:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 818:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 81f:	90                   	nop

00000820 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 820:	55                   	push   %ebp
 821:	89 e5                	mov    %esp,%ebp
 823:	57                   	push   %edi
 824:	56                   	push   %esi
 825:	53                   	push   %ebx
 826:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 829:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 82c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 82f:	0f b6 13             	movzbl (%ebx),%edx
 832:	84 d2                	test   %dl,%dl
 834:	74 6a                	je     8a0 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 836:	8d 45 10             	lea    0x10(%ebp),%eax
 839:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 83c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 83f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 841:	89 45 d0             	mov    %eax,-0x30(%ebp)
 844:	eb 36                	jmp    87c <printf+0x5c>
 846:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 84d:	8d 76 00             	lea    0x0(%esi),%esi
 850:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 853:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 858:	83 f8 25             	cmp    $0x25,%eax
 85b:	74 15                	je     872 <printf+0x52>
  write(fd, &c, 1);
 85d:	83 ec 04             	sub    $0x4,%esp
 860:	88 55 e7             	mov    %dl,-0x19(%ebp)
 863:	6a 01                	push   $0x1
 865:	57                   	push   %edi
 866:	56                   	push   %esi
 867:	e8 67 fe ff ff       	call   6d3 <write>
 86c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 86f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 872:	0f b6 13             	movzbl (%ebx),%edx
 875:	83 c3 01             	add    $0x1,%ebx
 878:	84 d2                	test   %dl,%dl
 87a:	74 24                	je     8a0 <printf+0x80>
    c = fmt[i] & 0xff;
 87c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 87f:	85 c9                	test   %ecx,%ecx
 881:	74 cd                	je     850 <printf+0x30>
      }
    } else if(state == '%'){
 883:	83 f9 25             	cmp    $0x25,%ecx
 886:	75 ea                	jne    872 <printf+0x52>
      if(c == 'd'){
 888:	83 f8 25             	cmp    $0x25,%eax
 88b:	0f 84 07 01 00 00    	je     998 <printf+0x178>
 891:	83 e8 63             	sub    $0x63,%eax
 894:	83 f8 15             	cmp    $0x15,%eax
 897:	77 17                	ja     8b0 <printf+0x90>
 899:	ff 24 85 e8 0b 00 00 	jmp    *0xbe8(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 8a0:	8d 65 f4             	lea    -0xc(%ebp),%esp
 8a3:	5b                   	pop    %ebx
 8a4:	5e                   	pop    %esi
 8a5:	5f                   	pop    %edi
 8a6:	5d                   	pop    %ebp
 8a7:	c3                   	ret    
 8a8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8af:	90                   	nop
  write(fd, &c, 1);
 8b0:	83 ec 04             	sub    $0x4,%esp
 8b3:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 8b6:	6a 01                	push   $0x1
 8b8:	57                   	push   %edi
 8b9:	56                   	push   %esi
 8ba:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 8be:	e8 10 fe ff ff       	call   6d3 <write>
        putc(fd, c);
 8c3:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 8c7:	83 c4 0c             	add    $0xc,%esp
 8ca:	88 55 e7             	mov    %dl,-0x19(%ebp)
 8cd:	6a 01                	push   $0x1
 8cf:	57                   	push   %edi
 8d0:	56                   	push   %esi
 8d1:	e8 fd fd ff ff       	call   6d3 <write>
        putc(fd, c);
 8d6:	83 c4 10             	add    $0x10,%esp
      state = 0;
 8d9:	31 c9                	xor    %ecx,%ecx
 8db:	eb 95                	jmp    872 <printf+0x52>
 8dd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 8e0:	83 ec 0c             	sub    $0xc,%esp
 8e3:	b9 10 00 00 00       	mov    $0x10,%ecx
 8e8:	6a 00                	push   $0x0
 8ea:	8b 45 d0             	mov    -0x30(%ebp),%eax
 8ed:	8b 10                	mov    (%eax),%edx
 8ef:	89 f0                	mov    %esi,%eax
 8f1:	e8 7a fe ff ff       	call   770 <printint>
        ap++;
 8f6:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 8fa:	83 c4 10             	add    $0x10,%esp
      state = 0;
 8fd:	31 c9                	xor    %ecx,%ecx
 8ff:	e9 6e ff ff ff       	jmp    872 <printf+0x52>
 904:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 908:	8b 45 d0             	mov    -0x30(%ebp),%eax
 90b:	8b 10                	mov    (%eax),%edx
        ap++;
 90d:	83 c0 04             	add    $0x4,%eax
 910:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 913:	85 d2                	test   %edx,%edx
 915:	0f 84 8d 00 00 00    	je     9a8 <printf+0x188>
        while(*s != 0){
 91b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 91e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 920:	84 c0                	test   %al,%al
 922:	0f 84 4a ff ff ff    	je     872 <printf+0x52>
 928:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 92b:	89 d3                	mov    %edx,%ebx
 92d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 930:	83 ec 04             	sub    $0x4,%esp
          s++;
 933:	83 c3 01             	add    $0x1,%ebx
 936:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 939:	6a 01                	push   $0x1
 93b:	57                   	push   %edi
 93c:	56                   	push   %esi
 93d:	e8 91 fd ff ff       	call   6d3 <write>
        while(*s != 0){
 942:	0f b6 03             	movzbl (%ebx),%eax
 945:	83 c4 10             	add    $0x10,%esp
 948:	84 c0                	test   %al,%al
 94a:	75 e4                	jne    930 <printf+0x110>
      state = 0;
 94c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 94f:	31 c9                	xor    %ecx,%ecx
 951:	e9 1c ff ff ff       	jmp    872 <printf+0x52>
 956:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 95d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 960:	83 ec 0c             	sub    $0xc,%esp
 963:	b9 0a 00 00 00       	mov    $0xa,%ecx
 968:	6a 01                	push   $0x1
 96a:	e9 7b ff ff ff       	jmp    8ea <printf+0xca>
 96f:	90                   	nop
        putc(fd, *ap);
 970:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 973:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 976:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 978:	6a 01                	push   $0x1
 97a:	57                   	push   %edi
 97b:	56                   	push   %esi
        putc(fd, *ap);
 97c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 97f:	e8 4f fd ff ff       	call   6d3 <write>
        ap++;
 984:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 988:	83 c4 10             	add    $0x10,%esp
      state = 0;
 98b:	31 c9                	xor    %ecx,%ecx
 98d:	e9 e0 fe ff ff       	jmp    872 <printf+0x52>
 992:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 998:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 99b:	83 ec 04             	sub    $0x4,%esp
 99e:	e9 2a ff ff ff       	jmp    8cd <printf+0xad>
 9a3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 9a7:	90                   	nop
          s = "(null)";
 9a8:	ba e0 0b 00 00       	mov    $0xbe0,%edx
        while(*s != 0){
 9ad:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 9b0:	b8 28 00 00 00       	mov    $0x28,%eax
 9b5:	89 d3                	mov    %edx,%ebx
 9b7:	e9 74 ff ff ff       	jmp    930 <printf+0x110>
 9bc:	66 90                	xchg   %ax,%ax
 9be:	66 90                	xchg   %ax,%ax

000009c0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 9c0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9c1:	a1 ec 0f 00 00       	mov    0xfec,%eax
{
 9c6:	89 e5                	mov    %esp,%ebp
 9c8:	57                   	push   %edi
 9c9:	56                   	push   %esi
 9ca:	53                   	push   %ebx
 9cb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 9ce:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 9d8:	89 c2                	mov    %eax,%edx
 9da:	8b 00                	mov    (%eax),%eax
 9dc:	39 ca                	cmp    %ecx,%edx
 9de:	73 30                	jae    a10 <free+0x50>
 9e0:	39 c1                	cmp    %eax,%ecx
 9e2:	72 04                	jb     9e8 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9e4:	39 c2                	cmp    %eax,%edx
 9e6:	72 f0                	jb     9d8 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 9e8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 9eb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 9ee:	39 f8                	cmp    %edi,%eax
 9f0:	74 30                	je     a22 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 9f2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 9f5:	8b 42 04             	mov    0x4(%edx),%eax
 9f8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 9fb:	39 f1                	cmp    %esi,%ecx
 9fd:	74 3a                	je     a39 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 9ff:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 a01:	5b                   	pop    %ebx
  freep = p;
 a02:	89 15 ec 0f 00 00    	mov    %edx,0xfec
}
 a08:	5e                   	pop    %esi
 a09:	5f                   	pop    %edi
 a0a:	5d                   	pop    %ebp
 a0b:	c3                   	ret    
 a0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a10:	39 c2                	cmp    %eax,%edx
 a12:	72 c4                	jb     9d8 <free+0x18>
 a14:	39 c1                	cmp    %eax,%ecx
 a16:	73 c0                	jae    9d8 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 a18:	8b 73 fc             	mov    -0x4(%ebx),%esi
 a1b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 a1e:	39 f8                	cmp    %edi,%eax
 a20:	75 d0                	jne    9f2 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 a22:	03 70 04             	add    0x4(%eax),%esi
 a25:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 a28:	8b 02                	mov    (%edx),%eax
 a2a:	8b 00                	mov    (%eax),%eax
 a2c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 a2f:	8b 42 04             	mov    0x4(%edx),%eax
 a32:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 a35:	39 f1                	cmp    %esi,%ecx
 a37:	75 c6                	jne    9ff <free+0x3f>
    p->s.size += bp->s.size;
 a39:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 a3c:	89 15 ec 0f 00 00    	mov    %edx,0xfec
    p->s.size += bp->s.size;
 a42:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 a45:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 a48:	89 0a                	mov    %ecx,(%edx)
}
 a4a:	5b                   	pop    %ebx
 a4b:	5e                   	pop    %esi
 a4c:	5f                   	pop    %edi
 a4d:	5d                   	pop    %ebp
 a4e:	c3                   	ret    
 a4f:	90                   	nop

00000a50 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 a50:	55                   	push   %ebp
 a51:	89 e5                	mov    %esp,%ebp
 a53:	57                   	push   %edi
 a54:	56                   	push   %esi
 a55:	53                   	push   %ebx
 a56:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a59:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 a5c:	8b 3d ec 0f 00 00    	mov    0xfec,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a62:	8d 70 07             	lea    0x7(%eax),%esi
 a65:	c1 ee 03             	shr    $0x3,%esi
 a68:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 a6b:	85 ff                	test   %edi,%edi
 a6d:	0f 84 9d 00 00 00    	je     b10 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a73:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 a75:	8b 4a 04             	mov    0x4(%edx),%ecx
 a78:	39 f1                	cmp    %esi,%ecx
 a7a:	73 6a                	jae    ae6 <malloc+0x96>
 a7c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 a81:	39 de                	cmp    %ebx,%esi
 a83:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 a86:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 a8d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 a90:	eb 17                	jmp    aa9 <malloc+0x59>
 a92:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a98:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 a9a:	8b 48 04             	mov    0x4(%eax),%ecx
 a9d:	39 f1                	cmp    %esi,%ecx
 a9f:	73 4f                	jae    af0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 aa1:	8b 3d ec 0f 00 00    	mov    0xfec,%edi
 aa7:	89 c2                	mov    %eax,%edx
 aa9:	39 d7                	cmp    %edx,%edi
 aab:	75 eb                	jne    a98 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 aad:	83 ec 0c             	sub    $0xc,%esp
 ab0:	ff 75 e4             	push   -0x1c(%ebp)
 ab3:	e8 83 fc ff ff       	call   73b <sbrk>
  if(p == (char*)-1)
 ab8:	83 c4 10             	add    $0x10,%esp
 abb:	83 f8 ff             	cmp    $0xffffffff,%eax
 abe:	74 1c                	je     adc <malloc+0x8c>
  hp->s.size = nu;
 ac0:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 ac3:	83 ec 0c             	sub    $0xc,%esp
 ac6:	83 c0 08             	add    $0x8,%eax
 ac9:	50                   	push   %eax
 aca:	e8 f1 fe ff ff       	call   9c0 <free>
  return freep;
 acf:	8b 15 ec 0f 00 00    	mov    0xfec,%edx
      if((p = morecore(nunits)) == 0)
 ad5:	83 c4 10             	add    $0x10,%esp
 ad8:	85 d2                	test   %edx,%edx
 ada:	75 bc                	jne    a98 <malloc+0x48>
        return 0;
  }
}
 adc:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 adf:	31 c0                	xor    %eax,%eax
}
 ae1:	5b                   	pop    %ebx
 ae2:	5e                   	pop    %esi
 ae3:	5f                   	pop    %edi
 ae4:	5d                   	pop    %ebp
 ae5:	c3                   	ret    
    if(p->s.size >= nunits){
 ae6:	89 d0                	mov    %edx,%eax
 ae8:	89 fa                	mov    %edi,%edx
 aea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 af0:	39 ce                	cmp    %ecx,%esi
 af2:	74 4c                	je     b40 <malloc+0xf0>
        p->s.size -= nunits;
 af4:	29 f1                	sub    %esi,%ecx
 af6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 af9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 afc:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 aff:	89 15 ec 0f 00 00    	mov    %edx,0xfec
}
 b05:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 b08:	83 c0 08             	add    $0x8,%eax
}
 b0b:	5b                   	pop    %ebx
 b0c:	5e                   	pop    %esi
 b0d:	5f                   	pop    %edi
 b0e:	5d                   	pop    %ebp
 b0f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 b10:	c7 05 ec 0f 00 00 f0 	movl   $0xff0,0xfec
 b17:	0f 00 00 
    base.s.size = 0;
 b1a:	bf f0 0f 00 00       	mov    $0xff0,%edi
    base.s.ptr = freep = prevp = &base;
 b1f:	c7 05 f0 0f 00 00 f0 	movl   $0xff0,0xff0
 b26:	0f 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b29:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 b2b:	c7 05 f4 0f 00 00 00 	movl   $0x0,0xff4
 b32:	00 00 00 
    if(p->s.size >= nunits){
 b35:	e9 42 ff ff ff       	jmp    a7c <malloc+0x2c>
 b3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 b40:	8b 08                	mov    (%eax),%ecx
 b42:	89 0a                	mov    %ecx,(%edx)
 b44:	eb b9                	jmp    aff <malloc+0xaf>
