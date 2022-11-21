
_zombie:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(void)
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
   e:	83 ec 04             	sub    $0x4,%esp
  if(fork() > 0)
  11:	e8 af 02 00 00       	call   2c5 <fork>
  16:	85 c0                	test   %eax,%eax
  18:	7f 05                	jg     1f <main+0x1f>
    sleep(5);  // Let child exit before parent.
  exit();
  1a:	e8 ae 02 00 00       	call   2cd <exit>
    sleep(5);  // Let child exit before parent.
  1f:	83 ec 0c             	sub    $0xc,%esp
  22:	6a 05                	push   $0x5
  24:	e8 34 03 00 00       	call   35d <sleep>
  29:	83 c4 10             	add    $0x10,%esp
  2c:	eb ec                	jmp    1a <main+0x1a>

0000002e <test_and_set>:
  int flag;
};

struct thread_ref *threads[64];

int test_and_set(int *old_ptr, int new_ptr) {
  2e:	55                   	push   %ebp
  2f:	89 e5                	mov    %esp,%ebp
  31:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *old_ptr;
  34:	8b 10                	mov    (%eax),%edx
  *old_ptr = new_ptr;
  36:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  39:	89 08                	mov    %ecx,(%eax)
  return old;
}
  3b:	89 d0                	mov    %edx,%eax
  3d:	5d                   	pop    %ebp
  3e:	c3                   	ret    

0000003f <thread_create>:

// a wrapper func for clone
int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
  3f:	55                   	push   %ebp
  40:	89 e5                	mov    %esp,%ebp
  42:	53                   	push   %ebx
  43:	83 ec 10             	sub    $0x10,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE*2);
  46:	68 00 20 00 00       	push   $0x2000
  4b:	e8 f8 05 00 00       	call   648 <malloc>
  if(n_stack == 0){
  50:	83 c4 10             	add    $0x10,%esp
  53:	85 c0                	test   %eax,%eax
  55:	74 41                	je     98 <thread_create+0x59>
  57:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  int new_pid = clone(start_routine, arg1, arg2, n_stack);
  59:	50                   	push   %eax
  5a:	ff 75 10             	push   0x10(%ebp)
  5d:	ff 75 0c             	push   0xc(%ebp)
  60:	ff 75 08             	push   0x8(%ebp)
  63:	e8 05 03 00 00       	call   36d <clone>

  for(int i=0; i<64; i++){
  68:	83 c4 10             	add    $0x10,%esp
  6b:	ba 00 00 00 00       	mov    $0x0,%edx
  70:	eb 03                	jmp    75 <thread_create+0x36>
  72:	83 c2 01             	add    $0x1,%edx
  75:	83 fa 3f             	cmp    $0x3f,%edx
  78:	7f 19                	jg     93 <thread_create+0x54>
    if(threads[i]->flag==0){
  7a:	8b 0c 95 c0 0a 00 00 	mov    0xac0(,%edx,4),%ecx
  81:	83 79 08 00          	cmpl   $0x0,0x8(%ecx)
  85:	75 eb                	jne    72 <thread_create+0x33>
      threads[i]->maddr = n_stack;
  87:	89 19                	mov    %ebx,(%ecx)
      threads[i]->pg1addr = n_stack;
  89:	8b 14 95 c0 0a 00 00 	mov    0xac0(,%edx,4),%edx
  90:	89 5a 04             	mov    %ebx,0x4(%edx)
      break;
    }
  }

  return new_pid;
}
  93:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  96:	c9                   	leave  
  97:	c3                   	ret    
    return -1;
  98:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  9d:	eb f4                	jmp    93 <thread_create+0x54>

0000009f <thread_join>:

//TODO: fix
int thread_join() {
  9f:	55                   	push   %ebp
  a0:	89 e5                	mov    %esp,%ebp
  a2:	56                   	push   %esi
  a3:	53                   	push   %ebx
  a4:	83 ec 1c             	sub    $0x1c,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
  a7:	8d 45 f4             	lea    -0xc(%ebp),%eax
  aa:	50                   	push   %eax
  ab:	e8 c5 02 00 00       	call   375 <join>
  b0:	89 c6                	mov    %eax,%esi
  for(int i=0; i<64; i++){
  b2:	83 c4 10             	add    $0x10,%esp
  b5:	bb 00 00 00 00       	mov    $0x0,%ebx
  ba:	eb 03                	jmp    bf <thread_join+0x20>
  bc:	83 c3 01             	add    $0x1,%ebx
  bf:	83 fb 3f             	cmp    $0x3f,%ebx
  c2:	7f 23                	jg     e7 <thread_join+0x48>
    if((threads[i]->flag==1) && (stk_addr == threads[i]->pg1addr)){
  c4:	8b 04 9d c0 0a 00 00 	mov    0xac0(,%ebx,4),%eax
  cb:	83 78 08 01          	cmpl   $0x1,0x8(%eax)
  cf:	75 eb                	jne    bc <thread_join+0x1d>
  d1:	8b 55 f4             	mov    -0xc(%ebp),%edx
  d4:	39 50 04             	cmp    %edx,0x4(%eax)
  d7:	75 e3                	jne    bc <thread_join+0x1d>
      free(stk_addr);
  d9:	83 ec 0c             	sub    $0xc,%esp
  dc:	52                   	push   %edx
  dd:	e8 a6 04 00 00       	call   588 <free>
  e2:	83 c4 10             	add    $0x10,%esp
  e5:	eb d5                	jmp    bc <thread_join+0x1d>
    }
  }
  return pid;
}
  e7:	89 f0                	mov    %esi,%eax
  e9:	8d 65 f8             	lea    -0x8(%ebp),%esp
  ec:	5b                   	pop    %ebx
  ed:	5e                   	pop    %esi
  ee:	5d                   	pop    %ebp
  ef:	c3                   	ret    

000000f0 <lock_acquire>:

void lock_acquire(lock_t *lock){
  f0:	55                   	push   %ebp
  f1:	89 e5                	mov    %esp,%ebp
  f3:	53                   	push   %ebx
  f4:	83 ec 04             	sub    $0x4,%esp
  f7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
  fa:	83 ec 08             	sub    $0x8,%esp
  fd:	6a 01                	push   $0x1
  ff:	53                   	push   %ebx
 100:	e8 29 ff ff ff       	call   2e <test_and_set>
 105:	83 c4 10             	add    $0x10,%esp
 108:	83 f8 01             	cmp    $0x1,%eax
 10b:	74 ed                	je     fa <lock_acquire+0xa>
    ;
}
 10d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 110:	c9                   	leave  
 111:	c3                   	ret    

00000112 <lock_release>:

void lock_release(lock_t *lock) {
 112:	55                   	push   %ebp
 113:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 115:	8b 45 08             	mov    0x8(%ebp),%eax
 118:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 11e:	5d                   	pop    %ebp
 11f:	c3                   	ret    

00000120 <lock_init>:

void lock_init(lock_t *lock) {
 120:	55                   	push   %ebp
 121:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 123:	8b 45 08             	mov    0x8(%ebp),%eax
 126:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 12c:	5d                   	pop    %ebp
 12d:	c3                   	ret    

0000012e <strcpy>:

char*
strcpy(char *s, const char *t)
{
 12e:	55                   	push   %ebp
 12f:	89 e5                	mov    %esp,%ebp
 131:	56                   	push   %esi
 132:	53                   	push   %ebx
 133:	8b 75 08             	mov    0x8(%ebp),%esi
 136:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 139:	89 f0                	mov    %esi,%eax
 13b:	89 d1                	mov    %edx,%ecx
 13d:	83 c2 01             	add    $0x1,%edx
 140:	89 c3                	mov    %eax,%ebx
 142:	83 c0 01             	add    $0x1,%eax
 145:	0f b6 09             	movzbl (%ecx),%ecx
 148:	88 0b                	mov    %cl,(%ebx)
 14a:	84 c9                	test   %cl,%cl
 14c:	75 ed                	jne    13b <strcpy+0xd>
    ;
  return os;
}
 14e:	89 f0                	mov    %esi,%eax
 150:	5b                   	pop    %ebx
 151:	5e                   	pop    %esi
 152:	5d                   	pop    %ebp
 153:	c3                   	ret    

00000154 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 154:	55                   	push   %ebp
 155:	89 e5                	mov    %esp,%ebp
 157:	8b 4d 08             	mov    0x8(%ebp),%ecx
 15a:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 15d:	eb 06                	jmp    165 <strcmp+0x11>
    p++, q++;
 15f:	83 c1 01             	add    $0x1,%ecx
 162:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 165:	0f b6 01             	movzbl (%ecx),%eax
 168:	84 c0                	test   %al,%al
 16a:	74 04                	je     170 <strcmp+0x1c>
 16c:	3a 02                	cmp    (%edx),%al
 16e:	74 ef                	je     15f <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 170:	0f b6 c0             	movzbl %al,%eax
 173:	0f b6 12             	movzbl (%edx),%edx
 176:	29 d0                	sub    %edx,%eax
}
 178:	5d                   	pop    %ebp
 179:	c3                   	ret    

0000017a <strlen>:

uint
strlen(const char *s)
{
 17a:	55                   	push   %ebp
 17b:	89 e5                	mov    %esp,%ebp
 17d:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 180:	b8 00 00 00 00       	mov    $0x0,%eax
 185:	eb 03                	jmp    18a <strlen+0x10>
 187:	83 c0 01             	add    $0x1,%eax
 18a:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 18e:	75 f7                	jne    187 <strlen+0xd>
    ;
  return n;
}
 190:	5d                   	pop    %ebp
 191:	c3                   	ret    

00000192 <memset>:

void*
memset(void *dst, int c, uint n)
{
 192:	55                   	push   %ebp
 193:	89 e5                	mov    %esp,%ebp
 195:	57                   	push   %edi
 196:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 199:	89 d7                	mov    %edx,%edi
 19b:	8b 4d 10             	mov    0x10(%ebp),%ecx
 19e:	8b 45 0c             	mov    0xc(%ebp),%eax
 1a1:	fc                   	cld    
 1a2:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1a4:	89 d0                	mov    %edx,%eax
 1a6:	8b 7d fc             	mov    -0x4(%ebp),%edi
 1a9:	c9                   	leave  
 1aa:	c3                   	ret    

000001ab <strchr>:

char*
strchr(const char *s, char c)
{
 1ab:	55                   	push   %ebp
 1ac:	89 e5                	mov    %esp,%ebp
 1ae:	8b 45 08             	mov    0x8(%ebp),%eax
 1b1:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1b5:	eb 03                	jmp    1ba <strchr+0xf>
 1b7:	83 c0 01             	add    $0x1,%eax
 1ba:	0f b6 10             	movzbl (%eax),%edx
 1bd:	84 d2                	test   %dl,%dl
 1bf:	74 06                	je     1c7 <strchr+0x1c>
    if(*s == c)
 1c1:	38 ca                	cmp    %cl,%dl
 1c3:	75 f2                	jne    1b7 <strchr+0xc>
 1c5:	eb 05                	jmp    1cc <strchr+0x21>
      return (char*)s;
  return 0;
 1c7:	b8 00 00 00 00       	mov    $0x0,%eax
}
 1cc:	5d                   	pop    %ebp
 1cd:	c3                   	ret    

000001ce <gets>:

char*
gets(char *buf, int max)
{
 1ce:	55                   	push   %ebp
 1cf:	89 e5                	mov    %esp,%ebp
 1d1:	57                   	push   %edi
 1d2:	56                   	push   %esi
 1d3:	53                   	push   %ebx
 1d4:	83 ec 1c             	sub    $0x1c,%esp
 1d7:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1da:	bb 00 00 00 00       	mov    $0x0,%ebx
 1df:	89 de                	mov    %ebx,%esi
 1e1:	83 c3 01             	add    $0x1,%ebx
 1e4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1e7:	7d 2e                	jge    217 <gets+0x49>
    cc = read(0, &c, 1);
 1e9:	83 ec 04             	sub    $0x4,%esp
 1ec:	6a 01                	push   $0x1
 1ee:	8d 45 e7             	lea    -0x19(%ebp),%eax
 1f1:	50                   	push   %eax
 1f2:	6a 00                	push   $0x0
 1f4:	e8 ec 00 00 00       	call   2e5 <read>
    if(cc < 1)
 1f9:	83 c4 10             	add    $0x10,%esp
 1fc:	85 c0                	test   %eax,%eax
 1fe:	7e 17                	jle    217 <gets+0x49>
      break;
    buf[i++] = c;
 200:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 204:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 207:	3c 0a                	cmp    $0xa,%al
 209:	0f 94 c2             	sete   %dl
 20c:	3c 0d                	cmp    $0xd,%al
 20e:	0f 94 c0             	sete   %al
 211:	08 c2                	or     %al,%dl
 213:	74 ca                	je     1df <gets+0x11>
    buf[i++] = c;
 215:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 217:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 21b:	89 f8                	mov    %edi,%eax
 21d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 220:	5b                   	pop    %ebx
 221:	5e                   	pop    %esi
 222:	5f                   	pop    %edi
 223:	5d                   	pop    %ebp
 224:	c3                   	ret    

00000225 <stat>:

int
stat(const char *n, struct stat *st)
{
 225:	55                   	push   %ebp
 226:	89 e5                	mov    %esp,%ebp
 228:	56                   	push   %esi
 229:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 22a:	83 ec 08             	sub    $0x8,%esp
 22d:	6a 00                	push   $0x0
 22f:	ff 75 08             	push   0x8(%ebp)
 232:	e8 d6 00 00 00       	call   30d <open>
  if(fd < 0)
 237:	83 c4 10             	add    $0x10,%esp
 23a:	85 c0                	test   %eax,%eax
 23c:	78 24                	js     262 <stat+0x3d>
 23e:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 240:	83 ec 08             	sub    $0x8,%esp
 243:	ff 75 0c             	push   0xc(%ebp)
 246:	50                   	push   %eax
 247:	e8 d9 00 00 00       	call   325 <fstat>
 24c:	89 c6                	mov    %eax,%esi
  close(fd);
 24e:	89 1c 24             	mov    %ebx,(%esp)
 251:	e8 9f 00 00 00       	call   2f5 <close>
  return r;
 256:	83 c4 10             	add    $0x10,%esp
}
 259:	89 f0                	mov    %esi,%eax
 25b:	8d 65 f8             	lea    -0x8(%ebp),%esp
 25e:	5b                   	pop    %ebx
 25f:	5e                   	pop    %esi
 260:	5d                   	pop    %ebp
 261:	c3                   	ret    
    return -1;
 262:	be ff ff ff ff       	mov    $0xffffffff,%esi
 267:	eb f0                	jmp    259 <stat+0x34>

00000269 <atoi>:

int
atoi(const char *s)
{
 269:	55                   	push   %ebp
 26a:	89 e5                	mov    %esp,%ebp
 26c:	53                   	push   %ebx
 26d:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 270:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 275:	eb 10                	jmp    287 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 277:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 27a:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 27d:	83 c1 01             	add    $0x1,%ecx
 280:	0f be c0             	movsbl %al,%eax
 283:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 287:	0f b6 01             	movzbl (%ecx),%eax
 28a:	8d 58 d0             	lea    -0x30(%eax),%ebx
 28d:	80 fb 09             	cmp    $0x9,%bl
 290:	76 e5                	jbe    277 <atoi+0xe>
  return n;
}
 292:	89 d0                	mov    %edx,%eax
 294:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 297:	c9                   	leave  
 298:	c3                   	ret    

00000299 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 299:	55                   	push   %ebp
 29a:	89 e5                	mov    %esp,%ebp
 29c:	56                   	push   %esi
 29d:	53                   	push   %ebx
 29e:	8b 75 08             	mov    0x8(%ebp),%esi
 2a1:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 2a4:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 2a7:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 2a9:	eb 0d                	jmp    2b8 <memmove+0x1f>
    *dst++ = *src++;
 2ab:	0f b6 01             	movzbl (%ecx),%eax
 2ae:	88 02                	mov    %al,(%edx)
 2b0:	8d 49 01             	lea    0x1(%ecx),%ecx
 2b3:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 2b6:	89 d8                	mov    %ebx,%eax
 2b8:	8d 58 ff             	lea    -0x1(%eax),%ebx
 2bb:	85 c0                	test   %eax,%eax
 2bd:	7f ec                	jg     2ab <memmove+0x12>
  return vdst;
}
 2bf:	89 f0                	mov    %esi,%eax
 2c1:	5b                   	pop    %ebx
 2c2:	5e                   	pop    %esi
 2c3:	5d                   	pop    %ebp
 2c4:	c3                   	ret    

000002c5 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2c5:	b8 01 00 00 00       	mov    $0x1,%eax
 2ca:	cd 40                	int    $0x40
 2cc:	c3                   	ret    

000002cd <exit>:
SYSCALL(exit)
 2cd:	b8 02 00 00 00       	mov    $0x2,%eax
 2d2:	cd 40                	int    $0x40
 2d4:	c3                   	ret    

000002d5 <wait>:
SYSCALL(wait)
 2d5:	b8 03 00 00 00       	mov    $0x3,%eax
 2da:	cd 40                	int    $0x40
 2dc:	c3                   	ret    

000002dd <pipe>:
SYSCALL(pipe)
 2dd:	b8 04 00 00 00       	mov    $0x4,%eax
 2e2:	cd 40                	int    $0x40
 2e4:	c3                   	ret    

000002e5 <read>:
SYSCALL(read)
 2e5:	b8 05 00 00 00       	mov    $0x5,%eax
 2ea:	cd 40                	int    $0x40
 2ec:	c3                   	ret    

000002ed <write>:
SYSCALL(write)
 2ed:	b8 10 00 00 00       	mov    $0x10,%eax
 2f2:	cd 40                	int    $0x40
 2f4:	c3                   	ret    

000002f5 <close>:
SYSCALL(close)
 2f5:	b8 15 00 00 00       	mov    $0x15,%eax
 2fa:	cd 40                	int    $0x40
 2fc:	c3                   	ret    

000002fd <kill>:
SYSCALL(kill)
 2fd:	b8 06 00 00 00       	mov    $0x6,%eax
 302:	cd 40                	int    $0x40
 304:	c3                   	ret    

00000305 <exec>:
SYSCALL(exec)
 305:	b8 07 00 00 00       	mov    $0x7,%eax
 30a:	cd 40                	int    $0x40
 30c:	c3                   	ret    

0000030d <open>:
SYSCALL(open)
 30d:	b8 0f 00 00 00       	mov    $0xf,%eax
 312:	cd 40                	int    $0x40
 314:	c3                   	ret    

00000315 <mknod>:
SYSCALL(mknod)
 315:	b8 11 00 00 00       	mov    $0x11,%eax
 31a:	cd 40                	int    $0x40
 31c:	c3                   	ret    

0000031d <unlink>:
SYSCALL(unlink)
 31d:	b8 12 00 00 00       	mov    $0x12,%eax
 322:	cd 40                	int    $0x40
 324:	c3                   	ret    

00000325 <fstat>:
SYSCALL(fstat)
 325:	b8 08 00 00 00       	mov    $0x8,%eax
 32a:	cd 40                	int    $0x40
 32c:	c3                   	ret    

0000032d <link>:
SYSCALL(link)
 32d:	b8 13 00 00 00       	mov    $0x13,%eax
 332:	cd 40                	int    $0x40
 334:	c3                   	ret    

00000335 <mkdir>:
SYSCALL(mkdir)
 335:	b8 14 00 00 00       	mov    $0x14,%eax
 33a:	cd 40                	int    $0x40
 33c:	c3                   	ret    

0000033d <chdir>:
SYSCALL(chdir)
 33d:	b8 09 00 00 00       	mov    $0x9,%eax
 342:	cd 40                	int    $0x40
 344:	c3                   	ret    

00000345 <dup>:
SYSCALL(dup)
 345:	b8 0a 00 00 00       	mov    $0xa,%eax
 34a:	cd 40                	int    $0x40
 34c:	c3                   	ret    

0000034d <getpid>:
SYSCALL(getpid)
 34d:	b8 0b 00 00 00       	mov    $0xb,%eax
 352:	cd 40                	int    $0x40
 354:	c3                   	ret    

00000355 <sbrk>:
SYSCALL(sbrk)
 355:	b8 0c 00 00 00       	mov    $0xc,%eax
 35a:	cd 40                	int    $0x40
 35c:	c3                   	ret    

0000035d <sleep>:
SYSCALL(sleep)
 35d:	b8 0d 00 00 00       	mov    $0xd,%eax
 362:	cd 40                	int    $0x40
 364:	c3                   	ret    

00000365 <uptime>:
SYSCALL(uptime)
 365:	b8 0e 00 00 00       	mov    $0xe,%eax
 36a:	cd 40                	int    $0x40
 36c:	c3                   	ret    

0000036d <clone>:
SYSCALL(clone)
 36d:	b8 16 00 00 00       	mov    $0x16,%eax
 372:	cd 40                	int    $0x40
 374:	c3                   	ret    

00000375 <join>:
 375:	b8 17 00 00 00       	mov    $0x17,%eax
 37a:	cd 40                	int    $0x40
 37c:	c3                   	ret    

0000037d <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 37d:	55                   	push   %ebp
 37e:	89 e5                	mov    %esp,%ebp
 380:	83 ec 1c             	sub    $0x1c,%esp
 383:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 386:	6a 01                	push   $0x1
 388:	8d 55 f4             	lea    -0xc(%ebp),%edx
 38b:	52                   	push   %edx
 38c:	50                   	push   %eax
 38d:	e8 5b ff ff ff       	call   2ed <write>
}
 392:	83 c4 10             	add    $0x10,%esp
 395:	c9                   	leave  
 396:	c3                   	ret    

00000397 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 397:	55                   	push   %ebp
 398:	89 e5                	mov    %esp,%ebp
 39a:	57                   	push   %edi
 39b:	56                   	push   %esi
 39c:	53                   	push   %ebx
 39d:	83 ec 2c             	sub    $0x2c,%esp
 3a0:	89 45 d0             	mov    %eax,-0x30(%ebp)
 3a3:	89 d0                	mov    %edx,%eax
 3a5:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 3a7:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 3ab:	0f 95 c1             	setne  %cl
 3ae:	c1 ea 1f             	shr    $0x1f,%edx
 3b1:	84 d1                	test   %dl,%cl
 3b3:	74 44                	je     3f9 <printint+0x62>
    neg = 1;
    x = -xx;
 3b5:	f7 d8                	neg    %eax
 3b7:	89 c1                	mov    %eax,%ecx
    neg = 1;
 3b9:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 3c0:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 3c5:	89 c8                	mov    %ecx,%eax
 3c7:	ba 00 00 00 00       	mov    $0x0,%edx
 3cc:	f7 f6                	div    %esi
 3ce:	89 df                	mov    %ebx,%edi
 3d0:	83 c3 01             	add    $0x1,%ebx
 3d3:	0f b6 92 30 07 00 00 	movzbl 0x730(%edx),%edx
 3da:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 3de:	89 ca                	mov    %ecx,%edx
 3e0:	89 c1                	mov    %eax,%ecx
 3e2:	39 d6                	cmp    %edx,%esi
 3e4:	76 df                	jbe    3c5 <printint+0x2e>
  if(neg)
 3e6:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 3ea:	74 31                	je     41d <printint+0x86>
    buf[i++] = '-';
 3ec:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 3f1:	8d 5f 02             	lea    0x2(%edi),%ebx
 3f4:	8b 75 d0             	mov    -0x30(%ebp),%esi
 3f7:	eb 17                	jmp    410 <printint+0x79>
    x = xx;
 3f9:	89 c1                	mov    %eax,%ecx
  neg = 0;
 3fb:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 402:	eb bc                	jmp    3c0 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 404:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 409:	89 f0                	mov    %esi,%eax
 40b:	e8 6d ff ff ff       	call   37d <putc>
  while(--i >= 0)
 410:	83 eb 01             	sub    $0x1,%ebx
 413:	79 ef                	jns    404 <printint+0x6d>
}
 415:	83 c4 2c             	add    $0x2c,%esp
 418:	5b                   	pop    %ebx
 419:	5e                   	pop    %esi
 41a:	5f                   	pop    %edi
 41b:	5d                   	pop    %ebp
 41c:	c3                   	ret    
 41d:	8b 75 d0             	mov    -0x30(%ebp),%esi
 420:	eb ee                	jmp    410 <printint+0x79>

00000422 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 422:	55                   	push   %ebp
 423:	89 e5                	mov    %esp,%ebp
 425:	57                   	push   %edi
 426:	56                   	push   %esi
 427:	53                   	push   %ebx
 428:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 42b:	8d 45 10             	lea    0x10(%ebp),%eax
 42e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 431:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 436:	bb 00 00 00 00       	mov    $0x0,%ebx
 43b:	eb 14                	jmp    451 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 43d:	89 fa                	mov    %edi,%edx
 43f:	8b 45 08             	mov    0x8(%ebp),%eax
 442:	e8 36 ff ff ff       	call   37d <putc>
 447:	eb 05                	jmp    44e <printf+0x2c>
      }
    } else if(state == '%'){
 449:	83 fe 25             	cmp    $0x25,%esi
 44c:	74 25                	je     473 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 44e:	83 c3 01             	add    $0x1,%ebx
 451:	8b 45 0c             	mov    0xc(%ebp),%eax
 454:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 458:	84 c0                	test   %al,%al
 45a:	0f 84 20 01 00 00    	je     580 <printf+0x15e>
    c = fmt[i] & 0xff;
 460:	0f be f8             	movsbl %al,%edi
 463:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 466:	85 f6                	test   %esi,%esi
 468:	75 df                	jne    449 <printf+0x27>
      if(c == '%'){
 46a:	83 f8 25             	cmp    $0x25,%eax
 46d:	75 ce                	jne    43d <printf+0x1b>
        state = '%';
 46f:	89 c6                	mov    %eax,%esi
 471:	eb db                	jmp    44e <printf+0x2c>
      if(c == 'd'){
 473:	83 f8 25             	cmp    $0x25,%eax
 476:	0f 84 cf 00 00 00    	je     54b <printf+0x129>
 47c:	0f 8c dd 00 00 00    	jl     55f <printf+0x13d>
 482:	83 f8 78             	cmp    $0x78,%eax
 485:	0f 8f d4 00 00 00    	jg     55f <printf+0x13d>
 48b:	83 f8 63             	cmp    $0x63,%eax
 48e:	0f 8c cb 00 00 00    	jl     55f <printf+0x13d>
 494:	83 e8 63             	sub    $0x63,%eax
 497:	83 f8 15             	cmp    $0x15,%eax
 49a:	0f 87 bf 00 00 00    	ja     55f <printf+0x13d>
 4a0:	ff 24 85 d8 06 00 00 	jmp    *0x6d8(,%eax,4)
        printint(fd, *ap, 10, 1);
 4a7:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4aa:	8b 17                	mov    (%edi),%edx
 4ac:	83 ec 0c             	sub    $0xc,%esp
 4af:	6a 01                	push   $0x1
 4b1:	b9 0a 00 00 00       	mov    $0xa,%ecx
 4b6:	8b 45 08             	mov    0x8(%ebp),%eax
 4b9:	e8 d9 fe ff ff       	call   397 <printint>
        ap++;
 4be:	83 c7 04             	add    $0x4,%edi
 4c1:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 4c4:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 4c7:	be 00 00 00 00       	mov    $0x0,%esi
 4cc:	eb 80                	jmp    44e <printf+0x2c>
        printint(fd, *ap, 16, 0);
 4ce:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4d1:	8b 17                	mov    (%edi),%edx
 4d3:	83 ec 0c             	sub    $0xc,%esp
 4d6:	6a 00                	push   $0x0
 4d8:	b9 10 00 00 00       	mov    $0x10,%ecx
 4dd:	8b 45 08             	mov    0x8(%ebp),%eax
 4e0:	e8 b2 fe ff ff       	call   397 <printint>
        ap++;
 4e5:	83 c7 04             	add    $0x4,%edi
 4e8:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 4eb:	83 c4 10             	add    $0x10,%esp
      state = 0;
 4ee:	be 00 00 00 00       	mov    $0x0,%esi
 4f3:	e9 56 ff ff ff       	jmp    44e <printf+0x2c>
        s = (char*)*ap;
 4f8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 4fb:	8b 30                	mov    (%eax),%esi
        ap++;
 4fd:	83 c0 04             	add    $0x4,%eax
 500:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 503:	85 f6                	test   %esi,%esi
 505:	75 15                	jne    51c <printf+0xfa>
          s = "(null)";
 507:	be d0 06 00 00       	mov    $0x6d0,%esi
 50c:	eb 0e                	jmp    51c <printf+0xfa>
          putc(fd, *s);
 50e:	0f be d2             	movsbl %dl,%edx
 511:	8b 45 08             	mov    0x8(%ebp),%eax
 514:	e8 64 fe ff ff       	call   37d <putc>
          s++;
 519:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 51c:	0f b6 16             	movzbl (%esi),%edx
 51f:	84 d2                	test   %dl,%dl
 521:	75 eb                	jne    50e <printf+0xec>
      state = 0;
 523:	be 00 00 00 00       	mov    $0x0,%esi
 528:	e9 21 ff ff ff       	jmp    44e <printf+0x2c>
        putc(fd, *ap);
 52d:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 530:	0f be 17             	movsbl (%edi),%edx
 533:	8b 45 08             	mov    0x8(%ebp),%eax
 536:	e8 42 fe ff ff       	call   37d <putc>
        ap++;
 53b:	83 c7 04             	add    $0x4,%edi
 53e:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 541:	be 00 00 00 00       	mov    $0x0,%esi
 546:	e9 03 ff ff ff       	jmp    44e <printf+0x2c>
        putc(fd, c);
 54b:	89 fa                	mov    %edi,%edx
 54d:	8b 45 08             	mov    0x8(%ebp),%eax
 550:	e8 28 fe ff ff       	call   37d <putc>
      state = 0;
 555:	be 00 00 00 00       	mov    $0x0,%esi
 55a:	e9 ef fe ff ff       	jmp    44e <printf+0x2c>
        putc(fd, '%');
 55f:	ba 25 00 00 00       	mov    $0x25,%edx
 564:	8b 45 08             	mov    0x8(%ebp),%eax
 567:	e8 11 fe ff ff       	call   37d <putc>
        putc(fd, c);
 56c:	89 fa                	mov    %edi,%edx
 56e:	8b 45 08             	mov    0x8(%ebp),%eax
 571:	e8 07 fe ff ff       	call   37d <putc>
      state = 0;
 576:	be 00 00 00 00       	mov    $0x0,%esi
 57b:	e9 ce fe ff ff       	jmp    44e <printf+0x2c>
    }
  }
}
 580:	8d 65 f4             	lea    -0xc(%ebp),%esp
 583:	5b                   	pop    %ebx
 584:	5e                   	pop    %esi
 585:	5f                   	pop    %edi
 586:	5d                   	pop    %ebp
 587:	c3                   	ret    

00000588 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 588:	55                   	push   %ebp
 589:	89 e5                	mov    %esp,%ebp
 58b:	57                   	push   %edi
 58c:	56                   	push   %esi
 58d:	53                   	push   %ebx
 58e:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 591:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 594:	a1 c0 0b 00 00       	mov    0xbc0,%eax
 599:	eb 02                	jmp    59d <free+0x15>
 59b:	89 d0                	mov    %edx,%eax
 59d:	39 c8                	cmp    %ecx,%eax
 59f:	73 04                	jae    5a5 <free+0x1d>
 5a1:	39 08                	cmp    %ecx,(%eax)
 5a3:	77 12                	ja     5b7 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5a5:	8b 10                	mov    (%eax),%edx
 5a7:	39 c2                	cmp    %eax,%edx
 5a9:	77 f0                	ja     59b <free+0x13>
 5ab:	39 c8                	cmp    %ecx,%eax
 5ad:	72 08                	jb     5b7 <free+0x2f>
 5af:	39 ca                	cmp    %ecx,%edx
 5b1:	77 04                	ja     5b7 <free+0x2f>
 5b3:	89 d0                	mov    %edx,%eax
 5b5:	eb e6                	jmp    59d <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 5b7:	8b 73 fc             	mov    -0x4(%ebx),%esi
 5ba:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 5bd:	8b 10                	mov    (%eax),%edx
 5bf:	39 d7                	cmp    %edx,%edi
 5c1:	74 19                	je     5dc <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 5c3:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 5c6:	8b 50 04             	mov    0x4(%eax),%edx
 5c9:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 5cc:	39 ce                	cmp    %ecx,%esi
 5ce:	74 1b                	je     5eb <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 5d0:	89 08                	mov    %ecx,(%eax)
  freep = p;
 5d2:	a3 c0 0b 00 00       	mov    %eax,0xbc0
}
 5d7:	5b                   	pop    %ebx
 5d8:	5e                   	pop    %esi
 5d9:	5f                   	pop    %edi
 5da:	5d                   	pop    %ebp
 5db:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 5dc:	03 72 04             	add    0x4(%edx),%esi
 5df:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 5e2:	8b 10                	mov    (%eax),%edx
 5e4:	8b 12                	mov    (%edx),%edx
 5e6:	89 53 f8             	mov    %edx,-0x8(%ebx)
 5e9:	eb db                	jmp    5c6 <free+0x3e>
    p->s.size += bp->s.size;
 5eb:	03 53 fc             	add    -0x4(%ebx),%edx
 5ee:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 5f1:	8b 53 f8             	mov    -0x8(%ebx),%edx
 5f4:	89 10                	mov    %edx,(%eax)
 5f6:	eb da                	jmp    5d2 <free+0x4a>

000005f8 <morecore>:

static Header*
morecore(uint nu)
{
 5f8:	55                   	push   %ebp
 5f9:	89 e5                	mov    %esp,%ebp
 5fb:	53                   	push   %ebx
 5fc:	83 ec 04             	sub    $0x4,%esp
 5ff:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 601:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 606:	77 05                	ja     60d <morecore+0x15>
    nu = 4096;
 608:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 60d:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 614:	83 ec 0c             	sub    $0xc,%esp
 617:	50                   	push   %eax
 618:	e8 38 fd ff ff       	call   355 <sbrk>
  if(p == (char*)-1)
 61d:	83 c4 10             	add    $0x10,%esp
 620:	83 f8 ff             	cmp    $0xffffffff,%eax
 623:	74 1c                	je     641 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 625:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 628:	83 c0 08             	add    $0x8,%eax
 62b:	83 ec 0c             	sub    $0xc,%esp
 62e:	50                   	push   %eax
 62f:	e8 54 ff ff ff       	call   588 <free>
  return freep;
 634:	a1 c0 0b 00 00       	mov    0xbc0,%eax
 639:	83 c4 10             	add    $0x10,%esp
}
 63c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 63f:	c9                   	leave  
 640:	c3                   	ret    
    return 0;
 641:	b8 00 00 00 00       	mov    $0x0,%eax
 646:	eb f4                	jmp    63c <morecore+0x44>

00000648 <malloc>:

void*
malloc(uint nbytes)
{
 648:	55                   	push   %ebp
 649:	89 e5                	mov    %esp,%ebp
 64b:	53                   	push   %ebx
 64c:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 64f:	8b 45 08             	mov    0x8(%ebp),%eax
 652:	8d 58 07             	lea    0x7(%eax),%ebx
 655:	c1 eb 03             	shr    $0x3,%ebx
 658:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 65b:	8b 0d c0 0b 00 00    	mov    0xbc0,%ecx
 661:	85 c9                	test   %ecx,%ecx
 663:	74 04                	je     669 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 665:	8b 01                	mov    (%ecx),%eax
 667:	eb 4a                	jmp    6b3 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 669:	c7 05 c0 0b 00 00 c4 	movl   $0xbc4,0xbc0
 670:	0b 00 00 
 673:	c7 05 c4 0b 00 00 c4 	movl   $0xbc4,0xbc4
 67a:	0b 00 00 
    base.s.size = 0;
 67d:	c7 05 c8 0b 00 00 00 	movl   $0x0,0xbc8
 684:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 687:	b9 c4 0b 00 00       	mov    $0xbc4,%ecx
 68c:	eb d7                	jmp    665 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 68e:	74 19                	je     6a9 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 690:	29 da                	sub    %ebx,%edx
 692:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 695:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 698:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 69b:	89 0d c0 0b 00 00    	mov    %ecx,0xbc0
      return (void*)(p + 1);
 6a1:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 6a4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 6a7:	c9                   	leave  
 6a8:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 6a9:	8b 10                	mov    (%eax),%edx
 6ab:	89 11                	mov    %edx,(%ecx)
 6ad:	eb ec                	jmp    69b <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6af:	89 c1                	mov    %eax,%ecx
 6b1:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 6b3:	8b 50 04             	mov    0x4(%eax),%edx
 6b6:	39 da                	cmp    %ebx,%edx
 6b8:	73 d4                	jae    68e <malloc+0x46>
    if(p == freep)
 6ba:	39 05 c0 0b 00 00    	cmp    %eax,0xbc0
 6c0:	75 ed                	jne    6af <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 6c2:	89 d8                	mov    %ebx,%eax
 6c4:	e8 2f ff ff ff       	call   5f8 <morecore>
 6c9:	85 c0                	test   %eax,%eax
 6cb:	75 e2                	jne    6af <malloc+0x67>
 6cd:	eb d5                	jmp    6a4 <malloc+0x5c>
