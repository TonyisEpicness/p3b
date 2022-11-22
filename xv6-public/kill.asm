
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
  28:	68 04 07 00 00       	push   $0x704
  2d:	6a 02                	push   $0x2
  2f:	e8 23 04 00 00       	call   457 <printf>
    exit();
  34:	e8 c9 02 00 00       	call   302 <exit>
    kill(atoi(argv[i]));
  39:	83 ec 0c             	sub    $0xc,%esp
  3c:	ff 34 9f             	push   (%edi,%ebx,4)
  3f:	e8 5a 02 00 00       	call   29e <atoi>
  44:	89 04 24             	mov    %eax,(%esp)
  47:	e8 e6 02 00 00       	call   332 <kill>
  for(i=1; i<argc; i++)
  4c:	83 c3 01             	add    $0x1,%ebx
  4f:	83 c4 10             	add    $0x10,%esp
  52:	39 f3                	cmp    %esi,%ebx
  54:	7c e3                	jl     39 <main+0x39>
  exit();
  56:	e8 a7 02 00 00       	call   302 <exit>

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
  6f:	83 ec 14             	sub    $0x14,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE*2);
  72:	68 00 20 00 00       	push   $0x2000
  77:	e8 01 06 00 00       	call   67d <malloc>
  if(n_stack == 0){
  7c:	83 c4 10             	add    $0x10,%esp
  7f:	85 c0                	test   %eax,%eax
  81:	74 4a                	je     cd <thread_create+0x61>
    return -1;
  }
  
  for(int i=0; i<64; i++){
  83:	ba 00 00 00 00       	mov    $0x0,%edx
  88:	eb 03                	jmp    8d <thread_create+0x21>
  8a:	83 c2 01             	add    $0x1,%edx
  8d:	83 fa 3f             	cmp    $0x3f,%edx
  90:	7f 27                	jg     b9 <thread_create+0x4d>
    if(threads[i]->flag==0){
  92:	8b 0c 95 00 0b 00 00 	mov    0xb00(,%edx,4),%ecx
  99:	83 79 08 00          	cmpl   $0x0,0x8(%ecx)
  9d:	75 eb                	jne    8a <thread_create+0x1e>
      threads[i]->maddr = n_stack;
  9f:	89 01                	mov    %eax,(%ecx)
      threads[i]->pg1addr = n_stack;
  a1:	8b 0c 95 00 0b 00 00 	mov    0xb00(,%edx,4),%ecx
  a8:	89 41 04             	mov    %eax,0x4(%ecx)
      threads[i]->flag = 1;
  ab:	8b 14 95 00 0b 00 00 	mov    0xb00(,%edx,4),%edx
  b2:	c7 42 08 01 00 00 00 	movl   $0x1,0x8(%edx)
      break;
    }
  }
  
  int new_pid = clone(start_routine, arg1, arg2, n_stack); // TODO: is this the right way to call it?
  b9:	50                   	push   %eax
  ba:	ff 75 10             	push   0x10(%ebp)
  bd:	ff 75 0c             	push   0xc(%ebp)
  c0:	ff 75 08             	push   0x8(%ebp)
  c3:	e8 da 02 00 00       	call   3a2 <clone>

  // I can't remember if there was something else to do here but I'm sure I'll find out



  return new_pid;
  c8:	83 c4 10             	add    $0x10,%esp
}
  cb:	c9                   	leave  
  cc:	c3                   	ret    
    return -1;
  cd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  d2:	eb f7                	jmp    cb <thread_create+0x5f>

000000d4 <thread_join>:

//TODO: fix
int thread_join() {
  d4:	55                   	push   %ebp
  d5:	89 e5                	mov    %esp,%ebp
  d7:	56                   	push   %esi
  d8:	53                   	push   %ebx
  d9:	83 ec 1c             	sub    $0x1c,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
  dc:	8d 45 f4             	lea    -0xc(%ebp),%eax
  df:	50                   	push   %eax
  e0:	e8 c5 02 00 00       	call   3aa <join>
  e5:	89 c6                	mov    %eax,%esi
  for(int i=0; i<64; i++){
  e7:	83 c4 10             	add    $0x10,%esp
  ea:	bb 00 00 00 00       	mov    $0x0,%ebx
  ef:	eb 03                	jmp    f4 <thread_join+0x20>
  f1:	83 c3 01             	add    $0x1,%ebx
  f4:	83 fb 3f             	cmp    $0x3f,%ebx
  f7:	7f 23                	jg     11c <thread_join+0x48>
    if((threads[i]->flag==1) && (stk_addr == threads[i]->pg1addr)){
  f9:	8b 04 9d 00 0b 00 00 	mov    0xb00(,%ebx,4),%eax
 100:	83 78 08 01          	cmpl   $0x1,0x8(%eax)
 104:	75 eb                	jne    f1 <thread_join+0x1d>
 106:	8b 55 f4             	mov    -0xc(%ebp),%edx
 109:	39 50 04             	cmp    %edx,0x4(%eax)
 10c:	75 e3                	jne    f1 <thread_join+0x1d>
      free(stk_addr);
 10e:	83 ec 0c             	sub    $0xc,%esp
 111:	52                   	push   %edx
 112:	e8 a6 04 00 00       	call   5bd <free>
 117:	83 c4 10             	add    $0x10,%esp
 11a:	eb d5                	jmp    f1 <thread_join+0x1d>
    }
  }
  return pid;
}
 11c:	89 f0                	mov    %esi,%eax
 11e:	8d 65 f8             	lea    -0x8(%ebp),%esp
 121:	5b                   	pop    %ebx
 122:	5e                   	pop    %esi
 123:	5d                   	pop    %ebp
 124:	c3                   	ret    

00000125 <lock_acquire>:

void lock_acquire(lock_t *lock){
 125:	55                   	push   %ebp
 126:	89 e5                	mov    %esp,%ebp
 128:	53                   	push   %ebx
 129:	83 ec 04             	sub    $0x4,%esp
 12c:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 12f:	83 ec 08             	sub    $0x8,%esp
 132:	6a 01                	push   $0x1
 134:	53                   	push   %ebx
 135:	e8 21 ff ff ff       	call   5b <test_and_set>
 13a:	83 c4 10             	add    $0x10,%esp
 13d:	83 f8 01             	cmp    $0x1,%eax
 140:	74 ed                	je     12f <lock_acquire+0xa>
    ;
}
 142:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 145:	c9                   	leave  
 146:	c3                   	ret    

00000147 <lock_release>:

void lock_release(lock_t *lock) {
 147:	55                   	push   %ebp
 148:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 14a:	8b 45 08             	mov    0x8(%ebp),%eax
 14d:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 153:	5d                   	pop    %ebp
 154:	c3                   	ret    

00000155 <lock_init>:

void lock_init(lock_t *lock) {
 155:	55                   	push   %ebp
 156:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 158:	8b 45 08             	mov    0x8(%ebp),%eax
 15b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 161:	5d                   	pop    %ebp
 162:	c3                   	ret    

00000163 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 163:	55                   	push   %ebp
 164:	89 e5                	mov    %esp,%ebp
 166:	56                   	push   %esi
 167:	53                   	push   %ebx
 168:	8b 75 08             	mov    0x8(%ebp),%esi
 16b:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 16e:	89 f0                	mov    %esi,%eax
 170:	89 d1                	mov    %edx,%ecx
 172:	83 c2 01             	add    $0x1,%edx
 175:	89 c3                	mov    %eax,%ebx
 177:	83 c0 01             	add    $0x1,%eax
 17a:	0f b6 09             	movzbl (%ecx),%ecx
 17d:	88 0b                	mov    %cl,(%ebx)
 17f:	84 c9                	test   %cl,%cl
 181:	75 ed                	jne    170 <strcpy+0xd>
    ;
  return os;
}
 183:	89 f0                	mov    %esi,%eax
 185:	5b                   	pop    %ebx
 186:	5e                   	pop    %esi
 187:	5d                   	pop    %ebp
 188:	c3                   	ret    

00000189 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 189:	55                   	push   %ebp
 18a:	89 e5                	mov    %esp,%ebp
 18c:	8b 4d 08             	mov    0x8(%ebp),%ecx
 18f:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 192:	eb 06                	jmp    19a <strcmp+0x11>
    p++, q++;
 194:	83 c1 01             	add    $0x1,%ecx
 197:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 19a:	0f b6 01             	movzbl (%ecx),%eax
 19d:	84 c0                	test   %al,%al
 19f:	74 04                	je     1a5 <strcmp+0x1c>
 1a1:	3a 02                	cmp    (%edx),%al
 1a3:	74 ef                	je     194 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 1a5:	0f b6 c0             	movzbl %al,%eax
 1a8:	0f b6 12             	movzbl (%edx),%edx
 1ab:	29 d0                	sub    %edx,%eax
}
 1ad:	5d                   	pop    %ebp
 1ae:	c3                   	ret    

000001af <strlen>:

uint
strlen(const char *s)
{
 1af:	55                   	push   %ebp
 1b0:	89 e5                	mov    %esp,%ebp
 1b2:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 1b5:	b8 00 00 00 00       	mov    $0x0,%eax
 1ba:	eb 03                	jmp    1bf <strlen+0x10>
 1bc:	83 c0 01             	add    $0x1,%eax
 1bf:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 1c3:	75 f7                	jne    1bc <strlen+0xd>
    ;
  return n;
}
 1c5:	5d                   	pop    %ebp
 1c6:	c3                   	ret    

000001c7 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1c7:	55                   	push   %ebp
 1c8:	89 e5                	mov    %esp,%ebp
 1ca:	57                   	push   %edi
 1cb:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1ce:	89 d7                	mov    %edx,%edi
 1d0:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1d3:	8b 45 0c             	mov    0xc(%ebp),%eax
 1d6:	fc                   	cld    
 1d7:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1d9:	89 d0                	mov    %edx,%eax
 1db:	8b 7d fc             	mov    -0x4(%ebp),%edi
 1de:	c9                   	leave  
 1df:	c3                   	ret    

000001e0 <strchr>:

char*
strchr(const char *s, char c)
{
 1e0:	55                   	push   %ebp
 1e1:	89 e5                	mov    %esp,%ebp
 1e3:	8b 45 08             	mov    0x8(%ebp),%eax
 1e6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1ea:	eb 03                	jmp    1ef <strchr+0xf>
 1ec:	83 c0 01             	add    $0x1,%eax
 1ef:	0f b6 10             	movzbl (%eax),%edx
 1f2:	84 d2                	test   %dl,%dl
 1f4:	74 06                	je     1fc <strchr+0x1c>
    if(*s == c)
 1f6:	38 ca                	cmp    %cl,%dl
 1f8:	75 f2                	jne    1ec <strchr+0xc>
 1fa:	eb 05                	jmp    201 <strchr+0x21>
      return (char*)s;
  return 0;
 1fc:	b8 00 00 00 00       	mov    $0x0,%eax
}
 201:	5d                   	pop    %ebp
 202:	c3                   	ret    

00000203 <gets>:

char*
gets(char *buf, int max)
{
 203:	55                   	push   %ebp
 204:	89 e5                	mov    %esp,%ebp
 206:	57                   	push   %edi
 207:	56                   	push   %esi
 208:	53                   	push   %ebx
 209:	83 ec 1c             	sub    $0x1c,%esp
 20c:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 20f:	bb 00 00 00 00       	mov    $0x0,%ebx
 214:	89 de                	mov    %ebx,%esi
 216:	83 c3 01             	add    $0x1,%ebx
 219:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 21c:	7d 2e                	jge    24c <gets+0x49>
    cc = read(0, &c, 1);
 21e:	83 ec 04             	sub    $0x4,%esp
 221:	6a 01                	push   $0x1
 223:	8d 45 e7             	lea    -0x19(%ebp),%eax
 226:	50                   	push   %eax
 227:	6a 00                	push   $0x0
 229:	e8 ec 00 00 00       	call   31a <read>
    if(cc < 1)
 22e:	83 c4 10             	add    $0x10,%esp
 231:	85 c0                	test   %eax,%eax
 233:	7e 17                	jle    24c <gets+0x49>
      break;
    buf[i++] = c;
 235:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 239:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 23c:	3c 0a                	cmp    $0xa,%al
 23e:	0f 94 c2             	sete   %dl
 241:	3c 0d                	cmp    $0xd,%al
 243:	0f 94 c0             	sete   %al
 246:	08 c2                	or     %al,%dl
 248:	74 ca                	je     214 <gets+0x11>
    buf[i++] = c;
 24a:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 24c:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 250:	89 f8                	mov    %edi,%eax
 252:	8d 65 f4             	lea    -0xc(%ebp),%esp
 255:	5b                   	pop    %ebx
 256:	5e                   	pop    %esi
 257:	5f                   	pop    %edi
 258:	5d                   	pop    %ebp
 259:	c3                   	ret    

0000025a <stat>:

int
stat(const char *n, struct stat *st)
{
 25a:	55                   	push   %ebp
 25b:	89 e5                	mov    %esp,%ebp
 25d:	56                   	push   %esi
 25e:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 25f:	83 ec 08             	sub    $0x8,%esp
 262:	6a 00                	push   $0x0
 264:	ff 75 08             	push   0x8(%ebp)
 267:	e8 d6 00 00 00       	call   342 <open>
  if(fd < 0)
 26c:	83 c4 10             	add    $0x10,%esp
 26f:	85 c0                	test   %eax,%eax
 271:	78 24                	js     297 <stat+0x3d>
 273:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 275:	83 ec 08             	sub    $0x8,%esp
 278:	ff 75 0c             	push   0xc(%ebp)
 27b:	50                   	push   %eax
 27c:	e8 d9 00 00 00       	call   35a <fstat>
 281:	89 c6                	mov    %eax,%esi
  close(fd);
 283:	89 1c 24             	mov    %ebx,(%esp)
 286:	e8 9f 00 00 00       	call   32a <close>
  return r;
 28b:	83 c4 10             	add    $0x10,%esp
}
 28e:	89 f0                	mov    %esi,%eax
 290:	8d 65 f8             	lea    -0x8(%ebp),%esp
 293:	5b                   	pop    %ebx
 294:	5e                   	pop    %esi
 295:	5d                   	pop    %ebp
 296:	c3                   	ret    
    return -1;
 297:	be ff ff ff ff       	mov    $0xffffffff,%esi
 29c:	eb f0                	jmp    28e <stat+0x34>

0000029e <atoi>:

int
atoi(const char *s)
{
 29e:	55                   	push   %ebp
 29f:	89 e5                	mov    %esp,%ebp
 2a1:	53                   	push   %ebx
 2a2:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 2a5:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 2aa:	eb 10                	jmp    2bc <atoi+0x1e>
    n = n*10 + *s++ - '0';
 2ac:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 2af:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 2b2:	83 c1 01             	add    $0x1,%ecx
 2b5:	0f be c0             	movsbl %al,%eax
 2b8:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 2bc:	0f b6 01             	movzbl (%ecx),%eax
 2bf:	8d 58 d0             	lea    -0x30(%eax),%ebx
 2c2:	80 fb 09             	cmp    $0x9,%bl
 2c5:	76 e5                	jbe    2ac <atoi+0xe>
  return n;
}
 2c7:	89 d0                	mov    %edx,%eax
 2c9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2cc:	c9                   	leave  
 2cd:	c3                   	ret    

000002ce <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2ce:	55                   	push   %ebp
 2cf:	89 e5                	mov    %esp,%ebp
 2d1:	56                   	push   %esi
 2d2:	53                   	push   %ebx
 2d3:	8b 75 08             	mov    0x8(%ebp),%esi
 2d6:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 2d9:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 2dc:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 2de:	eb 0d                	jmp    2ed <memmove+0x1f>
    *dst++ = *src++;
 2e0:	0f b6 01             	movzbl (%ecx),%eax
 2e3:	88 02                	mov    %al,(%edx)
 2e5:	8d 49 01             	lea    0x1(%ecx),%ecx
 2e8:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 2eb:	89 d8                	mov    %ebx,%eax
 2ed:	8d 58 ff             	lea    -0x1(%eax),%ebx
 2f0:	85 c0                	test   %eax,%eax
 2f2:	7f ec                	jg     2e0 <memmove+0x12>
  return vdst;
}
 2f4:	89 f0                	mov    %esi,%eax
 2f6:	5b                   	pop    %ebx
 2f7:	5e                   	pop    %esi
 2f8:	5d                   	pop    %ebp
 2f9:	c3                   	ret    

000002fa <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2fa:	b8 01 00 00 00       	mov    $0x1,%eax
 2ff:	cd 40                	int    $0x40
 301:	c3                   	ret    

00000302 <exit>:
SYSCALL(exit)
 302:	b8 02 00 00 00       	mov    $0x2,%eax
 307:	cd 40                	int    $0x40
 309:	c3                   	ret    

0000030a <wait>:
SYSCALL(wait)
 30a:	b8 03 00 00 00       	mov    $0x3,%eax
 30f:	cd 40                	int    $0x40
 311:	c3                   	ret    

00000312 <pipe>:
SYSCALL(pipe)
 312:	b8 04 00 00 00       	mov    $0x4,%eax
 317:	cd 40                	int    $0x40
 319:	c3                   	ret    

0000031a <read>:
SYSCALL(read)
 31a:	b8 05 00 00 00       	mov    $0x5,%eax
 31f:	cd 40                	int    $0x40
 321:	c3                   	ret    

00000322 <write>:
SYSCALL(write)
 322:	b8 10 00 00 00       	mov    $0x10,%eax
 327:	cd 40                	int    $0x40
 329:	c3                   	ret    

0000032a <close>:
SYSCALL(close)
 32a:	b8 15 00 00 00       	mov    $0x15,%eax
 32f:	cd 40                	int    $0x40
 331:	c3                   	ret    

00000332 <kill>:
SYSCALL(kill)
 332:	b8 06 00 00 00       	mov    $0x6,%eax
 337:	cd 40                	int    $0x40
 339:	c3                   	ret    

0000033a <exec>:
SYSCALL(exec)
 33a:	b8 07 00 00 00       	mov    $0x7,%eax
 33f:	cd 40                	int    $0x40
 341:	c3                   	ret    

00000342 <open>:
SYSCALL(open)
 342:	b8 0f 00 00 00       	mov    $0xf,%eax
 347:	cd 40                	int    $0x40
 349:	c3                   	ret    

0000034a <mknod>:
SYSCALL(mknod)
 34a:	b8 11 00 00 00       	mov    $0x11,%eax
 34f:	cd 40                	int    $0x40
 351:	c3                   	ret    

00000352 <unlink>:
SYSCALL(unlink)
 352:	b8 12 00 00 00       	mov    $0x12,%eax
 357:	cd 40                	int    $0x40
 359:	c3                   	ret    

0000035a <fstat>:
SYSCALL(fstat)
 35a:	b8 08 00 00 00       	mov    $0x8,%eax
 35f:	cd 40                	int    $0x40
 361:	c3                   	ret    

00000362 <link>:
SYSCALL(link)
 362:	b8 13 00 00 00       	mov    $0x13,%eax
 367:	cd 40                	int    $0x40
 369:	c3                   	ret    

0000036a <mkdir>:
SYSCALL(mkdir)
 36a:	b8 14 00 00 00       	mov    $0x14,%eax
 36f:	cd 40                	int    $0x40
 371:	c3                   	ret    

00000372 <chdir>:
SYSCALL(chdir)
 372:	b8 09 00 00 00       	mov    $0x9,%eax
 377:	cd 40                	int    $0x40
 379:	c3                   	ret    

0000037a <dup>:
SYSCALL(dup)
 37a:	b8 0a 00 00 00       	mov    $0xa,%eax
 37f:	cd 40                	int    $0x40
 381:	c3                   	ret    

00000382 <getpid>:
SYSCALL(getpid)
 382:	b8 0b 00 00 00       	mov    $0xb,%eax
 387:	cd 40                	int    $0x40
 389:	c3                   	ret    

0000038a <sbrk>:
SYSCALL(sbrk)
 38a:	b8 0c 00 00 00       	mov    $0xc,%eax
 38f:	cd 40                	int    $0x40
 391:	c3                   	ret    

00000392 <sleep>:
SYSCALL(sleep)
 392:	b8 0d 00 00 00       	mov    $0xd,%eax
 397:	cd 40                	int    $0x40
 399:	c3                   	ret    

0000039a <uptime>:
SYSCALL(uptime)
 39a:	b8 0e 00 00 00       	mov    $0xe,%eax
 39f:	cd 40                	int    $0x40
 3a1:	c3                   	ret    

000003a2 <clone>:
SYSCALL(clone)
 3a2:	b8 16 00 00 00       	mov    $0x16,%eax
 3a7:	cd 40                	int    $0x40
 3a9:	c3                   	ret    

000003aa <join>:
 3aa:	b8 17 00 00 00       	mov    $0x17,%eax
 3af:	cd 40                	int    $0x40
 3b1:	c3                   	ret    

000003b2 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 3b2:	55                   	push   %ebp
 3b3:	89 e5                	mov    %esp,%ebp
 3b5:	83 ec 1c             	sub    $0x1c,%esp
 3b8:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 3bb:	6a 01                	push   $0x1
 3bd:	8d 55 f4             	lea    -0xc(%ebp),%edx
 3c0:	52                   	push   %edx
 3c1:	50                   	push   %eax
 3c2:	e8 5b ff ff ff       	call   322 <write>
}
 3c7:	83 c4 10             	add    $0x10,%esp
 3ca:	c9                   	leave  
 3cb:	c3                   	ret    

000003cc <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 3cc:	55                   	push   %ebp
 3cd:	89 e5                	mov    %esp,%ebp
 3cf:	57                   	push   %edi
 3d0:	56                   	push   %esi
 3d1:	53                   	push   %ebx
 3d2:	83 ec 2c             	sub    $0x2c,%esp
 3d5:	89 45 d0             	mov    %eax,-0x30(%ebp)
 3d8:	89 d0                	mov    %edx,%eax
 3da:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 3dc:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 3e0:	0f 95 c1             	setne  %cl
 3e3:	c1 ea 1f             	shr    $0x1f,%edx
 3e6:	84 d1                	test   %dl,%cl
 3e8:	74 44                	je     42e <printint+0x62>
    neg = 1;
    x = -xx;
 3ea:	f7 d8                	neg    %eax
 3ec:	89 c1                	mov    %eax,%ecx
    neg = 1;
 3ee:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 3f5:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 3fa:	89 c8                	mov    %ecx,%eax
 3fc:	ba 00 00 00 00       	mov    $0x0,%edx
 401:	f7 f6                	div    %esi
 403:	89 df                	mov    %ebx,%edi
 405:	83 c3 01             	add    $0x1,%ebx
 408:	0f b6 92 78 07 00 00 	movzbl 0x778(%edx),%edx
 40f:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 413:	89 ca                	mov    %ecx,%edx
 415:	89 c1                	mov    %eax,%ecx
 417:	39 d6                	cmp    %edx,%esi
 419:	76 df                	jbe    3fa <printint+0x2e>
  if(neg)
 41b:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 41f:	74 31                	je     452 <printint+0x86>
    buf[i++] = '-';
 421:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 426:	8d 5f 02             	lea    0x2(%edi),%ebx
 429:	8b 75 d0             	mov    -0x30(%ebp),%esi
 42c:	eb 17                	jmp    445 <printint+0x79>
    x = xx;
 42e:	89 c1                	mov    %eax,%ecx
  neg = 0;
 430:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 437:	eb bc                	jmp    3f5 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 439:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 43e:	89 f0                	mov    %esi,%eax
 440:	e8 6d ff ff ff       	call   3b2 <putc>
  while(--i >= 0)
 445:	83 eb 01             	sub    $0x1,%ebx
 448:	79 ef                	jns    439 <printint+0x6d>
}
 44a:	83 c4 2c             	add    $0x2c,%esp
 44d:	5b                   	pop    %ebx
 44e:	5e                   	pop    %esi
 44f:	5f                   	pop    %edi
 450:	5d                   	pop    %ebp
 451:	c3                   	ret    
 452:	8b 75 d0             	mov    -0x30(%ebp),%esi
 455:	eb ee                	jmp    445 <printint+0x79>

00000457 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 457:	55                   	push   %ebp
 458:	89 e5                	mov    %esp,%ebp
 45a:	57                   	push   %edi
 45b:	56                   	push   %esi
 45c:	53                   	push   %ebx
 45d:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 460:	8d 45 10             	lea    0x10(%ebp),%eax
 463:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 466:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 46b:	bb 00 00 00 00       	mov    $0x0,%ebx
 470:	eb 14                	jmp    486 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 472:	89 fa                	mov    %edi,%edx
 474:	8b 45 08             	mov    0x8(%ebp),%eax
 477:	e8 36 ff ff ff       	call   3b2 <putc>
 47c:	eb 05                	jmp    483 <printf+0x2c>
      }
    } else if(state == '%'){
 47e:	83 fe 25             	cmp    $0x25,%esi
 481:	74 25                	je     4a8 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 483:	83 c3 01             	add    $0x1,%ebx
 486:	8b 45 0c             	mov    0xc(%ebp),%eax
 489:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 48d:	84 c0                	test   %al,%al
 48f:	0f 84 20 01 00 00    	je     5b5 <printf+0x15e>
    c = fmt[i] & 0xff;
 495:	0f be f8             	movsbl %al,%edi
 498:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 49b:	85 f6                	test   %esi,%esi
 49d:	75 df                	jne    47e <printf+0x27>
      if(c == '%'){
 49f:	83 f8 25             	cmp    $0x25,%eax
 4a2:	75 ce                	jne    472 <printf+0x1b>
        state = '%';
 4a4:	89 c6                	mov    %eax,%esi
 4a6:	eb db                	jmp    483 <printf+0x2c>
      if(c == 'd'){
 4a8:	83 f8 25             	cmp    $0x25,%eax
 4ab:	0f 84 cf 00 00 00    	je     580 <printf+0x129>
 4b1:	0f 8c dd 00 00 00    	jl     594 <printf+0x13d>
 4b7:	83 f8 78             	cmp    $0x78,%eax
 4ba:	0f 8f d4 00 00 00    	jg     594 <printf+0x13d>
 4c0:	83 f8 63             	cmp    $0x63,%eax
 4c3:	0f 8c cb 00 00 00    	jl     594 <printf+0x13d>
 4c9:	83 e8 63             	sub    $0x63,%eax
 4cc:	83 f8 15             	cmp    $0x15,%eax
 4cf:	0f 87 bf 00 00 00    	ja     594 <printf+0x13d>
 4d5:	ff 24 85 20 07 00 00 	jmp    *0x720(,%eax,4)
        printint(fd, *ap, 10, 1);
 4dc:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4df:	8b 17                	mov    (%edi),%edx
 4e1:	83 ec 0c             	sub    $0xc,%esp
 4e4:	6a 01                	push   $0x1
 4e6:	b9 0a 00 00 00       	mov    $0xa,%ecx
 4eb:	8b 45 08             	mov    0x8(%ebp),%eax
 4ee:	e8 d9 fe ff ff       	call   3cc <printint>
        ap++;
 4f3:	83 c7 04             	add    $0x4,%edi
 4f6:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 4f9:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 4fc:	be 00 00 00 00       	mov    $0x0,%esi
 501:	eb 80                	jmp    483 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 503:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 506:	8b 17                	mov    (%edi),%edx
 508:	83 ec 0c             	sub    $0xc,%esp
 50b:	6a 00                	push   $0x0
 50d:	b9 10 00 00 00       	mov    $0x10,%ecx
 512:	8b 45 08             	mov    0x8(%ebp),%eax
 515:	e8 b2 fe ff ff       	call   3cc <printint>
        ap++;
 51a:	83 c7 04             	add    $0x4,%edi
 51d:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 520:	83 c4 10             	add    $0x10,%esp
      state = 0;
 523:	be 00 00 00 00       	mov    $0x0,%esi
 528:	e9 56 ff ff ff       	jmp    483 <printf+0x2c>
        s = (char*)*ap;
 52d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 530:	8b 30                	mov    (%eax),%esi
        ap++;
 532:	83 c0 04             	add    $0x4,%eax
 535:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 538:	85 f6                	test   %esi,%esi
 53a:	75 15                	jne    551 <printf+0xfa>
          s = "(null)";
 53c:	be 18 07 00 00       	mov    $0x718,%esi
 541:	eb 0e                	jmp    551 <printf+0xfa>
          putc(fd, *s);
 543:	0f be d2             	movsbl %dl,%edx
 546:	8b 45 08             	mov    0x8(%ebp),%eax
 549:	e8 64 fe ff ff       	call   3b2 <putc>
          s++;
 54e:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 551:	0f b6 16             	movzbl (%esi),%edx
 554:	84 d2                	test   %dl,%dl
 556:	75 eb                	jne    543 <printf+0xec>
      state = 0;
 558:	be 00 00 00 00       	mov    $0x0,%esi
 55d:	e9 21 ff ff ff       	jmp    483 <printf+0x2c>
        putc(fd, *ap);
 562:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 565:	0f be 17             	movsbl (%edi),%edx
 568:	8b 45 08             	mov    0x8(%ebp),%eax
 56b:	e8 42 fe ff ff       	call   3b2 <putc>
        ap++;
 570:	83 c7 04             	add    $0x4,%edi
 573:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 576:	be 00 00 00 00       	mov    $0x0,%esi
 57b:	e9 03 ff ff ff       	jmp    483 <printf+0x2c>
        putc(fd, c);
 580:	89 fa                	mov    %edi,%edx
 582:	8b 45 08             	mov    0x8(%ebp),%eax
 585:	e8 28 fe ff ff       	call   3b2 <putc>
      state = 0;
 58a:	be 00 00 00 00       	mov    $0x0,%esi
 58f:	e9 ef fe ff ff       	jmp    483 <printf+0x2c>
        putc(fd, '%');
 594:	ba 25 00 00 00       	mov    $0x25,%edx
 599:	8b 45 08             	mov    0x8(%ebp),%eax
 59c:	e8 11 fe ff ff       	call   3b2 <putc>
        putc(fd, c);
 5a1:	89 fa                	mov    %edi,%edx
 5a3:	8b 45 08             	mov    0x8(%ebp),%eax
 5a6:	e8 07 fe ff ff       	call   3b2 <putc>
      state = 0;
 5ab:	be 00 00 00 00       	mov    $0x0,%esi
 5b0:	e9 ce fe ff ff       	jmp    483 <printf+0x2c>
    }
  }
}
 5b5:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5b8:	5b                   	pop    %ebx
 5b9:	5e                   	pop    %esi
 5ba:	5f                   	pop    %edi
 5bb:	5d                   	pop    %ebp
 5bc:	c3                   	ret    

000005bd <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5bd:	55                   	push   %ebp
 5be:	89 e5                	mov    %esp,%ebp
 5c0:	57                   	push   %edi
 5c1:	56                   	push   %esi
 5c2:	53                   	push   %ebx
 5c3:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 5c6:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5c9:	a1 00 0c 00 00       	mov    0xc00,%eax
 5ce:	eb 02                	jmp    5d2 <free+0x15>
 5d0:	89 d0                	mov    %edx,%eax
 5d2:	39 c8                	cmp    %ecx,%eax
 5d4:	73 04                	jae    5da <free+0x1d>
 5d6:	39 08                	cmp    %ecx,(%eax)
 5d8:	77 12                	ja     5ec <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5da:	8b 10                	mov    (%eax),%edx
 5dc:	39 c2                	cmp    %eax,%edx
 5de:	77 f0                	ja     5d0 <free+0x13>
 5e0:	39 c8                	cmp    %ecx,%eax
 5e2:	72 08                	jb     5ec <free+0x2f>
 5e4:	39 ca                	cmp    %ecx,%edx
 5e6:	77 04                	ja     5ec <free+0x2f>
 5e8:	89 d0                	mov    %edx,%eax
 5ea:	eb e6                	jmp    5d2 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 5ec:	8b 73 fc             	mov    -0x4(%ebx),%esi
 5ef:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 5f2:	8b 10                	mov    (%eax),%edx
 5f4:	39 d7                	cmp    %edx,%edi
 5f6:	74 19                	je     611 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 5f8:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 5fb:	8b 50 04             	mov    0x4(%eax),%edx
 5fe:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 601:	39 ce                	cmp    %ecx,%esi
 603:	74 1b                	je     620 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 605:	89 08                	mov    %ecx,(%eax)
  freep = p;
 607:	a3 00 0c 00 00       	mov    %eax,0xc00
}
 60c:	5b                   	pop    %ebx
 60d:	5e                   	pop    %esi
 60e:	5f                   	pop    %edi
 60f:	5d                   	pop    %ebp
 610:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 611:	03 72 04             	add    0x4(%edx),%esi
 614:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 617:	8b 10                	mov    (%eax),%edx
 619:	8b 12                	mov    (%edx),%edx
 61b:	89 53 f8             	mov    %edx,-0x8(%ebx)
 61e:	eb db                	jmp    5fb <free+0x3e>
    p->s.size += bp->s.size;
 620:	03 53 fc             	add    -0x4(%ebx),%edx
 623:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 626:	8b 53 f8             	mov    -0x8(%ebx),%edx
 629:	89 10                	mov    %edx,(%eax)
 62b:	eb da                	jmp    607 <free+0x4a>

0000062d <morecore>:

static Header*
morecore(uint nu)
{
 62d:	55                   	push   %ebp
 62e:	89 e5                	mov    %esp,%ebp
 630:	53                   	push   %ebx
 631:	83 ec 04             	sub    $0x4,%esp
 634:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 636:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 63b:	77 05                	ja     642 <morecore+0x15>
    nu = 4096;
 63d:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 642:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 649:	83 ec 0c             	sub    $0xc,%esp
 64c:	50                   	push   %eax
 64d:	e8 38 fd ff ff       	call   38a <sbrk>
  if(p == (char*)-1)
 652:	83 c4 10             	add    $0x10,%esp
 655:	83 f8 ff             	cmp    $0xffffffff,%eax
 658:	74 1c                	je     676 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 65a:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 65d:	83 c0 08             	add    $0x8,%eax
 660:	83 ec 0c             	sub    $0xc,%esp
 663:	50                   	push   %eax
 664:	e8 54 ff ff ff       	call   5bd <free>
  return freep;
 669:	a1 00 0c 00 00       	mov    0xc00,%eax
 66e:	83 c4 10             	add    $0x10,%esp
}
 671:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 674:	c9                   	leave  
 675:	c3                   	ret    
    return 0;
 676:	b8 00 00 00 00       	mov    $0x0,%eax
 67b:	eb f4                	jmp    671 <morecore+0x44>

0000067d <malloc>:

void*
malloc(uint nbytes)
{
 67d:	55                   	push   %ebp
 67e:	89 e5                	mov    %esp,%ebp
 680:	53                   	push   %ebx
 681:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 684:	8b 45 08             	mov    0x8(%ebp),%eax
 687:	8d 58 07             	lea    0x7(%eax),%ebx
 68a:	c1 eb 03             	shr    $0x3,%ebx
 68d:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 690:	8b 0d 00 0c 00 00    	mov    0xc00,%ecx
 696:	85 c9                	test   %ecx,%ecx
 698:	74 04                	je     69e <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 69a:	8b 01                	mov    (%ecx),%eax
 69c:	eb 4a                	jmp    6e8 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 69e:	c7 05 00 0c 00 00 04 	movl   $0xc04,0xc00
 6a5:	0c 00 00 
 6a8:	c7 05 04 0c 00 00 04 	movl   $0xc04,0xc04
 6af:	0c 00 00 
    base.s.size = 0;
 6b2:	c7 05 08 0c 00 00 00 	movl   $0x0,0xc08
 6b9:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 6bc:	b9 04 0c 00 00       	mov    $0xc04,%ecx
 6c1:	eb d7                	jmp    69a <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 6c3:	74 19                	je     6de <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 6c5:	29 da                	sub    %ebx,%edx
 6c7:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 6ca:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 6cd:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 6d0:	89 0d 00 0c 00 00    	mov    %ecx,0xc00
      return (void*)(p + 1);
 6d6:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 6d9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 6dc:	c9                   	leave  
 6dd:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 6de:	8b 10                	mov    (%eax),%edx
 6e0:	89 11                	mov    %edx,(%ecx)
 6e2:	eb ec                	jmp    6d0 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6e4:	89 c1                	mov    %eax,%ecx
 6e6:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 6e8:	8b 50 04             	mov    0x4(%eax),%edx
 6eb:	39 da                	cmp    %ebx,%edx
 6ed:	73 d4                	jae    6c3 <malloc+0x46>
    if(p == freep)
 6ef:	39 05 00 0c 00 00    	cmp    %eax,0xc00
 6f5:	75 ed                	jne    6e4 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 6f7:	89 d8                	mov    %ebx,%eax
 6f9:	e8 2f ff ff ff       	call   62d <morecore>
 6fe:	85 c0                	test   %eax,%eax
 700:	75 e2                	jne    6e4 <malloc+0x67>
 702:	eb d5                	jmp    6d9 <malloc+0x5c>
