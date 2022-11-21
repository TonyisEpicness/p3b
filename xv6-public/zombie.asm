
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
  11:	e8 41 02 00 00       	call   257 <fork>
  16:	85 c0                	test   %eax,%eax
  18:	7f 05                	jg     1f <main+0x1f>
    sleep(5);  // Let child exit before parent.
  exit();
  1a:	e8 40 02 00 00       	call   25f <exit>
    sleep(5);  // Let child exit before parent.
  1f:	83 ec 0c             	sub    $0xc,%esp
  22:	6a 05                	push   $0x5
  24:	e8 c6 02 00 00       	call   2ef <sleep>
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
  void *n_stack = malloc(PGSIZE*2);
  45:	68 00 20 00 00       	push   $0x2000
  4a:	e8 8b 05 00 00       	call   5da <malloc>
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
  60:	e8 9a 02 00 00       	call   2ff <clone>


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
  71:	55                   	push   %ebp
  72:	89 e5                	mov    %esp,%ebp
  74:	83 ec 24             	sub    $0x24,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
  77:	8d 45 f4             	lea    -0xc(%ebp),%eax
  7a:	50                   	push   %eax
  7b:	e8 87 02 00 00       	call   307 <join>
  
  return pid;
}
  80:	c9                   	leave  
  81:	c3                   	ret    

00000082 <lock_acquire>:

void lock_acquire(lock_t *lock){
  82:	55                   	push   %ebp
  83:	89 e5                	mov    %esp,%ebp
  85:	53                   	push   %ebx
  86:	83 ec 04             	sub    $0x4,%esp
  89:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
  8c:	83 ec 08             	sub    $0x8,%esp
  8f:	6a 01                	push   $0x1
  91:	53                   	push   %ebx
  92:	e8 97 ff ff ff       	call   2e <test_and_set>
  97:	83 c4 10             	add    $0x10,%esp
  9a:	83 f8 01             	cmp    $0x1,%eax
  9d:	74 ed                	je     8c <lock_acquire+0xa>
    ;
}
  9f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  a2:	c9                   	leave  
  a3:	c3                   	ret    

000000a4 <lock_release>:

void lock_release(lock_t *lock) {
  a4:	55                   	push   %ebp
  a5:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
  a7:	8b 45 08             	mov    0x8(%ebp),%eax
  aa:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
  b0:	5d                   	pop    %ebp
  b1:	c3                   	ret    

000000b2 <lock_init>:

void lock_init(lock_t *lock) {
  b2:	55                   	push   %ebp
  b3:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
  b5:	8b 45 08             	mov    0x8(%ebp),%eax
  b8:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
  be:	5d                   	pop    %ebp
  bf:	c3                   	ret    

000000c0 <strcpy>:

char*
strcpy(char *s, const char *t)
{
  c0:	55                   	push   %ebp
  c1:	89 e5                	mov    %esp,%ebp
  c3:	56                   	push   %esi
  c4:	53                   	push   %ebx
  c5:	8b 75 08             	mov    0x8(%ebp),%esi
  c8:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  cb:	89 f0                	mov    %esi,%eax
  cd:	89 d1                	mov    %edx,%ecx
  cf:	83 c2 01             	add    $0x1,%edx
  d2:	89 c3                	mov    %eax,%ebx
  d4:	83 c0 01             	add    $0x1,%eax
  d7:	0f b6 09             	movzbl (%ecx),%ecx
  da:	88 0b                	mov    %cl,(%ebx)
  dc:	84 c9                	test   %cl,%cl
  de:	75 ed                	jne    cd <strcpy+0xd>
    ;
  return os;
}
  e0:	89 f0                	mov    %esi,%eax
  e2:	5b                   	pop    %ebx
  e3:	5e                   	pop    %esi
  e4:	5d                   	pop    %ebp
  e5:	c3                   	ret    

000000e6 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  e6:	55                   	push   %ebp
  e7:	89 e5                	mov    %esp,%ebp
  e9:	8b 4d 08             	mov    0x8(%ebp),%ecx
  ec:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
  ef:	eb 06                	jmp    f7 <strcmp+0x11>
    p++, q++;
  f1:	83 c1 01             	add    $0x1,%ecx
  f4:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
  f7:	0f b6 01             	movzbl (%ecx),%eax
  fa:	84 c0                	test   %al,%al
  fc:	74 04                	je     102 <strcmp+0x1c>
  fe:	3a 02                	cmp    (%edx),%al
 100:	74 ef                	je     f1 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 102:	0f b6 c0             	movzbl %al,%eax
 105:	0f b6 12             	movzbl (%edx),%edx
 108:	29 d0                	sub    %edx,%eax
}
 10a:	5d                   	pop    %ebp
 10b:	c3                   	ret    

0000010c <strlen>:

uint
strlen(const char *s)
{
 10c:	55                   	push   %ebp
 10d:	89 e5                	mov    %esp,%ebp
 10f:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 112:	b8 00 00 00 00       	mov    $0x0,%eax
 117:	eb 03                	jmp    11c <strlen+0x10>
 119:	83 c0 01             	add    $0x1,%eax
 11c:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 120:	75 f7                	jne    119 <strlen+0xd>
    ;
  return n;
}
 122:	5d                   	pop    %ebp
 123:	c3                   	ret    

00000124 <memset>:

void*
memset(void *dst, int c, uint n)
{
 124:	55                   	push   %ebp
 125:	89 e5                	mov    %esp,%ebp
 127:	57                   	push   %edi
 128:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 12b:	89 d7                	mov    %edx,%edi
 12d:	8b 4d 10             	mov    0x10(%ebp),%ecx
 130:	8b 45 0c             	mov    0xc(%ebp),%eax
 133:	fc                   	cld    
 134:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 136:	89 d0                	mov    %edx,%eax
 138:	8b 7d fc             	mov    -0x4(%ebp),%edi
 13b:	c9                   	leave  
 13c:	c3                   	ret    

0000013d <strchr>:

char*
strchr(const char *s, char c)
{
 13d:	55                   	push   %ebp
 13e:	89 e5                	mov    %esp,%ebp
 140:	8b 45 08             	mov    0x8(%ebp),%eax
 143:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 147:	eb 03                	jmp    14c <strchr+0xf>
 149:	83 c0 01             	add    $0x1,%eax
 14c:	0f b6 10             	movzbl (%eax),%edx
 14f:	84 d2                	test   %dl,%dl
 151:	74 06                	je     159 <strchr+0x1c>
    if(*s == c)
 153:	38 ca                	cmp    %cl,%dl
 155:	75 f2                	jne    149 <strchr+0xc>
 157:	eb 05                	jmp    15e <strchr+0x21>
      return (char*)s;
  return 0;
 159:	b8 00 00 00 00       	mov    $0x0,%eax
}
 15e:	5d                   	pop    %ebp
 15f:	c3                   	ret    

00000160 <gets>:

char*
gets(char *buf, int max)
{
 160:	55                   	push   %ebp
 161:	89 e5                	mov    %esp,%ebp
 163:	57                   	push   %edi
 164:	56                   	push   %esi
 165:	53                   	push   %ebx
 166:	83 ec 1c             	sub    $0x1c,%esp
 169:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 16c:	bb 00 00 00 00       	mov    $0x0,%ebx
 171:	89 de                	mov    %ebx,%esi
 173:	83 c3 01             	add    $0x1,%ebx
 176:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 179:	7d 2e                	jge    1a9 <gets+0x49>
    cc = read(0, &c, 1);
 17b:	83 ec 04             	sub    $0x4,%esp
 17e:	6a 01                	push   $0x1
 180:	8d 45 e7             	lea    -0x19(%ebp),%eax
 183:	50                   	push   %eax
 184:	6a 00                	push   $0x0
 186:	e8 ec 00 00 00       	call   277 <read>
    if(cc < 1)
 18b:	83 c4 10             	add    $0x10,%esp
 18e:	85 c0                	test   %eax,%eax
 190:	7e 17                	jle    1a9 <gets+0x49>
      break;
    buf[i++] = c;
 192:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 196:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 199:	3c 0a                	cmp    $0xa,%al
 19b:	0f 94 c2             	sete   %dl
 19e:	3c 0d                	cmp    $0xd,%al
 1a0:	0f 94 c0             	sete   %al
 1a3:	08 c2                	or     %al,%dl
 1a5:	74 ca                	je     171 <gets+0x11>
    buf[i++] = c;
 1a7:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 1a9:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 1ad:	89 f8                	mov    %edi,%eax
 1af:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1b2:	5b                   	pop    %ebx
 1b3:	5e                   	pop    %esi
 1b4:	5f                   	pop    %edi
 1b5:	5d                   	pop    %ebp
 1b6:	c3                   	ret    

000001b7 <stat>:

int
stat(const char *n, struct stat *st)
{
 1b7:	55                   	push   %ebp
 1b8:	89 e5                	mov    %esp,%ebp
 1ba:	56                   	push   %esi
 1bb:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1bc:	83 ec 08             	sub    $0x8,%esp
 1bf:	6a 00                	push   $0x0
 1c1:	ff 75 08             	push   0x8(%ebp)
 1c4:	e8 d6 00 00 00       	call   29f <open>
  if(fd < 0)
 1c9:	83 c4 10             	add    $0x10,%esp
 1cc:	85 c0                	test   %eax,%eax
 1ce:	78 24                	js     1f4 <stat+0x3d>
 1d0:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 1d2:	83 ec 08             	sub    $0x8,%esp
 1d5:	ff 75 0c             	push   0xc(%ebp)
 1d8:	50                   	push   %eax
 1d9:	e8 d9 00 00 00       	call   2b7 <fstat>
 1de:	89 c6                	mov    %eax,%esi
  close(fd);
 1e0:	89 1c 24             	mov    %ebx,(%esp)
 1e3:	e8 9f 00 00 00       	call   287 <close>
  return r;
 1e8:	83 c4 10             	add    $0x10,%esp
}
 1eb:	89 f0                	mov    %esi,%eax
 1ed:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1f0:	5b                   	pop    %ebx
 1f1:	5e                   	pop    %esi
 1f2:	5d                   	pop    %ebp
 1f3:	c3                   	ret    
    return -1;
 1f4:	be ff ff ff ff       	mov    $0xffffffff,%esi
 1f9:	eb f0                	jmp    1eb <stat+0x34>

000001fb <atoi>:

int
atoi(const char *s)
{
 1fb:	55                   	push   %ebp
 1fc:	89 e5                	mov    %esp,%ebp
 1fe:	53                   	push   %ebx
 1ff:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 202:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 207:	eb 10                	jmp    219 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 209:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 20c:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 20f:	83 c1 01             	add    $0x1,%ecx
 212:	0f be c0             	movsbl %al,%eax
 215:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 219:	0f b6 01             	movzbl (%ecx),%eax
 21c:	8d 58 d0             	lea    -0x30(%eax),%ebx
 21f:	80 fb 09             	cmp    $0x9,%bl
 222:	76 e5                	jbe    209 <atoi+0xe>
  return n;
}
 224:	89 d0                	mov    %edx,%eax
 226:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 229:	c9                   	leave  
 22a:	c3                   	ret    

0000022b <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 22b:	55                   	push   %ebp
 22c:	89 e5                	mov    %esp,%ebp
 22e:	56                   	push   %esi
 22f:	53                   	push   %ebx
 230:	8b 75 08             	mov    0x8(%ebp),%esi
 233:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 236:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 239:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 23b:	eb 0d                	jmp    24a <memmove+0x1f>
    *dst++ = *src++;
 23d:	0f b6 01             	movzbl (%ecx),%eax
 240:	88 02                	mov    %al,(%edx)
 242:	8d 49 01             	lea    0x1(%ecx),%ecx
 245:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 248:	89 d8                	mov    %ebx,%eax
 24a:	8d 58 ff             	lea    -0x1(%eax),%ebx
 24d:	85 c0                	test   %eax,%eax
 24f:	7f ec                	jg     23d <memmove+0x12>
  return vdst;
}
 251:	89 f0                	mov    %esi,%eax
 253:	5b                   	pop    %ebx
 254:	5e                   	pop    %esi
 255:	5d                   	pop    %ebp
 256:	c3                   	ret    

00000257 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 257:	b8 01 00 00 00       	mov    $0x1,%eax
 25c:	cd 40                	int    $0x40
 25e:	c3                   	ret    

0000025f <exit>:
SYSCALL(exit)
 25f:	b8 02 00 00 00       	mov    $0x2,%eax
 264:	cd 40                	int    $0x40
 266:	c3                   	ret    

00000267 <wait>:
SYSCALL(wait)
 267:	b8 03 00 00 00       	mov    $0x3,%eax
 26c:	cd 40                	int    $0x40
 26e:	c3                   	ret    

0000026f <pipe>:
SYSCALL(pipe)
 26f:	b8 04 00 00 00       	mov    $0x4,%eax
 274:	cd 40                	int    $0x40
 276:	c3                   	ret    

00000277 <read>:
SYSCALL(read)
 277:	b8 05 00 00 00       	mov    $0x5,%eax
 27c:	cd 40                	int    $0x40
 27e:	c3                   	ret    

0000027f <write>:
SYSCALL(write)
 27f:	b8 10 00 00 00       	mov    $0x10,%eax
 284:	cd 40                	int    $0x40
 286:	c3                   	ret    

00000287 <close>:
SYSCALL(close)
 287:	b8 15 00 00 00       	mov    $0x15,%eax
 28c:	cd 40                	int    $0x40
 28e:	c3                   	ret    

0000028f <kill>:
SYSCALL(kill)
 28f:	b8 06 00 00 00       	mov    $0x6,%eax
 294:	cd 40                	int    $0x40
 296:	c3                   	ret    

00000297 <exec>:
SYSCALL(exec)
 297:	b8 07 00 00 00       	mov    $0x7,%eax
 29c:	cd 40                	int    $0x40
 29e:	c3                   	ret    

0000029f <open>:
SYSCALL(open)
 29f:	b8 0f 00 00 00       	mov    $0xf,%eax
 2a4:	cd 40                	int    $0x40
 2a6:	c3                   	ret    

000002a7 <mknod>:
SYSCALL(mknod)
 2a7:	b8 11 00 00 00       	mov    $0x11,%eax
 2ac:	cd 40                	int    $0x40
 2ae:	c3                   	ret    

000002af <unlink>:
SYSCALL(unlink)
 2af:	b8 12 00 00 00       	mov    $0x12,%eax
 2b4:	cd 40                	int    $0x40
 2b6:	c3                   	ret    

000002b7 <fstat>:
SYSCALL(fstat)
 2b7:	b8 08 00 00 00       	mov    $0x8,%eax
 2bc:	cd 40                	int    $0x40
 2be:	c3                   	ret    

000002bf <link>:
SYSCALL(link)
 2bf:	b8 13 00 00 00       	mov    $0x13,%eax
 2c4:	cd 40                	int    $0x40
 2c6:	c3                   	ret    

000002c7 <mkdir>:
SYSCALL(mkdir)
 2c7:	b8 14 00 00 00       	mov    $0x14,%eax
 2cc:	cd 40                	int    $0x40
 2ce:	c3                   	ret    

000002cf <chdir>:
SYSCALL(chdir)
 2cf:	b8 09 00 00 00       	mov    $0x9,%eax
 2d4:	cd 40                	int    $0x40
 2d6:	c3                   	ret    

000002d7 <dup>:
SYSCALL(dup)
 2d7:	b8 0a 00 00 00       	mov    $0xa,%eax
 2dc:	cd 40                	int    $0x40
 2de:	c3                   	ret    

000002df <getpid>:
SYSCALL(getpid)
 2df:	b8 0b 00 00 00       	mov    $0xb,%eax
 2e4:	cd 40                	int    $0x40
 2e6:	c3                   	ret    

000002e7 <sbrk>:
SYSCALL(sbrk)
 2e7:	b8 0c 00 00 00       	mov    $0xc,%eax
 2ec:	cd 40                	int    $0x40
 2ee:	c3                   	ret    

000002ef <sleep>:
SYSCALL(sleep)
 2ef:	b8 0d 00 00 00       	mov    $0xd,%eax
 2f4:	cd 40                	int    $0x40
 2f6:	c3                   	ret    

000002f7 <uptime>:
SYSCALL(uptime)
 2f7:	b8 0e 00 00 00       	mov    $0xe,%eax
 2fc:	cd 40                	int    $0x40
 2fe:	c3                   	ret    

000002ff <clone>:
SYSCALL(clone)
 2ff:	b8 16 00 00 00       	mov    $0x16,%eax
 304:	cd 40                	int    $0x40
 306:	c3                   	ret    

00000307 <join>:
 307:	b8 17 00 00 00       	mov    $0x17,%eax
 30c:	cd 40                	int    $0x40
 30e:	c3                   	ret    

0000030f <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 30f:	55                   	push   %ebp
 310:	89 e5                	mov    %esp,%ebp
 312:	83 ec 1c             	sub    $0x1c,%esp
 315:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 318:	6a 01                	push   $0x1
 31a:	8d 55 f4             	lea    -0xc(%ebp),%edx
 31d:	52                   	push   %edx
 31e:	50                   	push   %eax
 31f:	e8 5b ff ff ff       	call   27f <write>
}
 324:	83 c4 10             	add    $0x10,%esp
 327:	c9                   	leave  
 328:	c3                   	ret    

00000329 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 329:	55                   	push   %ebp
 32a:	89 e5                	mov    %esp,%ebp
 32c:	57                   	push   %edi
 32d:	56                   	push   %esi
 32e:	53                   	push   %ebx
 32f:	83 ec 2c             	sub    $0x2c,%esp
 332:	89 45 d0             	mov    %eax,-0x30(%ebp)
 335:	89 d0                	mov    %edx,%eax
 337:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 339:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 33d:	0f 95 c1             	setne  %cl
 340:	c1 ea 1f             	shr    $0x1f,%edx
 343:	84 d1                	test   %dl,%cl
 345:	74 44                	je     38b <printint+0x62>
    neg = 1;
    x = -xx;
 347:	f7 d8                	neg    %eax
 349:	89 c1                	mov    %eax,%ecx
    neg = 1;
 34b:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 352:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 357:	89 c8                	mov    %ecx,%eax
 359:	ba 00 00 00 00       	mov    $0x0,%edx
 35e:	f7 f6                	div    %esi
 360:	89 df                	mov    %ebx,%edi
 362:	83 c3 01             	add    $0x1,%ebx
 365:	0f b6 92 c4 06 00 00 	movzbl 0x6c4(%edx),%edx
 36c:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 370:	89 ca                	mov    %ecx,%edx
 372:	89 c1                	mov    %eax,%ecx
 374:	39 d6                	cmp    %edx,%esi
 376:	76 df                	jbe    357 <printint+0x2e>
  if(neg)
 378:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 37c:	74 31                	je     3af <printint+0x86>
    buf[i++] = '-';
 37e:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 383:	8d 5f 02             	lea    0x2(%edi),%ebx
 386:	8b 75 d0             	mov    -0x30(%ebp),%esi
 389:	eb 17                	jmp    3a2 <printint+0x79>
    x = xx;
 38b:	89 c1                	mov    %eax,%ecx
  neg = 0;
 38d:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 394:	eb bc                	jmp    352 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 396:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 39b:	89 f0                	mov    %esi,%eax
 39d:	e8 6d ff ff ff       	call   30f <putc>
  while(--i >= 0)
 3a2:	83 eb 01             	sub    $0x1,%ebx
 3a5:	79 ef                	jns    396 <printint+0x6d>
}
 3a7:	83 c4 2c             	add    $0x2c,%esp
 3aa:	5b                   	pop    %ebx
 3ab:	5e                   	pop    %esi
 3ac:	5f                   	pop    %edi
 3ad:	5d                   	pop    %ebp
 3ae:	c3                   	ret    
 3af:	8b 75 d0             	mov    -0x30(%ebp),%esi
 3b2:	eb ee                	jmp    3a2 <printint+0x79>

000003b4 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 3b4:	55                   	push   %ebp
 3b5:	89 e5                	mov    %esp,%ebp
 3b7:	57                   	push   %edi
 3b8:	56                   	push   %esi
 3b9:	53                   	push   %ebx
 3ba:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 3bd:	8d 45 10             	lea    0x10(%ebp),%eax
 3c0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 3c3:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 3c8:	bb 00 00 00 00       	mov    $0x0,%ebx
 3cd:	eb 14                	jmp    3e3 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 3cf:	89 fa                	mov    %edi,%edx
 3d1:	8b 45 08             	mov    0x8(%ebp),%eax
 3d4:	e8 36 ff ff ff       	call   30f <putc>
 3d9:	eb 05                	jmp    3e0 <printf+0x2c>
      }
    } else if(state == '%'){
 3db:	83 fe 25             	cmp    $0x25,%esi
 3de:	74 25                	je     405 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 3e0:	83 c3 01             	add    $0x1,%ebx
 3e3:	8b 45 0c             	mov    0xc(%ebp),%eax
 3e6:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 3ea:	84 c0                	test   %al,%al
 3ec:	0f 84 20 01 00 00    	je     512 <printf+0x15e>
    c = fmt[i] & 0xff;
 3f2:	0f be f8             	movsbl %al,%edi
 3f5:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 3f8:	85 f6                	test   %esi,%esi
 3fa:	75 df                	jne    3db <printf+0x27>
      if(c == '%'){
 3fc:	83 f8 25             	cmp    $0x25,%eax
 3ff:	75 ce                	jne    3cf <printf+0x1b>
        state = '%';
 401:	89 c6                	mov    %eax,%esi
 403:	eb db                	jmp    3e0 <printf+0x2c>
      if(c == 'd'){
 405:	83 f8 25             	cmp    $0x25,%eax
 408:	0f 84 cf 00 00 00    	je     4dd <printf+0x129>
 40e:	0f 8c dd 00 00 00    	jl     4f1 <printf+0x13d>
 414:	83 f8 78             	cmp    $0x78,%eax
 417:	0f 8f d4 00 00 00    	jg     4f1 <printf+0x13d>
 41d:	83 f8 63             	cmp    $0x63,%eax
 420:	0f 8c cb 00 00 00    	jl     4f1 <printf+0x13d>
 426:	83 e8 63             	sub    $0x63,%eax
 429:	83 f8 15             	cmp    $0x15,%eax
 42c:	0f 87 bf 00 00 00    	ja     4f1 <printf+0x13d>
 432:	ff 24 85 6c 06 00 00 	jmp    *0x66c(,%eax,4)
        printint(fd, *ap, 10, 1);
 439:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 43c:	8b 17                	mov    (%edi),%edx
 43e:	83 ec 0c             	sub    $0xc,%esp
 441:	6a 01                	push   $0x1
 443:	b9 0a 00 00 00       	mov    $0xa,%ecx
 448:	8b 45 08             	mov    0x8(%ebp),%eax
 44b:	e8 d9 fe ff ff       	call   329 <printint>
        ap++;
 450:	83 c7 04             	add    $0x4,%edi
 453:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 456:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 459:	be 00 00 00 00       	mov    $0x0,%esi
 45e:	eb 80                	jmp    3e0 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 460:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 463:	8b 17                	mov    (%edi),%edx
 465:	83 ec 0c             	sub    $0xc,%esp
 468:	6a 00                	push   $0x0
 46a:	b9 10 00 00 00       	mov    $0x10,%ecx
 46f:	8b 45 08             	mov    0x8(%ebp),%eax
 472:	e8 b2 fe ff ff       	call   329 <printint>
        ap++;
 477:	83 c7 04             	add    $0x4,%edi
 47a:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 47d:	83 c4 10             	add    $0x10,%esp
      state = 0;
 480:	be 00 00 00 00       	mov    $0x0,%esi
 485:	e9 56 ff ff ff       	jmp    3e0 <printf+0x2c>
        s = (char*)*ap;
 48a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 48d:	8b 30                	mov    (%eax),%esi
        ap++;
 48f:	83 c0 04             	add    $0x4,%eax
 492:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 495:	85 f6                	test   %esi,%esi
 497:	75 15                	jne    4ae <printf+0xfa>
          s = "(null)";
 499:	be 64 06 00 00       	mov    $0x664,%esi
 49e:	eb 0e                	jmp    4ae <printf+0xfa>
          putc(fd, *s);
 4a0:	0f be d2             	movsbl %dl,%edx
 4a3:	8b 45 08             	mov    0x8(%ebp),%eax
 4a6:	e8 64 fe ff ff       	call   30f <putc>
          s++;
 4ab:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 4ae:	0f b6 16             	movzbl (%esi),%edx
 4b1:	84 d2                	test   %dl,%dl
 4b3:	75 eb                	jne    4a0 <printf+0xec>
      state = 0;
 4b5:	be 00 00 00 00       	mov    $0x0,%esi
 4ba:	e9 21 ff ff ff       	jmp    3e0 <printf+0x2c>
        putc(fd, *ap);
 4bf:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4c2:	0f be 17             	movsbl (%edi),%edx
 4c5:	8b 45 08             	mov    0x8(%ebp),%eax
 4c8:	e8 42 fe ff ff       	call   30f <putc>
        ap++;
 4cd:	83 c7 04             	add    $0x4,%edi
 4d0:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 4d3:	be 00 00 00 00       	mov    $0x0,%esi
 4d8:	e9 03 ff ff ff       	jmp    3e0 <printf+0x2c>
        putc(fd, c);
 4dd:	89 fa                	mov    %edi,%edx
 4df:	8b 45 08             	mov    0x8(%ebp),%eax
 4e2:	e8 28 fe ff ff       	call   30f <putc>
      state = 0;
 4e7:	be 00 00 00 00       	mov    $0x0,%esi
 4ec:	e9 ef fe ff ff       	jmp    3e0 <printf+0x2c>
        putc(fd, '%');
 4f1:	ba 25 00 00 00       	mov    $0x25,%edx
 4f6:	8b 45 08             	mov    0x8(%ebp),%eax
 4f9:	e8 11 fe ff ff       	call   30f <putc>
        putc(fd, c);
 4fe:	89 fa                	mov    %edi,%edx
 500:	8b 45 08             	mov    0x8(%ebp),%eax
 503:	e8 07 fe ff ff       	call   30f <putc>
      state = 0;
 508:	be 00 00 00 00       	mov    $0x0,%esi
 50d:	e9 ce fe ff ff       	jmp    3e0 <printf+0x2c>
    }
  }
}
 512:	8d 65 f4             	lea    -0xc(%ebp),%esp
 515:	5b                   	pop    %ebx
 516:	5e                   	pop    %esi
 517:	5f                   	pop    %edi
 518:	5d                   	pop    %ebp
 519:	c3                   	ret    

0000051a <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 51a:	55                   	push   %ebp
 51b:	89 e5                	mov    %esp,%ebp
 51d:	57                   	push   %edi
 51e:	56                   	push   %esi
 51f:	53                   	push   %ebx
 520:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 523:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 526:	a1 2c 0a 00 00       	mov    0xa2c,%eax
 52b:	eb 02                	jmp    52f <free+0x15>
 52d:	89 d0                	mov    %edx,%eax
 52f:	39 c8                	cmp    %ecx,%eax
 531:	73 04                	jae    537 <free+0x1d>
 533:	39 08                	cmp    %ecx,(%eax)
 535:	77 12                	ja     549 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 537:	8b 10                	mov    (%eax),%edx
 539:	39 c2                	cmp    %eax,%edx
 53b:	77 f0                	ja     52d <free+0x13>
 53d:	39 c8                	cmp    %ecx,%eax
 53f:	72 08                	jb     549 <free+0x2f>
 541:	39 ca                	cmp    %ecx,%edx
 543:	77 04                	ja     549 <free+0x2f>
 545:	89 d0                	mov    %edx,%eax
 547:	eb e6                	jmp    52f <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 549:	8b 73 fc             	mov    -0x4(%ebx),%esi
 54c:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 54f:	8b 10                	mov    (%eax),%edx
 551:	39 d7                	cmp    %edx,%edi
 553:	74 19                	je     56e <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 555:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 558:	8b 50 04             	mov    0x4(%eax),%edx
 55b:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 55e:	39 ce                	cmp    %ecx,%esi
 560:	74 1b                	je     57d <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 562:	89 08                	mov    %ecx,(%eax)
  freep = p;
 564:	a3 2c 0a 00 00       	mov    %eax,0xa2c
}
 569:	5b                   	pop    %ebx
 56a:	5e                   	pop    %esi
 56b:	5f                   	pop    %edi
 56c:	5d                   	pop    %ebp
 56d:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 56e:	03 72 04             	add    0x4(%edx),%esi
 571:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 574:	8b 10                	mov    (%eax),%edx
 576:	8b 12                	mov    (%edx),%edx
 578:	89 53 f8             	mov    %edx,-0x8(%ebx)
 57b:	eb db                	jmp    558 <free+0x3e>
    p->s.size += bp->s.size;
 57d:	03 53 fc             	add    -0x4(%ebx),%edx
 580:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 583:	8b 53 f8             	mov    -0x8(%ebx),%edx
 586:	89 10                	mov    %edx,(%eax)
 588:	eb da                	jmp    564 <free+0x4a>

0000058a <morecore>:

static Header*
morecore(uint nu)
{
 58a:	55                   	push   %ebp
 58b:	89 e5                	mov    %esp,%ebp
 58d:	53                   	push   %ebx
 58e:	83 ec 04             	sub    $0x4,%esp
 591:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 593:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 598:	77 05                	ja     59f <morecore+0x15>
    nu = 4096;
 59a:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 59f:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 5a6:	83 ec 0c             	sub    $0xc,%esp
 5a9:	50                   	push   %eax
 5aa:	e8 38 fd ff ff       	call   2e7 <sbrk>
  if(p == (char*)-1)
 5af:	83 c4 10             	add    $0x10,%esp
 5b2:	83 f8 ff             	cmp    $0xffffffff,%eax
 5b5:	74 1c                	je     5d3 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 5b7:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 5ba:	83 c0 08             	add    $0x8,%eax
 5bd:	83 ec 0c             	sub    $0xc,%esp
 5c0:	50                   	push   %eax
 5c1:	e8 54 ff ff ff       	call   51a <free>
  return freep;
 5c6:	a1 2c 0a 00 00       	mov    0xa2c,%eax
 5cb:	83 c4 10             	add    $0x10,%esp
}
 5ce:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5d1:	c9                   	leave  
 5d2:	c3                   	ret    
    return 0;
 5d3:	b8 00 00 00 00       	mov    $0x0,%eax
 5d8:	eb f4                	jmp    5ce <morecore+0x44>

000005da <malloc>:

void*
malloc(uint nbytes)
{
 5da:	55                   	push   %ebp
 5db:	89 e5                	mov    %esp,%ebp
 5dd:	53                   	push   %ebx
 5de:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 5e1:	8b 45 08             	mov    0x8(%ebp),%eax
 5e4:	8d 58 07             	lea    0x7(%eax),%ebx
 5e7:	c1 eb 03             	shr    $0x3,%ebx
 5ea:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 5ed:	8b 0d 2c 0a 00 00    	mov    0xa2c,%ecx
 5f3:	85 c9                	test   %ecx,%ecx
 5f5:	74 04                	je     5fb <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 5f7:	8b 01                	mov    (%ecx),%eax
 5f9:	eb 4a                	jmp    645 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 5fb:	c7 05 2c 0a 00 00 30 	movl   $0xa30,0xa2c
 602:	0a 00 00 
 605:	c7 05 30 0a 00 00 30 	movl   $0xa30,0xa30
 60c:	0a 00 00 
    base.s.size = 0;
 60f:	c7 05 34 0a 00 00 00 	movl   $0x0,0xa34
 616:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 619:	b9 30 0a 00 00       	mov    $0xa30,%ecx
 61e:	eb d7                	jmp    5f7 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 620:	74 19                	je     63b <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 622:	29 da                	sub    %ebx,%edx
 624:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 627:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 62a:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 62d:	89 0d 2c 0a 00 00    	mov    %ecx,0xa2c
      return (void*)(p + 1);
 633:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 636:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 639:	c9                   	leave  
 63a:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 63b:	8b 10                	mov    (%eax),%edx
 63d:	89 11                	mov    %edx,(%ecx)
 63f:	eb ec                	jmp    62d <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 641:	89 c1                	mov    %eax,%ecx
 643:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 645:	8b 50 04             	mov    0x4(%eax),%edx
 648:	39 da                	cmp    %ebx,%edx
 64a:	73 d4                	jae    620 <malloc+0x46>
    if(p == freep)
 64c:	39 05 2c 0a 00 00    	cmp    %eax,0xa2c
 652:	75 ed                	jne    641 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 654:	89 d8                	mov    %ebx,%eax
 656:	e8 2f ff ff ff       	call   58a <morecore>
 65b:	85 c0                	test   %eax,%eax
 65d:	75 e2                	jne    641 <malloc+0x67>
 65f:	eb d5                	jmp    636 <malloc+0x5c>
