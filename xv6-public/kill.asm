
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
  28:	68 90 06 00 00       	push   $0x690
  2d:	6a 02                	push   $0x2
  2f:	e8 ad 03 00 00       	call   3e1 <printf>
    exit();
  34:	e8 53 02 00 00       	call   28c <exit>
    kill(atoi(argv[i]));
  39:	83 ec 0c             	sub    $0xc,%esp
  3c:	ff 34 9f             	push   (%edi,%ebx,4)
  3f:	e8 e4 01 00 00       	call   228 <atoi>
  44:	89 04 24             	mov    %eax,(%esp)
  47:	e8 70 02 00 00       	call   2bc <kill>
  for(i=1; i<argc; i++)
  4c:	83 c3 01             	add    $0x1,%ebx
  4f:	83 c4 10             	add    $0x10,%esp
  52:	39 f3                	cmp    %esi,%ebx
  54:	7c e3                	jl     39 <main+0x39>
  exit();
  56:	e8 31 02 00 00       	call   28c <exit>

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
  void *n_stack = malloc(PGSIZE*2);
  72:	68 00 20 00 00       	push   $0x2000
  77:	e8 8b 05 00 00       	call   607 <malloc>
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
  8d:	e8 9a 02 00 00       	call   32c <clone>


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
  9e:	55                   	push   %ebp
  9f:	89 e5                	mov    %esp,%ebp
  a1:	83 ec 24             	sub    $0x24,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
  a4:	8d 45 f4             	lea    -0xc(%ebp),%eax
  a7:	50                   	push   %eax
  a8:	e8 87 02 00 00       	call   334 <join>
  
  return pid;
}
  ad:	c9                   	leave  
  ae:	c3                   	ret    

000000af <lock_acquire>:

void lock_acquire(lock_t *lock){
  af:	55                   	push   %ebp
  b0:	89 e5                	mov    %esp,%ebp
  b2:	53                   	push   %ebx
  b3:	83 ec 04             	sub    $0x4,%esp
  b6:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
  b9:	83 ec 08             	sub    $0x8,%esp
  bc:	6a 01                	push   $0x1
  be:	53                   	push   %ebx
  bf:	e8 97 ff ff ff       	call   5b <test_and_set>
  c4:	83 c4 10             	add    $0x10,%esp
  c7:	83 f8 01             	cmp    $0x1,%eax
  ca:	74 ed                	je     b9 <lock_acquire+0xa>
    ;
}
  cc:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  cf:	c9                   	leave  
  d0:	c3                   	ret    

000000d1 <lock_release>:

void lock_release(lock_t *lock) {
  d1:	55                   	push   %ebp
  d2:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
  d4:	8b 45 08             	mov    0x8(%ebp),%eax
  d7:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
  dd:	5d                   	pop    %ebp
  de:	c3                   	ret    

000000df <lock_init>:

void lock_init(lock_t *lock) {
  df:	55                   	push   %ebp
  e0:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
  e2:	8b 45 08             	mov    0x8(%ebp),%eax
  e5:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
  eb:	5d                   	pop    %ebp
  ec:	c3                   	ret    

000000ed <strcpy>:

char*
strcpy(char *s, const char *t)
{
  ed:	55                   	push   %ebp
  ee:	89 e5                	mov    %esp,%ebp
  f0:	56                   	push   %esi
  f1:	53                   	push   %ebx
  f2:	8b 75 08             	mov    0x8(%ebp),%esi
  f5:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  f8:	89 f0                	mov    %esi,%eax
  fa:	89 d1                	mov    %edx,%ecx
  fc:	83 c2 01             	add    $0x1,%edx
  ff:	89 c3                	mov    %eax,%ebx
 101:	83 c0 01             	add    $0x1,%eax
 104:	0f b6 09             	movzbl (%ecx),%ecx
 107:	88 0b                	mov    %cl,(%ebx)
 109:	84 c9                	test   %cl,%cl
 10b:	75 ed                	jne    fa <strcpy+0xd>
    ;
  return os;
}
 10d:	89 f0                	mov    %esi,%eax
 10f:	5b                   	pop    %ebx
 110:	5e                   	pop    %esi
 111:	5d                   	pop    %ebp
 112:	c3                   	ret    

00000113 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 113:	55                   	push   %ebp
 114:	89 e5                	mov    %esp,%ebp
 116:	8b 4d 08             	mov    0x8(%ebp),%ecx
 119:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 11c:	eb 06                	jmp    124 <strcmp+0x11>
    p++, q++;
 11e:	83 c1 01             	add    $0x1,%ecx
 121:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 124:	0f b6 01             	movzbl (%ecx),%eax
 127:	84 c0                	test   %al,%al
 129:	74 04                	je     12f <strcmp+0x1c>
 12b:	3a 02                	cmp    (%edx),%al
 12d:	74 ef                	je     11e <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 12f:	0f b6 c0             	movzbl %al,%eax
 132:	0f b6 12             	movzbl (%edx),%edx
 135:	29 d0                	sub    %edx,%eax
}
 137:	5d                   	pop    %ebp
 138:	c3                   	ret    

00000139 <strlen>:

uint
strlen(const char *s)
{
 139:	55                   	push   %ebp
 13a:	89 e5                	mov    %esp,%ebp
 13c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 13f:	b8 00 00 00 00       	mov    $0x0,%eax
 144:	eb 03                	jmp    149 <strlen+0x10>
 146:	83 c0 01             	add    $0x1,%eax
 149:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 14d:	75 f7                	jne    146 <strlen+0xd>
    ;
  return n;
}
 14f:	5d                   	pop    %ebp
 150:	c3                   	ret    

00000151 <memset>:

void*
memset(void *dst, int c, uint n)
{
 151:	55                   	push   %ebp
 152:	89 e5                	mov    %esp,%ebp
 154:	57                   	push   %edi
 155:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 158:	89 d7                	mov    %edx,%edi
 15a:	8b 4d 10             	mov    0x10(%ebp),%ecx
 15d:	8b 45 0c             	mov    0xc(%ebp),%eax
 160:	fc                   	cld    
 161:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 163:	89 d0                	mov    %edx,%eax
 165:	8b 7d fc             	mov    -0x4(%ebp),%edi
 168:	c9                   	leave  
 169:	c3                   	ret    

0000016a <strchr>:

char*
strchr(const char *s, char c)
{
 16a:	55                   	push   %ebp
 16b:	89 e5                	mov    %esp,%ebp
 16d:	8b 45 08             	mov    0x8(%ebp),%eax
 170:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 174:	eb 03                	jmp    179 <strchr+0xf>
 176:	83 c0 01             	add    $0x1,%eax
 179:	0f b6 10             	movzbl (%eax),%edx
 17c:	84 d2                	test   %dl,%dl
 17e:	74 06                	je     186 <strchr+0x1c>
    if(*s == c)
 180:	38 ca                	cmp    %cl,%dl
 182:	75 f2                	jne    176 <strchr+0xc>
 184:	eb 05                	jmp    18b <strchr+0x21>
      return (char*)s;
  return 0;
 186:	b8 00 00 00 00       	mov    $0x0,%eax
}
 18b:	5d                   	pop    %ebp
 18c:	c3                   	ret    

0000018d <gets>:

char*
gets(char *buf, int max)
{
 18d:	55                   	push   %ebp
 18e:	89 e5                	mov    %esp,%ebp
 190:	57                   	push   %edi
 191:	56                   	push   %esi
 192:	53                   	push   %ebx
 193:	83 ec 1c             	sub    $0x1c,%esp
 196:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 199:	bb 00 00 00 00       	mov    $0x0,%ebx
 19e:	89 de                	mov    %ebx,%esi
 1a0:	83 c3 01             	add    $0x1,%ebx
 1a3:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1a6:	7d 2e                	jge    1d6 <gets+0x49>
    cc = read(0, &c, 1);
 1a8:	83 ec 04             	sub    $0x4,%esp
 1ab:	6a 01                	push   $0x1
 1ad:	8d 45 e7             	lea    -0x19(%ebp),%eax
 1b0:	50                   	push   %eax
 1b1:	6a 00                	push   $0x0
 1b3:	e8 ec 00 00 00       	call   2a4 <read>
    if(cc < 1)
 1b8:	83 c4 10             	add    $0x10,%esp
 1bb:	85 c0                	test   %eax,%eax
 1bd:	7e 17                	jle    1d6 <gets+0x49>
      break;
    buf[i++] = c;
 1bf:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1c3:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 1c6:	3c 0a                	cmp    $0xa,%al
 1c8:	0f 94 c2             	sete   %dl
 1cb:	3c 0d                	cmp    $0xd,%al
 1cd:	0f 94 c0             	sete   %al
 1d0:	08 c2                	or     %al,%dl
 1d2:	74 ca                	je     19e <gets+0x11>
    buf[i++] = c;
 1d4:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 1d6:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 1da:	89 f8                	mov    %edi,%eax
 1dc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1df:	5b                   	pop    %ebx
 1e0:	5e                   	pop    %esi
 1e1:	5f                   	pop    %edi
 1e2:	5d                   	pop    %ebp
 1e3:	c3                   	ret    

000001e4 <stat>:

int
stat(const char *n, struct stat *st)
{
 1e4:	55                   	push   %ebp
 1e5:	89 e5                	mov    %esp,%ebp
 1e7:	56                   	push   %esi
 1e8:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1e9:	83 ec 08             	sub    $0x8,%esp
 1ec:	6a 00                	push   $0x0
 1ee:	ff 75 08             	push   0x8(%ebp)
 1f1:	e8 d6 00 00 00       	call   2cc <open>
  if(fd < 0)
 1f6:	83 c4 10             	add    $0x10,%esp
 1f9:	85 c0                	test   %eax,%eax
 1fb:	78 24                	js     221 <stat+0x3d>
 1fd:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 1ff:	83 ec 08             	sub    $0x8,%esp
 202:	ff 75 0c             	push   0xc(%ebp)
 205:	50                   	push   %eax
 206:	e8 d9 00 00 00       	call   2e4 <fstat>
 20b:	89 c6                	mov    %eax,%esi
  close(fd);
 20d:	89 1c 24             	mov    %ebx,(%esp)
 210:	e8 9f 00 00 00       	call   2b4 <close>
  return r;
 215:	83 c4 10             	add    $0x10,%esp
}
 218:	89 f0                	mov    %esi,%eax
 21a:	8d 65 f8             	lea    -0x8(%ebp),%esp
 21d:	5b                   	pop    %ebx
 21e:	5e                   	pop    %esi
 21f:	5d                   	pop    %ebp
 220:	c3                   	ret    
    return -1;
 221:	be ff ff ff ff       	mov    $0xffffffff,%esi
 226:	eb f0                	jmp    218 <stat+0x34>

00000228 <atoi>:

int
atoi(const char *s)
{
 228:	55                   	push   %ebp
 229:	89 e5                	mov    %esp,%ebp
 22b:	53                   	push   %ebx
 22c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 22f:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 234:	eb 10                	jmp    246 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 236:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 239:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 23c:	83 c1 01             	add    $0x1,%ecx
 23f:	0f be c0             	movsbl %al,%eax
 242:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 246:	0f b6 01             	movzbl (%ecx),%eax
 249:	8d 58 d0             	lea    -0x30(%eax),%ebx
 24c:	80 fb 09             	cmp    $0x9,%bl
 24f:	76 e5                	jbe    236 <atoi+0xe>
  return n;
}
 251:	89 d0                	mov    %edx,%eax
 253:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 256:	c9                   	leave  
 257:	c3                   	ret    

00000258 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 258:	55                   	push   %ebp
 259:	89 e5                	mov    %esp,%ebp
 25b:	56                   	push   %esi
 25c:	53                   	push   %ebx
 25d:	8b 75 08             	mov    0x8(%ebp),%esi
 260:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 263:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 266:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 268:	eb 0d                	jmp    277 <memmove+0x1f>
    *dst++ = *src++;
 26a:	0f b6 01             	movzbl (%ecx),%eax
 26d:	88 02                	mov    %al,(%edx)
 26f:	8d 49 01             	lea    0x1(%ecx),%ecx
 272:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 275:	89 d8                	mov    %ebx,%eax
 277:	8d 58 ff             	lea    -0x1(%eax),%ebx
 27a:	85 c0                	test   %eax,%eax
 27c:	7f ec                	jg     26a <memmove+0x12>
  return vdst;
}
 27e:	89 f0                	mov    %esi,%eax
 280:	5b                   	pop    %ebx
 281:	5e                   	pop    %esi
 282:	5d                   	pop    %ebp
 283:	c3                   	ret    

00000284 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 284:	b8 01 00 00 00       	mov    $0x1,%eax
 289:	cd 40                	int    $0x40
 28b:	c3                   	ret    

0000028c <exit>:
SYSCALL(exit)
 28c:	b8 02 00 00 00       	mov    $0x2,%eax
 291:	cd 40                	int    $0x40
 293:	c3                   	ret    

00000294 <wait>:
SYSCALL(wait)
 294:	b8 03 00 00 00       	mov    $0x3,%eax
 299:	cd 40                	int    $0x40
 29b:	c3                   	ret    

0000029c <pipe>:
SYSCALL(pipe)
 29c:	b8 04 00 00 00       	mov    $0x4,%eax
 2a1:	cd 40                	int    $0x40
 2a3:	c3                   	ret    

000002a4 <read>:
SYSCALL(read)
 2a4:	b8 05 00 00 00       	mov    $0x5,%eax
 2a9:	cd 40                	int    $0x40
 2ab:	c3                   	ret    

000002ac <write>:
SYSCALL(write)
 2ac:	b8 10 00 00 00       	mov    $0x10,%eax
 2b1:	cd 40                	int    $0x40
 2b3:	c3                   	ret    

000002b4 <close>:
SYSCALL(close)
 2b4:	b8 15 00 00 00       	mov    $0x15,%eax
 2b9:	cd 40                	int    $0x40
 2bb:	c3                   	ret    

000002bc <kill>:
SYSCALL(kill)
 2bc:	b8 06 00 00 00       	mov    $0x6,%eax
 2c1:	cd 40                	int    $0x40
 2c3:	c3                   	ret    

000002c4 <exec>:
SYSCALL(exec)
 2c4:	b8 07 00 00 00       	mov    $0x7,%eax
 2c9:	cd 40                	int    $0x40
 2cb:	c3                   	ret    

000002cc <open>:
SYSCALL(open)
 2cc:	b8 0f 00 00 00       	mov    $0xf,%eax
 2d1:	cd 40                	int    $0x40
 2d3:	c3                   	ret    

000002d4 <mknod>:
SYSCALL(mknod)
 2d4:	b8 11 00 00 00       	mov    $0x11,%eax
 2d9:	cd 40                	int    $0x40
 2db:	c3                   	ret    

000002dc <unlink>:
SYSCALL(unlink)
 2dc:	b8 12 00 00 00       	mov    $0x12,%eax
 2e1:	cd 40                	int    $0x40
 2e3:	c3                   	ret    

000002e4 <fstat>:
SYSCALL(fstat)
 2e4:	b8 08 00 00 00       	mov    $0x8,%eax
 2e9:	cd 40                	int    $0x40
 2eb:	c3                   	ret    

000002ec <link>:
SYSCALL(link)
 2ec:	b8 13 00 00 00       	mov    $0x13,%eax
 2f1:	cd 40                	int    $0x40
 2f3:	c3                   	ret    

000002f4 <mkdir>:
SYSCALL(mkdir)
 2f4:	b8 14 00 00 00       	mov    $0x14,%eax
 2f9:	cd 40                	int    $0x40
 2fb:	c3                   	ret    

000002fc <chdir>:
SYSCALL(chdir)
 2fc:	b8 09 00 00 00       	mov    $0x9,%eax
 301:	cd 40                	int    $0x40
 303:	c3                   	ret    

00000304 <dup>:
SYSCALL(dup)
 304:	b8 0a 00 00 00       	mov    $0xa,%eax
 309:	cd 40                	int    $0x40
 30b:	c3                   	ret    

0000030c <getpid>:
SYSCALL(getpid)
 30c:	b8 0b 00 00 00       	mov    $0xb,%eax
 311:	cd 40                	int    $0x40
 313:	c3                   	ret    

00000314 <sbrk>:
SYSCALL(sbrk)
 314:	b8 0c 00 00 00       	mov    $0xc,%eax
 319:	cd 40                	int    $0x40
 31b:	c3                   	ret    

0000031c <sleep>:
SYSCALL(sleep)
 31c:	b8 0d 00 00 00       	mov    $0xd,%eax
 321:	cd 40                	int    $0x40
 323:	c3                   	ret    

00000324 <uptime>:
SYSCALL(uptime)
 324:	b8 0e 00 00 00       	mov    $0xe,%eax
 329:	cd 40                	int    $0x40
 32b:	c3                   	ret    

0000032c <clone>:
SYSCALL(clone)
 32c:	b8 16 00 00 00       	mov    $0x16,%eax
 331:	cd 40                	int    $0x40
 333:	c3                   	ret    

00000334 <join>:
 334:	b8 17 00 00 00       	mov    $0x17,%eax
 339:	cd 40                	int    $0x40
 33b:	c3                   	ret    

0000033c <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 33c:	55                   	push   %ebp
 33d:	89 e5                	mov    %esp,%ebp
 33f:	83 ec 1c             	sub    $0x1c,%esp
 342:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 345:	6a 01                	push   $0x1
 347:	8d 55 f4             	lea    -0xc(%ebp),%edx
 34a:	52                   	push   %edx
 34b:	50                   	push   %eax
 34c:	e8 5b ff ff ff       	call   2ac <write>
}
 351:	83 c4 10             	add    $0x10,%esp
 354:	c9                   	leave  
 355:	c3                   	ret    

00000356 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 356:	55                   	push   %ebp
 357:	89 e5                	mov    %esp,%ebp
 359:	57                   	push   %edi
 35a:	56                   	push   %esi
 35b:	53                   	push   %ebx
 35c:	83 ec 2c             	sub    $0x2c,%esp
 35f:	89 45 d0             	mov    %eax,-0x30(%ebp)
 362:	89 d0                	mov    %edx,%eax
 364:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 366:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 36a:	0f 95 c1             	setne  %cl
 36d:	c1 ea 1f             	shr    $0x1f,%edx
 370:	84 d1                	test   %dl,%cl
 372:	74 44                	je     3b8 <printint+0x62>
    neg = 1;
    x = -xx;
 374:	f7 d8                	neg    %eax
 376:	89 c1                	mov    %eax,%ecx
    neg = 1;
 378:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 37f:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 384:	89 c8                	mov    %ecx,%eax
 386:	ba 00 00 00 00       	mov    $0x0,%edx
 38b:	f7 f6                	div    %esi
 38d:	89 df                	mov    %ebx,%edi
 38f:	83 c3 01             	add    $0x1,%ebx
 392:	0f b6 92 04 07 00 00 	movzbl 0x704(%edx),%edx
 399:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 39d:	89 ca                	mov    %ecx,%edx
 39f:	89 c1                	mov    %eax,%ecx
 3a1:	39 d6                	cmp    %edx,%esi
 3a3:	76 df                	jbe    384 <printint+0x2e>
  if(neg)
 3a5:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 3a9:	74 31                	je     3dc <printint+0x86>
    buf[i++] = '-';
 3ab:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 3b0:	8d 5f 02             	lea    0x2(%edi),%ebx
 3b3:	8b 75 d0             	mov    -0x30(%ebp),%esi
 3b6:	eb 17                	jmp    3cf <printint+0x79>
    x = xx;
 3b8:	89 c1                	mov    %eax,%ecx
  neg = 0;
 3ba:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 3c1:	eb bc                	jmp    37f <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 3c3:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 3c8:	89 f0                	mov    %esi,%eax
 3ca:	e8 6d ff ff ff       	call   33c <putc>
  while(--i >= 0)
 3cf:	83 eb 01             	sub    $0x1,%ebx
 3d2:	79 ef                	jns    3c3 <printint+0x6d>
}
 3d4:	83 c4 2c             	add    $0x2c,%esp
 3d7:	5b                   	pop    %ebx
 3d8:	5e                   	pop    %esi
 3d9:	5f                   	pop    %edi
 3da:	5d                   	pop    %ebp
 3db:	c3                   	ret    
 3dc:	8b 75 d0             	mov    -0x30(%ebp),%esi
 3df:	eb ee                	jmp    3cf <printint+0x79>

000003e1 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 3e1:	55                   	push   %ebp
 3e2:	89 e5                	mov    %esp,%ebp
 3e4:	57                   	push   %edi
 3e5:	56                   	push   %esi
 3e6:	53                   	push   %ebx
 3e7:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 3ea:	8d 45 10             	lea    0x10(%ebp),%eax
 3ed:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 3f0:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 3f5:	bb 00 00 00 00       	mov    $0x0,%ebx
 3fa:	eb 14                	jmp    410 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 3fc:	89 fa                	mov    %edi,%edx
 3fe:	8b 45 08             	mov    0x8(%ebp),%eax
 401:	e8 36 ff ff ff       	call   33c <putc>
 406:	eb 05                	jmp    40d <printf+0x2c>
      }
    } else if(state == '%'){
 408:	83 fe 25             	cmp    $0x25,%esi
 40b:	74 25                	je     432 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 40d:	83 c3 01             	add    $0x1,%ebx
 410:	8b 45 0c             	mov    0xc(%ebp),%eax
 413:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 417:	84 c0                	test   %al,%al
 419:	0f 84 20 01 00 00    	je     53f <printf+0x15e>
    c = fmt[i] & 0xff;
 41f:	0f be f8             	movsbl %al,%edi
 422:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 425:	85 f6                	test   %esi,%esi
 427:	75 df                	jne    408 <printf+0x27>
      if(c == '%'){
 429:	83 f8 25             	cmp    $0x25,%eax
 42c:	75 ce                	jne    3fc <printf+0x1b>
        state = '%';
 42e:	89 c6                	mov    %eax,%esi
 430:	eb db                	jmp    40d <printf+0x2c>
      if(c == 'd'){
 432:	83 f8 25             	cmp    $0x25,%eax
 435:	0f 84 cf 00 00 00    	je     50a <printf+0x129>
 43b:	0f 8c dd 00 00 00    	jl     51e <printf+0x13d>
 441:	83 f8 78             	cmp    $0x78,%eax
 444:	0f 8f d4 00 00 00    	jg     51e <printf+0x13d>
 44a:	83 f8 63             	cmp    $0x63,%eax
 44d:	0f 8c cb 00 00 00    	jl     51e <printf+0x13d>
 453:	83 e8 63             	sub    $0x63,%eax
 456:	83 f8 15             	cmp    $0x15,%eax
 459:	0f 87 bf 00 00 00    	ja     51e <printf+0x13d>
 45f:	ff 24 85 ac 06 00 00 	jmp    *0x6ac(,%eax,4)
        printint(fd, *ap, 10, 1);
 466:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 469:	8b 17                	mov    (%edi),%edx
 46b:	83 ec 0c             	sub    $0xc,%esp
 46e:	6a 01                	push   $0x1
 470:	b9 0a 00 00 00       	mov    $0xa,%ecx
 475:	8b 45 08             	mov    0x8(%ebp),%eax
 478:	e8 d9 fe ff ff       	call   356 <printint>
        ap++;
 47d:	83 c7 04             	add    $0x4,%edi
 480:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 483:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 486:	be 00 00 00 00       	mov    $0x0,%esi
 48b:	eb 80                	jmp    40d <printf+0x2c>
        printint(fd, *ap, 16, 0);
 48d:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 490:	8b 17                	mov    (%edi),%edx
 492:	83 ec 0c             	sub    $0xc,%esp
 495:	6a 00                	push   $0x0
 497:	b9 10 00 00 00       	mov    $0x10,%ecx
 49c:	8b 45 08             	mov    0x8(%ebp),%eax
 49f:	e8 b2 fe ff ff       	call   356 <printint>
        ap++;
 4a4:	83 c7 04             	add    $0x4,%edi
 4a7:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 4aa:	83 c4 10             	add    $0x10,%esp
      state = 0;
 4ad:	be 00 00 00 00       	mov    $0x0,%esi
 4b2:	e9 56 ff ff ff       	jmp    40d <printf+0x2c>
        s = (char*)*ap;
 4b7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 4ba:	8b 30                	mov    (%eax),%esi
        ap++;
 4bc:	83 c0 04             	add    $0x4,%eax
 4bf:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 4c2:	85 f6                	test   %esi,%esi
 4c4:	75 15                	jne    4db <printf+0xfa>
          s = "(null)";
 4c6:	be a4 06 00 00       	mov    $0x6a4,%esi
 4cb:	eb 0e                	jmp    4db <printf+0xfa>
          putc(fd, *s);
 4cd:	0f be d2             	movsbl %dl,%edx
 4d0:	8b 45 08             	mov    0x8(%ebp),%eax
 4d3:	e8 64 fe ff ff       	call   33c <putc>
          s++;
 4d8:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 4db:	0f b6 16             	movzbl (%esi),%edx
 4de:	84 d2                	test   %dl,%dl
 4e0:	75 eb                	jne    4cd <printf+0xec>
      state = 0;
 4e2:	be 00 00 00 00       	mov    $0x0,%esi
 4e7:	e9 21 ff ff ff       	jmp    40d <printf+0x2c>
        putc(fd, *ap);
 4ec:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4ef:	0f be 17             	movsbl (%edi),%edx
 4f2:	8b 45 08             	mov    0x8(%ebp),%eax
 4f5:	e8 42 fe ff ff       	call   33c <putc>
        ap++;
 4fa:	83 c7 04             	add    $0x4,%edi
 4fd:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 500:	be 00 00 00 00       	mov    $0x0,%esi
 505:	e9 03 ff ff ff       	jmp    40d <printf+0x2c>
        putc(fd, c);
 50a:	89 fa                	mov    %edi,%edx
 50c:	8b 45 08             	mov    0x8(%ebp),%eax
 50f:	e8 28 fe ff ff       	call   33c <putc>
      state = 0;
 514:	be 00 00 00 00       	mov    $0x0,%esi
 519:	e9 ef fe ff ff       	jmp    40d <printf+0x2c>
        putc(fd, '%');
 51e:	ba 25 00 00 00       	mov    $0x25,%edx
 523:	8b 45 08             	mov    0x8(%ebp),%eax
 526:	e8 11 fe ff ff       	call   33c <putc>
        putc(fd, c);
 52b:	89 fa                	mov    %edi,%edx
 52d:	8b 45 08             	mov    0x8(%ebp),%eax
 530:	e8 07 fe ff ff       	call   33c <putc>
      state = 0;
 535:	be 00 00 00 00       	mov    $0x0,%esi
 53a:	e9 ce fe ff ff       	jmp    40d <printf+0x2c>
    }
  }
}
 53f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 542:	5b                   	pop    %ebx
 543:	5e                   	pop    %esi
 544:	5f                   	pop    %edi
 545:	5d                   	pop    %ebp
 546:	c3                   	ret    

00000547 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 547:	55                   	push   %ebp
 548:	89 e5                	mov    %esp,%ebp
 54a:	57                   	push   %edi
 54b:	56                   	push   %esi
 54c:	53                   	push   %ebx
 54d:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 550:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 553:	a1 78 0a 00 00       	mov    0xa78,%eax
 558:	eb 02                	jmp    55c <free+0x15>
 55a:	89 d0                	mov    %edx,%eax
 55c:	39 c8                	cmp    %ecx,%eax
 55e:	73 04                	jae    564 <free+0x1d>
 560:	39 08                	cmp    %ecx,(%eax)
 562:	77 12                	ja     576 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 564:	8b 10                	mov    (%eax),%edx
 566:	39 c2                	cmp    %eax,%edx
 568:	77 f0                	ja     55a <free+0x13>
 56a:	39 c8                	cmp    %ecx,%eax
 56c:	72 08                	jb     576 <free+0x2f>
 56e:	39 ca                	cmp    %ecx,%edx
 570:	77 04                	ja     576 <free+0x2f>
 572:	89 d0                	mov    %edx,%eax
 574:	eb e6                	jmp    55c <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 576:	8b 73 fc             	mov    -0x4(%ebx),%esi
 579:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 57c:	8b 10                	mov    (%eax),%edx
 57e:	39 d7                	cmp    %edx,%edi
 580:	74 19                	je     59b <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 582:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 585:	8b 50 04             	mov    0x4(%eax),%edx
 588:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 58b:	39 ce                	cmp    %ecx,%esi
 58d:	74 1b                	je     5aa <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 58f:	89 08                	mov    %ecx,(%eax)
  freep = p;
 591:	a3 78 0a 00 00       	mov    %eax,0xa78
}
 596:	5b                   	pop    %ebx
 597:	5e                   	pop    %esi
 598:	5f                   	pop    %edi
 599:	5d                   	pop    %ebp
 59a:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 59b:	03 72 04             	add    0x4(%edx),%esi
 59e:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 5a1:	8b 10                	mov    (%eax),%edx
 5a3:	8b 12                	mov    (%edx),%edx
 5a5:	89 53 f8             	mov    %edx,-0x8(%ebx)
 5a8:	eb db                	jmp    585 <free+0x3e>
    p->s.size += bp->s.size;
 5aa:	03 53 fc             	add    -0x4(%ebx),%edx
 5ad:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 5b0:	8b 53 f8             	mov    -0x8(%ebx),%edx
 5b3:	89 10                	mov    %edx,(%eax)
 5b5:	eb da                	jmp    591 <free+0x4a>

000005b7 <morecore>:

static Header*
morecore(uint nu)
{
 5b7:	55                   	push   %ebp
 5b8:	89 e5                	mov    %esp,%ebp
 5ba:	53                   	push   %ebx
 5bb:	83 ec 04             	sub    $0x4,%esp
 5be:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 5c0:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 5c5:	77 05                	ja     5cc <morecore+0x15>
    nu = 4096;
 5c7:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 5cc:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 5d3:	83 ec 0c             	sub    $0xc,%esp
 5d6:	50                   	push   %eax
 5d7:	e8 38 fd ff ff       	call   314 <sbrk>
  if(p == (char*)-1)
 5dc:	83 c4 10             	add    $0x10,%esp
 5df:	83 f8 ff             	cmp    $0xffffffff,%eax
 5e2:	74 1c                	je     600 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 5e4:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 5e7:	83 c0 08             	add    $0x8,%eax
 5ea:	83 ec 0c             	sub    $0xc,%esp
 5ed:	50                   	push   %eax
 5ee:	e8 54 ff ff ff       	call   547 <free>
  return freep;
 5f3:	a1 78 0a 00 00       	mov    0xa78,%eax
 5f8:	83 c4 10             	add    $0x10,%esp
}
 5fb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5fe:	c9                   	leave  
 5ff:	c3                   	ret    
    return 0;
 600:	b8 00 00 00 00       	mov    $0x0,%eax
 605:	eb f4                	jmp    5fb <morecore+0x44>

00000607 <malloc>:

void*
malloc(uint nbytes)
{
 607:	55                   	push   %ebp
 608:	89 e5                	mov    %esp,%ebp
 60a:	53                   	push   %ebx
 60b:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 60e:	8b 45 08             	mov    0x8(%ebp),%eax
 611:	8d 58 07             	lea    0x7(%eax),%ebx
 614:	c1 eb 03             	shr    $0x3,%ebx
 617:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 61a:	8b 0d 78 0a 00 00    	mov    0xa78,%ecx
 620:	85 c9                	test   %ecx,%ecx
 622:	74 04                	je     628 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 624:	8b 01                	mov    (%ecx),%eax
 626:	eb 4a                	jmp    672 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 628:	c7 05 78 0a 00 00 7c 	movl   $0xa7c,0xa78
 62f:	0a 00 00 
 632:	c7 05 7c 0a 00 00 7c 	movl   $0xa7c,0xa7c
 639:	0a 00 00 
    base.s.size = 0;
 63c:	c7 05 80 0a 00 00 00 	movl   $0x0,0xa80
 643:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 646:	b9 7c 0a 00 00       	mov    $0xa7c,%ecx
 64b:	eb d7                	jmp    624 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 64d:	74 19                	je     668 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 64f:	29 da                	sub    %ebx,%edx
 651:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 654:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 657:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 65a:	89 0d 78 0a 00 00    	mov    %ecx,0xa78
      return (void*)(p + 1);
 660:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 663:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 666:	c9                   	leave  
 667:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 668:	8b 10                	mov    (%eax),%edx
 66a:	89 11                	mov    %edx,(%ecx)
 66c:	eb ec                	jmp    65a <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 66e:	89 c1                	mov    %eax,%ecx
 670:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 672:	8b 50 04             	mov    0x4(%eax),%edx
 675:	39 da                	cmp    %ebx,%edx
 677:	73 d4                	jae    64d <malloc+0x46>
    if(p == freep)
 679:	39 05 78 0a 00 00    	cmp    %eax,0xa78
 67f:	75 ed                	jne    66e <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 681:	89 d8                	mov    %ebx,%eax
 683:	e8 2f ff ff ff       	call   5b7 <morecore>
 688:	85 c0                	test   %eax,%eax
 68a:	75 e2                	jne    66e <malloc+0x67>
 68c:	eb d5                	jmp    663 <malloc+0x5c>
