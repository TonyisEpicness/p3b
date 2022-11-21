
_zombie:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(void)
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
   e:	83 ec 04             	sub    $0x4,%esp
  if(fork() > 0)
  11:	e8 0a 02 00 00       	call   220 <fork>
  16:	85 c0                	test   %eax,%eax
  18:	7f 05                	jg     1f <main+0x1f>
    sleep(5);  // Let child exit before parent.
  exit();
  1a:	e8 09 02 00 00       	call   228 <exit>
    sleep(5);  // Let child exit before parent.
  1f:	83 ec 0c             	sub    $0xc,%esp
  22:	6a 05                	push   $0x5
  24:	e8 8f 02 00 00       	call   2b8 <sleep>
  29:	83 c4 10             	add    $0x10,%esp
  2c:	eb ec                	jmp    1a <main+0x1a>

0000002e <test_and_set>:
#include "fcntl.h"
#include "user.h"
#include "x86.h"
#include "mmu.h"

int test_and_set(int *old_ptr, int new_ptr) {
  2e:	55                   	push   %ebp
  2f:	89 e5                	mov    %esp,%ebp
  31:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *old_ptr;
  34:	8b 10                	mov    (%eax),%edx
  *old_ptr = new_ptr;
  36:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  39:	89 08                	mov    %ecx,(%eax)
  return old;
}
  3b:	89 d0                	mov    %edx,%eax
  3d:	5d                   	pop    %ebp
  3e:	c3                   	ret    

0000003f <thread_create>:

  // I can't remember if there was something else to do here but I'm sure I'll find out


  return new_pid;
}
  3f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  44:	c3                   	ret    

00000045 <thread_join>:

int thread_join() {
  return 0;
}
  45:	b8 00 00 00 00       	mov    $0x0,%eax
  4a:	c3                   	ret    

0000004b <lock_acquire>:

void lock_acquire(lock_t *lock){
  4b:	55                   	push   %ebp
  4c:	89 e5                	mov    %esp,%ebp
  4e:	53                   	push   %ebx
  4f:	83 ec 04             	sub    $0x4,%esp
  52:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
  55:	83 ec 08             	sub    $0x8,%esp
  58:	6a 01                	push   $0x1
  5a:	53                   	push   %ebx
  5b:	e8 ce ff ff ff       	call   2e <test_and_set>
  60:	83 c4 10             	add    $0x10,%esp
  63:	83 f8 01             	cmp    $0x1,%eax
  66:	74 ed                	je     55 <lock_acquire+0xa>
    ;
}
  68:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  6b:	c9                   	leave  
  6c:	c3                   	ret    

0000006d <lock_release>:

void lock_release(lock_t *lock) {
  6d:	55                   	push   %ebp
  6e:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
  70:	8b 45 08             	mov    0x8(%ebp),%eax
  73:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
  79:	5d                   	pop    %ebp
  7a:	c3                   	ret    

0000007b <lock_init>:

void lock_init(lock_t *lock) {
  7b:	55                   	push   %ebp
  7c:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
  7e:	8b 45 08             	mov    0x8(%ebp),%eax
  81:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
  87:	5d                   	pop    %ebp
  88:	c3                   	ret    

00000089 <strcpy>:

char*
strcpy(char *s, const char *t)
{
  89:	55                   	push   %ebp
  8a:	89 e5                	mov    %esp,%ebp
  8c:	56                   	push   %esi
  8d:	53                   	push   %ebx
  8e:	8b 75 08             	mov    0x8(%ebp),%esi
  91:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  94:	89 f0                	mov    %esi,%eax
  96:	89 d1                	mov    %edx,%ecx
  98:	83 c2 01             	add    $0x1,%edx
  9b:	89 c3                	mov    %eax,%ebx
  9d:	83 c0 01             	add    $0x1,%eax
  a0:	0f b6 09             	movzbl (%ecx),%ecx
  a3:	88 0b                	mov    %cl,(%ebx)
  a5:	84 c9                	test   %cl,%cl
  a7:	75 ed                	jne    96 <strcpy+0xd>
    ;
  return os;
}
  a9:	89 f0                	mov    %esi,%eax
  ab:	5b                   	pop    %ebx
  ac:	5e                   	pop    %esi
  ad:	5d                   	pop    %ebp
  ae:	c3                   	ret    

000000af <strcmp>:

int
strcmp(const char *p, const char *q)
{
  af:	55                   	push   %ebp
  b0:	89 e5                	mov    %esp,%ebp
  b2:	8b 4d 08             	mov    0x8(%ebp),%ecx
  b5:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
  b8:	eb 06                	jmp    c0 <strcmp+0x11>
    p++, q++;
  ba:	83 c1 01             	add    $0x1,%ecx
  bd:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
  c0:	0f b6 01             	movzbl (%ecx),%eax
  c3:	84 c0                	test   %al,%al
  c5:	74 04                	je     cb <strcmp+0x1c>
  c7:	3a 02                	cmp    (%edx),%al
  c9:	74 ef                	je     ba <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
  cb:	0f b6 c0             	movzbl %al,%eax
  ce:	0f b6 12             	movzbl (%edx),%edx
  d1:	29 d0                	sub    %edx,%eax
}
  d3:	5d                   	pop    %ebp
  d4:	c3                   	ret    

000000d5 <strlen>:

uint
strlen(const char *s)
{
  d5:	55                   	push   %ebp
  d6:	89 e5                	mov    %esp,%ebp
  d8:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
  db:	b8 00 00 00 00       	mov    $0x0,%eax
  e0:	eb 03                	jmp    e5 <strlen+0x10>
  e2:	83 c0 01             	add    $0x1,%eax
  e5:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  e9:	75 f7                	jne    e2 <strlen+0xd>
    ;
  return n;
}
  eb:	5d                   	pop    %ebp
  ec:	c3                   	ret    

000000ed <memset>:

void*
memset(void *dst, int c, uint n)
{
  ed:	55                   	push   %ebp
  ee:	89 e5                	mov    %esp,%ebp
  f0:	57                   	push   %edi
  f1:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
  f4:	89 d7                	mov    %edx,%edi
  f6:	8b 4d 10             	mov    0x10(%ebp),%ecx
  f9:	8b 45 0c             	mov    0xc(%ebp),%eax
  fc:	fc                   	cld    
  fd:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
  ff:	89 d0                	mov    %edx,%eax
 101:	8b 7d fc             	mov    -0x4(%ebp),%edi
 104:	c9                   	leave  
 105:	c3                   	ret    

00000106 <strchr>:

char*
strchr(const char *s, char c)
{
 106:	55                   	push   %ebp
 107:	89 e5                	mov    %esp,%ebp
 109:	8b 45 08             	mov    0x8(%ebp),%eax
 10c:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 110:	eb 03                	jmp    115 <strchr+0xf>
 112:	83 c0 01             	add    $0x1,%eax
 115:	0f b6 10             	movzbl (%eax),%edx
 118:	84 d2                	test   %dl,%dl
 11a:	74 06                	je     122 <strchr+0x1c>
    if(*s == c)
 11c:	38 ca                	cmp    %cl,%dl
 11e:	75 f2                	jne    112 <strchr+0xc>
 120:	eb 05                	jmp    127 <strchr+0x21>
      return (char*)s;
  return 0;
 122:	b8 00 00 00 00       	mov    $0x0,%eax
}
 127:	5d                   	pop    %ebp
 128:	c3                   	ret    

00000129 <gets>:

char*
gets(char *buf, int max)
{
 129:	55                   	push   %ebp
 12a:	89 e5                	mov    %esp,%ebp
 12c:	57                   	push   %edi
 12d:	56                   	push   %esi
 12e:	53                   	push   %ebx
 12f:	83 ec 1c             	sub    $0x1c,%esp
 132:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 135:	bb 00 00 00 00       	mov    $0x0,%ebx
 13a:	89 de                	mov    %ebx,%esi
 13c:	83 c3 01             	add    $0x1,%ebx
 13f:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 142:	7d 2e                	jge    172 <gets+0x49>
    cc = read(0, &c, 1);
 144:	83 ec 04             	sub    $0x4,%esp
 147:	6a 01                	push   $0x1
 149:	8d 45 e7             	lea    -0x19(%ebp),%eax
 14c:	50                   	push   %eax
 14d:	6a 00                	push   $0x0
 14f:	e8 ec 00 00 00       	call   240 <read>
    if(cc < 1)
 154:	83 c4 10             	add    $0x10,%esp
 157:	85 c0                	test   %eax,%eax
 159:	7e 17                	jle    172 <gets+0x49>
      break;
    buf[i++] = c;
 15b:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 15f:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 162:	3c 0a                	cmp    $0xa,%al
 164:	0f 94 c2             	sete   %dl
 167:	3c 0d                	cmp    $0xd,%al
 169:	0f 94 c0             	sete   %al
 16c:	08 c2                	or     %al,%dl
 16e:	74 ca                	je     13a <gets+0x11>
    buf[i++] = c;
 170:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 172:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 176:	89 f8                	mov    %edi,%eax
 178:	8d 65 f4             	lea    -0xc(%ebp),%esp
 17b:	5b                   	pop    %ebx
 17c:	5e                   	pop    %esi
 17d:	5f                   	pop    %edi
 17e:	5d                   	pop    %ebp
 17f:	c3                   	ret    

00000180 <stat>:

int
stat(const char *n, struct stat *st)
{
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	56                   	push   %esi
 184:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 185:	83 ec 08             	sub    $0x8,%esp
 188:	6a 00                	push   $0x0
 18a:	ff 75 08             	push   0x8(%ebp)
 18d:	e8 d6 00 00 00       	call   268 <open>
  if(fd < 0)
 192:	83 c4 10             	add    $0x10,%esp
 195:	85 c0                	test   %eax,%eax
 197:	78 24                	js     1bd <stat+0x3d>
 199:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 19b:	83 ec 08             	sub    $0x8,%esp
 19e:	ff 75 0c             	push   0xc(%ebp)
 1a1:	50                   	push   %eax
 1a2:	e8 d9 00 00 00       	call   280 <fstat>
 1a7:	89 c6                	mov    %eax,%esi
  close(fd);
 1a9:	89 1c 24             	mov    %ebx,(%esp)
 1ac:	e8 9f 00 00 00       	call   250 <close>
  return r;
 1b1:	83 c4 10             	add    $0x10,%esp
}
 1b4:	89 f0                	mov    %esi,%eax
 1b6:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1b9:	5b                   	pop    %ebx
 1ba:	5e                   	pop    %esi
 1bb:	5d                   	pop    %ebp
 1bc:	c3                   	ret    
    return -1;
 1bd:	be ff ff ff ff       	mov    $0xffffffff,%esi
 1c2:	eb f0                	jmp    1b4 <stat+0x34>

000001c4 <atoi>:

int
atoi(const char *s)
{
 1c4:	55                   	push   %ebp
 1c5:	89 e5                	mov    %esp,%ebp
 1c7:	53                   	push   %ebx
 1c8:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 1cb:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 1d0:	eb 10                	jmp    1e2 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 1d2:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 1d5:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 1d8:	83 c1 01             	add    $0x1,%ecx
 1db:	0f be c0             	movsbl %al,%eax
 1de:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 1e2:	0f b6 01             	movzbl (%ecx),%eax
 1e5:	8d 58 d0             	lea    -0x30(%eax),%ebx
 1e8:	80 fb 09             	cmp    $0x9,%bl
 1eb:	76 e5                	jbe    1d2 <atoi+0xe>
  return n;
}
 1ed:	89 d0                	mov    %edx,%eax
 1ef:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1f2:	c9                   	leave  
 1f3:	c3                   	ret    

000001f4 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 1f4:	55                   	push   %ebp
 1f5:	89 e5                	mov    %esp,%ebp
 1f7:	56                   	push   %esi
 1f8:	53                   	push   %ebx
 1f9:	8b 75 08             	mov    0x8(%ebp),%esi
 1fc:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 1ff:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 202:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 204:	eb 0d                	jmp    213 <memmove+0x1f>
    *dst++ = *src++;
 206:	0f b6 01             	movzbl (%ecx),%eax
 209:	88 02                	mov    %al,(%edx)
 20b:	8d 49 01             	lea    0x1(%ecx),%ecx
 20e:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 211:	89 d8                	mov    %ebx,%eax
 213:	8d 58 ff             	lea    -0x1(%eax),%ebx
 216:	85 c0                	test   %eax,%eax
 218:	7f ec                	jg     206 <memmove+0x12>
  return vdst;
}
 21a:	89 f0                	mov    %esi,%eax
 21c:	5b                   	pop    %ebx
 21d:	5e                   	pop    %esi
 21e:	5d                   	pop    %ebp
 21f:	c3                   	ret    

00000220 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 220:	b8 01 00 00 00       	mov    $0x1,%eax
 225:	cd 40                	int    $0x40
 227:	c3                   	ret    

00000228 <exit>:
SYSCALL(exit)
 228:	b8 02 00 00 00       	mov    $0x2,%eax
 22d:	cd 40                	int    $0x40
 22f:	c3                   	ret    

00000230 <wait>:
SYSCALL(wait)
 230:	b8 03 00 00 00       	mov    $0x3,%eax
 235:	cd 40                	int    $0x40
 237:	c3                   	ret    

00000238 <pipe>:
SYSCALL(pipe)
 238:	b8 04 00 00 00       	mov    $0x4,%eax
 23d:	cd 40                	int    $0x40
 23f:	c3                   	ret    

00000240 <read>:
SYSCALL(read)
 240:	b8 05 00 00 00       	mov    $0x5,%eax
 245:	cd 40                	int    $0x40
 247:	c3                   	ret    

00000248 <write>:
SYSCALL(write)
 248:	b8 10 00 00 00       	mov    $0x10,%eax
 24d:	cd 40                	int    $0x40
 24f:	c3                   	ret    

00000250 <close>:
SYSCALL(close)
 250:	b8 15 00 00 00       	mov    $0x15,%eax
 255:	cd 40                	int    $0x40
 257:	c3                   	ret    

00000258 <kill>:
SYSCALL(kill)
 258:	b8 06 00 00 00       	mov    $0x6,%eax
 25d:	cd 40                	int    $0x40
 25f:	c3                   	ret    

00000260 <exec>:
SYSCALL(exec)
 260:	b8 07 00 00 00       	mov    $0x7,%eax
 265:	cd 40                	int    $0x40
 267:	c3                   	ret    

00000268 <open>:
SYSCALL(open)
 268:	b8 0f 00 00 00       	mov    $0xf,%eax
 26d:	cd 40                	int    $0x40
 26f:	c3                   	ret    

00000270 <mknod>:
SYSCALL(mknod)
 270:	b8 11 00 00 00       	mov    $0x11,%eax
 275:	cd 40                	int    $0x40
 277:	c3                   	ret    

00000278 <unlink>:
SYSCALL(unlink)
 278:	b8 12 00 00 00       	mov    $0x12,%eax
 27d:	cd 40                	int    $0x40
 27f:	c3                   	ret    

00000280 <fstat>:
SYSCALL(fstat)
 280:	b8 08 00 00 00       	mov    $0x8,%eax
 285:	cd 40                	int    $0x40
 287:	c3                   	ret    

00000288 <link>:
SYSCALL(link)
 288:	b8 13 00 00 00       	mov    $0x13,%eax
 28d:	cd 40                	int    $0x40
 28f:	c3                   	ret    

00000290 <mkdir>:
SYSCALL(mkdir)
 290:	b8 14 00 00 00       	mov    $0x14,%eax
 295:	cd 40                	int    $0x40
 297:	c3                   	ret    

00000298 <chdir>:
SYSCALL(chdir)
 298:	b8 09 00 00 00       	mov    $0x9,%eax
 29d:	cd 40                	int    $0x40
 29f:	c3                   	ret    

000002a0 <dup>:
SYSCALL(dup)
 2a0:	b8 0a 00 00 00       	mov    $0xa,%eax
 2a5:	cd 40                	int    $0x40
 2a7:	c3                   	ret    

000002a8 <getpid>:
SYSCALL(getpid)
 2a8:	b8 0b 00 00 00       	mov    $0xb,%eax
 2ad:	cd 40                	int    $0x40
 2af:	c3                   	ret    

000002b0 <sbrk>:
SYSCALL(sbrk)
 2b0:	b8 0c 00 00 00       	mov    $0xc,%eax
 2b5:	cd 40                	int    $0x40
 2b7:	c3                   	ret    

000002b8 <sleep>:
SYSCALL(sleep)
 2b8:	b8 0d 00 00 00       	mov    $0xd,%eax
 2bd:	cd 40                	int    $0x40
 2bf:	c3                   	ret    

000002c0 <uptime>:
SYSCALL(uptime)
 2c0:	b8 0e 00 00 00       	mov    $0xe,%eax
 2c5:	cd 40                	int    $0x40
 2c7:	c3                   	ret    

000002c8 <clone>:
SYSCALL(clone)
 2c8:	b8 16 00 00 00       	mov    $0x16,%eax
 2cd:	cd 40                	int    $0x40
 2cf:	c3                   	ret    

000002d0 <join>:
 2d0:	b8 17 00 00 00       	mov    $0x17,%eax
 2d5:	cd 40                	int    $0x40
 2d7:	c3                   	ret    

000002d8 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 2d8:	55                   	push   %ebp
 2d9:	89 e5                	mov    %esp,%ebp
 2db:	83 ec 1c             	sub    $0x1c,%esp
 2de:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 2e1:	6a 01                	push   $0x1
 2e3:	8d 55 f4             	lea    -0xc(%ebp),%edx
 2e6:	52                   	push   %edx
 2e7:	50                   	push   %eax
 2e8:	e8 5b ff ff ff       	call   248 <write>
}
 2ed:	83 c4 10             	add    $0x10,%esp
 2f0:	c9                   	leave  
 2f1:	c3                   	ret    

000002f2 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 2f2:	55                   	push   %ebp
 2f3:	89 e5                	mov    %esp,%ebp
 2f5:	57                   	push   %edi
 2f6:	56                   	push   %esi
 2f7:	53                   	push   %ebx
 2f8:	83 ec 2c             	sub    $0x2c,%esp
 2fb:	89 45 d0             	mov    %eax,-0x30(%ebp)
 2fe:	89 d0                	mov    %edx,%eax
 300:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 302:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 306:	0f 95 c1             	setne  %cl
 309:	c1 ea 1f             	shr    $0x1f,%edx
 30c:	84 d1                	test   %dl,%cl
 30e:	74 44                	je     354 <printint+0x62>
    neg = 1;
    x = -xx;
 310:	f7 d8                	neg    %eax
 312:	89 c1                	mov    %eax,%ecx
    neg = 1;
 314:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 31b:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 320:	89 c8                	mov    %ecx,%eax
 322:	ba 00 00 00 00       	mov    $0x0,%edx
 327:	f7 f6                	div    %esi
 329:	89 df                	mov    %ebx,%edi
 32b:	83 c3 01             	add    $0x1,%ebx
 32e:	0f b6 92 8c 06 00 00 	movzbl 0x68c(%edx),%edx
 335:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 339:	89 ca                	mov    %ecx,%edx
 33b:	89 c1                	mov    %eax,%ecx
 33d:	39 d6                	cmp    %edx,%esi
 33f:	76 df                	jbe    320 <printint+0x2e>
  if(neg)
 341:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 345:	74 31                	je     378 <printint+0x86>
    buf[i++] = '-';
 347:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 34c:	8d 5f 02             	lea    0x2(%edi),%ebx
 34f:	8b 75 d0             	mov    -0x30(%ebp),%esi
 352:	eb 17                	jmp    36b <printint+0x79>
    x = xx;
 354:	89 c1                	mov    %eax,%ecx
  neg = 0;
 356:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 35d:	eb bc                	jmp    31b <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 35f:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 364:	89 f0                	mov    %esi,%eax
 366:	e8 6d ff ff ff       	call   2d8 <putc>
  while(--i >= 0)
 36b:	83 eb 01             	sub    $0x1,%ebx
 36e:	79 ef                	jns    35f <printint+0x6d>
}
 370:	83 c4 2c             	add    $0x2c,%esp
 373:	5b                   	pop    %ebx
 374:	5e                   	pop    %esi
 375:	5f                   	pop    %edi
 376:	5d                   	pop    %ebp
 377:	c3                   	ret    
 378:	8b 75 d0             	mov    -0x30(%ebp),%esi
 37b:	eb ee                	jmp    36b <printint+0x79>

0000037d <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 37d:	55                   	push   %ebp
 37e:	89 e5                	mov    %esp,%ebp
 380:	57                   	push   %edi
 381:	56                   	push   %esi
 382:	53                   	push   %ebx
 383:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 386:	8d 45 10             	lea    0x10(%ebp),%eax
 389:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 38c:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 391:	bb 00 00 00 00       	mov    $0x0,%ebx
 396:	eb 14                	jmp    3ac <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 398:	89 fa                	mov    %edi,%edx
 39a:	8b 45 08             	mov    0x8(%ebp),%eax
 39d:	e8 36 ff ff ff       	call   2d8 <putc>
 3a2:	eb 05                	jmp    3a9 <printf+0x2c>
      }
    } else if(state == '%'){
 3a4:	83 fe 25             	cmp    $0x25,%esi
 3a7:	74 25                	je     3ce <printf+0x51>
  for(i = 0; fmt[i]; i++){
 3a9:	83 c3 01             	add    $0x1,%ebx
 3ac:	8b 45 0c             	mov    0xc(%ebp),%eax
 3af:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 3b3:	84 c0                	test   %al,%al
 3b5:	0f 84 20 01 00 00    	je     4db <printf+0x15e>
    c = fmt[i] & 0xff;
 3bb:	0f be f8             	movsbl %al,%edi
 3be:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 3c1:	85 f6                	test   %esi,%esi
 3c3:	75 df                	jne    3a4 <printf+0x27>
      if(c == '%'){
 3c5:	83 f8 25             	cmp    $0x25,%eax
 3c8:	75 ce                	jne    398 <printf+0x1b>
        state = '%';
 3ca:	89 c6                	mov    %eax,%esi
 3cc:	eb db                	jmp    3a9 <printf+0x2c>
      if(c == 'd'){
 3ce:	83 f8 25             	cmp    $0x25,%eax
 3d1:	0f 84 cf 00 00 00    	je     4a6 <printf+0x129>
 3d7:	0f 8c dd 00 00 00    	jl     4ba <printf+0x13d>
 3dd:	83 f8 78             	cmp    $0x78,%eax
 3e0:	0f 8f d4 00 00 00    	jg     4ba <printf+0x13d>
 3e6:	83 f8 63             	cmp    $0x63,%eax
 3e9:	0f 8c cb 00 00 00    	jl     4ba <printf+0x13d>
 3ef:	83 e8 63             	sub    $0x63,%eax
 3f2:	83 f8 15             	cmp    $0x15,%eax
 3f5:	0f 87 bf 00 00 00    	ja     4ba <printf+0x13d>
 3fb:	ff 24 85 34 06 00 00 	jmp    *0x634(,%eax,4)
        printint(fd, *ap, 10, 1);
 402:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 405:	8b 17                	mov    (%edi),%edx
 407:	83 ec 0c             	sub    $0xc,%esp
 40a:	6a 01                	push   $0x1
 40c:	b9 0a 00 00 00       	mov    $0xa,%ecx
 411:	8b 45 08             	mov    0x8(%ebp),%eax
 414:	e8 d9 fe ff ff       	call   2f2 <printint>
        ap++;
 419:	83 c7 04             	add    $0x4,%edi
 41c:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 41f:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 422:	be 00 00 00 00       	mov    $0x0,%esi
 427:	eb 80                	jmp    3a9 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 429:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 42c:	8b 17                	mov    (%edi),%edx
 42e:	83 ec 0c             	sub    $0xc,%esp
 431:	6a 00                	push   $0x0
 433:	b9 10 00 00 00       	mov    $0x10,%ecx
 438:	8b 45 08             	mov    0x8(%ebp),%eax
 43b:	e8 b2 fe ff ff       	call   2f2 <printint>
        ap++;
 440:	83 c7 04             	add    $0x4,%edi
 443:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 446:	83 c4 10             	add    $0x10,%esp
      state = 0;
 449:	be 00 00 00 00       	mov    $0x0,%esi
 44e:	e9 56 ff ff ff       	jmp    3a9 <printf+0x2c>
        s = (char*)*ap;
 453:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 456:	8b 30                	mov    (%eax),%esi
        ap++;
 458:	83 c0 04             	add    $0x4,%eax
 45b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 45e:	85 f6                	test   %esi,%esi
 460:	75 15                	jne    477 <printf+0xfa>
          s = "(null)";
 462:	be 2c 06 00 00       	mov    $0x62c,%esi
 467:	eb 0e                	jmp    477 <printf+0xfa>
          putc(fd, *s);
 469:	0f be d2             	movsbl %dl,%edx
 46c:	8b 45 08             	mov    0x8(%ebp),%eax
 46f:	e8 64 fe ff ff       	call   2d8 <putc>
          s++;
 474:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 477:	0f b6 16             	movzbl (%esi),%edx
 47a:	84 d2                	test   %dl,%dl
 47c:	75 eb                	jne    469 <printf+0xec>
      state = 0;
 47e:	be 00 00 00 00       	mov    $0x0,%esi
 483:	e9 21 ff ff ff       	jmp    3a9 <printf+0x2c>
        putc(fd, *ap);
 488:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 48b:	0f be 17             	movsbl (%edi),%edx
 48e:	8b 45 08             	mov    0x8(%ebp),%eax
 491:	e8 42 fe ff ff       	call   2d8 <putc>
        ap++;
 496:	83 c7 04             	add    $0x4,%edi
 499:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 49c:	be 00 00 00 00       	mov    $0x0,%esi
 4a1:	e9 03 ff ff ff       	jmp    3a9 <printf+0x2c>
        putc(fd, c);
 4a6:	89 fa                	mov    %edi,%edx
 4a8:	8b 45 08             	mov    0x8(%ebp),%eax
 4ab:	e8 28 fe ff ff       	call   2d8 <putc>
      state = 0;
 4b0:	be 00 00 00 00       	mov    $0x0,%esi
 4b5:	e9 ef fe ff ff       	jmp    3a9 <printf+0x2c>
        putc(fd, '%');
 4ba:	ba 25 00 00 00       	mov    $0x25,%edx
 4bf:	8b 45 08             	mov    0x8(%ebp),%eax
 4c2:	e8 11 fe ff ff       	call   2d8 <putc>
        putc(fd, c);
 4c7:	89 fa                	mov    %edi,%edx
 4c9:	8b 45 08             	mov    0x8(%ebp),%eax
 4cc:	e8 07 fe ff ff       	call   2d8 <putc>
      state = 0;
 4d1:	be 00 00 00 00       	mov    $0x0,%esi
 4d6:	e9 ce fe ff ff       	jmp    3a9 <printf+0x2c>
    }
  }
}
 4db:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4de:	5b                   	pop    %ebx
 4df:	5e                   	pop    %esi
 4e0:	5f                   	pop    %edi
 4e1:	5d                   	pop    %ebp
 4e2:	c3                   	ret    

000004e3 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 4e3:	55                   	push   %ebp
 4e4:	89 e5                	mov    %esp,%ebp
 4e6:	57                   	push   %edi
 4e7:	56                   	push   %esi
 4e8:	53                   	push   %ebx
 4e9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 4ec:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 4ef:	a1 d8 09 00 00       	mov    0x9d8,%eax
 4f4:	eb 02                	jmp    4f8 <free+0x15>
 4f6:	89 d0                	mov    %edx,%eax
 4f8:	39 c8                	cmp    %ecx,%eax
 4fa:	73 04                	jae    500 <free+0x1d>
 4fc:	39 08                	cmp    %ecx,(%eax)
 4fe:	77 12                	ja     512 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 500:	8b 10                	mov    (%eax),%edx
 502:	39 c2                	cmp    %eax,%edx
 504:	77 f0                	ja     4f6 <free+0x13>
 506:	39 c8                	cmp    %ecx,%eax
 508:	72 08                	jb     512 <free+0x2f>
 50a:	39 ca                	cmp    %ecx,%edx
 50c:	77 04                	ja     512 <free+0x2f>
 50e:	89 d0                	mov    %edx,%eax
 510:	eb e6                	jmp    4f8 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 512:	8b 73 fc             	mov    -0x4(%ebx),%esi
 515:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 518:	8b 10                	mov    (%eax),%edx
 51a:	39 d7                	cmp    %edx,%edi
 51c:	74 19                	je     537 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 51e:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 521:	8b 50 04             	mov    0x4(%eax),%edx
 524:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 527:	39 ce                	cmp    %ecx,%esi
 529:	74 1b                	je     546 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 52b:	89 08                	mov    %ecx,(%eax)
  freep = p;
 52d:	a3 d8 09 00 00       	mov    %eax,0x9d8
}
 532:	5b                   	pop    %ebx
 533:	5e                   	pop    %esi
 534:	5f                   	pop    %edi
 535:	5d                   	pop    %ebp
 536:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 537:	03 72 04             	add    0x4(%edx),%esi
 53a:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 53d:	8b 10                	mov    (%eax),%edx
 53f:	8b 12                	mov    (%edx),%edx
 541:	89 53 f8             	mov    %edx,-0x8(%ebx)
 544:	eb db                	jmp    521 <free+0x3e>
    p->s.size += bp->s.size;
 546:	03 53 fc             	add    -0x4(%ebx),%edx
 549:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 54c:	8b 53 f8             	mov    -0x8(%ebx),%edx
 54f:	89 10                	mov    %edx,(%eax)
 551:	eb da                	jmp    52d <free+0x4a>

00000553 <morecore>:

static Header*
morecore(uint nu)
{
 553:	55                   	push   %ebp
 554:	89 e5                	mov    %esp,%ebp
 556:	53                   	push   %ebx
 557:	83 ec 04             	sub    $0x4,%esp
 55a:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 55c:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 561:	77 05                	ja     568 <morecore+0x15>
    nu = 4096;
 563:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 568:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 56f:	83 ec 0c             	sub    $0xc,%esp
 572:	50                   	push   %eax
 573:	e8 38 fd ff ff       	call   2b0 <sbrk>
  if(p == (char*)-1)
 578:	83 c4 10             	add    $0x10,%esp
 57b:	83 f8 ff             	cmp    $0xffffffff,%eax
 57e:	74 1c                	je     59c <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 580:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 583:	83 c0 08             	add    $0x8,%eax
 586:	83 ec 0c             	sub    $0xc,%esp
 589:	50                   	push   %eax
 58a:	e8 54 ff ff ff       	call   4e3 <free>
  return freep;
 58f:	a1 d8 09 00 00       	mov    0x9d8,%eax
 594:	83 c4 10             	add    $0x10,%esp
}
 597:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 59a:	c9                   	leave  
 59b:	c3                   	ret    
    return 0;
 59c:	b8 00 00 00 00       	mov    $0x0,%eax
 5a1:	eb f4                	jmp    597 <morecore+0x44>

000005a3 <malloc>:

void*
malloc(uint nbytes)
{
 5a3:	55                   	push   %ebp
 5a4:	89 e5                	mov    %esp,%ebp
 5a6:	53                   	push   %ebx
 5a7:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 5aa:	8b 45 08             	mov    0x8(%ebp),%eax
 5ad:	8d 58 07             	lea    0x7(%eax),%ebx
 5b0:	c1 eb 03             	shr    $0x3,%ebx
 5b3:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 5b6:	8b 0d d8 09 00 00    	mov    0x9d8,%ecx
 5bc:	85 c9                	test   %ecx,%ecx
 5be:	74 04                	je     5c4 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 5c0:	8b 01                	mov    (%ecx),%eax
 5c2:	eb 4a                	jmp    60e <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 5c4:	c7 05 d8 09 00 00 dc 	movl   $0x9dc,0x9d8
 5cb:	09 00 00 
 5ce:	c7 05 dc 09 00 00 dc 	movl   $0x9dc,0x9dc
 5d5:	09 00 00 
    base.s.size = 0;
 5d8:	c7 05 e0 09 00 00 00 	movl   $0x0,0x9e0
 5df:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 5e2:	b9 dc 09 00 00       	mov    $0x9dc,%ecx
 5e7:	eb d7                	jmp    5c0 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 5e9:	74 19                	je     604 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 5eb:	29 da                	sub    %ebx,%edx
 5ed:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 5f0:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 5f3:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 5f6:	89 0d d8 09 00 00    	mov    %ecx,0x9d8
      return (void*)(p + 1);
 5fc:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 5ff:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 602:	c9                   	leave  
 603:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 604:	8b 10                	mov    (%eax),%edx
 606:	89 11                	mov    %edx,(%ecx)
 608:	eb ec                	jmp    5f6 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 60a:	89 c1                	mov    %eax,%ecx
 60c:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 60e:	8b 50 04             	mov    0x4(%eax),%edx
 611:	39 da                	cmp    %ebx,%edx
 613:	73 d4                	jae    5e9 <malloc+0x46>
    if(p == freep)
 615:	39 05 d8 09 00 00    	cmp    %eax,0x9d8
 61b:	75 ed                	jne    60a <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 61d:	89 d8                	mov    %ebx,%eax
 61f:	e8 2f ff ff ff       	call   553 <morecore>
 624:	85 c0                	test   %eax,%eax
 626:	75 e2                	jne    60a <malloc+0x67>
 628:	eb d5                	jmp    5ff <malloc+0x5c>
