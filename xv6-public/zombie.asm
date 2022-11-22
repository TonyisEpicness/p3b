
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
  11:	e8 b7 02 00 00       	call   2cd <fork>
  16:	85 c0                	test   %eax,%eax
  18:	7f 05                	jg     1f <main+0x1f>
    sleep(5);  // Let child exit before parent.
  exit();
  1a:	e8 b6 02 00 00       	call   2d5 <exit>
    sleep(5);  // Let child exit before parent.
  1f:	83 ec 0c             	sub    $0xc,%esp
  22:	6a 05                	push   $0x5
  24:	e8 3c 03 00 00       	call   365 <sleep>
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
  42:	83 ec 14             	sub    $0x14,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE*2);
  45:	68 00 20 00 00       	push   $0x2000
  4a:	e8 01 06 00 00       	call   650 <malloc>
  if(n_stack == 0){
  4f:	83 c4 10             	add    $0x10,%esp
  52:	85 c0                	test   %eax,%eax
  54:	74 4a                	je     a0 <thread_create+0x61>
    return -1;
  }
  
  for(int i=0; i<64; i++){
  56:	ba 00 00 00 00       	mov    $0x0,%edx
  5b:	eb 03                	jmp    60 <thread_create+0x21>
  5d:	83 c2 01             	add    $0x1,%edx
  60:	83 fa 3f             	cmp    $0x3f,%edx
  63:	7f 27                	jg     8c <thread_create+0x4d>
    if(threads[i]->flag==0){
  65:	8b 0c 95 c0 0a 00 00 	mov    0xac0(,%edx,4),%ecx
  6c:	83 79 08 00          	cmpl   $0x0,0x8(%ecx)
  70:	75 eb                	jne    5d <thread_create+0x1e>
      threads[i]->maddr = n_stack;
  72:	89 01                	mov    %eax,(%ecx)
      threads[i]->pg1addr = n_stack;
  74:	8b 0c 95 c0 0a 00 00 	mov    0xac0(,%edx,4),%ecx
  7b:	89 41 04             	mov    %eax,0x4(%ecx)
      threads[i]->flag = 1;
  7e:	8b 14 95 c0 0a 00 00 	mov    0xac0(,%edx,4),%edx
  85:	c7 42 08 01 00 00 00 	movl   $0x1,0x8(%edx)
      break;
    }
  }
  
  int new_pid = clone(start_routine, arg1, arg2, n_stack); // TODO: is this the right way to call it?
  8c:	50                   	push   %eax
  8d:	ff 75 10             	push   0x10(%ebp)
  90:	ff 75 0c             	push   0xc(%ebp)
  93:	ff 75 08             	push   0x8(%ebp)
  96:	e8 da 02 00 00       	call   375 <clone>

  // I can't remember if there was something else to do here but I'm sure I'll find out



  return new_pid;
  9b:	83 c4 10             	add    $0x10,%esp
}
  9e:	c9                   	leave  
  9f:	c3                   	ret    
    return -1;
  a0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  a5:	eb f7                	jmp    9e <thread_create+0x5f>

000000a7 <thread_join>:

//TODO: fix
int thread_join() {
  a7:	55                   	push   %ebp
  a8:	89 e5                	mov    %esp,%ebp
  aa:	56                   	push   %esi
  ab:	53                   	push   %ebx
  ac:	83 ec 1c             	sub    $0x1c,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
  af:	8d 45 f4             	lea    -0xc(%ebp),%eax
  b2:	50                   	push   %eax
  b3:	e8 c5 02 00 00       	call   37d <join>
  b8:	89 c6                	mov    %eax,%esi
  for(int i=0; i<64; i++){
  ba:	83 c4 10             	add    $0x10,%esp
  bd:	bb 00 00 00 00       	mov    $0x0,%ebx
  c2:	eb 03                	jmp    c7 <thread_join+0x20>
  c4:	83 c3 01             	add    $0x1,%ebx
  c7:	83 fb 3f             	cmp    $0x3f,%ebx
  ca:	7f 23                	jg     ef <thread_join+0x48>
    if((threads[i]->flag==1) && (stk_addr == threads[i]->pg1addr)){
  cc:	8b 04 9d c0 0a 00 00 	mov    0xac0(,%ebx,4),%eax
  d3:	83 78 08 01          	cmpl   $0x1,0x8(%eax)
  d7:	75 eb                	jne    c4 <thread_join+0x1d>
  d9:	8b 55 f4             	mov    -0xc(%ebp),%edx
  dc:	39 50 04             	cmp    %edx,0x4(%eax)
  df:	75 e3                	jne    c4 <thread_join+0x1d>
      free(stk_addr);
  e1:	83 ec 0c             	sub    $0xc,%esp
  e4:	52                   	push   %edx
  e5:	e8 a6 04 00 00       	call   590 <free>
  ea:	83 c4 10             	add    $0x10,%esp
  ed:	eb d5                	jmp    c4 <thread_join+0x1d>
    }
  }
  return pid;
}
  ef:	89 f0                	mov    %esi,%eax
  f1:	8d 65 f8             	lea    -0x8(%ebp),%esp
  f4:	5b                   	pop    %ebx
  f5:	5e                   	pop    %esi
  f6:	5d                   	pop    %ebp
  f7:	c3                   	ret    

000000f8 <lock_acquire>:

void lock_acquire(lock_t *lock){
  f8:	55                   	push   %ebp
  f9:	89 e5                	mov    %esp,%ebp
  fb:	53                   	push   %ebx
  fc:	83 ec 04             	sub    $0x4,%esp
  ff:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 102:	83 ec 08             	sub    $0x8,%esp
 105:	6a 01                	push   $0x1
 107:	53                   	push   %ebx
 108:	e8 21 ff ff ff       	call   2e <test_and_set>
 10d:	83 c4 10             	add    $0x10,%esp
 110:	83 f8 01             	cmp    $0x1,%eax
 113:	74 ed                	je     102 <lock_acquire+0xa>
    ;
}
 115:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 118:	c9                   	leave  
 119:	c3                   	ret    

0000011a <lock_release>:

void lock_release(lock_t *lock) {
 11a:	55                   	push   %ebp
 11b:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 11d:	8b 45 08             	mov    0x8(%ebp),%eax
 120:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 126:	5d                   	pop    %ebp
 127:	c3                   	ret    

00000128 <lock_init>:

void lock_init(lock_t *lock) {
 128:	55                   	push   %ebp
 129:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 12b:	8b 45 08             	mov    0x8(%ebp),%eax
 12e:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 134:	5d                   	pop    %ebp
 135:	c3                   	ret    

00000136 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 136:	55                   	push   %ebp
 137:	89 e5                	mov    %esp,%ebp
 139:	56                   	push   %esi
 13a:	53                   	push   %ebx
 13b:	8b 75 08             	mov    0x8(%ebp),%esi
 13e:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 141:	89 f0                	mov    %esi,%eax
 143:	89 d1                	mov    %edx,%ecx
 145:	83 c2 01             	add    $0x1,%edx
 148:	89 c3                	mov    %eax,%ebx
 14a:	83 c0 01             	add    $0x1,%eax
 14d:	0f b6 09             	movzbl (%ecx),%ecx
 150:	88 0b                	mov    %cl,(%ebx)
 152:	84 c9                	test   %cl,%cl
 154:	75 ed                	jne    143 <strcpy+0xd>
    ;
  return os;
}
 156:	89 f0                	mov    %esi,%eax
 158:	5b                   	pop    %ebx
 159:	5e                   	pop    %esi
 15a:	5d                   	pop    %ebp
 15b:	c3                   	ret    

0000015c <strcmp>:

int
strcmp(const char *p, const char *q)
{
 15c:	55                   	push   %ebp
 15d:	89 e5                	mov    %esp,%ebp
 15f:	8b 4d 08             	mov    0x8(%ebp),%ecx
 162:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 165:	eb 06                	jmp    16d <strcmp+0x11>
    p++, q++;
 167:	83 c1 01             	add    $0x1,%ecx
 16a:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 16d:	0f b6 01             	movzbl (%ecx),%eax
 170:	84 c0                	test   %al,%al
 172:	74 04                	je     178 <strcmp+0x1c>
 174:	3a 02                	cmp    (%edx),%al
 176:	74 ef                	je     167 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 178:	0f b6 c0             	movzbl %al,%eax
 17b:	0f b6 12             	movzbl (%edx),%edx
 17e:	29 d0                	sub    %edx,%eax
}
 180:	5d                   	pop    %ebp
 181:	c3                   	ret    

00000182 <strlen>:

uint
strlen(const char *s)
{
 182:	55                   	push   %ebp
 183:	89 e5                	mov    %esp,%ebp
 185:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 188:	b8 00 00 00 00       	mov    $0x0,%eax
 18d:	eb 03                	jmp    192 <strlen+0x10>
 18f:	83 c0 01             	add    $0x1,%eax
 192:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 196:	75 f7                	jne    18f <strlen+0xd>
    ;
  return n;
}
 198:	5d                   	pop    %ebp
 199:	c3                   	ret    

0000019a <memset>:

void*
memset(void *dst, int c, uint n)
{
 19a:	55                   	push   %ebp
 19b:	89 e5                	mov    %esp,%ebp
 19d:	57                   	push   %edi
 19e:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1a1:	89 d7                	mov    %edx,%edi
 1a3:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1a6:	8b 45 0c             	mov    0xc(%ebp),%eax
 1a9:	fc                   	cld    
 1aa:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1ac:	89 d0                	mov    %edx,%eax
 1ae:	8b 7d fc             	mov    -0x4(%ebp),%edi
 1b1:	c9                   	leave  
 1b2:	c3                   	ret    

000001b3 <strchr>:

char*
strchr(const char *s, char c)
{
 1b3:	55                   	push   %ebp
 1b4:	89 e5                	mov    %esp,%ebp
 1b6:	8b 45 08             	mov    0x8(%ebp),%eax
 1b9:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1bd:	eb 03                	jmp    1c2 <strchr+0xf>
 1bf:	83 c0 01             	add    $0x1,%eax
 1c2:	0f b6 10             	movzbl (%eax),%edx
 1c5:	84 d2                	test   %dl,%dl
 1c7:	74 06                	je     1cf <strchr+0x1c>
    if(*s == c)
 1c9:	38 ca                	cmp    %cl,%dl
 1cb:	75 f2                	jne    1bf <strchr+0xc>
 1cd:	eb 05                	jmp    1d4 <strchr+0x21>
      return (char*)s;
  return 0;
 1cf:	b8 00 00 00 00       	mov    $0x0,%eax
}
 1d4:	5d                   	pop    %ebp
 1d5:	c3                   	ret    

000001d6 <gets>:

char*
gets(char *buf, int max)
{
 1d6:	55                   	push   %ebp
 1d7:	89 e5                	mov    %esp,%ebp
 1d9:	57                   	push   %edi
 1da:	56                   	push   %esi
 1db:	53                   	push   %ebx
 1dc:	83 ec 1c             	sub    $0x1c,%esp
 1df:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1e2:	bb 00 00 00 00       	mov    $0x0,%ebx
 1e7:	89 de                	mov    %ebx,%esi
 1e9:	83 c3 01             	add    $0x1,%ebx
 1ec:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1ef:	7d 2e                	jge    21f <gets+0x49>
    cc = read(0, &c, 1);
 1f1:	83 ec 04             	sub    $0x4,%esp
 1f4:	6a 01                	push   $0x1
 1f6:	8d 45 e7             	lea    -0x19(%ebp),%eax
 1f9:	50                   	push   %eax
 1fa:	6a 00                	push   $0x0
 1fc:	e8 ec 00 00 00       	call   2ed <read>
    if(cc < 1)
 201:	83 c4 10             	add    $0x10,%esp
 204:	85 c0                	test   %eax,%eax
 206:	7e 17                	jle    21f <gets+0x49>
      break;
    buf[i++] = c;
 208:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 20c:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 20f:	3c 0a                	cmp    $0xa,%al
 211:	0f 94 c2             	sete   %dl
 214:	3c 0d                	cmp    $0xd,%al
 216:	0f 94 c0             	sete   %al
 219:	08 c2                	or     %al,%dl
 21b:	74 ca                	je     1e7 <gets+0x11>
    buf[i++] = c;
 21d:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 21f:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 223:	89 f8                	mov    %edi,%eax
 225:	8d 65 f4             	lea    -0xc(%ebp),%esp
 228:	5b                   	pop    %ebx
 229:	5e                   	pop    %esi
 22a:	5f                   	pop    %edi
 22b:	5d                   	pop    %ebp
 22c:	c3                   	ret    

0000022d <stat>:

int
stat(const char *n, struct stat *st)
{
 22d:	55                   	push   %ebp
 22e:	89 e5                	mov    %esp,%ebp
 230:	56                   	push   %esi
 231:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 232:	83 ec 08             	sub    $0x8,%esp
 235:	6a 00                	push   $0x0
 237:	ff 75 08             	push   0x8(%ebp)
 23a:	e8 d6 00 00 00       	call   315 <open>
  if(fd < 0)
 23f:	83 c4 10             	add    $0x10,%esp
 242:	85 c0                	test   %eax,%eax
 244:	78 24                	js     26a <stat+0x3d>
 246:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 248:	83 ec 08             	sub    $0x8,%esp
 24b:	ff 75 0c             	push   0xc(%ebp)
 24e:	50                   	push   %eax
 24f:	e8 d9 00 00 00       	call   32d <fstat>
 254:	89 c6                	mov    %eax,%esi
  close(fd);
 256:	89 1c 24             	mov    %ebx,(%esp)
 259:	e8 9f 00 00 00       	call   2fd <close>
  return r;
 25e:	83 c4 10             	add    $0x10,%esp
}
 261:	89 f0                	mov    %esi,%eax
 263:	8d 65 f8             	lea    -0x8(%ebp),%esp
 266:	5b                   	pop    %ebx
 267:	5e                   	pop    %esi
 268:	5d                   	pop    %ebp
 269:	c3                   	ret    
    return -1;
 26a:	be ff ff ff ff       	mov    $0xffffffff,%esi
 26f:	eb f0                	jmp    261 <stat+0x34>

00000271 <atoi>:

int
atoi(const char *s)
{
 271:	55                   	push   %ebp
 272:	89 e5                	mov    %esp,%ebp
 274:	53                   	push   %ebx
 275:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 278:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 27d:	eb 10                	jmp    28f <atoi+0x1e>
    n = n*10 + *s++ - '0';
 27f:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 282:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 285:	83 c1 01             	add    $0x1,%ecx
 288:	0f be c0             	movsbl %al,%eax
 28b:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 28f:	0f b6 01             	movzbl (%ecx),%eax
 292:	8d 58 d0             	lea    -0x30(%eax),%ebx
 295:	80 fb 09             	cmp    $0x9,%bl
 298:	76 e5                	jbe    27f <atoi+0xe>
  return n;
}
 29a:	89 d0                	mov    %edx,%eax
 29c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 29f:	c9                   	leave  
 2a0:	c3                   	ret    

000002a1 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2a1:	55                   	push   %ebp
 2a2:	89 e5                	mov    %esp,%ebp
 2a4:	56                   	push   %esi
 2a5:	53                   	push   %ebx
 2a6:	8b 75 08             	mov    0x8(%ebp),%esi
 2a9:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 2ac:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 2af:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 2b1:	eb 0d                	jmp    2c0 <memmove+0x1f>
    *dst++ = *src++;
 2b3:	0f b6 01             	movzbl (%ecx),%eax
 2b6:	88 02                	mov    %al,(%edx)
 2b8:	8d 49 01             	lea    0x1(%ecx),%ecx
 2bb:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 2be:	89 d8                	mov    %ebx,%eax
 2c0:	8d 58 ff             	lea    -0x1(%eax),%ebx
 2c3:	85 c0                	test   %eax,%eax
 2c5:	7f ec                	jg     2b3 <memmove+0x12>
  return vdst;
}
 2c7:	89 f0                	mov    %esi,%eax
 2c9:	5b                   	pop    %ebx
 2ca:	5e                   	pop    %esi
 2cb:	5d                   	pop    %ebp
 2cc:	c3                   	ret    

000002cd <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2cd:	b8 01 00 00 00       	mov    $0x1,%eax
 2d2:	cd 40                	int    $0x40
 2d4:	c3                   	ret    

000002d5 <exit>:
SYSCALL(exit)
 2d5:	b8 02 00 00 00       	mov    $0x2,%eax
 2da:	cd 40                	int    $0x40
 2dc:	c3                   	ret    

000002dd <wait>:
SYSCALL(wait)
 2dd:	b8 03 00 00 00       	mov    $0x3,%eax
 2e2:	cd 40                	int    $0x40
 2e4:	c3                   	ret    

000002e5 <pipe>:
SYSCALL(pipe)
 2e5:	b8 04 00 00 00       	mov    $0x4,%eax
 2ea:	cd 40                	int    $0x40
 2ec:	c3                   	ret    

000002ed <read>:
SYSCALL(read)
 2ed:	b8 05 00 00 00       	mov    $0x5,%eax
 2f2:	cd 40                	int    $0x40
 2f4:	c3                   	ret    

000002f5 <write>:
SYSCALL(write)
 2f5:	b8 10 00 00 00       	mov    $0x10,%eax
 2fa:	cd 40                	int    $0x40
 2fc:	c3                   	ret    

000002fd <close>:
SYSCALL(close)
 2fd:	b8 15 00 00 00       	mov    $0x15,%eax
 302:	cd 40                	int    $0x40
 304:	c3                   	ret    

00000305 <kill>:
SYSCALL(kill)
 305:	b8 06 00 00 00       	mov    $0x6,%eax
 30a:	cd 40                	int    $0x40
 30c:	c3                   	ret    

0000030d <exec>:
SYSCALL(exec)
 30d:	b8 07 00 00 00       	mov    $0x7,%eax
 312:	cd 40                	int    $0x40
 314:	c3                   	ret    

00000315 <open>:
SYSCALL(open)
 315:	b8 0f 00 00 00       	mov    $0xf,%eax
 31a:	cd 40                	int    $0x40
 31c:	c3                   	ret    

0000031d <mknod>:
SYSCALL(mknod)
 31d:	b8 11 00 00 00       	mov    $0x11,%eax
 322:	cd 40                	int    $0x40
 324:	c3                   	ret    

00000325 <unlink>:
SYSCALL(unlink)
 325:	b8 12 00 00 00       	mov    $0x12,%eax
 32a:	cd 40                	int    $0x40
 32c:	c3                   	ret    

0000032d <fstat>:
SYSCALL(fstat)
 32d:	b8 08 00 00 00       	mov    $0x8,%eax
 332:	cd 40                	int    $0x40
 334:	c3                   	ret    

00000335 <link>:
SYSCALL(link)
 335:	b8 13 00 00 00       	mov    $0x13,%eax
 33a:	cd 40                	int    $0x40
 33c:	c3                   	ret    

0000033d <mkdir>:
SYSCALL(mkdir)
 33d:	b8 14 00 00 00       	mov    $0x14,%eax
 342:	cd 40                	int    $0x40
 344:	c3                   	ret    

00000345 <chdir>:
SYSCALL(chdir)
 345:	b8 09 00 00 00       	mov    $0x9,%eax
 34a:	cd 40                	int    $0x40
 34c:	c3                   	ret    

0000034d <dup>:
SYSCALL(dup)
 34d:	b8 0a 00 00 00       	mov    $0xa,%eax
 352:	cd 40                	int    $0x40
 354:	c3                   	ret    

00000355 <getpid>:
SYSCALL(getpid)
 355:	b8 0b 00 00 00       	mov    $0xb,%eax
 35a:	cd 40                	int    $0x40
 35c:	c3                   	ret    

0000035d <sbrk>:
SYSCALL(sbrk)
 35d:	b8 0c 00 00 00       	mov    $0xc,%eax
 362:	cd 40                	int    $0x40
 364:	c3                   	ret    

00000365 <sleep>:
SYSCALL(sleep)
 365:	b8 0d 00 00 00       	mov    $0xd,%eax
 36a:	cd 40                	int    $0x40
 36c:	c3                   	ret    

0000036d <uptime>:
SYSCALL(uptime)
 36d:	b8 0e 00 00 00       	mov    $0xe,%eax
 372:	cd 40                	int    $0x40
 374:	c3                   	ret    

00000375 <clone>:
SYSCALL(clone)
 375:	b8 16 00 00 00       	mov    $0x16,%eax
 37a:	cd 40                	int    $0x40
 37c:	c3                   	ret    

0000037d <join>:
 37d:	b8 17 00 00 00       	mov    $0x17,%eax
 382:	cd 40                	int    $0x40
 384:	c3                   	ret    

00000385 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 385:	55                   	push   %ebp
 386:	89 e5                	mov    %esp,%ebp
 388:	83 ec 1c             	sub    $0x1c,%esp
 38b:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 38e:	6a 01                	push   $0x1
 390:	8d 55 f4             	lea    -0xc(%ebp),%edx
 393:	52                   	push   %edx
 394:	50                   	push   %eax
 395:	e8 5b ff ff ff       	call   2f5 <write>
}
 39a:	83 c4 10             	add    $0x10,%esp
 39d:	c9                   	leave  
 39e:	c3                   	ret    

0000039f <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 39f:	55                   	push   %ebp
 3a0:	89 e5                	mov    %esp,%ebp
 3a2:	57                   	push   %edi
 3a3:	56                   	push   %esi
 3a4:	53                   	push   %ebx
 3a5:	83 ec 2c             	sub    $0x2c,%esp
 3a8:	89 45 d0             	mov    %eax,-0x30(%ebp)
 3ab:	89 d0                	mov    %edx,%eax
 3ad:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 3af:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 3b3:	0f 95 c1             	setne  %cl
 3b6:	c1 ea 1f             	shr    $0x1f,%edx
 3b9:	84 d1                	test   %dl,%cl
 3bb:	74 44                	je     401 <printint+0x62>
    neg = 1;
    x = -xx;
 3bd:	f7 d8                	neg    %eax
 3bf:	89 c1                	mov    %eax,%ecx
    neg = 1;
 3c1:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 3c8:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 3cd:	89 c8                	mov    %ecx,%eax
 3cf:	ba 00 00 00 00       	mov    $0x0,%edx
 3d4:	f7 f6                	div    %esi
 3d6:	89 df                	mov    %ebx,%edi
 3d8:	83 c3 01             	add    $0x1,%ebx
 3db:	0f b6 92 38 07 00 00 	movzbl 0x738(%edx),%edx
 3e2:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 3e6:	89 ca                	mov    %ecx,%edx
 3e8:	89 c1                	mov    %eax,%ecx
 3ea:	39 d6                	cmp    %edx,%esi
 3ec:	76 df                	jbe    3cd <printint+0x2e>
  if(neg)
 3ee:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 3f2:	74 31                	je     425 <printint+0x86>
    buf[i++] = '-';
 3f4:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 3f9:	8d 5f 02             	lea    0x2(%edi),%ebx
 3fc:	8b 75 d0             	mov    -0x30(%ebp),%esi
 3ff:	eb 17                	jmp    418 <printint+0x79>
    x = xx;
 401:	89 c1                	mov    %eax,%ecx
  neg = 0;
 403:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 40a:	eb bc                	jmp    3c8 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 40c:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 411:	89 f0                	mov    %esi,%eax
 413:	e8 6d ff ff ff       	call   385 <putc>
  while(--i >= 0)
 418:	83 eb 01             	sub    $0x1,%ebx
 41b:	79 ef                	jns    40c <printint+0x6d>
}
 41d:	83 c4 2c             	add    $0x2c,%esp
 420:	5b                   	pop    %ebx
 421:	5e                   	pop    %esi
 422:	5f                   	pop    %edi
 423:	5d                   	pop    %ebp
 424:	c3                   	ret    
 425:	8b 75 d0             	mov    -0x30(%ebp),%esi
 428:	eb ee                	jmp    418 <printint+0x79>

0000042a <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 42a:	55                   	push   %ebp
 42b:	89 e5                	mov    %esp,%ebp
 42d:	57                   	push   %edi
 42e:	56                   	push   %esi
 42f:	53                   	push   %ebx
 430:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 433:	8d 45 10             	lea    0x10(%ebp),%eax
 436:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 439:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 43e:	bb 00 00 00 00       	mov    $0x0,%ebx
 443:	eb 14                	jmp    459 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 445:	89 fa                	mov    %edi,%edx
 447:	8b 45 08             	mov    0x8(%ebp),%eax
 44a:	e8 36 ff ff ff       	call   385 <putc>
 44f:	eb 05                	jmp    456 <printf+0x2c>
      }
    } else if(state == '%'){
 451:	83 fe 25             	cmp    $0x25,%esi
 454:	74 25                	je     47b <printf+0x51>
  for(i = 0; fmt[i]; i++){
 456:	83 c3 01             	add    $0x1,%ebx
 459:	8b 45 0c             	mov    0xc(%ebp),%eax
 45c:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 460:	84 c0                	test   %al,%al
 462:	0f 84 20 01 00 00    	je     588 <printf+0x15e>
    c = fmt[i] & 0xff;
 468:	0f be f8             	movsbl %al,%edi
 46b:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 46e:	85 f6                	test   %esi,%esi
 470:	75 df                	jne    451 <printf+0x27>
      if(c == '%'){
 472:	83 f8 25             	cmp    $0x25,%eax
 475:	75 ce                	jne    445 <printf+0x1b>
        state = '%';
 477:	89 c6                	mov    %eax,%esi
 479:	eb db                	jmp    456 <printf+0x2c>
      if(c == 'd'){
 47b:	83 f8 25             	cmp    $0x25,%eax
 47e:	0f 84 cf 00 00 00    	je     553 <printf+0x129>
 484:	0f 8c dd 00 00 00    	jl     567 <printf+0x13d>
 48a:	83 f8 78             	cmp    $0x78,%eax
 48d:	0f 8f d4 00 00 00    	jg     567 <printf+0x13d>
 493:	83 f8 63             	cmp    $0x63,%eax
 496:	0f 8c cb 00 00 00    	jl     567 <printf+0x13d>
 49c:	83 e8 63             	sub    $0x63,%eax
 49f:	83 f8 15             	cmp    $0x15,%eax
 4a2:	0f 87 bf 00 00 00    	ja     567 <printf+0x13d>
 4a8:	ff 24 85 e0 06 00 00 	jmp    *0x6e0(,%eax,4)
        printint(fd, *ap, 10, 1);
 4af:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4b2:	8b 17                	mov    (%edi),%edx
 4b4:	83 ec 0c             	sub    $0xc,%esp
 4b7:	6a 01                	push   $0x1
 4b9:	b9 0a 00 00 00       	mov    $0xa,%ecx
 4be:	8b 45 08             	mov    0x8(%ebp),%eax
 4c1:	e8 d9 fe ff ff       	call   39f <printint>
        ap++;
 4c6:	83 c7 04             	add    $0x4,%edi
 4c9:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 4cc:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 4cf:	be 00 00 00 00       	mov    $0x0,%esi
 4d4:	eb 80                	jmp    456 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 4d6:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4d9:	8b 17                	mov    (%edi),%edx
 4db:	83 ec 0c             	sub    $0xc,%esp
 4de:	6a 00                	push   $0x0
 4e0:	b9 10 00 00 00       	mov    $0x10,%ecx
 4e5:	8b 45 08             	mov    0x8(%ebp),%eax
 4e8:	e8 b2 fe ff ff       	call   39f <printint>
        ap++;
 4ed:	83 c7 04             	add    $0x4,%edi
 4f0:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 4f3:	83 c4 10             	add    $0x10,%esp
      state = 0;
 4f6:	be 00 00 00 00       	mov    $0x0,%esi
 4fb:	e9 56 ff ff ff       	jmp    456 <printf+0x2c>
        s = (char*)*ap;
 500:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 503:	8b 30                	mov    (%eax),%esi
        ap++;
 505:	83 c0 04             	add    $0x4,%eax
 508:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 50b:	85 f6                	test   %esi,%esi
 50d:	75 15                	jne    524 <printf+0xfa>
          s = "(null)";
 50f:	be d8 06 00 00       	mov    $0x6d8,%esi
 514:	eb 0e                	jmp    524 <printf+0xfa>
          putc(fd, *s);
 516:	0f be d2             	movsbl %dl,%edx
 519:	8b 45 08             	mov    0x8(%ebp),%eax
 51c:	e8 64 fe ff ff       	call   385 <putc>
          s++;
 521:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 524:	0f b6 16             	movzbl (%esi),%edx
 527:	84 d2                	test   %dl,%dl
 529:	75 eb                	jne    516 <printf+0xec>
      state = 0;
 52b:	be 00 00 00 00       	mov    $0x0,%esi
 530:	e9 21 ff ff ff       	jmp    456 <printf+0x2c>
        putc(fd, *ap);
 535:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 538:	0f be 17             	movsbl (%edi),%edx
 53b:	8b 45 08             	mov    0x8(%ebp),%eax
 53e:	e8 42 fe ff ff       	call   385 <putc>
        ap++;
 543:	83 c7 04             	add    $0x4,%edi
 546:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 549:	be 00 00 00 00       	mov    $0x0,%esi
 54e:	e9 03 ff ff ff       	jmp    456 <printf+0x2c>
        putc(fd, c);
 553:	89 fa                	mov    %edi,%edx
 555:	8b 45 08             	mov    0x8(%ebp),%eax
 558:	e8 28 fe ff ff       	call   385 <putc>
      state = 0;
 55d:	be 00 00 00 00       	mov    $0x0,%esi
 562:	e9 ef fe ff ff       	jmp    456 <printf+0x2c>
        putc(fd, '%');
 567:	ba 25 00 00 00       	mov    $0x25,%edx
 56c:	8b 45 08             	mov    0x8(%ebp),%eax
 56f:	e8 11 fe ff ff       	call   385 <putc>
        putc(fd, c);
 574:	89 fa                	mov    %edi,%edx
 576:	8b 45 08             	mov    0x8(%ebp),%eax
 579:	e8 07 fe ff ff       	call   385 <putc>
      state = 0;
 57e:	be 00 00 00 00       	mov    $0x0,%esi
 583:	e9 ce fe ff ff       	jmp    456 <printf+0x2c>
    }
  }
}
 588:	8d 65 f4             	lea    -0xc(%ebp),%esp
 58b:	5b                   	pop    %ebx
 58c:	5e                   	pop    %esi
 58d:	5f                   	pop    %edi
 58e:	5d                   	pop    %ebp
 58f:	c3                   	ret    

00000590 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 590:	55                   	push   %ebp
 591:	89 e5                	mov    %esp,%ebp
 593:	57                   	push   %edi
 594:	56                   	push   %esi
 595:	53                   	push   %ebx
 596:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 599:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 59c:	a1 c0 0b 00 00       	mov    0xbc0,%eax
 5a1:	eb 02                	jmp    5a5 <free+0x15>
 5a3:	89 d0                	mov    %edx,%eax
 5a5:	39 c8                	cmp    %ecx,%eax
 5a7:	73 04                	jae    5ad <free+0x1d>
 5a9:	39 08                	cmp    %ecx,(%eax)
 5ab:	77 12                	ja     5bf <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5ad:	8b 10                	mov    (%eax),%edx
 5af:	39 c2                	cmp    %eax,%edx
 5b1:	77 f0                	ja     5a3 <free+0x13>
 5b3:	39 c8                	cmp    %ecx,%eax
 5b5:	72 08                	jb     5bf <free+0x2f>
 5b7:	39 ca                	cmp    %ecx,%edx
 5b9:	77 04                	ja     5bf <free+0x2f>
 5bb:	89 d0                	mov    %edx,%eax
 5bd:	eb e6                	jmp    5a5 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 5bf:	8b 73 fc             	mov    -0x4(%ebx),%esi
 5c2:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 5c5:	8b 10                	mov    (%eax),%edx
 5c7:	39 d7                	cmp    %edx,%edi
 5c9:	74 19                	je     5e4 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 5cb:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 5ce:	8b 50 04             	mov    0x4(%eax),%edx
 5d1:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 5d4:	39 ce                	cmp    %ecx,%esi
 5d6:	74 1b                	je     5f3 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 5d8:	89 08                	mov    %ecx,(%eax)
  freep = p;
 5da:	a3 c0 0b 00 00       	mov    %eax,0xbc0
}
 5df:	5b                   	pop    %ebx
 5e0:	5e                   	pop    %esi
 5e1:	5f                   	pop    %edi
 5e2:	5d                   	pop    %ebp
 5e3:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 5e4:	03 72 04             	add    0x4(%edx),%esi
 5e7:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 5ea:	8b 10                	mov    (%eax),%edx
 5ec:	8b 12                	mov    (%edx),%edx
 5ee:	89 53 f8             	mov    %edx,-0x8(%ebx)
 5f1:	eb db                	jmp    5ce <free+0x3e>
    p->s.size += bp->s.size;
 5f3:	03 53 fc             	add    -0x4(%ebx),%edx
 5f6:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 5f9:	8b 53 f8             	mov    -0x8(%ebx),%edx
 5fc:	89 10                	mov    %edx,(%eax)
 5fe:	eb da                	jmp    5da <free+0x4a>

00000600 <morecore>:

static Header*
morecore(uint nu)
{
 600:	55                   	push   %ebp
 601:	89 e5                	mov    %esp,%ebp
 603:	53                   	push   %ebx
 604:	83 ec 04             	sub    $0x4,%esp
 607:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 609:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 60e:	77 05                	ja     615 <morecore+0x15>
    nu = 4096;
 610:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 615:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 61c:	83 ec 0c             	sub    $0xc,%esp
 61f:	50                   	push   %eax
 620:	e8 38 fd ff ff       	call   35d <sbrk>
  if(p == (char*)-1)
 625:	83 c4 10             	add    $0x10,%esp
 628:	83 f8 ff             	cmp    $0xffffffff,%eax
 62b:	74 1c                	je     649 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 62d:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 630:	83 c0 08             	add    $0x8,%eax
 633:	83 ec 0c             	sub    $0xc,%esp
 636:	50                   	push   %eax
 637:	e8 54 ff ff ff       	call   590 <free>
  return freep;
 63c:	a1 c0 0b 00 00       	mov    0xbc0,%eax
 641:	83 c4 10             	add    $0x10,%esp
}
 644:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 647:	c9                   	leave  
 648:	c3                   	ret    
    return 0;
 649:	b8 00 00 00 00       	mov    $0x0,%eax
 64e:	eb f4                	jmp    644 <morecore+0x44>

00000650 <malloc>:

void*
malloc(uint nbytes)
{
 650:	55                   	push   %ebp
 651:	89 e5                	mov    %esp,%ebp
 653:	53                   	push   %ebx
 654:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 657:	8b 45 08             	mov    0x8(%ebp),%eax
 65a:	8d 58 07             	lea    0x7(%eax),%ebx
 65d:	c1 eb 03             	shr    $0x3,%ebx
 660:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 663:	8b 0d c0 0b 00 00    	mov    0xbc0,%ecx
 669:	85 c9                	test   %ecx,%ecx
 66b:	74 04                	je     671 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 66d:	8b 01                	mov    (%ecx),%eax
 66f:	eb 4a                	jmp    6bb <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 671:	c7 05 c0 0b 00 00 c4 	movl   $0xbc4,0xbc0
 678:	0b 00 00 
 67b:	c7 05 c4 0b 00 00 c4 	movl   $0xbc4,0xbc4
 682:	0b 00 00 
    base.s.size = 0;
 685:	c7 05 c8 0b 00 00 00 	movl   $0x0,0xbc8
 68c:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 68f:	b9 c4 0b 00 00       	mov    $0xbc4,%ecx
 694:	eb d7                	jmp    66d <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 696:	74 19                	je     6b1 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 698:	29 da                	sub    %ebx,%edx
 69a:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 69d:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 6a0:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 6a3:	89 0d c0 0b 00 00    	mov    %ecx,0xbc0
      return (void*)(p + 1);
 6a9:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 6ac:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 6af:	c9                   	leave  
 6b0:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 6b1:	8b 10                	mov    (%eax),%edx
 6b3:	89 11                	mov    %edx,(%ecx)
 6b5:	eb ec                	jmp    6a3 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6b7:	89 c1                	mov    %eax,%ecx
 6b9:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 6bb:	8b 50 04             	mov    0x4(%eax),%edx
 6be:	39 da                	cmp    %ebx,%edx
 6c0:	73 d4                	jae    696 <malloc+0x46>
    if(p == freep)
 6c2:	39 05 c0 0b 00 00    	cmp    %eax,0xbc0
 6c8:	75 ed                	jne    6b7 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 6ca:	89 d8                	mov    %ebx,%eax
 6cc:	e8 2f ff ff ff       	call   600 <morecore>
 6d1:	85 c0                	test   %eax,%eax
 6d3:	75 e2                	jne    6b7 <malloc+0x67>
 6d5:	eb d5                	jmp    6ac <malloc+0x5c>
