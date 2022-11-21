
_echo:     file format elf32-i386


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
  11:	83 ec 08             	sub    $0x8,%esp
  14:	8b 31                	mov    (%ecx),%esi
  16:	8b 79 04             	mov    0x4(%ecx),%edi
  int i;

  for(i = 1; i < argc; i++)
  19:	b8 01 00 00 00       	mov    $0x1,%eax
  1e:	eb 1a                	jmp    3a <main+0x3a>
    printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
  20:	ba f6 06 00 00       	mov    $0x6f6,%edx
  25:	52                   	push   %edx
  26:	ff 34 87             	push   (%edi,%eax,4)
  29:	68 f8 06 00 00       	push   $0x6f8
  2e:	6a 01                	push   $0x1
  30:	e8 10 04 00 00       	call   445 <printf>
  35:	83 c4 10             	add    $0x10,%esp
  for(i = 1; i < argc; i++)
  38:	89 d8                	mov    %ebx,%eax
  3a:	39 f0                	cmp    %esi,%eax
  3c:	7d 0e                	jge    4c <main+0x4c>
    printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
  3e:	8d 58 01             	lea    0x1(%eax),%ebx
  41:	39 f3                	cmp    %esi,%ebx
  43:	7d db                	jge    20 <main+0x20>
  45:	ba f4 06 00 00       	mov    $0x6f4,%edx
  4a:	eb d9                	jmp    25 <main+0x25>
  exit();
  4c:	e8 9f 02 00 00       	call   2f0 <exit>

00000051 <test_and_set>:
  int flag;
};

struct thread_ref *threads[64];

int test_and_set(int *old_ptr, int new_ptr) {
  51:	55                   	push   %ebp
  52:	89 e5                	mov    %esp,%ebp
  54:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *old_ptr;
  57:	8b 10                	mov    (%eax),%edx
  *old_ptr = new_ptr;
  59:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  5c:	89 08                	mov    %ecx,(%eax)
  return old;
}
  5e:	89 d0                	mov    %edx,%eax
  60:	5d                   	pop    %ebp
  61:	c3                   	ret    

00000062 <thread_create>:

// a wrapper func for clone
int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
  62:	55                   	push   %ebp
  63:	89 e5                	mov    %esp,%ebp
  65:	53                   	push   %ebx
  66:	83 ec 10             	sub    $0x10,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE*2);
  69:	68 00 20 00 00       	push   $0x2000
  6e:	e8 f8 05 00 00       	call   66b <malloc>
  if(n_stack == 0){
  73:	83 c4 10             	add    $0x10,%esp
  76:	85 c0                	test   %eax,%eax
  78:	74 41                	je     bb <thread_create+0x59>
  7a:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  int new_pid = clone(start_routine, arg1, arg2, n_stack);
  7c:	50                   	push   %eax
  7d:	ff 75 10             	push   0x10(%ebp)
  80:	ff 75 0c             	push   0xc(%ebp)
  83:	ff 75 08             	push   0x8(%ebp)
  86:	e8 05 03 00 00       	call   390 <clone>

  for(int i=0; i<64; i++){
  8b:	83 c4 10             	add    $0x10,%esp
  8e:	ba 00 00 00 00       	mov    $0x0,%edx
  93:	eb 03                	jmp    98 <thread_create+0x36>
  95:	83 c2 01             	add    $0x1,%edx
  98:	83 fa 3f             	cmp    $0x3f,%edx
  9b:	7f 19                	jg     b6 <thread_create+0x54>
    if(threads[i]->flag==0){
  9d:	8b 0c 95 e0 0a 00 00 	mov    0xae0(,%edx,4),%ecx
  a4:	83 79 08 00          	cmpl   $0x0,0x8(%ecx)
  a8:	75 eb                	jne    95 <thread_create+0x33>
      threads[i]->maddr = n_stack;
  aa:	89 19                	mov    %ebx,(%ecx)
      threads[i]->pg1addr = n_stack;
  ac:	8b 14 95 e0 0a 00 00 	mov    0xae0(,%edx,4),%edx
  b3:	89 5a 04             	mov    %ebx,0x4(%edx)
      break;
    }
  }

  return new_pid;
}
  b6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  b9:	c9                   	leave  
  ba:	c3                   	ret    
    return -1;
  bb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  c0:	eb f4                	jmp    b6 <thread_create+0x54>

000000c2 <thread_join>:

//TODO: fix
int thread_join() {
  c2:	55                   	push   %ebp
  c3:	89 e5                	mov    %esp,%ebp
  c5:	56                   	push   %esi
  c6:	53                   	push   %ebx
  c7:	83 ec 1c             	sub    $0x1c,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
  ca:	8d 45 f4             	lea    -0xc(%ebp),%eax
  cd:	50                   	push   %eax
  ce:	e8 c5 02 00 00       	call   398 <join>
  d3:	89 c6                	mov    %eax,%esi
  for(int i=0; i<64; i++){
  d5:	83 c4 10             	add    $0x10,%esp
  d8:	bb 00 00 00 00       	mov    $0x0,%ebx
  dd:	eb 03                	jmp    e2 <thread_join+0x20>
  df:	83 c3 01             	add    $0x1,%ebx
  e2:	83 fb 3f             	cmp    $0x3f,%ebx
  e5:	7f 23                	jg     10a <thread_join+0x48>
    if((threads[i]->flag==1) && (stk_addr == threads[i]->pg1addr)){
  e7:	8b 04 9d e0 0a 00 00 	mov    0xae0(,%ebx,4),%eax
  ee:	83 78 08 01          	cmpl   $0x1,0x8(%eax)
  f2:	75 eb                	jne    df <thread_join+0x1d>
  f4:	8b 55 f4             	mov    -0xc(%ebp),%edx
  f7:	39 50 04             	cmp    %edx,0x4(%eax)
  fa:	75 e3                	jne    df <thread_join+0x1d>
      free(stk_addr);
  fc:	83 ec 0c             	sub    $0xc,%esp
  ff:	52                   	push   %edx
 100:	e8 a6 04 00 00       	call   5ab <free>
 105:	83 c4 10             	add    $0x10,%esp
 108:	eb d5                	jmp    df <thread_join+0x1d>
    }
  }
  return pid;
}
 10a:	89 f0                	mov    %esi,%eax
 10c:	8d 65 f8             	lea    -0x8(%ebp),%esp
 10f:	5b                   	pop    %ebx
 110:	5e                   	pop    %esi
 111:	5d                   	pop    %ebp
 112:	c3                   	ret    

00000113 <lock_acquire>:

void lock_acquire(lock_t *lock){
 113:	55                   	push   %ebp
 114:	89 e5                	mov    %esp,%ebp
 116:	53                   	push   %ebx
 117:	83 ec 04             	sub    $0x4,%esp
 11a:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 11d:	83 ec 08             	sub    $0x8,%esp
 120:	6a 01                	push   $0x1
 122:	53                   	push   %ebx
 123:	e8 29 ff ff ff       	call   51 <test_and_set>
 128:	83 c4 10             	add    $0x10,%esp
 12b:	83 f8 01             	cmp    $0x1,%eax
 12e:	74 ed                	je     11d <lock_acquire+0xa>
    ;
}
 130:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 133:	c9                   	leave  
 134:	c3                   	ret    

00000135 <lock_release>:

void lock_release(lock_t *lock) {
 135:	55                   	push   %ebp
 136:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 138:	8b 45 08             	mov    0x8(%ebp),%eax
 13b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 141:	5d                   	pop    %ebp
 142:	c3                   	ret    

00000143 <lock_init>:

void lock_init(lock_t *lock) {
 143:	55                   	push   %ebp
 144:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 146:	8b 45 08             	mov    0x8(%ebp),%eax
 149:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 14f:	5d                   	pop    %ebp
 150:	c3                   	ret    

00000151 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 151:	55                   	push   %ebp
 152:	89 e5                	mov    %esp,%ebp
 154:	56                   	push   %esi
 155:	53                   	push   %ebx
 156:	8b 75 08             	mov    0x8(%ebp),%esi
 159:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 15c:	89 f0                	mov    %esi,%eax
 15e:	89 d1                	mov    %edx,%ecx
 160:	83 c2 01             	add    $0x1,%edx
 163:	89 c3                	mov    %eax,%ebx
 165:	83 c0 01             	add    $0x1,%eax
 168:	0f b6 09             	movzbl (%ecx),%ecx
 16b:	88 0b                	mov    %cl,(%ebx)
 16d:	84 c9                	test   %cl,%cl
 16f:	75 ed                	jne    15e <strcpy+0xd>
    ;
  return os;
}
 171:	89 f0                	mov    %esi,%eax
 173:	5b                   	pop    %ebx
 174:	5e                   	pop    %esi
 175:	5d                   	pop    %ebp
 176:	c3                   	ret    

00000177 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 177:	55                   	push   %ebp
 178:	89 e5                	mov    %esp,%ebp
 17a:	8b 4d 08             	mov    0x8(%ebp),%ecx
 17d:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 180:	eb 06                	jmp    188 <strcmp+0x11>
    p++, q++;
 182:	83 c1 01             	add    $0x1,%ecx
 185:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 188:	0f b6 01             	movzbl (%ecx),%eax
 18b:	84 c0                	test   %al,%al
 18d:	74 04                	je     193 <strcmp+0x1c>
 18f:	3a 02                	cmp    (%edx),%al
 191:	74 ef                	je     182 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 193:	0f b6 c0             	movzbl %al,%eax
 196:	0f b6 12             	movzbl (%edx),%edx
 199:	29 d0                	sub    %edx,%eax
}
 19b:	5d                   	pop    %ebp
 19c:	c3                   	ret    

0000019d <strlen>:

uint
strlen(const char *s)
{
 19d:	55                   	push   %ebp
 19e:	89 e5                	mov    %esp,%ebp
 1a0:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 1a3:	b8 00 00 00 00       	mov    $0x0,%eax
 1a8:	eb 03                	jmp    1ad <strlen+0x10>
 1aa:	83 c0 01             	add    $0x1,%eax
 1ad:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 1b1:	75 f7                	jne    1aa <strlen+0xd>
    ;
  return n;
}
 1b3:	5d                   	pop    %ebp
 1b4:	c3                   	ret    

000001b5 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1b5:	55                   	push   %ebp
 1b6:	89 e5                	mov    %esp,%ebp
 1b8:	57                   	push   %edi
 1b9:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1bc:	89 d7                	mov    %edx,%edi
 1be:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1c1:	8b 45 0c             	mov    0xc(%ebp),%eax
 1c4:	fc                   	cld    
 1c5:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1c7:	89 d0                	mov    %edx,%eax
 1c9:	8b 7d fc             	mov    -0x4(%ebp),%edi
 1cc:	c9                   	leave  
 1cd:	c3                   	ret    

000001ce <strchr>:

char*
strchr(const char *s, char c)
{
 1ce:	55                   	push   %ebp
 1cf:	89 e5                	mov    %esp,%ebp
 1d1:	8b 45 08             	mov    0x8(%ebp),%eax
 1d4:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1d8:	eb 03                	jmp    1dd <strchr+0xf>
 1da:	83 c0 01             	add    $0x1,%eax
 1dd:	0f b6 10             	movzbl (%eax),%edx
 1e0:	84 d2                	test   %dl,%dl
 1e2:	74 06                	je     1ea <strchr+0x1c>
    if(*s == c)
 1e4:	38 ca                	cmp    %cl,%dl
 1e6:	75 f2                	jne    1da <strchr+0xc>
 1e8:	eb 05                	jmp    1ef <strchr+0x21>
      return (char*)s;
  return 0;
 1ea:	b8 00 00 00 00       	mov    $0x0,%eax
}
 1ef:	5d                   	pop    %ebp
 1f0:	c3                   	ret    

000001f1 <gets>:

char*
gets(char *buf, int max)
{
 1f1:	55                   	push   %ebp
 1f2:	89 e5                	mov    %esp,%ebp
 1f4:	57                   	push   %edi
 1f5:	56                   	push   %esi
 1f6:	53                   	push   %ebx
 1f7:	83 ec 1c             	sub    $0x1c,%esp
 1fa:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1fd:	bb 00 00 00 00       	mov    $0x0,%ebx
 202:	89 de                	mov    %ebx,%esi
 204:	83 c3 01             	add    $0x1,%ebx
 207:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 20a:	7d 2e                	jge    23a <gets+0x49>
    cc = read(0, &c, 1);
 20c:	83 ec 04             	sub    $0x4,%esp
 20f:	6a 01                	push   $0x1
 211:	8d 45 e7             	lea    -0x19(%ebp),%eax
 214:	50                   	push   %eax
 215:	6a 00                	push   $0x0
 217:	e8 ec 00 00 00       	call   308 <read>
    if(cc < 1)
 21c:	83 c4 10             	add    $0x10,%esp
 21f:	85 c0                	test   %eax,%eax
 221:	7e 17                	jle    23a <gets+0x49>
      break;
    buf[i++] = c;
 223:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 227:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 22a:	3c 0a                	cmp    $0xa,%al
 22c:	0f 94 c2             	sete   %dl
 22f:	3c 0d                	cmp    $0xd,%al
 231:	0f 94 c0             	sete   %al
 234:	08 c2                	or     %al,%dl
 236:	74 ca                	je     202 <gets+0x11>
    buf[i++] = c;
 238:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 23a:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 23e:	89 f8                	mov    %edi,%eax
 240:	8d 65 f4             	lea    -0xc(%ebp),%esp
 243:	5b                   	pop    %ebx
 244:	5e                   	pop    %esi
 245:	5f                   	pop    %edi
 246:	5d                   	pop    %ebp
 247:	c3                   	ret    

00000248 <stat>:

int
stat(const char *n, struct stat *st)
{
 248:	55                   	push   %ebp
 249:	89 e5                	mov    %esp,%ebp
 24b:	56                   	push   %esi
 24c:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 24d:	83 ec 08             	sub    $0x8,%esp
 250:	6a 00                	push   $0x0
 252:	ff 75 08             	push   0x8(%ebp)
 255:	e8 d6 00 00 00       	call   330 <open>
  if(fd < 0)
 25a:	83 c4 10             	add    $0x10,%esp
 25d:	85 c0                	test   %eax,%eax
 25f:	78 24                	js     285 <stat+0x3d>
 261:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 263:	83 ec 08             	sub    $0x8,%esp
 266:	ff 75 0c             	push   0xc(%ebp)
 269:	50                   	push   %eax
 26a:	e8 d9 00 00 00       	call   348 <fstat>
 26f:	89 c6                	mov    %eax,%esi
  close(fd);
 271:	89 1c 24             	mov    %ebx,(%esp)
 274:	e8 9f 00 00 00       	call   318 <close>
  return r;
 279:	83 c4 10             	add    $0x10,%esp
}
 27c:	89 f0                	mov    %esi,%eax
 27e:	8d 65 f8             	lea    -0x8(%ebp),%esp
 281:	5b                   	pop    %ebx
 282:	5e                   	pop    %esi
 283:	5d                   	pop    %ebp
 284:	c3                   	ret    
    return -1;
 285:	be ff ff ff ff       	mov    $0xffffffff,%esi
 28a:	eb f0                	jmp    27c <stat+0x34>

0000028c <atoi>:

int
atoi(const char *s)
{
 28c:	55                   	push   %ebp
 28d:	89 e5                	mov    %esp,%ebp
 28f:	53                   	push   %ebx
 290:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 293:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 298:	eb 10                	jmp    2aa <atoi+0x1e>
    n = n*10 + *s++ - '0';
 29a:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 29d:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 2a0:	83 c1 01             	add    $0x1,%ecx
 2a3:	0f be c0             	movsbl %al,%eax
 2a6:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 2aa:	0f b6 01             	movzbl (%ecx),%eax
 2ad:	8d 58 d0             	lea    -0x30(%eax),%ebx
 2b0:	80 fb 09             	cmp    $0x9,%bl
 2b3:	76 e5                	jbe    29a <atoi+0xe>
  return n;
}
 2b5:	89 d0                	mov    %edx,%eax
 2b7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2ba:	c9                   	leave  
 2bb:	c3                   	ret    

000002bc <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2bc:	55                   	push   %ebp
 2bd:	89 e5                	mov    %esp,%ebp
 2bf:	56                   	push   %esi
 2c0:	53                   	push   %ebx
 2c1:	8b 75 08             	mov    0x8(%ebp),%esi
 2c4:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 2c7:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 2ca:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 2cc:	eb 0d                	jmp    2db <memmove+0x1f>
    *dst++ = *src++;
 2ce:	0f b6 01             	movzbl (%ecx),%eax
 2d1:	88 02                	mov    %al,(%edx)
 2d3:	8d 49 01             	lea    0x1(%ecx),%ecx
 2d6:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 2d9:	89 d8                	mov    %ebx,%eax
 2db:	8d 58 ff             	lea    -0x1(%eax),%ebx
 2de:	85 c0                	test   %eax,%eax
 2e0:	7f ec                	jg     2ce <memmove+0x12>
  return vdst;
}
 2e2:	89 f0                	mov    %esi,%eax
 2e4:	5b                   	pop    %ebx
 2e5:	5e                   	pop    %esi
 2e6:	5d                   	pop    %ebp
 2e7:	c3                   	ret    

000002e8 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2e8:	b8 01 00 00 00       	mov    $0x1,%eax
 2ed:	cd 40                	int    $0x40
 2ef:	c3                   	ret    

000002f0 <exit>:
SYSCALL(exit)
 2f0:	b8 02 00 00 00       	mov    $0x2,%eax
 2f5:	cd 40                	int    $0x40
 2f7:	c3                   	ret    

000002f8 <wait>:
SYSCALL(wait)
 2f8:	b8 03 00 00 00       	mov    $0x3,%eax
 2fd:	cd 40                	int    $0x40
 2ff:	c3                   	ret    

00000300 <pipe>:
SYSCALL(pipe)
 300:	b8 04 00 00 00       	mov    $0x4,%eax
 305:	cd 40                	int    $0x40
 307:	c3                   	ret    

00000308 <read>:
SYSCALL(read)
 308:	b8 05 00 00 00       	mov    $0x5,%eax
 30d:	cd 40                	int    $0x40
 30f:	c3                   	ret    

00000310 <write>:
SYSCALL(write)
 310:	b8 10 00 00 00       	mov    $0x10,%eax
 315:	cd 40                	int    $0x40
 317:	c3                   	ret    

00000318 <close>:
SYSCALL(close)
 318:	b8 15 00 00 00       	mov    $0x15,%eax
 31d:	cd 40                	int    $0x40
 31f:	c3                   	ret    

00000320 <kill>:
SYSCALL(kill)
 320:	b8 06 00 00 00       	mov    $0x6,%eax
 325:	cd 40                	int    $0x40
 327:	c3                   	ret    

00000328 <exec>:
SYSCALL(exec)
 328:	b8 07 00 00 00       	mov    $0x7,%eax
 32d:	cd 40                	int    $0x40
 32f:	c3                   	ret    

00000330 <open>:
SYSCALL(open)
 330:	b8 0f 00 00 00       	mov    $0xf,%eax
 335:	cd 40                	int    $0x40
 337:	c3                   	ret    

00000338 <mknod>:
SYSCALL(mknod)
 338:	b8 11 00 00 00       	mov    $0x11,%eax
 33d:	cd 40                	int    $0x40
 33f:	c3                   	ret    

00000340 <unlink>:
SYSCALL(unlink)
 340:	b8 12 00 00 00       	mov    $0x12,%eax
 345:	cd 40                	int    $0x40
 347:	c3                   	ret    

00000348 <fstat>:
SYSCALL(fstat)
 348:	b8 08 00 00 00       	mov    $0x8,%eax
 34d:	cd 40                	int    $0x40
 34f:	c3                   	ret    

00000350 <link>:
SYSCALL(link)
 350:	b8 13 00 00 00       	mov    $0x13,%eax
 355:	cd 40                	int    $0x40
 357:	c3                   	ret    

00000358 <mkdir>:
SYSCALL(mkdir)
 358:	b8 14 00 00 00       	mov    $0x14,%eax
 35d:	cd 40                	int    $0x40
 35f:	c3                   	ret    

00000360 <chdir>:
SYSCALL(chdir)
 360:	b8 09 00 00 00       	mov    $0x9,%eax
 365:	cd 40                	int    $0x40
 367:	c3                   	ret    

00000368 <dup>:
SYSCALL(dup)
 368:	b8 0a 00 00 00       	mov    $0xa,%eax
 36d:	cd 40                	int    $0x40
 36f:	c3                   	ret    

00000370 <getpid>:
SYSCALL(getpid)
 370:	b8 0b 00 00 00       	mov    $0xb,%eax
 375:	cd 40                	int    $0x40
 377:	c3                   	ret    

00000378 <sbrk>:
SYSCALL(sbrk)
 378:	b8 0c 00 00 00       	mov    $0xc,%eax
 37d:	cd 40                	int    $0x40
 37f:	c3                   	ret    

00000380 <sleep>:
SYSCALL(sleep)
 380:	b8 0d 00 00 00       	mov    $0xd,%eax
 385:	cd 40                	int    $0x40
 387:	c3                   	ret    

00000388 <uptime>:
SYSCALL(uptime)
 388:	b8 0e 00 00 00       	mov    $0xe,%eax
 38d:	cd 40                	int    $0x40
 38f:	c3                   	ret    

00000390 <clone>:
SYSCALL(clone)
 390:	b8 16 00 00 00       	mov    $0x16,%eax
 395:	cd 40                	int    $0x40
 397:	c3                   	ret    

00000398 <join>:
 398:	b8 17 00 00 00       	mov    $0x17,%eax
 39d:	cd 40                	int    $0x40
 39f:	c3                   	ret    

000003a0 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 3a0:	55                   	push   %ebp
 3a1:	89 e5                	mov    %esp,%ebp
 3a3:	83 ec 1c             	sub    $0x1c,%esp
 3a6:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 3a9:	6a 01                	push   $0x1
 3ab:	8d 55 f4             	lea    -0xc(%ebp),%edx
 3ae:	52                   	push   %edx
 3af:	50                   	push   %eax
 3b0:	e8 5b ff ff ff       	call   310 <write>
}
 3b5:	83 c4 10             	add    $0x10,%esp
 3b8:	c9                   	leave  
 3b9:	c3                   	ret    

000003ba <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 3ba:	55                   	push   %ebp
 3bb:	89 e5                	mov    %esp,%ebp
 3bd:	57                   	push   %edi
 3be:	56                   	push   %esi
 3bf:	53                   	push   %ebx
 3c0:	83 ec 2c             	sub    $0x2c,%esp
 3c3:	89 45 d0             	mov    %eax,-0x30(%ebp)
 3c6:	89 d0                	mov    %edx,%eax
 3c8:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 3ca:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 3ce:	0f 95 c1             	setne  %cl
 3d1:	c1 ea 1f             	shr    $0x1f,%edx
 3d4:	84 d1                	test   %dl,%cl
 3d6:	74 44                	je     41c <printint+0x62>
    neg = 1;
    x = -xx;
 3d8:	f7 d8                	neg    %eax
 3da:	89 c1                	mov    %eax,%ecx
    neg = 1;
 3dc:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 3e3:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 3e8:	89 c8                	mov    %ecx,%eax
 3ea:	ba 00 00 00 00       	mov    $0x0,%edx
 3ef:	f7 f6                	div    %esi
 3f1:	89 df                	mov    %ebx,%edi
 3f3:	83 c3 01             	add    $0x1,%ebx
 3f6:	0f b6 92 5c 07 00 00 	movzbl 0x75c(%edx),%edx
 3fd:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 401:	89 ca                	mov    %ecx,%edx
 403:	89 c1                	mov    %eax,%ecx
 405:	39 d6                	cmp    %edx,%esi
 407:	76 df                	jbe    3e8 <printint+0x2e>
  if(neg)
 409:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 40d:	74 31                	je     440 <printint+0x86>
    buf[i++] = '-';
 40f:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 414:	8d 5f 02             	lea    0x2(%edi),%ebx
 417:	8b 75 d0             	mov    -0x30(%ebp),%esi
 41a:	eb 17                	jmp    433 <printint+0x79>
    x = xx;
 41c:	89 c1                	mov    %eax,%ecx
  neg = 0;
 41e:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 425:	eb bc                	jmp    3e3 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 427:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 42c:	89 f0                	mov    %esi,%eax
 42e:	e8 6d ff ff ff       	call   3a0 <putc>
  while(--i >= 0)
 433:	83 eb 01             	sub    $0x1,%ebx
 436:	79 ef                	jns    427 <printint+0x6d>
}
 438:	83 c4 2c             	add    $0x2c,%esp
 43b:	5b                   	pop    %ebx
 43c:	5e                   	pop    %esi
 43d:	5f                   	pop    %edi
 43e:	5d                   	pop    %ebp
 43f:	c3                   	ret    
 440:	8b 75 d0             	mov    -0x30(%ebp),%esi
 443:	eb ee                	jmp    433 <printint+0x79>

00000445 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 445:	55                   	push   %ebp
 446:	89 e5                	mov    %esp,%ebp
 448:	57                   	push   %edi
 449:	56                   	push   %esi
 44a:	53                   	push   %ebx
 44b:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 44e:	8d 45 10             	lea    0x10(%ebp),%eax
 451:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 454:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 459:	bb 00 00 00 00       	mov    $0x0,%ebx
 45e:	eb 14                	jmp    474 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 460:	89 fa                	mov    %edi,%edx
 462:	8b 45 08             	mov    0x8(%ebp),%eax
 465:	e8 36 ff ff ff       	call   3a0 <putc>
 46a:	eb 05                	jmp    471 <printf+0x2c>
      }
    } else if(state == '%'){
 46c:	83 fe 25             	cmp    $0x25,%esi
 46f:	74 25                	je     496 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 471:	83 c3 01             	add    $0x1,%ebx
 474:	8b 45 0c             	mov    0xc(%ebp),%eax
 477:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 47b:	84 c0                	test   %al,%al
 47d:	0f 84 20 01 00 00    	je     5a3 <printf+0x15e>
    c = fmt[i] & 0xff;
 483:	0f be f8             	movsbl %al,%edi
 486:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 489:	85 f6                	test   %esi,%esi
 48b:	75 df                	jne    46c <printf+0x27>
      if(c == '%'){
 48d:	83 f8 25             	cmp    $0x25,%eax
 490:	75 ce                	jne    460 <printf+0x1b>
        state = '%';
 492:	89 c6                	mov    %eax,%esi
 494:	eb db                	jmp    471 <printf+0x2c>
      if(c == 'd'){
 496:	83 f8 25             	cmp    $0x25,%eax
 499:	0f 84 cf 00 00 00    	je     56e <printf+0x129>
 49f:	0f 8c dd 00 00 00    	jl     582 <printf+0x13d>
 4a5:	83 f8 78             	cmp    $0x78,%eax
 4a8:	0f 8f d4 00 00 00    	jg     582 <printf+0x13d>
 4ae:	83 f8 63             	cmp    $0x63,%eax
 4b1:	0f 8c cb 00 00 00    	jl     582 <printf+0x13d>
 4b7:	83 e8 63             	sub    $0x63,%eax
 4ba:	83 f8 15             	cmp    $0x15,%eax
 4bd:	0f 87 bf 00 00 00    	ja     582 <printf+0x13d>
 4c3:	ff 24 85 04 07 00 00 	jmp    *0x704(,%eax,4)
        printint(fd, *ap, 10, 1);
 4ca:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4cd:	8b 17                	mov    (%edi),%edx
 4cf:	83 ec 0c             	sub    $0xc,%esp
 4d2:	6a 01                	push   $0x1
 4d4:	b9 0a 00 00 00       	mov    $0xa,%ecx
 4d9:	8b 45 08             	mov    0x8(%ebp),%eax
 4dc:	e8 d9 fe ff ff       	call   3ba <printint>
        ap++;
 4e1:	83 c7 04             	add    $0x4,%edi
 4e4:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 4e7:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 4ea:	be 00 00 00 00       	mov    $0x0,%esi
 4ef:	eb 80                	jmp    471 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 4f1:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4f4:	8b 17                	mov    (%edi),%edx
 4f6:	83 ec 0c             	sub    $0xc,%esp
 4f9:	6a 00                	push   $0x0
 4fb:	b9 10 00 00 00       	mov    $0x10,%ecx
 500:	8b 45 08             	mov    0x8(%ebp),%eax
 503:	e8 b2 fe ff ff       	call   3ba <printint>
        ap++;
 508:	83 c7 04             	add    $0x4,%edi
 50b:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 50e:	83 c4 10             	add    $0x10,%esp
      state = 0;
 511:	be 00 00 00 00       	mov    $0x0,%esi
 516:	e9 56 ff ff ff       	jmp    471 <printf+0x2c>
        s = (char*)*ap;
 51b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 51e:	8b 30                	mov    (%eax),%esi
        ap++;
 520:	83 c0 04             	add    $0x4,%eax
 523:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 526:	85 f6                	test   %esi,%esi
 528:	75 15                	jne    53f <printf+0xfa>
          s = "(null)";
 52a:	be fd 06 00 00       	mov    $0x6fd,%esi
 52f:	eb 0e                	jmp    53f <printf+0xfa>
          putc(fd, *s);
 531:	0f be d2             	movsbl %dl,%edx
 534:	8b 45 08             	mov    0x8(%ebp),%eax
 537:	e8 64 fe ff ff       	call   3a0 <putc>
          s++;
 53c:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 53f:	0f b6 16             	movzbl (%esi),%edx
 542:	84 d2                	test   %dl,%dl
 544:	75 eb                	jne    531 <printf+0xec>
      state = 0;
 546:	be 00 00 00 00       	mov    $0x0,%esi
 54b:	e9 21 ff ff ff       	jmp    471 <printf+0x2c>
        putc(fd, *ap);
 550:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 553:	0f be 17             	movsbl (%edi),%edx
 556:	8b 45 08             	mov    0x8(%ebp),%eax
 559:	e8 42 fe ff ff       	call   3a0 <putc>
        ap++;
 55e:	83 c7 04             	add    $0x4,%edi
 561:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 564:	be 00 00 00 00       	mov    $0x0,%esi
 569:	e9 03 ff ff ff       	jmp    471 <printf+0x2c>
        putc(fd, c);
 56e:	89 fa                	mov    %edi,%edx
 570:	8b 45 08             	mov    0x8(%ebp),%eax
 573:	e8 28 fe ff ff       	call   3a0 <putc>
      state = 0;
 578:	be 00 00 00 00       	mov    $0x0,%esi
 57d:	e9 ef fe ff ff       	jmp    471 <printf+0x2c>
        putc(fd, '%');
 582:	ba 25 00 00 00       	mov    $0x25,%edx
 587:	8b 45 08             	mov    0x8(%ebp),%eax
 58a:	e8 11 fe ff ff       	call   3a0 <putc>
        putc(fd, c);
 58f:	89 fa                	mov    %edi,%edx
 591:	8b 45 08             	mov    0x8(%ebp),%eax
 594:	e8 07 fe ff ff       	call   3a0 <putc>
      state = 0;
 599:	be 00 00 00 00       	mov    $0x0,%esi
 59e:	e9 ce fe ff ff       	jmp    471 <printf+0x2c>
    }
  }
}
 5a3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5a6:	5b                   	pop    %ebx
 5a7:	5e                   	pop    %esi
 5a8:	5f                   	pop    %edi
 5a9:	5d                   	pop    %ebp
 5aa:	c3                   	ret    

000005ab <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5ab:	55                   	push   %ebp
 5ac:	89 e5                	mov    %esp,%ebp
 5ae:	57                   	push   %edi
 5af:	56                   	push   %esi
 5b0:	53                   	push   %ebx
 5b1:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 5b4:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5b7:	a1 e0 0b 00 00       	mov    0xbe0,%eax
 5bc:	eb 02                	jmp    5c0 <free+0x15>
 5be:	89 d0                	mov    %edx,%eax
 5c0:	39 c8                	cmp    %ecx,%eax
 5c2:	73 04                	jae    5c8 <free+0x1d>
 5c4:	39 08                	cmp    %ecx,(%eax)
 5c6:	77 12                	ja     5da <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5c8:	8b 10                	mov    (%eax),%edx
 5ca:	39 c2                	cmp    %eax,%edx
 5cc:	77 f0                	ja     5be <free+0x13>
 5ce:	39 c8                	cmp    %ecx,%eax
 5d0:	72 08                	jb     5da <free+0x2f>
 5d2:	39 ca                	cmp    %ecx,%edx
 5d4:	77 04                	ja     5da <free+0x2f>
 5d6:	89 d0                	mov    %edx,%eax
 5d8:	eb e6                	jmp    5c0 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 5da:	8b 73 fc             	mov    -0x4(%ebx),%esi
 5dd:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 5e0:	8b 10                	mov    (%eax),%edx
 5e2:	39 d7                	cmp    %edx,%edi
 5e4:	74 19                	je     5ff <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 5e6:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 5e9:	8b 50 04             	mov    0x4(%eax),%edx
 5ec:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 5ef:	39 ce                	cmp    %ecx,%esi
 5f1:	74 1b                	je     60e <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 5f3:	89 08                	mov    %ecx,(%eax)
  freep = p;
 5f5:	a3 e0 0b 00 00       	mov    %eax,0xbe0
}
 5fa:	5b                   	pop    %ebx
 5fb:	5e                   	pop    %esi
 5fc:	5f                   	pop    %edi
 5fd:	5d                   	pop    %ebp
 5fe:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 5ff:	03 72 04             	add    0x4(%edx),%esi
 602:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 605:	8b 10                	mov    (%eax),%edx
 607:	8b 12                	mov    (%edx),%edx
 609:	89 53 f8             	mov    %edx,-0x8(%ebx)
 60c:	eb db                	jmp    5e9 <free+0x3e>
    p->s.size += bp->s.size;
 60e:	03 53 fc             	add    -0x4(%ebx),%edx
 611:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 614:	8b 53 f8             	mov    -0x8(%ebx),%edx
 617:	89 10                	mov    %edx,(%eax)
 619:	eb da                	jmp    5f5 <free+0x4a>

0000061b <morecore>:

static Header*
morecore(uint nu)
{
 61b:	55                   	push   %ebp
 61c:	89 e5                	mov    %esp,%ebp
 61e:	53                   	push   %ebx
 61f:	83 ec 04             	sub    $0x4,%esp
 622:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 624:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 629:	77 05                	ja     630 <morecore+0x15>
    nu = 4096;
 62b:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 630:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 637:	83 ec 0c             	sub    $0xc,%esp
 63a:	50                   	push   %eax
 63b:	e8 38 fd ff ff       	call   378 <sbrk>
  if(p == (char*)-1)
 640:	83 c4 10             	add    $0x10,%esp
 643:	83 f8 ff             	cmp    $0xffffffff,%eax
 646:	74 1c                	je     664 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 648:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 64b:	83 c0 08             	add    $0x8,%eax
 64e:	83 ec 0c             	sub    $0xc,%esp
 651:	50                   	push   %eax
 652:	e8 54 ff ff ff       	call   5ab <free>
  return freep;
 657:	a1 e0 0b 00 00       	mov    0xbe0,%eax
 65c:	83 c4 10             	add    $0x10,%esp
}
 65f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 662:	c9                   	leave  
 663:	c3                   	ret    
    return 0;
 664:	b8 00 00 00 00       	mov    $0x0,%eax
 669:	eb f4                	jmp    65f <morecore+0x44>

0000066b <malloc>:

void*
malloc(uint nbytes)
{
 66b:	55                   	push   %ebp
 66c:	89 e5                	mov    %esp,%ebp
 66e:	53                   	push   %ebx
 66f:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 672:	8b 45 08             	mov    0x8(%ebp),%eax
 675:	8d 58 07             	lea    0x7(%eax),%ebx
 678:	c1 eb 03             	shr    $0x3,%ebx
 67b:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 67e:	8b 0d e0 0b 00 00    	mov    0xbe0,%ecx
 684:	85 c9                	test   %ecx,%ecx
 686:	74 04                	je     68c <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 688:	8b 01                	mov    (%ecx),%eax
 68a:	eb 4a                	jmp    6d6 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 68c:	c7 05 e0 0b 00 00 e4 	movl   $0xbe4,0xbe0
 693:	0b 00 00 
 696:	c7 05 e4 0b 00 00 e4 	movl   $0xbe4,0xbe4
 69d:	0b 00 00 
    base.s.size = 0;
 6a0:	c7 05 e8 0b 00 00 00 	movl   $0x0,0xbe8
 6a7:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 6aa:	b9 e4 0b 00 00       	mov    $0xbe4,%ecx
 6af:	eb d7                	jmp    688 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 6b1:	74 19                	je     6cc <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 6b3:	29 da                	sub    %ebx,%edx
 6b5:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 6b8:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 6bb:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 6be:	89 0d e0 0b 00 00    	mov    %ecx,0xbe0
      return (void*)(p + 1);
 6c4:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 6c7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 6ca:	c9                   	leave  
 6cb:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 6cc:	8b 10                	mov    (%eax),%edx
 6ce:	89 11                	mov    %edx,(%ecx)
 6d0:	eb ec                	jmp    6be <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6d2:	89 c1                	mov    %eax,%ecx
 6d4:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 6d6:	8b 50 04             	mov    0x4(%eax),%edx
 6d9:	39 da                	cmp    %ebx,%edx
 6db:	73 d4                	jae    6b1 <malloc+0x46>
    if(p == freep)
 6dd:	39 05 e0 0b 00 00    	cmp    %eax,0xbe0
 6e3:	75 ed                	jne    6d2 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 6e5:	89 d8                	mov    %ebx,%eax
 6e7:	e8 2f ff ff ff       	call   61b <morecore>
 6ec:	85 c0                	test   %eax,%eax
 6ee:	75 e2                	jne    6d2 <malloc+0x67>
 6f0:	eb d5                	jmp    6c7 <malloc+0x5c>
