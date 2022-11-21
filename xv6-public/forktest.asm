
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
   b:	e8 80 01 00 00       	call   190 <strlen>
  10:	83 c4 0c             	add    $0xc,%esp
  13:	50                   	push   %eax
  14:	53                   	push   %ebx
  15:	ff 75 08             	push   0x8(%ebp)
  18:	e8 e6 02 00 00       	call   303 <write>
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
  2c:	68 94 03 00 00       	push   $0x394
  31:	6a 01                	push   $0x1
  33:	e8 c8 ff ff ff       	call   0 <printf>

  for(n=0; n<N; n++){
  38:	83 c4 10             	add    $0x10,%esp
  3b:	bb 00 00 00 00       	mov    $0x0,%ebx
  40:	81 fb e7 03 00 00    	cmp    $0x3e7,%ebx
  46:	7f 15                	jg     5d <forktest+0x38>
    pid = fork();
  48:	e8 8e 02 00 00       	call   2db <fork>
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
  58:	e8 86 02 00 00       	call   2e3 <exit>
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
  69:	e8 7d 02 00 00       	call   2eb <wait>
  6e:	85 c0                	test   %eax,%eax
  70:	78 1e                	js     90 <forktest+0x6b>
  for(; n > 0; n--){
  72:	83 eb 01             	sub    $0x1,%ebx
  75:	eb ee                	jmp    65 <forktest+0x40>
    printf(1, "fork claimed to work N times!\n", N);
  77:	83 ec 04             	sub    $0x4,%esp
  7a:	68 e8 03 00 00       	push   $0x3e8
  7f:	68 d4 03 00 00       	push   $0x3d4
  84:	6a 01                	push   $0x1
  86:	e8 75 ff ff ff       	call   0 <printf>
    exit();
  8b:	e8 53 02 00 00       	call   2e3 <exit>
      printf(1, "wait stopped early\n");
  90:	83 ec 08             	sub    $0x8,%esp
  93:	68 9f 03 00 00       	push   $0x39f
  98:	6a 01                	push   $0x1
  9a:	e8 61 ff ff ff       	call   0 <printf>
      exit();
  9f:	e8 3f 02 00 00       	call   2e3 <exit>
    }
  }

  if(wait() != -1){
  a4:	e8 42 02 00 00       	call   2eb <wait>
  a9:	83 f8 ff             	cmp    $0xffffffff,%eax
  ac:	75 17                	jne    c5 <forktest+0xa0>
    printf(1, "wait got too many\n");
    exit();
  }

  printf(1, "fork test OK\n");
  ae:	83 ec 08             	sub    $0x8,%esp
  b1:	68 c6 03 00 00       	push   $0x3c6
  b6:	6a 01                	push   $0x1
  b8:	e8 43 ff ff ff       	call   0 <printf>
}
  bd:	83 c4 10             	add    $0x10,%esp
  c0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  c3:	c9                   	leave  
  c4:	c3                   	ret    
    printf(1, "wait got too many\n");
  c5:	83 ec 08             	sub    $0x8,%esp
  c8:	68 b3 03 00 00       	push   $0x3b3
  cd:	6a 01                	push   $0x1
  cf:	e8 2c ff ff ff       	call   0 <printf>
    exit();
  d4:	e8 0a 02 00 00       	call   2e3 <exit>

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
  e4:	e8 fa 01 00 00       	call   2e3 <exit>

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

  // I can't remember if there was something else to do here but I'm sure I'll find out


  return new_pid;
}
  fa:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  ff:	c3                   	ret    

00000100 <thread_join>:

int thread_join() {
  return 0;
}
 100:	b8 00 00 00 00       	mov    $0x0,%eax
 105:	c3                   	ret    

00000106 <lock_acquire>:

void lock_acquire(lock_t *lock){
 106:	55                   	push   %ebp
 107:	89 e5                	mov    %esp,%ebp
 109:	53                   	push   %ebx
 10a:	83 ec 04             	sub    $0x4,%esp
 10d:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 110:	83 ec 08             	sub    $0x8,%esp
 113:	6a 01                	push   $0x1
 115:	53                   	push   %ebx
 116:	e8 ce ff ff ff       	call   e9 <test_and_set>
 11b:	83 c4 10             	add    $0x10,%esp
 11e:	83 f8 01             	cmp    $0x1,%eax
 121:	74 ed                	je     110 <lock_acquire+0xa>
    ;
}
 123:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 126:	c9                   	leave  
 127:	c3                   	ret    

00000128 <lock_release>:

void lock_release(lock_t *lock) {
 128:	55                   	push   %ebp
 129:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 12b:	8b 45 08             	mov    0x8(%ebp),%eax
 12e:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 134:	5d                   	pop    %ebp
 135:	c3                   	ret    

00000136 <lock_init>:

void lock_init(lock_t *lock) {
 136:	55                   	push   %ebp
 137:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 139:	8b 45 08             	mov    0x8(%ebp),%eax
 13c:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 142:	5d                   	pop    %ebp
 143:	c3                   	ret    

00000144 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 144:	55                   	push   %ebp
 145:	89 e5                	mov    %esp,%ebp
 147:	56                   	push   %esi
 148:	53                   	push   %ebx
 149:	8b 75 08             	mov    0x8(%ebp),%esi
 14c:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 14f:	89 f0                	mov    %esi,%eax
 151:	89 d1                	mov    %edx,%ecx
 153:	83 c2 01             	add    $0x1,%edx
 156:	89 c3                	mov    %eax,%ebx
 158:	83 c0 01             	add    $0x1,%eax
 15b:	0f b6 09             	movzbl (%ecx),%ecx
 15e:	88 0b                	mov    %cl,(%ebx)
 160:	84 c9                	test   %cl,%cl
 162:	75 ed                	jne    151 <strcpy+0xd>
    ;
  return os;
}
 164:	89 f0                	mov    %esi,%eax
 166:	5b                   	pop    %ebx
 167:	5e                   	pop    %esi
 168:	5d                   	pop    %ebp
 169:	c3                   	ret    

0000016a <strcmp>:

int
strcmp(const char *p, const char *q)
{
 16a:	55                   	push   %ebp
 16b:	89 e5                	mov    %esp,%ebp
 16d:	8b 4d 08             	mov    0x8(%ebp),%ecx
 170:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 173:	eb 06                	jmp    17b <strcmp+0x11>
    p++, q++;
 175:	83 c1 01             	add    $0x1,%ecx
 178:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 17b:	0f b6 01             	movzbl (%ecx),%eax
 17e:	84 c0                	test   %al,%al
 180:	74 04                	je     186 <strcmp+0x1c>
 182:	3a 02                	cmp    (%edx),%al
 184:	74 ef                	je     175 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 186:	0f b6 c0             	movzbl %al,%eax
 189:	0f b6 12             	movzbl (%edx),%edx
 18c:	29 d0                	sub    %edx,%eax
}
 18e:	5d                   	pop    %ebp
 18f:	c3                   	ret    

00000190 <strlen>:

uint
strlen(const char *s)
{
 190:	55                   	push   %ebp
 191:	89 e5                	mov    %esp,%ebp
 193:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 196:	b8 00 00 00 00       	mov    $0x0,%eax
 19b:	eb 03                	jmp    1a0 <strlen+0x10>
 19d:	83 c0 01             	add    $0x1,%eax
 1a0:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 1a4:	75 f7                	jne    19d <strlen+0xd>
    ;
  return n;
}
 1a6:	5d                   	pop    %ebp
 1a7:	c3                   	ret    

000001a8 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1a8:	55                   	push   %ebp
 1a9:	89 e5                	mov    %esp,%ebp
 1ab:	57                   	push   %edi
 1ac:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1af:	89 d7                	mov    %edx,%edi
 1b1:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1b4:	8b 45 0c             	mov    0xc(%ebp),%eax
 1b7:	fc                   	cld    
 1b8:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1ba:	89 d0                	mov    %edx,%eax
 1bc:	8b 7d fc             	mov    -0x4(%ebp),%edi
 1bf:	c9                   	leave  
 1c0:	c3                   	ret    

000001c1 <strchr>:

char*
strchr(const char *s, char c)
{
 1c1:	55                   	push   %ebp
 1c2:	89 e5                	mov    %esp,%ebp
 1c4:	8b 45 08             	mov    0x8(%ebp),%eax
 1c7:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1cb:	eb 03                	jmp    1d0 <strchr+0xf>
 1cd:	83 c0 01             	add    $0x1,%eax
 1d0:	0f b6 10             	movzbl (%eax),%edx
 1d3:	84 d2                	test   %dl,%dl
 1d5:	74 06                	je     1dd <strchr+0x1c>
    if(*s == c)
 1d7:	38 ca                	cmp    %cl,%dl
 1d9:	75 f2                	jne    1cd <strchr+0xc>
 1db:	eb 05                	jmp    1e2 <strchr+0x21>
      return (char*)s;
  return 0;
 1dd:	b8 00 00 00 00       	mov    $0x0,%eax
}
 1e2:	5d                   	pop    %ebp
 1e3:	c3                   	ret    

000001e4 <gets>:

char*
gets(char *buf, int max)
{
 1e4:	55                   	push   %ebp
 1e5:	89 e5                	mov    %esp,%ebp
 1e7:	57                   	push   %edi
 1e8:	56                   	push   %esi
 1e9:	53                   	push   %ebx
 1ea:	83 ec 1c             	sub    $0x1c,%esp
 1ed:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1f0:	bb 00 00 00 00       	mov    $0x0,%ebx
 1f5:	89 de                	mov    %ebx,%esi
 1f7:	83 c3 01             	add    $0x1,%ebx
 1fa:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1fd:	7d 2e                	jge    22d <gets+0x49>
    cc = read(0, &c, 1);
 1ff:	83 ec 04             	sub    $0x4,%esp
 202:	6a 01                	push   $0x1
 204:	8d 45 e7             	lea    -0x19(%ebp),%eax
 207:	50                   	push   %eax
 208:	6a 00                	push   $0x0
 20a:	e8 ec 00 00 00       	call   2fb <read>
    if(cc < 1)
 20f:	83 c4 10             	add    $0x10,%esp
 212:	85 c0                	test   %eax,%eax
 214:	7e 17                	jle    22d <gets+0x49>
      break;
    buf[i++] = c;
 216:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 21a:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 21d:	3c 0a                	cmp    $0xa,%al
 21f:	0f 94 c2             	sete   %dl
 222:	3c 0d                	cmp    $0xd,%al
 224:	0f 94 c0             	sete   %al
 227:	08 c2                	or     %al,%dl
 229:	74 ca                	je     1f5 <gets+0x11>
    buf[i++] = c;
 22b:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 22d:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 231:	89 f8                	mov    %edi,%eax
 233:	8d 65 f4             	lea    -0xc(%ebp),%esp
 236:	5b                   	pop    %ebx
 237:	5e                   	pop    %esi
 238:	5f                   	pop    %edi
 239:	5d                   	pop    %ebp
 23a:	c3                   	ret    

0000023b <stat>:

int
stat(const char *n, struct stat *st)
{
 23b:	55                   	push   %ebp
 23c:	89 e5                	mov    %esp,%ebp
 23e:	56                   	push   %esi
 23f:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 240:	83 ec 08             	sub    $0x8,%esp
 243:	6a 00                	push   $0x0
 245:	ff 75 08             	push   0x8(%ebp)
 248:	e8 d6 00 00 00       	call   323 <open>
  if(fd < 0)
 24d:	83 c4 10             	add    $0x10,%esp
 250:	85 c0                	test   %eax,%eax
 252:	78 24                	js     278 <stat+0x3d>
 254:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 256:	83 ec 08             	sub    $0x8,%esp
 259:	ff 75 0c             	push   0xc(%ebp)
 25c:	50                   	push   %eax
 25d:	e8 d9 00 00 00       	call   33b <fstat>
 262:	89 c6                	mov    %eax,%esi
  close(fd);
 264:	89 1c 24             	mov    %ebx,(%esp)
 267:	e8 9f 00 00 00       	call   30b <close>
  return r;
 26c:	83 c4 10             	add    $0x10,%esp
}
 26f:	89 f0                	mov    %esi,%eax
 271:	8d 65 f8             	lea    -0x8(%ebp),%esp
 274:	5b                   	pop    %ebx
 275:	5e                   	pop    %esi
 276:	5d                   	pop    %ebp
 277:	c3                   	ret    
    return -1;
 278:	be ff ff ff ff       	mov    $0xffffffff,%esi
 27d:	eb f0                	jmp    26f <stat+0x34>

0000027f <atoi>:

int
atoi(const char *s)
{
 27f:	55                   	push   %ebp
 280:	89 e5                	mov    %esp,%ebp
 282:	53                   	push   %ebx
 283:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 286:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 28b:	eb 10                	jmp    29d <atoi+0x1e>
    n = n*10 + *s++ - '0';
 28d:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 290:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 293:	83 c1 01             	add    $0x1,%ecx
 296:	0f be c0             	movsbl %al,%eax
 299:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 29d:	0f b6 01             	movzbl (%ecx),%eax
 2a0:	8d 58 d0             	lea    -0x30(%eax),%ebx
 2a3:	80 fb 09             	cmp    $0x9,%bl
 2a6:	76 e5                	jbe    28d <atoi+0xe>
  return n;
}
 2a8:	89 d0                	mov    %edx,%eax
 2aa:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2ad:	c9                   	leave  
 2ae:	c3                   	ret    

000002af <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2af:	55                   	push   %ebp
 2b0:	89 e5                	mov    %esp,%ebp
 2b2:	56                   	push   %esi
 2b3:	53                   	push   %ebx
 2b4:	8b 75 08             	mov    0x8(%ebp),%esi
 2b7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 2ba:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 2bd:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 2bf:	eb 0d                	jmp    2ce <memmove+0x1f>
    *dst++ = *src++;
 2c1:	0f b6 01             	movzbl (%ecx),%eax
 2c4:	88 02                	mov    %al,(%edx)
 2c6:	8d 49 01             	lea    0x1(%ecx),%ecx
 2c9:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 2cc:	89 d8                	mov    %ebx,%eax
 2ce:	8d 58 ff             	lea    -0x1(%eax),%ebx
 2d1:	85 c0                	test   %eax,%eax
 2d3:	7f ec                	jg     2c1 <memmove+0x12>
  return vdst;
}
 2d5:	89 f0                	mov    %esi,%eax
 2d7:	5b                   	pop    %ebx
 2d8:	5e                   	pop    %esi
 2d9:	5d                   	pop    %ebp
 2da:	c3                   	ret    

000002db <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2db:	b8 01 00 00 00       	mov    $0x1,%eax
 2e0:	cd 40                	int    $0x40
 2e2:	c3                   	ret    

000002e3 <exit>:
SYSCALL(exit)
 2e3:	b8 02 00 00 00       	mov    $0x2,%eax
 2e8:	cd 40                	int    $0x40
 2ea:	c3                   	ret    

000002eb <wait>:
SYSCALL(wait)
 2eb:	b8 03 00 00 00       	mov    $0x3,%eax
 2f0:	cd 40                	int    $0x40
 2f2:	c3                   	ret    

000002f3 <pipe>:
SYSCALL(pipe)
 2f3:	b8 04 00 00 00       	mov    $0x4,%eax
 2f8:	cd 40                	int    $0x40
 2fa:	c3                   	ret    

000002fb <read>:
SYSCALL(read)
 2fb:	b8 05 00 00 00       	mov    $0x5,%eax
 300:	cd 40                	int    $0x40
 302:	c3                   	ret    

00000303 <write>:
SYSCALL(write)
 303:	b8 10 00 00 00       	mov    $0x10,%eax
 308:	cd 40                	int    $0x40
 30a:	c3                   	ret    

0000030b <close>:
SYSCALL(close)
 30b:	b8 15 00 00 00       	mov    $0x15,%eax
 310:	cd 40                	int    $0x40
 312:	c3                   	ret    

00000313 <kill>:
SYSCALL(kill)
 313:	b8 06 00 00 00       	mov    $0x6,%eax
 318:	cd 40                	int    $0x40
 31a:	c3                   	ret    

0000031b <exec>:
SYSCALL(exec)
 31b:	b8 07 00 00 00       	mov    $0x7,%eax
 320:	cd 40                	int    $0x40
 322:	c3                   	ret    

00000323 <open>:
SYSCALL(open)
 323:	b8 0f 00 00 00       	mov    $0xf,%eax
 328:	cd 40                	int    $0x40
 32a:	c3                   	ret    

0000032b <mknod>:
SYSCALL(mknod)
 32b:	b8 11 00 00 00       	mov    $0x11,%eax
 330:	cd 40                	int    $0x40
 332:	c3                   	ret    

00000333 <unlink>:
SYSCALL(unlink)
 333:	b8 12 00 00 00       	mov    $0x12,%eax
 338:	cd 40                	int    $0x40
 33a:	c3                   	ret    

0000033b <fstat>:
SYSCALL(fstat)
 33b:	b8 08 00 00 00       	mov    $0x8,%eax
 340:	cd 40                	int    $0x40
 342:	c3                   	ret    

00000343 <link>:
SYSCALL(link)
 343:	b8 13 00 00 00       	mov    $0x13,%eax
 348:	cd 40                	int    $0x40
 34a:	c3                   	ret    

0000034b <mkdir>:
SYSCALL(mkdir)
 34b:	b8 14 00 00 00       	mov    $0x14,%eax
 350:	cd 40                	int    $0x40
 352:	c3                   	ret    

00000353 <chdir>:
SYSCALL(chdir)
 353:	b8 09 00 00 00       	mov    $0x9,%eax
 358:	cd 40                	int    $0x40
 35a:	c3                   	ret    

0000035b <dup>:
SYSCALL(dup)
 35b:	b8 0a 00 00 00       	mov    $0xa,%eax
 360:	cd 40                	int    $0x40
 362:	c3                   	ret    

00000363 <getpid>:
SYSCALL(getpid)
 363:	b8 0b 00 00 00       	mov    $0xb,%eax
 368:	cd 40                	int    $0x40
 36a:	c3                   	ret    

0000036b <sbrk>:
SYSCALL(sbrk)
 36b:	b8 0c 00 00 00       	mov    $0xc,%eax
 370:	cd 40                	int    $0x40
 372:	c3                   	ret    

00000373 <sleep>:
SYSCALL(sleep)
 373:	b8 0d 00 00 00       	mov    $0xd,%eax
 378:	cd 40                	int    $0x40
 37a:	c3                   	ret    

0000037b <uptime>:
SYSCALL(uptime)
 37b:	b8 0e 00 00 00       	mov    $0xe,%eax
 380:	cd 40                	int    $0x40
 382:	c3                   	ret    

00000383 <clone>:
SYSCALL(clone)
 383:	b8 16 00 00 00       	mov    $0x16,%eax
 388:	cd 40                	int    $0x40
 38a:	c3                   	ret    

0000038b <join>:
 38b:	b8 17 00 00 00       	mov    $0x17,%eax
 390:	cd 40                	int    $0x40
 392:	c3                   	ret    
