
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
  10:	68 80 0b 00 00       	push   $0xb80
  15:	56                   	push   %esi
  16:	e8 26 03 00 00       	call   341 <read>
  1b:	89 c3                	mov    %eax,%ebx
  1d:	83 c4 10             	add    $0x10,%esp
  20:	85 c0                	test   %eax,%eax
  22:	7e 2b                	jle    4f <cat+0x4f>
    if (write(1, buf, n) != n) {
  24:	83 ec 04             	sub    $0x4,%esp
  27:	53                   	push   %ebx
  28:	68 80 0b 00 00       	push   $0xb80
  2d:	6a 01                	push   $0x1
  2f:	e8 15 03 00 00       	call   349 <write>
  34:	83 c4 10             	add    $0x10,%esp
  37:	39 d8                	cmp    %ebx,%eax
  39:	74 cd                	je     8 <cat+0x8>
      printf(1, "cat: write error\n");
  3b:	83 ec 08             	sub    $0x8,%esp
  3e:	68 2c 07 00 00       	push   $0x72c
  43:	6a 01                	push   $0x1
  45:	e8 34 04 00 00       	call   47e <printf>
      exit();
  4a:	e8 da 02 00 00       	call   329 <exit>
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
  5b:	68 3e 07 00 00       	push   $0x73e
  60:	6a 01                	push   $0x1
  62:	e8 17 04 00 00       	call   47e <printf>
    exit();
  67:	e8 bd 02 00 00       	call   329 <exit>

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
  a1:	e8 83 02 00 00       	call   329 <exit>
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
  b2:	e8 9a 02 00 00       	call   351 <close>
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
  cf:	e8 95 02 00 00       	call   369 <open>
  d4:	89 c3                	mov    %eax,%ebx
  d6:	83 c4 10             	add    $0x10,%esp
  d9:	85 c0                	test   %eax,%eax
  db:	79 c9                	jns    a6 <main+0x3a>
      printf(1, "cat: cannot open %s\n", argv[i]);
  dd:	83 ec 04             	sub    $0x4,%esp
  e0:	ff 37                	push   (%edi)
  e2:	68 4f 07 00 00       	push   $0x74f
  e7:	6a 01                	push   $0x1
  e9:	e8 90 03 00 00       	call   47e <printf>
      exit();
  ee:	e8 36 02 00 00       	call   329 <exit>
  }
  exit();
  f3:	e8 31 02 00 00       	call   329 <exit>

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

// a wrapper func for clone
int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 109:	55                   	push   %ebp
 10a:	89 e5                	mov    %esp,%ebp
 10c:	83 ec 14             	sub    $0x14,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE*2);
 10f:	68 00 20 00 00       	push   $0x2000
 114:	e8 8b 05 00 00       	call   6a4 <malloc>
  if(n_stack == 0){
 119:	83 c4 10             	add    $0x10,%esp
 11c:	85 c0                	test   %eax,%eax
 11e:	74 14                	je     134 <thread_create+0x2b>
    return -1;
  }
  int new_pid = clone(start_routine, arg1, arg2, n_stack); // TODO: is this the right way to call it?
 120:	50                   	push   %eax
 121:	ff 75 10             	push   0x10(%ebp)
 124:	ff 75 0c             	push   0xc(%ebp)
 127:	ff 75 08             	push   0x8(%ebp)
 12a:	e8 9a 02 00 00       	call   3c9 <clone>


  // I can't remember if there was something else to do here but I'm sure I'll find out


  return new_pid;
 12f:	83 c4 10             	add    $0x10,%esp
}
 132:	c9                   	leave  
 133:	c3                   	ret    
    return -1;
 134:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 139:	eb f7                	jmp    132 <thread_create+0x29>

0000013b <thread_join>:

int thread_join() {
 13b:	55                   	push   %ebp
 13c:	89 e5                	mov    %esp,%ebp
 13e:	83 ec 24             	sub    $0x24,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 141:	8d 45 f4             	lea    -0xc(%ebp),%eax
 144:	50                   	push   %eax
 145:	e8 87 02 00 00       	call   3d1 <join>
  
  return pid;
}
 14a:	c9                   	leave  
 14b:	c3                   	ret    

0000014c <lock_acquire>:

void lock_acquire(lock_t *lock){
 14c:	55                   	push   %ebp
 14d:	89 e5                	mov    %esp,%ebp
 14f:	53                   	push   %ebx
 150:	83 ec 04             	sub    $0x4,%esp
 153:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 156:	83 ec 08             	sub    $0x8,%esp
 159:	6a 01                	push   $0x1
 15b:	53                   	push   %ebx
 15c:	e8 97 ff ff ff       	call   f8 <test_and_set>
 161:	83 c4 10             	add    $0x10,%esp
 164:	83 f8 01             	cmp    $0x1,%eax
 167:	74 ed                	je     156 <lock_acquire+0xa>
    ;
}
 169:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 16c:	c9                   	leave  
 16d:	c3                   	ret    

0000016e <lock_release>:

void lock_release(lock_t *lock) {
 16e:	55                   	push   %ebp
 16f:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 171:	8b 45 08             	mov    0x8(%ebp),%eax
 174:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 17a:	5d                   	pop    %ebp
 17b:	c3                   	ret    

0000017c <lock_init>:

void lock_init(lock_t *lock) {
 17c:	55                   	push   %ebp
 17d:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 17f:	8b 45 08             	mov    0x8(%ebp),%eax
 182:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 188:	5d                   	pop    %ebp
 189:	c3                   	ret    

0000018a <strcpy>:

char*
strcpy(char *s, const char *t)
{
 18a:	55                   	push   %ebp
 18b:	89 e5                	mov    %esp,%ebp
 18d:	56                   	push   %esi
 18e:	53                   	push   %ebx
 18f:	8b 75 08             	mov    0x8(%ebp),%esi
 192:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 195:	89 f0                	mov    %esi,%eax
 197:	89 d1                	mov    %edx,%ecx
 199:	83 c2 01             	add    $0x1,%edx
 19c:	89 c3                	mov    %eax,%ebx
 19e:	83 c0 01             	add    $0x1,%eax
 1a1:	0f b6 09             	movzbl (%ecx),%ecx
 1a4:	88 0b                	mov    %cl,(%ebx)
 1a6:	84 c9                	test   %cl,%cl
 1a8:	75 ed                	jne    197 <strcpy+0xd>
    ;
  return os;
}
 1aa:	89 f0                	mov    %esi,%eax
 1ac:	5b                   	pop    %ebx
 1ad:	5e                   	pop    %esi
 1ae:	5d                   	pop    %ebp
 1af:	c3                   	ret    

000001b0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1b6:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 1b9:	eb 06                	jmp    1c1 <strcmp+0x11>
    p++, q++;
 1bb:	83 c1 01             	add    $0x1,%ecx
 1be:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 1c1:	0f b6 01             	movzbl (%ecx),%eax
 1c4:	84 c0                	test   %al,%al
 1c6:	74 04                	je     1cc <strcmp+0x1c>
 1c8:	3a 02                	cmp    (%edx),%al
 1ca:	74 ef                	je     1bb <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 1cc:	0f b6 c0             	movzbl %al,%eax
 1cf:	0f b6 12             	movzbl (%edx),%edx
 1d2:	29 d0                	sub    %edx,%eax
}
 1d4:	5d                   	pop    %ebp
 1d5:	c3                   	ret    

000001d6 <strlen>:

uint
strlen(const char *s)
{
 1d6:	55                   	push   %ebp
 1d7:	89 e5                	mov    %esp,%ebp
 1d9:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 1dc:	b8 00 00 00 00       	mov    $0x0,%eax
 1e1:	eb 03                	jmp    1e6 <strlen+0x10>
 1e3:	83 c0 01             	add    $0x1,%eax
 1e6:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 1ea:	75 f7                	jne    1e3 <strlen+0xd>
    ;
  return n;
}
 1ec:	5d                   	pop    %ebp
 1ed:	c3                   	ret    

000001ee <memset>:

void*
memset(void *dst, int c, uint n)
{
 1ee:	55                   	push   %ebp
 1ef:	89 e5                	mov    %esp,%ebp
 1f1:	57                   	push   %edi
 1f2:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1f5:	89 d7                	mov    %edx,%edi
 1f7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1fa:	8b 45 0c             	mov    0xc(%ebp),%eax
 1fd:	fc                   	cld    
 1fe:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 200:	89 d0                	mov    %edx,%eax
 202:	8b 7d fc             	mov    -0x4(%ebp),%edi
 205:	c9                   	leave  
 206:	c3                   	ret    

00000207 <strchr>:

char*
strchr(const char *s, char c)
{
 207:	55                   	push   %ebp
 208:	89 e5                	mov    %esp,%ebp
 20a:	8b 45 08             	mov    0x8(%ebp),%eax
 20d:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 211:	eb 03                	jmp    216 <strchr+0xf>
 213:	83 c0 01             	add    $0x1,%eax
 216:	0f b6 10             	movzbl (%eax),%edx
 219:	84 d2                	test   %dl,%dl
 21b:	74 06                	je     223 <strchr+0x1c>
    if(*s == c)
 21d:	38 ca                	cmp    %cl,%dl
 21f:	75 f2                	jne    213 <strchr+0xc>
 221:	eb 05                	jmp    228 <strchr+0x21>
      return (char*)s;
  return 0;
 223:	b8 00 00 00 00       	mov    $0x0,%eax
}
 228:	5d                   	pop    %ebp
 229:	c3                   	ret    

0000022a <gets>:

char*
gets(char *buf, int max)
{
 22a:	55                   	push   %ebp
 22b:	89 e5                	mov    %esp,%ebp
 22d:	57                   	push   %edi
 22e:	56                   	push   %esi
 22f:	53                   	push   %ebx
 230:	83 ec 1c             	sub    $0x1c,%esp
 233:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 236:	bb 00 00 00 00       	mov    $0x0,%ebx
 23b:	89 de                	mov    %ebx,%esi
 23d:	83 c3 01             	add    $0x1,%ebx
 240:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 243:	7d 2e                	jge    273 <gets+0x49>
    cc = read(0, &c, 1);
 245:	83 ec 04             	sub    $0x4,%esp
 248:	6a 01                	push   $0x1
 24a:	8d 45 e7             	lea    -0x19(%ebp),%eax
 24d:	50                   	push   %eax
 24e:	6a 00                	push   $0x0
 250:	e8 ec 00 00 00       	call   341 <read>
    if(cc < 1)
 255:	83 c4 10             	add    $0x10,%esp
 258:	85 c0                	test   %eax,%eax
 25a:	7e 17                	jle    273 <gets+0x49>
      break;
    buf[i++] = c;
 25c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 260:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 263:	3c 0a                	cmp    $0xa,%al
 265:	0f 94 c2             	sete   %dl
 268:	3c 0d                	cmp    $0xd,%al
 26a:	0f 94 c0             	sete   %al
 26d:	08 c2                	or     %al,%dl
 26f:	74 ca                	je     23b <gets+0x11>
    buf[i++] = c;
 271:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 273:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 277:	89 f8                	mov    %edi,%eax
 279:	8d 65 f4             	lea    -0xc(%ebp),%esp
 27c:	5b                   	pop    %ebx
 27d:	5e                   	pop    %esi
 27e:	5f                   	pop    %edi
 27f:	5d                   	pop    %ebp
 280:	c3                   	ret    

00000281 <stat>:

int
stat(const char *n, struct stat *st)
{
 281:	55                   	push   %ebp
 282:	89 e5                	mov    %esp,%ebp
 284:	56                   	push   %esi
 285:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 286:	83 ec 08             	sub    $0x8,%esp
 289:	6a 00                	push   $0x0
 28b:	ff 75 08             	push   0x8(%ebp)
 28e:	e8 d6 00 00 00       	call   369 <open>
  if(fd < 0)
 293:	83 c4 10             	add    $0x10,%esp
 296:	85 c0                	test   %eax,%eax
 298:	78 24                	js     2be <stat+0x3d>
 29a:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 29c:	83 ec 08             	sub    $0x8,%esp
 29f:	ff 75 0c             	push   0xc(%ebp)
 2a2:	50                   	push   %eax
 2a3:	e8 d9 00 00 00       	call   381 <fstat>
 2a8:	89 c6                	mov    %eax,%esi
  close(fd);
 2aa:	89 1c 24             	mov    %ebx,(%esp)
 2ad:	e8 9f 00 00 00       	call   351 <close>
  return r;
 2b2:	83 c4 10             	add    $0x10,%esp
}
 2b5:	89 f0                	mov    %esi,%eax
 2b7:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2ba:	5b                   	pop    %ebx
 2bb:	5e                   	pop    %esi
 2bc:	5d                   	pop    %ebp
 2bd:	c3                   	ret    
    return -1;
 2be:	be ff ff ff ff       	mov    $0xffffffff,%esi
 2c3:	eb f0                	jmp    2b5 <stat+0x34>

000002c5 <atoi>:

int
atoi(const char *s)
{
 2c5:	55                   	push   %ebp
 2c6:	89 e5                	mov    %esp,%ebp
 2c8:	53                   	push   %ebx
 2c9:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 2cc:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 2d1:	eb 10                	jmp    2e3 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 2d3:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 2d6:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 2d9:	83 c1 01             	add    $0x1,%ecx
 2dc:	0f be c0             	movsbl %al,%eax
 2df:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 2e3:	0f b6 01             	movzbl (%ecx),%eax
 2e6:	8d 58 d0             	lea    -0x30(%eax),%ebx
 2e9:	80 fb 09             	cmp    $0x9,%bl
 2ec:	76 e5                	jbe    2d3 <atoi+0xe>
  return n;
}
 2ee:	89 d0                	mov    %edx,%eax
 2f0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2f3:	c9                   	leave  
 2f4:	c3                   	ret    

000002f5 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2f5:	55                   	push   %ebp
 2f6:	89 e5                	mov    %esp,%ebp
 2f8:	56                   	push   %esi
 2f9:	53                   	push   %ebx
 2fa:	8b 75 08             	mov    0x8(%ebp),%esi
 2fd:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 300:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 303:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 305:	eb 0d                	jmp    314 <memmove+0x1f>
    *dst++ = *src++;
 307:	0f b6 01             	movzbl (%ecx),%eax
 30a:	88 02                	mov    %al,(%edx)
 30c:	8d 49 01             	lea    0x1(%ecx),%ecx
 30f:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 312:	89 d8                	mov    %ebx,%eax
 314:	8d 58 ff             	lea    -0x1(%eax),%ebx
 317:	85 c0                	test   %eax,%eax
 319:	7f ec                	jg     307 <memmove+0x12>
  return vdst;
}
 31b:	89 f0                	mov    %esi,%eax
 31d:	5b                   	pop    %ebx
 31e:	5e                   	pop    %esi
 31f:	5d                   	pop    %ebp
 320:	c3                   	ret    

00000321 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 321:	b8 01 00 00 00       	mov    $0x1,%eax
 326:	cd 40                	int    $0x40
 328:	c3                   	ret    

00000329 <exit>:
SYSCALL(exit)
 329:	b8 02 00 00 00       	mov    $0x2,%eax
 32e:	cd 40                	int    $0x40
 330:	c3                   	ret    

00000331 <wait>:
SYSCALL(wait)
 331:	b8 03 00 00 00       	mov    $0x3,%eax
 336:	cd 40                	int    $0x40
 338:	c3                   	ret    

00000339 <pipe>:
SYSCALL(pipe)
 339:	b8 04 00 00 00       	mov    $0x4,%eax
 33e:	cd 40                	int    $0x40
 340:	c3                   	ret    

00000341 <read>:
SYSCALL(read)
 341:	b8 05 00 00 00       	mov    $0x5,%eax
 346:	cd 40                	int    $0x40
 348:	c3                   	ret    

00000349 <write>:
SYSCALL(write)
 349:	b8 10 00 00 00       	mov    $0x10,%eax
 34e:	cd 40                	int    $0x40
 350:	c3                   	ret    

00000351 <close>:
SYSCALL(close)
 351:	b8 15 00 00 00       	mov    $0x15,%eax
 356:	cd 40                	int    $0x40
 358:	c3                   	ret    

00000359 <kill>:
SYSCALL(kill)
 359:	b8 06 00 00 00       	mov    $0x6,%eax
 35e:	cd 40                	int    $0x40
 360:	c3                   	ret    

00000361 <exec>:
SYSCALL(exec)
 361:	b8 07 00 00 00       	mov    $0x7,%eax
 366:	cd 40                	int    $0x40
 368:	c3                   	ret    

00000369 <open>:
SYSCALL(open)
 369:	b8 0f 00 00 00       	mov    $0xf,%eax
 36e:	cd 40                	int    $0x40
 370:	c3                   	ret    

00000371 <mknod>:
SYSCALL(mknod)
 371:	b8 11 00 00 00       	mov    $0x11,%eax
 376:	cd 40                	int    $0x40
 378:	c3                   	ret    

00000379 <unlink>:
SYSCALL(unlink)
 379:	b8 12 00 00 00       	mov    $0x12,%eax
 37e:	cd 40                	int    $0x40
 380:	c3                   	ret    

00000381 <fstat>:
SYSCALL(fstat)
 381:	b8 08 00 00 00       	mov    $0x8,%eax
 386:	cd 40                	int    $0x40
 388:	c3                   	ret    

00000389 <link>:
SYSCALL(link)
 389:	b8 13 00 00 00       	mov    $0x13,%eax
 38e:	cd 40                	int    $0x40
 390:	c3                   	ret    

00000391 <mkdir>:
SYSCALL(mkdir)
 391:	b8 14 00 00 00       	mov    $0x14,%eax
 396:	cd 40                	int    $0x40
 398:	c3                   	ret    

00000399 <chdir>:
SYSCALL(chdir)
 399:	b8 09 00 00 00       	mov    $0x9,%eax
 39e:	cd 40                	int    $0x40
 3a0:	c3                   	ret    

000003a1 <dup>:
SYSCALL(dup)
 3a1:	b8 0a 00 00 00       	mov    $0xa,%eax
 3a6:	cd 40                	int    $0x40
 3a8:	c3                   	ret    

000003a9 <getpid>:
SYSCALL(getpid)
 3a9:	b8 0b 00 00 00       	mov    $0xb,%eax
 3ae:	cd 40                	int    $0x40
 3b0:	c3                   	ret    

000003b1 <sbrk>:
SYSCALL(sbrk)
 3b1:	b8 0c 00 00 00       	mov    $0xc,%eax
 3b6:	cd 40                	int    $0x40
 3b8:	c3                   	ret    

000003b9 <sleep>:
SYSCALL(sleep)
 3b9:	b8 0d 00 00 00       	mov    $0xd,%eax
 3be:	cd 40                	int    $0x40
 3c0:	c3                   	ret    

000003c1 <uptime>:
SYSCALL(uptime)
 3c1:	b8 0e 00 00 00       	mov    $0xe,%eax
 3c6:	cd 40                	int    $0x40
 3c8:	c3                   	ret    

000003c9 <clone>:
SYSCALL(clone)
 3c9:	b8 16 00 00 00       	mov    $0x16,%eax
 3ce:	cd 40                	int    $0x40
 3d0:	c3                   	ret    

000003d1 <join>:
 3d1:	b8 17 00 00 00       	mov    $0x17,%eax
 3d6:	cd 40                	int    $0x40
 3d8:	c3                   	ret    

000003d9 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 3d9:	55                   	push   %ebp
 3da:	89 e5                	mov    %esp,%ebp
 3dc:	83 ec 1c             	sub    $0x1c,%esp
 3df:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 3e2:	6a 01                	push   $0x1
 3e4:	8d 55 f4             	lea    -0xc(%ebp),%edx
 3e7:	52                   	push   %edx
 3e8:	50                   	push   %eax
 3e9:	e8 5b ff ff ff       	call   349 <write>
}
 3ee:	83 c4 10             	add    $0x10,%esp
 3f1:	c9                   	leave  
 3f2:	c3                   	ret    

000003f3 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 3f3:	55                   	push   %ebp
 3f4:	89 e5                	mov    %esp,%ebp
 3f6:	57                   	push   %edi
 3f7:	56                   	push   %esi
 3f8:	53                   	push   %ebx
 3f9:	83 ec 2c             	sub    $0x2c,%esp
 3fc:	89 45 d0             	mov    %eax,-0x30(%ebp)
 3ff:	89 d0                	mov    %edx,%eax
 401:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 403:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 407:	0f 95 c1             	setne  %cl
 40a:	c1 ea 1f             	shr    $0x1f,%edx
 40d:	84 d1                	test   %dl,%cl
 40f:	74 44                	je     455 <printint+0x62>
    neg = 1;
    x = -xx;
 411:	f7 d8                	neg    %eax
 413:	89 c1                	mov    %eax,%ecx
    neg = 1;
 415:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 41c:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 421:	89 c8                	mov    %ecx,%eax
 423:	ba 00 00 00 00       	mov    $0x0,%edx
 428:	f7 f6                	div    %esi
 42a:	89 df                	mov    %ebx,%edi
 42c:	83 c3 01             	add    $0x1,%ebx
 42f:	0f b6 92 c4 07 00 00 	movzbl 0x7c4(%edx),%edx
 436:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 43a:	89 ca                	mov    %ecx,%edx
 43c:	89 c1                	mov    %eax,%ecx
 43e:	39 d6                	cmp    %edx,%esi
 440:	76 df                	jbe    421 <printint+0x2e>
  if(neg)
 442:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 446:	74 31                	je     479 <printint+0x86>
    buf[i++] = '-';
 448:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 44d:	8d 5f 02             	lea    0x2(%edi),%ebx
 450:	8b 75 d0             	mov    -0x30(%ebp),%esi
 453:	eb 17                	jmp    46c <printint+0x79>
    x = xx;
 455:	89 c1                	mov    %eax,%ecx
  neg = 0;
 457:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 45e:	eb bc                	jmp    41c <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 460:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 465:	89 f0                	mov    %esi,%eax
 467:	e8 6d ff ff ff       	call   3d9 <putc>
  while(--i >= 0)
 46c:	83 eb 01             	sub    $0x1,%ebx
 46f:	79 ef                	jns    460 <printint+0x6d>
}
 471:	83 c4 2c             	add    $0x2c,%esp
 474:	5b                   	pop    %ebx
 475:	5e                   	pop    %esi
 476:	5f                   	pop    %edi
 477:	5d                   	pop    %ebp
 478:	c3                   	ret    
 479:	8b 75 d0             	mov    -0x30(%ebp),%esi
 47c:	eb ee                	jmp    46c <printint+0x79>

0000047e <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 47e:	55                   	push   %ebp
 47f:	89 e5                	mov    %esp,%ebp
 481:	57                   	push   %edi
 482:	56                   	push   %esi
 483:	53                   	push   %ebx
 484:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 487:	8d 45 10             	lea    0x10(%ebp),%eax
 48a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 48d:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 492:	bb 00 00 00 00       	mov    $0x0,%ebx
 497:	eb 14                	jmp    4ad <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 499:	89 fa                	mov    %edi,%edx
 49b:	8b 45 08             	mov    0x8(%ebp),%eax
 49e:	e8 36 ff ff ff       	call   3d9 <putc>
 4a3:	eb 05                	jmp    4aa <printf+0x2c>
      }
    } else if(state == '%'){
 4a5:	83 fe 25             	cmp    $0x25,%esi
 4a8:	74 25                	je     4cf <printf+0x51>
  for(i = 0; fmt[i]; i++){
 4aa:	83 c3 01             	add    $0x1,%ebx
 4ad:	8b 45 0c             	mov    0xc(%ebp),%eax
 4b0:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 4b4:	84 c0                	test   %al,%al
 4b6:	0f 84 20 01 00 00    	je     5dc <printf+0x15e>
    c = fmt[i] & 0xff;
 4bc:	0f be f8             	movsbl %al,%edi
 4bf:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 4c2:	85 f6                	test   %esi,%esi
 4c4:	75 df                	jne    4a5 <printf+0x27>
      if(c == '%'){
 4c6:	83 f8 25             	cmp    $0x25,%eax
 4c9:	75 ce                	jne    499 <printf+0x1b>
        state = '%';
 4cb:	89 c6                	mov    %eax,%esi
 4cd:	eb db                	jmp    4aa <printf+0x2c>
      if(c == 'd'){
 4cf:	83 f8 25             	cmp    $0x25,%eax
 4d2:	0f 84 cf 00 00 00    	je     5a7 <printf+0x129>
 4d8:	0f 8c dd 00 00 00    	jl     5bb <printf+0x13d>
 4de:	83 f8 78             	cmp    $0x78,%eax
 4e1:	0f 8f d4 00 00 00    	jg     5bb <printf+0x13d>
 4e7:	83 f8 63             	cmp    $0x63,%eax
 4ea:	0f 8c cb 00 00 00    	jl     5bb <printf+0x13d>
 4f0:	83 e8 63             	sub    $0x63,%eax
 4f3:	83 f8 15             	cmp    $0x15,%eax
 4f6:	0f 87 bf 00 00 00    	ja     5bb <printf+0x13d>
 4fc:	ff 24 85 6c 07 00 00 	jmp    *0x76c(,%eax,4)
        printint(fd, *ap, 10, 1);
 503:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 506:	8b 17                	mov    (%edi),%edx
 508:	83 ec 0c             	sub    $0xc,%esp
 50b:	6a 01                	push   $0x1
 50d:	b9 0a 00 00 00       	mov    $0xa,%ecx
 512:	8b 45 08             	mov    0x8(%ebp),%eax
 515:	e8 d9 fe ff ff       	call   3f3 <printint>
        ap++;
 51a:	83 c7 04             	add    $0x4,%edi
 51d:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 520:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 523:	be 00 00 00 00       	mov    $0x0,%esi
 528:	eb 80                	jmp    4aa <printf+0x2c>
        printint(fd, *ap, 16, 0);
 52a:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 52d:	8b 17                	mov    (%edi),%edx
 52f:	83 ec 0c             	sub    $0xc,%esp
 532:	6a 00                	push   $0x0
 534:	b9 10 00 00 00       	mov    $0x10,%ecx
 539:	8b 45 08             	mov    0x8(%ebp),%eax
 53c:	e8 b2 fe ff ff       	call   3f3 <printint>
        ap++;
 541:	83 c7 04             	add    $0x4,%edi
 544:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 547:	83 c4 10             	add    $0x10,%esp
      state = 0;
 54a:	be 00 00 00 00       	mov    $0x0,%esi
 54f:	e9 56 ff ff ff       	jmp    4aa <printf+0x2c>
        s = (char*)*ap;
 554:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 557:	8b 30                	mov    (%eax),%esi
        ap++;
 559:	83 c0 04             	add    $0x4,%eax
 55c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 55f:	85 f6                	test   %esi,%esi
 561:	75 15                	jne    578 <printf+0xfa>
          s = "(null)";
 563:	be 64 07 00 00       	mov    $0x764,%esi
 568:	eb 0e                	jmp    578 <printf+0xfa>
          putc(fd, *s);
 56a:	0f be d2             	movsbl %dl,%edx
 56d:	8b 45 08             	mov    0x8(%ebp),%eax
 570:	e8 64 fe ff ff       	call   3d9 <putc>
          s++;
 575:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 578:	0f b6 16             	movzbl (%esi),%edx
 57b:	84 d2                	test   %dl,%dl
 57d:	75 eb                	jne    56a <printf+0xec>
      state = 0;
 57f:	be 00 00 00 00       	mov    $0x0,%esi
 584:	e9 21 ff ff ff       	jmp    4aa <printf+0x2c>
        putc(fd, *ap);
 589:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 58c:	0f be 17             	movsbl (%edi),%edx
 58f:	8b 45 08             	mov    0x8(%ebp),%eax
 592:	e8 42 fe ff ff       	call   3d9 <putc>
        ap++;
 597:	83 c7 04             	add    $0x4,%edi
 59a:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 59d:	be 00 00 00 00       	mov    $0x0,%esi
 5a2:	e9 03 ff ff ff       	jmp    4aa <printf+0x2c>
        putc(fd, c);
 5a7:	89 fa                	mov    %edi,%edx
 5a9:	8b 45 08             	mov    0x8(%ebp),%eax
 5ac:	e8 28 fe ff ff       	call   3d9 <putc>
      state = 0;
 5b1:	be 00 00 00 00       	mov    $0x0,%esi
 5b6:	e9 ef fe ff ff       	jmp    4aa <printf+0x2c>
        putc(fd, '%');
 5bb:	ba 25 00 00 00       	mov    $0x25,%edx
 5c0:	8b 45 08             	mov    0x8(%ebp),%eax
 5c3:	e8 11 fe ff ff       	call   3d9 <putc>
        putc(fd, c);
 5c8:	89 fa                	mov    %edi,%edx
 5ca:	8b 45 08             	mov    0x8(%ebp),%eax
 5cd:	e8 07 fe ff ff       	call   3d9 <putc>
      state = 0;
 5d2:	be 00 00 00 00       	mov    $0x0,%esi
 5d7:	e9 ce fe ff ff       	jmp    4aa <printf+0x2c>
    }
  }
}
 5dc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5df:	5b                   	pop    %ebx
 5e0:	5e                   	pop    %esi
 5e1:	5f                   	pop    %edi
 5e2:	5d                   	pop    %ebp
 5e3:	c3                   	ret    

000005e4 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5e4:	55                   	push   %ebp
 5e5:	89 e5                	mov    %esp,%ebp
 5e7:	57                   	push   %edi
 5e8:	56                   	push   %esi
 5e9:	53                   	push   %ebx
 5ea:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 5ed:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5f0:	a1 80 0d 00 00       	mov    0xd80,%eax
 5f5:	eb 02                	jmp    5f9 <free+0x15>
 5f7:	89 d0                	mov    %edx,%eax
 5f9:	39 c8                	cmp    %ecx,%eax
 5fb:	73 04                	jae    601 <free+0x1d>
 5fd:	39 08                	cmp    %ecx,(%eax)
 5ff:	77 12                	ja     613 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 601:	8b 10                	mov    (%eax),%edx
 603:	39 c2                	cmp    %eax,%edx
 605:	77 f0                	ja     5f7 <free+0x13>
 607:	39 c8                	cmp    %ecx,%eax
 609:	72 08                	jb     613 <free+0x2f>
 60b:	39 ca                	cmp    %ecx,%edx
 60d:	77 04                	ja     613 <free+0x2f>
 60f:	89 d0                	mov    %edx,%eax
 611:	eb e6                	jmp    5f9 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 613:	8b 73 fc             	mov    -0x4(%ebx),%esi
 616:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 619:	8b 10                	mov    (%eax),%edx
 61b:	39 d7                	cmp    %edx,%edi
 61d:	74 19                	je     638 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 61f:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 622:	8b 50 04             	mov    0x4(%eax),%edx
 625:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 628:	39 ce                	cmp    %ecx,%esi
 62a:	74 1b                	je     647 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 62c:	89 08                	mov    %ecx,(%eax)
  freep = p;
 62e:	a3 80 0d 00 00       	mov    %eax,0xd80
}
 633:	5b                   	pop    %ebx
 634:	5e                   	pop    %esi
 635:	5f                   	pop    %edi
 636:	5d                   	pop    %ebp
 637:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 638:	03 72 04             	add    0x4(%edx),%esi
 63b:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 63e:	8b 10                	mov    (%eax),%edx
 640:	8b 12                	mov    (%edx),%edx
 642:	89 53 f8             	mov    %edx,-0x8(%ebx)
 645:	eb db                	jmp    622 <free+0x3e>
    p->s.size += bp->s.size;
 647:	03 53 fc             	add    -0x4(%ebx),%edx
 64a:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 64d:	8b 53 f8             	mov    -0x8(%ebx),%edx
 650:	89 10                	mov    %edx,(%eax)
 652:	eb da                	jmp    62e <free+0x4a>

00000654 <morecore>:

static Header*
morecore(uint nu)
{
 654:	55                   	push   %ebp
 655:	89 e5                	mov    %esp,%ebp
 657:	53                   	push   %ebx
 658:	83 ec 04             	sub    $0x4,%esp
 65b:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 65d:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 662:	77 05                	ja     669 <morecore+0x15>
    nu = 4096;
 664:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 669:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 670:	83 ec 0c             	sub    $0xc,%esp
 673:	50                   	push   %eax
 674:	e8 38 fd ff ff       	call   3b1 <sbrk>
  if(p == (char*)-1)
 679:	83 c4 10             	add    $0x10,%esp
 67c:	83 f8 ff             	cmp    $0xffffffff,%eax
 67f:	74 1c                	je     69d <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 681:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 684:	83 c0 08             	add    $0x8,%eax
 687:	83 ec 0c             	sub    $0xc,%esp
 68a:	50                   	push   %eax
 68b:	e8 54 ff ff ff       	call   5e4 <free>
  return freep;
 690:	a1 80 0d 00 00       	mov    0xd80,%eax
 695:	83 c4 10             	add    $0x10,%esp
}
 698:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 69b:	c9                   	leave  
 69c:	c3                   	ret    
    return 0;
 69d:	b8 00 00 00 00       	mov    $0x0,%eax
 6a2:	eb f4                	jmp    698 <morecore+0x44>

000006a4 <malloc>:

void*
malloc(uint nbytes)
{
 6a4:	55                   	push   %ebp
 6a5:	89 e5                	mov    %esp,%ebp
 6a7:	53                   	push   %ebx
 6a8:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6ab:	8b 45 08             	mov    0x8(%ebp),%eax
 6ae:	8d 58 07             	lea    0x7(%eax),%ebx
 6b1:	c1 eb 03             	shr    $0x3,%ebx
 6b4:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 6b7:	8b 0d 80 0d 00 00    	mov    0xd80,%ecx
 6bd:	85 c9                	test   %ecx,%ecx
 6bf:	74 04                	je     6c5 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6c1:	8b 01                	mov    (%ecx),%eax
 6c3:	eb 4a                	jmp    70f <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 6c5:	c7 05 80 0d 00 00 84 	movl   $0xd84,0xd80
 6cc:	0d 00 00 
 6cf:	c7 05 84 0d 00 00 84 	movl   $0xd84,0xd84
 6d6:	0d 00 00 
    base.s.size = 0;
 6d9:	c7 05 88 0d 00 00 00 	movl   $0x0,0xd88
 6e0:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 6e3:	b9 84 0d 00 00       	mov    $0xd84,%ecx
 6e8:	eb d7                	jmp    6c1 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 6ea:	74 19                	je     705 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 6ec:	29 da                	sub    %ebx,%edx
 6ee:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 6f1:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 6f4:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 6f7:	89 0d 80 0d 00 00    	mov    %ecx,0xd80
      return (void*)(p + 1);
 6fd:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 700:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 703:	c9                   	leave  
 704:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 705:	8b 10                	mov    (%eax),%edx
 707:	89 11                	mov    %edx,(%ecx)
 709:	eb ec                	jmp    6f7 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 70b:	89 c1                	mov    %eax,%ecx
 70d:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 70f:	8b 50 04             	mov    0x4(%eax),%edx
 712:	39 da                	cmp    %ebx,%edx
 714:	73 d4                	jae    6ea <malloc+0x46>
    if(p == freep)
 716:	39 05 80 0d 00 00    	cmp    %eax,0xd80
 71c:	75 ed                	jne    70b <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 71e:	89 d8                	mov    %ebx,%eax
 720:	e8 2f ff ff ff       	call   654 <morecore>
 725:	85 c0                	test   %eax,%eax
 727:	75 e2                	jne    70b <malloc+0x67>
 729:	eb d5                	jmp    700 <malloc+0x5c>
