
_test_15:     file format elf32-i386


Disassembly of section .text:

00000000 <worker>:
   printf(1, "TEST PASSED\n");
   exit();
}

void
worker(void *arg1, void *arg2) {
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	53                   	push   %ebx
   4:	83 ec 04             	sub    $0x4,%esp
   int i, j, tmp;
   for (i = 0; i < loops; i++) {
   7:	bb 00 00 00 00       	mov    $0x0,%ebx
   c:	eb 23                	jmp    31 <worker+0x31>
      lock_acquire(&lock);
      tmp = global;
      for(j = 0; j < 50; j++); // take some time
   e:	83 c0 01             	add    $0x1,%eax
  11:	83 f8 31             	cmp    $0x31,%eax
  14:	7e f8                	jle    e <worker+0xe>
      global = tmp + 1;
  16:	8d 42 01             	lea    0x1(%edx),%eax
  19:	a3 54 0c 00 00       	mov    %eax,0xc54
      lock_release(&lock);
  1e:	83 ec 0c             	sub    $0xc,%esp
  21:	68 50 0c 00 00       	push   $0xc50
  26:	e8 08 02 00 00       	call   233 <lock_release>
   for (i = 0; i < loops; i++) {
  2b:	83 c3 01             	add    $0x1,%ebx
  2e:	83 c4 10             	add    $0x10,%esp
  31:	39 1d 48 0c 00 00    	cmp    %ebx,0xc48
  37:	7e 1d                	jle    56 <worker+0x56>
      lock_acquire(&lock);
  39:	83 ec 0c             	sub    $0xc,%esp
  3c:	68 50 0c 00 00       	push   $0xc50
  41:	e8 cb 01 00 00       	call   211 <lock_acquire>
      tmp = global;
  46:	8b 15 54 0c 00 00    	mov    0xc54,%edx
      for(j = 0; j < 50; j++); // take some time
  4c:	83 c4 10             	add    $0x10,%esp
  4f:	b8 00 00 00 00       	mov    $0x0,%eax
  54:	eb bb                	jmp    11 <worker+0x11>
   }
   exit();
  56:	e8 93 03 00 00       	call   3ee <exit>

0000005b <main>:
{
  5b:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  5f:	83 e4 f0             	and    $0xfffffff0,%esp
  62:	ff 71 fc             	push   -0x4(%ecx)
  65:	55                   	push   %ebp
  66:	89 e5                	mov    %esp,%ebp
  68:	53                   	push   %ebx
  69:	51                   	push   %ecx
   ppid = getpid();
  6a:	e8 ff 03 00 00       	call   46e <getpid>
  6f:	a3 58 0c 00 00       	mov    %eax,0xc58
   lock_init(&lock);
  74:	83 ec 0c             	sub    $0xc,%esp
  77:	68 50 0c 00 00       	push   $0xc50
  7c:	e8 c0 01 00 00       	call   241 <lock_init>
   for (i = 0; i < num_threads; i++) {
  81:	83 c4 10             	add    $0x10,%esp
  84:	bb 00 00 00 00       	mov    $0x0,%ebx
  89:	eb 03                	jmp    8e <main+0x33>
  8b:	83 c3 01             	add    $0x1,%ebx
  8e:	39 1d 4c 0c 00 00    	cmp    %ebx,0xc4c
  94:	7e 61                	jle    f7 <main+0x9c>
      int thread_pid = thread_create(worker, 0, 0);
  96:	83 ec 04             	sub    $0x4,%esp
  99:	6a 00                	push   $0x0
  9b:	6a 00                	push   $0x0
  9d:	68 00 00 00 00       	push   $0x0
  a2:	e8 32 01 00 00       	call   1d9 <thread_create>
      assert(thread_pid > 0);
  a7:	83 c4 10             	add    $0x10,%esp
  aa:	85 c0                	test   %eax,%eax
  ac:	7f dd                	jg     8b <main+0x30>
  ae:	6a 25                	push   $0x25
  b0:	68 f0 07 00 00       	push   $0x7f0
  b5:	68 fa 07 00 00       	push   $0x7fa
  ba:	6a 01                	push   $0x1
  bc:	e8 82 04 00 00       	call   543 <printf>
  c1:	83 c4 0c             	add    $0xc,%esp
  c4:	68 02 08 00 00       	push   $0x802
  c9:	68 11 08 00 00       	push   $0x811
  ce:	6a 01                	push   $0x1
  d0:	e8 6e 04 00 00       	call   543 <printf>
  d5:	83 c4 08             	add    $0x8,%esp
  d8:	68 25 08 00 00       	push   $0x825
  dd:	6a 01                	push   $0x1
  df:	e8 5f 04 00 00       	call   543 <printf>
  e4:	83 c4 04             	add    $0x4,%esp
  e7:	ff 35 58 0c 00 00    	push   0xc58
  ed:	e8 2c 03 00 00       	call   41e <kill>
  f2:	e8 f7 02 00 00       	call   3ee <exit>
   for (i = 0; i < num_threads; i++) {
  f7:	bb 00 00 00 00       	mov    $0x0,%ebx
  fc:	a1 4c 0c 00 00       	mov    0xc4c,%eax
 101:	39 d8                	cmp    %ebx,%eax
 103:	7e 57                	jle    15c <main+0x101>
      int join_pid = thread_join();
 105:	e8 01 01 00 00       	call   20b <thread_join>
      assert(join_pid > 0);
 10a:	85 c0                	test   %eax,%eax
 10c:	7e 05                	jle    113 <main+0xb8>
   for (i = 0; i < num_threads; i++) {
 10e:	83 c3 01             	add    $0x1,%ebx
 111:	eb e9                	jmp    fc <main+0xa1>
      assert(join_pid > 0);
 113:	6a 2a                	push   $0x2a
 115:	68 f0 07 00 00       	push   $0x7f0
 11a:	68 fa 07 00 00       	push   $0x7fa
 11f:	6a 01                	push   $0x1
 121:	e8 1d 04 00 00       	call   543 <printf>
 126:	83 c4 0c             	add    $0xc,%esp
 129:	68 32 08 00 00       	push   $0x832
 12e:	68 11 08 00 00       	push   $0x811
 133:	6a 01                	push   $0x1
 135:	e8 09 04 00 00       	call   543 <printf>
 13a:	83 c4 08             	add    $0x8,%esp
 13d:	68 25 08 00 00       	push   $0x825
 142:	6a 01                	push   $0x1
 144:	e8 fa 03 00 00       	call   543 <printf>
 149:	83 c4 04             	add    $0x4,%esp
 14c:	ff 35 58 0c 00 00    	push   0xc58
 152:	e8 c7 02 00 00       	call   41e <kill>
 157:	e8 92 02 00 00       	call   3ee <exit>
   assert(global == num_threads * loops);
 15c:	0f af 05 48 0c 00 00 	imul   0xc48,%eax
 163:	3b 05 54 0c 00 00    	cmp    0xc54,%eax
 169:	74 49                	je     1b4 <main+0x159>
 16b:	6a 2d                	push   $0x2d
 16d:	68 f0 07 00 00       	push   $0x7f0
 172:	68 fa 07 00 00       	push   $0x7fa
 177:	6a 01                	push   $0x1
 179:	e8 c5 03 00 00       	call   543 <printf>
 17e:	83 c4 0c             	add    $0xc,%esp
 181:	68 3f 08 00 00       	push   $0x83f
 186:	68 11 08 00 00       	push   $0x811
 18b:	6a 01                	push   $0x1
 18d:	e8 b1 03 00 00       	call   543 <printf>
 192:	83 c4 08             	add    $0x8,%esp
 195:	68 25 08 00 00       	push   $0x825
 19a:	6a 01                	push   $0x1
 19c:	e8 a2 03 00 00       	call   543 <printf>
 1a1:	83 c4 04             	add    $0x4,%esp
 1a4:	ff 35 58 0c 00 00    	push   0xc58
 1aa:	e8 6f 02 00 00       	call   41e <kill>
 1af:	e8 3a 02 00 00       	call   3ee <exit>
   printf(1, "TEST PASSED\n");
 1b4:	83 ec 08             	sub    $0x8,%esp
 1b7:	68 5d 08 00 00       	push   $0x85d
 1bc:	6a 01                	push   $0x1
 1be:	e8 80 03 00 00       	call   543 <printf>
   exit();
 1c3:	e8 26 02 00 00       	call   3ee <exit>

000001c8 <test_and_set>:
#include "fcntl.h"
#include "user.h"
#include "x86.h"
#include "mmu.h"

int test_and_set(int *old_ptr, int new_ptr) {
 1c8:	55                   	push   %ebp
 1c9:	89 e5                	mov    %esp,%ebp
 1cb:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *old_ptr;
 1ce:	8b 10                	mov    (%eax),%edx
  *old_ptr = new_ptr;
 1d0:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 1d3:	89 08                	mov    %ecx,(%eax)
  return old;
}
 1d5:	89 d0                	mov    %edx,%eax
 1d7:	5d                   	pop    %ebp
 1d8:	c3                   	ret    

000001d9 <thread_create>:

// a wrapper func for clone
int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 1d9:	55                   	push   %ebp
 1da:	89 e5                	mov    %esp,%ebp
 1dc:	83 ec 14             	sub    $0x14,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE);
 1df:	68 00 10 00 00       	push   $0x1000
 1e4:	e8 80 05 00 00       	call   769 <malloc>
  if(n_stack == 0){
 1e9:	83 c4 10             	add    $0x10,%esp
 1ec:	85 c0                	test   %eax,%eax
 1ee:	74 14                	je     204 <thread_create+0x2b>
    return -1;
  }
  int new_pid = clone(start_routine, arg1, arg2, n_stack); // TODO: is this the right way to call it?
 1f0:	50                   	push   %eax
 1f1:	ff 75 10             	push   0x10(%ebp)
 1f4:	ff 75 0c             	push   0xc(%ebp)
 1f7:	ff 75 08             	push   0x8(%ebp)
 1fa:	e8 8f 02 00 00       	call   48e <clone>


  // I can't remember if there was something else to do here but I'm sure I'll find out


  return new_pid;
 1ff:	83 c4 10             	add    $0x10,%esp
}
 202:	c9                   	leave  
 203:	c3                   	ret    
    return -1;
 204:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 209:	eb f7                	jmp    202 <thread_create+0x29>

0000020b <thread_join>:

int thread_join() {
  return 0;
}
 20b:	b8 00 00 00 00       	mov    $0x0,%eax
 210:	c3                   	ret    

00000211 <lock_acquire>:

void lock_acquire(lock_t *lock){
 211:	55                   	push   %ebp
 212:	89 e5                	mov    %esp,%ebp
 214:	53                   	push   %ebx
 215:	83 ec 04             	sub    $0x4,%esp
 218:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 21b:	83 ec 08             	sub    $0x8,%esp
 21e:	6a 01                	push   $0x1
 220:	53                   	push   %ebx
 221:	e8 a2 ff ff ff       	call   1c8 <test_and_set>
 226:	83 c4 10             	add    $0x10,%esp
 229:	83 f8 01             	cmp    $0x1,%eax
 22c:	74 ed                	je     21b <lock_acquire+0xa>
    ;
}
 22e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 231:	c9                   	leave  
 232:	c3                   	ret    

00000233 <lock_release>:

void lock_release(lock_t *lock) {
 233:	55                   	push   %ebp
 234:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 236:	8b 45 08             	mov    0x8(%ebp),%eax
 239:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 23f:	5d                   	pop    %ebp
 240:	c3                   	ret    

00000241 <lock_init>:

void lock_init(lock_t *lock) {
 241:	55                   	push   %ebp
 242:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 244:	8b 45 08             	mov    0x8(%ebp),%eax
 247:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 24d:	5d                   	pop    %ebp
 24e:	c3                   	ret    

0000024f <strcpy>:

char*
strcpy(char *s, const char *t)
{
 24f:	55                   	push   %ebp
 250:	89 e5                	mov    %esp,%ebp
 252:	56                   	push   %esi
 253:	53                   	push   %ebx
 254:	8b 75 08             	mov    0x8(%ebp),%esi
 257:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 25a:	89 f0                	mov    %esi,%eax
 25c:	89 d1                	mov    %edx,%ecx
 25e:	83 c2 01             	add    $0x1,%edx
 261:	89 c3                	mov    %eax,%ebx
 263:	83 c0 01             	add    $0x1,%eax
 266:	0f b6 09             	movzbl (%ecx),%ecx
 269:	88 0b                	mov    %cl,(%ebx)
 26b:	84 c9                	test   %cl,%cl
 26d:	75 ed                	jne    25c <strcpy+0xd>
    ;
  return os;
}
 26f:	89 f0                	mov    %esi,%eax
 271:	5b                   	pop    %ebx
 272:	5e                   	pop    %esi
 273:	5d                   	pop    %ebp
 274:	c3                   	ret    

00000275 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 275:	55                   	push   %ebp
 276:	89 e5                	mov    %esp,%ebp
 278:	8b 4d 08             	mov    0x8(%ebp),%ecx
 27b:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 27e:	eb 06                	jmp    286 <strcmp+0x11>
    p++, q++;
 280:	83 c1 01             	add    $0x1,%ecx
 283:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 286:	0f b6 01             	movzbl (%ecx),%eax
 289:	84 c0                	test   %al,%al
 28b:	74 04                	je     291 <strcmp+0x1c>
 28d:	3a 02                	cmp    (%edx),%al
 28f:	74 ef                	je     280 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 291:	0f b6 c0             	movzbl %al,%eax
 294:	0f b6 12             	movzbl (%edx),%edx
 297:	29 d0                	sub    %edx,%eax
}
 299:	5d                   	pop    %ebp
 29a:	c3                   	ret    

0000029b <strlen>:

uint
strlen(const char *s)
{
 29b:	55                   	push   %ebp
 29c:	89 e5                	mov    %esp,%ebp
 29e:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 2a1:	b8 00 00 00 00       	mov    $0x0,%eax
 2a6:	eb 03                	jmp    2ab <strlen+0x10>
 2a8:	83 c0 01             	add    $0x1,%eax
 2ab:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 2af:	75 f7                	jne    2a8 <strlen+0xd>
    ;
  return n;
}
 2b1:	5d                   	pop    %ebp
 2b2:	c3                   	ret    

000002b3 <memset>:

void*
memset(void *dst, int c, uint n)
{
 2b3:	55                   	push   %ebp
 2b4:	89 e5                	mov    %esp,%ebp
 2b6:	57                   	push   %edi
 2b7:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 2ba:	89 d7                	mov    %edx,%edi
 2bc:	8b 4d 10             	mov    0x10(%ebp),%ecx
 2bf:	8b 45 0c             	mov    0xc(%ebp),%eax
 2c2:	fc                   	cld    
 2c3:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 2c5:	89 d0                	mov    %edx,%eax
 2c7:	8b 7d fc             	mov    -0x4(%ebp),%edi
 2ca:	c9                   	leave  
 2cb:	c3                   	ret    

000002cc <strchr>:

char*
strchr(const char *s, char c)
{
 2cc:	55                   	push   %ebp
 2cd:	89 e5                	mov    %esp,%ebp
 2cf:	8b 45 08             	mov    0x8(%ebp),%eax
 2d2:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 2d6:	eb 03                	jmp    2db <strchr+0xf>
 2d8:	83 c0 01             	add    $0x1,%eax
 2db:	0f b6 10             	movzbl (%eax),%edx
 2de:	84 d2                	test   %dl,%dl
 2e0:	74 06                	je     2e8 <strchr+0x1c>
    if(*s == c)
 2e2:	38 ca                	cmp    %cl,%dl
 2e4:	75 f2                	jne    2d8 <strchr+0xc>
 2e6:	eb 05                	jmp    2ed <strchr+0x21>
      return (char*)s;
  return 0;
 2e8:	b8 00 00 00 00       	mov    $0x0,%eax
}
 2ed:	5d                   	pop    %ebp
 2ee:	c3                   	ret    

000002ef <gets>:

char*
gets(char *buf, int max)
{
 2ef:	55                   	push   %ebp
 2f0:	89 e5                	mov    %esp,%ebp
 2f2:	57                   	push   %edi
 2f3:	56                   	push   %esi
 2f4:	53                   	push   %ebx
 2f5:	83 ec 1c             	sub    $0x1c,%esp
 2f8:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2fb:	bb 00 00 00 00       	mov    $0x0,%ebx
 300:	89 de                	mov    %ebx,%esi
 302:	83 c3 01             	add    $0x1,%ebx
 305:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 308:	7d 2e                	jge    338 <gets+0x49>
    cc = read(0, &c, 1);
 30a:	83 ec 04             	sub    $0x4,%esp
 30d:	6a 01                	push   $0x1
 30f:	8d 45 e7             	lea    -0x19(%ebp),%eax
 312:	50                   	push   %eax
 313:	6a 00                	push   $0x0
 315:	e8 ec 00 00 00       	call   406 <read>
    if(cc < 1)
 31a:	83 c4 10             	add    $0x10,%esp
 31d:	85 c0                	test   %eax,%eax
 31f:	7e 17                	jle    338 <gets+0x49>
      break;
    buf[i++] = c;
 321:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 325:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 328:	3c 0a                	cmp    $0xa,%al
 32a:	0f 94 c2             	sete   %dl
 32d:	3c 0d                	cmp    $0xd,%al
 32f:	0f 94 c0             	sete   %al
 332:	08 c2                	or     %al,%dl
 334:	74 ca                	je     300 <gets+0x11>
    buf[i++] = c;
 336:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 338:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 33c:	89 f8                	mov    %edi,%eax
 33e:	8d 65 f4             	lea    -0xc(%ebp),%esp
 341:	5b                   	pop    %ebx
 342:	5e                   	pop    %esi
 343:	5f                   	pop    %edi
 344:	5d                   	pop    %ebp
 345:	c3                   	ret    

00000346 <stat>:

int
stat(const char *n, struct stat *st)
{
 346:	55                   	push   %ebp
 347:	89 e5                	mov    %esp,%ebp
 349:	56                   	push   %esi
 34a:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 34b:	83 ec 08             	sub    $0x8,%esp
 34e:	6a 00                	push   $0x0
 350:	ff 75 08             	push   0x8(%ebp)
 353:	e8 d6 00 00 00       	call   42e <open>
  if(fd < 0)
 358:	83 c4 10             	add    $0x10,%esp
 35b:	85 c0                	test   %eax,%eax
 35d:	78 24                	js     383 <stat+0x3d>
 35f:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 361:	83 ec 08             	sub    $0x8,%esp
 364:	ff 75 0c             	push   0xc(%ebp)
 367:	50                   	push   %eax
 368:	e8 d9 00 00 00       	call   446 <fstat>
 36d:	89 c6                	mov    %eax,%esi
  close(fd);
 36f:	89 1c 24             	mov    %ebx,(%esp)
 372:	e8 9f 00 00 00       	call   416 <close>
  return r;
 377:	83 c4 10             	add    $0x10,%esp
}
 37a:	89 f0                	mov    %esi,%eax
 37c:	8d 65 f8             	lea    -0x8(%ebp),%esp
 37f:	5b                   	pop    %ebx
 380:	5e                   	pop    %esi
 381:	5d                   	pop    %ebp
 382:	c3                   	ret    
    return -1;
 383:	be ff ff ff ff       	mov    $0xffffffff,%esi
 388:	eb f0                	jmp    37a <stat+0x34>

0000038a <atoi>:

int
atoi(const char *s)
{
 38a:	55                   	push   %ebp
 38b:	89 e5                	mov    %esp,%ebp
 38d:	53                   	push   %ebx
 38e:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 391:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 396:	eb 10                	jmp    3a8 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 398:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 39b:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 39e:	83 c1 01             	add    $0x1,%ecx
 3a1:	0f be c0             	movsbl %al,%eax
 3a4:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 3a8:	0f b6 01             	movzbl (%ecx),%eax
 3ab:	8d 58 d0             	lea    -0x30(%eax),%ebx
 3ae:	80 fb 09             	cmp    $0x9,%bl
 3b1:	76 e5                	jbe    398 <atoi+0xe>
  return n;
}
 3b3:	89 d0                	mov    %edx,%eax
 3b5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3b8:	c9                   	leave  
 3b9:	c3                   	ret    

000003ba <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3ba:	55                   	push   %ebp
 3bb:	89 e5                	mov    %esp,%ebp
 3bd:	56                   	push   %esi
 3be:	53                   	push   %ebx
 3bf:	8b 75 08             	mov    0x8(%ebp),%esi
 3c2:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 3c5:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 3c8:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 3ca:	eb 0d                	jmp    3d9 <memmove+0x1f>
    *dst++ = *src++;
 3cc:	0f b6 01             	movzbl (%ecx),%eax
 3cf:	88 02                	mov    %al,(%edx)
 3d1:	8d 49 01             	lea    0x1(%ecx),%ecx
 3d4:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 3d7:	89 d8                	mov    %ebx,%eax
 3d9:	8d 58 ff             	lea    -0x1(%eax),%ebx
 3dc:	85 c0                	test   %eax,%eax
 3de:	7f ec                	jg     3cc <memmove+0x12>
  return vdst;
}
 3e0:	89 f0                	mov    %esi,%eax
 3e2:	5b                   	pop    %ebx
 3e3:	5e                   	pop    %esi
 3e4:	5d                   	pop    %ebp
 3e5:	c3                   	ret    

000003e6 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3e6:	b8 01 00 00 00       	mov    $0x1,%eax
 3eb:	cd 40                	int    $0x40
 3ed:	c3                   	ret    

000003ee <exit>:
SYSCALL(exit)
 3ee:	b8 02 00 00 00       	mov    $0x2,%eax
 3f3:	cd 40                	int    $0x40
 3f5:	c3                   	ret    

000003f6 <wait>:
SYSCALL(wait)
 3f6:	b8 03 00 00 00       	mov    $0x3,%eax
 3fb:	cd 40                	int    $0x40
 3fd:	c3                   	ret    

000003fe <pipe>:
SYSCALL(pipe)
 3fe:	b8 04 00 00 00       	mov    $0x4,%eax
 403:	cd 40                	int    $0x40
 405:	c3                   	ret    

00000406 <read>:
SYSCALL(read)
 406:	b8 05 00 00 00       	mov    $0x5,%eax
 40b:	cd 40                	int    $0x40
 40d:	c3                   	ret    

0000040e <write>:
SYSCALL(write)
 40e:	b8 10 00 00 00       	mov    $0x10,%eax
 413:	cd 40                	int    $0x40
 415:	c3                   	ret    

00000416 <close>:
SYSCALL(close)
 416:	b8 15 00 00 00       	mov    $0x15,%eax
 41b:	cd 40                	int    $0x40
 41d:	c3                   	ret    

0000041e <kill>:
SYSCALL(kill)
 41e:	b8 06 00 00 00       	mov    $0x6,%eax
 423:	cd 40                	int    $0x40
 425:	c3                   	ret    

00000426 <exec>:
SYSCALL(exec)
 426:	b8 07 00 00 00       	mov    $0x7,%eax
 42b:	cd 40                	int    $0x40
 42d:	c3                   	ret    

0000042e <open>:
SYSCALL(open)
 42e:	b8 0f 00 00 00       	mov    $0xf,%eax
 433:	cd 40                	int    $0x40
 435:	c3                   	ret    

00000436 <mknod>:
SYSCALL(mknod)
 436:	b8 11 00 00 00       	mov    $0x11,%eax
 43b:	cd 40                	int    $0x40
 43d:	c3                   	ret    

0000043e <unlink>:
SYSCALL(unlink)
 43e:	b8 12 00 00 00       	mov    $0x12,%eax
 443:	cd 40                	int    $0x40
 445:	c3                   	ret    

00000446 <fstat>:
SYSCALL(fstat)
 446:	b8 08 00 00 00       	mov    $0x8,%eax
 44b:	cd 40                	int    $0x40
 44d:	c3                   	ret    

0000044e <link>:
SYSCALL(link)
 44e:	b8 13 00 00 00       	mov    $0x13,%eax
 453:	cd 40                	int    $0x40
 455:	c3                   	ret    

00000456 <mkdir>:
SYSCALL(mkdir)
 456:	b8 14 00 00 00       	mov    $0x14,%eax
 45b:	cd 40                	int    $0x40
 45d:	c3                   	ret    

0000045e <chdir>:
SYSCALL(chdir)
 45e:	b8 09 00 00 00       	mov    $0x9,%eax
 463:	cd 40                	int    $0x40
 465:	c3                   	ret    

00000466 <dup>:
SYSCALL(dup)
 466:	b8 0a 00 00 00       	mov    $0xa,%eax
 46b:	cd 40                	int    $0x40
 46d:	c3                   	ret    

0000046e <getpid>:
SYSCALL(getpid)
 46e:	b8 0b 00 00 00       	mov    $0xb,%eax
 473:	cd 40                	int    $0x40
 475:	c3                   	ret    

00000476 <sbrk>:
SYSCALL(sbrk)
 476:	b8 0c 00 00 00       	mov    $0xc,%eax
 47b:	cd 40                	int    $0x40
 47d:	c3                   	ret    

0000047e <sleep>:
SYSCALL(sleep)
 47e:	b8 0d 00 00 00       	mov    $0xd,%eax
 483:	cd 40                	int    $0x40
 485:	c3                   	ret    

00000486 <uptime>:
SYSCALL(uptime)
 486:	b8 0e 00 00 00       	mov    $0xe,%eax
 48b:	cd 40                	int    $0x40
 48d:	c3                   	ret    

0000048e <clone>:
SYSCALL(clone)
 48e:	b8 16 00 00 00       	mov    $0x16,%eax
 493:	cd 40                	int    $0x40
 495:	c3                   	ret    

00000496 <join>:
 496:	b8 17 00 00 00       	mov    $0x17,%eax
 49b:	cd 40                	int    $0x40
 49d:	c3                   	ret    

0000049e <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 49e:	55                   	push   %ebp
 49f:	89 e5                	mov    %esp,%ebp
 4a1:	83 ec 1c             	sub    $0x1c,%esp
 4a4:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 4a7:	6a 01                	push   $0x1
 4a9:	8d 55 f4             	lea    -0xc(%ebp),%edx
 4ac:	52                   	push   %edx
 4ad:	50                   	push   %eax
 4ae:	e8 5b ff ff ff       	call   40e <write>
}
 4b3:	83 c4 10             	add    $0x10,%esp
 4b6:	c9                   	leave  
 4b7:	c3                   	ret    

000004b8 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 4b8:	55                   	push   %ebp
 4b9:	89 e5                	mov    %esp,%ebp
 4bb:	57                   	push   %edi
 4bc:	56                   	push   %esi
 4bd:	53                   	push   %ebx
 4be:	83 ec 2c             	sub    $0x2c,%esp
 4c1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 4c4:	89 d0                	mov    %edx,%eax
 4c6:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 4c8:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 4cc:	0f 95 c1             	setne  %cl
 4cf:	c1 ea 1f             	shr    $0x1f,%edx
 4d2:	84 d1                	test   %dl,%cl
 4d4:	74 44                	je     51a <printint+0x62>
    neg = 1;
    x = -xx;
 4d6:	f7 d8                	neg    %eax
 4d8:	89 c1                	mov    %eax,%ecx
    neg = 1;
 4da:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 4e1:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 4e6:	89 c8                	mov    %ecx,%eax
 4e8:	ba 00 00 00 00       	mov    $0x0,%edx
 4ed:	f7 f6                	div    %esi
 4ef:	89 df                	mov    %ebx,%edi
 4f1:	83 c3 01             	add    $0x1,%ebx
 4f4:	0f b6 92 cc 08 00 00 	movzbl 0x8cc(%edx),%edx
 4fb:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 4ff:	89 ca                	mov    %ecx,%edx
 501:	89 c1                	mov    %eax,%ecx
 503:	39 d6                	cmp    %edx,%esi
 505:	76 df                	jbe    4e6 <printint+0x2e>
  if(neg)
 507:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 50b:	74 31                	je     53e <printint+0x86>
    buf[i++] = '-';
 50d:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 512:	8d 5f 02             	lea    0x2(%edi),%ebx
 515:	8b 75 d0             	mov    -0x30(%ebp),%esi
 518:	eb 17                	jmp    531 <printint+0x79>
    x = xx;
 51a:	89 c1                	mov    %eax,%ecx
  neg = 0;
 51c:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 523:	eb bc                	jmp    4e1 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 525:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 52a:	89 f0                	mov    %esi,%eax
 52c:	e8 6d ff ff ff       	call   49e <putc>
  while(--i >= 0)
 531:	83 eb 01             	sub    $0x1,%ebx
 534:	79 ef                	jns    525 <printint+0x6d>
}
 536:	83 c4 2c             	add    $0x2c,%esp
 539:	5b                   	pop    %ebx
 53a:	5e                   	pop    %esi
 53b:	5f                   	pop    %edi
 53c:	5d                   	pop    %ebp
 53d:	c3                   	ret    
 53e:	8b 75 d0             	mov    -0x30(%ebp),%esi
 541:	eb ee                	jmp    531 <printint+0x79>

00000543 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 543:	55                   	push   %ebp
 544:	89 e5                	mov    %esp,%ebp
 546:	57                   	push   %edi
 547:	56                   	push   %esi
 548:	53                   	push   %ebx
 549:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 54c:	8d 45 10             	lea    0x10(%ebp),%eax
 54f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 552:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 557:	bb 00 00 00 00       	mov    $0x0,%ebx
 55c:	eb 14                	jmp    572 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 55e:	89 fa                	mov    %edi,%edx
 560:	8b 45 08             	mov    0x8(%ebp),%eax
 563:	e8 36 ff ff ff       	call   49e <putc>
 568:	eb 05                	jmp    56f <printf+0x2c>
      }
    } else if(state == '%'){
 56a:	83 fe 25             	cmp    $0x25,%esi
 56d:	74 25                	je     594 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 56f:	83 c3 01             	add    $0x1,%ebx
 572:	8b 45 0c             	mov    0xc(%ebp),%eax
 575:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 579:	84 c0                	test   %al,%al
 57b:	0f 84 20 01 00 00    	je     6a1 <printf+0x15e>
    c = fmt[i] & 0xff;
 581:	0f be f8             	movsbl %al,%edi
 584:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 587:	85 f6                	test   %esi,%esi
 589:	75 df                	jne    56a <printf+0x27>
      if(c == '%'){
 58b:	83 f8 25             	cmp    $0x25,%eax
 58e:	75 ce                	jne    55e <printf+0x1b>
        state = '%';
 590:	89 c6                	mov    %eax,%esi
 592:	eb db                	jmp    56f <printf+0x2c>
      if(c == 'd'){
 594:	83 f8 25             	cmp    $0x25,%eax
 597:	0f 84 cf 00 00 00    	je     66c <printf+0x129>
 59d:	0f 8c dd 00 00 00    	jl     680 <printf+0x13d>
 5a3:	83 f8 78             	cmp    $0x78,%eax
 5a6:	0f 8f d4 00 00 00    	jg     680 <printf+0x13d>
 5ac:	83 f8 63             	cmp    $0x63,%eax
 5af:	0f 8c cb 00 00 00    	jl     680 <printf+0x13d>
 5b5:	83 e8 63             	sub    $0x63,%eax
 5b8:	83 f8 15             	cmp    $0x15,%eax
 5bb:	0f 87 bf 00 00 00    	ja     680 <printf+0x13d>
 5c1:	ff 24 85 74 08 00 00 	jmp    *0x874(,%eax,4)
        printint(fd, *ap, 10, 1);
 5c8:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5cb:	8b 17                	mov    (%edi),%edx
 5cd:	83 ec 0c             	sub    $0xc,%esp
 5d0:	6a 01                	push   $0x1
 5d2:	b9 0a 00 00 00       	mov    $0xa,%ecx
 5d7:	8b 45 08             	mov    0x8(%ebp),%eax
 5da:	e8 d9 fe ff ff       	call   4b8 <printint>
        ap++;
 5df:	83 c7 04             	add    $0x4,%edi
 5e2:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 5e5:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 5e8:	be 00 00 00 00       	mov    $0x0,%esi
 5ed:	eb 80                	jmp    56f <printf+0x2c>
        printint(fd, *ap, 16, 0);
 5ef:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5f2:	8b 17                	mov    (%edi),%edx
 5f4:	83 ec 0c             	sub    $0xc,%esp
 5f7:	6a 00                	push   $0x0
 5f9:	b9 10 00 00 00       	mov    $0x10,%ecx
 5fe:	8b 45 08             	mov    0x8(%ebp),%eax
 601:	e8 b2 fe ff ff       	call   4b8 <printint>
        ap++;
 606:	83 c7 04             	add    $0x4,%edi
 609:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 60c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 60f:	be 00 00 00 00       	mov    $0x0,%esi
 614:	e9 56 ff ff ff       	jmp    56f <printf+0x2c>
        s = (char*)*ap;
 619:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 61c:	8b 30                	mov    (%eax),%esi
        ap++;
 61e:	83 c0 04             	add    $0x4,%eax
 621:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 624:	85 f6                	test   %esi,%esi
 626:	75 15                	jne    63d <printf+0xfa>
          s = "(null)";
 628:	be 6a 08 00 00       	mov    $0x86a,%esi
 62d:	eb 0e                	jmp    63d <printf+0xfa>
          putc(fd, *s);
 62f:	0f be d2             	movsbl %dl,%edx
 632:	8b 45 08             	mov    0x8(%ebp),%eax
 635:	e8 64 fe ff ff       	call   49e <putc>
          s++;
 63a:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 63d:	0f b6 16             	movzbl (%esi),%edx
 640:	84 d2                	test   %dl,%dl
 642:	75 eb                	jne    62f <printf+0xec>
      state = 0;
 644:	be 00 00 00 00       	mov    $0x0,%esi
 649:	e9 21 ff ff ff       	jmp    56f <printf+0x2c>
        putc(fd, *ap);
 64e:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 651:	0f be 17             	movsbl (%edi),%edx
 654:	8b 45 08             	mov    0x8(%ebp),%eax
 657:	e8 42 fe ff ff       	call   49e <putc>
        ap++;
 65c:	83 c7 04             	add    $0x4,%edi
 65f:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 662:	be 00 00 00 00       	mov    $0x0,%esi
 667:	e9 03 ff ff ff       	jmp    56f <printf+0x2c>
        putc(fd, c);
 66c:	89 fa                	mov    %edi,%edx
 66e:	8b 45 08             	mov    0x8(%ebp),%eax
 671:	e8 28 fe ff ff       	call   49e <putc>
      state = 0;
 676:	be 00 00 00 00       	mov    $0x0,%esi
 67b:	e9 ef fe ff ff       	jmp    56f <printf+0x2c>
        putc(fd, '%');
 680:	ba 25 00 00 00       	mov    $0x25,%edx
 685:	8b 45 08             	mov    0x8(%ebp),%eax
 688:	e8 11 fe ff ff       	call   49e <putc>
        putc(fd, c);
 68d:	89 fa                	mov    %edi,%edx
 68f:	8b 45 08             	mov    0x8(%ebp),%eax
 692:	e8 07 fe ff ff       	call   49e <putc>
      state = 0;
 697:	be 00 00 00 00       	mov    $0x0,%esi
 69c:	e9 ce fe ff ff       	jmp    56f <printf+0x2c>
    }
  }
}
 6a1:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6a4:	5b                   	pop    %ebx
 6a5:	5e                   	pop    %esi
 6a6:	5f                   	pop    %edi
 6a7:	5d                   	pop    %ebp
 6a8:	c3                   	ret    

000006a9 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6a9:	55                   	push   %ebp
 6aa:	89 e5                	mov    %esp,%ebp
 6ac:	57                   	push   %edi
 6ad:	56                   	push   %esi
 6ae:	53                   	push   %ebx
 6af:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 6b2:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6b5:	a1 5c 0c 00 00       	mov    0xc5c,%eax
 6ba:	eb 02                	jmp    6be <free+0x15>
 6bc:	89 d0                	mov    %edx,%eax
 6be:	39 c8                	cmp    %ecx,%eax
 6c0:	73 04                	jae    6c6 <free+0x1d>
 6c2:	39 08                	cmp    %ecx,(%eax)
 6c4:	77 12                	ja     6d8 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6c6:	8b 10                	mov    (%eax),%edx
 6c8:	39 c2                	cmp    %eax,%edx
 6ca:	77 f0                	ja     6bc <free+0x13>
 6cc:	39 c8                	cmp    %ecx,%eax
 6ce:	72 08                	jb     6d8 <free+0x2f>
 6d0:	39 ca                	cmp    %ecx,%edx
 6d2:	77 04                	ja     6d8 <free+0x2f>
 6d4:	89 d0                	mov    %edx,%eax
 6d6:	eb e6                	jmp    6be <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 6d8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 6db:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 6de:	8b 10                	mov    (%eax),%edx
 6e0:	39 d7                	cmp    %edx,%edi
 6e2:	74 19                	je     6fd <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 6e4:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 6e7:	8b 50 04             	mov    0x4(%eax),%edx
 6ea:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 6ed:	39 ce                	cmp    %ecx,%esi
 6ef:	74 1b                	je     70c <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 6f1:	89 08                	mov    %ecx,(%eax)
  freep = p;
 6f3:	a3 5c 0c 00 00       	mov    %eax,0xc5c
}
 6f8:	5b                   	pop    %ebx
 6f9:	5e                   	pop    %esi
 6fa:	5f                   	pop    %edi
 6fb:	5d                   	pop    %ebp
 6fc:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 6fd:	03 72 04             	add    0x4(%edx),%esi
 700:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 703:	8b 10                	mov    (%eax),%edx
 705:	8b 12                	mov    (%edx),%edx
 707:	89 53 f8             	mov    %edx,-0x8(%ebx)
 70a:	eb db                	jmp    6e7 <free+0x3e>
    p->s.size += bp->s.size;
 70c:	03 53 fc             	add    -0x4(%ebx),%edx
 70f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 712:	8b 53 f8             	mov    -0x8(%ebx),%edx
 715:	89 10                	mov    %edx,(%eax)
 717:	eb da                	jmp    6f3 <free+0x4a>

00000719 <morecore>:

static Header*
morecore(uint nu)
{
 719:	55                   	push   %ebp
 71a:	89 e5                	mov    %esp,%ebp
 71c:	53                   	push   %ebx
 71d:	83 ec 04             	sub    $0x4,%esp
 720:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 722:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 727:	77 05                	ja     72e <morecore+0x15>
    nu = 4096;
 729:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 72e:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 735:	83 ec 0c             	sub    $0xc,%esp
 738:	50                   	push   %eax
 739:	e8 38 fd ff ff       	call   476 <sbrk>
  if(p == (char*)-1)
 73e:	83 c4 10             	add    $0x10,%esp
 741:	83 f8 ff             	cmp    $0xffffffff,%eax
 744:	74 1c                	je     762 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 746:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 749:	83 c0 08             	add    $0x8,%eax
 74c:	83 ec 0c             	sub    $0xc,%esp
 74f:	50                   	push   %eax
 750:	e8 54 ff ff ff       	call   6a9 <free>
  return freep;
 755:	a1 5c 0c 00 00       	mov    0xc5c,%eax
 75a:	83 c4 10             	add    $0x10,%esp
}
 75d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 760:	c9                   	leave  
 761:	c3                   	ret    
    return 0;
 762:	b8 00 00 00 00       	mov    $0x0,%eax
 767:	eb f4                	jmp    75d <morecore+0x44>

00000769 <malloc>:

void*
malloc(uint nbytes)
{
 769:	55                   	push   %ebp
 76a:	89 e5                	mov    %esp,%ebp
 76c:	53                   	push   %ebx
 76d:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 770:	8b 45 08             	mov    0x8(%ebp),%eax
 773:	8d 58 07             	lea    0x7(%eax),%ebx
 776:	c1 eb 03             	shr    $0x3,%ebx
 779:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 77c:	8b 0d 5c 0c 00 00    	mov    0xc5c,%ecx
 782:	85 c9                	test   %ecx,%ecx
 784:	74 04                	je     78a <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 786:	8b 01                	mov    (%ecx),%eax
 788:	eb 4a                	jmp    7d4 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 78a:	c7 05 5c 0c 00 00 60 	movl   $0xc60,0xc5c
 791:	0c 00 00 
 794:	c7 05 60 0c 00 00 60 	movl   $0xc60,0xc60
 79b:	0c 00 00 
    base.s.size = 0;
 79e:	c7 05 64 0c 00 00 00 	movl   $0x0,0xc64
 7a5:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 7a8:	b9 60 0c 00 00       	mov    $0xc60,%ecx
 7ad:	eb d7                	jmp    786 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 7af:	74 19                	je     7ca <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 7b1:	29 da                	sub    %ebx,%edx
 7b3:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 7b6:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 7b9:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 7bc:	89 0d 5c 0c 00 00    	mov    %ecx,0xc5c
      return (void*)(p + 1);
 7c2:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 7c5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 7c8:	c9                   	leave  
 7c9:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 7ca:	8b 10                	mov    (%eax),%edx
 7cc:	89 11                	mov    %edx,(%ecx)
 7ce:	eb ec                	jmp    7bc <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7d0:	89 c1                	mov    %eax,%ecx
 7d2:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 7d4:	8b 50 04             	mov    0x4(%eax),%edx
 7d7:	39 da                	cmp    %ebx,%edx
 7d9:	73 d4                	jae    7af <malloc+0x46>
    if(p == freep)
 7db:	39 05 5c 0c 00 00    	cmp    %eax,0xc5c
 7e1:	75 ed                	jne    7d0 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 7e3:	89 d8                	mov    %ebx,%eax
 7e5:	e8 2f ff ff ff       	call   719 <morecore>
 7ea:	85 c0                	test   %eax,%eax
 7ec:	75 e2                	jne    7d0 <malloc+0x67>
 7ee:	eb d5                	jmp    7c5 <malloc+0x5c>
