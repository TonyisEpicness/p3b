
_test_18:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

void worker(void *arg1, void *arg2);

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	53                   	push   %ebx
   e:	51                   	push   %ecx
   ppid = getpid();
   f:	e8 7f 05 00 00       	call   593 <getpid>

   lock_init(&lock);
  14:	83 ec 0c             	sub    $0xc,%esp
  17:	68 44 0e 00 00       	push   $0xe44
   ppid = getpid();
  1c:	a3 4c 0e 00 00       	mov    %eax,0xe4c
   lock_init(&lock);
  21:	e8 8a 02 00 00       	call   2b0 <lock_init>

   int i;
   for (i = 0; i < num_threads; i++) {
  26:	a1 40 0e 00 00       	mov    0xe40,%eax
  2b:	83 c4 10             	add    $0x10,%esp
  2e:	85 c0                	test   %eax,%eax
  30:	0f 8e b4 00 00 00    	jle    ea <main+0xea>
  36:	31 db                	xor    %ebx,%ebx
  38:	eb 12                	jmp    4c <main+0x4c>
  3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  40:	a1 40 0e 00 00       	mov    0xe40,%eax
  45:	83 c3 01             	add    $0x1,%ebx
  48:	39 d8                	cmp    %ebx,%eax
  4a:	7e 5e                	jle    aa <main+0xaa>
      int thread_pid = thread_create(worker, 0, 0);
  4c:	83 ec 04             	sub    $0x4,%esp
  4f:	6a 00                	push   $0x0
  51:	6a 00                	push   $0x0
  53:	68 60 01 00 00       	push   $0x160
  58:	e8 03 02 00 00       	call   260 <thread_create>
      assert(thread_pid > 0);
  5d:	83 c4 10             	add    $0x10,%esp
  60:	85 c0                	test   %eax,%eax
  62:	7f dc                	jg     40 <main+0x40>
  64:	6a 26                	push   $0x26
  66:	68 a8 09 00 00       	push   $0x9a8
  6b:	68 b2 09 00 00       	push   $0x9b2
  70:	6a 01                	push   $0x1
  72:	e8 09 06 00 00       	call   680 <printf>
  77:	83 c4 0c             	add    $0xc,%esp
  7a:	68 c1 09 00 00       	push   $0x9c1
   }

   for (i = 0; i < num_threads; i++) {
      int join_pid = thread_join();
      assert(join_pid > 0);
  7f:	68 d0 09 00 00       	push   $0x9d0
  84:	6a 01                	push   $0x1
  86:	e8 f5 05 00 00       	call   680 <printf>
  8b:	5a                   	pop    %edx
  8c:	59                   	pop    %ecx
  8d:	68 e4 09 00 00       	push   $0x9e4
  92:	6a 01                	push   $0x1
  94:	e8 e7 05 00 00       	call   680 <printf>
  99:	5b                   	pop    %ebx
  9a:	ff 35 4c 0e 00 00    	push   0xe4c
  a0:	e8 9e 04 00 00       	call   543 <kill>
  a5:	e8 69 04 00 00       	call   513 <exit>
   for (i = 0; i < num_threads; i++) {
  aa:	85 c0                	test   %eax,%eax
  ac:	7e 3c                	jle    ea <main+0xea>
  ae:	31 db                	xor    %ebx,%ebx
  b0:	eb 12                	jmp    c4 <main+0xc4>
  b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  b8:	a1 40 0e 00 00       	mov    0xe40,%eax
  bd:	83 c3 01             	add    $0x1,%ebx
  c0:	39 d8                	cmp    %ebx,%eax
  c2:	7e 26                	jle    ea <main+0xea>
      int join_pid = thread_join();
  c4:	e8 a7 01 00 00       	call   270 <thread_join>
      assert(join_pid > 0);
  c9:	85 c0                	test   %eax,%eax
  cb:	7f eb                	jg     b8 <main+0xb8>
  cd:	6a 2b                	push   $0x2b
  cf:	68 a8 09 00 00       	push   $0x9a8
  d4:	68 b2 09 00 00       	push   $0x9b2
  d9:	6a 01                	push   $0x1
  db:	e8 a0 05 00 00       	call   680 <printf>
  e0:	83 c4 0c             	add    $0xc,%esp
  e3:	68 f8 09 00 00       	push   $0x9f8
  e8:	eb 95                	jmp    7f <main+0x7f>
   }

   assert(global == num_threads * 2);
  ea:	01 c0                	add    %eax,%eax
  ec:	3b 05 48 0e 00 00    	cmp    0xe48,%eax
  f2:	74 20                	je     114 <main+0x114>
  f4:	6a 2e                	push   $0x2e
  f6:	68 a8 09 00 00       	push   $0x9a8
  fb:	68 b2 09 00 00       	push   $0x9b2
 100:	6a 01                	push   $0x1
 102:	e8 79 05 00 00       	call   680 <printf>
 107:	83 c4 0c             	add    $0xc,%esp
 10a:	68 05 0a 00 00       	push   $0xa05
 10f:	e9 6b ff ff ff       	jmp    7f <main+0x7f>

   printf(1, "TEST PASSED\n");
 114:	50                   	push   %eax
 115:	50                   	push   %eax
 116:	68 1f 0a 00 00       	push   $0xa1f
 11b:	6a 01                	push   $0x1
 11d:	e8 5e 05 00 00       	call   680 <printf>
   exit();
 122:	e8 ec 03 00 00       	call   513 <exit>
 127:	66 90                	xchg   %ax,%ax
 129:	66 90                	xchg   %ax,%ax
 12b:	66 90                	xchg   %ax,%ax
 12d:	66 90                	xchg   %ax,%ax
 12f:	90                   	nop

00000130 <worker2>:
}

void worker2(void *arg1,void *arg2){
 130:	55                   	push   %ebp
 131:	89 e5                	mov    %esp,%ebp
 133:	83 ec 14             	sub    $0x14,%esp
    int j;
    lock_acquire(&lock);
 136:	68 44 0e 00 00       	push   $0xe44
 13b:	e8 40 01 00 00       	call   280 <lock_acquire>
    for(j=0;j<50;j++);
    global++;
    lock_release(&lock);
 140:	c7 04 24 44 0e 00 00 	movl   $0xe44,(%esp)
    global++;
 147:	83 05 48 0e 00 00 01 	addl   $0x1,0xe48
    lock_release(&lock);
 14e:	e8 4d 01 00 00       	call   2a0 <lock_release>
    exit();
 153:	e8 bb 03 00 00       	call   513 <exit>
 158:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 15f:	90                   	nop

00000160 <worker>:
    
}
void
worker(void *arg1, void *arg2) {
 160:	55                   	push   %ebp
 161:	89 e5                	mov    %esp,%ebp
 163:	53                   	push   %ebx
 164:	83 ec 10             	sub    $0x10,%esp
   
    lock_acquire(&lock);
 167:	68 44 0e 00 00       	push   $0xe44
 16c:	e8 0f 01 00 00       	call   280 <lock_acquire>
    int j;
    for(j = 0; j < 50; j++); // take some time
    global++;
    lock_release(&lock);
 171:	c7 04 24 44 0e 00 00 	movl   $0xe44,(%esp)
    global++;
 178:	83 05 48 0e 00 00 01 	addl   $0x1,0xe48
    lock_release(&lock);
 17f:	e8 1c 01 00 00       	call   2a0 <lock_release>

    int nested_thread_pid = thread_create(worker2, 0, 0);
 184:	83 c4 0c             	add    $0xc,%esp
 187:	6a 00                	push   $0x0
 189:	6a 00                	push   $0x0
 18b:	68 30 01 00 00       	push   $0x130
 190:	e8 cb 00 00 00       	call   260 <thread_create>
    assert(nested_thread_pid > 0);
 195:	83 c4 10             	add    $0x10,%esp
 198:	85 c0                	test   %eax,%eax
 19a:	7e 59                	jle    1f5 <worker+0x95>
 19c:	89 c3                	mov    %eax,%ebx
    int nested_join_pid = thread_join();
 19e:	e8 cd 00 00 00       	call   270 <thread_join>
    assert(nested_join_pid > 0);
 1a3:	85 c0                	test   %eax,%eax
 1a5:	7e 6b                	jle    212 <worker+0xb2>
    
    assert(nested_thread_pid==nested_join_pid);
 1a7:	39 c3                	cmp    %eax,%ebx
 1a9:	0f 84 80 00 00 00    	je     22f <worker+0xcf>
 1af:	6a 4b                	push   $0x4b
 1b1:	68 a8 09 00 00       	push   $0x9a8
 1b6:	68 b2 09 00 00       	push   $0x9b2
 1bb:	6a 01                	push   $0x1
 1bd:	e8 be 04 00 00       	call   680 <printf>
 1c2:	83 c4 0c             	add    $0xc,%esp
 1c5:	68 2c 0a 00 00       	push   $0xa2c
    assert(nested_join_pid > 0);
 1ca:	68 d0 09 00 00       	push   $0x9d0
 1cf:	6a 01                	push   $0x1
 1d1:	e8 aa 04 00 00       	call   680 <printf>
 1d6:	58                   	pop    %eax
 1d7:	5a                   	pop    %edx
 1d8:	68 e4 09 00 00       	push   $0x9e4
 1dd:	6a 01                	push   $0x1
 1df:	e8 9c 04 00 00       	call   680 <printf>
 1e4:	59                   	pop    %ecx
 1e5:	ff 35 4c 0e 00 00    	push   0xe4c
 1eb:	e8 53 03 00 00       	call   543 <kill>
 1f0:	e8 1e 03 00 00       	call   513 <exit>
    assert(nested_thread_pid > 0);
 1f5:	6a 47                	push   $0x47
 1f7:	68 a8 09 00 00       	push   $0x9a8
 1fc:	68 b2 09 00 00       	push   $0x9b2
 201:	6a 01                	push   $0x1
 203:	e8 78 04 00 00       	call   680 <printf>
 208:	83 c4 0c             	add    $0xc,%esp
 20b:	68 ba 09 00 00       	push   $0x9ba
 210:	eb b8                	jmp    1ca <worker+0x6a>
    assert(nested_join_pid > 0);
 212:	6a 49                	push   $0x49
 214:	68 a8 09 00 00       	push   $0x9a8
 219:	68 b2 09 00 00       	push   $0x9b2
 21e:	6a 01                	push   $0x1
 220:	e8 5b 04 00 00       	call   680 <printf>
 225:	83 c4 0c             	add    $0xc,%esp
 228:	68 f1 09 00 00       	push   $0x9f1
 22d:	eb 9b                	jmp    1ca <worker+0x6a>

   exit();
 22f:	e8 df 02 00 00       	call   513 <exit>
 234:	66 90                	xchg   %ax,%ax
 236:	66 90                	xchg   %ax,%ax
 238:	66 90                	xchg   %ax,%ax
 23a:	66 90                	xchg   %ax,%ax
 23c:	66 90                	xchg   %ax,%ax
 23e:	66 90                	xchg   %ax,%ax

00000240 <test_and_set>:
#include "stat.h"
#include "fcntl.h"
#include "user.h"
#include "x86.h"

int test_and_set(int *old_ptr, int new_ptr) {
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *old_ptr;
  *old_ptr = new_ptr;
 246:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  int old = *old_ptr;
 249:	8b 10                	mov    (%eax),%edx
  *old_ptr = new_ptr;
 24b:	89 08                	mov    %ecx,(%eax)
  return old;
}
 24d:	5d                   	pop    %ebp
 24e:	89 d0                	mov    %edx,%eax
 250:	c3                   	ret    
 251:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 258:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 25f:	90                   	nop

00000260 <thread_create>:

int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
  return 0;
}
 260:	31 c0                	xor    %eax,%eax
 262:	c3                   	ret    
 263:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 26a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000270 <thread_join>:

int thread_join() {
  return 0;
}
 270:	31 c0                	xor    %eax,%eax
 272:	c3                   	ret    
 273:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 27a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000280 <lock_acquire>:

void lock_acquire(lock_t *lock){
 280:	55                   	push   %ebp
 281:	89 e5                	mov    %esp,%ebp
 283:	8b 45 08             	mov    0x8(%ebp),%eax
  while(test_and_set(&lock->flag, 1) == 1)
 286:	83 38 01             	cmpl   $0x1,(%eax)
 289:	75 05                	jne    290 <lock_acquire+0x10>
 28b:	eb fe                	jmp    28b <lock_acquire+0xb>
 28d:	8d 76 00             	lea    0x0(%esi),%esi
 290:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
    ;
}
 296:	5d                   	pop    %ebp
 297:	c3                   	ret    
 298:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 29f:	90                   	nop

000002a0 <lock_release>:

void lock_release(lock_t *lock) {
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 2a3:	8b 45 08             	mov    0x8(%ebp),%eax
 2a6:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 2ac:	5d                   	pop    %ebp
 2ad:	c3                   	ret    
 2ae:	66 90                	xchg   %ax,%ax

000002b0 <lock_init>:
 2b0:	55                   	push   %ebp
 2b1:	89 e5                	mov    %esp,%ebp
 2b3:	8b 45 08             	mov    0x8(%ebp),%eax
 2b6:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 2bc:	5d                   	pop    %ebp
 2bd:	c3                   	ret    
 2be:	66 90                	xchg   %ax,%ax

000002c0 <strcpy>:
  lock->flag = 0;
}

char*
strcpy(char *s, const char *t)
{
 2c0:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 2c1:	31 c0                	xor    %eax,%eax
{
 2c3:	89 e5                	mov    %esp,%ebp
 2c5:	53                   	push   %ebx
 2c6:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2c9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 2cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 2d0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 2d4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 2d7:	83 c0 01             	add    $0x1,%eax
 2da:	84 d2                	test   %dl,%dl
 2dc:	75 f2                	jne    2d0 <strcpy+0x10>
    ;
  return os;
}
 2de:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2e1:	89 c8                	mov    %ecx,%eax
 2e3:	c9                   	leave  
 2e4:	c3                   	ret    
 2e5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000002f0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 2f0:	55                   	push   %ebp
 2f1:	89 e5                	mov    %esp,%ebp
 2f3:	53                   	push   %ebx
 2f4:	8b 55 08             	mov    0x8(%ebp),%edx
 2f7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 2fa:	0f b6 02             	movzbl (%edx),%eax
 2fd:	84 c0                	test   %al,%al
 2ff:	75 17                	jne    318 <strcmp+0x28>
 301:	eb 3a                	jmp    33d <strcmp+0x4d>
 303:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 307:	90                   	nop
 308:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 30c:	83 c2 01             	add    $0x1,%edx
 30f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 312:	84 c0                	test   %al,%al
 314:	74 1a                	je     330 <strcmp+0x40>
    p++, q++;
 316:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 318:	0f b6 19             	movzbl (%ecx),%ebx
 31b:	38 c3                	cmp    %al,%bl
 31d:	74 e9                	je     308 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 31f:	29 d8                	sub    %ebx,%eax
}
 321:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 324:	c9                   	leave  
 325:	c3                   	ret    
 326:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 32d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 330:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 334:	31 c0                	xor    %eax,%eax
 336:	29 d8                	sub    %ebx,%eax
}
 338:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 33b:	c9                   	leave  
 33c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 33d:	0f b6 19             	movzbl (%ecx),%ebx
 340:	31 c0                	xor    %eax,%eax
 342:	eb db                	jmp    31f <strcmp+0x2f>
 344:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 34b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 34f:	90                   	nop

00000350 <strlen>:

uint
strlen(const char *s)
{
 350:	55                   	push   %ebp
 351:	89 e5                	mov    %esp,%ebp
 353:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 356:	80 3a 00             	cmpb   $0x0,(%edx)
 359:	74 15                	je     370 <strlen+0x20>
 35b:	31 c0                	xor    %eax,%eax
 35d:	8d 76 00             	lea    0x0(%esi),%esi
 360:	83 c0 01             	add    $0x1,%eax
 363:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 367:	89 c1                	mov    %eax,%ecx
 369:	75 f5                	jne    360 <strlen+0x10>
    ;
  return n;
}
 36b:	89 c8                	mov    %ecx,%eax
 36d:	5d                   	pop    %ebp
 36e:	c3                   	ret    
 36f:	90                   	nop
  for(n = 0; s[n]; n++)
 370:	31 c9                	xor    %ecx,%ecx
}
 372:	5d                   	pop    %ebp
 373:	89 c8                	mov    %ecx,%eax
 375:	c3                   	ret    
 376:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 37d:	8d 76 00             	lea    0x0(%esi),%esi

00000380 <memset>:

void*
memset(void *dst, int c, uint n)
{
 380:	55                   	push   %ebp
 381:	89 e5                	mov    %esp,%ebp
 383:	57                   	push   %edi
 384:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 387:	8b 4d 10             	mov    0x10(%ebp),%ecx
 38a:	8b 45 0c             	mov    0xc(%ebp),%eax
 38d:	89 d7                	mov    %edx,%edi
 38f:	fc                   	cld    
 390:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 392:	8b 7d fc             	mov    -0x4(%ebp),%edi
 395:	89 d0                	mov    %edx,%eax
 397:	c9                   	leave  
 398:	c3                   	ret    
 399:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000003a0 <strchr>:

char*
strchr(const char *s, char c)
{
 3a0:	55                   	push   %ebp
 3a1:	89 e5                	mov    %esp,%ebp
 3a3:	8b 45 08             	mov    0x8(%ebp),%eax
 3a6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 3aa:	0f b6 10             	movzbl (%eax),%edx
 3ad:	84 d2                	test   %dl,%dl
 3af:	75 12                	jne    3c3 <strchr+0x23>
 3b1:	eb 1d                	jmp    3d0 <strchr+0x30>
 3b3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3b7:	90                   	nop
 3b8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 3bc:	83 c0 01             	add    $0x1,%eax
 3bf:	84 d2                	test   %dl,%dl
 3c1:	74 0d                	je     3d0 <strchr+0x30>
    if(*s == c)
 3c3:	38 d1                	cmp    %dl,%cl
 3c5:	75 f1                	jne    3b8 <strchr+0x18>
      return (char*)s;
  return 0;
}
 3c7:	5d                   	pop    %ebp
 3c8:	c3                   	ret    
 3c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 3d0:	31 c0                	xor    %eax,%eax
}
 3d2:	5d                   	pop    %ebp
 3d3:	c3                   	ret    
 3d4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3df:	90                   	nop

000003e0 <gets>:

char*
gets(char *buf, int max)
{
 3e0:	55                   	push   %ebp
 3e1:	89 e5                	mov    %esp,%ebp
 3e3:	57                   	push   %edi
 3e4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 3e5:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 3e8:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 3e9:	31 db                	xor    %ebx,%ebx
{
 3eb:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 3ee:	eb 27                	jmp    417 <gets+0x37>
    cc = read(0, &c, 1);
 3f0:	83 ec 04             	sub    $0x4,%esp
 3f3:	6a 01                	push   $0x1
 3f5:	57                   	push   %edi
 3f6:	6a 00                	push   $0x0
 3f8:	e8 2e 01 00 00       	call   52b <read>
    if(cc < 1)
 3fd:	83 c4 10             	add    $0x10,%esp
 400:	85 c0                	test   %eax,%eax
 402:	7e 1d                	jle    421 <gets+0x41>
      break;
    buf[i++] = c;
 404:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 408:	8b 55 08             	mov    0x8(%ebp),%edx
 40b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 40f:	3c 0a                	cmp    $0xa,%al
 411:	74 1d                	je     430 <gets+0x50>
 413:	3c 0d                	cmp    $0xd,%al
 415:	74 19                	je     430 <gets+0x50>
  for(i=0; i+1 < max; ){
 417:	89 de                	mov    %ebx,%esi
 419:	83 c3 01             	add    $0x1,%ebx
 41c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 41f:	7c cf                	jl     3f0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 421:	8b 45 08             	mov    0x8(%ebp),%eax
 424:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 428:	8d 65 f4             	lea    -0xc(%ebp),%esp
 42b:	5b                   	pop    %ebx
 42c:	5e                   	pop    %esi
 42d:	5f                   	pop    %edi
 42e:	5d                   	pop    %ebp
 42f:	c3                   	ret    
  buf[i] = '\0';
 430:	8b 45 08             	mov    0x8(%ebp),%eax
 433:	89 de                	mov    %ebx,%esi
 435:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 439:	8d 65 f4             	lea    -0xc(%ebp),%esp
 43c:	5b                   	pop    %ebx
 43d:	5e                   	pop    %esi
 43e:	5f                   	pop    %edi
 43f:	5d                   	pop    %ebp
 440:	c3                   	ret    
 441:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 448:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 44f:	90                   	nop

00000450 <stat>:

int
stat(const char *n, struct stat *st)
{
 450:	55                   	push   %ebp
 451:	89 e5                	mov    %esp,%ebp
 453:	56                   	push   %esi
 454:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 455:	83 ec 08             	sub    $0x8,%esp
 458:	6a 00                	push   $0x0
 45a:	ff 75 08             	push   0x8(%ebp)
 45d:	e8 f1 00 00 00       	call   553 <open>
  if(fd < 0)
 462:	83 c4 10             	add    $0x10,%esp
 465:	85 c0                	test   %eax,%eax
 467:	78 27                	js     490 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 469:	83 ec 08             	sub    $0x8,%esp
 46c:	ff 75 0c             	push   0xc(%ebp)
 46f:	89 c3                	mov    %eax,%ebx
 471:	50                   	push   %eax
 472:	e8 f4 00 00 00       	call   56b <fstat>
  close(fd);
 477:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 47a:	89 c6                	mov    %eax,%esi
  close(fd);
 47c:	e8 ba 00 00 00       	call   53b <close>
  return r;
 481:	83 c4 10             	add    $0x10,%esp
}
 484:	8d 65 f8             	lea    -0x8(%ebp),%esp
 487:	89 f0                	mov    %esi,%eax
 489:	5b                   	pop    %ebx
 48a:	5e                   	pop    %esi
 48b:	5d                   	pop    %ebp
 48c:	c3                   	ret    
 48d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 490:	be ff ff ff ff       	mov    $0xffffffff,%esi
 495:	eb ed                	jmp    484 <stat+0x34>
 497:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 49e:	66 90                	xchg   %ax,%ax

000004a0 <atoi>:

int
atoi(const char *s)
{
 4a0:	55                   	push   %ebp
 4a1:	89 e5                	mov    %esp,%ebp
 4a3:	53                   	push   %ebx
 4a4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 4a7:	0f be 02             	movsbl (%edx),%eax
 4aa:	8d 48 d0             	lea    -0x30(%eax),%ecx
 4ad:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 4b0:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 4b5:	77 1e                	ja     4d5 <atoi+0x35>
 4b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4be:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 4c0:	83 c2 01             	add    $0x1,%edx
 4c3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 4c6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 4ca:	0f be 02             	movsbl (%edx),%eax
 4cd:	8d 58 d0             	lea    -0x30(%eax),%ebx
 4d0:	80 fb 09             	cmp    $0x9,%bl
 4d3:	76 eb                	jbe    4c0 <atoi+0x20>
  return n;
}
 4d5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4d8:	89 c8                	mov    %ecx,%eax
 4da:	c9                   	leave  
 4db:	c3                   	ret    
 4dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000004e0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 4e0:	55                   	push   %ebp
 4e1:	89 e5                	mov    %esp,%ebp
 4e3:	57                   	push   %edi
 4e4:	8b 45 10             	mov    0x10(%ebp),%eax
 4e7:	8b 55 08             	mov    0x8(%ebp),%edx
 4ea:	56                   	push   %esi
 4eb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 4ee:	85 c0                	test   %eax,%eax
 4f0:	7e 13                	jle    505 <memmove+0x25>
 4f2:	01 d0                	add    %edx,%eax
  dst = vdst;
 4f4:	89 d7                	mov    %edx,%edi
 4f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4fd:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 500:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 501:	39 f8                	cmp    %edi,%eax
 503:	75 fb                	jne    500 <memmove+0x20>
  return vdst;
}
 505:	5e                   	pop    %esi
 506:	89 d0                	mov    %edx,%eax
 508:	5f                   	pop    %edi
 509:	5d                   	pop    %ebp
 50a:	c3                   	ret    

0000050b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 50b:	b8 01 00 00 00       	mov    $0x1,%eax
 510:	cd 40                	int    $0x40
 512:	c3                   	ret    

00000513 <exit>:
SYSCALL(exit)
 513:	b8 02 00 00 00       	mov    $0x2,%eax
 518:	cd 40                	int    $0x40
 51a:	c3                   	ret    

0000051b <wait>:
SYSCALL(wait)
 51b:	b8 03 00 00 00       	mov    $0x3,%eax
 520:	cd 40                	int    $0x40
 522:	c3                   	ret    

00000523 <pipe>:
SYSCALL(pipe)
 523:	b8 04 00 00 00       	mov    $0x4,%eax
 528:	cd 40                	int    $0x40
 52a:	c3                   	ret    

0000052b <read>:
SYSCALL(read)
 52b:	b8 05 00 00 00       	mov    $0x5,%eax
 530:	cd 40                	int    $0x40
 532:	c3                   	ret    

00000533 <write>:
SYSCALL(write)
 533:	b8 10 00 00 00       	mov    $0x10,%eax
 538:	cd 40                	int    $0x40
 53a:	c3                   	ret    

0000053b <close>:
SYSCALL(close)
 53b:	b8 15 00 00 00       	mov    $0x15,%eax
 540:	cd 40                	int    $0x40
 542:	c3                   	ret    

00000543 <kill>:
SYSCALL(kill)
 543:	b8 06 00 00 00       	mov    $0x6,%eax
 548:	cd 40                	int    $0x40
 54a:	c3                   	ret    

0000054b <exec>:
SYSCALL(exec)
 54b:	b8 07 00 00 00       	mov    $0x7,%eax
 550:	cd 40                	int    $0x40
 552:	c3                   	ret    

00000553 <open>:
SYSCALL(open)
 553:	b8 0f 00 00 00       	mov    $0xf,%eax
 558:	cd 40                	int    $0x40
 55a:	c3                   	ret    

0000055b <mknod>:
SYSCALL(mknod)
 55b:	b8 11 00 00 00       	mov    $0x11,%eax
 560:	cd 40                	int    $0x40
 562:	c3                   	ret    

00000563 <unlink>:
SYSCALL(unlink)
 563:	b8 12 00 00 00       	mov    $0x12,%eax
 568:	cd 40                	int    $0x40
 56a:	c3                   	ret    

0000056b <fstat>:
SYSCALL(fstat)
 56b:	b8 08 00 00 00       	mov    $0x8,%eax
 570:	cd 40                	int    $0x40
 572:	c3                   	ret    

00000573 <link>:
SYSCALL(link)
 573:	b8 13 00 00 00       	mov    $0x13,%eax
 578:	cd 40                	int    $0x40
 57a:	c3                   	ret    

0000057b <mkdir>:
SYSCALL(mkdir)
 57b:	b8 14 00 00 00       	mov    $0x14,%eax
 580:	cd 40                	int    $0x40
 582:	c3                   	ret    

00000583 <chdir>:
SYSCALL(chdir)
 583:	b8 09 00 00 00       	mov    $0x9,%eax
 588:	cd 40                	int    $0x40
 58a:	c3                   	ret    

0000058b <dup>:
SYSCALL(dup)
 58b:	b8 0a 00 00 00       	mov    $0xa,%eax
 590:	cd 40                	int    $0x40
 592:	c3                   	ret    

00000593 <getpid>:
SYSCALL(getpid)
 593:	b8 0b 00 00 00       	mov    $0xb,%eax
 598:	cd 40                	int    $0x40
 59a:	c3                   	ret    

0000059b <sbrk>:
SYSCALL(sbrk)
 59b:	b8 0c 00 00 00       	mov    $0xc,%eax
 5a0:	cd 40                	int    $0x40
 5a2:	c3                   	ret    

000005a3 <sleep>:
SYSCALL(sleep)
 5a3:	b8 0d 00 00 00       	mov    $0xd,%eax
 5a8:	cd 40                	int    $0x40
 5aa:	c3                   	ret    

000005ab <uptime>:
SYSCALL(uptime)
 5ab:	b8 0e 00 00 00       	mov    $0xe,%eax
 5b0:	cd 40                	int    $0x40
 5b2:	c3                   	ret    

000005b3 <clone>:
SYSCALL(clone)
 5b3:	b8 16 00 00 00       	mov    $0x16,%eax
 5b8:	cd 40                	int    $0x40
 5ba:	c3                   	ret    

000005bb <join>:
 5bb:	b8 17 00 00 00       	mov    $0x17,%eax
 5c0:	cd 40                	int    $0x40
 5c2:	c3                   	ret    
 5c3:	66 90                	xchg   %ax,%ax
 5c5:	66 90                	xchg   %ax,%ax
 5c7:	66 90                	xchg   %ax,%ax
 5c9:	66 90                	xchg   %ax,%ax
 5cb:	66 90                	xchg   %ax,%ax
 5cd:	66 90                	xchg   %ax,%ax
 5cf:	90                   	nop

000005d0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 5d0:	55                   	push   %ebp
 5d1:	89 e5                	mov    %esp,%ebp
 5d3:	57                   	push   %edi
 5d4:	56                   	push   %esi
 5d5:	53                   	push   %ebx
 5d6:	83 ec 3c             	sub    $0x3c,%esp
 5d9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 5dc:	89 d1                	mov    %edx,%ecx
{
 5de:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 5e1:	85 d2                	test   %edx,%edx
 5e3:	0f 89 7f 00 00 00    	jns    668 <printint+0x98>
 5e9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 5ed:	74 79                	je     668 <printint+0x98>
    neg = 1;
 5ef:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 5f6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 5f8:	31 db                	xor    %ebx,%ebx
 5fa:	8d 75 d7             	lea    -0x29(%ebp),%esi
 5fd:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 600:	89 c8                	mov    %ecx,%eax
 602:	31 d2                	xor    %edx,%edx
 604:	89 cf                	mov    %ecx,%edi
 606:	f7 75 c4             	divl   -0x3c(%ebp)
 609:	0f b6 92 b0 0a 00 00 	movzbl 0xab0(%edx),%edx
 610:	89 45 c0             	mov    %eax,-0x40(%ebp)
 613:	89 d8                	mov    %ebx,%eax
 615:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 618:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 61b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 61e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 621:	76 dd                	jbe    600 <printint+0x30>
  if(neg)
 623:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 626:	85 c9                	test   %ecx,%ecx
 628:	74 0c                	je     636 <printint+0x66>
    buf[i++] = '-';
 62a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 62f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 631:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 636:	8b 7d b8             	mov    -0x48(%ebp),%edi
 639:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 63d:	eb 07                	jmp    646 <printint+0x76>
 63f:	90                   	nop
    putc(fd, buf[i]);
 640:	0f b6 13             	movzbl (%ebx),%edx
 643:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 646:	83 ec 04             	sub    $0x4,%esp
 649:	88 55 d7             	mov    %dl,-0x29(%ebp)
 64c:	6a 01                	push   $0x1
 64e:	56                   	push   %esi
 64f:	57                   	push   %edi
 650:	e8 de fe ff ff       	call   533 <write>
  while(--i >= 0)
 655:	83 c4 10             	add    $0x10,%esp
 658:	39 de                	cmp    %ebx,%esi
 65a:	75 e4                	jne    640 <printint+0x70>
}
 65c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 65f:	5b                   	pop    %ebx
 660:	5e                   	pop    %esi
 661:	5f                   	pop    %edi
 662:	5d                   	pop    %ebp
 663:	c3                   	ret    
 664:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 668:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 66f:	eb 87                	jmp    5f8 <printint+0x28>
 671:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 678:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 67f:	90                   	nop

00000680 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 680:	55                   	push   %ebp
 681:	89 e5                	mov    %esp,%ebp
 683:	57                   	push   %edi
 684:	56                   	push   %esi
 685:	53                   	push   %ebx
 686:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 689:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 68c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 68f:	0f b6 13             	movzbl (%ebx),%edx
 692:	84 d2                	test   %dl,%dl
 694:	74 6a                	je     700 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 696:	8d 45 10             	lea    0x10(%ebp),%eax
 699:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 69c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 69f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 6a1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 6a4:	eb 36                	jmp    6dc <printf+0x5c>
 6a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6ad:	8d 76 00             	lea    0x0(%esi),%esi
 6b0:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 6b3:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 6b8:	83 f8 25             	cmp    $0x25,%eax
 6bb:	74 15                	je     6d2 <printf+0x52>
  write(fd, &c, 1);
 6bd:	83 ec 04             	sub    $0x4,%esp
 6c0:	88 55 e7             	mov    %dl,-0x19(%ebp)
 6c3:	6a 01                	push   $0x1
 6c5:	57                   	push   %edi
 6c6:	56                   	push   %esi
 6c7:	e8 67 fe ff ff       	call   533 <write>
 6cc:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 6cf:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 6d2:	0f b6 13             	movzbl (%ebx),%edx
 6d5:	83 c3 01             	add    $0x1,%ebx
 6d8:	84 d2                	test   %dl,%dl
 6da:	74 24                	je     700 <printf+0x80>
    c = fmt[i] & 0xff;
 6dc:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 6df:	85 c9                	test   %ecx,%ecx
 6e1:	74 cd                	je     6b0 <printf+0x30>
      }
    } else if(state == '%'){
 6e3:	83 f9 25             	cmp    $0x25,%ecx
 6e6:	75 ea                	jne    6d2 <printf+0x52>
      if(c == 'd'){
 6e8:	83 f8 25             	cmp    $0x25,%eax
 6eb:	0f 84 07 01 00 00    	je     7f8 <printf+0x178>
 6f1:	83 e8 63             	sub    $0x63,%eax
 6f4:	83 f8 15             	cmp    $0x15,%eax
 6f7:	77 17                	ja     710 <printf+0x90>
 6f9:	ff 24 85 58 0a 00 00 	jmp    *0xa58(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 700:	8d 65 f4             	lea    -0xc(%ebp),%esp
 703:	5b                   	pop    %ebx
 704:	5e                   	pop    %esi
 705:	5f                   	pop    %edi
 706:	5d                   	pop    %ebp
 707:	c3                   	ret    
 708:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 70f:	90                   	nop
  write(fd, &c, 1);
 710:	83 ec 04             	sub    $0x4,%esp
 713:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 716:	6a 01                	push   $0x1
 718:	57                   	push   %edi
 719:	56                   	push   %esi
 71a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 71e:	e8 10 fe ff ff       	call   533 <write>
        putc(fd, c);
 723:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 727:	83 c4 0c             	add    $0xc,%esp
 72a:	88 55 e7             	mov    %dl,-0x19(%ebp)
 72d:	6a 01                	push   $0x1
 72f:	57                   	push   %edi
 730:	56                   	push   %esi
 731:	e8 fd fd ff ff       	call   533 <write>
        putc(fd, c);
 736:	83 c4 10             	add    $0x10,%esp
      state = 0;
 739:	31 c9                	xor    %ecx,%ecx
 73b:	eb 95                	jmp    6d2 <printf+0x52>
 73d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 740:	83 ec 0c             	sub    $0xc,%esp
 743:	b9 10 00 00 00       	mov    $0x10,%ecx
 748:	6a 00                	push   $0x0
 74a:	8b 45 d0             	mov    -0x30(%ebp),%eax
 74d:	8b 10                	mov    (%eax),%edx
 74f:	89 f0                	mov    %esi,%eax
 751:	e8 7a fe ff ff       	call   5d0 <printint>
        ap++;
 756:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 75a:	83 c4 10             	add    $0x10,%esp
      state = 0;
 75d:	31 c9                	xor    %ecx,%ecx
 75f:	e9 6e ff ff ff       	jmp    6d2 <printf+0x52>
 764:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 768:	8b 45 d0             	mov    -0x30(%ebp),%eax
 76b:	8b 10                	mov    (%eax),%edx
        ap++;
 76d:	83 c0 04             	add    $0x4,%eax
 770:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 773:	85 d2                	test   %edx,%edx
 775:	0f 84 8d 00 00 00    	je     808 <printf+0x188>
        while(*s != 0){
 77b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 77e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 780:	84 c0                	test   %al,%al
 782:	0f 84 4a ff ff ff    	je     6d2 <printf+0x52>
 788:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 78b:	89 d3                	mov    %edx,%ebx
 78d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 790:	83 ec 04             	sub    $0x4,%esp
          s++;
 793:	83 c3 01             	add    $0x1,%ebx
 796:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 799:	6a 01                	push   $0x1
 79b:	57                   	push   %edi
 79c:	56                   	push   %esi
 79d:	e8 91 fd ff ff       	call   533 <write>
        while(*s != 0){
 7a2:	0f b6 03             	movzbl (%ebx),%eax
 7a5:	83 c4 10             	add    $0x10,%esp
 7a8:	84 c0                	test   %al,%al
 7aa:	75 e4                	jne    790 <printf+0x110>
      state = 0;
 7ac:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 7af:	31 c9                	xor    %ecx,%ecx
 7b1:	e9 1c ff ff ff       	jmp    6d2 <printf+0x52>
 7b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7bd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 7c0:	83 ec 0c             	sub    $0xc,%esp
 7c3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 7c8:	6a 01                	push   $0x1
 7ca:	e9 7b ff ff ff       	jmp    74a <printf+0xca>
 7cf:	90                   	nop
        putc(fd, *ap);
 7d0:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 7d3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 7d6:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 7d8:	6a 01                	push   $0x1
 7da:	57                   	push   %edi
 7db:	56                   	push   %esi
        putc(fd, *ap);
 7dc:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 7df:	e8 4f fd ff ff       	call   533 <write>
        ap++;
 7e4:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 7e8:	83 c4 10             	add    $0x10,%esp
      state = 0;
 7eb:	31 c9                	xor    %ecx,%ecx
 7ed:	e9 e0 fe ff ff       	jmp    6d2 <printf+0x52>
 7f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 7f8:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 7fb:	83 ec 04             	sub    $0x4,%esp
 7fe:	e9 2a ff ff ff       	jmp    72d <printf+0xad>
 803:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 807:	90                   	nop
          s = "(null)";
 808:	ba 4f 0a 00 00       	mov    $0xa4f,%edx
        while(*s != 0){
 80d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 810:	b8 28 00 00 00       	mov    $0x28,%eax
 815:	89 d3                	mov    %edx,%ebx
 817:	e9 74 ff ff ff       	jmp    790 <printf+0x110>
 81c:	66 90                	xchg   %ax,%ax
 81e:	66 90                	xchg   %ax,%ax

00000820 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 820:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 821:	a1 50 0e 00 00       	mov    0xe50,%eax
{
 826:	89 e5                	mov    %esp,%ebp
 828:	57                   	push   %edi
 829:	56                   	push   %esi
 82a:	53                   	push   %ebx
 82b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 82e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 831:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 838:	89 c2                	mov    %eax,%edx
 83a:	8b 00                	mov    (%eax),%eax
 83c:	39 ca                	cmp    %ecx,%edx
 83e:	73 30                	jae    870 <free+0x50>
 840:	39 c1                	cmp    %eax,%ecx
 842:	72 04                	jb     848 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 844:	39 c2                	cmp    %eax,%edx
 846:	72 f0                	jb     838 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 848:	8b 73 fc             	mov    -0x4(%ebx),%esi
 84b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 84e:	39 f8                	cmp    %edi,%eax
 850:	74 30                	je     882 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 852:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 855:	8b 42 04             	mov    0x4(%edx),%eax
 858:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 85b:	39 f1                	cmp    %esi,%ecx
 85d:	74 3a                	je     899 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 85f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 861:	5b                   	pop    %ebx
  freep = p;
 862:	89 15 50 0e 00 00    	mov    %edx,0xe50
}
 868:	5e                   	pop    %esi
 869:	5f                   	pop    %edi
 86a:	5d                   	pop    %ebp
 86b:	c3                   	ret    
 86c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 870:	39 c2                	cmp    %eax,%edx
 872:	72 c4                	jb     838 <free+0x18>
 874:	39 c1                	cmp    %eax,%ecx
 876:	73 c0                	jae    838 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 878:	8b 73 fc             	mov    -0x4(%ebx),%esi
 87b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 87e:	39 f8                	cmp    %edi,%eax
 880:	75 d0                	jne    852 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 882:	03 70 04             	add    0x4(%eax),%esi
 885:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 888:	8b 02                	mov    (%edx),%eax
 88a:	8b 00                	mov    (%eax),%eax
 88c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 88f:	8b 42 04             	mov    0x4(%edx),%eax
 892:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 895:	39 f1                	cmp    %esi,%ecx
 897:	75 c6                	jne    85f <free+0x3f>
    p->s.size += bp->s.size;
 899:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 89c:	89 15 50 0e 00 00    	mov    %edx,0xe50
    p->s.size += bp->s.size;
 8a2:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 8a5:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 8a8:	89 0a                	mov    %ecx,(%edx)
}
 8aa:	5b                   	pop    %ebx
 8ab:	5e                   	pop    %esi
 8ac:	5f                   	pop    %edi
 8ad:	5d                   	pop    %ebp
 8ae:	c3                   	ret    
 8af:	90                   	nop

000008b0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 8b0:	55                   	push   %ebp
 8b1:	89 e5                	mov    %esp,%ebp
 8b3:	57                   	push   %edi
 8b4:	56                   	push   %esi
 8b5:	53                   	push   %ebx
 8b6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8b9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 8bc:	8b 3d 50 0e 00 00    	mov    0xe50,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8c2:	8d 70 07             	lea    0x7(%eax),%esi
 8c5:	c1 ee 03             	shr    $0x3,%esi
 8c8:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 8cb:	85 ff                	test   %edi,%edi
 8cd:	0f 84 9d 00 00 00    	je     970 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8d3:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 8d5:	8b 4a 04             	mov    0x4(%edx),%ecx
 8d8:	39 f1                	cmp    %esi,%ecx
 8da:	73 6a                	jae    946 <malloc+0x96>
 8dc:	bb 00 10 00 00       	mov    $0x1000,%ebx
 8e1:	39 de                	cmp    %ebx,%esi
 8e3:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 8e6:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 8ed:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 8f0:	eb 17                	jmp    909 <malloc+0x59>
 8f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8f8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 8fa:	8b 48 04             	mov    0x4(%eax),%ecx
 8fd:	39 f1                	cmp    %esi,%ecx
 8ff:	73 4f                	jae    950 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 901:	8b 3d 50 0e 00 00    	mov    0xe50,%edi
 907:	89 c2                	mov    %eax,%edx
 909:	39 d7                	cmp    %edx,%edi
 90b:	75 eb                	jne    8f8 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 90d:	83 ec 0c             	sub    $0xc,%esp
 910:	ff 75 e4             	push   -0x1c(%ebp)
 913:	e8 83 fc ff ff       	call   59b <sbrk>
  if(p == (char*)-1)
 918:	83 c4 10             	add    $0x10,%esp
 91b:	83 f8 ff             	cmp    $0xffffffff,%eax
 91e:	74 1c                	je     93c <malloc+0x8c>
  hp->s.size = nu;
 920:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 923:	83 ec 0c             	sub    $0xc,%esp
 926:	83 c0 08             	add    $0x8,%eax
 929:	50                   	push   %eax
 92a:	e8 f1 fe ff ff       	call   820 <free>
  return freep;
 92f:	8b 15 50 0e 00 00    	mov    0xe50,%edx
      if((p = morecore(nunits)) == 0)
 935:	83 c4 10             	add    $0x10,%esp
 938:	85 d2                	test   %edx,%edx
 93a:	75 bc                	jne    8f8 <malloc+0x48>
        return 0;
  }
}
 93c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 93f:	31 c0                	xor    %eax,%eax
}
 941:	5b                   	pop    %ebx
 942:	5e                   	pop    %esi
 943:	5f                   	pop    %edi
 944:	5d                   	pop    %ebp
 945:	c3                   	ret    
    if(p->s.size >= nunits){
 946:	89 d0                	mov    %edx,%eax
 948:	89 fa                	mov    %edi,%edx
 94a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 950:	39 ce                	cmp    %ecx,%esi
 952:	74 4c                	je     9a0 <malloc+0xf0>
        p->s.size -= nunits;
 954:	29 f1                	sub    %esi,%ecx
 956:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 959:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 95c:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 95f:	89 15 50 0e 00 00    	mov    %edx,0xe50
}
 965:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 968:	83 c0 08             	add    $0x8,%eax
}
 96b:	5b                   	pop    %ebx
 96c:	5e                   	pop    %esi
 96d:	5f                   	pop    %edi
 96e:	5d                   	pop    %ebp
 96f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 970:	c7 05 50 0e 00 00 54 	movl   $0xe54,0xe50
 977:	0e 00 00 
    base.s.size = 0;
 97a:	bf 54 0e 00 00       	mov    $0xe54,%edi
    base.s.ptr = freep = prevp = &base;
 97f:	c7 05 54 0e 00 00 54 	movl   $0xe54,0xe54
 986:	0e 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 989:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 98b:	c7 05 58 0e 00 00 00 	movl   $0x0,0xe58
 992:	00 00 00 
    if(p->s.size >= nunits){
 995:	e9 42 ff ff ff       	jmp    8dc <malloc+0x2c>
 99a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 9a0:	8b 08                	mov    (%eax),%ecx
 9a2:	89 0a                	mov    %ecx,(%edx)
 9a4:	eb b9                	jmp    95f <malloc+0xaf>
