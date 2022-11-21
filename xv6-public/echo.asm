
_echo:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
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
  11:	83 ec 08             	sub    $0x8,%esp
  14:	8b 31                	mov    (%ecx),%esi
  16:	8b 79 04             	mov    0x4(%ecx),%edi
  int i;

  for(i = 1; i < argc; i++)
  19:	b8 01 00 00 00       	mov    $0x1,%eax
  1e:	eb 1a                	jmp    3a <main+0x3a>
    printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
  20:	ba 52 06 00 00       	mov    $0x652,%edx
  25:	52                   	push   %edx
  26:	ff 34 87             	push   (%edi,%eax,4)
  29:	68 54 06 00 00       	push   $0x654
  2e:	6a 01                	push   $0x1
  30:	e8 6b 03 00 00       	call   3a0 <printf>
  35:	83 c4 10             	add    $0x10,%esp
  for(i = 1; i < argc; i++)
  38:	89 d8                	mov    %ebx,%eax
  3a:	39 f0                	cmp    %esi,%eax
  3c:	7d 0e                	jge    4c <main+0x4c>
    printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
  3e:	8d 58 01             	lea    0x1(%eax),%ebx
  41:	39 f3                	cmp    %esi,%ebx
  43:	7d db                	jge    20 <main+0x20>
  45:	ba 50 06 00 00       	mov    $0x650,%edx
  4a:	eb d9                	jmp    25 <main+0x25>
  exit();
  4c:	e8 fa 01 00 00       	call   24b <exit>

00000051 <test_and_set>:
#include "fcntl.h"
#include "user.h"
#include "x86.h"
#include "mmu.h"

int test_and_set(int *old_ptr, int new_ptr) {
  51:	55                   	push   %ebp
  52:	89 e5                	mov    %esp,%ebp
  54:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *old_ptr;
  57:	8b 10                	mov    (%eax),%edx
  *old_ptr = new_ptr;
  59:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  5c:	89 08                	mov    %ecx,(%eax)
  return old;
}
  5e:	89 d0                	mov    %edx,%eax
  60:	5d                   	pop    %ebp
  61:	c3                   	ret    

00000062 <thread_create>:

  // I can't remember if there was something else to do here but I'm sure I'll find out


  return new_pid;
}
  62:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  67:	c3                   	ret    

00000068 <thread_join>:

int thread_join() {
  return 0;
}
  68:	b8 00 00 00 00       	mov    $0x0,%eax
  6d:	c3                   	ret    

0000006e <lock_acquire>:

void lock_acquire(lock_t *lock){
  6e:	55                   	push   %ebp
  6f:	89 e5                	mov    %esp,%ebp
  71:	53                   	push   %ebx
  72:	83 ec 04             	sub    $0x4,%esp
  75:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
  78:	83 ec 08             	sub    $0x8,%esp
  7b:	6a 01                	push   $0x1
  7d:	53                   	push   %ebx
  7e:	e8 ce ff ff ff       	call   51 <test_and_set>
  83:	83 c4 10             	add    $0x10,%esp
  86:	83 f8 01             	cmp    $0x1,%eax
  89:	74 ed                	je     78 <lock_acquire+0xa>
    ;
}
  8b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  8e:	c9                   	leave  
  8f:	c3                   	ret    

00000090 <lock_release>:

void lock_release(lock_t *lock) {
  90:	55                   	push   %ebp
  91:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
  93:	8b 45 08             	mov    0x8(%ebp),%eax
  96:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
  9c:	5d                   	pop    %ebp
  9d:	c3                   	ret    

0000009e <lock_init>:

void lock_init(lock_t *lock) {
  9e:	55                   	push   %ebp
  9f:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
  a1:	8b 45 08             	mov    0x8(%ebp),%eax
  a4:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
  aa:	5d                   	pop    %ebp
  ab:	c3                   	ret    

000000ac <strcpy>:

char*
strcpy(char *s, const char *t)
{
  ac:	55                   	push   %ebp
  ad:	89 e5                	mov    %esp,%ebp
  af:	56                   	push   %esi
  b0:	53                   	push   %ebx
  b1:	8b 75 08             	mov    0x8(%ebp),%esi
  b4:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  b7:	89 f0                	mov    %esi,%eax
  b9:	89 d1                	mov    %edx,%ecx
  bb:	83 c2 01             	add    $0x1,%edx
  be:	89 c3                	mov    %eax,%ebx
  c0:	83 c0 01             	add    $0x1,%eax
  c3:	0f b6 09             	movzbl (%ecx),%ecx
  c6:	88 0b                	mov    %cl,(%ebx)
  c8:	84 c9                	test   %cl,%cl
  ca:	75 ed                	jne    b9 <strcpy+0xd>
    ;
  return os;
}
  cc:	89 f0                	mov    %esi,%eax
  ce:	5b                   	pop    %ebx
  cf:	5e                   	pop    %esi
  d0:	5d                   	pop    %ebp
  d1:	c3                   	ret    

000000d2 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  d2:	55                   	push   %ebp
  d3:	89 e5                	mov    %esp,%ebp
  d5:	8b 4d 08             	mov    0x8(%ebp),%ecx
  d8:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
  db:	eb 06                	jmp    e3 <strcmp+0x11>
    p++, q++;
  dd:	83 c1 01             	add    $0x1,%ecx
  e0:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
  e3:	0f b6 01             	movzbl (%ecx),%eax
  e6:	84 c0                	test   %al,%al
  e8:	74 04                	je     ee <strcmp+0x1c>
  ea:	3a 02                	cmp    (%edx),%al
  ec:	74 ef                	je     dd <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
  ee:	0f b6 c0             	movzbl %al,%eax
  f1:	0f b6 12             	movzbl (%edx),%edx
  f4:	29 d0                	sub    %edx,%eax
}
  f6:	5d                   	pop    %ebp
  f7:	c3                   	ret    

000000f8 <strlen>:

uint
strlen(const char *s)
{
  f8:	55                   	push   %ebp
  f9:	89 e5                	mov    %esp,%ebp
  fb:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
  fe:	b8 00 00 00 00       	mov    $0x0,%eax
 103:	eb 03                	jmp    108 <strlen+0x10>
 105:	83 c0 01             	add    $0x1,%eax
 108:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 10c:	75 f7                	jne    105 <strlen+0xd>
    ;
  return n;
}
 10e:	5d                   	pop    %ebp
 10f:	c3                   	ret    

00000110 <memset>:

void*
memset(void *dst, int c, uint n)
{
 110:	55                   	push   %ebp
 111:	89 e5                	mov    %esp,%ebp
 113:	57                   	push   %edi
 114:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 117:	89 d7                	mov    %edx,%edi
 119:	8b 4d 10             	mov    0x10(%ebp),%ecx
 11c:	8b 45 0c             	mov    0xc(%ebp),%eax
 11f:	fc                   	cld    
 120:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 122:	89 d0                	mov    %edx,%eax
 124:	8b 7d fc             	mov    -0x4(%ebp),%edi
 127:	c9                   	leave  
 128:	c3                   	ret    

00000129 <strchr>:

char*
strchr(const char *s, char c)
{
 129:	55                   	push   %ebp
 12a:	89 e5                	mov    %esp,%ebp
 12c:	8b 45 08             	mov    0x8(%ebp),%eax
 12f:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 133:	eb 03                	jmp    138 <strchr+0xf>
 135:	83 c0 01             	add    $0x1,%eax
 138:	0f b6 10             	movzbl (%eax),%edx
 13b:	84 d2                	test   %dl,%dl
 13d:	74 06                	je     145 <strchr+0x1c>
    if(*s == c)
 13f:	38 ca                	cmp    %cl,%dl
 141:	75 f2                	jne    135 <strchr+0xc>
 143:	eb 05                	jmp    14a <strchr+0x21>
      return (char*)s;
  return 0;
 145:	b8 00 00 00 00       	mov    $0x0,%eax
}
 14a:	5d                   	pop    %ebp
 14b:	c3                   	ret    

0000014c <gets>:

char*
gets(char *buf, int max)
{
 14c:	55                   	push   %ebp
 14d:	89 e5                	mov    %esp,%ebp
 14f:	57                   	push   %edi
 150:	56                   	push   %esi
 151:	53                   	push   %ebx
 152:	83 ec 1c             	sub    $0x1c,%esp
 155:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 158:	bb 00 00 00 00       	mov    $0x0,%ebx
 15d:	89 de                	mov    %ebx,%esi
 15f:	83 c3 01             	add    $0x1,%ebx
 162:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 165:	7d 2e                	jge    195 <gets+0x49>
    cc = read(0, &c, 1);
 167:	83 ec 04             	sub    $0x4,%esp
 16a:	6a 01                	push   $0x1
 16c:	8d 45 e7             	lea    -0x19(%ebp),%eax
 16f:	50                   	push   %eax
 170:	6a 00                	push   $0x0
 172:	e8 ec 00 00 00       	call   263 <read>
    if(cc < 1)
 177:	83 c4 10             	add    $0x10,%esp
 17a:	85 c0                	test   %eax,%eax
 17c:	7e 17                	jle    195 <gets+0x49>
      break;
    buf[i++] = c;
 17e:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 182:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 185:	3c 0a                	cmp    $0xa,%al
 187:	0f 94 c2             	sete   %dl
 18a:	3c 0d                	cmp    $0xd,%al
 18c:	0f 94 c0             	sete   %al
 18f:	08 c2                	or     %al,%dl
 191:	74 ca                	je     15d <gets+0x11>
    buf[i++] = c;
 193:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 195:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 199:	89 f8                	mov    %edi,%eax
 19b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 19e:	5b                   	pop    %ebx
 19f:	5e                   	pop    %esi
 1a0:	5f                   	pop    %edi
 1a1:	5d                   	pop    %ebp
 1a2:	c3                   	ret    

000001a3 <stat>:

int
stat(const char *n, struct stat *st)
{
 1a3:	55                   	push   %ebp
 1a4:	89 e5                	mov    %esp,%ebp
 1a6:	56                   	push   %esi
 1a7:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1a8:	83 ec 08             	sub    $0x8,%esp
 1ab:	6a 00                	push   $0x0
 1ad:	ff 75 08             	push   0x8(%ebp)
 1b0:	e8 d6 00 00 00       	call   28b <open>
  if(fd < 0)
 1b5:	83 c4 10             	add    $0x10,%esp
 1b8:	85 c0                	test   %eax,%eax
 1ba:	78 24                	js     1e0 <stat+0x3d>
 1bc:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 1be:	83 ec 08             	sub    $0x8,%esp
 1c1:	ff 75 0c             	push   0xc(%ebp)
 1c4:	50                   	push   %eax
 1c5:	e8 d9 00 00 00       	call   2a3 <fstat>
 1ca:	89 c6                	mov    %eax,%esi
  close(fd);
 1cc:	89 1c 24             	mov    %ebx,(%esp)
 1cf:	e8 9f 00 00 00       	call   273 <close>
  return r;
 1d4:	83 c4 10             	add    $0x10,%esp
}
 1d7:	89 f0                	mov    %esi,%eax
 1d9:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1dc:	5b                   	pop    %ebx
 1dd:	5e                   	pop    %esi
 1de:	5d                   	pop    %ebp
 1df:	c3                   	ret    
    return -1;
 1e0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 1e5:	eb f0                	jmp    1d7 <stat+0x34>

000001e7 <atoi>:

int
atoi(const char *s)
{
 1e7:	55                   	push   %ebp
 1e8:	89 e5                	mov    %esp,%ebp
 1ea:	53                   	push   %ebx
 1eb:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 1ee:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 1f3:	eb 10                	jmp    205 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 1f5:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 1f8:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 1fb:	83 c1 01             	add    $0x1,%ecx
 1fe:	0f be c0             	movsbl %al,%eax
 201:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 205:	0f b6 01             	movzbl (%ecx),%eax
 208:	8d 58 d0             	lea    -0x30(%eax),%ebx
 20b:	80 fb 09             	cmp    $0x9,%bl
 20e:	76 e5                	jbe    1f5 <atoi+0xe>
  return n;
}
 210:	89 d0                	mov    %edx,%eax
 212:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 215:	c9                   	leave  
 216:	c3                   	ret    

00000217 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 217:	55                   	push   %ebp
 218:	89 e5                	mov    %esp,%ebp
 21a:	56                   	push   %esi
 21b:	53                   	push   %ebx
 21c:	8b 75 08             	mov    0x8(%ebp),%esi
 21f:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 222:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 225:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 227:	eb 0d                	jmp    236 <memmove+0x1f>
    *dst++ = *src++;
 229:	0f b6 01             	movzbl (%ecx),%eax
 22c:	88 02                	mov    %al,(%edx)
 22e:	8d 49 01             	lea    0x1(%ecx),%ecx
 231:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 234:	89 d8                	mov    %ebx,%eax
 236:	8d 58 ff             	lea    -0x1(%eax),%ebx
 239:	85 c0                	test   %eax,%eax
 23b:	7f ec                	jg     229 <memmove+0x12>
  return vdst;
}
 23d:	89 f0                	mov    %esi,%eax
 23f:	5b                   	pop    %ebx
 240:	5e                   	pop    %esi
 241:	5d                   	pop    %ebp
 242:	c3                   	ret    

00000243 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 243:	b8 01 00 00 00       	mov    $0x1,%eax
 248:	cd 40                	int    $0x40
 24a:	c3                   	ret    

0000024b <exit>:
SYSCALL(exit)
 24b:	b8 02 00 00 00       	mov    $0x2,%eax
 250:	cd 40                	int    $0x40
 252:	c3                   	ret    

00000253 <wait>:
SYSCALL(wait)
 253:	b8 03 00 00 00       	mov    $0x3,%eax
 258:	cd 40                	int    $0x40
 25a:	c3                   	ret    

0000025b <pipe>:
SYSCALL(pipe)
 25b:	b8 04 00 00 00       	mov    $0x4,%eax
 260:	cd 40                	int    $0x40
 262:	c3                   	ret    

00000263 <read>:
SYSCALL(read)
 263:	b8 05 00 00 00       	mov    $0x5,%eax
 268:	cd 40                	int    $0x40
 26a:	c3                   	ret    

0000026b <write>:
SYSCALL(write)
 26b:	b8 10 00 00 00       	mov    $0x10,%eax
 270:	cd 40                	int    $0x40
 272:	c3                   	ret    

00000273 <close>:
SYSCALL(close)
 273:	b8 15 00 00 00       	mov    $0x15,%eax
 278:	cd 40                	int    $0x40
 27a:	c3                   	ret    

0000027b <kill>:
SYSCALL(kill)
 27b:	b8 06 00 00 00       	mov    $0x6,%eax
 280:	cd 40                	int    $0x40
 282:	c3                   	ret    

00000283 <exec>:
SYSCALL(exec)
 283:	b8 07 00 00 00       	mov    $0x7,%eax
 288:	cd 40                	int    $0x40
 28a:	c3                   	ret    

0000028b <open>:
SYSCALL(open)
 28b:	b8 0f 00 00 00       	mov    $0xf,%eax
 290:	cd 40                	int    $0x40
 292:	c3                   	ret    

00000293 <mknod>:
SYSCALL(mknod)
 293:	b8 11 00 00 00       	mov    $0x11,%eax
 298:	cd 40                	int    $0x40
 29a:	c3                   	ret    

0000029b <unlink>:
SYSCALL(unlink)
 29b:	b8 12 00 00 00       	mov    $0x12,%eax
 2a0:	cd 40                	int    $0x40
 2a2:	c3                   	ret    

000002a3 <fstat>:
SYSCALL(fstat)
 2a3:	b8 08 00 00 00       	mov    $0x8,%eax
 2a8:	cd 40                	int    $0x40
 2aa:	c3                   	ret    

000002ab <link>:
SYSCALL(link)
 2ab:	b8 13 00 00 00       	mov    $0x13,%eax
 2b0:	cd 40                	int    $0x40
 2b2:	c3                   	ret    

000002b3 <mkdir>:
SYSCALL(mkdir)
 2b3:	b8 14 00 00 00       	mov    $0x14,%eax
 2b8:	cd 40                	int    $0x40
 2ba:	c3                   	ret    

000002bb <chdir>:
SYSCALL(chdir)
 2bb:	b8 09 00 00 00       	mov    $0x9,%eax
 2c0:	cd 40                	int    $0x40
 2c2:	c3                   	ret    

000002c3 <dup>:
SYSCALL(dup)
 2c3:	b8 0a 00 00 00       	mov    $0xa,%eax
 2c8:	cd 40                	int    $0x40
 2ca:	c3                   	ret    

000002cb <getpid>:
SYSCALL(getpid)
 2cb:	b8 0b 00 00 00       	mov    $0xb,%eax
 2d0:	cd 40                	int    $0x40
 2d2:	c3                   	ret    

000002d3 <sbrk>:
SYSCALL(sbrk)
 2d3:	b8 0c 00 00 00       	mov    $0xc,%eax
 2d8:	cd 40                	int    $0x40
 2da:	c3                   	ret    

000002db <sleep>:
SYSCALL(sleep)
 2db:	b8 0d 00 00 00       	mov    $0xd,%eax
 2e0:	cd 40                	int    $0x40
 2e2:	c3                   	ret    

000002e3 <uptime>:
SYSCALL(uptime)
 2e3:	b8 0e 00 00 00       	mov    $0xe,%eax
 2e8:	cd 40                	int    $0x40
 2ea:	c3                   	ret    

000002eb <clone>:
SYSCALL(clone)
 2eb:	b8 16 00 00 00       	mov    $0x16,%eax
 2f0:	cd 40                	int    $0x40
 2f2:	c3                   	ret    

000002f3 <join>:
 2f3:	b8 17 00 00 00       	mov    $0x17,%eax
 2f8:	cd 40                	int    $0x40
 2fa:	c3                   	ret    

000002fb <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 2fb:	55                   	push   %ebp
 2fc:	89 e5                	mov    %esp,%ebp
 2fe:	83 ec 1c             	sub    $0x1c,%esp
 301:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 304:	6a 01                	push   $0x1
 306:	8d 55 f4             	lea    -0xc(%ebp),%edx
 309:	52                   	push   %edx
 30a:	50                   	push   %eax
 30b:	e8 5b ff ff ff       	call   26b <write>
}
 310:	83 c4 10             	add    $0x10,%esp
 313:	c9                   	leave  
 314:	c3                   	ret    

00000315 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 315:	55                   	push   %ebp
 316:	89 e5                	mov    %esp,%ebp
 318:	57                   	push   %edi
 319:	56                   	push   %esi
 31a:	53                   	push   %ebx
 31b:	83 ec 2c             	sub    $0x2c,%esp
 31e:	89 45 d0             	mov    %eax,-0x30(%ebp)
 321:	89 d0                	mov    %edx,%eax
 323:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 325:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 329:	0f 95 c1             	setne  %cl
 32c:	c1 ea 1f             	shr    $0x1f,%edx
 32f:	84 d1                	test   %dl,%cl
 331:	74 44                	je     377 <printint+0x62>
    neg = 1;
    x = -xx;
 333:	f7 d8                	neg    %eax
 335:	89 c1                	mov    %eax,%ecx
    neg = 1;
 337:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 33e:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 343:	89 c8                	mov    %ecx,%eax
 345:	ba 00 00 00 00       	mov    $0x0,%edx
 34a:	f7 f6                	div    %esi
 34c:	89 df                	mov    %ebx,%edi
 34e:	83 c3 01             	add    $0x1,%ebx
 351:	0f b6 92 b8 06 00 00 	movzbl 0x6b8(%edx),%edx
 358:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 35c:	89 ca                	mov    %ecx,%edx
 35e:	89 c1                	mov    %eax,%ecx
 360:	39 d6                	cmp    %edx,%esi
 362:	76 df                	jbe    343 <printint+0x2e>
  if(neg)
 364:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 368:	74 31                	je     39b <printint+0x86>
    buf[i++] = '-';
 36a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 36f:	8d 5f 02             	lea    0x2(%edi),%ebx
 372:	8b 75 d0             	mov    -0x30(%ebp),%esi
 375:	eb 17                	jmp    38e <printint+0x79>
    x = xx;
 377:	89 c1                	mov    %eax,%ecx
  neg = 0;
 379:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 380:	eb bc                	jmp    33e <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 382:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 387:	89 f0                	mov    %esi,%eax
 389:	e8 6d ff ff ff       	call   2fb <putc>
  while(--i >= 0)
 38e:	83 eb 01             	sub    $0x1,%ebx
 391:	79 ef                	jns    382 <printint+0x6d>
}
 393:	83 c4 2c             	add    $0x2c,%esp
 396:	5b                   	pop    %ebx
 397:	5e                   	pop    %esi
 398:	5f                   	pop    %edi
 399:	5d                   	pop    %ebp
 39a:	c3                   	ret    
 39b:	8b 75 d0             	mov    -0x30(%ebp),%esi
 39e:	eb ee                	jmp    38e <printint+0x79>

000003a0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 3a0:	55                   	push   %ebp
 3a1:	89 e5                	mov    %esp,%ebp
 3a3:	57                   	push   %edi
 3a4:	56                   	push   %esi
 3a5:	53                   	push   %ebx
 3a6:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 3a9:	8d 45 10             	lea    0x10(%ebp),%eax
 3ac:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 3af:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 3b4:	bb 00 00 00 00       	mov    $0x0,%ebx
 3b9:	eb 14                	jmp    3cf <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 3bb:	89 fa                	mov    %edi,%edx
 3bd:	8b 45 08             	mov    0x8(%ebp),%eax
 3c0:	e8 36 ff ff ff       	call   2fb <putc>
 3c5:	eb 05                	jmp    3cc <printf+0x2c>
      }
    } else if(state == '%'){
 3c7:	83 fe 25             	cmp    $0x25,%esi
 3ca:	74 25                	je     3f1 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 3cc:	83 c3 01             	add    $0x1,%ebx
 3cf:	8b 45 0c             	mov    0xc(%ebp),%eax
 3d2:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 3d6:	84 c0                	test   %al,%al
 3d8:	0f 84 20 01 00 00    	je     4fe <printf+0x15e>
    c = fmt[i] & 0xff;
 3de:	0f be f8             	movsbl %al,%edi
 3e1:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 3e4:	85 f6                	test   %esi,%esi
 3e6:	75 df                	jne    3c7 <printf+0x27>
      if(c == '%'){
 3e8:	83 f8 25             	cmp    $0x25,%eax
 3eb:	75 ce                	jne    3bb <printf+0x1b>
        state = '%';
 3ed:	89 c6                	mov    %eax,%esi
 3ef:	eb db                	jmp    3cc <printf+0x2c>
      if(c == 'd'){
 3f1:	83 f8 25             	cmp    $0x25,%eax
 3f4:	0f 84 cf 00 00 00    	je     4c9 <printf+0x129>
 3fa:	0f 8c dd 00 00 00    	jl     4dd <printf+0x13d>
 400:	83 f8 78             	cmp    $0x78,%eax
 403:	0f 8f d4 00 00 00    	jg     4dd <printf+0x13d>
 409:	83 f8 63             	cmp    $0x63,%eax
 40c:	0f 8c cb 00 00 00    	jl     4dd <printf+0x13d>
 412:	83 e8 63             	sub    $0x63,%eax
 415:	83 f8 15             	cmp    $0x15,%eax
 418:	0f 87 bf 00 00 00    	ja     4dd <printf+0x13d>
 41e:	ff 24 85 60 06 00 00 	jmp    *0x660(,%eax,4)
        printint(fd, *ap, 10, 1);
 425:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 428:	8b 17                	mov    (%edi),%edx
 42a:	83 ec 0c             	sub    $0xc,%esp
 42d:	6a 01                	push   $0x1
 42f:	b9 0a 00 00 00       	mov    $0xa,%ecx
 434:	8b 45 08             	mov    0x8(%ebp),%eax
 437:	e8 d9 fe ff ff       	call   315 <printint>
        ap++;
 43c:	83 c7 04             	add    $0x4,%edi
 43f:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 442:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 445:	be 00 00 00 00       	mov    $0x0,%esi
 44a:	eb 80                	jmp    3cc <printf+0x2c>
        printint(fd, *ap, 16, 0);
 44c:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 44f:	8b 17                	mov    (%edi),%edx
 451:	83 ec 0c             	sub    $0xc,%esp
 454:	6a 00                	push   $0x0
 456:	b9 10 00 00 00       	mov    $0x10,%ecx
 45b:	8b 45 08             	mov    0x8(%ebp),%eax
 45e:	e8 b2 fe ff ff       	call   315 <printint>
        ap++;
 463:	83 c7 04             	add    $0x4,%edi
 466:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 469:	83 c4 10             	add    $0x10,%esp
      state = 0;
 46c:	be 00 00 00 00       	mov    $0x0,%esi
 471:	e9 56 ff ff ff       	jmp    3cc <printf+0x2c>
        s = (char*)*ap;
 476:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 479:	8b 30                	mov    (%eax),%esi
        ap++;
 47b:	83 c0 04             	add    $0x4,%eax
 47e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 481:	85 f6                	test   %esi,%esi
 483:	75 15                	jne    49a <printf+0xfa>
          s = "(null)";
 485:	be 59 06 00 00       	mov    $0x659,%esi
 48a:	eb 0e                	jmp    49a <printf+0xfa>
          putc(fd, *s);
 48c:	0f be d2             	movsbl %dl,%edx
 48f:	8b 45 08             	mov    0x8(%ebp),%eax
 492:	e8 64 fe ff ff       	call   2fb <putc>
          s++;
 497:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 49a:	0f b6 16             	movzbl (%esi),%edx
 49d:	84 d2                	test   %dl,%dl
 49f:	75 eb                	jne    48c <printf+0xec>
      state = 0;
 4a1:	be 00 00 00 00       	mov    $0x0,%esi
 4a6:	e9 21 ff ff ff       	jmp    3cc <printf+0x2c>
        putc(fd, *ap);
 4ab:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4ae:	0f be 17             	movsbl (%edi),%edx
 4b1:	8b 45 08             	mov    0x8(%ebp),%eax
 4b4:	e8 42 fe ff ff       	call   2fb <putc>
        ap++;
 4b9:	83 c7 04             	add    $0x4,%edi
 4bc:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 4bf:	be 00 00 00 00       	mov    $0x0,%esi
 4c4:	e9 03 ff ff ff       	jmp    3cc <printf+0x2c>
        putc(fd, c);
 4c9:	89 fa                	mov    %edi,%edx
 4cb:	8b 45 08             	mov    0x8(%ebp),%eax
 4ce:	e8 28 fe ff ff       	call   2fb <putc>
      state = 0;
 4d3:	be 00 00 00 00       	mov    $0x0,%esi
 4d8:	e9 ef fe ff ff       	jmp    3cc <printf+0x2c>
        putc(fd, '%');
 4dd:	ba 25 00 00 00       	mov    $0x25,%edx
 4e2:	8b 45 08             	mov    0x8(%ebp),%eax
 4e5:	e8 11 fe ff ff       	call   2fb <putc>
        putc(fd, c);
 4ea:	89 fa                	mov    %edi,%edx
 4ec:	8b 45 08             	mov    0x8(%ebp),%eax
 4ef:	e8 07 fe ff ff       	call   2fb <putc>
      state = 0;
 4f4:	be 00 00 00 00       	mov    $0x0,%esi
 4f9:	e9 ce fe ff ff       	jmp    3cc <printf+0x2c>
    }
  }
}
 4fe:	8d 65 f4             	lea    -0xc(%ebp),%esp
 501:	5b                   	pop    %ebx
 502:	5e                   	pop    %esi
 503:	5f                   	pop    %edi
 504:	5d                   	pop    %ebp
 505:	c3                   	ret    

00000506 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 506:	55                   	push   %ebp
 507:	89 e5                	mov    %esp,%ebp
 509:	57                   	push   %edi
 50a:	56                   	push   %esi
 50b:	53                   	push   %ebx
 50c:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 50f:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 512:	a1 10 0a 00 00       	mov    0xa10,%eax
 517:	eb 02                	jmp    51b <free+0x15>
 519:	89 d0                	mov    %edx,%eax
 51b:	39 c8                	cmp    %ecx,%eax
 51d:	73 04                	jae    523 <free+0x1d>
 51f:	39 08                	cmp    %ecx,(%eax)
 521:	77 12                	ja     535 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 523:	8b 10                	mov    (%eax),%edx
 525:	39 c2                	cmp    %eax,%edx
 527:	77 f0                	ja     519 <free+0x13>
 529:	39 c8                	cmp    %ecx,%eax
 52b:	72 08                	jb     535 <free+0x2f>
 52d:	39 ca                	cmp    %ecx,%edx
 52f:	77 04                	ja     535 <free+0x2f>
 531:	89 d0                	mov    %edx,%eax
 533:	eb e6                	jmp    51b <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 535:	8b 73 fc             	mov    -0x4(%ebx),%esi
 538:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 53b:	8b 10                	mov    (%eax),%edx
 53d:	39 d7                	cmp    %edx,%edi
 53f:	74 19                	je     55a <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 541:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 544:	8b 50 04             	mov    0x4(%eax),%edx
 547:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 54a:	39 ce                	cmp    %ecx,%esi
 54c:	74 1b                	je     569 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 54e:	89 08                	mov    %ecx,(%eax)
  freep = p;
 550:	a3 10 0a 00 00       	mov    %eax,0xa10
}
 555:	5b                   	pop    %ebx
 556:	5e                   	pop    %esi
 557:	5f                   	pop    %edi
 558:	5d                   	pop    %ebp
 559:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 55a:	03 72 04             	add    0x4(%edx),%esi
 55d:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 560:	8b 10                	mov    (%eax),%edx
 562:	8b 12                	mov    (%edx),%edx
 564:	89 53 f8             	mov    %edx,-0x8(%ebx)
 567:	eb db                	jmp    544 <free+0x3e>
    p->s.size += bp->s.size;
 569:	03 53 fc             	add    -0x4(%ebx),%edx
 56c:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 56f:	8b 53 f8             	mov    -0x8(%ebx),%edx
 572:	89 10                	mov    %edx,(%eax)
 574:	eb da                	jmp    550 <free+0x4a>

00000576 <morecore>:

static Header*
morecore(uint nu)
{
 576:	55                   	push   %ebp
 577:	89 e5                	mov    %esp,%ebp
 579:	53                   	push   %ebx
 57a:	83 ec 04             	sub    $0x4,%esp
 57d:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 57f:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 584:	77 05                	ja     58b <morecore+0x15>
    nu = 4096;
 586:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 58b:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 592:	83 ec 0c             	sub    $0xc,%esp
 595:	50                   	push   %eax
 596:	e8 38 fd ff ff       	call   2d3 <sbrk>
  if(p == (char*)-1)
 59b:	83 c4 10             	add    $0x10,%esp
 59e:	83 f8 ff             	cmp    $0xffffffff,%eax
 5a1:	74 1c                	je     5bf <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 5a3:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 5a6:	83 c0 08             	add    $0x8,%eax
 5a9:	83 ec 0c             	sub    $0xc,%esp
 5ac:	50                   	push   %eax
 5ad:	e8 54 ff ff ff       	call   506 <free>
  return freep;
 5b2:	a1 10 0a 00 00       	mov    0xa10,%eax
 5b7:	83 c4 10             	add    $0x10,%esp
}
 5ba:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5bd:	c9                   	leave  
 5be:	c3                   	ret    
    return 0;
 5bf:	b8 00 00 00 00       	mov    $0x0,%eax
 5c4:	eb f4                	jmp    5ba <morecore+0x44>

000005c6 <malloc>:

void*
malloc(uint nbytes)
{
 5c6:	55                   	push   %ebp
 5c7:	89 e5                	mov    %esp,%ebp
 5c9:	53                   	push   %ebx
 5ca:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 5cd:	8b 45 08             	mov    0x8(%ebp),%eax
 5d0:	8d 58 07             	lea    0x7(%eax),%ebx
 5d3:	c1 eb 03             	shr    $0x3,%ebx
 5d6:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 5d9:	8b 0d 10 0a 00 00    	mov    0xa10,%ecx
 5df:	85 c9                	test   %ecx,%ecx
 5e1:	74 04                	je     5e7 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 5e3:	8b 01                	mov    (%ecx),%eax
 5e5:	eb 4a                	jmp    631 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 5e7:	c7 05 10 0a 00 00 14 	movl   $0xa14,0xa10
 5ee:	0a 00 00 
 5f1:	c7 05 14 0a 00 00 14 	movl   $0xa14,0xa14
 5f8:	0a 00 00 
    base.s.size = 0;
 5fb:	c7 05 18 0a 00 00 00 	movl   $0x0,0xa18
 602:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 605:	b9 14 0a 00 00       	mov    $0xa14,%ecx
 60a:	eb d7                	jmp    5e3 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 60c:	74 19                	je     627 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 60e:	29 da                	sub    %ebx,%edx
 610:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 613:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 616:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 619:	89 0d 10 0a 00 00    	mov    %ecx,0xa10
      return (void*)(p + 1);
 61f:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 622:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 625:	c9                   	leave  
 626:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 627:	8b 10                	mov    (%eax),%edx
 629:	89 11                	mov    %edx,(%ecx)
 62b:	eb ec                	jmp    619 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 62d:	89 c1                	mov    %eax,%ecx
 62f:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 631:	8b 50 04             	mov    0x4(%eax),%edx
 634:	39 da                	cmp    %ebx,%edx
 636:	73 d4                	jae    60c <malloc+0x46>
    if(p == freep)
 638:	39 05 10 0a 00 00    	cmp    %eax,0xa10
 63e:	75 ed                	jne    62d <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 640:	89 d8                	mov    %ebx,%eax
 642:	e8 2f ff ff ff       	call   576 <morecore>
 647:	85 c0                	test   %eax,%eax
 649:	75 e2                	jne    62d <malloc+0x67>
 64b:	eb d5                	jmp    622 <malloc+0x5c>
