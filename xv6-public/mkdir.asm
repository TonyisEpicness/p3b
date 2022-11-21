
_mkdir:     file format elf32-i386


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
    printf(2, "Usage: mkdir files...\n");
    exit();
  }

  for(i = 1; i < argc; i++){
  21:	bb 01 00 00 00       	mov    $0x1,%ebx
  26:	eb 17                	jmp    3f <main+0x3f>
    printf(2, "Usage: mkdir files...\n");
  28:	83 ec 08             	sub    $0x8,%esp
  2b:	68 a8 06 00 00       	push   $0x6a8
  30:	6a 02                	push   $0x2
  32:	e8 c2 03 00 00       	call   3f9 <printf>
    exit();
  37:	e8 68 02 00 00       	call   2a4 <exit>
  for(i = 1; i < argc; i++){
  3c:	83 c3 01             	add    $0x1,%ebx
  3f:	39 fb                	cmp    %edi,%ebx
  41:	7d 2b                	jge    6e <main+0x6e>
    if(mkdir(argv[i]) < 0){
  43:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  46:	8d 34 98             	lea    (%eax,%ebx,4),%esi
  49:	83 ec 0c             	sub    $0xc,%esp
  4c:	ff 36                	push   (%esi)
  4e:	e8 b9 02 00 00       	call   30c <mkdir>
  53:	83 c4 10             	add    $0x10,%esp
  56:	85 c0                	test   %eax,%eax
  58:	79 e2                	jns    3c <main+0x3c>
      printf(2, "mkdir: %s failed to create\n", argv[i]);
  5a:	83 ec 04             	sub    $0x4,%esp
  5d:	ff 36                	push   (%esi)
  5f:	68 bf 06 00 00       	push   $0x6bf
  64:	6a 02                	push   $0x2
  66:	e8 8e 03 00 00       	call   3f9 <printf>
      break;
  6b:	83 c4 10             	add    $0x10,%esp
    }
  }

  exit();
  6e:	e8 31 02 00 00       	call   2a4 <exit>

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

// a wrapper func for clone
int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
  84:	55                   	push   %ebp
  85:	89 e5                	mov    %esp,%ebp
  87:	83 ec 14             	sub    $0x14,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE*2);
  8a:	68 00 20 00 00       	push   $0x2000
  8f:	e8 8b 05 00 00       	call   61f <malloc>
  if(n_stack == 0){
  94:	83 c4 10             	add    $0x10,%esp
  97:	85 c0                	test   %eax,%eax
  99:	74 14                	je     af <thread_create+0x2b>
    return -1;
  }
  int new_pid = clone(start_routine, arg1, arg2, n_stack); // TODO: is this the right way to call it?
  9b:	50                   	push   %eax
  9c:	ff 75 10             	push   0x10(%ebp)
  9f:	ff 75 0c             	push   0xc(%ebp)
  a2:	ff 75 08             	push   0x8(%ebp)
  a5:	e8 9a 02 00 00       	call   344 <clone>


  // I can't remember if there was something else to do here but I'm sure I'll find out


  return new_pid;
  aa:	83 c4 10             	add    $0x10,%esp
}
  ad:	c9                   	leave  
  ae:	c3                   	ret    
    return -1;
  af:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  b4:	eb f7                	jmp    ad <thread_create+0x29>

000000b6 <thread_join>:

int thread_join() {
  b6:	55                   	push   %ebp
  b7:	89 e5                	mov    %esp,%ebp
  b9:	83 ec 24             	sub    $0x24,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
  bc:	8d 45 f4             	lea    -0xc(%ebp),%eax
  bf:	50                   	push   %eax
  c0:	e8 87 02 00 00       	call   34c <join>
  
  return pid;
}
  c5:	c9                   	leave  
  c6:	c3                   	ret    

000000c7 <lock_acquire>:

void lock_acquire(lock_t *lock){
  c7:	55                   	push   %ebp
  c8:	89 e5                	mov    %esp,%ebp
  ca:	53                   	push   %ebx
  cb:	83 ec 04             	sub    $0x4,%esp
  ce:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
  d1:	83 ec 08             	sub    $0x8,%esp
  d4:	6a 01                	push   $0x1
  d6:	53                   	push   %ebx
  d7:	e8 97 ff ff ff       	call   73 <test_and_set>
  dc:	83 c4 10             	add    $0x10,%esp
  df:	83 f8 01             	cmp    $0x1,%eax
  e2:	74 ed                	je     d1 <lock_acquire+0xa>
    ;
}
  e4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  e7:	c9                   	leave  
  e8:	c3                   	ret    

000000e9 <lock_release>:

void lock_release(lock_t *lock) {
  e9:	55                   	push   %ebp
  ea:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
  ec:	8b 45 08             	mov    0x8(%ebp),%eax
  ef:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
  f5:	5d                   	pop    %ebp
  f6:	c3                   	ret    

000000f7 <lock_init>:

void lock_init(lock_t *lock) {
  f7:	55                   	push   %ebp
  f8:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
  fa:	8b 45 08             	mov    0x8(%ebp),%eax
  fd:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 103:	5d                   	pop    %ebp
 104:	c3                   	ret    

00000105 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 105:	55                   	push   %ebp
 106:	89 e5                	mov    %esp,%ebp
 108:	56                   	push   %esi
 109:	53                   	push   %ebx
 10a:	8b 75 08             	mov    0x8(%ebp),%esi
 10d:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 110:	89 f0                	mov    %esi,%eax
 112:	89 d1                	mov    %edx,%ecx
 114:	83 c2 01             	add    $0x1,%edx
 117:	89 c3                	mov    %eax,%ebx
 119:	83 c0 01             	add    $0x1,%eax
 11c:	0f b6 09             	movzbl (%ecx),%ecx
 11f:	88 0b                	mov    %cl,(%ebx)
 121:	84 c9                	test   %cl,%cl
 123:	75 ed                	jne    112 <strcpy+0xd>
    ;
  return os;
}
 125:	89 f0                	mov    %esi,%eax
 127:	5b                   	pop    %ebx
 128:	5e                   	pop    %esi
 129:	5d                   	pop    %ebp
 12a:	c3                   	ret    

0000012b <strcmp>:

int
strcmp(const char *p, const char *q)
{
 12b:	55                   	push   %ebp
 12c:	89 e5                	mov    %esp,%ebp
 12e:	8b 4d 08             	mov    0x8(%ebp),%ecx
 131:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 134:	eb 06                	jmp    13c <strcmp+0x11>
    p++, q++;
 136:	83 c1 01             	add    $0x1,%ecx
 139:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 13c:	0f b6 01             	movzbl (%ecx),%eax
 13f:	84 c0                	test   %al,%al
 141:	74 04                	je     147 <strcmp+0x1c>
 143:	3a 02                	cmp    (%edx),%al
 145:	74 ef                	je     136 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 147:	0f b6 c0             	movzbl %al,%eax
 14a:	0f b6 12             	movzbl (%edx),%edx
 14d:	29 d0                	sub    %edx,%eax
}
 14f:	5d                   	pop    %ebp
 150:	c3                   	ret    

00000151 <strlen>:

uint
strlen(const char *s)
{
 151:	55                   	push   %ebp
 152:	89 e5                	mov    %esp,%ebp
 154:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 157:	b8 00 00 00 00       	mov    $0x0,%eax
 15c:	eb 03                	jmp    161 <strlen+0x10>
 15e:	83 c0 01             	add    $0x1,%eax
 161:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 165:	75 f7                	jne    15e <strlen+0xd>
    ;
  return n;
}
 167:	5d                   	pop    %ebp
 168:	c3                   	ret    

00000169 <memset>:

void*
memset(void *dst, int c, uint n)
{
 169:	55                   	push   %ebp
 16a:	89 e5                	mov    %esp,%ebp
 16c:	57                   	push   %edi
 16d:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 170:	89 d7                	mov    %edx,%edi
 172:	8b 4d 10             	mov    0x10(%ebp),%ecx
 175:	8b 45 0c             	mov    0xc(%ebp),%eax
 178:	fc                   	cld    
 179:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 17b:	89 d0                	mov    %edx,%eax
 17d:	8b 7d fc             	mov    -0x4(%ebp),%edi
 180:	c9                   	leave  
 181:	c3                   	ret    

00000182 <strchr>:

char*
strchr(const char *s, char c)
{
 182:	55                   	push   %ebp
 183:	89 e5                	mov    %esp,%ebp
 185:	8b 45 08             	mov    0x8(%ebp),%eax
 188:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 18c:	eb 03                	jmp    191 <strchr+0xf>
 18e:	83 c0 01             	add    $0x1,%eax
 191:	0f b6 10             	movzbl (%eax),%edx
 194:	84 d2                	test   %dl,%dl
 196:	74 06                	je     19e <strchr+0x1c>
    if(*s == c)
 198:	38 ca                	cmp    %cl,%dl
 19a:	75 f2                	jne    18e <strchr+0xc>
 19c:	eb 05                	jmp    1a3 <strchr+0x21>
      return (char*)s;
  return 0;
 19e:	b8 00 00 00 00       	mov    $0x0,%eax
}
 1a3:	5d                   	pop    %ebp
 1a4:	c3                   	ret    

000001a5 <gets>:

char*
gets(char *buf, int max)
{
 1a5:	55                   	push   %ebp
 1a6:	89 e5                	mov    %esp,%ebp
 1a8:	57                   	push   %edi
 1a9:	56                   	push   %esi
 1aa:	53                   	push   %ebx
 1ab:	83 ec 1c             	sub    $0x1c,%esp
 1ae:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1b1:	bb 00 00 00 00       	mov    $0x0,%ebx
 1b6:	89 de                	mov    %ebx,%esi
 1b8:	83 c3 01             	add    $0x1,%ebx
 1bb:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1be:	7d 2e                	jge    1ee <gets+0x49>
    cc = read(0, &c, 1);
 1c0:	83 ec 04             	sub    $0x4,%esp
 1c3:	6a 01                	push   $0x1
 1c5:	8d 45 e7             	lea    -0x19(%ebp),%eax
 1c8:	50                   	push   %eax
 1c9:	6a 00                	push   $0x0
 1cb:	e8 ec 00 00 00       	call   2bc <read>
    if(cc < 1)
 1d0:	83 c4 10             	add    $0x10,%esp
 1d3:	85 c0                	test   %eax,%eax
 1d5:	7e 17                	jle    1ee <gets+0x49>
      break;
    buf[i++] = c;
 1d7:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1db:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 1de:	3c 0a                	cmp    $0xa,%al
 1e0:	0f 94 c2             	sete   %dl
 1e3:	3c 0d                	cmp    $0xd,%al
 1e5:	0f 94 c0             	sete   %al
 1e8:	08 c2                	or     %al,%dl
 1ea:	74 ca                	je     1b6 <gets+0x11>
    buf[i++] = c;
 1ec:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 1ee:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 1f2:	89 f8                	mov    %edi,%eax
 1f4:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1f7:	5b                   	pop    %ebx
 1f8:	5e                   	pop    %esi
 1f9:	5f                   	pop    %edi
 1fa:	5d                   	pop    %ebp
 1fb:	c3                   	ret    

000001fc <stat>:

int
stat(const char *n, struct stat *st)
{
 1fc:	55                   	push   %ebp
 1fd:	89 e5                	mov    %esp,%ebp
 1ff:	56                   	push   %esi
 200:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 201:	83 ec 08             	sub    $0x8,%esp
 204:	6a 00                	push   $0x0
 206:	ff 75 08             	push   0x8(%ebp)
 209:	e8 d6 00 00 00       	call   2e4 <open>
  if(fd < 0)
 20e:	83 c4 10             	add    $0x10,%esp
 211:	85 c0                	test   %eax,%eax
 213:	78 24                	js     239 <stat+0x3d>
 215:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 217:	83 ec 08             	sub    $0x8,%esp
 21a:	ff 75 0c             	push   0xc(%ebp)
 21d:	50                   	push   %eax
 21e:	e8 d9 00 00 00       	call   2fc <fstat>
 223:	89 c6                	mov    %eax,%esi
  close(fd);
 225:	89 1c 24             	mov    %ebx,(%esp)
 228:	e8 9f 00 00 00       	call   2cc <close>
  return r;
 22d:	83 c4 10             	add    $0x10,%esp
}
 230:	89 f0                	mov    %esi,%eax
 232:	8d 65 f8             	lea    -0x8(%ebp),%esp
 235:	5b                   	pop    %ebx
 236:	5e                   	pop    %esi
 237:	5d                   	pop    %ebp
 238:	c3                   	ret    
    return -1;
 239:	be ff ff ff ff       	mov    $0xffffffff,%esi
 23e:	eb f0                	jmp    230 <stat+0x34>

00000240 <atoi>:

int
atoi(const char *s)
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	53                   	push   %ebx
 244:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 247:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 24c:	eb 10                	jmp    25e <atoi+0x1e>
    n = n*10 + *s++ - '0';
 24e:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 251:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 254:	83 c1 01             	add    $0x1,%ecx
 257:	0f be c0             	movsbl %al,%eax
 25a:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 25e:	0f b6 01             	movzbl (%ecx),%eax
 261:	8d 58 d0             	lea    -0x30(%eax),%ebx
 264:	80 fb 09             	cmp    $0x9,%bl
 267:	76 e5                	jbe    24e <atoi+0xe>
  return n;
}
 269:	89 d0                	mov    %edx,%eax
 26b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 26e:	c9                   	leave  
 26f:	c3                   	ret    

00000270 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	56                   	push   %esi
 274:	53                   	push   %ebx
 275:	8b 75 08             	mov    0x8(%ebp),%esi
 278:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 27b:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 27e:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 280:	eb 0d                	jmp    28f <memmove+0x1f>
    *dst++ = *src++;
 282:	0f b6 01             	movzbl (%ecx),%eax
 285:	88 02                	mov    %al,(%edx)
 287:	8d 49 01             	lea    0x1(%ecx),%ecx
 28a:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 28d:	89 d8                	mov    %ebx,%eax
 28f:	8d 58 ff             	lea    -0x1(%eax),%ebx
 292:	85 c0                	test   %eax,%eax
 294:	7f ec                	jg     282 <memmove+0x12>
  return vdst;
}
 296:	89 f0                	mov    %esi,%eax
 298:	5b                   	pop    %ebx
 299:	5e                   	pop    %esi
 29a:	5d                   	pop    %ebp
 29b:	c3                   	ret    

0000029c <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 29c:	b8 01 00 00 00       	mov    $0x1,%eax
 2a1:	cd 40                	int    $0x40
 2a3:	c3                   	ret    

000002a4 <exit>:
SYSCALL(exit)
 2a4:	b8 02 00 00 00       	mov    $0x2,%eax
 2a9:	cd 40                	int    $0x40
 2ab:	c3                   	ret    

000002ac <wait>:
SYSCALL(wait)
 2ac:	b8 03 00 00 00       	mov    $0x3,%eax
 2b1:	cd 40                	int    $0x40
 2b3:	c3                   	ret    

000002b4 <pipe>:
SYSCALL(pipe)
 2b4:	b8 04 00 00 00       	mov    $0x4,%eax
 2b9:	cd 40                	int    $0x40
 2bb:	c3                   	ret    

000002bc <read>:
SYSCALL(read)
 2bc:	b8 05 00 00 00       	mov    $0x5,%eax
 2c1:	cd 40                	int    $0x40
 2c3:	c3                   	ret    

000002c4 <write>:
SYSCALL(write)
 2c4:	b8 10 00 00 00       	mov    $0x10,%eax
 2c9:	cd 40                	int    $0x40
 2cb:	c3                   	ret    

000002cc <close>:
SYSCALL(close)
 2cc:	b8 15 00 00 00       	mov    $0x15,%eax
 2d1:	cd 40                	int    $0x40
 2d3:	c3                   	ret    

000002d4 <kill>:
SYSCALL(kill)
 2d4:	b8 06 00 00 00       	mov    $0x6,%eax
 2d9:	cd 40                	int    $0x40
 2db:	c3                   	ret    

000002dc <exec>:
SYSCALL(exec)
 2dc:	b8 07 00 00 00       	mov    $0x7,%eax
 2e1:	cd 40                	int    $0x40
 2e3:	c3                   	ret    

000002e4 <open>:
SYSCALL(open)
 2e4:	b8 0f 00 00 00       	mov    $0xf,%eax
 2e9:	cd 40                	int    $0x40
 2eb:	c3                   	ret    

000002ec <mknod>:
SYSCALL(mknod)
 2ec:	b8 11 00 00 00       	mov    $0x11,%eax
 2f1:	cd 40                	int    $0x40
 2f3:	c3                   	ret    

000002f4 <unlink>:
SYSCALL(unlink)
 2f4:	b8 12 00 00 00       	mov    $0x12,%eax
 2f9:	cd 40                	int    $0x40
 2fb:	c3                   	ret    

000002fc <fstat>:
SYSCALL(fstat)
 2fc:	b8 08 00 00 00       	mov    $0x8,%eax
 301:	cd 40                	int    $0x40
 303:	c3                   	ret    

00000304 <link>:
SYSCALL(link)
 304:	b8 13 00 00 00       	mov    $0x13,%eax
 309:	cd 40                	int    $0x40
 30b:	c3                   	ret    

0000030c <mkdir>:
SYSCALL(mkdir)
 30c:	b8 14 00 00 00       	mov    $0x14,%eax
 311:	cd 40                	int    $0x40
 313:	c3                   	ret    

00000314 <chdir>:
SYSCALL(chdir)
 314:	b8 09 00 00 00       	mov    $0x9,%eax
 319:	cd 40                	int    $0x40
 31b:	c3                   	ret    

0000031c <dup>:
SYSCALL(dup)
 31c:	b8 0a 00 00 00       	mov    $0xa,%eax
 321:	cd 40                	int    $0x40
 323:	c3                   	ret    

00000324 <getpid>:
SYSCALL(getpid)
 324:	b8 0b 00 00 00       	mov    $0xb,%eax
 329:	cd 40                	int    $0x40
 32b:	c3                   	ret    

0000032c <sbrk>:
SYSCALL(sbrk)
 32c:	b8 0c 00 00 00       	mov    $0xc,%eax
 331:	cd 40                	int    $0x40
 333:	c3                   	ret    

00000334 <sleep>:
SYSCALL(sleep)
 334:	b8 0d 00 00 00       	mov    $0xd,%eax
 339:	cd 40                	int    $0x40
 33b:	c3                   	ret    

0000033c <uptime>:
SYSCALL(uptime)
 33c:	b8 0e 00 00 00       	mov    $0xe,%eax
 341:	cd 40                	int    $0x40
 343:	c3                   	ret    

00000344 <clone>:
SYSCALL(clone)
 344:	b8 16 00 00 00       	mov    $0x16,%eax
 349:	cd 40                	int    $0x40
 34b:	c3                   	ret    

0000034c <join>:
 34c:	b8 17 00 00 00       	mov    $0x17,%eax
 351:	cd 40                	int    $0x40
 353:	c3                   	ret    

00000354 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 354:	55                   	push   %ebp
 355:	89 e5                	mov    %esp,%ebp
 357:	83 ec 1c             	sub    $0x1c,%esp
 35a:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 35d:	6a 01                	push   $0x1
 35f:	8d 55 f4             	lea    -0xc(%ebp),%edx
 362:	52                   	push   %edx
 363:	50                   	push   %eax
 364:	e8 5b ff ff ff       	call   2c4 <write>
}
 369:	83 c4 10             	add    $0x10,%esp
 36c:	c9                   	leave  
 36d:	c3                   	ret    

0000036e <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 36e:	55                   	push   %ebp
 36f:	89 e5                	mov    %esp,%ebp
 371:	57                   	push   %edi
 372:	56                   	push   %esi
 373:	53                   	push   %ebx
 374:	83 ec 2c             	sub    $0x2c,%esp
 377:	89 45 d0             	mov    %eax,-0x30(%ebp)
 37a:	89 d0                	mov    %edx,%eax
 37c:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 37e:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 382:	0f 95 c1             	setne  %cl
 385:	c1 ea 1f             	shr    $0x1f,%edx
 388:	84 d1                	test   %dl,%cl
 38a:	74 44                	je     3d0 <printint+0x62>
    neg = 1;
    x = -xx;
 38c:	f7 d8                	neg    %eax
 38e:	89 c1                	mov    %eax,%ecx
    neg = 1;
 390:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 397:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 39c:	89 c8                	mov    %ecx,%eax
 39e:	ba 00 00 00 00       	mov    $0x0,%edx
 3a3:	f7 f6                	div    %esi
 3a5:	89 df                	mov    %ebx,%edi
 3a7:	83 c3 01             	add    $0x1,%ebx
 3aa:	0f b6 92 3c 07 00 00 	movzbl 0x73c(%edx),%edx
 3b1:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 3b5:	89 ca                	mov    %ecx,%edx
 3b7:	89 c1                	mov    %eax,%ecx
 3b9:	39 d6                	cmp    %edx,%esi
 3bb:	76 df                	jbe    39c <printint+0x2e>
  if(neg)
 3bd:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 3c1:	74 31                	je     3f4 <printint+0x86>
    buf[i++] = '-';
 3c3:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 3c8:	8d 5f 02             	lea    0x2(%edi),%ebx
 3cb:	8b 75 d0             	mov    -0x30(%ebp),%esi
 3ce:	eb 17                	jmp    3e7 <printint+0x79>
    x = xx;
 3d0:	89 c1                	mov    %eax,%ecx
  neg = 0;
 3d2:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 3d9:	eb bc                	jmp    397 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 3db:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 3e0:	89 f0                	mov    %esi,%eax
 3e2:	e8 6d ff ff ff       	call   354 <putc>
  while(--i >= 0)
 3e7:	83 eb 01             	sub    $0x1,%ebx
 3ea:	79 ef                	jns    3db <printint+0x6d>
}
 3ec:	83 c4 2c             	add    $0x2c,%esp
 3ef:	5b                   	pop    %ebx
 3f0:	5e                   	pop    %esi
 3f1:	5f                   	pop    %edi
 3f2:	5d                   	pop    %ebp
 3f3:	c3                   	ret    
 3f4:	8b 75 d0             	mov    -0x30(%ebp),%esi
 3f7:	eb ee                	jmp    3e7 <printint+0x79>

000003f9 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 3f9:	55                   	push   %ebp
 3fa:	89 e5                	mov    %esp,%ebp
 3fc:	57                   	push   %edi
 3fd:	56                   	push   %esi
 3fe:	53                   	push   %ebx
 3ff:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 402:	8d 45 10             	lea    0x10(%ebp),%eax
 405:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 408:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 40d:	bb 00 00 00 00       	mov    $0x0,%ebx
 412:	eb 14                	jmp    428 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 414:	89 fa                	mov    %edi,%edx
 416:	8b 45 08             	mov    0x8(%ebp),%eax
 419:	e8 36 ff ff ff       	call   354 <putc>
 41e:	eb 05                	jmp    425 <printf+0x2c>
      }
    } else if(state == '%'){
 420:	83 fe 25             	cmp    $0x25,%esi
 423:	74 25                	je     44a <printf+0x51>
  for(i = 0; fmt[i]; i++){
 425:	83 c3 01             	add    $0x1,%ebx
 428:	8b 45 0c             	mov    0xc(%ebp),%eax
 42b:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 42f:	84 c0                	test   %al,%al
 431:	0f 84 20 01 00 00    	je     557 <printf+0x15e>
    c = fmt[i] & 0xff;
 437:	0f be f8             	movsbl %al,%edi
 43a:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 43d:	85 f6                	test   %esi,%esi
 43f:	75 df                	jne    420 <printf+0x27>
      if(c == '%'){
 441:	83 f8 25             	cmp    $0x25,%eax
 444:	75 ce                	jne    414 <printf+0x1b>
        state = '%';
 446:	89 c6                	mov    %eax,%esi
 448:	eb db                	jmp    425 <printf+0x2c>
      if(c == 'd'){
 44a:	83 f8 25             	cmp    $0x25,%eax
 44d:	0f 84 cf 00 00 00    	je     522 <printf+0x129>
 453:	0f 8c dd 00 00 00    	jl     536 <printf+0x13d>
 459:	83 f8 78             	cmp    $0x78,%eax
 45c:	0f 8f d4 00 00 00    	jg     536 <printf+0x13d>
 462:	83 f8 63             	cmp    $0x63,%eax
 465:	0f 8c cb 00 00 00    	jl     536 <printf+0x13d>
 46b:	83 e8 63             	sub    $0x63,%eax
 46e:	83 f8 15             	cmp    $0x15,%eax
 471:	0f 87 bf 00 00 00    	ja     536 <printf+0x13d>
 477:	ff 24 85 e4 06 00 00 	jmp    *0x6e4(,%eax,4)
        printint(fd, *ap, 10, 1);
 47e:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 481:	8b 17                	mov    (%edi),%edx
 483:	83 ec 0c             	sub    $0xc,%esp
 486:	6a 01                	push   $0x1
 488:	b9 0a 00 00 00       	mov    $0xa,%ecx
 48d:	8b 45 08             	mov    0x8(%ebp),%eax
 490:	e8 d9 fe ff ff       	call   36e <printint>
        ap++;
 495:	83 c7 04             	add    $0x4,%edi
 498:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 49b:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 49e:	be 00 00 00 00       	mov    $0x0,%esi
 4a3:	eb 80                	jmp    425 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 4a5:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4a8:	8b 17                	mov    (%edi),%edx
 4aa:	83 ec 0c             	sub    $0xc,%esp
 4ad:	6a 00                	push   $0x0
 4af:	b9 10 00 00 00       	mov    $0x10,%ecx
 4b4:	8b 45 08             	mov    0x8(%ebp),%eax
 4b7:	e8 b2 fe ff ff       	call   36e <printint>
        ap++;
 4bc:	83 c7 04             	add    $0x4,%edi
 4bf:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 4c2:	83 c4 10             	add    $0x10,%esp
      state = 0;
 4c5:	be 00 00 00 00       	mov    $0x0,%esi
 4ca:	e9 56 ff ff ff       	jmp    425 <printf+0x2c>
        s = (char*)*ap;
 4cf:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 4d2:	8b 30                	mov    (%eax),%esi
        ap++;
 4d4:	83 c0 04             	add    $0x4,%eax
 4d7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 4da:	85 f6                	test   %esi,%esi
 4dc:	75 15                	jne    4f3 <printf+0xfa>
          s = "(null)";
 4de:	be db 06 00 00       	mov    $0x6db,%esi
 4e3:	eb 0e                	jmp    4f3 <printf+0xfa>
          putc(fd, *s);
 4e5:	0f be d2             	movsbl %dl,%edx
 4e8:	8b 45 08             	mov    0x8(%ebp),%eax
 4eb:	e8 64 fe ff ff       	call   354 <putc>
          s++;
 4f0:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 4f3:	0f b6 16             	movzbl (%esi),%edx
 4f6:	84 d2                	test   %dl,%dl
 4f8:	75 eb                	jne    4e5 <printf+0xec>
      state = 0;
 4fa:	be 00 00 00 00       	mov    $0x0,%esi
 4ff:	e9 21 ff ff ff       	jmp    425 <printf+0x2c>
        putc(fd, *ap);
 504:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 507:	0f be 17             	movsbl (%edi),%edx
 50a:	8b 45 08             	mov    0x8(%ebp),%eax
 50d:	e8 42 fe ff ff       	call   354 <putc>
        ap++;
 512:	83 c7 04             	add    $0x4,%edi
 515:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 518:	be 00 00 00 00       	mov    $0x0,%esi
 51d:	e9 03 ff ff ff       	jmp    425 <printf+0x2c>
        putc(fd, c);
 522:	89 fa                	mov    %edi,%edx
 524:	8b 45 08             	mov    0x8(%ebp),%eax
 527:	e8 28 fe ff ff       	call   354 <putc>
      state = 0;
 52c:	be 00 00 00 00       	mov    $0x0,%esi
 531:	e9 ef fe ff ff       	jmp    425 <printf+0x2c>
        putc(fd, '%');
 536:	ba 25 00 00 00       	mov    $0x25,%edx
 53b:	8b 45 08             	mov    0x8(%ebp),%eax
 53e:	e8 11 fe ff ff       	call   354 <putc>
        putc(fd, c);
 543:	89 fa                	mov    %edi,%edx
 545:	8b 45 08             	mov    0x8(%ebp),%eax
 548:	e8 07 fe ff ff       	call   354 <putc>
      state = 0;
 54d:	be 00 00 00 00       	mov    $0x0,%esi
 552:	e9 ce fe ff ff       	jmp    425 <printf+0x2c>
    }
  }
}
 557:	8d 65 f4             	lea    -0xc(%ebp),%esp
 55a:	5b                   	pop    %ebx
 55b:	5e                   	pop    %esi
 55c:	5f                   	pop    %edi
 55d:	5d                   	pop    %ebp
 55e:	c3                   	ret    

0000055f <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 55f:	55                   	push   %ebp
 560:	89 e5                	mov    %esp,%ebp
 562:	57                   	push   %edi
 563:	56                   	push   %esi
 564:	53                   	push   %ebx
 565:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 568:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 56b:	a1 b0 0a 00 00       	mov    0xab0,%eax
 570:	eb 02                	jmp    574 <free+0x15>
 572:	89 d0                	mov    %edx,%eax
 574:	39 c8                	cmp    %ecx,%eax
 576:	73 04                	jae    57c <free+0x1d>
 578:	39 08                	cmp    %ecx,(%eax)
 57a:	77 12                	ja     58e <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 57c:	8b 10                	mov    (%eax),%edx
 57e:	39 c2                	cmp    %eax,%edx
 580:	77 f0                	ja     572 <free+0x13>
 582:	39 c8                	cmp    %ecx,%eax
 584:	72 08                	jb     58e <free+0x2f>
 586:	39 ca                	cmp    %ecx,%edx
 588:	77 04                	ja     58e <free+0x2f>
 58a:	89 d0                	mov    %edx,%eax
 58c:	eb e6                	jmp    574 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 58e:	8b 73 fc             	mov    -0x4(%ebx),%esi
 591:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 594:	8b 10                	mov    (%eax),%edx
 596:	39 d7                	cmp    %edx,%edi
 598:	74 19                	je     5b3 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 59a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 59d:	8b 50 04             	mov    0x4(%eax),%edx
 5a0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 5a3:	39 ce                	cmp    %ecx,%esi
 5a5:	74 1b                	je     5c2 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 5a7:	89 08                	mov    %ecx,(%eax)
  freep = p;
 5a9:	a3 b0 0a 00 00       	mov    %eax,0xab0
}
 5ae:	5b                   	pop    %ebx
 5af:	5e                   	pop    %esi
 5b0:	5f                   	pop    %edi
 5b1:	5d                   	pop    %ebp
 5b2:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 5b3:	03 72 04             	add    0x4(%edx),%esi
 5b6:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 5b9:	8b 10                	mov    (%eax),%edx
 5bb:	8b 12                	mov    (%edx),%edx
 5bd:	89 53 f8             	mov    %edx,-0x8(%ebx)
 5c0:	eb db                	jmp    59d <free+0x3e>
    p->s.size += bp->s.size;
 5c2:	03 53 fc             	add    -0x4(%ebx),%edx
 5c5:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 5c8:	8b 53 f8             	mov    -0x8(%ebx),%edx
 5cb:	89 10                	mov    %edx,(%eax)
 5cd:	eb da                	jmp    5a9 <free+0x4a>

000005cf <morecore>:

static Header*
morecore(uint nu)
{
 5cf:	55                   	push   %ebp
 5d0:	89 e5                	mov    %esp,%ebp
 5d2:	53                   	push   %ebx
 5d3:	83 ec 04             	sub    $0x4,%esp
 5d6:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 5d8:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 5dd:	77 05                	ja     5e4 <morecore+0x15>
    nu = 4096;
 5df:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 5e4:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 5eb:	83 ec 0c             	sub    $0xc,%esp
 5ee:	50                   	push   %eax
 5ef:	e8 38 fd ff ff       	call   32c <sbrk>
  if(p == (char*)-1)
 5f4:	83 c4 10             	add    $0x10,%esp
 5f7:	83 f8 ff             	cmp    $0xffffffff,%eax
 5fa:	74 1c                	je     618 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 5fc:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 5ff:	83 c0 08             	add    $0x8,%eax
 602:	83 ec 0c             	sub    $0xc,%esp
 605:	50                   	push   %eax
 606:	e8 54 ff ff ff       	call   55f <free>
  return freep;
 60b:	a1 b0 0a 00 00       	mov    0xab0,%eax
 610:	83 c4 10             	add    $0x10,%esp
}
 613:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 616:	c9                   	leave  
 617:	c3                   	ret    
    return 0;
 618:	b8 00 00 00 00       	mov    $0x0,%eax
 61d:	eb f4                	jmp    613 <morecore+0x44>

0000061f <malloc>:

void*
malloc(uint nbytes)
{
 61f:	55                   	push   %ebp
 620:	89 e5                	mov    %esp,%ebp
 622:	53                   	push   %ebx
 623:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 626:	8b 45 08             	mov    0x8(%ebp),%eax
 629:	8d 58 07             	lea    0x7(%eax),%ebx
 62c:	c1 eb 03             	shr    $0x3,%ebx
 62f:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 632:	8b 0d b0 0a 00 00    	mov    0xab0,%ecx
 638:	85 c9                	test   %ecx,%ecx
 63a:	74 04                	je     640 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 63c:	8b 01                	mov    (%ecx),%eax
 63e:	eb 4a                	jmp    68a <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 640:	c7 05 b0 0a 00 00 b4 	movl   $0xab4,0xab0
 647:	0a 00 00 
 64a:	c7 05 b4 0a 00 00 b4 	movl   $0xab4,0xab4
 651:	0a 00 00 
    base.s.size = 0;
 654:	c7 05 b8 0a 00 00 00 	movl   $0x0,0xab8
 65b:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 65e:	b9 b4 0a 00 00       	mov    $0xab4,%ecx
 663:	eb d7                	jmp    63c <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 665:	74 19                	je     680 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 667:	29 da                	sub    %ebx,%edx
 669:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 66c:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 66f:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 672:	89 0d b0 0a 00 00    	mov    %ecx,0xab0
      return (void*)(p + 1);
 678:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 67b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 67e:	c9                   	leave  
 67f:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 680:	8b 10                	mov    (%eax),%edx
 682:	89 11                	mov    %edx,(%ecx)
 684:	eb ec                	jmp    672 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 686:	89 c1                	mov    %eax,%ecx
 688:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 68a:	8b 50 04             	mov    0x4(%eax),%edx
 68d:	39 da                	cmp    %ebx,%edx
 68f:	73 d4                	jae    665 <malloc+0x46>
    if(p == freep)
 691:	39 05 b0 0a 00 00    	cmp    %eax,0xab0
 697:	75 ed                	jne    686 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 699:	89 d8                	mov    %ebx,%eax
 69b:	e8 2f ff ff ff       	call   5cf <morecore>
 6a0:	85 c0                	test   %eax,%eax
 6a2:	75 e2                	jne    686 <malloc+0x67>
 6a4:	eb d5                	jmp    67b <malloc+0x5c>
