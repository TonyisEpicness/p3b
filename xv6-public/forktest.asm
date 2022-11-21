
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
   b:	e8 b7 01 00 00       	call   1c7 <strlen>
  10:	83 c4 0c             	add    $0xc,%esp
  13:	50                   	push   %eax
  14:	53                   	push   %ebx
  15:	ff 75 08             	push   0x8(%ebp)
  18:	e8 1d 03 00 00       	call   33a <write>
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
  2c:	68 14 05 00 00       	push   $0x514
  31:	6a 01                	push   $0x1
  33:	e8 c8 ff ff ff       	call   0 <printf>

  for(n=0; n<N; n++){
  38:	83 c4 10             	add    $0x10,%esp
  3b:	bb 00 00 00 00       	mov    $0x0,%ebx
  40:	81 fb e7 03 00 00    	cmp    $0x3e7,%ebx
  46:	7f 15                	jg     5d <forktest+0x38>
    pid = fork();
  48:	e8 c5 02 00 00       	call   312 <fork>
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
  58:	e8 bd 02 00 00       	call   31a <exit>
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
  69:	e8 b4 02 00 00       	call   322 <wait>
  6e:	85 c0                	test   %eax,%eax
  70:	78 1e                	js     90 <forktest+0x6b>
  for(; n > 0; n--){
  72:	83 eb 01             	sub    $0x1,%ebx
  75:	eb ee                	jmp    65 <forktest+0x40>
    printf(1, "fork claimed to work N times!\n", N);
  77:	83 ec 04             	sub    $0x4,%esp
  7a:	68 e8 03 00 00       	push   $0x3e8
  7f:	68 54 05 00 00       	push   $0x554
  84:	6a 01                	push   $0x1
  86:	e8 75 ff ff ff       	call   0 <printf>
    exit();
  8b:	e8 8a 02 00 00       	call   31a <exit>
      printf(1, "wait stopped early\n");
  90:	83 ec 08             	sub    $0x8,%esp
  93:	68 1f 05 00 00       	push   $0x51f
  98:	6a 01                	push   $0x1
  9a:	e8 61 ff ff ff       	call   0 <printf>
      exit();
  9f:	e8 76 02 00 00       	call   31a <exit>
    }
  }

  if(wait() != -1){
  a4:	e8 79 02 00 00       	call   322 <wait>
  a9:	83 f8 ff             	cmp    $0xffffffff,%eax
  ac:	75 17                	jne    c5 <forktest+0xa0>
    printf(1, "wait got too many\n");
    exit();
  }

  printf(1, "fork test OK\n");
  ae:	83 ec 08             	sub    $0x8,%esp
  b1:	68 46 05 00 00       	push   $0x546
  b6:	6a 01                	push   $0x1
  b8:	e8 43 ff ff ff       	call   0 <printf>
}
  bd:	83 c4 10             	add    $0x10,%esp
  c0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  c3:	c9                   	leave  
  c4:	c3                   	ret    
    printf(1, "wait got too many\n");
  c5:	83 ec 08             	sub    $0x8,%esp
  c8:	68 33 05 00 00       	push   $0x533
  cd:	6a 01                	push   $0x1
  cf:	e8 2c ff ff ff       	call   0 <printf>
    exit();
  d4:	e8 41 02 00 00       	call   31a <exit>

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
  e4:	e8 31 02 00 00       	call   31a <exit>

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
  void *n_stack = malloc(PGSIZE*2);
 100:	68 00 20 00 00       	push   $0x2000
 105:	e8 80 03 00 00       	call   48a <malloc>
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
 11b:	e8 9a 02 00 00       	call   3ba <clone>


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
 12c:	55                   	push   %ebp
 12d:	89 e5                	mov    %esp,%ebp
 12f:	83 ec 24             	sub    $0x24,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 132:	8d 45 f4             	lea    -0xc(%ebp),%eax
 135:	50                   	push   %eax
 136:	e8 87 02 00 00       	call   3c2 <join>
  
  return pid;
}
 13b:	c9                   	leave  
 13c:	c3                   	ret    

0000013d <lock_acquire>:

void lock_acquire(lock_t *lock){
 13d:	55                   	push   %ebp
 13e:	89 e5                	mov    %esp,%ebp
 140:	53                   	push   %ebx
 141:	83 ec 04             	sub    $0x4,%esp
 144:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 147:	83 ec 08             	sub    $0x8,%esp
 14a:	6a 01                	push   $0x1
 14c:	53                   	push   %ebx
 14d:	e8 97 ff ff ff       	call   e9 <test_and_set>
 152:	83 c4 10             	add    $0x10,%esp
 155:	83 f8 01             	cmp    $0x1,%eax
 158:	74 ed                	je     147 <lock_acquire+0xa>
    ;
}
 15a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 15d:	c9                   	leave  
 15e:	c3                   	ret    

0000015f <lock_release>:

void lock_release(lock_t *lock) {
 15f:	55                   	push   %ebp
 160:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 162:	8b 45 08             	mov    0x8(%ebp),%eax
 165:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 16b:	5d                   	pop    %ebp
 16c:	c3                   	ret    

0000016d <lock_init>:

void lock_init(lock_t *lock) {
 16d:	55                   	push   %ebp
 16e:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 170:	8b 45 08             	mov    0x8(%ebp),%eax
 173:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 179:	5d                   	pop    %ebp
 17a:	c3                   	ret    

0000017b <strcpy>:

char*
strcpy(char *s, const char *t)
{
 17b:	55                   	push   %ebp
 17c:	89 e5                	mov    %esp,%ebp
 17e:	56                   	push   %esi
 17f:	53                   	push   %ebx
 180:	8b 75 08             	mov    0x8(%ebp),%esi
 183:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 186:	89 f0                	mov    %esi,%eax
 188:	89 d1                	mov    %edx,%ecx
 18a:	83 c2 01             	add    $0x1,%edx
 18d:	89 c3                	mov    %eax,%ebx
 18f:	83 c0 01             	add    $0x1,%eax
 192:	0f b6 09             	movzbl (%ecx),%ecx
 195:	88 0b                	mov    %cl,(%ebx)
 197:	84 c9                	test   %cl,%cl
 199:	75 ed                	jne    188 <strcpy+0xd>
    ;
  return os;
}
 19b:	89 f0                	mov    %esi,%eax
 19d:	5b                   	pop    %ebx
 19e:	5e                   	pop    %esi
 19f:	5d                   	pop    %ebp
 1a0:	c3                   	ret    

000001a1 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1a1:	55                   	push   %ebp
 1a2:	89 e5                	mov    %esp,%ebp
 1a4:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1a7:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 1aa:	eb 06                	jmp    1b2 <strcmp+0x11>
    p++, q++;
 1ac:	83 c1 01             	add    $0x1,%ecx
 1af:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 1b2:	0f b6 01             	movzbl (%ecx),%eax
 1b5:	84 c0                	test   %al,%al
 1b7:	74 04                	je     1bd <strcmp+0x1c>
 1b9:	3a 02                	cmp    (%edx),%al
 1bb:	74 ef                	je     1ac <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 1bd:	0f b6 c0             	movzbl %al,%eax
 1c0:	0f b6 12             	movzbl (%edx),%edx
 1c3:	29 d0                	sub    %edx,%eax
}
 1c5:	5d                   	pop    %ebp
 1c6:	c3                   	ret    

000001c7 <strlen>:

uint
strlen(const char *s)
{
 1c7:	55                   	push   %ebp
 1c8:	89 e5                	mov    %esp,%ebp
 1ca:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 1cd:	b8 00 00 00 00       	mov    $0x0,%eax
 1d2:	eb 03                	jmp    1d7 <strlen+0x10>
 1d4:	83 c0 01             	add    $0x1,%eax
 1d7:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 1db:	75 f7                	jne    1d4 <strlen+0xd>
    ;
  return n;
}
 1dd:	5d                   	pop    %ebp
 1de:	c3                   	ret    

000001df <memset>:

void*
memset(void *dst, int c, uint n)
{
 1df:	55                   	push   %ebp
 1e0:	89 e5                	mov    %esp,%ebp
 1e2:	57                   	push   %edi
 1e3:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1e6:	89 d7                	mov    %edx,%edi
 1e8:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1eb:	8b 45 0c             	mov    0xc(%ebp),%eax
 1ee:	fc                   	cld    
 1ef:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1f1:	89 d0                	mov    %edx,%eax
 1f3:	8b 7d fc             	mov    -0x4(%ebp),%edi
 1f6:	c9                   	leave  
 1f7:	c3                   	ret    

000001f8 <strchr>:

char*
strchr(const char *s, char c)
{
 1f8:	55                   	push   %ebp
 1f9:	89 e5                	mov    %esp,%ebp
 1fb:	8b 45 08             	mov    0x8(%ebp),%eax
 1fe:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 202:	eb 03                	jmp    207 <strchr+0xf>
 204:	83 c0 01             	add    $0x1,%eax
 207:	0f b6 10             	movzbl (%eax),%edx
 20a:	84 d2                	test   %dl,%dl
 20c:	74 06                	je     214 <strchr+0x1c>
    if(*s == c)
 20e:	38 ca                	cmp    %cl,%dl
 210:	75 f2                	jne    204 <strchr+0xc>
 212:	eb 05                	jmp    219 <strchr+0x21>
      return (char*)s;
  return 0;
 214:	b8 00 00 00 00       	mov    $0x0,%eax
}
 219:	5d                   	pop    %ebp
 21a:	c3                   	ret    

0000021b <gets>:

char*
gets(char *buf, int max)
{
 21b:	55                   	push   %ebp
 21c:	89 e5                	mov    %esp,%ebp
 21e:	57                   	push   %edi
 21f:	56                   	push   %esi
 220:	53                   	push   %ebx
 221:	83 ec 1c             	sub    $0x1c,%esp
 224:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 227:	bb 00 00 00 00       	mov    $0x0,%ebx
 22c:	89 de                	mov    %ebx,%esi
 22e:	83 c3 01             	add    $0x1,%ebx
 231:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 234:	7d 2e                	jge    264 <gets+0x49>
    cc = read(0, &c, 1);
 236:	83 ec 04             	sub    $0x4,%esp
 239:	6a 01                	push   $0x1
 23b:	8d 45 e7             	lea    -0x19(%ebp),%eax
 23e:	50                   	push   %eax
 23f:	6a 00                	push   $0x0
 241:	e8 ec 00 00 00       	call   332 <read>
    if(cc < 1)
 246:	83 c4 10             	add    $0x10,%esp
 249:	85 c0                	test   %eax,%eax
 24b:	7e 17                	jle    264 <gets+0x49>
      break;
    buf[i++] = c;
 24d:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 251:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 254:	3c 0a                	cmp    $0xa,%al
 256:	0f 94 c2             	sete   %dl
 259:	3c 0d                	cmp    $0xd,%al
 25b:	0f 94 c0             	sete   %al
 25e:	08 c2                	or     %al,%dl
 260:	74 ca                	je     22c <gets+0x11>
    buf[i++] = c;
 262:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 264:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 268:	89 f8                	mov    %edi,%eax
 26a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 26d:	5b                   	pop    %ebx
 26e:	5e                   	pop    %esi
 26f:	5f                   	pop    %edi
 270:	5d                   	pop    %ebp
 271:	c3                   	ret    

00000272 <stat>:

int
stat(const char *n, struct stat *st)
{
 272:	55                   	push   %ebp
 273:	89 e5                	mov    %esp,%ebp
 275:	56                   	push   %esi
 276:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 277:	83 ec 08             	sub    $0x8,%esp
 27a:	6a 00                	push   $0x0
 27c:	ff 75 08             	push   0x8(%ebp)
 27f:	e8 d6 00 00 00       	call   35a <open>
  if(fd < 0)
 284:	83 c4 10             	add    $0x10,%esp
 287:	85 c0                	test   %eax,%eax
 289:	78 24                	js     2af <stat+0x3d>
 28b:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 28d:	83 ec 08             	sub    $0x8,%esp
 290:	ff 75 0c             	push   0xc(%ebp)
 293:	50                   	push   %eax
 294:	e8 d9 00 00 00       	call   372 <fstat>
 299:	89 c6                	mov    %eax,%esi
  close(fd);
 29b:	89 1c 24             	mov    %ebx,(%esp)
 29e:	e8 9f 00 00 00       	call   342 <close>
  return r;
 2a3:	83 c4 10             	add    $0x10,%esp
}
 2a6:	89 f0                	mov    %esi,%eax
 2a8:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2ab:	5b                   	pop    %ebx
 2ac:	5e                   	pop    %esi
 2ad:	5d                   	pop    %ebp
 2ae:	c3                   	ret    
    return -1;
 2af:	be ff ff ff ff       	mov    $0xffffffff,%esi
 2b4:	eb f0                	jmp    2a6 <stat+0x34>

000002b6 <atoi>:

int
atoi(const char *s)
{
 2b6:	55                   	push   %ebp
 2b7:	89 e5                	mov    %esp,%ebp
 2b9:	53                   	push   %ebx
 2ba:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 2bd:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 2c2:	eb 10                	jmp    2d4 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 2c4:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 2c7:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 2ca:	83 c1 01             	add    $0x1,%ecx
 2cd:	0f be c0             	movsbl %al,%eax
 2d0:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 2d4:	0f b6 01             	movzbl (%ecx),%eax
 2d7:	8d 58 d0             	lea    -0x30(%eax),%ebx
 2da:	80 fb 09             	cmp    $0x9,%bl
 2dd:	76 e5                	jbe    2c4 <atoi+0xe>
  return n;
}
 2df:	89 d0                	mov    %edx,%eax
 2e1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2e4:	c9                   	leave  
 2e5:	c3                   	ret    

000002e6 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2e6:	55                   	push   %ebp
 2e7:	89 e5                	mov    %esp,%ebp
 2e9:	56                   	push   %esi
 2ea:	53                   	push   %ebx
 2eb:	8b 75 08             	mov    0x8(%ebp),%esi
 2ee:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 2f1:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 2f4:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 2f6:	eb 0d                	jmp    305 <memmove+0x1f>
    *dst++ = *src++;
 2f8:	0f b6 01             	movzbl (%ecx),%eax
 2fb:	88 02                	mov    %al,(%edx)
 2fd:	8d 49 01             	lea    0x1(%ecx),%ecx
 300:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 303:	89 d8                	mov    %ebx,%eax
 305:	8d 58 ff             	lea    -0x1(%eax),%ebx
 308:	85 c0                	test   %eax,%eax
 30a:	7f ec                	jg     2f8 <memmove+0x12>
  return vdst;
}
 30c:	89 f0                	mov    %esi,%eax
 30e:	5b                   	pop    %ebx
 30f:	5e                   	pop    %esi
 310:	5d                   	pop    %ebp
 311:	c3                   	ret    

00000312 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 312:	b8 01 00 00 00       	mov    $0x1,%eax
 317:	cd 40                	int    $0x40
 319:	c3                   	ret    

0000031a <exit>:
SYSCALL(exit)
 31a:	b8 02 00 00 00       	mov    $0x2,%eax
 31f:	cd 40                	int    $0x40
 321:	c3                   	ret    

00000322 <wait>:
SYSCALL(wait)
 322:	b8 03 00 00 00       	mov    $0x3,%eax
 327:	cd 40                	int    $0x40
 329:	c3                   	ret    

0000032a <pipe>:
SYSCALL(pipe)
 32a:	b8 04 00 00 00       	mov    $0x4,%eax
 32f:	cd 40                	int    $0x40
 331:	c3                   	ret    

00000332 <read>:
SYSCALL(read)
 332:	b8 05 00 00 00       	mov    $0x5,%eax
 337:	cd 40                	int    $0x40
 339:	c3                   	ret    

0000033a <write>:
SYSCALL(write)
 33a:	b8 10 00 00 00       	mov    $0x10,%eax
 33f:	cd 40                	int    $0x40
 341:	c3                   	ret    

00000342 <close>:
SYSCALL(close)
 342:	b8 15 00 00 00       	mov    $0x15,%eax
 347:	cd 40                	int    $0x40
 349:	c3                   	ret    

0000034a <kill>:
SYSCALL(kill)
 34a:	b8 06 00 00 00       	mov    $0x6,%eax
 34f:	cd 40                	int    $0x40
 351:	c3                   	ret    

00000352 <exec>:
SYSCALL(exec)
 352:	b8 07 00 00 00       	mov    $0x7,%eax
 357:	cd 40                	int    $0x40
 359:	c3                   	ret    

0000035a <open>:
SYSCALL(open)
 35a:	b8 0f 00 00 00       	mov    $0xf,%eax
 35f:	cd 40                	int    $0x40
 361:	c3                   	ret    

00000362 <mknod>:
SYSCALL(mknod)
 362:	b8 11 00 00 00       	mov    $0x11,%eax
 367:	cd 40                	int    $0x40
 369:	c3                   	ret    

0000036a <unlink>:
SYSCALL(unlink)
 36a:	b8 12 00 00 00       	mov    $0x12,%eax
 36f:	cd 40                	int    $0x40
 371:	c3                   	ret    

00000372 <fstat>:
SYSCALL(fstat)
 372:	b8 08 00 00 00       	mov    $0x8,%eax
 377:	cd 40                	int    $0x40
 379:	c3                   	ret    

0000037a <link>:
SYSCALL(link)
 37a:	b8 13 00 00 00       	mov    $0x13,%eax
 37f:	cd 40                	int    $0x40
 381:	c3                   	ret    

00000382 <mkdir>:
SYSCALL(mkdir)
 382:	b8 14 00 00 00       	mov    $0x14,%eax
 387:	cd 40                	int    $0x40
 389:	c3                   	ret    

0000038a <chdir>:
SYSCALL(chdir)
 38a:	b8 09 00 00 00       	mov    $0x9,%eax
 38f:	cd 40                	int    $0x40
 391:	c3                   	ret    

00000392 <dup>:
SYSCALL(dup)
 392:	b8 0a 00 00 00       	mov    $0xa,%eax
 397:	cd 40                	int    $0x40
 399:	c3                   	ret    

0000039a <getpid>:
SYSCALL(getpid)
 39a:	b8 0b 00 00 00       	mov    $0xb,%eax
 39f:	cd 40                	int    $0x40
 3a1:	c3                   	ret    

000003a2 <sbrk>:
SYSCALL(sbrk)
 3a2:	b8 0c 00 00 00       	mov    $0xc,%eax
 3a7:	cd 40                	int    $0x40
 3a9:	c3                   	ret    

000003aa <sleep>:
SYSCALL(sleep)
 3aa:	b8 0d 00 00 00       	mov    $0xd,%eax
 3af:	cd 40                	int    $0x40
 3b1:	c3                   	ret    

000003b2 <uptime>:
SYSCALL(uptime)
 3b2:	b8 0e 00 00 00       	mov    $0xe,%eax
 3b7:	cd 40                	int    $0x40
 3b9:	c3                   	ret    

000003ba <clone>:
SYSCALL(clone)
 3ba:	b8 16 00 00 00       	mov    $0x16,%eax
 3bf:	cd 40                	int    $0x40
 3c1:	c3                   	ret    

000003c2 <join>:
 3c2:	b8 17 00 00 00       	mov    $0x17,%eax
 3c7:	cd 40                	int    $0x40
 3c9:	c3                   	ret    

000003ca <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 3ca:	55                   	push   %ebp
 3cb:	89 e5                	mov    %esp,%ebp
 3cd:	57                   	push   %edi
 3ce:	56                   	push   %esi
 3cf:	53                   	push   %ebx
 3d0:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 3d3:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 3d6:	a1 8c 08 00 00       	mov    0x88c,%eax
 3db:	eb 02                	jmp    3df <free+0x15>
 3dd:	89 d0                	mov    %edx,%eax
 3df:	39 c8                	cmp    %ecx,%eax
 3e1:	73 04                	jae    3e7 <free+0x1d>
 3e3:	39 08                	cmp    %ecx,(%eax)
 3e5:	77 12                	ja     3f9 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 3e7:	8b 10                	mov    (%eax),%edx
 3e9:	39 c2                	cmp    %eax,%edx
 3eb:	77 f0                	ja     3dd <free+0x13>
 3ed:	39 c8                	cmp    %ecx,%eax
 3ef:	72 08                	jb     3f9 <free+0x2f>
 3f1:	39 ca                	cmp    %ecx,%edx
 3f3:	77 04                	ja     3f9 <free+0x2f>
 3f5:	89 d0                	mov    %edx,%eax
 3f7:	eb e6                	jmp    3df <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 3f9:	8b 73 fc             	mov    -0x4(%ebx),%esi
 3fc:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 3ff:	8b 10                	mov    (%eax),%edx
 401:	39 d7                	cmp    %edx,%edi
 403:	74 19                	je     41e <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 405:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 408:	8b 50 04             	mov    0x4(%eax),%edx
 40b:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 40e:	39 ce                	cmp    %ecx,%esi
 410:	74 1b                	je     42d <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 412:	89 08                	mov    %ecx,(%eax)
  freep = p;
 414:	a3 8c 08 00 00       	mov    %eax,0x88c
}
 419:	5b                   	pop    %ebx
 41a:	5e                   	pop    %esi
 41b:	5f                   	pop    %edi
 41c:	5d                   	pop    %ebp
 41d:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 41e:	03 72 04             	add    0x4(%edx),%esi
 421:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 424:	8b 10                	mov    (%eax),%edx
 426:	8b 12                	mov    (%edx),%edx
 428:	89 53 f8             	mov    %edx,-0x8(%ebx)
 42b:	eb db                	jmp    408 <free+0x3e>
    p->s.size += bp->s.size;
 42d:	03 53 fc             	add    -0x4(%ebx),%edx
 430:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 433:	8b 53 f8             	mov    -0x8(%ebx),%edx
 436:	89 10                	mov    %edx,(%eax)
 438:	eb da                	jmp    414 <free+0x4a>

0000043a <morecore>:

static Header*
morecore(uint nu)
{
 43a:	55                   	push   %ebp
 43b:	89 e5                	mov    %esp,%ebp
 43d:	53                   	push   %ebx
 43e:	83 ec 04             	sub    $0x4,%esp
 441:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 443:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 448:	77 05                	ja     44f <morecore+0x15>
    nu = 4096;
 44a:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 44f:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 456:	83 ec 0c             	sub    $0xc,%esp
 459:	50                   	push   %eax
 45a:	e8 43 ff ff ff       	call   3a2 <sbrk>
  if(p == (char*)-1)
 45f:	83 c4 10             	add    $0x10,%esp
 462:	83 f8 ff             	cmp    $0xffffffff,%eax
 465:	74 1c                	je     483 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 467:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 46a:	83 c0 08             	add    $0x8,%eax
 46d:	83 ec 0c             	sub    $0xc,%esp
 470:	50                   	push   %eax
 471:	e8 54 ff ff ff       	call   3ca <free>
  return freep;
 476:	a1 8c 08 00 00       	mov    0x88c,%eax
 47b:	83 c4 10             	add    $0x10,%esp
}
 47e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 481:	c9                   	leave  
 482:	c3                   	ret    
    return 0;
 483:	b8 00 00 00 00       	mov    $0x0,%eax
 488:	eb f4                	jmp    47e <morecore+0x44>

0000048a <malloc>:

void*
malloc(uint nbytes)
{
 48a:	55                   	push   %ebp
 48b:	89 e5                	mov    %esp,%ebp
 48d:	53                   	push   %ebx
 48e:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 491:	8b 45 08             	mov    0x8(%ebp),%eax
 494:	8d 58 07             	lea    0x7(%eax),%ebx
 497:	c1 eb 03             	shr    $0x3,%ebx
 49a:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 49d:	8b 0d 8c 08 00 00    	mov    0x88c,%ecx
 4a3:	85 c9                	test   %ecx,%ecx
 4a5:	74 04                	je     4ab <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 4a7:	8b 01                	mov    (%ecx),%eax
 4a9:	eb 4a                	jmp    4f5 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 4ab:	c7 05 8c 08 00 00 90 	movl   $0x890,0x88c
 4b2:	08 00 00 
 4b5:	c7 05 90 08 00 00 90 	movl   $0x890,0x890
 4bc:	08 00 00 
    base.s.size = 0;
 4bf:	c7 05 94 08 00 00 00 	movl   $0x0,0x894
 4c6:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 4c9:	b9 90 08 00 00       	mov    $0x890,%ecx
 4ce:	eb d7                	jmp    4a7 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 4d0:	74 19                	je     4eb <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 4d2:	29 da                	sub    %ebx,%edx
 4d4:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 4d7:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 4da:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 4dd:	89 0d 8c 08 00 00    	mov    %ecx,0x88c
      return (void*)(p + 1);
 4e3:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 4e6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4e9:	c9                   	leave  
 4ea:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 4eb:	8b 10                	mov    (%eax),%edx
 4ed:	89 11                	mov    %edx,(%ecx)
 4ef:	eb ec                	jmp    4dd <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 4f1:	89 c1                	mov    %eax,%ecx
 4f3:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 4f5:	8b 50 04             	mov    0x4(%eax),%edx
 4f8:	39 da                	cmp    %ebx,%edx
 4fa:	73 d4                	jae    4d0 <malloc+0x46>
    if(p == freep)
 4fc:	39 05 8c 08 00 00    	cmp    %eax,0x88c
 502:	75 ed                	jne    4f1 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 504:	89 d8                	mov    %ebx,%eax
 506:	e8 2f ff ff ff       	call   43a <morecore>
 50b:	85 c0                	test   %eax,%eax
 50d:	75 e2                	jne    4f1 <malloc+0x67>
 50f:	eb d5                	jmp    4e6 <malloc+0x5c>
