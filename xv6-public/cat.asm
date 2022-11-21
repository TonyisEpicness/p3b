
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
  10:	68 60 0b 00 00       	push   $0xb60
  15:	56                   	push   %esi
  16:	e8 1b 03 00 00       	call   336 <read>
  1b:	89 c3                	mov    %eax,%ebx
  1d:	83 c4 10             	add    $0x10,%esp
  20:	85 c0                	test   %eax,%eax
  22:	7e 2b                	jle    4f <cat+0x4f>
    if (write(1, buf, n) != n) {
  24:	83 ec 04             	sub    $0x4,%esp
  27:	53                   	push   %ebx
  28:	68 60 0b 00 00       	push   $0xb60
  2d:	6a 01                	push   $0x1
  2f:	e8 0a 03 00 00       	call   33e <write>
  34:	83 c4 10             	add    $0x10,%esp
  37:	39 d8                	cmp    %ebx,%eax
  39:	74 cd                	je     8 <cat+0x8>
      printf(1, "cat: write error\n");
  3b:	83 ec 08             	sub    $0x8,%esp
  3e:	68 20 07 00 00       	push   $0x720
  43:	6a 01                	push   $0x1
  45:	e8 29 04 00 00       	call   473 <printf>
      exit();
  4a:	e8 cf 02 00 00       	call   31e <exit>
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
  5b:	68 32 07 00 00       	push   $0x732
  60:	6a 01                	push   $0x1
  62:	e8 0c 04 00 00       	call   473 <printf>
    exit();
  67:	e8 b2 02 00 00       	call   31e <exit>

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
  a1:	e8 78 02 00 00       	call   31e <exit>
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
  b2:	e8 8f 02 00 00       	call   346 <close>
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
  cf:	e8 8a 02 00 00       	call   35e <open>
  d4:	89 c3                	mov    %eax,%ebx
  d6:	83 c4 10             	add    $0x10,%esp
  d9:	85 c0                	test   %eax,%eax
  db:	79 c9                	jns    a6 <main+0x3a>
      printf(1, "cat: cannot open %s\n", argv[i]);
  dd:	83 ec 04             	sub    $0x4,%esp
  e0:	ff 37                	push   (%edi)
  e2:	68 43 07 00 00       	push   $0x743
  e7:	6a 01                	push   $0x1
  e9:	e8 85 03 00 00       	call   473 <printf>
      exit();
  ee:	e8 2b 02 00 00       	call   31e <exit>
  }
  exit();
  f3:	e8 26 02 00 00       	call   31e <exit>

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
  void *n_stack = malloc(PGSIZE);
 10f:	68 00 10 00 00       	push   $0x1000
 114:	e8 80 05 00 00       	call   699 <malloc>
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
 12a:	e8 8f 02 00 00       	call   3be <clone>


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
  return 0;
}
 13b:	b8 00 00 00 00       	mov    $0x0,%eax
 140:	c3                   	ret    

00000141 <lock_acquire>:

void lock_acquire(lock_t *lock){
 141:	55                   	push   %ebp
 142:	89 e5                	mov    %esp,%ebp
 144:	53                   	push   %ebx
 145:	83 ec 04             	sub    $0x4,%esp
 148:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 14b:	83 ec 08             	sub    $0x8,%esp
 14e:	6a 01                	push   $0x1
 150:	53                   	push   %ebx
 151:	e8 a2 ff ff ff       	call   f8 <test_and_set>
 156:	83 c4 10             	add    $0x10,%esp
 159:	83 f8 01             	cmp    $0x1,%eax
 15c:	74 ed                	je     14b <lock_acquire+0xa>
    ;
}
 15e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 161:	c9                   	leave  
 162:	c3                   	ret    

00000163 <lock_release>:

void lock_release(lock_t *lock) {
 163:	55                   	push   %ebp
 164:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 166:	8b 45 08             	mov    0x8(%ebp),%eax
 169:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 16f:	5d                   	pop    %ebp
 170:	c3                   	ret    

00000171 <lock_init>:

void lock_init(lock_t *lock) {
 171:	55                   	push   %ebp
 172:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 174:	8b 45 08             	mov    0x8(%ebp),%eax
 177:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 17d:	5d                   	pop    %ebp
 17e:	c3                   	ret    

0000017f <strcpy>:

char*
strcpy(char *s, const char *t)
{
 17f:	55                   	push   %ebp
 180:	89 e5                	mov    %esp,%ebp
 182:	56                   	push   %esi
 183:	53                   	push   %ebx
 184:	8b 75 08             	mov    0x8(%ebp),%esi
 187:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 18a:	89 f0                	mov    %esi,%eax
 18c:	89 d1                	mov    %edx,%ecx
 18e:	83 c2 01             	add    $0x1,%edx
 191:	89 c3                	mov    %eax,%ebx
 193:	83 c0 01             	add    $0x1,%eax
 196:	0f b6 09             	movzbl (%ecx),%ecx
 199:	88 0b                	mov    %cl,(%ebx)
 19b:	84 c9                	test   %cl,%cl
 19d:	75 ed                	jne    18c <strcpy+0xd>
    ;
  return os;
}
 19f:	89 f0                	mov    %esi,%eax
 1a1:	5b                   	pop    %ebx
 1a2:	5e                   	pop    %esi
 1a3:	5d                   	pop    %ebp
 1a4:	c3                   	ret    

000001a5 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1a5:	55                   	push   %ebp
 1a6:	89 e5                	mov    %esp,%ebp
 1a8:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1ab:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 1ae:	eb 06                	jmp    1b6 <strcmp+0x11>
    p++, q++;
 1b0:	83 c1 01             	add    $0x1,%ecx
 1b3:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 1b6:	0f b6 01             	movzbl (%ecx),%eax
 1b9:	84 c0                	test   %al,%al
 1bb:	74 04                	je     1c1 <strcmp+0x1c>
 1bd:	3a 02                	cmp    (%edx),%al
 1bf:	74 ef                	je     1b0 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 1c1:	0f b6 c0             	movzbl %al,%eax
 1c4:	0f b6 12             	movzbl (%edx),%edx
 1c7:	29 d0                	sub    %edx,%eax
}
 1c9:	5d                   	pop    %ebp
 1ca:	c3                   	ret    

000001cb <strlen>:

uint
strlen(const char *s)
{
 1cb:	55                   	push   %ebp
 1cc:	89 e5                	mov    %esp,%ebp
 1ce:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 1d1:	b8 00 00 00 00       	mov    $0x0,%eax
 1d6:	eb 03                	jmp    1db <strlen+0x10>
 1d8:	83 c0 01             	add    $0x1,%eax
 1db:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 1df:	75 f7                	jne    1d8 <strlen+0xd>
    ;
  return n;
}
 1e1:	5d                   	pop    %ebp
 1e2:	c3                   	ret    

000001e3 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1e3:	55                   	push   %ebp
 1e4:	89 e5                	mov    %esp,%ebp
 1e6:	57                   	push   %edi
 1e7:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1ea:	89 d7                	mov    %edx,%edi
 1ec:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1ef:	8b 45 0c             	mov    0xc(%ebp),%eax
 1f2:	fc                   	cld    
 1f3:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1f5:	89 d0                	mov    %edx,%eax
 1f7:	8b 7d fc             	mov    -0x4(%ebp),%edi
 1fa:	c9                   	leave  
 1fb:	c3                   	ret    

000001fc <strchr>:

char*
strchr(const char *s, char c)
{
 1fc:	55                   	push   %ebp
 1fd:	89 e5                	mov    %esp,%ebp
 1ff:	8b 45 08             	mov    0x8(%ebp),%eax
 202:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 206:	eb 03                	jmp    20b <strchr+0xf>
 208:	83 c0 01             	add    $0x1,%eax
 20b:	0f b6 10             	movzbl (%eax),%edx
 20e:	84 d2                	test   %dl,%dl
 210:	74 06                	je     218 <strchr+0x1c>
    if(*s == c)
 212:	38 ca                	cmp    %cl,%dl
 214:	75 f2                	jne    208 <strchr+0xc>
 216:	eb 05                	jmp    21d <strchr+0x21>
      return (char*)s;
  return 0;
 218:	b8 00 00 00 00       	mov    $0x0,%eax
}
 21d:	5d                   	pop    %ebp
 21e:	c3                   	ret    

0000021f <gets>:

char*
gets(char *buf, int max)
{
 21f:	55                   	push   %ebp
 220:	89 e5                	mov    %esp,%ebp
 222:	57                   	push   %edi
 223:	56                   	push   %esi
 224:	53                   	push   %ebx
 225:	83 ec 1c             	sub    $0x1c,%esp
 228:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 22b:	bb 00 00 00 00       	mov    $0x0,%ebx
 230:	89 de                	mov    %ebx,%esi
 232:	83 c3 01             	add    $0x1,%ebx
 235:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 238:	7d 2e                	jge    268 <gets+0x49>
    cc = read(0, &c, 1);
 23a:	83 ec 04             	sub    $0x4,%esp
 23d:	6a 01                	push   $0x1
 23f:	8d 45 e7             	lea    -0x19(%ebp),%eax
 242:	50                   	push   %eax
 243:	6a 00                	push   $0x0
 245:	e8 ec 00 00 00       	call   336 <read>
    if(cc < 1)
 24a:	83 c4 10             	add    $0x10,%esp
 24d:	85 c0                	test   %eax,%eax
 24f:	7e 17                	jle    268 <gets+0x49>
      break;
    buf[i++] = c;
 251:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 255:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 258:	3c 0a                	cmp    $0xa,%al
 25a:	0f 94 c2             	sete   %dl
 25d:	3c 0d                	cmp    $0xd,%al
 25f:	0f 94 c0             	sete   %al
 262:	08 c2                	or     %al,%dl
 264:	74 ca                	je     230 <gets+0x11>
    buf[i++] = c;
 266:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 268:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 26c:	89 f8                	mov    %edi,%eax
 26e:	8d 65 f4             	lea    -0xc(%ebp),%esp
 271:	5b                   	pop    %ebx
 272:	5e                   	pop    %esi
 273:	5f                   	pop    %edi
 274:	5d                   	pop    %ebp
 275:	c3                   	ret    

00000276 <stat>:

int
stat(const char *n, struct stat *st)
{
 276:	55                   	push   %ebp
 277:	89 e5                	mov    %esp,%ebp
 279:	56                   	push   %esi
 27a:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 27b:	83 ec 08             	sub    $0x8,%esp
 27e:	6a 00                	push   $0x0
 280:	ff 75 08             	push   0x8(%ebp)
 283:	e8 d6 00 00 00       	call   35e <open>
  if(fd < 0)
 288:	83 c4 10             	add    $0x10,%esp
 28b:	85 c0                	test   %eax,%eax
 28d:	78 24                	js     2b3 <stat+0x3d>
 28f:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 291:	83 ec 08             	sub    $0x8,%esp
 294:	ff 75 0c             	push   0xc(%ebp)
 297:	50                   	push   %eax
 298:	e8 d9 00 00 00       	call   376 <fstat>
 29d:	89 c6                	mov    %eax,%esi
  close(fd);
 29f:	89 1c 24             	mov    %ebx,(%esp)
 2a2:	e8 9f 00 00 00       	call   346 <close>
  return r;
 2a7:	83 c4 10             	add    $0x10,%esp
}
 2aa:	89 f0                	mov    %esi,%eax
 2ac:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2af:	5b                   	pop    %ebx
 2b0:	5e                   	pop    %esi
 2b1:	5d                   	pop    %ebp
 2b2:	c3                   	ret    
    return -1;
 2b3:	be ff ff ff ff       	mov    $0xffffffff,%esi
 2b8:	eb f0                	jmp    2aa <stat+0x34>

000002ba <atoi>:

int
atoi(const char *s)
{
 2ba:	55                   	push   %ebp
 2bb:	89 e5                	mov    %esp,%ebp
 2bd:	53                   	push   %ebx
 2be:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 2c1:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 2c6:	eb 10                	jmp    2d8 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 2c8:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 2cb:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 2ce:	83 c1 01             	add    $0x1,%ecx
 2d1:	0f be c0             	movsbl %al,%eax
 2d4:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 2d8:	0f b6 01             	movzbl (%ecx),%eax
 2db:	8d 58 d0             	lea    -0x30(%eax),%ebx
 2de:	80 fb 09             	cmp    $0x9,%bl
 2e1:	76 e5                	jbe    2c8 <atoi+0xe>
  return n;
}
 2e3:	89 d0                	mov    %edx,%eax
 2e5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2e8:	c9                   	leave  
 2e9:	c3                   	ret    

000002ea <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2ea:	55                   	push   %ebp
 2eb:	89 e5                	mov    %esp,%ebp
 2ed:	56                   	push   %esi
 2ee:	53                   	push   %ebx
 2ef:	8b 75 08             	mov    0x8(%ebp),%esi
 2f2:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 2f5:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 2f8:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 2fa:	eb 0d                	jmp    309 <memmove+0x1f>
    *dst++ = *src++;
 2fc:	0f b6 01             	movzbl (%ecx),%eax
 2ff:	88 02                	mov    %al,(%edx)
 301:	8d 49 01             	lea    0x1(%ecx),%ecx
 304:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 307:	89 d8                	mov    %ebx,%eax
 309:	8d 58 ff             	lea    -0x1(%eax),%ebx
 30c:	85 c0                	test   %eax,%eax
 30e:	7f ec                	jg     2fc <memmove+0x12>
  return vdst;
}
 310:	89 f0                	mov    %esi,%eax
 312:	5b                   	pop    %ebx
 313:	5e                   	pop    %esi
 314:	5d                   	pop    %ebp
 315:	c3                   	ret    

00000316 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 316:	b8 01 00 00 00       	mov    $0x1,%eax
 31b:	cd 40                	int    $0x40
 31d:	c3                   	ret    

0000031e <exit>:
SYSCALL(exit)
 31e:	b8 02 00 00 00       	mov    $0x2,%eax
 323:	cd 40                	int    $0x40
 325:	c3                   	ret    

00000326 <wait>:
SYSCALL(wait)
 326:	b8 03 00 00 00       	mov    $0x3,%eax
 32b:	cd 40                	int    $0x40
 32d:	c3                   	ret    

0000032e <pipe>:
SYSCALL(pipe)
 32e:	b8 04 00 00 00       	mov    $0x4,%eax
 333:	cd 40                	int    $0x40
 335:	c3                   	ret    

00000336 <read>:
SYSCALL(read)
 336:	b8 05 00 00 00       	mov    $0x5,%eax
 33b:	cd 40                	int    $0x40
 33d:	c3                   	ret    

0000033e <write>:
SYSCALL(write)
 33e:	b8 10 00 00 00       	mov    $0x10,%eax
 343:	cd 40                	int    $0x40
 345:	c3                   	ret    

00000346 <close>:
SYSCALL(close)
 346:	b8 15 00 00 00       	mov    $0x15,%eax
 34b:	cd 40                	int    $0x40
 34d:	c3                   	ret    

0000034e <kill>:
SYSCALL(kill)
 34e:	b8 06 00 00 00       	mov    $0x6,%eax
 353:	cd 40                	int    $0x40
 355:	c3                   	ret    

00000356 <exec>:
SYSCALL(exec)
 356:	b8 07 00 00 00       	mov    $0x7,%eax
 35b:	cd 40                	int    $0x40
 35d:	c3                   	ret    

0000035e <open>:
SYSCALL(open)
 35e:	b8 0f 00 00 00       	mov    $0xf,%eax
 363:	cd 40                	int    $0x40
 365:	c3                   	ret    

00000366 <mknod>:
SYSCALL(mknod)
 366:	b8 11 00 00 00       	mov    $0x11,%eax
 36b:	cd 40                	int    $0x40
 36d:	c3                   	ret    

0000036e <unlink>:
SYSCALL(unlink)
 36e:	b8 12 00 00 00       	mov    $0x12,%eax
 373:	cd 40                	int    $0x40
 375:	c3                   	ret    

00000376 <fstat>:
SYSCALL(fstat)
 376:	b8 08 00 00 00       	mov    $0x8,%eax
 37b:	cd 40                	int    $0x40
 37d:	c3                   	ret    

0000037e <link>:
SYSCALL(link)
 37e:	b8 13 00 00 00       	mov    $0x13,%eax
 383:	cd 40                	int    $0x40
 385:	c3                   	ret    

00000386 <mkdir>:
SYSCALL(mkdir)
 386:	b8 14 00 00 00       	mov    $0x14,%eax
 38b:	cd 40                	int    $0x40
 38d:	c3                   	ret    

0000038e <chdir>:
SYSCALL(chdir)
 38e:	b8 09 00 00 00       	mov    $0x9,%eax
 393:	cd 40                	int    $0x40
 395:	c3                   	ret    

00000396 <dup>:
SYSCALL(dup)
 396:	b8 0a 00 00 00       	mov    $0xa,%eax
 39b:	cd 40                	int    $0x40
 39d:	c3                   	ret    

0000039e <getpid>:
SYSCALL(getpid)
 39e:	b8 0b 00 00 00       	mov    $0xb,%eax
 3a3:	cd 40                	int    $0x40
 3a5:	c3                   	ret    

000003a6 <sbrk>:
SYSCALL(sbrk)
 3a6:	b8 0c 00 00 00       	mov    $0xc,%eax
 3ab:	cd 40                	int    $0x40
 3ad:	c3                   	ret    

000003ae <sleep>:
SYSCALL(sleep)
 3ae:	b8 0d 00 00 00       	mov    $0xd,%eax
 3b3:	cd 40                	int    $0x40
 3b5:	c3                   	ret    

000003b6 <uptime>:
SYSCALL(uptime)
 3b6:	b8 0e 00 00 00       	mov    $0xe,%eax
 3bb:	cd 40                	int    $0x40
 3bd:	c3                   	ret    

000003be <clone>:
SYSCALL(clone)
 3be:	b8 16 00 00 00       	mov    $0x16,%eax
 3c3:	cd 40                	int    $0x40
 3c5:	c3                   	ret    

000003c6 <join>:
 3c6:	b8 17 00 00 00       	mov    $0x17,%eax
 3cb:	cd 40                	int    $0x40
 3cd:	c3                   	ret    

000003ce <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 3ce:	55                   	push   %ebp
 3cf:	89 e5                	mov    %esp,%ebp
 3d1:	83 ec 1c             	sub    $0x1c,%esp
 3d4:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 3d7:	6a 01                	push   $0x1
 3d9:	8d 55 f4             	lea    -0xc(%ebp),%edx
 3dc:	52                   	push   %edx
 3dd:	50                   	push   %eax
 3de:	e8 5b ff ff ff       	call   33e <write>
}
 3e3:	83 c4 10             	add    $0x10,%esp
 3e6:	c9                   	leave  
 3e7:	c3                   	ret    

000003e8 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 3e8:	55                   	push   %ebp
 3e9:	89 e5                	mov    %esp,%ebp
 3eb:	57                   	push   %edi
 3ec:	56                   	push   %esi
 3ed:	53                   	push   %ebx
 3ee:	83 ec 2c             	sub    $0x2c,%esp
 3f1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 3f4:	89 d0                	mov    %edx,%eax
 3f6:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 3f8:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 3fc:	0f 95 c1             	setne  %cl
 3ff:	c1 ea 1f             	shr    $0x1f,%edx
 402:	84 d1                	test   %dl,%cl
 404:	74 44                	je     44a <printint+0x62>
    neg = 1;
    x = -xx;
 406:	f7 d8                	neg    %eax
 408:	89 c1                	mov    %eax,%ecx
    neg = 1;
 40a:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 411:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 416:	89 c8                	mov    %ecx,%eax
 418:	ba 00 00 00 00       	mov    $0x0,%edx
 41d:	f7 f6                	div    %esi
 41f:	89 df                	mov    %ebx,%edi
 421:	83 c3 01             	add    $0x1,%ebx
 424:	0f b6 92 b8 07 00 00 	movzbl 0x7b8(%edx),%edx
 42b:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 42f:	89 ca                	mov    %ecx,%edx
 431:	89 c1                	mov    %eax,%ecx
 433:	39 d6                	cmp    %edx,%esi
 435:	76 df                	jbe    416 <printint+0x2e>
  if(neg)
 437:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 43b:	74 31                	je     46e <printint+0x86>
    buf[i++] = '-';
 43d:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 442:	8d 5f 02             	lea    0x2(%edi),%ebx
 445:	8b 75 d0             	mov    -0x30(%ebp),%esi
 448:	eb 17                	jmp    461 <printint+0x79>
    x = xx;
 44a:	89 c1                	mov    %eax,%ecx
  neg = 0;
 44c:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 453:	eb bc                	jmp    411 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 455:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 45a:	89 f0                	mov    %esi,%eax
 45c:	e8 6d ff ff ff       	call   3ce <putc>
  while(--i >= 0)
 461:	83 eb 01             	sub    $0x1,%ebx
 464:	79 ef                	jns    455 <printint+0x6d>
}
 466:	83 c4 2c             	add    $0x2c,%esp
 469:	5b                   	pop    %ebx
 46a:	5e                   	pop    %esi
 46b:	5f                   	pop    %edi
 46c:	5d                   	pop    %ebp
 46d:	c3                   	ret    
 46e:	8b 75 d0             	mov    -0x30(%ebp),%esi
 471:	eb ee                	jmp    461 <printint+0x79>

00000473 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 473:	55                   	push   %ebp
 474:	89 e5                	mov    %esp,%ebp
 476:	57                   	push   %edi
 477:	56                   	push   %esi
 478:	53                   	push   %ebx
 479:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 47c:	8d 45 10             	lea    0x10(%ebp),%eax
 47f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 482:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 487:	bb 00 00 00 00       	mov    $0x0,%ebx
 48c:	eb 14                	jmp    4a2 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 48e:	89 fa                	mov    %edi,%edx
 490:	8b 45 08             	mov    0x8(%ebp),%eax
 493:	e8 36 ff ff ff       	call   3ce <putc>
 498:	eb 05                	jmp    49f <printf+0x2c>
      }
    } else if(state == '%'){
 49a:	83 fe 25             	cmp    $0x25,%esi
 49d:	74 25                	je     4c4 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 49f:	83 c3 01             	add    $0x1,%ebx
 4a2:	8b 45 0c             	mov    0xc(%ebp),%eax
 4a5:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 4a9:	84 c0                	test   %al,%al
 4ab:	0f 84 20 01 00 00    	je     5d1 <printf+0x15e>
    c = fmt[i] & 0xff;
 4b1:	0f be f8             	movsbl %al,%edi
 4b4:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 4b7:	85 f6                	test   %esi,%esi
 4b9:	75 df                	jne    49a <printf+0x27>
      if(c == '%'){
 4bb:	83 f8 25             	cmp    $0x25,%eax
 4be:	75 ce                	jne    48e <printf+0x1b>
        state = '%';
 4c0:	89 c6                	mov    %eax,%esi
 4c2:	eb db                	jmp    49f <printf+0x2c>
      if(c == 'd'){
 4c4:	83 f8 25             	cmp    $0x25,%eax
 4c7:	0f 84 cf 00 00 00    	je     59c <printf+0x129>
 4cd:	0f 8c dd 00 00 00    	jl     5b0 <printf+0x13d>
 4d3:	83 f8 78             	cmp    $0x78,%eax
 4d6:	0f 8f d4 00 00 00    	jg     5b0 <printf+0x13d>
 4dc:	83 f8 63             	cmp    $0x63,%eax
 4df:	0f 8c cb 00 00 00    	jl     5b0 <printf+0x13d>
 4e5:	83 e8 63             	sub    $0x63,%eax
 4e8:	83 f8 15             	cmp    $0x15,%eax
 4eb:	0f 87 bf 00 00 00    	ja     5b0 <printf+0x13d>
 4f1:	ff 24 85 60 07 00 00 	jmp    *0x760(,%eax,4)
        printint(fd, *ap, 10, 1);
 4f8:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4fb:	8b 17                	mov    (%edi),%edx
 4fd:	83 ec 0c             	sub    $0xc,%esp
 500:	6a 01                	push   $0x1
 502:	b9 0a 00 00 00       	mov    $0xa,%ecx
 507:	8b 45 08             	mov    0x8(%ebp),%eax
 50a:	e8 d9 fe ff ff       	call   3e8 <printint>
        ap++;
 50f:	83 c7 04             	add    $0x4,%edi
 512:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 515:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 518:	be 00 00 00 00       	mov    $0x0,%esi
 51d:	eb 80                	jmp    49f <printf+0x2c>
        printint(fd, *ap, 16, 0);
 51f:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 522:	8b 17                	mov    (%edi),%edx
 524:	83 ec 0c             	sub    $0xc,%esp
 527:	6a 00                	push   $0x0
 529:	b9 10 00 00 00       	mov    $0x10,%ecx
 52e:	8b 45 08             	mov    0x8(%ebp),%eax
 531:	e8 b2 fe ff ff       	call   3e8 <printint>
        ap++;
 536:	83 c7 04             	add    $0x4,%edi
 539:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 53c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 53f:	be 00 00 00 00       	mov    $0x0,%esi
 544:	e9 56 ff ff ff       	jmp    49f <printf+0x2c>
        s = (char*)*ap;
 549:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 54c:	8b 30                	mov    (%eax),%esi
        ap++;
 54e:	83 c0 04             	add    $0x4,%eax
 551:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 554:	85 f6                	test   %esi,%esi
 556:	75 15                	jne    56d <printf+0xfa>
          s = "(null)";
 558:	be 58 07 00 00       	mov    $0x758,%esi
 55d:	eb 0e                	jmp    56d <printf+0xfa>
          putc(fd, *s);
 55f:	0f be d2             	movsbl %dl,%edx
 562:	8b 45 08             	mov    0x8(%ebp),%eax
 565:	e8 64 fe ff ff       	call   3ce <putc>
          s++;
 56a:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 56d:	0f b6 16             	movzbl (%esi),%edx
 570:	84 d2                	test   %dl,%dl
 572:	75 eb                	jne    55f <printf+0xec>
      state = 0;
 574:	be 00 00 00 00       	mov    $0x0,%esi
 579:	e9 21 ff ff ff       	jmp    49f <printf+0x2c>
        putc(fd, *ap);
 57e:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 581:	0f be 17             	movsbl (%edi),%edx
 584:	8b 45 08             	mov    0x8(%ebp),%eax
 587:	e8 42 fe ff ff       	call   3ce <putc>
        ap++;
 58c:	83 c7 04             	add    $0x4,%edi
 58f:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 592:	be 00 00 00 00       	mov    $0x0,%esi
 597:	e9 03 ff ff ff       	jmp    49f <printf+0x2c>
        putc(fd, c);
 59c:	89 fa                	mov    %edi,%edx
 59e:	8b 45 08             	mov    0x8(%ebp),%eax
 5a1:	e8 28 fe ff ff       	call   3ce <putc>
      state = 0;
 5a6:	be 00 00 00 00       	mov    $0x0,%esi
 5ab:	e9 ef fe ff ff       	jmp    49f <printf+0x2c>
        putc(fd, '%');
 5b0:	ba 25 00 00 00       	mov    $0x25,%edx
 5b5:	8b 45 08             	mov    0x8(%ebp),%eax
 5b8:	e8 11 fe ff ff       	call   3ce <putc>
        putc(fd, c);
 5bd:	89 fa                	mov    %edi,%edx
 5bf:	8b 45 08             	mov    0x8(%ebp),%eax
 5c2:	e8 07 fe ff ff       	call   3ce <putc>
      state = 0;
 5c7:	be 00 00 00 00       	mov    $0x0,%esi
 5cc:	e9 ce fe ff ff       	jmp    49f <printf+0x2c>
    }
  }
}
 5d1:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5d4:	5b                   	pop    %ebx
 5d5:	5e                   	pop    %esi
 5d6:	5f                   	pop    %edi
 5d7:	5d                   	pop    %ebp
 5d8:	c3                   	ret    

000005d9 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5d9:	55                   	push   %ebp
 5da:	89 e5                	mov    %esp,%ebp
 5dc:	57                   	push   %edi
 5dd:	56                   	push   %esi
 5de:	53                   	push   %ebx
 5df:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 5e2:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5e5:	a1 60 0d 00 00       	mov    0xd60,%eax
 5ea:	eb 02                	jmp    5ee <free+0x15>
 5ec:	89 d0                	mov    %edx,%eax
 5ee:	39 c8                	cmp    %ecx,%eax
 5f0:	73 04                	jae    5f6 <free+0x1d>
 5f2:	39 08                	cmp    %ecx,(%eax)
 5f4:	77 12                	ja     608 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5f6:	8b 10                	mov    (%eax),%edx
 5f8:	39 c2                	cmp    %eax,%edx
 5fa:	77 f0                	ja     5ec <free+0x13>
 5fc:	39 c8                	cmp    %ecx,%eax
 5fe:	72 08                	jb     608 <free+0x2f>
 600:	39 ca                	cmp    %ecx,%edx
 602:	77 04                	ja     608 <free+0x2f>
 604:	89 d0                	mov    %edx,%eax
 606:	eb e6                	jmp    5ee <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 608:	8b 73 fc             	mov    -0x4(%ebx),%esi
 60b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 60e:	8b 10                	mov    (%eax),%edx
 610:	39 d7                	cmp    %edx,%edi
 612:	74 19                	je     62d <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 614:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 617:	8b 50 04             	mov    0x4(%eax),%edx
 61a:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 61d:	39 ce                	cmp    %ecx,%esi
 61f:	74 1b                	je     63c <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 621:	89 08                	mov    %ecx,(%eax)
  freep = p;
 623:	a3 60 0d 00 00       	mov    %eax,0xd60
}
 628:	5b                   	pop    %ebx
 629:	5e                   	pop    %esi
 62a:	5f                   	pop    %edi
 62b:	5d                   	pop    %ebp
 62c:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 62d:	03 72 04             	add    0x4(%edx),%esi
 630:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 633:	8b 10                	mov    (%eax),%edx
 635:	8b 12                	mov    (%edx),%edx
 637:	89 53 f8             	mov    %edx,-0x8(%ebx)
 63a:	eb db                	jmp    617 <free+0x3e>
    p->s.size += bp->s.size;
 63c:	03 53 fc             	add    -0x4(%ebx),%edx
 63f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 642:	8b 53 f8             	mov    -0x8(%ebx),%edx
 645:	89 10                	mov    %edx,(%eax)
 647:	eb da                	jmp    623 <free+0x4a>

00000649 <morecore>:

static Header*
morecore(uint nu)
{
 649:	55                   	push   %ebp
 64a:	89 e5                	mov    %esp,%ebp
 64c:	53                   	push   %ebx
 64d:	83 ec 04             	sub    $0x4,%esp
 650:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 652:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 657:	77 05                	ja     65e <morecore+0x15>
    nu = 4096;
 659:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 65e:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 665:	83 ec 0c             	sub    $0xc,%esp
 668:	50                   	push   %eax
 669:	e8 38 fd ff ff       	call   3a6 <sbrk>
  if(p == (char*)-1)
 66e:	83 c4 10             	add    $0x10,%esp
 671:	83 f8 ff             	cmp    $0xffffffff,%eax
 674:	74 1c                	je     692 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 676:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 679:	83 c0 08             	add    $0x8,%eax
 67c:	83 ec 0c             	sub    $0xc,%esp
 67f:	50                   	push   %eax
 680:	e8 54 ff ff ff       	call   5d9 <free>
  return freep;
 685:	a1 60 0d 00 00       	mov    0xd60,%eax
 68a:	83 c4 10             	add    $0x10,%esp
}
 68d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 690:	c9                   	leave  
 691:	c3                   	ret    
    return 0;
 692:	b8 00 00 00 00       	mov    $0x0,%eax
 697:	eb f4                	jmp    68d <morecore+0x44>

00000699 <malloc>:

void*
malloc(uint nbytes)
{
 699:	55                   	push   %ebp
 69a:	89 e5                	mov    %esp,%ebp
 69c:	53                   	push   %ebx
 69d:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6a0:	8b 45 08             	mov    0x8(%ebp),%eax
 6a3:	8d 58 07             	lea    0x7(%eax),%ebx
 6a6:	c1 eb 03             	shr    $0x3,%ebx
 6a9:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 6ac:	8b 0d 60 0d 00 00    	mov    0xd60,%ecx
 6b2:	85 c9                	test   %ecx,%ecx
 6b4:	74 04                	je     6ba <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6b6:	8b 01                	mov    (%ecx),%eax
 6b8:	eb 4a                	jmp    704 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 6ba:	c7 05 60 0d 00 00 64 	movl   $0xd64,0xd60
 6c1:	0d 00 00 
 6c4:	c7 05 64 0d 00 00 64 	movl   $0xd64,0xd64
 6cb:	0d 00 00 
    base.s.size = 0;
 6ce:	c7 05 68 0d 00 00 00 	movl   $0x0,0xd68
 6d5:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 6d8:	b9 64 0d 00 00       	mov    $0xd64,%ecx
 6dd:	eb d7                	jmp    6b6 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 6df:	74 19                	je     6fa <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 6e1:	29 da                	sub    %ebx,%edx
 6e3:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 6e6:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 6e9:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 6ec:	89 0d 60 0d 00 00    	mov    %ecx,0xd60
      return (void*)(p + 1);
 6f2:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 6f5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 6f8:	c9                   	leave  
 6f9:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 6fa:	8b 10                	mov    (%eax),%edx
 6fc:	89 11                	mov    %edx,(%ecx)
 6fe:	eb ec                	jmp    6ec <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 700:	89 c1                	mov    %eax,%ecx
 702:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 704:	8b 50 04             	mov    0x4(%eax),%edx
 707:	39 da                	cmp    %ebx,%edx
 709:	73 d4                	jae    6df <malloc+0x46>
    if(p == freep)
 70b:	39 05 60 0d 00 00    	cmp    %eax,0xd60
 711:	75 ed                	jne    700 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 713:	89 d8                	mov    %ebx,%eax
 715:	e8 2f ff ff ff       	call   649 <morecore>
 71a:	85 c0                	test   %eax,%eax
 71c:	75 e2                	jne    700 <malloc+0x67>
 71e:	eb d5                	jmp    6f5 <malloc+0x5c>
