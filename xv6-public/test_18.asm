
_test_18:     file format elf32-i386


Disassembly of section .text:

00000000 <worker2>:

   printf(1, "TEST PASSED\n");
   exit();
}

void worker2(void *arg1,void *arg2){
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 14             	sub    $0x14,%esp
    int j;
    lock_acquire(&lock);
   6:	68 d0 0d 00 00       	push   $0xdd0
   b:	e8 2d 03 00 00       	call   33d <lock_acquire>
    for(j=0;j<50;j++);
  10:	83 c4 10             	add    $0x10,%esp
  13:	b8 00 00 00 00       	mov    $0x0,%eax
  18:	eb 03                	jmp    1d <worker2+0x1d>
  1a:	83 c0 01             	add    $0x1,%eax
  1d:	83 f8 31             	cmp    $0x31,%eax
  20:	7e f8                	jle    1a <worker2+0x1a>
    global++;
  22:	83 05 d4 0d 00 00 01 	addl   $0x1,0xdd4
    lock_release(&lock);
  29:	83 ec 0c             	sub    $0xc,%esp
  2c:	68 d0 0d 00 00       	push   $0xdd0
  31:	e8 29 03 00 00       	call   35f <lock_release>
    exit();
  36:	e8 df 04 00 00       	call   51a <exit>

0000003b <worker>:
    
}
void
worker(void *arg1, void *arg2) {
  3b:	55                   	push   %ebp
  3c:	89 e5                	mov    %esp,%ebp
  3e:	53                   	push   %ebx
  3f:	83 ec 10             	sub    $0x10,%esp
   
    lock_acquire(&lock);
  42:	68 d0 0d 00 00       	push   $0xdd0
  47:	e8 f1 02 00 00       	call   33d <lock_acquire>
    int j;
    for(j = 0; j < 50; j++); // take some time
  4c:	83 c4 10             	add    $0x10,%esp
  4f:	b8 00 00 00 00       	mov    $0x0,%eax
  54:	eb 03                	jmp    59 <worker+0x1e>
  56:	83 c0 01             	add    $0x1,%eax
  59:	83 f8 31             	cmp    $0x31,%eax
  5c:	7e f8                	jle    56 <worker+0x1b>
    global++;
  5e:	83 05 d4 0d 00 00 01 	addl   $0x1,0xdd4
    lock_release(&lock);
  65:	83 ec 0c             	sub    $0xc,%esp
  68:	68 d0 0d 00 00       	push   $0xdd0
  6d:	e8 ed 02 00 00       	call   35f <lock_release>

    int nested_thread_pid = thread_create(worker2, 0, 0);
  72:	83 c4 0c             	add    $0xc,%esp
  75:	6a 00                	push   $0x0
  77:	6a 00                	push   $0x0
  79:	68 00 00 00 00       	push   $0x0
  7e:	e8 77 02 00 00       	call   2fa <thread_create>
  83:	89 c3                	mov    %eax,%ebx
    assert(nested_thread_pid > 0);
  85:	83 c4 10             	add    $0x10,%esp
  88:	85 c0                	test   %eax,%eax
  8a:	7e 5e                	jle    ea <worker+0xaf>
    int nested_join_pid = thread_join();
  8c:	e8 9b 02 00 00       	call   32c <thread_join>
    assert(nested_join_pid > 0);
  91:	85 c0                	test   %eax,%eax
  93:	0f 8e 9a 00 00 00    	jle    133 <worker+0xf8>
    
    assert(nested_thread_pid==nested_join_pid);
  99:	39 c3                	cmp    %eax,%ebx
  9b:	0f 84 db 00 00 00    	je     17c <worker+0x141>
  a1:	6a 4b                	push   $0x4b
  a3:	68 1c 09 00 00       	push   $0x91c
  a8:	68 26 09 00 00       	push   $0x926
  ad:	6a 01                	push   $0x1
  af:	e8 bb 05 00 00       	call   66f <printf>
  b4:	83 c4 0c             	add    $0xc,%esp
  b7:	68 a0 09 00 00       	push   $0x9a0
  bc:	68 44 09 00 00       	push   $0x944
  c1:	6a 01                	push   $0x1
  c3:	e8 a7 05 00 00       	call   66f <printf>
  c8:	83 c4 08             	add    $0x8,%esp
  cb:	68 58 09 00 00       	push   $0x958
  d0:	6a 01                	push   $0x1
  d2:	e8 98 05 00 00       	call   66f <printf>
  d7:	83 c4 04             	add    $0x4,%esp
  da:	ff 35 d8 0d 00 00    	push   0xdd8
  e0:	e8 65 04 00 00       	call   54a <kill>
  e5:	e8 30 04 00 00       	call   51a <exit>
    assert(nested_thread_pid > 0);
  ea:	6a 47                	push   $0x47
  ec:	68 1c 09 00 00       	push   $0x91c
  f1:	68 26 09 00 00       	push   $0x926
  f6:	6a 01                	push   $0x1
  f8:	e8 72 05 00 00       	call   66f <printf>
  fd:	83 c4 0c             	add    $0xc,%esp
 100:	68 2e 09 00 00       	push   $0x92e
 105:	68 44 09 00 00       	push   $0x944
 10a:	6a 01                	push   $0x1
 10c:	e8 5e 05 00 00       	call   66f <printf>
 111:	83 c4 08             	add    $0x8,%esp
 114:	68 58 09 00 00       	push   $0x958
 119:	6a 01                	push   $0x1
 11b:	e8 4f 05 00 00       	call   66f <printf>
 120:	83 c4 04             	add    $0x4,%esp
 123:	ff 35 d8 0d 00 00    	push   0xdd8
 129:	e8 1c 04 00 00       	call   54a <kill>
 12e:	e8 e7 03 00 00       	call   51a <exit>
    assert(nested_join_pid > 0);
 133:	6a 49                	push   $0x49
 135:	68 1c 09 00 00       	push   $0x91c
 13a:	68 26 09 00 00       	push   $0x926
 13f:	6a 01                	push   $0x1
 141:	e8 29 05 00 00       	call   66f <printf>
 146:	83 c4 0c             	add    $0xc,%esp
 149:	68 65 09 00 00       	push   $0x965
 14e:	68 44 09 00 00       	push   $0x944
 153:	6a 01                	push   $0x1
 155:	e8 15 05 00 00       	call   66f <printf>
 15a:	83 c4 08             	add    $0x8,%esp
 15d:	68 58 09 00 00       	push   $0x958
 162:	6a 01                	push   $0x1
 164:	e8 06 05 00 00       	call   66f <printf>
 169:	83 c4 04             	add    $0x4,%esp
 16c:	ff 35 d8 0d 00 00    	push   0xdd8
 172:	e8 d3 03 00 00       	call   54a <kill>
 177:	e8 9e 03 00 00       	call   51a <exit>

   exit();
 17c:	e8 99 03 00 00       	call   51a <exit>

00000181 <main>:
{
 181:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 185:	83 e4 f0             	and    $0xfffffff0,%esp
 188:	ff 71 fc             	push   -0x4(%ecx)
 18b:	55                   	push   %ebp
 18c:	89 e5                	mov    %esp,%ebp
 18e:	53                   	push   %ebx
 18f:	51                   	push   %ecx
   ppid = getpid();
 190:	e8 05 04 00 00       	call   59a <getpid>
 195:	a3 d8 0d 00 00       	mov    %eax,0xdd8
   lock_init(&lock);
 19a:	83 ec 0c             	sub    $0xc,%esp
 19d:	68 d0 0d 00 00       	push   $0xdd0
 1a2:	e8 c6 01 00 00       	call   36d <lock_init>
   for (i = 0; i < num_threads; i++) {
 1a7:	83 c4 10             	add    $0x10,%esp
 1aa:	bb 00 00 00 00       	mov    $0x0,%ebx
 1af:	eb 03                	jmp    1b4 <main+0x33>
 1b1:	83 c3 01             	add    $0x1,%ebx
 1b4:	39 1d cc 0d 00 00    	cmp    %ebx,0xdcc
 1ba:	7e 61                	jle    21d <main+0x9c>
      int thread_pid = thread_create(worker, 0, 0);
 1bc:	83 ec 04             	sub    $0x4,%esp
 1bf:	6a 00                	push   $0x0
 1c1:	6a 00                	push   $0x0
 1c3:	68 3b 00 00 00       	push   $0x3b
 1c8:	e8 2d 01 00 00       	call   2fa <thread_create>
      assert(thread_pid > 0);
 1cd:	83 c4 10             	add    $0x10,%esp
 1d0:	85 c0                	test   %eax,%eax
 1d2:	7f dd                	jg     1b1 <main+0x30>
 1d4:	6a 26                	push   $0x26
 1d6:	68 1c 09 00 00       	push   $0x91c
 1db:	68 26 09 00 00       	push   $0x926
 1e0:	6a 01                	push   $0x1
 1e2:	e8 88 04 00 00       	call   66f <printf>
 1e7:	83 c4 0c             	add    $0xc,%esp
 1ea:	68 35 09 00 00       	push   $0x935
 1ef:	68 44 09 00 00       	push   $0x944
 1f4:	6a 01                	push   $0x1
 1f6:	e8 74 04 00 00       	call   66f <printf>
 1fb:	83 c4 08             	add    $0x8,%esp
 1fe:	68 58 09 00 00       	push   $0x958
 203:	6a 01                	push   $0x1
 205:	e8 65 04 00 00       	call   66f <printf>
 20a:	83 c4 04             	add    $0x4,%esp
 20d:	ff 35 d8 0d 00 00    	push   0xdd8
 213:	e8 32 03 00 00       	call   54a <kill>
 218:	e8 fd 02 00 00       	call   51a <exit>
   for (i = 0; i < num_threads; i++) {
 21d:	bb 00 00 00 00       	mov    $0x0,%ebx
 222:	a1 cc 0d 00 00       	mov    0xdcc,%eax
 227:	39 d8                	cmp    %ebx,%eax
 229:	7e 57                	jle    282 <main+0x101>
      int join_pid = thread_join();
 22b:	e8 fc 00 00 00       	call   32c <thread_join>
      assert(join_pid > 0);
 230:	85 c0                	test   %eax,%eax
 232:	7e 05                	jle    239 <main+0xb8>
   for (i = 0; i < num_threads; i++) {
 234:	83 c3 01             	add    $0x1,%ebx
 237:	eb e9                	jmp    222 <main+0xa1>
      assert(join_pid > 0);
 239:	6a 2b                	push   $0x2b
 23b:	68 1c 09 00 00       	push   $0x91c
 240:	68 26 09 00 00       	push   $0x926
 245:	6a 01                	push   $0x1
 247:	e8 23 04 00 00       	call   66f <printf>
 24c:	83 c4 0c             	add    $0xc,%esp
 24f:	68 6c 09 00 00       	push   $0x96c
 254:	68 44 09 00 00       	push   $0x944
 259:	6a 01                	push   $0x1
 25b:	e8 0f 04 00 00       	call   66f <printf>
 260:	83 c4 08             	add    $0x8,%esp
 263:	68 58 09 00 00       	push   $0x958
 268:	6a 01                	push   $0x1
 26a:	e8 00 04 00 00       	call   66f <printf>
 26f:	83 c4 04             	add    $0x4,%esp
 272:	ff 35 d8 0d 00 00    	push   0xdd8
 278:	e8 cd 02 00 00       	call   54a <kill>
 27d:	e8 98 02 00 00       	call   51a <exit>
   assert(global == num_threads * 2);
 282:	01 c0                	add    %eax,%eax
 284:	3b 05 d4 0d 00 00    	cmp    0xdd4,%eax
 28a:	74 49                	je     2d5 <main+0x154>
 28c:	6a 2e                	push   $0x2e
 28e:	68 1c 09 00 00       	push   $0x91c
 293:	68 26 09 00 00       	push   $0x926
 298:	6a 01                	push   $0x1
 29a:	e8 d0 03 00 00       	call   66f <printf>
 29f:	83 c4 0c             	add    $0xc,%esp
 2a2:	68 79 09 00 00       	push   $0x979
 2a7:	68 44 09 00 00       	push   $0x944
 2ac:	6a 01                	push   $0x1
 2ae:	e8 bc 03 00 00       	call   66f <printf>
 2b3:	83 c4 08             	add    $0x8,%esp
 2b6:	68 58 09 00 00       	push   $0x958
 2bb:	6a 01                	push   $0x1
 2bd:	e8 ad 03 00 00       	call   66f <printf>
 2c2:	83 c4 04             	add    $0x4,%esp
 2c5:	ff 35 d8 0d 00 00    	push   0xdd8
 2cb:	e8 7a 02 00 00       	call   54a <kill>
 2d0:	e8 45 02 00 00       	call   51a <exit>
   printf(1, "TEST PASSED\n");
 2d5:	83 ec 08             	sub    $0x8,%esp
 2d8:	68 93 09 00 00       	push   $0x993
 2dd:	6a 01                	push   $0x1
 2df:	e8 8b 03 00 00       	call   66f <printf>
   exit();
 2e4:	e8 31 02 00 00       	call   51a <exit>

000002e9 <test_and_set>:
#include "fcntl.h"
#include "user.h"
#include "x86.h"
#include "mmu.h"

int test_and_set(int *old_ptr, int new_ptr) {
 2e9:	55                   	push   %ebp
 2ea:	89 e5                	mov    %esp,%ebp
 2ec:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *old_ptr;
 2ef:	8b 10                	mov    (%eax),%edx
  *old_ptr = new_ptr;
 2f1:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 2f4:	89 08                	mov    %ecx,(%eax)
  return old;
}
 2f6:	89 d0                	mov    %edx,%eax
 2f8:	5d                   	pop    %ebp
 2f9:	c3                   	ret    

000002fa <thread_create>:

// a wrapper func for clone
int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 2fa:	55                   	push   %ebp
 2fb:	89 e5                	mov    %esp,%ebp
 2fd:	83 ec 14             	sub    $0x14,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE*2);
 300:	68 00 20 00 00       	push   $0x2000
 305:	e8 8b 05 00 00       	call   895 <malloc>
  if(n_stack == 0){
 30a:	83 c4 10             	add    $0x10,%esp
 30d:	85 c0                	test   %eax,%eax
 30f:	74 14                	je     325 <thread_create+0x2b>
    return -1;
  }
  int new_pid = clone(start_routine, arg1, arg2, n_stack); // TODO: is this the right way to call it?
 311:	50                   	push   %eax
 312:	ff 75 10             	push   0x10(%ebp)
 315:	ff 75 0c             	push   0xc(%ebp)
 318:	ff 75 08             	push   0x8(%ebp)
 31b:	e8 9a 02 00 00       	call   5ba <clone>


  // I can't remember if there was something else to do here but I'm sure I'll find out


  return new_pid;
 320:	83 c4 10             	add    $0x10,%esp
}
 323:	c9                   	leave  
 324:	c3                   	ret    
    return -1;
 325:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 32a:	eb f7                	jmp    323 <thread_create+0x29>

0000032c <thread_join>:

int thread_join() {
 32c:	55                   	push   %ebp
 32d:	89 e5                	mov    %esp,%ebp
 32f:	83 ec 24             	sub    $0x24,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 332:	8d 45 f4             	lea    -0xc(%ebp),%eax
 335:	50                   	push   %eax
 336:	e8 87 02 00 00       	call   5c2 <join>
  
  return pid;
}
 33b:	c9                   	leave  
 33c:	c3                   	ret    

0000033d <lock_acquire>:

void lock_acquire(lock_t *lock){
 33d:	55                   	push   %ebp
 33e:	89 e5                	mov    %esp,%ebp
 340:	53                   	push   %ebx
 341:	83 ec 04             	sub    $0x4,%esp
 344:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 347:	83 ec 08             	sub    $0x8,%esp
 34a:	6a 01                	push   $0x1
 34c:	53                   	push   %ebx
 34d:	e8 97 ff ff ff       	call   2e9 <test_and_set>
 352:	83 c4 10             	add    $0x10,%esp
 355:	83 f8 01             	cmp    $0x1,%eax
 358:	74 ed                	je     347 <lock_acquire+0xa>
    ;
}
 35a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 35d:	c9                   	leave  
 35e:	c3                   	ret    

0000035f <lock_release>:

void lock_release(lock_t *lock) {
 35f:	55                   	push   %ebp
 360:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 362:	8b 45 08             	mov    0x8(%ebp),%eax
 365:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 36b:	5d                   	pop    %ebp
 36c:	c3                   	ret    

0000036d <lock_init>:

void lock_init(lock_t *lock) {
 36d:	55                   	push   %ebp
 36e:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 370:	8b 45 08             	mov    0x8(%ebp),%eax
 373:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 379:	5d                   	pop    %ebp
 37a:	c3                   	ret    

0000037b <strcpy>:

char*
strcpy(char *s, const char *t)
{
 37b:	55                   	push   %ebp
 37c:	89 e5                	mov    %esp,%ebp
 37e:	56                   	push   %esi
 37f:	53                   	push   %ebx
 380:	8b 75 08             	mov    0x8(%ebp),%esi
 383:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 386:	89 f0                	mov    %esi,%eax
 388:	89 d1                	mov    %edx,%ecx
 38a:	83 c2 01             	add    $0x1,%edx
 38d:	89 c3                	mov    %eax,%ebx
 38f:	83 c0 01             	add    $0x1,%eax
 392:	0f b6 09             	movzbl (%ecx),%ecx
 395:	88 0b                	mov    %cl,(%ebx)
 397:	84 c9                	test   %cl,%cl
 399:	75 ed                	jne    388 <strcpy+0xd>
    ;
  return os;
}
 39b:	89 f0                	mov    %esi,%eax
 39d:	5b                   	pop    %ebx
 39e:	5e                   	pop    %esi
 39f:	5d                   	pop    %ebp
 3a0:	c3                   	ret    

000003a1 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 3a1:	55                   	push   %ebp
 3a2:	89 e5                	mov    %esp,%ebp
 3a4:	8b 4d 08             	mov    0x8(%ebp),%ecx
 3a7:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 3aa:	eb 06                	jmp    3b2 <strcmp+0x11>
    p++, q++;
 3ac:	83 c1 01             	add    $0x1,%ecx
 3af:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 3b2:	0f b6 01             	movzbl (%ecx),%eax
 3b5:	84 c0                	test   %al,%al
 3b7:	74 04                	je     3bd <strcmp+0x1c>
 3b9:	3a 02                	cmp    (%edx),%al
 3bb:	74 ef                	je     3ac <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 3bd:	0f b6 c0             	movzbl %al,%eax
 3c0:	0f b6 12             	movzbl (%edx),%edx
 3c3:	29 d0                	sub    %edx,%eax
}
 3c5:	5d                   	pop    %ebp
 3c6:	c3                   	ret    

000003c7 <strlen>:

uint
strlen(const char *s)
{
 3c7:	55                   	push   %ebp
 3c8:	89 e5                	mov    %esp,%ebp
 3ca:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 3cd:	b8 00 00 00 00       	mov    $0x0,%eax
 3d2:	eb 03                	jmp    3d7 <strlen+0x10>
 3d4:	83 c0 01             	add    $0x1,%eax
 3d7:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 3db:	75 f7                	jne    3d4 <strlen+0xd>
    ;
  return n;
}
 3dd:	5d                   	pop    %ebp
 3de:	c3                   	ret    

000003df <memset>:

void*
memset(void *dst, int c, uint n)
{
 3df:	55                   	push   %ebp
 3e0:	89 e5                	mov    %esp,%ebp
 3e2:	57                   	push   %edi
 3e3:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 3e6:	89 d7                	mov    %edx,%edi
 3e8:	8b 4d 10             	mov    0x10(%ebp),%ecx
 3eb:	8b 45 0c             	mov    0xc(%ebp),%eax
 3ee:	fc                   	cld    
 3ef:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 3f1:	89 d0                	mov    %edx,%eax
 3f3:	8b 7d fc             	mov    -0x4(%ebp),%edi
 3f6:	c9                   	leave  
 3f7:	c3                   	ret    

000003f8 <strchr>:

char*
strchr(const char *s, char c)
{
 3f8:	55                   	push   %ebp
 3f9:	89 e5                	mov    %esp,%ebp
 3fb:	8b 45 08             	mov    0x8(%ebp),%eax
 3fe:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 402:	eb 03                	jmp    407 <strchr+0xf>
 404:	83 c0 01             	add    $0x1,%eax
 407:	0f b6 10             	movzbl (%eax),%edx
 40a:	84 d2                	test   %dl,%dl
 40c:	74 06                	je     414 <strchr+0x1c>
    if(*s == c)
 40e:	38 ca                	cmp    %cl,%dl
 410:	75 f2                	jne    404 <strchr+0xc>
 412:	eb 05                	jmp    419 <strchr+0x21>
      return (char*)s;
  return 0;
 414:	b8 00 00 00 00       	mov    $0x0,%eax
}
 419:	5d                   	pop    %ebp
 41a:	c3                   	ret    

0000041b <gets>:

char*
gets(char *buf, int max)
{
 41b:	55                   	push   %ebp
 41c:	89 e5                	mov    %esp,%ebp
 41e:	57                   	push   %edi
 41f:	56                   	push   %esi
 420:	53                   	push   %ebx
 421:	83 ec 1c             	sub    $0x1c,%esp
 424:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 427:	bb 00 00 00 00       	mov    $0x0,%ebx
 42c:	89 de                	mov    %ebx,%esi
 42e:	83 c3 01             	add    $0x1,%ebx
 431:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 434:	7d 2e                	jge    464 <gets+0x49>
    cc = read(0, &c, 1);
 436:	83 ec 04             	sub    $0x4,%esp
 439:	6a 01                	push   $0x1
 43b:	8d 45 e7             	lea    -0x19(%ebp),%eax
 43e:	50                   	push   %eax
 43f:	6a 00                	push   $0x0
 441:	e8 ec 00 00 00       	call   532 <read>
    if(cc < 1)
 446:	83 c4 10             	add    $0x10,%esp
 449:	85 c0                	test   %eax,%eax
 44b:	7e 17                	jle    464 <gets+0x49>
      break;
    buf[i++] = c;
 44d:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 451:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 454:	3c 0a                	cmp    $0xa,%al
 456:	0f 94 c2             	sete   %dl
 459:	3c 0d                	cmp    $0xd,%al
 45b:	0f 94 c0             	sete   %al
 45e:	08 c2                	or     %al,%dl
 460:	74 ca                	je     42c <gets+0x11>
    buf[i++] = c;
 462:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 464:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 468:	89 f8                	mov    %edi,%eax
 46a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 46d:	5b                   	pop    %ebx
 46e:	5e                   	pop    %esi
 46f:	5f                   	pop    %edi
 470:	5d                   	pop    %ebp
 471:	c3                   	ret    

00000472 <stat>:

int
stat(const char *n, struct stat *st)
{
 472:	55                   	push   %ebp
 473:	89 e5                	mov    %esp,%ebp
 475:	56                   	push   %esi
 476:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 477:	83 ec 08             	sub    $0x8,%esp
 47a:	6a 00                	push   $0x0
 47c:	ff 75 08             	push   0x8(%ebp)
 47f:	e8 d6 00 00 00       	call   55a <open>
  if(fd < 0)
 484:	83 c4 10             	add    $0x10,%esp
 487:	85 c0                	test   %eax,%eax
 489:	78 24                	js     4af <stat+0x3d>
 48b:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 48d:	83 ec 08             	sub    $0x8,%esp
 490:	ff 75 0c             	push   0xc(%ebp)
 493:	50                   	push   %eax
 494:	e8 d9 00 00 00       	call   572 <fstat>
 499:	89 c6                	mov    %eax,%esi
  close(fd);
 49b:	89 1c 24             	mov    %ebx,(%esp)
 49e:	e8 9f 00 00 00       	call   542 <close>
  return r;
 4a3:	83 c4 10             	add    $0x10,%esp
}
 4a6:	89 f0                	mov    %esi,%eax
 4a8:	8d 65 f8             	lea    -0x8(%ebp),%esp
 4ab:	5b                   	pop    %ebx
 4ac:	5e                   	pop    %esi
 4ad:	5d                   	pop    %ebp
 4ae:	c3                   	ret    
    return -1;
 4af:	be ff ff ff ff       	mov    $0xffffffff,%esi
 4b4:	eb f0                	jmp    4a6 <stat+0x34>

000004b6 <atoi>:

int
atoi(const char *s)
{
 4b6:	55                   	push   %ebp
 4b7:	89 e5                	mov    %esp,%ebp
 4b9:	53                   	push   %ebx
 4ba:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 4bd:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 4c2:	eb 10                	jmp    4d4 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 4c4:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 4c7:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 4ca:	83 c1 01             	add    $0x1,%ecx
 4cd:	0f be c0             	movsbl %al,%eax
 4d0:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 4d4:	0f b6 01             	movzbl (%ecx),%eax
 4d7:	8d 58 d0             	lea    -0x30(%eax),%ebx
 4da:	80 fb 09             	cmp    $0x9,%bl
 4dd:	76 e5                	jbe    4c4 <atoi+0xe>
  return n;
}
 4df:	89 d0                	mov    %edx,%eax
 4e1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4e4:	c9                   	leave  
 4e5:	c3                   	ret    

000004e6 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 4e6:	55                   	push   %ebp
 4e7:	89 e5                	mov    %esp,%ebp
 4e9:	56                   	push   %esi
 4ea:	53                   	push   %ebx
 4eb:	8b 75 08             	mov    0x8(%ebp),%esi
 4ee:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 4f1:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 4f4:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 4f6:	eb 0d                	jmp    505 <memmove+0x1f>
    *dst++ = *src++;
 4f8:	0f b6 01             	movzbl (%ecx),%eax
 4fb:	88 02                	mov    %al,(%edx)
 4fd:	8d 49 01             	lea    0x1(%ecx),%ecx
 500:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 503:	89 d8                	mov    %ebx,%eax
 505:	8d 58 ff             	lea    -0x1(%eax),%ebx
 508:	85 c0                	test   %eax,%eax
 50a:	7f ec                	jg     4f8 <memmove+0x12>
  return vdst;
}
 50c:	89 f0                	mov    %esi,%eax
 50e:	5b                   	pop    %ebx
 50f:	5e                   	pop    %esi
 510:	5d                   	pop    %ebp
 511:	c3                   	ret    

00000512 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 512:	b8 01 00 00 00       	mov    $0x1,%eax
 517:	cd 40                	int    $0x40
 519:	c3                   	ret    

0000051a <exit>:
SYSCALL(exit)
 51a:	b8 02 00 00 00       	mov    $0x2,%eax
 51f:	cd 40                	int    $0x40
 521:	c3                   	ret    

00000522 <wait>:
SYSCALL(wait)
 522:	b8 03 00 00 00       	mov    $0x3,%eax
 527:	cd 40                	int    $0x40
 529:	c3                   	ret    

0000052a <pipe>:
SYSCALL(pipe)
 52a:	b8 04 00 00 00       	mov    $0x4,%eax
 52f:	cd 40                	int    $0x40
 531:	c3                   	ret    

00000532 <read>:
SYSCALL(read)
 532:	b8 05 00 00 00       	mov    $0x5,%eax
 537:	cd 40                	int    $0x40
 539:	c3                   	ret    

0000053a <write>:
SYSCALL(write)
 53a:	b8 10 00 00 00       	mov    $0x10,%eax
 53f:	cd 40                	int    $0x40
 541:	c3                   	ret    

00000542 <close>:
SYSCALL(close)
 542:	b8 15 00 00 00       	mov    $0x15,%eax
 547:	cd 40                	int    $0x40
 549:	c3                   	ret    

0000054a <kill>:
SYSCALL(kill)
 54a:	b8 06 00 00 00       	mov    $0x6,%eax
 54f:	cd 40                	int    $0x40
 551:	c3                   	ret    

00000552 <exec>:
SYSCALL(exec)
 552:	b8 07 00 00 00       	mov    $0x7,%eax
 557:	cd 40                	int    $0x40
 559:	c3                   	ret    

0000055a <open>:
SYSCALL(open)
 55a:	b8 0f 00 00 00       	mov    $0xf,%eax
 55f:	cd 40                	int    $0x40
 561:	c3                   	ret    

00000562 <mknod>:
SYSCALL(mknod)
 562:	b8 11 00 00 00       	mov    $0x11,%eax
 567:	cd 40                	int    $0x40
 569:	c3                   	ret    

0000056a <unlink>:
SYSCALL(unlink)
 56a:	b8 12 00 00 00       	mov    $0x12,%eax
 56f:	cd 40                	int    $0x40
 571:	c3                   	ret    

00000572 <fstat>:
SYSCALL(fstat)
 572:	b8 08 00 00 00       	mov    $0x8,%eax
 577:	cd 40                	int    $0x40
 579:	c3                   	ret    

0000057a <link>:
SYSCALL(link)
 57a:	b8 13 00 00 00       	mov    $0x13,%eax
 57f:	cd 40                	int    $0x40
 581:	c3                   	ret    

00000582 <mkdir>:
SYSCALL(mkdir)
 582:	b8 14 00 00 00       	mov    $0x14,%eax
 587:	cd 40                	int    $0x40
 589:	c3                   	ret    

0000058a <chdir>:
SYSCALL(chdir)
 58a:	b8 09 00 00 00       	mov    $0x9,%eax
 58f:	cd 40                	int    $0x40
 591:	c3                   	ret    

00000592 <dup>:
SYSCALL(dup)
 592:	b8 0a 00 00 00       	mov    $0xa,%eax
 597:	cd 40                	int    $0x40
 599:	c3                   	ret    

0000059a <getpid>:
SYSCALL(getpid)
 59a:	b8 0b 00 00 00       	mov    $0xb,%eax
 59f:	cd 40                	int    $0x40
 5a1:	c3                   	ret    

000005a2 <sbrk>:
SYSCALL(sbrk)
 5a2:	b8 0c 00 00 00       	mov    $0xc,%eax
 5a7:	cd 40                	int    $0x40
 5a9:	c3                   	ret    

000005aa <sleep>:
SYSCALL(sleep)
 5aa:	b8 0d 00 00 00       	mov    $0xd,%eax
 5af:	cd 40                	int    $0x40
 5b1:	c3                   	ret    

000005b2 <uptime>:
SYSCALL(uptime)
 5b2:	b8 0e 00 00 00       	mov    $0xe,%eax
 5b7:	cd 40                	int    $0x40
 5b9:	c3                   	ret    

000005ba <clone>:
SYSCALL(clone)
 5ba:	b8 16 00 00 00       	mov    $0x16,%eax
 5bf:	cd 40                	int    $0x40
 5c1:	c3                   	ret    

000005c2 <join>:
 5c2:	b8 17 00 00 00       	mov    $0x17,%eax
 5c7:	cd 40                	int    $0x40
 5c9:	c3                   	ret    

000005ca <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 5ca:	55                   	push   %ebp
 5cb:	89 e5                	mov    %esp,%ebp
 5cd:	83 ec 1c             	sub    $0x1c,%esp
 5d0:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 5d3:	6a 01                	push   $0x1
 5d5:	8d 55 f4             	lea    -0xc(%ebp),%edx
 5d8:	52                   	push   %edx
 5d9:	50                   	push   %eax
 5da:	e8 5b ff ff ff       	call   53a <write>
}
 5df:	83 c4 10             	add    $0x10,%esp
 5e2:	c9                   	leave  
 5e3:	c3                   	ret    

000005e4 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 5e4:	55                   	push   %ebp
 5e5:	89 e5                	mov    %esp,%ebp
 5e7:	57                   	push   %edi
 5e8:	56                   	push   %esi
 5e9:	53                   	push   %ebx
 5ea:	83 ec 2c             	sub    $0x2c,%esp
 5ed:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5f0:	89 d0                	mov    %edx,%eax
 5f2:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 5f4:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 5f8:	0f 95 c1             	setne  %cl
 5fb:	c1 ea 1f             	shr    $0x1f,%edx
 5fe:	84 d1                	test   %dl,%cl
 600:	74 44                	je     646 <printint+0x62>
    neg = 1;
    x = -xx;
 602:	f7 d8                	neg    %eax
 604:	89 c1                	mov    %eax,%ecx
    neg = 1;
 606:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 60d:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 612:	89 c8                	mov    %ecx,%eax
 614:	ba 00 00 00 00       	mov    $0x0,%edx
 619:	f7 f6                	div    %esi
 61b:	89 df                	mov    %ebx,%edi
 61d:	83 c3 01             	add    $0x1,%ebx
 620:	0f b6 92 24 0a 00 00 	movzbl 0xa24(%edx),%edx
 627:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 62b:	89 ca                	mov    %ecx,%edx
 62d:	89 c1                	mov    %eax,%ecx
 62f:	39 d6                	cmp    %edx,%esi
 631:	76 df                	jbe    612 <printint+0x2e>
  if(neg)
 633:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 637:	74 31                	je     66a <printint+0x86>
    buf[i++] = '-';
 639:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 63e:	8d 5f 02             	lea    0x2(%edi),%ebx
 641:	8b 75 d0             	mov    -0x30(%ebp),%esi
 644:	eb 17                	jmp    65d <printint+0x79>
    x = xx;
 646:	89 c1                	mov    %eax,%ecx
  neg = 0;
 648:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 64f:	eb bc                	jmp    60d <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 651:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 656:	89 f0                	mov    %esi,%eax
 658:	e8 6d ff ff ff       	call   5ca <putc>
  while(--i >= 0)
 65d:	83 eb 01             	sub    $0x1,%ebx
 660:	79 ef                	jns    651 <printint+0x6d>
}
 662:	83 c4 2c             	add    $0x2c,%esp
 665:	5b                   	pop    %ebx
 666:	5e                   	pop    %esi
 667:	5f                   	pop    %edi
 668:	5d                   	pop    %ebp
 669:	c3                   	ret    
 66a:	8b 75 d0             	mov    -0x30(%ebp),%esi
 66d:	eb ee                	jmp    65d <printint+0x79>

0000066f <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 66f:	55                   	push   %ebp
 670:	89 e5                	mov    %esp,%ebp
 672:	57                   	push   %edi
 673:	56                   	push   %esi
 674:	53                   	push   %ebx
 675:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 678:	8d 45 10             	lea    0x10(%ebp),%eax
 67b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 67e:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 683:	bb 00 00 00 00       	mov    $0x0,%ebx
 688:	eb 14                	jmp    69e <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 68a:	89 fa                	mov    %edi,%edx
 68c:	8b 45 08             	mov    0x8(%ebp),%eax
 68f:	e8 36 ff ff ff       	call   5ca <putc>
 694:	eb 05                	jmp    69b <printf+0x2c>
      }
    } else if(state == '%'){
 696:	83 fe 25             	cmp    $0x25,%esi
 699:	74 25                	je     6c0 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 69b:	83 c3 01             	add    $0x1,%ebx
 69e:	8b 45 0c             	mov    0xc(%ebp),%eax
 6a1:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 6a5:	84 c0                	test   %al,%al
 6a7:	0f 84 20 01 00 00    	je     7cd <printf+0x15e>
    c = fmt[i] & 0xff;
 6ad:	0f be f8             	movsbl %al,%edi
 6b0:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 6b3:	85 f6                	test   %esi,%esi
 6b5:	75 df                	jne    696 <printf+0x27>
      if(c == '%'){
 6b7:	83 f8 25             	cmp    $0x25,%eax
 6ba:	75 ce                	jne    68a <printf+0x1b>
        state = '%';
 6bc:	89 c6                	mov    %eax,%esi
 6be:	eb db                	jmp    69b <printf+0x2c>
      if(c == 'd'){
 6c0:	83 f8 25             	cmp    $0x25,%eax
 6c3:	0f 84 cf 00 00 00    	je     798 <printf+0x129>
 6c9:	0f 8c dd 00 00 00    	jl     7ac <printf+0x13d>
 6cf:	83 f8 78             	cmp    $0x78,%eax
 6d2:	0f 8f d4 00 00 00    	jg     7ac <printf+0x13d>
 6d8:	83 f8 63             	cmp    $0x63,%eax
 6db:	0f 8c cb 00 00 00    	jl     7ac <printf+0x13d>
 6e1:	83 e8 63             	sub    $0x63,%eax
 6e4:	83 f8 15             	cmp    $0x15,%eax
 6e7:	0f 87 bf 00 00 00    	ja     7ac <printf+0x13d>
 6ed:	ff 24 85 cc 09 00 00 	jmp    *0x9cc(,%eax,4)
        printint(fd, *ap, 10, 1);
 6f4:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6f7:	8b 17                	mov    (%edi),%edx
 6f9:	83 ec 0c             	sub    $0xc,%esp
 6fc:	6a 01                	push   $0x1
 6fe:	b9 0a 00 00 00       	mov    $0xa,%ecx
 703:	8b 45 08             	mov    0x8(%ebp),%eax
 706:	e8 d9 fe ff ff       	call   5e4 <printint>
        ap++;
 70b:	83 c7 04             	add    $0x4,%edi
 70e:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 711:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 714:	be 00 00 00 00       	mov    $0x0,%esi
 719:	eb 80                	jmp    69b <printf+0x2c>
        printint(fd, *ap, 16, 0);
 71b:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 71e:	8b 17                	mov    (%edi),%edx
 720:	83 ec 0c             	sub    $0xc,%esp
 723:	6a 00                	push   $0x0
 725:	b9 10 00 00 00       	mov    $0x10,%ecx
 72a:	8b 45 08             	mov    0x8(%ebp),%eax
 72d:	e8 b2 fe ff ff       	call   5e4 <printint>
        ap++;
 732:	83 c7 04             	add    $0x4,%edi
 735:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 738:	83 c4 10             	add    $0x10,%esp
      state = 0;
 73b:	be 00 00 00 00       	mov    $0x0,%esi
 740:	e9 56 ff ff ff       	jmp    69b <printf+0x2c>
        s = (char*)*ap;
 745:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 748:	8b 30                	mov    (%eax),%esi
        ap++;
 74a:	83 c0 04             	add    $0x4,%eax
 74d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 750:	85 f6                	test   %esi,%esi
 752:	75 15                	jne    769 <printf+0xfa>
          s = "(null)";
 754:	be c3 09 00 00       	mov    $0x9c3,%esi
 759:	eb 0e                	jmp    769 <printf+0xfa>
          putc(fd, *s);
 75b:	0f be d2             	movsbl %dl,%edx
 75e:	8b 45 08             	mov    0x8(%ebp),%eax
 761:	e8 64 fe ff ff       	call   5ca <putc>
          s++;
 766:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 769:	0f b6 16             	movzbl (%esi),%edx
 76c:	84 d2                	test   %dl,%dl
 76e:	75 eb                	jne    75b <printf+0xec>
      state = 0;
 770:	be 00 00 00 00       	mov    $0x0,%esi
 775:	e9 21 ff ff ff       	jmp    69b <printf+0x2c>
        putc(fd, *ap);
 77a:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 77d:	0f be 17             	movsbl (%edi),%edx
 780:	8b 45 08             	mov    0x8(%ebp),%eax
 783:	e8 42 fe ff ff       	call   5ca <putc>
        ap++;
 788:	83 c7 04             	add    $0x4,%edi
 78b:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 78e:	be 00 00 00 00       	mov    $0x0,%esi
 793:	e9 03 ff ff ff       	jmp    69b <printf+0x2c>
        putc(fd, c);
 798:	89 fa                	mov    %edi,%edx
 79a:	8b 45 08             	mov    0x8(%ebp),%eax
 79d:	e8 28 fe ff ff       	call   5ca <putc>
      state = 0;
 7a2:	be 00 00 00 00       	mov    $0x0,%esi
 7a7:	e9 ef fe ff ff       	jmp    69b <printf+0x2c>
        putc(fd, '%');
 7ac:	ba 25 00 00 00       	mov    $0x25,%edx
 7b1:	8b 45 08             	mov    0x8(%ebp),%eax
 7b4:	e8 11 fe ff ff       	call   5ca <putc>
        putc(fd, c);
 7b9:	89 fa                	mov    %edi,%edx
 7bb:	8b 45 08             	mov    0x8(%ebp),%eax
 7be:	e8 07 fe ff ff       	call   5ca <putc>
      state = 0;
 7c3:	be 00 00 00 00       	mov    $0x0,%esi
 7c8:	e9 ce fe ff ff       	jmp    69b <printf+0x2c>
    }
  }
}
 7cd:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7d0:	5b                   	pop    %ebx
 7d1:	5e                   	pop    %esi
 7d2:	5f                   	pop    %edi
 7d3:	5d                   	pop    %ebp
 7d4:	c3                   	ret    

000007d5 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7d5:	55                   	push   %ebp
 7d6:	89 e5                	mov    %esp,%ebp
 7d8:	57                   	push   %edi
 7d9:	56                   	push   %esi
 7da:	53                   	push   %ebx
 7db:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7de:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7e1:	a1 dc 0d 00 00       	mov    0xddc,%eax
 7e6:	eb 02                	jmp    7ea <free+0x15>
 7e8:	89 d0                	mov    %edx,%eax
 7ea:	39 c8                	cmp    %ecx,%eax
 7ec:	73 04                	jae    7f2 <free+0x1d>
 7ee:	39 08                	cmp    %ecx,(%eax)
 7f0:	77 12                	ja     804 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7f2:	8b 10                	mov    (%eax),%edx
 7f4:	39 c2                	cmp    %eax,%edx
 7f6:	77 f0                	ja     7e8 <free+0x13>
 7f8:	39 c8                	cmp    %ecx,%eax
 7fa:	72 08                	jb     804 <free+0x2f>
 7fc:	39 ca                	cmp    %ecx,%edx
 7fe:	77 04                	ja     804 <free+0x2f>
 800:	89 d0                	mov    %edx,%eax
 802:	eb e6                	jmp    7ea <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 804:	8b 73 fc             	mov    -0x4(%ebx),%esi
 807:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 80a:	8b 10                	mov    (%eax),%edx
 80c:	39 d7                	cmp    %edx,%edi
 80e:	74 19                	je     829 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 810:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 813:	8b 50 04             	mov    0x4(%eax),%edx
 816:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 819:	39 ce                	cmp    %ecx,%esi
 81b:	74 1b                	je     838 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 81d:	89 08                	mov    %ecx,(%eax)
  freep = p;
 81f:	a3 dc 0d 00 00       	mov    %eax,0xddc
}
 824:	5b                   	pop    %ebx
 825:	5e                   	pop    %esi
 826:	5f                   	pop    %edi
 827:	5d                   	pop    %ebp
 828:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 829:	03 72 04             	add    0x4(%edx),%esi
 82c:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 82f:	8b 10                	mov    (%eax),%edx
 831:	8b 12                	mov    (%edx),%edx
 833:	89 53 f8             	mov    %edx,-0x8(%ebx)
 836:	eb db                	jmp    813 <free+0x3e>
    p->s.size += bp->s.size;
 838:	03 53 fc             	add    -0x4(%ebx),%edx
 83b:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 83e:	8b 53 f8             	mov    -0x8(%ebx),%edx
 841:	89 10                	mov    %edx,(%eax)
 843:	eb da                	jmp    81f <free+0x4a>

00000845 <morecore>:

static Header*
morecore(uint nu)
{
 845:	55                   	push   %ebp
 846:	89 e5                	mov    %esp,%ebp
 848:	53                   	push   %ebx
 849:	83 ec 04             	sub    $0x4,%esp
 84c:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 84e:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 853:	77 05                	ja     85a <morecore+0x15>
    nu = 4096;
 855:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 85a:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 861:	83 ec 0c             	sub    $0xc,%esp
 864:	50                   	push   %eax
 865:	e8 38 fd ff ff       	call   5a2 <sbrk>
  if(p == (char*)-1)
 86a:	83 c4 10             	add    $0x10,%esp
 86d:	83 f8 ff             	cmp    $0xffffffff,%eax
 870:	74 1c                	je     88e <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 872:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 875:	83 c0 08             	add    $0x8,%eax
 878:	83 ec 0c             	sub    $0xc,%esp
 87b:	50                   	push   %eax
 87c:	e8 54 ff ff ff       	call   7d5 <free>
  return freep;
 881:	a1 dc 0d 00 00       	mov    0xddc,%eax
 886:	83 c4 10             	add    $0x10,%esp
}
 889:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 88c:	c9                   	leave  
 88d:	c3                   	ret    
    return 0;
 88e:	b8 00 00 00 00       	mov    $0x0,%eax
 893:	eb f4                	jmp    889 <morecore+0x44>

00000895 <malloc>:

void*
malloc(uint nbytes)
{
 895:	55                   	push   %ebp
 896:	89 e5                	mov    %esp,%ebp
 898:	53                   	push   %ebx
 899:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 89c:	8b 45 08             	mov    0x8(%ebp),%eax
 89f:	8d 58 07             	lea    0x7(%eax),%ebx
 8a2:	c1 eb 03             	shr    $0x3,%ebx
 8a5:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 8a8:	8b 0d dc 0d 00 00    	mov    0xddc,%ecx
 8ae:	85 c9                	test   %ecx,%ecx
 8b0:	74 04                	je     8b6 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8b2:	8b 01                	mov    (%ecx),%eax
 8b4:	eb 4a                	jmp    900 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 8b6:	c7 05 dc 0d 00 00 e0 	movl   $0xde0,0xddc
 8bd:	0d 00 00 
 8c0:	c7 05 e0 0d 00 00 e0 	movl   $0xde0,0xde0
 8c7:	0d 00 00 
    base.s.size = 0;
 8ca:	c7 05 e4 0d 00 00 00 	movl   $0x0,0xde4
 8d1:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 8d4:	b9 e0 0d 00 00       	mov    $0xde0,%ecx
 8d9:	eb d7                	jmp    8b2 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 8db:	74 19                	je     8f6 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 8dd:	29 da                	sub    %ebx,%edx
 8df:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8e2:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 8e5:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 8e8:	89 0d dc 0d 00 00    	mov    %ecx,0xddc
      return (void*)(p + 1);
 8ee:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 8f1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8f4:	c9                   	leave  
 8f5:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 8f6:	8b 10                	mov    (%eax),%edx
 8f8:	89 11                	mov    %edx,(%ecx)
 8fa:	eb ec                	jmp    8e8 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8fc:	89 c1                	mov    %eax,%ecx
 8fe:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 900:	8b 50 04             	mov    0x4(%eax),%edx
 903:	39 da                	cmp    %ebx,%edx
 905:	73 d4                	jae    8db <malloc+0x46>
    if(p == freep)
 907:	39 05 dc 0d 00 00    	cmp    %eax,0xddc
 90d:	75 ed                	jne    8fc <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 90f:	89 d8                	mov    %ebx,%eax
 911:	e8 2f ff ff ff       	call   845 <morecore>
 916:	85 c0                	test   %eax,%eax
 918:	75 e2                	jne    8fc <malloc+0x67>
 91a:	eb d5                	jmp    8f1 <malloc+0x5c>
