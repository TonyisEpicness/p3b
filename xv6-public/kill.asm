
_kill:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char **argv)
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

  if(argc < 2){
  19:	83 fe 01             	cmp    $0x1,%esi
  1c:	7e 07                	jle    25 <main+0x25>
    printf(2, "usage: kill pid...\n");
    exit();
  }
  for(i=1; i<argc; i++)
  1e:	bb 01 00 00 00       	mov    $0x1,%ebx
  23:	eb 2d                	jmp    52 <main+0x52>
    printf(2, "usage: kill pid...\n");
  25:	83 ec 08             	sub    $0x8,%esp
  28:	68 84 06 00 00       	push   $0x684
  2d:	6a 02                	push   $0x2
  2f:	e8 a2 03 00 00       	call   3d6 <printf>
    exit();
  34:	e8 48 02 00 00       	call   281 <exit>
    kill(atoi(argv[i]));
  39:	83 ec 0c             	sub    $0xc,%esp
  3c:	ff 34 9f             	push   (%edi,%ebx,4)
  3f:	e8 d9 01 00 00       	call   21d <atoi>
  44:	89 04 24             	mov    %eax,(%esp)
  47:	e8 65 02 00 00       	call   2b1 <kill>
  for(i=1; i<argc; i++)
  4c:	83 c3 01             	add    $0x1,%ebx
  4f:	83 c4 10             	add    $0x10,%esp
  52:	39 f3                	cmp    %esi,%ebx
  54:	7c e3                	jl     39 <main+0x39>
  exit();
  56:	e8 26 02 00 00       	call   281 <exit>

0000005b <test_and_set>:
#include "fcntl.h"
#include "user.h"
#include "x86.h"
#include "mmu.h"

int test_and_set(int *old_ptr, int new_ptr) {
  5b:	55                   	push   %ebp
  5c:	89 e5                	mov    %esp,%ebp
  5e:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *old_ptr;
  61:	8b 10                	mov    (%eax),%edx
  *old_ptr = new_ptr;
  63:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  66:	89 08                	mov    %ecx,(%eax)
  return old;
}
  68:	89 d0                	mov    %edx,%eax
  6a:	5d                   	pop    %ebp
  6b:	c3                   	ret    

0000006c <thread_create>:

// a wrapper func for clone
int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
  6c:	55                   	push   %ebp
  6d:	89 e5                	mov    %esp,%ebp
  6f:	83 ec 14             	sub    $0x14,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE);
  72:	68 00 10 00 00       	push   $0x1000
  77:	e8 80 05 00 00       	call   5fc <malloc>
  if(n_stack == 0){
  7c:	83 c4 10             	add    $0x10,%esp
  7f:	85 c0                	test   %eax,%eax
  81:	74 14                	je     97 <thread_create+0x2b>
    return -1;
  }
  int new_pid = clone(start_routine, arg1, arg2, n_stack); // TODO: is this the right way to call it?
  83:	50                   	push   %eax
  84:	ff 75 10             	push   0x10(%ebp)
  87:	ff 75 0c             	push   0xc(%ebp)
  8a:	ff 75 08             	push   0x8(%ebp)
  8d:	e8 8f 02 00 00       	call   321 <clone>


  // I can't remember if there was something else to do here but I'm sure I'll find out


  return new_pid;
  92:	83 c4 10             	add    $0x10,%esp
}
  95:	c9                   	leave  
  96:	c3                   	ret    
    return -1;
  97:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  9c:	eb f7                	jmp    95 <thread_create+0x29>

0000009e <thread_join>:

int thread_join() {
  return 0;
}
  9e:	b8 00 00 00 00       	mov    $0x0,%eax
  a3:	c3                   	ret    

000000a4 <lock_acquire>:

void lock_acquire(lock_t *lock){
  a4:	55                   	push   %ebp
  a5:	89 e5                	mov    %esp,%ebp
  a7:	53                   	push   %ebx
  a8:	83 ec 04             	sub    $0x4,%esp
  ab:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
  ae:	83 ec 08             	sub    $0x8,%esp
  b1:	6a 01                	push   $0x1
  b3:	53                   	push   %ebx
  b4:	e8 a2 ff ff ff       	call   5b <test_and_set>
  b9:	83 c4 10             	add    $0x10,%esp
  bc:	83 f8 01             	cmp    $0x1,%eax
  bf:	74 ed                	je     ae <lock_acquire+0xa>
    ;
}
  c1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  c4:	c9                   	leave  
  c5:	c3                   	ret    

000000c6 <lock_release>:

void lock_release(lock_t *lock) {
  c6:	55                   	push   %ebp
  c7:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
  c9:	8b 45 08             	mov    0x8(%ebp),%eax
  cc:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
  d2:	5d                   	pop    %ebp
  d3:	c3                   	ret    

000000d4 <lock_init>:

void lock_init(lock_t *lock) {
  d4:	55                   	push   %ebp
  d5:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
  d7:	8b 45 08             	mov    0x8(%ebp),%eax
  da:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
  e0:	5d                   	pop    %ebp
  e1:	c3                   	ret    

000000e2 <strcpy>:

char*
strcpy(char *s, const char *t)
{
  e2:	55                   	push   %ebp
  e3:	89 e5                	mov    %esp,%ebp
  e5:	56                   	push   %esi
  e6:	53                   	push   %ebx
  e7:	8b 75 08             	mov    0x8(%ebp),%esi
  ea:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  ed:	89 f0                	mov    %esi,%eax
  ef:	89 d1                	mov    %edx,%ecx
  f1:	83 c2 01             	add    $0x1,%edx
  f4:	89 c3                	mov    %eax,%ebx
  f6:	83 c0 01             	add    $0x1,%eax
  f9:	0f b6 09             	movzbl (%ecx),%ecx
  fc:	88 0b                	mov    %cl,(%ebx)
  fe:	84 c9                	test   %cl,%cl
 100:	75 ed                	jne    ef <strcpy+0xd>
    ;
  return os;
}
 102:	89 f0                	mov    %esi,%eax
 104:	5b                   	pop    %ebx
 105:	5e                   	pop    %esi
 106:	5d                   	pop    %ebp
 107:	c3                   	ret    

00000108 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 108:	55                   	push   %ebp
 109:	89 e5                	mov    %esp,%ebp
 10b:	8b 4d 08             	mov    0x8(%ebp),%ecx
 10e:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 111:	eb 06                	jmp    119 <strcmp+0x11>
    p++, q++;
 113:	83 c1 01             	add    $0x1,%ecx
 116:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 119:	0f b6 01             	movzbl (%ecx),%eax
 11c:	84 c0                	test   %al,%al
 11e:	74 04                	je     124 <strcmp+0x1c>
 120:	3a 02                	cmp    (%edx),%al
 122:	74 ef                	je     113 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 124:	0f b6 c0             	movzbl %al,%eax
 127:	0f b6 12             	movzbl (%edx),%edx
 12a:	29 d0                	sub    %edx,%eax
}
 12c:	5d                   	pop    %ebp
 12d:	c3                   	ret    

0000012e <strlen>:

uint
strlen(const char *s)
{
 12e:	55                   	push   %ebp
 12f:	89 e5                	mov    %esp,%ebp
 131:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 134:	b8 00 00 00 00       	mov    $0x0,%eax
 139:	eb 03                	jmp    13e <strlen+0x10>
 13b:	83 c0 01             	add    $0x1,%eax
 13e:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 142:	75 f7                	jne    13b <strlen+0xd>
    ;
  return n;
}
 144:	5d                   	pop    %ebp
 145:	c3                   	ret    

00000146 <memset>:

void*
memset(void *dst, int c, uint n)
{
 146:	55                   	push   %ebp
 147:	89 e5                	mov    %esp,%ebp
 149:	57                   	push   %edi
 14a:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 14d:	89 d7                	mov    %edx,%edi
 14f:	8b 4d 10             	mov    0x10(%ebp),%ecx
 152:	8b 45 0c             	mov    0xc(%ebp),%eax
 155:	fc                   	cld    
 156:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 158:	89 d0                	mov    %edx,%eax
 15a:	8b 7d fc             	mov    -0x4(%ebp),%edi
 15d:	c9                   	leave  
 15e:	c3                   	ret    

0000015f <strchr>:

char*
strchr(const char *s, char c)
{
 15f:	55                   	push   %ebp
 160:	89 e5                	mov    %esp,%ebp
 162:	8b 45 08             	mov    0x8(%ebp),%eax
 165:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 169:	eb 03                	jmp    16e <strchr+0xf>
 16b:	83 c0 01             	add    $0x1,%eax
 16e:	0f b6 10             	movzbl (%eax),%edx
 171:	84 d2                	test   %dl,%dl
 173:	74 06                	je     17b <strchr+0x1c>
    if(*s == c)
 175:	38 ca                	cmp    %cl,%dl
 177:	75 f2                	jne    16b <strchr+0xc>
 179:	eb 05                	jmp    180 <strchr+0x21>
      return (char*)s;
  return 0;
 17b:	b8 00 00 00 00       	mov    $0x0,%eax
}
 180:	5d                   	pop    %ebp
 181:	c3                   	ret    

00000182 <gets>:

char*
gets(char *buf, int max)
{
 182:	55                   	push   %ebp
 183:	89 e5                	mov    %esp,%ebp
 185:	57                   	push   %edi
 186:	56                   	push   %esi
 187:	53                   	push   %ebx
 188:	83 ec 1c             	sub    $0x1c,%esp
 18b:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 18e:	bb 00 00 00 00       	mov    $0x0,%ebx
 193:	89 de                	mov    %ebx,%esi
 195:	83 c3 01             	add    $0x1,%ebx
 198:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 19b:	7d 2e                	jge    1cb <gets+0x49>
    cc = read(0, &c, 1);
 19d:	83 ec 04             	sub    $0x4,%esp
 1a0:	6a 01                	push   $0x1
 1a2:	8d 45 e7             	lea    -0x19(%ebp),%eax
 1a5:	50                   	push   %eax
 1a6:	6a 00                	push   $0x0
 1a8:	e8 ec 00 00 00       	call   299 <read>
    if(cc < 1)
 1ad:	83 c4 10             	add    $0x10,%esp
 1b0:	85 c0                	test   %eax,%eax
 1b2:	7e 17                	jle    1cb <gets+0x49>
      break;
    buf[i++] = c;
 1b4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1b8:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 1bb:	3c 0a                	cmp    $0xa,%al
 1bd:	0f 94 c2             	sete   %dl
 1c0:	3c 0d                	cmp    $0xd,%al
 1c2:	0f 94 c0             	sete   %al
 1c5:	08 c2                	or     %al,%dl
 1c7:	74 ca                	je     193 <gets+0x11>
    buf[i++] = c;
 1c9:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 1cb:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 1cf:	89 f8                	mov    %edi,%eax
 1d1:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1d4:	5b                   	pop    %ebx
 1d5:	5e                   	pop    %esi
 1d6:	5f                   	pop    %edi
 1d7:	5d                   	pop    %ebp
 1d8:	c3                   	ret    

000001d9 <stat>:

int
stat(const char *n, struct stat *st)
{
 1d9:	55                   	push   %ebp
 1da:	89 e5                	mov    %esp,%ebp
 1dc:	56                   	push   %esi
 1dd:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1de:	83 ec 08             	sub    $0x8,%esp
 1e1:	6a 00                	push   $0x0
 1e3:	ff 75 08             	push   0x8(%ebp)
 1e6:	e8 d6 00 00 00       	call   2c1 <open>
  if(fd < 0)
 1eb:	83 c4 10             	add    $0x10,%esp
 1ee:	85 c0                	test   %eax,%eax
 1f0:	78 24                	js     216 <stat+0x3d>
 1f2:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 1f4:	83 ec 08             	sub    $0x8,%esp
 1f7:	ff 75 0c             	push   0xc(%ebp)
 1fa:	50                   	push   %eax
 1fb:	e8 d9 00 00 00       	call   2d9 <fstat>
 200:	89 c6                	mov    %eax,%esi
  close(fd);
 202:	89 1c 24             	mov    %ebx,(%esp)
 205:	e8 9f 00 00 00       	call   2a9 <close>
  return r;
 20a:	83 c4 10             	add    $0x10,%esp
}
 20d:	89 f0                	mov    %esi,%eax
 20f:	8d 65 f8             	lea    -0x8(%ebp),%esp
 212:	5b                   	pop    %ebx
 213:	5e                   	pop    %esi
 214:	5d                   	pop    %ebp
 215:	c3                   	ret    
    return -1;
 216:	be ff ff ff ff       	mov    $0xffffffff,%esi
 21b:	eb f0                	jmp    20d <stat+0x34>

0000021d <atoi>:

int
atoi(const char *s)
{
 21d:	55                   	push   %ebp
 21e:	89 e5                	mov    %esp,%ebp
 220:	53                   	push   %ebx
 221:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 224:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 229:	eb 10                	jmp    23b <atoi+0x1e>
    n = n*10 + *s++ - '0';
 22b:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 22e:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 231:	83 c1 01             	add    $0x1,%ecx
 234:	0f be c0             	movsbl %al,%eax
 237:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 23b:	0f b6 01             	movzbl (%ecx),%eax
 23e:	8d 58 d0             	lea    -0x30(%eax),%ebx
 241:	80 fb 09             	cmp    $0x9,%bl
 244:	76 e5                	jbe    22b <atoi+0xe>
  return n;
}
 246:	89 d0                	mov    %edx,%eax
 248:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 24b:	c9                   	leave  
 24c:	c3                   	ret    

0000024d <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 24d:	55                   	push   %ebp
 24e:	89 e5                	mov    %esp,%ebp
 250:	56                   	push   %esi
 251:	53                   	push   %ebx
 252:	8b 75 08             	mov    0x8(%ebp),%esi
 255:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 258:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 25b:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 25d:	eb 0d                	jmp    26c <memmove+0x1f>
    *dst++ = *src++;
 25f:	0f b6 01             	movzbl (%ecx),%eax
 262:	88 02                	mov    %al,(%edx)
 264:	8d 49 01             	lea    0x1(%ecx),%ecx
 267:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 26a:	89 d8                	mov    %ebx,%eax
 26c:	8d 58 ff             	lea    -0x1(%eax),%ebx
 26f:	85 c0                	test   %eax,%eax
 271:	7f ec                	jg     25f <memmove+0x12>
  return vdst;
}
 273:	89 f0                	mov    %esi,%eax
 275:	5b                   	pop    %ebx
 276:	5e                   	pop    %esi
 277:	5d                   	pop    %ebp
 278:	c3                   	ret    

00000279 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 279:	b8 01 00 00 00       	mov    $0x1,%eax
 27e:	cd 40                	int    $0x40
 280:	c3                   	ret    

00000281 <exit>:
SYSCALL(exit)
 281:	b8 02 00 00 00       	mov    $0x2,%eax
 286:	cd 40                	int    $0x40
 288:	c3                   	ret    

00000289 <wait>:
SYSCALL(wait)
 289:	b8 03 00 00 00       	mov    $0x3,%eax
 28e:	cd 40                	int    $0x40
 290:	c3                   	ret    

00000291 <pipe>:
SYSCALL(pipe)
 291:	b8 04 00 00 00       	mov    $0x4,%eax
 296:	cd 40                	int    $0x40
 298:	c3                   	ret    

00000299 <read>:
SYSCALL(read)
 299:	b8 05 00 00 00       	mov    $0x5,%eax
 29e:	cd 40                	int    $0x40
 2a0:	c3                   	ret    

000002a1 <write>:
SYSCALL(write)
 2a1:	b8 10 00 00 00       	mov    $0x10,%eax
 2a6:	cd 40                	int    $0x40
 2a8:	c3                   	ret    

000002a9 <close>:
SYSCALL(close)
 2a9:	b8 15 00 00 00       	mov    $0x15,%eax
 2ae:	cd 40                	int    $0x40
 2b0:	c3                   	ret    

000002b1 <kill>:
SYSCALL(kill)
 2b1:	b8 06 00 00 00       	mov    $0x6,%eax
 2b6:	cd 40                	int    $0x40
 2b8:	c3                   	ret    

000002b9 <exec>:
SYSCALL(exec)
 2b9:	b8 07 00 00 00       	mov    $0x7,%eax
 2be:	cd 40                	int    $0x40
 2c0:	c3                   	ret    

000002c1 <open>:
SYSCALL(open)
 2c1:	b8 0f 00 00 00       	mov    $0xf,%eax
 2c6:	cd 40                	int    $0x40
 2c8:	c3                   	ret    

000002c9 <mknod>:
SYSCALL(mknod)
 2c9:	b8 11 00 00 00       	mov    $0x11,%eax
 2ce:	cd 40                	int    $0x40
 2d0:	c3                   	ret    

000002d1 <unlink>:
SYSCALL(unlink)
 2d1:	b8 12 00 00 00       	mov    $0x12,%eax
 2d6:	cd 40                	int    $0x40
 2d8:	c3                   	ret    

000002d9 <fstat>:
SYSCALL(fstat)
 2d9:	b8 08 00 00 00       	mov    $0x8,%eax
 2de:	cd 40                	int    $0x40
 2e0:	c3                   	ret    

000002e1 <link>:
SYSCALL(link)
 2e1:	b8 13 00 00 00       	mov    $0x13,%eax
 2e6:	cd 40                	int    $0x40
 2e8:	c3                   	ret    

000002e9 <mkdir>:
SYSCALL(mkdir)
 2e9:	b8 14 00 00 00       	mov    $0x14,%eax
 2ee:	cd 40                	int    $0x40
 2f0:	c3                   	ret    

000002f1 <chdir>:
SYSCALL(chdir)
 2f1:	b8 09 00 00 00       	mov    $0x9,%eax
 2f6:	cd 40                	int    $0x40
 2f8:	c3                   	ret    

000002f9 <dup>:
SYSCALL(dup)
 2f9:	b8 0a 00 00 00       	mov    $0xa,%eax
 2fe:	cd 40                	int    $0x40
 300:	c3                   	ret    

00000301 <getpid>:
SYSCALL(getpid)
 301:	b8 0b 00 00 00       	mov    $0xb,%eax
 306:	cd 40                	int    $0x40
 308:	c3                   	ret    

00000309 <sbrk>:
SYSCALL(sbrk)
 309:	b8 0c 00 00 00       	mov    $0xc,%eax
 30e:	cd 40                	int    $0x40
 310:	c3                   	ret    

00000311 <sleep>:
SYSCALL(sleep)
 311:	b8 0d 00 00 00       	mov    $0xd,%eax
 316:	cd 40                	int    $0x40
 318:	c3                   	ret    

00000319 <uptime>:
SYSCALL(uptime)
 319:	b8 0e 00 00 00       	mov    $0xe,%eax
 31e:	cd 40                	int    $0x40
 320:	c3                   	ret    

00000321 <clone>:
SYSCALL(clone)
 321:	b8 16 00 00 00       	mov    $0x16,%eax
 326:	cd 40                	int    $0x40
 328:	c3                   	ret    

00000329 <join>:
 329:	b8 17 00 00 00       	mov    $0x17,%eax
 32e:	cd 40                	int    $0x40
 330:	c3                   	ret    

00000331 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 331:	55                   	push   %ebp
 332:	89 e5                	mov    %esp,%ebp
 334:	83 ec 1c             	sub    $0x1c,%esp
 337:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 33a:	6a 01                	push   $0x1
 33c:	8d 55 f4             	lea    -0xc(%ebp),%edx
 33f:	52                   	push   %edx
 340:	50                   	push   %eax
 341:	e8 5b ff ff ff       	call   2a1 <write>
}
 346:	83 c4 10             	add    $0x10,%esp
 349:	c9                   	leave  
 34a:	c3                   	ret    

0000034b <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 34b:	55                   	push   %ebp
 34c:	89 e5                	mov    %esp,%ebp
 34e:	57                   	push   %edi
 34f:	56                   	push   %esi
 350:	53                   	push   %ebx
 351:	83 ec 2c             	sub    $0x2c,%esp
 354:	89 45 d0             	mov    %eax,-0x30(%ebp)
 357:	89 d0                	mov    %edx,%eax
 359:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 35b:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 35f:	0f 95 c1             	setne  %cl
 362:	c1 ea 1f             	shr    $0x1f,%edx
 365:	84 d1                	test   %dl,%cl
 367:	74 44                	je     3ad <printint+0x62>
    neg = 1;
    x = -xx;
 369:	f7 d8                	neg    %eax
 36b:	89 c1                	mov    %eax,%ecx
    neg = 1;
 36d:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 374:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 379:	89 c8                	mov    %ecx,%eax
 37b:	ba 00 00 00 00       	mov    $0x0,%edx
 380:	f7 f6                	div    %esi
 382:	89 df                	mov    %ebx,%edi
 384:	83 c3 01             	add    $0x1,%ebx
 387:	0f b6 92 f8 06 00 00 	movzbl 0x6f8(%edx),%edx
 38e:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 392:	89 ca                	mov    %ecx,%edx
 394:	89 c1                	mov    %eax,%ecx
 396:	39 d6                	cmp    %edx,%esi
 398:	76 df                	jbe    379 <printint+0x2e>
  if(neg)
 39a:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 39e:	74 31                	je     3d1 <printint+0x86>
    buf[i++] = '-';
 3a0:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 3a5:	8d 5f 02             	lea    0x2(%edi),%ebx
 3a8:	8b 75 d0             	mov    -0x30(%ebp),%esi
 3ab:	eb 17                	jmp    3c4 <printint+0x79>
    x = xx;
 3ad:	89 c1                	mov    %eax,%ecx
  neg = 0;
 3af:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 3b6:	eb bc                	jmp    374 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 3b8:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 3bd:	89 f0                	mov    %esi,%eax
 3bf:	e8 6d ff ff ff       	call   331 <putc>
  while(--i >= 0)
 3c4:	83 eb 01             	sub    $0x1,%ebx
 3c7:	79 ef                	jns    3b8 <printint+0x6d>
}
 3c9:	83 c4 2c             	add    $0x2c,%esp
 3cc:	5b                   	pop    %ebx
 3cd:	5e                   	pop    %esi
 3ce:	5f                   	pop    %edi
 3cf:	5d                   	pop    %ebp
 3d0:	c3                   	ret    
 3d1:	8b 75 d0             	mov    -0x30(%ebp),%esi
 3d4:	eb ee                	jmp    3c4 <printint+0x79>

000003d6 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 3d6:	55                   	push   %ebp
 3d7:	89 e5                	mov    %esp,%ebp
 3d9:	57                   	push   %edi
 3da:	56                   	push   %esi
 3db:	53                   	push   %ebx
 3dc:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 3df:	8d 45 10             	lea    0x10(%ebp),%eax
 3e2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 3e5:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 3ea:	bb 00 00 00 00       	mov    $0x0,%ebx
 3ef:	eb 14                	jmp    405 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 3f1:	89 fa                	mov    %edi,%edx
 3f3:	8b 45 08             	mov    0x8(%ebp),%eax
 3f6:	e8 36 ff ff ff       	call   331 <putc>
 3fb:	eb 05                	jmp    402 <printf+0x2c>
      }
    } else if(state == '%'){
 3fd:	83 fe 25             	cmp    $0x25,%esi
 400:	74 25                	je     427 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 402:	83 c3 01             	add    $0x1,%ebx
 405:	8b 45 0c             	mov    0xc(%ebp),%eax
 408:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 40c:	84 c0                	test   %al,%al
 40e:	0f 84 20 01 00 00    	je     534 <printf+0x15e>
    c = fmt[i] & 0xff;
 414:	0f be f8             	movsbl %al,%edi
 417:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 41a:	85 f6                	test   %esi,%esi
 41c:	75 df                	jne    3fd <printf+0x27>
      if(c == '%'){
 41e:	83 f8 25             	cmp    $0x25,%eax
 421:	75 ce                	jne    3f1 <printf+0x1b>
        state = '%';
 423:	89 c6                	mov    %eax,%esi
 425:	eb db                	jmp    402 <printf+0x2c>
      if(c == 'd'){
 427:	83 f8 25             	cmp    $0x25,%eax
 42a:	0f 84 cf 00 00 00    	je     4ff <printf+0x129>
 430:	0f 8c dd 00 00 00    	jl     513 <printf+0x13d>
 436:	83 f8 78             	cmp    $0x78,%eax
 439:	0f 8f d4 00 00 00    	jg     513 <printf+0x13d>
 43f:	83 f8 63             	cmp    $0x63,%eax
 442:	0f 8c cb 00 00 00    	jl     513 <printf+0x13d>
 448:	83 e8 63             	sub    $0x63,%eax
 44b:	83 f8 15             	cmp    $0x15,%eax
 44e:	0f 87 bf 00 00 00    	ja     513 <printf+0x13d>
 454:	ff 24 85 a0 06 00 00 	jmp    *0x6a0(,%eax,4)
        printint(fd, *ap, 10, 1);
 45b:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 45e:	8b 17                	mov    (%edi),%edx
 460:	83 ec 0c             	sub    $0xc,%esp
 463:	6a 01                	push   $0x1
 465:	b9 0a 00 00 00       	mov    $0xa,%ecx
 46a:	8b 45 08             	mov    0x8(%ebp),%eax
 46d:	e8 d9 fe ff ff       	call   34b <printint>
        ap++;
 472:	83 c7 04             	add    $0x4,%edi
 475:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 478:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 47b:	be 00 00 00 00       	mov    $0x0,%esi
 480:	eb 80                	jmp    402 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 482:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 485:	8b 17                	mov    (%edi),%edx
 487:	83 ec 0c             	sub    $0xc,%esp
 48a:	6a 00                	push   $0x0
 48c:	b9 10 00 00 00       	mov    $0x10,%ecx
 491:	8b 45 08             	mov    0x8(%ebp),%eax
 494:	e8 b2 fe ff ff       	call   34b <printint>
        ap++;
 499:	83 c7 04             	add    $0x4,%edi
 49c:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 49f:	83 c4 10             	add    $0x10,%esp
      state = 0;
 4a2:	be 00 00 00 00       	mov    $0x0,%esi
 4a7:	e9 56 ff ff ff       	jmp    402 <printf+0x2c>
        s = (char*)*ap;
 4ac:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 4af:	8b 30                	mov    (%eax),%esi
        ap++;
 4b1:	83 c0 04             	add    $0x4,%eax
 4b4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 4b7:	85 f6                	test   %esi,%esi
 4b9:	75 15                	jne    4d0 <printf+0xfa>
          s = "(null)";
 4bb:	be 98 06 00 00       	mov    $0x698,%esi
 4c0:	eb 0e                	jmp    4d0 <printf+0xfa>
          putc(fd, *s);
 4c2:	0f be d2             	movsbl %dl,%edx
 4c5:	8b 45 08             	mov    0x8(%ebp),%eax
 4c8:	e8 64 fe ff ff       	call   331 <putc>
          s++;
 4cd:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 4d0:	0f b6 16             	movzbl (%esi),%edx
 4d3:	84 d2                	test   %dl,%dl
 4d5:	75 eb                	jne    4c2 <printf+0xec>
      state = 0;
 4d7:	be 00 00 00 00       	mov    $0x0,%esi
 4dc:	e9 21 ff ff ff       	jmp    402 <printf+0x2c>
        putc(fd, *ap);
 4e1:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4e4:	0f be 17             	movsbl (%edi),%edx
 4e7:	8b 45 08             	mov    0x8(%ebp),%eax
 4ea:	e8 42 fe ff ff       	call   331 <putc>
        ap++;
 4ef:	83 c7 04             	add    $0x4,%edi
 4f2:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 4f5:	be 00 00 00 00       	mov    $0x0,%esi
 4fa:	e9 03 ff ff ff       	jmp    402 <printf+0x2c>
        putc(fd, c);
 4ff:	89 fa                	mov    %edi,%edx
 501:	8b 45 08             	mov    0x8(%ebp),%eax
 504:	e8 28 fe ff ff       	call   331 <putc>
      state = 0;
 509:	be 00 00 00 00       	mov    $0x0,%esi
 50e:	e9 ef fe ff ff       	jmp    402 <printf+0x2c>
        putc(fd, '%');
 513:	ba 25 00 00 00       	mov    $0x25,%edx
 518:	8b 45 08             	mov    0x8(%ebp),%eax
 51b:	e8 11 fe ff ff       	call   331 <putc>
        putc(fd, c);
 520:	89 fa                	mov    %edi,%edx
 522:	8b 45 08             	mov    0x8(%ebp),%eax
 525:	e8 07 fe ff ff       	call   331 <putc>
      state = 0;
 52a:	be 00 00 00 00       	mov    $0x0,%esi
 52f:	e9 ce fe ff ff       	jmp    402 <printf+0x2c>
    }
  }
}
 534:	8d 65 f4             	lea    -0xc(%ebp),%esp
 537:	5b                   	pop    %ebx
 538:	5e                   	pop    %esi
 539:	5f                   	pop    %edi
 53a:	5d                   	pop    %ebp
 53b:	c3                   	ret    

0000053c <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 53c:	55                   	push   %ebp
 53d:	89 e5                	mov    %esp,%ebp
 53f:	57                   	push   %edi
 540:	56                   	push   %esi
 541:	53                   	push   %ebx
 542:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 545:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 548:	a1 60 0a 00 00       	mov    0xa60,%eax
 54d:	eb 02                	jmp    551 <free+0x15>
 54f:	89 d0                	mov    %edx,%eax
 551:	39 c8                	cmp    %ecx,%eax
 553:	73 04                	jae    559 <free+0x1d>
 555:	39 08                	cmp    %ecx,(%eax)
 557:	77 12                	ja     56b <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 559:	8b 10                	mov    (%eax),%edx
 55b:	39 c2                	cmp    %eax,%edx
 55d:	77 f0                	ja     54f <free+0x13>
 55f:	39 c8                	cmp    %ecx,%eax
 561:	72 08                	jb     56b <free+0x2f>
 563:	39 ca                	cmp    %ecx,%edx
 565:	77 04                	ja     56b <free+0x2f>
 567:	89 d0                	mov    %edx,%eax
 569:	eb e6                	jmp    551 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 56b:	8b 73 fc             	mov    -0x4(%ebx),%esi
 56e:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 571:	8b 10                	mov    (%eax),%edx
 573:	39 d7                	cmp    %edx,%edi
 575:	74 19                	je     590 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 577:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 57a:	8b 50 04             	mov    0x4(%eax),%edx
 57d:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 580:	39 ce                	cmp    %ecx,%esi
 582:	74 1b                	je     59f <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 584:	89 08                	mov    %ecx,(%eax)
  freep = p;
 586:	a3 60 0a 00 00       	mov    %eax,0xa60
}
 58b:	5b                   	pop    %ebx
 58c:	5e                   	pop    %esi
 58d:	5f                   	pop    %edi
 58e:	5d                   	pop    %ebp
 58f:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 590:	03 72 04             	add    0x4(%edx),%esi
 593:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 596:	8b 10                	mov    (%eax),%edx
 598:	8b 12                	mov    (%edx),%edx
 59a:	89 53 f8             	mov    %edx,-0x8(%ebx)
 59d:	eb db                	jmp    57a <free+0x3e>
    p->s.size += bp->s.size;
 59f:	03 53 fc             	add    -0x4(%ebx),%edx
 5a2:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 5a5:	8b 53 f8             	mov    -0x8(%ebx),%edx
 5a8:	89 10                	mov    %edx,(%eax)
 5aa:	eb da                	jmp    586 <free+0x4a>

000005ac <morecore>:

static Header*
morecore(uint nu)
{
 5ac:	55                   	push   %ebp
 5ad:	89 e5                	mov    %esp,%ebp
 5af:	53                   	push   %ebx
 5b0:	83 ec 04             	sub    $0x4,%esp
 5b3:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 5b5:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 5ba:	77 05                	ja     5c1 <morecore+0x15>
    nu = 4096;
 5bc:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 5c1:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 5c8:	83 ec 0c             	sub    $0xc,%esp
 5cb:	50                   	push   %eax
 5cc:	e8 38 fd ff ff       	call   309 <sbrk>
  if(p == (char*)-1)
 5d1:	83 c4 10             	add    $0x10,%esp
 5d4:	83 f8 ff             	cmp    $0xffffffff,%eax
 5d7:	74 1c                	je     5f5 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 5d9:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 5dc:	83 c0 08             	add    $0x8,%eax
 5df:	83 ec 0c             	sub    $0xc,%esp
 5e2:	50                   	push   %eax
 5e3:	e8 54 ff ff ff       	call   53c <free>
  return freep;
 5e8:	a1 60 0a 00 00       	mov    0xa60,%eax
 5ed:	83 c4 10             	add    $0x10,%esp
}
 5f0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5f3:	c9                   	leave  
 5f4:	c3                   	ret    
    return 0;
 5f5:	b8 00 00 00 00       	mov    $0x0,%eax
 5fa:	eb f4                	jmp    5f0 <morecore+0x44>

000005fc <malloc>:

void*
malloc(uint nbytes)
{
 5fc:	55                   	push   %ebp
 5fd:	89 e5                	mov    %esp,%ebp
 5ff:	53                   	push   %ebx
 600:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 603:	8b 45 08             	mov    0x8(%ebp),%eax
 606:	8d 58 07             	lea    0x7(%eax),%ebx
 609:	c1 eb 03             	shr    $0x3,%ebx
 60c:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 60f:	8b 0d 60 0a 00 00    	mov    0xa60,%ecx
 615:	85 c9                	test   %ecx,%ecx
 617:	74 04                	je     61d <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 619:	8b 01                	mov    (%ecx),%eax
 61b:	eb 4a                	jmp    667 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 61d:	c7 05 60 0a 00 00 64 	movl   $0xa64,0xa60
 624:	0a 00 00 
 627:	c7 05 64 0a 00 00 64 	movl   $0xa64,0xa64
 62e:	0a 00 00 
    base.s.size = 0;
 631:	c7 05 68 0a 00 00 00 	movl   $0x0,0xa68
 638:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 63b:	b9 64 0a 00 00       	mov    $0xa64,%ecx
 640:	eb d7                	jmp    619 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 642:	74 19                	je     65d <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 644:	29 da                	sub    %ebx,%edx
 646:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 649:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 64c:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 64f:	89 0d 60 0a 00 00    	mov    %ecx,0xa60
      return (void*)(p + 1);
 655:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 658:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 65b:	c9                   	leave  
 65c:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 65d:	8b 10                	mov    (%eax),%edx
 65f:	89 11                	mov    %edx,(%ecx)
 661:	eb ec                	jmp    64f <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 663:	89 c1                	mov    %eax,%ecx
 665:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 667:	8b 50 04             	mov    0x4(%eax),%edx
 66a:	39 da                	cmp    %ebx,%edx
 66c:	73 d4                	jae    642 <malloc+0x46>
    if(p == freep)
 66e:	39 05 60 0a 00 00    	cmp    %eax,0xa60
 674:	75 ed                	jne    663 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 676:	89 d8                	mov    %ebx,%eax
 678:	e8 2f ff ff ff       	call   5ac <morecore>
 67d:	85 c0                	test   %eax,%eax
 67f:	75 e2                	jne    663 <malloc+0x67>
 681:	eb d5                	jmp    658 <malloc+0x5c>
