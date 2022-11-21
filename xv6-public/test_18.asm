
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
   6:	68 bc 0d 00 00       	push   $0xdbc
   b:	e8 22 03 00 00       	call   332 <lock_acquire>
    for(j=0;j<50;j++);
  10:	83 c4 10             	add    $0x10,%esp
  13:	b8 00 00 00 00       	mov    $0x0,%eax
  18:	eb 03                	jmp    1d <worker2+0x1d>
  1a:	83 c0 01             	add    $0x1,%eax
  1d:	83 f8 31             	cmp    $0x31,%eax
  20:	7e f8                	jle    1a <worker2+0x1a>
    global++;
  22:	83 05 c0 0d 00 00 01 	addl   $0x1,0xdc0
    lock_release(&lock);
  29:	83 ec 0c             	sub    $0xc,%esp
  2c:	68 bc 0d 00 00       	push   $0xdbc
  31:	e8 1e 03 00 00       	call   354 <lock_release>
    exit();
  36:	e8 d4 04 00 00       	call   50f <exit>

0000003b <worker>:
    
}
void
worker(void *arg1, void *arg2) {
  3b:	55                   	push   %ebp
  3c:	89 e5                	mov    %esp,%ebp
  3e:	53                   	push   %ebx
  3f:	83 ec 10             	sub    $0x10,%esp
   
    lock_acquire(&lock);
  42:	68 bc 0d 00 00       	push   $0xdbc
  47:	e8 e6 02 00 00       	call   332 <lock_acquire>
    int j;
    for(j = 0; j < 50; j++); // take some time
  4c:	83 c4 10             	add    $0x10,%esp
  4f:	b8 00 00 00 00       	mov    $0x0,%eax
  54:	eb 03                	jmp    59 <worker+0x1e>
  56:	83 c0 01             	add    $0x1,%eax
  59:	83 f8 31             	cmp    $0x31,%eax
  5c:	7e f8                	jle    56 <worker+0x1b>
    global++;
  5e:	83 05 c0 0d 00 00 01 	addl   $0x1,0xdc0
    lock_release(&lock);
  65:	83 ec 0c             	sub    $0xc,%esp
  68:	68 bc 0d 00 00       	push   $0xdbc
  6d:	e8 e2 02 00 00       	call   354 <lock_release>

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
  a3:	68 14 09 00 00       	push   $0x914
  a8:	68 1e 09 00 00       	push   $0x91e
  ad:	6a 01                	push   $0x1
  af:	e8 b0 05 00 00       	call   664 <printf>
  b4:	83 c4 0c             	add    $0xc,%esp
  b7:	68 98 09 00 00       	push   $0x998
  bc:	68 3c 09 00 00       	push   $0x93c
  c1:	6a 01                	push   $0x1
  c3:	e8 9c 05 00 00       	call   664 <printf>
  c8:	83 c4 08             	add    $0x8,%esp
  cb:	68 50 09 00 00       	push   $0x950
  d0:	6a 01                	push   $0x1
  d2:	e8 8d 05 00 00       	call   664 <printf>
  d7:	83 c4 04             	add    $0x4,%esp
  da:	ff 35 c4 0d 00 00    	push   0xdc4
  e0:	e8 5a 04 00 00       	call   53f <kill>
  e5:	e8 25 04 00 00       	call   50f <exit>
    assert(nested_thread_pid > 0);
  ea:	6a 47                	push   $0x47
  ec:	68 14 09 00 00       	push   $0x914
  f1:	68 1e 09 00 00       	push   $0x91e
  f6:	6a 01                	push   $0x1
  f8:	e8 67 05 00 00       	call   664 <printf>
  fd:	83 c4 0c             	add    $0xc,%esp
 100:	68 26 09 00 00       	push   $0x926
 105:	68 3c 09 00 00       	push   $0x93c
 10a:	6a 01                	push   $0x1
 10c:	e8 53 05 00 00       	call   664 <printf>
 111:	83 c4 08             	add    $0x8,%esp
 114:	68 50 09 00 00       	push   $0x950
 119:	6a 01                	push   $0x1
 11b:	e8 44 05 00 00       	call   664 <printf>
 120:	83 c4 04             	add    $0x4,%esp
 123:	ff 35 c4 0d 00 00    	push   0xdc4
 129:	e8 11 04 00 00       	call   53f <kill>
 12e:	e8 dc 03 00 00       	call   50f <exit>
    assert(nested_join_pid > 0);
 133:	6a 49                	push   $0x49
 135:	68 14 09 00 00       	push   $0x914
 13a:	68 1e 09 00 00       	push   $0x91e
 13f:	6a 01                	push   $0x1
 141:	e8 1e 05 00 00       	call   664 <printf>
 146:	83 c4 0c             	add    $0xc,%esp
 149:	68 5d 09 00 00       	push   $0x95d
 14e:	68 3c 09 00 00       	push   $0x93c
 153:	6a 01                	push   $0x1
 155:	e8 0a 05 00 00       	call   664 <printf>
 15a:	83 c4 08             	add    $0x8,%esp
 15d:	68 50 09 00 00       	push   $0x950
 162:	6a 01                	push   $0x1
 164:	e8 fb 04 00 00       	call   664 <printf>
 169:	83 c4 04             	add    $0x4,%esp
 16c:	ff 35 c4 0d 00 00    	push   0xdc4
 172:	e8 c8 03 00 00       	call   53f <kill>
 177:	e8 93 03 00 00       	call   50f <exit>

   exit();
 17c:	e8 8e 03 00 00       	call   50f <exit>

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
 190:	e8 fa 03 00 00       	call   58f <getpid>
 195:	a3 c4 0d 00 00       	mov    %eax,0xdc4
   lock_init(&lock);
 19a:	83 ec 0c             	sub    $0xc,%esp
 19d:	68 bc 0d 00 00       	push   $0xdbc
 1a2:	e8 bb 01 00 00       	call   362 <lock_init>
   for (i = 0; i < num_threads; i++) {
 1a7:	83 c4 10             	add    $0x10,%esp
 1aa:	bb 00 00 00 00       	mov    $0x0,%ebx
 1af:	eb 03                	jmp    1b4 <main+0x33>
 1b1:	83 c3 01             	add    $0x1,%ebx
 1b4:	39 1d b8 0d 00 00    	cmp    %ebx,0xdb8
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
 1d6:	68 14 09 00 00       	push   $0x914
 1db:	68 1e 09 00 00       	push   $0x91e
 1e0:	6a 01                	push   $0x1
 1e2:	e8 7d 04 00 00       	call   664 <printf>
 1e7:	83 c4 0c             	add    $0xc,%esp
 1ea:	68 2d 09 00 00       	push   $0x92d
 1ef:	68 3c 09 00 00       	push   $0x93c
 1f4:	6a 01                	push   $0x1
 1f6:	e8 69 04 00 00       	call   664 <printf>
 1fb:	83 c4 08             	add    $0x8,%esp
 1fe:	68 50 09 00 00       	push   $0x950
 203:	6a 01                	push   $0x1
 205:	e8 5a 04 00 00       	call   664 <printf>
 20a:	83 c4 04             	add    $0x4,%esp
 20d:	ff 35 c4 0d 00 00    	push   0xdc4
 213:	e8 27 03 00 00       	call   53f <kill>
 218:	e8 f2 02 00 00       	call   50f <exit>
   for (i = 0; i < num_threads; i++) {
 21d:	bb 00 00 00 00       	mov    $0x0,%ebx
 222:	a1 b8 0d 00 00       	mov    0xdb8,%eax
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
 23b:	68 14 09 00 00       	push   $0x914
 240:	68 1e 09 00 00       	push   $0x91e
 245:	6a 01                	push   $0x1
 247:	e8 18 04 00 00       	call   664 <printf>
 24c:	83 c4 0c             	add    $0xc,%esp
 24f:	68 64 09 00 00       	push   $0x964
 254:	68 3c 09 00 00       	push   $0x93c
 259:	6a 01                	push   $0x1
 25b:	e8 04 04 00 00       	call   664 <printf>
 260:	83 c4 08             	add    $0x8,%esp
 263:	68 50 09 00 00       	push   $0x950
 268:	6a 01                	push   $0x1
 26a:	e8 f5 03 00 00       	call   664 <printf>
 26f:	83 c4 04             	add    $0x4,%esp
 272:	ff 35 c4 0d 00 00    	push   0xdc4
 278:	e8 c2 02 00 00       	call   53f <kill>
 27d:	e8 8d 02 00 00       	call   50f <exit>
   assert(global == num_threads * 2);
 282:	01 c0                	add    %eax,%eax
 284:	3b 05 c0 0d 00 00    	cmp    0xdc0,%eax
 28a:	74 49                	je     2d5 <main+0x154>
 28c:	6a 2e                	push   $0x2e
 28e:	68 14 09 00 00       	push   $0x914
 293:	68 1e 09 00 00       	push   $0x91e
 298:	6a 01                	push   $0x1
 29a:	e8 c5 03 00 00       	call   664 <printf>
 29f:	83 c4 0c             	add    $0xc,%esp
 2a2:	68 71 09 00 00       	push   $0x971
 2a7:	68 3c 09 00 00       	push   $0x93c
 2ac:	6a 01                	push   $0x1
 2ae:	e8 b1 03 00 00       	call   664 <printf>
 2b3:	83 c4 08             	add    $0x8,%esp
 2b6:	68 50 09 00 00       	push   $0x950
 2bb:	6a 01                	push   $0x1
 2bd:	e8 a2 03 00 00       	call   664 <printf>
 2c2:	83 c4 04             	add    $0x4,%esp
 2c5:	ff 35 c4 0d 00 00    	push   0xdc4
 2cb:	e8 6f 02 00 00       	call   53f <kill>
 2d0:	e8 3a 02 00 00       	call   50f <exit>
   printf(1, "TEST PASSED\n");
 2d5:	83 ec 08             	sub    $0x8,%esp
 2d8:	68 8b 09 00 00       	push   $0x98b
 2dd:	6a 01                	push   $0x1
 2df:	e8 80 03 00 00       	call   664 <printf>
   exit();
 2e4:	e8 26 02 00 00       	call   50f <exit>

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
  void *n_stack = malloc(PGSIZE);
 300:	68 00 10 00 00       	push   $0x1000
 305:	e8 80 05 00 00       	call   88a <malloc>
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
 31b:	e8 8f 02 00 00       	call   5af <clone>


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
  return 0;
}
 32c:	b8 00 00 00 00       	mov    $0x0,%eax
 331:	c3                   	ret    

00000332 <lock_acquire>:

void lock_acquire(lock_t *lock){
 332:	55                   	push   %ebp
 333:	89 e5                	mov    %esp,%ebp
 335:	53                   	push   %ebx
 336:	83 ec 04             	sub    $0x4,%esp
 339:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 33c:	83 ec 08             	sub    $0x8,%esp
 33f:	6a 01                	push   $0x1
 341:	53                   	push   %ebx
 342:	e8 a2 ff ff ff       	call   2e9 <test_and_set>
 347:	83 c4 10             	add    $0x10,%esp
 34a:	83 f8 01             	cmp    $0x1,%eax
 34d:	74 ed                	je     33c <lock_acquire+0xa>
    ;
}
 34f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 352:	c9                   	leave  
 353:	c3                   	ret    

00000354 <lock_release>:

void lock_release(lock_t *lock) {
 354:	55                   	push   %ebp
 355:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 357:	8b 45 08             	mov    0x8(%ebp),%eax
 35a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 360:	5d                   	pop    %ebp
 361:	c3                   	ret    

00000362 <lock_init>:

void lock_init(lock_t *lock) {
 362:	55                   	push   %ebp
 363:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 365:	8b 45 08             	mov    0x8(%ebp),%eax
 368:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 36e:	5d                   	pop    %ebp
 36f:	c3                   	ret    

00000370 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 370:	55                   	push   %ebp
 371:	89 e5                	mov    %esp,%ebp
 373:	56                   	push   %esi
 374:	53                   	push   %ebx
 375:	8b 75 08             	mov    0x8(%ebp),%esi
 378:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 37b:	89 f0                	mov    %esi,%eax
 37d:	89 d1                	mov    %edx,%ecx
 37f:	83 c2 01             	add    $0x1,%edx
 382:	89 c3                	mov    %eax,%ebx
 384:	83 c0 01             	add    $0x1,%eax
 387:	0f b6 09             	movzbl (%ecx),%ecx
 38a:	88 0b                	mov    %cl,(%ebx)
 38c:	84 c9                	test   %cl,%cl
 38e:	75 ed                	jne    37d <strcpy+0xd>
    ;
  return os;
}
 390:	89 f0                	mov    %esi,%eax
 392:	5b                   	pop    %ebx
 393:	5e                   	pop    %esi
 394:	5d                   	pop    %ebp
 395:	c3                   	ret    

00000396 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 396:	55                   	push   %ebp
 397:	89 e5                	mov    %esp,%ebp
 399:	8b 4d 08             	mov    0x8(%ebp),%ecx
 39c:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 39f:	eb 06                	jmp    3a7 <strcmp+0x11>
    p++, q++;
 3a1:	83 c1 01             	add    $0x1,%ecx
 3a4:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 3a7:	0f b6 01             	movzbl (%ecx),%eax
 3aa:	84 c0                	test   %al,%al
 3ac:	74 04                	je     3b2 <strcmp+0x1c>
 3ae:	3a 02                	cmp    (%edx),%al
 3b0:	74 ef                	je     3a1 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 3b2:	0f b6 c0             	movzbl %al,%eax
 3b5:	0f b6 12             	movzbl (%edx),%edx
 3b8:	29 d0                	sub    %edx,%eax
}
 3ba:	5d                   	pop    %ebp
 3bb:	c3                   	ret    

000003bc <strlen>:

uint
strlen(const char *s)
{
 3bc:	55                   	push   %ebp
 3bd:	89 e5                	mov    %esp,%ebp
 3bf:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 3c2:	b8 00 00 00 00       	mov    $0x0,%eax
 3c7:	eb 03                	jmp    3cc <strlen+0x10>
 3c9:	83 c0 01             	add    $0x1,%eax
 3cc:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 3d0:	75 f7                	jne    3c9 <strlen+0xd>
    ;
  return n;
}
 3d2:	5d                   	pop    %ebp
 3d3:	c3                   	ret    

000003d4 <memset>:

void*
memset(void *dst, int c, uint n)
{
 3d4:	55                   	push   %ebp
 3d5:	89 e5                	mov    %esp,%ebp
 3d7:	57                   	push   %edi
 3d8:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 3db:	89 d7                	mov    %edx,%edi
 3dd:	8b 4d 10             	mov    0x10(%ebp),%ecx
 3e0:	8b 45 0c             	mov    0xc(%ebp),%eax
 3e3:	fc                   	cld    
 3e4:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 3e6:	89 d0                	mov    %edx,%eax
 3e8:	8b 7d fc             	mov    -0x4(%ebp),%edi
 3eb:	c9                   	leave  
 3ec:	c3                   	ret    

000003ed <strchr>:

char*
strchr(const char *s, char c)
{
 3ed:	55                   	push   %ebp
 3ee:	89 e5                	mov    %esp,%ebp
 3f0:	8b 45 08             	mov    0x8(%ebp),%eax
 3f3:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 3f7:	eb 03                	jmp    3fc <strchr+0xf>
 3f9:	83 c0 01             	add    $0x1,%eax
 3fc:	0f b6 10             	movzbl (%eax),%edx
 3ff:	84 d2                	test   %dl,%dl
 401:	74 06                	je     409 <strchr+0x1c>
    if(*s == c)
 403:	38 ca                	cmp    %cl,%dl
 405:	75 f2                	jne    3f9 <strchr+0xc>
 407:	eb 05                	jmp    40e <strchr+0x21>
      return (char*)s;
  return 0;
 409:	b8 00 00 00 00       	mov    $0x0,%eax
}
 40e:	5d                   	pop    %ebp
 40f:	c3                   	ret    

00000410 <gets>:

char*
gets(char *buf, int max)
{
 410:	55                   	push   %ebp
 411:	89 e5                	mov    %esp,%ebp
 413:	57                   	push   %edi
 414:	56                   	push   %esi
 415:	53                   	push   %ebx
 416:	83 ec 1c             	sub    $0x1c,%esp
 419:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 41c:	bb 00 00 00 00       	mov    $0x0,%ebx
 421:	89 de                	mov    %ebx,%esi
 423:	83 c3 01             	add    $0x1,%ebx
 426:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 429:	7d 2e                	jge    459 <gets+0x49>
    cc = read(0, &c, 1);
 42b:	83 ec 04             	sub    $0x4,%esp
 42e:	6a 01                	push   $0x1
 430:	8d 45 e7             	lea    -0x19(%ebp),%eax
 433:	50                   	push   %eax
 434:	6a 00                	push   $0x0
 436:	e8 ec 00 00 00       	call   527 <read>
    if(cc < 1)
 43b:	83 c4 10             	add    $0x10,%esp
 43e:	85 c0                	test   %eax,%eax
 440:	7e 17                	jle    459 <gets+0x49>
      break;
    buf[i++] = c;
 442:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 446:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 449:	3c 0a                	cmp    $0xa,%al
 44b:	0f 94 c2             	sete   %dl
 44e:	3c 0d                	cmp    $0xd,%al
 450:	0f 94 c0             	sete   %al
 453:	08 c2                	or     %al,%dl
 455:	74 ca                	je     421 <gets+0x11>
    buf[i++] = c;
 457:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 459:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 45d:	89 f8                	mov    %edi,%eax
 45f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 462:	5b                   	pop    %ebx
 463:	5e                   	pop    %esi
 464:	5f                   	pop    %edi
 465:	5d                   	pop    %ebp
 466:	c3                   	ret    

00000467 <stat>:

int
stat(const char *n, struct stat *st)
{
 467:	55                   	push   %ebp
 468:	89 e5                	mov    %esp,%ebp
 46a:	56                   	push   %esi
 46b:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 46c:	83 ec 08             	sub    $0x8,%esp
 46f:	6a 00                	push   $0x0
 471:	ff 75 08             	push   0x8(%ebp)
 474:	e8 d6 00 00 00       	call   54f <open>
  if(fd < 0)
 479:	83 c4 10             	add    $0x10,%esp
 47c:	85 c0                	test   %eax,%eax
 47e:	78 24                	js     4a4 <stat+0x3d>
 480:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 482:	83 ec 08             	sub    $0x8,%esp
 485:	ff 75 0c             	push   0xc(%ebp)
 488:	50                   	push   %eax
 489:	e8 d9 00 00 00       	call   567 <fstat>
 48e:	89 c6                	mov    %eax,%esi
  close(fd);
 490:	89 1c 24             	mov    %ebx,(%esp)
 493:	e8 9f 00 00 00       	call   537 <close>
  return r;
 498:	83 c4 10             	add    $0x10,%esp
}
 49b:	89 f0                	mov    %esi,%eax
 49d:	8d 65 f8             	lea    -0x8(%ebp),%esp
 4a0:	5b                   	pop    %ebx
 4a1:	5e                   	pop    %esi
 4a2:	5d                   	pop    %ebp
 4a3:	c3                   	ret    
    return -1;
 4a4:	be ff ff ff ff       	mov    $0xffffffff,%esi
 4a9:	eb f0                	jmp    49b <stat+0x34>

000004ab <atoi>:

int
atoi(const char *s)
{
 4ab:	55                   	push   %ebp
 4ac:	89 e5                	mov    %esp,%ebp
 4ae:	53                   	push   %ebx
 4af:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 4b2:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 4b7:	eb 10                	jmp    4c9 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 4b9:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 4bc:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 4bf:	83 c1 01             	add    $0x1,%ecx
 4c2:	0f be c0             	movsbl %al,%eax
 4c5:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 4c9:	0f b6 01             	movzbl (%ecx),%eax
 4cc:	8d 58 d0             	lea    -0x30(%eax),%ebx
 4cf:	80 fb 09             	cmp    $0x9,%bl
 4d2:	76 e5                	jbe    4b9 <atoi+0xe>
  return n;
}
 4d4:	89 d0                	mov    %edx,%eax
 4d6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4d9:	c9                   	leave  
 4da:	c3                   	ret    

000004db <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 4db:	55                   	push   %ebp
 4dc:	89 e5                	mov    %esp,%ebp
 4de:	56                   	push   %esi
 4df:	53                   	push   %ebx
 4e0:	8b 75 08             	mov    0x8(%ebp),%esi
 4e3:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 4e6:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 4e9:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 4eb:	eb 0d                	jmp    4fa <memmove+0x1f>
    *dst++ = *src++;
 4ed:	0f b6 01             	movzbl (%ecx),%eax
 4f0:	88 02                	mov    %al,(%edx)
 4f2:	8d 49 01             	lea    0x1(%ecx),%ecx
 4f5:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 4f8:	89 d8                	mov    %ebx,%eax
 4fa:	8d 58 ff             	lea    -0x1(%eax),%ebx
 4fd:	85 c0                	test   %eax,%eax
 4ff:	7f ec                	jg     4ed <memmove+0x12>
  return vdst;
}
 501:	89 f0                	mov    %esi,%eax
 503:	5b                   	pop    %ebx
 504:	5e                   	pop    %esi
 505:	5d                   	pop    %ebp
 506:	c3                   	ret    

00000507 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 507:	b8 01 00 00 00       	mov    $0x1,%eax
 50c:	cd 40                	int    $0x40
 50e:	c3                   	ret    

0000050f <exit>:
SYSCALL(exit)
 50f:	b8 02 00 00 00       	mov    $0x2,%eax
 514:	cd 40                	int    $0x40
 516:	c3                   	ret    

00000517 <wait>:
SYSCALL(wait)
 517:	b8 03 00 00 00       	mov    $0x3,%eax
 51c:	cd 40                	int    $0x40
 51e:	c3                   	ret    

0000051f <pipe>:
SYSCALL(pipe)
 51f:	b8 04 00 00 00       	mov    $0x4,%eax
 524:	cd 40                	int    $0x40
 526:	c3                   	ret    

00000527 <read>:
SYSCALL(read)
 527:	b8 05 00 00 00       	mov    $0x5,%eax
 52c:	cd 40                	int    $0x40
 52e:	c3                   	ret    

0000052f <write>:
SYSCALL(write)
 52f:	b8 10 00 00 00       	mov    $0x10,%eax
 534:	cd 40                	int    $0x40
 536:	c3                   	ret    

00000537 <close>:
SYSCALL(close)
 537:	b8 15 00 00 00       	mov    $0x15,%eax
 53c:	cd 40                	int    $0x40
 53e:	c3                   	ret    

0000053f <kill>:
SYSCALL(kill)
 53f:	b8 06 00 00 00       	mov    $0x6,%eax
 544:	cd 40                	int    $0x40
 546:	c3                   	ret    

00000547 <exec>:
SYSCALL(exec)
 547:	b8 07 00 00 00       	mov    $0x7,%eax
 54c:	cd 40                	int    $0x40
 54e:	c3                   	ret    

0000054f <open>:
SYSCALL(open)
 54f:	b8 0f 00 00 00       	mov    $0xf,%eax
 554:	cd 40                	int    $0x40
 556:	c3                   	ret    

00000557 <mknod>:
SYSCALL(mknod)
 557:	b8 11 00 00 00       	mov    $0x11,%eax
 55c:	cd 40                	int    $0x40
 55e:	c3                   	ret    

0000055f <unlink>:
SYSCALL(unlink)
 55f:	b8 12 00 00 00       	mov    $0x12,%eax
 564:	cd 40                	int    $0x40
 566:	c3                   	ret    

00000567 <fstat>:
SYSCALL(fstat)
 567:	b8 08 00 00 00       	mov    $0x8,%eax
 56c:	cd 40                	int    $0x40
 56e:	c3                   	ret    

0000056f <link>:
SYSCALL(link)
 56f:	b8 13 00 00 00       	mov    $0x13,%eax
 574:	cd 40                	int    $0x40
 576:	c3                   	ret    

00000577 <mkdir>:
SYSCALL(mkdir)
 577:	b8 14 00 00 00       	mov    $0x14,%eax
 57c:	cd 40                	int    $0x40
 57e:	c3                   	ret    

0000057f <chdir>:
SYSCALL(chdir)
 57f:	b8 09 00 00 00       	mov    $0x9,%eax
 584:	cd 40                	int    $0x40
 586:	c3                   	ret    

00000587 <dup>:
SYSCALL(dup)
 587:	b8 0a 00 00 00       	mov    $0xa,%eax
 58c:	cd 40                	int    $0x40
 58e:	c3                   	ret    

0000058f <getpid>:
SYSCALL(getpid)
 58f:	b8 0b 00 00 00       	mov    $0xb,%eax
 594:	cd 40                	int    $0x40
 596:	c3                   	ret    

00000597 <sbrk>:
SYSCALL(sbrk)
 597:	b8 0c 00 00 00       	mov    $0xc,%eax
 59c:	cd 40                	int    $0x40
 59e:	c3                   	ret    

0000059f <sleep>:
SYSCALL(sleep)
 59f:	b8 0d 00 00 00       	mov    $0xd,%eax
 5a4:	cd 40                	int    $0x40
 5a6:	c3                   	ret    

000005a7 <uptime>:
SYSCALL(uptime)
 5a7:	b8 0e 00 00 00       	mov    $0xe,%eax
 5ac:	cd 40                	int    $0x40
 5ae:	c3                   	ret    

000005af <clone>:
SYSCALL(clone)
 5af:	b8 16 00 00 00       	mov    $0x16,%eax
 5b4:	cd 40                	int    $0x40
 5b6:	c3                   	ret    

000005b7 <join>:
 5b7:	b8 17 00 00 00       	mov    $0x17,%eax
 5bc:	cd 40                	int    $0x40
 5be:	c3                   	ret    

000005bf <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 5bf:	55                   	push   %ebp
 5c0:	89 e5                	mov    %esp,%ebp
 5c2:	83 ec 1c             	sub    $0x1c,%esp
 5c5:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 5c8:	6a 01                	push   $0x1
 5ca:	8d 55 f4             	lea    -0xc(%ebp),%edx
 5cd:	52                   	push   %edx
 5ce:	50                   	push   %eax
 5cf:	e8 5b ff ff ff       	call   52f <write>
}
 5d4:	83 c4 10             	add    $0x10,%esp
 5d7:	c9                   	leave  
 5d8:	c3                   	ret    

000005d9 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 5d9:	55                   	push   %ebp
 5da:	89 e5                	mov    %esp,%ebp
 5dc:	57                   	push   %edi
 5dd:	56                   	push   %esi
 5de:	53                   	push   %ebx
 5df:	83 ec 2c             	sub    $0x2c,%esp
 5e2:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5e5:	89 d0                	mov    %edx,%eax
 5e7:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 5e9:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 5ed:	0f 95 c1             	setne  %cl
 5f0:	c1 ea 1f             	shr    $0x1f,%edx
 5f3:	84 d1                	test   %dl,%cl
 5f5:	74 44                	je     63b <printint+0x62>
    neg = 1;
    x = -xx;
 5f7:	f7 d8                	neg    %eax
 5f9:	89 c1                	mov    %eax,%ecx
    neg = 1;
 5fb:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 602:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 607:	89 c8                	mov    %ecx,%eax
 609:	ba 00 00 00 00       	mov    $0x0,%edx
 60e:	f7 f6                	div    %esi
 610:	89 df                	mov    %ebx,%edi
 612:	83 c3 01             	add    $0x1,%ebx
 615:	0f b6 92 1c 0a 00 00 	movzbl 0xa1c(%edx),%edx
 61c:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 620:	89 ca                	mov    %ecx,%edx
 622:	89 c1                	mov    %eax,%ecx
 624:	39 d6                	cmp    %edx,%esi
 626:	76 df                	jbe    607 <printint+0x2e>
  if(neg)
 628:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 62c:	74 31                	je     65f <printint+0x86>
    buf[i++] = '-';
 62e:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 633:	8d 5f 02             	lea    0x2(%edi),%ebx
 636:	8b 75 d0             	mov    -0x30(%ebp),%esi
 639:	eb 17                	jmp    652 <printint+0x79>
    x = xx;
 63b:	89 c1                	mov    %eax,%ecx
  neg = 0;
 63d:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 644:	eb bc                	jmp    602 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 646:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 64b:	89 f0                	mov    %esi,%eax
 64d:	e8 6d ff ff ff       	call   5bf <putc>
  while(--i >= 0)
 652:	83 eb 01             	sub    $0x1,%ebx
 655:	79 ef                	jns    646 <printint+0x6d>
}
 657:	83 c4 2c             	add    $0x2c,%esp
 65a:	5b                   	pop    %ebx
 65b:	5e                   	pop    %esi
 65c:	5f                   	pop    %edi
 65d:	5d                   	pop    %ebp
 65e:	c3                   	ret    
 65f:	8b 75 d0             	mov    -0x30(%ebp),%esi
 662:	eb ee                	jmp    652 <printint+0x79>

00000664 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 664:	55                   	push   %ebp
 665:	89 e5                	mov    %esp,%ebp
 667:	57                   	push   %edi
 668:	56                   	push   %esi
 669:	53                   	push   %ebx
 66a:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 66d:	8d 45 10             	lea    0x10(%ebp),%eax
 670:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 673:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 678:	bb 00 00 00 00       	mov    $0x0,%ebx
 67d:	eb 14                	jmp    693 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 67f:	89 fa                	mov    %edi,%edx
 681:	8b 45 08             	mov    0x8(%ebp),%eax
 684:	e8 36 ff ff ff       	call   5bf <putc>
 689:	eb 05                	jmp    690 <printf+0x2c>
      }
    } else if(state == '%'){
 68b:	83 fe 25             	cmp    $0x25,%esi
 68e:	74 25                	je     6b5 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 690:	83 c3 01             	add    $0x1,%ebx
 693:	8b 45 0c             	mov    0xc(%ebp),%eax
 696:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 69a:	84 c0                	test   %al,%al
 69c:	0f 84 20 01 00 00    	je     7c2 <printf+0x15e>
    c = fmt[i] & 0xff;
 6a2:	0f be f8             	movsbl %al,%edi
 6a5:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 6a8:	85 f6                	test   %esi,%esi
 6aa:	75 df                	jne    68b <printf+0x27>
      if(c == '%'){
 6ac:	83 f8 25             	cmp    $0x25,%eax
 6af:	75 ce                	jne    67f <printf+0x1b>
        state = '%';
 6b1:	89 c6                	mov    %eax,%esi
 6b3:	eb db                	jmp    690 <printf+0x2c>
      if(c == 'd'){
 6b5:	83 f8 25             	cmp    $0x25,%eax
 6b8:	0f 84 cf 00 00 00    	je     78d <printf+0x129>
 6be:	0f 8c dd 00 00 00    	jl     7a1 <printf+0x13d>
 6c4:	83 f8 78             	cmp    $0x78,%eax
 6c7:	0f 8f d4 00 00 00    	jg     7a1 <printf+0x13d>
 6cd:	83 f8 63             	cmp    $0x63,%eax
 6d0:	0f 8c cb 00 00 00    	jl     7a1 <printf+0x13d>
 6d6:	83 e8 63             	sub    $0x63,%eax
 6d9:	83 f8 15             	cmp    $0x15,%eax
 6dc:	0f 87 bf 00 00 00    	ja     7a1 <printf+0x13d>
 6e2:	ff 24 85 c4 09 00 00 	jmp    *0x9c4(,%eax,4)
        printint(fd, *ap, 10, 1);
 6e9:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6ec:	8b 17                	mov    (%edi),%edx
 6ee:	83 ec 0c             	sub    $0xc,%esp
 6f1:	6a 01                	push   $0x1
 6f3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6f8:	8b 45 08             	mov    0x8(%ebp),%eax
 6fb:	e8 d9 fe ff ff       	call   5d9 <printint>
        ap++;
 700:	83 c7 04             	add    $0x4,%edi
 703:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 706:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 709:	be 00 00 00 00       	mov    $0x0,%esi
 70e:	eb 80                	jmp    690 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 710:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 713:	8b 17                	mov    (%edi),%edx
 715:	83 ec 0c             	sub    $0xc,%esp
 718:	6a 00                	push   $0x0
 71a:	b9 10 00 00 00       	mov    $0x10,%ecx
 71f:	8b 45 08             	mov    0x8(%ebp),%eax
 722:	e8 b2 fe ff ff       	call   5d9 <printint>
        ap++;
 727:	83 c7 04             	add    $0x4,%edi
 72a:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 72d:	83 c4 10             	add    $0x10,%esp
      state = 0;
 730:	be 00 00 00 00       	mov    $0x0,%esi
 735:	e9 56 ff ff ff       	jmp    690 <printf+0x2c>
        s = (char*)*ap;
 73a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 73d:	8b 30                	mov    (%eax),%esi
        ap++;
 73f:	83 c0 04             	add    $0x4,%eax
 742:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 745:	85 f6                	test   %esi,%esi
 747:	75 15                	jne    75e <printf+0xfa>
          s = "(null)";
 749:	be bb 09 00 00       	mov    $0x9bb,%esi
 74e:	eb 0e                	jmp    75e <printf+0xfa>
          putc(fd, *s);
 750:	0f be d2             	movsbl %dl,%edx
 753:	8b 45 08             	mov    0x8(%ebp),%eax
 756:	e8 64 fe ff ff       	call   5bf <putc>
          s++;
 75b:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 75e:	0f b6 16             	movzbl (%esi),%edx
 761:	84 d2                	test   %dl,%dl
 763:	75 eb                	jne    750 <printf+0xec>
      state = 0;
 765:	be 00 00 00 00       	mov    $0x0,%esi
 76a:	e9 21 ff ff ff       	jmp    690 <printf+0x2c>
        putc(fd, *ap);
 76f:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 772:	0f be 17             	movsbl (%edi),%edx
 775:	8b 45 08             	mov    0x8(%ebp),%eax
 778:	e8 42 fe ff ff       	call   5bf <putc>
        ap++;
 77d:	83 c7 04             	add    $0x4,%edi
 780:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 783:	be 00 00 00 00       	mov    $0x0,%esi
 788:	e9 03 ff ff ff       	jmp    690 <printf+0x2c>
        putc(fd, c);
 78d:	89 fa                	mov    %edi,%edx
 78f:	8b 45 08             	mov    0x8(%ebp),%eax
 792:	e8 28 fe ff ff       	call   5bf <putc>
      state = 0;
 797:	be 00 00 00 00       	mov    $0x0,%esi
 79c:	e9 ef fe ff ff       	jmp    690 <printf+0x2c>
        putc(fd, '%');
 7a1:	ba 25 00 00 00       	mov    $0x25,%edx
 7a6:	8b 45 08             	mov    0x8(%ebp),%eax
 7a9:	e8 11 fe ff ff       	call   5bf <putc>
        putc(fd, c);
 7ae:	89 fa                	mov    %edi,%edx
 7b0:	8b 45 08             	mov    0x8(%ebp),%eax
 7b3:	e8 07 fe ff ff       	call   5bf <putc>
      state = 0;
 7b8:	be 00 00 00 00       	mov    $0x0,%esi
 7bd:	e9 ce fe ff ff       	jmp    690 <printf+0x2c>
    }
  }
}
 7c2:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7c5:	5b                   	pop    %ebx
 7c6:	5e                   	pop    %esi
 7c7:	5f                   	pop    %edi
 7c8:	5d                   	pop    %ebp
 7c9:	c3                   	ret    

000007ca <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7ca:	55                   	push   %ebp
 7cb:	89 e5                	mov    %esp,%ebp
 7cd:	57                   	push   %edi
 7ce:	56                   	push   %esi
 7cf:	53                   	push   %ebx
 7d0:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7d3:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7d6:	a1 c8 0d 00 00       	mov    0xdc8,%eax
 7db:	eb 02                	jmp    7df <free+0x15>
 7dd:	89 d0                	mov    %edx,%eax
 7df:	39 c8                	cmp    %ecx,%eax
 7e1:	73 04                	jae    7e7 <free+0x1d>
 7e3:	39 08                	cmp    %ecx,(%eax)
 7e5:	77 12                	ja     7f9 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7e7:	8b 10                	mov    (%eax),%edx
 7e9:	39 c2                	cmp    %eax,%edx
 7eb:	77 f0                	ja     7dd <free+0x13>
 7ed:	39 c8                	cmp    %ecx,%eax
 7ef:	72 08                	jb     7f9 <free+0x2f>
 7f1:	39 ca                	cmp    %ecx,%edx
 7f3:	77 04                	ja     7f9 <free+0x2f>
 7f5:	89 d0                	mov    %edx,%eax
 7f7:	eb e6                	jmp    7df <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7f9:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7fc:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7ff:	8b 10                	mov    (%eax),%edx
 801:	39 d7                	cmp    %edx,%edi
 803:	74 19                	je     81e <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 805:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 808:	8b 50 04             	mov    0x4(%eax),%edx
 80b:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 80e:	39 ce                	cmp    %ecx,%esi
 810:	74 1b                	je     82d <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 812:	89 08                	mov    %ecx,(%eax)
  freep = p;
 814:	a3 c8 0d 00 00       	mov    %eax,0xdc8
}
 819:	5b                   	pop    %ebx
 81a:	5e                   	pop    %esi
 81b:	5f                   	pop    %edi
 81c:	5d                   	pop    %ebp
 81d:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 81e:	03 72 04             	add    0x4(%edx),%esi
 821:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 824:	8b 10                	mov    (%eax),%edx
 826:	8b 12                	mov    (%edx),%edx
 828:	89 53 f8             	mov    %edx,-0x8(%ebx)
 82b:	eb db                	jmp    808 <free+0x3e>
    p->s.size += bp->s.size;
 82d:	03 53 fc             	add    -0x4(%ebx),%edx
 830:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 833:	8b 53 f8             	mov    -0x8(%ebx),%edx
 836:	89 10                	mov    %edx,(%eax)
 838:	eb da                	jmp    814 <free+0x4a>

0000083a <morecore>:

static Header*
morecore(uint nu)
{
 83a:	55                   	push   %ebp
 83b:	89 e5                	mov    %esp,%ebp
 83d:	53                   	push   %ebx
 83e:	83 ec 04             	sub    $0x4,%esp
 841:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 843:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 848:	77 05                	ja     84f <morecore+0x15>
    nu = 4096;
 84a:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 84f:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 856:	83 ec 0c             	sub    $0xc,%esp
 859:	50                   	push   %eax
 85a:	e8 38 fd ff ff       	call   597 <sbrk>
  if(p == (char*)-1)
 85f:	83 c4 10             	add    $0x10,%esp
 862:	83 f8 ff             	cmp    $0xffffffff,%eax
 865:	74 1c                	je     883 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 867:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 86a:	83 c0 08             	add    $0x8,%eax
 86d:	83 ec 0c             	sub    $0xc,%esp
 870:	50                   	push   %eax
 871:	e8 54 ff ff ff       	call   7ca <free>
  return freep;
 876:	a1 c8 0d 00 00       	mov    0xdc8,%eax
 87b:	83 c4 10             	add    $0x10,%esp
}
 87e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 881:	c9                   	leave  
 882:	c3                   	ret    
    return 0;
 883:	b8 00 00 00 00       	mov    $0x0,%eax
 888:	eb f4                	jmp    87e <morecore+0x44>

0000088a <malloc>:

void*
malloc(uint nbytes)
{
 88a:	55                   	push   %ebp
 88b:	89 e5                	mov    %esp,%ebp
 88d:	53                   	push   %ebx
 88e:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 891:	8b 45 08             	mov    0x8(%ebp),%eax
 894:	8d 58 07             	lea    0x7(%eax),%ebx
 897:	c1 eb 03             	shr    $0x3,%ebx
 89a:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 89d:	8b 0d c8 0d 00 00    	mov    0xdc8,%ecx
 8a3:	85 c9                	test   %ecx,%ecx
 8a5:	74 04                	je     8ab <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8a7:	8b 01                	mov    (%ecx),%eax
 8a9:	eb 4a                	jmp    8f5 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 8ab:	c7 05 c8 0d 00 00 cc 	movl   $0xdcc,0xdc8
 8b2:	0d 00 00 
 8b5:	c7 05 cc 0d 00 00 cc 	movl   $0xdcc,0xdcc
 8bc:	0d 00 00 
    base.s.size = 0;
 8bf:	c7 05 d0 0d 00 00 00 	movl   $0x0,0xdd0
 8c6:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 8c9:	b9 cc 0d 00 00       	mov    $0xdcc,%ecx
 8ce:	eb d7                	jmp    8a7 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 8d0:	74 19                	je     8eb <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 8d2:	29 da                	sub    %ebx,%edx
 8d4:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8d7:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 8da:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 8dd:	89 0d c8 0d 00 00    	mov    %ecx,0xdc8
      return (void*)(p + 1);
 8e3:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 8e6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8e9:	c9                   	leave  
 8ea:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 8eb:	8b 10                	mov    (%eax),%edx
 8ed:	89 11                	mov    %edx,(%ecx)
 8ef:	eb ec                	jmp    8dd <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8f1:	89 c1                	mov    %eax,%ecx
 8f3:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 8f5:	8b 50 04             	mov    0x4(%eax),%edx
 8f8:	39 da                	cmp    %ebx,%edx
 8fa:	73 d4                	jae    8d0 <malloc+0x46>
    if(p == freep)
 8fc:	39 05 c8 0d 00 00    	cmp    %eax,0xdc8
 902:	75 ed                	jne    8f1 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 904:	89 d8                	mov    %ebx,%eax
 906:	e8 2f ff ff ff       	call   83a <morecore>
 90b:	85 c0                	test   %eax,%eax
 90d:	75 e2                	jne    8f1 <malloc+0x67>
 90f:	eb d5                	jmp    8e6 <malloc+0x5c>
