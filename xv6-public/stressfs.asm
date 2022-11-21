
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
  2a:	68 44 07 00 00       	push   $0x744
  2f:	6a 01                	push   $0x1
  31:	e8 61 04 00 00       	call   497 <printf>
  memset(data, 'a', sizeof(data));
  36:	83 c4 0c             	add    $0xc,%esp
  39:	68 00 02 00 00       	push   $0x200
  3e:	6a 61                	push   $0x61
  40:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  46:	50                   	push   %eax
  47:	e8 bb 01 00 00       	call   207 <memset>

  for(i = 0; i < 4; i++)
  4c:	83 c4 10             	add    $0x10,%esp
  4f:	bb 00 00 00 00       	mov    $0x0,%ebx
  54:	83 fb 03             	cmp    $0x3,%ebx
  57:	7f 0e                	jg     67 <main+0x67>
    if(fork() > 0)
  59:	e8 dc 02 00 00       	call   33a <fork>
  5e:	85 c0                	test   %eax,%eax
  60:	7f 05                	jg     67 <main+0x67>
  for(i = 0; i < 4; i++)
  62:	83 c3 01             	add    $0x1,%ebx
  65:	eb ed                	jmp    54 <main+0x54>
      break;

  printf(1, "write %d\n", i);
  67:	83 ec 04             	sub    $0x4,%esp
  6a:	53                   	push   %ebx
  6b:	68 57 07 00 00       	push   $0x757
  70:	6a 01                	push   $0x1
  72:	e8 20 04 00 00       	call   497 <printf>

  path[8] += i;
  77:	00 5d e6             	add    %bl,-0x1a(%ebp)
  fd = open(path, O_CREATE | O_RDWR);
  7a:	83 c4 08             	add    $0x8,%esp
  7d:	68 02 02 00 00       	push   $0x202
  82:	8d 45 de             	lea    -0x22(%ebp),%eax
  85:	50                   	push   %eax
  86:	e8 f7 02 00 00       	call   382 <open>
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
  a7:	e8 b6 02 00 00       	call   362 <write>
  for(i = 0; i < 20; i++)
  ac:	83 c3 01             	add    $0x1,%ebx
  af:	83 c4 10             	add    $0x10,%esp
  b2:	83 fb 13             	cmp    $0x13,%ebx
  b5:	7e e0                	jle    97 <main+0x97>
  close(fd);
  b7:	83 ec 0c             	sub    $0xc,%esp
  ba:	56                   	push   %esi
  bb:	e8 aa 02 00 00       	call   36a <close>

  printf(1, "read\n");
  c0:	83 c4 08             	add    $0x8,%esp
  c3:	68 61 07 00 00       	push   $0x761
  c8:	6a 01                	push   $0x1
  ca:	e8 c8 03 00 00       	call   497 <printf>

  fd = open(path, O_RDONLY);
  cf:	83 c4 08             	add    $0x8,%esp
  d2:	6a 00                	push   $0x0
  d4:	8d 45 de             	lea    -0x22(%ebp),%eax
  d7:	50                   	push   %eax
  d8:	e8 a5 02 00 00       	call   382 <open>
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
  f9:	e8 5c 02 00 00       	call   35a <read>
  for (i = 0; i < 20; i++)
  fe:	83 c3 01             	add    $0x1,%ebx
 101:	83 c4 10             	add    $0x10,%esp
 104:	83 fb 13             	cmp    $0x13,%ebx
 107:	7e e0                	jle    e9 <main+0xe9>
  close(fd);
 109:	83 ec 0c             	sub    $0xc,%esp
 10c:	56                   	push   %esi
 10d:	e8 58 02 00 00       	call   36a <close>

  wait();
 112:	e8 33 02 00 00       	call   34a <wait>

  exit();
 117:	e8 26 02 00 00       	call   342 <exit>

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

// a wrapper func for clone
int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 12d:	55                   	push   %ebp
 12e:	89 e5                	mov    %esp,%ebp
 130:	83 ec 14             	sub    $0x14,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE);
 133:	68 00 10 00 00       	push   $0x1000
 138:	e8 80 05 00 00       	call   6bd <malloc>
  if(n_stack == 0){
 13d:	83 c4 10             	add    $0x10,%esp
 140:	85 c0                	test   %eax,%eax
 142:	74 14                	je     158 <thread_create+0x2b>
    return -1;
  }
  int new_pid = clone(start_routine, arg1, arg2, n_stack); // TODO: is this the right way to call it?
 144:	50                   	push   %eax
 145:	ff 75 10             	push   0x10(%ebp)
 148:	ff 75 0c             	push   0xc(%ebp)
 14b:	ff 75 08             	push   0x8(%ebp)
 14e:	e8 8f 02 00 00       	call   3e2 <clone>


  // I can't remember if there was something else to do here but I'm sure I'll find out


  return new_pid;
 153:	83 c4 10             	add    $0x10,%esp
}
 156:	c9                   	leave  
 157:	c3                   	ret    
    return -1;
 158:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 15d:	eb f7                	jmp    156 <thread_create+0x29>

0000015f <thread_join>:

int thread_join() {
  return 0;
}
 15f:	b8 00 00 00 00       	mov    $0x0,%eax
 164:	c3                   	ret    

00000165 <lock_acquire>:

void lock_acquire(lock_t *lock){
 165:	55                   	push   %ebp
 166:	89 e5                	mov    %esp,%ebp
 168:	53                   	push   %ebx
 169:	83 ec 04             	sub    $0x4,%esp
 16c:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 16f:	83 ec 08             	sub    $0x8,%esp
 172:	6a 01                	push   $0x1
 174:	53                   	push   %ebx
 175:	e8 a2 ff ff ff       	call   11c <test_and_set>
 17a:	83 c4 10             	add    $0x10,%esp
 17d:	83 f8 01             	cmp    $0x1,%eax
 180:	74 ed                	je     16f <lock_acquire+0xa>
    ;
}
 182:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 185:	c9                   	leave  
 186:	c3                   	ret    

00000187 <lock_release>:

void lock_release(lock_t *lock) {
 187:	55                   	push   %ebp
 188:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 18a:	8b 45 08             	mov    0x8(%ebp),%eax
 18d:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 193:	5d                   	pop    %ebp
 194:	c3                   	ret    

00000195 <lock_init>:

void lock_init(lock_t *lock) {
 195:	55                   	push   %ebp
 196:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 198:	8b 45 08             	mov    0x8(%ebp),%eax
 19b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 1a1:	5d                   	pop    %ebp
 1a2:	c3                   	ret    

000001a3 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 1a3:	55                   	push   %ebp
 1a4:	89 e5                	mov    %esp,%ebp
 1a6:	56                   	push   %esi
 1a7:	53                   	push   %ebx
 1a8:	8b 75 08             	mov    0x8(%ebp),%esi
 1ab:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 1ae:	89 f0                	mov    %esi,%eax
 1b0:	89 d1                	mov    %edx,%ecx
 1b2:	83 c2 01             	add    $0x1,%edx
 1b5:	89 c3                	mov    %eax,%ebx
 1b7:	83 c0 01             	add    $0x1,%eax
 1ba:	0f b6 09             	movzbl (%ecx),%ecx
 1bd:	88 0b                	mov    %cl,(%ebx)
 1bf:	84 c9                	test   %cl,%cl
 1c1:	75 ed                	jne    1b0 <strcpy+0xd>
    ;
  return os;
}
 1c3:	89 f0                	mov    %esi,%eax
 1c5:	5b                   	pop    %ebx
 1c6:	5e                   	pop    %esi
 1c7:	5d                   	pop    %ebp
 1c8:	c3                   	ret    

000001c9 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1c9:	55                   	push   %ebp
 1ca:	89 e5                	mov    %esp,%ebp
 1cc:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1cf:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 1d2:	eb 06                	jmp    1da <strcmp+0x11>
    p++, q++;
 1d4:	83 c1 01             	add    $0x1,%ecx
 1d7:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 1da:	0f b6 01             	movzbl (%ecx),%eax
 1dd:	84 c0                	test   %al,%al
 1df:	74 04                	je     1e5 <strcmp+0x1c>
 1e1:	3a 02                	cmp    (%edx),%al
 1e3:	74 ef                	je     1d4 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 1e5:	0f b6 c0             	movzbl %al,%eax
 1e8:	0f b6 12             	movzbl (%edx),%edx
 1eb:	29 d0                	sub    %edx,%eax
}
 1ed:	5d                   	pop    %ebp
 1ee:	c3                   	ret    

000001ef <strlen>:

uint
strlen(const char *s)
{
 1ef:	55                   	push   %ebp
 1f0:	89 e5                	mov    %esp,%ebp
 1f2:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 1f5:	b8 00 00 00 00       	mov    $0x0,%eax
 1fa:	eb 03                	jmp    1ff <strlen+0x10>
 1fc:	83 c0 01             	add    $0x1,%eax
 1ff:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 203:	75 f7                	jne    1fc <strlen+0xd>
    ;
  return n;
}
 205:	5d                   	pop    %ebp
 206:	c3                   	ret    

00000207 <memset>:

void*
memset(void *dst, int c, uint n)
{
 207:	55                   	push   %ebp
 208:	89 e5                	mov    %esp,%ebp
 20a:	57                   	push   %edi
 20b:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 20e:	89 d7                	mov    %edx,%edi
 210:	8b 4d 10             	mov    0x10(%ebp),%ecx
 213:	8b 45 0c             	mov    0xc(%ebp),%eax
 216:	fc                   	cld    
 217:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 219:	89 d0                	mov    %edx,%eax
 21b:	8b 7d fc             	mov    -0x4(%ebp),%edi
 21e:	c9                   	leave  
 21f:	c3                   	ret    

00000220 <strchr>:

char*
strchr(const char *s, char c)
{
 220:	55                   	push   %ebp
 221:	89 e5                	mov    %esp,%ebp
 223:	8b 45 08             	mov    0x8(%ebp),%eax
 226:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 22a:	eb 03                	jmp    22f <strchr+0xf>
 22c:	83 c0 01             	add    $0x1,%eax
 22f:	0f b6 10             	movzbl (%eax),%edx
 232:	84 d2                	test   %dl,%dl
 234:	74 06                	je     23c <strchr+0x1c>
    if(*s == c)
 236:	38 ca                	cmp    %cl,%dl
 238:	75 f2                	jne    22c <strchr+0xc>
 23a:	eb 05                	jmp    241 <strchr+0x21>
      return (char*)s;
  return 0;
 23c:	b8 00 00 00 00       	mov    $0x0,%eax
}
 241:	5d                   	pop    %ebp
 242:	c3                   	ret    

00000243 <gets>:

char*
gets(char *buf, int max)
{
 243:	55                   	push   %ebp
 244:	89 e5                	mov    %esp,%ebp
 246:	57                   	push   %edi
 247:	56                   	push   %esi
 248:	53                   	push   %ebx
 249:	83 ec 1c             	sub    $0x1c,%esp
 24c:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 24f:	bb 00 00 00 00       	mov    $0x0,%ebx
 254:	89 de                	mov    %ebx,%esi
 256:	83 c3 01             	add    $0x1,%ebx
 259:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 25c:	7d 2e                	jge    28c <gets+0x49>
    cc = read(0, &c, 1);
 25e:	83 ec 04             	sub    $0x4,%esp
 261:	6a 01                	push   $0x1
 263:	8d 45 e7             	lea    -0x19(%ebp),%eax
 266:	50                   	push   %eax
 267:	6a 00                	push   $0x0
 269:	e8 ec 00 00 00       	call   35a <read>
    if(cc < 1)
 26e:	83 c4 10             	add    $0x10,%esp
 271:	85 c0                	test   %eax,%eax
 273:	7e 17                	jle    28c <gets+0x49>
      break;
    buf[i++] = c;
 275:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 279:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 27c:	3c 0a                	cmp    $0xa,%al
 27e:	0f 94 c2             	sete   %dl
 281:	3c 0d                	cmp    $0xd,%al
 283:	0f 94 c0             	sete   %al
 286:	08 c2                	or     %al,%dl
 288:	74 ca                	je     254 <gets+0x11>
    buf[i++] = c;
 28a:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 28c:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 290:	89 f8                	mov    %edi,%eax
 292:	8d 65 f4             	lea    -0xc(%ebp),%esp
 295:	5b                   	pop    %ebx
 296:	5e                   	pop    %esi
 297:	5f                   	pop    %edi
 298:	5d                   	pop    %ebp
 299:	c3                   	ret    

0000029a <stat>:

int
stat(const char *n, struct stat *st)
{
 29a:	55                   	push   %ebp
 29b:	89 e5                	mov    %esp,%ebp
 29d:	56                   	push   %esi
 29e:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 29f:	83 ec 08             	sub    $0x8,%esp
 2a2:	6a 00                	push   $0x0
 2a4:	ff 75 08             	push   0x8(%ebp)
 2a7:	e8 d6 00 00 00       	call   382 <open>
  if(fd < 0)
 2ac:	83 c4 10             	add    $0x10,%esp
 2af:	85 c0                	test   %eax,%eax
 2b1:	78 24                	js     2d7 <stat+0x3d>
 2b3:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 2b5:	83 ec 08             	sub    $0x8,%esp
 2b8:	ff 75 0c             	push   0xc(%ebp)
 2bb:	50                   	push   %eax
 2bc:	e8 d9 00 00 00       	call   39a <fstat>
 2c1:	89 c6                	mov    %eax,%esi
  close(fd);
 2c3:	89 1c 24             	mov    %ebx,(%esp)
 2c6:	e8 9f 00 00 00       	call   36a <close>
  return r;
 2cb:	83 c4 10             	add    $0x10,%esp
}
 2ce:	89 f0                	mov    %esi,%eax
 2d0:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2d3:	5b                   	pop    %ebx
 2d4:	5e                   	pop    %esi
 2d5:	5d                   	pop    %ebp
 2d6:	c3                   	ret    
    return -1;
 2d7:	be ff ff ff ff       	mov    $0xffffffff,%esi
 2dc:	eb f0                	jmp    2ce <stat+0x34>

000002de <atoi>:

int
atoi(const char *s)
{
 2de:	55                   	push   %ebp
 2df:	89 e5                	mov    %esp,%ebp
 2e1:	53                   	push   %ebx
 2e2:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 2e5:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 2ea:	eb 10                	jmp    2fc <atoi+0x1e>
    n = n*10 + *s++ - '0';
 2ec:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 2ef:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 2f2:	83 c1 01             	add    $0x1,%ecx
 2f5:	0f be c0             	movsbl %al,%eax
 2f8:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 2fc:	0f b6 01             	movzbl (%ecx),%eax
 2ff:	8d 58 d0             	lea    -0x30(%eax),%ebx
 302:	80 fb 09             	cmp    $0x9,%bl
 305:	76 e5                	jbe    2ec <atoi+0xe>
  return n;
}
 307:	89 d0                	mov    %edx,%eax
 309:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 30c:	c9                   	leave  
 30d:	c3                   	ret    

0000030e <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 30e:	55                   	push   %ebp
 30f:	89 e5                	mov    %esp,%ebp
 311:	56                   	push   %esi
 312:	53                   	push   %ebx
 313:	8b 75 08             	mov    0x8(%ebp),%esi
 316:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 319:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 31c:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 31e:	eb 0d                	jmp    32d <memmove+0x1f>
    *dst++ = *src++;
 320:	0f b6 01             	movzbl (%ecx),%eax
 323:	88 02                	mov    %al,(%edx)
 325:	8d 49 01             	lea    0x1(%ecx),%ecx
 328:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 32b:	89 d8                	mov    %ebx,%eax
 32d:	8d 58 ff             	lea    -0x1(%eax),%ebx
 330:	85 c0                	test   %eax,%eax
 332:	7f ec                	jg     320 <memmove+0x12>
  return vdst;
}
 334:	89 f0                	mov    %esi,%eax
 336:	5b                   	pop    %ebx
 337:	5e                   	pop    %esi
 338:	5d                   	pop    %ebp
 339:	c3                   	ret    

0000033a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 33a:	b8 01 00 00 00       	mov    $0x1,%eax
 33f:	cd 40                	int    $0x40
 341:	c3                   	ret    

00000342 <exit>:
SYSCALL(exit)
 342:	b8 02 00 00 00       	mov    $0x2,%eax
 347:	cd 40                	int    $0x40
 349:	c3                   	ret    

0000034a <wait>:
SYSCALL(wait)
 34a:	b8 03 00 00 00       	mov    $0x3,%eax
 34f:	cd 40                	int    $0x40
 351:	c3                   	ret    

00000352 <pipe>:
SYSCALL(pipe)
 352:	b8 04 00 00 00       	mov    $0x4,%eax
 357:	cd 40                	int    $0x40
 359:	c3                   	ret    

0000035a <read>:
SYSCALL(read)
 35a:	b8 05 00 00 00       	mov    $0x5,%eax
 35f:	cd 40                	int    $0x40
 361:	c3                   	ret    

00000362 <write>:
SYSCALL(write)
 362:	b8 10 00 00 00       	mov    $0x10,%eax
 367:	cd 40                	int    $0x40
 369:	c3                   	ret    

0000036a <close>:
SYSCALL(close)
 36a:	b8 15 00 00 00       	mov    $0x15,%eax
 36f:	cd 40                	int    $0x40
 371:	c3                   	ret    

00000372 <kill>:
SYSCALL(kill)
 372:	b8 06 00 00 00       	mov    $0x6,%eax
 377:	cd 40                	int    $0x40
 379:	c3                   	ret    

0000037a <exec>:
SYSCALL(exec)
 37a:	b8 07 00 00 00       	mov    $0x7,%eax
 37f:	cd 40                	int    $0x40
 381:	c3                   	ret    

00000382 <open>:
SYSCALL(open)
 382:	b8 0f 00 00 00       	mov    $0xf,%eax
 387:	cd 40                	int    $0x40
 389:	c3                   	ret    

0000038a <mknod>:
SYSCALL(mknod)
 38a:	b8 11 00 00 00       	mov    $0x11,%eax
 38f:	cd 40                	int    $0x40
 391:	c3                   	ret    

00000392 <unlink>:
SYSCALL(unlink)
 392:	b8 12 00 00 00       	mov    $0x12,%eax
 397:	cd 40                	int    $0x40
 399:	c3                   	ret    

0000039a <fstat>:
SYSCALL(fstat)
 39a:	b8 08 00 00 00       	mov    $0x8,%eax
 39f:	cd 40                	int    $0x40
 3a1:	c3                   	ret    

000003a2 <link>:
SYSCALL(link)
 3a2:	b8 13 00 00 00       	mov    $0x13,%eax
 3a7:	cd 40                	int    $0x40
 3a9:	c3                   	ret    

000003aa <mkdir>:
SYSCALL(mkdir)
 3aa:	b8 14 00 00 00       	mov    $0x14,%eax
 3af:	cd 40                	int    $0x40
 3b1:	c3                   	ret    

000003b2 <chdir>:
SYSCALL(chdir)
 3b2:	b8 09 00 00 00       	mov    $0x9,%eax
 3b7:	cd 40                	int    $0x40
 3b9:	c3                   	ret    

000003ba <dup>:
SYSCALL(dup)
 3ba:	b8 0a 00 00 00       	mov    $0xa,%eax
 3bf:	cd 40                	int    $0x40
 3c1:	c3                   	ret    

000003c2 <getpid>:
SYSCALL(getpid)
 3c2:	b8 0b 00 00 00       	mov    $0xb,%eax
 3c7:	cd 40                	int    $0x40
 3c9:	c3                   	ret    

000003ca <sbrk>:
SYSCALL(sbrk)
 3ca:	b8 0c 00 00 00       	mov    $0xc,%eax
 3cf:	cd 40                	int    $0x40
 3d1:	c3                   	ret    

000003d2 <sleep>:
SYSCALL(sleep)
 3d2:	b8 0d 00 00 00       	mov    $0xd,%eax
 3d7:	cd 40                	int    $0x40
 3d9:	c3                   	ret    

000003da <uptime>:
SYSCALL(uptime)
 3da:	b8 0e 00 00 00       	mov    $0xe,%eax
 3df:	cd 40                	int    $0x40
 3e1:	c3                   	ret    

000003e2 <clone>:
SYSCALL(clone)
 3e2:	b8 16 00 00 00       	mov    $0x16,%eax
 3e7:	cd 40                	int    $0x40
 3e9:	c3                   	ret    

000003ea <join>:
 3ea:	b8 17 00 00 00       	mov    $0x17,%eax
 3ef:	cd 40                	int    $0x40
 3f1:	c3                   	ret    

000003f2 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 3f2:	55                   	push   %ebp
 3f3:	89 e5                	mov    %esp,%ebp
 3f5:	83 ec 1c             	sub    $0x1c,%esp
 3f8:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 3fb:	6a 01                	push   $0x1
 3fd:	8d 55 f4             	lea    -0xc(%ebp),%edx
 400:	52                   	push   %edx
 401:	50                   	push   %eax
 402:	e8 5b ff ff ff       	call   362 <write>
}
 407:	83 c4 10             	add    $0x10,%esp
 40a:	c9                   	leave  
 40b:	c3                   	ret    

0000040c <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 40c:	55                   	push   %ebp
 40d:	89 e5                	mov    %esp,%ebp
 40f:	57                   	push   %edi
 410:	56                   	push   %esi
 411:	53                   	push   %ebx
 412:	83 ec 2c             	sub    $0x2c,%esp
 415:	89 45 d0             	mov    %eax,-0x30(%ebp)
 418:	89 d0                	mov    %edx,%eax
 41a:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 41c:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 420:	0f 95 c1             	setne  %cl
 423:	c1 ea 1f             	shr    $0x1f,%edx
 426:	84 d1                	test   %dl,%cl
 428:	74 44                	je     46e <printint+0x62>
    neg = 1;
    x = -xx;
 42a:	f7 d8                	neg    %eax
 42c:	89 c1                	mov    %eax,%ecx
    neg = 1;
 42e:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 435:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 43a:	89 c8                	mov    %ecx,%eax
 43c:	ba 00 00 00 00       	mov    $0x0,%edx
 441:	f7 f6                	div    %esi
 443:	89 df                	mov    %ebx,%edi
 445:	83 c3 01             	add    $0x1,%ebx
 448:	0f b6 92 c8 07 00 00 	movzbl 0x7c8(%edx),%edx
 44f:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 453:	89 ca                	mov    %ecx,%edx
 455:	89 c1                	mov    %eax,%ecx
 457:	39 d6                	cmp    %edx,%esi
 459:	76 df                	jbe    43a <printint+0x2e>
  if(neg)
 45b:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 45f:	74 31                	je     492 <printint+0x86>
    buf[i++] = '-';
 461:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 466:	8d 5f 02             	lea    0x2(%edi),%ebx
 469:	8b 75 d0             	mov    -0x30(%ebp),%esi
 46c:	eb 17                	jmp    485 <printint+0x79>
    x = xx;
 46e:	89 c1                	mov    %eax,%ecx
  neg = 0;
 470:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 477:	eb bc                	jmp    435 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 479:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 47e:	89 f0                	mov    %esi,%eax
 480:	e8 6d ff ff ff       	call   3f2 <putc>
  while(--i >= 0)
 485:	83 eb 01             	sub    $0x1,%ebx
 488:	79 ef                	jns    479 <printint+0x6d>
}
 48a:	83 c4 2c             	add    $0x2c,%esp
 48d:	5b                   	pop    %ebx
 48e:	5e                   	pop    %esi
 48f:	5f                   	pop    %edi
 490:	5d                   	pop    %ebp
 491:	c3                   	ret    
 492:	8b 75 d0             	mov    -0x30(%ebp),%esi
 495:	eb ee                	jmp    485 <printint+0x79>

00000497 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 497:	55                   	push   %ebp
 498:	89 e5                	mov    %esp,%ebp
 49a:	57                   	push   %edi
 49b:	56                   	push   %esi
 49c:	53                   	push   %ebx
 49d:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 4a0:	8d 45 10             	lea    0x10(%ebp),%eax
 4a3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 4a6:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 4ab:	bb 00 00 00 00       	mov    $0x0,%ebx
 4b0:	eb 14                	jmp    4c6 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 4b2:	89 fa                	mov    %edi,%edx
 4b4:	8b 45 08             	mov    0x8(%ebp),%eax
 4b7:	e8 36 ff ff ff       	call   3f2 <putc>
 4bc:	eb 05                	jmp    4c3 <printf+0x2c>
      }
    } else if(state == '%'){
 4be:	83 fe 25             	cmp    $0x25,%esi
 4c1:	74 25                	je     4e8 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 4c3:	83 c3 01             	add    $0x1,%ebx
 4c6:	8b 45 0c             	mov    0xc(%ebp),%eax
 4c9:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 4cd:	84 c0                	test   %al,%al
 4cf:	0f 84 20 01 00 00    	je     5f5 <printf+0x15e>
    c = fmt[i] & 0xff;
 4d5:	0f be f8             	movsbl %al,%edi
 4d8:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 4db:	85 f6                	test   %esi,%esi
 4dd:	75 df                	jne    4be <printf+0x27>
      if(c == '%'){
 4df:	83 f8 25             	cmp    $0x25,%eax
 4e2:	75 ce                	jne    4b2 <printf+0x1b>
        state = '%';
 4e4:	89 c6                	mov    %eax,%esi
 4e6:	eb db                	jmp    4c3 <printf+0x2c>
      if(c == 'd'){
 4e8:	83 f8 25             	cmp    $0x25,%eax
 4eb:	0f 84 cf 00 00 00    	je     5c0 <printf+0x129>
 4f1:	0f 8c dd 00 00 00    	jl     5d4 <printf+0x13d>
 4f7:	83 f8 78             	cmp    $0x78,%eax
 4fa:	0f 8f d4 00 00 00    	jg     5d4 <printf+0x13d>
 500:	83 f8 63             	cmp    $0x63,%eax
 503:	0f 8c cb 00 00 00    	jl     5d4 <printf+0x13d>
 509:	83 e8 63             	sub    $0x63,%eax
 50c:	83 f8 15             	cmp    $0x15,%eax
 50f:	0f 87 bf 00 00 00    	ja     5d4 <printf+0x13d>
 515:	ff 24 85 70 07 00 00 	jmp    *0x770(,%eax,4)
        printint(fd, *ap, 10, 1);
 51c:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 51f:	8b 17                	mov    (%edi),%edx
 521:	83 ec 0c             	sub    $0xc,%esp
 524:	6a 01                	push   $0x1
 526:	b9 0a 00 00 00       	mov    $0xa,%ecx
 52b:	8b 45 08             	mov    0x8(%ebp),%eax
 52e:	e8 d9 fe ff ff       	call   40c <printint>
        ap++;
 533:	83 c7 04             	add    $0x4,%edi
 536:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 539:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 53c:	be 00 00 00 00       	mov    $0x0,%esi
 541:	eb 80                	jmp    4c3 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 543:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 546:	8b 17                	mov    (%edi),%edx
 548:	83 ec 0c             	sub    $0xc,%esp
 54b:	6a 00                	push   $0x0
 54d:	b9 10 00 00 00       	mov    $0x10,%ecx
 552:	8b 45 08             	mov    0x8(%ebp),%eax
 555:	e8 b2 fe ff ff       	call   40c <printint>
        ap++;
 55a:	83 c7 04             	add    $0x4,%edi
 55d:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 560:	83 c4 10             	add    $0x10,%esp
      state = 0;
 563:	be 00 00 00 00       	mov    $0x0,%esi
 568:	e9 56 ff ff ff       	jmp    4c3 <printf+0x2c>
        s = (char*)*ap;
 56d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 570:	8b 30                	mov    (%eax),%esi
        ap++;
 572:	83 c0 04             	add    $0x4,%eax
 575:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 578:	85 f6                	test   %esi,%esi
 57a:	75 15                	jne    591 <printf+0xfa>
          s = "(null)";
 57c:	be 67 07 00 00       	mov    $0x767,%esi
 581:	eb 0e                	jmp    591 <printf+0xfa>
          putc(fd, *s);
 583:	0f be d2             	movsbl %dl,%edx
 586:	8b 45 08             	mov    0x8(%ebp),%eax
 589:	e8 64 fe ff ff       	call   3f2 <putc>
          s++;
 58e:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 591:	0f b6 16             	movzbl (%esi),%edx
 594:	84 d2                	test   %dl,%dl
 596:	75 eb                	jne    583 <printf+0xec>
      state = 0;
 598:	be 00 00 00 00       	mov    $0x0,%esi
 59d:	e9 21 ff ff ff       	jmp    4c3 <printf+0x2c>
        putc(fd, *ap);
 5a2:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5a5:	0f be 17             	movsbl (%edi),%edx
 5a8:	8b 45 08             	mov    0x8(%ebp),%eax
 5ab:	e8 42 fe ff ff       	call   3f2 <putc>
        ap++;
 5b0:	83 c7 04             	add    $0x4,%edi
 5b3:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 5b6:	be 00 00 00 00       	mov    $0x0,%esi
 5bb:	e9 03 ff ff ff       	jmp    4c3 <printf+0x2c>
        putc(fd, c);
 5c0:	89 fa                	mov    %edi,%edx
 5c2:	8b 45 08             	mov    0x8(%ebp),%eax
 5c5:	e8 28 fe ff ff       	call   3f2 <putc>
      state = 0;
 5ca:	be 00 00 00 00       	mov    $0x0,%esi
 5cf:	e9 ef fe ff ff       	jmp    4c3 <printf+0x2c>
        putc(fd, '%');
 5d4:	ba 25 00 00 00       	mov    $0x25,%edx
 5d9:	8b 45 08             	mov    0x8(%ebp),%eax
 5dc:	e8 11 fe ff ff       	call   3f2 <putc>
        putc(fd, c);
 5e1:	89 fa                	mov    %edi,%edx
 5e3:	8b 45 08             	mov    0x8(%ebp),%eax
 5e6:	e8 07 fe ff ff       	call   3f2 <putc>
      state = 0;
 5eb:	be 00 00 00 00       	mov    $0x0,%esi
 5f0:	e9 ce fe ff ff       	jmp    4c3 <printf+0x2c>
    }
  }
}
 5f5:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5f8:	5b                   	pop    %ebx
 5f9:	5e                   	pop    %esi
 5fa:	5f                   	pop    %edi
 5fb:	5d                   	pop    %ebp
 5fc:	c3                   	ret    

000005fd <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5fd:	55                   	push   %ebp
 5fe:	89 e5                	mov    %esp,%ebp
 600:	57                   	push   %edi
 601:	56                   	push   %esi
 602:	53                   	push   %ebx
 603:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 606:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 609:	a1 2c 0b 00 00       	mov    0xb2c,%eax
 60e:	eb 02                	jmp    612 <free+0x15>
 610:	89 d0                	mov    %edx,%eax
 612:	39 c8                	cmp    %ecx,%eax
 614:	73 04                	jae    61a <free+0x1d>
 616:	39 08                	cmp    %ecx,(%eax)
 618:	77 12                	ja     62c <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 61a:	8b 10                	mov    (%eax),%edx
 61c:	39 c2                	cmp    %eax,%edx
 61e:	77 f0                	ja     610 <free+0x13>
 620:	39 c8                	cmp    %ecx,%eax
 622:	72 08                	jb     62c <free+0x2f>
 624:	39 ca                	cmp    %ecx,%edx
 626:	77 04                	ja     62c <free+0x2f>
 628:	89 d0                	mov    %edx,%eax
 62a:	eb e6                	jmp    612 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 62c:	8b 73 fc             	mov    -0x4(%ebx),%esi
 62f:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 632:	8b 10                	mov    (%eax),%edx
 634:	39 d7                	cmp    %edx,%edi
 636:	74 19                	je     651 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 638:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 63b:	8b 50 04             	mov    0x4(%eax),%edx
 63e:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 641:	39 ce                	cmp    %ecx,%esi
 643:	74 1b                	je     660 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 645:	89 08                	mov    %ecx,(%eax)
  freep = p;
 647:	a3 2c 0b 00 00       	mov    %eax,0xb2c
}
 64c:	5b                   	pop    %ebx
 64d:	5e                   	pop    %esi
 64e:	5f                   	pop    %edi
 64f:	5d                   	pop    %ebp
 650:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 651:	03 72 04             	add    0x4(%edx),%esi
 654:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 657:	8b 10                	mov    (%eax),%edx
 659:	8b 12                	mov    (%edx),%edx
 65b:	89 53 f8             	mov    %edx,-0x8(%ebx)
 65e:	eb db                	jmp    63b <free+0x3e>
    p->s.size += bp->s.size;
 660:	03 53 fc             	add    -0x4(%ebx),%edx
 663:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 666:	8b 53 f8             	mov    -0x8(%ebx),%edx
 669:	89 10                	mov    %edx,(%eax)
 66b:	eb da                	jmp    647 <free+0x4a>

0000066d <morecore>:

static Header*
morecore(uint nu)
{
 66d:	55                   	push   %ebp
 66e:	89 e5                	mov    %esp,%ebp
 670:	53                   	push   %ebx
 671:	83 ec 04             	sub    $0x4,%esp
 674:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 676:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 67b:	77 05                	ja     682 <morecore+0x15>
    nu = 4096;
 67d:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 682:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 689:	83 ec 0c             	sub    $0xc,%esp
 68c:	50                   	push   %eax
 68d:	e8 38 fd ff ff       	call   3ca <sbrk>
  if(p == (char*)-1)
 692:	83 c4 10             	add    $0x10,%esp
 695:	83 f8 ff             	cmp    $0xffffffff,%eax
 698:	74 1c                	je     6b6 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 69a:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 69d:	83 c0 08             	add    $0x8,%eax
 6a0:	83 ec 0c             	sub    $0xc,%esp
 6a3:	50                   	push   %eax
 6a4:	e8 54 ff ff ff       	call   5fd <free>
  return freep;
 6a9:	a1 2c 0b 00 00       	mov    0xb2c,%eax
 6ae:	83 c4 10             	add    $0x10,%esp
}
 6b1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 6b4:	c9                   	leave  
 6b5:	c3                   	ret    
    return 0;
 6b6:	b8 00 00 00 00       	mov    $0x0,%eax
 6bb:	eb f4                	jmp    6b1 <morecore+0x44>

000006bd <malloc>:

void*
malloc(uint nbytes)
{
 6bd:	55                   	push   %ebp
 6be:	89 e5                	mov    %esp,%ebp
 6c0:	53                   	push   %ebx
 6c1:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6c4:	8b 45 08             	mov    0x8(%ebp),%eax
 6c7:	8d 58 07             	lea    0x7(%eax),%ebx
 6ca:	c1 eb 03             	shr    $0x3,%ebx
 6cd:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 6d0:	8b 0d 2c 0b 00 00    	mov    0xb2c,%ecx
 6d6:	85 c9                	test   %ecx,%ecx
 6d8:	74 04                	je     6de <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6da:	8b 01                	mov    (%ecx),%eax
 6dc:	eb 4a                	jmp    728 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 6de:	c7 05 2c 0b 00 00 30 	movl   $0xb30,0xb2c
 6e5:	0b 00 00 
 6e8:	c7 05 30 0b 00 00 30 	movl   $0xb30,0xb30
 6ef:	0b 00 00 
    base.s.size = 0;
 6f2:	c7 05 34 0b 00 00 00 	movl   $0x0,0xb34
 6f9:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 6fc:	b9 30 0b 00 00       	mov    $0xb30,%ecx
 701:	eb d7                	jmp    6da <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 703:	74 19                	je     71e <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 705:	29 da                	sub    %ebx,%edx
 707:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 70a:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 70d:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 710:	89 0d 2c 0b 00 00    	mov    %ecx,0xb2c
      return (void*)(p + 1);
 716:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 719:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 71c:	c9                   	leave  
 71d:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 71e:	8b 10                	mov    (%eax),%edx
 720:	89 11                	mov    %edx,(%ecx)
 722:	eb ec                	jmp    710 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 724:	89 c1                	mov    %eax,%ecx
 726:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 728:	8b 50 04             	mov    0x4(%eax),%edx
 72b:	39 da                	cmp    %ebx,%edx
 72d:	73 d4                	jae    703 <malloc+0x46>
    if(p == freep)
 72f:	39 05 2c 0b 00 00    	cmp    %eax,0xb2c
 735:	75 ed                	jne    724 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 737:	89 d8                	mov    %ebx,%eax
 739:	e8 2f ff ff ff       	call   66d <morecore>
 73e:	85 c0                	test   %eax,%eax
 740:	75 e2                	jne    724 <malloc+0x67>
 742:	eb d5                	jmp    719 <malloc+0x5c>
