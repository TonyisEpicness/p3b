
_rm:     file format elf32-i386


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
  11:	83 ec 18             	sub    $0x18,%esp
  14:	8b 39                	mov    (%ecx),%edi
  16:	8b 41 04             	mov    0x4(%ecx),%eax
  19:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  int i;

  if(argc < 2){
  1c:	83 ff 01             	cmp    $0x1,%edi
  1f:	7e 07                	jle    28 <main+0x28>
    printf(2, "Usage: rm files...\n");
    exit();
  }

  for(i = 1; i < argc; i++){
  21:	bb 01 00 00 00       	mov    $0x1,%ebx
  26:	eb 17                	jmp    3f <main+0x3f>
    printf(2, "Usage: rm files...\n");
  28:	83 ec 08             	sub    $0x8,%esp
  2b:	68 70 06 00 00       	push   $0x670
  30:	6a 02                	push   $0x2
  32:	e8 8b 03 00 00       	call   3c2 <printf>
    exit();
  37:	e8 31 02 00 00       	call   26d <exit>
  for(i = 1; i < argc; i++){
  3c:	83 c3 01             	add    $0x1,%ebx
  3f:	39 fb                	cmp    %edi,%ebx
  41:	7d 2b                	jge    6e <main+0x6e>
    if(unlink(argv[i]) < 0){
  43:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  46:	8d 34 98             	lea    (%eax,%ebx,4),%esi
  49:	83 ec 0c             	sub    $0xc,%esp
  4c:	ff 36                	push   (%esi)
  4e:	e8 6a 02 00 00       	call   2bd <unlink>
  53:	83 c4 10             	add    $0x10,%esp
  56:	85 c0                	test   %eax,%eax
  58:	79 e2                	jns    3c <main+0x3c>
      printf(2, "rm: %s failed to delete\n", argv[i]);
  5a:	83 ec 04             	sub    $0x4,%esp
  5d:	ff 36                	push   (%esi)
  5f:	68 84 06 00 00       	push   $0x684
  64:	6a 02                	push   $0x2
  66:	e8 57 03 00 00       	call   3c2 <printf>
      break;
  6b:	83 c4 10             	add    $0x10,%esp
    }
  }

  exit();
  6e:	e8 fa 01 00 00       	call   26d <exit>

00000073 <test_and_set>:
#include "fcntl.h"
#include "user.h"
#include "x86.h"
#include "mmu.h"

int test_and_set(int *old_ptr, int new_ptr) {
  73:	55                   	push   %ebp
  74:	89 e5                	mov    %esp,%ebp
  76:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *old_ptr;
  79:	8b 10                	mov    (%eax),%edx
  *old_ptr = new_ptr;
  7b:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  7e:	89 08                	mov    %ecx,(%eax)
  return old;
}
  80:	89 d0                	mov    %edx,%eax
  82:	5d                   	pop    %ebp
  83:	c3                   	ret    

00000084 <thread_create>:

  // I can't remember if there was something else to do here but I'm sure I'll find out


  return new_pid;
}
  84:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  89:	c3                   	ret    

0000008a <thread_join>:

int thread_join() {
  return 0;
}
  8a:	b8 00 00 00 00       	mov    $0x0,%eax
  8f:	c3                   	ret    

00000090 <lock_acquire>:

void lock_acquire(lock_t *lock){
  90:	55                   	push   %ebp
  91:	89 e5                	mov    %esp,%ebp
  93:	53                   	push   %ebx
  94:	83 ec 04             	sub    $0x4,%esp
  97:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
  9a:	83 ec 08             	sub    $0x8,%esp
  9d:	6a 01                	push   $0x1
  9f:	53                   	push   %ebx
  a0:	e8 ce ff ff ff       	call   73 <test_and_set>
  a5:	83 c4 10             	add    $0x10,%esp
  a8:	83 f8 01             	cmp    $0x1,%eax
  ab:	74 ed                	je     9a <lock_acquire+0xa>
    ;
}
  ad:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  b0:	c9                   	leave  
  b1:	c3                   	ret    

000000b2 <lock_release>:

void lock_release(lock_t *lock) {
  b2:	55                   	push   %ebp
  b3:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
  b5:	8b 45 08             	mov    0x8(%ebp),%eax
  b8:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
  be:	5d                   	pop    %ebp
  bf:	c3                   	ret    

000000c0 <lock_init>:

void lock_init(lock_t *lock) {
  c0:	55                   	push   %ebp
  c1:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
  c3:	8b 45 08             	mov    0x8(%ebp),%eax
  c6:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
  cc:	5d                   	pop    %ebp
  cd:	c3                   	ret    

000000ce <strcpy>:

char*
strcpy(char *s, const char *t)
{
  ce:	55                   	push   %ebp
  cf:	89 e5                	mov    %esp,%ebp
  d1:	56                   	push   %esi
  d2:	53                   	push   %ebx
  d3:	8b 75 08             	mov    0x8(%ebp),%esi
  d6:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  d9:	89 f0                	mov    %esi,%eax
  db:	89 d1                	mov    %edx,%ecx
  dd:	83 c2 01             	add    $0x1,%edx
  e0:	89 c3                	mov    %eax,%ebx
  e2:	83 c0 01             	add    $0x1,%eax
  e5:	0f b6 09             	movzbl (%ecx),%ecx
  e8:	88 0b                	mov    %cl,(%ebx)
  ea:	84 c9                	test   %cl,%cl
  ec:	75 ed                	jne    db <strcpy+0xd>
    ;
  return os;
}
  ee:	89 f0                	mov    %esi,%eax
  f0:	5b                   	pop    %ebx
  f1:	5e                   	pop    %esi
  f2:	5d                   	pop    %ebp
  f3:	c3                   	ret    

000000f4 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  f4:	55                   	push   %ebp
  f5:	89 e5                	mov    %esp,%ebp
  f7:	8b 4d 08             	mov    0x8(%ebp),%ecx
  fa:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
  fd:	eb 06                	jmp    105 <strcmp+0x11>
    p++, q++;
  ff:	83 c1 01             	add    $0x1,%ecx
 102:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 105:	0f b6 01             	movzbl (%ecx),%eax
 108:	84 c0                	test   %al,%al
 10a:	74 04                	je     110 <strcmp+0x1c>
 10c:	3a 02                	cmp    (%edx),%al
 10e:	74 ef                	je     ff <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 110:	0f b6 c0             	movzbl %al,%eax
 113:	0f b6 12             	movzbl (%edx),%edx
 116:	29 d0                	sub    %edx,%eax
}
 118:	5d                   	pop    %ebp
 119:	c3                   	ret    

0000011a <strlen>:

uint
strlen(const char *s)
{
 11a:	55                   	push   %ebp
 11b:	89 e5                	mov    %esp,%ebp
 11d:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 120:	b8 00 00 00 00       	mov    $0x0,%eax
 125:	eb 03                	jmp    12a <strlen+0x10>
 127:	83 c0 01             	add    $0x1,%eax
 12a:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 12e:	75 f7                	jne    127 <strlen+0xd>
    ;
  return n;
}
 130:	5d                   	pop    %ebp
 131:	c3                   	ret    

00000132 <memset>:

void*
memset(void *dst, int c, uint n)
{
 132:	55                   	push   %ebp
 133:	89 e5                	mov    %esp,%ebp
 135:	57                   	push   %edi
 136:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 139:	89 d7                	mov    %edx,%edi
 13b:	8b 4d 10             	mov    0x10(%ebp),%ecx
 13e:	8b 45 0c             	mov    0xc(%ebp),%eax
 141:	fc                   	cld    
 142:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 144:	89 d0                	mov    %edx,%eax
 146:	8b 7d fc             	mov    -0x4(%ebp),%edi
 149:	c9                   	leave  
 14a:	c3                   	ret    

0000014b <strchr>:

char*
strchr(const char *s, char c)
{
 14b:	55                   	push   %ebp
 14c:	89 e5                	mov    %esp,%ebp
 14e:	8b 45 08             	mov    0x8(%ebp),%eax
 151:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 155:	eb 03                	jmp    15a <strchr+0xf>
 157:	83 c0 01             	add    $0x1,%eax
 15a:	0f b6 10             	movzbl (%eax),%edx
 15d:	84 d2                	test   %dl,%dl
 15f:	74 06                	je     167 <strchr+0x1c>
    if(*s == c)
 161:	38 ca                	cmp    %cl,%dl
 163:	75 f2                	jne    157 <strchr+0xc>
 165:	eb 05                	jmp    16c <strchr+0x21>
      return (char*)s;
  return 0;
 167:	b8 00 00 00 00       	mov    $0x0,%eax
}
 16c:	5d                   	pop    %ebp
 16d:	c3                   	ret    

0000016e <gets>:

char*
gets(char *buf, int max)
{
 16e:	55                   	push   %ebp
 16f:	89 e5                	mov    %esp,%ebp
 171:	57                   	push   %edi
 172:	56                   	push   %esi
 173:	53                   	push   %ebx
 174:	83 ec 1c             	sub    $0x1c,%esp
 177:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 17a:	bb 00 00 00 00       	mov    $0x0,%ebx
 17f:	89 de                	mov    %ebx,%esi
 181:	83 c3 01             	add    $0x1,%ebx
 184:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 187:	7d 2e                	jge    1b7 <gets+0x49>
    cc = read(0, &c, 1);
 189:	83 ec 04             	sub    $0x4,%esp
 18c:	6a 01                	push   $0x1
 18e:	8d 45 e7             	lea    -0x19(%ebp),%eax
 191:	50                   	push   %eax
 192:	6a 00                	push   $0x0
 194:	e8 ec 00 00 00       	call   285 <read>
    if(cc < 1)
 199:	83 c4 10             	add    $0x10,%esp
 19c:	85 c0                	test   %eax,%eax
 19e:	7e 17                	jle    1b7 <gets+0x49>
      break;
    buf[i++] = c;
 1a0:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1a4:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 1a7:	3c 0a                	cmp    $0xa,%al
 1a9:	0f 94 c2             	sete   %dl
 1ac:	3c 0d                	cmp    $0xd,%al
 1ae:	0f 94 c0             	sete   %al
 1b1:	08 c2                	or     %al,%dl
 1b3:	74 ca                	je     17f <gets+0x11>
    buf[i++] = c;
 1b5:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 1b7:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 1bb:	89 f8                	mov    %edi,%eax
 1bd:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1c0:	5b                   	pop    %ebx
 1c1:	5e                   	pop    %esi
 1c2:	5f                   	pop    %edi
 1c3:	5d                   	pop    %ebp
 1c4:	c3                   	ret    

000001c5 <stat>:

int
stat(const char *n, struct stat *st)
{
 1c5:	55                   	push   %ebp
 1c6:	89 e5                	mov    %esp,%ebp
 1c8:	56                   	push   %esi
 1c9:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1ca:	83 ec 08             	sub    $0x8,%esp
 1cd:	6a 00                	push   $0x0
 1cf:	ff 75 08             	push   0x8(%ebp)
 1d2:	e8 d6 00 00 00       	call   2ad <open>
  if(fd < 0)
 1d7:	83 c4 10             	add    $0x10,%esp
 1da:	85 c0                	test   %eax,%eax
 1dc:	78 24                	js     202 <stat+0x3d>
 1de:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 1e0:	83 ec 08             	sub    $0x8,%esp
 1e3:	ff 75 0c             	push   0xc(%ebp)
 1e6:	50                   	push   %eax
 1e7:	e8 d9 00 00 00       	call   2c5 <fstat>
 1ec:	89 c6                	mov    %eax,%esi
  close(fd);
 1ee:	89 1c 24             	mov    %ebx,(%esp)
 1f1:	e8 9f 00 00 00       	call   295 <close>
  return r;
 1f6:	83 c4 10             	add    $0x10,%esp
}
 1f9:	89 f0                	mov    %esi,%eax
 1fb:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1fe:	5b                   	pop    %ebx
 1ff:	5e                   	pop    %esi
 200:	5d                   	pop    %ebp
 201:	c3                   	ret    
    return -1;
 202:	be ff ff ff ff       	mov    $0xffffffff,%esi
 207:	eb f0                	jmp    1f9 <stat+0x34>

00000209 <atoi>:

int
atoi(const char *s)
{
 209:	55                   	push   %ebp
 20a:	89 e5                	mov    %esp,%ebp
 20c:	53                   	push   %ebx
 20d:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 210:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 215:	eb 10                	jmp    227 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 217:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 21a:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 21d:	83 c1 01             	add    $0x1,%ecx
 220:	0f be c0             	movsbl %al,%eax
 223:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 227:	0f b6 01             	movzbl (%ecx),%eax
 22a:	8d 58 d0             	lea    -0x30(%eax),%ebx
 22d:	80 fb 09             	cmp    $0x9,%bl
 230:	76 e5                	jbe    217 <atoi+0xe>
  return n;
}
 232:	89 d0                	mov    %edx,%eax
 234:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 237:	c9                   	leave  
 238:	c3                   	ret    

00000239 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 239:	55                   	push   %ebp
 23a:	89 e5                	mov    %esp,%ebp
 23c:	56                   	push   %esi
 23d:	53                   	push   %ebx
 23e:	8b 75 08             	mov    0x8(%ebp),%esi
 241:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 244:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 247:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 249:	eb 0d                	jmp    258 <memmove+0x1f>
    *dst++ = *src++;
 24b:	0f b6 01             	movzbl (%ecx),%eax
 24e:	88 02                	mov    %al,(%edx)
 250:	8d 49 01             	lea    0x1(%ecx),%ecx
 253:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 256:	89 d8                	mov    %ebx,%eax
 258:	8d 58 ff             	lea    -0x1(%eax),%ebx
 25b:	85 c0                	test   %eax,%eax
 25d:	7f ec                	jg     24b <memmove+0x12>
  return vdst;
}
 25f:	89 f0                	mov    %esi,%eax
 261:	5b                   	pop    %ebx
 262:	5e                   	pop    %esi
 263:	5d                   	pop    %ebp
 264:	c3                   	ret    

00000265 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 265:	b8 01 00 00 00       	mov    $0x1,%eax
 26a:	cd 40                	int    $0x40
 26c:	c3                   	ret    

0000026d <exit>:
SYSCALL(exit)
 26d:	b8 02 00 00 00       	mov    $0x2,%eax
 272:	cd 40                	int    $0x40
 274:	c3                   	ret    

00000275 <wait>:
SYSCALL(wait)
 275:	b8 03 00 00 00       	mov    $0x3,%eax
 27a:	cd 40                	int    $0x40
 27c:	c3                   	ret    

0000027d <pipe>:
SYSCALL(pipe)
 27d:	b8 04 00 00 00       	mov    $0x4,%eax
 282:	cd 40                	int    $0x40
 284:	c3                   	ret    

00000285 <read>:
SYSCALL(read)
 285:	b8 05 00 00 00       	mov    $0x5,%eax
 28a:	cd 40                	int    $0x40
 28c:	c3                   	ret    

0000028d <write>:
SYSCALL(write)
 28d:	b8 10 00 00 00       	mov    $0x10,%eax
 292:	cd 40                	int    $0x40
 294:	c3                   	ret    

00000295 <close>:
SYSCALL(close)
 295:	b8 15 00 00 00       	mov    $0x15,%eax
 29a:	cd 40                	int    $0x40
 29c:	c3                   	ret    

0000029d <kill>:
SYSCALL(kill)
 29d:	b8 06 00 00 00       	mov    $0x6,%eax
 2a2:	cd 40                	int    $0x40
 2a4:	c3                   	ret    

000002a5 <exec>:
SYSCALL(exec)
 2a5:	b8 07 00 00 00       	mov    $0x7,%eax
 2aa:	cd 40                	int    $0x40
 2ac:	c3                   	ret    

000002ad <open>:
SYSCALL(open)
 2ad:	b8 0f 00 00 00       	mov    $0xf,%eax
 2b2:	cd 40                	int    $0x40
 2b4:	c3                   	ret    

000002b5 <mknod>:
SYSCALL(mknod)
 2b5:	b8 11 00 00 00       	mov    $0x11,%eax
 2ba:	cd 40                	int    $0x40
 2bc:	c3                   	ret    

000002bd <unlink>:
SYSCALL(unlink)
 2bd:	b8 12 00 00 00       	mov    $0x12,%eax
 2c2:	cd 40                	int    $0x40
 2c4:	c3                   	ret    

000002c5 <fstat>:
SYSCALL(fstat)
 2c5:	b8 08 00 00 00       	mov    $0x8,%eax
 2ca:	cd 40                	int    $0x40
 2cc:	c3                   	ret    

000002cd <link>:
SYSCALL(link)
 2cd:	b8 13 00 00 00       	mov    $0x13,%eax
 2d2:	cd 40                	int    $0x40
 2d4:	c3                   	ret    

000002d5 <mkdir>:
SYSCALL(mkdir)
 2d5:	b8 14 00 00 00       	mov    $0x14,%eax
 2da:	cd 40                	int    $0x40
 2dc:	c3                   	ret    

000002dd <chdir>:
SYSCALL(chdir)
 2dd:	b8 09 00 00 00       	mov    $0x9,%eax
 2e2:	cd 40                	int    $0x40
 2e4:	c3                   	ret    

000002e5 <dup>:
SYSCALL(dup)
 2e5:	b8 0a 00 00 00       	mov    $0xa,%eax
 2ea:	cd 40                	int    $0x40
 2ec:	c3                   	ret    

000002ed <getpid>:
SYSCALL(getpid)
 2ed:	b8 0b 00 00 00       	mov    $0xb,%eax
 2f2:	cd 40                	int    $0x40
 2f4:	c3                   	ret    

000002f5 <sbrk>:
SYSCALL(sbrk)
 2f5:	b8 0c 00 00 00       	mov    $0xc,%eax
 2fa:	cd 40                	int    $0x40
 2fc:	c3                   	ret    

000002fd <sleep>:
SYSCALL(sleep)
 2fd:	b8 0d 00 00 00       	mov    $0xd,%eax
 302:	cd 40                	int    $0x40
 304:	c3                   	ret    

00000305 <uptime>:
SYSCALL(uptime)
 305:	b8 0e 00 00 00       	mov    $0xe,%eax
 30a:	cd 40                	int    $0x40
 30c:	c3                   	ret    

0000030d <clone>:
SYSCALL(clone)
 30d:	b8 16 00 00 00       	mov    $0x16,%eax
 312:	cd 40                	int    $0x40
 314:	c3                   	ret    

00000315 <join>:
 315:	b8 17 00 00 00       	mov    $0x17,%eax
 31a:	cd 40                	int    $0x40
 31c:	c3                   	ret    

0000031d <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 31d:	55                   	push   %ebp
 31e:	89 e5                	mov    %esp,%ebp
 320:	83 ec 1c             	sub    $0x1c,%esp
 323:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 326:	6a 01                	push   $0x1
 328:	8d 55 f4             	lea    -0xc(%ebp),%edx
 32b:	52                   	push   %edx
 32c:	50                   	push   %eax
 32d:	e8 5b ff ff ff       	call   28d <write>
}
 332:	83 c4 10             	add    $0x10,%esp
 335:	c9                   	leave  
 336:	c3                   	ret    

00000337 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 337:	55                   	push   %ebp
 338:	89 e5                	mov    %esp,%ebp
 33a:	57                   	push   %edi
 33b:	56                   	push   %esi
 33c:	53                   	push   %ebx
 33d:	83 ec 2c             	sub    $0x2c,%esp
 340:	89 45 d0             	mov    %eax,-0x30(%ebp)
 343:	89 d0                	mov    %edx,%eax
 345:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 347:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 34b:	0f 95 c1             	setne  %cl
 34e:	c1 ea 1f             	shr    $0x1f,%edx
 351:	84 d1                	test   %dl,%cl
 353:	74 44                	je     399 <printint+0x62>
    neg = 1;
    x = -xx;
 355:	f7 d8                	neg    %eax
 357:	89 c1                	mov    %eax,%ecx
    neg = 1;
 359:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 360:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 365:	89 c8                	mov    %ecx,%eax
 367:	ba 00 00 00 00       	mov    $0x0,%edx
 36c:	f7 f6                	div    %esi
 36e:	89 df                	mov    %ebx,%edi
 370:	83 c3 01             	add    $0x1,%ebx
 373:	0f b6 92 fc 06 00 00 	movzbl 0x6fc(%edx),%edx
 37a:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 37e:	89 ca                	mov    %ecx,%edx
 380:	89 c1                	mov    %eax,%ecx
 382:	39 d6                	cmp    %edx,%esi
 384:	76 df                	jbe    365 <printint+0x2e>
  if(neg)
 386:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 38a:	74 31                	je     3bd <printint+0x86>
    buf[i++] = '-';
 38c:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 391:	8d 5f 02             	lea    0x2(%edi),%ebx
 394:	8b 75 d0             	mov    -0x30(%ebp),%esi
 397:	eb 17                	jmp    3b0 <printint+0x79>
    x = xx;
 399:	89 c1                	mov    %eax,%ecx
  neg = 0;
 39b:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 3a2:	eb bc                	jmp    360 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 3a4:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 3a9:	89 f0                	mov    %esi,%eax
 3ab:	e8 6d ff ff ff       	call   31d <putc>
  while(--i >= 0)
 3b0:	83 eb 01             	sub    $0x1,%ebx
 3b3:	79 ef                	jns    3a4 <printint+0x6d>
}
 3b5:	83 c4 2c             	add    $0x2c,%esp
 3b8:	5b                   	pop    %ebx
 3b9:	5e                   	pop    %esi
 3ba:	5f                   	pop    %edi
 3bb:	5d                   	pop    %ebp
 3bc:	c3                   	ret    
 3bd:	8b 75 d0             	mov    -0x30(%ebp),%esi
 3c0:	eb ee                	jmp    3b0 <printint+0x79>

000003c2 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 3c2:	55                   	push   %ebp
 3c3:	89 e5                	mov    %esp,%ebp
 3c5:	57                   	push   %edi
 3c6:	56                   	push   %esi
 3c7:	53                   	push   %ebx
 3c8:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 3cb:	8d 45 10             	lea    0x10(%ebp),%eax
 3ce:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 3d1:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 3d6:	bb 00 00 00 00       	mov    $0x0,%ebx
 3db:	eb 14                	jmp    3f1 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 3dd:	89 fa                	mov    %edi,%edx
 3df:	8b 45 08             	mov    0x8(%ebp),%eax
 3e2:	e8 36 ff ff ff       	call   31d <putc>
 3e7:	eb 05                	jmp    3ee <printf+0x2c>
      }
    } else if(state == '%'){
 3e9:	83 fe 25             	cmp    $0x25,%esi
 3ec:	74 25                	je     413 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 3ee:	83 c3 01             	add    $0x1,%ebx
 3f1:	8b 45 0c             	mov    0xc(%ebp),%eax
 3f4:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 3f8:	84 c0                	test   %al,%al
 3fa:	0f 84 20 01 00 00    	je     520 <printf+0x15e>
    c = fmt[i] & 0xff;
 400:	0f be f8             	movsbl %al,%edi
 403:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 406:	85 f6                	test   %esi,%esi
 408:	75 df                	jne    3e9 <printf+0x27>
      if(c == '%'){
 40a:	83 f8 25             	cmp    $0x25,%eax
 40d:	75 ce                	jne    3dd <printf+0x1b>
        state = '%';
 40f:	89 c6                	mov    %eax,%esi
 411:	eb db                	jmp    3ee <printf+0x2c>
      if(c == 'd'){
 413:	83 f8 25             	cmp    $0x25,%eax
 416:	0f 84 cf 00 00 00    	je     4eb <printf+0x129>
 41c:	0f 8c dd 00 00 00    	jl     4ff <printf+0x13d>
 422:	83 f8 78             	cmp    $0x78,%eax
 425:	0f 8f d4 00 00 00    	jg     4ff <printf+0x13d>
 42b:	83 f8 63             	cmp    $0x63,%eax
 42e:	0f 8c cb 00 00 00    	jl     4ff <printf+0x13d>
 434:	83 e8 63             	sub    $0x63,%eax
 437:	83 f8 15             	cmp    $0x15,%eax
 43a:	0f 87 bf 00 00 00    	ja     4ff <printf+0x13d>
 440:	ff 24 85 a4 06 00 00 	jmp    *0x6a4(,%eax,4)
        printint(fd, *ap, 10, 1);
 447:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 44a:	8b 17                	mov    (%edi),%edx
 44c:	83 ec 0c             	sub    $0xc,%esp
 44f:	6a 01                	push   $0x1
 451:	b9 0a 00 00 00       	mov    $0xa,%ecx
 456:	8b 45 08             	mov    0x8(%ebp),%eax
 459:	e8 d9 fe ff ff       	call   337 <printint>
        ap++;
 45e:	83 c7 04             	add    $0x4,%edi
 461:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 464:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 467:	be 00 00 00 00       	mov    $0x0,%esi
 46c:	eb 80                	jmp    3ee <printf+0x2c>
        printint(fd, *ap, 16, 0);
 46e:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 471:	8b 17                	mov    (%edi),%edx
 473:	83 ec 0c             	sub    $0xc,%esp
 476:	6a 00                	push   $0x0
 478:	b9 10 00 00 00       	mov    $0x10,%ecx
 47d:	8b 45 08             	mov    0x8(%ebp),%eax
 480:	e8 b2 fe ff ff       	call   337 <printint>
        ap++;
 485:	83 c7 04             	add    $0x4,%edi
 488:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 48b:	83 c4 10             	add    $0x10,%esp
      state = 0;
 48e:	be 00 00 00 00       	mov    $0x0,%esi
 493:	e9 56 ff ff ff       	jmp    3ee <printf+0x2c>
        s = (char*)*ap;
 498:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 49b:	8b 30                	mov    (%eax),%esi
        ap++;
 49d:	83 c0 04             	add    $0x4,%eax
 4a0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 4a3:	85 f6                	test   %esi,%esi
 4a5:	75 15                	jne    4bc <printf+0xfa>
          s = "(null)";
 4a7:	be 9d 06 00 00       	mov    $0x69d,%esi
 4ac:	eb 0e                	jmp    4bc <printf+0xfa>
          putc(fd, *s);
 4ae:	0f be d2             	movsbl %dl,%edx
 4b1:	8b 45 08             	mov    0x8(%ebp),%eax
 4b4:	e8 64 fe ff ff       	call   31d <putc>
          s++;
 4b9:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 4bc:	0f b6 16             	movzbl (%esi),%edx
 4bf:	84 d2                	test   %dl,%dl
 4c1:	75 eb                	jne    4ae <printf+0xec>
      state = 0;
 4c3:	be 00 00 00 00       	mov    $0x0,%esi
 4c8:	e9 21 ff ff ff       	jmp    3ee <printf+0x2c>
        putc(fd, *ap);
 4cd:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4d0:	0f be 17             	movsbl (%edi),%edx
 4d3:	8b 45 08             	mov    0x8(%ebp),%eax
 4d6:	e8 42 fe ff ff       	call   31d <putc>
        ap++;
 4db:	83 c7 04             	add    $0x4,%edi
 4de:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 4e1:	be 00 00 00 00       	mov    $0x0,%esi
 4e6:	e9 03 ff ff ff       	jmp    3ee <printf+0x2c>
        putc(fd, c);
 4eb:	89 fa                	mov    %edi,%edx
 4ed:	8b 45 08             	mov    0x8(%ebp),%eax
 4f0:	e8 28 fe ff ff       	call   31d <putc>
      state = 0;
 4f5:	be 00 00 00 00       	mov    $0x0,%esi
 4fa:	e9 ef fe ff ff       	jmp    3ee <printf+0x2c>
        putc(fd, '%');
 4ff:	ba 25 00 00 00       	mov    $0x25,%edx
 504:	8b 45 08             	mov    0x8(%ebp),%eax
 507:	e8 11 fe ff ff       	call   31d <putc>
        putc(fd, c);
 50c:	89 fa                	mov    %edi,%edx
 50e:	8b 45 08             	mov    0x8(%ebp),%eax
 511:	e8 07 fe ff ff       	call   31d <putc>
      state = 0;
 516:	be 00 00 00 00       	mov    $0x0,%esi
 51b:	e9 ce fe ff ff       	jmp    3ee <printf+0x2c>
    }
  }
}
 520:	8d 65 f4             	lea    -0xc(%ebp),%esp
 523:	5b                   	pop    %ebx
 524:	5e                   	pop    %esi
 525:	5f                   	pop    %edi
 526:	5d                   	pop    %ebp
 527:	c3                   	ret    

00000528 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 528:	55                   	push   %ebp
 529:	89 e5                	mov    %esp,%ebp
 52b:	57                   	push   %edi
 52c:	56                   	push   %esi
 52d:	53                   	push   %ebx
 52e:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 531:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 534:	a1 54 0a 00 00       	mov    0xa54,%eax
 539:	eb 02                	jmp    53d <free+0x15>
 53b:	89 d0                	mov    %edx,%eax
 53d:	39 c8                	cmp    %ecx,%eax
 53f:	73 04                	jae    545 <free+0x1d>
 541:	39 08                	cmp    %ecx,(%eax)
 543:	77 12                	ja     557 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 545:	8b 10                	mov    (%eax),%edx
 547:	39 c2                	cmp    %eax,%edx
 549:	77 f0                	ja     53b <free+0x13>
 54b:	39 c8                	cmp    %ecx,%eax
 54d:	72 08                	jb     557 <free+0x2f>
 54f:	39 ca                	cmp    %ecx,%edx
 551:	77 04                	ja     557 <free+0x2f>
 553:	89 d0                	mov    %edx,%eax
 555:	eb e6                	jmp    53d <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 557:	8b 73 fc             	mov    -0x4(%ebx),%esi
 55a:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 55d:	8b 10                	mov    (%eax),%edx
 55f:	39 d7                	cmp    %edx,%edi
 561:	74 19                	je     57c <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 563:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 566:	8b 50 04             	mov    0x4(%eax),%edx
 569:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 56c:	39 ce                	cmp    %ecx,%esi
 56e:	74 1b                	je     58b <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 570:	89 08                	mov    %ecx,(%eax)
  freep = p;
 572:	a3 54 0a 00 00       	mov    %eax,0xa54
}
 577:	5b                   	pop    %ebx
 578:	5e                   	pop    %esi
 579:	5f                   	pop    %edi
 57a:	5d                   	pop    %ebp
 57b:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 57c:	03 72 04             	add    0x4(%edx),%esi
 57f:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 582:	8b 10                	mov    (%eax),%edx
 584:	8b 12                	mov    (%edx),%edx
 586:	89 53 f8             	mov    %edx,-0x8(%ebx)
 589:	eb db                	jmp    566 <free+0x3e>
    p->s.size += bp->s.size;
 58b:	03 53 fc             	add    -0x4(%ebx),%edx
 58e:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 591:	8b 53 f8             	mov    -0x8(%ebx),%edx
 594:	89 10                	mov    %edx,(%eax)
 596:	eb da                	jmp    572 <free+0x4a>

00000598 <morecore>:

static Header*
morecore(uint nu)
{
 598:	55                   	push   %ebp
 599:	89 e5                	mov    %esp,%ebp
 59b:	53                   	push   %ebx
 59c:	83 ec 04             	sub    $0x4,%esp
 59f:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 5a1:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 5a6:	77 05                	ja     5ad <morecore+0x15>
    nu = 4096;
 5a8:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 5ad:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 5b4:	83 ec 0c             	sub    $0xc,%esp
 5b7:	50                   	push   %eax
 5b8:	e8 38 fd ff ff       	call   2f5 <sbrk>
  if(p == (char*)-1)
 5bd:	83 c4 10             	add    $0x10,%esp
 5c0:	83 f8 ff             	cmp    $0xffffffff,%eax
 5c3:	74 1c                	je     5e1 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 5c5:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 5c8:	83 c0 08             	add    $0x8,%eax
 5cb:	83 ec 0c             	sub    $0xc,%esp
 5ce:	50                   	push   %eax
 5cf:	e8 54 ff ff ff       	call   528 <free>
  return freep;
 5d4:	a1 54 0a 00 00       	mov    0xa54,%eax
 5d9:	83 c4 10             	add    $0x10,%esp
}
 5dc:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5df:	c9                   	leave  
 5e0:	c3                   	ret    
    return 0;
 5e1:	b8 00 00 00 00       	mov    $0x0,%eax
 5e6:	eb f4                	jmp    5dc <morecore+0x44>

000005e8 <malloc>:

void*
malloc(uint nbytes)
{
 5e8:	55                   	push   %ebp
 5e9:	89 e5                	mov    %esp,%ebp
 5eb:	53                   	push   %ebx
 5ec:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 5ef:	8b 45 08             	mov    0x8(%ebp),%eax
 5f2:	8d 58 07             	lea    0x7(%eax),%ebx
 5f5:	c1 eb 03             	shr    $0x3,%ebx
 5f8:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 5fb:	8b 0d 54 0a 00 00    	mov    0xa54,%ecx
 601:	85 c9                	test   %ecx,%ecx
 603:	74 04                	je     609 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 605:	8b 01                	mov    (%ecx),%eax
 607:	eb 4a                	jmp    653 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 609:	c7 05 54 0a 00 00 58 	movl   $0xa58,0xa54
 610:	0a 00 00 
 613:	c7 05 58 0a 00 00 58 	movl   $0xa58,0xa58
 61a:	0a 00 00 
    base.s.size = 0;
 61d:	c7 05 5c 0a 00 00 00 	movl   $0x0,0xa5c
 624:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 627:	b9 58 0a 00 00       	mov    $0xa58,%ecx
 62c:	eb d7                	jmp    605 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 62e:	74 19                	je     649 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 630:	29 da                	sub    %ebx,%edx
 632:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 635:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 638:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 63b:	89 0d 54 0a 00 00    	mov    %ecx,0xa54
      return (void*)(p + 1);
 641:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 644:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 647:	c9                   	leave  
 648:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 649:	8b 10                	mov    (%eax),%edx
 64b:	89 11                	mov    %edx,(%ecx)
 64d:	eb ec                	jmp    63b <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 64f:	89 c1                	mov    %eax,%ecx
 651:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 653:	8b 50 04             	mov    0x4(%eax),%edx
 656:	39 da                	cmp    %ebx,%edx
 658:	73 d4                	jae    62e <malloc+0x46>
    if(p == freep)
 65a:	39 05 54 0a 00 00    	cmp    %eax,0xa54
 660:	75 ed                	jne    64f <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 662:	89 d8                	mov    %ebx,%eax
 664:	e8 2f ff ff ff       	call   598 <morecore>
 669:	85 c0                	test   %eax,%eax
 66b:	75 e2                	jne    64f <malloc+0x67>
 66d:	eb d5                	jmp    644 <malloc+0x5c>
