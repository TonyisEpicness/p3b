
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
  14:	68 10 07 00 00       	push   $0x710
  19:	e8 30 03 00 00       	call   34e <open>
  1e:	83 c4 10             	add    $0x10,%esp
  21:	85 c0                	test   %eax,%eax
  23:	78 1b                	js     40 <main+0x40>
    mknod("console", 1, 1);
    open("console", O_RDWR);
  }
  dup(0);  // stdout
  25:	83 ec 0c             	sub    $0xc,%esp
  28:	6a 00                	push   $0x0
  2a:	e8 57 03 00 00       	call   386 <dup>
  dup(0);  // stderr
  2f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  36:	e8 4b 03 00 00       	call   386 <dup>
  3b:	83 c4 10             	add    $0x10,%esp
  3e:	eb 58                	jmp    98 <main+0x98>
    mknod("console", 1, 1);
  40:	83 ec 04             	sub    $0x4,%esp
  43:	6a 01                	push   $0x1
  45:	6a 01                	push   $0x1
  47:	68 10 07 00 00       	push   $0x710
  4c:	e8 05 03 00 00       	call   356 <mknod>
    open("console", O_RDWR);
  51:	83 c4 08             	add    $0x8,%esp
  54:	6a 02                	push   $0x2
  56:	68 10 07 00 00       	push   $0x710
  5b:	e8 ee 02 00 00       	call   34e <open>
  60:	83 c4 10             	add    $0x10,%esp
  63:	eb c0                	jmp    25 <main+0x25>

  for(;;){
    printf(1, "init: starting sh\n");
    pid = fork();
    if(pid < 0){
      printf(1, "init: fork failed\n");
  65:	83 ec 08             	sub    $0x8,%esp
  68:	68 2b 07 00 00       	push   $0x72b
  6d:	6a 01                	push   $0x1
  6f:	e8 ef 03 00 00       	call   463 <printf>
      exit();
  74:	e8 95 02 00 00       	call   30e <exit>
      exec("sh", argv);
      printf(1, "init: exec sh failed\n");
      exit();
    }
    while((wpid=wait()) >= 0 && wpid != pid)
      printf(1, "zombie!\n");
  79:	83 ec 08             	sub    $0x8,%esp
  7c:	68 57 07 00 00       	push   $0x757
  81:	6a 01                	push   $0x1
  83:	e8 db 03 00 00       	call   463 <printf>
  88:	83 c4 10             	add    $0x10,%esp
    while((wpid=wait()) >= 0 && wpid != pid)
  8b:	e8 86 02 00 00       	call   316 <wait>
  90:	85 c0                	test   %eax,%eax
  92:	78 04                	js     98 <main+0x98>
  94:	39 c3                	cmp    %eax,%ebx
  96:	75 e1                	jne    79 <main+0x79>
    printf(1, "init: starting sh\n");
  98:	83 ec 08             	sub    $0x8,%esp
  9b:	68 18 07 00 00       	push   $0x718
  a0:	6a 01                	push   $0x1
  a2:	e8 bc 03 00 00       	call   463 <printf>
    pid = fork();
  a7:	e8 5a 02 00 00       	call   306 <fork>
  ac:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
  ae:	83 c4 10             	add    $0x10,%esp
  b1:	85 c0                	test   %eax,%eax
  b3:	78 b0                	js     65 <main+0x65>
    if(pid == 0){
  b5:	75 d4                	jne    8b <main+0x8b>
      exec("sh", argv);
  b7:	83 ec 08             	sub    $0x8,%esp
  ba:	68 2c 0b 00 00       	push   $0xb2c
  bf:	68 3e 07 00 00       	push   $0x73e
  c4:	e8 7d 02 00 00       	call   346 <exec>
      printf(1, "init: exec sh failed\n");
  c9:	83 c4 08             	add    $0x8,%esp
  cc:	68 41 07 00 00       	push   $0x741
  d1:	6a 01                	push   $0x1
  d3:	e8 8b 03 00 00       	call   463 <printf>
      exit();
  d8:	e8 31 02 00 00       	call   30e <exit>

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

// a wrapper func for clone
int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
  ee:	55                   	push   %ebp
  ef:	89 e5                	mov    %esp,%ebp
  f1:	83 ec 14             	sub    $0x14,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE*2);
  f4:	68 00 20 00 00       	push   $0x2000
  f9:	e8 8b 05 00 00       	call   689 <malloc>
  if(n_stack == 0){
  fe:	83 c4 10             	add    $0x10,%esp
 101:	85 c0                	test   %eax,%eax
 103:	74 14                	je     119 <thread_create+0x2b>
    return -1;
  }
  int new_pid = clone(start_routine, arg1, arg2, n_stack); // TODO: is this the right way to call it?
 105:	50                   	push   %eax
 106:	ff 75 10             	push   0x10(%ebp)
 109:	ff 75 0c             	push   0xc(%ebp)
 10c:	ff 75 08             	push   0x8(%ebp)
 10f:	e8 9a 02 00 00       	call   3ae <clone>


  // I can't remember if there was something else to do here but I'm sure I'll find out


  return new_pid;
 114:	83 c4 10             	add    $0x10,%esp
}
 117:	c9                   	leave  
 118:	c3                   	ret    
    return -1;
 119:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 11e:	eb f7                	jmp    117 <thread_create+0x29>

00000120 <thread_join>:

int thread_join() {
 120:	55                   	push   %ebp
 121:	89 e5                	mov    %esp,%ebp
 123:	83 ec 24             	sub    $0x24,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 126:	8d 45 f4             	lea    -0xc(%ebp),%eax
 129:	50                   	push   %eax
 12a:	e8 87 02 00 00       	call   3b6 <join>
  
  return pid;
}
 12f:	c9                   	leave  
 130:	c3                   	ret    

00000131 <lock_acquire>:

void lock_acquire(lock_t *lock){
 131:	55                   	push   %ebp
 132:	89 e5                	mov    %esp,%ebp
 134:	53                   	push   %ebx
 135:	83 ec 04             	sub    $0x4,%esp
 138:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 13b:	83 ec 08             	sub    $0x8,%esp
 13e:	6a 01                	push   $0x1
 140:	53                   	push   %ebx
 141:	e8 97 ff ff ff       	call   dd <test_and_set>
 146:	83 c4 10             	add    $0x10,%esp
 149:	83 f8 01             	cmp    $0x1,%eax
 14c:	74 ed                	je     13b <lock_acquire+0xa>
    ;
}
 14e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 151:	c9                   	leave  
 152:	c3                   	ret    

00000153 <lock_release>:

void lock_release(lock_t *lock) {
 153:	55                   	push   %ebp
 154:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 156:	8b 45 08             	mov    0x8(%ebp),%eax
 159:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 15f:	5d                   	pop    %ebp
 160:	c3                   	ret    

00000161 <lock_init>:

void lock_init(lock_t *lock) {
 161:	55                   	push   %ebp
 162:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 164:	8b 45 08             	mov    0x8(%ebp),%eax
 167:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 16d:	5d                   	pop    %ebp
 16e:	c3                   	ret    

0000016f <strcpy>:

char*
strcpy(char *s, const char *t)
{
 16f:	55                   	push   %ebp
 170:	89 e5                	mov    %esp,%ebp
 172:	56                   	push   %esi
 173:	53                   	push   %ebx
 174:	8b 75 08             	mov    0x8(%ebp),%esi
 177:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 17a:	89 f0                	mov    %esi,%eax
 17c:	89 d1                	mov    %edx,%ecx
 17e:	83 c2 01             	add    $0x1,%edx
 181:	89 c3                	mov    %eax,%ebx
 183:	83 c0 01             	add    $0x1,%eax
 186:	0f b6 09             	movzbl (%ecx),%ecx
 189:	88 0b                	mov    %cl,(%ebx)
 18b:	84 c9                	test   %cl,%cl
 18d:	75 ed                	jne    17c <strcpy+0xd>
    ;
  return os;
}
 18f:	89 f0                	mov    %esi,%eax
 191:	5b                   	pop    %ebx
 192:	5e                   	pop    %esi
 193:	5d                   	pop    %ebp
 194:	c3                   	ret    

00000195 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 195:	55                   	push   %ebp
 196:	89 e5                	mov    %esp,%ebp
 198:	8b 4d 08             	mov    0x8(%ebp),%ecx
 19b:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 19e:	eb 06                	jmp    1a6 <strcmp+0x11>
    p++, q++;
 1a0:	83 c1 01             	add    $0x1,%ecx
 1a3:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 1a6:	0f b6 01             	movzbl (%ecx),%eax
 1a9:	84 c0                	test   %al,%al
 1ab:	74 04                	je     1b1 <strcmp+0x1c>
 1ad:	3a 02                	cmp    (%edx),%al
 1af:	74 ef                	je     1a0 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 1b1:	0f b6 c0             	movzbl %al,%eax
 1b4:	0f b6 12             	movzbl (%edx),%edx
 1b7:	29 d0                	sub    %edx,%eax
}
 1b9:	5d                   	pop    %ebp
 1ba:	c3                   	ret    

000001bb <strlen>:

uint
strlen(const char *s)
{
 1bb:	55                   	push   %ebp
 1bc:	89 e5                	mov    %esp,%ebp
 1be:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 1c1:	b8 00 00 00 00       	mov    $0x0,%eax
 1c6:	eb 03                	jmp    1cb <strlen+0x10>
 1c8:	83 c0 01             	add    $0x1,%eax
 1cb:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 1cf:	75 f7                	jne    1c8 <strlen+0xd>
    ;
  return n;
}
 1d1:	5d                   	pop    %ebp
 1d2:	c3                   	ret    

000001d3 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1d3:	55                   	push   %ebp
 1d4:	89 e5                	mov    %esp,%ebp
 1d6:	57                   	push   %edi
 1d7:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1da:	89 d7                	mov    %edx,%edi
 1dc:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1df:	8b 45 0c             	mov    0xc(%ebp),%eax
 1e2:	fc                   	cld    
 1e3:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1e5:	89 d0                	mov    %edx,%eax
 1e7:	8b 7d fc             	mov    -0x4(%ebp),%edi
 1ea:	c9                   	leave  
 1eb:	c3                   	ret    

000001ec <strchr>:

char*
strchr(const char *s, char c)
{
 1ec:	55                   	push   %ebp
 1ed:	89 e5                	mov    %esp,%ebp
 1ef:	8b 45 08             	mov    0x8(%ebp),%eax
 1f2:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1f6:	eb 03                	jmp    1fb <strchr+0xf>
 1f8:	83 c0 01             	add    $0x1,%eax
 1fb:	0f b6 10             	movzbl (%eax),%edx
 1fe:	84 d2                	test   %dl,%dl
 200:	74 06                	je     208 <strchr+0x1c>
    if(*s == c)
 202:	38 ca                	cmp    %cl,%dl
 204:	75 f2                	jne    1f8 <strchr+0xc>
 206:	eb 05                	jmp    20d <strchr+0x21>
      return (char*)s;
  return 0;
 208:	b8 00 00 00 00       	mov    $0x0,%eax
}
 20d:	5d                   	pop    %ebp
 20e:	c3                   	ret    

0000020f <gets>:

char*
gets(char *buf, int max)
{
 20f:	55                   	push   %ebp
 210:	89 e5                	mov    %esp,%ebp
 212:	57                   	push   %edi
 213:	56                   	push   %esi
 214:	53                   	push   %ebx
 215:	83 ec 1c             	sub    $0x1c,%esp
 218:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 21b:	bb 00 00 00 00       	mov    $0x0,%ebx
 220:	89 de                	mov    %ebx,%esi
 222:	83 c3 01             	add    $0x1,%ebx
 225:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 228:	7d 2e                	jge    258 <gets+0x49>
    cc = read(0, &c, 1);
 22a:	83 ec 04             	sub    $0x4,%esp
 22d:	6a 01                	push   $0x1
 22f:	8d 45 e7             	lea    -0x19(%ebp),%eax
 232:	50                   	push   %eax
 233:	6a 00                	push   $0x0
 235:	e8 ec 00 00 00       	call   326 <read>
    if(cc < 1)
 23a:	83 c4 10             	add    $0x10,%esp
 23d:	85 c0                	test   %eax,%eax
 23f:	7e 17                	jle    258 <gets+0x49>
      break;
    buf[i++] = c;
 241:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 245:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 248:	3c 0a                	cmp    $0xa,%al
 24a:	0f 94 c2             	sete   %dl
 24d:	3c 0d                	cmp    $0xd,%al
 24f:	0f 94 c0             	sete   %al
 252:	08 c2                	or     %al,%dl
 254:	74 ca                	je     220 <gets+0x11>
    buf[i++] = c;
 256:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 258:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 25c:	89 f8                	mov    %edi,%eax
 25e:	8d 65 f4             	lea    -0xc(%ebp),%esp
 261:	5b                   	pop    %ebx
 262:	5e                   	pop    %esi
 263:	5f                   	pop    %edi
 264:	5d                   	pop    %ebp
 265:	c3                   	ret    

00000266 <stat>:

int
stat(const char *n, struct stat *st)
{
 266:	55                   	push   %ebp
 267:	89 e5                	mov    %esp,%ebp
 269:	56                   	push   %esi
 26a:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 26b:	83 ec 08             	sub    $0x8,%esp
 26e:	6a 00                	push   $0x0
 270:	ff 75 08             	push   0x8(%ebp)
 273:	e8 d6 00 00 00       	call   34e <open>
  if(fd < 0)
 278:	83 c4 10             	add    $0x10,%esp
 27b:	85 c0                	test   %eax,%eax
 27d:	78 24                	js     2a3 <stat+0x3d>
 27f:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 281:	83 ec 08             	sub    $0x8,%esp
 284:	ff 75 0c             	push   0xc(%ebp)
 287:	50                   	push   %eax
 288:	e8 d9 00 00 00       	call   366 <fstat>
 28d:	89 c6                	mov    %eax,%esi
  close(fd);
 28f:	89 1c 24             	mov    %ebx,(%esp)
 292:	e8 9f 00 00 00       	call   336 <close>
  return r;
 297:	83 c4 10             	add    $0x10,%esp
}
 29a:	89 f0                	mov    %esi,%eax
 29c:	8d 65 f8             	lea    -0x8(%ebp),%esp
 29f:	5b                   	pop    %ebx
 2a0:	5e                   	pop    %esi
 2a1:	5d                   	pop    %ebp
 2a2:	c3                   	ret    
    return -1;
 2a3:	be ff ff ff ff       	mov    $0xffffffff,%esi
 2a8:	eb f0                	jmp    29a <stat+0x34>

000002aa <atoi>:

int
atoi(const char *s)
{
 2aa:	55                   	push   %ebp
 2ab:	89 e5                	mov    %esp,%ebp
 2ad:	53                   	push   %ebx
 2ae:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 2b1:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 2b6:	eb 10                	jmp    2c8 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 2b8:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 2bb:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 2be:	83 c1 01             	add    $0x1,%ecx
 2c1:	0f be c0             	movsbl %al,%eax
 2c4:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 2c8:	0f b6 01             	movzbl (%ecx),%eax
 2cb:	8d 58 d0             	lea    -0x30(%eax),%ebx
 2ce:	80 fb 09             	cmp    $0x9,%bl
 2d1:	76 e5                	jbe    2b8 <atoi+0xe>
  return n;
}
 2d3:	89 d0                	mov    %edx,%eax
 2d5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2d8:	c9                   	leave  
 2d9:	c3                   	ret    

000002da <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2da:	55                   	push   %ebp
 2db:	89 e5                	mov    %esp,%ebp
 2dd:	56                   	push   %esi
 2de:	53                   	push   %ebx
 2df:	8b 75 08             	mov    0x8(%ebp),%esi
 2e2:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 2e5:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 2e8:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 2ea:	eb 0d                	jmp    2f9 <memmove+0x1f>
    *dst++ = *src++;
 2ec:	0f b6 01             	movzbl (%ecx),%eax
 2ef:	88 02                	mov    %al,(%edx)
 2f1:	8d 49 01             	lea    0x1(%ecx),%ecx
 2f4:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 2f7:	89 d8                	mov    %ebx,%eax
 2f9:	8d 58 ff             	lea    -0x1(%eax),%ebx
 2fc:	85 c0                	test   %eax,%eax
 2fe:	7f ec                	jg     2ec <memmove+0x12>
  return vdst;
}
 300:	89 f0                	mov    %esi,%eax
 302:	5b                   	pop    %ebx
 303:	5e                   	pop    %esi
 304:	5d                   	pop    %ebp
 305:	c3                   	ret    

00000306 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 306:	b8 01 00 00 00       	mov    $0x1,%eax
 30b:	cd 40                	int    $0x40
 30d:	c3                   	ret    

0000030e <exit>:
SYSCALL(exit)
 30e:	b8 02 00 00 00       	mov    $0x2,%eax
 313:	cd 40                	int    $0x40
 315:	c3                   	ret    

00000316 <wait>:
SYSCALL(wait)
 316:	b8 03 00 00 00       	mov    $0x3,%eax
 31b:	cd 40                	int    $0x40
 31d:	c3                   	ret    

0000031e <pipe>:
SYSCALL(pipe)
 31e:	b8 04 00 00 00       	mov    $0x4,%eax
 323:	cd 40                	int    $0x40
 325:	c3                   	ret    

00000326 <read>:
SYSCALL(read)
 326:	b8 05 00 00 00       	mov    $0x5,%eax
 32b:	cd 40                	int    $0x40
 32d:	c3                   	ret    

0000032e <write>:
SYSCALL(write)
 32e:	b8 10 00 00 00       	mov    $0x10,%eax
 333:	cd 40                	int    $0x40
 335:	c3                   	ret    

00000336 <close>:
SYSCALL(close)
 336:	b8 15 00 00 00       	mov    $0x15,%eax
 33b:	cd 40                	int    $0x40
 33d:	c3                   	ret    

0000033e <kill>:
SYSCALL(kill)
 33e:	b8 06 00 00 00       	mov    $0x6,%eax
 343:	cd 40                	int    $0x40
 345:	c3                   	ret    

00000346 <exec>:
SYSCALL(exec)
 346:	b8 07 00 00 00       	mov    $0x7,%eax
 34b:	cd 40                	int    $0x40
 34d:	c3                   	ret    

0000034e <open>:
SYSCALL(open)
 34e:	b8 0f 00 00 00       	mov    $0xf,%eax
 353:	cd 40                	int    $0x40
 355:	c3                   	ret    

00000356 <mknod>:
SYSCALL(mknod)
 356:	b8 11 00 00 00       	mov    $0x11,%eax
 35b:	cd 40                	int    $0x40
 35d:	c3                   	ret    

0000035e <unlink>:
SYSCALL(unlink)
 35e:	b8 12 00 00 00       	mov    $0x12,%eax
 363:	cd 40                	int    $0x40
 365:	c3                   	ret    

00000366 <fstat>:
SYSCALL(fstat)
 366:	b8 08 00 00 00       	mov    $0x8,%eax
 36b:	cd 40                	int    $0x40
 36d:	c3                   	ret    

0000036e <link>:
SYSCALL(link)
 36e:	b8 13 00 00 00       	mov    $0x13,%eax
 373:	cd 40                	int    $0x40
 375:	c3                   	ret    

00000376 <mkdir>:
SYSCALL(mkdir)
 376:	b8 14 00 00 00       	mov    $0x14,%eax
 37b:	cd 40                	int    $0x40
 37d:	c3                   	ret    

0000037e <chdir>:
SYSCALL(chdir)
 37e:	b8 09 00 00 00       	mov    $0x9,%eax
 383:	cd 40                	int    $0x40
 385:	c3                   	ret    

00000386 <dup>:
SYSCALL(dup)
 386:	b8 0a 00 00 00       	mov    $0xa,%eax
 38b:	cd 40                	int    $0x40
 38d:	c3                   	ret    

0000038e <getpid>:
SYSCALL(getpid)
 38e:	b8 0b 00 00 00       	mov    $0xb,%eax
 393:	cd 40                	int    $0x40
 395:	c3                   	ret    

00000396 <sbrk>:
SYSCALL(sbrk)
 396:	b8 0c 00 00 00       	mov    $0xc,%eax
 39b:	cd 40                	int    $0x40
 39d:	c3                   	ret    

0000039e <sleep>:
SYSCALL(sleep)
 39e:	b8 0d 00 00 00       	mov    $0xd,%eax
 3a3:	cd 40                	int    $0x40
 3a5:	c3                   	ret    

000003a6 <uptime>:
SYSCALL(uptime)
 3a6:	b8 0e 00 00 00       	mov    $0xe,%eax
 3ab:	cd 40                	int    $0x40
 3ad:	c3                   	ret    

000003ae <clone>:
SYSCALL(clone)
 3ae:	b8 16 00 00 00       	mov    $0x16,%eax
 3b3:	cd 40                	int    $0x40
 3b5:	c3                   	ret    

000003b6 <join>:
 3b6:	b8 17 00 00 00       	mov    $0x17,%eax
 3bb:	cd 40                	int    $0x40
 3bd:	c3                   	ret    

000003be <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 3be:	55                   	push   %ebp
 3bf:	89 e5                	mov    %esp,%ebp
 3c1:	83 ec 1c             	sub    $0x1c,%esp
 3c4:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 3c7:	6a 01                	push   $0x1
 3c9:	8d 55 f4             	lea    -0xc(%ebp),%edx
 3cc:	52                   	push   %edx
 3cd:	50                   	push   %eax
 3ce:	e8 5b ff ff ff       	call   32e <write>
}
 3d3:	83 c4 10             	add    $0x10,%esp
 3d6:	c9                   	leave  
 3d7:	c3                   	ret    

000003d8 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 3d8:	55                   	push   %ebp
 3d9:	89 e5                	mov    %esp,%ebp
 3db:	57                   	push   %edi
 3dc:	56                   	push   %esi
 3dd:	53                   	push   %ebx
 3de:	83 ec 2c             	sub    $0x2c,%esp
 3e1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 3e4:	89 d0                	mov    %edx,%eax
 3e6:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 3e8:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 3ec:	0f 95 c1             	setne  %cl
 3ef:	c1 ea 1f             	shr    $0x1f,%edx
 3f2:	84 d1                	test   %dl,%cl
 3f4:	74 44                	je     43a <printint+0x62>
    neg = 1;
    x = -xx;
 3f6:	f7 d8                	neg    %eax
 3f8:	89 c1                	mov    %eax,%ecx
    neg = 1;
 3fa:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 401:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 406:	89 c8                	mov    %ecx,%eax
 408:	ba 00 00 00 00       	mov    $0x0,%edx
 40d:	f7 f6                	div    %esi
 40f:	89 df                	mov    %ebx,%edi
 411:	83 c3 01             	add    $0x1,%ebx
 414:	0f b6 92 c0 07 00 00 	movzbl 0x7c0(%edx),%edx
 41b:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 41f:	89 ca                	mov    %ecx,%edx
 421:	89 c1                	mov    %eax,%ecx
 423:	39 d6                	cmp    %edx,%esi
 425:	76 df                	jbe    406 <printint+0x2e>
  if(neg)
 427:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 42b:	74 31                	je     45e <printint+0x86>
    buf[i++] = '-';
 42d:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 432:	8d 5f 02             	lea    0x2(%edi),%ebx
 435:	8b 75 d0             	mov    -0x30(%ebp),%esi
 438:	eb 17                	jmp    451 <printint+0x79>
    x = xx;
 43a:	89 c1                	mov    %eax,%ecx
  neg = 0;
 43c:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 443:	eb bc                	jmp    401 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 445:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 44a:	89 f0                	mov    %esi,%eax
 44c:	e8 6d ff ff ff       	call   3be <putc>
  while(--i >= 0)
 451:	83 eb 01             	sub    $0x1,%ebx
 454:	79 ef                	jns    445 <printint+0x6d>
}
 456:	83 c4 2c             	add    $0x2c,%esp
 459:	5b                   	pop    %ebx
 45a:	5e                   	pop    %esi
 45b:	5f                   	pop    %edi
 45c:	5d                   	pop    %ebp
 45d:	c3                   	ret    
 45e:	8b 75 d0             	mov    -0x30(%ebp),%esi
 461:	eb ee                	jmp    451 <printint+0x79>

00000463 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 463:	55                   	push   %ebp
 464:	89 e5                	mov    %esp,%ebp
 466:	57                   	push   %edi
 467:	56                   	push   %esi
 468:	53                   	push   %ebx
 469:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 46c:	8d 45 10             	lea    0x10(%ebp),%eax
 46f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 472:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 477:	bb 00 00 00 00       	mov    $0x0,%ebx
 47c:	eb 14                	jmp    492 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 47e:	89 fa                	mov    %edi,%edx
 480:	8b 45 08             	mov    0x8(%ebp),%eax
 483:	e8 36 ff ff ff       	call   3be <putc>
 488:	eb 05                	jmp    48f <printf+0x2c>
      }
    } else if(state == '%'){
 48a:	83 fe 25             	cmp    $0x25,%esi
 48d:	74 25                	je     4b4 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 48f:	83 c3 01             	add    $0x1,%ebx
 492:	8b 45 0c             	mov    0xc(%ebp),%eax
 495:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 499:	84 c0                	test   %al,%al
 49b:	0f 84 20 01 00 00    	je     5c1 <printf+0x15e>
    c = fmt[i] & 0xff;
 4a1:	0f be f8             	movsbl %al,%edi
 4a4:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 4a7:	85 f6                	test   %esi,%esi
 4a9:	75 df                	jne    48a <printf+0x27>
      if(c == '%'){
 4ab:	83 f8 25             	cmp    $0x25,%eax
 4ae:	75 ce                	jne    47e <printf+0x1b>
        state = '%';
 4b0:	89 c6                	mov    %eax,%esi
 4b2:	eb db                	jmp    48f <printf+0x2c>
      if(c == 'd'){
 4b4:	83 f8 25             	cmp    $0x25,%eax
 4b7:	0f 84 cf 00 00 00    	je     58c <printf+0x129>
 4bd:	0f 8c dd 00 00 00    	jl     5a0 <printf+0x13d>
 4c3:	83 f8 78             	cmp    $0x78,%eax
 4c6:	0f 8f d4 00 00 00    	jg     5a0 <printf+0x13d>
 4cc:	83 f8 63             	cmp    $0x63,%eax
 4cf:	0f 8c cb 00 00 00    	jl     5a0 <printf+0x13d>
 4d5:	83 e8 63             	sub    $0x63,%eax
 4d8:	83 f8 15             	cmp    $0x15,%eax
 4db:	0f 87 bf 00 00 00    	ja     5a0 <printf+0x13d>
 4e1:	ff 24 85 68 07 00 00 	jmp    *0x768(,%eax,4)
        printint(fd, *ap, 10, 1);
 4e8:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4eb:	8b 17                	mov    (%edi),%edx
 4ed:	83 ec 0c             	sub    $0xc,%esp
 4f0:	6a 01                	push   $0x1
 4f2:	b9 0a 00 00 00       	mov    $0xa,%ecx
 4f7:	8b 45 08             	mov    0x8(%ebp),%eax
 4fa:	e8 d9 fe ff ff       	call   3d8 <printint>
        ap++;
 4ff:	83 c7 04             	add    $0x4,%edi
 502:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 505:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 508:	be 00 00 00 00       	mov    $0x0,%esi
 50d:	eb 80                	jmp    48f <printf+0x2c>
        printint(fd, *ap, 16, 0);
 50f:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 512:	8b 17                	mov    (%edi),%edx
 514:	83 ec 0c             	sub    $0xc,%esp
 517:	6a 00                	push   $0x0
 519:	b9 10 00 00 00       	mov    $0x10,%ecx
 51e:	8b 45 08             	mov    0x8(%ebp),%eax
 521:	e8 b2 fe ff ff       	call   3d8 <printint>
        ap++;
 526:	83 c7 04             	add    $0x4,%edi
 529:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 52c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 52f:	be 00 00 00 00       	mov    $0x0,%esi
 534:	e9 56 ff ff ff       	jmp    48f <printf+0x2c>
        s = (char*)*ap;
 539:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 53c:	8b 30                	mov    (%eax),%esi
        ap++;
 53e:	83 c0 04             	add    $0x4,%eax
 541:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 544:	85 f6                	test   %esi,%esi
 546:	75 15                	jne    55d <printf+0xfa>
          s = "(null)";
 548:	be 60 07 00 00       	mov    $0x760,%esi
 54d:	eb 0e                	jmp    55d <printf+0xfa>
          putc(fd, *s);
 54f:	0f be d2             	movsbl %dl,%edx
 552:	8b 45 08             	mov    0x8(%ebp),%eax
 555:	e8 64 fe ff ff       	call   3be <putc>
          s++;
 55a:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 55d:	0f b6 16             	movzbl (%esi),%edx
 560:	84 d2                	test   %dl,%dl
 562:	75 eb                	jne    54f <printf+0xec>
      state = 0;
 564:	be 00 00 00 00       	mov    $0x0,%esi
 569:	e9 21 ff ff ff       	jmp    48f <printf+0x2c>
        putc(fd, *ap);
 56e:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 571:	0f be 17             	movsbl (%edi),%edx
 574:	8b 45 08             	mov    0x8(%ebp),%eax
 577:	e8 42 fe ff ff       	call   3be <putc>
        ap++;
 57c:	83 c7 04             	add    $0x4,%edi
 57f:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 582:	be 00 00 00 00       	mov    $0x0,%esi
 587:	e9 03 ff ff ff       	jmp    48f <printf+0x2c>
        putc(fd, c);
 58c:	89 fa                	mov    %edi,%edx
 58e:	8b 45 08             	mov    0x8(%ebp),%eax
 591:	e8 28 fe ff ff       	call   3be <putc>
      state = 0;
 596:	be 00 00 00 00       	mov    $0x0,%esi
 59b:	e9 ef fe ff ff       	jmp    48f <printf+0x2c>
        putc(fd, '%');
 5a0:	ba 25 00 00 00       	mov    $0x25,%edx
 5a5:	8b 45 08             	mov    0x8(%ebp),%eax
 5a8:	e8 11 fe ff ff       	call   3be <putc>
        putc(fd, c);
 5ad:	89 fa                	mov    %edi,%edx
 5af:	8b 45 08             	mov    0x8(%ebp),%eax
 5b2:	e8 07 fe ff ff       	call   3be <putc>
      state = 0;
 5b7:	be 00 00 00 00       	mov    $0x0,%esi
 5bc:	e9 ce fe ff ff       	jmp    48f <printf+0x2c>
    }
  }
}
 5c1:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5c4:	5b                   	pop    %ebx
 5c5:	5e                   	pop    %esi
 5c6:	5f                   	pop    %edi
 5c7:	5d                   	pop    %ebp
 5c8:	c3                   	ret    

000005c9 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5c9:	55                   	push   %ebp
 5ca:	89 e5                	mov    %esp,%ebp
 5cc:	57                   	push   %edi
 5cd:	56                   	push   %esi
 5ce:	53                   	push   %ebx
 5cf:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 5d2:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5d5:	a1 34 0b 00 00       	mov    0xb34,%eax
 5da:	eb 02                	jmp    5de <free+0x15>
 5dc:	89 d0                	mov    %edx,%eax
 5de:	39 c8                	cmp    %ecx,%eax
 5e0:	73 04                	jae    5e6 <free+0x1d>
 5e2:	39 08                	cmp    %ecx,(%eax)
 5e4:	77 12                	ja     5f8 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5e6:	8b 10                	mov    (%eax),%edx
 5e8:	39 c2                	cmp    %eax,%edx
 5ea:	77 f0                	ja     5dc <free+0x13>
 5ec:	39 c8                	cmp    %ecx,%eax
 5ee:	72 08                	jb     5f8 <free+0x2f>
 5f0:	39 ca                	cmp    %ecx,%edx
 5f2:	77 04                	ja     5f8 <free+0x2f>
 5f4:	89 d0                	mov    %edx,%eax
 5f6:	eb e6                	jmp    5de <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 5f8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 5fb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 5fe:	8b 10                	mov    (%eax),%edx
 600:	39 d7                	cmp    %edx,%edi
 602:	74 19                	je     61d <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 604:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 607:	8b 50 04             	mov    0x4(%eax),%edx
 60a:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 60d:	39 ce                	cmp    %ecx,%esi
 60f:	74 1b                	je     62c <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 611:	89 08                	mov    %ecx,(%eax)
  freep = p;
 613:	a3 34 0b 00 00       	mov    %eax,0xb34
}
 618:	5b                   	pop    %ebx
 619:	5e                   	pop    %esi
 61a:	5f                   	pop    %edi
 61b:	5d                   	pop    %ebp
 61c:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 61d:	03 72 04             	add    0x4(%edx),%esi
 620:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 623:	8b 10                	mov    (%eax),%edx
 625:	8b 12                	mov    (%edx),%edx
 627:	89 53 f8             	mov    %edx,-0x8(%ebx)
 62a:	eb db                	jmp    607 <free+0x3e>
    p->s.size += bp->s.size;
 62c:	03 53 fc             	add    -0x4(%ebx),%edx
 62f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 632:	8b 53 f8             	mov    -0x8(%ebx),%edx
 635:	89 10                	mov    %edx,(%eax)
 637:	eb da                	jmp    613 <free+0x4a>

00000639 <morecore>:

static Header*
morecore(uint nu)
{
 639:	55                   	push   %ebp
 63a:	89 e5                	mov    %esp,%ebp
 63c:	53                   	push   %ebx
 63d:	83 ec 04             	sub    $0x4,%esp
 640:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 642:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 647:	77 05                	ja     64e <morecore+0x15>
    nu = 4096;
 649:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 64e:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 655:	83 ec 0c             	sub    $0xc,%esp
 658:	50                   	push   %eax
 659:	e8 38 fd ff ff       	call   396 <sbrk>
  if(p == (char*)-1)
 65e:	83 c4 10             	add    $0x10,%esp
 661:	83 f8 ff             	cmp    $0xffffffff,%eax
 664:	74 1c                	je     682 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 666:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 669:	83 c0 08             	add    $0x8,%eax
 66c:	83 ec 0c             	sub    $0xc,%esp
 66f:	50                   	push   %eax
 670:	e8 54 ff ff ff       	call   5c9 <free>
  return freep;
 675:	a1 34 0b 00 00       	mov    0xb34,%eax
 67a:	83 c4 10             	add    $0x10,%esp
}
 67d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 680:	c9                   	leave  
 681:	c3                   	ret    
    return 0;
 682:	b8 00 00 00 00       	mov    $0x0,%eax
 687:	eb f4                	jmp    67d <morecore+0x44>

00000689 <malloc>:

void*
malloc(uint nbytes)
{
 689:	55                   	push   %ebp
 68a:	89 e5                	mov    %esp,%ebp
 68c:	53                   	push   %ebx
 68d:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 690:	8b 45 08             	mov    0x8(%ebp),%eax
 693:	8d 58 07             	lea    0x7(%eax),%ebx
 696:	c1 eb 03             	shr    $0x3,%ebx
 699:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 69c:	8b 0d 34 0b 00 00    	mov    0xb34,%ecx
 6a2:	85 c9                	test   %ecx,%ecx
 6a4:	74 04                	je     6aa <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6a6:	8b 01                	mov    (%ecx),%eax
 6a8:	eb 4a                	jmp    6f4 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 6aa:	c7 05 34 0b 00 00 38 	movl   $0xb38,0xb34
 6b1:	0b 00 00 
 6b4:	c7 05 38 0b 00 00 38 	movl   $0xb38,0xb38
 6bb:	0b 00 00 
    base.s.size = 0;
 6be:	c7 05 3c 0b 00 00 00 	movl   $0x0,0xb3c
 6c5:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 6c8:	b9 38 0b 00 00       	mov    $0xb38,%ecx
 6cd:	eb d7                	jmp    6a6 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 6cf:	74 19                	je     6ea <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 6d1:	29 da                	sub    %ebx,%edx
 6d3:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 6d6:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 6d9:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 6dc:	89 0d 34 0b 00 00    	mov    %ecx,0xb34
      return (void*)(p + 1);
 6e2:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 6e5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 6e8:	c9                   	leave  
 6e9:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 6ea:	8b 10                	mov    (%eax),%edx
 6ec:	89 11                	mov    %edx,(%ecx)
 6ee:	eb ec                	jmp    6dc <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6f0:	89 c1                	mov    %eax,%ecx
 6f2:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 6f4:	8b 50 04             	mov    0x4(%eax),%edx
 6f7:	39 da                	cmp    %ebx,%edx
 6f9:	73 d4                	jae    6cf <malloc+0x46>
    if(p == freep)
 6fb:	39 05 34 0b 00 00    	cmp    %eax,0xb34
 701:	75 ed                	jne    6f0 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 703:	89 d8                	mov    %ebx,%eax
 705:	e8 2f ff ff ff       	call   639 <morecore>
 70a:	85 c0                	test   %eax,%eax
 70c:	75 e2                	jne    6f0 <malloc+0x67>
 70e:	eb d5                	jmp    6e5 <malloc+0x5c>
