
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
  20:	ba 7e 06 00 00       	mov    $0x67e,%edx
  25:	52                   	push   %edx
  26:	ff 34 87             	push   (%edi,%eax,4)
  29:	68 80 06 00 00       	push   $0x680
  2e:	6a 01                	push   $0x1
  30:	e8 97 03 00 00       	call   3cc <printf>
  35:	83 c4 10             	add    $0x10,%esp
  for(i = 1; i < argc; i++)
  38:	89 d8                	mov    %ebx,%eax
  3a:	39 f0                	cmp    %esi,%eax
  3c:	7d 0e                	jge    4c <main+0x4c>
    printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
  3e:	8d 58 01             	lea    0x1(%eax),%ebx
  41:	39 f3                	cmp    %esi,%ebx
  43:	7d db                	jge    20 <main+0x20>
  45:	ba 7c 06 00 00       	mov    $0x67c,%edx
  4a:	eb d9                	jmp    25 <main+0x25>
  exit();
  4c:	e8 26 02 00 00       	call   277 <exit>

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

// a wrapper func for clone
int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
  62:	55                   	push   %ebp
  63:	89 e5                	mov    %esp,%ebp
  65:	83 ec 14             	sub    $0x14,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE);
  68:	68 00 10 00 00       	push   $0x1000
  6d:	e8 80 05 00 00       	call   5f2 <malloc>
  if(n_stack == 0){
  72:	83 c4 10             	add    $0x10,%esp
  75:	85 c0                	test   %eax,%eax
  77:	74 14                	je     8d <thread_create+0x2b>
    return -1;
  }
  int new_pid = clone(start_routine, arg1, arg2, n_stack); // TODO: is this the right way to call it?
  79:	50                   	push   %eax
  7a:	ff 75 10             	push   0x10(%ebp)
  7d:	ff 75 0c             	push   0xc(%ebp)
  80:	ff 75 08             	push   0x8(%ebp)
  83:	e8 8f 02 00 00       	call   317 <clone>


  // I can't remember if there was something else to do here but I'm sure I'll find out


  return new_pid;
  88:	83 c4 10             	add    $0x10,%esp
}
  8b:	c9                   	leave  
  8c:	c3                   	ret    
    return -1;
  8d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  92:	eb f7                	jmp    8b <thread_create+0x29>

00000094 <thread_join>:

int thread_join() {
  return 0;
}
  94:	b8 00 00 00 00       	mov    $0x0,%eax
  99:	c3                   	ret    

0000009a <lock_acquire>:

void lock_acquire(lock_t *lock){
  9a:	55                   	push   %ebp
  9b:	89 e5                	mov    %esp,%ebp
  9d:	53                   	push   %ebx
  9e:	83 ec 04             	sub    $0x4,%esp
  a1:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
  a4:	83 ec 08             	sub    $0x8,%esp
  a7:	6a 01                	push   $0x1
  a9:	53                   	push   %ebx
  aa:	e8 a2 ff ff ff       	call   51 <test_and_set>
  af:	83 c4 10             	add    $0x10,%esp
  b2:	83 f8 01             	cmp    $0x1,%eax
  b5:	74 ed                	je     a4 <lock_acquire+0xa>
    ;
}
  b7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  ba:	c9                   	leave  
  bb:	c3                   	ret    

000000bc <lock_release>:

void lock_release(lock_t *lock) {
  bc:	55                   	push   %ebp
  bd:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
  bf:	8b 45 08             	mov    0x8(%ebp),%eax
  c2:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
  c8:	5d                   	pop    %ebp
  c9:	c3                   	ret    

000000ca <lock_init>:

void lock_init(lock_t *lock) {
  ca:	55                   	push   %ebp
  cb:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
  cd:	8b 45 08             	mov    0x8(%ebp),%eax
  d0:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
  d6:	5d                   	pop    %ebp
  d7:	c3                   	ret    

000000d8 <strcpy>:

char*
strcpy(char *s, const char *t)
{
  d8:	55                   	push   %ebp
  d9:	89 e5                	mov    %esp,%ebp
  db:	56                   	push   %esi
  dc:	53                   	push   %ebx
  dd:	8b 75 08             	mov    0x8(%ebp),%esi
  e0:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  e3:	89 f0                	mov    %esi,%eax
  e5:	89 d1                	mov    %edx,%ecx
  e7:	83 c2 01             	add    $0x1,%edx
  ea:	89 c3                	mov    %eax,%ebx
  ec:	83 c0 01             	add    $0x1,%eax
  ef:	0f b6 09             	movzbl (%ecx),%ecx
  f2:	88 0b                	mov    %cl,(%ebx)
  f4:	84 c9                	test   %cl,%cl
  f6:	75 ed                	jne    e5 <strcpy+0xd>
    ;
  return os;
}
  f8:	89 f0                	mov    %esi,%eax
  fa:	5b                   	pop    %ebx
  fb:	5e                   	pop    %esi
  fc:	5d                   	pop    %ebp
  fd:	c3                   	ret    

000000fe <strcmp>:

int
strcmp(const char *p, const char *q)
{
  fe:	55                   	push   %ebp
  ff:	89 e5                	mov    %esp,%ebp
 101:	8b 4d 08             	mov    0x8(%ebp),%ecx
 104:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 107:	eb 06                	jmp    10f <strcmp+0x11>
    p++, q++;
 109:	83 c1 01             	add    $0x1,%ecx
 10c:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 10f:	0f b6 01             	movzbl (%ecx),%eax
 112:	84 c0                	test   %al,%al
 114:	74 04                	je     11a <strcmp+0x1c>
 116:	3a 02                	cmp    (%edx),%al
 118:	74 ef                	je     109 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 11a:	0f b6 c0             	movzbl %al,%eax
 11d:	0f b6 12             	movzbl (%edx),%edx
 120:	29 d0                	sub    %edx,%eax
}
 122:	5d                   	pop    %ebp
 123:	c3                   	ret    

00000124 <strlen>:

uint
strlen(const char *s)
{
 124:	55                   	push   %ebp
 125:	89 e5                	mov    %esp,%ebp
 127:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 12a:	b8 00 00 00 00       	mov    $0x0,%eax
 12f:	eb 03                	jmp    134 <strlen+0x10>
 131:	83 c0 01             	add    $0x1,%eax
 134:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 138:	75 f7                	jne    131 <strlen+0xd>
    ;
  return n;
}
 13a:	5d                   	pop    %ebp
 13b:	c3                   	ret    

0000013c <memset>:

void*
memset(void *dst, int c, uint n)
{
 13c:	55                   	push   %ebp
 13d:	89 e5                	mov    %esp,%ebp
 13f:	57                   	push   %edi
 140:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 143:	89 d7                	mov    %edx,%edi
 145:	8b 4d 10             	mov    0x10(%ebp),%ecx
 148:	8b 45 0c             	mov    0xc(%ebp),%eax
 14b:	fc                   	cld    
 14c:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 14e:	89 d0                	mov    %edx,%eax
 150:	8b 7d fc             	mov    -0x4(%ebp),%edi
 153:	c9                   	leave  
 154:	c3                   	ret    

00000155 <strchr>:

char*
strchr(const char *s, char c)
{
 155:	55                   	push   %ebp
 156:	89 e5                	mov    %esp,%ebp
 158:	8b 45 08             	mov    0x8(%ebp),%eax
 15b:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 15f:	eb 03                	jmp    164 <strchr+0xf>
 161:	83 c0 01             	add    $0x1,%eax
 164:	0f b6 10             	movzbl (%eax),%edx
 167:	84 d2                	test   %dl,%dl
 169:	74 06                	je     171 <strchr+0x1c>
    if(*s == c)
 16b:	38 ca                	cmp    %cl,%dl
 16d:	75 f2                	jne    161 <strchr+0xc>
 16f:	eb 05                	jmp    176 <strchr+0x21>
      return (char*)s;
  return 0;
 171:	b8 00 00 00 00       	mov    $0x0,%eax
}
 176:	5d                   	pop    %ebp
 177:	c3                   	ret    

00000178 <gets>:

char*
gets(char *buf, int max)
{
 178:	55                   	push   %ebp
 179:	89 e5                	mov    %esp,%ebp
 17b:	57                   	push   %edi
 17c:	56                   	push   %esi
 17d:	53                   	push   %ebx
 17e:	83 ec 1c             	sub    $0x1c,%esp
 181:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 184:	bb 00 00 00 00       	mov    $0x0,%ebx
 189:	89 de                	mov    %ebx,%esi
 18b:	83 c3 01             	add    $0x1,%ebx
 18e:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 191:	7d 2e                	jge    1c1 <gets+0x49>
    cc = read(0, &c, 1);
 193:	83 ec 04             	sub    $0x4,%esp
 196:	6a 01                	push   $0x1
 198:	8d 45 e7             	lea    -0x19(%ebp),%eax
 19b:	50                   	push   %eax
 19c:	6a 00                	push   $0x0
 19e:	e8 ec 00 00 00       	call   28f <read>
    if(cc < 1)
 1a3:	83 c4 10             	add    $0x10,%esp
 1a6:	85 c0                	test   %eax,%eax
 1a8:	7e 17                	jle    1c1 <gets+0x49>
      break;
    buf[i++] = c;
 1aa:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1ae:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 1b1:	3c 0a                	cmp    $0xa,%al
 1b3:	0f 94 c2             	sete   %dl
 1b6:	3c 0d                	cmp    $0xd,%al
 1b8:	0f 94 c0             	sete   %al
 1bb:	08 c2                	or     %al,%dl
 1bd:	74 ca                	je     189 <gets+0x11>
    buf[i++] = c;
 1bf:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 1c1:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 1c5:	89 f8                	mov    %edi,%eax
 1c7:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1ca:	5b                   	pop    %ebx
 1cb:	5e                   	pop    %esi
 1cc:	5f                   	pop    %edi
 1cd:	5d                   	pop    %ebp
 1ce:	c3                   	ret    

000001cf <stat>:

int
stat(const char *n, struct stat *st)
{
 1cf:	55                   	push   %ebp
 1d0:	89 e5                	mov    %esp,%ebp
 1d2:	56                   	push   %esi
 1d3:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1d4:	83 ec 08             	sub    $0x8,%esp
 1d7:	6a 00                	push   $0x0
 1d9:	ff 75 08             	push   0x8(%ebp)
 1dc:	e8 d6 00 00 00       	call   2b7 <open>
  if(fd < 0)
 1e1:	83 c4 10             	add    $0x10,%esp
 1e4:	85 c0                	test   %eax,%eax
 1e6:	78 24                	js     20c <stat+0x3d>
 1e8:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 1ea:	83 ec 08             	sub    $0x8,%esp
 1ed:	ff 75 0c             	push   0xc(%ebp)
 1f0:	50                   	push   %eax
 1f1:	e8 d9 00 00 00       	call   2cf <fstat>
 1f6:	89 c6                	mov    %eax,%esi
  close(fd);
 1f8:	89 1c 24             	mov    %ebx,(%esp)
 1fb:	e8 9f 00 00 00       	call   29f <close>
  return r;
 200:	83 c4 10             	add    $0x10,%esp
}
 203:	89 f0                	mov    %esi,%eax
 205:	8d 65 f8             	lea    -0x8(%ebp),%esp
 208:	5b                   	pop    %ebx
 209:	5e                   	pop    %esi
 20a:	5d                   	pop    %ebp
 20b:	c3                   	ret    
    return -1;
 20c:	be ff ff ff ff       	mov    $0xffffffff,%esi
 211:	eb f0                	jmp    203 <stat+0x34>

00000213 <atoi>:

int
atoi(const char *s)
{
 213:	55                   	push   %ebp
 214:	89 e5                	mov    %esp,%ebp
 216:	53                   	push   %ebx
 217:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 21a:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 21f:	eb 10                	jmp    231 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 221:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 224:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 227:	83 c1 01             	add    $0x1,%ecx
 22a:	0f be c0             	movsbl %al,%eax
 22d:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 231:	0f b6 01             	movzbl (%ecx),%eax
 234:	8d 58 d0             	lea    -0x30(%eax),%ebx
 237:	80 fb 09             	cmp    $0x9,%bl
 23a:	76 e5                	jbe    221 <atoi+0xe>
  return n;
}
 23c:	89 d0                	mov    %edx,%eax
 23e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 241:	c9                   	leave  
 242:	c3                   	ret    

00000243 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 243:	55                   	push   %ebp
 244:	89 e5                	mov    %esp,%ebp
 246:	56                   	push   %esi
 247:	53                   	push   %ebx
 248:	8b 75 08             	mov    0x8(%ebp),%esi
 24b:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 24e:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 251:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 253:	eb 0d                	jmp    262 <memmove+0x1f>
    *dst++ = *src++;
 255:	0f b6 01             	movzbl (%ecx),%eax
 258:	88 02                	mov    %al,(%edx)
 25a:	8d 49 01             	lea    0x1(%ecx),%ecx
 25d:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 260:	89 d8                	mov    %ebx,%eax
 262:	8d 58 ff             	lea    -0x1(%eax),%ebx
 265:	85 c0                	test   %eax,%eax
 267:	7f ec                	jg     255 <memmove+0x12>
  return vdst;
}
 269:	89 f0                	mov    %esi,%eax
 26b:	5b                   	pop    %ebx
 26c:	5e                   	pop    %esi
 26d:	5d                   	pop    %ebp
 26e:	c3                   	ret    

0000026f <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 26f:	b8 01 00 00 00       	mov    $0x1,%eax
 274:	cd 40                	int    $0x40
 276:	c3                   	ret    

00000277 <exit>:
SYSCALL(exit)
 277:	b8 02 00 00 00       	mov    $0x2,%eax
 27c:	cd 40                	int    $0x40
 27e:	c3                   	ret    

0000027f <wait>:
SYSCALL(wait)
 27f:	b8 03 00 00 00       	mov    $0x3,%eax
 284:	cd 40                	int    $0x40
 286:	c3                   	ret    

00000287 <pipe>:
SYSCALL(pipe)
 287:	b8 04 00 00 00       	mov    $0x4,%eax
 28c:	cd 40                	int    $0x40
 28e:	c3                   	ret    

0000028f <read>:
SYSCALL(read)
 28f:	b8 05 00 00 00       	mov    $0x5,%eax
 294:	cd 40                	int    $0x40
 296:	c3                   	ret    

00000297 <write>:
SYSCALL(write)
 297:	b8 10 00 00 00       	mov    $0x10,%eax
 29c:	cd 40                	int    $0x40
 29e:	c3                   	ret    

0000029f <close>:
SYSCALL(close)
 29f:	b8 15 00 00 00       	mov    $0x15,%eax
 2a4:	cd 40                	int    $0x40
 2a6:	c3                   	ret    

000002a7 <kill>:
SYSCALL(kill)
 2a7:	b8 06 00 00 00       	mov    $0x6,%eax
 2ac:	cd 40                	int    $0x40
 2ae:	c3                   	ret    

000002af <exec>:
SYSCALL(exec)
 2af:	b8 07 00 00 00       	mov    $0x7,%eax
 2b4:	cd 40                	int    $0x40
 2b6:	c3                   	ret    

000002b7 <open>:
SYSCALL(open)
 2b7:	b8 0f 00 00 00       	mov    $0xf,%eax
 2bc:	cd 40                	int    $0x40
 2be:	c3                   	ret    

000002bf <mknod>:
SYSCALL(mknod)
 2bf:	b8 11 00 00 00       	mov    $0x11,%eax
 2c4:	cd 40                	int    $0x40
 2c6:	c3                   	ret    

000002c7 <unlink>:
SYSCALL(unlink)
 2c7:	b8 12 00 00 00       	mov    $0x12,%eax
 2cc:	cd 40                	int    $0x40
 2ce:	c3                   	ret    

000002cf <fstat>:
SYSCALL(fstat)
 2cf:	b8 08 00 00 00       	mov    $0x8,%eax
 2d4:	cd 40                	int    $0x40
 2d6:	c3                   	ret    

000002d7 <link>:
SYSCALL(link)
 2d7:	b8 13 00 00 00       	mov    $0x13,%eax
 2dc:	cd 40                	int    $0x40
 2de:	c3                   	ret    

000002df <mkdir>:
SYSCALL(mkdir)
 2df:	b8 14 00 00 00       	mov    $0x14,%eax
 2e4:	cd 40                	int    $0x40
 2e6:	c3                   	ret    

000002e7 <chdir>:
SYSCALL(chdir)
 2e7:	b8 09 00 00 00       	mov    $0x9,%eax
 2ec:	cd 40                	int    $0x40
 2ee:	c3                   	ret    

000002ef <dup>:
SYSCALL(dup)
 2ef:	b8 0a 00 00 00       	mov    $0xa,%eax
 2f4:	cd 40                	int    $0x40
 2f6:	c3                   	ret    

000002f7 <getpid>:
SYSCALL(getpid)
 2f7:	b8 0b 00 00 00       	mov    $0xb,%eax
 2fc:	cd 40                	int    $0x40
 2fe:	c3                   	ret    

000002ff <sbrk>:
SYSCALL(sbrk)
 2ff:	b8 0c 00 00 00       	mov    $0xc,%eax
 304:	cd 40                	int    $0x40
 306:	c3                   	ret    

00000307 <sleep>:
SYSCALL(sleep)
 307:	b8 0d 00 00 00       	mov    $0xd,%eax
 30c:	cd 40                	int    $0x40
 30e:	c3                   	ret    

0000030f <uptime>:
SYSCALL(uptime)
 30f:	b8 0e 00 00 00       	mov    $0xe,%eax
 314:	cd 40                	int    $0x40
 316:	c3                   	ret    

00000317 <clone>:
SYSCALL(clone)
 317:	b8 16 00 00 00       	mov    $0x16,%eax
 31c:	cd 40                	int    $0x40
 31e:	c3                   	ret    

0000031f <join>:
 31f:	b8 17 00 00 00       	mov    $0x17,%eax
 324:	cd 40                	int    $0x40
 326:	c3                   	ret    

00000327 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 327:	55                   	push   %ebp
 328:	89 e5                	mov    %esp,%ebp
 32a:	83 ec 1c             	sub    $0x1c,%esp
 32d:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 330:	6a 01                	push   $0x1
 332:	8d 55 f4             	lea    -0xc(%ebp),%edx
 335:	52                   	push   %edx
 336:	50                   	push   %eax
 337:	e8 5b ff ff ff       	call   297 <write>
}
 33c:	83 c4 10             	add    $0x10,%esp
 33f:	c9                   	leave  
 340:	c3                   	ret    

00000341 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 341:	55                   	push   %ebp
 342:	89 e5                	mov    %esp,%ebp
 344:	57                   	push   %edi
 345:	56                   	push   %esi
 346:	53                   	push   %ebx
 347:	83 ec 2c             	sub    $0x2c,%esp
 34a:	89 45 d0             	mov    %eax,-0x30(%ebp)
 34d:	89 d0                	mov    %edx,%eax
 34f:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 351:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 355:	0f 95 c1             	setne  %cl
 358:	c1 ea 1f             	shr    $0x1f,%edx
 35b:	84 d1                	test   %dl,%cl
 35d:	74 44                	je     3a3 <printint+0x62>
    neg = 1;
    x = -xx;
 35f:	f7 d8                	neg    %eax
 361:	89 c1                	mov    %eax,%ecx
    neg = 1;
 363:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 36a:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 36f:	89 c8                	mov    %ecx,%eax
 371:	ba 00 00 00 00       	mov    $0x0,%edx
 376:	f7 f6                	div    %esi
 378:	89 df                	mov    %ebx,%edi
 37a:	83 c3 01             	add    $0x1,%ebx
 37d:	0f b6 92 e4 06 00 00 	movzbl 0x6e4(%edx),%edx
 384:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 388:	89 ca                	mov    %ecx,%edx
 38a:	89 c1                	mov    %eax,%ecx
 38c:	39 d6                	cmp    %edx,%esi
 38e:	76 df                	jbe    36f <printint+0x2e>
  if(neg)
 390:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 394:	74 31                	je     3c7 <printint+0x86>
    buf[i++] = '-';
 396:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 39b:	8d 5f 02             	lea    0x2(%edi),%ebx
 39e:	8b 75 d0             	mov    -0x30(%ebp),%esi
 3a1:	eb 17                	jmp    3ba <printint+0x79>
    x = xx;
 3a3:	89 c1                	mov    %eax,%ecx
  neg = 0;
 3a5:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 3ac:	eb bc                	jmp    36a <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 3ae:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 3b3:	89 f0                	mov    %esi,%eax
 3b5:	e8 6d ff ff ff       	call   327 <putc>
  while(--i >= 0)
 3ba:	83 eb 01             	sub    $0x1,%ebx
 3bd:	79 ef                	jns    3ae <printint+0x6d>
}
 3bf:	83 c4 2c             	add    $0x2c,%esp
 3c2:	5b                   	pop    %ebx
 3c3:	5e                   	pop    %esi
 3c4:	5f                   	pop    %edi
 3c5:	5d                   	pop    %ebp
 3c6:	c3                   	ret    
 3c7:	8b 75 d0             	mov    -0x30(%ebp),%esi
 3ca:	eb ee                	jmp    3ba <printint+0x79>

000003cc <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 3cc:	55                   	push   %ebp
 3cd:	89 e5                	mov    %esp,%ebp
 3cf:	57                   	push   %edi
 3d0:	56                   	push   %esi
 3d1:	53                   	push   %ebx
 3d2:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 3d5:	8d 45 10             	lea    0x10(%ebp),%eax
 3d8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 3db:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 3e0:	bb 00 00 00 00       	mov    $0x0,%ebx
 3e5:	eb 14                	jmp    3fb <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 3e7:	89 fa                	mov    %edi,%edx
 3e9:	8b 45 08             	mov    0x8(%ebp),%eax
 3ec:	e8 36 ff ff ff       	call   327 <putc>
 3f1:	eb 05                	jmp    3f8 <printf+0x2c>
      }
    } else if(state == '%'){
 3f3:	83 fe 25             	cmp    $0x25,%esi
 3f6:	74 25                	je     41d <printf+0x51>
  for(i = 0; fmt[i]; i++){
 3f8:	83 c3 01             	add    $0x1,%ebx
 3fb:	8b 45 0c             	mov    0xc(%ebp),%eax
 3fe:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 402:	84 c0                	test   %al,%al
 404:	0f 84 20 01 00 00    	je     52a <printf+0x15e>
    c = fmt[i] & 0xff;
 40a:	0f be f8             	movsbl %al,%edi
 40d:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 410:	85 f6                	test   %esi,%esi
 412:	75 df                	jne    3f3 <printf+0x27>
      if(c == '%'){
 414:	83 f8 25             	cmp    $0x25,%eax
 417:	75 ce                	jne    3e7 <printf+0x1b>
        state = '%';
 419:	89 c6                	mov    %eax,%esi
 41b:	eb db                	jmp    3f8 <printf+0x2c>
      if(c == 'd'){
 41d:	83 f8 25             	cmp    $0x25,%eax
 420:	0f 84 cf 00 00 00    	je     4f5 <printf+0x129>
 426:	0f 8c dd 00 00 00    	jl     509 <printf+0x13d>
 42c:	83 f8 78             	cmp    $0x78,%eax
 42f:	0f 8f d4 00 00 00    	jg     509 <printf+0x13d>
 435:	83 f8 63             	cmp    $0x63,%eax
 438:	0f 8c cb 00 00 00    	jl     509 <printf+0x13d>
 43e:	83 e8 63             	sub    $0x63,%eax
 441:	83 f8 15             	cmp    $0x15,%eax
 444:	0f 87 bf 00 00 00    	ja     509 <printf+0x13d>
 44a:	ff 24 85 8c 06 00 00 	jmp    *0x68c(,%eax,4)
        printint(fd, *ap, 10, 1);
 451:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 454:	8b 17                	mov    (%edi),%edx
 456:	83 ec 0c             	sub    $0xc,%esp
 459:	6a 01                	push   $0x1
 45b:	b9 0a 00 00 00       	mov    $0xa,%ecx
 460:	8b 45 08             	mov    0x8(%ebp),%eax
 463:	e8 d9 fe ff ff       	call   341 <printint>
        ap++;
 468:	83 c7 04             	add    $0x4,%edi
 46b:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 46e:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 471:	be 00 00 00 00       	mov    $0x0,%esi
 476:	eb 80                	jmp    3f8 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 478:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 47b:	8b 17                	mov    (%edi),%edx
 47d:	83 ec 0c             	sub    $0xc,%esp
 480:	6a 00                	push   $0x0
 482:	b9 10 00 00 00       	mov    $0x10,%ecx
 487:	8b 45 08             	mov    0x8(%ebp),%eax
 48a:	e8 b2 fe ff ff       	call   341 <printint>
        ap++;
 48f:	83 c7 04             	add    $0x4,%edi
 492:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 495:	83 c4 10             	add    $0x10,%esp
      state = 0;
 498:	be 00 00 00 00       	mov    $0x0,%esi
 49d:	e9 56 ff ff ff       	jmp    3f8 <printf+0x2c>
        s = (char*)*ap;
 4a2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 4a5:	8b 30                	mov    (%eax),%esi
        ap++;
 4a7:	83 c0 04             	add    $0x4,%eax
 4aa:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 4ad:	85 f6                	test   %esi,%esi
 4af:	75 15                	jne    4c6 <printf+0xfa>
          s = "(null)";
 4b1:	be 85 06 00 00       	mov    $0x685,%esi
 4b6:	eb 0e                	jmp    4c6 <printf+0xfa>
          putc(fd, *s);
 4b8:	0f be d2             	movsbl %dl,%edx
 4bb:	8b 45 08             	mov    0x8(%ebp),%eax
 4be:	e8 64 fe ff ff       	call   327 <putc>
          s++;
 4c3:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 4c6:	0f b6 16             	movzbl (%esi),%edx
 4c9:	84 d2                	test   %dl,%dl
 4cb:	75 eb                	jne    4b8 <printf+0xec>
      state = 0;
 4cd:	be 00 00 00 00       	mov    $0x0,%esi
 4d2:	e9 21 ff ff ff       	jmp    3f8 <printf+0x2c>
        putc(fd, *ap);
 4d7:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4da:	0f be 17             	movsbl (%edi),%edx
 4dd:	8b 45 08             	mov    0x8(%ebp),%eax
 4e0:	e8 42 fe ff ff       	call   327 <putc>
        ap++;
 4e5:	83 c7 04             	add    $0x4,%edi
 4e8:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 4eb:	be 00 00 00 00       	mov    $0x0,%esi
 4f0:	e9 03 ff ff ff       	jmp    3f8 <printf+0x2c>
        putc(fd, c);
 4f5:	89 fa                	mov    %edi,%edx
 4f7:	8b 45 08             	mov    0x8(%ebp),%eax
 4fa:	e8 28 fe ff ff       	call   327 <putc>
      state = 0;
 4ff:	be 00 00 00 00       	mov    $0x0,%esi
 504:	e9 ef fe ff ff       	jmp    3f8 <printf+0x2c>
        putc(fd, '%');
 509:	ba 25 00 00 00       	mov    $0x25,%edx
 50e:	8b 45 08             	mov    0x8(%ebp),%eax
 511:	e8 11 fe ff ff       	call   327 <putc>
        putc(fd, c);
 516:	89 fa                	mov    %edi,%edx
 518:	8b 45 08             	mov    0x8(%ebp),%eax
 51b:	e8 07 fe ff ff       	call   327 <putc>
      state = 0;
 520:	be 00 00 00 00       	mov    $0x0,%esi
 525:	e9 ce fe ff ff       	jmp    3f8 <printf+0x2c>
    }
  }
}
 52a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 52d:	5b                   	pop    %ebx
 52e:	5e                   	pop    %esi
 52f:	5f                   	pop    %edi
 530:	5d                   	pop    %ebp
 531:	c3                   	ret    

00000532 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 532:	55                   	push   %ebp
 533:	89 e5                	mov    %esp,%ebp
 535:	57                   	push   %edi
 536:	56                   	push   %esi
 537:	53                   	push   %ebx
 538:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 53b:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 53e:	a1 4c 0a 00 00       	mov    0xa4c,%eax
 543:	eb 02                	jmp    547 <free+0x15>
 545:	89 d0                	mov    %edx,%eax
 547:	39 c8                	cmp    %ecx,%eax
 549:	73 04                	jae    54f <free+0x1d>
 54b:	39 08                	cmp    %ecx,(%eax)
 54d:	77 12                	ja     561 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 54f:	8b 10                	mov    (%eax),%edx
 551:	39 c2                	cmp    %eax,%edx
 553:	77 f0                	ja     545 <free+0x13>
 555:	39 c8                	cmp    %ecx,%eax
 557:	72 08                	jb     561 <free+0x2f>
 559:	39 ca                	cmp    %ecx,%edx
 55b:	77 04                	ja     561 <free+0x2f>
 55d:	89 d0                	mov    %edx,%eax
 55f:	eb e6                	jmp    547 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 561:	8b 73 fc             	mov    -0x4(%ebx),%esi
 564:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 567:	8b 10                	mov    (%eax),%edx
 569:	39 d7                	cmp    %edx,%edi
 56b:	74 19                	je     586 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 56d:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 570:	8b 50 04             	mov    0x4(%eax),%edx
 573:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 576:	39 ce                	cmp    %ecx,%esi
 578:	74 1b                	je     595 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 57a:	89 08                	mov    %ecx,(%eax)
  freep = p;
 57c:	a3 4c 0a 00 00       	mov    %eax,0xa4c
}
 581:	5b                   	pop    %ebx
 582:	5e                   	pop    %esi
 583:	5f                   	pop    %edi
 584:	5d                   	pop    %ebp
 585:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 586:	03 72 04             	add    0x4(%edx),%esi
 589:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 58c:	8b 10                	mov    (%eax),%edx
 58e:	8b 12                	mov    (%edx),%edx
 590:	89 53 f8             	mov    %edx,-0x8(%ebx)
 593:	eb db                	jmp    570 <free+0x3e>
    p->s.size += bp->s.size;
 595:	03 53 fc             	add    -0x4(%ebx),%edx
 598:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 59b:	8b 53 f8             	mov    -0x8(%ebx),%edx
 59e:	89 10                	mov    %edx,(%eax)
 5a0:	eb da                	jmp    57c <free+0x4a>

000005a2 <morecore>:

static Header*
morecore(uint nu)
{
 5a2:	55                   	push   %ebp
 5a3:	89 e5                	mov    %esp,%ebp
 5a5:	53                   	push   %ebx
 5a6:	83 ec 04             	sub    $0x4,%esp
 5a9:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 5ab:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 5b0:	77 05                	ja     5b7 <morecore+0x15>
    nu = 4096;
 5b2:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 5b7:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 5be:	83 ec 0c             	sub    $0xc,%esp
 5c1:	50                   	push   %eax
 5c2:	e8 38 fd ff ff       	call   2ff <sbrk>
  if(p == (char*)-1)
 5c7:	83 c4 10             	add    $0x10,%esp
 5ca:	83 f8 ff             	cmp    $0xffffffff,%eax
 5cd:	74 1c                	je     5eb <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 5cf:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 5d2:	83 c0 08             	add    $0x8,%eax
 5d5:	83 ec 0c             	sub    $0xc,%esp
 5d8:	50                   	push   %eax
 5d9:	e8 54 ff ff ff       	call   532 <free>
  return freep;
 5de:	a1 4c 0a 00 00       	mov    0xa4c,%eax
 5e3:	83 c4 10             	add    $0x10,%esp
}
 5e6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5e9:	c9                   	leave  
 5ea:	c3                   	ret    
    return 0;
 5eb:	b8 00 00 00 00       	mov    $0x0,%eax
 5f0:	eb f4                	jmp    5e6 <morecore+0x44>

000005f2 <malloc>:

void*
malloc(uint nbytes)
{
 5f2:	55                   	push   %ebp
 5f3:	89 e5                	mov    %esp,%ebp
 5f5:	53                   	push   %ebx
 5f6:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 5f9:	8b 45 08             	mov    0x8(%ebp),%eax
 5fc:	8d 58 07             	lea    0x7(%eax),%ebx
 5ff:	c1 eb 03             	shr    $0x3,%ebx
 602:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 605:	8b 0d 4c 0a 00 00    	mov    0xa4c,%ecx
 60b:	85 c9                	test   %ecx,%ecx
 60d:	74 04                	je     613 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 60f:	8b 01                	mov    (%ecx),%eax
 611:	eb 4a                	jmp    65d <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 613:	c7 05 4c 0a 00 00 50 	movl   $0xa50,0xa4c
 61a:	0a 00 00 
 61d:	c7 05 50 0a 00 00 50 	movl   $0xa50,0xa50
 624:	0a 00 00 
    base.s.size = 0;
 627:	c7 05 54 0a 00 00 00 	movl   $0x0,0xa54
 62e:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 631:	b9 50 0a 00 00       	mov    $0xa50,%ecx
 636:	eb d7                	jmp    60f <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 638:	74 19                	je     653 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 63a:	29 da                	sub    %ebx,%edx
 63c:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 63f:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 642:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 645:	89 0d 4c 0a 00 00    	mov    %ecx,0xa4c
      return (void*)(p + 1);
 64b:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 64e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 651:	c9                   	leave  
 652:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 653:	8b 10                	mov    (%eax),%edx
 655:	89 11                	mov    %edx,(%ecx)
 657:	eb ec                	jmp    645 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 659:	89 c1                	mov    %eax,%ecx
 65b:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 65d:	8b 50 04             	mov    0x4(%eax),%edx
 660:	39 da                	cmp    %ebx,%edx
 662:	73 d4                	jae    638 <malloc+0x46>
    if(p == freep)
 664:	39 05 4c 0a 00 00    	cmp    %eax,0xa4c
 66a:	75 ed                	jne    659 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 66c:	89 d8                	mov    %ebx,%eax
 66e:	e8 2f ff ff ff       	call   5a2 <morecore>
 673:	85 c0                	test   %eax,%eax
 675:	75 e2                	jne    659 <malloc+0x67>
 677:	eb d5                	jmp    64e <malloc+0x5c>
