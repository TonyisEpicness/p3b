
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
  19:	a3 6c 0c 00 00       	mov    %eax,0xc6c
      lock_release(&lock);
  1e:	83 ec 0c             	sub    $0xc,%esp
  21:	68 68 0c 00 00       	push   $0xc68
  26:	e8 13 02 00 00       	call   23e <lock_release>
   for (i = 0; i < loops; i++) {
  2b:	83 c3 01             	add    $0x1,%ebx
  2e:	83 c4 10             	add    $0x10,%esp
  31:	39 1d 60 0c 00 00    	cmp    %ebx,0xc60
  37:	7e 1d                	jle    56 <worker+0x56>
      lock_acquire(&lock);
  39:	83 ec 0c             	sub    $0xc,%esp
  3c:	68 68 0c 00 00       	push   $0xc68
  41:	e8 d6 01 00 00       	call   21c <lock_acquire>
      tmp = global;
  46:	8b 15 6c 0c 00 00    	mov    0xc6c,%edx
      for(j = 0; j < 50; j++); // take some time
  4c:	83 c4 10             	add    $0x10,%esp
  4f:	b8 00 00 00 00       	mov    $0x0,%eax
  54:	eb bb                	jmp    11 <worker+0x11>
   }
   exit();
  56:	e8 9e 03 00 00       	call   3f9 <exit>

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
  6a:	e8 0a 04 00 00       	call   479 <getpid>
  6f:	a3 70 0c 00 00       	mov    %eax,0xc70
   lock_init(&lock);
  74:	83 ec 0c             	sub    $0xc,%esp
  77:	68 68 0c 00 00       	push   $0xc68
  7c:	e8 cb 01 00 00       	call   24c <lock_init>
   for (i = 0; i < num_threads; i++) {
  81:	83 c4 10             	add    $0x10,%esp
  84:	bb 00 00 00 00       	mov    $0x0,%ebx
  89:	eb 03                	jmp    8e <main+0x33>
  8b:	83 c3 01             	add    $0x1,%ebx
  8e:	39 1d 64 0c 00 00    	cmp    %ebx,0xc64
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
  b0:	68 fc 07 00 00       	push   $0x7fc
  b5:	68 06 08 00 00       	push   $0x806
  ba:	6a 01                	push   $0x1
  bc:	e8 8d 04 00 00       	call   54e <printf>
  c1:	83 c4 0c             	add    $0xc,%esp
  c4:	68 0e 08 00 00       	push   $0x80e
  c9:	68 1d 08 00 00       	push   $0x81d
  ce:	6a 01                	push   $0x1
  d0:	e8 79 04 00 00       	call   54e <printf>
  d5:	83 c4 08             	add    $0x8,%esp
  d8:	68 31 08 00 00       	push   $0x831
  dd:	6a 01                	push   $0x1
  df:	e8 6a 04 00 00       	call   54e <printf>
  e4:	83 c4 04             	add    $0x4,%esp
  e7:	ff 35 70 0c 00 00    	push   0xc70
  ed:	e8 37 03 00 00       	call   429 <kill>
  f2:	e8 02 03 00 00       	call   3f9 <exit>
   for (i = 0; i < num_threads; i++) {
  f7:	bb 00 00 00 00       	mov    $0x0,%ebx
  fc:	a1 64 0c 00 00       	mov    0xc64,%eax
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
 115:	68 fc 07 00 00       	push   $0x7fc
 11a:	68 06 08 00 00       	push   $0x806
 11f:	6a 01                	push   $0x1
 121:	e8 28 04 00 00       	call   54e <printf>
 126:	83 c4 0c             	add    $0xc,%esp
 129:	68 3e 08 00 00       	push   $0x83e
 12e:	68 1d 08 00 00       	push   $0x81d
 133:	6a 01                	push   $0x1
 135:	e8 14 04 00 00       	call   54e <printf>
 13a:	83 c4 08             	add    $0x8,%esp
 13d:	68 31 08 00 00       	push   $0x831
 142:	6a 01                	push   $0x1
 144:	e8 05 04 00 00       	call   54e <printf>
 149:	83 c4 04             	add    $0x4,%esp
 14c:	ff 35 70 0c 00 00    	push   0xc70
 152:	e8 d2 02 00 00       	call   429 <kill>
 157:	e8 9d 02 00 00       	call   3f9 <exit>
   assert(global == num_threads * loops);
 15c:	0f af 05 60 0c 00 00 	imul   0xc60,%eax
 163:	3b 05 6c 0c 00 00    	cmp    0xc6c,%eax
 169:	74 49                	je     1b4 <main+0x159>
 16b:	6a 2d                	push   $0x2d
 16d:	68 fc 07 00 00       	push   $0x7fc
 172:	68 06 08 00 00       	push   $0x806
 177:	6a 01                	push   $0x1
 179:	e8 d0 03 00 00       	call   54e <printf>
 17e:	83 c4 0c             	add    $0xc,%esp
 181:	68 4b 08 00 00       	push   $0x84b
 186:	68 1d 08 00 00       	push   $0x81d
 18b:	6a 01                	push   $0x1
 18d:	e8 bc 03 00 00       	call   54e <printf>
 192:	83 c4 08             	add    $0x8,%esp
 195:	68 31 08 00 00       	push   $0x831
 19a:	6a 01                	push   $0x1
 19c:	e8 ad 03 00 00       	call   54e <printf>
 1a1:	83 c4 04             	add    $0x4,%esp
 1a4:	ff 35 70 0c 00 00    	push   0xc70
 1aa:	e8 7a 02 00 00       	call   429 <kill>
 1af:	e8 45 02 00 00       	call   3f9 <exit>
   printf(1, "TEST PASSED\n");
 1b4:	83 ec 08             	sub    $0x8,%esp
 1b7:	68 69 08 00 00       	push   $0x869
 1bc:	6a 01                	push   $0x1
 1be:	e8 8b 03 00 00       	call   54e <printf>
   exit();
 1c3:	e8 31 02 00 00       	call   3f9 <exit>

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
  void *n_stack = malloc(PGSIZE*2);
 1df:	68 00 20 00 00       	push   $0x2000
 1e4:	e8 8b 05 00 00       	call   774 <malloc>
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
 1fa:	e8 9a 02 00 00       	call   499 <clone>


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
 20b:	55                   	push   %ebp
 20c:	89 e5                	mov    %esp,%ebp
 20e:	83 ec 24             	sub    $0x24,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 211:	8d 45 f4             	lea    -0xc(%ebp),%eax
 214:	50                   	push   %eax
 215:	e8 87 02 00 00       	call   4a1 <join>
  
  return pid;
}
 21a:	c9                   	leave  
 21b:	c3                   	ret    

0000021c <lock_acquire>:

void lock_acquire(lock_t *lock){
 21c:	55                   	push   %ebp
 21d:	89 e5                	mov    %esp,%ebp
 21f:	53                   	push   %ebx
 220:	83 ec 04             	sub    $0x4,%esp
 223:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 226:	83 ec 08             	sub    $0x8,%esp
 229:	6a 01                	push   $0x1
 22b:	53                   	push   %ebx
 22c:	e8 97 ff ff ff       	call   1c8 <test_and_set>
 231:	83 c4 10             	add    $0x10,%esp
 234:	83 f8 01             	cmp    $0x1,%eax
 237:	74 ed                	je     226 <lock_acquire+0xa>
    ;
}
 239:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 23c:	c9                   	leave  
 23d:	c3                   	ret    

0000023e <lock_release>:

void lock_release(lock_t *lock) {
 23e:	55                   	push   %ebp
 23f:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 241:	8b 45 08             	mov    0x8(%ebp),%eax
 244:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 24a:	5d                   	pop    %ebp
 24b:	c3                   	ret    

0000024c <lock_init>:

void lock_init(lock_t *lock) {
 24c:	55                   	push   %ebp
 24d:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 24f:	8b 45 08             	mov    0x8(%ebp),%eax
 252:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 258:	5d                   	pop    %ebp
 259:	c3                   	ret    

0000025a <strcpy>:

char*
strcpy(char *s, const char *t)
{
 25a:	55                   	push   %ebp
 25b:	89 e5                	mov    %esp,%ebp
 25d:	56                   	push   %esi
 25e:	53                   	push   %ebx
 25f:	8b 75 08             	mov    0x8(%ebp),%esi
 262:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 265:	89 f0                	mov    %esi,%eax
 267:	89 d1                	mov    %edx,%ecx
 269:	83 c2 01             	add    $0x1,%edx
 26c:	89 c3                	mov    %eax,%ebx
 26e:	83 c0 01             	add    $0x1,%eax
 271:	0f b6 09             	movzbl (%ecx),%ecx
 274:	88 0b                	mov    %cl,(%ebx)
 276:	84 c9                	test   %cl,%cl
 278:	75 ed                	jne    267 <strcpy+0xd>
    ;
  return os;
}
 27a:	89 f0                	mov    %esi,%eax
 27c:	5b                   	pop    %ebx
 27d:	5e                   	pop    %esi
 27e:	5d                   	pop    %ebp
 27f:	c3                   	ret    

00000280 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 280:	55                   	push   %ebp
 281:	89 e5                	mov    %esp,%ebp
 283:	8b 4d 08             	mov    0x8(%ebp),%ecx
 286:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 289:	eb 06                	jmp    291 <strcmp+0x11>
    p++, q++;
 28b:	83 c1 01             	add    $0x1,%ecx
 28e:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 291:	0f b6 01             	movzbl (%ecx),%eax
 294:	84 c0                	test   %al,%al
 296:	74 04                	je     29c <strcmp+0x1c>
 298:	3a 02                	cmp    (%edx),%al
 29a:	74 ef                	je     28b <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 29c:	0f b6 c0             	movzbl %al,%eax
 29f:	0f b6 12             	movzbl (%edx),%edx
 2a2:	29 d0                	sub    %edx,%eax
}
 2a4:	5d                   	pop    %ebp
 2a5:	c3                   	ret    

000002a6 <strlen>:

uint
strlen(const char *s)
{
 2a6:	55                   	push   %ebp
 2a7:	89 e5                	mov    %esp,%ebp
 2a9:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 2ac:	b8 00 00 00 00       	mov    $0x0,%eax
 2b1:	eb 03                	jmp    2b6 <strlen+0x10>
 2b3:	83 c0 01             	add    $0x1,%eax
 2b6:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 2ba:	75 f7                	jne    2b3 <strlen+0xd>
    ;
  return n;
}
 2bc:	5d                   	pop    %ebp
 2bd:	c3                   	ret    

000002be <memset>:

void*
memset(void *dst, int c, uint n)
{
 2be:	55                   	push   %ebp
 2bf:	89 e5                	mov    %esp,%ebp
 2c1:	57                   	push   %edi
 2c2:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 2c5:	89 d7                	mov    %edx,%edi
 2c7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 2ca:	8b 45 0c             	mov    0xc(%ebp),%eax
 2cd:	fc                   	cld    
 2ce:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 2d0:	89 d0                	mov    %edx,%eax
 2d2:	8b 7d fc             	mov    -0x4(%ebp),%edi
 2d5:	c9                   	leave  
 2d6:	c3                   	ret    

000002d7 <strchr>:

char*
strchr(const char *s, char c)
{
 2d7:	55                   	push   %ebp
 2d8:	89 e5                	mov    %esp,%ebp
 2da:	8b 45 08             	mov    0x8(%ebp),%eax
 2dd:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 2e1:	eb 03                	jmp    2e6 <strchr+0xf>
 2e3:	83 c0 01             	add    $0x1,%eax
 2e6:	0f b6 10             	movzbl (%eax),%edx
 2e9:	84 d2                	test   %dl,%dl
 2eb:	74 06                	je     2f3 <strchr+0x1c>
    if(*s == c)
 2ed:	38 ca                	cmp    %cl,%dl
 2ef:	75 f2                	jne    2e3 <strchr+0xc>
 2f1:	eb 05                	jmp    2f8 <strchr+0x21>
      return (char*)s;
  return 0;
 2f3:	b8 00 00 00 00       	mov    $0x0,%eax
}
 2f8:	5d                   	pop    %ebp
 2f9:	c3                   	ret    

000002fa <gets>:

char*
gets(char *buf, int max)
{
 2fa:	55                   	push   %ebp
 2fb:	89 e5                	mov    %esp,%ebp
 2fd:	57                   	push   %edi
 2fe:	56                   	push   %esi
 2ff:	53                   	push   %ebx
 300:	83 ec 1c             	sub    $0x1c,%esp
 303:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 306:	bb 00 00 00 00       	mov    $0x0,%ebx
 30b:	89 de                	mov    %ebx,%esi
 30d:	83 c3 01             	add    $0x1,%ebx
 310:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 313:	7d 2e                	jge    343 <gets+0x49>
    cc = read(0, &c, 1);
 315:	83 ec 04             	sub    $0x4,%esp
 318:	6a 01                	push   $0x1
 31a:	8d 45 e7             	lea    -0x19(%ebp),%eax
 31d:	50                   	push   %eax
 31e:	6a 00                	push   $0x0
 320:	e8 ec 00 00 00       	call   411 <read>
    if(cc < 1)
 325:	83 c4 10             	add    $0x10,%esp
 328:	85 c0                	test   %eax,%eax
 32a:	7e 17                	jle    343 <gets+0x49>
      break;
    buf[i++] = c;
 32c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 330:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 333:	3c 0a                	cmp    $0xa,%al
 335:	0f 94 c2             	sete   %dl
 338:	3c 0d                	cmp    $0xd,%al
 33a:	0f 94 c0             	sete   %al
 33d:	08 c2                	or     %al,%dl
 33f:	74 ca                	je     30b <gets+0x11>
    buf[i++] = c;
 341:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 343:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 347:	89 f8                	mov    %edi,%eax
 349:	8d 65 f4             	lea    -0xc(%ebp),%esp
 34c:	5b                   	pop    %ebx
 34d:	5e                   	pop    %esi
 34e:	5f                   	pop    %edi
 34f:	5d                   	pop    %ebp
 350:	c3                   	ret    

00000351 <stat>:

int
stat(const char *n, struct stat *st)
{
 351:	55                   	push   %ebp
 352:	89 e5                	mov    %esp,%ebp
 354:	56                   	push   %esi
 355:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 356:	83 ec 08             	sub    $0x8,%esp
 359:	6a 00                	push   $0x0
 35b:	ff 75 08             	push   0x8(%ebp)
 35e:	e8 d6 00 00 00       	call   439 <open>
  if(fd < 0)
 363:	83 c4 10             	add    $0x10,%esp
 366:	85 c0                	test   %eax,%eax
 368:	78 24                	js     38e <stat+0x3d>
 36a:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 36c:	83 ec 08             	sub    $0x8,%esp
 36f:	ff 75 0c             	push   0xc(%ebp)
 372:	50                   	push   %eax
 373:	e8 d9 00 00 00       	call   451 <fstat>
 378:	89 c6                	mov    %eax,%esi
  close(fd);
 37a:	89 1c 24             	mov    %ebx,(%esp)
 37d:	e8 9f 00 00 00       	call   421 <close>
  return r;
 382:	83 c4 10             	add    $0x10,%esp
}
 385:	89 f0                	mov    %esi,%eax
 387:	8d 65 f8             	lea    -0x8(%ebp),%esp
 38a:	5b                   	pop    %ebx
 38b:	5e                   	pop    %esi
 38c:	5d                   	pop    %ebp
 38d:	c3                   	ret    
    return -1;
 38e:	be ff ff ff ff       	mov    $0xffffffff,%esi
 393:	eb f0                	jmp    385 <stat+0x34>

00000395 <atoi>:

int
atoi(const char *s)
{
 395:	55                   	push   %ebp
 396:	89 e5                	mov    %esp,%ebp
 398:	53                   	push   %ebx
 399:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 39c:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 3a1:	eb 10                	jmp    3b3 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 3a3:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 3a6:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 3a9:	83 c1 01             	add    $0x1,%ecx
 3ac:	0f be c0             	movsbl %al,%eax
 3af:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 3b3:	0f b6 01             	movzbl (%ecx),%eax
 3b6:	8d 58 d0             	lea    -0x30(%eax),%ebx
 3b9:	80 fb 09             	cmp    $0x9,%bl
 3bc:	76 e5                	jbe    3a3 <atoi+0xe>
  return n;
}
 3be:	89 d0                	mov    %edx,%eax
 3c0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3c3:	c9                   	leave  
 3c4:	c3                   	ret    

000003c5 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3c5:	55                   	push   %ebp
 3c6:	89 e5                	mov    %esp,%ebp
 3c8:	56                   	push   %esi
 3c9:	53                   	push   %ebx
 3ca:	8b 75 08             	mov    0x8(%ebp),%esi
 3cd:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 3d0:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 3d3:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 3d5:	eb 0d                	jmp    3e4 <memmove+0x1f>
    *dst++ = *src++;
 3d7:	0f b6 01             	movzbl (%ecx),%eax
 3da:	88 02                	mov    %al,(%edx)
 3dc:	8d 49 01             	lea    0x1(%ecx),%ecx
 3df:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 3e2:	89 d8                	mov    %ebx,%eax
 3e4:	8d 58 ff             	lea    -0x1(%eax),%ebx
 3e7:	85 c0                	test   %eax,%eax
 3e9:	7f ec                	jg     3d7 <memmove+0x12>
  return vdst;
}
 3eb:	89 f0                	mov    %esi,%eax
 3ed:	5b                   	pop    %ebx
 3ee:	5e                   	pop    %esi
 3ef:	5d                   	pop    %ebp
 3f0:	c3                   	ret    

000003f1 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3f1:	b8 01 00 00 00       	mov    $0x1,%eax
 3f6:	cd 40                	int    $0x40
 3f8:	c3                   	ret    

000003f9 <exit>:
SYSCALL(exit)
 3f9:	b8 02 00 00 00       	mov    $0x2,%eax
 3fe:	cd 40                	int    $0x40
 400:	c3                   	ret    

00000401 <wait>:
SYSCALL(wait)
 401:	b8 03 00 00 00       	mov    $0x3,%eax
 406:	cd 40                	int    $0x40
 408:	c3                   	ret    

00000409 <pipe>:
SYSCALL(pipe)
 409:	b8 04 00 00 00       	mov    $0x4,%eax
 40e:	cd 40                	int    $0x40
 410:	c3                   	ret    

00000411 <read>:
SYSCALL(read)
 411:	b8 05 00 00 00       	mov    $0x5,%eax
 416:	cd 40                	int    $0x40
 418:	c3                   	ret    

00000419 <write>:
SYSCALL(write)
 419:	b8 10 00 00 00       	mov    $0x10,%eax
 41e:	cd 40                	int    $0x40
 420:	c3                   	ret    

00000421 <close>:
SYSCALL(close)
 421:	b8 15 00 00 00       	mov    $0x15,%eax
 426:	cd 40                	int    $0x40
 428:	c3                   	ret    

00000429 <kill>:
SYSCALL(kill)
 429:	b8 06 00 00 00       	mov    $0x6,%eax
 42e:	cd 40                	int    $0x40
 430:	c3                   	ret    

00000431 <exec>:
SYSCALL(exec)
 431:	b8 07 00 00 00       	mov    $0x7,%eax
 436:	cd 40                	int    $0x40
 438:	c3                   	ret    

00000439 <open>:
SYSCALL(open)
 439:	b8 0f 00 00 00       	mov    $0xf,%eax
 43e:	cd 40                	int    $0x40
 440:	c3                   	ret    

00000441 <mknod>:
SYSCALL(mknod)
 441:	b8 11 00 00 00       	mov    $0x11,%eax
 446:	cd 40                	int    $0x40
 448:	c3                   	ret    

00000449 <unlink>:
SYSCALL(unlink)
 449:	b8 12 00 00 00       	mov    $0x12,%eax
 44e:	cd 40                	int    $0x40
 450:	c3                   	ret    

00000451 <fstat>:
SYSCALL(fstat)
 451:	b8 08 00 00 00       	mov    $0x8,%eax
 456:	cd 40                	int    $0x40
 458:	c3                   	ret    

00000459 <link>:
SYSCALL(link)
 459:	b8 13 00 00 00       	mov    $0x13,%eax
 45e:	cd 40                	int    $0x40
 460:	c3                   	ret    

00000461 <mkdir>:
SYSCALL(mkdir)
 461:	b8 14 00 00 00       	mov    $0x14,%eax
 466:	cd 40                	int    $0x40
 468:	c3                   	ret    

00000469 <chdir>:
SYSCALL(chdir)
 469:	b8 09 00 00 00       	mov    $0x9,%eax
 46e:	cd 40                	int    $0x40
 470:	c3                   	ret    

00000471 <dup>:
SYSCALL(dup)
 471:	b8 0a 00 00 00       	mov    $0xa,%eax
 476:	cd 40                	int    $0x40
 478:	c3                   	ret    

00000479 <getpid>:
SYSCALL(getpid)
 479:	b8 0b 00 00 00       	mov    $0xb,%eax
 47e:	cd 40                	int    $0x40
 480:	c3                   	ret    

00000481 <sbrk>:
SYSCALL(sbrk)
 481:	b8 0c 00 00 00       	mov    $0xc,%eax
 486:	cd 40                	int    $0x40
 488:	c3                   	ret    

00000489 <sleep>:
SYSCALL(sleep)
 489:	b8 0d 00 00 00       	mov    $0xd,%eax
 48e:	cd 40                	int    $0x40
 490:	c3                   	ret    

00000491 <uptime>:
SYSCALL(uptime)
 491:	b8 0e 00 00 00       	mov    $0xe,%eax
 496:	cd 40                	int    $0x40
 498:	c3                   	ret    

00000499 <clone>:
SYSCALL(clone)
 499:	b8 16 00 00 00       	mov    $0x16,%eax
 49e:	cd 40                	int    $0x40
 4a0:	c3                   	ret    

000004a1 <join>:
 4a1:	b8 17 00 00 00       	mov    $0x17,%eax
 4a6:	cd 40                	int    $0x40
 4a8:	c3                   	ret    

000004a9 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 4a9:	55                   	push   %ebp
 4aa:	89 e5                	mov    %esp,%ebp
 4ac:	83 ec 1c             	sub    $0x1c,%esp
 4af:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 4b2:	6a 01                	push   $0x1
 4b4:	8d 55 f4             	lea    -0xc(%ebp),%edx
 4b7:	52                   	push   %edx
 4b8:	50                   	push   %eax
 4b9:	e8 5b ff ff ff       	call   419 <write>
}
 4be:	83 c4 10             	add    $0x10,%esp
 4c1:	c9                   	leave  
 4c2:	c3                   	ret    

000004c3 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 4c3:	55                   	push   %ebp
 4c4:	89 e5                	mov    %esp,%ebp
 4c6:	57                   	push   %edi
 4c7:	56                   	push   %esi
 4c8:	53                   	push   %ebx
 4c9:	83 ec 2c             	sub    $0x2c,%esp
 4cc:	89 45 d0             	mov    %eax,-0x30(%ebp)
 4cf:	89 d0                	mov    %edx,%eax
 4d1:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 4d3:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 4d7:	0f 95 c1             	setne  %cl
 4da:	c1 ea 1f             	shr    $0x1f,%edx
 4dd:	84 d1                	test   %dl,%cl
 4df:	74 44                	je     525 <printint+0x62>
    neg = 1;
    x = -xx;
 4e1:	f7 d8                	neg    %eax
 4e3:	89 c1                	mov    %eax,%ecx
    neg = 1;
 4e5:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 4ec:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 4f1:	89 c8                	mov    %ecx,%eax
 4f3:	ba 00 00 00 00       	mov    $0x0,%edx
 4f8:	f7 f6                	div    %esi
 4fa:	89 df                	mov    %ebx,%edi
 4fc:	83 c3 01             	add    $0x1,%ebx
 4ff:	0f b6 92 d8 08 00 00 	movzbl 0x8d8(%edx),%edx
 506:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 50a:	89 ca                	mov    %ecx,%edx
 50c:	89 c1                	mov    %eax,%ecx
 50e:	39 d6                	cmp    %edx,%esi
 510:	76 df                	jbe    4f1 <printint+0x2e>
  if(neg)
 512:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 516:	74 31                	je     549 <printint+0x86>
    buf[i++] = '-';
 518:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 51d:	8d 5f 02             	lea    0x2(%edi),%ebx
 520:	8b 75 d0             	mov    -0x30(%ebp),%esi
 523:	eb 17                	jmp    53c <printint+0x79>
    x = xx;
 525:	89 c1                	mov    %eax,%ecx
  neg = 0;
 527:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 52e:	eb bc                	jmp    4ec <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 530:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 535:	89 f0                	mov    %esi,%eax
 537:	e8 6d ff ff ff       	call   4a9 <putc>
  while(--i >= 0)
 53c:	83 eb 01             	sub    $0x1,%ebx
 53f:	79 ef                	jns    530 <printint+0x6d>
}
 541:	83 c4 2c             	add    $0x2c,%esp
 544:	5b                   	pop    %ebx
 545:	5e                   	pop    %esi
 546:	5f                   	pop    %edi
 547:	5d                   	pop    %ebp
 548:	c3                   	ret    
 549:	8b 75 d0             	mov    -0x30(%ebp),%esi
 54c:	eb ee                	jmp    53c <printint+0x79>

0000054e <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 54e:	55                   	push   %ebp
 54f:	89 e5                	mov    %esp,%ebp
 551:	57                   	push   %edi
 552:	56                   	push   %esi
 553:	53                   	push   %ebx
 554:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 557:	8d 45 10             	lea    0x10(%ebp),%eax
 55a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 55d:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 562:	bb 00 00 00 00       	mov    $0x0,%ebx
 567:	eb 14                	jmp    57d <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 569:	89 fa                	mov    %edi,%edx
 56b:	8b 45 08             	mov    0x8(%ebp),%eax
 56e:	e8 36 ff ff ff       	call   4a9 <putc>
 573:	eb 05                	jmp    57a <printf+0x2c>
      }
    } else if(state == '%'){
 575:	83 fe 25             	cmp    $0x25,%esi
 578:	74 25                	je     59f <printf+0x51>
  for(i = 0; fmt[i]; i++){
 57a:	83 c3 01             	add    $0x1,%ebx
 57d:	8b 45 0c             	mov    0xc(%ebp),%eax
 580:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 584:	84 c0                	test   %al,%al
 586:	0f 84 20 01 00 00    	je     6ac <printf+0x15e>
    c = fmt[i] & 0xff;
 58c:	0f be f8             	movsbl %al,%edi
 58f:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 592:	85 f6                	test   %esi,%esi
 594:	75 df                	jne    575 <printf+0x27>
      if(c == '%'){
 596:	83 f8 25             	cmp    $0x25,%eax
 599:	75 ce                	jne    569 <printf+0x1b>
        state = '%';
 59b:	89 c6                	mov    %eax,%esi
 59d:	eb db                	jmp    57a <printf+0x2c>
      if(c == 'd'){
 59f:	83 f8 25             	cmp    $0x25,%eax
 5a2:	0f 84 cf 00 00 00    	je     677 <printf+0x129>
 5a8:	0f 8c dd 00 00 00    	jl     68b <printf+0x13d>
 5ae:	83 f8 78             	cmp    $0x78,%eax
 5b1:	0f 8f d4 00 00 00    	jg     68b <printf+0x13d>
 5b7:	83 f8 63             	cmp    $0x63,%eax
 5ba:	0f 8c cb 00 00 00    	jl     68b <printf+0x13d>
 5c0:	83 e8 63             	sub    $0x63,%eax
 5c3:	83 f8 15             	cmp    $0x15,%eax
 5c6:	0f 87 bf 00 00 00    	ja     68b <printf+0x13d>
 5cc:	ff 24 85 80 08 00 00 	jmp    *0x880(,%eax,4)
        printint(fd, *ap, 10, 1);
 5d3:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5d6:	8b 17                	mov    (%edi),%edx
 5d8:	83 ec 0c             	sub    $0xc,%esp
 5db:	6a 01                	push   $0x1
 5dd:	b9 0a 00 00 00       	mov    $0xa,%ecx
 5e2:	8b 45 08             	mov    0x8(%ebp),%eax
 5e5:	e8 d9 fe ff ff       	call   4c3 <printint>
        ap++;
 5ea:	83 c7 04             	add    $0x4,%edi
 5ed:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 5f0:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 5f3:	be 00 00 00 00       	mov    $0x0,%esi
 5f8:	eb 80                	jmp    57a <printf+0x2c>
        printint(fd, *ap, 16, 0);
 5fa:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5fd:	8b 17                	mov    (%edi),%edx
 5ff:	83 ec 0c             	sub    $0xc,%esp
 602:	6a 00                	push   $0x0
 604:	b9 10 00 00 00       	mov    $0x10,%ecx
 609:	8b 45 08             	mov    0x8(%ebp),%eax
 60c:	e8 b2 fe ff ff       	call   4c3 <printint>
        ap++;
 611:	83 c7 04             	add    $0x4,%edi
 614:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 617:	83 c4 10             	add    $0x10,%esp
      state = 0;
 61a:	be 00 00 00 00       	mov    $0x0,%esi
 61f:	e9 56 ff ff ff       	jmp    57a <printf+0x2c>
        s = (char*)*ap;
 624:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 627:	8b 30                	mov    (%eax),%esi
        ap++;
 629:	83 c0 04             	add    $0x4,%eax
 62c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 62f:	85 f6                	test   %esi,%esi
 631:	75 15                	jne    648 <printf+0xfa>
          s = "(null)";
 633:	be 76 08 00 00       	mov    $0x876,%esi
 638:	eb 0e                	jmp    648 <printf+0xfa>
          putc(fd, *s);
 63a:	0f be d2             	movsbl %dl,%edx
 63d:	8b 45 08             	mov    0x8(%ebp),%eax
 640:	e8 64 fe ff ff       	call   4a9 <putc>
          s++;
 645:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 648:	0f b6 16             	movzbl (%esi),%edx
 64b:	84 d2                	test   %dl,%dl
 64d:	75 eb                	jne    63a <printf+0xec>
      state = 0;
 64f:	be 00 00 00 00       	mov    $0x0,%esi
 654:	e9 21 ff ff ff       	jmp    57a <printf+0x2c>
        putc(fd, *ap);
 659:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 65c:	0f be 17             	movsbl (%edi),%edx
 65f:	8b 45 08             	mov    0x8(%ebp),%eax
 662:	e8 42 fe ff ff       	call   4a9 <putc>
        ap++;
 667:	83 c7 04             	add    $0x4,%edi
 66a:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 66d:	be 00 00 00 00       	mov    $0x0,%esi
 672:	e9 03 ff ff ff       	jmp    57a <printf+0x2c>
        putc(fd, c);
 677:	89 fa                	mov    %edi,%edx
 679:	8b 45 08             	mov    0x8(%ebp),%eax
 67c:	e8 28 fe ff ff       	call   4a9 <putc>
      state = 0;
 681:	be 00 00 00 00       	mov    $0x0,%esi
 686:	e9 ef fe ff ff       	jmp    57a <printf+0x2c>
        putc(fd, '%');
 68b:	ba 25 00 00 00       	mov    $0x25,%edx
 690:	8b 45 08             	mov    0x8(%ebp),%eax
 693:	e8 11 fe ff ff       	call   4a9 <putc>
        putc(fd, c);
 698:	89 fa                	mov    %edi,%edx
 69a:	8b 45 08             	mov    0x8(%ebp),%eax
 69d:	e8 07 fe ff ff       	call   4a9 <putc>
      state = 0;
 6a2:	be 00 00 00 00       	mov    $0x0,%esi
 6a7:	e9 ce fe ff ff       	jmp    57a <printf+0x2c>
    }
  }
}
 6ac:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6af:	5b                   	pop    %ebx
 6b0:	5e                   	pop    %esi
 6b1:	5f                   	pop    %edi
 6b2:	5d                   	pop    %ebp
 6b3:	c3                   	ret    

000006b4 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6b4:	55                   	push   %ebp
 6b5:	89 e5                	mov    %esp,%ebp
 6b7:	57                   	push   %edi
 6b8:	56                   	push   %esi
 6b9:	53                   	push   %ebx
 6ba:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 6bd:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6c0:	a1 74 0c 00 00       	mov    0xc74,%eax
 6c5:	eb 02                	jmp    6c9 <free+0x15>
 6c7:	89 d0                	mov    %edx,%eax
 6c9:	39 c8                	cmp    %ecx,%eax
 6cb:	73 04                	jae    6d1 <free+0x1d>
 6cd:	39 08                	cmp    %ecx,(%eax)
 6cf:	77 12                	ja     6e3 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6d1:	8b 10                	mov    (%eax),%edx
 6d3:	39 c2                	cmp    %eax,%edx
 6d5:	77 f0                	ja     6c7 <free+0x13>
 6d7:	39 c8                	cmp    %ecx,%eax
 6d9:	72 08                	jb     6e3 <free+0x2f>
 6db:	39 ca                	cmp    %ecx,%edx
 6dd:	77 04                	ja     6e3 <free+0x2f>
 6df:	89 d0                	mov    %edx,%eax
 6e1:	eb e6                	jmp    6c9 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 6e3:	8b 73 fc             	mov    -0x4(%ebx),%esi
 6e6:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 6e9:	8b 10                	mov    (%eax),%edx
 6eb:	39 d7                	cmp    %edx,%edi
 6ed:	74 19                	je     708 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 6ef:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 6f2:	8b 50 04             	mov    0x4(%eax),%edx
 6f5:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 6f8:	39 ce                	cmp    %ecx,%esi
 6fa:	74 1b                	je     717 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 6fc:	89 08                	mov    %ecx,(%eax)
  freep = p;
 6fe:	a3 74 0c 00 00       	mov    %eax,0xc74
}
 703:	5b                   	pop    %ebx
 704:	5e                   	pop    %esi
 705:	5f                   	pop    %edi
 706:	5d                   	pop    %ebp
 707:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 708:	03 72 04             	add    0x4(%edx),%esi
 70b:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 70e:	8b 10                	mov    (%eax),%edx
 710:	8b 12                	mov    (%edx),%edx
 712:	89 53 f8             	mov    %edx,-0x8(%ebx)
 715:	eb db                	jmp    6f2 <free+0x3e>
    p->s.size += bp->s.size;
 717:	03 53 fc             	add    -0x4(%ebx),%edx
 71a:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 71d:	8b 53 f8             	mov    -0x8(%ebx),%edx
 720:	89 10                	mov    %edx,(%eax)
 722:	eb da                	jmp    6fe <free+0x4a>

00000724 <morecore>:

static Header*
morecore(uint nu)
{
 724:	55                   	push   %ebp
 725:	89 e5                	mov    %esp,%ebp
 727:	53                   	push   %ebx
 728:	83 ec 04             	sub    $0x4,%esp
 72b:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 72d:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 732:	77 05                	ja     739 <morecore+0x15>
    nu = 4096;
 734:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 739:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 740:	83 ec 0c             	sub    $0xc,%esp
 743:	50                   	push   %eax
 744:	e8 38 fd ff ff       	call   481 <sbrk>
  if(p == (char*)-1)
 749:	83 c4 10             	add    $0x10,%esp
 74c:	83 f8 ff             	cmp    $0xffffffff,%eax
 74f:	74 1c                	je     76d <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 751:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 754:	83 c0 08             	add    $0x8,%eax
 757:	83 ec 0c             	sub    $0xc,%esp
 75a:	50                   	push   %eax
 75b:	e8 54 ff ff ff       	call   6b4 <free>
  return freep;
 760:	a1 74 0c 00 00       	mov    0xc74,%eax
 765:	83 c4 10             	add    $0x10,%esp
}
 768:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 76b:	c9                   	leave  
 76c:	c3                   	ret    
    return 0;
 76d:	b8 00 00 00 00       	mov    $0x0,%eax
 772:	eb f4                	jmp    768 <morecore+0x44>

00000774 <malloc>:

void*
malloc(uint nbytes)
{
 774:	55                   	push   %ebp
 775:	89 e5                	mov    %esp,%ebp
 777:	53                   	push   %ebx
 778:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 77b:	8b 45 08             	mov    0x8(%ebp),%eax
 77e:	8d 58 07             	lea    0x7(%eax),%ebx
 781:	c1 eb 03             	shr    $0x3,%ebx
 784:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 787:	8b 0d 74 0c 00 00    	mov    0xc74,%ecx
 78d:	85 c9                	test   %ecx,%ecx
 78f:	74 04                	je     795 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 791:	8b 01                	mov    (%ecx),%eax
 793:	eb 4a                	jmp    7df <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 795:	c7 05 74 0c 00 00 78 	movl   $0xc78,0xc74
 79c:	0c 00 00 
 79f:	c7 05 78 0c 00 00 78 	movl   $0xc78,0xc78
 7a6:	0c 00 00 
    base.s.size = 0;
 7a9:	c7 05 7c 0c 00 00 00 	movl   $0x0,0xc7c
 7b0:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 7b3:	b9 78 0c 00 00       	mov    $0xc78,%ecx
 7b8:	eb d7                	jmp    791 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 7ba:	74 19                	je     7d5 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 7bc:	29 da                	sub    %ebx,%edx
 7be:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 7c1:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 7c4:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 7c7:	89 0d 74 0c 00 00    	mov    %ecx,0xc74
      return (void*)(p + 1);
 7cd:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 7d0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 7d3:	c9                   	leave  
 7d4:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 7d5:	8b 10                	mov    (%eax),%edx
 7d7:	89 11                	mov    %edx,(%ecx)
 7d9:	eb ec                	jmp    7c7 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7db:	89 c1                	mov    %eax,%ecx
 7dd:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 7df:	8b 50 04             	mov    0x4(%eax),%edx
 7e2:	39 da                	cmp    %ebx,%edx
 7e4:	73 d4                	jae    7ba <malloc+0x46>
    if(p == freep)
 7e6:	39 05 74 0c 00 00    	cmp    %eax,0xc74
 7ec:	75 ed                	jne    7db <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 7ee:	89 d8                	mov    %ebx,%eax
 7f0:	e8 2f ff ff ff       	call   724 <morecore>
 7f5:	85 c0                	test   %eax,%eax
 7f7:	75 e2                	jne    7db <malloc+0x67>
 7f9:	eb d5                	jmp    7d0 <malloc+0x5c>
