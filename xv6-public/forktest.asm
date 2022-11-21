
_forktest:     file format elf32-i386


Disassembly of section .text:

00000000 <printf>:

#define N  1000

void
printf(int fd, const char *s, ...)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	53                   	push   %ebx
   4:	83 ec 10             	sub    $0x10,%esp
   7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  write(fd, s, strlen(s));
   a:	53                   	push   %ebx
   b:	e8 ac 01 00 00       	call   1bc <strlen>
  10:	83 c4 0c             	add    $0xc,%esp
  13:	50                   	push   %eax
  14:	53                   	push   %ebx
  15:	ff 75 08             	push   0x8(%ebp)
  18:	e8 12 03 00 00       	call   32f <write>
}
  1d:	83 c4 10             	add    $0x10,%esp
  20:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  23:	c9                   	leave  
  24:	c3                   	ret    

00000025 <forktest>:

void
forktest(void)
{
  25:	55                   	push   %ebp
  26:	89 e5                	mov    %esp,%ebp
  28:	53                   	push   %ebx
  29:	83 ec 0c             	sub    $0xc,%esp
  int n, pid;

  printf(1, "fork test\n");
  2c:	68 08 05 00 00       	push   $0x508
  31:	6a 01                	push   $0x1
  33:	e8 c8 ff ff ff       	call   0 <printf>

  for(n=0; n<N; n++){
  38:	83 c4 10             	add    $0x10,%esp
  3b:	bb 00 00 00 00       	mov    $0x0,%ebx
  40:	81 fb e7 03 00 00    	cmp    $0x3e7,%ebx
  46:	7f 15                	jg     5d <forktest+0x38>
    pid = fork();
  48:	e8 ba 02 00 00       	call   307 <fork>
    if(pid < 0)
  4d:	85 c0                	test   %eax,%eax
  4f:	78 0c                	js     5d <forktest+0x38>
      break;
    if(pid == 0)
  51:	74 05                	je     58 <forktest+0x33>
  for(n=0; n<N; n++){
  53:	83 c3 01             	add    $0x1,%ebx
  56:	eb e8                	jmp    40 <forktest+0x1b>
      exit();
  58:	e8 b2 02 00 00       	call   30f <exit>
  }

  if(n == N){
  5d:	81 fb e8 03 00 00    	cmp    $0x3e8,%ebx
  63:	74 12                	je     77 <forktest+0x52>
    printf(1, "fork claimed to work N times!\n", N);
    exit();
  }

  for(; n > 0; n--){
  65:	85 db                	test   %ebx,%ebx
  67:	7e 3b                	jle    a4 <forktest+0x7f>
    if(wait() < 0){
  69:	e8 a9 02 00 00       	call   317 <wait>
  6e:	85 c0                	test   %eax,%eax
  70:	78 1e                	js     90 <forktest+0x6b>
  for(; n > 0; n--){
  72:	83 eb 01             	sub    $0x1,%ebx
  75:	eb ee                	jmp    65 <forktest+0x40>
    printf(1, "fork claimed to work N times!\n", N);
  77:	83 ec 04             	sub    $0x4,%esp
  7a:	68 e8 03 00 00       	push   $0x3e8
  7f:	68 48 05 00 00       	push   $0x548
  84:	6a 01                	push   $0x1
  86:	e8 75 ff ff ff       	call   0 <printf>
    exit();
  8b:	e8 7f 02 00 00       	call   30f <exit>
      printf(1, "wait stopped early\n");
  90:	83 ec 08             	sub    $0x8,%esp
  93:	68 13 05 00 00       	push   $0x513
  98:	6a 01                	push   $0x1
  9a:	e8 61 ff ff ff       	call   0 <printf>
      exit();
  9f:	e8 6b 02 00 00       	call   30f <exit>
    }
  }

  if(wait() != -1){
  a4:	e8 6e 02 00 00       	call   317 <wait>
  a9:	83 f8 ff             	cmp    $0xffffffff,%eax
  ac:	75 17                	jne    c5 <forktest+0xa0>
    printf(1, "wait got too many\n");
    exit();
  }

  printf(1, "fork test OK\n");
  ae:	83 ec 08             	sub    $0x8,%esp
  b1:	68 3a 05 00 00       	push   $0x53a
  b6:	6a 01                	push   $0x1
  b8:	e8 43 ff ff ff       	call   0 <printf>
}
  bd:	83 c4 10             	add    $0x10,%esp
  c0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  c3:	c9                   	leave  
  c4:	c3                   	ret    
    printf(1, "wait got too many\n");
  c5:	83 ec 08             	sub    $0x8,%esp
  c8:	68 27 05 00 00       	push   $0x527
  cd:	6a 01                	push   $0x1
  cf:	e8 2c ff ff ff       	call   0 <printf>
    exit();
  d4:	e8 36 02 00 00       	call   30f <exit>

000000d9 <main>:

int
main(void)
{
  d9:	55                   	push   %ebp
  da:	89 e5                	mov    %esp,%ebp
  dc:	83 e4 f0             	and    $0xfffffff0,%esp
  forktest();
  df:	e8 41 ff ff ff       	call   25 <forktest>
  exit();
  e4:	e8 26 02 00 00       	call   30f <exit>

000000e9 <test_and_set>:
#include "fcntl.h"
#include "user.h"
#include "x86.h"
#include "mmu.h"

int test_and_set(int *old_ptr, int new_ptr) {
  e9:	55                   	push   %ebp
  ea:	89 e5                	mov    %esp,%ebp
  ec:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *old_ptr;
  ef:	8b 10                	mov    (%eax),%edx
  *old_ptr = new_ptr;
  f1:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  f4:	89 08                	mov    %ecx,(%eax)
  return old;
}
  f6:	89 d0                	mov    %edx,%eax
  f8:	5d                   	pop    %ebp
  f9:	c3                   	ret    

000000fa <thread_create>:

// a wrapper func for clone
int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
  fa:	55                   	push   %ebp
  fb:	89 e5                	mov    %esp,%ebp
  fd:	83 ec 14             	sub    $0x14,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE);
 100:	68 00 10 00 00       	push   $0x1000
 105:	e8 75 03 00 00       	call   47f <malloc>
  if(n_stack == 0){
 10a:	83 c4 10             	add    $0x10,%esp
 10d:	85 c0                	test   %eax,%eax
 10f:	74 14                	je     125 <thread_create+0x2b>
    return -1;
  }
  int new_pid = clone(start_routine, arg1, arg2, n_stack); // TODO: is this the right way to call it?
 111:	50                   	push   %eax
 112:	ff 75 10             	push   0x10(%ebp)
 115:	ff 75 0c             	push   0xc(%ebp)
 118:	ff 75 08             	push   0x8(%ebp)
 11b:	e8 8f 02 00 00       	call   3af <clone>


  // I can't remember if there was something else to do here but I'm sure I'll find out


  return new_pid;
 120:	83 c4 10             	add    $0x10,%esp
}
 123:	c9                   	leave  
 124:	c3                   	ret    
    return -1;
 125:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 12a:	eb f7                	jmp    123 <thread_create+0x29>

0000012c <thread_join>:

int thread_join() {
  return 0;
}
 12c:	b8 00 00 00 00       	mov    $0x0,%eax
 131:	c3                   	ret    

00000132 <lock_acquire>:

void lock_acquire(lock_t *lock){
 132:	55                   	push   %ebp
 133:	89 e5                	mov    %esp,%ebp
 135:	53                   	push   %ebx
 136:	83 ec 04             	sub    $0x4,%esp
 139:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 13c:	83 ec 08             	sub    $0x8,%esp
 13f:	6a 01                	push   $0x1
 141:	53                   	push   %ebx
 142:	e8 a2 ff ff ff       	call   e9 <test_and_set>
 147:	83 c4 10             	add    $0x10,%esp
 14a:	83 f8 01             	cmp    $0x1,%eax
 14d:	74 ed                	je     13c <lock_acquire+0xa>
    ;
}
 14f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 152:	c9                   	leave  
 153:	c3                   	ret    

00000154 <lock_release>:

void lock_release(lock_t *lock) {
 154:	55                   	push   %ebp
 155:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 157:	8b 45 08             	mov    0x8(%ebp),%eax
 15a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 160:	5d                   	pop    %ebp
 161:	c3                   	ret    

00000162 <lock_init>:

void lock_init(lock_t *lock) {
 162:	55                   	push   %ebp
 163:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 165:	8b 45 08             	mov    0x8(%ebp),%eax
 168:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 16e:	5d                   	pop    %ebp
 16f:	c3                   	ret    

00000170 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 170:	55                   	push   %ebp
 171:	89 e5                	mov    %esp,%ebp
 173:	56                   	push   %esi
 174:	53                   	push   %ebx
 175:	8b 75 08             	mov    0x8(%ebp),%esi
 178:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 17b:	89 f0                	mov    %esi,%eax
 17d:	89 d1                	mov    %edx,%ecx
 17f:	83 c2 01             	add    $0x1,%edx
 182:	89 c3                	mov    %eax,%ebx
 184:	83 c0 01             	add    $0x1,%eax
 187:	0f b6 09             	movzbl (%ecx),%ecx
 18a:	88 0b                	mov    %cl,(%ebx)
 18c:	84 c9                	test   %cl,%cl
 18e:	75 ed                	jne    17d <strcpy+0xd>
    ;
  return os;
}
 190:	89 f0                	mov    %esi,%eax
 192:	5b                   	pop    %ebx
 193:	5e                   	pop    %esi
 194:	5d                   	pop    %ebp
 195:	c3                   	ret    

00000196 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 196:	55                   	push   %ebp
 197:	89 e5                	mov    %esp,%ebp
 199:	8b 4d 08             	mov    0x8(%ebp),%ecx
 19c:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 19f:	eb 06                	jmp    1a7 <strcmp+0x11>
    p++, q++;
 1a1:	83 c1 01             	add    $0x1,%ecx
 1a4:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 1a7:	0f b6 01             	movzbl (%ecx),%eax
 1aa:	84 c0                	test   %al,%al
 1ac:	74 04                	je     1b2 <strcmp+0x1c>
 1ae:	3a 02                	cmp    (%edx),%al
 1b0:	74 ef                	je     1a1 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 1b2:	0f b6 c0             	movzbl %al,%eax
 1b5:	0f b6 12             	movzbl (%edx),%edx
 1b8:	29 d0                	sub    %edx,%eax
}
 1ba:	5d                   	pop    %ebp
 1bb:	c3                   	ret    

000001bc <strlen>:

uint
strlen(const char *s)
{
 1bc:	55                   	push   %ebp
 1bd:	89 e5                	mov    %esp,%ebp
 1bf:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 1c2:	b8 00 00 00 00       	mov    $0x0,%eax
 1c7:	eb 03                	jmp    1cc <strlen+0x10>
 1c9:	83 c0 01             	add    $0x1,%eax
 1cc:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 1d0:	75 f7                	jne    1c9 <strlen+0xd>
    ;
  return n;
}
 1d2:	5d                   	pop    %ebp
 1d3:	c3                   	ret    

000001d4 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1d4:	55                   	push   %ebp
 1d5:	89 e5                	mov    %esp,%ebp
 1d7:	57                   	push   %edi
 1d8:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1db:	89 d7                	mov    %edx,%edi
 1dd:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1e0:	8b 45 0c             	mov    0xc(%ebp),%eax
 1e3:	fc                   	cld    
 1e4:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1e6:	89 d0                	mov    %edx,%eax
 1e8:	8b 7d fc             	mov    -0x4(%ebp),%edi
 1eb:	c9                   	leave  
 1ec:	c3                   	ret    

000001ed <strchr>:

char*
strchr(const char *s, char c)
{
 1ed:	55                   	push   %ebp
 1ee:	89 e5                	mov    %esp,%ebp
 1f0:	8b 45 08             	mov    0x8(%ebp),%eax
 1f3:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1f7:	eb 03                	jmp    1fc <strchr+0xf>
 1f9:	83 c0 01             	add    $0x1,%eax
 1fc:	0f b6 10             	movzbl (%eax),%edx
 1ff:	84 d2                	test   %dl,%dl
 201:	74 06                	je     209 <strchr+0x1c>
    if(*s == c)
 203:	38 ca                	cmp    %cl,%dl
 205:	75 f2                	jne    1f9 <strchr+0xc>
 207:	eb 05                	jmp    20e <strchr+0x21>
      return (char*)s;
  return 0;
 209:	b8 00 00 00 00       	mov    $0x0,%eax
}
 20e:	5d                   	pop    %ebp
 20f:	c3                   	ret    

00000210 <gets>:

char*
gets(char *buf, int max)
{
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	57                   	push   %edi
 214:	56                   	push   %esi
 215:	53                   	push   %ebx
 216:	83 ec 1c             	sub    $0x1c,%esp
 219:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 21c:	bb 00 00 00 00       	mov    $0x0,%ebx
 221:	89 de                	mov    %ebx,%esi
 223:	83 c3 01             	add    $0x1,%ebx
 226:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 229:	7d 2e                	jge    259 <gets+0x49>
    cc = read(0, &c, 1);
 22b:	83 ec 04             	sub    $0x4,%esp
 22e:	6a 01                	push   $0x1
 230:	8d 45 e7             	lea    -0x19(%ebp),%eax
 233:	50                   	push   %eax
 234:	6a 00                	push   $0x0
 236:	e8 ec 00 00 00       	call   327 <read>
    if(cc < 1)
 23b:	83 c4 10             	add    $0x10,%esp
 23e:	85 c0                	test   %eax,%eax
 240:	7e 17                	jle    259 <gets+0x49>
      break;
    buf[i++] = c;
 242:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 246:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 249:	3c 0a                	cmp    $0xa,%al
 24b:	0f 94 c2             	sete   %dl
 24e:	3c 0d                	cmp    $0xd,%al
 250:	0f 94 c0             	sete   %al
 253:	08 c2                	or     %al,%dl
 255:	74 ca                	je     221 <gets+0x11>
    buf[i++] = c;
 257:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 259:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 25d:	89 f8                	mov    %edi,%eax
 25f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 262:	5b                   	pop    %ebx
 263:	5e                   	pop    %esi
 264:	5f                   	pop    %edi
 265:	5d                   	pop    %ebp
 266:	c3                   	ret    

00000267 <stat>:

int
stat(const char *n, struct stat *st)
{
 267:	55                   	push   %ebp
 268:	89 e5                	mov    %esp,%ebp
 26a:	56                   	push   %esi
 26b:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 26c:	83 ec 08             	sub    $0x8,%esp
 26f:	6a 00                	push   $0x0
 271:	ff 75 08             	push   0x8(%ebp)
 274:	e8 d6 00 00 00       	call   34f <open>
  if(fd < 0)
 279:	83 c4 10             	add    $0x10,%esp
 27c:	85 c0                	test   %eax,%eax
 27e:	78 24                	js     2a4 <stat+0x3d>
 280:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 282:	83 ec 08             	sub    $0x8,%esp
 285:	ff 75 0c             	push   0xc(%ebp)
 288:	50                   	push   %eax
 289:	e8 d9 00 00 00       	call   367 <fstat>
 28e:	89 c6                	mov    %eax,%esi
  close(fd);
 290:	89 1c 24             	mov    %ebx,(%esp)
 293:	e8 9f 00 00 00       	call   337 <close>
  return r;
 298:	83 c4 10             	add    $0x10,%esp
}
 29b:	89 f0                	mov    %esi,%eax
 29d:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2a0:	5b                   	pop    %ebx
 2a1:	5e                   	pop    %esi
 2a2:	5d                   	pop    %ebp
 2a3:	c3                   	ret    
    return -1;
 2a4:	be ff ff ff ff       	mov    $0xffffffff,%esi
 2a9:	eb f0                	jmp    29b <stat+0x34>

000002ab <atoi>:

int
atoi(const char *s)
{
 2ab:	55                   	push   %ebp
 2ac:	89 e5                	mov    %esp,%ebp
 2ae:	53                   	push   %ebx
 2af:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 2b2:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 2b7:	eb 10                	jmp    2c9 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 2b9:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 2bc:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 2bf:	83 c1 01             	add    $0x1,%ecx
 2c2:	0f be c0             	movsbl %al,%eax
 2c5:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 2c9:	0f b6 01             	movzbl (%ecx),%eax
 2cc:	8d 58 d0             	lea    -0x30(%eax),%ebx
 2cf:	80 fb 09             	cmp    $0x9,%bl
 2d2:	76 e5                	jbe    2b9 <atoi+0xe>
  return n;
}
 2d4:	89 d0                	mov    %edx,%eax
 2d6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2d9:	c9                   	leave  
 2da:	c3                   	ret    

000002db <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2db:	55                   	push   %ebp
 2dc:	89 e5                	mov    %esp,%ebp
 2de:	56                   	push   %esi
 2df:	53                   	push   %ebx
 2e0:	8b 75 08             	mov    0x8(%ebp),%esi
 2e3:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 2e6:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 2e9:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 2eb:	eb 0d                	jmp    2fa <memmove+0x1f>
    *dst++ = *src++;
 2ed:	0f b6 01             	movzbl (%ecx),%eax
 2f0:	88 02                	mov    %al,(%edx)
 2f2:	8d 49 01             	lea    0x1(%ecx),%ecx
 2f5:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 2f8:	89 d8                	mov    %ebx,%eax
 2fa:	8d 58 ff             	lea    -0x1(%eax),%ebx
 2fd:	85 c0                	test   %eax,%eax
 2ff:	7f ec                	jg     2ed <memmove+0x12>
  return vdst;
}
 301:	89 f0                	mov    %esi,%eax
 303:	5b                   	pop    %ebx
 304:	5e                   	pop    %esi
 305:	5d                   	pop    %ebp
 306:	c3                   	ret    

00000307 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 307:	b8 01 00 00 00       	mov    $0x1,%eax
 30c:	cd 40                	int    $0x40
 30e:	c3                   	ret    

0000030f <exit>:
SYSCALL(exit)
 30f:	b8 02 00 00 00       	mov    $0x2,%eax
 314:	cd 40                	int    $0x40
 316:	c3                   	ret    

00000317 <wait>:
SYSCALL(wait)
 317:	b8 03 00 00 00       	mov    $0x3,%eax
 31c:	cd 40                	int    $0x40
 31e:	c3                   	ret    

0000031f <pipe>:
SYSCALL(pipe)
 31f:	b8 04 00 00 00       	mov    $0x4,%eax
 324:	cd 40                	int    $0x40
 326:	c3                   	ret    

00000327 <read>:
SYSCALL(read)
 327:	b8 05 00 00 00       	mov    $0x5,%eax
 32c:	cd 40                	int    $0x40
 32e:	c3                   	ret    

0000032f <write>:
SYSCALL(write)
 32f:	b8 10 00 00 00       	mov    $0x10,%eax
 334:	cd 40                	int    $0x40
 336:	c3                   	ret    

00000337 <close>:
SYSCALL(close)
 337:	b8 15 00 00 00       	mov    $0x15,%eax
 33c:	cd 40                	int    $0x40
 33e:	c3                   	ret    

0000033f <kill>:
SYSCALL(kill)
 33f:	b8 06 00 00 00       	mov    $0x6,%eax
 344:	cd 40                	int    $0x40
 346:	c3                   	ret    

00000347 <exec>:
SYSCALL(exec)
 347:	b8 07 00 00 00       	mov    $0x7,%eax
 34c:	cd 40                	int    $0x40
 34e:	c3                   	ret    

0000034f <open>:
SYSCALL(open)
 34f:	b8 0f 00 00 00       	mov    $0xf,%eax
 354:	cd 40                	int    $0x40
 356:	c3                   	ret    

00000357 <mknod>:
SYSCALL(mknod)
 357:	b8 11 00 00 00       	mov    $0x11,%eax
 35c:	cd 40                	int    $0x40
 35e:	c3                   	ret    

0000035f <unlink>:
SYSCALL(unlink)
 35f:	b8 12 00 00 00       	mov    $0x12,%eax
 364:	cd 40                	int    $0x40
 366:	c3                   	ret    

00000367 <fstat>:
SYSCALL(fstat)
 367:	b8 08 00 00 00       	mov    $0x8,%eax
 36c:	cd 40                	int    $0x40
 36e:	c3                   	ret    

0000036f <link>:
SYSCALL(link)
 36f:	b8 13 00 00 00       	mov    $0x13,%eax
 374:	cd 40                	int    $0x40
 376:	c3                   	ret    

00000377 <mkdir>:
SYSCALL(mkdir)
 377:	b8 14 00 00 00       	mov    $0x14,%eax
 37c:	cd 40                	int    $0x40
 37e:	c3                   	ret    

0000037f <chdir>:
SYSCALL(chdir)
 37f:	b8 09 00 00 00       	mov    $0x9,%eax
 384:	cd 40                	int    $0x40
 386:	c3                   	ret    

00000387 <dup>:
SYSCALL(dup)
 387:	b8 0a 00 00 00       	mov    $0xa,%eax
 38c:	cd 40                	int    $0x40
 38e:	c3                   	ret    

0000038f <getpid>:
SYSCALL(getpid)
 38f:	b8 0b 00 00 00       	mov    $0xb,%eax
 394:	cd 40                	int    $0x40
 396:	c3                   	ret    

00000397 <sbrk>:
SYSCALL(sbrk)
 397:	b8 0c 00 00 00       	mov    $0xc,%eax
 39c:	cd 40                	int    $0x40
 39e:	c3                   	ret    

0000039f <sleep>:
SYSCALL(sleep)
 39f:	b8 0d 00 00 00       	mov    $0xd,%eax
 3a4:	cd 40                	int    $0x40
 3a6:	c3                   	ret    

000003a7 <uptime>:
SYSCALL(uptime)
 3a7:	b8 0e 00 00 00       	mov    $0xe,%eax
 3ac:	cd 40                	int    $0x40
 3ae:	c3                   	ret    

000003af <clone>:
SYSCALL(clone)
 3af:	b8 16 00 00 00       	mov    $0x16,%eax
 3b4:	cd 40                	int    $0x40
 3b6:	c3                   	ret    

000003b7 <join>:
 3b7:	b8 17 00 00 00       	mov    $0x17,%eax
 3bc:	cd 40                	int    $0x40
 3be:	c3                   	ret    

000003bf <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 3bf:	55                   	push   %ebp
 3c0:	89 e5                	mov    %esp,%ebp
 3c2:	57                   	push   %edi
 3c3:	56                   	push   %esi
 3c4:	53                   	push   %ebx
 3c5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 3c8:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 3cb:	a1 74 08 00 00       	mov    0x874,%eax
 3d0:	eb 02                	jmp    3d4 <free+0x15>
 3d2:	89 d0                	mov    %edx,%eax
 3d4:	39 c8                	cmp    %ecx,%eax
 3d6:	73 04                	jae    3dc <free+0x1d>
 3d8:	39 08                	cmp    %ecx,(%eax)
 3da:	77 12                	ja     3ee <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 3dc:	8b 10                	mov    (%eax),%edx
 3de:	39 c2                	cmp    %eax,%edx
 3e0:	77 f0                	ja     3d2 <free+0x13>
 3e2:	39 c8                	cmp    %ecx,%eax
 3e4:	72 08                	jb     3ee <free+0x2f>
 3e6:	39 ca                	cmp    %ecx,%edx
 3e8:	77 04                	ja     3ee <free+0x2f>
 3ea:	89 d0                	mov    %edx,%eax
 3ec:	eb e6                	jmp    3d4 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 3ee:	8b 73 fc             	mov    -0x4(%ebx),%esi
 3f1:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 3f4:	8b 10                	mov    (%eax),%edx
 3f6:	39 d7                	cmp    %edx,%edi
 3f8:	74 19                	je     413 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 3fa:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 3fd:	8b 50 04             	mov    0x4(%eax),%edx
 400:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 403:	39 ce                	cmp    %ecx,%esi
 405:	74 1b                	je     422 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 407:	89 08                	mov    %ecx,(%eax)
  freep = p;
 409:	a3 74 08 00 00       	mov    %eax,0x874
}
 40e:	5b                   	pop    %ebx
 40f:	5e                   	pop    %esi
 410:	5f                   	pop    %edi
 411:	5d                   	pop    %ebp
 412:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 413:	03 72 04             	add    0x4(%edx),%esi
 416:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 419:	8b 10                	mov    (%eax),%edx
 41b:	8b 12                	mov    (%edx),%edx
 41d:	89 53 f8             	mov    %edx,-0x8(%ebx)
 420:	eb db                	jmp    3fd <free+0x3e>
    p->s.size += bp->s.size;
 422:	03 53 fc             	add    -0x4(%ebx),%edx
 425:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 428:	8b 53 f8             	mov    -0x8(%ebx),%edx
 42b:	89 10                	mov    %edx,(%eax)
 42d:	eb da                	jmp    409 <free+0x4a>

0000042f <morecore>:

static Header*
morecore(uint nu)
{
 42f:	55                   	push   %ebp
 430:	89 e5                	mov    %esp,%ebp
 432:	53                   	push   %ebx
 433:	83 ec 04             	sub    $0x4,%esp
 436:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 438:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 43d:	77 05                	ja     444 <morecore+0x15>
    nu = 4096;
 43f:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 444:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 44b:	83 ec 0c             	sub    $0xc,%esp
 44e:	50                   	push   %eax
 44f:	e8 43 ff ff ff       	call   397 <sbrk>
  if(p == (char*)-1)
 454:	83 c4 10             	add    $0x10,%esp
 457:	83 f8 ff             	cmp    $0xffffffff,%eax
 45a:	74 1c                	je     478 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 45c:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 45f:	83 c0 08             	add    $0x8,%eax
 462:	83 ec 0c             	sub    $0xc,%esp
 465:	50                   	push   %eax
 466:	e8 54 ff ff ff       	call   3bf <free>
  return freep;
 46b:	a1 74 08 00 00       	mov    0x874,%eax
 470:	83 c4 10             	add    $0x10,%esp
}
 473:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 476:	c9                   	leave  
 477:	c3                   	ret    
    return 0;
 478:	b8 00 00 00 00       	mov    $0x0,%eax
 47d:	eb f4                	jmp    473 <morecore+0x44>

0000047f <malloc>:

void*
malloc(uint nbytes)
{
 47f:	55                   	push   %ebp
 480:	89 e5                	mov    %esp,%ebp
 482:	53                   	push   %ebx
 483:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 486:	8b 45 08             	mov    0x8(%ebp),%eax
 489:	8d 58 07             	lea    0x7(%eax),%ebx
 48c:	c1 eb 03             	shr    $0x3,%ebx
 48f:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 492:	8b 0d 74 08 00 00    	mov    0x874,%ecx
 498:	85 c9                	test   %ecx,%ecx
 49a:	74 04                	je     4a0 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 49c:	8b 01                	mov    (%ecx),%eax
 49e:	eb 4a                	jmp    4ea <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 4a0:	c7 05 74 08 00 00 78 	movl   $0x878,0x874
 4a7:	08 00 00 
 4aa:	c7 05 78 08 00 00 78 	movl   $0x878,0x878
 4b1:	08 00 00 
    base.s.size = 0;
 4b4:	c7 05 7c 08 00 00 00 	movl   $0x0,0x87c
 4bb:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 4be:	b9 78 08 00 00       	mov    $0x878,%ecx
 4c3:	eb d7                	jmp    49c <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 4c5:	74 19                	je     4e0 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 4c7:	29 da                	sub    %ebx,%edx
 4c9:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 4cc:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 4cf:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 4d2:	89 0d 74 08 00 00    	mov    %ecx,0x874
      return (void*)(p + 1);
 4d8:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 4db:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4de:	c9                   	leave  
 4df:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 4e0:	8b 10                	mov    (%eax),%edx
 4e2:	89 11                	mov    %edx,(%ecx)
 4e4:	eb ec                	jmp    4d2 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 4e6:	89 c1                	mov    %eax,%ecx
 4e8:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 4ea:	8b 50 04             	mov    0x4(%eax),%edx
 4ed:	39 da                	cmp    %ebx,%edx
 4ef:	73 d4                	jae    4c5 <malloc+0x46>
    if(p == freep)
 4f1:	39 05 74 08 00 00    	cmp    %eax,0x874
 4f7:	75 ed                	jne    4e6 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 4f9:	89 d8                	mov    %ebx,%eax
 4fb:	e8 2f ff ff ff       	call   42f <morecore>
 500:	85 c0                	test   %eax,%eax
 502:	75 e2                	jne    4e6 <malloc+0x67>
 504:	eb d5                	jmp    4db <malloc+0x5c>
