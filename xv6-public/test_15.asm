
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
  19:	a3 18 0c 00 00       	mov    %eax,0xc18
      lock_release(&lock);
  1e:	83 ec 0c             	sub    $0xc,%esp
  21:	68 14 0c 00 00       	push   $0xc14
  26:	e8 dc 01 00 00       	call   207 <lock_release>
   for (i = 0; i < loops; i++) {
  2b:	83 c3 01             	add    $0x1,%ebx
  2e:	83 c4 10             	add    $0x10,%esp
  31:	39 1d 0c 0c 00 00    	cmp    %ebx,0xc0c
  37:	7e 1d                	jle    56 <worker+0x56>
      lock_acquire(&lock);
  39:	83 ec 0c             	sub    $0xc,%esp
  3c:	68 14 0c 00 00       	push   $0xc14
  41:	e8 9f 01 00 00       	call   1e5 <lock_acquire>
      tmp = global;
  46:	8b 15 18 0c 00 00    	mov    0xc18,%edx
      for(j = 0; j < 50; j++); // take some time
  4c:	83 c4 10             	add    $0x10,%esp
  4f:	b8 00 00 00 00       	mov    $0x0,%eax
  54:	eb bb                	jmp    11 <worker+0x11>
   }
   exit();
  56:	e8 67 03 00 00       	call   3c2 <exit>

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
  6a:	e8 d3 03 00 00       	call   442 <getpid>
  6f:	a3 1c 0c 00 00       	mov    %eax,0xc1c
   lock_init(&lock);
  74:	83 ec 0c             	sub    $0xc,%esp
  77:	68 14 0c 00 00       	push   $0xc14
  7c:	e8 94 01 00 00       	call   215 <lock_init>
   for (i = 0; i < num_threads; i++) {
  81:	83 c4 10             	add    $0x10,%esp
  84:	bb 00 00 00 00       	mov    $0x0,%ebx
  89:	eb 03                	jmp    8e <main+0x33>
  8b:	83 c3 01             	add    $0x1,%ebx
  8e:	39 1d 10 0c 00 00    	cmp    %ebx,0xc10
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
  b0:	68 c4 07 00 00       	push   $0x7c4
  b5:	68 ce 07 00 00       	push   $0x7ce
  ba:	6a 01                	push   $0x1
  bc:	e8 56 04 00 00       	call   517 <printf>
  c1:	83 c4 0c             	add    $0xc,%esp
  c4:	68 d6 07 00 00       	push   $0x7d6
  c9:	68 e5 07 00 00       	push   $0x7e5
  ce:	6a 01                	push   $0x1
  d0:	e8 42 04 00 00       	call   517 <printf>
  d5:	83 c4 08             	add    $0x8,%esp
  d8:	68 f9 07 00 00       	push   $0x7f9
  dd:	6a 01                	push   $0x1
  df:	e8 33 04 00 00       	call   517 <printf>
  e4:	83 c4 04             	add    $0x4,%esp
  e7:	ff 35 1c 0c 00 00    	push   0xc1c
  ed:	e8 00 03 00 00       	call   3f2 <kill>
  f2:	e8 cb 02 00 00       	call   3c2 <exit>
   for (i = 0; i < num_threads; i++) {
  f7:	bb 00 00 00 00       	mov    $0x0,%ebx
  fc:	a1 10 0c 00 00       	mov    0xc10,%eax
 101:	39 d8                	cmp    %ebx,%eax
 103:	7e 57                	jle    15c <main+0x101>
      int join_pid = thread_join();
 105:	e8 d5 00 00 00       	call   1df <thread_join>
      assert(join_pid > 0);
 10a:	85 c0                	test   %eax,%eax
 10c:	7e 05                	jle    113 <main+0xb8>
   for (i = 0; i < num_threads; i++) {
 10e:	83 c3 01             	add    $0x1,%ebx
 111:	eb e9                	jmp    fc <main+0xa1>
      assert(join_pid > 0);
 113:	6a 2a                	push   $0x2a
 115:	68 c4 07 00 00       	push   $0x7c4
 11a:	68 ce 07 00 00       	push   $0x7ce
 11f:	6a 01                	push   $0x1
 121:	e8 f1 03 00 00       	call   517 <printf>
 126:	83 c4 0c             	add    $0xc,%esp
 129:	68 06 08 00 00       	push   $0x806
 12e:	68 e5 07 00 00       	push   $0x7e5
 133:	6a 01                	push   $0x1
 135:	e8 dd 03 00 00       	call   517 <printf>
 13a:	83 c4 08             	add    $0x8,%esp
 13d:	68 f9 07 00 00       	push   $0x7f9
 142:	6a 01                	push   $0x1
 144:	e8 ce 03 00 00       	call   517 <printf>
 149:	83 c4 04             	add    $0x4,%esp
 14c:	ff 35 1c 0c 00 00    	push   0xc1c
 152:	e8 9b 02 00 00       	call   3f2 <kill>
 157:	e8 66 02 00 00       	call   3c2 <exit>
   assert(global == num_threads * loops);
 15c:	0f af 05 0c 0c 00 00 	imul   0xc0c,%eax
 163:	3b 05 18 0c 00 00    	cmp    0xc18,%eax
 169:	74 49                	je     1b4 <main+0x159>
 16b:	6a 2d                	push   $0x2d
 16d:	68 c4 07 00 00       	push   $0x7c4
 172:	68 ce 07 00 00       	push   $0x7ce
 177:	6a 01                	push   $0x1
 179:	e8 99 03 00 00       	call   517 <printf>
 17e:	83 c4 0c             	add    $0xc,%esp
 181:	68 13 08 00 00       	push   $0x813
 186:	68 e5 07 00 00       	push   $0x7e5
 18b:	6a 01                	push   $0x1
 18d:	e8 85 03 00 00       	call   517 <printf>
 192:	83 c4 08             	add    $0x8,%esp
 195:	68 f9 07 00 00       	push   $0x7f9
 19a:	6a 01                	push   $0x1
 19c:	e8 76 03 00 00       	call   517 <printf>
 1a1:	83 c4 04             	add    $0x4,%esp
 1a4:	ff 35 1c 0c 00 00    	push   0xc1c
 1aa:	e8 43 02 00 00       	call   3f2 <kill>
 1af:	e8 0e 02 00 00       	call   3c2 <exit>
   printf(1, "TEST PASSED\n");
 1b4:	83 ec 08             	sub    $0x8,%esp
 1b7:	68 31 08 00 00       	push   $0x831
 1bc:	6a 01                	push   $0x1
 1be:	e8 54 03 00 00       	call   517 <printf>
   exit();
 1c3:	e8 fa 01 00 00       	call   3c2 <exit>

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

  // I can't remember if there was something else to do here but I'm sure I'll find out


  return new_pid;
}
 1d9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 1de:	c3                   	ret    

000001df <thread_join>:

int thread_join() {
  return 0;
}
 1df:	b8 00 00 00 00       	mov    $0x0,%eax
 1e4:	c3                   	ret    

000001e5 <lock_acquire>:

void lock_acquire(lock_t *lock){
 1e5:	55                   	push   %ebp
 1e6:	89 e5                	mov    %esp,%ebp
 1e8:	53                   	push   %ebx
 1e9:	83 ec 04             	sub    $0x4,%esp
 1ec:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 1ef:	83 ec 08             	sub    $0x8,%esp
 1f2:	6a 01                	push   $0x1
 1f4:	53                   	push   %ebx
 1f5:	e8 ce ff ff ff       	call   1c8 <test_and_set>
 1fa:	83 c4 10             	add    $0x10,%esp
 1fd:	83 f8 01             	cmp    $0x1,%eax
 200:	74 ed                	je     1ef <lock_acquire+0xa>
    ;
}
 202:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 205:	c9                   	leave  
 206:	c3                   	ret    

00000207 <lock_release>:

void lock_release(lock_t *lock) {
 207:	55                   	push   %ebp
 208:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 20a:	8b 45 08             	mov    0x8(%ebp),%eax
 20d:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 213:	5d                   	pop    %ebp
 214:	c3                   	ret    

00000215 <lock_init>:

void lock_init(lock_t *lock) {
 215:	55                   	push   %ebp
 216:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 218:	8b 45 08             	mov    0x8(%ebp),%eax
 21b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 221:	5d                   	pop    %ebp
 222:	c3                   	ret    

00000223 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 223:	55                   	push   %ebp
 224:	89 e5                	mov    %esp,%ebp
 226:	56                   	push   %esi
 227:	53                   	push   %ebx
 228:	8b 75 08             	mov    0x8(%ebp),%esi
 22b:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 22e:	89 f0                	mov    %esi,%eax
 230:	89 d1                	mov    %edx,%ecx
 232:	83 c2 01             	add    $0x1,%edx
 235:	89 c3                	mov    %eax,%ebx
 237:	83 c0 01             	add    $0x1,%eax
 23a:	0f b6 09             	movzbl (%ecx),%ecx
 23d:	88 0b                	mov    %cl,(%ebx)
 23f:	84 c9                	test   %cl,%cl
 241:	75 ed                	jne    230 <strcpy+0xd>
    ;
  return os;
}
 243:	89 f0                	mov    %esi,%eax
 245:	5b                   	pop    %ebx
 246:	5e                   	pop    %esi
 247:	5d                   	pop    %ebp
 248:	c3                   	ret    

00000249 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 249:	55                   	push   %ebp
 24a:	89 e5                	mov    %esp,%ebp
 24c:	8b 4d 08             	mov    0x8(%ebp),%ecx
 24f:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 252:	eb 06                	jmp    25a <strcmp+0x11>
    p++, q++;
 254:	83 c1 01             	add    $0x1,%ecx
 257:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 25a:	0f b6 01             	movzbl (%ecx),%eax
 25d:	84 c0                	test   %al,%al
 25f:	74 04                	je     265 <strcmp+0x1c>
 261:	3a 02                	cmp    (%edx),%al
 263:	74 ef                	je     254 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 265:	0f b6 c0             	movzbl %al,%eax
 268:	0f b6 12             	movzbl (%edx),%edx
 26b:	29 d0                	sub    %edx,%eax
}
 26d:	5d                   	pop    %ebp
 26e:	c3                   	ret    

0000026f <strlen>:

uint
strlen(const char *s)
{
 26f:	55                   	push   %ebp
 270:	89 e5                	mov    %esp,%ebp
 272:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 275:	b8 00 00 00 00       	mov    $0x0,%eax
 27a:	eb 03                	jmp    27f <strlen+0x10>
 27c:	83 c0 01             	add    $0x1,%eax
 27f:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 283:	75 f7                	jne    27c <strlen+0xd>
    ;
  return n;
}
 285:	5d                   	pop    %ebp
 286:	c3                   	ret    

00000287 <memset>:

void*
memset(void *dst, int c, uint n)
{
 287:	55                   	push   %ebp
 288:	89 e5                	mov    %esp,%ebp
 28a:	57                   	push   %edi
 28b:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 28e:	89 d7                	mov    %edx,%edi
 290:	8b 4d 10             	mov    0x10(%ebp),%ecx
 293:	8b 45 0c             	mov    0xc(%ebp),%eax
 296:	fc                   	cld    
 297:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 299:	89 d0                	mov    %edx,%eax
 29b:	8b 7d fc             	mov    -0x4(%ebp),%edi
 29e:	c9                   	leave  
 29f:	c3                   	ret    

000002a0 <strchr>:

char*
strchr(const char *s, char c)
{
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	8b 45 08             	mov    0x8(%ebp),%eax
 2a6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 2aa:	eb 03                	jmp    2af <strchr+0xf>
 2ac:	83 c0 01             	add    $0x1,%eax
 2af:	0f b6 10             	movzbl (%eax),%edx
 2b2:	84 d2                	test   %dl,%dl
 2b4:	74 06                	je     2bc <strchr+0x1c>
    if(*s == c)
 2b6:	38 ca                	cmp    %cl,%dl
 2b8:	75 f2                	jne    2ac <strchr+0xc>
 2ba:	eb 05                	jmp    2c1 <strchr+0x21>
      return (char*)s;
  return 0;
 2bc:	b8 00 00 00 00       	mov    $0x0,%eax
}
 2c1:	5d                   	pop    %ebp
 2c2:	c3                   	ret    

000002c3 <gets>:

char*
gets(char *buf, int max)
{
 2c3:	55                   	push   %ebp
 2c4:	89 e5                	mov    %esp,%ebp
 2c6:	57                   	push   %edi
 2c7:	56                   	push   %esi
 2c8:	53                   	push   %ebx
 2c9:	83 ec 1c             	sub    $0x1c,%esp
 2cc:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2cf:	bb 00 00 00 00       	mov    $0x0,%ebx
 2d4:	89 de                	mov    %ebx,%esi
 2d6:	83 c3 01             	add    $0x1,%ebx
 2d9:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2dc:	7d 2e                	jge    30c <gets+0x49>
    cc = read(0, &c, 1);
 2de:	83 ec 04             	sub    $0x4,%esp
 2e1:	6a 01                	push   $0x1
 2e3:	8d 45 e7             	lea    -0x19(%ebp),%eax
 2e6:	50                   	push   %eax
 2e7:	6a 00                	push   $0x0
 2e9:	e8 ec 00 00 00       	call   3da <read>
    if(cc < 1)
 2ee:	83 c4 10             	add    $0x10,%esp
 2f1:	85 c0                	test   %eax,%eax
 2f3:	7e 17                	jle    30c <gets+0x49>
      break;
    buf[i++] = c;
 2f5:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2f9:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 2fc:	3c 0a                	cmp    $0xa,%al
 2fe:	0f 94 c2             	sete   %dl
 301:	3c 0d                	cmp    $0xd,%al
 303:	0f 94 c0             	sete   %al
 306:	08 c2                	or     %al,%dl
 308:	74 ca                	je     2d4 <gets+0x11>
    buf[i++] = c;
 30a:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 30c:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 310:	89 f8                	mov    %edi,%eax
 312:	8d 65 f4             	lea    -0xc(%ebp),%esp
 315:	5b                   	pop    %ebx
 316:	5e                   	pop    %esi
 317:	5f                   	pop    %edi
 318:	5d                   	pop    %ebp
 319:	c3                   	ret    

0000031a <stat>:

int
stat(const char *n, struct stat *st)
{
 31a:	55                   	push   %ebp
 31b:	89 e5                	mov    %esp,%ebp
 31d:	56                   	push   %esi
 31e:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 31f:	83 ec 08             	sub    $0x8,%esp
 322:	6a 00                	push   $0x0
 324:	ff 75 08             	push   0x8(%ebp)
 327:	e8 d6 00 00 00       	call   402 <open>
  if(fd < 0)
 32c:	83 c4 10             	add    $0x10,%esp
 32f:	85 c0                	test   %eax,%eax
 331:	78 24                	js     357 <stat+0x3d>
 333:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 335:	83 ec 08             	sub    $0x8,%esp
 338:	ff 75 0c             	push   0xc(%ebp)
 33b:	50                   	push   %eax
 33c:	e8 d9 00 00 00       	call   41a <fstat>
 341:	89 c6                	mov    %eax,%esi
  close(fd);
 343:	89 1c 24             	mov    %ebx,(%esp)
 346:	e8 9f 00 00 00       	call   3ea <close>
  return r;
 34b:	83 c4 10             	add    $0x10,%esp
}
 34e:	89 f0                	mov    %esi,%eax
 350:	8d 65 f8             	lea    -0x8(%ebp),%esp
 353:	5b                   	pop    %ebx
 354:	5e                   	pop    %esi
 355:	5d                   	pop    %ebp
 356:	c3                   	ret    
    return -1;
 357:	be ff ff ff ff       	mov    $0xffffffff,%esi
 35c:	eb f0                	jmp    34e <stat+0x34>

0000035e <atoi>:

int
atoi(const char *s)
{
 35e:	55                   	push   %ebp
 35f:	89 e5                	mov    %esp,%ebp
 361:	53                   	push   %ebx
 362:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 365:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 36a:	eb 10                	jmp    37c <atoi+0x1e>
    n = n*10 + *s++ - '0';
 36c:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 36f:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 372:	83 c1 01             	add    $0x1,%ecx
 375:	0f be c0             	movsbl %al,%eax
 378:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 37c:	0f b6 01             	movzbl (%ecx),%eax
 37f:	8d 58 d0             	lea    -0x30(%eax),%ebx
 382:	80 fb 09             	cmp    $0x9,%bl
 385:	76 e5                	jbe    36c <atoi+0xe>
  return n;
}
 387:	89 d0                	mov    %edx,%eax
 389:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 38c:	c9                   	leave  
 38d:	c3                   	ret    

0000038e <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 38e:	55                   	push   %ebp
 38f:	89 e5                	mov    %esp,%ebp
 391:	56                   	push   %esi
 392:	53                   	push   %ebx
 393:	8b 75 08             	mov    0x8(%ebp),%esi
 396:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 399:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 39c:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 39e:	eb 0d                	jmp    3ad <memmove+0x1f>
    *dst++ = *src++;
 3a0:	0f b6 01             	movzbl (%ecx),%eax
 3a3:	88 02                	mov    %al,(%edx)
 3a5:	8d 49 01             	lea    0x1(%ecx),%ecx
 3a8:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 3ab:	89 d8                	mov    %ebx,%eax
 3ad:	8d 58 ff             	lea    -0x1(%eax),%ebx
 3b0:	85 c0                	test   %eax,%eax
 3b2:	7f ec                	jg     3a0 <memmove+0x12>
  return vdst;
}
 3b4:	89 f0                	mov    %esi,%eax
 3b6:	5b                   	pop    %ebx
 3b7:	5e                   	pop    %esi
 3b8:	5d                   	pop    %ebp
 3b9:	c3                   	ret    

000003ba <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3ba:	b8 01 00 00 00       	mov    $0x1,%eax
 3bf:	cd 40                	int    $0x40
 3c1:	c3                   	ret    

000003c2 <exit>:
SYSCALL(exit)
 3c2:	b8 02 00 00 00       	mov    $0x2,%eax
 3c7:	cd 40                	int    $0x40
 3c9:	c3                   	ret    

000003ca <wait>:
SYSCALL(wait)
 3ca:	b8 03 00 00 00       	mov    $0x3,%eax
 3cf:	cd 40                	int    $0x40
 3d1:	c3                   	ret    

000003d2 <pipe>:
SYSCALL(pipe)
 3d2:	b8 04 00 00 00       	mov    $0x4,%eax
 3d7:	cd 40                	int    $0x40
 3d9:	c3                   	ret    

000003da <read>:
SYSCALL(read)
 3da:	b8 05 00 00 00       	mov    $0x5,%eax
 3df:	cd 40                	int    $0x40
 3e1:	c3                   	ret    

000003e2 <write>:
SYSCALL(write)
 3e2:	b8 10 00 00 00       	mov    $0x10,%eax
 3e7:	cd 40                	int    $0x40
 3e9:	c3                   	ret    

000003ea <close>:
SYSCALL(close)
 3ea:	b8 15 00 00 00       	mov    $0x15,%eax
 3ef:	cd 40                	int    $0x40
 3f1:	c3                   	ret    

000003f2 <kill>:
SYSCALL(kill)
 3f2:	b8 06 00 00 00       	mov    $0x6,%eax
 3f7:	cd 40                	int    $0x40
 3f9:	c3                   	ret    

000003fa <exec>:
SYSCALL(exec)
 3fa:	b8 07 00 00 00       	mov    $0x7,%eax
 3ff:	cd 40                	int    $0x40
 401:	c3                   	ret    

00000402 <open>:
SYSCALL(open)
 402:	b8 0f 00 00 00       	mov    $0xf,%eax
 407:	cd 40                	int    $0x40
 409:	c3                   	ret    

0000040a <mknod>:
SYSCALL(mknod)
 40a:	b8 11 00 00 00       	mov    $0x11,%eax
 40f:	cd 40                	int    $0x40
 411:	c3                   	ret    

00000412 <unlink>:
SYSCALL(unlink)
 412:	b8 12 00 00 00       	mov    $0x12,%eax
 417:	cd 40                	int    $0x40
 419:	c3                   	ret    

0000041a <fstat>:
SYSCALL(fstat)
 41a:	b8 08 00 00 00       	mov    $0x8,%eax
 41f:	cd 40                	int    $0x40
 421:	c3                   	ret    

00000422 <link>:
SYSCALL(link)
 422:	b8 13 00 00 00       	mov    $0x13,%eax
 427:	cd 40                	int    $0x40
 429:	c3                   	ret    

0000042a <mkdir>:
SYSCALL(mkdir)
 42a:	b8 14 00 00 00       	mov    $0x14,%eax
 42f:	cd 40                	int    $0x40
 431:	c3                   	ret    

00000432 <chdir>:
SYSCALL(chdir)
 432:	b8 09 00 00 00       	mov    $0x9,%eax
 437:	cd 40                	int    $0x40
 439:	c3                   	ret    

0000043a <dup>:
SYSCALL(dup)
 43a:	b8 0a 00 00 00       	mov    $0xa,%eax
 43f:	cd 40                	int    $0x40
 441:	c3                   	ret    

00000442 <getpid>:
SYSCALL(getpid)
 442:	b8 0b 00 00 00       	mov    $0xb,%eax
 447:	cd 40                	int    $0x40
 449:	c3                   	ret    

0000044a <sbrk>:
SYSCALL(sbrk)
 44a:	b8 0c 00 00 00       	mov    $0xc,%eax
 44f:	cd 40                	int    $0x40
 451:	c3                   	ret    

00000452 <sleep>:
SYSCALL(sleep)
 452:	b8 0d 00 00 00       	mov    $0xd,%eax
 457:	cd 40                	int    $0x40
 459:	c3                   	ret    

0000045a <uptime>:
SYSCALL(uptime)
 45a:	b8 0e 00 00 00       	mov    $0xe,%eax
 45f:	cd 40                	int    $0x40
 461:	c3                   	ret    

00000462 <clone>:
SYSCALL(clone)
 462:	b8 16 00 00 00       	mov    $0x16,%eax
 467:	cd 40                	int    $0x40
 469:	c3                   	ret    

0000046a <join>:
 46a:	b8 17 00 00 00       	mov    $0x17,%eax
 46f:	cd 40                	int    $0x40
 471:	c3                   	ret    

00000472 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 472:	55                   	push   %ebp
 473:	89 e5                	mov    %esp,%ebp
 475:	83 ec 1c             	sub    $0x1c,%esp
 478:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 47b:	6a 01                	push   $0x1
 47d:	8d 55 f4             	lea    -0xc(%ebp),%edx
 480:	52                   	push   %edx
 481:	50                   	push   %eax
 482:	e8 5b ff ff ff       	call   3e2 <write>
}
 487:	83 c4 10             	add    $0x10,%esp
 48a:	c9                   	leave  
 48b:	c3                   	ret    

0000048c <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 48c:	55                   	push   %ebp
 48d:	89 e5                	mov    %esp,%ebp
 48f:	57                   	push   %edi
 490:	56                   	push   %esi
 491:	53                   	push   %ebx
 492:	83 ec 2c             	sub    $0x2c,%esp
 495:	89 45 d0             	mov    %eax,-0x30(%ebp)
 498:	89 d0                	mov    %edx,%eax
 49a:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 49c:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 4a0:	0f 95 c1             	setne  %cl
 4a3:	c1 ea 1f             	shr    $0x1f,%edx
 4a6:	84 d1                	test   %dl,%cl
 4a8:	74 44                	je     4ee <printint+0x62>
    neg = 1;
    x = -xx;
 4aa:	f7 d8                	neg    %eax
 4ac:	89 c1                	mov    %eax,%ecx
    neg = 1;
 4ae:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 4b5:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 4ba:	89 c8                	mov    %ecx,%eax
 4bc:	ba 00 00 00 00       	mov    $0x0,%edx
 4c1:	f7 f6                	div    %esi
 4c3:	89 df                	mov    %ebx,%edi
 4c5:	83 c3 01             	add    $0x1,%ebx
 4c8:	0f b6 92 a0 08 00 00 	movzbl 0x8a0(%edx),%edx
 4cf:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 4d3:	89 ca                	mov    %ecx,%edx
 4d5:	89 c1                	mov    %eax,%ecx
 4d7:	39 d6                	cmp    %edx,%esi
 4d9:	76 df                	jbe    4ba <printint+0x2e>
  if(neg)
 4db:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 4df:	74 31                	je     512 <printint+0x86>
    buf[i++] = '-';
 4e1:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 4e6:	8d 5f 02             	lea    0x2(%edi),%ebx
 4e9:	8b 75 d0             	mov    -0x30(%ebp),%esi
 4ec:	eb 17                	jmp    505 <printint+0x79>
    x = xx;
 4ee:	89 c1                	mov    %eax,%ecx
  neg = 0;
 4f0:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 4f7:	eb bc                	jmp    4b5 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 4f9:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 4fe:	89 f0                	mov    %esi,%eax
 500:	e8 6d ff ff ff       	call   472 <putc>
  while(--i >= 0)
 505:	83 eb 01             	sub    $0x1,%ebx
 508:	79 ef                	jns    4f9 <printint+0x6d>
}
 50a:	83 c4 2c             	add    $0x2c,%esp
 50d:	5b                   	pop    %ebx
 50e:	5e                   	pop    %esi
 50f:	5f                   	pop    %edi
 510:	5d                   	pop    %ebp
 511:	c3                   	ret    
 512:	8b 75 d0             	mov    -0x30(%ebp),%esi
 515:	eb ee                	jmp    505 <printint+0x79>

00000517 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 517:	55                   	push   %ebp
 518:	89 e5                	mov    %esp,%ebp
 51a:	57                   	push   %edi
 51b:	56                   	push   %esi
 51c:	53                   	push   %ebx
 51d:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 520:	8d 45 10             	lea    0x10(%ebp),%eax
 523:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 526:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 52b:	bb 00 00 00 00       	mov    $0x0,%ebx
 530:	eb 14                	jmp    546 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 532:	89 fa                	mov    %edi,%edx
 534:	8b 45 08             	mov    0x8(%ebp),%eax
 537:	e8 36 ff ff ff       	call   472 <putc>
 53c:	eb 05                	jmp    543 <printf+0x2c>
      }
    } else if(state == '%'){
 53e:	83 fe 25             	cmp    $0x25,%esi
 541:	74 25                	je     568 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 543:	83 c3 01             	add    $0x1,%ebx
 546:	8b 45 0c             	mov    0xc(%ebp),%eax
 549:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 54d:	84 c0                	test   %al,%al
 54f:	0f 84 20 01 00 00    	je     675 <printf+0x15e>
    c = fmt[i] & 0xff;
 555:	0f be f8             	movsbl %al,%edi
 558:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 55b:	85 f6                	test   %esi,%esi
 55d:	75 df                	jne    53e <printf+0x27>
      if(c == '%'){
 55f:	83 f8 25             	cmp    $0x25,%eax
 562:	75 ce                	jne    532 <printf+0x1b>
        state = '%';
 564:	89 c6                	mov    %eax,%esi
 566:	eb db                	jmp    543 <printf+0x2c>
      if(c == 'd'){
 568:	83 f8 25             	cmp    $0x25,%eax
 56b:	0f 84 cf 00 00 00    	je     640 <printf+0x129>
 571:	0f 8c dd 00 00 00    	jl     654 <printf+0x13d>
 577:	83 f8 78             	cmp    $0x78,%eax
 57a:	0f 8f d4 00 00 00    	jg     654 <printf+0x13d>
 580:	83 f8 63             	cmp    $0x63,%eax
 583:	0f 8c cb 00 00 00    	jl     654 <printf+0x13d>
 589:	83 e8 63             	sub    $0x63,%eax
 58c:	83 f8 15             	cmp    $0x15,%eax
 58f:	0f 87 bf 00 00 00    	ja     654 <printf+0x13d>
 595:	ff 24 85 48 08 00 00 	jmp    *0x848(,%eax,4)
        printint(fd, *ap, 10, 1);
 59c:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 59f:	8b 17                	mov    (%edi),%edx
 5a1:	83 ec 0c             	sub    $0xc,%esp
 5a4:	6a 01                	push   $0x1
 5a6:	b9 0a 00 00 00       	mov    $0xa,%ecx
 5ab:	8b 45 08             	mov    0x8(%ebp),%eax
 5ae:	e8 d9 fe ff ff       	call   48c <printint>
        ap++;
 5b3:	83 c7 04             	add    $0x4,%edi
 5b6:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 5b9:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 5bc:	be 00 00 00 00       	mov    $0x0,%esi
 5c1:	eb 80                	jmp    543 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 5c3:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5c6:	8b 17                	mov    (%edi),%edx
 5c8:	83 ec 0c             	sub    $0xc,%esp
 5cb:	6a 00                	push   $0x0
 5cd:	b9 10 00 00 00       	mov    $0x10,%ecx
 5d2:	8b 45 08             	mov    0x8(%ebp),%eax
 5d5:	e8 b2 fe ff ff       	call   48c <printint>
        ap++;
 5da:	83 c7 04             	add    $0x4,%edi
 5dd:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 5e0:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5e3:	be 00 00 00 00       	mov    $0x0,%esi
 5e8:	e9 56 ff ff ff       	jmp    543 <printf+0x2c>
        s = (char*)*ap;
 5ed:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5f0:	8b 30                	mov    (%eax),%esi
        ap++;
 5f2:	83 c0 04             	add    $0x4,%eax
 5f5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 5f8:	85 f6                	test   %esi,%esi
 5fa:	75 15                	jne    611 <printf+0xfa>
          s = "(null)";
 5fc:	be 3e 08 00 00       	mov    $0x83e,%esi
 601:	eb 0e                	jmp    611 <printf+0xfa>
          putc(fd, *s);
 603:	0f be d2             	movsbl %dl,%edx
 606:	8b 45 08             	mov    0x8(%ebp),%eax
 609:	e8 64 fe ff ff       	call   472 <putc>
          s++;
 60e:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 611:	0f b6 16             	movzbl (%esi),%edx
 614:	84 d2                	test   %dl,%dl
 616:	75 eb                	jne    603 <printf+0xec>
      state = 0;
 618:	be 00 00 00 00       	mov    $0x0,%esi
 61d:	e9 21 ff ff ff       	jmp    543 <printf+0x2c>
        putc(fd, *ap);
 622:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 625:	0f be 17             	movsbl (%edi),%edx
 628:	8b 45 08             	mov    0x8(%ebp),%eax
 62b:	e8 42 fe ff ff       	call   472 <putc>
        ap++;
 630:	83 c7 04             	add    $0x4,%edi
 633:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 636:	be 00 00 00 00       	mov    $0x0,%esi
 63b:	e9 03 ff ff ff       	jmp    543 <printf+0x2c>
        putc(fd, c);
 640:	89 fa                	mov    %edi,%edx
 642:	8b 45 08             	mov    0x8(%ebp),%eax
 645:	e8 28 fe ff ff       	call   472 <putc>
      state = 0;
 64a:	be 00 00 00 00       	mov    $0x0,%esi
 64f:	e9 ef fe ff ff       	jmp    543 <printf+0x2c>
        putc(fd, '%');
 654:	ba 25 00 00 00       	mov    $0x25,%edx
 659:	8b 45 08             	mov    0x8(%ebp),%eax
 65c:	e8 11 fe ff ff       	call   472 <putc>
        putc(fd, c);
 661:	89 fa                	mov    %edi,%edx
 663:	8b 45 08             	mov    0x8(%ebp),%eax
 666:	e8 07 fe ff ff       	call   472 <putc>
      state = 0;
 66b:	be 00 00 00 00       	mov    $0x0,%esi
 670:	e9 ce fe ff ff       	jmp    543 <printf+0x2c>
    }
  }
}
 675:	8d 65 f4             	lea    -0xc(%ebp),%esp
 678:	5b                   	pop    %ebx
 679:	5e                   	pop    %esi
 67a:	5f                   	pop    %edi
 67b:	5d                   	pop    %ebp
 67c:	c3                   	ret    

0000067d <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 67d:	55                   	push   %ebp
 67e:	89 e5                	mov    %esp,%ebp
 680:	57                   	push   %edi
 681:	56                   	push   %esi
 682:	53                   	push   %ebx
 683:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 686:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 689:	a1 20 0c 00 00       	mov    0xc20,%eax
 68e:	eb 02                	jmp    692 <free+0x15>
 690:	89 d0                	mov    %edx,%eax
 692:	39 c8                	cmp    %ecx,%eax
 694:	73 04                	jae    69a <free+0x1d>
 696:	39 08                	cmp    %ecx,(%eax)
 698:	77 12                	ja     6ac <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 69a:	8b 10                	mov    (%eax),%edx
 69c:	39 c2                	cmp    %eax,%edx
 69e:	77 f0                	ja     690 <free+0x13>
 6a0:	39 c8                	cmp    %ecx,%eax
 6a2:	72 08                	jb     6ac <free+0x2f>
 6a4:	39 ca                	cmp    %ecx,%edx
 6a6:	77 04                	ja     6ac <free+0x2f>
 6a8:	89 d0                	mov    %edx,%eax
 6aa:	eb e6                	jmp    692 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 6ac:	8b 73 fc             	mov    -0x4(%ebx),%esi
 6af:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 6b2:	8b 10                	mov    (%eax),%edx
 6b4:	39 d7                	cmp    %edx,%edi
 6b6:	74 19                	je     6d1 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 6b8:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 6bb:	8b 50 04             	mov    0x4(%eax),%edx
 6be:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 6c1:	39 ce                	cmp    %ecx,%esi
 6c3:	74 1b                	je     6e0 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 6c5:	89 08                	mov    %ecx,(%eax)
  freep = p;
 6c7:	a3 20 0c 00 00       	mov    %eax,0xc20
}
 6cc:	5b                   	pop    %ebx
 6cd:	5e                   	pop    %esi
 6ce:	5f                   	pop    %edi
 6cf:	5d                   	pop    %ebp
 6d0:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 6d1:	03 72 04             	add    0x4(%edx),%esi
 6d4:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 6d7:	8b 10                	mov    (%eax),%edx
 6d9:	8b 12                	mov    (%edx),%edx
 6db:	89 53 f8             	mov    %edx,-0x8(%ebx)
 6de:	eb db                	jmp    6bb <free+0x3e>
    p->s.size += bp->s.size;
 6e0:	03 53 fc             	add    -0x4(%ebx),%edx
 6e3:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6e6:	8b 53 f8             	mov    -0x8(%ebx),%edx
 6e9:	89 10                	mov    %edx,(%eax)
 6eb:	eb da                	jmp    6c7 <free+0x4a>

000006ed <morecore>:

static Header*
morecore(uint nu)
{
 6ed:	55                   	push   %ebp
 6ee:	89 e5                	mov    %esp,%ebp
 6f0:	53                   	push   %ebx
 6f1:	83 ec 04             	sub    $0x4,%esp
 6f4:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 6f6:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 6fb:	77 05                	ja     702 <morecore+0x15>
    nu = 4096;
 6fd:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 702:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 709:	83 ec 0c             	sub    $0xc,%esp
 70c:	50                   	push   %eax
 70d:	e8 38 fd ff ff       	call   44a <sbrk>
  if(p == (char*)-1)
 712:	83 c4 10             	add    $0x10,%esp
 715:	83 f8 ff             	cmp    $0xffffffff,%eax
 718:	74 1c                	je     736 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 71a:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 71d:	83 c0 08             	add    $0x8,%eax
 720:	83 ec 0c             	sub    $0xc,%esp
 723:	50                   	push   %eax
 724:	e8 54 ff ff ff       	call   67d <free>
  return freep;
 729:	a1 20 0c 00 00       	mov    0xc20,%eax
 72e:	83 c4 10             	add    $0x10,%esp
}
 731:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 734:	c9                   	leave  
 735:	c3                   	ret    
    return 0;
 736:	b8 00 00 00 00       	mov    $0x0,%eax
 73b:	eb f4                	jmp    731 <morecore+0x44>

0000073d <malloc>:

void*
malloc(uint nbytes)
{
 73d:	55                   	push   %ebp
 73e:	89 e5                	mov    %esp,%ebp
 740:	53                   	push   %ebx
 741:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 744:	8b 45 08             	mov    0x8(%ebp),%eax
 747:	8d 58 07             	lea    0x7(%eax),%ebx
 74a:	c1 eb 03             	shr    $0x3,%ebx
 74d:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 750:	8b 0d 20 0c 00 00    	mov    0xc20,%ecx
 756:	85 c9                	test   %ecx,%ecx
 758:	74 04                	je     75e <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 75a:	8b 01                	mov    (%ecx),%eax
 75c:	eb 4a                	jmp    7a8 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 75e:	c7 05 20 0c 00 00 24 	movl   $0xc24,0xc20
 765:	0c 00 00 
 768:	c7 05 24 0c 00 00 24 	movl   $0xc24,0xc24
 76f:	0c 00 00 
    base.s.size = 0;
 772:	c7 05 28 0c 00 00 00 	movl   $0x0,0xc28
 779:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 77c:	b9 24 0c 00 00       	mov    $0xc24,%ecx
 781:	eb d7                	jmp    75a <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 783:	74 19                	je     79e <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 785:	29 da                	sub    %ebx,%edx
 787:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 78a:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 78d:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 790:	89 0d 20 0c 00 00    	mov    %ecx,0xc20
      return (void*)(p + 1);
 796:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 799:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 79c:	c9                   	leave  
 79d:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 79e:	8b 10                	mov    (%eax),%edx
 7a0:	89 11                	mov    %edx,(%ecx)
 7a2:	eb ec                	jmp    790 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7a4:	89 c1                	mov    %eax,%ecx
 7a6:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 7a8:	8b 50 04             	mov    0x4(%eax),%edx
 7ab:	39 da                	cmp    %ebx,%edx
 7ad:	73 d4                	jae    783 <malloc+0x46>
    if(p == freep)
 7af:	39 05 20 0c 00 00    	cmp    %eax,0xc20
 7b5:	75 ed                	jne    7a4 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 7b7:	89 d8                	mov    %ebx,%eax
 7b9:	e8 2f ff ff ff       	call   6ed <morecore>
 7be:	85 c0                	test   %eax,%eax
 7c0:	75 e2                	jne    7a4 <malloc+0x67>
 7c2:	eb d5                	jmp    799 <malloc+0x5c>
