
_stressfs:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "fs.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	56                   	push   %esi
   e:	53                   	push   %ebx
   f:	51                   	push   %ecx
  10:	81 ec 24 02 00 00    	sub    $0x224,%esp
  int fd, i;
  char path[] = "stressfs0";
  16:	c7 45 de 73 74 72 65 	movl   $0x65727473,-0x22(%ebp)
  1d:	c7 45 e2 73 73 66 73 	movl   $0x73667373,-0x1e(%ebp)
  24:	66 c7 45 e6 30 00    	movw   $0x30,-0x1a(%ebp)
  char data[512];

  printf(1, "stressfs starting\n");
  2a:	68 18 07 00 00       	push   $0x718
  2f:	6a 01                	push   $0x1
  31:	e8 35 04 00 00       	call   46b <printf>
  memset(data, 'a', sizeof(data));
  36:	83 c4 0c             	add    $0xc,%esp
  39:	68 00 02 00 00       	push   $0x200
  3e:	6a 61                	push   $0x61
  40:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  46:	50                   	push   %eax
  47:	e8 8f 01 00 00       	call   1db <memset>

  for(i = 0; i < 4; i++)
  4c:	83 c4 10             	add    $0x10,%esp
  4f:	bb 00 00 00 00       	mov    $0x0,%ebx
  54:	83 fb 03             	cmp    $0x3,%ebx
  57:	7f 0e                	jg     67 <main+0x67>
    if(fork() > 0)
  59:	e8 b0 02 00 00       	call   30e <fork>
  5e:	85 c0                	test   %eax,%eax
  60:	7f 05                	jg     67 <main+0x67>
  for(i = 0; i < 4; i++)
  62:	83 c3 01             	add    $0x1,%ebx
  65:	eb ed                	jmp    54 <main+0x54>
      break;

  printf(1, "write %d\n", i);
  67:	83 ec 04             	sub    $0x4,%esp
  6a:	53                   	push   %ebx
  6b:	68 2b 07 00 00       	push   $0x72b
  70:	6a 01                	push   $0x1
  72:	e8 f4 03 00 00       	call   46b <printf>

  path[8] += i;
  77:	00 5d e6             	add    %bl,-0x1a(%ebp)
  fd = open(path, O_CREATE | O_RDWR);
  7a:	83 c4 08             	add    $0x8,%esp
  7d:	68 02 02 00 00       	push   $0x202
  82:	8d 45 de             	lea    -0x22(%ebp),%eax
  85:	50                   	push   %eax
  86:	e8 cb 02 00 00       	call   356 <open>
  8b:	89 c6                	mov    %eax,%esi
  for(i = 0; i < 20; i++)
  8d:	83 c4 10             	add    $0x10,%esp
  90:	bb 00 00 00 00       	mov    $0x0,%ebx
  95:	eb 1b                	jmp    b2 <main+0xb2>
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
  97:	83 ec 04             	sub    $0x4,%esp
  9a:	68 00 02 00 00       	push   $0x200
  9f:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  a5:	50                   	push   %eax
  a6:	56                   	push   %esi
  a7:	e8 8a 02 00 00       	call   336 <write>
  for(i = 0; i < 20; i++)
  ac:	83 c3 01             	add    $0x1,%ebx
  af:	83 c4 10             	add    $0x10,%esp
  b2:	83 fb 13             	cmp    $0x13,%ebx
  b5:	7e e0                	jle    97 <main+0x97>
  close(fd);
  b7:	83 ec 0c             	sub    $0xc,%esp
  ba:	56                   	push   %esi
  bb:	e8 7e 02 00 00       	call   33e <close>

  printf(1, "read\n");
  c0:	83 c4 08             	add    $0x8,%esp
  c3:	68 35 07 00 00       	push   $0x735
  c8:	6a 01                	push   $0x1
  ca:	e8 9c 03 00 00       	call   46b <printf>

  fd = open(path, O_RDONLY);
  cf:	83 c4 08             	add    $0x8,%esp
  d2:	6a 00                	push   $0x0
  d4:	8d 45 de             	lea    -0x22(%ebp),%eax
  d7:	50                   	push   %eax
  d8:	e8 79 02 00 00       	call   356 <open>
  dd:	89 c6                	mov    %eax,%esi
  for (i = 0; i < 20; i++)
  df:	83 c4 10             	add    $0x10,%esp
  e2:	bb 00 00 00 00       	mov    $0x0,%ebx
  e7:	eb 1b                	jmp    104 <main+0x104>
    read(fd, data, sizeof(data));
  e9:	83 ec 04             	sub    $0x4,%esp
  ec:	68 00 02 00 00       	push   $0x200
  f1:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  f7:	50                   	push   %eax
  f8:	56                   	push   %esi
  f9:	e8 30 02 00 00       	call   32e <read>
  for (i = 0; i < 20; i++)
  fe:	83 c3 01             	add    $0x1,%ebx
 101:	83 c4 10             	add    $0x10,%esp
 104:	83 fb 13             	cmp    $0x13,%ebx
 107:	7e e0                	jle    e9 <main+0xe9>
  close(fd);
 109:	83 ec 0c             	sub    $0xc,%esp
 10c:	56                   	push   %esi
 10d:	e8 2c 02 00 00       	call   33e <close>

  wait();
 112:	e8 07 02 00 00       	call   31e <wait>

  exit();
 117:	e8 fa 01 00 00       	call   316 <exit>

0000011c <test_and_set>:
#include "fcntl.h"
#include "user.h"
#include "x86.h"
#include "mmu.h"

int test_and_set(int *old_ptr, int new_ptr) {
 11c:	55                   	push   %ebp
 11d:	89 e5                	mov    %esp,%ebp
 11f:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *old_ptr;
 122:	8b 10                	mov    (%eax),%edx
  *old_ptr = new_ptr;
 124:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 127:	89 08                	mov    %ecx,(%eax)
  return old;
}
 129:	89 d0                	mov    %edx,%eax
 12b:	5d                   	pop    %ebp
 12c:	c3                   	ret    

0000012d <thread_create>:

  // I can't remember if there was something else to do here but I'm sure I'll find out


  return new_pid;
}
 12d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 132:	c3                   	ret    

00000133 <thread_join>:

int thread_join() {
  return 0;
}
 133:	b8 00 00 00 00       	mov    $0x0,%eax
 138:	c3                   	ret    

00000139 <lock_acquire>:

void lock_acquire(lock_t *lock){
 139:	55                   	push   %ebp
 13a:	89 e5                	mov    %esp,%ebp
 13c:	53                   	push   %ebx
 13d:	83 ec 04             	sub    $0x4,%esp
 140:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 143:	83 ec 08             	sub    $0x8,%esp
 146:	6a 01                	push   $0x1
 148:	53                   	push   %ebx
 149:	e8 ce ff ff ff       	call   11c <test_and_set>
 14e:	83 c4 10             	add    $0x10,%esp
 151:	83 f8 01             	cmp    $0x1,%eax
 154:	74 ed                	je     143 <lock_acquire+0xa>
    ;
}
 156:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 159:	c9                   	leave  
 15a:	c3                   	ret    

0000015b <lock_release>:

void lock_release(lock_t *lock) {
 15b:	55                   	push   %ebp
 15c:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 15e:	8b 45 08             	mov    0x8(%ebp),%eax
 161:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 167:	5d                   	pop    %ebp
 168:	c3                   	ret    

00000169 <lock_init>:

void lock_init(lock_t *lock) {
 169:	55                   	push   %ebp
 16a:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 16c:	8b 45 08             	mov    0x8(%ebp),%eax
 16f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 175:	5d                   	pop    %ebp
 176:	c3                   	ret    

00000177 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 177:	55                   	push   %ebp
 178:	89 e5                	mov    %esp,%ebp
 17a:	56                   	push   %esi
 17b:	53                   	push   %ebx
 17c:	8b 75 08             	mov    0x8(%ebp),%esi
 17f:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 182:	89 f0                	mov    %esi,%eax
 184:	89 d1                	mov    %edx,%ecx
 186:	83 c2 01             	add    $0x1,%edx
 189:	89 c3                	mov    %eax,%ebx
 18b:	83 c0 01             	add    $0x1,%eax
 18e:	0f b6 09             	movzbl (%ecx),%ecx
 191:	88 0b                	mov    %cl,(%ebx)
 193:	84 c9                	test   %cl,%cl
 195:	75 ed                	jne    184 <strcpy+0xd>
    ;
  return os;
}
 197:	89 f0                	mov    %esi,%eax
 199:	5b                   	pop    %ebx
 19a:	5e                   	pop    %esi
 19b:	5d                   	pop    %ebp
 19c:	c3                   	ret    

0000019d <strcmp>:

int
strcmp(const char *p, const char *q)
{
 19d:	55                   	push   %ebp
 19e:	89 e5                	mov    %esp,%ebp
 1a0:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1a3:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 1a6:	eb 06                	jmp    1ae <strcmp+0x11>
    p++, q++;
 1a8:	83 c1 01             	add    $0x1,%ecx
 1ab:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 1ae:	0f b6 01             	movzbl (%ecx),%eax
 1b1:	84 c0                	test   %al,%al
 1b3:	74 04                	je     1b9 <strcmp+0x1c>
 1b5:	3a 02                	cmp    (%edx),%al
 1b7:	74 ef                	je     1a8 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 1b9:	0f b6 c0             	movzbl %al,%eax
 1bc:	0f b6 12             	movzbl (%edx),%edx
 1bf:	29 d0                	sub    %edx,%eax
}
 1c1:	5d                   	pop    %ebp
 1c2:	c3                   	ret    

000001c3 <strlen>:

uint
strlen(const char *s)
{
 1c3:	55                   	push   %ebp
 1c4:	89 e5                	mov    %esp,%ebp
 1c6:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 1c9:	b8 00 00 00 00       	mov    $0x0,%eax
 1ce:	eb 03                	jmp    1d3 <strlen+0x10>
 1d0:	83 c0 01             	add    $0x1,%eax
 1d3:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 1d7:	75 f7                	jne    1d0 <strlen+0xd>
    ;
  return n;
}
 1d9:	5d                   	pop    %ebp
 1da:	c3                   	ret    

000001db <memset>:

void*
memset(void *dst, int c, uint n)
{
 1db:	55                   	push   %ebp
 1dc:	89 e5                	mov    %esp,%ebp
 1de:	57                   	push   %edi
 1df:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1e2:	89 d7                	mov    %edx,%edi
 1e4:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1e7:	8b 45 0c             	mov    0xc(%ebp),%eax
 1ea:	fc                   	cld    
 1eb:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1ed:	89 d0                	mov    %edx,%eax
 1ef:	8b 7d fc             	mov    -0x4(%ebp),%edi
 1f2:	c9                   	leave  
 1f3:	c3                   	ret    

000001f4 <strchr>:

char*
strchr(const char *s, char c)
{
 1f4:	55                   	push   %ebp
 1f5:	89 e5                	mov    %esp,%ebp
 1f7:	8b 45 08             	mov    0x8(%ebp),%eax
 1fa:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1fe:	eb 03                	jmp    203 <strchr+0xf>
 200:	83 c0 01             	add    $0x1,%eax
 203:	0f b6 10             	movzbl (%eax),%edx
 206:	84 d2                	test   %dl,%dl
 208:	74 06                	je     210 <strchr+0x1c>
    if(*s == c)
 20a:	38 ca                	cmp    %cl,%dl
 20c:	75 f2                	jne    200 <strchr+0xc>
 20e:	eb 05                	jmp    215 <strchr+0x21>
      return (char*)s;
  return 0;
 210:	b8 00 00 00 00       	mov    $0x0,%eax
}
 215:	5d                   	pop    %ebp
 216:	c3                   	ret    

00000217 <gets>:

char*
gets(char *buf, int max)
{
 217:	55                   	push   %ebp
 218:	89 e5                	mov    %esp,%ebp
 21a:	57                   	push   %edi
 21b:	56                   	push   %esi
 21c:	53                   	push   %ebx
 21d:	83 ec 1c             	sub    $0x1c,%esp
 220:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 223:	bb 00 00 00 00       	mov    $0x0,%ebx
 228:	89 de                	mov    %ebx,%esi
 22a:	83 c3 01             	add    $0x1,%ebx
 22d:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 230:	7d 2e                	jge    260 <gets+0x49>
    cc = read(0, &c, 1);
 232:	83 ec 04             	sub    $0x4,%esp
 235:	6a 01                	push   $0x1
 237:	8d 45 e7             	lea    -0x19(%ebp),%eax
 23a:	50                   	push   %eax
 23b:	6a 00                	push   $0x0
 23d:	e8 ec 00 00 00       	call   32e <read>
    if(cc < 1)
 242:	83 c4 10             	add    $0x10,%esp
 245:	85 c0                	test   %eax,%eax
 247:	7e 17                	jle    260 <gets+0x49>
      break;
    buf[i++] = c;
 249:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 24d:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 250:	3c 0a                	cmp    $0xa,%al
 252:	0f 94 c2             	sete   %dl
 255:	3c 0d                	cmp    $0xd,%al
 257:	0f 94 c0             	sete   %al
 25a:	08 c2                	or     %al,%dl
 25c:	74 ca                	je     228 <gets+0x11>
    buf[i++] = c;
 25e:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 260:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 264:	89 f8                	mov    %edi,%eax
 266:	8d 65 f4             	lea    -0xc(%ebp),%esp
 269:	5b                   	pop    %ebx
 26a:	5e                   	pop    %esi
 26b:	5f                   	pop    %edi
 26c:	5d                   	pop    %ebp
 26d:	c3                   	ret    

0000026e <stat>:

int
stat(const char *n, struct stat *st)
{
 26e:	55                   	push   %ebp
 26f:	89 e5                	mov    %esp,%ebp
 271:	56                   	push   %esi
 272:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 273:	83 ec 08             	sub    $0x8,%esp
 276:	6a 00                	push   $0x0
 278:	ff 75 08             	push   0x8(%ebp)
 27b:	e8 d6 00 00 00       	call   356 <open>
  if(fd < 0)
 280:	83 c4 10             	add    $0x10,%esp
 283:	85 c0                	test   %eax,%eax
 285:	78 24                	js     2ab <stat+0x3d>
 287:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 289:	83 ec 08             	sub    $0x8,%esp
 28c:	ff 75 0c             	push   0xc(%ebp)
 28f:	50                   	push   %eax
 290:	e8 d9 00 00 00       	call   36e <fstat>
 295:	89 c6                	mov    %eax,%esi
  close(fd);
 297:	89 1c 24             	mov    %ebx,(%esp)
 29a:	e8 9f 00 00 00       	call   33e <close>
  return r;
 29f:	83 c4 10             	add    $0x10,%esp
}
 2a2:	89 f0                	mov    %esi,%eax
 2a4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2a7:	5b                   	pop    %ebx
 2a8:	5e                   	pop    %esi
 2a9:	5d                   	pop    %ebp
 2aa:	c3                   	ret    
    return -1;
 2ab:	be ff ff ff ff       	mov    $0xffffffff,%esi
 2b0:	eb f0                	jmp    2a2 <stat+0x34>

000002b2 <atoi>:

int
atoi(const char *s)
{
 2b2:	55                   	push   %ebp
 2b3:	89 e5                	mov    %esp,%ebp
 2b5:	53                   	push   %ebx
 2b6:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 2b9:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 2be:	eb 10                	jmp    2d0 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 2c0:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 2c3:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 2c6:	83 c1 01             	add    $0x1,%ecx
 2c9:	0f be c0             	movsbl %al,%eax
 2cc:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 2d0:	0f b6 01             	movzbl (%ecx),%eax
 2d3:	8d 58 d0             	lea    -0x30(%eax),%ebx
 2d6:	80 fb 09             	cmp    $0x9,%bl
 2d9:	76 e5                	jbe    2c0 <atoi+0xe>
  return n;
}
 2db:	89 d0                	mov    %edx,%eax
 2dd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2e0:	c9                   	leave  
 2e1:	c3                   	ret    

000002e2 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2e2:	55                   	push   %ebp
 2e3:	89 e5                	mov    %esp,%ebp
 2e5:	56                   	push   %esi
 2e6:	53                   	push   %ebx
 2e7:	8b 75 08             	mov    0x8(%ebp),%esi
 2ea:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 2ed:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 2f0:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 2f2:	eb 0d                	jmp    301 <memmove+0x1f>
    *dst++ = *src++;
 2f4:	0f b6 01             	movzbl (%ecx),%eax
 2f7:	88 02                	mov    %al,(%edx)
 2f9:	8d 49 01             	lea    0x1(%ecx),%ecx
 2fc:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 2ff:	89 d8                	mov    %ebx,%eax
 301:	8d 58 ff             	lea    -0x1(%eax),%ebx
 304:	85 c0                	test   %eax,%eax
 306:	7f ec                	jg     2f4 <memmove+0x12>
  return vdst;
}
 308:	89 f0                	mov    %esi,%eax
 30a:	5b                   	pop    %ebx
 30b:	5e                   	pop    %esi
 30c:	5d                   	pop    %ebp
 30d:	c3                   	ret    

0000030e <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 30e:	b8 01 00 00 00       	mov    $0x1,%eax
 313:	cd 40                	int    $0x40
 315:	c3                   	ret    

00000316 <exit>:
SYSCALL(exit)
 316:	b8 02 00 00 00       	mov    $0x2,%eax
 31b:	cd 40                	int    $0x40
 31d:	c3                   	ret    

0000031e <wait>:
SYSCALL(wait)
 31e:	b8 03 00 00 00       	mov    $0x3,%eax
 323:	cd 40                	int    $0x40
 325:	c3                   	ret    

00000326 <pipe>:
SYSCALL(pipe)
 326:	b8 04 00 00 00       	mov    $0x4,%eax
 32b:	cd 40                	int    $0x40
 32d:	c3                   	ret    

0000032e <read>:
SYSCALL(read)
 32e:	b8 05 00 00 00       	mov    $0x5,%eax
 333:	cd 40                	int    $0x40
 335:	c3                   	ret    

00000336 <write>:
SYSCALL(write)
 336:	b8 10 00 00 00       	mov    $0x10,%eax
 33b:	cd 40                	int    $0x40
 33d:	c3                   	ret    

0000033e <close>:
SYSCALL(close)
 33e:	b8 15 00 00 00       	mov    $0x15,%eax
 343:	cd 40                	int    $0x40
 345:	c3                   	ret    

00000346 <kill>:
SYSCALL(kill)
 346:	b8 06 00 00 00       	mov    $0x6,%eax
 34b:	cd 40                	int    $0x40
 34d:	c3                   	ret    

0000034e <exec>:
SYSCALL(exec)
 34e:	b8 07 00 00 00       	mov    $0x7,%eax
 353:	cd 40                	int    $0x40
 355:	c3                   	ret    

00000356 <open>:
SYSCALL(open)
 356:	b8 0f 00 00 00       	mov    $0xf,%eax
 35b:	cd 40                	int    $0x40
 35d:	c3                   	ret    

0000035e <mknod>:
SYSCALL(mknod)
 35e:	b8 11 00 00 00       	mov    $0x11,%eax
 363:	cd 40                	int    $0x40
 365:	c3                   	ret    

00000366 <unlink>:
SYSCALL(unlink)
 366:	b8 12 00 00 00       	mov    $0x12,%eax
 36b:	cd 40                	int    $0x40
 36d:	c3                   	ret    

0000036e <fstat>:
SYSCALL(fstat)
 36e:	b8 08 00 00 00       	mov    $0x8,%eax
 373:	cd 40                	int    $0x40
 375:	c3                   	ret    

00000376 <link>:
SYSCALL(link)
 376:	b8 13 00 00 00       	mov    $0x13,%eax
 37b:	cd 40                	int    $0x40
 37d:	c3                   	ret    

0000037e <mkdir>:
SYSCALL(mkdir)
 37e:	b8 14 00 00 00       	mov    $0x14,%eax
 383:	cd 40                	int    $0x40
 385:	c3                   	ret    

00000386 <chdir>:
SYSCALL(chdir)
 386:	b8 09 00 00 00       	mov    $0x9,%eax
 38b:	cd 40                	int    $0x40
 38d:	c3                   	ret    

0000038e <dup>:
SYSCALL(dup)
 38e:	b8 0a 00 00 00       	mov    $0xa,%eax
 393:	cd 40                	int    $0x40
 395:	c3                   	ret    

00000396 <getpid>:
SYSCALL(getpid)
 396:	b8 0b 00 00 00       	mov    $0xb,%eax
 39b:	cd 40                	int    $0x40
 39d:	c3                   	ret    

0000039e <sbrk>:
SYSCALL(sbrk)
 39e:	b8 0c 00 00 00       	mov    $0xc,%eax
 3a3:	cd 40                	int    $0x40
 3a5:	c3                   	ret    

000003a6 <sleep>:
SYSCALL(sleep)
 3a6:	b8 0d 00 00 00       	mov    $0xd,%eax
 3ab:	cd 40                	int    $0x40
 3ad:	c3                   	ret    

000003ae <uptime>:
SYSCALL(uptime)
 3ae:	b8 0e 00 00 00       	mov    $0xe,%eax
 3b3:	cd 40                	int    $0x40
 3b5:	c3                   	ret    

000003b6 <clone>:
SYSCALL(clone)
 3b6:	b8 16 00 00 00       	mov    $0x16,%eax
 3bb:	cd 40                	int    $0x40
 3bd:	c3                   	ret    

000003be <join>:
 3be:	b8 17 00 00 00       	mov    $0x17,%eax
 3c3:	cd 40                	int    $0x40
 3c5:	c3                   	ret    

000003c6 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 3c6:	55                   	push   %ebp
 3c7:	89 e5                	mov    %esp,%ebp
 3c9:	83 ec 1c             	sub    $0x1c,%esp
 3cc:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 3cf:	6a 01                	push   $0x1
 3d1:	8d 55 f4             	lea    -0xc(%ebp),%edx
 3d4:	52                   	push   %edx
 3d5:	50                   	push   %eax
 3d6:	e8 5b ff ff ff       	call   336 <write>
}
 3db:	83 c4 10             	add    $0x10,%esp
 3de:	c9                   	leave  
 3df:	c3                   	ret    

000003e0 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 3e0:	55                   	push   %ebp
 3e1:	89 e5                	mov    %esp,%ebp
 3e3:	57                   	push   %edi
 3e4:	56                   	push   %esi
 3e5:	53                   	push   %ebx
 3e6:	83 ec 2c             	sub    $0x2c,%esp
 3e9:	89 45 d0             	mov    %eax,-0x30(%ebp)
 3ec:	89 d0                	mov    %edx,%eax
 3ee:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 3f0:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 3f4:	0f 95 c1             	setne  %cl
 3f7:	c1 ea 1f             	shr    $0x1f,%edx
 3fa:	84 d1                	test   %dl,%cl
 3fc:	74 44                	je     442 <printint+0x62>
    neg = 1;
    x = -xx;
 3fe:	f7 d8                	neg    %eax
 400:	89 c1                	mov    %eax,%ecx
    neg = 1;
 402:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 409:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 40e:	89 c8                	mov    %ecx,%eax
 410:	ba 00 00 00 00       	mov    $0x0,%edx
 415:	f7 f6                	div    %esi
 417:	89 df                	mov    %ebx,%edi
 419:	83 c3 01             	add    $0x1,%ebx
 41c:	0f b6 92 9c 07 00 00 	movzbl 0x79c(%edx),%edx
 423:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 427:	89 ca                	mov    %ecx,%edx
 429:	89 c1                	mov    %eax,%ecx
 42b:	39 d6                	cmp    %edx,%esi
 42d:	76 df                	jbe    40e <printint+0x2e>
  if(neg)
 42f:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 433:	74 31                	je     466 <printint+0x86>
    buf[i++] = '-';
 435:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 43a:	8d 5f 02             	lea    0x2(%edi),%ebx
 43d:	8b 75 d0             	mov    -0x30(%ebp),%esi
 440:	eb 17                	jmp    459 <printint+0x79>
    x = xx;
 442:	89 c1                	mov    %eax,%ecx
  neg = 0;
 444:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 44b:	eb bc                	jmp    409 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 44d:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 452:	89 f0                	mov    %esi,%eax
 454:	e8 6d ff ff ff       	call   3c6 <putc>
  while(--i >= 0)
 459:	83 eb 01             	sub    $0x1,%ebx
 45c:	79 ef                	jns    44d <printint+0x6d>
}
 45e:	83 c4 2c             	add    $0x2c,%esp
 461:	5b                   	pop    %ebx
 462:	5e                   	pop    %esi
 463:	5f                   	pop    %edi
 464:	5d                   	pop    %ebp
 465:	c3                   	ret    
 466:	8b 75 d0             	mov    -0x30(%ebp),%esi
 469:	eb ee                	jmp    459 <printint+0x79>

0000046b <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 46b:	55                   	push   %ebp
 46c:	89 e5                	mov    %esp,%ebp
 46e:	57                   	push   %edi
 46f:	56                   	push   %esi
 470:	53                   	push   %ebx
 471:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 474:	8d 45 10             	lea    0x10(%ebp),%eax
 477:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 47a:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 47f:	bb 00 00 00 00       	mov    $0x0,%ebx
 484:	eb 14                	jmp    49a <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 486:	89 fa                	mov    %edi,%edx
 488:	8b 45 08             	mov    0x8(%ebp),%eax
 48b:	e8 36 ff ff ff       	call   3c6 <putc>
 490:	eb 05                	jmp    497 <printf+0x2c>
      }
    } else if(state == '%'){
 492:	83 fe 25             	cmp    $0x25,%esi
 495:	74 25                	je     4bc <printf+0x51>
  for(i = 0; fmt[i]; i++){
 497:	83 c3 01             	add    $0x1,%ebx
 49a:	8b 45 0c             	mov    0xc(%ebp),%eax
 49d:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 4a1:	84 c0                	test   %al,%al
 4a3:	0f 84 20 01 00 00    	je     5c9 <printf+0x15e>
    c = fmt[i] & 0xff;
 4a9:	0f be f8             	movsbl %al,%edi
 4ac:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 4af:	85 f6                	test   %esi,%esi
 4b1:	75 df                	jne    492 <printf+0x27>
      if(c == '%'){
 4b3:	83 f8 25             	cmp    $0x25,%eax
 4b6:	75 ce                	jne    486 <printf+0x1b>
        state = '%';
 4b8:	89 c6                	mov    %eax,%esi
 4ba:	eb db                	jmp    497 <printf+0x2c>
      if(c == 'd'){
 4bc:	83 f8 25             	cmp    $0x25,%eax
 4bf:	0f 84 cf 00 00 00    	je     594 <printf+0x129>
 4c5:	0f 8c dd 00 00 00    	jl     5a8 <printf+0x13d>
 4cb:	83 f8 78             	cmp    $0x78,%eax
 4ce:	0f 8f d4 00 00 00    	jg     5a8 <printf+0x13d>
 4d4:	83 f8 63             	cmp    $0x63,%eax
 4d7:	0f 8c cb 00 00 00    	jl     5a8 <printf+0x13d>
 4dd:	83 e8 63             	sub    $0x63,%eax
 4e0:	83 f8 15             	cmp    $0x15,%eax
 4e3:	0f 87 bf 00 00 00    	ja     5a8 <printf+0x13d>
 4e9:	ff 24 85 44 07 00 00 	jmp    *0x744(,%eax,4)
        printint(fd, *ap, 10, 1);
 4f0:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4f3:	8b 17                	mov    (%edi),%edx
 4f5:	83 ec 0c             	sub    $0xc,%esp
 4f8:	6a 01                	push   $0x1
 4fa:	b9 0a 00 00 00       	mov    $0xa,%ecx
 4ff:	8b 45 08             	mov    0x8(%ebp),%eax
 502:	e8 d9 fe ff ff       	call   3e0 <printint>
        ap++;
 507:	83 c7 04             	add    $0x4,%edi
 50a:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 50d:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 510:	be 00 00 00 00       	mov    $0x0,%esi
 515:	eb 80                	jmp    497 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 517:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 51a:	8b 17                	mov    (%edi),%edx
 51c:	83 ec 0c             	sub    $0xc,%esp
 51f:	6a 00                	push   $0x0
 521:	b9 10 00 00 00       	mov    $0x10,%ecx
 526:	8b 45 08             	mov    0x8(%ebp),%eax
 529:	e8 b2 fe ff ff       	call   3e0 <printint>
        ap++;
 52e:	83 c7 04             	add    $0x4,%edi
 531:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 534:	83 c4 10             	add    $0x10,%esp
      state = 0;
 537:	be 00 00 00 00       	mov    $0x0,%esi
 53c:	e9 56 ff ff ff       	jmp    497 <printf+0x2c>
        s = (char*)*ap;
 541:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 544:	8b 30                	mov    (%eax),%esi
        ap++;
 546:	83 c0 04             	add    $0x4,%eax
 549:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 54c:	85 f6                	test   %esi,%esi
 54e:	75 15                	jne    565 <printf+0xfa>
          s = "(null)";
 550:	be 3b 07 00 00       	mov    $0x73b,%esi
 555:	eb 0e                	jmp    565 <printf+0xfa>
          putc(fd, *s);
 557:	0f be d2             	movsbl %dl,%edx
 55a:	8b 45 08             	mov    0x8(%ebp),%eax
 55d:	e8 64 fe ff ff       	call   3c6 <putc>
          s++;
 562:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 565:	0f b6 16             	movzbl (%esi),%edx
 568:	84 d2                	test   %dl,%dl
 56a:	75 eb                	jne    557 <printf+0xec>
      state = 0;
 56c:	be 00 00 00 00       	mov    $0x0,%esi
 571:	e9 21 ff ff ff       	jmp    497 <printf+0x2c>
        putc(fd, *ap);
 576:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 579:	0f be 17             	movsbl (%edi),%edx
 57c:	8b 45 08             	mov    0x8(%ebp),%eax
 57f:	e8 42 fe ff ff       	call   3c6 <putc>
        ap++;
 584:	83 c7 04             	add    $0x4,%edi
 587:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 58a:	be 00 00 00 00       	mov    $0x0,%esi
 58f:	e9 03 ff ff ff       	jmp    497 <printf+0x2c>
        putc(fd, c);
 594:	89 fa                	mov    %edi,%edx
 596:	8b 45 08             	mov    0x8(%ebp),%eax
 599:	e8 28 fe ff ff       	call   3c6 <putc>
      state = 0;
 59e:	be 00 00 00 00       	mov    $0x0,%esi
 5a3:	e9 ef fe ff ff       	jmp    497 <printf+0x2c>
        putc(fd, '%');
 5a8:	ba 25 00 00 00       	mov    $0x25,%edx
 5ad:	8b 45 08             	mov    0x8(%ebp),%eax
 5b0:	e8 11 fe ff ff       	call   3c6 <putc>
        putc(fd, c);
 5b5:	89 fa                	mov    %edi,%edx
 5b7:	8b 45 08             	mov    0x8(%ebp),%eax
 5ba:	e8 07 fe ff ff       	call   3c6 <putc>
      state = 0;
 5bf:	be 00 00 00 00       	mov    $0x0,%esi
 5c4:	e9 ce fe ff ff       	jmp    497 <printf+0x2c>
    }
  }
}
 5c9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5cc:	5b                   	pop    %ebx
 5cd:	5e                   	pop    %esi
 5ce:	5f                   	pop    %edi
 5cf:	5d                   	pop    %ebp
 5d0:	c3                   	ret    

000005d1 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5d1:	55                   	push   %ebp
 5d2:	89 e5                	mov    %esp,%ebp
 5d4:	57                   	push   %edi
 5d5:	56                   	push   %esi
 5d6:	53                   	push   %ebx
 5d7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 5da:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5dd:	a1 f0 0a 00 00       	mov    0xaf0,%eax
 5e2:	eb 02                	jmp    5e6 <free+0x15>
 5e4:	89 d0                	mov    %edx,%eax
 5e6:	39 c8                	cmp    %ecx,%eax
 5e8:	73 04                	jae    5ee <free+0x1d>
 5ea:	39 08                	cmp    %ecx,(%eax)
 5ec:	77 12                	ja     600 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5ee:	8b 10                	mov    (%eax),%edx
 5f0:	39 c2                	cmp    %eax,%edx
 5f2:	77 f0                	ja     5e4 <free+0x13>
 5f4:	39 c8                	cmp    %ecx,%eax
 5f6:	72 08                	jb     600 <free+0x2f>
 5f8:	39 ca                	cmp    %ecx,%edx
 5fa:	77 04                	ja     600 <free+0x2f>
 5fc:	89 d0                	mov    %edx,%eax
 5fe:	eb e6                	jmp    5e6 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 600:	8b 73 fc             	mov    -0x4(%ebx),%esi
 603:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 606:	8b 10                	mov    (%eax),%edx
 608:	39 d7                	cmp    %edx,%edi
 60a:	74 19                	je     625 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 60c:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 60f:	8b 50 04             	mov    0x4(%eax),%edx
 612:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 615:	39 ce                	cmp    %ecx,%esi
 617:	74 1b                	je     634 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 619:	89 08                	mov    %ecx,(%eax)
  freep = p;
 61b:	a3 f0 0a 00 00       	mov    %eax,0xaf0
}
 620:	5b                   	pop    %ebx
 621:	5e                   	pop    %esi
 622:	5f                   	pop    %edi
 623:	5d                   	pop    %ebp
 624:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 625:	03 72 04             	add    0x4(%edx),%esi
 628:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 62b:	8b 10                	mov    (%eax),%edx
 62d:	8b 12                	mov    (%edx),%edx
 62f:	89 53 f8             	mov    %edx,-0x8(%ebx)
 632:	eb db                	jmp    60f <free+0x3e>
    p->s.size += bp->s.size;
 634:	03 53 fc             	add    -0x4(%ebx),%edx
 637:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 63a:	8b 53 f8             	mov    -0x8(%ebx),%edx
 63d:	89 10                	mov    %edx,(%eax)
 63f:	eb da                	jmp    61b <free+0x4a>

00000641 <morecore>:

static Header*
morecore(uint nu)
{
 641:	55                   	push   %ebp
 642:	89 e5                	mov    %esp,%ebp
 644:	53                   	push   %ebx
 645:	83 ec 04             	sub    $0x4,%esp
 648:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 64a:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 64f:	77 05                	ja     656 <morecore+0x15>
    nu = 4096;
 651:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 656:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 65d:	83 ec 0c             	sub    $0xc,%esp
 660:	50                   	push   %eax
 661:	e8 38 fd ff ff       	call   39e <sbrk>
  if(p == (char*)-1)
 666:	83 c4 10             	add    $0x10,%esp
 669:	83 f8 ff             	cmp    $0xffffffff,%eax
 66c:	74 1c                	je     68a <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 66e:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 671:	83 c0 08             	add    $0x8,%eax
 674:	83 ec 0c             	sub    $0xc,%esp
 677:	50                   	push   %eax
 678:	e8 54 ff ff ff       	call   5d1 <free>
  return freep;
 67d:	a1 f0 0a 00 00       	mov    0xaf0,%eax
 682:	83 c4 10             	add    $0x10,%esp
}
 685:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 688:	c9                   	leave  
 689:	c3                   	ret    
    return 0;
 68a:	b8 00 00 00 00       	mov    $0x0,%eax
 68f:	eb f4                	jmp    685 <morecore+0x44>

00000691 <malloc>:

void*
malloc(uint nbytes)
{
 691:	55                   	push   %ebp
 692:	89 e5                	mov    %esp,%ebp
 694:	53                   	push   %ebx
 695:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 698:	8b 45 08             	mov    0x8(%ebp),%eax
 69b:	8d 58 07             	lea    0x7(%eax),%ebx
 69e:	c1 eb 03             	shr    $0x3,%ebx
 6a1:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 6a4:	8b 0d f0 0a 00 00    	mov    0xaf0,%ecx
 6aa:	85 c9                	test   %ecx,%ecx
 6ac:	74 04                	je     6b2 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6ae:	8b 01                	mov    (%ecx),%eax
 6b0:	eb 4a                	jmp    6fc <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 6b2:	c7 05 f0 0a 00 00 f4 	movl   $0xaf4,0xaf0
 6b9:	0a 00 00 
 6bc:	c7 05 f4 0a 00 00 f4 	movl   $0xaf4,0xaf4
 6c3:	0a 00 00 
    base.s.size = 0;
 6c6:	c7 05 f8 0a 00 00 00 	movl   $0x0,0xaf8
 6cd:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 6d0:	b9 f4 0a 00 00       	mov    $0xaf4,%ecx
 6d5:	eb d7                	jmp    6ae <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 6d7:	74 19                	je     6f2 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 6d9:	29 da                	sub    %ebx,%edx
 6db:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 6de:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 6e1:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 6e4:	89 0d f0 0a 00 00    	mov    %ecx,0xaf0
      return (void*)(p + 1);
 6ea:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 6ed:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 6f0:	c9                   	leave  
 6f1:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 6f2:	8b 10                	mov    (%eax),%edx
 6f4:	89 11                	mov    %edx,(%ecx)
 6f6:	eb ec                	jmp    6e4 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6f8:	89 c1                	mov    %eax,%ecx
 6fa:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 6fc:	8b 50 04             	mov    0x4(%eax),%edx
 6ff:	39 da                	cmp    %ebx,%edx
 701:	73 d4                	jae    6d7 <malloc+0x46>
    if(p == freep)
 703:	39 05 f0 0a 00 00    	cmp    %eax,0xaf0
 709:	75 ed                	jne    6f8 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 70b:	89 d8                	mov    %ebx,%eax
 70d:	e8 2f ff ff ff       	call   641 <morecore>
 712:	85 c0                	test   %eax,%eax
 714:	75 e2                	jne    6f8 <malloc+0x67>
 716:	eb d5                	jmp    6ed <malloc+0x5c>
