
_kill:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char **argv)
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
  11:	83 ec 08             	sub    $0x8,%esp
  14:	8b 31                	mov    (%ecx),%esi
  16:	8b 79 04             	mov    0x4(%ecx),%edi
  int i;

  if(argc < 2){
  19:	83 fe 01             	cmp    $0x1,%esi
  1c:	7e 07                	jle    25 <main+0x25>
    printf(2, "usage: kill pid...\n");
    exit();
  }
  for(i=1; i<argc; i++)
  1e:	bb 01 00 00 00       	mov    $0x1,%ebx
  23:	eb 2d                	jmp    52 <main+0x52>
    printf(2, "usage: kill pid...\n");
  25:	83 ec 08             	sub    $0x8,%esp
  28:	68 fc 06 00 00       	push   $0x6fc
  2d:	6a 02                	push   $0x2
  2f:	e8 1b 04 00 00       	call   44f <printf>
    exit();
  34:	e8 c1 02 00 00       	call   2fa <exit>
    kill(atoi(argv[i]));
  39:	83 ec 0c             	sub    $0xc,%esp
  3c:	ff 34 9f             	push   (%edi,%ebx,4)
  3f:	e8 52 02 00 00       	call   296 <atoi>
  44:	89 04 24             	mov    %eax,(%esp)
  47:	e8 de 02 00 00       	call   32a <kill>
  for(i=1; i<argc; i++)
  4c:	83 c3 01             	add    $0x1,%ebx
  4f:	83 c4 10             	add    $0x10,%esp
  52:	39 f3                	cmp    %esi,%ebx
  54:	7c e3                	jl     39 <main+0x39>
  exit();
  56:	e8 9f 02 00 00       	call   2fa <exit>

0000005b <test_and_set>:
  int flag;
};

struct thread_ref *threads[64];

int test_and_set(int *old_ptr, int new_ptr) {
  5b:	55                   	push   %ebp
  5c:	89 e5                	mov    %esp,%ebp
  5e:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *old_ptr;
  61:	8b 10                	mov    (%eax),%edx
  *old_ptr = new_ptr;
  63:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  66:	89 08                	mov    %ecx,(%eax)
  return old;
}
  68:	89 d0                	mov    %edx,%eax
  6a:	5d                   	pop    %ebp
  6b:	c3                   	ret    

0000006c <thread_create>:

// a wrapper func for clone
int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
  6c:	55                   	push   %ebp
  6d:	89 e5                	mov    %esp,%ebp
  6f:	53                   	push   %ebx
  70:	83 ec 10             	sub    $0x10,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE*2);
  73:	68 00 20 00 00       	push   $0x2000
  78:	e8 f8 05 00 00       	call   675 <malloc>
  if(n_stack == 0){
  7d:	83 c4 10             	add    $0x10,%esp
  80:	85 c0                	test   %eax,%eax
  82:	74 41                	je     c5 <thread_create+0x59>
  84:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  int new_pid = clone(start_routine, arg1, arg2, n_stack);
  86:	50                   	push   %eax
  87:	ff 75 10             	push   0x10(%ebp)
  8a:	ff 75 0c             	push   0xc(%ebp)
  8d:	ff 75 08             	push   0x8(%ebp)
  90:	e8 05 03 00 00       	call   39a <clone>

  for(int i=0; i<64; i++){
  95:	83 c4 10             	add    $0x10,%esp
  98:	ba 00 00 00 00       	mov    $0x0,%edx
  9d:	eb 03                	jmp    a2 <thread_create+0x36>
  9f:	83 c2 01             	add    $0x1,%edx
  a2:	83 fa 3f             	cmp    $0x3f,%edx
  a5:	7f 19                	jg     c0 <thread_create+0x54>
    if(threads[i]->flag==0){
  a7:	8b 0c 95 00 0b 00 00 	mov    0xb00(,%edx,4),%ecx
  ae:	83 79 08 00          	cmpl   $0x0,0x8(%ecx)
  b2:	75 eb                	jne    9f <thread_create+0x33>
      threads[i]->maddr = n_stack;
  b4:	89 19                	mov    %ebx,(%ecx)
      threads[i]->pg1addr = n_stack;
  b6:	8b 14 95 00 0b 00 00 	mov    0xb00(,%edx,4),%edx
  bd:	89 5a 04             	mov    %ebx,0x4(%edx)
      break;
    }
  }

  return new_pid;
}
  c0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  c3:	c9                   	leave  
  c4:	c3                   	ret    
    return -1;
  c5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  ca:	eb f4                	jmp    c0 <thread_create+0x54>

000000cc <thread_join>:

//TODO: fix
int thread_join() {
  cc:	55                   	push   %ebp
  cd:	89 e5                	mov    %esp,%ebp
  cf:	56                   	push   %esi
  d0:	53                   	push   %ebx
  d1:	83 ec 1c             	sub    $0x1c,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
  d4:	8d 45 f4             	lea    -0xc(%ebp),%eax
  d7:	50                   	push   %eax
  d8:	e8 c5 02 00 00       	call   3a2 <join>
  dd:	89 c6                	mov    %eax,%esi
  for(int i=0; i<64; i++){
  df:	83 c4 10             	add    $0x10,%esp
  e2:	bb 00 00 00 00       	mov    $0x0,%ebx
  e7:	eb 03                	jmp    ec <thread_join+0x20>
  e9:	83 c3 01             	add    $0x1,%ebx
  ec:	83 fb 3f             	cmp    $0x3f,%ebx
  ef:	7f 23                	jg     114 <thread_join+0x48>
    if((threads[i]->flag==1) && (stk_addr == threads[i]->pg1addr)){
  f1:	8b 04 9d 00 0b 00 00 	mov    0xb00(,%ebx,4),%eax
  f8:	83 78 08 01          	cmpl   $0x1,0x8(%eax)
  fc:	75 eb                	jne    e9 <thread_join+0x1d>
  fe:	8b 55 f4             	mov    -0xc(%ebp),%edx
 101:	39 50 04             	cmp    %edx,0x4(%eax)
 104:	75 e3                	jne    e9 <thread_join+0x1d>
      free(stk_addr);
 106:	83 ec 0c             	sub    $0xc,%esp
 109:	52                   	push   %edx
 10a:	e8 a6 04 00 00       	call   5b5 <free>
 10f:	83 c4 10             	add    $0x10,%esp
 112:	eb d5                	jmp    e9 <thread_join+0x1d>
    }
  }
  return pid;
}
 114:	89 f0                	mov    %esi,%eax
 116:	8d 65 f8             	lea    -0x8(%ebp),%esp
 119:	5b                   	pop    %ebx
 11a:	5e                   	pop    %esi
 11b:	5d                   	pop    %ebp
 11c:	c3                   	ret    

0000011d <lock_acquire>:

void lock_acquire(lock_t *lock){
 11d:	55                   	push   %ebp
 11e:	89 e5                	mov    %esp,%ebp
 120:	53                   	push   %ebx
 121:	83 ec 04             	sub    $0x4,%esp
 124:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 127:	83 ec 08             	sub    $0x8,%esp
 12a:	6a 01                	push   $0x1
 12c:	53                   	push   %ebx
 12d:	e8 29 ff ff ff       	call   5b <test_and_set>
 132:	83 c4 10             	add    $0x10,%esp
 135:	83 f8 01             	cmp    $0x1,%eax
 138:	74 ed                	je     127 <lock_acquire+0xa>
    ;
}
 13a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 13d:	c9                   	leave  
 13e:	c3                   	ret    

0000013f <lock_release>:

void lock_release(lock_t *lock) {
 13f:	55                   	push   %ebp
 140:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 142:	8b 45 08             	mov    0x8(%ebp),%eax
 145:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 14b:	5d                   	pop    %ebp
 14c:	c3                   	ret    

0000014d <lock_init>:

void lock_init(lock_t *lock) {
 14d:	55                   	push   %ebp
 14e:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 150:	8b 45 08             	mov    0x8(%ebp),%eax
 153:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 159:	5d                   	pop    %ebp
 15a:	c3                   	ret    

0000015b <strcpy>:

char*
strcpy(char *s, const char *t)
{
 15b:	55                   	push   %ebp
 15c:	89 e5                	mov    %esp,%ebp
 15e:	56                   	push   %esi
 15f:	53                   	push   %ebx
 160:	8b 75 08             	mov    0x8(%ebp),%esi
 163:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 166:	89 f0                	mov    %esi,%eax
 168:	89 d1                	mov    %edx,%ecx
 16a:	83 c2 01             	add    $0x1,%edx
 16d:	89 c3                	mov    %eax,%ebx
 16f:	83 c0 01             	add    $0x1,%eax
 172:	0f b6 09             	movzbl (%ecx),%ecx
 175:	88 0b                	mov    %cl,(%ebx)
 177:	84 c9                	test   %cl,%cl
 179:	75 ed                	jne    168 <strcpy+0xd>
    ;
  return os;
}
 17b:	89 f0                	mov    %esi,%eax
 17d:	5b                   	pop    %ebx
 17e:	5e                   	pop    %esi
 17f:	5d                   	pop    %ebp
 180:	c3                   	ret    

00000181 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 181:	55                   	push   %ebp
 182:	89 e5                	mov    %esp,%ebp
 184:	8b 4d 08             	mov    0x8(%ebp),%ecx
 187:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 18a:	eb 06                	jmp    192 <strcmp+0x11>
    p++, q++;
 18c:	83 c1 01             	add    $0x1,%ecx
 18f:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 192:	0f b6 01             	movzbl (%ecx),%eax
 195:	84 c0                	test   %al,%al
 197:	74 04                	je     19d <strcmp+0x1c>
 199:	3a 02                	cmp    (%edx),%al
 19b:	74 ef                	je     18c <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 19d:	0f b6 c0             	movzbl %al,%eax
 1a0:	0f b6 12             	movzbl (%edx),%edx
 1a3:	29 d0                	sub    %edx,%eax
}
 1a5:	5d                   	pop    %ebp
 1a6:	c3                   	ret    

000001a7 <strlen>:

uint
strlen(const char *s)
{
 1a7:	55                   	push   %ebp
 1a8:	89 e5                	mov    %esp,%ebp
 1aa:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 1ad:	b8 00 00 00 00       	mov    $0x0,%eax
 1b2:	eb 03                	jmp    1b7 <strlen+0x10>
 1b4:	83 c0 01             	add    $0x1,%eax
 1b7:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 1bb:	75 f7                	jne    1b4 <strlen+0xd>
    ;
  return n;
}
 1bd:	5d                   	pop    %ebp
 1be:	c3                   	ret    

000001bf <memset>:

void*
memset(void *dst, int c, uint n)
{
 1bf:	55                   	push   %ebp
 1c0:	89 e5                	mov    %esp,%ebp
 1c2:	57                   	push   %edi
 1c3:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1c6:	89 d7                	mov    %edx,%edi
 1c8:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1cb:	8b 45 0c             	mov    0xc(%ebp),%eax
 1ce:	fc                   	cld    
 1cf:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1d1:	89 d0                	mov    %edx,%eax
 1d3:	8b 7d fc             	mov    -0x4(%ebp),%edi
 1d6:	c9                   	leave  
 1d7:	c3                   	ret    

000001d8 <strchr>:

char*
strchr(const char *s, char c)
{
 1d8:	55                   	push   %ebp
 1d9:	89 e5                	mov    %esp,%ebp
 1db:	8b 45 08             	mov    0x8(%ebp),%eax
 1de:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1e2:	eb 03                	jmp    1e7 <strchr+0xf>
 1e4:	83 c0 01             	add    $0x1,%eax
 1e7:	0f b6 10             	movzbl (%eax),%edx
 1ea:	84 d2                	test   %dl,%dl
 1ec:	74 06                	je     1f4 <strchr+0x1c>
    if(*s == c)
 1ee:	38 ca                	cmp    %cl,%dl
 1f0:	75 f2                	jne    1e4 <strchr+0xc>
 1f2:	eb 05                	jmp    1f9 <strchr+0x21>
      return (char*)s;
  return 0;
 1f4:	b8 00 00 00 00       	mov    $0x0,%eax
}
 1f9:	5d                   	pop    %ebp
 1fa:	c3                   	ret    

000001fb <gets>:

char*
gets(char *buf, int max)
{
 1fb:	55                   	push   %ebp
 1fc:	89 e5                	mov    %esp,%ebp
 1fe:	57                   	push   %edi
 1ff:	56                   	push   %esi
 200:	53                   	push   %ebx
 201:	83 ec 1c             	sub    $0x1c,%esp
 204:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 207:	bb 00 00 00 00       	mov    $0x0,%ebx
 20c:	89 de                	mov    %ebx,%esi
 20e:	83 c3 01             	add    $0x1,%ebx
 211:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 214:	7d 2e                	jge    244 <gets+0x49>
    cc = read(0, &c, 1);
 216:	83 ec 04             	sub    $0x4,%esp
 219:	6a 01                	push   $0x1
 21b:	8d 45 e7             	lea    -0x19(%ebp),%eax
 21e:	50                   	push   %eax
 21f:	6a 00                	push   $0x0
 221:	e8 ec 00 00 00       	call   312 <read>
    if(cc < 1)
 226:	83 c4 10             	add    $0x10,%esp
 229:	85 c0                	test   %eax,%eax
 22b:	7e 17                	jle    244 <gets+0x49>
      break;
    buf[i++] = c;
 22d:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 231:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 234:	3c 0a                	cmp    $0xa,%al
 236:	0f 94 c2             	sete   %dl
 239:	3c 0d                	cmp    $0xd,%al
 23b:	0f 94 c0             	sete   %al
 23e:	08 c2                	or     %al,%dl
 240:	74 ca                	je     20c <gets+0x11>
    buf[i++] = c;
 242:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 244:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 248:	89 f8                	mov    %edi,%eax
 24a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 24d:	5b                   	pop    %ebx
 24e:	5e                   	pop    %esi
 24f:	5f                   	pop    %edi
 250:	5d                   	pop    %ebp
 251:	c3                   	ret    

00000252 <stat>:

int
stat(const char *n, struct stat *st)
{
 252:	55                   	push   %ebp
 253:	89 e5                	mov    %esp,%ebp
 255:	56                   	push   %esi
 256:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 257:	83 ec 08             	sub    $0x8,%esp
 25a:	6a 00                	push   $0x0
 25c:	ff 75 08             	push   0x8(%ebp)
 25f:	e8 d6 00 00 00       	call   33a <open>
  if(fd < 0)
 264:	83 c4 10             	add    $0x10,%esp
 267:	85 c0                	test   %eax,%eax
 269:	78 24                	js     28f <stat+0x3d>
 26b:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 26d:	83 ec 08             	sub    $0x8,%esp
 270:	ff 75 0c             	push   0xc(%ebp)
 273:	50                   	push   %eax
 274:	e8 d9 00 00 00       	call   352 <fstat>
 279:	89 c6                	mov    %eax,%esi
  close(fd);
 27b:	89 1c 24             	mov    %ebx,(%esp)
 27e:	e8 9f 00 00 00       	call   322 <close>
  return r;
 283:	83 c4 10             	add    $0x10,%esp
}
 286:	89 f0                	mov    %esi,%eax
 288:	8d 65 f8             	lea    -0x8(%ebp),%esp
 28b:	5b                   	pop    %ebx
 28c:	5e                   	pop    %esi
 28d:	5d                   	pop    %ebp
 28e:	c3                   	ret    
    return -1;
 28f:	be ff ff ff ff       	mov    $0xffffffff,%esi
 294:	eb f0                	jmp    286 <stat+0x34>

00000296 <atoi>:

int
atoi(const char *s)
{
 296:	55                   	push   %ebp
 297:	89 e5                	mov    %esp,%ebp
 299:	53                   	push   %ebx
 29a:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 29d:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 2a2:	eb 10                	jmp    2b4 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 2a4:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 2a7:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 2aa:	83 c1 01             	add    $0x1,%ecx
 2ad:	0f be c0             	movsbl %al,%eax
 2b0:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 2b4:	0f b6 01             	movzbl (%ecx),%eax
 2b7:	8d 58 d0             	lea    -0x30(%eax),%ebx
 2ba:	80 fb 09             	cmp    $0x9,%bl
 2bd:	76 e5                	jbe    2a4 <atoi+0xe>
  return n;
}
 2bf:	89 d0                	mov    %edx,%eax
 2c1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2c4:	c9                   	leave  
 2c5:	c3                   	ret    

000002c6 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2c6:	55                   	push   %ebp
 2c7:	89 e5                	mov    %esp,%ebp
 2c9:	56                   	push   %esi
 2ca:	53                   	push   %ebx
 2cb:	8b 75 08             	mov    0x8(%ebp),%esi
 2ce:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 2d1:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 2d4:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 2d6:	eb 0d                	jmp    2e5 <memmove+0x1f>
    *dst++ = *src++;
 2d8:	0f b6 01             	movzbl (%ecx),%eax
 2db:	88 02                	mov    %al,(%edx)
 2dd:	8d 49 01             	lea    0x1(%ecx),%ecx
 2e0:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 2e3:	89 d8                	mov    %ebx,%eax
 2e5:	8d 58 ff             	lea    -0x1(%eax),%ebx
 2e8:	85 c0                	test   %eax,%eax
 2ea:	7f ec                	jg     2d8 <memmove+0x12>
  return vdst;
}
 2ec:	89 f0                	mov    %esi,%eax
 2ee:	5b                   	pop    %ebx
 2ef:	5e                   	pop    %esi
 2f0:	5d                   	pop    %ebp
 2f1:	c3                   	ret    

000002f2 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2f2:	b8 01 00 00 00       	mov    $0x1,%eax
 2f7:	cd 40                	int    $0x40
 2f9:	c3                   	ret    

000002fa <exit>:
SYSCALL(exit)
 2fa:	b8 02 00 00 00       	mov    $0x2,%eax
 2ff:	cd 40                	int    $0x40
 301:	c3                   	ret    

00000302 <wait>:
SYSCALL(wait)
 302:	b8 03 00 00 00       	mov    $0x3,%eax
 307:	cd 40                	int    $0x40
 309:	c3                   	ret    

0000030a <pipe>:
SYSCALL(pipe)
 30a:	b8 04 00 00 00       	mov    $0x4,%eax
 30f:	cd 40                	int    $0x40
 311:	c3                   	ret    

00000312 <read>:
SYSCALL(read)
 312:	b8 05 00 00 00       	mov    $0x5,%eax
 317:	cd 40                	int    $0x40
 319:	c3                   	ret    

0000031a <write>:
SYSCALL(write)
 31a:	b8 10 00 00 00       	mov    $0x10,%eax
 31f:	cd 40                	int    $0x40
 321:	c3                   	ret    

00000322 <close>:
SYSCALL(close)
 322:	b8 15 00 00 00       	mov    $0x15,%eax
 327:	cd 40                	int    $0x40
 329:	c3                   	ret    

0000032a <kill>:
SYSCALL(kill)
 32a:	b8 06 00 00 00       	mov    $0x6,%eax
 32f:	cd 40                	int    $0x40
 331:	c3                   	ret    

00000332 <exec>:
SYSCALL(exec)
 332:	b8 07 00 00 00       	mov    $0x7,%eax
 337:	cd 40                	int    $0x40
 339:	c3                   	ret    

0000033a <open>:
SYSCALL(open)
 33a:	b8 0f 00 00 00       	mov    $0xf,%eax
 33f:	cd 40                	int    $0x40
 341:	c3                   	ret    

00000342 <mknod>:
SYSCALL(mknod)
 342:	b8 11 00 00 00       	mov    $0x11,%eax
 347:	cd 40                	int    $0x40
 349:	c3                   	ret    

0000034a <unlink>:
SYSCALL(unlink)
 34a:	b8 12 00 00 00       	mov    $0x12,%eax
 34f:	cd 40                	int    $0x40
 351:	c3                   	ret    

00000352 <fstat>:
SYSCALL(fstat)
 352:	b8 08 00 00 00       	mov    $0x8,%eax
 357:	cd 40                	int    $0x40
 359:	c3                   	ret    

0000035a <link>:
SYSCALL(link)
 35a:	b8 13 00 00 00       	mov    $0x13,%eax
 35f:	cd 40                	int    $0x40
 361:	c3                   	ret    

00000362 <mkdir>:
SYSCALL(mkdir)
 362:	b8 14 00 00 00       	mov    $0x14,%eax
 367:	cd 40                	int    $0x40
 369:	c3                   	ret    

0000036a <chdir>:
SYSCALL(chdir)
 36a:	b8 09 00 00 00       	mov    $0x9,%eax
 36f:	cd 40                	int    $0x40
 371:	c3                   	ret    

00000372 <dup>:
SYSCALL(dup)
 372:	b8 0a 00 00 00       	mov    $0xa,%eax
 377:	cd 40                	int    $0x40
 379:	c3                   	ret    

0000037a <getpid>:
SYSCALL(getpid)
 37a:	b8 0b 00 00 00       	mov    $0xb,%eax
 37f:	cd 40                	int    $0x40
 381:	c3                   	ret    

00000382 <sbrk>:
SYSCALL(sbrk)
 382:	b8 0c 00 00 00       	mov    $0xc,%eax
 387:	cd 40                	int    $0x40
 389:	c3                   	ret    

0000038a <sleep>:
SYSCALL(sleep)
 38a:	b8 0d 00 00 00       	mov    $0xd,%eax
 38f:	cd 40                	int    $0x40
 391:	c3                   	ret    

00000392 <uptime>:
SYSCALL(uptime)
 392:	b8 0e 00 00 00       	mov    $0xe,%eax
 397:	cd 40                	int    $0x40
 399:	c3                   	ret    

0000039a <clone>:
SYSCALL(clone)
 39a:	b8 16 00 00 00       	mov    $0x16,%eax
 39f:	cd 40                	int    $0x40
 3a1:	c3                   	ret    

000003a2 <join>:
 3a2:	b8 17 00 00 00       	mov    $0x17,%eax
 3a7:	cd 40                	int    $0x40
 3a9:	c3                   	ret    

000003aa <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 3aa:	55                   	push   %ebp
 3ab:	89 e5                	mov    %esp,%ebp
 3ad:	83 ec 1c             	sub    $0x1c,%esp
 3b0:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 3b3:	6a 01                	push   $0x1
 3b5:	8d 55 f4             	lea    -0xc(%ebp),%edx
 3b8:	52                   	push   %edx
 3b9:	50                   	push   %eax
 3ba:	e8 5b ff ff ff       	call   31a <write>
}
 3bf:	83 c4 10             	add    $0x10,%esp
 3c2:	c9                   	leave  
 3c3:	c3                   	ret    

000003c4 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 3c4:	55                   	push   %ebp
 3c5:	89 e5                	mov    %esp,%ebp
 3c7:	57                   	push   %edi
 3c8:	56                   	push   %esi
 3c9:	53                   	push   %ebx
 3ca:	83 ec 2c             	sub    $0x2c,%esp
 3cd:	89 45 d0             	mov    %eax,-0x30(%ebp)
 3d0:	89 d0                	mov    %edx,%eax
 3d2:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 3d4:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 3d8:	0f 95 c1             	setne  %cl
 3db:	c1 ea 1f             	shr    $0x1f,%edx
 3de:	84 d1                	test   %dl,%cl
 3e0:	74 44                	je     426 <printint+0x62>
    neg = 1;
    x = -xx;
 3e2:	f7 d8                	neg    %eax
 3e4:	89 c1                	mov    %eax,%ecx
    neg = 1;
 3e6:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 3ed:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 3f2:	89 c8                	mov    %ecx,%eax
 3f4:	ba 00 00 00 00       	mov    $0x0,%edx
 3f9:	f7 f6                	div    %esi
 3fb:	89 df                	mov    %ebx,%edi
 3fd:	83 c3 01             	add    $0x1,%ebx
 400:	0f b6 92 70 07 00 00 	movzbl 0x770(%edx),%edx
 407:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 40b:	89 ca                	mov    %ecx,%edx
 40d:	89 c1                	mov    %eax,%ecx
 40f:	39 d6                	cmp    %edx,%esi
 411:	76 df                	jbe    3f2 <printint+0x2e>
  if(neg)
 413:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 417:	74 31                	je     44a <printint+0x86>
    buf[i++] = '-';
 419:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 41e:	8d 5f 02             	lea    0x2(%edi),%ebx
 421:	8b 75 d0             	mov    -0x30(%ebp),%esi
 424:	eb 17                	jmp    43d <printint+0x79>
    x = xx;
 426:	89 c1                	mov    %eax,%ecx
  neg = 0;
 428:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 42f:	eb bc                	jmp    3ed <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 431:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 436:	89 f0                	mov    %esi,%eax
 438:	e8 6d ff ff ff       	call   3aa <putc>
  while(--i >= 0)
 43d:	83 eb 01             	sub    $0x1,%ebx
 440:	79 ef                	jns    431 <printint+0x6d>
}
 442:	83 c4 2c             	add    $0x2c,%esp
 445:	5b                   	pop    %ebx
 446:	5e                   	pop    %esi
 447:	5f                   	pop    %edi
 448:	5d                   	pop    %ebp
 449:	c3                   	ret    
 44a:	8b 75 d0             	mov    -0x30(%ebp),%esi
 44d:	eb ee                	jmp    43d <printint+0x79>

0000044f <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 44f:	55                   	push   %ebp
 450:	89 e5                	mov    %esp,%ebp
 452:	57                   	push   %edi
 453:	56                   	push   %esi
 454:	53                   	push   %ebx
 455:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 458:	8d 45 10             	lea    0x10(%ebp),%eax
 45b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 45e:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 463:	bb 00 00 00 00       	mov    $0x0,%ebx
 468:	eb 14                	jmp    47e <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 46a:	89 fa                	mov    %edi,%edx
 46c:	8b 45 08             	mov    0x8(%ebp),%eax
 46f:	e8 36 ff ff ff       	call   3aa <putc>
 474:	eb 05                	jmp    47b <printf+0x2c>
      }
    } else if(state == '%'){
 476:	83 fe 25             	cmp    $0x25,%esi
 479:	74 25                	je     4a0 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 47b:	83 c3 01             	add    $0x1,%ebx
 47e:	8b 45 0c             	mov    0xc(%ebp),%eax
 481:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 485:	84 c0                	test   %al,%al
 487:	0f 84 20 01 00 00    	je     5ad <printf+0x15e>
    c = fmt[i] & 0xff;
 48d:	0f be f8             	movsbl %al,%edi
 490:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 493:	85 f6                	test   %esi,%esi
 495:	75 df                	jne    476 <printf+0x27>
      if(c == '%'){
 497:	83 f8 25             	cmp    $0x25,%eax
 49a:	75 ce                	jne    46a <printf+0x1b>
        state = '%';
 49c:	89 c6                	mov    %eax,%esi
 49e:	eb db                	jmp    47b <printf+0x2c>
      if(c == 'd'){
 4a0:	83 f8 25             	cmp    $0x25,%eax
 4a3:	0f 84 cf 00 00 00    	je     578 <printf+0x129>
 4a9:	0f 8c dd 00 00 00    	jl     58c <printf+0x13d>
 4af:	83 f8 78             	cmp    $0x78,%eax
 4b2:	0f 8f d4 00 00 00    	jg     58c <printf+0x13d>
 4b8:	83 f8 63             	cmp    $0x63,%eax
 4bb:	0f 8c cb 00 00 00    	jl     58c <printf+0x13d>
 4c1:	83 e8 63             	sub    $0x63,%eax
 4c4:	83 f8 15             	cmp    $0x15,%eax
 4c7:	0f 87 bf 00 00 00    	ja     58c <printf+0x13d>
 4cd:	ff 24 85 18 07 00 00 	jmp    *0x718(,%eax,4)
        printint(fd, *ap, 10, 1);
 4d4:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4d7:	8b 17                	mov    (%edi),%edx
 4d9:	83 ec 0c             	sub    $0xc,%esp
 4dc:	6a 01                	push   $0x1
 4de:	b9 0a 00 00 00       	mov    $0xa,%ecx
 4e3:	8b 45 08             	mov    0x8(%ebp),%eax
 4e6:	e8 d9 fe ff ff       	call   3c4 <printint>
        ap++;
 4eb:	83 c7 04             	add    $0x4,%edi
 4ee:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 4f1:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 4f4:	be 00 00 00 00       	mov    $0x0,%esi
 4f9:	eb 80                	jmp    47b <printf+0x2c>
        printint(fd, *ap, 16, 0);
 4fb:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4fe:	8b 17                	mov    (%edi),%edx
 500:	83 ec 0c             	sub    $0xc,%esp
 503:	6a 00                	push   $0x0
 505:	b9 10 00 00 00       	mov    $0x10,%ecx
 50a:	8b 45 08             	mov    0x8(%ebp),%eax
 50d:	e8 b2 fe ff ff       	call   3c4 <printint>
        ap++;
 512:	83 c7 04             	add    $0x4,%edi
 515:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 518:	83 c4 10             	add    $0x10,%esp
      state = 0;
 51b:	be 00 00 00 00       	mov    $0x0,%esi
 520:	e9 56 ff ff ff       	jmp    47b <printf+0x2c>
        s = (char*)*ap;
 525:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 528:	8b 30                	mov    (%eax),%esi
        ap++;
 52a:	83 c0 04             	add    $0x4,%eax
 52d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 530:	85 f6                	test   %esi,%esi
 532:	75 15                	jne    549 <printf+0xfa>
          s = "(null)";
 534:	be 10 07 00 00       	mov    $0x710,%esi
 539:	eb 0e                	jmp    549 <printf+0xfa>
          putc(fd, *s);
 53b:	0f be d2             	movsbl %dl,%edx
 53e:	8b 45 08             	mov    0x8(%ebp),%eax
 541:	e8 64 fe ff ff       	call   3aa <putc>
          s++;
 546:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 549:	0f b6 16             	movzbl (%esi),%edx
 54c:	84 d2                	test   %dl,%dl
 54e:	75 eb                	jne    53b <printf+0xec>
      state = 0;
 550:	be 00 00 00 00       	mov    $0x0,%esi
 555:	e9 21 ff ff ff       	jmp    47b <printf+0x2c>
        putc(fd, *ap);
 55a:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 55d:	0f be 17             	movsbl (%edi),%edx
 560:	8b 45 08             	mov    0x8(%ebp),%eax
 563:	e8 42 fe ff ff       	call   3aa <putc>
        ap++;
 568:	83 c7 04             	add    $0x4,%edi
 56b:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 56e:	be 00 00 00 00       	mov    $0x0,%esi
 573:	e9 03 ff ff ff       	jmp    47b <printf+0x2c>
        putc(fd, c);
 578:	89 fa                	mov    %edi,%edx
 57a:	8b 45 08             	mov    0x8(%ebp),%eax
 57d:	e8 28 fe ff ff       	call   3aa <putc>
      state = 0;
 582:	be 00 00 00 00       	mov    $0x0,%esi
 587:	e9 ef fe ff ff       	jmp    47b <printf+0x2c>
        putc(fd, '%');
 58c:	ba 25 00 00 00       	mov    $0x25,%edx
 591:	8b 45 08             	mov    0x8(%ebp),%eax
 594:	e8 11 fe ff ff       	call   3aa <putc>
        putc(fd, c);
 599:	89 fa                	mov    %edi,%edx
 59b:	8b 45 08             	mov    0x8(%ebp),%eax
 59e:	e8 07 fe ff ff       	call   3aa <putc>
      state = 0;
 5a3:	be 00 00 00 00       	mov    $0x0,%esi
 5a8:	e9 ce fe ff ff       	jmp    47b <printf+0x2c>
    }
  }
}
 5ad:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5b0:	5b                   	pop    %ebx
 5b1:	5e                   	pop    %esi
 5b2:	5f                   	pop    %edi
 5b3:	5d                   	pop    %ebp
 5b4:	c3                   	ret    

000005b5 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5b5:	55                   	push   %ebp
 5b6:	89 e5                	mov    %esp,%ebp
 5b8:	57                   	push   %edi
 5b9:	56                   	push   %esi
 5ba:	53                   	push   %ebx
 5bb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 5be:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5c1:	a1 00 0c 00 00       	mov    0xc00,%eax
 5c6:	eb 02                	jmp    5ca <free+0x15>
 5c8:	89 d0                	mov    %edx,%eax
 5ca:	39 c8                	cmp    %ecx,%eax
 5cc:	73 04                	jae    5d2 <free+0x1d>
 5ce:	39 08                	cmp    %ecx,(%eax)
 5d0:	77 12                	ja     5e4 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5d2:	8b 10                	mov    (%eax),%edx
 5d4:	39 c2                	cmp    %eax,%edx
 5d6:	77 f0                	ja     5c8 <free+0x13>
 5d8:	39 c8                	cmp    %ecx,%eax
 5da:	72 08                	jb     5e4 <free+0x2f>
 5dc:	39 ca                	cmp    %ecx,%edx
 5de:	77 04                	ja     5e4 <free+0x2f>
 5e0:	89 d0                	mov    %edx,%eax
 5e2:	eb e6                	jmp    5ca <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 5e4:	8b 73 fc             	mov    -0x4(%ebx),%esi
 5e7:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 5ea:	8b 10                	mov    (%eax),%edx
 5ec:	39 d7                	cmp    %edx,%edi
 5ee:	74 19                	je     609 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 5f0:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 5f3:	8b 50 04             	mov    0x4(%eax),%edx
 5f6:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 5f9:	39 ce                	cmp    %ecx,%esi
 5fb:	74 1b                	je     618 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 5fd:	89 08                	mov    %ecx,(%eax)
  freep = p;
 5ff:	a3 00 0c 00 00       	mov    %eax,0xc00
}
 604:	5b                   	pop    %ebx
 605:	5e                   	pop    %esi
 606:	5f                   	pop    %edi
 607:	5d                   	pop    %ebp
 608:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 609:	03 72 04             	add    0x4(%edx),%esi
 60c:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 60f:	8b 10                	mov    (%eax),%edx
 611:	8b 12                	mov    (%edx),%edx
 613:	89 53 f8             	mov    %edx,-0x8(%ebx)
 616:	eb db                	jmp    5f3 <free+0x3e>
    p->s.size += bp->s.size;
 618:	03 53 fc             	add    -0x4(%ebx),%edx
 61b:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 61e:	8b 53 f8             	mov    -0x8(%ebx),%edx
 621:	89 10                	mov    %edx,(%eax)
 623:	eb da                	jmp    5ff <free+0x4a>

00000625 <morecore>:

static Header*
morecore(uint nu)
{
 625:	55                   	push   %ebp
 626:	89 e5                	mov    %esp,%ebp
 628:	53                   	push   %ebx
 629:	83 ec 04             	sub    $0x4,%esp
 62c:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 62e:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 633:	77 05                	ja     63a <morecore+0x15>
    nu = 4096;
 635:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 63a:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 641:	83 ec 0c             	sub    $0xc,%esp
 644:	50                   	push   %eax
 645:	e8 38 fd ff ff       	call   382 <sbrk>
  if(p == (char*)-1)
 64a:	83 c4 10             	add    $0x10,%esp
 64d:	83 f8 ff             	cmp    $0xffffffff,%eax
 650:	74 1c                	je     66e <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 652:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 655:	83 c0 08             	add    $0x8,%eax
 658:	83 ec 0c             	sub    $0xc,%esp
 65b:	50                   	push   %eax
 65c:	e8 54 ff ff ff       	call   5b5 <free>
  return freep;
 661:	a1 00 0c 00 00       	mov    0xc00,%eax
 666:	83 c4 10             	add    $0x10,%esp
}
 669:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 66c:	c9                   	leave  
 66d:	c3                   	ret    
    return 0;
 66e:	b8 00 00 00 00       	mov    $0x0,%eax
 673:	eb f4                	jmp    669 <morecore+0x44>

00000675 <malloc>:

void*
malloc(uint nbytes)
{
 675:	55                   	push   %ebp
 676:	89 e5                	mov    %esp,%ebp
 678:	53                   	push   %ebx
 679:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 67c:	8b 45 08             	mov    0x8(%ebp),%eax
 67f:	8d 58 07             	lea    0x7(%eax),%ebx
 682:	c1 eb 03             	shr    $0x3,%ebx
 685:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 688:	8b 0d 00 0c 00 00    	mov    0xc00,%ecx
 68e:	85 c9                	test   %ecx,%ecx
 690:	74 04                	je     696 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 692:	8b 01                	mov    (%ecx),%eax
 694:	eb 4a                	jmp    6e0 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 696:	c7 05 00 0c 00 00 04 	movl   $0xc04,0xc00
 69d:	0c 00 00 
 6a0:	c7 05 04 0c 00 00 04 	movl   $0xc04,0xc04
 6a7:	0c 00 00 
    base.s.size = 0;
 6aa:	c7 05 08 0c 00 00 00 	movl   $0x0,0xc08
 6b1:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 6b4:	b9 04 0c 00 00       	mov    $0xc04,%ecx
 6b9:	eb d7                	jmp    692 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 6bb:	74 19                	je     6d6 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 6bd:	29 da                	sub    %ebx,%edx
 6bf:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 6c2:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 6c5:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 6c8:	89 0d 00 0c 00 00    	mov    %ecx,0xc00
      return (void*)(p + 1);
 6ce:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 6d1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 6d4:	c9                   	leave  
 6d5:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 6d6:	8b 10                	mov    (%eax),%edx
 6d8:	89 11                	mov    %edx,(%ecx)
 6da:	eb ec                	jmp    6c8 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6dc:	89 c1                	mov    %eax,%ecx
 6de:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 6e0:	8b 50 04             	mov    0x4(%eax),%edx
 6e3:	39 da                	cmp    %ebx,%edx
 6e5:	73 d4                	jae    6bb <malloc+0x46>
    if(p == freep)
 6e7:	39 05 00 0c 00 00    	cmp    %eax,0xc00
 6ed:	75 ed                	jne    6dc <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 6ef:	89 d8                	mov    %ebx,%eax
 6f1:	e8 2f ff ff ff       	call   625 <morecore>
 6f6:	85 c0                	test   %eax,%eax
 6f8:	75 e2                	jne    6dc <malloc+0x67>
 6fa:	eb d5                	jmp    6d1 <malloc+0x5c>
