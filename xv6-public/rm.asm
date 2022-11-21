
_rm:     file format elf32-i386


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
    printf(2, "Usage: rm files...\n");
    exit();
  }

  for(i = 1; i < argc; i++){
  21:	bb 01 00 00 00       	mov    $0x1,%ebx
  26:	eb 17                	jmp    3f <main+0x3f>
    printf(2, "Usage: rm files...\n");
  28:	83 ec 08             	sub    $0x8,%esp
  2b:	68 9c 06 00 00       	push   $0x69c
  30:	6a 02                	push   $0x2
  32:	e8 b7 03 00 00       	call   3ee <printf>
    exit();
  37:	e8 5d 02 00 00       	call   299 <exit>
  for(i = 1; i < argc; i++){
  3c:	83 c3 01             	add    $0x1,%ebx
  3f:	39 fb                	cmp    %edi,%ebx
  41:	7d 2b                	jge    6e <main+0x6e>
    if(unlink(argv[i]) < 0){
  43:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  46:	8d 34 98             	lea    (%eax,%ebx,4),%esi
  49:	83 ec 0c             	sub    $0xc,%esp
  4c:	ff 36                	push   (%esi)
  4e:	e8 96 02 00 00       	call   2e9 <unlink>
  53:	83 c4 10             	add    $0x10,%esp
  56:	85 c0                	test   %eax,%eax
  58:	79 e2                	jns    3c <main+0x3c>
      printf(2, "rm: %s failed to delete\n", argv[i]);
  5a:	83 ec 04             	sub    $0x4,%esp
  5d:	ff 36                	push   (%esi)
  5f:	68 b0 06 00 00       	push   $0x6b0
  64:	6a 02                	push   $0x2
  66:	e8 83 03 00 00       	call   3ee <printf>
      break;
  6b:	83 c4 10             	add    $0x10,%esp
    }
  }

  exit();
  6e:	e8 26 02 00 00       	call   299 <exit>

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
  void *n_stack = malloc(PGSIZE);
  8a:	68 00 10 00 00       	push   $0x1000
  8f:	e8 80 05 00 00       	call   614 <malloc>
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
  a5:	e8 8f 02 00 00       	call   339 <clone>


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
  return 0;
}
  b6:	b8 00 00 00 00       	mov    $0x0,%eax
  bb:	c3                   	ret    

000000bc <lock_acquire>:

void lock_acquire(lock_t *lock){
  bc:	55                   	push   %ebp
  bd:	89 e5                	mov    %esp,%ebp
  bf:	53                   	push   %ebx
  c0:	83 ec 04             	sub    $0x4,%esp
  c3:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
  c6:	83 ec 08             	sub    $0x8,%esp
  c9:	6a 01                	push   $0x1
  cb:	53                   	push   %ebx
  cc:	e8 a2 ff ff ff       	call   73 <test_and_set>
  d1:	83 c4 10             	add    $0x10,%esp
  d4:	83 f8 01             	cmp    $0x1,%eax
  d7:	74 ed                	je     c6 <lock_acquire+0xa>
    ;
}
  d9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  dc:	c9                   	leave  
  dd:	c3                   	ret    

000000de <lock_release>:

void lock_release(lock_t *lock) {
  de:	55                   	push   %ebp
  df:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
  e1:	8b 45 08             	mov    0x8(%ebp),%eax
  e4:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
  ea:	5d                   	pop    %ebp
  eb:	c3                   	ret    

000000ec <lock_init>:

void lock_init(lock_t *lock) {
  ec:	55                   	push   %ebp
  ed:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
  ef:	8b 45 08             	mov    0x8(%ebp),%eax
  f2:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
  f8:	5d                   	pop    %ebp
  f9:	c3                   	ret    

000000fa <strcpy>:

char*
strcpy(char *s, const char *t)
{
  fa:	55                   	push   %ebp
  fb:	89 e5                	mov    %esp,%ebp
  fd:	56                   	push   %esi
  fe:	53                   	push   %ebx
  ff:	8b 75 08             	mov    0x8(%ebp),%esi
 102:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 105:	89 f0                	mov    %esi,%eax
 107:	89 d1                	mov    %edx,%ecx
 109:	83 c2 01             	add    $0x1,%edx
 10c:	89 c3                	mov    %eax,%ebx
 10e:	83 c0 01             	add    $0x1,%eax
 111:	0f b6 09             	movzbl (%ecx),%ecx
 114:	88 0b                	mov    %cl,(%ebx)
 116:	84 c9                	test   %cl,%cl
 118:	75 ed                	jne    107 <strcpy+0xd>
    ;
  return os;
}
 11a:	89 f0                	mov    %esi,%eax
 11c:	5b                   	pop    %ebx
 11d:	5e                   	pop    %esi
 11e:	5d                   	pop    %ebp
 11f:	c3                   	ret    

00000120 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 120:	55                   	push   %ebp
 121:	89 e5                	mov    %esp,%ebp
 123:	8b 4d 08             	mov    0x8(%ebp),%ecx
 126:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 129:	eb 06                	jmp    131 <strcmp+0x11>
    p++, q++;
 12b:	83 c1 01             	add    $0x1,%ecx
 12e:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 131:	0f b6 01             	movzbl (%ecx),%eax
 134:	84 c0                	test   %al,%al
 136:	74 04                	je     13c <strcmp+0x1c>
 138:	3a 02                	cmp    (%edx),%al
 13a:	74 ef                	je     12b <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 13c:	0f b6 c0             	movzbl %al,%eax
 13f:	0f b6 12             	movzbl (%edx),%edx
 142:	29 d0                	sub    %edx,%eax
}
 144:	5d                   	pop    %ebp
 145:	c3                   	ret    

00000146 <strlen>:

uint
strlen(const char *s)
{
 146:	55                   	push   %ebp
 147:	89 e5                	mov    %esp,%ebp
 149:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 14c:	b8 00 00 00 00       	mov    $0x0,%eax
 151:	eb 03                	jmp    156 <strlen+0x10>
 153:	83 c0 01             	add    $0x1,%eax
 156:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 15a:	75 f7                	jne    153 <strlen+0xd>
    ;
  return n;
}
 15c:	5d                   	pop    %ebp
 15d:	c3                   	ret    

0000015e <memset>:

void*
memset(void *dst, int c, uint n)
{
 15e:	55                   	push   %ebp
 15f:	89 e5                	mov    %esp,%ebp
 161:	57                   	push   %edi
 162:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 165:	89 d7                	mov    %edx,%edi
 167:	8b 4d 10             	mov    0x10(%ebp),%ecx
 16a:	8b 45 0c             	mov    0xc(%ebp),%eax
 16d:	fc                   	cld    
 16e:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 170:	89 d0                	mov    %edx,%eax
 172:	8b 7d fc             	mov    -0x4(%ebp),%edi
 175:	c9                   	leave  
 176:	c3                   	ret    

00000177 <strchr>:

char*
strchr(const char *s, char c)
{
 177:	55                   	push   %ebp
 178:	89 e5                	mov    %esp,%ebp
 17a:	8b 45 08             	mov    0x8(%ebp),%eax
 17d:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 181:	eb 03                	jmp    186 <strchr+0xf>
 183:	83 c0 01             	add    $0x1,%eax
 186:	0f b6 10             	movzbl (%eax),%edx
 189:	84 d2                	test   %dl,%dl
 18b:	74 06                	je     193 <strchr+0x1c>
    if(*s == c)
 18d:	38 ca                	cmp    %cl,%dl
 18f:	75 f2                	jne    183 <strchr+0xc>
 191:	eb 05                	jmp    198 <strchr+0x21>
      return (char*)s;
  return 0;
 193:	b8 00 00 00 00       	mov    $0x0,%eax
}
 198:	5d                   	pop    %ebp
 199:	c3                   	ret    

0000019a <gets>:

char*
gets(char *buf, int max)
{
 19a:	55                   	push   %ebp
 19b:	89 e5                	mov    %esp,%ebp
 19d:	57                   	push   %edi
 19e:	56                   	push   %esi
 19f:	53                   	push   %ebx
 1a0:	83 ec 1c             	sub    $0x1c,%esp
 1a3:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1a6:	bb 00 00 00 00       	mov    $0x0,%ebx
 1ab:	89 de                	mov    %ebx,%esi
 1ad:	83 c3 01             	add    $0x1,%ebx
 1b0:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1b3:	7d 2e                	jge    1e3 <gets+0x49>
    cc = read(0, &c, 1);
 1b5:	83 ec 04             	sub    $0x4,%esp
 1b8:	6a 01                	push   $0x1
 1ba:	8d 45 e7             	lea    -0x19(%ebp),%eax
 1bd:	50                   	push   %eax
 1be:	6a 00                	push   $0x0
 1c0:	e8 ec 00 00 00       	call   2b1 <read>
    if(cc < 1)
 1c5:	83 c4 10             	add    $0x10,%esp
 1c8:	85 c0                	test   %eax,%eax
 1ca:	7e 17                	jle    1e3 <gets+0x49>
      break;
    buf[i++] = c;
 1cc:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1d0:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 1d3:	3c 0a                	cmp    $0xa,%al
 1d5:	0f 94 c2             	sete   %dl
 1d8:	3c 0d                	cmp    $0xd,%al
 1da:	0f 94 c0             	sete   %al
 1dd:	08 c2                	or     %al,%dl
 1df:	74 ca                	je     1ab <gets+0x11>
    buf[i++] = c;
 1e1:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 1e3:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 1e7:	89 f8                	mov    %edi,%eax
 1e9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1ec:	5b                   	pop    %ebx
 1ed:	5e                   	pop    %esi
 1ee:	5f                   	pop    %edi
 1ef:	5d                   	pop    %ebp
 1f0:	c3                   	ret    

000001f1 <stat>:

int
stat(const char *n, struct stat *st)
{
 1f1:	55                   	push   %ebp
 1f2:	89 e5                	mov    %esp,%ebp
 1f4:	56                   	push   %esi
 1f5:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1f6:	83 ec 08             	sub    $0x8,%esp
 1f9:	6a 00                	push   $0x0
 1fb:	ff 75 08             	push   0x8(%ebp)
 1fe:	e8 d6 00 00 00       	call   2d9 <open>
  if(fd < 0)
 203:	83 c4 10             	add    $0x10,%esp
 206:	85 c0                	test   %eax,%eax
 208:	78 24                	js     22e <stat+0x3d>
 20a:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 20c:	83 ec 08             	sub    $0x8,%esp
 20f:	ff 75 0c             	push   0xc(%ebp)
 212:	50                   	push   %eax
 213:	e8 d9 00 00 00       	call   2f1 <fstat>
 218:	89 c6                	mov    %eax,%esi
  close(fd);
 21a:	89 1c 24             	mov    %ebx,(%esp)
 21d:	e8 9f 00 00 00       	call   2c1 <close>
  return r;
 222:	83 c4 10             	add    $0x10,%esp
}
 225:	89 f0                	mov    %esi,%eax
 227:	8d 65 f8             	lea    -0x8(%ebp),%esp
 22a:	5b                   	pop    %ebx
 22b:	5e                   	pop    %esi
 22c:	5d                   	pop    %ebp
 22d:	c3                   	ret    
    return -1;
 22e:	be ff ff ff ff       	mov    $0xffffffff,%esi
 233:	eb f0                	jmp    225 <stat+0x34>

00000235 <atoi>:

int
atoi(const char *s)
{
 235:	55                   	push   %ebp
 236:	89 e5                	mov    %esp,%ebp
 238:	53                   	push   %ebx
 239:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 23c:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 241:	eb 10                	jmp    253 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 243:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 246:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 249:	83 c1 01             	add    $0x1,%ecx
 24c:	0f be c0             	movsbl %al,%eax
 24f:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 253:	0f b6 01             	movzbl (%ecx),%eax
 256:	8d 58 d0             	lea    -0x30(%eax),%ebx
 259:	80 fb 09             	cmp    $0x9,%bl
 25c:	76 e5                	jbe    243 <atoi+0xe>
  return n;
}
 25e:	89 d0                	mov    %edx,%eax
 260:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 263:	c9                   	leave  
 264:	c3                   	ret    

00000265 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 265:	55                   	push   %ebp
 266:	89 e5                	mov    %esp,%ebp
 268:	56                   	push   %esi
 269:	53                   	push   %ebx
 26a:	8b 75 08             	mov    0x8(%ebp),%esi
 26d:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 270:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 273:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 275:	eb 0d                	jmp    284 <memmove+0x1f>
    *dst++ = *src++;
 277:	0f b6 01             	movzbl (%ecx),%eax
 27a:	88 02                	mov    %al,(%edx)
 27c:	8d 49 01             	lea    0x1(%ecx),%ecx
 27f:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 282:	89 d8                	mov    %ebx,%eax
 284:	8d 58 ff             	lea    -0x1(%eax),%ebx
 287:	85 c0                	test   %eax,%eax
 289:	7f ec                	jg     277 <memmove+0x12>
  return vdst;
}
 28b:	89 f0                	mov    %esi,%eax
 28d:	5b                   	pop    %ebx
 28e:	5e                   	pop    %esi
 28f:	5d                   	pop    %ebp
 290:	c3                   	ret    

00000291 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 291:	b8 01 00 00 00       	mov    $0x1,%eax
 296:	cd 40                	int    $0x40
 298:	c3                   	ret    

00000299 <exit>:
SYSCALL(exit)
 299:	b8 02 00 00 00       	mov    $0x2,%eax
 29e:	cd 40                	int    $0x40
 2a0:	c3                   	ret    

000002a1 <wait>:
SYSCALL(wait)
 2a1:	b8 03 00 00 00       	mov    $0x3,%eax
 2a6:	cd 40                	int    $0x40
 2a8:	c3                   	ret    

000002a9 <pipe>:
SYSCALL(pipe)
 2a9:	b8 04 00 00 00       	mov    $0x4,%eax
 2ae:	cd 40                	int    $0x40
 2b0:	c3                   	ret    

000002b1 <read>:
SYSCALL(read)
 2b1:	b8 05 00 00 00       	mov    $0x5,%eax
 2b6:	cd 40                	int    $0x40
 2b8:	c3                   	ret    

000002b9 <write>:
SYSCALL(write)
 2b9:	b8 10 00 00 00       	mov    $0x10,%eax
 2be:	cd 40                	int    $0x40
 2c0:	c3                   	ret    

000002c1 <close>:
SYSCALL(close)
 2c1:	b8 15 00 00 00       	mov    $0x15,%eax
 2c6:	cd 40                	int    $0x40
 2c8:	c3                   	ret    

000002c9 <kill>:
SYSCALL(kill)
 2c9:	b8 06 00 00 00       	mov    $0x6,%eax
 2ce:	cd 40                	int    $0x40
 2d0:	c3                   	ret    

000002d1 <exec>:
SYSCALL(exec)
 2d1:	b8 07 00 00 00       	mov    $0x7,%eax
 2d6:	cd 40                	int    $0x40
 2d8:	c3                   	ret    

000002d9 <open>:
SYSCALL(open)
 2d9:	b8 0f 00 00 00       	mov    $0xf,%eax
 2de:	cd 40                	int    $0x40
 2e0:	c3                   	ret    

000002e1 <mknod>:
SYSCALL(mknod)
 2e1:	b8 11 00 00 00       	mov    $0x11,%eax
 2e6:	cd 40                	int    $0x40
 2e8:	c3                   	ret    

000002e9 <unlink>:
SYSCALL(unlink)
 2e9:	b8 12 00 00 00       	mov    $0x12,%eax
 2ee:	cd 40                	int    $0x40
 2f0:	c3                   	ret    

000002f1 <fstat>:
SYSCALL(fstat)
 2f1:	b8 08 00 00 00       	mov    $0x8,%eax
 2f6:	cd 40                	int    $0x40
 2f8:	c3                   	ret    

000002f9 <link>:
SYSCALL(link)
 2f9:	b8 13 00 00 00       	mov    $0x13,%eax
 2fe:	cd 40                	int    $0x40
 300:	c3                   	ret    

00000301 <mkdir>:
SYSCALL(mkdir)
 301:	b8 14 00 00 00       	mov    $0x14,%eax
 306:	cd 40                	int    $0x40
 308:	c3                   	ret    

00000309 <chdir>:
SYSCALL(chdir)
 309:	b8 09 00 00 00       	mov    $0x9,%eax
 30e:	cd 40                	int    $0x40
 310:	c3                   	ret    

00000311 <dup>:
SYSCALL(dup)
 311:	b8 0a 00 00 00       	mov    $0xa,%eax
 316:	cd 40                	int    $0x40
 318:	c3                   	ret    

00000319 <getpid>:
SYSCALL(getpid)
 319:	b8 0b 00 00 00       	mov    $0xb,%eax
 31e:	cd 40                	int    $0x40
 320:	c3                   	ret    

00000321 <sbrk>:
SYSCALL(sbrk)
 321:	b8 0c 00 00 00       	mov    $0xc,%eax
 326:	cd 40                	int    $0x40
 328:	c3                   	ret    

00000329 <sleep>:
SYSCALL(sleep)
 329:	b8 0d 00 00 00       	mov    $0xd,%eax
 32e:	cd 40                	int    $0x40
 330:	c3                   	ret    

00000331 <uptime>:
SYSCALL(uptime)
 331:	b8 0e 00 00 00       	mov    $0xe,%eax
 336:	cd 40                	int    $0x40
 338:	c3                   	ret    

00000339 <clone>:
SYSCALL(clone)
 339:	b8 16 00 00 00       	mov    $0x16,%eax
 33e:	cd 40                	int    $0x40
 340:	c3                   	ret    

00000341 <join>:
 341:	b8 17 00 00 00       	mov    $0x17,%eax
 346:	cd 40                	int    $0x40
 348:	c3                   	ret    

00000349 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 349:	55                   	push   %ebp
 34a:	89 e5                	mov    %esp,%ebp
 34c:	83 ec 1c             	sub    $0x1c,%esp
 34f:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 352:	6a 01                	push   $0x1
 354:	8d 55 f4             	lea    -0xc(%ebp),%edx
 357:	52                   	push   %edx
 358:	50                   	push   %eax
 359:	e8 5b ff ff ff       	call   2b9 <write>
}
 35e:	83 c4 10             	add    $0x10,%esp
 361:	c9                   	leave  
 362:	c3                   	ret    

00000363 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 363:	55                   	push   %ebp
 364:	89 e5                	mov    %esp,%ebp
 366:	57                   	push   %edi
 367:	56                   	push   %esi
 368:	53                   	push   %ebx
 369:	83 ec 2c             	sub    $0x2c,%esp
 36c:	89 45 d0             	mov    %eax,-0x30(%ebp)
 36f:	89 d0                	mov    %edx,%eax
 371:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 373:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 377:	0f 95 c1             	setne  %cl
 37a:	c1 ea 1f             	shr    $0x1f,%edx
 37d:	84 d1                	test   %dl,%cl
 37f:	74 44                	je     3c5 <printint+0x62>
    neg = 1;
    x = -xx;
 381:	f7 d8                	neg    %eax
 383:	89 c1                	mov    %eax,%ecx
    neg = 1;
 385:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 38c:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 391:	89 c8                	mov    %ecx,%eax
 393:	ba 00 00 00 00       	mov    $0x0,%edx
 398:	f7 f6                	div    %esi
 39a:	89 df                	mov    %ebx,%edi
 39c:	83 c3 01             	add    $0x1,%ebx
 39f:	0f b6 92 28 07 00 00 	movzbl 0x728(%edx),%edx
 3a6:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 3aa:	89 ca                	mov    %ecx,%edx
 3ac:	89 c1                	mov    %eax,%ecx
 3ae:	39 d6                	cmp    %edx,%esi
 3b0:	76 df                	jbe    391 <printint+0x2e>
  if(neg)
 3b2:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 3b6:	74 31                	je     3e9 <printint+0x86>
    buf[i++] = '-';
 3b8:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 3bd:	8d 5f 02             	lea    0x2(%edi),%ebx
 3c0:	8b 75 d0             	mov    -0x30(%ebp),%esi
 3c3:	eb 17                	jmp    3dc <printint+0x79>
    x = xx;
 3c5:	89 c1                	mov    %eax,%ecx
  neg = 0;
 3c7:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 3ce:	eb bc                	jmp    38c <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 3d0:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 3d5:	89 f0                	mov    %esi,%eax
 3d7:	e8 6d ff ff ff       	call   349 <putc>
  while(--i >= 0)
 3dc:	83 eb 01             	sub    $0x1,%ebx
 3df:	79 ef                	jns    3d0 <printint+0x6d>
}
 3e1:	83 c4 2c             	add    $0x2c,%esp
 3e4:	5b                   	pop    %ebx
 3e5:	5e                   	pop    %esi
 3e6:	5f                   	pop    %edi
 3e7:	5d                   	pop    %ebp
 3e8:	c3                   	ret    
 3e9:	8b 75 d0             	mov    -0x30(%ebp),%esi
 3ec:	eb ee                	jmp    3dc <printint+0x79>

000003ee <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 3ee:	55                   	push   %ebp
 3ef:	89 e5                	mov    %esp,%ebp
 3f1:	57                   	push   %edi
 3f2:	56                   	push   %esi
 3f3:	53                   	push   %ebx
 3f4:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 3f7:	8d 45 10             	lea    0x10(%ebp),%eax
 3fa:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 3fd:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 402:	bb 00 00 00 00       	mov    $0x0,%ebx
 407:	eb 14                	jmp    41d <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 409:	89 fa                	mov    %edi,%edx
 40b:	8b 45 08             	mov    0x8(%ebp),%eax
 40e:	e8 36 ff ff ff       	call   349 <putc>
 413:	eb 05                	jmp    41a <printf+0x2c>
      }
    } else if(state == '%'){
 415:	83 fe 25             	cmp    $0x25,%esi
 418:	74 25                	je     43f <printf+0x51>
  for(i = 0; fmt[i]; i++){
 41a:	83 c3 01             	add    $0x1,%ebx
 41d:	8b 45 0c             	mov    0xc(%ebp),%eax
 420:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 424:	84 c0                	test   %al,%al
 426:	0f 84 20 01 00 00    	je     54c <printf+0x15e>
    c = fmt[i] & 0xff;
 42c:	0f be f8             	movsbl %al,%edi
 42f:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 432:	85 f6                	test   %esi,%esi
 434:	75 df                	jne    415 <printf+0x27>
      if(c == '%'){
 436:	83 f8 25             	cmp    $0x25,%eax
 439:	75 ce                	jne    409 <printf+0x1b>
        state = '%';
 43b:	89 c6                	mov    %eax,%esi
 43d:	eb db                	jmp    41a <printf+0x2c>
      if(c == 'd'){
 43f:	83 f8 25             	cmp    $0x25,%eax
 442:	0f 84 cf 00 00 00    	je     517 <printf+0x129>
 448:	0f 8c dd 00 00 00    	jl     52b <printf+0x13d>
 44e:	83 f8 78             	cmp    $0x78,%eax
 451:	0f 8f d4 00 00 00    	jg     52b <printf+0x13d>
 457:	83 f8 63             	cmp    $0x63,%eax
 45a:	0f 8c cb 00 00 00    	jl     52b <printf+0x13d>
 460:	83 e8 63             	sub    $0x63,%eax
 463:	83 f8 15             	cmp    $0x15,%eax
 466:	0f 87 bf 00 00 00    	ja     52b <printf+0x13d>
 46c:	ff 24 85 d0 06 00 00 	jmp    *0x6d0(,%eax,4)
        printint(fd, *ap, 10, 1);
 473:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 476:	8b 17                	mov    (%edi),%edx
 478:	83 ec 0c             	sub    $0xc,%esp
 47b:	6a 01                	push   $0x1
 47d:	b9 0a 00 00 00       	mov    $0xa,%ecx
 482:	8b 45 08             	mov    0x8(%ebp),%eax
 485:	e8 d9 fe ff ff       	call   363 <printint>
        ap++;
 48a:	83 c7 04             	add    $0x4,%edi
 48d:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 490:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 493:	be 00 00 00 00       	mov    $0x0,%esi
 498:	eb 80                	jmp    41a <printf+0x2c>
        printint(fd, *ap, 16, 0);
 49a:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 49d:	8b 17                	mov    (%edi),%edx
 49f:	83 ec 0c             	sub    $0xc,%esp
 4a2:	6a 00                	push   $0x0
 4a4:	b9 10 00 00 00       	mov    $0x10,%ecx
 4a9:	8b 45 08             	mov    0x8(%ebp),%eax
 4ac:	e8 b2 fe ff ff       	call   363 <printint>
        ap++;
 4b1:	83 c7 04             	add    $0x4,%edi
 4b4:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 4b7:	83 c4 10             	add    $0x10,%esp
      state = 0;
 4ba:	be 00 00 00 00       	mov    $0x0,%esi
 4bf:	e9 56 ff ff ff       	jmp    41a <printf+0x2c>
        s = (char*)*ap;
 4c4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 4c7:	8b 30                	mov    (%eax),%esi
        ap++;
 4c9:	83 c0 04             	add    $0x4,%eax
 4cc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 4cf:	85 f6                	test   %esi,%esi
 4d1:	75 15                	jne    4e8 <printf+0xfa>
          s = "(null)";
 4d3:	be c9 06 00 00       	mov    $0x6c9,%esi
 4d8:	eb 0e                	jmp    4e8 <printf+0xfa>
          putc(fd, *s);
 4da:	0f be d2             	movsbl %dl,%edx
 4dd:	8b 45 08             	mov    0x8(%ebp),%eax
 4e0:	e8 64 fe ff ff       	call   349 <putc>
          s++;
 4e5:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 4e8:	0f b6 16             	movzbl (%esi),%edx
 4eb:	84 d2                	test   %dl,%dl
 4ed:	75 eb                	jne    4da <printf+0xec>
      state = 0;
 4ef:	be 00 00 00 00       	mov    $0x0,%esi
 4f4:	e9 21 ff ff ff       	jmp    41a <printf+0x2c>
        putc(fd, *ap);
 4f9:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4fc:	0f be 17             	movsbl (%edi),%edx
 4ff:	8b 45 08             	mov    0x8(%ebp),%eax
 502:	e8 42 fe ff ff       	call   349 <putc>
        ap++;
 507:	83 c7 04             	add    $0x4,%edi
 50a:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 50d:	be 00 00 00 00       	mov    $0x0,%esi
 512:	e9 03 ff ff ff       	jmp    41a <printf+0x2c>
        putc(fd, c);
 517:	89 fa                	mov    %edi,%edx
 519:	8b 45 08             	mov    0x8(%ebp),%eax
 51c:	e8 28 fe ff ff       	call   349 <putc>
      state = 0;
 521:	be 00 00 00 00       	mov    $0x0,%esi
 526:	e9 ef fe ff ff       	jmp    41a <printf+0x2c>
        putc(fd, '%');
 52b:	ba 25 00 00 00       	mov    $0x25,%edx
 530:	8b 45 08             	mov    0x8(%ebp),%eax
 533:	e8 11 fe ff ff       	call   349 <putc>
        putc(fd, c);
 538:	89 fa                	mov    %edi,%edx
 53a:	8b 45 08             	mov    0x8(%ebp),%eax
 53d:	e8 07 fe ff ff       	call   349 <putc>
      state = 0;
 542:	be 00 00 00 00       	mov    $0x0,%esi
 547:	e9 ce fe ff ff       	jmp    41a <printf+0x2c>
    }
  }
}
 54c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 54f:	5b                   	pop    %ebx
 550:	5e                   	pop    %esi
 551:	5f                   	pop    %edi
 552:	5d                   	pop    %ebp
 553:	c3                   	ret    

00000554 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 554:	55                   	push   %ebp
 555:	89 e5                	mov    %esp,%ebp
 557:	57                   	push   %edi
 558:	56                   	push   %esi
 559:	53                   	push   %ebx
 55a:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 55d:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 560:	a1 90 0a 00 00       	mov    0xa90,%eax
 565:	eb 02                	jmp    569 <free+0x15>
 567:	89 d0                	mov    %edx,%eax
 569:	39 c8                	cmp    %ecx,%eax
 56b:	73 04                	jae    571 <free+0x1d>
 56d:	39 08                	cmp    %ecx,(%eax)
 56f:	77 12                	ja     583 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 571:	8b 10                	mov    (%eax),%edx
 573:	39 c2                	cmp    %eax,%edx
 575:	77 f0                	ja     567 <free+0x13>
 577:	39 c8                	cmp    %ecx,%eax
 579:	72 08                	jb     583 <free+0x2f>
 57b:	39 ca                	cmp    %ecx,%edx
 57d:	77 04                	ja     583 <free+0x2f>
 57f:	89 d0                	mov    %edx,%eax
 581:	eb e6                	jmp    569 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 583:	8b 73 fc             	mov    -0x4(%ebx),%esi
 586:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 589:	8b 10                	mov    (%eax),%edx
 58b:	39 d7                	cmp    %edx,%edi
 58d:	74 19                	je     5a8 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 58f:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 592:	8b 50 04             	mov    0x4(%eax),%edx
 595:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 598:	39 ce                	cmp    %ecx,%esi
 59a:	74 1b                	je     5b7 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 59c:	89 08                	mov    %ecx,(%eax)
  freep = p;
 59e:	a3 90 0a 00 00       	mov    %eax,0xa90
}
 5a3:	5b                   	pop    %ebx
 5a4:	5e                   	pop    %esi
 5a5:	5f                   	pop    %edi
 5a6:	5d                   	pop    %ebp
 5a7:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 5a8:	03 72 04             	add    0x4(%edx),%esi
 5ab:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 5ae:	8b 10                	mov    (%eax),%edx
 5b0:	8b 12                	mov    (%edx),%edx
 5b2:	89 53 f8             	mov    %edx,-0x8(%ebx)
 5b5:	eb db                	jmp    592 <free+0x3e>
    p->s.size += bp->s.size;
 5b7:	03 53 fc             	add    -0x4(%ebx),%edx
 5ba:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 5bd:	8b 53 f8             	mov    -0x8(%ebx),%edx
 5c0:	89 10                	mov    %edx,(%eax)
 5c2:	eb da                	jmp    59e <free+0x4a>

000005c4 <morecore>:

static Header*
morecore(uint nu)
{
 5c4:	55                   	push   %ebp
 5c5:	89 e5                	mov    %esp,%ebp
 5c7:	53                   	push   %ebx
 5c8:	83 ec 04             	sub    $0x4,%esp
 5cb:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 5cd:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 5d2:	77 05                	ja     5d9 <morecore+0x15>
    nu = 4096;
 5d4:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 5d9:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 5e0:	83 ec 0c             	sub    $0xc,%esp
 5e3:	50                   	push   %eax
 5e4:	e8 38 fd ff ff       	call   321 <sbrk>
  if(p == (char*)-1)
 5e9:	83 c4 10             	add    $0x10,%esp
 5ec:	83 f8 ff             	cmp    $0xffffffff,%eax
 5ef:	74 1c                	je     60d <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 5f1:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 5f4:	83 c0 08             	add    $0x8,%eax
 5f7:	83 ec 0c             	sub    $0xc,%esp
 5fa:	50                   	push   %eax
 5fb:	e8 54 ff ff ff       	call   554 <free>
  return freep;
 600:	a1 90 0a 00 00       	mov    0xa90,%eax
 605:	83 c4 10             	add    $0x10,%esp
}
 608:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 60b:	c9                   	leave  
 60c:	c3                   	ret    
    return 0;
 60d:	b8 00 00 00 00       	mov    $0x0,%eax
 612:	eb f4                	jmp    608 <morecore+0x44>

00000614 <malloc>:

void*
malloc(uint nbytes)
{
 614:	55                   	push   %ebp
 615:	89 e5                	mov    %esp,%ebp
 617:	53                   	push   %ebx
 618:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 61b:	8b 45 08             	mov    0x8(%ebp),%eax
 61e:	8d 58 07             	lea    0x7(%eax),%ebx
 621:	c1 eb 03             	shr    $0x3,%ebx
 624:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 627:	8b 0d 90 0a 00 00    	mov    0xa90,%ecx
 62d:	85 c9                	test   %ecx,%ecx
 62f:	74 04                	je     635 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 631:	8b 01                	mov    (%ecx),%eax
 633:	eb 4a                	jmp    67f <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 635:	c7 05 90 0a 00 00 94 	movl   $0xa94,0xa90
 63c:	0a 00 00 
 63f:	c7 05 94 0a 00 00 94 	movl   $0xa94,0xa94
 646:	0a 00 00 
    base.s.size = 0;
 649:	c7 05 98 0a 00 00 00 	movl   $0x0,0xa98
 650:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 653:	b9 94 0a 00 00       	mov    $0xa94,%ecx
 658:	eb d7                	jmp    631 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 65a:	74 19                	je     675 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 65c:	29 da                	sub    %ebx,%edx
 65e:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 661:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 664:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 667:	89 0d 90 0a 00 00    	mov    %ecx,0xa90
      return (void*)(p + 1);
 66d:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 670:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 673:	c9                   	leave  
 674:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 675:	8b 10                	mov    (%eax),%edx
 677:	89 11                	mov    %edx,(%ecx)
 679:	eb ec                	jmp    667 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 67b:	89 c1                	mov    %eax,%ecx
 67d:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 67f:	8b 50 04             	mov    0x4(%eax),%edx
 682:	39 da                	cmp    %ebx,%edx
 684:	73 d4                	jae    65a <malloc+0x46>
    if(p == freep)
 686:	39 05 90 0a 00 00    	cmp    %eax,0xa90
 68c:	75 ed                	jne    67b <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 68e:	89 d8                	mov    %ebx,%eax
 690:	e8 2f ff ff ff       	call   5c4 <morecore>
 695:	85 c0                	test   %eax,%eax
 697:	75 e2                	jne    67b <malloc+0x67>
 699:	eb d5                	jmp    670 <malloc+0x5c>
