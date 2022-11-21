
_ln:     file format elf32-i386


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
   d:	53                   	push   %ebx
   e:	51                   	push   %ecx
   f:	8b 59 04             	mov    0x4(%ecx),%ebx
  if(argc != 3){
  12:	83 39 03             	cmpl   $0x3,(%ecx)
  15:	74 14                	je     2b <main+0x2b>
    printf(2, "Usage: ln old new\n");
  17:	83 ec 08             	sub    $0x8,%esp
  1a:	68 58 06 00 00       	push   $0x658
  1f:	6a 02                	push   $0x2
  21:	e8 85 03 00 00       	call   3ab <printf>
    exit();
  26:	e8 2b 02 00 00       	call   256 <exit>
  }
  if(link(argv[1], argv[2]) < 0)
  2b:	83 ec 08             	sub    $0x8,%esp
  2e:	ff 73 08             	push   0x8(%ebx)
  31:	ff 73 04             	push   0x4(%ebx)
  34:	e8 7d 02 00 00       	call   2b6 <link>
  39:	83 c4 10             	add    $0x10,%esp
  3c:	85 c0                	test   %eax,%eax
  3e:	78 05                	js     45 <main+0x45>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  exit();
  40:	e8 11 02 00 00       	call   256 <exit>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  45:	ff 73 08             	push   0x8(%ebx)
  48:	ff 73 04             	push   0x4(%ebx)
  4b:	68 6b 06 00 00       	push   $0x66b
  50:	6a 02                	push   $0x2
  52:	e8 54 03 00 00       	call   3ab <printf>
  57:	83 c4 10             	add    $0x10,%esp
  5a:	eb e4                	jmp    40 <main+0x40>

0000005c <test_and_set>:
#include "fcntl.h"
#include "user.h"
#include "x86.h"
#include "mmu.h"

int test_and_set(int *old_ptr, int new_ptr) {
  5c:	55                   	push   %ebp
  5d:	89 e5                	mov    %esp,%ebp
  5f:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *old_ptr;
  62:	8b 10                	mov    (%eax),%edx
  *old_ptr = new_ptr;
  64:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  67:	89 08                	mov    %ecx,(%eax)
  return old;
}
  69:	89 d0                	mov    %edx,%eax
  6b:	5d                   	pop    %ebp
  6c:	c3                   	ret    

0000006d <thread_create>:

  // I can't remember if there was something else to do here but I'm sure I'll find out


  return new_pid;
}
  6d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  72:	c3                   	ret    

00000073 <thread_join>:

int thread_join() {
  return 0;
}
  73:	b8 00 00 00 00       	mov    $0x0,%eax
  78:	c3                   	ret    

00000079 <lock_acquire>:

void lock_acquire(lock_t *lock){
  79:	55                   	push   %ebp
  7a:	89 e5                	mov    %esp,%ebp
  7c:	53                   	push   %ebx
  7d:	83 ec 04             	sub    $0x4,%esp
  80:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
  83:	83 ec 08             	sub    $0x8,%esp
  86:	6a 01                	push   $0x1
  88:	53                   	push   %ebx
  89:	e8 ce ff ff ff       	call   5c <test_and_set>
  8e:	83 c4 10             	add    $0x10,%esp
  91:	83 f8 01             	cmp    $0x1,%eax
  94:	74 ed                	je     83 <lock_acquire+0xa>
    ;
}
  96:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  99:	c9                   	leave  
  9a:	c3                   	ret    

0000009b <lock_release>:

void lock_release(lock_t *lock) {
  9b:	55                   	push   %ebp
  9c:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
  9e:	8b 45 08             	mov    0x8(%ebp),%eax
  a1:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
  a7:	5d                   	pop    %ebp
  a8:	c3                   	ret    

000000a9 <lock_init>:

void lock_init(lock_t *lock) {
  a9:	55                   	push   %ebp
  aa:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
  ac:	8b 45 08             	mov    0x8(%ebp),%eax
  af:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
  b5:	5d                   	pop    %ebp
  b6:	c3                   	ret    

000000b7 <strcpy>:

char*
strcpy(char *s, const char *t)
{
  b7:	55                   	push   %ebp
  b8:	89 e5                	mov    %esp,%ebp
  ba:	56                   	push   %esi
  bb:	53                   	push   %ebx
  bc:	8b 75 08             	mov    0x8(%ebp),%esi
  bf:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  c2:	89 f0                	mov    %esi,%eax
  c4:	89 d1                	mov    %edx,%ecx
  c6:	83 c2 01             	add    $0x1,%edx
  c9:	89 c3                	mov    %eax,%ebx
  cb:	83 c0 01             	add    $0x1,%eax
  ce:	0f b6 09             	movzbl (%ecx),%ecx
  d1:	88 0b                	mov    %cl,(%ebx)
  d3:	84 c9                	test   %cl,%cl
  d5:	75 ed                	jne    c4 <strcpy+0xd>
    ;
  return os;
}
  d7:	89 f0                	mov    %esi,%eax
  d9:	5b                   	pop    %ebx
  da:	5e                   	pop    %esi
  db:	5d                   	pop    %ebp
  dc:	c3                   	ret    

000000dd <strcmp>:

int
strcmp(const char *p, const char *q)
{
  dd:	55                   	push   %ebp
  de:	89 e5                	mov    %esp,%ebp
  e0:	8b 4d 08             	mov    0x8(%ebp),%ecx
  e3:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
  e6:	eb 06                	jmp    ee <strcmp+0x11>
    p++, q++;
  e8:	83 c1 01             	add    $0x1,%ecx
  eb:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
  ee:	0f b6 01             	movzbl (%ecx),%eax
  f1:	84 c0                	test   %al,%al
  f3:	74 04                	je     f9 <strcmp+0x1c>
  f5:	3a 02                	cmp    (%edx),%al
  f7:	74 ef                	je     e8 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
  f9:	0f b6 c0             	movzbl %al,%eax
  fc:	0f b6 12             	movzbl (%edx),%edx
  ff:	29 d0                	sub    %edx,%eax
}
 101:	5d                   	pop    %ebp
 102:	c3                   	ret    

00000103 <strlen>:

uint
strlen(const char *s)
{
 103:	55                   	push   %ebp
 104:	89 e5                	mov    %esp,%ebp
 106:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 109:	b8 00 00 00 00       	mov    $0x0,%eax
 10e:	eb 03                	jmp    113 <strlen+0x10>
 110:	83 c0 01             	add    $0x1,%eax
 113:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 117:	75 f7                	jne    110 <strlen+0xd>
    ;
  return n;
}
 119:	5d                   	pop    %ebp
 11a:	c3                   	ret    

0000011b <memset>:

void*
memset(void *dst, int c, uint n)
{
 11b:	55                   	push   %ebp
 11c:	89 e5                	mov    %esp,%ebp
 11e:	57                   	push   %edi
 11f:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 122:	89 d7                	mov    %edx,%edi
 124:	8b 4d 10             	mov    0x10(%ebp),%ecx
 127:	8b 45 0c             	mov    0xc(%ebp),%eax
 12a:	fc                   	cld    
 12b:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 12d:	89 d0                	mov    %edx,%eax
 12f:	8b 7d fc             	mov    -0x4(%ebp),%edi
 132:	c9                   	leave  
 133:	c3                   	ret    

00000134 <strchr>:

char*
strchr(const char *s, char c)
{
 134:	55                   	push   %ebp
 135:	89 e5                	mov    %esp,%ebp
 137:	8b 45 08             	mov    0x8(%ebp),%eax
 13a:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 13e:	eb 03                	jmp    143 <strchr+0xf>
 140:	83 c0 01             	add    $0x1,%eax
 143:	0f b6 10             	movzbl (%eax),%edx
 146:	84 d2                	test   %dl,%dl
 148:	74 06                	je     150 <strchr+0x1c>
    if(*s == c)
 14a:	38 ca                	cmp    %cl,%dl
 14c:	75 f2                	jne    140 <strchr+0xc>
 14e:	eb 05                	jmp    155 <strchr+0x21>
      return (char*)s;
  return 0;
 150:	b8 00 00 00 00       	mov    $0x0,%eax
}
 155:	5d                   	pop    %ebp
 156:	c3                   	ret    

00000157 <gets>:

char*
gets(char *buf, int max)
{
 157:	55                   	push   %ebp
 158:	89 e5                	mov    %esp,%ebp
 15a:	57                   	push   %edi
 15b:	56                   	push   %esi
 15c:	53                   	push   %ebx
 15d:	83 ec 1c             	sub    $0x1c,%esp
 160:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 163:	bb 00 00 00 00       	mov    $0x0,%ebx
 168:	89 de                	mov    %ebx,%esi
 16a:	83 c3 01             	add    $0x1,%ebx
 16d:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 170:	7d 2e                	jge    1a0 <gets+0x49>
    cc = read(0, &c, 1);
 172:	83 ec 04             	sub    $0x4,%esp
 175:	6a 01                	push   $0x1
 177:	8d 45 e7             	lea    -0x19(%ebp),%eax
 17a:	50                   	push   %eax
 17b:	6a 00                	push   $0x0
 17d:	e8 ec 00 00 00       	call   26e <read>
    if(cc < 1)
 182:	83 c4 10             	add    $0x10,%esp
 185:	85 c0                	test   %eax,%eax
 187:	7e 17                	jle    1a0 <gets+0x49>
      break;
    buf[i++] = c;
 189:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 18d:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 190:	3c 0a                	cmp    $0xa,%al
 192:	0f 94 c2             	sete   %dl
 195:	3c 0d                	cmp    $0xd,%al
 197:	0f 94 c0             	sete   %al
 19a:	08 c2                	or     %al,%dl
 19c:	74 ca                	je     168 <gets+0x11>
    buf[i++] = c;
 19e:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 1a0:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 1a4:	89 f8                	mov    %edi,%eax
 1a6:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1a9:	5b                   	pop    %ebx
 1aa:	5e                   	pop    %esi
 1ab:	5f                   	pop    %edi
 1ac:	5d                   	pop    %ebp
 1ad:	c3                   	ret    

000001ae <stat>:

int
stat(const char *n, struct stat *st)
{
 1ae:	55                   	push   %ebp
 1af:	89 e5                	mov    %esp,%ebp
 1b1:	56                   	push   %esi
 1b2:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1b3:	83 ec 08             	sub    $0x8,%esp
 1b6:	6a 00                	push   $0x0
 1b8:	ff 75 08             	push   0x8(%ebp)
 1bb:	e8 d6 00 00 00       	call   296 <open>
  if(fd < 0)
 1c0:	83 c4 10             	add    $0x10,%esp
 1c3:	85 c0                	test   %eax,%eax
 1c5:	78 24                	js     1eb <stat+0x3d>
 1c7:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 1c9:	83 ec 08             	sub    $0x8,%esp
 1cc:	ff 75 0c             	push   0xc(%ebp)
 1cf:	50                   	push   %eax
 1d0:	e8 d9 00 00 00       	call   2ae <fstat>
 1d5:	89 c6                	mov    %eax,%esi
  close(fd);
 1d7:	89 1c 24             	mov    %ebx,(%esp)
 1da:	e8 9f 00 00 00       	call   27e <close>
  return r;
 1df:	83 c4 10             	add    $0x10,%esp
}
 1e2:	89 f0                	mov    %esi,%eax
 1e4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1e7:	5b                   	pop    %ebx
 1e8:	5e                   	pop    %esi
 1e9:	5d                   	pop    %ebp
 1ea:	c3                   	ret    
    return -1;
 1eb:	be ff ff ff ff       	mov    $0xffffffff,%esi
 1f0:	eb f0                	jmp    1e2 <stat+0x34>

000001f2 <atoi>:

int
atoi(const char *s)
{
 1f2:	55                   	push   %ebp
 1f3:	89 e5                	mov    %esp,%ebp
 1f5:	53                   	push   %ebx
 1f6:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 1f9:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 1fe:	eb 10                	jmp    210 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 200:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 203:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 206:	83 c1 01             	add    $0x1,%ecx
 209:	0f be c0             	movsbl %al,%eax
 20c:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 210:	0f b6 01             	movzbl (%ecx),%eax
 213:	8d 58 d0             	lea    -0x30(%eax),%ebx
 216:	80 fb 09             	cmp    $0x9,%bl
 219:	76 e5                	jbe    200 <atoi+0xe>
  return n;
}
 21b:	89 d0                	mov    %edx,%eax
 21d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 220:	c9                   	leave  
 221:	c3                   	ret    

00000222 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 222:	55                   	push   %ebp
 223:	89 e5                	mov    %esp,%ebp
 225:	56                   	push   %esi
 226:	53                   	push   %ebx
 227:	8b 75 08             	mov    0x8(%ebp),%esi
 22a:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 22d:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 230:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 232:	eb 0d                	jmp    241 <memmove+0x1f>
    *dst++ = *src++;
 234:	0f b6 01             	movzbl (%ecx),%eax
 237:	88 02                	mov    %al,(%edx)
 239:	8d 49 01             	lea    0x1(%ecx),%ecx
 23c:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 23f:	89 d8                	mov    %ebx,%eax
 241:	8d 58 ff             	lea    -0x1(%eax),%ebx
 244:	85 c0                	test   %eax,%eax
 246:	7f ec                	jg     234 <memmove+0x12>
  return vdst;
}
 248:	89 f0                	mov    %esi,%eax
 24a:	5b                   	pop    %ebx
 24b:	5e                   	pop    %esi
 24c:	5d                   	pop    %ebp
 24d:	c3                   	ret    

0000024e <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 24e:	b8 01 00 00 00       	mov    $0x1,%eax
 253:	cd 40                	int    $0x40
 255:	c3                   	ret    

00000256 <exit>:
SYSCALL(exit)
 256:	b8 02 00 00 00       	mov    $0x2,%eax
 25b:	cd 40                	int    $0x40
 25d:	c3                   	ret    

0000025e <wait>:
SYSCALL(wait)
 25e:	b8 03 00 00 00       	mov    $0x3,%eax
 263:	cd 40                	int    $0x40
 265:	c3                   	ret    

00000266 <pipe>:
SYSCALL(pipe)
 266:	b8 04 00 00 00       	mov    $0x4,%eax
 26b:	cd 40                	int    $0x40
 26d:	c3                   	ret    

0000026e <read>:
SYSCALL(read)
 26e:	b8 05 00 00 00       	mov    $0x5,%eax
 273:	cd 40                	int    $0x40
 275:	c3                   	ret    

00000276 <write>:
SYSCALL(write)
 276:	b8 10 00 00 00       	mov    $0x10,%eax
 27b:	cd 40                	int    $0x40
 27d:	c3                   	ret    

0000027e <close>:
SYSCALL(close)
 27e:	b8 15 00 00 00       	mov    $0x15,%eax
 283:	cd 40                	int    $0x40
 285:	c3                   	ret    

00000286 <kill>:
SYSCALL(kill)
 286:	b8 06 00 00 00       	mov    $0x6,%eax
 28b:	cd 40                	int    $0x40
 28d:	c3                   	ret    

0000028e <exec>:
SYSCALL(exec)
 28e:	b8 07 00 00 00       	mov    $0x7,%eax
 293:	cd 40                	int    $0x40
 295:	c3                   	ret    

00000296 <open>:
SYSCALL(open)
 296:	b8 0f 00 00 00       	mov    $0xf,%eax
 29b:	cd 40                	int    $0x40
 29d:	c3                   	ret    

0000029e <mknod>:
SYSCALL(mknod)
 29e:	b8 11 00 00 00       	mov    $0x11,%eax
 2a3:	cd 40                	int    $0x40
 2a5:	c3                   	ret    

000002a6 <unlink>:
SYSCALL(unlink)
 2a6:	b8 12 00 00 00       	mov    $0x12,%eax
 2ab:	cd 40                	int    $0x40
 2ad:	c3                   	ret    

000002ae <fstat>:
SYSCALL(fstat)
 2ae:	b8 08 00 00 00       	mov    $0x8,%eax
 2b3:	cd 40                	int    $0x40
 2b5:	c3                   	ret    

000002b6 <link>:
SYSCALL(link)
 2b6:	b8 13 00 00 00       	mov    $0x13,%eax
 2bb:	cd 40                	int    $0x40
 2bd:	c3                   	ret    

000002be <mkdir>:
SYSCALL(mkdir)
 2be:	b8 14 00 00 00       	mov    $0x14,%eax
 2c3:	cd 40                	int    $0x40
 2c5:	c3                   	ret    

000002c6 <chdir>:
SYSCALL(chdir)
 2c6:	b8 09 00 00 00       	mov    $0x9,%eax
 2cb:	cd 40                	int    $0x40
 2cd:	c3                   	ret    

000002ce <dup>:
SYSCALL(dup)
 2ce:	b8 0a 00 00 00       	mov    $0xa,%eax
 2d3:	cd 40                	int    $0x40
 2d5:	c3                   	ret    

000002d6 <getpid>:
SYSCALL(getpid)
 2d6:	b8 0b 00 00 00       	mov    $0xb,%eax
 2db:	cd 40                	int    $0x40
 2dd:	c3                   	ret    

000002de <sbrk>:
SYSCALL(sbrk)
 2de:	b8 0c 00 00 00       	mov    $0xc,%eax
 2e3:	cd 40                	int    $0x40
 2e5:	c3                   	ret    

000002e6 <sleep>:
SYSCALL(sleep)
 2e6:	b8 0d 00 00 00       	mov    $0xd,%eax
 2eb:	cd 40                	int    $0x40
 2ed:	c3                   	ret    

000002ee <uptime>:
SYSCALL(uptime)
 2ee:	b8 0e 00 00 00       	mov    $0xe,%eax
 2f3:	cd 40                	int    $0x40
 2f5:	c3                   	ret    

000002f6 <clone>:
SYSCALL(clone)
 2f6:	b8 16 00 00 00       	mov    $0x16,%eax
 2fb:	cd 40                	int    $0x40
 2fd:	c3                   	ret    

000002fe <join>:
 2fe:	b8 17 00 00 00       	mov    $0x17,%eax
 303:	cd 40                	int    $0x40
 305:	c3                   	ret    

00000306 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 306:	55                   	push   %ebp
 307:	89 e5                	mov    %esp,%ebp
 309:	83 ec 1c             	sub    $0x1c,%esp
 30c:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 30f:	6a 01                	push   $0x1
 311:	8d 55 f4             	lea    -0xc(%ebp),%edx
 314:	52                   	push   %edx
 315:	50                   	push   %eax
 316:	e8 5b ff ff ff       	call   276 <write>
}
 31b:	83 c4 10             	add    $0x10,%esp
 31e:	c9                   	leave  
 31f:	c3                   	ret    

00000320 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 320:	55                   	push   %ebp
 321:	89 e5                	mov    %esp,%ebp
 323:	57                   	push   %edi
 324:	56                   	push   %esi
 325:	53                   	push   %ebx
 326:	83 ec 2c             	sub    $0x2c,%esp
 329:	89 45 d0             	mov    %eax,-0x30(%ebp)
 32c:	89 d0                	mov    %edx,%eax
 32e:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 330:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 334:	0f 95 c1             	setne  %cl
 337:	c1 ea 1f             	shr    $0x1f,%edx
 33a:	84 d1                	test   %dl,%cl
 33c:	74 44                	je     382 <printint+0x62>
    neg = 1;
    x = -xx;
 33e:	f7 d8                	neg    %eax
 340:	89 c1                	mov    %eax,%ecx
    neg = 1;
 342:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 349:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 34e:	89 c8                	mov    %ecx,%eax
 350:	ba 00 00 00 00       	mov    $0x0,%edx
 355:	f7 f6                	div    %esi
 357:	89 df                	mov    %ebx,%edi
 359:	83 c3 01             	add    $0x1,%ebx
 35c:	0f b6 92 e0 06 00 00 	movzbl 0x6e0(%edx),%edx
 363:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 367:	89 ca                	mov    %ecx,%edx
 369:	89 c1                	mov    %eax,%ecx
 36b:	39 d6                	cmp    %edx,%esi
 36d:	76 df                	jbe    34e <printint+0x2e>
  if(neg)
 36f:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 373:	74 31                	je     3a6 <printint+0x86>
    buf[i++] = '-';
 375:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 37a:	8d 5f 02             	lea    0x2(%edi),%ebx
 37d:	8b 75 d0             	mov    -0x30(%ebp),%esi
 380:	eb 17                	jmp    399 <printint+0x79>
    x = xx;
 382:	89 c1                	mov    %eax,%ecx
  neg = 0;
 384:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 38b:	eb bc                	jmp    349 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 38d:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 392:	89 f0                	mov    %esi,%eax
 394:	e8 6d ff ff ff       	call   306 <putc>
  while(--i >= 0)
 399:	83 eb 01             	sub    $0x1,%ebx
 39c:	79 ef                	jns    38d <printint+0x6d>
}
 39e:	83 c4 2c             	add    $0x2c,%esp
 3a1:	5b                   	pop    %ebx
 3a2:	5e                   	pop    %esi
 3a3:	5f                   	pop    %edi
 3a4:	5d                   	pop    %ebp
 3a5:	c3                   	ret    
 3a6:	8b 75 d0             	mov    -0x30(%ebp),%esi
 3a9:	eb ee                	jmp    399 <printint+0x79>

000003ab <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 3ab:	55                   	push   %ebp
 3ac:	89 e5                	mov    %esp,%ebp
 3ae:	57                   	push   %edi
 3af:	56                   	push   %esi
 3b0:	53                   	push   %ebx
 3b1:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 3b4:	8d 45 10             	lea    0x10(%ebp),%eax
 3b7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 3ba:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 3bf:	bb 00 00 00 00       	mov    $0x0,%ebx
 3c4:	eb 14                	jmp    3da <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 3c6:	89 fa                	mov    %edi,%edx
 3c8:	8b 45 08             	mov    0x8(%ebp),%eax
 3cb:	e8 36 ff ff ff       	call   306 <putc>
 3d0:	eb 05                	jmp    3d7 <printf+0x2c>
      }
    } else if(state == '%'){
 3d2:	83 fe 25             	cmp    $0x25,%esi
 3d5:	74 25                	je     3fc <printf+0x51>
  for(i = 0; fmt[i]; i++){
 3d7:	83 c3 01             	add    $0x1,%ebx
 3da:	8b 45 0c             	mov    0xc(%ebp),%eax
 3dd:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 3e1:	84 c0                	test   %al,%al
 3e3:	0f 84 20 01 00 00    	je     509 <printf+0x15e>
    c = fmt[i] & 0xff;
 3e9:	0f be f8             	movsbl %al,%edi
 3ec:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 3ef:	85 f6                	test   %esi,%esi
 3f1:	75 df                	jne    3d2 <printf+0x27>
      if(c == '%'){
 3f3:	83 f8 25             	cmp    $0x25,%eax
 3f6:	75 ce                	jne    3c6 <printf+0x1b>
        state = '%';
 3f8:	89 c6                	mov    %eax,%esi
 3fa:	eb db                	jmp    3d7 <printf+0x2c>
      if(c == 'd'){
 3fc:	83 f8 25             	cmp    $0x25,%eax
 3ff:	0f 84 cf 00 00 00    	je     4d4 <printf+0x129>
 405:	0f 8c dd 00 00 00    	jl     4e8 <printf+0x13d>
 40b:	83 f8 78             	cmp    $0x78,%eax
 40e:	0f 8f d4 00 00 00    	jg     4e8 <printf+0x13d>
 414:	83 f8 63             	cmp    $0x63,%eax
 417:	0f 8c cb 00 00 00    	jl     4e8 <printf+0x13d>
 41d:	83 e8 63             	sub    $0x63,%eax
 420:	83 f8 15             	cmp    $0x15,%eax
 423:	0f 87 bf 00 00 00    	ja     4e8 <printf+0x13d>
 429:	ff 24 85 88 06 00 00 	jmp    *0x688(,%eax,4)
        printint(fd, *ap, 10, 1);
 430:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 433:	8b 17                	mov    (%edi),%edx
 435:	83 ec 0c             	sub    $0xc,%esp
 438:	6a 01                	push   $0x1
 43a:	b9 0a 00 00 00       	mov    $0xa,%ecx
 43f:	8b 45 08             	mov    0x8(%ebp),%eax
 442:	e8 d9 fe ff ff       	call   320 <printint>
        ap++;
 447:	83 c7 04             	add    $0x4,%edi
 44a:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 44d:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 450:	be 00 00 00 00       	mov    $0x0,%esi
 455:	eb 80                	jmp    3d7 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 457:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 45a:	8b 17                	mov    (%edi),%edx
 45c:	83 ec 0c             	sub    $0xc,%esp
 45f:	6a 00                	push   $0x0
 461:	b9 10 00 00 00       	mov    $0x10,%ecx
 466:	8b 45 08             	mov    0x8(%ebp),%eax
 469:	e8 b2 fe ff ff       	call   320 <printint>
        ap++;
 46e:	83 c7 04             	add    $0x4,%edi
 471:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 474:	83 c4 10             	add    $0x10,%esp
      state = 0;
 477:	be 00 00 00 00       	mov    $0x0,%esi
 47c:	e9 56 ff ff ff       	jmp    3d7 <printf+0x2c>
        s = (char*)*ap;
 481:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 484:	8b 30                	mov    (%eax),%esi
        ap++;
 486:	83 c0 04             	add    $0x4,%eax
 489:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 48c:	85 f6                	test   %esi,%esi
 48e:	75 15                	jne    4a5 <printf+0xfa>
          s = "(null)";
 490:	be 7f 06 00 00       	mov    $0x67f,%esi
 495:	eb 0e                	jmp    4a5 <printf+0xfa>
          putc(fd, *s);
 497:	0f be d2             	movsbl %dl,%edx
 49a:	8b 45 08             	mov    0x8(%ebp),%eax
 49d:	e8 64 fe ff ff       	call   306 <putc>
          s++;
 4a2:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 4a5:	0f b6 16             	movzbl (%esi),%edx
 4a8:	84 d2                	test   %dl,%dl
 4aa:	75 eb                	jne    497 <printf+0xec>
      state = 0;
 4ac:	be 00 00 00 00       	mov    $0x0,%esi
 4b1:	e9 21 ff ff ff       	jmp    3d7 <printf+0x2c>
        putc(fd, *ap);
 4b6:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4b9:	0f be 17             	movsbl (%edi),%edx
 4bc:	8b 45 08             	mov    0x8(%ebp),%eax
 4bf:	e8 42 fe ff ff       	call   306 <putc>
        ap++;
 4c4:	83 c7 04             	add    $0x4,%edi
 4c7:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 4ca:	be 00 00 00 00       	mov    $0x0,%esi
 4cf:	e9 03 ff ff ff       	jmp    3d7 <printf+0x2c>
        putc(fd, c);
 4d4:	89 fa                	mov    %edi,%edx
 4d6:	8b 45 08             	mov    0x8(%ebp),%eax
 4d9:	e8 28 fe ff ff       	call   306 <putc>
      state = 0;
 4de:	be 00 00 00 00       	mov    $0x0,%esi
 4e3:	e9 ef fe ff ff       	jmp    3d7 <printf+0x2c>
        putc(fd, '%');
 4e8:	ba 25 00 00 00       	mov    $0x25,%edx
 4ed:	8b 45 08             	mov    0x8(%ebp),%eax
 4f0:	e8 11 fe ff ff       	call   306 <putc>
        putc(fd, c);
 4f5:	89 fa                	mov    %edi,%edx
 4f7:	8b 45 08             	mov    0x8(%ebp),%eax
 4fa:	e8 07 fe ff ff       	call   306 <putc>
      state = 0;
 4ff:	be 00 00 00 00       	mov    $0x0,%esi
 504:	e9 ce fe ff ff       	jmp    3d7 <printf+0x2c>
    }
  }
}
 509:	8d 65 f4             	lea    -0xc(%ebp),%esp
 50c:	5b                   	pop    %ebx
 50d:	5e                   	pop    %esi
 50e:	5f                   	pop    %edi
 50f:	5d                   	pop    %ebp
 510:	c3                   	ret    

00000511 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 511:	55                   	push   %ebp
 512:	89 e5                	mov    %esp,%ebp
 514:	57                   	push   %edi
 515:	56                   	push   %esi
 516:	53                   	push   %ebx
 517:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 51a:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 51d:	a1 30 0a 00 00       	mov    0xa30,%eax
 522:	eb 02                	jmp    526 <free+0x15>
 524:	89 d0                	mov    %edx,%eax
 526:	39 c8                	cmp    %ecx,%eax
 528:	73 04                	jae    52e <free+0x1d>
 52a:	39 08                	cmp    %ecx,(%eax)
 52c:	77 12                	ja     540 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 52e:	8b 10                	mov    (%eax),%edx
 530:	39 c2                	cmp    %eax,%edx
 532:	77 f0                	ja     524 <free+0x13>
 534:	39 c8                	cmp    %ecx,%eax
 536:	72 08                	jb     540 <free+0x2f>
 538:	39 ca                	cmp    %ecx,%edx
 53a:	77 04                	ja     540 <free+0x2f>
 53c:	89 d0                	mov    %edx,%eax
 53e:	eb e6                	jmp    526 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 540:	8b 73 fc             	mov    -0x4(%ebx),%esi
 543:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 546:	8b 10                	mov    (%eax),%edx
 548:	39 d7                	cmp    %edx,%edi
 54a:	74 19                	je     565 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 54c:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 54f:	8b 50 04             	mov    0x4(%eax),%edx
 552:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 555:	39 ce                	cmp    %ecx,%esi
 557:	74 1b                	je     574 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 559:	89 08                	mov    %ecx,(%eax)
  freep = p;
 55b:	a3 30 0a 00 00       	mov    %eax,0xa30
}
 560:	5b                   	pop    %ebx
 561:	5e                   	pop    %esi
 562:	5f                   	pop    %edi
 563:	5d                   	pop    %ebp
 564:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 565:	03 72 04             	add    0x4(%edx),%esi
 568:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 56b:	8b 10                	mov    (%eax),%edx
 56d:	8b 12                	mov    (%edx),%edx
 56f:	89 53 f8             	mov    %edx,-0x8(%ebx)
 572:	eb db                	jmp    54f <free+0x3e>
    p->s.size += bp->s.size;
 574:	03 53 fc             	add    -0x4(%ebx),%edx
 577:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 57a:	8b 53 f8             	mov    -0x8(%ebx),%edx
 57d:	89 10                	mov    %edx,(%eax)
 57f:	eb da                	jmp    55b <free+0x4a>

00000581 <morecore>:

static Header*
morecore(uint nu)
{
 581:	55                   	push   %ebp
 582:	89 e5                	mov    %esp,%ebp
 584:	53                   	push   %ebx
 585:	83 ec 04             	sub    $0x4,%esp
 588:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 58a:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 58f:	77 05                	ja     596 <morecore+0x15>
    nu = 4096;
 591:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 596:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 59d:	83 ec 0c             	sub    $0xc,%esp
 5a0:	50                   	push   %eax
 5a1:	e8 38 fd ff ff       	call   2de <sbrk>
  if(p == (char*)-1)
 5a6:	83 c4 10             	add    $0x10,%esp
 5a9:	83 f8 ff             	cmp    $0xffffffff,%eax
 5ac:	74 1c                	je     5ca <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 5ae:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 5b1:	83 c0 08             	add    $0x8,%eax
 5b4:	83 ec 0c             	sub    $0xc,%esp
 5b7:	50                   	push   %eax
 5b8:	e8 54 ff ff ff       	call   511 <free>
  return freep;
 5bd:	a1 30 0a 00 00       	mov    0xa30,%eax
 5c2:	83 c4 10             	add    $0x10,%esp
}
 5c5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5c8:	c9                   	leave  
 5c9:	c3                   	ret    
    return 0;
 5ca:	b8 00 00 00 00       	mov    $0x0,%eax
 5cf:	eb f4                	jmp    5c5 <morecore+0x44>

000005d1 <malloc>:

void*
malloc(uint nbytes)
{
 5d1:	55                   	push   %ebp
 5d2:	89 e5                	mov    %esp,%ebp
 5d4:	53                   	push   %ebx
 5d5:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 5d8:	8b 45 08             	mov    0x8(%ebp),%eax
 5db:	8d 58 07             	lea    0x7(%eax),%ebx
 5de:	c1 eb 03             	shr    $0x3,%ebx
 5e1:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 5e4:	8b 0d 30 0a 00 00    	mov    0xa30,%ecx
 5ea:	85 c9                	test   %ecx,%ecx
 5ec:	74 04                	je     5f2 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 5ee:	8b 01                	mov    (%ecx),%eax
 5f0:	eb 4a                	jmp    63c <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 5f2:	c7 05 30 0a 00 00 34 	movl   $0xa34,0xa30
 5f9:	0a 00 00 
 5fc:	c7 05 34 0a 00 00 34 	movl   $0xa34,0xa34
 603:	0a 00 00 
    base.s.size = 0;
 606:	c7 05 38 0a 00 00 00 	movl   $0x0,0xa38
 60d:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 610:	b9 34 0a 00 00       	mov    $0xa34,%ecx
 615:	eb d7                	jmp    5ee <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 617:	74 19                	je     632 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 619:	29 da                	sub    %ebx,%edx
 61b:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 61e:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 621:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 624:	89 0d 30 0a 00 00    	mov    %ecx,0xa30
      return (void*)(p + 1);
 62a:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 62d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 630:	c9                   	leave  
 631:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 632:	8b 10                	mov    (%eax),%edx
 634:	89 11                	mov    %edx,(%ecx)
 636:	eb ec                	jmp    624 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 638:	89 c1                	mov    %eax,%ecx
 63a:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 63c:	8b 50 04             	mov    0x4(%eax),%edx
 63f:	39 da                	cmp    %ebx,%edx
 641:	73 d4                	jae    617 <malloc+0x46>
    if(p == freep)
 643:	39 05 30 0a 00 00    	cmp    %eax,0xa30
 649:	75 ed                	jne    638 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 64b:	89 d8                	mov    %ebx,%eax
 64d:	e8 2f ff ff ff       	call   581 <morecore>
 652:	85 c0                	test   %eax,%eax
 654:	75 e2                	jne    638 <malloc+0x67>
 656:	eb d5                	jmp    62d <malloc+0x5c>
