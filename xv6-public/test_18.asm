
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
   6:	68 80 0d 00 00       	push   $0xd80
   b:	e8 f6 02 00 00       	call   306 <lock_acquire>
    for(j=0;j<50;j++);
  10:	83 c4 10             	add    $0x10,%esp
  13:	b8 00 00 00 00       	mov    $0x0,%eax
  18:	eb 03                	jmp    1d <worker2+0x1d>
  1a:	83 c0 01             	add    $0x1,%eax
  1d:	83 f8 31             	cmp    $0x31,%eax
  20:	7e f8                	jle    1a <worker2+0x1a>
    global++;
  22:	83 05 84 0d 00 00 01 	addl   $0x1,0xd84
    lock_release(&lock);
  29:	83 ec 0c             	sub    $0xc,%esp
  2c:	68 80 0d 00 00       	push   $0xd80
  31:	e8 f2 02 00 00       	call   328 <lock_release>
    exit();
  36:	e8 a8 04 00 00       	call   4e3 <exit>

0000003b <worker>:
    
}
void
worker(void *arg1, void *arg2) {
  3b:	55                   	push   %ebp
  3c:	89 e5                	mov    %esp,%ebp
  3e:	53                   	push   %ebx
  3f:	83 ec 10             	sub    $0x10,%esp
   
    lock_acquire(&lock);
  42:	68 80 0d 00 00       	push   $0xd80
  47:	e8 ba 02 00 00       	call   306 <lock_acquire>
    int j;
    for(j = 0; j < 50; j++); // take some time
  4c:	83 c4 10             	add    $0x10,%esp
  4f:	b8 00 00 00 00       	mov    $0x0,%eax
  54:	eb 03                	jmp    59 <worker+0x1e>
  56:	83 c0 01             	add    $0x1,%eax
  59:	83 f8 31             	cmp    $0x31,%eax
  5c:	7e f8                	jle    56 <worker+0x1b>
    global++;
  5e:	83 05 84 0d 00 00 01 	addl   $0x1,0xd84
    lock_release(&lock);
  65:	83 ec 0c             	sub    $0xc,%esp
  68:	68 80 0d 00 00       	push   $0xd80
  6d:	e8 b6 02 00 00       	call   328 <lock_release>

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
  8c:	e8 6f 02 00 00       	call   300 <thread_join>
    assert(nested_join_pid > 0);
  91:	85 c0                	test   %eax,%eax
  93:	0f 8e 9a 00 00 00    	jle    133 <worker+0xf8>
    
    assert(nested_thread_pid==nested_join_pid);
  99:	39 c3                	cmp    %eax,%ebx
  9b:	0f 84 db 00 00 00    	je     17c <worker+0x141>
  a1:	6a 4b                	push   $0x4b
  a3:	68 e8 08 00 00       	push   $0x8e8
  a8:	68 f2 08 00 00       	push   $0x8f2
  ad:	6a 01                	push   $0x1
  af:	e8 84 05 00 00       	call   638 <printf>
  b4:	83 c4 0c             	add    $0xc,%esp
  b7:	68 6c 09 00 00       	push   $0x96c
  bc:	68 10 09 00 00       	push   $0x910
  c1:	6a 01                	push   $0x1
  c3:	e8 70 05 00 00       	call   638 <printf>
  c8:	83 c4 08             	add    $0x8,%esp
  cb:	68 24 09 00 00       	push   $0x924
  d0:	6a 01                	push   $0x1
  d2:	e8 61 05 00 00       	call   638 <printf>
  d7:	83 c4 04             	add    $0x4,%esp
  da:	ff 35 88 0d 00 00    	push   0xd88
  e0:	e8 2e 04 00 00       	call   513 <kill>
  e5:	e8 f9 03 00 00       	call   4e3 <exit>
    assert(nested_thread_pid > 0);
  ea:	6a 47                	push   $0x47
  ec:	68 e8 08 00 00       	push   $0x8e8
  f1:	68 f2 08 00 00       	push   $0x8f2
  f6:	6a 01                	push   $0x1
  f8:	e8 3b 05 00 00       	call   638 <printf>
  fd:	83 c4 0c             	add    $0xc,%esp
 100:	68 fa 08 00 00       	push   $0x8fa
 105:	68 10 09 00 00       	push   $0x910
 10a:	6a 01                	push   $0x1
 10c:	e8 27 05 00 00       	call   638 <printf>
 111:	83 c4 08             	add    $0x8,%esp
 114:	68 24 09 00 00       	push   $0x924
 119:	6a 01                	push   $0x1
 11b:	e8 18 05 00 00       	call   638 <printf>
 120:	83 c4 04             	add    $0x4,%esp
 123:	ff 35 88 0d 00 00    	push   0xd88
 129:	e8 e5 03 00 00       	call   513 <kill>
 12e:	e8 b0 03 00 00       	call   4e3 <exit>
    assert(nested_join_pid > 0);
 133:	6a 49                	push   $0x49
 135:	68 e8 08 00 00       	push   $0x8e8
 13a:	68 f2 08 00 00       	push   $0x8f2
 13f:	6a 01                	push   $0x1
 141:	e8 f2 04 00 00       	call   638 <printf>
 146:	83 c4 0c             	add    $0xc,%esp
 149:	68 31 09 00 00       	push   $0x931
 14e:	68 10 09 00 00       	push   $0x910
 153:	6a 01                	push   $0x1
 155:	e8 de 04 00 00       	call   638 <printf>
 15a:	83 c4 08             	add    $0x8,%esp
 15d:	68 24 09 00 00       	push   $0x924
 162:	6a 01                	push   $0x1
 164:	e8 cf 04 00 00       	call   638 <printf>
 169:	83 c4 04             	add    $0x4,%esp
 16c:	ff 35 88 0d 00 00    	push   0xd88
 172:	e8 9c 03 00 00       	call   513 <kill>
 177:	e8 67 03 00 00       	call   4e3 <exit>

   exit();
 17c:	e8 62 03 00 00       	call   4e3 <exit>

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
 190:	e8 ce 03 00 00       	call   563 <getpid>
 195:	a3 88 0d 00 00       	mov    %eax,0xd88
   lock_init(&lock);
 19a:	83 ec 0c             	sub    $0xc,%esp
 19d:	68 80 0d 00 00       	push   $0xd80
 1a2:	e8 8f 01 00 00       	call   336 <lock_init>
   for (i = 0; i < num_threads; i++) {
 1a7:	83 c4 10             	add    $0x10,%esp
 1aa:	bb 00 00 00 00       	mov    $0x0,%ebx
 1af:	eb 03                	jmp    1b4 <main+0x33>
 1b1:	83 c3 01             	add    $0x1,%ebx
 1b4:	39 1d 7c 0d 00 00    	cmp    %ebx,0xd7c
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
 1d6:	68 e8 08 00 00       	push   $0x8e8
 1db:	68 f2 08 00 00       	push   $0x8f2
 1e0:	6a 01                	push   $0x1
 1e2:	e8 51 04 00 00       	call   638 <printf>
 1e7:	83 c4 0c             	add    $0xc,%esp
 1ea:	68 01 09 00 00       	push   $0x901
 1ef:	68 10 09 00 00       	push   $0x910
 1f4:	6a 01                	push   $0x1
 1f6:	e8 3d 04 00 00       	call   638 <printf>
 1fb:	83 c4 08             	add    $0x8,%esp
 1fe:	68 24 09 00 00       	push   $0x924
 203:	6a 01                	push   $0x1
 205:	e8 2e 04 00 00       	call   638 <printf>
 20a:	83 c4 04             	add    $0x4,%esp
 20d:	ff 35 88 0d 00 00    	push   0xd88
 213:	e8 fb 02 00 00       	call   513 <kill>
 218:	e8 c6 02 00 00       	call   4e3 <exit>
   for (i = 0; i < num_threads; i++) {
 21d:	bb 00 00 00 00       	mov    $0x0,%ebx
 222:	a1 7c 0d 00 00       	mov    0xd7c,%eax
 227:	39 d8                	cmp    %ebx,%eax
 229:	7e 57                	jle    282 <main+0x101>
      int join_pid = thread_join();
 22b:	e8 d0 00 00 00       	call   300 <thread_join>
      assert(join_pid > 0);
 230:	85 c0                	test   %eax,%eax
 232:	7e 05                	jle    239 <main+0xb8>
   for (i = 0; i < num_threads; i++) {
 234:	83 c3 01             	add    $0x1,%ebx
 237:	eb e9                	jmp    222 <main+0xa1>
      assert(join_pid > 0);
 239:	6a 2b                	push   $0x2b
 23b:	68 e8 08 00 00       	push   $0x8e8
 240:	68 f2 08 00 00       	push   $0x8f2
 245:	6a 01                	push   $0x1
 247:	e8 ec 03 00 00       	call   638 <printf>
 24c:	83 c4 0c             	add    $0xc,%esp
 24f:	68 38 09 00 00       	push   $0x938
 254:	68 10 09 00 00       	push   $0x910
 259:	6a 01                	push   $0x1
 25b:	e8 d8 03 00 00       	call   638 <printf>
 260:	83 c4 08             	add    $0x8,%esp
 263:	68 24 09 00 00       	push   $0x924
 268:	6a 01                	push   $0x1
 26a:	e8 c9 03 00 00       	call   638 <printf>
 26f:	83 c4 04             	add    $0x4,%esp
 272:	ff 35 88 0d 00 00    	push   0xd88
 278:	e8 96 02 00 00       	call   513 <kill>
 27d:	e8 61 02 00 00       	call   4e3 <exit>
   assert(global == num_threads * 2);
 282:	01 c0                	add    %eax,%eax
 284:	3b 05 84 0d 00 00    	cmp    0xd84,%eax
 28a:	74 49                	je     2d5 <main+0x154>
 28c:	6a 2e                	push   $0x2e
 28e:	68 e8 08 00 00       	push   $0x8e8
 293:	68 f2 08 00 00       	push   $0x8f2
 298:	6a 01                	push   $0x1
 29a:	e8 99 03 00 00       	call   638 <printf>
 29f:	83 c4 0c             	add    $0xc,%esp
 2a2:	68 45 09 00 00       	push   $0x945
 2a7:	68 10 09 00 00       	push   $0x910
 2ac:	6a 01                	push   $0x1
 2ae:	e8 85 03 00 00       	call   638 <printf>
 2b3:	83 c4 08             	add    $0x8,%esp
 2b6:	68 24 09 00 00       	push   $0x924
 2bb:	6a 01                	push   $0x1
 2bd:	e8 76 03 00 00       	call   638 <printf>
 2c2:	83 c4 04             	add    $0x4,%esp
 2c5:	ff 35 88 0d 00 00    	push   0xd88
 2cb:	e8 43 02 00 00       	call   513 <kill>
 2d0:	e8 0e 02 00 00       	call   4e3 <exit>
   printf(1, "TEST PASSED\n");
 2d5:	83 ec 08             	sub    $0x8,%esp
 2d8:	68 5f 09 00 00       	push   $0x95f
 2dd:	6a 01                	push   $0x1
 2df:	e8 54 03 00 00       	call   638 <printf>
   exit();
 2e4:	e8 fa 01 00 00       	call   4e3 <exit>

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

  // I can't remember if there was something else to do here but I'm sure I'll find out


  return new_pid;
}
 2fa:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2ff:	c3                   	ret    

00000300 <thread_join>:

int thread_join() {
  return 0;
}
 300:	b8 00 00 00 00       	mov    $0x0,%eax
 305:	c3                   	ret    

00000306 <lock_acquire>:

void lock_acquire(lock_t *lock){
 306:	55                   	push   %ebp
 307:	89 e5                	mov    %esp,%ebp
 309:	53                   	push   %ebx
 30a:	83 ec 04             	sub    $0x4,%esp
 30d:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 310:	83 ec 08             	sub    $0x8,%esp
 313:	6a 01                	push   $0x1
 315:	53                   	push   %ebx
 316:	e8 ce ff ff ff       	call   2e9 <test_and_set>
 31b:	83 c4 10             	add    $0x10,%esp
 31e:	83 f8 01             	cmp    $0x1,%eax
 321:	74 ed                	je     310 <lock_acquire+0xa>
    ;
}
 323:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 326:	c9                   	leave  
 327:	c3                   	ret    

00000328 <lock_release>:

void lock_release(lock_t *lock) {
 328:	55                   	push   %ebp
 329:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 32b:	8b 45 08             	mov    0x8(%ebp),%eax
 32e:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 334:	5d                   	pop    %ebp
 335:	c3                   	ret    

00000336 <lock_init>:

void lock_init(lock_t *lock) {
 336:	55                   	push   %ebp
 337:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 339:	8b 45 08             	mov    0x8(%ebp),%eax
 33c:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 342:	5d                   	pop    %ebp
 343:	c3                   	ret    

00000344 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 344:	55                   	push   %ebp
 345:	89 e5                	mov    %esp,%ebp
 347:	56                   	push   %esi
 348:	53                   	push   %ebx
 349:	8b 75 08             	mov    0x8(%ebp),%esi
 34c:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 34f:	89 f0                	mov    %esi,%eax
 351:	89 d1                	mov    %edx,%ecx
 353:	83 c2 01             	add    $0x1,%edx
 356:	89 c3                	mov    %eax,%ebx
 358:	83 c0 01             	add    $0x1,%eax
 35b:	0f b6 09             	movzbl (%ecx),%ecx
 35e:	88 0b                	mov    %cl,(%ebx)
 360:	84 c9                	test   %cl,%cl
 362:	75 ed                	jne    351 <strcpy+0xd>
    ;
  return os;
}
 364:	89 f0                	mov    %esi,%eax
 366:	5b                   	pop    %ebx
 367:	5e                   	pop    %esi
 368:	5d                   	pop    %ebp
 369:	c3                   	ret    

0000036a <strcmp>:

int
strcmp(const char *p, const char *q)
{
 36a:	55                   	push   %ebp
 36b:	89 e5                	mov    %esp,%ebp
 36d:	8b 4d 08             	mov    0x8(%ebp),%ecx
 370:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 373:	eb 06                	jmp    37b <strcmp+0x11>
    p++, q++;
 375:	83 c1 01             	add    $0x1,%ecx
 378:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 37b:	0f b6 01             	movzbl (%ecx),%eax
 37e:	84 c0                	test   %al,%al
 380:	74 04                	je     386 <strcmp+0x1c>
 382:	3a 02                	cmp    (%edx),%al
 384:	74 ef                	je     375 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 386:	0f b6 c0             	movzbl %al,%eax
 389:	0f b6 12             	movzbl (%edx),%edx
 38c:	29 d0                	sub    %edx,%eax
}
 38e:	5d                   	pop    %ebp
 38f:	c3                   	ret    

00000390 <strlen>:

uint
strlen(const char *s)
{
 390:	55                   	push   %ebp
 391:	89 e5                	mov    %esp,%ebp
 393:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 396:	b8 00 00 00 00       	mov    $0x0,%eax
 39b:	eb 03                	jmp    3a0 <strlen+0x10>
 39d:	83 c0 01             	add    $0x1,%eax
 3a0:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 3a4:	75 f7                	jne    39d <strlen+0xd>
    ;
  return n;
}
 3a6:	5d                   	pop    %ebp
 3a7:	c3                   	ret    

000003a8 <memset>:

void*
memset(void *dst, int c, uint n)
{
 3a8:	55                   	push   %ebp
 3a9:	89 e5                	mov    %esp,%ebp
 3ab:	57                   	push   %edi
 3ac:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 3af:	89 d7                	mov    %edx,%edi
 3b1:	8b 4d 10             	mov    0x10(%ebp),%ecx
 3b4:	8b 45 0c             	mov    0xc(%ebp),%eax
 3b7:	fc                   	cld    
 3b8:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 3ba:	89 d0                	mov    %edx,%eax
 3bc:	8b 7d fc             	mov    -0x4(%ebp),%edi
 3bf:	c9                   	leave  
 3c0:	c3                   	ret    

000003c1 <strchr>:

char*
strchr(const char *s, char c)
{
 3c1:	55                   	push   %ebp
 3c2:	89 e5                	mov    %esp,%ebp
 3c4:	8b 45 08             	mov    0x8(%ebp),%eax
 3c7:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 3cb:	eb 03                	jmp    3d0 <strchr+0xf>
 3cd:	83 c0 01             	add    $0x1,%eax
 3d0:	0f b6 10             	movzbl (%eax),%edx
 3d3:	84 d2                	test   %dl,%dl
 3d5:	74 06                	je     3dd <strchr+0x1c>
    if(*s == c)
 3d7:	38 ca                	cmp    %cl,%dl
 3d9:	75 f2                	jne    3cd <strchr+0xc>
 3db:	eb 05                	jmp    3e2 <strchr+0x21>
      return (char*)s;
  return 0;
 3dd:	b8 00 00 00 00       	mov    $0x0,%eax
}
 3e2:	5d                   	pop    %ebp
 3e3:	c3                   	ret    

000003e4 <gets>:

char*
gets(char *buf, int max)
{
 3e4:	55                   	push   %ebp
 3e5:	89 e5                	mov    %esp,%ebp
 3e7:	57                   	push   %edi
 3e8:	56                   	push   %esi
 3e9:	53                   	push   %ebx
 3ea:	83 ec 1c             	sub    $0x1c,%esp
 3ed:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 3f0:	bb 00 00 00 00       	mov    $0x0,%ebx
 3f5:	89 de                	mov    %ebx,%esi
 3f7:	83 c3 01             	add    $0x1,%ebx
 3fa:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 3fd:	7d 2e                	jge    42d <gets+0x49>
    cc = read(0, &c, 1);
 3ff:	83 ec 04             	sub    $0x4,%esp
 402:	6a 01                	push   $0x1
 404:	8d 45 e7             	lea    -0x19(%ebp),%eax
 407:	50                   	push   %eax
 408:	6a 00                	push   $0x0
 40a:	e8 ec 00 00 00       	call   4fb <read>
    if(cc < 1)
 40f:	83 c4 10             	add    $0x10,%esp
 412:	85 c0                	test   %eax,%eax
 414:	7e 17                	jle    42d <gets+0x49>
      break;
    buf[i++] = c;
 416:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 41a:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 41d:	3c 0a                	cmp    $0xa,%al
 41f:	0f 94 c2             	sete   %dl
 422:	3c 0d                	cmp    $0xd,%al
 424:	0f 94 c0             	sete   %al
 427:	08 c2                	or     %al,%dl
 429:	74 ca                	je     3f5 <gets+0x11>
    buf[i++] = c;
 42b:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 42d:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 431:	89 f8                	mov    %edi,%eax
 433:	8d 65 f4             	lea    -0xc(%ebp),%esp
 436:	5b                   	pop    %ebx
 437:	5e                   	pop    %esi
 438:	5f                   	pop    %edi
 439:	5d                   	pop    %ebp
 43a:	c3                   	ret    

0000043b <stat>:

int
stat(const char *n, struct stat *st)
{
 43b:	55                   	push   %ebp
 43c:	89 e5                	mov    %esp,%ebp
 43e:	56                   	push   %esi
 43f:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 440:	83 ec 08             	sub    $0x8,%esp
 443:	6a 00                	push   $0x0
 445:	ff 75 08             	push   0x8(%ebp)
 448:	e8 d6 00 00 00       	call   523 <open>
  if(fd < 0)
 44d:	83 c4 10             	add    $0x10,%esp
 450:	85 c0                	test   %eax,%eax
 452:	78 24                	js     478 <stat+0x3d>
 454:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 456:	83 ec 08             	sub    $0x8,%esp
 459:	ff 75 0c             	push   0xc(%ebp)
 45c:	50                   	push   %eax
 45d:	e8 d9 00 00 00       	call   53b <fstat>
 462:	89 c6                	mov    %eax,%esi
  close(fd);
 464:	89 1c 24             	mov    %ebx,(%esp)
 467:	e8 9f 00 00 00       	call   50b <close>
  return r;
 46c:	83 c4 10             	add    $0x10,%esp
}
 46f:	89 f0                	mov    %esi,%eax
 471:	8d 65 f8             	lea    -0x8(%ebp),%esp
 474:	5b                   	pop    %ebx
 475:	5e                   	pop    %esi
 476:	5d                   	pop    %ebp
 477:	c3                   	ret    
    return -1;
 478:	be ff ff ff ff       	mov    $0xffffffff,%esi
 47d:	eb f0                	jmp    46f <stat+0x34>

0000047f <atoi>:

int
atoi(const char *s)
{
 47f:	55                   	push   %ebp
 480:	89 e5                	mov    %esp,%ebp
 482:	53                   	push   %ebx
 483:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 486:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 48b:	eb 10                	jmp    49d <atoi+0x1e>
    n = n*10 + *s++ - '0';
 48d:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 490:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 493:	83 c1 01             	add    $0x1,%ecx
 496:	0f be c0             	movsbl %al,%eax
 499:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 49d:	0f b6 01             	movzbl (%ecx),%eax
 4a0:	8d 58 d0             	lea    -0x30(%eax),%ebx
 4a3:	80 fb 09             	cmp    $0x9,%bl
 4a6:	76 e5                	jbe    48d <atoi+0xe>
  return n;
}
 4a8:	89 d0                	mov    %edx,%eax
 4aa:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4ad:	c9                   	leave  
 4ae:	c3                   	ret    

000004af <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 4af:	55                   	push   %ebp
 4b0:	89 e5                	mov    %esp,%ebp
 4b2:	56                   	push   %esi
 4b3:	53                   	push   %ebx
 4b4:	8b 75 08             	mov    0x8(%ebp),%esi
 4b7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 4ba:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 4bd:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 4bf:	eb 0d                	jmp    4ce <memmove+0x1f>
    *dst++ = *src++;
 4c1:	0f b6 01             	movzbl (%ecx),%eax
 4c4:	88 02                	mov    %al,(%edx)
 4c6:	8d 49 01             	lea    0x1(%ecx),%ecx
 4c9:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 4cc:	89 d8                	mov    %ebx,%eax
 4ce:	8d 58 ff             	lea    -0x1(%eax),%ebx
 4d1:	85 c0                	test   %eax,%eax
 4d3:	7f ec                	jg     4c1 <memmove+0x12>
  return vdst;
}
 4d5:	89 f0                	mov    %esi,%eax
 4d7:	5b                   	pop    %ebx
 4d8:	5e                   	pop    %esi
 4d9:	5d                   	pop    %ebp
 4da:	c3                   	ret    

000004db <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4db:	b8 01 00 00 00       	mov    $0x1,%eax
 4e0:	cd 40                	int    $0x40
 4e2:	c3                   	ret    

000004e3 <exit>:
SYSCALL(exit)
 4e3:	b8 02 00 00 00       	mov    $0x2,%eax
 4e8:	cd 40                	int    $0x40
 4ea:	c3                   	ret    

000004eb <wait>:
SYSCALL(wait)
 4eb:	b8 03 00 00 00       	mov    $0x3,%eax
 4f0:	cd 40                	int    $0x40
 4f2:	c3                   	ret    

000004f3 <pipe>:
SYSCALL(pipe)
 4f3:	b8 04 00 00 00       	mov    $0x4,%eax
 4f8:	cd 40                	int    $0x40
 4fa:	c3                   	ret    

000004fb <read>:
SYSCALL(read)
 4fb:	b8 05 00 00 00       	mov    $0x5,%eax
 500:	cd 40                	int    $0x40
 502:	c3                   	ret    

00000503 <write>:
SYSCALL(write)
 503:	b8 10 00 00 00       	mov    $0x10,%eax
 508:	cd 40                	int    $0x40
 50a:	c3                   	ret    

0000050b <close>:
SYSCALL(close)
 50b:	b8 15 00 00 00       	mov    $0x15,%eax
 510:	cd 40                	int    $0x40
 512:	c3                   	ret    

00000513 <kill>:
SYSCALL(kill)
 513:	b8 06 00 00 00       	mov    $0x6,%eax
 518:	cd 40                	int    $0x40
 51a:	c3                   	ret    

0000051b <exec>:
SYSCALL(exec)
 51b:	b8 07 00 00 00       	mov    $0x7,%eax
 520:	cd 40                	int    $0x40
 522:	c3                   	ret    

00000523 <open>:
SYSCALL(open)
 523:	b8 0f 00 00 00       	mov    $0xf,%eax
 528:	cd 40                	int    $0x40
 52a:	c3                   	ret    

0000052b <mknod>:
SYSCALL(mknod)
 52b:	b8 11 00 00 00       	mov    $0x11,%eax
 530:	cd 40                	int    $0x40
 532:	c3                   	ret    

00000533 <unlink>:
SYSCALL(unlink)
 533:	b8 12 00 00 00       	mov    $0x12,%eax
 538:	cd 40                	int    $0x40
 53a:	c3                   	ret    

0000053b <fstat>:
SYSCALL(fstat)
 53b:	b8 08 00 00 00       	mov    $0x8,%eax
 540:	cd 40                	int    $0x40
 542:	c3                   	ret    

00000543 <link>:
SYSCALL(link)
 543:	b8 13 00 00 00       	mov    $0x13,%eax
 548:	cd 40                	int    $0x40
 54a:	c3                   	ret    

0000054b <mkdir>:
SYSCALL(mkdir)
 54b:	b8 14 00 00 00       	mov    $0x14,%eax
 550:	cd 40                	int    $0x40
 552:	c3                   	ret    

00000553 <chdir>:
SYSCALL(chdir)
 553:	b8 09 00 00 00       	mov    $0x9,%eax
 558:	cd 40                	int    $0x40
 55a:	c3                   	ret    

0000055b <dup>:
SYSCALL(dup)
 55b:	b8 0a 00 00 00       	mov    $0xa,%eax
 560:	cd 40                	int    $0x40
 562:	c3                   	ret    

00000563 <getpid>:
SYSCALL(getpid)
 563:	b8 0b 00 00 00       	mov    $0xb,%eax
 568:	cd 40                	int    $0x40
 56a:	c3                   	ret    

0000056b <sbrk>:
SYSCALL(sbrk)
 56b:	b8 0c 00 00 00       	mov    $0xc,%eax
 570:	cd 40                	int    $0x40
 572:	c3                   	ret    

00000573 <sleep>:
SYSCALL(sleep)
 573:	b8 0d 00 00 00       	mov    $0xd,%eax
 578:	cd 40                	int    $0x40
 57a:	c3                   	ret    

0000057b <uptime>:
SYSCALL(uptime)
 57b:	b8 0e 00 00 00       	mov    $0xe,%eax
 580:	cd 40                	int    $0x40
 582:	c3                   	ret    

00000583 <clone>:
SYSCALL(clone)
 583:	b8 16 00 00 00       	mov    $0x16,%eax
 588:	cd 40                	int    $0x40
 58a:	c3                   	ret    

0000058b <join>:
 58b:	b8 17 00 00 00       	mov    $0x17,%eax
 590:	cd 40                	int    $0x40
 592:	c3                   	ret    

00000593 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 593:	55                   	push   %ebp
 594:	89 e5                	mov    %esp,%ebp
 596:	83 ec 1c             	sub    $0x1c,%esp
 599:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 59c:	6a 01                	push   $0x1
 59e:	8d 55 f4             	lea    -0xc(%ebp),%edx
 5a1:	52                   	push   %edx
 5a2:	50                   	push   %eax
 5a3:	e8 5b ff ff ff       	call   503 <write>
}
 5a8:	83 c4 10             	add    $0x10,%esp
 5ab:	c9                   	leave  
 5ac:	c3                   	ret    

000005ad <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 5ad:	55                   	push   %ebp
 5ae:	89 e5                	mov    %esp,%ebp
 5b0:	57                   	push   %edi
 5b1:	56                   	push   %esi
 5b2:	53                   	push   %ebx
 5b3:	83 ec 2c             	sub    $0x2c,%esp
 5b6:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5b9:	89 d0                	mov    %edx,%eax
 5bb:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 5bd:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 5c1:	0f 95 c1             	setne  %cl
 5c4:	c1 ea 1f             	shr    $0x1f,%edx
 5c7:	84 d1                	test   %dl,%cl
 5c9:	74 44                	je     60f <printint+0x62>
    neg = 1;
    x = -xx;
 5cb:	f7 d8                	neg    %eax
 5cd:	89 c1                	mov    %eax,%ecx
    neg = 1;
 5cf:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 5d6:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 5db:	89 c8                	mov    %ecx,%eax
 5dd:	ba 00 00 00 00       	mov    $0x0,%edx
 5e2:	f7 f6                	div    %esi
 5e4:	89 df                	mov    %ebx,%edi
 5e6:	83 c3 01             	add    $0x1,%ebx
 5e9:	0f b6 92 f0 09 00 00 	movzbl 0x9f0(%edx),%edx
 5f0:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 5f4:	89 ca                	mov    %ecx,%edx
 5f6:	89 c1                	mov    %eax,%ecx
 5f8:	39 d6                	cmp    %edx,%esi
 5fa:	76 df                	jbe    5db <printint+0x2e>
  if(neg)
 5fc:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 600:	74 31                	je     633 <printint+0x86>
    buf[i++] = '-';
 602:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 607:	8d 5f 02             	lea    0x2(%edi),%ebx
 60a:	8b 75 d0             	mov    -0x30(%ebp),%esi
 60d:	eb 17                	jmp    626 <printint+0x79>
    x = xx;
 60f:	89 c1                	mov    %eax,%ecx
  neg = 0;
 611:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 618:	eb bc                	jmp    5d6 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 61a:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 61f:	89 f0                	mov    %esi,%eax
 621:	e8 6d ff ff ff       	call   593 <putc>
  while(--i >= 0)
 626:	83 eb 01             	sub    $0x1,%ebx
 629:	79 ef                	jns    61a <printint+0x6d>
}
 62b:	83 c4 2c             	add    $0x2c,%esp
 62e:	5b                   	pop    %ebx
 62f:	5e                   	pop    %esi
 630:	5f                   	pop    %edi
 631:	5d                   	pop    %ebp
 632:	c3                   	ret    
 633:	8b 75 d0             	mov    -0x30(%ebp),%esi
 636:	eb ee                	jmp    626 <printint+0x79>

00000638 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 638:	55                   	push   %ebp
 639:	89 e5                	mov    %esp,%ebp
 63b:	57                   	push   %edi
 63c:	56                   	push   %esi
 63d:	53                   	push   %ebx
 63e:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 641:	8d 45 10             	lea    0x10(%ebp),%eax
 644:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 647:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 64c:	bb 00 00 00 00       	mov    $0x0,%ebx
 651:	eb 14                	jmp    667 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 653:	89 fa                	mov    %edi,%edx
 655:	8b 45 08             	mov    0x8(%ebp),%eax
 658:	e8 36 ff ff ff       	call   593 <putc>
 65d:	eb 05                	jmp    664 <printf+0x2c>
      }
    } else if(state == '%'){
 65f:	83 fe 25             	cmp    $0x25,%esi
 662:	74 25                	je     689 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 664:	83 c3 01             	add    $0x1,%ebx
 667:	8b 45 0c             	mov    0xc(%ebp),%eax
 66a:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 66e:	84 c0                	test   %al,%al
 670:	0f 84 20 01 00 00    	je     796 <printf+0x15e>
    c = fmt[i] & 0xff;
 676:	0f be f8             	movsbl %al,%edi
 679:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 67c:	85 f6                	test   %esi,%esi
 67e:	75 df                	jne    65f <printf+0x27>
      if(c == '%'){
 680:	83 f8 25             	cmp    $0x25,%eax
 683:	75 ce                	jne    653 <printf+0x1b>
        state = '%';
 685:	89 c6                	mov    %eax,%esi
 687:	eb db                	jmp    664 <printf+0x2c>
      if(c == 'd'){
 689:	83 f8 25             	cmp    $0x25,%eax
 68c:	0f 84 cf 00 00 00    	je     761 <printf+0x129>
 692:	0f 8c dd 00 00 00    	jl     775 <printf+0x13d>
 698:	83 f8 78             	cmp    $0x78,%eax
 69b:	0f 8f d4 00 00 00    	jg     775 <printf+0x13d>
 6a1:	83 f8 63             	cmp    $0x63,%eax
 6a4:	0f 8c cb 00 00 00    	jl     775 <printf+0x13d>
 6aa:	83 e8 63             	sub    $0x63,%eax
 6ad:	83 f8 15             	cmp    $0x15,%eax
 6b0:	0f 87 bf 00 00 00    	ja     775 <printf+0x13d>
 6b6:	ff 24 85 98 09 00 00 	jmp    *0x998(,%eax,4)
        printint(fd, *ap, 10, 1);
 6bd:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6c0:	8b 17                	mov    (%edi),%edx
 6c2:	83 ec 0c             	sub    $0xc,%esp
 6c5:	6a 01                	push   $0x1
 6c7:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6cc:	8b 45 08             	mov    0x8(%ebp),%eax
 6cf:	e8 d9 fe ff ff       	call   5ad <printint>
        ap++;
 6d4:	83 c7 04             	add    $0x4,%edi
 6d7:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 6da:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 6dd:	be 00 00 00 00       	mov    $0x0,%esi
 6e2:	eb 80                	jmp    664 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 6e4:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6e7:	8b 17                	mov    (%edi),%edx
 6e9:	83 ec 0c             	sub    $0xc,%esp
 6ec:	6a 00                	push   $0x0
 6ee:	b9 10 00 00 00       	mov    $0x10,%ecx
 6f3:	8b 45 08             	mov    0x8(%ebp),%eax
 6f6:	e8 b2 fe ff ff       	call   5ad <printint>
        ap++;
 6fb:	83 c7 04             	add    $0x4,%edi
 6fe:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 701:	83 c4 10             	add    $0x10,%esp
      state = 0;
 704:	be 00 00 00 00       	mov    $0x0,%esi
 709:	e9 56 ff ff ff       	jmp    664 <printf+0x2c>
        s = (char*)*ap;
 70e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 711:	8b 30                	mov    (%eax),%esi
        ap++;
 713:	83 c0 04             	add    $0x4,%eax
 716:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 719:	85 f6                	test   %esi,%esi
 71b:	75 15                	jne    732 <printf+0xfa>
          s = "(null)";
 71d:	be 8f 09 00 00       	mov    $0x98f,%esi
 722:	eb 0e                	jmp    732 <printf+0xfa>
          putc(fd, *s);
 724:	0f be d2             	movsbl %dl,%edx
 727:	8b 45 08             	mov    0x8(%ebp),%eax
 72a:	e8 64 fe ff ff       	call   593 <putc>
          s++;
 72f:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 732:	0f b6 16             	movzbl (%esi),%edx
 735:	84 d2                	test   %dl,%dl
 737:	75 eb                	jne    724 <printf+0xec>
      state = 0;
 739:	be 00 00 00 00       	mov    $0x0,%esi
 73e:	e9 21 ff ff ff       	jmp    664 <printf+0x2c>
        putc(fd, *ap);
 743:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 746:	0f be 17             	movsbl (%edi),%edx
 749:	8b 45 08             	mov    0x8(%ebp),%eax
 74c:	e8 42 fe ff ff       	call   593 <putc>
        ap++;
 751:	83 c7 04             	add    $0x4,%edi
 754:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 757:	be 00 00 00 00       	mov    $0x0,%esi
 75c:	e9 03 ff ff ff       	jmp    664 <printf+0x2c>
        putc(fd, c);
 761:	89 fa                	mov    %edi,%edx
 763:	8b 45 08             	mov    0x8(%ebp),%eax
 766:	e8 28 fe ff ff       	call   593 <putc>
      state = 0;
 76b:	be 00 00 00 00       	mov    $0x0,%esi
 770:	e9 ef fe ff ff       	jmp    664 <printf+0x2c>
        putc(fd, '%');
 775:	ba 25 00 00 00       	mov    $0x25,%edx
 77a:	8b 45 08             	mov    0x8(%ebp),%eax
 77d:	e8 11 fe ff ff       	call   593 <putc>
        putc(fd, c);
 782:	89 fa                	mov    %edi,%edx
 784:	8b 45 08             	mov    0x8(%ebp),%eax
 787:	e8 07 fe ff ff       	call   593 <putc>
      state = 0;
 78c:	be 00 00 00 00       	mov    $0x0,%esi
 791:	e9 ce fe ff ff       	jmp    664 <printf+0x2c>
    }
  }
}
 796:	8d 65 f4             	lea    -0xc(%ebp),%esp
 799:	5b                   	pop    %ebx
 79a:	5e                   	pop    %esi
 79b:	5f                   	pop    %edi
 79c:	5d                   	pop    %ebp
 79d:	c3                   	ret    

0000079e <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 79e:	55                   	push   %ebp
 79f:	89 e5                	mov    %esp,%ebp
 7a1:	57                   	push   %edi
 7a2:	56                   	push   %esi
 7a3:	53                   	push   %ebx
 7a4:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7a7:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7aa:	a1 8c 0d 00 00       	mov    0xd8c,%eax
 7af:	eb 02                	jmp    7b3 <free+0x15>
 7b1:	89 d0                	mov    %edx,%eax
 7b3:	39 c8                	cmp    %ecx,%eax
 7b5:	73 04                	jae    7bb <free+0x1d>
 7b7:	39 08                	cmp    %ecx,(%eax)
 7b9:	77 12                	ja     7cd <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7bb:	8b 10                	mov    (%eax),%edx
 7bd:	39 c2                	cmp    %eax,%edx
 7bf:	77 f0                	ja     7b1 <free+0x13>
 7c1:	39 c8                	cmp    %ecx,%eax
 7c3:	72 08                	jb     7cd <free+0x2f>
 7c5:	39 ca                	cmp    %ecx,%edx
 7c7:	77 04                	ja     7cd <free+0x2f>
 7c9:	89 d0                	mov    %edx,%eax
 7cb:	eb e6                	jmp    7b3 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7cd:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7d0:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7d3:	8b 10                	mov    (%eax),%edx
 7d5:	39 d7                	cmp    %edx,%edi
 7d7:	74 19                	je     7f2 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 7d9:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7dc:	8b 50 04             	mov    0x4(%eax),%edx
 7df:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7e2:	39 ce                	cmp    %ecx,%esi
 7e4:	74 1b                	je     801 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 7e6:	89 08                	mov    %ecx,(%eax)
  freep = p;
 7e8:	a3 8c 0d 00 00       	mov    %eax,0xd8c
}
 7ed:	5b                   	pop    %ebx
 7ee:	5e                   	pop    %esi
 7ef:	5f                   	pop    %edi
 7f0:	5d                   	pop    %ebp
 7f1:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 7f2:	03 72 04             	add    0x4(%edx),%esi
 7f5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7f8:	8b 10                	mov    (%eax),%edx
 7fa:	8b 12                	mov    (%edx),%edx
 7fc:	89 53 f8             	mov    %edx,-0x8(%ebx)
 7ff:	eb db                	jmp    7dc <free+0x3e>
    p->s.size += bp->s.size;
 801:	03 53 fc             	add    -0x4(%ebx),%edx
 804:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 807:	8b 53 f8             	mov    -0x8(%ebx),%edx
 80a:	89 10                	mov    %edx,(%eax)
 80c:	eb da                	jmp    7e8 <free+0x4a>

0000080e <morecore>:

static Header*
morecore(uint nu)
{
 80e:	55                   	push   %ebp
 80f:	89 e5                	mov    %esp,%ebp
 811:	53                   	push   %ebx
 812:	83 ec 04             	sub    $0x4,%esp
 815:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 817:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 81c:	77 05                	ja     823 <morecore+0x15>
    nu = 4096;
 81e:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 823:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 82a:	83 ec 0c             	sub    $0xc,%esp
 82d:	50                   	push   %eax
 82e:	e8 38 fd ff ff       	call   56b <sbrk>
  if(p == (char*)-1)
 833:	83 c4 10             	add    $0x10,%esp
 836:	83 f8 ff             	cmp    $0xffffffff,%eax
 839:	74 1c                	je     857 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 83b:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 83e:	83 c0 08             	add    $0x8,%eax
 841:	83 ec 0c             	sub    $0xc,%esp
 844:	50                   	push   %eax
 845:	e8 54 ff ff ff       	call   79e <free>
  return freep;
 84a:	a1 8c 0d 00 00       	mov    0xd8c,%eax
 84f:	83 c4 10             	add    $0x10,%esp
}
 852:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 855:	c9                   	leave  
 856:	c3                   	ret    
    return 0;
 857:	b8 00 00 00 00       	mov    $0x0,%eax
 85c:	eb f4                	jmp    852 <morecore+0x44>

0000085e <malloc>:

void*
malloc(uint nbytes)
{
 85e:	55                   	push   %ebp
 85f:	89 e5                	mov    %esp,%ebp
 861:	53                   	push   %ebx
 862:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 865:	8b 45 08             	mov    0x8(%ebp),%eax
 868:	8d 58 07             	lea    0x7(%eax),%ebx
 86b:	c1 eb 03             	shr    $0x3,%ebx
 86e:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 871:	8b 0d 8c 0d 00 00    	mov    0xd8c,%ecx
 877:	85 c9                	test   %ecx,%ecx
 879:	74 04                	je     87f <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 87b:	8b 01                	mov    (%ecx),%eax
 87d:	eb 4a                	jmp    8c9 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 87f:	c7 05 8c 0d 00 00 90 	movl   $0xd90,0xd8c
 886:	0d 00 00 
 889:	c7 05 90 0d 00 00 90 	movl   $0xd90,0xd90
 890:	0d 00 00 
    base.s.size = 0;
 893:	c7 05 94 0d 00 00 00 	movl   $0x0,0xd94
 89a:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 89d:	b9 90 0d 00 00       	mov    $0xd90,%ecx
 8a2:	eb d7                	jmp    87b <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 8a4:	74 19                	je     8bf <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 8a6:	29 da                	sub    %ebx,%edx
 8a8:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8ab:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 8ae:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 8b1:	89 0d 8c 0d 00 00    	mov    %ecx,0xd8c
      return (void*)(p + 1);
 8b7:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 8ba:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8bd:	c9                   	leave  
 8be:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 8bf:	8b 10                	mov    (%eax),%edx
 8c1:	89 11                	mov    %edx,(%ecx)
 8c3:	eb ec                	jmp    8b1 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8c5:	89 c1                	mov    %eax,%ecx
 8c7:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 8c9:	8b 50 04             	mov    0x4(%eax),%edx
 8cc:	39 da                	cmp    %ebx,%edx
 8ce:	73 d4                	jae    8a4 <malloc+0x46>
    if(p == freep)
 8d0:	39 05 8c 0d 00 00    	cmp    %eax,0xd8c
 8d6:	75 ed                	jne    8c5 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 8d8:	89 d8                	mov    %ebx,%eax
 8da:	e8 2f ff ff ff       	call   80e <morecore>
 8df:	85 c0                	test   %eax,%eax
 8e1:	75 e2                	jne    8c5 <malloc+0x67>
 8e3:	eb d5                	jmp    8ba <malloc+0x5c>
