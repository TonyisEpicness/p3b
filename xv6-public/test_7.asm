
_test_7:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
   exit(); \
}

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
   e:	83 ec 14             	sub    $0x14,%esp
   ppid = getpid();
  11:	e8 9f 03 00 00       	call   3b5 <getpid>
  16:	a3 50 0b 00 00       	mov    %eax,0xb50

   int fork_pid = fork();
  1b:	e8 0d 03 00 00       	call   32d <fork>
   if(fork_pid == 0) {
  20:	85 c0                	test   %eax,%eax
  22:	74 63                	je     87 <main+0x87>
     exit();
   }
   assert(fork_pid > 0);
  24:	7e 66                	jle    8c <main+0x8c>

   void *join_stack;
   int join_pid = join(&join_stack);
  26:	83 ec 0c             	sub    $0xc,%esp
  29:	8d 45 f4             	lea    -0xc(%ebp),%eax
  2c:	50                   	push   %eax
  2d:	e8 ab 03 00 00       	call   3dd <join>
   assert(join_pid == -1);
  32:	83 c4 10             	add    $0x10,%esp
  35:	83 f8 ff             	cmp    $0xffffffff,%eax
  38:	0f 84 97 00 00 00    	je     d5 <main+0xd5>
  3e:	6a 22                	push   $0x22
  40:	68 38 07 00 00       	push   $0x738
  45:	68 41 07 00 00       	push   $0x741
  4a:	6a 01                	push   $0x1
  4c:	e8 39 04 00 00       	call   48a <printf>
  51:	83 c4 0c             	add    $0xc,%esp
  54:	68 77 07 00 00       	push   $0x777
  59:	68 56 07 00 00       	push   $0x756
  5e:	6a 01                	push   $0x1
  60:	e8 25 04 00 00       	call   48a <printf>
  65:	83 c4 08             	add    $0x8,%esp
  68:	68 6a 07 00 00       	push   $0x76a
  6d:	6a 01                	push   $0x1
  6f:	e8 16 04 00 00       	call   48a <printf>
  74:	83 c4 04             	add    $0x4,%esp
  77:	ff 35 50 0b 00 00    	push   0xb50
  7d:	e8 e3 02 00 00       	call   365 <kill>
  82:	e8 ae 02 00 00       	call   335 <exit>
     exit();
  87:	e8 a9 02 00 00       	call   335 <exit>
   assert(fork_pid > 0);
  8c:	6a 1e                	push   $0x1e
  8e:	68 38 07 00 00       	push   $0x738
  93:	68 41 07 00 00       	push   $0x741
  98:	6a 01                	push   $0x1
  9a:	e8 eb 03 00 00       	call   48a <printf>
  9f:	83 c4 0c             	add    $0xc,%esp
  a2:	68 49 07 00 00       	push   $0x749
  a7:	68 56 07 00 00       	push   $0x756
  ac:	6a 01                	push   $0x1
  ae:	e8 d7 03 00 00       	call   48a <printf>
  b3:	83 c4 08             	add    $0x8,%esp
  b6:	68 6a 07 00 00       	push   $0x76a
  bb:	6a 01                	push   $0x1
  bd:	e8 c8 03 00 00       	call   48a <printf>
  c2:	83 c4 04             	add    $0x4,%esp
  c5:	ff 35 50 0b 00 00    	push   0xb50
  cb:	e8 95 02 00 00       	call   365 <kill>
  d0:	e8 60 02 00 00       	call   335 <exit>

   assert(wait() > 0);
  d5:	e8 63 02 00 00       	call   33d <wait>
  da:	85 c0                	test   %eax,%eax
  dc:	7e 14                	jle    f2 <main+0xf2>
   printf(1, "TEST PASSED\n");
  de:	83 ec 08             	sub    $0x8,%esp
  e1:	68 91 07 00 00       	push   $0x791
  e6:	6a 01                	push   $0x1
  e8:	e8 9d 03 00 00       	call   48a <printf>
   exit();
  ed:	e8 43 02 00 00       	call   335 <exit>
   assert(wait() > 0);
  f2:	6a 24                	push   $0x24
  f4:	68 38 07 00 00       	push   $0x738
  f9:	68 41 07 00 00       	push   $0x741
  fe:	6a 01                	push   $0x1
 100:	e8 85 03 00 00       	call   48a <printf>
 105:	83 c4 0c             	add    $0xc,%esp
 108:	68 86 07 00 00       	push   $0x786
 10d:	68 56 07 00 00       	push   $0x756
 112:	6a 01                	push   $0x1
 114:	e8 71 03 00 00       	call   48a <printf>
 119:	83 c4 08             	add    $0x8,%esp
 11c:	68 6a 07 00 00       	push   $0x76a
 121:	6a 01                	push   $0x1
 123:	e8 62 03 00 00       	call   48a <printf>
 128:	83 c4 04             	add    $0x4,%esp
 12b:	ff 35 50 0b 00 00    	push   0xb50
 131:	e8 2f 02 00 00       	call   365 <kill>
 136:	e8 fa 01 00 00       	call   335 <exit>

0000013b <test_and_set>:
#include "fcntl.h"
#include "user.h"
#include "x86.h"
#include "mmu.h"

int test_and_set(int *old_ptr, int new_ptr) {
 13b:	55                   	push   %ebp
 13c:	89 e5                	mov    %esp,%ebp
 13e:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *old_ptr;
 141:	8b 10                	mov    (%eax),%edx
  *old_ptr = new_ptr;
 143:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 146:	89 08                	mov    %ecx,(%eax)
  return old;
}
 148:	89 d0                	mov    %edx,%eax
 14a:	5d                   	pop    %ebp
 14b:	c3                   	ret    

0000014c <thread_create>:

  // I can't remember if there was something else to do here but I'm sure I'll find out


  return new_pid;
}
 14c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 151:	c3                   	ret    

00000152 <thread_join>:

int thread_join() {
  return 0;
}
 152:	b8 00 00 00 00       	mov    $0x0,%eax
 157:	c3                   	ret    

00000158 <lock_acquire>:

void lock_acquire(lock_t *lock){
 158:	55                   	push   %ebp
 159:	89 e5                	mov    %esp,%ebp
 15b:	53                   	push   %ebx
 15c:	83 ec 04             	sub    $0x4,%esp
 15f:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 162:	83 ec 08             	sub    $0x8,%esp
 165:	6a 01                	push   $0x1
 167:	53                   	push   %ebx
 168:	e8 ce ff ff ff       	call   13b <test_and_set>
 16d:	83 c4 10             	add    $0x10,%esp
 170:	83 f8 01             	cmp    $0x1,%eax
 173:	74 ed                	je     162 <lock_acquire+0xa>
    ;
}
 175:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 178:	c9                   	leave  
 179:	c3                   	ret    

0000017a <lock_release>:

void lock_release(lock_t *lock) {
 17a:	55                   	push   %ebp
 17b:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 17d:	8b 45 08             	mov    0x8(%ebp),%eax
 180:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 186:	5d                   	pop    %ebp
 187:	c3                   	ret    

00000188 <lock_init>:

void lock_init(lock_t *lock) {
 188:	55                   	push   %ebp
 189:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 18b:	8b 45 08             	mov    0x8(%ebp),%eax
 18e:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 194:	5d                   	pop    %ebp
 195:	c3                   	ret    

00000196 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 196:	55                   	push   %ebp
 197:	89 e5                	mov    %esp,%ebp
 199:	56                   	push   %esi
 19a:	53                   	push   %ebx
 19b:	8b 75 08             	mov    0x8(%ebp),%esi
 19e:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 1a1:	89 f0                	mov    %esi,%eax
 1a3:	89 d1                	mov    %edx,%ecx
 1a5:	83 c2 01             	add    $0x1,%edx
 1a8:	89 c3                	mov    %eax,%ebx
 1aa:	83 c0 01             	add    $0x1,%eax
 1ad:	0f b6 09             	movzbl (%ecx),%ecx
 1b0:	88 0b                	mov    %cl,(%ebx)
 1b2:	84 c9                	test   %cl,%cl
 1b4:	75 ed                	jne    1a3 <strcpy+0xd>
    ;
  return os;
}
 1b6:	89 f0                	mov    %esi,%eax
 1b8:	5b                   	pop    %ebx
 1b9:	5e                   	pop    %esi
 1ba:	5d                   	pop    %ebp
 1bb:	c3                   	ret    

000001bc <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1bc:	55                   	push   %ebp
 1bd:	89 e5                	mov    %esp,%ebp
 1bf:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1c2:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 1c5:	eb 06                	jmp    1cd <strcmp+0x11>
    p++, q++;
 1c7:	83 c1 01             	add    $0x1,%ecx
 1ca:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 1cd:	0f b6 01             	movzbl (%ecx),%eax
 1d0:	84 c0                	test   %al,%al
 1d2:	74 04                	je     1d8 <strcmp+0x1c>
 1d4:	3a 02                	cmp    (%edx),%al
 1d6:	74 ef                	je     1c7 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 1d8:	0f b6 c0             	movzbl %al,%eax
 1db:	0f b6 12             	movzbl (%edx),%edx
 1de:	29 d0                	sub    %edx,%eax
}
 1e0:	5d                   	pop    %ebp
 1e1:	c3                   	ret    

000001e2 <strlen>:

uint
strlen(const char *s)
{
 1e2:	55                   	push   %ebp
 1e3:	89 e5                	mov    %esp,%ebp
 1e5:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 1e8:	b8 00 00 00 00       	mov    $0x0,%eax
 1ed:	eb 03                	jmp    1f2 <strlen+0x10>
 1ef:	83 c0 01             	add    $0x1,%eax
 1f2:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 1f6:	75 f7                	jne    1ef <strlen+0xd>
    ;
  return n;
}
 1f8:	5d                   	pop    %ebp
 1f9:	c3                   	ret    

000001fa <memset>:

void*
memset(void *dst, int c, uint n)
{
 1fa:	55                   	push   %ebp
 1fb:	89 e5                	mov    %esp,%ebp
 1fd:	57                   	push   %edi
 1fe:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 201:	89 d7                	mov    %edx,%edi
 203:	8b 4d 10             	mov    0x10(%ebp),%ecx
 206:	8b 45 0c             	mov    0xc(%ebp),%eax
 209:	fc                   	cld    
 20a:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 20c:	89 d0                	mov    %edx,%eax
 20e:	8b 7d fc             	mov    -0x4(%ebp),%edi
 211:	c9                   	leave  
 212:	c3                   	ret    

00000213 <strchr>:

char*
strchr(const char *s, char c)
{
 213:	55                   	push   %ebp
 214:	89 e5                	mov    %esp,%ebp
 216:	8b 45 08             	mov    0x8(%ebp),%eax
 219:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 21d:	eb 03                	jmp    222 <strchr+0xf>
 21f:	83 c0 01             	add    $0x1,%eax
 222:	0f b6 10             	movzbl (%eax),%edx
 225:	84 d2                	test   %dl,%dl
 227:	74 06                	je     22f <strchr+0x1c>
    if(*s == c)
 229:	38 ca                	cmp    %cl,%dl
 22b:	75 f2                	jne    21f <strchr+0xc>
 22d:	eb 05                	jmp    234 <strchr+0x21>
      return (char*)s;
  return 0;
 22f:	b8 00 00 00 00       	mov    $0x0,%eax
}
 234:	5d                   	pop    %ebp
 235:	c3                   	ret    

00000236 <gets>:

char*
gets(char *buf, int max)
{
 236:	55                   	push   %ebp
 237:	89 e5                	mov    %esp,%ebp
 239:	57                   	push   %edi
 23a:	56                   	push   %esi
 23b:	53                   	push   %ebx
 23c:	83 ec 1c             	sub    $0x1c,%esp
 23f:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 242:	bb 00 00 00 00       	mov    $0x0,%ebx
 247:	89 de                	mov    %ebx,%esi
 249:	83 c3 01             	add    $0x1,%ebx
 24c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 24f:	7d 2e                	jge    27f <gets+0x49>
    cc = read(0, &c, 1);
 251:	83 ec 04             	sub    $0x4,%esp
 254:	6a 01                	push   $0x1
 256:	8d 45 e7             	lea    -0x19(%ebp),%eax
 259:	50                   	push   %eax
 25a:	6a 00                	push   $0x0
 25c:	e8 ec 00 00 00       	call   34d <read>
    if(cc < 1)
 261:	83 c4 10             	add    $0x10,%esp
 264:	85 c0                	test   %eax,%eax
 266:	7e 17                	jle    27f <gets+0x49>
      break;
    buf[i++] = c;
 268:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 26c:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 26f:	3c 0a                	cmp    $0xa,%al
 271:	0f 94 c2             	sete   %dl
 274:	3c 0d                	cmp    $0xd,%al
 276:	0f 94 c0             	sete   %al
 279:	08 c2                	or     %al,%dl
 27b:	74 ca                	je     247 <gets+0x11>
    buf[i++] = c;
 27d:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 27f:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 283:	89 f8                	mov    %edi,%eax
 285:	8d 65 f4             	lea    -0xc(%ebp),%esp
 288:	5b                   	pop    %ebx
 289:	5e                   	pop    %esi
 28a:	5f                   	pop    %edi
 28b:	5d                   	pop    %ebp
 28c:	c3                   	ret    

0000028d <stat>:

int
stat(const char *n, struct stat *st)
{
 28d:	55                   	push   %ebp
 28e:	89 e5                	mov    %esp,%ebp
 290:	56                   	push   %esi
 291:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 292:	83 ec 08             	sub    $0x8,%esp
 295:	6a 00                	push   $0x0
 297:	ff 75 08             	push   0x8(%ebp)
 29a:	e8 d6 00 00 00       	call   375 <open>
  if(fd < 0)
 29f:	83 c4 10             	add    $0x10,%esp
 2a2:	85 c0                	test   %eax,%eax
 2a4:	78 24                	js     2ca <stat+0x3d>
 2a6:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 2a8:	83 ec 08             	sub    $0x8,%esp
 2ab:	ff 75 0c             	push   0xc(%ebp)
 2ae:	50                   	push   %eax
 2af:	e8 d9 00 00 00       	call   38d <fstat>
 2b4:	89 c6                	mov    %eax,%esi
  close(fd);
 2b6:	89 1c 24             	mov    %ebx,(%esp)
 2b9:	e8 9f 00 00 00       	call   35d <close>
  return r;
 2be:	83 c4 10             	add    $0x10,%esp
}
 2c1:	89 f0                	mov    %esi,%eax
 2c3:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2c6:	5b                   	pop    %ebx
 2c7:	5e                   	pop    %esi
 2c8:	5d                   	pop    %ebp
 2c9:	c3                   	ret    
    return -1;
 2ca:	be ff ff ff ff       	mov    $0xffffffff,%esi
 2cf:	eb f0                	jmp    2c1 <stat+0x34>

000002d1 <atoi>:

int
atoi(const char *s)
{
 2d1:	55                   	push   %ebp
 2d2:	89 e5                	mov    %esp,%ebp
 2d4:	53                   	push   %ebx
 2d5:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 2d8:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 2dd:	eb 10                	jmp    2ef <atoi+0x1e>
    n = n*10 + *s++ - '0';
 2df:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 2e2:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 2e5:	83 c1 01             	add    $0x1,%ecx
 2e8:	0f be c0             	movsbl %al,%eax
 2eb:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 2ef:	0f b6 01             	movzbl (%ecx),%eax
 2f2:	8d 58 d0             	lea    -0x30(%eax),%ebx
 2f5:	80 fb 09             	cmp    $0x9,%bl
 2f8:	76 e5                	jbe    2df <atoi+0xe>
  return n;
}
 2fa:	89 d0                	mov    %edx,%eax
 2fc:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2ff:	c9                   	leave  
 300:	c3                   	ret    

00000301 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 301:	55                   	push   %ebp
 302:	89 e5                	mov    %esp,%ebp
 304:	56                   	push   %esi
 305:	53                   	push   %ebx
 306:	8b 75 08             	mov    0x8(%ebp),%esi
 309:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 30c:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 30f:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 311:	eb 0d                	jmp    320 <memmove+0x1f>
    *dst++ = *src++;
 313:	0f b6 01             	movzbl (%ecx),%eax
 316:	88 02                	mov    %al,(%edx)
 318:	8d 49 01             	lea    0x1(%ecx),%ecx
 31b:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 31e:	89 d8                	mov    %ebx,%eax
 320:	8d 58 ff             	lea    -0x1(%eax),%ebx
 323:	85 c0                	test   %eax,%eax
 325:	7f ec                	jg     313 <memmove+0x12>
  return vdst;
}
 327:	89 f0                	mov    %esi,%eax
 329:	5b                   	pop    %ebx
 32a:	5e                   	pop    %esi
 32b:	5d                   	pop    %ebp
 32c:	c3                   	ret    

0000032d <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 32d:	b8 01 00 00 00       	mov    $0x1,%eax
 332:	cd 40                	int    $0x40
 334:	c3                   	ret    

00000335 <exit>:
SYSCALL(exit)
 335:	b8 02 00 00 00       	mov    $0x2,%eax
 33a:	cd 40                	int    $0x40
 33c:	c3                   	ret    

0000033d <wait>:
SYSCALL(wait)
 33d:	b8 03 00 00 00       	mov    $0x3,%eax
 342:	cd 40                	int    $0x40
 344:	c3                   	ret    

00000345 <pipe>:
SYSCALL(pipe)
 345:	b8 04 00 00 00       	mov    $0x4,%eax
 34a:	cd 40                	int    $0x40
 34c:	c3                   	ret    

0000034d <read>:
SYSCALL(read)
 34d:	b8 05 00 00 00       	mov    $0x5,%eax
 352:	cd 40                	int    $0x40
 354:	c3                   	ret    

00000355 <write>:
SYSCALL(write)
 355:	b8 10 00 00 00       	mov    $0x10,%eax
 35a:	cd 40                	int    $0x40
 35c:	c3                   	ret    

0000035d <close>:
SYSCALL(close)
 35d:	b8 15 00 00 00       	mov    $0x15,%eax
 362:	cd 40                	int    $0x40
 364:	c3                   	ret    

00000365 <kill>:
SYSCALL(kill)
 365:	b8 06 00 00 00       	mov    $0x6,%eax
 36a:	cd 40                	int    $0x40
 36c:	c3                   	ret    

0000036d <exec>:
SYSCALL(exec)
 36d:	b8 07 00 00 00       	mov    $0x7,%eax
 372:	cd 40                	int    $0x40
 374:	c3                   	ret    

00000375 <open>:
SYSCALL(open)
 375:	b8 0f 00 00 00       	mov    $0xf,%eax
 37a:	cd 40                	int    $0x40
 37c:	c3                   	ret    

0000037d <mknod>:
SYSCALL(mknod)
 37d:	b8 11 00 00 00       	mov    $0x11,%eax
 382:	cd 40                	int    $0x40
 384:	c3                   	ret    

00000385 <unlink>:
SYSCALL(unlink)
 385:	b8 12 00 00 00       	mov    $0x12,%eax
 38a:	cd 40                	int    $0x40
 38c:	c3                   	ret    

0000038d <fstat>:
SYSCALL(fstat)
 38d:	b8 08 00 00 00       	mov    $0x8,%eax
 392:	cd 40                	int    $0x40
 394:	c3                   	ret    

00000395 <link>:
SYSCALL(link)
 395:	b8 13 00 00 00       	mov    $0x13,%eax
 39a:	cd 40                	int    $0x40
 39c:	c3                   	ret    

0000039d <mkdir>:
SYSCALL(mkdir)
 39d:	b8 14 00 00 00       	mov    $0x14,%eax
 3a2:	cd 40                	int    $0x40
 3a4:	c3                   	ret    

000003a5 <chdir>:
SYSCALL(chdir)
 3a5:	b8 09 00 00 00       	mov    $0x9,%eax
 3aa:	cd 40                	int    $0x40
 3ac:	c3                   	ret    

000003ad <dup>:
SYSCALL(dup)
 3ad:	b8 0a 00 00 00       	mov    $0xa,%eax
 3b2:	cd 40                	int    $0x40
 3b4:	c3                   	ret    

000003b5 <getpid>:
SYSCALL(getpid)
 3b5:	b8 0b 00 00 00       	mov    $0xb,%eax
 3ba:	cd 40                	int    $0x40
 3bc:	c3                   	ret    

000003bd <sbrk>:
SYSCALL(sbrk)
 3bd:	b8 0c 00 00 00       	mov    $0xc,%eax
 3c2:	cd 40                	int    $0x40
 3c4:	c3                   	ret    

000003c5 <sleep>:
SYSCALL(sleep)
 3c5:	b8 0d 00 00 00       	mov    $0xd,%eax
 3ca:	cd 40                	int    $0x40
 3cc:	c3                   	ret    

000003cd <uptime>:
SYSCALL(uptime)
 3cd:	b8 0e 00 00 00       	mov    $0xe,%eax
 3d2:	cd 40                	int    $0x40
 3d4:	c3                   	ret    

000003d5 <clone>:
SYSCALL(clone)
 3d5:	b8 16 00 00 00       	mov    $0x16,%eax
 3da:	cd 40                	int    $0x40
 3dc:	c3                   	ret    

000003dd <join>:
 3dd:	b8 17 00 00 00       	mov    $0x17,%eax
 3e2:	cd 40                	int    $0x40
 3e4:	c3                   	ret    

000003e5 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 3e5:	55                   	push   %ebp
 3e6:	89 e5                	mov    %esp,%ebp
 3e8:	83 ec 1c             	sub    $0x1c,%esp
 3eb:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 3ee:	6a 01                	push   $0x1
 3f0:	8d 55 f4             	lea    -0xc(%ebp),%edx
 3f3:	52                   	push   %edx
 3f4:	50                   	push   %eax
 3f5:	e8 5b ff ff ff       	call   355 <write>
}
 3fa:	83 c4 10             	add    $0x10,%esp
 3fd:	c9                   	leave  
 3fe:	c3                   	ret    

000003ff <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 3ff:	55                   	push   %ebp
 400:	89 e5                	mov    %esp,%ebp
 402:	57                   	push   %edi
 403:	56                   	push   %esi
 404:	53                   	push   %ebx
 405:	83 ec 2c             	sub    $0x2c,%esp
 408:	89 45 d0             	mov    %eax,-0x30(%ebp)
 40b:	89 d0                	mov    %edx,%eax
 40d:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 40f:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 413:	0f 95 c1             	setne  %cl
 416:	c1 ea 1f             	shr    $0x1f,%edx
 419:	84 d1                	test   %dl,%cl
 41b:	74 44                	je     461 <printint+0x62>
    neg = 1;
    x = -xx;
 41d:	f7 d8                	neg    %eax
 41f:	89 c1                	mov    %eax,%ecx
    neg = 1;
 421:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 428:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 42d:	89 c8                	mov    %ecx,%eax
 42f:	ba 00 00 00 00       	mov    $0x0,%edx
 434:	f7 f6                	div    %esi
 436:	89 df                	mov    %ebx,%edi
 438:	83 c3 01             	add    $0x1,%ebx
 43b:	0f b6 92 00 08 00 00 	movzbl 0x800(%edx),%edx
 442:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 446:	89 ca                	mov    %ecx,%edx
 448:	89 c1                	mov    %eax,%ecx
 44a:	39 d6                	cmp    %edx,%esi
 44c:	76 df                	jbe    42d <printint+0x2e>
  if(neg)
 44e:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 452:	74 31                	je     485 <printint+0x86>
    buf[i++] = '-';
 454:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 459:	8d 5f 02             	lea    0x2(%edi),%ebx
 45c:	8b 75 d0             	mov    -0x30(%ebp),%esi
 45f:	eb 17                	jmp    478 <printint+0x79>
    x = xx;
 461:	89 c1                	mov    %eax,%ecx
  neg = 0;
 463:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 46a:	eb bc                	jmp    428 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 46c:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 471:	89 f0                	mov    %esi,%eax
 473:	e8 6d ff ff ff       	call   3e5 <putc>
  while(--i >= 0)
 478:	83 eb 01             	sub    $0x1,%ebx
 47b:	79 ef                	jns    46c <printint+0x6d>
}
 47d:	83 c4 2c             	add    $0x2c,%esp
 480:	5b                   	pop    %ebx
 481:	5e                   	pop    %esi
 482:	5f                   	pop    %edi
 483:	5d                   	pop    %ebp
 484:	c3                   	ret    
 485:	8b 75 d0             	mov    -0x30(%ebp),%esi
 488:	eb ee                	jmp    478 <printint+0x79>

0000048a <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 48a:	55                   	push   %ebp
 48b:	89 e5                	mov    %esp,%ebp
 48d:	57                   	push   %edi
 48e:	56                   	push   %esi
 48f:	53                   	push   %ebx
 490:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 493:	8d 45 10             	lea    0x10(%ebp),%eax
 496:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 499:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 49e:	bb 00 00 00 00       	mov    $0x0,%ebx
 4a3:	eb 14                	jmp    4b9 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 4a5:	89 fa                	mov    %edi,%edx
 4a7:	8b 45 08             	mov    0x8(%ebp),%eax
 4aa:	e8 36 ff ff ff       	call   3e5 <putc>
 4af:	eb 05                	jmp    4b6 <printf+0x2c>
      }
    } else if(state == '%'){
 4b1:	83 fe 25             	cmp    $0x25,%esi
 4b4:	74 25                	je     4db <printf+0x51>
  for(i = 0; fmt[i]; i++){
 4b6:	83 c3 01             	add    $0x1,%ebx
 4b9:	8b 45 0c             	mov    0xc(%ebp),%eax
 4bc:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 4c0:	84 c0                	test   %al,%al
 4c2:	0f 84 20 01 00 00    	je     5e8 <printf+0x15e>
    c = fmt[i] & 0xff;
 4c8:	0f be f8             	movsbl %al,%edi
 4cb:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 4ce:	85 f6                	test   %esi,%esi
 4d0:	75 df                	jne    4b1 <printf+0x27>
      if(c == '%'){
 4d2:	83 f8 25             	cmp    $0x25,%eax
 4d5:	75 ce                	jne    4a5 <printf+0x1b>
        state = '%';
 4d7:	89 c6                	mov    %eax,%esi
 4d9:	eb db                	jmp    4b6 <printf+0x2c>
      if(c == 'd'){
 4db:	83 f8 25             	cmp    $0x25,%eax
 4de:	0f 84 cf 00 00 00    	je     5b3 <printf+0x129>
 4e4:	0f 8c dd 00 00 00    	jl     5c7 <printf+0x13d>
 4ea:	83 f8 78             	cmp    $0x78,%eax
 4ed:	0f 8f d4 00 00 00    	jg     5c7 <printf+0x13d>
 4f3:	83 f8 63             	cmp    $0x63,%eax
 4f6:	0f 8c cb 00 00 00    	jl     5c7 <printf+0x13d>
 4fc:	83 e8 63             	sub    $0x63,%eax
 4ff:	83 f8 15             	cmp    $0x15,%eax
 502:	0f 87 bf 00 00 00    	ja     5c7 <printf+0x13d>
 508:	ff 24 85 a8 07 00 00 	jmp    *0x7a8(,%eax,4)
        printint(fd, *ap, 10, 1);
 50f:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 512:	8b 17                	mov    (%edi),%edx
 514:	83 ec 0c             	sub    $0xc,%esp
 517:	6a 01                	push   $0x1
 519:	b9 0a 00 00 00       	mov    $0xa,%ecx
 51e:	8b 45 08             	mov    0x8(%ebp),%eax
 521:	e8 d9 fe ff ff       	call   3ff <printint>
        ap++;
 526:	83 c7 04             	add    $0x4,%edi
 529:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 52c:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 52f:	be 00 00 00 00       	mov    $0x0,%esi
 534:	eb 80                	jmp    4b6 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 536:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 539:	8b 17                	mov    (%edi),%edx
 53b:	83 ec 0c             	sub    $0xc,%esp
 53e:	6a 00                	push   $0x0
 540:	b9 10 00 00 00       	mov    $0x10,%ecx
 545:	8b 45 08             	mov    0x8(%ebp),%eax
 548:	e8 b2 fe ff ff       	call   3ff <printint>
        ap++;
 54d:	83 c7 04             	add    $0x4,%edi
 550:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 553:	83 c4 10             	add    $0x10,%esp
      state = 0;
 556:	be 00 00 00 00       	mov    $0x0,%esi
 55b:	e9 56 ff ff ff       	jmp    4b6 <printf+0x2c>
        s = (char*)*ap;
 560:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 563:	8b 30                	mov    (%eax),%esi
        ap++;
 565:	83 c0 04             	add    $0x4,%eax
 568:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 56b:	85 f6                	test   %esi,%esi
 56d:	75 15                	jne    584 <printf+0xfa>
          s = "(null)";
 56f:	be 9e 07 00 00       	mov    $0x79e,%esi
 574:	eb 0e                	jmp    584 <printf+0xfa>
          putc(fd, *s);
 576:	0f be d2             	movsbl %dl,%edx
 579:	8b 45 08             	mov    0x8(%ebp),%eax
 57c:	e8 64 fe ff ff       	call   3e5 <putc>
          s++;
 581:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 584:	0f b6 16             	movzbl (%esi),%edx
 587:	84 d2                	test   %dl,%dl
 589:	75 eb                	jne    576 <printf+0xec>
      state = 0;
 58b:	be 00 00 00 00       	mov    $0x0,%esi
 590:	e9 21 ff ff ff       	jmp    4b6 <printf+0x2c>
        putc(fd, *ap);
 595:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 598:	0f be 17             	movsbl (%edi),%edx
 59b:	8b 45 08             	mov    0x8(%ebp),%eax
 59e:	e8 42 fe ff ff       	call   3e5 <putc>
        ap++;
 5a3:	83 c7 04             	add    $0x4,%edi
 5a6:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 5a9:	be 00 00 00 00       	mov    $0x0,%esi
 5ae:	e9 03 ff ff ff       	jmp    4b6 <printf+0x2c>
        putc(fd, c);
 5b3:	89 fa                	mov    %edi,%edx
 5b5:	8b 45 08             	mov    0x8(%ebp),%eax
 5b8:	e8 28 fe ff ff       	call   3e5 <putc>
      state = 0;
 5bd:	be 00 00 00 00       	mov    $0x0,%esi
 5c2:	e9 ef fe ff ff       	jmp    4b6 <printf+0x2c>
        putc(fd, '%');
 5c7:	ba 25 00 00 00       	mov    $0x25,%edx
 5cc:	8b 45 08             	mov    0x8(%ebp),%eax
 5cf:	e8 11 fe ff ff       	call   3e5 <putc>
        putc(fd, c);
 5d4:	89 fa                	mov    %edi,%edx
 5d6:	8b 45 08             	mov    0x8(%ebp),%eax
 5d9:	e8 07 fe ff ff       	call   3e5 <putc>
      state = 0;
 5de:	be 00 00 00 00       	mov    $0x0,%esi
 5e3:	e9 ce fe ff ff       	jmp    4b6 <printf+0x2c>
    }
  }
}
 5e8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5eb:	5b                   	pop    %ebx
 5ec:	5e                   	pop    %esi
 5ed:	5f                   	pop    %edi
 5ee:	5d                   	pop    %ebp
 5ef:	c3                   	ret    

000005f0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5f0:	55                   	push   %ebp
 5f1:	89 e5                	mov    %esp,%ebp
 5f3:	57                   	push   %edi
 5f4:	56                   	push   %esi
 5f5:	53                   	push   %ebx
 5f6:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 5f9:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5fc:	a1 54 0b 00 00       	mov    0xb54,%eax
 601:	eb 02                	jmp    605 <free+0x15>
 603:	89 d0                	mov    %edx,%eax
 605:	39 c8                	cmp    %ecx,%eax
 607:	73 04                	jae    60d <free+0x1d>
 609:	39 08                	cmp    %ecx,(%eax)
 60b:	77 12                	ja     61f <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 60d:	8b 10                	mov    (%eax),%edx
 60f:	39 c2                	cmp    %eax,%edx
 611:	77 f0                	ja     603 <free+0x13>
 613:	39 c8                	cmp    %ecx,%eax
 615:	72 08                	jb     61f <free+0x2f>
 617:	39 ca                	cmp    %ecx,%edx
 619:	77 04                	ja     61f <free+0x2f>
 61b:	89 d0                	mov    %edx,%eax
 61d:	eb e6                	jmp    605 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 61f:	8b 73 fc             	mov    -0x4(%ebx),%esi
 622:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 625:	8b 10                	mov    (%eax),%edx
 627:	39 d7                	cmp    %edx,%edi
 629:	74 19                	je     644 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 62b:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 62e:	8b 50 04             	mov    0x4(%eax),%edx
 631:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 634:	39 ce                	cmp    %ecx,%esi
 636:	74 1b                	je     653 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 638:	89 08                	mov    %ecx,(%eax)
  freep = p;
 63a:	a3 54 0b 00 00       	mov    %eax,0xb54
}
 63f:	5b                   	pop    %ebx
 640:	5e                   	pop    %esi
 641:	5f                   	pop    %edi
 642:	5d                   	pop    %ebp
 643:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 644:	03 72 04             	add    0x4(%edx),%esi
 647:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 64a:	8b 10                	mov    (%eax),%edx
 64c:	8b 12                	mov    (%edx),%edx
 64e:	89 53 f8             	mov    %edx,-0x8(%ebx)
 651:	eb db                	jmp    62e <free+0x3e>
    p->s.size += bp->s.size;
 653:	03 53 fc             	add    -0x4(%ebx),%edx
 656:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 659:	8b 53 f8             	mov    -0x8(%ebx),%edx
 65c:	89 10                	mov    %edx,(%eax)
 65e:	eb da                	jmp    63a <free+0x4a>

00000660 <morecore>:

static Header*
morecore(uint nu)
{
 660:	55                   	push   %ebp
 661:	89 e5                	mov    %esp,%ebp
 663:	53                   	push   %ebx
 664:	83 ec 04             	sub    $0x4,%esp
 667:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 669:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 66e:	77 05                	ja     675 <morecore+0x15>
    nu = 4096;
 670:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 675:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 67c:	83 ec 0c             	sub    $0xc,%esp
 67f:	50                   	push   %eax
 680:	e8 38 fd ff ff       	call   3bd <sbrk>
  if(p == (char*)-1)
 685:	83 c4 10             	add    $0x10,%esp
 688:	83 f8 ff             	cmp    $0xffffffff,%eax
 68b:	74 1c                	je     6a9 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 68d:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 690:	83 c0 08             	add    $0x8,%eax
 693:	83 ec 0c             	sub    $0xc,%esp
 696:	50                   	push   %eax
 697:	e8 54 ff ff ff       	call   5f0 <free>
  return freep;
 69c:	a1 54 0b 00 00       	mov    0xb54,%eax
 6a1:	83 c4 10             	add    $0x10,%esp
}
 6a4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 6a7:	c9                   	leave  
 6a8:	c3                   	ret    
    return 0;
 6a9:	b8 00 00 00 00       	mov    $0x0,%eax
 6ae:	eb f4                	jmp    6a4 <morecore+0x44>

000006b0 <malloc>:

void*
malloc(uint nbytes)
{
 6b0:	55                   	push   %ebp
 6b1:	89 e5                	mov    %esp,%ebp
 6b3:	53                   	push   %ebx
 6b4:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6b7:	8b 45 08             	mov    0x8(%ebp),%eax
 6ba:	8d 58 07             	lea    0x7(%eax),%ebx
 6bd:	c1 eb 03             	shr    $0x3,%ebx
 6c0:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 6c3:	8b 0d 54 0b 00 00    	mov    0xb54,%ecx
 6c9:	85 c9                	test   %ecx,%ecx
 6cb:	74 04                	je     6d1 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6cd:	8b 01                	mov    (%ecx),%eax
 6cf:	eb 4a                	jmp    71b <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 6d1:	c7 05 54 0b 00 00 58 	movl   $0xb58,0xb54
 6d8:	0b 00 00 
 6db:	c7 05 58 0b 00 00 58 	movl   $0xb58,0xb58
 6e2:	0b 00 00 
    base.s.size = 0;
 6e5:	c7 05 5c 0b 00 00 00 	movl   $0x0,0xb5c
 6ec:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 6ef:	b9 58 0b 00 00       	mov    $0xb58,%ecx
 6f4:	eb d7                	jmp    6cd <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 6f6:	74 19                	je     711 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 6f8:	29 da                	sub    %ebx,%edx
 6fa:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 6fd:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 700:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 703:	89 0d 54 0b 00 00    	mov    %ecx,0xb54
      return (void*)(p + 1);
 709:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 70c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 70f:	c9                   	leave  
 710:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 711:	8b 10                	mov    (%eax),%edx
 713:	89 11                	mov    %edx,(%ecx)
 715:	eb ec                	jmp    703 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 717:	89 c1                	mov    %eax,%ecx
 719:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 71b:	8b 50 04             	mov    0x4(%eax),%edx
 71e:	39 da                	cmp    %ebx,%edx
 720:	73 d4                	jae    6f6 <malloc+0x46>
    if(p == freep)
 722:	39 05 54 0b 00 00    	cmp    %eax,0xb54
 728:	75 ed                	jne    717 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 72a:	89 d8                	mov    %ebx,%eax
 72c:	e8 2f ff ff ff       	call   660 <morecore>
 731:	85 c0                	test   %eax,%eax
 733:	75 e2                	jne    717 <malloc+0x67>
 735:	eb d5                	jmp    70c <malloc+0x5c>
