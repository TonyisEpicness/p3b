
_init:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

char *argv[] = { "sh", 0 };

int
main(void)
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	53                   	push   %ebx
   e:	51                   	push   %ecx
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
   f:	83 ec 08             	sub    $0x8,%esp
  12:	6a 02                	push   $0x2
  14:	68 dc 06 00 00       	push   $0x6dc
  19:	e8 f9 02 00 00       	call   317 <open>
  1e:	83 c4 10             	add    $0x10,%esp
  21:	85 c0                	test   %eax,%eax
  23:	78 1b                	js     40 <main+0x40>
    mknod("console", 1, 1);
    open("console", O_RDWR);
  }
  dup(0);  // stdout
  25:	83 ec 0c             	sub    $0xc,%esp
  28:	6a 00                	push   $0x0
  2a:	e8 20 03 00 00       	call   34f <dup>
  dup(0);  // stderr
  2f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  36:	e8 14 03 00 00       	call   34f <dup>
  3b:	83 c4 10             	add    $0x10,%esp
  3e:	eb 58                	jmp    98 <main+0x98>
    mknod("console", 1, 1);
  40:	83 ec 04             	sub    $0x4,%esp
  43:	6a 01                	push   $0x1
  45:	6a 01                	push   $0x1
  47:	68 dc 06 00 00       	push   $0x6dc
  4c:	e8 ce 02 00 00       	call   31f <mknod>
    open("console", O_RDWR);
  51:	83 c4 08             	add    $0x8,%esp
  54:	6a 02                	push   $0x2
  56:	68 dc 06 00 00       	push   $0x6dc
  5b:	e8 b7 02 00 00       	call   317 <open>
  60:	83 c4 10             	add    $0x10,%esp
  63:	eb c0                	jmp    25 <main+0x25>

  for(;;){
    printf(1, "init: starting sh\n");
    pid = fork();
    if(pid < 0){
      printf(1, "init: fork failed\n");
  65:	83 ec 08             	sub    $0x8,%esp
  68:	68 f7 06 00 00       	push   $0x6f7
  6d:	6a 01                	push   $0x1
  6f:	e8 b8 03 00 00       	call   42c <printf>
      exit();
  74:	e8 5e 02 00 00       	call   2d7 <exit>
      exec("sh", argv);
      printf(1, "init: exec sh failed\n");
      exit();
    }
    while((wpid=wait()) >= 0 && wpid != pid)
      printf(1, "zombie!\n");
  79:	83 ec 08             	sub    $0x8,%esp
  7c:	68 23 07 00 00       	push   $0x723
  81:	6a 01                	push   $0x1
  83:	e8 a4 03 00 00       	call   42c <printf>
  88:	83 c4 10             	add    $0x10,%esp
    while((wpid=wait()) >= 0 && wpid != pid)
  8b:	e8 4f 02 00 00       	call   2df <wait>
  90:	85 c0                	test   %eax,%eax
  92:	78 04                	js     98 <main+0x98>
  94:	39 c3                	cmp    %eax,%ebx
  96:	75 e1                	jne    79 <main+0x79>
    printf(1, "init: starting sh\n");
  98:	83 ec 08             	sub    $0x8,%esp
  9b:	68 e4 06 00 00       	push   $0x6e4
  a0:	6a 01                	push   $0x1
  a2:	e8 85 03 00 00       	call   42c <printf>
    pid = fork();
  a7:	e8 23 02 00 00       	call   2cf <fork>
  ac:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
  ae:	83 c4 10             	add    $0x10,%esp
  b1:	85 c0                	test   %eax,%eax
  b3:	78 b0                	js     65 <main+0x65>
    if(pid == 0){
  b5:	75 d4                	jne    8b <main+0x8b>
      exec("sh", argv);
  b7:	83 ec 08             	sub    $0x8,%esp
  ba:	68 dc 0a 00 00       	push   $0xadc
  bf:	68 0a 07 00 00       	push   $0x70a
  c4:	e8 46 02 00 00       	call   30f <exec>
      printf(1, "init: exec sh failed\n");
  c9:	83 c4 08             	add    $0x8,%esp
  cc:	68 0d 07 00 00       	push   $0x70d
  d1:	6a 01                	push   $0x1
  d3:	e8 54 03 00 00       	call   42c <printf>
      exit();
  d8:	e8 fa 01 00 00       	call   2d7 <exit>

000000dd <test_and_set>:
#include "fcntl.h"
#include "user.h"
#include "x86.h"
#include "mmu.h"

int test_and_set(int *old_ptr, int new_ptr) {
  dd:	55                   	push   %ebp
  de:	89 e5                	mov    %esp,%ebp
  e0:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *old_ptr;
  e3:	8b 10                	mov    (%eax),%edx
  *old_ptr = new_ptr;
  e5:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  e8:	89 08                	mov    %ecx,(%eax)
  return old;
}
  ea:	89 d0                	mov    %edx,%eax
  ec:	5d                   	pop    %ebp
  ed:	c3                   	ret    

000000ee <thread_create>:

  // I can't remember if there was something else to do here but I'm sure I'll find out


  return new_pid;
}
  ee:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  f3:	c3                   	ret    

000000f4 <thread_join>:

int thread_join() {
  return 0;
}
  f4:	b8 00 00 00 00       	mov    $0x0,%eax
  f9:	c3                   	ret    

000000fa <lock_acquire>:

void lock_acquire(lock_t *lock){
  fa:	55                   	push   %ebp
  fb:	89 e5                	mov    %esp,%ebp
  fd:	53                   	push   %ebx
  fe:	83 ec 04             	sub    $0x4,%esp
 101:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 104:	83 ec 08             	sub    $0x8,%esp
 107:	6a 01                	push   $0x1
 109:	53                   	push   %ebx
 10a:	e8 ce ff ff ff       	call   dd <test_and_set>
 10f:	83 c4 10             	add    $0x10,%esp
 112:	83 f8 01             	cmp    $0x1,%eax
 115:	74 ed                	je     104 <lock_acquire+0xa>
    ;
}
 117:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 11a:	c9                   	leave  
 11b:	c3                   	ret    

0000011c <lock_release>:

void lock_release(lock_t *lock) {
 11c:	55                   	push   %ebp
 11d:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 11f:	8b 45 08             	mov    0x8(%ebp),%eax
 122:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 128:	5d                   	pop    %ebp
 129:	c3                   	ret    

0000012a <lock_init>:

void lock_init(lock_t *lock) {
 12a:	55                   	push   %ebp
 12b:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 12d:	8b 45 08             	mov    0x8(%ebp),%eax
 130:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 136:	5d                   	pop    %ebp
 137:	c3                   	ret    

00000138 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 138:	55                   	push   %ebp
 139:	89 e5                	mov    %esp,%ebp
 13b:	56                   	push   %esi
 13c:	53                   	push   %ebx
 13d:	8b 75 08             	mov    0x8(%ebp),%esi
 140:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 143:	89 f0                	mov    %esi,%eax
 145:	89 d1                	mov    %edx,%ecx
 147:	83 c2 01             	add    $0x1,%edx
 14a:	89 c3                	mov    %eax,%ebx
 14c:	83 c0 01             	add    $0x1,%eax
 14f:	0f b6 09             	movzbl (%ecx),%ecx
 152:	88 0b                	mov    %cl,(%ebx)
 154:	84 c9                	test   %cl,%cl
 156:	75 ed                	jne    145 <strcpy+0xd>
    ;
  return os;
}
 158:	89 f0                	mov    %esi,%eax
 15a:	5b                   	pop    %ebx
 15b:	5e                   	pop    %esi
 15c:	5d                   	pop    %ebp
 15d:	c3                   	ret    

0000015e <strcmp>:

int
strcmp(const char *p, const char *q)
{
 15e:	55                   	push   %ebp
 15f:	89 e5                	mov    %esp,%ebp
 161:	8b 4d 08             	mov    0x8(%ebp),%ecx
 164:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 167:	eb 06                	jmp    16f <strcmp+0x11>
    p++, q++;
 169:	83 c1 01             	add    $0x1,%ecx
 16c:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 16f:	0f b6 01             	movzbl (%ecx),%eax
 172:	84 c0                	test   %al,%al
 174:	74 04                	je     17a <strcmp+0x1c>
 176:	3a 02                	cmp    (%edx),%al
 178:	74 ef                	je     169 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 17a:	0f b6 c0             	movzbl %al,%eax
 17d:	0f b6 12             	movzbl (%edx),%edx
 180:	29 d0                	sub    %edx,%eax
}
 182:	5d                   	pop    %ebp
 183:	c3                   	ret    

00000184 <strlen>:

uint
strlen(const char *s)
{
 184:	55                   	push   %ebp
 185:	89 e5                	mov    %esp,%ebp
 187:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 18a:	b8 00 00 00 00       	mov    $0x0,%eax
 18f:	eb 03                	jmp    194 <strlen+0x10>
 191:	83 c0 01             	add    $0x1,%eax
 194:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 198:	75 f7                	jne    191 <strlen+0xd>
    ;
  return n;
}
 19a:	5d                   	pop    %ebp
 19b:	c3                   	ret    

0000019c <memset>:

void*
memset(void *dst, int c, uint n)
{
 19c:	55                   	push   %ebp
 19d:	89 e5                	mov    %esp,%ebp
 19f:	57                   	push   %edi
 1a0:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1a3:	89 d7                	mov    %edx,%edi
 1a5:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1a8:	8b 45 0c             	mov    0xc(%ebp),%eax
 1ab:	fc                   	cld    
 1ac:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1ae:	89 d0                	mov    %edx,%eax
 1b0:	8b 7d fc             	mov    -0x4(%ebp),%edi
 1b3:	c9                   	leave  
 1b4:	c3                   	ret    

000001b5 <strchr>:

char*
strchr(const char *s, char c)
{
 1b5:	55                   	push   %ebp
 1b6:	89 e5                	mov    %esp,%ebp
 1b8:	8b 45 08             	mov    0x8(%ebp),%eax
 1bb:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1bf:	eb 03                	jmp    1c4 <strchr+0xf>
 1c1:	83 c0 01             	add    $0x1,%eax
 1c4:	0f b6 10             	movzbl (%eax),%edx
 1c7:	84 d2                	test   %dl,%dl
 1c9:	74 06                	je     1d1 <strchr+0x1c>
    if(*s == c)
 1cb:	38 ca                	cmp    %cl,%dl
 1cd:	75 f2                	jne    1c1 <strchr+0xc>
 1cf:	eb 05                	jmp    1d6 <strchr+0x21>
      return (char*)s;
  return 0;
 1d1:	b8 00 00 00 00       	mov    $0x0,%eax
}
 1d6:	5d                   	pop    %ebp
 1d7:	c3                   	ret    

000001d8 <gets>:

char*
gets(char *buf, int max)
{
 1d8:	55                   	push   %ebp
 1d9:	89 e5                	mov    %esp,%ebp
 1db:	57                   	push   %edi
 1dc:	56                   	push   %esi
 1dd:	53                   	push   %ebx
 1de:	83 ec 1c             	sub    $0x1c,%esp
 1e1:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1e4:	bb 00 00 00 00       	mov    $0x0,%ebx
 1e9:	89 de                	mov    %ebx,%esi
 1eb:	83 c3 01             	add    $0x1,%ebx
 1ee:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1f1:	7d 2e                	jge    221 <gets+0x49>
    cc = read(0, &c, 1);
 1f3:	83 ec 04             	sub    $0x4,%esp
 1f6:	6a 01                	push   $0x1
 1f8:	8d 45 e7             	lea    -0x19(%ebp),%eax
 1fb:	50                   	push   %eax
 1fc:	6a 00                	push   $0x0
 1fe:	e8 ec 00 00 00       	call   2ef <read>
    if(cc < 1)
 203:	83 c4 10             	add    $0x10,%esp
 206:	85 c0                	test   %eax,%eax
 208:	7e 17                	jle    221 <gets+0x49>
      break;
    buf[i++] = c;
 20a:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 20e:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 211:	3c 0a                	cmp    $0xa,%al
 213:	0f 94 c2             	sete   %dl
 216:	3c 0d                	cmp    $0xd,%al
 218:	0f 94 c0             	sete   %al
 21b:	08 c2                	or     %al,%dl
 21d:	74 ca                	je     1e9 <gets+0x11>
    buf[i++] = c;
 21f:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 221:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 225:	89 f8                	mov    %edi,%eax
 227:	8d 65 f4             	lea    -0xc(%ebp),%esp
 22a:	5b                   	pop    %ebx
 22b:	5e                   	pop    %esi
 22c:	5f                   	pop    %edi
 22d:	5d                   	pop    %ebp
 22e:	c3                   	ret    

0000022f <stat>:

int
stat(const char *n, struct stat *st)
{
 22f:	55                   	push   %ebp
 230:	89 e5                	mov    %esp,%ebp
 232:	56                   	push   %esi
 233:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 234:	83 ec 08             	sub    $0x8,%esp
 237:	6a 00                	push   $0x0
 239:	ff 75 08             	push   0x8(%ebp)
 23c:	e8 d6 00 00 00       	call   317 <open>
  if(fd < 0)
 241:	83 c4 10             	add    $0x10,%esp
 244:	85 c0                	test   %eax,%eax
 246:	78 24                	js     26c <stat+0x3d>
 248:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 24a:	83 ec 08             	sub    $0x8,%esp
 24d:	ff 75 0c             	push   0xc(%ebp)
 250:	50                   	push   %eax
 251:	e8 d9 00 00 00       	call   32f <fstat>
 256:	89 c6                	mov    %eax,%esi
  close(fd);
 258:	89 1c 24             	mov    %ebx,(%esp)
 25b:	e8 9f 00 00 00       	call   2ff <close>
  return r;
 260:	83 c4 10             	add    $0x10,%esp
}
 263:	89 f0                	mov    %esi,%eax
 265:	8d 65 f8             	lea    -0x8(%ebp),%esp
 268:	5b                   	pop    %ebx
 269:	5e                   	pop    %esi
 26a:	5d                   	pop    %ebp
 26b:	c3                   	ret    
    return -1;
 26c:	be ff ff ff ff       	mov    $0xffffffff,%esi
 271:	eb f0                	jmp    263 <stat+0x34>

00000273 <atoi>:

int
atoi(const char *s)
{
 273:	55                   	push   %ebp
 274:	89 e5                	mov    %esp,%ebp
 276:	53                   	push   %ebx
 277:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 27a:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 27f:	eb 10                	jmp    291 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 281:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 284:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 287:	83 c1 01             	add    $0x1,%ecx
 28a:	0f be c0             	movsbl %al,%eax
 28d:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 291:	0f b6 01             	movzbl (%ecx),%eax
 294:	8d 58 d0             	lea    -0x30(%eax),%ebx
 297:	80 fb 09             	cmp    $0x9,%bl
 29a:	76 e5                	jbe    281 <atoi+0xe>
  return n;
}
 29c:	89 d0                	mov    %edx,%eax
 29e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2a1:	c9                   	leave  
 2a2:	c3                   	ret    

000002a3 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2a3:	55                   	push   %ebp
 2a4:	89 e5                	mov    %esp,%ebp
 2a6:	56                   	push   %esi
 2a7:	53                   	push   %ebx
 2a8:	8b 75 08             	mov    0x8(%ebp),%esi
 2ab:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 2ae:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 2b1:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 2b3:	eb 0d                	jmp    2c2 <memmove+0x1f>
    *dst++ = *src++;
 2b5:	0f b6 01             	movzbl (%ecx),%eax
 2b8:	88 02                	mov    %al,(%edx)
 2ba:	8d 49 01             	lea    0x1(%ecx),%ecx
 2bd:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 2c0:	89 d8                	mov    %ebx,%eax
 2c2:	8d 58 ff             	lea    -0x1(%eax),%ebx
 2c5:	85 c0                	test   %eax,%eax
 2c7:	7f ec                	jg     2b5 <memmove+0x12>
  return vdst;
}
 2c9:	89 f0                	mov    %esi,%eax
 2cb:	5b                   	pop    %ebx
 2cc:	5e                   	pop    %esi
 2cd:	5d                   	pop    %ebp
 2ce:	c3                   	ret    

000002cf <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2cf:	b8 01 00 00 00       	mov    $0x1,%eax
 2d4:	cd 40                	int    $0x40
 2d6:	c3                   	ret    

000002d7 <exit>:
SYSCALL(exit)
 2d7:	b8 02 00 00 00       	mov    $0x2,%eax
 2dc:	cd 40                	int    $0x40
 2de:	c3                   	ret    

000002df <wait>:
SYSCALL(wait)
 2df:	b8 03 00 00 00       	mov    $0x3,%eax
 2e4:	cd 40                	int    $0x40
 2e6:	c3                   	ret    

000002e7 <pipe>:
SYSCALL(pipe)
 2e7:	b8 04 00 00 00       	mov    $0x4,%eax
 2ec:	cd 40                	int    $0x40
 2ee:	c3                   	ret    

000002ef <read>:
SYSCALL(read)
 2ef:	b8 05 00 00 00       	mov    $0x5,%eax
 2f4:	cd 40                	int    $0x40
 2f6:	c3                   	ret    

000002f7 <write>:
SYSCALL(write)
 2f7:	b8 10 00 00 00       	mov    $0x10,%eax
 2fc:	cd 40                	int    $0x40
 2fe:	c3                   	ret    

000002ff <close>:
SYSCALL(close)
 2ff:	b8 15 00 00 00       	mov    $0x15,%eax
 304:	cd 40                	int    $0x40
 306:	c3                   	ret    

00000307 <kill>:
SYSCALL(kill)
 307:	b8 06 00 00 00       	mov    $0x6,%eax
 30c:	cd 40                	int    $0x40
 30e:	c3                   	ret    

0000030f <exec>:
SYSCALL(exec)
 30f:	b8 07 00 00 00       	mov    $0x7,%eax
 314:	cd 40                	int    $0x40
 316:	c3                   	ret    

00000317 <open>:
SYSCALL(open)
 317:	b8 0f 00 00 00       	mov    $0xf,%eax
 31c:	cd 40                	int    $0x40
 31e:	c3                   	ret    

0000031f <mknod>:
SYSCALL(mknod)
 31f:	b8 11 00 00 00       	mov    $0x11,%eax
 324:	cd 40                	int    $0x40
 326:	c3                   	ret    

00000327 <unlink>:
SYSCALL(unlink)
 327:	b8 12 00 00 00       	mov    $0x12,%eax
 32c:	cd 40                	int    $0x40
 32e:	c3                   	ret    

0000032f <fstat>:
SYSCALL(fstat)
 32f:	b8 08 00 00 00       	mov    $0x8,%eax
 334:	cd 40                	int    $0x40
 336:	c3                   	ret    

00000337 <link>:
SYSCALL(link)
 337:	b8 13 00 00 00       	mov    $0x13,%eax
 33c:	cd 40                	int    $0x40
 33e:	c3                   	ret    

0000033f <mkdir>:
SYSCALL(mkdir)
 33f:	b8 14 00 00 00       	mov    $0x14,%eax
 344:	cd 40                	int    $0x40
 346:	c3                   	ret    

00000347 <chdir>:
SYSCALL(chdir)
 347:	b8 09 00 00 00       	mov    $0x9,%eax
 34c:	cd 40                	int    $0x40
 34e:	c3                   	ret    

0000034f <dup>:
SYSCALL(dup)
 34f:	b8 0a 00 00 00       	mov    $0xa,%eax
 354:	cd 40                	int    $0x40
 356:	c3                   	ret    

00000357 <getpid>:
SYSCALL(getpid)
 357:	b8 0b 00 00 00       	mov    $0xb,%eax
 35c:	cd 40                	int    $0x40
 35e:	c3                   	ret    

0000035f <sbrk>:
SYSCALL(sbrk)
 35f:	b8 0c 00 00 00       	mov    $0xc,%eax
 364:	cd 40                	int    $0x40
 366:	c3                   	ret    

00000367 <sleep>:
SYSCALL(sleep)
 367:	b8 0d 00 00 00       	mov    $0xd,%eax
 36c:	cd 40                	int    $0x40
 36e:	c3                   	ret    

0000036f <uptime>:
SYSCALL(uptime)
 36f:	b8 0e 00 00 00       	mov    $0xe,%eax
 374:	cd 40                	int    $0x40
 376:	c3                   	ret    

00000377 <clone>:
SYSCALL(clone)
 377:	b8 16 00 00 00       	mov    $0x16,%eax
 37c:	cd 40                	int    $0x40
 37e:	c3                   	ret    

0000037f <join>:
 37f:	b8 17 00 00 00       	mov    $0x17,%eax
 384:	cd 40                	int    $0x40
 386:	c3                   	ret    

00000387 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 387:	55                   	push   %ebp
 388:	89 e5                	mov    %esp,%ebp
 38a:	83 ec 1c             	sub    $0x1c,%esp
 38d:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 390:	6a 01                	push   $0x1
 392:	8d 55 f4             	lea    -0xc(%ebp),%edx
 395:	52                   	push   %edx
 396:	50                   	push   %eax
 397:	e8 5b ff ff ff       	call   2f7 <write>
}
 39c:	83 c4 10             	add    $0x10,%esp
 39f:	c9                   	leave  
 3a0:	c3                   	ret    

000003a1 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 3a1:	55                   	push   %ebp
 3a2:	89 e5                	mov    %esp,%ebp
 3a4:	57                   	push   %edi
 3a5:	56                   	push   %esi
 3a6:	53                   	push   %ebx
 3a7:	83 ec 2c             	sub    $0x2c,%esp
 3aa:	89 45 d0             	mov    %eax,-0x30(%ebp)
 3ad:	89 d0                	mov    %edx,%eax
 3af:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 3b1:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 3b5:	0f 95 c1             	setne  %cl
 3b8:	c1 ea 1f             	shr    $0x1f,%edx
 3bb:	84 d1                	test   %dl,%cl
 3bd:	74 44                	je     403 <printint+0x62>
    neg = 1;
    x = -xx;
 3bf:	f7 d8                	neg    %eax
 3c1:	89 c1                	mov    %eax,%ecx
    neg = 1;
 3c3:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 3ca:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 3cf:	89 c8                	mov    %ecx,%eax
 3d1:	ba 00 00 00 00       	mov    $0x0,%edx
 3d6:	f7 f6                	div    %esi
 3d8:	89 df                	mov    %ebx,%edi
 3da:	83 c3 01             	add    $0x1,%ebx
 3dd:	0f b6 92 8c 07 00 00 	movzbl 0x78c(%edx),%edx
 3e4:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 3e8:	89 ca                	mov    %ecx,%edx
 3ea:	89 c1                	mov    %eax,%ecx
 3ec:	39 d6                	cmp    %edx,%esi
 3ee:	76 df                	jbe    3cf <printint+0x2e>
  if(neg)
 3f0:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 3f4:	74 31                	je     427 <printint+0x86>
    buf[i++] = '-';
 3f6:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 3fb:	8d 5f 02             	lea    0x2(%edi),%ebx
 3fe:	8b 75 d0             	mov    -0x30(%ebp),%esi
 401:	eb 17                	jmp    41a <printint+0x79>
    x = xx;
 403:	89 c1                	mov    %eax,%ecx
  neg = 0;
 405:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 40c:	eb bc                	jmp    3ca <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 40e:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 413:	89 f0                	mov    %esi,%eax
 415:	e8 6d ff ff ff       	call   387 <putc>
  while(--i >= 0)
 41a:	83 eb 01             	sub    $0x1,%ebx
 41d:	79 ef                	jns    40e <printint+0x6d>
}
 41f:	83 c4 2c             	add    $0x2c,%esp
 422:	5b                   	pop    %ebx
 423:	5e                   	pop    %esi
 424:	5f                   	pop    %edi
 425:	5d                   	pop    %ebp
 426:	c3                   	ret    
 427:	8b 75 d0             	mov    -0x30(%ebp),%esi
 42a:	eb ee                	jmp    41a <printint+0x79>

0000042c <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 42c:	55                   	push   %ebp
 42d:	89 e5                	mov    %esp,%ebp
 42f:	57                   	push   %edi
 430:	56                   	push   %esi
 431:	53                   	push   %ebx
 432:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 435:	8d 45 10             	lea    0x10(%ebp),%eax
 438:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 43b:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 440:	bb 00 00 00 00       	mov    $0x0,%ebx
 445:	eb 14                	jmp    45b <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 447:	89 fa                	mov    %edi,%edx
 449:	8b 45 08             	mov    0x8(%ebp),%eax
 44c:	e8 36 ff ff ff       	call   387 <putc>
 451:	eb 05                	jmp    458 <printf+0x2c>
      }
    } else if(state == '%'){
 453:	83 fe 25             	cmp    $0x25,%esi
 456:	74 25                	je     47d <printf+0x51>
  for(i = 0; fmt[i]; i++){
 458:	83 c3 01             	add    $0x1,%ebx
 45b:	8b 45 0c             	mov    0xc(%ebp),%eax
 45e:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 462:	84 c0                	test   %al,%al
 464:	0f 84 20 01 00 00    	je     58a <printf+0x15e>
    c = fmt[i] & 0xff;
 46a:	0f be f8             	movsbl %al,%edi
 46d:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 470:	85 f6                	test   %esi,%esi
 472:	75 df                	jne    453 <printf+0x27>
      if(c == '%'){
 474:	83 f8 25             	cmp    $0x25,%eax
 477:	75 ce                	jne    447 <printf+0x1b>
        state = '%';
 479:	89 c6                	mov    %eax,%esi
 47b:	eb db                	jmp    458 <printf+0x2c>
      if(c == 'd'){
 47d:	83 f8 25             	cmp    $0x25,%eax
 480:	0f 84 cf 00 00 00    	je     555 <printf+0x129>
 486:	0f 8c dd 00 00 00    	jl     569 <printf+0x13d>
 48c:	83 f8 78             	cmp    $0x78,%eax
 48f:	0f 8f d4 00 00 00    	jg     569 <printf+0x13d>
 495:	83 f8 63             	cmp    $0x63,%eax
 498:	0f 8c cb 00 00 00    	jl     569 <printf+0x13d>
 49e:	83 e8 63             	sub    $0x63,%eax
 4a1:	83 f8 15             	cmp    $0x15,%eax
 4a4:	0f 87 bf 00 00 00    	ja     569 <printf+0x13d>
 4aa:	ff 24 85 34 07 00 00 	jmp    *0x734(,%eax,4)
        printint(fd, *ap, 10, 1);
 4b1:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4b4:	8b 17                	mov    (%edi),%edx
 4b6:	83 ec 0c             	sub    $0xc,%esp
 4b9:	6a 01                	push   $0x1
 4bb:	b9 0a 00 00 00       	mov    $0xa,%ecx
 4c0:	8b 45 08             	mov    0x8(%ebp),%eax
 4c3:	e8 d9 fe ff ff       	call   3a1 <printint>
        ap++;
 4c8:	83 c7 04             	add    $0x4,%edi
 4cb:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 4ce:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 4d1:	be 00 00 00 00       	mov    $0x0,%esi
 4d6:	eb 80                	jmp    458 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 4d8:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4db:	8b 17                	mov    (%edi),%edx
 4dd:	83 ec 0c             	sub    $0xc,%esp
 4e0:	6a 00                	push   $0x0
 4e2:	b9 10 00 00 00       	mov    $0x10,%ecx
 4e7:	8b 45 08             	mov    0x8(%ebp),%eax
 4ea:	e8 b2 fe ff ff       	call   3a1 <printint>
        ap++;
 4ef:	83 c7 04             	add    $0x4,%edi
 4f2:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 4f5:	83 c4 10             	add    $0x10,%esp
      state = 0;
 4f8:	be 00 00 00 00       	mov    $0x0,%esi
 4fd:	e9 56 ff ff ff       	jmp    458 <printf+0x2c>
        s = (char*)*ap;
 502:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 505:	8b 30                	mov    (%eax),%esi
        ap++;
 507:	83 c0 04             	add    $0x4,%eax
 50a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 50d:	85 f6                	test   %esi,%esi
 50f:	75 15                	jne    526 <printf+0xfa>
          s = "(null)";
 511:	be 2c 07 00 00       	mov    $0x72c,%esi
 516:	eb 0e                	jmp    526 <printf+0xfa>
          putc(fd, *s);
 518:	0f be d2             	movsbl %dl,%edx
 51b:	8b 45 08             	mov    0x8(%ebp),%eax
 51e:	e8 64 fe ff ff       	call   387 <putc>
          s++;
 523:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 526:	0f b6 16             	movzbl (%esi),%edx
 529:	84 d2                	test   %dl,%dl
 52b:	75 eb                	jne    518 <printf+0xec>
      state = 0;
 52d:	be 00 00 00 00       	mov    $0x0,%esi
 532:	e9 21 ff ff ff       	jmp    458 <printf+0x2c>
        putc(fd, *ap);
 537:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 53a:	0f be 17             	movsbl (%edi),%edx
 53d:	8b 45 08             	mov    0x8(%ebp),%eax
 540:	e8 42 fe ff ff       	call   387 <putc>
        ap++;
 545:	83 c7 04             	add    $0x4,%edi
 548:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 54b:	be 00 00 00 00       	mov    $0x0,%esi
 550:	e9 03 ff ff ff       	jmp    458 <printf+0x2c>
        putc(fd, c);
 555:	89 fa                	mov    %edi,%edx
 557:	8b 45 08             	mov    0x8(%ebp),%eax
 55a:	e8 28 fe ff ff       	call   387 <putc>
      state = 0;
 55f:	be 00 00 00 00       	mov    $0x0,%esi
 564:	e9 ef fe ff ff       	jmp    458 <printf+0x2c>
        putc(fd, '%');
 569:	ba 25 00 00 00       	mov    $0x25,%edx
 56e:	8b 45 08             	mov    0x8(%ebp),%eax
 571:	e8 11 fe ff ff       	call   387 <putc>
        putc(fd, c);
 576:	89 fa                	mov    %edi,%edx
 578:	8b 45 08             	mov    0x8(%ebp),%eax
 57b:	e8 07 fe ff ff       	call   387 <putc>
      state = 0;
 580:	be 00 00 00 00       	mov    $0x0,%esi
 585:	e9 ce fe ff ff       	jmp    458 <printf+0x2c>
    }
  }
}
 58a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 58d:	5b                   	pop    %ebx
 58e:	5e                   	pop    %esi
 58f:	5f                   	pop    %edi
 590:	5d                   	pop    %ebp
 591:	c3                   	ret    

00000592 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 592:	55                   	push   %ebp
 593:	89 e5                	mov    %esp,%ebp
 595:	57                   	push   %edi
 596:	56                   	push   %esi
 597:	53                   	push   %ebx
 598:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 59b:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 59e:	a1 e4 0a 00 00       	mov    0xae4,%eax
 5a3:	eb 02                	jmp    5a7 <free+0x15>
 5a5:	89 d0                	mov    %edx,%eax
 5a7:	39 c8                	cmp    %ecx,%eax
 5a9:	73 04                	jae    5af <free+0x1d>
 5ab:	39 08                	cmp    %ecx,(%eax)
 5ad:	77 12                	ja     5c1 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5af:	8b 10                	mov    (%eax),%edx
 5b1:	39 c2                	cmp    %eax,%edx
 5b3:	77 f0                	ja     5a5 <free+0x13>
 5b5:	39 c8                	cmp    %ecx,%eax
 5b7:	72 08                	jb     5c1 <free+0x2f>
 5b9:	39 ca                	cmp    %ecx,%edx
 5bb:	77 04                	ja     5c1 <free+0x2f>
 5bd:	89 d0                	mov    %edx,%eax
 5bf:	eb e6                	jmp    5a7 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 5c1:	8b 73 fc             	mov    -0x4(%ebx),%esi
 5c4:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 5c7:	8b 10                	mov    (%eax),%edx
 5c9:	39 d7                	cmp    %edx,%edi
 5cb:	74 19                	je     5e6 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 5cd:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 5d0:	8b 50 04             	mov    0x4(%eax),%edx
 5d3:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 5d6:	39 ce                	cmp    %ecx,%esi
 5d8:	74 1b                	je     5f5 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 5da:	89 08                	mov    %ecx,(%eax)
  freep = p;
 5dc:	a3 e4 0a 00 00       	mov    %eax,0xae4
}
 5e1:	5b                   	pop    %ebx
 5e2:	5e                   	pop    %esi
 5e3:	5f                   	pop    %edi
 5e4:	5d                   	pop    %ebp
 5e5:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 5e6:	03 72 04             	add    0x4(%edx),%esi
 5e9:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 5ec:	8b 10                	mov    (%eax),%edx
 5ee:	8b 12                	mov    (%edx),%edx
 5f0:	89 53 f8             	mov    %edx,-0x8(%ebx)
 5f3:	eb db                	jmp    5d0 <free+0x3e>
    p->s.size += bp->s.size;
 5f5:	03 53 fc             	add    -0x4(%ebx),%edx
 5f8:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 5fb:	8b 53 f8             	mov    -0x8(%ebx),%edx
 5fe:	89 10                	mov    %edx,(%eax)
 600:	eb da                	jmp    5dc <free+0x4a>

00000602 <morecore>:

static Header*
morecore(uint nu)
{
 602:	55                   	push   %ebp
 603:	89 e5                	mov    %esp,%ebp
 605:	53                   	push   %ebx
 606:	83 ec 04             	sub    $0x4,%esp
 609:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 60b:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 610:	77 05                	ja     617 <morecore+0x15>
    nu = 4096;
 612:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 617:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 61e:	83 ec 0c             	sub    $0xc,%esp
 621:	50                   	push   %eax
 622:	e8 38 fd ff ff       	call   35f <sbrk>
  if(p == (char*)-1)
 627:	83 c4 10             	add    $0x10,%esp
 62a:	83 f8 ff             	cmp    $0xffffffff,%eax
 62d:	74 1c                	je     64b <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 62f:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 632:	83 c0 08             	add    $0x8,%eax
 635:	83 ec 0c             	sub    $0xc,%esp
 638:	50                   	push   %eax
 639:	e8 54 ff ff ff       	call   592 <free>
  return freep;
 63e:	a1 e4 0a 00 00       	mov    0xae4,%eax
 643:	83 c4 10             	add    $0x10,%esp
}
 646:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 649:	c9                   	leave  
 64a:	c3                   	ret    
    return 0;
 64b:	b8 00 00 00 00       	mov    $0x0,%eax
 650:	eb f4                	jmp    646 <morecore+0x44>

00000652 <malloc>:

void*
malloc(uint nbytes)
{
 652:	55                   	push   %ebp
 653:	89 e5                	mov    %esp,%ebp
 655:	53                   	push   %ebx
 656:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 659:	8b 45 08             	mov    0x8(%ebp),%eax
 65c:	8d 58 07             	lea    0x7(%eax),%ebx
 65f:	c1 eb 03             	shr    $0x3,%ebx
 662:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 665:	8b 0d e4 0a 00 00    	mov    0xae4,%ecx
 66b:	85 c9                	test   %ecx,%ecx
 66d:	74 04                	je     673 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 66f:	8b 01                	mov    (%ecx),%eax
 671:	eb 4a                	jmp    6bd <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 673:	c7 05 e4 0a 00 00 e8 	movl   $0xae8,0xae4
 67a:	0a 00 00 
 67d:	c7 05 e8 0a 00 00 e8 	movl   $0xae8,0xae8
 684:	0a 00 00 
    base.s.size = 0;
 687:	c7 05 ec 0a 00 00 00 	movl   $0x0,0xaec
 68e:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 691:	b9 e8 0a 00 00       	mov    $0xae8,%ecx
 696:	eb d7                	jmp    66f <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 698:	74 19                	je     6b3 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 69a:	29 da                	sub    %ebx,%edx
 69c:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 69f:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 6a2:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 6a5:	89 0d e4 0a 00 00    	mov    %ecx,0xae4
      return (void*)(p + 1);
 6ab:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 6ae:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 6b1:	c9                   	leave  
 6b2:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 6b3:	8b 10                	mov    (%eax),%edx
 6b5:	89 11                	mov    %edx,(%ecx)
 6b7:	eb ec                	jmp    6a5 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6b9:	89 c1                	mov    %eax,%ecx
 6bb:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 6bd:	8b 50 04             	mov    0x4(%eax),%edx
 6c0:	39 da                	cmp    %ebx,%edx
 6c2:	73 d4                	jae    698 <malloc+0x46>
    if(p == freep)
 6c4:	39 05 e4 0a 00 00    	cmp    %eax,0xae4
 6ca:	75 ed                	jne    6b9 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 6cc:	89 d8                	mov    %ebx,%eax
 6ce:	e8 2f ff ff ff       	call   602 <morecore>
 6d3:	85 c0                	test   %eax,%eax
 6d5:	75 e2                	jne    6b9 <malloc+0x67>
 6d7:	eb d5                	jmp    6ae <malloc+0x5c>
