
_cat:     file format elf32-i386


Disassembly of section .text:

00000000 <cat>:

char buf[512];

void
cat(int fd)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	56                   	push   %esi
   4:	53                   	push   %ebx
   5:	8b 75 08             	mov    0x8(%ebp),%esi
  int n;

  while((n = read(fd, buf, sizeof(buf))) > 0) {
   8:	83 ec 04             	sub    $0x4,%esp
   b:	68 00 02 00 00       	push   $0x200
  10:	68 20 0b 00 00       	push   $0xb20
  15:	56                   	push   %esi
  16:	e8 ef 02 00 00       	call   30a <read>
  1b:	89 c3                	mov    %eax,%ebx
  1d:	83 c4 10             	add    $0x10,%esp
  20:	85 c0                	test   %eax,%eax
  22:	7e 2b                	jle    4f <cat+0x4f>
    if (write(1, buf, n) != n) {
  24:	83 ec 04             	sub    $0x4,%esp
  27:	53                   	push   %ebx
  28:	68 20 0b 00 00       	push   $0xb20
  2d:	6a 01                	push   $0x1
  2f:	e8 de 02 00 00       	call   312 <write>
  34:	83 c4 10             	add    $0x10,%esp
  37:	39 d8                	cmp    %ebx,%eax
  39:	74 cd                	je     8 <cat+0x8>
      printf(1, "cat: write error\n");
  3b:	83 ec 08             	sub    $0x8,%esp
  3e:	68 f4 06 00 00       	push   $0x6f4
  43:	6a 01                	push   $0x1
  45:	e8 fd 03 00 00       	call   447 <printf>
      exit();
  4a:	e8 a3 02 00 00       	call   2f2 <exit>
    }
  }
  if(n < 0){
  4f:	78 07                	js     58 <cat+0x58>
    printf(1, "cat: read error\n");
    exit();
  }
}
  51:	8d 65 f8             	lea    -0x8(%ebp),%esp
  54:	5b                   	pop    %ebx
  55:	5e                   	pop    %esi
  56:	5d                   	pop    %ebp
  57:	c3                   	ret    
    printf(1, "cat: read error\n");
  58:	83 ec 08             	sub    $0x8,%esp
  5b:	68 06 07 00 00       	push   $0x706
  60:	6a 01                	push   $0x1
  62:	e8 e0 03 00 00       	call   447 <printf>
    exit();
  67:	e8 86 02 00 00       	call   2f2 <exit>

0000006c <main>:

int
main(int argc, char *argv[])
{
  6c:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  70:	83 e4 f0             	and    $0xfffffff0,%esp
  73:	ff 71 fc             	push   -0x4(%ecx)
  76:	55                   	push   %ebp
  77:	89 e5                	mov    %esp,%ebp
  79:	57                   	push   %edi
  7a:	56                   	push   %esi
  7b:	53                   	push   %ebx
  7c:	51                   	push   %ecx
  7d:	83 ec 18             	sub    $0x18,%esp
  80:	8b 01                	mov    (%ecx),%eax
  82:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  85:	8b 51 04             	mov    0x4(%ecx),%edx
  88:	89 55 e0             	mov    %edx,-0x20(%ebp)
  int fd, i;

  if(argc <= 1){
  8b:	83 f8 01             	cmp    $0x1,%eax
  8e:	7e 07                	jle    97 <main+0x2b>
    cat(0);
    exit();
  }

  for(i = 1; i < argc; i++){
  90:	be 01 00 00 00       	mov    $0x1,%esi
  95:	eb 26                	jmp    bd <main+0x51>
    cat(0);
  97:	83 ec 0c             	sub    $0xc,%esp
  9a:	6a 00                	push   $0x0
  9c:	e8 5f ff ff ff       	call   0 <cat>
    exit();
  a1:	e8 4c 02 00 00       	call   2f2 <exit>
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "cat: cannot open %s\n", argv[i]);
      exit();
    }
    cat(fd);
  a6:	83 ec 0c             	sub    $0xc,%esp
  a9:	50                   	push   %eax
  aa:	e8 51 ff ff ff       	call   0 <cat>
    close(fd);
  af:	89 1c 24             	mov    %ebx,(%esp)
  b2:	e8 63 02 00 00       	call   31a <close>
  for(i = 1; i < argc; i++){
  b7:	83 c6 01             	add    $0x1,%esi
  ba:	83 c4 10             	add    $0x10,%esp
  bd:	3b 75 e4             	cmp    -0x1c(%ebp),%esi
  c0:	7d 31                	jge    f3 <main+0x87>
    if((fd = open(argv[i], 0)) < 0){
  c2:	8b 45 e0             	mov    -0x20(%ebp),%eax
  c5:	8d 3c b0             	lea    (%eax,%esi,4),%edi
  c8:	83 ec 08             	sub    $0x8,%esp
  cb:	6a 00                	push   $0x0
  cd:	ff 37                	push   (%edi)
  cf:	e8 5e 02 00 00       	call   332 <open>
  d4:	89 c3                	mov    %eax,%ebx
  d6:	83 c4 10             	add    $0x10,%esp
  d9:	85 c0                	test   %eax,%eax
  db:	79 c9                	jns    a6 <main+0x3a>
      printf(1, "cat: cannot open %s\n", argv[i]);
  dd:	83 ec 04             	sub    $0x4,%esp
  e0:	ff 37                	push   (%edi)
  e2:	68 17 07 00 00       	push   $0x717
  e7:	6a 01                	push   $0x1
  e9:	e8 59 03 00 00       	call   447 <printf>
      exit();
  ee:	e8 ff 01 00 00       	call   2f2 <exit>
  }
  exit();
  f3:	e8 fa 01 00 00       	call   2f2 <exit>

000000f8 <test_and_set>:
#include "fcntl.h"
#include "user.h"
#include "x86.h"
#include "mmu.h"

int test_and_set(int *old_ptr, int new_ptr) {
  f8:	55                   	push   %ebp
  f9:	89 e5                	mov    %esp,%ebp
  fb:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *old_ptr;
  fe:	8b 10                	mov    (%eax),%edx
  *old_ptr = new_ptr;
 100:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 103:	89 08                	mov    %ecx,(%eax)
  return old;
}
 105:	89 d0                	mov    %edx,%eax
 107:	5d                   	pop    %ebp
 108:	c3                   	ret    

00000109 <thread_create>:

  // I can't remember if there was something else to do here but I'm sure I'll find out


  return new_pid;
}
 109:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 10e:	c3                   	ret    

0000010f <thread_join>:

int thread_join() {
  return 0;
}
 10f:	b8 00 00 00 00       	mov    $0x0,%eax
 114:	c3                   	ret    

00000115 <lock_acquire>:

void lock_acquire(lock_t *lock){
 115:	55                   	push   %ebp
 116:	89 e5                	mov    %esp,%ebp
 118:	53                   	push   %ebx
 119:	83 ec 04             	sub    $0x4,%esp
 11c:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 11f:	83 ec 08             	sub    $0x8,%esp
 122:	6a 01                	push   $0x1
 124:	53                   	push   %ebx
 125:	e8 ce ff ff ff       	call   f8 <test_and_set>
 12a:	83 c4 10             	add    $0x10,%esp
 12d:	83 f8 01             	cmp    $0x1,%eax
 130:	74 ed                	je     11f <lock_acquire+0xa>
    ;
}
 132:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 135:	c9                   	leave  
 136:	c3                   	ret    

00000137 <lock_release>:

void lock_release(lock_t *lock) {
 137:	55                   	push   %ebp
 138:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 13a:	8b 45 08             	mov    0x8(%ebp),%eax
 13d:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 143:	5d                   	pop    %ebp
 144:	c3                   	ret    

00000145 <lock_init>:

void lock_init(lock_t *lock) {
 145:	55                   	push   %ebp
 146:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 148:	8b 45 08             	mov    0x8(%ebp),%eax
 14b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 151:	5d                   	pop    %ebp
 152:	c3                   	ret    

00000153 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 153:	55                   	push   %ebp
 154:	89 e5                	mov    %esp,%ebp
 156:	56                   	push   %esi
 157:	53                   	push   %ebx
 158:	8b 75 08             	mov    0x8(%ebp),%esi
 15b:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 15e:	89 f0                	mov    %esi,%eax
 160:	89 d1                	mov    %edx,%ecx
 162:	83 c2 01             	add    $0x1,%edx
 165:	89 c3                	mov    %eax,%ebx
 167:	83 c0 01             	add    $0x1,%eax
 16a:	0f b6 09             	movzbl (%ecx),%ecx
 16d:	88 0b                	mov    %cl,(%ebx)
 16f:	84 c9                	test   %cl,%cl
 171:	75 ed                	jne    160 <strcpy+0xd>
    ;
  return os;
}
 173:	89 f0                	mov    %esi,%eax
 175:	5b                   	pop    %ebx
 176:	5e                   	pop    %esi
 177:	5d                   	pop    %ebp
 178:	c3                   	ret    

00000179 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 179:	55                   	push   %ebp
 17a:	89 e5                	mov    %esp,%ebp
 17c:	8b 4d 08             	mov    0x8(%ebp),%ecx
 17f:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 182:	eb 06                	jmp    18a <strcmp+0x11>
    p++, q++;
 184:	83 c1 01             	add    $0x1,%ecx
 187:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 18a:	0f b6 01             	movzbl (%ecx),%eax
 18d:	84 c0                	test   %al,%al
 18f:	74 04                	je     195 <strcmp+0x1c>
 191:	3a 02                	cmp    (%edx),%al
 193:	74 ef                	je     184 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 195:	0f b6 c0             	movzbl %al,%eax
 198:	0f b6 12             	movzbl (%edx),%edx
 19b:	29 d0                	sub    %edx,%eax
}
 19d:	5d                   	pop    %ebp
 19e:	c3                   	ret    

0000019f <strlen>:

uint
strlen(const char *s)
{
 19f:	55                   	push   %ebp
 1a0:	89 e5                	mov    %esp,%ebp
 1a2:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 1a5:	b8 00 00 00 00       	mov    $0x0,%eax
 1aa:	eb 03                	jmp    1af <strlen+0x10>
 1ac:	83 c0 01             	add    $0x1,%eax
 1af:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 1b3:	75 f7                	jne    1ac <strlen+0xd>
    ;
  return n;
}
 1b5:	5d                   	pop    %ebp
 1b6:	c3                   	ret    

000001b7 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1b7:	55                   	push   %ebp
 1b8:	89 e5                	mov    %esp,%ebp
 1ba:	57                   	push   %edi
 1bb:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1be:	89 d7                	mov    %edx,%edi
 1c0:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1c3:	8b 45 0c             	mov    0xc(%ebp),%eax
 1c6:	fc                   	cld    
 1c7:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1c9:	89 d0                	mov    %edx,%eax
 1cb:	8b 7d fc             	mov    -0x4(%ebp),%edi
 1ce:	c9                   	leave  
 1cf:	c3                   	ret    

000001d0 <strchr>:

char*
strchr(const char *s, char c)
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	8b 45 08             	mov    0x8(%ebp),%eax
 1d6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1da:	eb 03                	jmp    1df <strchr+0xf>
 1dc:	83 c0 01             	add    $0x1,%eax
 1df:	0f b6 10             	movzbl (%eax),%edx
 1e2:	84 d2                	test   %dl,%dl
 1e4:	74 06                	je     1ec <strchr+0x1c>
    if(*s == c)
 1e6:	38 ca                	cmp    %cl,%dl
 1e8:	75 f2                	jne    1dc <strchr+0xc>
 1ea:	eb 05                	jmp    1f1 <strchr+0x21>
      return (char*)s;
  return 0;
 1ec:	b8 00 00 00 00       	mov    $0x0,%eax
}
 1f1:	5d                   	pop    %ebp
 1f2:	c3                   	ret    

000001f3 <gets>:

char*
gets(char *buf, int max)
{
 1f3:	55                   	push   %ebp
 1f4:	89 e5                	mov    %esp,%ebp
 1f6:	57                   	push   %edi
 1f7:	56                   	push   %esi
 1f8:	53                   	push   %ebx
 1f9:	83 ec 1c             	sub    $0x1c,%esp
 1fc:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1ff:	bb 00 00 00 00       	mov    $0x0,%ebx
 204:	89 de                	mov    %ebx,%esi
 206:	83 c3 01             	add    $0x1,%ebx
 209:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 20c:	7d 2e                	jge    23c <gets+0x49>
    cc = read(0, &c, 1);
 20e:	83 ec 04             	sub    $0x4,%esp
 211:	6a 01                	push   $0x1
 213:	8d 45 e7             	lea    -0x19(%ebp),%eax
 216:	50                   	push   %eax
 217:	6a 00                	push   $0x0
 219:	e8 ec 00 00 00       	call   30a <read>
    if(cc < 1)
 21e:	83 c4 10             	add    $0x10,%esp
 221:	85 c0                	test   %eax,%eax
 223:	7e 17                	jle    23c <gets+0x49>
      break;
    buf[i++] = c;
 225:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 229:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 22c:	3c 0a                	cmp    $0xa,%al
 22e:	0f 94 c2             	sete   %dl
 231:	3c 0d                	cmp    $0xd,%al
 233:	0f 94 c0             	sete   %al
 236:	08 c2                	or     %al,%dl
 238:	74 ca                	je     204 <gets+0x11>
    buf[i++] = c;
 23a:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 23c:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 240:	89 f8                	mov    %edi,%eax
 242:	8d 65 f4             	lea    -0xc(%ebp),%esp
 245:	5b                   	pop    %ebx
 246:	5e                   	pop    %esi
 247:	5f                   	pop    %edi
 248:	5d                   	pop    %ebp
 249:	c3                   	ret    

0000024a <stat>:

int
stat(const char *n, struct stat *st)
{
 24a:	55                   	push   %ebp
 24b:	89 e5                	mov    %esp,%ebp
 24d:	56                   	push   %esi
 24e:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 24f:	83 ec 08             	sub    $0x8,%esp
 252:	6a 00                	push   $0x0
 254:	ff 75 08             	push   0x8(%ebp)
 257:	e8 d6 00 00 00       	call   332 <open>
  if(fd < 0)
 25c:	83 c4 10             	add    $0x10,%esp
 25f:	85 c0                	test   %eax,%eax
 261:	78 24                	js     287 <stat+0x3d>
 263:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 265:	83 ec 08             	sub    $0x8,%esp
 268:	ff 75 0c             	push   0xc(%ebp)
 26b:	50                   	push   %eax
 26c:	e8 d9 00 00 00       	call   34a <fstat>
 271:	89 c6                	mov    %eax,%esi
  close(fd);
 273:	89 1c 24             	mov    %ebx,(%esp)
 276:	e8 9f 00 00 00       	call   31a <close>
  return r;
 27b:	83 c4 10             	add    $0x10,%esp
}
 27e:	89 f0                	mov    %esi,%eax
 280:	8d 65 f8             	lea    -0x8(%ebp),%esp
 283:	5b                   	pop    %ebx
 284:	5e                   	pop    %esi
 285:	5d                   	pop    %ebp
 286:	c3                   	ret    
    return -1;
 287:	be ff ff ff ff       	mov    $0xffffffff,%esi
 28c:	eb f0                	jmp    27e <stat+0x34>

0000028e <atoi>:

int
atoi(const char *s)
{
 28e:	55                   	push   %ebp
 28f:	89 e5                	mov    %esp,%ebp
 291:	53                   	push   %ebx
 292:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 295:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 29a:	eb 10                	jmp    2ac <atoi+0x1e>
    n = n*10 + *s++ - '0';
 29c:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 29f:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 2a2:	83 c1 01             	add    $0x1,%ecx
 2a5:	0f be c0             	movsbl %al,%eax
 2a8:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 2ac:	0f b6 01             	movzbl (%ecx),%eax
 2af:	8d 58 d0             	lea    -0x30(%eax),%ebx
 2b2:	80 fb 09             	cmp    $0x9,%bl
 2b5:	76 e5                	jbe    29c <atoi+0xe>
  return n;
}
 2b7:	89 d0                	mov    %edx,%eax
 2b9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2bc:	c9                   	leave  
 2bd:	c3                   	ret    

000002be <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2be:	55                   	push   %ebp
 2bf:	89 e5                	mov    %esp,%ebp
 2c1:	56                   	push   %esi
 2c2:	53                   	push   %ebx
 2c3:	8b 75 08             	mov    0x8(%ebp),%esi
 2c6:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 2c9:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 2cc:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 2ce:	eb 0d                	jmp    2dd <memmove+0x1f>
    *dst++ = *src++;
 2d0:	0f b6 01             	movzbl (%ecx),%eax
 2d3:	88 02                	mov    %al,(%edx)
 2d5:	8d 49 01             	lea    0x1(%ecx),%ecx
 2d8:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 2db:	89 d8                	mov    %ebx,%eax
 2dd:	8d 58 ff             	lea    -0x1(%eax),%ebx
 2e0:	85 c0                	test   %eax,%eax
 2e2:	7f ec                	jg     2d0 <memmove+0x12>
  return vdst;
}
 2e4:	89 f0                	mov    %esi,%eax
 2e6:	5b                   	pop    %ebx
 2e7:	5e                   	pop    %esi
 2e8:	5d                   	pop    %ebp
 2e9:	c3                   	ret    

000002ea <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2ea:	b8 01 00 00 00       	mov    $0x1,%eax
 2ef:	cd 40                	int    $0x40
 2f1:	c3                   	ret    

000002f2 <exit>:
SYSCALL(exit)
 2f2:	b8 02 00 00 00       	mov    $0x2,%eax
 2f7:	cd 40                	int    $0x40
 2f9:	c3                   	ret    

000002fa <wait>:
SYSCALL(wait)
 2fa:	b8 03 00 00 00       	mov    $0x3,%eax
 2ff:	cd 40                	int    $0x40
 301:	c3                   	ret    

00000302 <pipe>:
SYSCALL(pipe)
 302:	b8 04 00 00 00       	mov    $0x4,%eax
 307:	cd 40                	int    $0x40
 309:	c3                   	ret    

0000030a <read>:
SYSCALL(read)
 30a:	b8 05 00 00 00       	mov    $0x5,%eax
 30f:	cd 40                	int    $0x40
 311:	c3                   	ret    

00000312 <write>:
SYSCALL(write)
 312:	b8 10 00 00 00       	mov    $0x10,%eax
 317:	cd 40                	int    $0x40
 319:	c3                   	ret    

0000031a <close>:
SYSCALL(close)
 31a:	b8 15 00 00 00       	mov    $0x15,%eax
 31f:	cd 40                	int    $0x40
 321:	c3                   	ret    

00000322 <kill>:
SYSCALL(kill)
 322:	b8 06 00 00 00       	mov    $0x6,%eax
 327:	cd 40                	int    $0x40
 329:	c3                   	ret    

0000032a <exec>:
SYSCALL(exec)
 32a:	b8 07 00 00 00       	mov    $0x7,%eax
 32f:	cd 40                	int    $0x40
 331:	c3                   	ret    

00000332 <open>:
SYSCALL(open)
 332:	b8 0f 00 00 00       	mov    $0xf,%eax
 337:	cd 40                	int    $0x40
 339:	c3                   	ret    

0000033a <mknod>:
SYSCALL(mknod)
 33a:	b8 11 00 00 00       	mov    $0x11,%eax
 33f:	cd 40                	int    $0x40
 341:	c3                   	ret    

00000342 <unlink>:
SYSCALL(unlink)
 342:	b8 12 00 00 00       	mov    $0x12,%eax
 347:	cd 40                	int    $0x40
 349:	c3                   	ret    

0000034a <fstat>:
SYSCALL(fstat)
 34a:	b8 08 00 00 00       	mov    $0x8,%eax
 34f:	cd 40                	int    $0x40
 351:	c3                   	ret    

00000352 <link>:
SYSCALL(link)
 352:	b8 13 00 00 00       	mov    $0x13,%eax
 357:	cd 40                	int    $0x40
 359:	c3                   	ret    

0000035a <mkdir>:
SYSCALL(mkdir)
 35a:	b8 14 00 00 00       	mov    $0x14,%eax
 35f:	cd 40                	int    $0x40
 361:	c3                   	ret    

00000362 <chdir>:
SYSCALL(chdir)
 362:	b8 09 00 00 00       	mov    $0x9,%eax
 367:	cd 40                	int    $0x40
 369:	c3                   	ret    

0000036a <dup>:
SYSCALL(dup)
 36a:	b8 0a 00 00 00       	mov    $0xa,%eax
 36f:	cd 40                	int    $0x40
 371:	c3                   	ret    

00000372 <getpid>:
SYSCALL(getpid)
 372:	b8 0b 00 00 00       	mov    $0xb,%eax
 377:	cd 40                	int    $0x40
 379:	c3                   	ret    

0000037a <sbrk>:
SYSCALL(sbrk)
 37a:	b8 0c 00 00 00       	mov    $0xc,%eax
 37f:	cd 40                	int    $0x40
 381:	c3                   	ret    

00000382 <sleep>:
SYSCALL(sleep)
 382:	b8 0d 00 00 00       	mov    $0xd,%eax
 387:	cd 40                	int    $0x40
 389:	c3                   	ret    

0000038a <uptime>:
SYSCALL(uptime)
 38a:	b8 0e 00 00 00       	mov    $0xe,%eax
 38f:	cd 40                	int    $0x40
 391:	c3                   	ret    

00000392 <clone>:
SYSCALL(clone)
 392:	b8 16 00 00 00       	mov    $0x16,%eax
 397:	cd 40                	int    $0x40
 399:	c3                   	ret    

0000039a <join>:
 39a:	b8 17 00 00 00       	mov    $0x17,%eax
 39f:	cd 40                	int    $0x40
 3a1:	c3                   	ret    

000003a2 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 3a2:	55                   	push   %ebp
 3a3:	89 e5                	mov    %esp,%ebp
 3a5:	83 ec 1c             	sub    $0x1c,%esp
 3a8:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 3ab:	6a 01                	push   $0x1
 3ad:	8d 55 f4             	lea    -0xc(%ebp),%edx
 3b0:	52                   	push   %edx
 3b1:	50                   	push   %eax
 3b2:	e8 5b ff ff ff       	call   312 <write>
}
 3b7:	83 c4 10             	add    $0x10,%esp
 3ba:	c9                   	leave  
 3bb:	c3                   	ret    

000003bc <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 3bc:	55                   	push   %ebp
 3bd:	89 e5                	mov    %esp,%ebp
 3bf:	57                   	push   %edi
 3c0:	56                   	push   %esi
 3c1:	53                   	push   %ebx
 3c2:	83 ec 2c             	sub    $0x2c,%esp
 3c5:	89 45 d0             	mov    %eax,-0x30(%ebp)
 3c8:	89 d0                	mov    %edx,%eax
 3ca:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 3cc:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 3d0:	0f 95 c1             	setne  %cl
 3d3:	c1 ea 1f             	shr    $0x1f,%edx
 3d6:	84 d1                	test   %dl,%cl
 3d8:	74 44                	je     41e <printint+0x62>
    neg = 1;
    x = -xx;
 3da:	f7 d8                	neg    %eax
 3dc:	89 c1                	mov    %eax,%ecx
    neg = 1;
 3de:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 3e5:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 3ea:	89 c8                	mov    %ecx,%eax
 3ec:	ba 00 00 00 00       	mov    $0x0,%edx
 3f1:	f7 f6                	div    %esi
 3f3:	89 df                	mov    %ebx,%edi
 3f5:	83 c3 01             	add    $0x1,%ebx
 3f8:	0f b6 92 8c 07 00 00 	movzbl 0x78c(%edx),%edx
 3ff:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 403:	89 ca                	mov    %ecx,%edx
 405:	89 c1                	mov    %eax,%ecx
 407:	39 d6                	cmp    %edx,%esi
 409:	76 df                	jbe    3ea <printint+0x2e>
  if(neg)
 40b:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 40f:	74 31                	je     442 <printint+0x86>
    buf[i++] = '-';
 411:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 416:	8d 5f 02             	lea    0x2(%edi),%ebx
 419:	8b 75 d0             	mov    -0x30(%ebp),%esi
 41c:	eb 17                	jmp    435 <printint+0x79>
    x = xx;
 41e:	89 c1                	mov    %eax,%ecx
  neg = 0;
 420:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 427:	eb bc                	jmp    3e5 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 429:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 42e:	89 f0                	mov    %esi,%eax
 430:	e8 6d ff ff ff       	call   3a2 <putc>
  while(--i >= 0)
 435:	83 eb 01             	sub    $0x1,%ebx
 438:	79 ef                	jns    429 <printint+0x6d>
}
 43a:	83 c4 2c             	add    $0x2c,%esp
 43d:	5b                   	pop    %ebx
 43e:	5e                   	pop    %esi
 43f:	5f                   	pop    %edi
 440:	5d                   	pop    %ebp
 441:	c3                   	ret    
 442:	8b 75 d0             	mov    -0x30(%ebp),%esi
 445:	eb ee                	jmp    435 <printint+0x79>

00000447 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 447:	55                   	push   %ebp
 448:	89 e5                	mov    %esp,%ebp
 44a:	57                   	push   %edi
 44b:	56                   	push   %esi
 44c:	53                   	push   %ebx
 44d:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 450:	8d 45 10             	lea    0x10(%ebp),%eax
 453:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 456:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 45b:	bb 00 00 00 00       	mov    $0x0,%ebx
 460:	eb 14                	jmp    476 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 462:	89 fa                	mov    %edi,%edx
 464:	8b 45 08             	mov    0x8(%ebp),%eax
 467:	e8 36 ff ff ff       	call   3a2 <putc>
 46c:	eb 05                	jmp    473 <printf+0x2c>
      }
    } else if(state == '%'){
 46e:	83 fe 25             	cmp    $0x25,%esi
 471:	74 25                	je     498 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 473:	83 c3 01             	add    $0x1,%ebx
 476:	8b 45 0c             	mov    0xc(%ebp),%eax
 479:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 47d:	84 c0                	test   %al,%al
 47f:	0f 84 20 01 00 00    	je     5a5 <printf+0x15e>
    c = fmt[i] & 0xff;
 485:	0f be f8             	movsbl %al,%edi
 488:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 48b:	85 f6                	test   %esi,%esi
 48d:	75 df                	jne    46e <printf+0x27>
      if(c == '%'){
 48f:	83 f8 25             	cmp    $0x25,%eax
 492:	75 ce                	jne    462 <printf+0x1b>
        state = '%';
 494:	89 c6                	mov    %eax,%esi
 496:	eb db                	jmp    473 <printf+0x2c>
      if(c == 'd'){
 498:	83 f8 25             	cmp    $0x25,%eax
 49b:	0f 84 cf 00 00 00    	je     570 <printf+0x129>
 4a1:	0f 8c dd 00 00 00    	jl     584 <printf+0x13d>
 4a7:	83 f8 78             	cmp    $0x78,%eax
 4aa:	0f 8f d4 00 00 00    	jg     584 <printf+0x13d>
 4b0:	83 f8 63             	cmp    $0x63,%eax
 4b3:	0f 8c cb 00 00 00    	jl     584 <printf+0x13d>
 4b9:	83 e8 63             	sub    $0x63,%eax
 4bc:	83 f8 15             	cmp    $0x15,%eax
 4bf:	0f 87 bf 00 00 00    	ja     584 <printf+0x13d>
 4c5:	ff 24 85 34 07 00 00 	jmp    *0x734(,%eax,4)
        printint(fd, *ap, 10, 1);
 4cc:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4cf:	8b 17                	mov    (%edi),%edx
 4d1:	83 ec 0c             	sub    $0xc,%esp
 4d4:	6a 01                	push   $0x1
 4d6:	b9 0a 00 00 00       	mov    $0xa,%ecx
 4db:	8b 45 08             	mov    0x8(%ebp),%eax
 4de:	e8 d9 fe ff ff       	call   3bc <printint>
        ap++;
 4e3:	83 c7 04             	add    $0x4,%edi
 4e6:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 4e9:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 4ec:	be 00 00 00 00       	mov    $0x0,%esi
 4f1:	eb 80                	jmp    473 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 4f3:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4f6:	8b 17                	mov    (%edi),%edx
 4f8:	83 ec 0c             	sub    $0xc,%esp
 4fb:	6a 00                	push   $0x0
 4fd:	b9 10 00 00 00       	mov    $0x10,%ecx
 502:	8b 45 08             	mov    0x8(%ebp),%eax
 505:	e8 b2 fe ff ff       	call   3bc <printint>
        ap++;
 50a:	83 c7 04             	add    $0x4,%edi
 50d:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 510:	83 c4 10             	add    $0x10,%esp
      state = 0;
 513:	be 00 00 00 00       	mov    $0x0,%esi
 518:	e9 56 ff ff ff       	jmp    473 <printf+0x2c>
        s = (char*)*ap;
 51d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 520:	8b 30                	mov    (%eax),%esi
        ap++;
 522:	83 c0 04             	add    $0x4,%eax
 525:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 528:	85 f6                	test   %esi,%esi
 52a:	75 15                	jne    541 <printf+0xfa>
          s = "(null)";
 52c:	be 2c 07 00 00       	mov    $0x72c,%esi
 531:	eb 0e                	jmp    541 <printf+0xfa>
          putc(fd, *s);
 533:	0f be d2             	movsbl %dl,%edx
 536:	8b 45 08             	mov    0x8(%ebp),%eax
 539:	e8 64 fe ff ff       	call   3a2 <putc>
          s++;
 53e:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 541:	0f b6 16             	movzbl (%esi),%edx
 544:	84 d2                	test   %dl,%dl
 546:	75 eb                	jne    533 <printf+0xec>
      state = 0;
 548:	be 00 00 00 00       	mov    $0x0,%esi
 54d:	e9 21 ff ff ff       	jmp    473 <printf+0x2c>
        putc(fd, *ap);
 552:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 555:	0f be 17             	movsbl (%edi),%edx
 558:	8b 45 08             	mov    0x8(%ebp),%eax
 55b:	e8 42 fe ff ff       	call   3a2 <putc>
        ap++;
 560:	83 c7 04             	add    $0x4,%edi
 563:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 566:	be 00 00 00 00       	mov    $0x0,%esi
 56b:	e9 03 ff ff ff       	jmp    473 <printf+0x2c>
        putc(fd, c);
 570:	89 fa                	mov    %edi,%edx
 572:	8b 45 08             	mov    0x8(%ebp),%eax
 575:	e8 28 fe ff ff       	call   3a2 <putc>
      state = 0;
 57a:	be 00 00 00 00       	mov    $0x0,%esi
 57f:	e9 ef fe ff ff       	jmp    473 <printf+0x2c>
        putc(fd, '%');
 584:	ba 25 00 00 00       	mov    $0x25,%edx
 589:	8b 45 08             	mov    0x8(%ebp),%eax
 58c:	e8 11 fe ff ff       	call   3a2 <putc>
        putc(fd, c);
 591:	89 fa                	mov    %edi,%edx
 593:	8b 45 08             	mov    0x8(%ebp),%eax
 596:	e8 07 fe ff ff       	call   3a2 <putc>
      state = 0;
 59b:	be 00 00 00 00       	mov    $0x0,%esi
 5a0:	e9 ce fe ff ff       	jmp    473 <printf+0x2c>
    }
  }
}
 5a5:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5a8:	5b                   	pop    %ebx
 5a9:	5e                   	pop    %esi
 5aa:	5f                   	pop    %edi
 5ab:	5d                   	pop    %ebp
 5ac:	c3                   	ret    

000005ad <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5ad:	55                   	push   %ebp
 5ae:	89 e5                	mov    %esp,%ebp
 5b0:	57                   	push   %edi
 5b1:	56                   	push   %esi
 5b2:	53                   	push   %ebx
 5b3:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 5b6:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5b9:	a1 20 0d 00 00       	mov    0xd20,%eax
 5be:	eb 02                	jmp    5c2 <free+0x15>
 5c0:	89 d0                	mov    %edx,%eax
 5c2:	39 c8                	cmp    %ecx,%eax
 5c4:	73 04                	jae    5ca <free+0x1d>
 5c6:	39 08                	cmp    %ecx,(%eax)
 5c8:	77 12                	ja     5dc <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5ca:	8b 10                	mov    (%eax),%edx
 5cc:	39 c2                	cmp    %eax,%edx
 5ce:	77 f0                	ja     5c0 <free+0x13>
 5d0:	39 c8                	cmp    %ecx,%eax
 5d2:	72 08                	jb     5dc <free+0x2f>
 5d4:	39 ca                	cmp    %ecx,%edx
 5d6:	77 04                	ja     5dc <free+0x2f>
 5d8:	89 d0                	mov    %edx,%eax
 5da:	eb e6                	jmp    5c2 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 5dc:	8b 73 fc             	mov    -0x4(%ebx),%esi
 5df:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 5e2:	8b 10                	mov    (%eax),%edx
 5e4:	39 d7                	cmp    %edx,%edi
 5e6:	74 19                	je     601 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 5e8:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 5eb:	8b 50 04             	mov    0x4(%eax),%edx
 5ee:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 5f1:	39 ce                	cmp    %ecx,%esi
 5f3:	74 1b                	je     610 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 5f5:	89 08                	mov    %ecx,(%eax)
  freep = p;
 5f7:	a3 20 0d 00 00       	mov    %eax,0xd20
}
 5fc:	5b                   	pop    %ebx
 5fd:	5e                   	pop    %esi
 5fe:	5f                   	pop    %edi
 5ff:	5d                   	pop    %ebp
 600:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 601:	03 72 04             	add    0x4(%edx),%esi
 604:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 607:	8b 10                	mov    (%eax),%edx
 609:	8b 12                	mov    (%edx),%edx
 60b:	89 53 f8             	mov    %edx,-0x8(%ebx)
 60e:	eb db                	jmp    5eb <free+0x3e>
    p->s.size += bp->s.size;
 610:	03 53 fc             	add    -0x4(%ebx),%edx
 613:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 616:	8b 53 f8             	mov    -0x8(%ebx),%edx
 619:	89 10                	mov    %edx,(%eax)
 61b:	eb da                	jmp    5f7 <free+0x4a>

0000061d <morecore>:

static Header*
morecore(uint nu)
{
 61d:	55                   	push   %ebp
 61e:	89 e5                	mov    %esp,%ebp
 620:	53                   	push   %ebx
 621:	83 ec 04             	sub    $0x4,%esp
 624:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 626:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 62b:	77 05                	ja     632 <morecore+0x15>
    nu = 4096;
 62d:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 632:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 639:	83 ec 0c             	sub    $0xc,%esp
 63c:	50                   	push   %eax
 63d:	e8 38 fd ff ff       	call   37a <sbrk>
  if(p == (char*)-1)
 642:	83 c4 10             	add    $0x10,%esp
 645:	83 f8 ff             	cmp    $0xffffffff,%eax
 648:	74 1c                	je     666 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 64a:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 64d:	83 c0 08             	add    $0x8,%eax
 650:	83 ec 0c             	sub    $0xc,%esp
 653:	50                   	push   %eax
 654:	e8 54 ff ff ff       	call   5ad <free>
  return freep;
 659:	a1 20 0d 00 00       	mov    0xd20,%eax
 65e:	83 c4 10             	add    $0x10,%esp
}
 661:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 664:	c9                   	leave  
 665:	c3                   	ret    
    return 0;
 666:	b8 00 00 00 00       	mov    $0x0,%eax
 66b:	eb f4                	jmp    661 <morecore+0x44>

0000066d <malloc>:

void*
malloc(uint nbytes)
{
 66d:	55                   	push   %ebp
 66e:	89 e5                	mov    %esp,%ebp
 670:	53                   	push   %ebx
 671:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 674:	8b 45 08             	mov    0x8(%ebp),%eax
 677:	8d 58 07             	lea    0x7(%eax),%ebx
 67a:	c1 eb 03             	shr    $0x3,%ebx
 67d:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 680:	8b 0d 20 0d 00 00    	mov    0xd20,%ecx
 686:	85 c9                	test   %ecx,%ecx
 688:	74 04                	je     68e <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 68a:	8b 01                	mov    (%ecx),%eax
 68c:	eb 4a                	jmp    6d8 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 68e:	c7 05 20 0d 00 00 24 	movl   $0xd24,0xd20
 695:	0d 00 00 
 698:	c7 05 24 0d 00 00 24 	movl   $0xd24,0xd24
 69f:	0d 00 00 
    base.s.size = 0;
 6a2:	c7 05 28 0d 00 00 00 	movl   $0x0,0xd28
 6a9:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 6ac:	b9 24 0d 00 00       	mov    $0xd24,%ecx
 6b1:	eb d7                	jmp    68a <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 6b3:	74 19                	je     6ce <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 6b5:	29 da                	sub    %ebx,%edx
 6b7:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 6ba:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 6bd:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 6c0:	89 0d 20 0d 00 00    	mov    %ecx,0xd20
      return (void*)(p + 1);
 6c6:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 6c9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 6cc:	c9                   	leave  
 6cd:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 6ce:	8b 10                	mov    (%eax),%edx
 6d0:	89 11                	mov    %edx,(%ecx)
 6d2:	eb ec                	jmp    6c0 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6d4:	89 c1                	mov    %eax,%ecx
 6d6:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 6d8:	8b 50 04             	mov    0x4(%eax),%edx
 6db:	39 da                	cmp    %ebx,%edx
 6dd:	73 d4                	jae    6b3 <malloc+0x46>
    if(p == freep)
 6df:	39 05 20 0d 00 00    	cmp    %eax,0xd20
 6e5:	75 ed                	jne    6d4 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 6e7:	89 d8                	mov    %ebx,%eax
 6e9:	e8 2f ff ff ff       	call   61d <morecore>
 6ee:	85 c0                	test   %eax,%eax
 6f0:	75 e2                	jne    6d4 <malloc+0x67>
 6f2:	eb d5                	jmp    6c9 <malloc+0x5c>
