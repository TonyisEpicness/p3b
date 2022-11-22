
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
  20:	ba fe 06 00 00       	mov    $0x6fe,%edx
  25:	52                   	push   %edx
  26:	ff 34 87             	push   (%edi,%eax,4)
  29:	68 00 07 00 00       	push   $0x700
  2e:	6a 01                	push   $0x1
  30:	e8 18 04 00 00       	call   44d <printf>
  35:	83 c4 10             	add    $0x10,%esp
  for(i = 1; i < argc; i++)
  38:	89 d8                	mov    %ebx,%eax
  3a:	39 f0                	cmp    %esi,%eax
  3c:	7d 0e                	jge    4c <main+0x4c>
    printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
  3e:	8d 58 01             	lea    0x1(%eax),%ebx
  41:	39 f3                	cmp    %esi,%ebx
  43:	7d db                	jge    20 <main+0x20>
  45:	ba fc 06 00 00       	mov    $0x6fc,%edx
  4a:	eb d9                	jmp    25 <main+0x25>
  exit();
  4c:	e8 a7 02 00 00       	call   2f8 <exit>

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
  65:	83 ec 14             	sub    $0x14,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE*2);
  68:	68 00 20 00 00       	push   $0x2000
  6d:	e8 01 06 00 00       	call   673 <malloc>
  if(n_stack == 0){
  72:	83 c4 10             	add    $0x10,%esp
  75:	85 c0                	test   %eax,%eax
  77:	74 4a                	je     c3 <thread_create+0x61>
    return -1;
  }
  
  for(int i=0; i<64; i++){
  79:	ba 00 00 00 00       	mov    $0x0,%edx
  7e:	eb 03                	jmp    83 <thread_create+0x21>
  80:	83 c2 01             	add    $0x1,%edx
  83:	83 fa 3f             	cmp    $0x3f,%edx
  86:	7f 27                	jg     af <thread_create+0x4d>
    if(threads[i]->flag==0){
  88:	8b 0c 95 e0 0a 00 00 	mov    0xae0(,%edx,4),%ecx
  8f:	83 79 08 00          	cmpl   $0x0,0x8(%ecx)
  93:	75 eb                	jne    80 <thread_create+0x1e>
      threads[i]->maddr = n_stack;
  95:	89 01                	mov    %eax,(%ecx)
      threads[i]->pg1addr = n_stack;
  97:	8b 0c 95 e0 0a 00 00 	mov    0xae0(,%edx,4),%ecx
  9e:	89 41 04             	mov    %eax,0x4(%ecx)
      threads[i]->flag = 1;
  a1:	8b 14 95 e0 0a 00 00 	mov    0xae0(,%edx,4),%edx
  a8:	c7 42 08 01 00 00 00 	movl   $0x1,0x8(%edx)
      break;
    }
  }
  
  int new_pid = clone(start_routine, arg1, arg2, n_stack); // TODO: is this the right way to call it?
  af:	50                   	push   %eax
  b0:	ff 75 10             	push   0x10(%ebp)
  b3:	ff 75 0c             	push   0xc(%ebp)
  b6:	ff 75 08             	push   0x8(%ebp)
  b9:	e8 da 02 00 00       	call   398 <clone>

  // I can't remember if there was something else to do here but I'm sure I'll find out



  return new_pid;
  be:	83 c4 10             	add    $0x10,%esp
}
  c1:	c9                   	leave  
  c2:	c3                   	ret    
    return -1;
  c3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  c8:	eb f7                	jmp    c1 <thread_create+0x5f>

000000ca <thread_join>:

//TODO: fix
int thread_join() {
  ca:	55                   	push   %ebp
  cb:	89 e5                	mov    %esp,%ebp
  cd:	56                   	push   %esi
  ce:	53                   	push   %ebx
  cf:	83 ec 1c             	sub    $0x1c,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
  d2:	8d 45 f4             	lea    -0xc(%ebp),%eax
  d5:	50                   	push   %eax
  d6:	e8 c5 02 00 00       	call   3a0 <join>
  db:	89 c6                	mov    %eax,%esi
  for(int i=0; i<64; i++){
  dd:	83 c4 10             	add    $0x10,%esp
  e0:	bb 00 00 00 00       	mov    $0x0,%ebx
  e5:	eb 03                	jmp    ea <thread_join+0x20>
  e7:	83 c3 01             	add    $0x1,%ebx
  ea:	83 fb 3f             	cmp    $0x3f,%ebx
  ed:	7f 23                	jg     112 <thread_join+0x48>
    if((threads[i]->flag==1) && (stk_addr == threads[i]->pg1addr)){
  ef:	8b 04 9d e0 0a 00 00 	mov    0xae0(,%ebx,4),%eax
  f6:	83 78 08 01          	cmpl   $0x1,0x8(%eax)
  fa:	75 eb                	jne    e7 <thread_join+0x1d>
  fc:	8b 55 f4             	mov    -0xc(%ebp),%edx
  ff:	39 50 04             	cmp    %edx,0x4(%eax)
 102:	75 e3                	jne    e7 <thread_join+0x1d>
      free(stk_addr);
 104:	83 ec 0c             	sub    $0xc,%esp
 107:	52                   	push   %edx
 108:	e8 a6 04 00 00       	call   5b3 <free>
 10d:	83 c4 10             	add    $0x10,%esp
 110:	eb d5                	jmp    e7 <thread_join+0x1d>
    }
  }
  return pid;
}
 112:	89 f0                	mov    %esi,%eax
 114:	8d 65 f8             	lea    -0x8(%ebp),%esp
 117:	5b                   	pop    %ebx
 118:	5e                   	pop    %esi
 119:	5d                   	pop    %ebp
 11a:	c3                   	ret    

0000011b <lock_acquire>:

void lock_acquire(lock_t *lock){
 11b:	55                   	push   %ebp
 11c:	89 e5                	mov    %esp,%ebp
 11e:	53                   	push   %ebx
 11f:	83 ec 04             	sub    $0x4,%esp
 122:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 125:	83 ec 08             	sub    $0x8,%esp
 128:	6a 01                	push   $0x1
 12a:	53                   	push   %ebx
 12b:	e8 21 ff ff ff       	call   51 <test_and_set>
 130:	83 c4 10             	add    $0x10,%esp
 133:	83 f8 01             	cmp    $0x1,%eax
 136:	74 ed                	je     125 <lock_acquire+0xa>
    ;
}
 138:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 13b:	c9                   	leave  
 13c:	c3                   	ret    

0000013d <lock_release>:

void lock_release(lock_t *lock) {
 13d:	55                   	push   %ebp
 13e:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 140:	8b 45 08             	mov    0x8(%ebp),%eax
 143:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 149:	5d                   	pop    %ebp
 14a:	c3                   	ret    

0000014b <lock_init>:

void lock_init(lock_t *lock) {
 14b:	55                   	push   %ebp
 14c:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 14e:	8b 45 08             	mov    0x8(%ebp),%eax
 151:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 157:	5d                   	pop    %ebp
 158:	c3                   	ret    

00000159 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 159:	55                   	push   %ebp
 15a:	89 e5                	mov    %esp,%ebp
 15c:	56                   	push   %esi
 15d:	53                   	push   %ebx
 15e:	8b 75 08             	mov    0x8(%ebp),%esi
 161:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 164:	89 f0                	mov    %esi,%eax
 166:	89 d1                	mov    %edx,%ecx
 168:	83 c2 01             	add    $0x1,%edx
 16b:	89 c3                	mov    %eax,%ebx
 16d:	83 c0 01             	add    $0x1,%eax
 170:	0f b6 09             	movzbl (%ecx),%ecx
 173:	88 0b                	mov    %cl,(%ebx)
 175:	84 c9                	test   %cl,%cl
 177:	75 ed                	jne    166 <strcpy+0xd>
    ;
  return os;
}
 179:	89 f0                	mov    %esi,%eax
 17b:	5b                   	pop    %ebx
 17c:	5e                   	pop    %esi
 17d:	5d                   	pop    %ebp
 17e:	c3                   	ret    

0000017f <strcmp>:

int
strcmp(const char *p, const char *q)
{
 17f:	55                   	push   %ebp
 180:	89 e5                	mov    %esp,%ebp
 182:	8b 4d 08             	mov    0x8(%ebp),%ecx
 185:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 188:	eb 06                	jmp    190 <strcmp+0x11>
    p++, q++;
 18a:	83 c1 01             	add    $0x1,%ecx
 18d:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 190:	0f b6 01             	movzbl (%ecx),%eax
 193:	84 c0                	test   %al,%al
 195:	74 04                	je     19b <strcmp+0x1c>
 197:	3a 02                	cmp    (%edx),%al
 199:	74 ef                	je     18a <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 19b:	0f b6 c0             	movzbl %al,%eax
 19e:	0f b6 12             	movzbl (%edx),%edx
 1a1:	29 d0                	sub    %edx,%eax
}
 1a3:	5d                   	pop    %ebp
 1a4:	c3                   	ret    

000001a5 <strlen>:

uint
strlen(const char *s)
{
 1a5:	55                   	push   %ebp
 1a6:	89 e5                	mov    %esp,%ebp
 1a8:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 1ab:	b8 00 00 00 00       	mov    $0x0,%eax
 1b0:	eb 03                	jmp    1b5 <strlen+0x10>
 1b2:	83 c0 01             	add    $0x1,%eax
 1b5:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 1b9:	75 f7                	jne    1b2 <strlen+0xd>
    ;
  return n;
}
 1bb:	5d                   	pop    %ebp
 1bc:	c3                   	ret    

000001bd <memset>:

void*
memset(void *dst, int c, uint n)
{
 1bd:	55                   	push   %ebp
 1be:	89 e5                	mov    %esp,%ebp
 1c0:	57                   	push   %edi
 1c1:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1c4:	89 d7                	mov    %edx,%edi
 1c6:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1c9:	8b 45 0c             	mov    0xc(%ebp),%eax
 1cc:	fc                   	cld    
 1cd:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1cf:	89 d0                	mov    %edx,%eax
 1d1:	8b 7d fc             	mov    -0x4(%ebp),%edi
 1d4:	c9                   	leave  
 1d5:	c3                   	ret    

000001d6 <strchr>:

char*
strchr(const char *s, char c)
{
 1d6:	55                   	push   %ebp
 1d7:	89 e5                	mov    %esp,%ebp
 1d9:	8b 45 08             	mov    0x8(%ebp),%eax
 1dc:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1e0:	eb 03                	jmp    1e5 <strchr+0xf>
 1e2:	83 c0 01             	add    $0x1,%eax
 1e5:	0f b6 10             	movzbl (%eax),%edx
 1e8:	84 d2                	test   %dl,%dl
 1ea:	74 06                	je     1f2 <strchr+0x1c>
    if(*s == c)
 1ec:	38 ca                	cmp    %cl,%dl
 1ee:	75 f2                	jne    1e2 <strchr+0xc>
 1f0:	eb 05                	jmp    1f7 <strchr+0x21>
      return (char*)s;
  return 0;
 1f2:	b8 00 00 00 00       	mov    $0x0,%eax
}
 1f7:	5d                   	pop    %ebp
 1f8:	c3                   	ret    

000001f9 <gets>:

char*
gets(char *buf, int max)
{
 1f9:	55                   	push   %ebp
 1fa:	89 e5                	mov    %esp,%ebp
 1fc:	57                   	push   %edi
 1fd:	56                   	push   %esi
 1fe:	53                   	push   %ebx
 1ff:	83 ec 1c             	sub    $0x1c,%esp
 202:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 205:	bb 00 00 00 00       	mov    $0x0,%ebx
 20a:	89 de                	mov    %ebx,%esi
 20c:	83 c3 01             	add    $0x1,%ebx
 20f:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 212:	7d 2e                	jge    242 <gets+0x49>
    cc = read(0, &c, 1);
 214:	83 ec 04             	sub    $0x4,%esp
 217:	6a 01                	push   $0x1
 219:	8d 45 e7             	lea    -0x19(%ebp),%eax
 21c:	50                   	push   %eax
 21d:	6a 00                	push   $0x0
 21f:	e8 ec 00 00 00       	call   310 <read>
    if(cc < 1)
 224:	83 c4 10             	add    $0x10,%esp
 227:	85 c0                	test   %eax,%eax
 229:	7e 17                	jle    242 <gets+0x49>
      break;
    buf[i++] = c;
 22b:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 22f:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 232:	3c 0a                	cmp    $0xa,%al
 234:	0f 94 c2             	sete   %dl
 237:	3c 0d                	cmp    $0xd,%al
 239:	0f 94 c0             	sete   %al
 23c:	08 c2                	or     %al,%dl
 23e:	74 ca                	je     20a <gets+0x11>
    buf[i++] = c;
 240:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 242:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 246:	89 f8                	mov    %edi,%eax
 248:	8d 65 f4             	lea    -0xc(%ebp),%esp
 24b:	5b                   	pop    %ebx
 24c:	5e                   	pop    %esi
 24d:	5f                   	pop    %edi
 24e:	5d                   	pop    %ebp
 24f:	c3                   	ret    

00000250 <stat>:

int
stat(const char *n, struct stat *st)
{
 250:	55                   	push   %ebp
 251:	89 e5                	mov    %esp,%ebp
 253:	56                   	push   %esi
 254:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 255:	83 ec 08             	sub    $0x8,%esp
 258:	6a 00                	push   $0x0
 25a:	ff 75 08             	push   0x8(%ebp)
 25d:	e8 d6 00 00 00       	call   338 <open>
  if(fd < 0)
 262:	83 c4 10             	add    $0x10,%esp
 265:	85 c0                	test   %eax,%eax
 267:	78 24                	js     28d <stat+0x3d>
 269:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 26b:	83 ec 08             	sub    $0x8,%esp
 26e:	ff 75 0c             	push   0xc(%ebp)
 271:	50                   	push   %eax
 272:	e8 d9 00 00 00       	call   350 <fstat>
 277:	89 c6                	mov    %eax,%esi
  close(fd);
 279:	89 1c 24             	mov    %ebx,(%esp)
 27c:	e8 9f 00 00 00       	call   320 <close>
  return r;
 281:	83 c4 10             	add    $0x10,%esp
}
 284:	89 f0                	mov    %esi,%eax
 286:	8d 65 f8             	lea    -0x8(%ebp),%esp
 289:	5b                   	pop    %ebx
 28a:	5e                   	pop    %esi
 28b:	5d                   	pop    %ebp
 28c:	c3                   	ret    
    return -1;
 28d:	be ff ff ff ff       	mov    $0xffffffff,%esi
 292:	eb f0                	jmp    284 <stat+0x34>

00000294 <atoi>:

int
atoi(const char *s)
{
 294:	55                   	push   %ebp
 295:	89 e5                	mov    %esp,%ebp
 297:	53                   	push   %ebx
 298:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 29b:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 2a0:	eb 10                	jmp    2b2 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 2a2:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 2a5:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 2a8:	83 c1 01             	add    $0x1,%ecx
 2ab:	0f be c0             	movsbl %al,%eax
 2ae:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 2b2:	0f b6 01             	movzbl (%ecx),%eax
 2b5:	8d 58 d0             	lea    -0x30(%eax),%ebx
 2b8:	80 fb 09             	cmp    $0x9,%bl
 2bb:	76 e5                	jbe    2a2 <atoi+0xe>
  return n;
}
 2bd:	89 d0                	mov    %edx,%eax
 2bf:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2c2:	c9                   	leave  
 2c3:	c3                   	ret    

000002c4 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2c4:	55                   	push   %ebp
 2c5:	89 e5                	mov    %esp,%ebp
 2c7:	56                   	push   %esi
 2c8:	53                   	push   %ebx
 2c9:	8b 75 08             	mov    0x8(%ebp),%esi
 2cc:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 2cf:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 2d2:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 2d4:	eb 0d                	jmp    2e3 <memmove+0x1f>
    *dst++ = *src++;
 2d6:	0f b6 01             	movzbl (%ecx),%eax
 2d9:	88 02                	mov    %al,(%edx)
 2db:	8d 49 01             	lea    0x1(%ecx),%ecx
 2de:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 2e1:	89 d8                	mov    %ebx,%eax
 2e3:	8d 58 ff             	lea    -0x1(%eax),%ebx
 2e6:	85 c0                	test   %eax,%eax
 2e8:	7f ec                	jg     2d6 <memmove+0x12>
  return vdst;
}
 2ea:	89 f0                	mov    %esi,%eax
 2ec:	5b                   	pop    %ebx
 2ed:	5e                   	pop    %esi
 2ee:	5d                   	pop    %ebp
 2ef:	c3                   	ret    

000002f0 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2f0:	b8 01 00 00 00       	mov    $0x1,%eax
 2f5:	cd 40                	int    $0x40
 2f7:	c3                   	ret    

000002f8 <exit>:
SYSCALL(exit)
 2f8:	b8 02 00 00 00       	mov    $0x2,%eax
 2fd:	cd 40                	int    $0x40
 2ff:	c3                   	ret    

00000300 <wait>:
SYSCALL(wait)
 300:	b8 03 00 00 00       	mov    $0x3,%eax
 305:	cd 40                	int    $0x40
 307:	c3                   	ret    

00000308 <pipe>:
SYSCALL(pipe)
 308:	b8 04 00 00 00       	mov    $0x4,%eax
 30d:	cd 40                	int    $0x40
 30f:	c3                   	ret    

00000310 <read>:
SYSCALL(read)
 310:	b8 05 00 00 00       	mov    $0x5,%eax
 315:	cd 40                	int    $0x40
 317:	c3                   	ret    

00000318 <write>:
SYSCALL(write)
 318:	b8 10 00 00 00       	mov    $0x10,%eax
 31d:	cd 40                	int    $0x40
 31f:	c3                   	ret    

00000320 <close>:
SYSCALL(close)
 320:	b8 15 00 00 00       	mov    $0x15,%eax
 325:	cd 40                	int    $0x40
 327:	c3                   	ret    

00000328 <kill>:
SYSCALL(kill)
 328:	b8 06 00 00 00       	mov    $0x6,%eax
 32d:	cd 40                	int    $0x40
 32f:	c3                   	ret    

00000330 <exec>:
SYSCALL(exec)
 330:	b8 07 00 00 00       	mov    $0x7,%eax
 335:	cd 40                	int    $0x40
 337:	c3                   	ret    

00000338 <open>:
SYSCALL(open)
 338:	b8 0f 00 00 00       	mov    $0xf,%eax
 33d:	cd 40                	int    $0x40
 33f:	c3                   	ret    

00000340 <mknod>:
SYSCALL(mknod)
 340:	b8 11 00 00 00       	mov    $0x11,%eax
 345:	cd 40                	int    $0x40
 347:	c3                   	ret    

00000348 <unlink>:
SYSCALL(unlink)
 348:	b8 12 00 00 00       	mov    $0x12,%eax
 34d:	cd 40                	int    $0x40
 34f:	c3                   	ret    

00000350 <fstat>:
SYSCALL(fstat)
 350:	b8 08 00 00 00       	mov    $0x8,%eax
 355:	cd 40                	int    $0x40
 357:	c3                   	ret    

00000358 <link>:
SYSCALL(link)
 358:	b8 13 00 00 00       	mov    $0x13,%eax
 35d:	cd 40                	int    $0x40
 35f:	c3                   	ret    

00000360 <mkdir>:
SYSCALL(mkdir)
 360:	b8 14 00 00 00       	mov    $0x14,%eax
 365:	cd 40                	int    $0x40
 367:	c3                   	ret    

00000368 <chdir>:
SYSCALL(chdir)
 368:	b8 09 00 00 00       	mov    $0x9,%eax
 36d:	cd 40                	int    $0x40
 36f:	c3                   	ret    

00000370 <dup>:
SYSCALL(dup)
 370:	b8 0a 00 00 00       	mov    $0xa,%eax
 375:	cd 40                	int    $0x40
 377:	c3                   	ret    

00000378 <getpid>:
SYSCALL(getpid)
 378:	b8 0b 00 00 00       	mov    $0xb,%eax
 37d:	cd 40                	int    $0x40
 37f:	c3                   	ret    

00000380 <sbrk>:
SYSCALL(sbrk)
 380:	b8 0c 00 00 00       	mov    $0xc,%eax
 385:	cd 40                	int    $0x40
 387:	c3                   	ret    

00000388 <sleep>:
SYSCALL(sleep)
 388:	b8 0d 00 00 00       	mov    $0xd,%eax
 38d:	cd 40                	int    $0x40
 38f:	c3                   	ret    

00000390 <uptime>:
SYSCALL(uptime)
 390:	b8 0e 00 00 00       	mov    $0xe,%eax
 395:	cd 40                	int    $0x40
 397:	c3                   	ret    

00000398 <clone>:
SYSCALL(clone)
 398:	b8 16 00 00 00       	mov    $0x16,%eax
 39d:	cd 40                	int    $0x40
 39f:	c3                   	ret    

000003a0 <join>:
 3a0:	b8 17 00 00 00       	mov    $0x17,%eax
 3a5:	cd 40                	int    $0x40
 3a7:	c3                   	ret    

000003a8 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 3a8:	55                   	push   %ebp
 3a9:	89 e5                	mov    %esp,%ebp
 3ab:	83 ec 1c             	sub    $0x1c,%esp
 3ae:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 3b1:	6a 01                	push   $0x1
 3b3:	8d 55 f4             	lea    -0xc(%ebp),%edx
 3b6:	52                   	push   %edx
 3b7:	50                   	push   %eax
 3b8:	e8 5b ff ff ff       	call   318 <write>
}
 3bd:	83 c4 10             	add    $0x10,%esp
 3c0:	c9                   	leave  
 3c1:	c3                   	ret    

000003c2 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 3c2:	55                   	push   %ebp
 3c3:	89 e5                	mov    %esp,%ebp
 3c5:	57                   	push   %edi
 3c6:	56                   	push   %esi
 3c7:	53                   	push   %ebx
 3c8:	83 ec 2c             	sub    $0x2c,%esp
 3cb:	89 45 d0             	mov    %eax,-0x30(%ebp)
 3ce:	89 d0                	mov    %edx,%eax
 3d0:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 3d2:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 3d6:	0f 95 c1             	setne  %cl
 3d9:	c1 ea 1f             	shr    $0x1f,%edx
 3dc:	84 d1                	test   %dl,%cl
 3de:	74 44                	je     424 <printint+0x62>
    neg = 1;
    x = -xx;
 3e0:	f7 d8                	neg    %eax
 3e2:	89 c1                	mov    %eax,%ecx
    neg = 1;
 3e4:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 3eb:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 3f0:	89 c8                	mov    %ecx,%eax
 3f2:	ba 00 00 00 00       	mov    $0x0,%edx
 3f7:	f7 f6                	div    %esi
 3f9:	89 df                	mov    %ebx,%edi
 3fb:	83 c3 01             	add    $0x1,%ebx
 3fe:	0f b6 92 64 07 00 00 	movzbl 0x764(%edx),%edx
 405:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 409:	89 ca                	mov    %ecx,%edx
 40b:	89 c1                	mov    %eax,%ecx
 40d:	39 d6                	cmp    %edx,%esi
 40f:	76 df                	jbe    3f0 <printint+0x2e>
  if(neg)
 411:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 415:	74 31                	je     448 <printint+0x86>
    buf[i++] = '-';
 417:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 41c:	8d 5f 02             	lea    0x2(%edi),%ebx
 41f:	8b 75 d0             	mov    -0x30(%ebp),%esi
 422:	eb 17                	jmp    43b <printint+0x79>
    x = xx;
 424:	89 c1                	mov    %eax,%ecx
  neg = 0;
 426:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 42d:	eb bc                	jmp    3eb <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 42f:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 434:	89 f0                	mov    %esi,%eax
 436:	e8 6d ff ff ff       	call   3a8 <putc>
  while(--i >= 0)
 43b:	83 eb 01             	sub    $0x1,%ebx
 43e:	79 ef                	jns    42f <printint+0x6d>
}
 440:	83 c4 2c             	add    $0x2c,%esp
 443:	5b                   	pop    %ebx
 444:	5e                   	pop    %esi
 445:	5f                   	pop    %edi
 446:	5d                   	pop    %ebp
 447:	c3                   	ret    
 448:	8b 75 d0             	mov    -0x30(%ebp),%esi
 44b:	eb ee                	jmp    43b <printint+0x79>

0000044d <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 44d:	55                   	push   %ebp
 44e:	89 e5                	mov    %esp,%ebp
 450:	57                   	push   %edi
 451:	56                   	push   %esi
 452:	53                   	push   %ebx
 453:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 456:	8d 45 10             	lea    0x10(%ebp),%eax
 459:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 45c:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 461:	bb 00 00 00 00       	mov    $0x0,%ebx
 466:	eb 14                	jmp    47c <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 468:	89 fa                	mov    %edi,%edx
 46a:	8b 45 08             	mov    0x8(%ebp),%eax
 46d:	e8 36 ff ff ff       	call   3a8 <putc>
 472:	eb 05                	jmp    479 <printf+0x2c>
      }
    } else if(state == '%'){
 474:	83 fe 25             	cmp    $0x25,%esi
 477:	74 25                	je     49e <printf+0x51>
  for(i = 0; fmt[i]; i++){
 479:	83 c3 01             	add    $0x1,%ebx
 47c:	8b 45 0c             	mov    0xc(%ebp),%eax
 47f:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 483:	84 c0                	test   %al,%al
 485:	0f 84 20 01 00 00    	je     5ab <printf+0x15e>
    c = fmt[i] & 0xff;
 48b:	0f be f8             	movsbl %al,%edi
 48e:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 491:	85 f6                	test   %esi,%esi
 493:	75 df                	jne    474 <printf+0x27>
      if(c == '%'){
 495:	83 f8 25             	cmp    $0x25,%eax
 498:	75 ce                	jne    468 <printf+0x1b>
        state = '%';
 49a:	89 c6                	mov    %eax,%esi
 49c:	eb db                	jmp    479 <printf+0x2c>
      if(c == 'd'){
 49e:	83 f8 25             	cmp    $0x25,%eax
 4a1:	0f 84 cf 00 00 00    	je     576 <printf+0x129>
 4a7:	0f 8c dd 00 00 00    	jl     58a <printf+0x13d>
 4ad:	83 f8 78             	cmp    $0x78,%eax
 4b0:	0f 8f d4 00 00 00    	jg     58a <printf+0x13d>
 4b6:	83 f8 63             	cmp    $0x63,%eax
 4b9:	0f 8c cb 00 00 00    	jl     58a <printf+0x13d>
 4bf:	83 e8 63             	sub    $0x63,%eax
 4c2:	83 f8 15             	cmp    $0x15,%eax
 4c5:	0f 87 bf 00 00 00    	ja     58a <printf+0x13d>
 4cb:	ff 24 85 0c 07 00 00 	jmp    *0x70c(,%eax,4)
        printint(fd, *ap, 10, 1);
 4d2:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4d5:	8b 17                	mov    (%edi),%edx
 4d7:	83 ec 0c             	sub    $0xc,%esp
 4da:	6a 01                	push   $0x1
 4dc:	b9 0a 00 00 00       	mov    $0xa,%ecx
 4e1:	8b 45 08             	mov    0x8(%ebp),%eax
 4e4:	e8 d9 fe ff ff       	call   3c2 <printint>
        ap++;
 4e9:	83 c7 04             	add    $0x4,%edi
 4ec:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 4ef:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 4f2:	be 00 00 00 00       	mov    $0x0,%esi
 4f7:	eb 80                	jmp    479 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 4f9:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4fc:	8b 17                	mov    (%edi),%edx
 4fe:	83 ec 0c             	sub    $0xc,%esp
 501:	6a 00                	push   $0x0
 503:	b9 10 00 00 00       	mov    $0x10,%ecx
 508:	8b 45 08             	mov    0x8(%ebp),%eax
 50b:	e8 b2 fe ff ff       	call   3c2 <printint>
        ap++;
 510:	83 c7 04             	add    $0x4,%edi
 513:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 516:	83 c4 10             	add    $0x10,%esp
      state = 0;
 519:	be 00 00 00 00       	mov    $0x0,%esi
 51e:	e9 56 ff ff ff       	jmp    479 <printf+0x2c>
        s = (char*)*ap;
 523:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 526:	8b 30                	mov    (%eax),%esi
        ap++;
 528:	83 c0 04             	add    $0x4,%eax
 52b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 52e:	85 f6                	test   %esi,%esi
 530:	75 15                	jne    547 <printf+0xfa>
          s = "(null)";
 532:	be 05 07 00 00       	mov    $0x705,%esi
 537:	eb 0e                	jmp    547 <printf+0xfa>
          putc(fd, *s);
 539:	0f be d2             	movsbl %dl,%edx
 53c:	8b 45 08             	mov    0x8(%ebp),%eax
 53f:	e8 64 fe ff ff       	call   3a8 <putc>
          s++;
 544:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 547:	0f b6 16             	movzbl (%esi),%edx
 54a:	84 d2                	test   %dl,%dl
 54c:	75 eb                	jne    539 <printf+0xec>
      state = 0;
 54e:	be 00 00 00 00       	mov    $0x0,%esi
 553:	e9 21 ff ff ff       	jmp    479 <printf+0x2c>
        putc(fd, *ap);
 558:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 55b:	0f be 17             	movsbl (%edi),%edx
 55e:	8b 45 08             	mov    0x8(%ebp),%eax
 561:	e8 42 fe ff ff       	call   3a8 <putc>
        ap++;
 566:	83 c7 04             	add    $0x4,%edi
 569:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 56c:	be 00 00 00 00       	mov    $0x0,%esi
 571:	e9 03 ff ff ff       	jmp    479 <printf+0x2c>
        putc(fd, c);
 576:	89 fa                	mov    %edi,%edx
 578:	8b 45 08             	mov    0x8(%ebp),%eax
 57b:	e8 28 fe ff ff       	call   3a8 <putc>
      state = 0;
 580:	be 00 00 00 00       	mov    $0x0,%esi
 585:	e9 ef fe ff ff       	jmp    479 <printf+0x2c>
        putc(fd, '%');
 58a:	ba 25 00 00 00       	mov    $0x25,%edx
 58f:	8b 45 08             	mov    0x8(%ebp),%eax
 592:	e8 11 fe ff ff       	call   3a8 <putc>
        putc(fd, c);
 597:	89 fa                	mov    %edi,%edx
 599:	8b 45 08             	mov    0x8(%ebp),%eax
 59c:	e8 07 fe ff ff       	call   3a8 <putc>
      state = 0;
 5a1:	be 00 00 00 00       	mov    $0x0,%esi
 5a6:	e9 ce fe ff ff       	jmp    479 <printf+0x2c>
    }
  }
}
 5ab:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5ae:	5b                   	pop    %ebx
 5af:	5e                   	pop    %esi
 5b0:	5f                   	pop    %edi
 5b1:	5d                   	pop    %ebp
 5b2:	c3                   	ret    

000005b3 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5b3:	55                   	push   %ebp
 5b4:	89 e5                	mov    %esp,%ebp
 5b6:	57                   	push   %edi
 5b7:	56                   	push   %esi
 5b8:	53                   	push   %ebx
 5b9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 5bc:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5bf:	a1 e0 0b 00 00       	mov    0xbe0,%eax
 5c4:	eb 02                	jmp    5c8 <free+0x15>
 5c6:	89 d0                	mov    %edx,%eax
 5c8:	39 c8                	cmp    %ecx,%eax
 5ca:	73 04                	jae    5d0 <free+0x1d>
 5cc:	39 08                	cmp    %ecx,(%eax)
 5ce:	77 12                	ja     5e2 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5d0:	8b 10                	mov    (%eax),%edx
 5d2:	39 c2                	cmp    %eax,%edx
 5d4:	77 f0                	ja     5c6 <free+0x13>
 5d6:	39 c8                	cmp    %ecx,%eax
 5d8:	72 08                	jb     5e2 <free+0x2f>
 5da:	39 ca                	cmp    %ecx,%edx
 5dc:	77 04                	ja     5e2 <free+0x2f>
 5de:	89 d0                	mov    %edx,%eax
 5e0:	eb e6                	jmp    5c8 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 5e2:	8b 73 fc             	mov    -0x4(%ebx),%esi
 5e5:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 5e8:	8b 10                	mov    (%eax),%edx
 5ea:	39 d7                	cmp    %edx,%edi
 5ec:	74 19                	je     607 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 5ee:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 5f1:	8b 50 04             	mov    0x4(%eax),%edx
 5f4:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 5f7:	39 ce                	cmp    %ecx,%esi
 5f9:	74 1b                	je     616 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 5fb:	89 08                	mov    %ecx,(%eax)
  freep = p;
 5fd:	a3 e0 0b 00 00       	mov    %eax,0xbe0
}
 602:	5b                   	pop    %ebx
 603:	5e                   	pop    %esi
 604:	5f                   	pop    %edi
 605:	5d                   	pop    %ebp
 606:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 607:	03 72 04             	add    0x4(%edx),%esi
 60a:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 60d:	8b 10                	mov    (%eax),%edx
 60f:	8b 12                	mov    (%edx),%edx
 611:	89 53 f8             	mov    %edx,-0x8(%ebx)
 614:	eb db                	jmp    5f1 <free+0x3e>
    p->s.size += bp->s.size;
 616:	03 53 fc             	add    -0x4(%ebx),%edx
 619:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 61c:	8b 53 f8             	mov    -0x8(%ebx),%edx
 61f:	89 10                	mov    %edx,(%eax)
 621:	eb da                	jmp    5fd <free+0x4a>

00000623 <morecore>:

static Header*
morecore(uint nu)
{
 623:	55                   	push   %ebp
 624:	89 e5                	mov    %esp,%ebp
 626:	53                   	push   %ebx
 627:	83 ec 04             	sub    $0x4,%esp
 62a:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 62c:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 631:	77 05                	ja     638 <morecore+0x15>
    nu = 4096;
 633:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 638:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 63f:	83 ec 0c             	sub    $0xc,%esp
 642:	50                   	push   %eax
 643:	e8 38 fd ff ff       	call   380 <sbrk>
  if(p == (char*)-1)
 648:	83 c4 10             	add    $0x10,%esp
 64b:	83 f8 ff             	cmp    $0xffffffff,%eax
 64e:	74 1c                	je     66c <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 650:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 653:	83 c0 08             	add    $0x8,%eax
 656:	83 ec 0c             	sub    $0xc,%esp
 659:	50                   	push   %eax
 65a:	e8 54 ff ff ff       	call   5b3 <free>
  return freep;
 65f:	a1 e0 0b 00 00       	mov    0xbe0,%eax
 664:	83 c4 10             	add    $0x10,%esp
}
 667:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 66a:	c9                   	leave  
 66b:	c3                   	ret    
    return 0;
 66c:	b8 00 00 00 00       	mov    $0x0,%eax
 671:	eb f4                	jmp    667 <morecore+0x44>

00000673 <malloc>:

void*
malloc(uint nbytes)
{
 673:	55                   	push   %ebp
 674:	89 e5                	mov    %esp,%ebp
 676:	53                   	push   %ebx
 677:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 67a:	8b 45 08             	mov    0x8(%ebp),%eax
 67d:	8d 58 07             	lea    0x7(%eax),%ebx
 680:	c1 eb 03             	shr    $0x3,%ebx
 683:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 686:	8b 0d e0 0b 00 00    	mov    0xbe0,%ecx
 68c:	85 c9                	test   %ecx,%ecx
 68e:	74 04                	je     694 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 690:	8b 01                	mov    (%ecx),%eax
 692:	eb 4a                	jmp    6de <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 694:	c7 05 e0 0b 00 00 e4 	movl   $0xbe4,0xbe0
 69b:	0b 00 00 
 69e:	c7 05 e4 0b 00 00 e4 	movl   $0xbe4,0xbe4
 6a5:	0b 00 00 
    base.s.size = 0;
 6a8:	c7 05 e8 0b 00 00 00 	movl   $0x0,0xbe8
 6af:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 6b2:	b9 e4 0b 00 00       	mov    $0xbe4,%ecx
 6b7:	eb d7                	jmp    690 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 6b9:	74 19                	je     6d4 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 6bb:	29 da                	sub    %ebx,%edx
 6bd:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 6c0:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 6c3:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 6c6:	89 0d e0 0b 00 00    	mov    %ecx,0xbe0
      return (void*)(p + 1);
 6cc:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 6cf:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 6d2:	c9                   	leave  
 6d3:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 6d4:	8b 10                	mov    (%eax),%edx
 6d6:	89 11                	mov    %edx,(%ecx)
 6d8:	eb ec                	jmp    6c6 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6da:	89 c1                	mov    %eax,%ecx
 6dc:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 6de:	8b 50 04             	mov    0x4(%eax),%edx
 6e1:	39 da                	cmp    %ebx,%edx
 6e3:	73 d4                	jae    6b9 <malloc+0x46>
    if(p == freep)
 6e5:	39 05 e0 0b 00 00    	cmp    %eax,0xbe0
 6eb:	75 ed                	jne    6da <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 6ed:	89 d8                	mov    %ebx,%eax
 6ef:	e8 2f ff ff ff       	call   623 <morecore>
 6f4:	85 c0                	test   %eax,%eax
 6f6:	75 e2                	jne    6da <malloc+0x67>
 6f8:	eb d5                	jmp    6cf <malloc+0x5c>
