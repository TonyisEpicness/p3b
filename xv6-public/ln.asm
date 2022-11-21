
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
  1a:	68 90 06 00 00       	push   $0x690
  1f:	6a 02                	push   $0x2
  21:	e8 bc 03 00 00       	call   3e2 <printf>
    exit();
  26:	e8 62 02 00 00       	call   28d <exit>
  }
  if(link(argv[1], argv[2]) < 0)
  2b:	83 ec 08             	sub    $0x8,%esp
  2e:	ff 73 08             	push   0x8(%ebx)
  31:	ff 73 04             	push   0x4(%ebx)
  34:	e8 b4 02 00 00       	call   2ed <link>
  39:	83 c4 10             	add    $0x10,%esp
  3c:	85 c0                	test   %eax,%eax
  3e:	78 05                	js     45 <main+0x45>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  exit();
  40:	e8 48 02 00 00       	call   28d <exit>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  45:	ff 73 08             	push   0x8(%ebx)
  48:	ff 73 04             	push   0x4(%ebx)
  4b:	68 a3 06 00 00       	push   $0x6a3
  50:	6a 02                	push   $0x2
  52:	e8 8b 03 00 00       	call   3e2 <printf>
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

// a wrapper func for clone
int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
  6d:	55                   	push   %ebp
  6e:	89 e5                	mov    %esp,%ebp
  70:	83 ec 14             	sub    $0x14,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE*2);
  73:	68 00 20 00 00       	push   $0x2000
  78:	e8 8b 05 00 00       	call   608 <malloc>
  if(n_stack == 0){
  7d:	83 c4 10             	add    $0x10,%esp
  80:	85 c0                	test   %eax,%eax
  82:	74 14                	je     98 <thread_create+0x2b>
    return -1;
  }
  int new_pid = clone(start_routine, arg1, arg2, n_stack); // TODO: is this the right way to call it?
  84:	50                   	push   %eax
  85:	ff 75 10             	push   0x10(%ebp)
  88:	ff 75 0c             	push   0xc(%ebp)
  8b:	ff 75 08             	push   0x8(%ebp)
  8e:	e8 9a 02 00 00       	call   32d <clone>


  // I can't remember if there was something else to do here but I'm sure I'll find out


  return new_pid;
  93:	83 c4 10             	add    $0x10,%esp
}
  96:	c9                   	leave  
  97:	c3                   	ret    
    return -1;
  98:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  9d:	eb f7                	jmp    96 <thread_create+0x29>

0000009f <thread_join>:

int thread_join() {
  9f:	55                   	push   %ebp
  a0:	89 e5                	mov    %esp,%ebp
  a2:	83 ec 24             	sub    $0x24,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
  a5:	8d 45 f4             	lea    -0xc(%ebp),%eax
  a8:	50                   	push   %eax
  a9:	e8 87 02 00 00       	call   335 <join>
  
  return pid;
}
  ae:	c9                   	leave  
  af:	c3                   	ret    

000000b0 <lock_acquire>:

void lock_acquire(lock_t *lock){
  b0:	55                   	push   %ebp
  b1:	89 e5                	mov    %esp,%ebp
  b3:	53                   	push   %ebx
  b4:	83 ec 04             	sub    $0x4,%esp
  b7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
  ba:	83 ec 08             	sub    $0x8,%esp
  bd:	6a 01                	push   $0x1
  bf:	53                   	push   %ebx
  c0:	e8 97 ff ff ff       	call   5c <test_and_set>
  c5:	83 c4 10             	add    $0x10,%esp
  c8:	83 f8 01             	cmp    $0x1,%eax
  cb:	74 ed                	je     ba <lock_acquire+0xa>
    ;
}
  cd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  d0:	c9                   	leave  
  d1:	c3                   	ret    

000000d2 <lock_release>:

void lock_release(lock_t *lock) {
  d2:	55                   	push   %ebp
  d3:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
  d5:	8b 45 08             	mov    0x8(%ebp),%eax
  d8:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
  de:	5d                   	pop    %ebp
  df:	c3                   	ret    

000000e0 <lock_init>:

void lock_init(lock_t *lock) {
  e0:	55                   	push   %ebp
  e1:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
  e3:	8b 45 08             	mov    0x8(%ebp),%eax
  e6:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
  ec:	5d                   	pop    %ebp
  ed:	c3                   	ret    

000000ee <strcpy>:

char*
strcpy(char *s, const char *t)
{
  ee:	55                   	push   %ebp
  ef:	89 e5                	mov    %esp,%ebp
  f1:	56                   	push   %esi
  f2:	53                   	push   %ebx
  f3:	8b 75 08             	mov    0x8(%ebp),%esi
  f6:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  f9:	89 f0                	mov    %esi,%eax
  fb:	89 d1                	mov    %edx,%ecx
  fd:	83 c2 01             	add    $0x1,%edx
 100:	89 c3                	mov    %eax,%ebx
 102:	83 c0 01             	add    $0x1,%eax
 105:	0f b6 09             	movzbl (%ecx),%ecx
 108:	88 0b                	mov    %cl,(%ebx)
 10a:	84 c9                	test   %cl,%cl
 10c:	75 ed                	jne    fb <strcpy+0xd>
    ;
  return os;
}
 10e:	89 f0                	mov    %esi,%eax
 110:	5b                   	pop    %ebx
 111:	5e                   	pop    %esi
 112:	5d                   	pop    %ebp
 113:	c3                   	ret    

00000114 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 114:	55                   	push   %ebp
 115:	89 e5                	mov    %esp,%ebp
 117:	8b 4d 08             	mov    0x8(%ebp),%ecx
 11a:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 11d:	eb 06                	jmp    125 <strcmp+0x11>
    p++, q++;
 11f:	83 c1 01             	add    $0x1,%ecx
 122:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 125:	0f b6 01             	movzbl (%ecx),%eax
 128:	84 c0                	test   %al,%al
 12a:	74 04                	je     130 <strcmp+0x1c>
 12c:	3a 02                	cmp    (%edx),%al
 12e:	74 ef                	je     11f <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 130:	0f b6 c0             	movzbl %al,%eax
 133:	0f b6 12             	movzbl (%edx),%edx
 136:	29 d0                	sub    %edx,%eax
}
 138:	5d                   	pop    %ebp
 139:	c3                   	ret    

0000013a <strlen>:

uint
strlen(const char *s)
{
 13a:	55                   	push   %ebp
 13b:	89 e5                	mov    %esp,%ebp
 13d:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 140:	b8 00 00 00 00       	mov    $0x0,%eax
 145:	eb 03                	jmp    14a <strlen+0x10>
 147:	83 c0 01             	add    $0x1,%eax
 14a:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 14e:	75 f7                	jne    147 <strlen+0xd>
    ;
  return n;
}
 150:	5d                   	pop    %ebp
 151:	c3                   	ret    

00000152 <memset>:

void*
memset(void *dst, int c, uint n)
{
 152:	55                   	push   %ebp
 153:	89 e5                	mov    %esp,%ebp
 155:	57                   	push   %edi
 156:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 159:	89 d7                	mov    %edx,%edi
 15b:	8b 4d 10             	mov    0x10(%ebp),%ecx
 15e:	8b 45 0c             	mov    0xc(%ebp),%eax
 161:	fc                   	cld    
 162:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 164:	89 d0                	mov    %edx,%eax
 166:	8b 7d fc             	mov    -0x4(%ebp),%edi
 169:	c9                   	leave  
 16a:	c3                   	ret    

0000016b <strchr>:

char*
strchr(const char *s, char c)
{
 16b:	55                   	push   %ebp
 16c:	89 e5                	mov    %esp,%ebp
 16e:	8b 45 08             	mov    0x8(%ebp),%eax
 171:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 175:	eb 03                	jmp    17a <strchr+0xf>
 177:	83 c0 01             	add    $0x1,%eax
 17a:	0f b6 10             	movzbl (%eax),%edx
 17d:	84 d2                	test   %dl,%dl
 17f:	74 06                	je     187 <strchr+0x1c>
    if(*s == c)
 181:	38 ca                	cmp    %cl,%dl
 183:	75 f2                	jne    177 <strchr+0xc>
 185:	eb 05                	jmp    18c <strchr+0x21>
      return (char*)s;
  return 0;
 187:	b8 00 00 00 00       	mov    $0x0,%eax
}
 18c:	5d                   	pop    %ebp
 18d:	c3                   	ret    

0000018e <gets>:

char*
gets(char *buf, int max)
{
 18e:	55                   	push   %ebp
 18f:	89 e5                	mov    %esp,%ebp
 191:	57                   	push   %edi
 192:	56                   	push   %esi
 193:	53                   	push   %ebx
 194:	83 ec 1c             	sub    $0x1c,%esp
 197:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 19a:	bb 00 00 00 00       	mov    $0x0,%ebx
 19f:	89 de                	mov    %ebx,%esi
 1a1:	83 c3 01             	add    $0x1,%ebx
 1a4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1a7:	7d 2e                	jge    1d7 <gets+0x49>
    cc = read(0, &c, 1);
 1a9:	83 ec 04             	sub    $0x4,%esp
 1ac:	6a 01                	push   $0x1
 1ae:	8d 45 e7             	lea    -0x19(%ebp),%eax
 1b1:	50                   	push   %eax
 1b2:	6a 00                	push   $0x0
 1b4:	e8 ec 00 00 00       	call   2a5 <read>
    if(cc < 1)
 1b9:	83 c4 10             	add    $0x10,%esp
 1bc:	85 c0                	test   %eax,%eax
 1be:	7e 17                	jle    1d7 <gets+0x49>
      break;
    buf[i++] = c;
 1c0:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1c4:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 1c7:	3c 0a                	cmp    $0xa,%al
 1c9:	0f 94 c2             	sete   %dl
 1cc:	3c 0d                	cmp    $0xd,%al
 1ce:	0f 94 c0             	sete   %al
 1d1:	08 c2                	or     %al,%dl
 1d3:	74 ca                	je     19f <gets+0x11>
    buf[i++] = c;
 1d5:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 1d7:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 1db:	89 f8                	mov    %edi,%eax
 1dd:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1e0:	5b                   	pop    %ebx
 1e1:	5e                   	pop    %esi
 1e2:	5f                   	pop    %edi
 1e3:	5d                   	pop    %ebp
 1e4:	c3                   	ret    

000001e5 <stat>:

int
stat(const char *n, struct stat *st)
{
 1e5:	55                   	push   %ebp
 1e6:	89 e5                	mov    %esp,%ebp
 1e8:	56                   	push   %esi
 1e9:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1ea:	83 ec 08             	sub    $0x8,%esp
 1ed:	6a 00                	push   $0x0
 1ef:	ff 75 08             	push   0x8(%ebp)
 1f2:	e8 d6 00 00 00       	call   2cd <open>
  if(fd < 0)
 1f7:	83 c4 10             	add    $0x10,%esp
 1fa:	85 c0                	test   %eax,%eax
 1fc:	78 24                	js     222 <stat+0x3d>
 1fe:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 200:	83 ec 08             	sub    $0x8,%esp
 203:	ff 75 0c             	push   0xc(%ebp)
 206:	50                   	push   %eax
 207:	e8 d9 00 00 00       	call   2e5 <fstat>
 20c:	89 c6                	mov    %eax,%esi
  close(fd);
 20e:	89 1c 24             	mov    %ebx,(%esp)
 211:	e8 9f 00 00 00       	call   2b5 <close>
  return r;
 216:	83 c4 10             	add    $0x10,%esp
}
 219:	89 f0                	mov    %esi,%eax
 21b:	8d 65 f8             	lea    -0x8(%ebp),%esp
 21e:	5b                   	pop    %ebx
 21f:	5e                   	pop    %esi
 220:	5d                   	pop    %ebp
 221:	c3                   	ret    
    return -1;
 222:	be ff ff ff ff       	mov    $0xffffffff,%esi
 227:	eb f0                	jmp    219 <stat+0x34>

00000229 <atoi>:

int
atoi(const char *s)
{
 229:	55                   	push   %ebp
 22a:	89 e5                	mov    %esp,%ebp
 22c:	53                   	push   %ebx
 22d:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 230:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 235:	eb 10                	jmp    247 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 237:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 23a:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 23d:	83 c1 01             	add    $0x1,%ecx
 240:	0f be c0             	movsbl %al,%eax
 243:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 247:	0f b6 01             	movzbl (%ecx),%eax
 24a:	8d 58 d0             	lea    -0x30(%eax),%ebx
 24d:	80 fb 09             	cmp    $0x9,%bl
 250:	76 e5                	jbe    237 <atoi+0xe>
  return n;
}
 252:	89 d0                	mov    %edx,%eax
 254:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 257:	c9                   	leave  
 258:	c3                   	ret    

00000259 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 259:	55                   	push   %ebp
 25a:	89 e5                	mov    %esp,%ebp
 25c:	56                   	push   %esi
 25d:	53                   	push   %ebx
 25e:	8b 75 08             	mov    0x8(%ebp),%esi
 261:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 264:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 267:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 269:	eb 0d                	jmp    278 <memmove+0x1f>
    *dst++ = *src++;
 26b:	0f b6 01             	movzbl (%ecx),%eax
 26e:	88 02                	mov    %al,(%edx)
 270:	8d 49 01             	lea    0x1(%ecx),%ecx
 273:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 276:	89 d8                	mov    %ebx,%eax
 278:	8d 58 ff             	lea    -0x1(%eax),%ebx
 27b:	85 c0                	test   %eax,%eax
 27d:	7f ec                	jg     26b <memmove+0x12>
  return vdst;
}
 27f:	89 f0                	mov    %esi,%eax
 281:	5b                   	pop    %ebx
 282:	5e                   	pop    %esi
 283:	5d                   	pop    %ebp
 284:	c3                   	ret    

00000285 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 285:	b8 01 00 00 00       	mov    $0x1,%eax
 28a:	cd 40                	int    $0x40
 28c:	c3                   	ret    

0000028d <exit>:
SYSCALL(exit)
 28d:	b8 02 00 00 00       	mov    $0x2,%eax
 292:	cd 40                	int    $0x40
 294:	c3                   	ret    

00000295 <wait>:
SYSCALL(wait)
 295:	b8 03 00 00 00       	mov    $0x3,%eax
 29a:	cd 40                	int    $0x40
 29c:	c3                   	ret    

0000029d <pipe>:
SYSCALL(pipe)
 29d:	b8 04 00 00 00       	mov    $0x4,%eax
 2a2:	cd 40                	int    $0x40
 2a4:	c3                   	ret    

000002a5 <read>:
SYSCALL(read)
 2a5:	b8 05 00 00 00       	mov    $0x5,%eax
 2aa:	cd 40                	int    $0x40
 2ac:	c3                   	ret    

000002ad <write>:
SYSCALL(write)
 2ad:	b8 10 00 00 00       	mov    $0x10,%eax
 2b2:	cd 40                	int    $0x40
 2b4:	c3                   	ret    

000002b5 <close>:
SYSCALL(close)
 2b5:	b8 15 00 00 00       	mov    $0x15,%eax
 2ba:	cd 40                	int    $0x40
 2bc:	c3                   	ret    

000002bd <kill>:
SYSCALL(kill)
 2bd:	b8 06 00 00 00       	mov    $0x6,%eax
 2c2:	cd 40                	int    $0x40
 2c4:	c3                   	ret    

000002c5 <exec>:
SYSCALL(exec)
 2c5:	b8 07 00 00 00       	mov    $0x7,%eax
 2ca:	cd 40                	int    $0x40
 2cc:	c3                   	ret    

000002cd <open>:
SYSCALL(open)
 2cd:	b8 0f 00 00 00       	mov    $0xf,%eax
 2d2:	cd 40                	int    $0x40
 2d4:	c3                   	ret    

000002d5 <mknod>:
SYSCALL(mknod)
 2d5:	b8 11 00 00 00       	mov    $0x11,%eax
 2da:	cd 40                	int    $0x40
 2dc:	c3                   	ret    

000002dd <unlink>:
SYSCALL(unlink)
 2dd:	b8 12 00 00 00       	mov    $0x12,%eax
 2e2:	cd 40                	int    $0x40
 2e4:	c3                   	ret    

000002e5 <fstat>:
SYSCALL(fstat)
 2e5:	b8 08 00 00 00       	mov    $0x8,%eax
 2ea:	cd 40                	int    $0x40
 2ec:	c3                   	ret    

000002ed <link>:
SYSCALL(link)
 2ed:	b8 13 00 00 00       	mov    $0x13,%eax
 2f2:	cd 40                	int    $0x40
 2f4:	c3                   	ret    

000002f5 <mkdir>:
SYSCALL(mkdir)
 2f5:	b8 14 00 00 00       	mov    $0x14,%eax
 2fa:	cd 40                	int    $0x40
 2fc:	c3                   	ret    

000002fd <chdir>:
SYSCALL(chdir)
 2fd:	b8 09 00 00 00       	mov    $0x9,%eax
 302:	cd 40                	int    $0x40
 304:	c3                   	ret    

00000305 <dup>:
SYSCALL(dup)
 305:	b8 0a 00 00 00       	mov    $0xa,%eax
 30a:	cd 40                	int    $0x40
 30c:	c3                   	ret    

0000030d <getpid>:
SYSCALL(getpid)
 30d:	b8 0b 00 00 00       	mov    $0xb,%eax
 312:	cd 40                	int    $0x40
 314:	c3                   	ret    

00000315 <sbrk>:
SYSCALL(sbrk)
 315:	b8 0c 00 00 00       	mov    $0xc,%eax
 31a:	cd 40                	int    $0x40
 31c:	c3                   	ret    

0000031d <sleep>:
SYSCALL(sleep)
 31d:	b8 0d 00 00 00       	mov    $0xd,%eax
 322:	cd 40                	int    $0x40
 324:	c3                   	ret    

00000325 <uptime>:
SYSCALL(uptime)
 325:	b8 0e 00 00 00       	mov    $0xe,%eax
 32a:	cd 40                	int    $0x40
 32c:	c3                   	ret    

0000032d <clone>:
SYSCALL(clone)
 32d:	b8 16 00 00 00       	mov    $0x16,%eax
 332:	cd 40                	int    $0x40
 334:	c3                   	ret    

00000335 <join>:
 335:	b8 17 00 00 00       	mov    $0x17,%eax
 33a:	cd 40                	int    $0x40
 33c:	c3                   	ret    

0000033d <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 33d:	55                   	push   %ebp
 33e:	89 e5                	mov    %esp,%ebp
 340:	83 ec 1c             	sub    $0x1c,%esp
 343:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 346:	6a 01                	push   $0x1
 348:	8d 55 f4             	lea    -0xc(%ebp),%edx
 34b:	52                   	push   %edx
 34c:	50                   	push   %eax
 34d:	e8 5b ff ff ff       	call   2ad <write>
}
 352:	83 c4 10             	add    $0x10,%esp
 355:	c9                   	leave  
 356:	c3                   	ret    

00000357 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 357:	55                   	push   %ebp
 358:	89 e5                	mov    %esp,%ebp
 35a:	57                   	push   %edi
 35b:	56                   	push   %esi
 35c:	53                   	push   %ebx
 35d:	83 ec 2c             	sub    $0x2c,%esp
 360:	89 45 d0             	mov    %eax,-0x30(%ebp)
 363:	89 d0                	mov    %edx,%eax
 365:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 367:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 36b:	0f 95 c1             	setne  %cl
 36e:	c1 ea 1f             	shr    $0x1f,%edx
 371:	84 d1                	test   %dl,%cl
 373:	74 44                	je     3b9 <printint+0x62>
    neg = 1;
    x = -xx;
 375:	f7 d8                	neg    %eax
 377:	89 c1                	mov    %eax,%ecx
    neg = 1;
 379:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 380:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 385:	89 c8                	mov    %ecx,%eax
 387:	ba 00 00 00 00       	mov    $0x0,%edx
 38c:	f7 f6                	div    %esi
 38e:	89 df                	mov    %ebx,%edi
 390:	83 c3 01             	add    $0x1,%ebx
 393:	0f b6 92 18 07 00 00 	movzbl 0x718(%edx),%edx
 39a:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 39e:	89 ca                	mov    %ecx,%edx
 3a0:	89 c1                	mov    %eax,%ecx
 3a2:	39 d6                	cmp    %edx,%esi
 3a4:	76 df                	jbe    385 <printint+0x2e>
  if(neg)
 3a6:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 3aa:	74 31                	je     3dd <printint+0x86>
    buf[i++] = '-';
 3ac:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 3b1:	8d 5f 02             	lea    0x2(%edi),%ebx
 3b4:	8b 75 d0             	mov    -0x30(%ebp),%esi
 3b7:	eb 17                	jmp    3d0 <printint+0x79>
    x = xx;
 3b9:	89 c1                	mov    %eax,%ecx
  neg = 0;
 3bb:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 3c2:	eb bc                	jmp    380 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 3c4:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 3c9:	89 f0                	mov    %esi,%eax
 3cb:	e8 6d ff ff ff       	call   33d <putc>
  while(--i >= 0)
 3d0:	83 eb 01             	sub    $0x1,%ebx
 3d3:	79 ef                	jns    3c4 <printint+0x6d>
}
 3d5:	83 c4 2c             	add    $0x2c,%esp
 3d8:	5b                   	pop    %ebx
 3d9:	5e                   	pop    %esi
 3da:	5f                   	pop    %edi
 3db:	5d                   	pop    %ebp
 3dc:	c3                   	ret    
 3dd:	8b 75 d0             	mov    -0x30(%ebp),%esi
 3e0:	eb ee                	jmp    3d0 <printint+0x79>

000003e2 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 3e2:	55                   	push   %ebp
 3e3:	89 e5                	mov    %esp,%ebp
 3e5:	57                   	push   %edi
 3e6:	56                   	push   %esi
 3e7:	53                   	push   %ebx
 3e8:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 3eb:	8d 45 10             	lea    0x10(%ebp),%eax
 3ee:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 3f1:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 3f6:	bb 00 00 00 00       	mov    $0x0,%ebx
 3fb:	eb 14                	jmp    411 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 3fd:	89 fa                	mov    %edi,%edx
 3ff:	8b 45 08             	mov    0x8(%ebp),%eax
 402:	e8 36 ff ff ff       	call   33d <putc>
 407:	eb 05                	jmp    40e <printf+0x2c>
      }
    } else if(state == '%'){
 409:	83 fe 25             	cmp    $0x25,%esi
 40c:	74 25                	je     433 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 40e:	83 c3 01             	add    $0x1,%ebx
 411:	8b 45 0c             	mov    0xc(%ebp),%eax
 414:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 418:	84 c0                	test   %al,%al
 41a:	0f 84 20 01 00 00    	je     540 <printf+0x15e>
    c = fmt[i] & 0xff;
 420:	0f be f8             	movsbl %al,%edi
 423:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 426:	85 f6                	test   %esi,%esi
 428:	75 df                	jne    409 <printf+0x27>
      if(c == '%'){
 42a:	83 f8 25             	cmp    $0x25,%eax
 42d:	75 ce                	jne    3fd <printf+0x1b>
        state = '%';
 42f:	89 c6                	mov    %eax,%esi
 431:	eb db                	jmp    40e <printf+0x2c>
      if(c == 'd'){
 433:	83 f8 25             	cmp    $0x25,%eax
 436:	0f 84 cf 00 00 00    	je     50b <printf+0x129>
 43c:	0f 8c dd 00 00 00    	jl     51f <printf+0x13d>
 442:	83 f8 78             	cmp    $0x78,%eax
 445:	0f 8f d4 00 00 00    	jg     51f <printf+0x13d>
 44b:	83 f8 63             	cmp    $0x63,%eax
 44e:	0f 8c cb 00 00 00    	jl     51f <printf+0x13d>
 454:	83 e8 63             	sub    $0x63,%eax
 457:	83 f8 15             	cmp    $0x15,%eax
 45a:	0f 87 bf 00 00 00    	ja     51f <printf+0x13d>
 460:	ff 24 85 c0 06 00 00 	jmp    *0x6c0(,%eax,4)
        printint(fd, *ap, 10, 1);
 467:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 46a:	8b 17                	mov    (%edi),%edx
 46c:	83 ec 0c             	sub    $0xc,%esp
 46f:	6a 01                	push   $0x1
 471:	b9 0a 00 00 00       	mov    $0xa,%ecx
 476:	8b 45 08             	mov    0x8(%ebp),%eax
 479:	e8 d9 fe ff ff       	call   357 <printint>
        ap++;
 47e:	83 c7 04             	add    $0x4,%edi
 481:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 484:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 487:	be 00 00 00 00       	mov    $0x0,%esi
 48c:	eb 80                	jmp    40e <printf+0x2c>
        printint(fd, *ap, 16, 0);
 48e:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 491:	8b 17                	mov    (%edi),%edx
 493:	83 ec 0c             	sub    $0xc,%esp
 496:	6a 00                	push   $0x0
 498:	b9 10 00 00 00       	mov    $0x10,%ecx
 49d:	8b 45 08             	mov    0x8(%ebp),%eax
 4a0:	e8 b2 fe ff ff       	call   357 <printint>
        ap++;
 4a5:	83 c7 04             	add    $0x4,%edi
 4a8:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 4ab:	83 c4 10             	add    $0x10,%esp
      state = 0;
 4ae:	be 00 00 00 00       	mov    $0x0,%esi
 4b3:	e9 56 ff ff ff       	jmp    40e <printf+0x2c>
        s = (char*)*ap;
 4b8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 4bb:	8b 30                	mov    (%eax),%esi
        ap++;
 4bd:	83 c0 04             	add    $0x4,%eax
 4c0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 4c3:	85 f6                	test   %esi,%esi
 4c5:	75 15                	jne    4dc <printf+0xfa>
          s = "(null)";
 4c7:	be b7 06 00 00       	mov    $0x6b7,%esi
 4cc:	eb 0e                	jmp    4dc <printf+0xfa>
          putc(fd, *s);
 4ce:	0f be d2             	movsbl %dl,%edx
 4d1:	8b 45 08             	mov    0x8(%ebp),%eax
 4d4:	e8 64 fe ff ff       	call   33d <putc>
          s++;
 4d9:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 4dc:	0f b6 16             	movzbl (%esi),%edx
 4df:	84 d2                	test   %dl,%dl
 4e1:	75 eb                	jne    4ce <printf+0xec>
      state = 0;
 4e3:	be 00 00 00 00       	mov    $0x0,%esi
 4e8:	e9 21 ff ff ff       	jmp    40e <printf+0x2c>
        putc(fd, *ap);
 4ed:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4f0:	0f be 17             	movsbl (%edi),%edx
 4f3:	8b 45 08             	mov    0x8(%ebp),%eax
 4f6:	e8 42 fe ff ff       	call   33d <putc>
        ap++;
 4fb:	83 c7 04             	add    $0x4,%edi
 4fe:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 501:	be 00 00 00 00       	mov    $0x0,%esi
 506:	e9 03 ff ff ff       	jmp    40e <printf+0x2c>
        putc(fd, c);
 50b:	89 fa                	mov    %edi,%edx
 50d:	8b 45 08             	mov    0x8(%ebp),%eax
 510:	e8 28 fe ff ff       	call   33d <putc>
      state = 0;
 515:	be 00 00 00 00       	mov    $0x0,%esi
 51a:	e9 ef fe ff ff       	jmp    40e <printf+0x2c>
        putc(fd, '%');
 51f:	ba 25 00 00 00       	mov    $0x25,%edx
 524:	8b 45 08             	mov    0x8(%ebp),%eax
 527:	e8 11 fe ff ff       	call   33d <putc>
        putc(fd, c);
 52c:	89 fa                	mov    %edi,%edx
 52e:	8b 45 08             	mov    0x8(%ebp),%eax
 531:	e8 07 fe ff ff       	call   33d <putc>
      state = 0;
 536:	be 00 00 00 00       	mov    $0x0,%esi
 53b:	e9 ce fe ff ff       	jmp    40e <printf+0x2c>
    }
  }
}
 540:	8d 65 f4             	lea    -0xc(%ebp),%esp
 543:	5b                   	pop    %ebx
 544:	5e                   	pop    %esi
 545:	5f                   	pop    %edi
 546:	5d                   	pop    %ebp
 547:	c3                   	ret    

00000548 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 548:	55                   	push   %ebp
 549:	89 e5                	mov    %esp,%ebp
 54b:	57                   	push   %edi
 54c:	56                   	push   %esi
 54d:	53                   	push   %ebx
 54e:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 551:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 554:	a1 84 0a 00 00       	mov    0xa84,%eax
 559:	eb 02                	jmp    55d <free+0x15>
 55b:	89 d0                	mov    %edx,%eax
 55d:	39 c8                	cmp    %ecx,%eax
 55f:	73 04                	jae    565 <free+0x1d>
 561:	39 08                	cmp    %ecx,(%eax)
 563:	77 12                	ja     577 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 565:	8b 10                	mov    (%eax),%edx
 567:	39 c2                	cmp    %eax,%edx
 569:	77 f0                	ja     55b <free+0x13>
 56b:	39 c8                	cmp    %ecx,%eax
 56d:	72 08                	jb     577 <free+0x2f>
 56f:	39 ca                	cmp    %ecx,%edx
 571:	77 04                	ja     577 <free+0x2f>
 573:	89 d0                	mov    %edx,%eax
 575:	eb e6                	jmp    55d <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 577:	8b 73 fc             	mov    -0x4(%ebx),%esi
 57a:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 57d:	8b 10                	mov    (%eax),%edx
 57f:	39 d7                	cmp    %edx,%edi
 581:	74 19                	je     59c <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 583:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 586:	8b 50 04             	mov    0x4(%eax),%edx
 589:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 58c:	39 ce                	cmp    %ecx,%esi
 58e:	74 1b                	je     5ab <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 590:	89 08                	mov    %ecx,(%eax)
  freep = p;
 592:	a3 84 0a 00 00       	mov    %eax,0xa84
}
 597:	5b                   	pop    %ebx
 598:	5e                   	pop    %esi
 599:	5f                   	pop    %edi
 59a:	5d                   	pop    %ebp
 59b:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 59c:	03 72 04             	add    0x4(%edx),%esi
 59f:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 5a2:	8b 10                	mov    (%eax),%edx
 5a4:	8b 12                	mov    (%edx),%edx
 5a6:	89 53 f8             	mov    %edx,-0x8(%ebx)
 5a9:	eb db                	jmp    586 <free+0x3e>
    p->s.size += bp->s.size;
 5ab:	03 53 fc             	add    -0x4(%ebx),%edx
 5ae:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 5b1:	8b 53 f8             	mov    -0x8(%ebx),%edx
 5b4:	89 10                	mov    %edx,(%eax)
 5b6:	eb da                	jmp    592 <free+0x4a>

000005b8 <morecore>:

static Header*
morecore(uint nu)
{
 5b8:	55                   	push   %ebp
 5b9:	89 e5                	mov    %esp,%ebp
 5bb:	53                   	push   %ebx
 5bc:	83 ec 04             	sub    $0x4,%esp
 5bf:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 5c1:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 5c6:	77 05                	ja     5cd <morecore+0x15>
    nu = 4096;
 5c8:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 5cd:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 5d4:	83 ec 0c             	sub    $0xc,%esp
 5d7:	50                   	push   %eax
 5d8:	e8 38 fd ff ff       	call   315 <sbrk>
  if(p == (char*)-1)
 5dd:	83 c4 10             	add    $0x10,%esp
 5e0:	83 f8 ff             	cmp    $0xffffffff,%eax
 5e3:	74 1c                	je     601 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 5e5:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 5e8:	83 c0 08             	add    $0x8,%eax
 5eb:	83 ec 0c             	sub    $0xc,%esp
 5ee:	50                   	push   %eax
 5ef:	e8 54 ff ff ff       	call   548 <free>
  return freep;
 5f4:	a1 84 0a 00 00       	mov    0xa84,%eax
 5f9:	83 c4 10             	add    $0x10,%esp
}
 5fc:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5ff:	c9                   	leave  
 600:	c3                   	ret    
    return 0;
 601:	b8 00 00 00 00       	mov    $0x0,%eax
 606:	eb f4                	jmp    5fc <morecore+0x44>

00000608 <malloc>:

void*
malloc(uint nbytes)
{
 608:	55                   	push   %ebp
 609:	89 e5                	mov    %esp,%ebp
 60b:	53                   	push   %ebx
 60c:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 60f:	8b 45 08             	mov    0x8(%ebp),%eax
 612:	8d 58 07             	lea    0x7(%eax),%ebx
 615:	c1 eb 03             	shr    $0x3,%ebx
 618:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 61b:	8b 0d 84 0a 00 00    	mov    0xa84,%ecx
 621:	85 c9                	test   %ecx,%ecx
 623:	74 04                	je     629 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 625:	8b 01                	mov    (%ecx),%eax
 627:	eb 4a                	jmp    673 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 629:	c7 05 84 0a 00 00 88 	movl   $0xa88,0xa84
 630:	0a 00 00 
 633:	c7 05 88 0a 00 00 88 	movl   $0xa88,0xa88
 63a:	0a 00 00 
    base.s.size = 0;
 63d:	c7 05 8c 0a 00 00 00 	movl   $0x0,0xa8c
 644:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 647:	b9 88 0a 00 00       	mov    $0xa88,%ecx
 64c:	eb d7                	jmp    625 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 64e:	74 19                	je     669 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 650:	29 da                	sub    %ebx,%edx
 652:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 655:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 658:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 65b:	89 0d 84 0a 00 00    	mov    %ecx,0xa84
      return (void*)(p + 1);
 661:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 664:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 667:	c9                   	leave  
 668:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 669:	8b 10                	mov    (%eax),%edx
 66b:	89 11                	mov    %edx,(%ecx)
 66d:	eb ec                	jmp    65b <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 66f:	89 c1                	mov    %eax,%ecx
 671:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 673:	8b 50 04             	mov    0x4(%eax),%edx
 676:	39 da                	cmp    %ebx,%edx
 678:	73 d4                	jae    64e <malloc+0x46>
    if(p == freep)
 67a:	39 05 84 0a 00 00    	cmp    %eax,0xa84
 680:	75 ed                	jne    66f <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 682:	89 d8                	mov    %ebx,%eax
 684:	e8 2f ff ff ff       	call   5b8 <morecore>
 689:	85 c0                	test   %eax,%eax
 68b:	75 e2                	jne    66f <malloc+0x67>
 68d:	eb d5                	jmp    664 <malloc+0x5c>
