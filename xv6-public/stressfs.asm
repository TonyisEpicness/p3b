
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
  2a:	68 50 07 00 00       	push   $0x750
  2f:	6a 01                	push   $0x1
  31:	e8 6c 04 00 00       	call   4a2 <printf>
  memset(data, 'a', sizeof(data));
  36:	83 c4 0c             	add    $0xc,%esp
  39:	68 00 02 00 00       	push   $0x200
  3e:	6a 61                	push   $0x61
  40:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  46:	50                   	push   %eax
  47:	e8 c6 01 00 00       	call   212 <memset>

  for(i = 0; i < 4; i++)
  4c:	83 c4 10             	add    $0x10,%esp
  4f:	bb 00 00 00 00       	mov    $0x0,%ebx
  54:	83 fb 03             	cmp    $0x3,%ebx
  57:	7f 0e                	jg     67 <main+0x67>
    if(fork() > 0)
  59:	e8 e7 02 00 00       	call   345 <fork>
  5e:	85 c0                	test   %eax,%eax
  60:	7f 05                	jg     67 <main+0x67>
  for(i = 0; i < 4; i++)
  62:	83 c3 01             	add    $0x1,%ebx
  65:	eb ed                	jmp    54 <main+0x54>
      break;

  printf(1, "write %d\n", i);
  67:	83 ec 04             	sub    $0x4,%esp
  6a:	53                   	push   %ebx
  6b:	68 63 07 00 00       	push   $0x763
  70:	6a 01                	push   $0x1
  72:	e8 2b 04 00 00       	call   4a2 <printf>

  path[8] += i;
  77:	00 5d e6             	add    %bl,-0x1a(%ebp)
  fd = open(path, O_CREATE | O_RDWR);
  7a:	83 c4 08             	add    $0x8,%esp
  7d:	68 02 02 00 00       	push   $0x202
  82:	8d 45 de             	lea    -0x22(%ebp),%eax
  85:	50                   	push   %eax
  86:	e8 02 03 00 00       	call   38d <open>
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
  a7:	e8 c1 02 00 00       	call   36d <write>
  for(i = 0; i < 20; i++)
  ac:	83 c3 01             	add    $0x1,%ebx
  af:	83 c4 10             	add    $0x10,%esp
  b2:	83 fb 13             	cmp    $0x13,%ebx
  b5:	7e e0                	jle    97 <main+0x97>
  close(fd);
  b7:	83 ec 0c             	sub    $0xc,%esp
  ba:	56                   	push   %esi
  bb:	e8 b5 02 00 00       	call   375 <close>

  printf(1, "read\n");
  c0:	83 c4 08             	add    $0x8,%esp
  c3:	68 6d 07 00 00       	push   $0x76d
  c8:	6a 01                	push   $0x1
  ca:	e8 d3 03 00 00       	call   4a2 <printf>

  fd = open(path, O_RDONLY);
  cf:	83 c4 08             	add    $0x8,%esp
  d2:	6a 00                	push   $0x0
  d4:	8d 45 de             	lea    -0x22(%ebp),%eax
  d7:	50                   	push   %eax
  d8:	e8 b0 02 00 00       	call   38d <open>
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
  f9:	e8 67 02 00 00       	call   365 <read>
  for (i = 0; i < 20; i++)
  fe:	83 c3 01             	add    $0x1,%ebx
 101:	83 c4 10             	add    $0x10,%esp
 104:	83 fb 13             	cmp    $0x13,%ebx
 107:	7e e0                	jle    e9 <main+0xe9>
  close(fd);
 109:	83 ec 0c             	sub    $0xc,%esp
 10c:	56                   	push   %esi
 10d:	e8 63 02 00 00       	call   375 <close>

  wait();
 112:	e8 3e 02 00 00       	call   355 <wait>

  exit();
 117:	e8 31 02 00 00       	call   34d <exit>

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
  void *n_stack = malloc(PGSIZE*2);
 133:	68 00 20 00 00       	push   $0x2000
 138:	e8 8b 05 00 00       	call   6c8 <malloc>
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
 14e:	e8 9a 02 00 00       	call   3ed <clone>


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
 15f:	55                   	push   %ebp
 160:	89 e5                	mov    %esp,%ebp
 162:	83 ec 24             	sub    $0x24,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 165:	8d 45 f4             	lea    -0xc(%ebp),%eax
 168:	50                   	push   %eax
 169:	e8 87 02 00 00       	call   3f5 <join>
  
  return pid;
}
 16e:	c9                   	leave  
 16f:	c3                   	ret    

00000170 <lock_acquire>:

void lock_acquire(lock_t *lock){
 170:	55                   	push   %ebp
 171:	89 e5                	mov    %esp,%ebp
 173:	53                   	push   %ebx
 174:	83 ec 04             	sub    $0x4,%esp
 177:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 17a:	83 ec 08             	sub    $0x8,%esp
 17d:	6a 01                	push   $0x1
 17f:	53                   	push   %ebx
 180:	e8 97 ff ff ff       	call   11c <test_and_set>
 185:	83 c4 10             	add    $0x10,%esp
 188:	83 f8 01             	cmp    $0x1,%eax
 18b:	74 ed                	je     17a <lock_acquire+0xa>
    ;
}
 18d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 190:	c9                   	leave  
 191:	c3                   	ret    

00000192 <lock_release>:

void lock_release(lock_t *lock) {
 192:	55                   	push   %ebp
 193:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 195:	8b 45 08             	mov    0x8(%ebp),%eax
 198:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 19e:	5d                   	pop    %ebp
 19f:	c3                   	ret    

000001a0 <lock_init>:

void lock_init(lock_t *lock) {
 1a0:	55                   	push   %ebp
 1a1:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 1a3:	8b 45 08             	mov    0x8(%ebp),%eax
 1a6:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 1ac:	5d                   	pop    %ebp
 1ad:	c3                   	ret    

000001ae <strcpy>:

char*
strcpy(char *s, const char *t)
{
 1ae:	55                   	push   %ebp
 1af:	89 e5                	mov    %esp,%ebp
 1b1:	56                   	push   %esi
 1b2:	53                   	push   %ebx
 1b3:	8b 75 08             	mov    0x8(%ebp),%esi
 1b6:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 1b9:	89 f0                	mov    %esi,%eax
 1bb:	89 d1                	mov    %edx,%ecx
 1bd:	83 c2 01             	add    $0x1,%edx
 1c0:	89 c3                	mov    %eax,%ebx
 1c2:	83 c0 01             	add    $0x1,%eax
 1c5:	0f b6 09             	movzbl (%ecx),%ecx
 1c8:	88 0b                	mov    %cl,(%ebx)
 1ca:	84 c9                	test   %cl,%cl
 1cc:	75 ed                	jne    1bb <strcpy+0xd>
    ;
  return os;
}
 1ce:	89 f0                	mov    %esi,%eax
 1d0:	5b                   	pop    %ebx
 1d1:	5e                   	pop    %esi
 1d2:	5d                   	pop    %ebp
 1d3:	c3                   	ret    

000001d4 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1d4:	55                   	push   %ebp
 1d5:	89 e5                	mov    %esp,%ebp
 1d7:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1da:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 1dd:	eb 06                	jmp    1e5 <strcmp+0x11>
    p++, q++;
 1df:	83 c1 01             	add    $0x1,%ecx
 1e2:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 1e5:	0f b6 01             	movzbl (%ecx),%eax
 1e8:	84 c0                	test   %al,%al
 1ea:	74 04                	je     1f0 <strcmp+0x1c>
 1ec:	3a 02                	cmp    (%edx),%al
 1ee:	74 ef                	je     1df <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 1f0:	0f b6 c0             	movzbl %al,%eax
 1f3:	0f b6 12             	movzbl (%edx),%edx
 1f6:	29 d0                	sub    %edx,%eax
}
 1f8:	5d                   	pop    %ebp
 1f9:	c3                   	ret    

000001fa <strlen>:

uint
strlen(const char *s)
{
 1fa:	55                   	push   %ebp
 1fb:	89 e5                	mov    %esp,%ebp
 1fd:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 200:	b8 00 00 00 00       	mov    $0x0,%eax
 205:	eb 03                	jmp    20a <strlen+0x10>
 207:	83 c0 01             	add    $0x1,%eax
 20a:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 20e:	75 f7                	jne    207 <strlen+0xd>
    ;
  return n;
}
 210:	5d                   	pop    %ebp
 211:	c3                   	ret    

00000212 <memset>:

void*
memset(void *dst, int c, uint n)
{
 212:	55                   	push   %ebp
 213:	89 e5                	mov    %esp,%ebp
 215:	57                   	push   %edi
 216:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 219:	89 d7                	mov    %edx,%edi
 21b:	8b 4d 10             	mov    0x10(%ebp),%ecx
 21e:	8b 45 0c             	mov    0xc(%ebp),%eax
 221:	fc                   	cld    
 222:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 224:	89 d0                	mov    %edx,%eax
 226:	8b 7d fc             	mov    -0x4(%ebp),%edi
 229:	c9                   	leave  
 22a:	c3                   	ret    

0000022b <strchr>:

char*
strchr(const char *s, char c)
{
 22b:	55                   	push   %ebp
 22c:	89 e5                	mov    %esp,%ebp
 22e:	8b 45 08             	mov    0x8(%ebp),%eax
 231:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 235:	eb 03                	jmp    23a <strchr+0xf>
 237:	83 c0 01             	add    $0x1,%eax
 23a:	0f b6 10             	movzbl (%eax),%edx
 23d:	84 d2                	test   %dl,%dl
 23f:	74 06                	je     247 <strchr+0x1c>
    if(*s == c)
 241:	38 ca                	cmp    %cl,%dl
 243:	75 f2                	jne    237 <strchr+0xc>
 245:	eb 05                	jmp    24c <strchr+0x21>
      return (char*)s;
  return 0;
 247:	b8 00 00 00 00       	mov    $0x0,%eax
}
 24c:	5d                   	pop    %ebp
 24d:	c3                   	ret    

0000024e <gets>:

char*
gets(char *buf, int max)
{
 24e:	55                   	push   %ebp
 24f:	89 e5                	mov    %esp,%ebp
 251:	57                   	push   %edi
 252:	56                   	push   %esi
 253:	53                   	push   %ebx
 254:	83 ec 1c             	sub    $0x1c,%esp
 257:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 25a:	bb 00 00 00 00       	mov    $0x0,%ebx
 25f:	89 de                	mov    %ebx,%esi
 261:	83 c3 01             	add    $0x1,%ebx
 264:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 267:	7d 2e                	jge    297 <gets+0x49>
    cc = read(0, &c, 1);
 269:	83 ec 04             	sub    $0x4,%esp
 26c:	6a 01                	push   $0x1
 26e:	8d 45 e7             	lea    -0x19(%ebp),%eax
 271:	50                   	push   %eax
 272:	6a 00                	push   $0x0
 274:	e8 ec 00 00 00       	call   365 <read>
    if(cc < 1)
 279:	83 c4 10             	add    $0x10,%esp
 27c:	85 c0                	test   %eax,%eax
 27e:	7e 17                	jle    297 <gets+0x49>
      break;
    buf[i++] = c;
 280:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 284:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 287:	3c 0a                	cmp    $0xa,%al
 289:	0f 94 c2             	sete   %dl
 28c:	3c 0d                	cmp    $0xd,%al
 28e:	0f 94 c0             	sete   %al
 291:	08 c2                	or     %al,%dl
 293:	74 ca                	je     25f <gets+0x11>
    buf[i++] = c;
 295:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 297:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 29b:	89 f8                	mov    %edi,%eax
 29d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2a0:	5b                   	pop    %ebx
 2a1:	5e                   	pop    %esi
 2a2:	5f                   	pop    %edi
 2a3:	5d                   	pop    %ebp
 2a4:	c3                   	ret    

000002a5 <stat>:

int
stat(const char *n, struct stat *st)
{
 2a5:	55                   	push   %ebp
 2a6:	89 e5                	mov    %esp,%ebp
 2a8:	56                   	push   %esi
 2a9:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2aa:	83 ec 08             	sub    $0x8,%esp
 2ad:	6a 00                	push   $0x0
 2af:	ff 75 08             	push   0x8(%ebp)
 2b2:	e8 d6 00 00 00       	call   38d <open>
  if(fd < 0)
 2b7:	83 c4 10             	add    $0x10,%esp
 2ba:	85 c0                	test   %eax,%eax
 2bc:	78 24                	js     2e2 <stat+0x3d>
 2be:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 2c0:	83 ec 08             	sub    $0x8,%esp
 2c3:	ff 75 0c             	push   0xc(%ebp)
 2c6:	50                   	push   %eax
 2c7:	e8 d9 00 00 00       	call   3a5 <fstat>
 2cc:	89 c6                	mov    %eax,%esi
  close(fd);
 2ce:	89 1c 24             	mov    %ebx,(%esp)
 2d1:	e8 9f 00 00 00       	call   375 <close>
  return r;
 2d6:	83 c4 10             	add    $0x10,%esp
}
 2d9:	89 f0                	mov    %esi,%eax
 2db:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2de:	5b                   	pop    %ebx
 2df:	5e                   	pop    %esi
 2e0:	5d                   	pop    %ebp
 2e1:	c3                   	ret    
    return -1;
 2e2:	be ff ff ff ff       	mov    $0xffffffff,%esi
 2e7:	eb f0                	jmp    2d9 <stat+0x34>

000002e9 <atoi>:

int
atoi(const char *s)
{
 2e9:	55                   	push   %ebp
 2ea:	89 e5                	mov    %esp,%ebp
 2ec:	53                   	push   %ebx
 2ed:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 2f0:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 2f5:	eb 10                	jmp    307 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 2f7:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 2fa:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 2fd:	83 c1 01             	add    $0x1,%ecx
 300:	0f be c0             	movsbl %al,%eax
 303:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 307:	0f b6 01             	movzbl (%ecx),%eax
 30a:	8d 58 d0             	lea    -0x30(%eax),%ebx
 30d:	80 fb 09             	cmp    $0x9,%bl
 310:	76 e5                	jbe    2f7 <atoi+0xe>
  return n;
}
 312:	89 d0                	mov    %edx,%eax
 314:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 317:	c9                   	leave  
 318:	c3                   	ret    

00000319 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 319:	55                   	push   %ebp
 31a:	89 e5                	mov    %esp,%ebp
 31c:	56                   	push   %esi
 31d:	53                   	push   %ebx
 31e:	8b 75 08             	mov    0x8(%ebp),%esi
 321:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 324:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 327:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 329:	eb 0d                	jmp    338 <memmove+0x1f>
    *dst++ = *src++;
 32b:	0f b6 01             	movzbl (%ecx),%eax
 32e:	88 02                	mov    %al,(%edx)
 330:	8d 49 01             	lea    0x1(%ecx),%ecx
 333:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 336:	89 d8                	mov    %ebx,%eax
 338:	8d 58 ff             	lea    -0x1(%eax),%ebx
 33b:	85 c0                	test   %eax,%eax
 33d:	7f ec                	jg     32b <memmove+0x12>
  return vdst;
}
 33f:	89 f0                	mov    %esi,%eax
 341:	5b                   	pop    %ebx
 342:	5e                   	pop    %esi
 343:	5d                   	pop    %ebp
 344:	c3                   	ret    

00000345 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 345:	b8 01 00 00 00       	mov    $0x1,%eax
 34a:	cd 40                	int    $0x40
 34c:	c3                   	ret    

0000034d <exit>:
SYSCALL(exit)
 34d:	b8 02 00 00 00       	mov    $0x2,%eax
 352:	cd 40                	int    $0x40
 354:	c3                   	ret    

00000355 <wait>:
SYSCALL(wait)
 355:	b8 03 00 00 00       	mov    $0x3,%eax
 35a:	cd 40                	int    $0x40
 35c:	c3                   	ret    

0000035d <pipe>:
SYSCALL(pipe)
 35d:	b8 04 00 00 00       	mov    $0x4,%eax
 362:	cd 40                	int    $0x40
 364:	c3                   	ret    

00000365 <read>:
SYSCALL(read)
 365:	b8 05 00 00 00       	mov    $0x5,%eax
 36a:	cd 40                	int    $0x40
 36c:	c3                   	ret    

0000036d <write>:
SYSCALL(write)
 36d:	b8 10 00 00 00       	mov    $0x10,%eax
 372:	cd 40                	int    $0x40
 374:	c3                   	ret    

00000375 <close>:
SYSCALL(close)
 375:	b8 15 00 00 00       	mov    $0x15,%eax
 37a:	cd 40                	int    $0x40
 37c:	c3                   	ret    

0000037d <kill>:
SYSCALL(kill)
 37d:	b8 06 00 00 00       	mov    $0x6,%eax
 382:	cd 40                	int    $0x40
 384:	c3                   	ret    

00000385 <exec>:
SYSCALL(exec)
 385:	b8 07 00 00 00       	mov    $0x7,%eax
 38a:	cd 40                	int    $0x40
 38c:	c3                   	ret    

0000038d <open>:
SYSCALL(open)
 38d:	b8 0f 00 00 00       	mov    $0xf,%eax
 392:	cd 40                	int    $0x40
 394:	c3                   	ret    

00000395 <mknod>:
SYSCALL(mknod)
 395:	b8 11 00 00 00       	mov    $0x11,%eax
 39a:	cd 40                	int    $0x40
 39c:	c3                   	ret    

0000039d <unlink>:
SYSCALL(unlink)
 39d:	b8 12 00 00 00       	mov    $0x12,%eax
 3a2:	cd 40                	int    $0x40
 3a4:	c3                   	ret    

000003a5 <fstat>:
SYSCALL(fstat)
 3a5:	b8 08 00 00 00       	mov    $0x8,%eax
 3aa:	cd 40                	int    $0x40
 3ac:	c3                   	ret    

000003ad <link>:
SYSCALL(link)
 3ad:	b8 13 00 00 00       	mov    $0x13,%eax
 3b2:	cd 40                	int    $0x40
 3b4:	c3                   	ret    

000003b5 <mkdir>:
SYSCALL(mkdir)
 3b5:	b8 14 00 00 00       	mov    $0x14,%eax
 3ba:	cd 40                	int    $0x40
 3bc:	c3                   	ret    

000003bd <chdir>:
SYSCALL(chdir)
 3bd:	b8 09 00 00 00       	mov    $0x9,%eax
 3c2:	cd 40                	int    $0x40
 3c4:	c3                   	ret    

000003c5 <dup>:
SYSCALL(dup)
 3c5:	b8 0a 00 00 00       	mov    $0xa,%eax
 3ca:	cd 40                	int    $0x40
 3cc:	c3                   	ret    

000003cd <getpid>:
SYSCALL(getpid)
 3cd:	b8 0b 00 00 00       	mov    $0xb,%eax
 3d2:	cd 40                	int    $0x40
 3d4:	c3                   	ret    

000003d5 <sbrk>:
SYSCALL(sbrk)
 3d5:	b8 0c 00 00 00       	mov    $0xc,%eax
 3da:	cd 40                	int    $0x40
 3dc:	c3                   	ret    

000003dd <sleep>:
SYSCALL(sleep)
 3dd:	b8 0d 00 00 00       	mov    $0xd,%eax
 3e2:	cd 40                	int    $0x40
 3e4:	c3                   	ret    

000003e5 <uptime>:
SYSCALL(uptime)
 3e5:	b8 0e 00 00 00       	mov    $0xe,%eax
 3ea:	cd 40                	int    $0x40
 3ec:	c3                   	ret    

000003ed <clone>:
SYSCALL(clone)
 3ed:	b8 16 00 00 00       	mov    $0x16,%eax
 3f2:	cd 40                	int    $0x40
 3f4:	c3                   	ret    

000003f5 <join>:
 3f5:	b8 17 00 00 00       	mov    $0x17,%eax
 3fa:	cd 40                	int    $0x40
 3fc:	c3                   	ret    

000003fd <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 3fd:	55                   	push   %ebp
 3fe:	89 e5                	mov    %esp,%ebp
 400:	83 ec 1c             	sub    $0x1c,%esp
 403:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 406:	6a 01                	push   $0x1
 408:	8d 55 f4             	lea    -0xc(%ebp),%edx
 40b:	52                   	push   %edx
 40c:	50                   	push   %eax
 40d:	e8 5b ff ff ff       	call   36d <write>
}
 412:	83 c4 10             	add    $0x10,%esp
 415:	c9                   	leave  
 416:	c3                   	ret    

00000417 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 417:	55                   	push   %ebp
 418:	89 e5                	mov    %esp,%ebp
 41a:	57                   	push   %edi
 41b:	56                   	push   %esi
 41c:	53                   	push   %ebx
 41d:	83 ec 2c             	sub    $0x2c,%esp
 420:	89 45 d0             	mov    %eax,-0x30(%ebp)
 423:	89 d0                	mov    %edx,%eax
 425:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 427:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 42b:	0f 95 c1             	setne  %cl
 42e:	c1 ea 1f             	shr    $0x1f,%edx
 431:	84 d1                	test   %dl,%cl
 433:	74 44                	je     479 <printint+0x62>
    neg = 1;
    x = -xx;
 435:	f7 d8                	neg    %eax
 437:	89 c1                	mov    %eax,%ecx
    neg = 1;
 439:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 440:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 445:	89 c8                	mov    %ecx,%eax
 447:	ba 00 00 00 00       	mov    $0x0,%edx
 44c:	f7 f6                	div    %esi
 44e:	89 df                	mov    %ebx,%edi
 450:	83 c3 01             	add    $0x1,%ebx
 453:	0f b6 92 d4 07 00 00 	movzbl 0x7d4(%edx),%edx
 45a:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 45e:	89 ca                	mov    %ecx,%edx
 460:	89 c1                	mov    %eax,%ecx
 462:	39 d6                	cmp    %edx,%esi
 464:	76 df                	jbe    445 <printint+0x2e>
  if(neg)
 466:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 46a:	74 31                	je     49d <printint+0x86>
    buf[i++] = '-';
 46c:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 471:	8d 5f 02             	lea    0x2(%edi),%ebx
 474:	8b 75 d0             	mov    -0x30(%ebp),%esi
 477:	eb 17                	jmp    490 <printint+0x79>
    x = xx;
 479:	89 c1                	mov    %eax,%ecx
  neg = 0;
 47b:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 482:	eb bc                	jmp    440 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 484:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 489:	89 f0                	mov    %esi,%eax
 48b:	e8 6d ff ff ff       	call   3fd <putc>
  while(--i >= 0)
 490:	83 eb 01             	sub    $0x1,%ebx
 493:	79 ef                	jns    484 <printint+0x6d>
}
 495:	83 c4 2c             	add    $0x2c,%esp
 498:	5b                   	pop    %ebx
 499:	5e                   	pop    %esi
 49a:	5f                   	pop    %edi
 49b:	5d                   	pop    %ebp
 49c:	c3                   	ret    
 49d:	8b 75 d0             	mov    -0x30(%ebp),%esi
 4a0:	eb ee                	jmp    490 <printint+0x79>

000004a2 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 4a2:	55                   	push   %ebp
 4a3:	89 e5                	mov    %esp,%ebp
 4a5:	57                   	push   %edi
 4a6:	56                   	push   %esi
 4a7:	53                   	push   %ebx
 4a8:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 4ab:	8d 45 10             	lea    0x10(%ebp),%eax
 4ae:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 4b1:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 4b6:	bb 00 00 00 00       	mov    $0x0,%ebx
 4bb:	eb 14                	jmp    4d1 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 4bd:	89 fa                	mov    %edi,%edx
 4bf:	8b 45 08             	mov    0x8(%ebp),%eax
 4c2:	e8 36 ff ff ff       	call   3fd <putc>
 4c7:	eb 05                	jmp    4ce <printf+0x2c>
      }
    } else if(state == '%'){
 4c9:	83 fe 25             	cmp    $0x25,%esi
 4cc:	74 25                	je     4f3 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 4ce:	83 c3 01             	add    $0x1,%ebx
 4d1:	8b 45 0c             	mov    0xc(%ebp),%eax
 4d4:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 4d8:	84 c0                	test   %al,%al
 4da:	0f 84 20 01 00 00    	je     600 <printf+0x15e>
    c = fmt[i] & 0xff;
 4e0:	0f be f8             	movsbl %al,%edi
 4e3:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 4e6:	85 f6                	test   %esi,%esi
 4e8:	75 df                	jne    4c9 <printf+0x27>
      if(c == '%'){
 4ea:	83 f8 25             	cmp    $0x25,%eax
 4ed:	75 ce                	jne    4bd <printf+0x1b>
        state = '%';
 4ef:	89 c6                	mov    %eax,%esi
 4f1:	eb db                	jmp    4ce <printf+0x2c>
      if(c == 'd'){
 4f3:	83 f8 25             	cmp    $0x25,%eax
 4f6:	0f 84 cf 00 00 00    	je     5cb <printf+0x129>
 4fc:	0f 8c dd 00 00 00    	jl     5df <printf+0x13d>
 502:	83 f8 78             	cmp    $0x78,%eax
 505:	0f 8f d4 00 00 00    	jg     5df <printf+0x13d>
 50b:	83 f8 63             	cmp    $0x63,%eax
 50e:	0f 8c cb 00 00 00    	jl     5df <printf+0x13d>
 514:	83 e8 63             	sub    $0x63,%eax
 517:	83 f8 15             	cmp    $0x15,%eax
 51a:	0f 87 bf 00 00 00    	ja     5df <printf+0x13d>
 520:	ff 24 85 7c 07 00 00 	jmp    *0x77c(,%eax,4)
        printint(fd, *ap, 10, 1);
 527:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 52a:	8b 17                	mov    (%edi),%edx
 52c:	83 ec 0c             	sub    $0xc,%esp
 52f:	6a 01                	push   $0x1
 531:	b9 0a 00 00 00       	mov    $0xa,%ecx
 536:	8b 45 08             	mov    0x8(%ebp),%eax
 539:	e8 d9 fe ff ff       	call   417 <printint>
        ap++;
 53e:	83 c7 04             	add    $0x4,%edi
 541:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 544:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 547:	be 00 00 00 00       	mov    $0x0,%esi
 54c:	eb 80                	jmp    4ce <printf+0x2c>
        printint(fd, *ap, 16, 0);
 54e:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 551:	8b 17                	mov    (%edi),%edx
 553:	83 ec 0c             	sub    $0xc,%esp
 556:	6a 00                	push   $0x0
 558:	b9 10 00 00 00       	mov    $0x10,%ecx
 55d:	8b 45 08             	mov    0x8(%ebp),%eax
 560:	e8 b2 fe ff ff       	call   417 <printint>
        ap++;
 565:	83 c7 04             	add    $0x4,%edi
 568:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 56b:	83 c4 10             	add    $0x10,%esp
      state = 0;
 56e:	be 00 00 00 00       	mov    $0x0,%esi
 573:	e9 56 ff ff ff       	jmp    4ce <printf+0x2c>
        s = (char*)*ap;
 578:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 57b:	8b 30                	mov    (%eax),%esi
        ap++;
 57d:	83 c0 04             	add    $0x4,%eax
 580:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 583:	85 f6                	test   %esi,%esi
 585:	75 15                	jne    59c <printf+0xfa>
          s = "(null)";
 587:	be 73 07 00 00       	mov    $0x773,%esi
 58c:	eb 0e                	jmp    59c <printf+0xfa>
          putc(fd, *s);
 58e:	0f be d2             	movsbl %dl,%edx
 591:	8b 45 08             	mov    0x8(%ebp),%eax
 594:	e8 64 fe ff ff       	call   3fd <putc>
          s++;
 599:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 59c:	0f b6 16             	movzbl (%esi),%edx
 59f:	84 d2                	test   %dl,%dl
 5a1:	75 eb                	jne    58e <printf+0xec>
      state = 0;
 5a3:	be 00 00 00 00       	mov    $0x0,%esi
 5a8:	e9 21 ff ff ff       	jmp    4ce <printf+0x2c>
        putc(fd, *ap);
 5ad:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5b0:	0f be 17             	movsbl (%edi),%edx
 5b3:	8b 45 08             	mov    0x8(%ebp),%eax
 5b6:	e8 42 fe ff ff       	call   3fd <putc>
        ap++;
 5bb:	83 c7 04             	add    $0x4,%edi
 5be:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 5c1:	be 00 00 00 00       	mov    $0x0,%esi
 5c6:	e9 03 ff ff ff       	jmp    4ce <printf+0x2c>
        putc(fd, c);
 5cb:	89 fa                	mov    %edi,%edx
 5cd:	8b 45 08             	mov    0x8(%ebp),%eax
 5d0:	e8 28 fe ff ff       	call   3fd <putc>
      state = 0;
 5d5:	be 00 00 00 00       	mov    $0x0,%esi
 5da:	e9 ef fe ff ff       	jmp    4ce <printf+0x2c>
        putc(fd, '%');
 5df:	ba 25 00 00 00       	mov    $0x25,%edx
 5e4:	8b 45 08             	mov    0x8(%ebp),%eax
 5e7:	e8 11 fe ff ff       	call   3fd <putc>
        putc(fd, c);
 5ec:	89 fa                	mov    %edi,%edx
 5ee:	8b 45 08             	mov    0x8(%ebp),%eax
 5f1:	e8 07 fe ff ff       	call   3fd <putc>
      state = 0;
 5f6:	be 00 00 00 00       	mov    $0x0,%esi
 5fb:	e9 ce fe ff ff       	jmp    4ce <printf+0x2c>
    }
  }
}
 600:	8d 65 f4             	lea    -0xc(%ebp),%esp
 603:	5b                   	pop    %ebx
 604:	5e                   	pop    %esi
 605:	5f                   	pop    %edi
 606:	5d                   	pop    %ebp
 607:	c3                   	ret    

00000608 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 608:	55                   	push   %ebp
 609:	89 e5                	mov    %esp,%ebp
 60b:	57                   	push   %edi
 60c:	56                   	push   %esi
 60d:	53                   	push   %ebx
 60e:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 611:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 614:	a1 44 0b 00 00       	mov    0xb44,%eax
 619:	eb 02                	jmp    61d <free+0x15>
 61b:	89 d0                	mov    %edx,%eax
 61d:	39 c8                	cmp    %ecx,%eax
 61f:	73 04                	jae    625 <free+0x1d>
 621:	39 08                	cmp    %ecx,(%eax)
 623:	77 12                	ja     637 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 625:	8b 10                	mov    (%eax),%edx
 627:	39 c2                	cmp    %eax,%edx
 629:	77 f0                	ja     61b <free+0x13>
 62b:	39 c8                	cmp    %ecx,%eax
 62d:	72 08                	jb     637 <free+0x2f>
 62f:	39 ca                	cmp    %ecx,%edx
 631:	77 04                	ja     637 <free+0x2f>
 633:	89 d0                	mov    %edx,%eax
 635:	eb e6                	jmp    61d <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 637:	8b 73 fc             	mov    -0x4(%ebx),%esi
 63a:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 63d:	8b 10                	mov    (%eax),%edx
 63f:	39 d7                	cmp    %edx,%edi
 641:	74 19                	je     65c <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 643:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 646:	8b 50 04             	mov    0x4(%eax),%edx
 649:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 64c:	39 ce                	cmp    %ecx,%esi
 64e:	74 1b                	je     66b <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 650:	89 08                	mov    %ecx,(%eax)
  freep = p;
 652:	a3 44 0b 00 00       	mov    %eax,0xb44
}
 657:	5b                   	pop    %ebx
 658:	5e                   	pop    %esi
 659:	5f                   	pop    %edi
 65a:	5d                   	pop    %ebp
 65b:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 65c:	03 72 04             	add    0x4(%edx),%esi
 65f:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 662:	8b 10                	mov    (%eax),%edx
 664:	8b 12                	mov    (%edx),%edx
 666:	89 53 f8             	mov    %edx,-0x8(%ebx)
 669:	eb db                	jmp    646 <free+0x3e>
    p->s.size += bp->s.size;
 66b:	03 53 fc             	add    -0x4(%ebx),%edx
 66e:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 671:	8b 53 f8             	mov    -0x8(%ebx),%edx
 674:	89 10                	mov    %edx,(%eax)
 676:	eb da                	jmp    652 <free+0x4a>

00000678 <morecore>:

static Header*
morecore(uint nu)
{
 678:	55                   	push   %ebp
 679:	89 e5                	mov    %esp,%ebp
 67b:	53                   	push   %ebx
 67c:	83 ec 04             	sub    $0x4,%esp
 67f:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 681:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 686:	77 05                	ja     68d <morecore+0x15>
    nu = 4096;
 688:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 68d:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 694:	83 ec 0c             	sub    $0xc,%esp
 697:	50                   	push   %eax
 698:	e8 38 fd ff ff       	call   3d5 <sbrk>
  if(p == (char*)-1)
 69d:	83 c4 10             	add    $0x10,%esp
 6a0:	83 f8 ff             	cmp    $0xffffffff,%eax
 6a3:	74 1c                	je     6c1 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 6a5:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 6a8:	83 c0 08             	add    $0x8,%eax
 6ab:	83 ec 0c             	sub    $0xc,%esp
 6ae:	50                   	push   %eax
 6af:	e8 54 ff ff ff       	call   608 <free>
  return freep;
 6b4:	a1 44 0b 00 00       	mov    0xb44,%eax
 6b9:	83 c4 10             	add    $0x10,%esp
}
 6bc:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 6bf:	c9                   	leave  
 6c0:	c3                   	ret    
    return 0;
 6c1:	b8 00 00 00 00       	mov    $0x0,%eax
 6c6:	eb f4                	jmp    6bc <morecore+0x44>

000006c8 <malloc>:

void*
malloc(uint nbytes)
{
 6c8:	55                   	push   %ebp
 6c9:	89 e5                	mov    %esp,%ebp
 6cb:	53                   	push   %ebx
 6cc:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6cf:	8b 45 08             	mov    0x8(%ebp),%eax
 6d2:	8d 58 07             	lea    0x7(%eax),%ebx
 6d5:	c1 eb 03             	shr    $0x3,%ebx
 6d8:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 6db:	8b 0d 44 0b 00 00    	mov    0xb44,%ecx
 6e1:	85 c9                	test   %ecx,%ecx
 6e3:	74 04                	je     6e9 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6e5:	8b 01                	mov    (%ecx),%eax
 6e7:	eb 4a                	jmp    733 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 6e9:	c7 05 44 0b 00 00 48 	movl   $0xb48,0xb44
 6f0:	0b 00 00 
 6f3:	c7 05 48 0b 00 00 48 	movl   $0xb48,0xb48
 6fa:	0b 00 00 
    base.s.size = 0;
 6fd:	c7 05 4c 0b 00 00 00 	movl   $0x0,0xb4c
 704:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 707:	b9 48 0b 00 00       	mov    $0xb48,%ecx
 70c:	eb d7                	jmp    6e5 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 70e:	74 19                	je     729 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 710:	29 da                	sub    %ebx,%edx
 712:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 715:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 718:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 71b:	89 0d 44 0b 00 00    	mov    %ecx,0xb44
      return (void*)(p + 1);
 721:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 724:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 727:	c9                   	leave  
 728:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 729:	8b 10                	mov    (%eax),%edx
 72b:	89 11                	mov    %edx,(%ecx)
 72d:	eb ec                	jmp    71b <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 72f:	89 c1                	mov    %eax,%ecx
 731:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 733:	8b 50 04             	mov    0x4(%eax),%edx
 736:	39 da                	cmp    %ebx,%edx
 738:	73 d4                	jae    70e <malloc+0x46>
    if(p == freep)
 73a:	39 05 44 0b 00 00    	cmp    %eax,0xb44
 740:	75 ed                	jne    72f <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 742:	89 d8                	mov    %ebx,%eax
 744:	e8 2f ff ff ff       	call   678 <morecore>
 749:	85 c0                	test   %eax,%eax
 74b:	75 e2                	jne    72f <malloc+0x67>
 74d:	eb d5                	jmp    724 <malloc+0x5c>
