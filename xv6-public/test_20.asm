
_test_20:     file format elf32-i386


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
   d:	51                   	push   %ecx
   e:	83 ec 14             	sub    $0x14,%esp
   ppid = getpid();
  11:	e8 9d 06 00 00       	call   6b3 <getpid>

   int arg1 = 11, arg2 = 22;

   size = (unsigned int)sbrk(0);
  16:	83 ec 0c             	sub    $0xc,%esp
   int arg1 = 11, arg2 = 22;
  19:	c7 45 f0 0b 00 00 00 	movl   $0xb,-0x10(%ebp)
   size = (unsigned int)sbrk(0);
  20:	6a 00                	push   $0x0
   ppid = getpid();
  22:	a3 5c 0f 00 00       	mov    %eax,0xf5c
   int arg1 = 11, arg2 = 22;
  27:	c7 45 f4 16 00 00 00 	movl   $0x16,-0xc(%ebp)
   size = (unsigned int)sbrk(0);
  2e:	e8 88 06 00 00       	call   6bb <sbrk>

   int thread_pid = thread_create(worker, &arg1, &arg2);
  33:	83 c4 0c             	add    $0xc,%esp
   size = (unsigned int)sbrk(0);
  36:	a3 54 0f 00 00       	mov    %eax,0xf54
   int thread_pid = thread_create(worker, &arg1, &arg2);
  3b:	8d 45 f4             	lea    -0xc(%ebp),%eax
  3e:	50                   	push   %eax
  3f:	8d 45 f0             	lea    -0x10(%ebp),%eax
  42:	50                   	push   %eax
  43:	68 b0 01 00 00       	push   $0x1b0
  48:	e8 33 03 00 00       	call   380 <thread_create>
   assert(thread_pid > 0);
  4d:	83 c4 10             	add    $0x10,%esp
  50:	85 c0                	test   %eax,%eax
  52:	7e 62                	jle    b6 <main+0xb6>
   
   int join_pid = thread_join();
  54:	e8 37 03 00 00       	call   390 <thread_join>
   assert(join_pid > 0);
  59:	85 c0                	test   %eax,%eax
  5b:	7e 13                	jle    70 <main+0x70>
   

   printf(1, "TEST PASSED\n");
  5d:	50                   	push   %eax
  5e:	50                   	push   %eax
  5f:	68 51 0b 00 00       	push   $0xb51
  64:	6a 01                	push   $0x1
  66:	e8 35 07 00 00       	call   7a0 <printf>
   exit();
  6b:	e8 c3 05 00 00       	call   633 <exit>
   assert(join_pid > 0);
  70:	6a 27                	push   $0x27
  72:	68 c8 0a 00 00       	push   $0xac8
  77:	68 d2 0a 00 00       	push   $0xad2
  7c:	6a 01                	push   $0x1
  7e:	e8 1d 07 00 00       	call   7a0 <printf>
  83:	83 c4 0c             	add    $0xc,%esp
  86:	68 35 0b 00 00       	push   $0xb35
  8b:	68 f8 0a 00 00       	push   $0xaf8
  90:	6a 01                	push   $0x1
  92:	e8 09 07 00 00       	call   7a0 <printf>
  97:	5a                   	pop    %edx
  98:	59                   	pop    %ecx
  99:	68 0c 0b 00 00       	push   $0xb0c
  9e:	6a 01                	push   $0x1
  a0:	e8 fb 06 00 00       	call   7a0 <printf>
  a5:	58                   	pop    %eax
  a6:	ff 35 5c 0f 00 00    	push   0xf5c
  ac:	e8 b2 05 00 00       	call   663 <kill>
  b1:	e8 7d 05 00 00       	call   633 <exit>
   assert(thread_pid > 0);
  b6:	6a 24                	push   $0x24
  b8:	68 c8 0a 00 00       	push   $0xac8
  bd:	68 d2 0a 00 00       	push   $0xad2
  c2:	6a 01                	push   $0x1
  c4:	e8 d7 06 00 00       	call   7a0 <printf>
  c9:	83 c4 0c             	add    $0xc,%esp
  cc:	68 42 0b 00 00       	push   $0xb42
  d1:	eb b8                	jmp    8b <main+0x8b>
  d3:	66 90                	xchg   %ax,%ax
  d5:	66 90                	xchg   %ax,%ax
  d7:	66 90                	xchg   %ax,%ax
  d9:	66 90                	xchg   %ax,%ax
  db:	66 90                	xchg   %ax,%ax
  dd:	66 90                	xchg   %ax,%ax
  df:	90                   	nop

000000e0 <worker2>:
}

void worker2(void *arg1, void *arg2)
{
  e0:	55                   	push   %ebp
  e1:	89 e5                	mov    %esp,%ebp
  e3:	83 ec 14             	sub    $0x14,%esp
   lock_acquire(&lock);
  e6:	68 50 0f 00 00       	push   $0xf50
  eb:	e8 b0 02 00 00       	call   3a0 <lock_acquire>
   assert((unsigned int)sbrk(0) == size);
  f0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  f7:	e8 bf 05 00 00       	call   6bb <sbrk>
  fc:	83 c4 10             	add    $0x10,%esp
  ff:	3b 05 54 0f 00 00    	cmp    0xf54,%eax
 105:	74 46                	je     14d <worker2+0x6d>
 107:	6a 31                	push   $0x31
   global++;
   lock_release(&lock);

   
   lock_acquire(&lock2);
   assert((unsigned int)sbrk(0) == size);
 109:	68 c8 0a 00 00       	push   $0xac8
 10e:	68 d2 0a 00 00       	push   $0xad2
 113:	6a 01                	push   $0x1
 115:	e8 86 06 00 00       	call   7a0 <printf>
 11a:	83 c4 0c             	add    $0xc,%esp
 11d:	68 da 0a 00 00       	push   $0xada
 122:	68 f8 0a 00 00       	push   $0xaf8
 127:	6a 01                	push   $0x1
 129:	e8 72 06 00 00       	call   7a0 <printf>
 12e:	58                   	pop    %eax
 12f:	5a                   	pop    %edx
 130:	68 0c 0b 00 00       	push   $0xb0c
 135:	6a 01                	push   $0x1
 137:	e8 64 06 00 00       	call   7a0 <printf>
 13c:	59                   	pop    %ecx
 13d:	ff 35 5c 0f 00 00    	push   0xf5c
 143:	e8 1b 05 00 00       	call   663 <kill>
 148:	e8 e6 04 00 00       	call   633 <exit>
   lock_release(&lock);
 14d:	83 ec 0c             	sub    $0xc,%esp
   global++;
 150:	83 05 58 0f 00 00 01 	addl   $0x1,0xf58
   lock_release(&lock);
 157:	68 50 0f 00 00       	push   $0xf50
 15c:	e8 5f 02 00 00       	call   3c0 <lock_release>
   lock_acquire(&lock2);
 161:	c7 04 24 4c 0f 00 00 	movl   $0xf4c,(%esp)
 168:	e8 33 02 00 00       	call   3a0 <lock_acquire>
   assert((unsigned int)sbrk(0) == size);
 16d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 174:	e8 42 05 00 00       	call   6bb <sbrk>
 179:	83 c4 10             	add    $0x10,%esp
 17c:	3b 05 54 0f 00 00    	cmp    0xf54,%eax
 182:	74 04                	je     188 <worker2+0xa8>
 184:	6a 37                	push   $0x37
 186:	eb 81                	jmp    109 <worker2+0x29>
   global++;
   lock_release(&lock2);
 188:	83 ec 0c             	sub    $0xc,%esp
   global++;
 18b:	83 05 58 0f 00 00 01 	addl   $0x1,0xf58
   lock_release(&lock2);
 192:	68 4c 0f 00 00       	push   $0xf4c
 197:	e8 24 02 00 00       	call   3c0 <lock_release>

   
   exit();
 19c:	e8 92 04 00 00       	call   633 <exit>
 1a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1a8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1af:	90                   	nop

000001b0 <worker>:
}


void worker(void *arg1, void *arg2) {
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	83 ec 14             	sub    $0x14,%esp
   lock_init(&lock);
 1b6:	68 50 0f 00 00       	push   $0xf50
 1bb:	e8 10 02 00 00       	call   3d0 <lock_init>
   lock_init(&lock2);
 1c0:	c7 04 24 4c 0f 00 00 	movl   $0xf4c,(%esp)
 1c7:	e8 04 02 00 00       	call   3d0 <lock_init>
   lock_acquire(&lock);
 1cc:	c7 04 24 50 0f 00 00 	movl   $0xf50,(%esp)
 1d3:	e8 c8 01 00 00       	call   3a0 <lock_acquire>
   lock_acquire(&lock2);
 1d8:	c7 04 24 4c 0f 00 00 	movl   $0xf4c,(%esp)
 1df:	e8 bc 01 00 00       	call   3a0 <lock_acquire>

   int nested_thread_id = thread_create(worker2, 0, 0);
 1e4:	83 c4 0c             	add    $0xc,%esp
 1e7:	6a 00                	push   $0x0
 1e9:	6a 00                	push   $0x0
 1eb:	68 e0 00 00 00       	push   $0xe0
 1f0:	e8 8b 01 00 00       	call   380 <thread_create>
    assert(nested_thread_id > 0);
 1f5:	83 c4 10             	add    $0x10,%esp
 1f8:	85 c0                	test   %eax,%eax
 1fa:	0f 8e 39 01 00 00    	jle    339 <worker+0x189>
   size = (unsigned int)sbrk(0);
 200:	83 ec 0c             	sub    $0xc,%esp
 203:	6a 00                	push   $0x0
 205:	e8 b1 04 00 00       	call   6bb <sbrk>

   while (global < num_threads) {
 20a:	83 c4 10             	add    $0x10,%esp
   size = (unsigned int)sbrk(0);
 20d:	a3 54 0f 00 00       	mov    %eax,0xf54
   while (global < num_threads) {
 212:	a1 48 0f 00 00       	mov    0xf48,%eax
 217:	39 05 58 0f 00 00    	cmp    %eax,0xf58
 21d:	7d 36                	jge    255 <worker+0xa5>
 21f:	90                   	nop
      lock_release(&lock);
 220:	83 ec 0c             	sub    $0xc,%esp
 223:	68 50 0f 00 00       	push   $0xf50
 228:	e8 93 01 00 00       	call   3c0 <lock_release>
      sleep(100);
 22d:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 234:	e8 8a 04 00 00       	call   6c3 <sleep>
      lock_acquire(&lock);
 239:	c7 04 24 50 0f 00 00 	movl   $0xf50,(%esp)
 240:	e8 5b 01 00 00       	call   3a0 <lock_acquire>
   while (global < num_threads) {
 245:	a1 48 0f 00 00       	mov    0xf48,%eax
 24a:	83 c4 10             	add    $0x10,%esp
 24d:	39 05 58 0f 00 00    	cmp    %eax,0xf58
 253:	7c cb                	jl     220 <worker+0x70>
   }

   global = 0;
 255:	c7 05 58 0f 00 00 00 	movl   $0x0,0xf58
 25c:	00 00 00 
   sbrk(10000);
 25f:	83 ec 0c             	sub    $0xc,%esp
 262:	68 10 27 00 00       	push   $0x2710
 267:	e8 4f 04 00 00       	call   6bb <sbrk>
   size = (unsigned int)sbrk(0);
 26c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 273:	e8 43 04 00 00       	call   6bb <sbrk>
   lock_release(&lock);
 278:	c7 04 24 50 0f 00 00 	movl   $0xf50,(%esp)
   size = (unsigned int)sbrk(0);
 27f:	a3 54 0f 00 00       	mov    %eax,0xf54
   lock_release(&lock);
 284:	e8 37 01 00 00       	call   3c0 <lock_release>

   while (global < num_threads) {
 289:	a1 48 0f 00 00       	mov    0xf48,%eax
 28e:	83 c4 10             	add    $0x10,%esp
 291:	39 05 58 0f 00 00    	cmp    %eax,0xf58
 297:	7d 3c                	jge    2d5 <worker+0x125>
 299:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      lock_release(&lock2);
 2a0:	83 ec 0c             	sub    $0xc,%esp
 2a3:	68 4c 0f 00 00       	push   $0xf4c
 2a8:	e8 13 01 00 00       	call   3c0 <lock_release>
      sleep(100);
 2ad:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 2b4:	e8 0a 04 00 00       	call   6c3 <sleep>
      lock_acquire(&lock2);
 2b9:	c7 04 24 4c 0f 00 00 	movl   $0xf4c,(%esp)
 2c0:	e8 db 00 00 00       	call   3a0 <lock_acquire>
   while (global < num_threads) {
 2c5:	a1 48 0f 00 00       	mov    0xf48,%eax
 2ca:	83 c4 10             	add    $0x10,%esp
 2cd:	39 05 58 0f 00 00    	cmp    %eax,0xf58
 2d3:	7c cb                	jl     2a0 <worker+0xf0>
   }
   lock_release(&lock2);
 2d5:	83 ec 0c             	sub    $0xc,%esp
 2d8:	68 4c 0f 00 00       	push   $0xf4c
 2dd:	e8 de 00 00 00       	call   3c0 <lock_release>

   int nested_join_pid = thread_join();
 2e2:	e8 a9 00 00 00       	call   390 <thread_join>
   assert(nested_join_pid > 0);
 2e7:	83 c4 10             	add    $0x10,%esp
 2ea:	85 c0                	test   %eax,%eax
 2ec:	7e 05                	jle    2f3 <worker+0x143>




   exit();
 2ee:	e8 40 03 00 00       	call   633 <exit>
   assert(nested_join_pid > 0);
 2f3:	6a 5d                	push   $0x5d
 2f5:	68 c8 0a 00 00       	push   $0xac8
 2fa:	68 d2 0a 00 00       	push   $0xad2
 2ff:	6a 01                	push   $0x1
 301:	e8 9a 04 00 00       	call   7a0 <printf>
 306:	83 c4 0c             	add    $0xc,%esp
 309:	68 2e 0b 00 00       	push   $0xb2e
 30e:	68 f8 0a 00 00       	push   $0xaf8
 313:	6a 01                	push   $0x1
 315:	e8 86 04 00 00       	call   7a0 <printf>
 31a:	58                   	pop    %eax
 31b:	5a                   	pop    %edx
 31c:	68 0c 0b 00 00       	push   $0xb0c
 321:	6a 01                	push   $0x1
 323:	e8 78 04 00 00       	call   7a0 <printf>
 328:	59                   	pop    %ecx
 329:	ff 35 5c 0f 00 00    	push   0xf5c
 32f:	e8 2f 03 00 00       	call   663 <kill>
 334:	e8 fa 02 00 00       	call   633 <exit>
    assert(nested_thread_id > 0);
 339:	6a 47                	push   $0x47
 33b:	68 c8 0a 00 00       	push   $0xac8
 340:	68 d2 0a 00 00       	push   $0xad2
 345:	6a 01                	push   $0x1
 347:	e8 54 04 00 00       	call   7a0 <printf>
 34c:	83 c4 0c             	add    $0xc,%esp
 34f:	68 19 0b 00 00       	push   $0xb19
 354:	eb b8                	jmp    30e <worker+0x15e>
 356:	66 90                	xchg   %ax,%ax
 358:	66 90                	xchg   %ax,%ax
 35a:	66 90                	xchg   %ax,%ax
 35c:	66 90                	xchg   %ax,%ax
 35e:	66 90                	xchg   %ax,%ax

00000360 <test_and_set>:
#include "stat.h"
#include "fcntl.h"
#include "user.h"
#include "x86.h"

int test_and_set(int *old_ptr, int new_ptr) {
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *old_ptr;
  *old_ptr = new_ptr;
 366:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  int old = *old_ptr;
 369:	8b 10                	mov    (%eax),%edx
  *old_ptr = new_ptr;
 36b:	89 08                	mov    %ecx,(%eax)
  return old;
}
 36d:	5d                   	pop    %ebp
 36e:	89 d0                	mov    %edx,%eax
 370:	c3                   	ret    
 371:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 378:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 37f:	90                   	nop

00000380 <thread_create>:

int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
  return 0;
}
 380:	31 c0                	xor    %eax,%eax
 382:	c3                   	ret    
 383:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 38a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000390 <thread_join>:

int thread_join() {
  return 0;
}
 390:	31 c0                	xor    %eax,%eax
 392:	c3                   	ret    
 393:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 39a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000003a0 <lock_acquire>:

void lock_acquire(lock_t *lock){
 3a0:	55                   	push   %ebp
 3a1:	89 e5                	mov    %esp,%ebp
 3a3:	8b 45 08             	mov    0x8(%ebp),%eax
  while(test_and_set(&lock->flag, 1) == 1)
 3a6:	83 38 01             	cmpl   $0x1,(%eax)
 3a9:	75 05                	jne    3b0 <lock_acquire+0x10>
 3ab:	eb fe                	jmp    3ab <lock_acquire+0xb>
 3ad:	8d 76 00             	lea    0x0(%esi),%esi
 3b0:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
    ;
}
 3b6:	5d                   	pop    %ebp
 3b7:	c3                   	ret    
 3b8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3bf:	90                   	nop

000003c0 <lock_release>:

void lock_release(lock_t *lock) {
 3c0:	55                   	push   %ebp
 3c1:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 3c3:	8b 45 08             	mov    0x8(%ebp),%eax
 3c6:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 3cc:	5d                   	pop    %ebp
 3cd:	c3                   	ret    
 3ce:	66 90                	xchg   %ax,%ax

000003d0 <lock_init>:
 3d0:	55                   	push   %ebp
 3d1:	89 e5                	mov    %esp,%ebp
 3d3:	8b 45 08             	mov    0x8(%ebp),%eax
 3d6:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 3dc:	5d                   	pop    %ebp
 3dd:	c3                   	ret    
 3de:	66 90                	xchg   %ax,%ax

000003e0 <strcpy>:
  lock->flag = 0;
}

char*
strcpy(char *s, const char *t)
{
 3e0:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 3e1:	31 c0                	xor    %eax,%eax
{
 3e3:	89 e5                	mov    %esp,%ebp
 3e5:	53                   	push   %ebx
 3e6:	8b 4d 08             	mov    0x8(%ebp),%ecx
 3e9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 3ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 3f0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 3f4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 3f7:	83 c0 01             	add    $0x1,%eax
 3fa:	84 d2                	test   %dl,%dl
 3fc:	75 f2                	jne    3f0 <strcpy+0x10>
    ;
  return os;
}
 3fe:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 401:	89 c8                	mov    %ecx,%eax
 403:	c9                   	leave  
 404:	c3                   	ret    
 405:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 40c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000410 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 410:	55                   	push   %ebp
 411:	89 e5                	mov    %esp,%ebp
 413:	53                   	push   %ebx
 414:	8b 55 08             	mov    0x8(%ebp),%edx
 417:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 41a:	0f b6 02             	movzbl (%edx),%eax
 41d:	84 c0                	test   %al,%al
 41f:	75 17                	jne    438 <strcmp+0x28>
 421:	eb 3a                	jmp    45d <strcmp+0x4d>
 423:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 427:	90                   	nop
 428:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 42c:	83 c2 01             	add    $0x1,%edx
 42f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 432:	84 c0                	test   %al,%al
 434:	74 1a                	je     450 <strcmp+0x40>
    p++, q++;
 436:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 438:	0f b6 19             	movzbl (%ecx),%ebx
 43b:	38 c3                	cmp    %al,%bl
 43d:	74 e9                	je     428 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 43f:	29 d8                	sub    %ebx,%eax
}
 441:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 444:	c9                   	leave  
 445:	c3                   	ret    
 446:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 44d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 450:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 454:	31 c0                	xor    %eax,%eax
 456:	29 d8                	sub    %ebx,%eax
}
 458:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 45b:	c9                   	leave  
 45c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 45d:	0f b6 19             	movzbl (%ecx),%ebx
 460:	31 c0                	xor    %eax,%eax
 462:	eb db                	jmp    43f <strcmp+0x2f>
 464:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 46b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 46f:	90                   	nop

00000470 <strlen>:

uint
strlen(const char *s)
{
 470:	55                   	push   %ebp
 471:	89 e5                	mov    %esp,%ebp
 473:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 476:	80 3a 00             	cmpb   $0x0,(%edx)
 479:	74 15                	je     490 <strlen+0x20>
 47b:	31 c0                	xor    %eax,%eax
 47d:	8d 76 00             	lea    0x0(%esi),%esi
 480:	83 c0 01             	add    $0x1,%eax
 483:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 487:	89 c1                	mov    %eax,%ecx
 489:	75 f5                	jne    480 <strlen+0x10>
    ;
  return n;
}
 48b:	89 c8                	mov    %ecx,%eax
 48d:	5d                   	pop    %ebp
 48e:	c3                   	ret    
 48f:	90                   	nop
  for(n = 0; s[n]; n++)
 490:	31 c9                	xor    %ecx,%ecx
}
 492:	5d                   	pop    %ebp
 493:	89 c8                	mov    %ecx,%eax
 495:	c3                   	ret    
 496:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 49d:	8d 76 00             	lea    0x0(%esi),%esi

000004a0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 4a0:	55                   	push   %ebp
 4a1:	89 e5                	mov    %esp,%ebp
 4a3:	57                   	push   %edi
 4a4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 4a7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 4aa:	8b 45 0c             	mov    0xc(%ebp),%eax
 4ad:	89 d7                	mov    %edx,%edi
 4af:	fc                   	cld    
 4b0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 4b2:	8b 7d fc             	mov    -0x4(%ebp),%edi
 4b5:	89 d0                	mov    %edx,%eax
 4b7:	c9                   	leave  
 4b8:	c3                   	ret    
 4b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000004c0 <strchr>:

char*
strchr(const char *s, char c)
{
 4c0:	55                   	push   %ebp
 4c1:	89 e5                	mov    %esp,%ebp
 4c3:	8b 45 08             	mov    0x8(%ebp),%eax
 4c6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 4ca:	0f b6 10             	movzbl (%eax),%edx
 4cd:	84 d2                	test   %dl,%dl
 4cf:	75 12                	jne    4e3 <strchr+0x23>
 4d1:	eb 1d                	jmp    4f0 <strchr+0x30>
 4d3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4d7:	90                   	nop
 4d8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 4dc:	83 c0 01             	add    $0x1,%eax
 4df:	84 d2                	test   %dl,%dl
 4e1:	74 0d                	je     4f0 <strchr+0x30>
    if(*s == c)
 4e3:	38 d1                	cmp    %dl,%cl
 4e5:	75 f1                	jne    4d8 <strchr+0x18>
      return (char*)s;
  return 0;
}
 4e7:	5d                   	pop    %ebp
 4e8:	c3                   	ret    
 4e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 4f0:	31 c0                	xor    %eax,%eax
}
 4f2:	5d                   	pop    %ebp
 4f3:	c3                   	ret    
 4f4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4fb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4ff:	90                   	nop

00000500 <gets>:

char*
gets(char *buf, int max)
{
 500:	55                   	push   %ebp
 501:	89 e5                	mov    %esp,%ebp
 503:	57                   	push   %edi
 504:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 505:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 508:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 509:	31 db                	xor    %ebx,%ebx
{
 50b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 50e:	eb 27                	jmp    537 <gets+0x37>
    cc = read(0, &c, 1);
 510:	83 ec 04             	sub    $0x4,%esp
 513:	6a 01                	push   $0x1
 515:	57                   	push   %edi
 516:	6a 00                	push   $0x0
 518:	e8 2e 01 00 00       	call   64b <read>
    if(cc < 1)
 51d:	83 c4 10             	add    $0x10,%esp
 520:	85 c0                	test   %eax,%eax
 522:	7e 1d                	jle    541 <gets+0x41>
      break;
    buf[i++] = c;
 524:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 528:	8b 55 08             	mov    0x8(%ebp),%edx
 52b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 52f:	3c 0a                	cmp    $0xa,%al
 531:	74 1d                	je     550 <gets+0x50>
 533:	3c 0d                	cmp    $0xd,%al
 535:	74 19                	je     550 <gets+0x50>
  for(i=0; i+1 < max; ){
 537:	89 de                	mov    %ebx,%esi
 539:	83 c3 01             	add    $0x1,%ebx
 53c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 53f:	7c cf                	jl     510 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 541:	8b 45 08             	mov    0x8(%ebp),%eax
 544:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 548:	8d 65 f4             	lea    -0xc(%ebp),%esp
 54b:	5b                   	pop    %ebx
 54c:	5e                   	pop    %esi
 54d:	5f                   	pop    %edi
 54e:	5d                   	pop    %ebp
 54f:	c3                   	ret    
  buf[i] = '\0';
 550:	8b 45 08             	mov    0x8(%ebp),%eax
 553:	89 de                	mov    %ebx,%esi
 555:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 559:	8d 65 f4             	lea    -0xc(%ebp),%esp
 55c:	5b                   	pop    %ebx
 55d:	5e                   	pop    %esi
 55e:	5f                   	pop    %edi
 55f:	5d                   	pop    %ebp
 560:	c3                   	ret    
 561:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 568:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 56f:	90                   	nop

00000570 <stat>:

int
stat(const char *n, struct stat *st)
{
 570:	55                   	push   %ebp
 571:	89 e5                	mov    %esp,%ebp
 573:	56                   	push   %esi
 574:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 575:	83 ec 08             	sub    $0x8,%esp
 578:	6a 00                	push   $0x0
 57a:	ff 75 08             	push   0x8(%ebp)
 57d:	e8 f1 00 00 00       	call   673 <open>
  if(fd < 0)
 582:	83 c4 10             	add    $0x10,%esp
 585:	85 c0                	test   %eax,%eax
 587:	78 27                	js     5b0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 589:	83 ec 08             	sub    $0x8,%esp
 58c:	ff 75 0c             	push   0xc(%ebp)
 58f:	89 c3                	mov    %eax,%ebx
 591:	50                   	push   %eax
 592:	e8 f4 00 00 00       	call   68b <fstat>
  close(fd);
 597:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 59a:	89 c6                	mov    %eax,%esi
  close(fd);
 59c:	e8 ba 00 00 00       	call   65b <close>
  return r;
 5a1:	83 c4 10             	add    $0x10,%esp
}
 5a4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 5a7:	89 f0                	mov    %esi,%eax
 5a9:	5b                   	pop    %ebx
 5aa:	5e                   	pop    %esi
 5ab:	5d                   	pop    %ebp
 5ac:	c3                   	ret    
 5ad:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 5b0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 5b5:	eb ed                	jmp    5a4 <stat+0x34>
 5b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5be:	66 90                	xchg   %ax,%ax

000005c0 <atoi>:

int
atoi(const char *s)
{
 5c0:	55                   	push   %ebp
 5c1:	89 e5                	mov    %esp,%ebp
 5c3:	53                   	push   %ebx
 5c4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 5c7:	0f be 02             	movsbl (%edx),%eax
 5ca:	8d 48 d0             	lea    -0x30(%eax),%ecx
 5cd:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 5d0:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 5d5:	77 1e                	ja     5f5 <atoi+0x35>
 5d7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5de:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 5e0:	83 c2 01             	add    $0x1,%edx
 5e3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 5e6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 5ea:	0f be 02             	movsbl (%edx),%eax
 5ed:	8d 58 d0             	lea    -0x30(%eax),%ebx
 5f0:	80 fb 09             	cmp    $0x9,%bl
 5f3:	76 eb                	jbe    5e0 <atoi+0x20>
  return n;
}
 5f5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5f8:	89 c8                	mov    %ecx,%eax
 5fa:	c9                   	leave  
 5fb:	c3                   	ret    
 5fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000600 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 600:	55                   	push   %ebp
 601:	89 e5                	mov    %esp,%ebp
 603:	57                   	push   %edi
 604:	8b 45 10             	mov    0x10(%ebp),%eax
 607:	8b 55 08             	mov    0x8(%ebp),%edx
 60a:	56                   	push   %esi
 60b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 60e:	85 c0                	test   %eax,%eax
 610:	7e 13                	jle    625 <memmove+0x25>
 612:	01 d0                	add    %edx,%eax
  dst = vdst;
 614:	89 d7                	mov    %edx,%edi
 616:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 61d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 620:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 621:	39 f8                	cmp    %edi,%eax
 623:	75 fb                	jne    620 <memmove+0x20>
  return vdst;
}
 625:	5e                   	pop    %esi
 626:	89 d0                	mov    %edx,%eax
 628:	5f                   	pop    %edi
 629:	5d                   	pop    %ebp
 62a:	c3                   	ret    

0000062b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 62b:	b8 01 00 00 00       	mov    $0x1,%eax
 630:	cd 40                	int    $0x40
 632:	c3                   	ret    

00000633 <exit>:
SYSCALL(exit)
 633:	b8 02 00 00 00       	mov    $0x2,%eax
 638:	cd 40                	int    $0x40
 63a:	c3                   	ret    

0000063b <wait>:
SYSCALL(wait)
 63b:	b8 03 00 00 00       	mov    $0x3,%eax
 640:	cd 40                	int    $0x40
 642:	c3                   	ret    

00000643 <pipe>:
SYSCALL(pipe)
 643:	b8 04 00 00 00       	mov    $0x4,%eax
 648:	cd 40                	int    $0x40
 64a:	c3                   	ret    

0000064b <read>:
SYSCALL(read)
 64b:	b8 05 00 00 00       	mov    $0x5,%eax
 650:	cd 40                	int    $0x40
 652:	c3                   	ret    

00000653 <write>:
SYSCALL(write)
 653:	b8 10 00 00 00       	mov    $0x10,%eax
 658:	cd 40                	int    $0x40
 65a:	c3                   	ret    

0000065b <close>:
SYSCALL(close)
 65b:	b8 15 00 00 00       	mov    $0x15,%eax
 660:	cd 40                	int    $0x40
 662:	c3                   	ret    

00000663 <kill>:
SYSCALL(kill)
 663:	b8 06 00 00 00       	mov    $0x6,%eax
 668:	cd 40                	int    $0x40
 66a:	c3                   	ret    

0000066b <exec>:
SYSCALL(exec)
 66b:	b8 07 00 00 00       	mov    $0x7,%eax
 670:	cd 40                	int    $0x40
 672:	c3                   	ret    

00000673 <open>:
SYSCALL(open)
 673:	b8 0f 00 00 00       	mov    $0xf,%eax
 678:	cd 40                	int    $0x40
 67a:	c3                   	ret    

0000067b <mknod>:
SYSCALL(mknod)
 67b:	b8 11 00 00 00       	mov    $0x11,%eax
 680:	cd 40                	int    $0x40
 682:	c3                   	ret    

00000683 <unlink>:
SYSCALL(unlink)
 683:	b8 12 00 00 00       	mov    $0x12,%eax
 688:	cd 40                	int    $0x40
 68a:	c3                   	ret    

0000068b <fstat>:
SYSCALL(fstat)
 68b:	b8 08 00 00 00       	mov    $0x8,%eax
 690:	cd 40                	int    $0x40
 692:	c3                   	ret    

00000693 <link>:
SYSCALL(link)
 693:	b8 13 00 00 00       	mov    $0x13,%eax
 698:	cd 40                	int    $0x40
 69a:	c3                   	ret    

0000069b <mkdir>:
SYSCALL(mkdir)
 69b:	b8 14 00 00 00       	mov    $0x14,%eax
 6a0:	cd 40                	int    $0x40
 6a2:	c3                   	ret    

000006a3 <chdir>:
SYSCALL(chdir)
 6a3:	b8 09 00 00 00       	mov    $0x9,%eax
 6a8:	cd 40                	int    $0x40
 6aa:	c3                   	ret    

000006ab <dup>:
SYSCALL(dup)
 6ab:	b8 0a 00 00 00       	mov    $0xa,%eax
 6b0:	cd 40                	int    $0x40
 6b2:	c3                   	ret    

000006b3 <getpid>:
SYSCALL(getpid)
 6b3:	b8 0b 00 00 00       	mov    $0xb,%eax
 6b8:	cd 40                	int    $0x40
 6ba:	c3                   	ret    

000006bb <sbrk>:
SYSCALL(sbrk)
 6bb:	b8 0c 00 00 00       	mov    $0xc,%eax
 6c0:	cd 40                	int    $0x40
 6c2:	c3                   	ret    

000006c3 <sleep>:
SYSCALL(sleep)
 6c3:	b8 0d 00 00 00       	mov    $0xd,%eax
 6c8:	cd 40                	int    $0x40
 6ca:	c3                   	ret    

000006cb <uptime>:
SYSCALL(uptime)
 6cb:	b8 0e 00 00 00       	mov    $0xe,%eax
 6d0:	cd 40                	int    $0x40
 6d2:	c3                   	ret    

000006d3 <clone>:
SYSCALL(clone)
 6d3:	b8 16 00 00 00       	mov    $0x16,%eax
 6d8:	cd 40                	int    $0x40
 6da:	c3                   	ret    

000006db <join>:
 6db:	b8 17 00 00 00       	mov    $0x17,%eax
 6e0:	cd 40                	int    $0x40
 6e2:	c3                   	ret    
 6e3:	66 90                	xchg   %ax,%ax
 6e5:	66 90                	xchg   %ax,%ax
 6e7:	66 90                	xchg   %ax,%ax
 6e9:	66 90                	xchg   %ax,%ax
 6eb:	66 90                	xchg   %ax,%ax
 6ed:	66 90                	xchg   %ax,%ax
 6ef:	90                   	nop

000006f0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 6f0:	55                   	push   %ebp
 6f1:	89 e5                	mov    %esp,%ebp
 6f3:	57                   	push   %edi
 6f4:	56                   	push   %esi
 6f5:	53                   	push   %ebx
 6f6:	83 ec 3c             	sub    $0x3c,%esp
 6f9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 6fc:	89 d1                	mov    %edx,%ecx
{
 6fe:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 701:	85 d2                	test   %edx,%edx
 703:	0f 89 7f 00 00 00    	jns    788 <printint+0x98>
 709:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 70d:	74 79                	je     788 <printint+0x98>
    neg = 1;
 70f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 716:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 718:	31 db                	xor    %ebx,%ebx
 71a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 71d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 720:	89 c8                	mov    %ecx,%eax
 722:	31 d2                	xor    %edx,%edx
 724:	89 cf                	mov    %ecx,%edi
 726:	f7 75 c4             	divl   -0x3c(%ebp)
 729:	0f b6 92 c0 0b 00 00 	movzbl 0xbc0(%edx),%edx
 730:	89 45 c0             	mov    %eax,-0x40(%ebp)
 733:	89 d8                	mov    %ebx,%eax
 735:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 738:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 73b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 73e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 741:	76 dd                	jbe    720 <printint+0x30>
  if(neg)
 743:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 746:	85 c9                	test   %ecx,%ecx
 748:	74 0c                	je     756 <printint+0x66>
    buf[i++] = '-';
 74a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 74f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 751:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 756:	8b 7d b8             	mov    -0x48(%ebp),%edi
 759:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 75d:	eb 07                	jmp    766 <printint+0x76>
 75f:	90                   	nop
    putc(fd, buf[i]);
 760:	0f b6 13             	movzbl (%ebx),%edx
 763:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 766:	83 ec 04             	sub    $0x4,%esp
 769:	88 55 d7             	mov    %dl,-0x29(%ebp)
 76c:	6a 01                	push   $0x1
 76e:	56                   	push   %esi
 76f:	57                   	push   %edi
 770:	e8 de fe ff ff       	call   653 <write>
  while(--i >= 0)
 775:	83 c4 10             	add    $0x10,%esp
 778:	39 de                	cmp    %ebx,%esi
 77a:	75 e4                	jne    760 <printint+0x70>
}
 77c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 77f:	5b                   	pop    %ebx
 780:	5e                   	pop    %esi
 781:	5f                   	pop    %edi
 782:	5d                   	pop    %ebp
 783:	c3                   	ret    
 784:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 788:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 78f:	eb 87                	jmp    718 <printint+0x28>
 791:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 798:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 79f:	90                   	nop

000007a0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 7a0:	55                   	push   %ebp
 7a1:	89 e5                	mov    %esp,%ebp
 7a3:	57                   	push   %edi
 7a4:	56                   	push   %esi
 7a5:	53                   	push   %ebx
 7a6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 7a9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 7ac:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 7af:	0f b6 13             	movzbl (%ebx),%edx
 7b2:	84 d2                	test   %dl,%dl
 7b4:	74 6a                	je     820 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 7b6:	8d 45 10             	lea    0x10(%ebp),%eax
 7b9:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 7bc:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 7bf:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 7c1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 7c4:	eb 36                	jmp    7fc <printf+0x5c>
 7c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7cd:	8d 76 00             	lea    0x0(%esi),%esi
 7d0:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 7d3:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 7d8:	83 f8 25             	cmp    $0x25,%eax
 7db:	74 15                	je     7f2 <printf+0x52>
  write(fd, &c, 1);
 7dd:	83 ec 04             	sub    $0x4,%esp
 7e0:	88 55 e7             	mov    %dl,-0x19(%ebp)
 7e3:	6a 01                	push   $0x1
 7e5:	57                   	push   %edi
 7e6:	56                   	push   %esi
 7e7:	e8 67 fe ff ff       	call   653 <write>
 7ec:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 7ef:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 7f2:	0f b6 13             	movzbl (%ebx),%edx
 7f5:	83 c3 01             	add    $0x1,%ebx
 7f8:	84 d2                	test   %dl,%dl
 7fa:	74 24                	je     820 <printf+0x80>
    c = fmt[i] & 0xff;
 7fc:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 7ff:	85 c9                	test   %ecx,%ecx
 801:	74 cd                	je     7d0 <printf+0x30>
      }
    } else if(state == '%'){
 803:	83 f9 25             	cmp    $0x25,%ecx
 806:	75 ea                	jne    7f2 <printf+0x52>
      if(c == 'd'){
 808:	83 f8 25             	cmp    $0x25,%eax
 80b:	0f 84 07 01 00 00    	je     918 <printf+0x178>
 811:	83 e8 63             	sub    $0x63,%eax
 814:	83 f8 15             	cmp    $0x15,%eax
 817:	77 17                	ja     830 <printf+0x90>
 819:	ff 24 85 68 0b 00 00 	jmp    *0xb68(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 820:	8d 65 f4             	lea    -0xc(%ebp),%esp
 823:	5b                   	pop    %ebx
 824:	5e                   	pop    %esi
 825:	5f                   	pop    %edi
 826:	5d                   	pop    %ebp
 827:	c3                   	ret    
 828:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 82f:	90                   	nop
  write(fd, &c, 1);
 830:	83 ec 04             	sub    $0x4,%esp
 833:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 836:	6a 01                	push   $0x1
 838:	57                   	push   %edi
 839:	56                   	push   %esi
 83a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 83e:	e8 10 fe ff ff       	call   653 <write>
        putc(fd, c);
 843:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 847:	83 c4 0c             	add    $0xc,%esp
 84a:	88 55 e7             	mov    %dl,-0x19(%ebp)
 84d:	6a 01                	push   $0x1
 84f:	57                   	push   %edi
 850:	56                   	push   %esi
 851:	e8 fd fd ff ff       	call   653 <write>
        putc(fd, c);
 856:	83 c4 10             	add    $0x10,%esp
      state = 0;
 859:	31 c9                	xor    %ecx,%ecx
 85b:	eb 95                	jmp    7f2 <printf+0x52>
 85d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 860:	83 ec 0c             	sub    $0xc,%esp
 863:	b9 10 00 00 00       	mov    $0x10,%ecx
 868:	6a 00                	push   $0x0
 86a:	8b 45 d0             	mov    -0x30(%ebp),%eax
 86d:	8b 10                	mov    (%eax),%edx
 86f:	89 f0                	mov    %esi,%eax
 871:	e8 7a fe ff ff       	call   6f0 <printint>
        ap++;
 876:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 87a:	83 c4 10             	add    $0x10,%esp
      state = 0;
 87d:	31 c9                	xor    %ecx,%ecx
 87f:	e9 6e ff ff ff       	jmp    7f2 <printf+0x52>
 884:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 888:	8b 45 d0             	mov    -0x30(%ebp),%eax
 88b:	8b 10                	mov    (%eax),%edx
        ap++;
 88d:	83 c0 04             	add    $0x4,%eax
 890:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 893:	85 d2                	test   %edx,%edx
 895:	0f 84 8d 00 00 00    	je     928 <printf+0x188>
        while(*s != 0){
 89b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 89e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 8a0:	84 c0                	test   %al,%al
 8a2:	0f 84 4a ff ff ff    	je     7f2 <printf+0x52>
 8a8:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 8ab:	89 d3                	mov    %edx,%ebx
 8ad:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 8b0:	83 ec 04             	sub    $0x4,%esp
          s++;
 8b3:	83 c3 01             	add    $0x1,%ebx
 8b6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 8b9:	6a 01                	push   $0x1
 8bb:	57                   	push   %edi
 8bc:	56                   	push   %esi
 8bd:	e8 91 fd ff ff       	call   653 <write>
        while(*s != 0){
 8c2:	0f b6 03             	movzbl (%ebx),%eax
 8c5:	83 c4 10             	add    $0x10,%esp
 8c8:	84 c0                	test   %al,%al
 8ca:	75 e4                	jne    8b0 <printf+0x110>
      state = 0;
 8cc:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 8cf:	31 c9                	xor    %ecx,%ecx
 8d1:	e9 1c ff ff ff       	jmp    7f2 <printf+0x52>
 8d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8dd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 8e0:	83 ec 0c             	sub    $0xc,%esp
 8e3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 8e8:	6a 01                	push   $0x1
 8ea:	e9 7b ff ff ff       	jmp    86a <printf+0xca>
 8ef:	90                   	nop
        putc(fd, *ap);
 8f0:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 8f3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 8f6:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 8f8:	6a 01                	push   $0x1
 8fa:	57                   	push   %edi
 8fb:	56                   	push   %esi
        putc(fd, *ap);
 8fc:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 8ff:	e8 4f fd ff ff       	call   653 <write>
        ap++;
 904:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 908:	83 c4 10             	add    $0x10,%esp
      state = 0;
 90b:	31 c9                	xor    %ecx,%ecx
 90d:	e9 e0 fe ff ff       	jmp    7f2 <printf+0x52>
 912:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 918:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 91b:	83 ec 04             	sub    $0x4,%esp
 91e:	e9 2a ff ff ff       	jmp    84d <printf+0xad>
 923:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 927:	90                   	nop
          s = "(null)";
 928:	ba 5e 0b 00 00       	mov    $0xb5e,%edx
        while(*s != 0){
 92d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 930:	b8 28 00 00 00       	mov    $0x28,%eax
 935:	89 d3                	mov    %edx,%ebx
 937:	e9 74 ff ff ff       	jmp    8b0 <printf+0x110>
 93c:	66 90                	xchg   %ax,%ax
 93e:	66 90                	xchg   %ax,%ax

00000940 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 940:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 941:	a1 60 0f 00 00       	mov    0xf60,%eax
{
 946:	89 e5                	mov    %esp,%ebp
 948:	57                   	push   %edi
 949:	56                   	push   %esi
 94a:	53                   	push   %ebx
 94b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 94e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 951:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 958:	89 c2                	mov    %eax,%edx
 95a:	8b 00                	mov    (%eax),%eax
 95c:	39 ca                	cmp    %ecx,%edx
 95e:	73 30                	jae    990 <free+0x50>
 960:	39 c1                	cmp    %eax,%ecx
 962:	72 04                	jb     968 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 964:	39 c2                	cmp    %eax,%edx
 966:	72 f0                	jb     958 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 968:	8b 73 fc             	mov    -0x4(%ebx),%esi
 96b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 96e:	39 f8                	cmp    %edi,%eax
 970:	74 30                	je     9a2 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 972:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 975:	8b 42 04             	mov    0x4(%edx),%eax
 978:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 97b:	39 f1                	cmp    %esi,%ecx
 97d:	74 3a                	je     9b9 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 97f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 981:	5b                   	pop    %ebx
  freep = p;
 982:	89 15 60 0f 00 00    	mov    %edx,0xf60
}
 988:	5e                   	pop    %esi
 989:	5f                   	pop    %edi
 98a:	5d                   	pop    %ebp
 98b:	c3                   	ret    
 98c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 990:	39 c2                	cmp    %eax,%edx
 992:	72 c4                	jb     958 <free+0x18>
 994:	39 c1                	cmp    %eax,%ecx
 996:	73 c0                	jae    958 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 998:	8b 73 fc             	mov    -0x4(%ebx),%esi
 99b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 99e:	39 f8                	cmp    %edi,%eax
 9a0:	75 d0                	jne    972 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 9a2:	03 70 04             	add    0x4(%eax),%esi
 9a5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 9a8:	8b 02                	mov    (%edx),%eax
 9aa:	8b 00                	mov    (%eax),%eax
 9ac:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 9af:	8b 42 04             	mov    0x4(%edx),%eax
 9b2:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 9b5:	39 f1                	cmp    %esi,%ecx
 9b7:	75 c6                	jne    97f <free+0x3f>
    p->s.size += bp->s.size;
 9b9:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 9bc:	89 15 60 0f 00 00    	mov    %edx,0xf60
    p->s.size += bp->s.size;
 9c2:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 9c5:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 9c8:	89 0a                	mov    %ecx,(%edx)
}
 9ca:	5b                   	pop    %ebx
 9cb:	5e                   	pop    %esi
 9cc:	5f                   	pop    %edi
 9cd:	5d                   	pop    %ebp
 9ce:	c3                   	ret    
 9cf:	90                   	nop

000009d0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 9d0:	55                   	push   %ebp
 9d1:	89 e5                	mov    %esp,%ebp
 9d3:	57                   	push   %edi
 9d4:	56                   	push   %esi
 9d5:	53                   	push   %ebx
 9d6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9d9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 9dc:	8b 3d 60 0f 00 00    	mov    0xf60,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9e2:	8d 70 07             	lea    0x7(%eax),%esi
 9e5:	c1 ee 03             	shr    $0x3,%esi
 9e8:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 9eb:	85 ff                	test   %edi,%edi
 9ed:	0f 84 9d 00 00 00    	je     a90 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9f3:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 9f5:	8b 4a 04             	mov    0x4(%edx),%ecx
 9f8:	39 f1                	cmp    %esi,%ecx
 9fa:	73 6a                	jae    a66 <malloc+0x96>
 9fc:	bb 00 10 00 00       	mov    $0x1000,%ebx
 a01:	39 de                	cmp    %ebx,%esi
 a03:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 a06:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 a0d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 a10:	eb 17                	jmp    a29 <malloc+0x59>
 a12:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a18:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 a1a:	8b 48 04             	mov    0x4(%eax),%ecx
 a1d:	39 f1                	cmp    %esi,%ecx
 a1f:	73 4f                	jae    a70 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 a21:	8b 3d 60 0f 00 00    	mov    0xf60,%edi
 a27:	89 c2                	mov    %eax,%edx
 a29:	39 d7                	cmp    %edx,%edi
 a2b:	75 eb                	jne    a18 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 a2d:	83 ec 0c             	sub    $0xc,%esp
 a30:	ff 75 e4             	push   -0x1c(%ebp)
 a33:	e8 83 fc ff ff       	call   6bb <sbrk>
  if(p == (char*)-1)
 a38:	83 c4 10             	add    $0x10,%esp
 a3b:	83 f8 ff             	cmp    $0xffffffff,%eax
 a3e:	74 1c                	je     a5c <malloc+0x8c>
  hp->s.size = nu;
 a40:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 a43:	83 ec 0c             	sub    $0xc,%esp
 a46:	83 c0 08             	add    $0x8,%eax
 a49:	50                   	push   %eax
 a4a:	e8 f1 fe ff ff       	call   940 <free>
  return freep;
 a4f:	8b 15 60 0f 00 00    	mov    0xf60,%edx
      if((p = morecore(nunits)) == 0)
 a55:	83 c4 10             	add    $0x10,%esp
 a58:	85 d2                	test   %edx,%edx
 a5a:	75 bc                	jne    a18 <malloc+0x48>
        return 0;
  }
}
 a5c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 a5f:	31 c0                	xor    %eax,%eax
}
 a61:	5b                   	pop    %ebx
 a62:	5e                   	pop    %esi
 a63:	5f                   	pop    %edi
 a64:	5d                   	pop    %ebp
 a65:	c3                   	ret    
    if(p->s.size >= nunits){
 a66:	89 d0                	mov    %edx,%eax
 a68:	89 fa                	mov    %edi,%edx
 a6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 a70:	39 ce                	cmp    %ecx,%esi
 a72:	74 4c                	je     ac0 <malloc+0xf0>
        p->s.size -= nunits;
 a74:	29 f1                	sub    %esi,%ecx
 a76:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 a79:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 a7c:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 a7f:	89 15 60 0f 00 00    	mov    %edx,0xf60
}
 a85:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 a88:	83 c0 08             	add    $0x8,%eax
}
 a8b:	5b                   	pop    %ebx
 a8c:	5e                   	pop    %esi
 a8d:	5f                   	pop    %edi
 a8e:	5d                   	pop    %ebp
 a8f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 a90:	c7 05 60 0f 00 00 64 	movl   $0xf64,0xf60
 a97:	0f 00 00 
    base.s.size = 0;
 a9a:	bf 64 0f 00 00       	mov    $0xf64,%edi
    base.s.ptr = freep = prevp = &base;
 a9f:	c7 05 64 0f 00 00 64 	movl   $0xf64,0xf64
 aa6:	0f 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 aa9:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 aab:	c7 05 68 0f 00 00 00 	movl   $0x0,0xf68
 ab2:	00 00 00 
    if(p->s.size >= nunits){
 ab5:	e9 42 ff ff ff       	jmp    9fc <malloc+0x2c>
 aba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 ac0:	8b 08                	mov    (%eax),%ecx
 ac2:	89 0a                	mov    %ecx,(%edx)
 ac4:	eb b9                	jmp    a7f <malloc+0xaf>
