
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
  11:	e8 36 02 00 00       	call   24c <fork>
  16:	85 c0                	test   %eax,%eax
  18:	7f 05                	jg     1f <main+0x1f>
    sleep(5);  // Let child exit before parent.
  exit();
  1a:	e8 35 02 00 00       	call   254 <exit>
    sleep(5);  // Let child exit before parent.
  1f:	83 ec 0c             	sub    $0xc,%esp
  22:	6a 05                	push   $0x5
  24:	e8 bb 02 00 00       	call   2e4 <sleep>
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

// a wrapper func for clone
int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
  3f:	55                   	push   %ebp
  40:	89 e5                	mov    %esp,%ebp
  42:	83 ec 14             	sub    $0x14,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE);
  45:	68 00 10 00 00       	push   $0x1000
  4a:	e8 80 05 00 00       	call   5cf <malloc>
  if(n_stack == 0){
  4f:	83 c4 10             	add    $0x10,%esp
  52:	85 c0                	test   %eax,%eax
  54:	74 14                	je     6a <thread_create+0x2b>
    return -1;
  }
  int new_pid = clone(start_routine, arg1, arg2, n_stack); // TODO: is this the right way to call it?
  56:	50                   	push   %eax
  57:	ff 75 10             	push   0x10(%ebp)
  5a:	ff 75 0c             	push   0xc(%ebp)
  5d:	ff 75 08             	push   0x8(%ebp)
  60:	e8 8f 02 00 00       	call   2f4 <clone>


  // I can't remember if there was something else to do here but I'm sure I'll find out


  return new_pid;
  65:	83 c4 10             	add    $0x10,%esp
}
  68:	c9                   	leave  
  69:	c3                   	ret    
    return -1;
  6a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  6f:	eb f7                	jmp    68 <thread_create+0x29>

00000071 <thread_join>:

int thread_join() {
  return 0;
}
  71:	b8 00 00 00 00       	mov    $0x0,%eax
  76:	c3                   	ret    

00000077 <lock_acquire>:

void lock_acquire(lock_t *lock){
  77:	55                   	push   %ebp
  78:	89 e5                	mov    %esp,%ebp
  7a:	53                   	push   %ebx
  7b:	83 ec 04             	sub    $0x4,%esp
  7e:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
  81:	83 ec 08             	sub    $0x8,%esp
  84:	6a 01                	push   $0x1
  86:	53                   	push   %ebx
  87:	e8 a2 ff ff ff       	call   2e <test_and_set>
  8c:	83 c4 10             	add    $0x10,%esp
  8f:	83 f8 01             	cmp    $0x1,%eax
  92:	74 ed                	je     81 <lock_acquire+0xa>
    ;
}
  94:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  97:	c9                   	leave  
  98:	c3                   	ret    

00000099 <lock_release>:

void lock_release(lock_t *lock) {
  99:	55                   	push   %ebp
  9a:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
  9c:	8b 45 08             	mov    0x8(%ebp),%eax
  9f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
  a5:	5d                   	pop    %ebp
  a6:	c3                   	ret    

000000a7 <lock_init>:

void lock_init(lock_t *lock) {
  a7:	55                   	push   %ebp
  a8:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
  aa:	8b 45 08             	mov    0x8(%ebp),%eax
  ad:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
  b3:	5d                   	pop    %ebp
  b4:	c3                   	ret    

000000b5 <strcpy>:

char*
strcpy(char *s, const char *t)
{
  b5:	55                   	push   %ebp
  b6:	89 e5                	mov    %esp,%ebp
  b8:	56                   	push   %esi
  b9:	53                   	push   %ebx
  ba:	8b 75 08             	mov    0x8(%ebp),%esi
  bd:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  c0:	89 f0                	mov    %esi,%eax
  c2:	89 d1                	mov    %edx,%ecx
  c4:	83 c2 01             	add    $0x1,%edx
  c7:	89 c3                	mov    %eax,%ebx
  c9:	83 c0 01             	add    $0x1,%eax
  cc:	0f b6 09             	movzbl (%ecx),%ecx
  cf:	88 0b                	mov    %cl,(%ebx)
  d1:	84 c9                	test   %cl,%cl
  d3:	75 ed                	jne    c2 <strcpy+0xd>
    ;
  return os;
}
  d5:	89 f0                	mov    %esi,%eax
  d7:	5b                   	pop    %ebx
  d8:	5e                   	pop    %esi
  d9:	5d                   	pop    %ebp
  da:	c3                   	ret    

000000db <strcmp>:

int
strcmp(const char *p, const char *q)
{
  db:	55                   	push   %ebp
  dc:	89 e5                	mov    %esp,%ebp
  de:	8b 4d 08             	mov    0x8(%ebp),%ecx
  e1:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
  e4:	eb 06                	jmp    ec <strcmp+0x11>
    p++, q++;
  e6:	83 c1 01             	add    $0x1,%ecx
  e9:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
  ec:	0f b6 01             	movzbl (%ecx),%eax
  ef:	84 c0                	test   %al,%al
  f1:	74 04                	je     f7 <strcmp+0x1c>
  f3:	3a 02                	cmp    (%edx),%al
  f5:	74 ef                	je     e6 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
  f7:	0f b6 c0             	movzbl %al,%eax
  fa:	0f b6 12             	movzbl (%edx),%edx
  fd:	29 d0                	sub    %edx,%eax
}
  ff:	5d                   	pop    %ebp
 100:	c3                   	ret    

00000101 <strlen>:

uint
strlen(const char *s)
{
 101:	55                   	push   %ebp
 102:	89 e5                	mov    %esp,%ebp
 104:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 107:	b8 00 00 00 00       	mov    $0x0,%eax
 10c:	eb 03                	jmp    111 <strlen+0x10>
 10e:	83 c0 01             	add    $0x1,%eax
 111:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 115:	75 f7                	jne    10e <strlen+0xd>
    ;
  return n;
}
 117:	5d                   	pop    %ebp
 118:	c3                   	ret    

00000119 <memset>:

void*
memset(void *dst, int c, uint n)
{
 119:	55                   	push   %ebp
 11a:	89 e5                	mov    %esp,%ebp
 11c:	57                   	push   %edi
 11d:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 120:	89 d7                	mov    %edx,%edi
 122:	8b 4d 10             	mov    0x10(%ebp),%ecx
 125:	8b 45 0c             	mov    0xc(%ebp),%eax
 128:	fc                   	cld    
 129:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 12b:	89 d0                	mov    %edx,%eax
 12d:	8b 7d fc             	mov    -0x4(%ebp),%edi
 130:	c9                   	leave  
 131:	c3                   	ret    

00000132 <strchr>:

char*
strchr(const char *s, char c)
{
 132:	55                   	push   %ebp
 133:	89 e5                	mov    %esp,%ebp
 135:	8b 45 08             	mov    0x8(%ebp),%eax
 138:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 13c:	eb 03                	jmp    141 <strchr+0xf>
 13e:	83 c0 01             	add    $0x1,%eax
 141:	0f b6 10             	movzbl (%eax),%edx
 144:	84 d2                	test   %dl,%dl
 146:	74 06                	je     14e <strchr+0x1c>
    if(*s == c)
 148:	38 ca                	cmp    %cl,%dl
 14a:	75 f2                	jne    13e <strchr+0xc>
 14c:	eb 05                	jmp    153 <strchr+0x21>
      return (char*)s;
  return 0;
 14e:	b8 00 00 00 00       	mov    $0x0,%eax
}
 153:	5d                   	pop    %ebp
 154:	c3                   	ret    

00000155 <gets>:

char*
gets(char *buf, int max)
{
 155:	55                   	push   %ebp
 156:	89 e5                	mov    %esp,%ebp
 158:	57                   	push   %edi
 159:	56                   	push   %esi
 15a:	53                   	push   %ebx
 15b:	83 ec 1c             	sub    $0x1c,%esp
 15e:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 161:	bb 00 00 00 00       	mov    $0x0,%ebx
 166:	89 de                	mov    %ebx,%esi
 168:	83 c3 01             	add    $0x1,%ebx
 16b:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 16e:	7d 2e                	jge    19e <gets+0x49>
    cc = read(0, &c, 1);
 170:	83 ec 04             	sub    $0x4,%esp
 173:	6a 01                	push   $0x1
 175:	8d 45 e7             	lea    -0x19(%ebp),%eax
 178:	50                   	push   %eax
 179:	6a 00                	push   $0x0
 17b:	e8 ec 00 00 00       	call   26c <read>
    if(cc < 1)
 180:	83 c4 10             	add    $0x10,%esp
 183:	85 c0                	test   %eax,%eax
 185:	7e 17                	jle    19e <gets+0x49>
      break;
    buf[i++] = c;
 187:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 18b:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 18e:	3c 0a                	cmp    $0xa,%al
 190:	0f 94 c2             	sete   %dl
 193:	3c 0d                	cmp    $0xd,%al
 195:	0f 94 c0             	sete   %al
 198:	08 c2                	or     %al,%dl
 19a:	74 ca                	je     166 <gets+0x11>
    buf[i++] = c;
 19c:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 19e:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 1a2:	89 f8                	mov    %edi,%eax
 1a4:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1a7:	5b                   	pop    %ebx
 1a8:	5e                   	pop    %esi
 1a9:	5f                   	pop    %edi
 1aa:	5d                   	pop    %ebp
 1ab:	c3                   	ret    

000001ac <stat>:

int
stat(const char *n, struct stat *st)
{
 1ac:	55                   	push   %ebp
 1ad:	89 e5                	mov    %esp,%ebp
 1af:	56                   	push   %esi
 1b0:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1b1:	83 ec 08             	sub    $0x8,%esp
 1b4:	6a 00                	push   $0x0
 1b6:	ff 75 08             	push   0x8(%ebp)
 1b9:	e8 d6 00 00 00       	call   294 <open>
  if(fd < 0)
 1be:	83 c4 10             	add    $0x10,%esp
 1c1:	85 c0                	test   %eax,%eax
 1c3:	78 24                	js     1e9 <stat+0x3d>
 1c5:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 1c7:	83 ec 08             	sub    $0x8,%esp
 1ca:	ff 75 0c             	push   0xc(%ebp)
 1cd:	50                   	push   %eax
 1ce:	e8 d9 00 00 00       	call   2ac <fstat>
 1d3:	89 c6                	mov    %eax,%esi
  close(fd);
 1d5:	89 1c 24             	mov    %ebx,(%esp)
 1d8:	e8 9f 00 00 00       	call   27c <close>
  return r;
 1dd:	83 c4 10             	add    $0x10,%esp
}
 1e0:	89 f0                	mov    %esi,%eax
 1e2:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1e5:	5b                   	pop    %ebx
 1e6:	5e                   	pop    %esi
 1e7:	5d                   	pop    %ebp
 1e8:	c3                   	ret    
    return -1;
 1e9:	be ff ff ff ff       	mov    $0xffffffff,%esi
 1ee:	eb f0                	jmp    1e0 <stat+0x34>

000001f0 <atoi>:

int
atoi(const char *s)
{
 1f0:	55                   	push   %ebp
 1f1:	89 e5                	mov    %esp,%ebp
 1f3:	53                   	push   %ebx
 1f4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 1f7:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 1fc:	eb 10                	jmp    20e <atoi+0x1e>
    n = n*10 + *s++ - '0';
 1fe:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 201:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 204:	83 c1 01             	add    $0x1,%ecx
 207:	0f be c0             	movsbl %al,%eax
 20a:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 20e:	0f b6 01             	movzbl (%ecx),%eax
 211:	8d 58 d0             	lea    -0x30(%eax),%ebx
 214:	80 fb 09             	cmp    $0x9,%bl
 217:	76 e5                	jbe    1fe <atoi+0xe>
  return n;
}
 219:	89 d0                	mov    %edx,%eax
 21b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 21e:	c9                   	leave  
 21f:	c3                   	ret    

00000220 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 220:	55                   	push   %ebp
 221:	89 e5                	mov    %esp,%ebp
 223:	56                   	push   %esi
 224:	53                   	push   %ebx
 225:	8b 75 08             	mov    0x8(%ebp),%esi
 228:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 22b:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 22e:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 230:	eb 0d                	jmp    23f <memmove+0x1f>
    *dst++ = *src++;
 232:	0f b6 01             	movzbl (%ecx),%eax
 235:	88 02                	mov    %al,(%edx)
 237:	8d 49 01             	lea    0x1(%ecx),%ecx
 23a:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 23d:	89 d8                	mov    %ebx,%eax
 23f:	8d 58 ff             	lea    -0x1(%eax),%ebx
 242:	85 c0                	test   %eax,%eax
 244:	7f ec                	jg     232 <memmove+0x12>
  return vdst;
}
 246:	89 f0                	mov    %esi,%eax
 248:	5b                   	pop    %ebx
 249:	5e                   	pop    %esi
 24a:	5d                   	pop    %ebp
 24b:	c3                   	ret    

0000024c <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 24c:	b8 01 00 00 00       	mov    $0x1,%eax
 251:	cd 40                	int    $0x40
 253:	c3                   	ret    

00000254 <exit>:
SYSCALL(exit)
 254:	b8 02 00 00 00       	mov    $0x2,%eax
 259:	cd 40                	int    $0x40
 25b:	c3                   	ret    

0000025c <wait>:
SYSCALL(wait)
 25c:	b8 03 00 00 00       	mov    $0x3,%eax
 261:	cd 40                	int    $0x40
 263:	c3                   	ret    

00000264 <pipe>:
SYSCALL(pipe)
 264:	b8 04 00 00 00       	mov    $0x4,%eax
 269:	cd 40                	int    $0x40
 26b:	c3                   	ret    

0000026c <read>:
SYSCALL(read)
 26c:	b8 05 00 00 00       	mov    $0x5,%eax
 271:	cd 40                	int    $0x40
 273:	c3                   	ret    

00000274 <write>:
SYSCALL(write)
 274:	b8 10 00 00 00       	mov    $0x10,%eax
 279:	cd 40                	int    $0x40
 27b:	c3                   	ret    

0000027c <close>:
SYSCALL(close)
 27c:	b8 15 00 00 00       	mov    $0x15,%eax
 281:	cd 40                	int    $0x40
 283:	c3                   	ret    

00000284 <kill>:
SYSCALL(kill)
 284:	b8 06 00 00 00       	mov    $0x6,%eax
 289:	cd 40                	int    $0x40
 28b:	c3                   	ret    

0000028c <exec>:
SYSCALL(exec)
 28c:	b8 07 00 00 00       	mov    $0x7,%eax
 291:	cd 40                	int    $0x40
 293:	c3                   	ret    

00000294 <open>:
SYSCALL(open)
 294:	b8 0f 00 00 00       	mov    $0xf,%eax
 299:	cd 40                	int    $0x40
 29b:	c3                   	ret    

0000029c <mknod>:
SYSCALL(mknod)
 29c:	b8 11 00 00 00       	mov    $0x11,%eax
 2a1:	cd 40                	int    $0x40
 2a3:	c3                   	ret    

000002a4 <unlink>:
SYSCALL(unlink)
 2a4:	b8 12 00 00 00       	mov    $0x12,%eax
 2a9:	cd 40                	int    $0x40
 2ab:	c3                   	ret    

000002ac <fstat>:
SYSCALL(fstat)
 2ac:	b8 08 00 00 00       	mov    $0x8,%eax
 2b1:	cd 40                	int    $0x40
 2b3:	c3                   	ret    

000002b4 <link>:
SYSCALL(link)
 2b4:	b8 13 00 00 00       	mov    $0x13,%eax
 2b9:	cd 40                	int    $0x40
 2bb:	c3                   	ret    

000002bc <mkdir>:
SYSCALL(mkdir)
 2bc:	b8 14 00 00 00       	mov    $0x14,%eax
 2c1:	cd 40                	int    $0x40
 2c3:	c3                   	ret    

000002c4 <chdir>:
SYSCALL(chdir)
 2c4:	b8 09 00 00 00       	mov    $0x9,%eax
 2c9:	cd 40                	int    $0x40
 2cb:	c3                   	ret    

000002cc <dup>:
SYSCALL(dup)
 2cc:	b8 0a 00 00 00       	mov    $0xa,%eax
 2d1:	cd 40                	int    $0x40
 2d3:	c3                   	ret    

000002d4 <getpid>:
SYSCALL(getpid)
 2d4:	b8 0b 00 00 00       	mov    $0xb,%eax
 2d9:	cd 40                	int    $0x40
 2db:	c3                   	ret    

000002dc <sbrk>:
SYSCALL(sbrk)
 2dc:	b8 0c 00 00 00       	mov    $0xc,%eax
 2e1:	cd 40                	int    $0x40
 2e3:	c3                   	ret    

000002e4 <sleep>:
SYSCALL(sleep)
 2e4:	b8 0d 00 00 00       	mov    $0xd,%eax
 2e9:	cd 40                	int    $0x40
 2eb:	c3                   	ret    

000002ec <uptime>:
SYSCALL(uptime)
 2ec:	b8 0e 00 00 00       	mov    $0xe,%eax
 2f1:	cd 40                	int    $0x40
 2f3:	c3                   	ret    

000002f4 <clone>:
SYSCALL(clone)
 2f4:	b8 16 00 00 00       	mov    $0x16,%eax
 2f9:	cd 40                	int    $0x40
 2fb:	c3                   	ret    

000002fc <join>:
 2fc:	b8 17 00 00 00       	mov    $0x17,%eax
 301:	cd 40                	int    $0x40
 303:	c3                   	ret    

00000304 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 304:	55                   	push   %ebp
 305:	89 e5                	mov    %esp,%ebp
 307:	83 ec 1c             	sub    $0x1c,%esp
 30a:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 30d:	6a 01                	push   $0x1
 30f:	8d 55 f4             	lea    -0xc(%ebp),%edx
 312:	52                   	push   %edx
 313:	50                   	push   %eax
 314:	e8 5b ff ff ff       	call   274 <write>
}
 319:	83 c4 10             	add    $0x10,%esp
 31c:	c9                   	leave  
 31d:	c3                   	ret    

0000031e <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 31e:	55                   	push   %ebp
 31f:	89 e5                	mov    %esp,%ebp
 321:	57                   	push   %edi
 322:	56                   	push   %esi
 323:	53                   	push   %ebx
 324:	83 ec 2c             	sub    $0x2c,%esp
 327:	89 45 d0             	mov    %eax,-0x30(%ebp)
 32a:	89 d0                	mov    %edx,%eax
 32c:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 32e:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 332:	0f 95 c1             	setne  %cl
 335:	c1 ea 1f             	shr    $0x1f,%edx
 338:	84 d1                	test   %dl,%cl
 33a:	74 44                	je     380 <printint+0x62>
    neg = 1;
    x = -xx;
 33c:	f7 d8                	neg    %eax
 33e:	89 c1                	mov    %eax,%ecx
    neg = 1;
 340:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 347:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 34c:	89 c8                	mov    %ecx,%eax
 34e:	ba 00 00 00 00       	mov    $0x0,%edx
 353:	f7 f6                	div    %esi
 355:	89 df                	mov    %ebx,%edi
 357:	83 c3 01             	add    $0x1,%ebx
 35a:	0f b6 92 b8 06 00 00 	movzbl 0x6b8(%edx),%edx
 361:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 365:	89 ca                	mov    %ecx,%edx
 367:	89 c1                	mov    %eax,%ecx
 369:	39 d6                	cmp    %edx,%esi
 36b:	76 df                	jbe    34c <printint+0x2e>
  if(neg)
 36d:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 371:	74 31                	je     3a4 <printint+0x86>
    buf[i++] = '-';
 373:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 378:	8d 5f 02             	lea    0x2(%edi),%ebx
 37b:	8b 75 d0             	mov    -0x30(%ebp),%esi
 37e:	eb 17                	jmp    397 <printint+0x79>
    x = xx;
 380:	89 c1                	mov    %eax,%ecx
  neg = 0;
 382:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 389:	eb bc                	jmp    347 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 38b:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 390:	89 f0                	mov    %esi,%eax
 392:	e8 6d ff ff ff       	call   304 <putc>
  while(--i >= 0)
 397:	83 eb 01             	sub    $0x1,%ebx
 39a:	79 ef                	jns    38b <printint+0x6d>
}
 39c:	83 c4 2c             	add    $0x2c,%esp
 39f:	5b                   	pop    %ebx
 3a0:	5e                   	pop    %esi
 3a1:	5f                   	pop    %edi
 3a2:	5d                   	pop    %ebp
 3a3:	c3                   	ret    
 3a4:	8b 75 d0             	mov    -0x30(%ebp),%esi
 3a7:	eb ee                	jmp    397 <printint+0x79>

000003a9 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 3a9:	55                   	push   %ebp
 3aa:	89 e5                	mov    %esp,%ebp
 3ac:	57                   	push   %edi
 3ad:	56                   	push   %esi
 3ae:	53                   	push   %ebx
 3af:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 3b2:	8d 45 10             	lea    0x10(%ebp),%eax
 3b5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 3b8:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 3bd:	bb 00 00 00 00       	mov    $0x0,%ebx
 3c2:	eb 14                	jmp    3d8 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 3c4:	89 fa                	mov    %edi,%edx
 3c6:	8b 45 08             	mov    0x8(%ebp),%eax
 3c9:	e8 36 ff ff ff       	call   304 <putc>
 3ce:	eb 05                	jmp    3d5 <printf+0x2c>
      }
    } else if(state == '%'){
 3d0:	83 fe 25             	cmp    $0x25,%esi
 3d3:	74 25                	je     3fa <printf+0x51>
  for(i = 0; fmt[i]; i++){
 3d5:	83 c3 01             	add    $0x1,%ebx
 3d8:	8b 45 0c             	mov    0xc(%ebp),%eax
 3db:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 3df:	84 c0                	test   %al,%al
 3e1:	0f 84 20 01 00 00    	je     507 <printf+0x15e>
    c = fmt[i] & 0xff;
 3e7:	0f be f8             	movsbl %al,%edi
 3ea:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 3ed:	85 f6                	test   %esi,%esi
 3ef:	75 df                	jne    3d0 <printf+0x27>
      if(c == '%'){
 3f1:	83 f8 25             	cmp    $0x25,%eax
 3f4:	75 ce                	jne    3c4 <printf+0x1b>
        state = '%';
 3f6:	89 c6                	mov    %eax,%esi
 3f8:	eb db                	jmp    3d5 <printf+0x2c>
      if(c == 'd'){
 3fa:	83 f8 25             	cmp    $0x25,%eax
 3fd:	0f 84 cf 00 00 00    	je     4d2 <printf+0x129>
 403:	0f 8c dd 00 00 00    	jl     4e6 <printf+0x13d>
 409:	83 f8 78             	cmp    $0x78,%eax
 40c:	0f 8f d4 00 00 00    	jg     4e6 <printf+0x13d>
 412:	83 f8 63             	cmp    $0x63,%eax
 415:	0f 8c cb 00 00 00    	jl     4e6 <printf+0x13d>
 41b:	83 e8 63             	sub    $0x63,%eax
 41e:	83 f8 15             	cmp    $0x15,%eax
 421:	0f 87 bf 00 00 00    	ja     4e6 <printf+0x13d>
 427:	ff 24 85 60 06 00 00 	jmp    *0x660(,%eax,4)
        printint(fd, *ap, 10, 1);
 42e:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 431:	8b 17                	mov    (%edi),%edx
 433:	83 ec 0c             	sub    $0xc,%esp
 436:	6a 01                	push   $0x1
 438:	b9 0a 00 00 00       	mov    $0xa,%ecx
 43d:	8b 45 08             	mov    0x8(%ebp),%eax
 440:	e8 d9 fe ff ff       	call   31e <printint>
        ap++;
 445:	83 c7 04             	add    $0x4,%edi
 448:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 44b:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 44e:	be 00 00 00 00       	mov    $0x0,%esi
 453:	eb 80                	jmp    3d5 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 455:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 458:	8b 17                	mov    (%edi),%edx
 45a:	83 ec 0c             	sub    $0xc,%esp
 45d:	6a 00                	push   $0x0
 45f:	b9 10 00 00 00       	mov    $0x10,%ecx
 464:	8b 45 08             	mov    0x8(%ebp),%eax
 467:	e8 b2 fe ff ff       	call   31e <printint>
        ap++;
 46c:	83 c7 04             	add    $0x4,%edi
 46f:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 472:	83 c4 10             	add    $0x10,%esp
      state = 0;
 475:	be 00 00 00 00       	mov    $0x0,%esi
 47a:	e9 56 ff ff ff       	jmp    3d5 <printf+0x2c>
        s = (char*)*ap;
 47f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 482:	8b 30                	mov    (%eax),%esi
        ap++;
 484:	83 c0 04             	add    $0x4,%eax
 487:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 48a:	85 f6                	test   %esi,%esi
 48c:	75 15                	jne    4a3 <printf+0xfa>
          s = "(null)";
 48e:	be 58 06 00 00       	mov    $0x658,%esi
 493:	eb 0e                	jmp    4a3 <printf+0xfa>
          putc(fd, *s);
 495:	0f be d2             	movsbl %dl,%edx
 498:	8b 45 08             	mov    0x8(%ebp),%eax
 49b:	e8 64 fe ff ff       	call   304 <putc>
          s++;
 4a0:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 4a3:	0f b6 16             	movzbl (%esi),%edx
 4a6:	84 d2                	test   %dl,%dl
 4a8:	75 eb                	jne    495 <printf+0xec>
      state = 0;
 4aa:	be 00 00 00 00       	mov    $0x0,%esi
 4af:	e9 21 ff ff ff       	jmp    3d5 <printf+0x2c>
        putc(fd, *ap);
 4b4:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4b7:	0f be 17             	movsbl (%edi),%edx
 4ba:	8b 45 08             	mov    0x8(%ebp),%eax
 4bd:	e8 42 fe ff ff       	call   304 <putc>
        ap++;
 4c2:	83 c7 04             	add    $0x4,%edi
 4c5:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 4c8:	be 00 00 00 00       	mov    $0x0,%esi
 4cd:	e9 03 ff ff ff       	jmp    3d5 <printf+0x2c>
        putc(fd, c);
 4d2:	89 fa                	mov    %edi,%edx
 4d4:	8b 45 08             	mov    0x8(%ebp),%eax
 4d7:	e8 28 fe ff ff       	call   304 <putc>
      state = 0;
 4dc:	be 00 00 00 00       	mov    $0x0,%esi
 4e1:	e9 ef fe ff ff       	jmp    3d5 <printf+0x2c>
        putc(fd, '%');
 4e6:	ba 25 00 00 00       	mov    $0x25,%edx
 4eb:	8b 45 08             	mov    0x8(%ebp),%eax
 4ee:	e8 11 fe ff ff       	call   304 <putc>
        putc(fd, c);
 4f3:	89 fa                	mov    %edi,%edx
 4f5:	8b 45 08             	mov    0x8(%ebp),%eax
 4f8:	e8 07 fe ff ff       	call   304 <putc>
      state = 0;
 4fd:	be 00 00 00 00       	mov    $0x0,%esi
 502:	e9 ce fe ff ff       	jmp    3d5 <printf+0x2c>
    }
  }
}
 507:	8d 65 f4             	lea    -0xc(%ebp),%esp
 50a:	5b                   	pop    %ebx
 50b:	5e                   	pop    %esi
 50c:	5f                   	pop    %edi
 50d:	5d                   	pop    %ebp
 50e:	c3                   	ret    

0000050f <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 50f:	55                   	push   %ebp
 510:	89 e5                	mov    %esp,%ebp
 512:	57                   	push   %edi
 513:	56                   	push   %esi
 514:	53                   	push   %ebx
 515:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 518:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 51b:	a1 14 0a 00 00       	mov    0xa14,%eax
 520:	eb 02                	jmp    524 <free+0x15>
 522:	89 d0                	mov    %edx,%eax
 524:	39 c8                	cmp    %ecx,%eax
 526:	73 04                	jae    52c <free+0x1d>
 528:	39 08                	cmp    %ecx,(%eax)
 52a:	77 12                	ja     53e <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 52c:	8b 10                	mov    (%eax),%edx
 52e:	39 c2                	cmp    %eax,%edx
 530:	77 f0                	ja     522 <free+0x13>
 532:	39 c8                	cmp    %ecx,%eax
 534:	72 08                	jb     53e <free+0x2f>
 536:	39 ca                	cmp    %ecx,%edx
 538:	77 04                	ja     53e <free+0x2f>
 53a:	89 d0                	mov    %edx,%eax
 53c:	eb e6                	jmp    524 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 53e:	8b 73 fc             	mov    -0x4(%ebx),%esi
 541:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 544:	8b 10                	mov    (%eax),%edx
 546:	39 d7                	cmp    %edx,%edi
 548:	74 19                	je     563 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 54a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 54d:	8b 50 04             	mov    0x4(%eax),%edx
 550:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 553:	39 ce                	cmp    %ecx,%esi
 555:	74 1b                	je     572 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 557:	89 08                	mov    %ecx,(%eax)
  freep = p;
 559:	a3 14 0a 00 00       	mov    %eax,0xa14
}
 55e:	5b                   	pop    %ebx
 55f:	5e                   	pop    %esi
 560:	5f                   	pop    %edi
 561:	5d                   	pop    %ebp
 562:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 563:	03 72 04             	add    0x4(%edx),%esi
 566:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 569:	8b 10                	mov    (%eax),%edx
 56b:	8b 12                	mov    (%edx),%edx
 56d:	89 53 f8             	mov    %edx,-0x8(%ebx)
 570:	eb db                	jmp    54d <free+0x3e>
    p->s.size += bp->s.size;
 572:	03 53 fc             	add    -0x4(%ebx),%edx
 575:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 578:	8b 53 f8             	mov    -0x8(%ebx),%edx
 57b:	89 10                	mov    %edx,(%eax)
 57d:	eb da                	jmp    559 <free+0x4a>

0000057f <morecore>:

static Header*
morecore(uint nu)
{
 57f:	55                   	push   %ebp
 580:	89 e5                	mov    %esp,%ebp
 582:	53                   	push   %ebx
 583:	83 ec 04             	sub    $0x4,%esp
 586:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 588:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 58d:	77 05                	ja     594 <morecore+0x15>
    nu = 4096;
 58f:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 594:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 59b:	83 ec 0c             	sub    $0xc,%esp
 59e:	50                   	push   %eax
 59f:	e8 38 fd ff ff       	call   2dc <sbrk>
  if(p == (char*)-1)
 5a4:	83 c4 10             	add    $0x10,%esp
 5a7:	83 f8 ff             	cmp    $0xffffffff,%eax
 5aa:	74 1c                	je     5c8 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 5ac:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 5af:	83 c0 08             	add    $0x8,%eax
 5b2:	83 ec 0c             	sub    $0xc,%esp
 5b5:	50                   	push   %eax
 5b6:	e8 54 ff ff ff       	call   50f <free>
  return freep;
 5bb:	a1 14 0a 00 00       	mov    0xa14,%eax
 5c0:	83 c4 10             	add    $0x10,%esp
}
 5c3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5c6:	c9                   	leave  
 5c7:	c3                   	ret    
    return 0;
 5c8:	b8 00 00 00 00       	mov    $0x0,%eax
 5cd:	eb f4                	jmp    5c3 <morecore+0x44>

000005cf <malloc>:

void*
malloc(uint nbytes)
{
 5cf:	55                   	push   %ebp
 5d0:	89 e5                	mov    %esp,%ebp
 5d2:	53                   	push   %ebx
 5d3:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 5d6:	8b 45 08             	mov    0x8(%ebp),%eax
 5d9:	8d 58 07             	lea    0x7(%eax),%ebx
 5dc:	c1 eb 03             	shr    $0x3,%ebx
 5df:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 5e2:	8b 0d 14 0a 00 00    	mov    0xa14,%ecx
 5e8:	85 c9                	test   %ecx,%ecx
 5ea:	74 04                	je     5f0 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 5ec:	8b 01                	mov    (%ecx),%eax
 5ee:	eb 4a                	jmp    63a <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 5f0:	c7 05 14 0a 00 00 18 	movl   $0xa18,0xa14
 5f7:	0a 00 00 
 5fa:	c7 05 18 0a 00 00 18 	movl   $0xa18,0xa18
 601:	0a 00 00 
    base.s.size = 0;
 604:	c7 05 1c 0a 00 00 00 	movl   $0x0,0xa1c
 60b:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 60e:	b9 18 0a 00 00       	mov    $0xa18,%ecx
 613:	eb d7                	jmp    5ec <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 615:	74 19                	je     630 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 617:	29 da                	sub    %ebx,%edx
 619:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 61c:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 61f:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 622:	89 0d 14 0a 00 00    	mov    %ecx,0xa14
      return (void*)(p + 1);
 628:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 62b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 62e:	c9                   	leave  
 62f:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 630:	8b 10                	mov    (%eax),%edx
 632:	89 11                	mov    %edx,(%ecx)
 634:	eb ec                	jmp    622 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 636:	89 c1                	mov    %eax,%ecx
 638:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 63a:	8b 50 04             	mov    0x4(%eax),%edx
 63d:	39 da                	cmp    %ebx,%edx
 63f:	73 d4                	jae    615 <malloc+0x46>
    if(p == freep)
 641:	39 05 14 0a 00 00    	cmp    %eax,0xa14
 647:	75 ed                	jne    636 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 649:	89 d8                	mov    %ebx,%eax
 64b:	e8 2f ff ff ff       	call   57f <morecore>
 650:	85 c0                	test   %eax,%eax
 652:	75 e2                	jne    636 <malloc+0x67>
 654:	eb d5                	jmp    62b <malloc+0x5c>
