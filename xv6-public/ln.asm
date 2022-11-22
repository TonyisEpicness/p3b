
_ln:     file format elf32-i386


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
   d:	53                   	push   %ebx
   e:	51                   	push   %ecx
   f:	8b 59 04             	mov    0x4(%ecx),%ebx
  if(argc != 3){
  12:	83 39 03             	cmpl   $0x3,(%ecx)
  15:	74 14                	je     2b <main+0x2b>
    printf(2, "Usage: ln old new\n");
  17:	83 ec 08             	sub    $0x8,%esp
  1a:	68 08 07 00 00       	push   $0x708
  1f:	6a 02                	push   $0x2
  21:	e8 32 04 00 00       	call   458 <printf>
    exit();
  26:	e8 d8 02 00 00       	call   303 <exit>
  }
  if(link(argv[1], argv[2]) < 0)
  2b:	83 ec 08             	sub    $0x8,%esp
  2e:	ff 73 08             	push   0x8(%ebx)
  31:	ff 73 04             	push   0x4(%ebx)
  34:	e8 2a 03 00 00       	call   363 <link>
  39:	83 c4 10             	add    $0x10,%esp
  3c:	85 c0                	test   %eax,%eax
  3e:	78 05                	js     45 <main+0x45>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  exit();
  40:	e8 be 02 00 00       	call   303 <exit>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  45:	ff 73 08             	push   0x8(%ebx)
  48:	ff 73 04             	push   0x4(%ebx)
  4b:	68 1b 07 00 00       	push   $0x71b
  50:	6a 02                	push   $0x2
  52:	e8 01 04 00 00       	call   458 <printf>
  57:	83 c4 10             	add    $0x10,%esp
  5a:	eb e4                	jmp    40 <main+0x40>

0000005c <test_and_set>:
  int flag;
};

struct thread_ref *threads[64];

int test_and_set(int *old_ptr, int new_ptr) {
  5c:	55                   	push   %ebp
  5d:	89 e5                	mov    %esp,%ebp
  5f:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *old_ptr;
  62:	8b 10                	mov    (%eax),%edx
  *old_ptr = new_ptr;
  64:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  67:	89 08                	mov    %ecx,(%eax)
  return old;
}
  69:	89 d0                	mov    %edx,%eax
  6b:	5d                   	pop    %ebp
  6c:	c3                   	ret    

0000006d <thread_create>:

// a wrapper func for clone
int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
  6d:	55                   	push   %ebp
  6e:	89 e5                	mov    %esp,%ebp
  70:	83 ec 14             	sub    $0x14,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE*2);
  73:	68 00 20 00 00       	push   $0x2000
  78:	e8 01 06 00 00       	call   67e <malloc>
  if(n_stack == 0){
  7d:	83 c4 10             	add    $0x10,%esp
  80:	85 c0                	test   %eax,%eax
  82:	74 4a                	je     ce <thread_create+0x61>
    return -1;
  }
  
  for(int i=0; i<64; i++){
  84:	ba 00 00 00 00       	mov    $0x0,%edx
  89:	eb 03                	jmp    8e <thread_create+0x21>
  8b:	83 c2 01             	add    $0x1,%edx
  8e:	83 fa 3f             	cmp    $0x3f,%edx
  91:	7f 27                	jg     ba <thread_create+0x4d>
    if(threads[i]->flag==0){
  93:	8b 0c 95 20 0b 00 00 	mov    0xb20(,%edx,4),%ecx
  9a:	83 79 08 00          	cmpl   $0x0,0x8(%ecx)
  9e:	75 eb                	jne    8b <thread_create+0x1e>
      threads[i]->maddr = n_stack;
  a0:	89 01                	mov    %eax,(%ecx)
      threads[i]->pg1addr = n_stack;
  a2:	8b 0c 95 20 0b 00 00 	mov    0xb20(,%edx,4),%ecx
  a9:	89 41 04             	mov    %eax,0x4(%ecx)
      threads[i]->flag = 1;
  ac:	8b 14 95 20 0b 00 00 	mov    0xb20(,%edx,4),%edx
  b3:	c7 42 08 01 00 00 00 	movl   $0x1,0x8(%edx)
      break;
    }
  }
  
  int new_pid = clone(start_routine, arg1, arg2, n_stack); // TODO: is this the right way to call it?
  ba:	50                   	push   %eax
  bb:	ff 75 10             	push   0x10(%ebp)
  be:	ff 75 0c             	push   0xc(%ebp)
  c1:	ff 75 08             	push   0x8(%ebp)
  c4:	e8 da 02 00 00       	call   3a3 <clone>

  // I can't remember if there was something else to do here but I'm sure I'll find out



  return new_pid;
  c9:	83 c4 10             	add    $0x10,%esp
}
  cc:	c9                   	leave  
  cd:	c3                   	ret    
    return -1;
  ce:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  d3:	eb f7                	jmp    cc <thread_create+0x5f>

000000d5 <thread_join>:

//TODO: fix
int thread_join() {
  d5:	55                   	push   %ebp
  d6:	89 e5                	mov    %esp,%ebp
  d8:	56                   	push   %esi
  d9:	53                   	push   %ebx
  da:	83 ec 1c             	sub    $0x1c,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
  dd:	8d 45 f4             	lea    -0xc(%ebp),%eax
  e0:	50                   	push   %eax
  e1:	e8 c5 02 00 00       	call   3ab <join>
  e6:	89 c6                	mov    %eax,%esi
  for(int i=0; i<64; i++){
  e8:	83 c4 10             	add    $0x10,%esp
  eb:	bb 00 00 00 00       	mov    $0x0,%ebx
  f0:	eb 03                	jmp    f5 <thread_join+0x20>
  f2:	83 c3 01             	add    $0x1,%ebx
  f5:	83 fb 3f             	cmp    $0x3f,%ebx
  f8:	7f 23                	jg     11d <thread_join+0x48>
    if((threads[i]->flag==1) && (stk_addr == threads[i]->pg1addr)){
  fa:	8b 04 9d 20 0b 00 00 	mov    0xb20(,%ebx,4),%eax
 101:	83 78 08 01          	cmpl   $0x1,0x8(%eax)
 105:	75 eb                	jne    f2 <thread_join+0x1d>
 107:	8b 55 f4             	mov    -0xc(%ebp),%edx
 10a:	39 50 04             	cmp    %edx,0x4(%eax)
 10d:	75 e3                	jne    f2 <thread_join+0x1d>
      free(stk_addr);
 10f:	83 ec 0c             	sub    $0xc,%esp
 112:	52                   	push   %edx
 113:	e8 a6 04 00 00       	call   5be <free>
 118:	83 c4 10             	add    $0x10,%esp
 11b:	eb d5                	jmp    f2 <thread_join+0x1d>
    }
  }
  return pid;
}
 11d:	89 f0                	mov    %esi,%eax
 11f:	8d 65 f8             	lea    -0x8(%ebp),%esp
 122:	5b                   	pop    %ebx
 123:	5e                   	pop    %esi
 124:	5d                   	pop    %ebp
 125:	c3                   	ret    

00000126 <lock_acquire>:

void lock_acquire(lock_t *lock){
 126:	55                   	push   %ebp
 127:	89 e5                	mov    %esp,%ebp
 129:	53                   	push   %ebx
 12a:	83 ec 04             	sub    $0x4,%esp
 12d:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 130:	83 ec 08             	sub    $0x8,%esp
 133:	6a 01                	push   $0x1
 135:	53                   	push   %ebx
 136:	e8 21 ff ff ff       	call   5c <test_and_set>
 13b:	83 c4 10             	add    $0x10,%esp
 13e:	83 f8 01             	cmp    $0x1,%eax
 141:	74 ed                	je     130 <lock_acquire+0xa>
    ;
}
 143:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 146:	c9                   	leave  
 147:	c3                   	ret    

00000148 <lock_release>:

void lock_release(lock_t *lock) {
 148:	55                   	push   %ebp
 149:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 14b:	8b 45 08             	mov    0x8(%ebp),%eax
 14e:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 154:	5d                   	pop    %ebp
 155:	c3                   	ret    

00000156 <lock_init>:

void lock_init(lock_t *lock) {
 156:	55                   	push   %ebp
 157:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 159:	8b 45 08             	mov    0x8(%ebp),%eax
 15c:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 162:	5d                   	pop    %ebp
 163:	c3                   	ret    

00000164 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 164:	55                   	push   %ebp
 165:	89 e5                	mov    %esp,%ebp
 167:	56                   	push   %esi
 168:	53                   	push   %ebx
 169:	8b 75 08             	mov    0x8(%ebp),%esi
 16c:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 16f:	89 f0                	mov    %esi,%eax
 171:	89 d1                	mov    %edx,%ecx
 173:	83 c2 01             	add    $0x1,%edx
 176:	89 c3                	mov    %eax,%ebx
 178:	83 c0 01             	add    $0x1,%eax
 17b:	0f b6 09             	movzbl (%ecx),%ecx
 17e:	88 0b                	mov    %cl,(%ebx)
 180:	84 c9                	test   %cl,%cl
 182:	75 ed                	jne    171 <strcpy+0xd>
    ;
  return os;
}
 184:	89 f0                	mov    %esi,%eax
 186:	5b                   	pop    %ebx
 187:	5e                   	pop    %esi
 188:	5d                   	pop    %ebp
 189:	c3                   	ret    

0000018a <strcmp>:

int
strcmp(const char *p, const char *q)
{
 18a:	55                   	push   %ebp
 18b:	89 e5                	mov    %esp,%ebp
 18d:	8b 4d 08             	mov    0x8(%ebp),%ecx
 190:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 193:	eb 06                	jmp    19b <strcmp+0x11>
    p++, q++;
 195:	83 c1 01             	add    $0x1,%ecx
 198:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 19b:	0f b6 01             	movzbl (%ecx),%eax
 19e:	84 c0                	test   %al,%al
 1a0:	74 04                	je     1a6 <strcmp+0x1c>
 1a2:	3a 02                	cmp    (%edx),%al
 1a4:	74 ef                	je     195 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 1a6:	0f b6 c0             	movzbl %al,%eax
 1a9:	0f b6 12             	movzbl (%edx),%edx
 1ac:	29 d0                	sub    %edx,%eax
}
 1ae:	5d                   	pop    %ebp
 1af:	c3                   	ret    

000001b0 <strlen>:

uint
strlen(const char *s)
{
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 1b6:	b8 00 00 00 00       	mov    $0x0,%eax
 1bb:	eb 03                	jmp    1c0 <strlen+0x10>
 1bd:	83 c0 01             	add    $0x1,%eax
 1c0:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 1c4:	75 f7                	jne    1bd <strlen+0xd>
    ;
  return n;
}
 1c6:	5d                   	pop    %ebp
 1c7:	c3                   	ret    

000001c8 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1c8:	55                   	push   %ebp
 1c9:	89 e5                	mov    %esp,%ebp
 1cb:	57                   	push   %edi
 1cc:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1cf:	89 d7                	mov    %edx,%edi
 1d1:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1d4:	8b 45 0c             	mov    0xc(%ebp),%eax
 1d7:	fc                   	cld    
 1d8:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1da:	89 d0                	mov    %edx,%eax
 1dc:	8b 7d fc             	mov    -0x4(%ebp),%edi
 1df:	c9                   	leave  
 1e0:	c3                   	ret    

000001e1 <strchr>:

char*
strchr(const char *s, char c)
{
 1e1:	55                   	push   %ebp
 1e2:	89 e5                	mov    %esp,%ebp
 1e4:	8b 45 08             	mov    0x8(%ebp),%eax
 1e7:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1eb:	eb 03                	jmp    1f0 <strchr+0xf>
 1ed:	83 c0 01             	add    $0x1,%eax
 1f0:	0f b6 10             	movzbl (%eax),%edx
 1f3:	84 d2                	test   %dl,%dl
 1f5:	74 06                	je     1fd <strchr+0x1c>
    if(*s == c)
 1f7:	38 ca                	cmp    %cl,%dl
 1f9:	75 f2                	jne    1ed <strchr+0xc>
 1fb:	eb 05                	jmp    202 <strchr+0x21>
      return (char*)s;
  return 0;
 1fd:	b8 00 00 00 00       	mov    $0x0,%eax
}
 202:	5d                   	pop    %ebp
 203:	c3                   	ret    

00000204 <gets>:

char*
gets(char *buf, int max)
{
 204:	55                   	push   %ebp
 205:	89 e5                	mov    %esp,%ebp
 207:	57                   	push   %edi
 208:	56                   	push   %esi
 209:	53                   	push   %ebx
 20a:	83 ec 1c             	sub    $0x1c,%esp
 20d:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 210:	bb 00 00 00 00       	mov    $0x0,%ebx
 215:	89 de                	mov    %ebx,%esi
 217:	83 c3 01             	add    $0x1,%ebx
 21a:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 21d:	7d 2e                	jge    24d <gets+0x49>
    cc = read(0, &c, 1);
 21f:	83 ec 04             	sub    $0x4,%esp
 222:	6a 01                	push   $0x1
 224:	8d 45 e7             	lea    -0x19(%ebp),%eax
 227:	50                   	push   %eax
 228:	6a 00                	push   $0x0
 22a:	e8 ec 00 00 00       	call   31b <read>
    if(cc < 1)
 22f:	83 c4 10             	add    $0x10,%esp
 232:	85 c0                	test   %eax,%eax
 234:	7e 17                	jle    24d <gets+0x49>
      break;
    buf[i++] = c;
 236:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 23a:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 23d:	3c 0a                	cmp    $0xa,%al
 23f:	0f 94 c2             	sete   %dl
 242:	3c 0d                	cmp    $0xd,%al
 244:	0f 94 c0             	sete   %al
 247:	08 c2                	or     %al,%dl
 249:	74 ca                	je     215 <gets+0x11>
    buf[i++] = c;
 24b:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 24d:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 251:	89 f8                	mov    %edi,%eax
 253:	8d 65 f4             	lea    -0xc(%ebp),%esp
 256:	5b                   	pop    %ebx
 257:	5e                   	pop    %esi
 258:	5f                   	pop    %edi
 259:	5d                   	pop    %ebp
 25a:	c3                   	ret    

0000025b <stat>:

int
stat(const char *n, struct stat *st)
{
 25b:	55                   	push   %ebp
 25c:	89 e5                	mov    %esp,%ebp
 25e:	56                   	push   %esi
 25f:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 260:	83 ec 08             	sub    $0x8,%esp
 263:	6a 00                	push   $0x0
 265:	ff 75 08             	push   0x8(%ebp)
 268:	e8 d6 00 00 00       	call   343 <open>
  if(fd < 0)
 26d:	83 c4 10             	add    $0x10,%esp
 270:	85 c0                	test   %eax,%eax
 272:	78 24                	js     298 <stat+0x3d>
 274:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 276:	83 ec 08             	sub    $0x8,%esp
 279:	ff 75 0c             	push   0xc(%ebp)
 27c:	50                   	push   %eax
 27d:	e8 d9 00 00 00       	call   35b <fstat>
 282:	89 c6                	mov    %eax,%esi
  close(fd);
 284:	89 1c 24             	mov    %ebx,(%esp)
 287:	e8 9f 00 00 00       	call   32b <close>
  return r;
 28c:	83 c4 10             	add    $0x10,%esp
}
 28f:	89 f0                	mov    %esi,%eax
 291:	8d 65 f8             	lea    -0x8(%ebp),%esp
 294:	5b                   	pop    %ebx
 295:	5e                   	pop    %esi
 296:	5d                   	pop    %ebp
 297:	c3                   	ret    
    return -1;
 298:	be ff ff ff ff       	mov    $0xffffffff,%esi
 29d:	eb f0                	jmp    28f <stat+0x34>

0000029f <atoi>:

int
atoi(const char *s)
{
 29f:	55                   	push   %ebp
 2a0:	89 e5                	mov    %esp,%ebp
 2a2:	53                   	push   %ebx
 2a3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 2a6:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 2ab:	eb 10                	jmp    2bd <atoi+0x1e>
    n = n*10 + *s++ - '0';
 2ad:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 2b0:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 2b3:	83 c1 01             	add    $0x1,%ecx
 2b6:	0f be c0             	movsbl %al,%eax
 2b9:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 2bd:	0f b6 01             	movzbl (%ecx),%eax
 2c0:	8d 58 d0             	lea    -0x30(%eax),%ebx
 2c3:	80 fb 09             	cmp    $0x9,%bl
 2c6:	76 e5                	jbe    2ad <atoi+0xe>
  return n;
}
 2c8:	89 d0                	mov    %edx,%eax
 2ca:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2cd:	c9                   	leave  
 2ce:	c3                   	ret    

000002cf <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2cf:	55                   	push   %ebp
 2d0:	89 e5                	mov    %esp,%ebp
 2d2:	56                   	push   %esi
 2d3:	53                   	push   %ebx
 2d4:	8b 75 08             	mov    0x8(%ebp),%esi
 2d7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 2da:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 2dd:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 2df:	eb 0d                	jmp    2ee <memmove+0x1f>
    *dst++ = *src++;
 2e1:	0f b6 01             	movzbl (%ecx),%eax
 2e4:	88 02                	mov    %al,(%edx)
 2e6:	8d 49 01             	lea    0x1(%ecx),%ecx
 2e9:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 2ec:	89 d8                	mov    %ebx,%eax
 2ee:	8d 58 ff             	lea    -0x1(%eax),%ebx
 2f1:	85 c0                	test   %eax,%eax
 2f3:	7f ec                	jg     2e1 <memmove+0x12>
  return vdst;
}
 2f5:	89 f0                	mov    %esi,%eax
 2f7:	5b                   	pop    %ebx
 2f8:	5e                   	pop    %esi
 2f9:	5d                   	pop    %ebp
 2fa:	c3                   	ret    

000002fb <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2fb:	b8 01 00 00 00       	mov    $0x1,%eax
 300:	cd 40                	int    $0x40
 302:	c3                   	ret    

00000303 <exit>:
SYSCALL(exit)
 303:	b8 02 00 00 00       	mov    $0x2,%eax
 308:	cd 40                	int    $0x40
 30a:	c3                   	ret    

0000030b <wait>:
SYSCALL(wait)
 30b:	b8 03 00 00 00       	mov    $0x3,%eax
 310:	cd 40                	int    $0x40
 312:	c3                   	ret    

00000313 <pipe>:
SYSCALL(pipe)
 313:	b8 04 00 00 00       	mov    $0x4,%eax
 318:	cd 40                	int    $0x40
 31a:	c3                   	ret    

0000031b <read>:
SYSCALL(read)
 31b:	b8 05 00 00 00       	mov    $0x5,%eax
 320:	cd 40                	int    $0x40
 322:	c3                   	ret    

00000323 <write>:
SYSCALL(write)
 323:	b8 10 00 00 00       	mov    $0x10,%eax
 328:	cd 40                	int    $0x40
 32a:	c3                   	ret    

0000032b <close>:
SYSCALL(close)
 32b:	b8 15 00 00 00       	mov    $0x15,%eax
 330:	cd 40                	int    $0x40
 332:	c3                   	ret    

00000333 <kill>:
SYSCALL(kill)
 333:	b8 06 00 00 00       	mov    $0x6,%eax
 338:	cd 40                	int    $0x40
 33a:	c3                   	ret    

0000033b <exec>:
SYSCALL(exec)
 33b:	b8 07 00 00 00       	mov    $0x7,%eax
 340:	cd 40                	int    $0x40
 342:	c3                   	ret    

00000343 <open>:
SYSCALL(open)
 343:	b8 0f 00 00 00       	mov    $0xf,%eax
 348:	cd 40                	int    $0x40
 34a:	c3                   	ret    

0000034b <mknod>:
SYSCALL(mknod)
 34b:	b8 11 00 00 00       	mov    $0x11,%eax
 350:	cd 40                	int    $0x40
 352:	c3                   	ret    

00000353 <unlink>:
SYSCALL(unlink)
 353:	b8 12 00 00 00       	mov    $0x12,%eax
 358:	cd 40                	int    $0x40
 35a:	c3                   	ret    

0000035b <fstat>:
SYSCALL(fstat)
 35b:	b8 08 00 00 00       	mov    $0x8,%eax
 360:	cd 40                	int    $0x40
 362:	c3                   	ret    

00000363 <link>:
SYSCALL(link)
 363:	b8 13 00 00 00       	mov    $0x13,%eax
 368:	cd 40                	int    $0x40
 36a:	c3                   	ret    

0000036b <mkdir>:
SYSCALL(mkdir)
 36b:	b8 14 00 00 00       	mov    $0x14,%eax
 370:	cd 40                	int    $0x40
 372:	c3                   	ret    

00000373 <chdir>:
SYSCALL(chdir)
 373:	b8 09 00 00 00       	mov    $0x9,%eax
 378:	cd 40                	int    $0x40
 37a:	c3                   	ret    

0000037b <dup>:
SYSCALL(dup)
 37b:	b8 0a 00 00 00       	mov    $0xa,%eax
 380:	cd 40                	int    $0x40
 382:	c3                   	ret    

00000383 <getpid>:
SYSCALL(getpid)
 383:	b8 0b 00 00 00       	mov    $0xb,%eax
 388:	cd 40                	int    $0x40
 38a:	c3                   	ret    

0000038b <sbrk>:
SYSCALL(sbrk)
 38b:	b8 0c 00 00 00       	mov    $0xc,%eax
 390:	cd 40                	int    $0x40
 392:	c3                   	ret    

00000393 <sleep>:
SYSCALL(sleep)
 393:	b8 0d 00 00 00       	mov    $0xd,%eax
 398:	cd 40                	int    $0x40
 39a:	c3                   	ret    

0000039b <uptime>:
SYSCALL(uptime)
 39b:	b8 0e 00 00 00       	mov    $0xe,%eax
 3a0:	cd 40                	int    $0x40
 3a2:	c3                   	ret    

000003a3 <clone>:
SYSCALL(clone)
 3a3:	b8 16 00 00 00       	mov    $0x16,%eax
 3a8:	cd 40                	int    $0x40
 3aa:	c3                   	ret    

000003ab <join>:
 3ab:	b8 17 00 00 00       	mov    $0x17,%eax
 3b0:	cd 40                	int    $0x40
 3b2:	c3                   	ret    

000003b3 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 3b3:	55                   	push   %ebp
 3b4:	89 e5                	mov    %esp,%ebp
 3b6:	83 ec 1c             	sub    $0x1c,%esp
 3b9:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 3bc:	6a 01                	push   $0x1
 3be:	8d 55 f4             	lea    -0xc(%ebp),%edx
 3c1:	52                   	push   %edx
 3c2:	50                   	push   %eax
 3c3:	e8 5b ff ff ff       	call   323 <write>
}
 3c8:	83 c4 10             	add    $0x10,%esp
 3cb:	c9                   	leave  
 3cc:	c3                   	ret    

000003cd <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 3cd:	55                   	push   %ebp
 3ce:	89 e5                	mov    %esp,%ebp
 3d0:	57                   	push   %edi
 3d1:	56                   	push   %esi
 3d2:	53                   	push   %ebx
 3d3:	83 ec 2c             	sub    $0x2c,%esp
 3d6:	89 45 d0             	mov    %eax,-0x30(%ebp)
 3d9:	89 d0                	mov    %edx,%eax
 3db:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 3dd:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 3e1:	0f 95 c1             	setne  %cl
 3e4:	c1 ea 1f             	shr    $0x1f,%edx
 3e7:	84 d1                	test   %dl,%cl
 3e9:	74 44                	je     42f <printint+0x62>
    neg = 1;
    x = -xx;
 3eb:	f7 d8                	neg    %eax
 3ed:	89 c1                	mov    %eax,%ecx
    neg = 1;
 3ef:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 3f6:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 3fb:	89 c8                	mov    %ecx,%eax
 3fd:	ba 00 00 00 00       	mov    $0x0,%edx
 402:	f7 f6                	div    %esi
 404:	89 df                	mov    %ebx,%edi
 406:	83 c3 01             	add    $0x1,%ebx
 409:	0f b6 92 90 07 00 00 	movzbl 0x790(%edx),%edx
 410:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 414:	89 ca                	mov    %ecx,%edx
 416:	89 c1                	mov    %eax,%ecx
 418:	39 d6                	cmp    %edx,%esi
 41a:	76 df                	jbe    3fb <printint+0x2e>
  if(neg)
 41c:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 420:	74 31                	je     453 <printint+0x86>
    buf[i++] = '-';
 422:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 427:	8d 5f 02             	lea    0x2(%edi),%ebx
 42a:	8b 75 d0             	mov    -0x30(%ebp),%esi
 42d:	eb 17                	jmp    446 <printint+0x79>
    x = xx;
 42f:	89 c1                	mov    %eax,%ecx
  neg = 0;
 431:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 438:	eb bc                	jmp    3f6 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 43a:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 43f:	89 f0                	mov    %esi,%eax
 441:	e8 6d ff ff ff       	call   3b3 <putc>
  while(--i >= 0)
 446:	83 eb 01             	sub    $0x1,%ebx
 449:	79 ef                	jns    43a <printint+0x6d>
}
 44b:	83 c4 2c             	add    $0x2c,%esp
 44e:	5b                   	pop    %ebx
 44f:	5e                   	pop    %esi
 450:	5f                   	pop    %edi
 451:	5d                   	pop    %ebp
 452:	c3                   	ret    
 453:	8b 75 d0             	mov    -0x30(%ebp),%esi
 456:	eb ee                	jmp    446 <printint+0x79>

00000458 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 458:	55                   	push   %ebp
 459:	89 e5                	mov    %esp,%ebp
 45b:	57                   	push   %edi
 45c:	56                   	push   %esi
 45d:	53                   	push   %ebx
 45e:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 461:	8d 45 10             	lea    0x10(%ebp),%eax
 464:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 467:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 46c:	bb 00 00 00 00       	mov    $0x0,%ebx
 471:	eb 14                	jmp    487 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 473:	89 fa                	mov    %edi,%edx
 475:	8b 45 08             	mov    0x8(%ebp),%eax
 478:	e8 36 ff ff ff       	call   3b3 <putc>
 47d:	eb 05                	jmp    484 <printf+0x2c>
      }
    } else if(state == '%'){
 47f:	83 fe 25             	cmp    $0x25,%esi
 482:	74 25                	je     4a9 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 484:	83 c3 01             	add    $0x1,%ebx
 487:	8b 45 0c             	mov    0xc(%ebp),%eax
 48a:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 48e:	84 c0                	test   %al,%al
 490:	0f 84 20 01 00 00    	je     5b6 <printf+0x15e>
    c = fmt[i] & 0xff;
 496:	0f be f8             	movsbl %al,%edi
 499:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 49c:	85 f6                	test   %esi,%esi
 49e:	75 df                	jne    47f <printf+0x27>
      if(c == '%'){
 4a0:	83 f8 25             	cmp    $0x25,%eax
 4a3:	75 ce                	jne    473 <printf+0x1b>
        state = '%';
 4a5:	89 c6                	mov    %eax,%esi
 4a7:	eb db                	jmp    484 <printf+0x2c>
      if(c == 'd'){
 4a9:	83 f8 25             	cmp    $0x25,%eax
 4ac:	0f 84 cf 00 00 00    	je     581 <printf+0x129>
 4b2:	0f 8c dd 00 00 00    	jl     595 <printf+0x13d>
 4b8:	83 f8 78             	cmp    $0x78,%eax
 4bb:	0f 8f d4 00 00 00    	jg     595 <printf+0x13d>
 4c1:	83 f8 63             	cmp    $0x63,%eax
 4c4:	0f 8c cb 00 00 00    	jl     595 <printf+0x13d>
 4ca:	83 e8 63             	sub    $0x63,%eax
 4cd:	83 f8 15             	cmp    $0x15,%eax
 4d0:	0f 87 bf 00 00 00    	ja     595 <printf+0x13d>
 4d6:	ff 24 85 38 07 00 00 	jmp    *0x738(,%eax,4)
        printint(fd, *ap, 10, 1);
 4dd:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4e0:	8b 17                	mov    (%edi),%edx
 4e2:	83 ec 0c             	sub    $0xc,%esp
 4e5:	6a 01                	push   $0x1
 4e7:	b9 0a 00 00 00       	mov    $0xa,%ecx
 4ec:	8b 45 08             	mov    0x8(%ebp),%eax
 4ef:	e8 d9 fe ff ff       	call   3cd <printint>
        ap++;
 4f4:	83 c7 04             	add    $0x4,%edi
 4f7:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 4fa:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 4fd:	be 00 00 00 00       	mov    $0x0,%esi
 502:	eb 80                	jmp    484 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 504:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 507:	8b 17                	mov    (%edi),%edx
 509:	83 ec 0c             	sub    $0xc,%esp
 50c:	6a 00                	push   $0x0
 50e:	b9 10 00 00 00       	mov    $0x10,%ecx
 513:	8b 45 08             	mov    0x8(%ebp),%eax
 516:	e8 b2 fe ff ff       	call   3cd <printint>
        ap++;
 51b:	83 c7 04             	add    $0x4,%edi
 51e:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 521:	83 c4 10             	add    $0x10,%esp
      state = 0;
 524:	be 00 00 00 00       	mov    $0x0,%esi
 529:	e9 56 ff ff ff       	jmp    484 <printf+0x2c>
        s = (char*)*ap;
 52e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 531:	8b 30                	mov    (%eax),%esi
        ap++;
 533:	83 c0 04             	add    $0x4,%eax
 536:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 539:	85 f6                	test   %esi,%esi
 53b:	75 15                	jne    552 <printf+0xfa>
          s = "(null)";
 53d:	be 2f 07 00 00       	mov    $0x72f,%esi
 542:	eb 0e                	jmp    552 <printf+0xfa>
          putc(fd, *s);
 544:	0f be d2             	movsbl %dl,%edx
 547:	8b 45 08             	mov    0x8(%ebp),%eax
 54a:	e8 64 fe ff ff       	call   3b3 <putc>
          s++;
 54f:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 552:	0f b6 16             	movzbl (%esi),%edx
 555:	84 d2                	test   %dl,%dl
 557:	75 eb                	jne    544 <printf+0xec>
      state = 0;
 559:	be 00 00 00 00       	mov    $0x0,%esi
 55e:	e9 21 ff ff ff       	jmp    484 <printf+0x2c>
        putc(fd, *ap);
 563:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 566:	0f be 17             	movsbl (%edi),%edx
 569:	8b 45 08             	mov    0x8(%ebp),%eax
 56c:	e8 42 fe ff ff       	call   3b3 <putc>
        ap++;
 571:	83 c7 04             	add    $0x4,%edi
 574:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 577:	be 00 00 00 00       	mov    $0x0,%esi
 57c:	e9 03 ff ff ff       	jmp    484 <printf+0x2c>
        putc(fd, c);
 581:	89 fa                	mov    %edi,%edx
 583:	8b 45 08             	mov    0x8(%ebp),%eax
 586:	e8 28 fe ff ff       	call   3b3 <putc>
      state = 0;
 58b:	be 00 00 00 00       	mov    $0x0,%esi
 590:	e9 ef fe ff ff       	jmp    484 <printf+0x2c>
        putc(fd, '%');
 595:	ba 25 00 00 00       	mov    $0x25,%edx
 59a:	8b 45 08             	mov    0x8(%ebp),%eax
 59d:	e8 11 fe ff ff       	call   3b3 <putc>
        putc(fd, c);
 5a2:	89 fa                	mov    %edi,%edx
 5a4:	8b 45 08             	mov    0x8(%ebp),%eax
 5a7:	e8 07 fe ff ff       	call   3b3 <putc>
      state = 0;
 5ac:	be 00 00 00 00       	mov    $0x0,%esi
 5b1:	e9 ce fe ff ff       	jmp    484 <printf+0x2c>
    }
  }
}
 5b6:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5b9:	5b                   	pop    %ebx
 5ba:	5e                   	pop    %esi
 5bb:	5f                   	pop    %edi
 5bc:	5d                   	pop    %ebp
 5bd:	c3                   	ret    

000005be <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5be:	55                   	push   %ebp
 5bf:	89 e5                	mov    %esp,%ebp
 5c1:	57                   	push   %edi
 5c2:	56                   	push   %esi
 5c3:	53                   	push   %ebx
 5c4:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 5c7:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5ca:	a1 20 0c 00 00       	mov    0xc20,%eax
 5cf:	eb 02                	jmp    5d3 <free+0x15>
 5d1:	89 d0                	mov    %edx,%eax
 5d3:	39 c8                	cmp    %ecx,%eax
 5d5:	73 04                	jae    5db <free+0x1d>
 5d7:	39 08                	cmp    %ecx,(%eax)
 5d9:	77 12                	ja     5ed <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5db:	8b 10                	mov    (%eax),%edx
 5dd:	39 c2                	cmp    %eax,%edx
 5df:	77 f0                	ja     5d1 <free+0x13>
 5e1:	39 c8                	cmp    %ecx,%eax
 5e3:	72 08                	jb     5ed <free+0x2f>
 5e5:	39 ca                	cmp    %ecx,%edx
 5e7:	77 04                	ja     5ed <free+0x2f>
 5e9:	89 d0                	mov    %edx,%eax
 5eb:	eb e6                	jmp    5d3 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 5ed:	8b 73 fc             	mov    -0x4(%ebx),%esi
 5f0:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 5f3:	8b 10                	mov    (%eax),%edx
 5f5:	39 d7                	cmp    %edx,%edi
 5f7:	74 19                	je     612 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 5f9:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 5fc:	8b 50 04             	mov    0x4(%eax),%edx
 5ff:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 602:	39 ce                	cmp    %ecx,%esi
 604:	74 1b                	je     621 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 606:	89 08                	mov    %ecx,(%eax)
  freep = p;
 608:	a3 20 0c 00 00       	mov    %eax,0xc20
}
 60d:	5b                   	pop    %ebx
 60e:	5e                   	pop    %esi
 60f:	5f                   	pop    %edi
 610:	5d                   	pop    %ebp
 611:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 612:	03 72 04             	add    0x4(%edx),%esi
 615:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 618:	8b 10                	mov    (%eax),%edx
 61a:	8b 12                	mov    (%edx),%edx
 61c:	89 53 f8             	mov    %edx,-0x8(%ebx)
 61f:	eb db                	jmp    5fc <free+0x3e>
    p->s.size += bp->s.size;
 621:	03 53 fc             	add    -0x4(%ebx),%edx
 624:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 627:	8b 53 f8             	mov    -0x8(%ebx),%edx
 62a:	89 10                	mov    %edx,(%eax)
 62c:	eb da                	jmp    608 <free+0x4a>

0000062e <morecore>:

static Header*
morecore(uint nu)
{
 62e:	55                   	push   %ebp
 62f:	89 e5                	mov    %esp,%ebp
 631:	53                   	push   %ebx
 632:	83 ec 04             	sub    $0x4,%esp
 635:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 637:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 63c:	77 05                	ja     643 <morecore+0x15>
    nu = 4096;
 63e:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 643:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 64a:	83 ec 0c             	sub    $0xc,%esp
 64d:	50                   	push   %eax
 64e:	e8 38 fd ff ff       	call   38b <sbrk>
  if(p == (char*)-1)
 653:	83 c4 10             	add    $0x10,%esp
 656:	83 f8 ff             	cmp    $0xffffffff,%eax
 659:	74 1c                	je     677 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 65b:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 65e:	83 c0 08             	add    $0x8,%eax
 661:	83 ec 0c             	sub    $0xc,%esp
 664:	50                   	push   %eax
 665:	e8 54 ff ff ff       	call   5be <free>
  return freep;
 66a:	a1 20 0c 00 00       	mov    0xc20,%eax
 66f:	83 c4 10             	add    $0x10,%esp
}
 672:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 675:	c9                   	leave  
 676:	c3                   	ret    
    return 0;
 677:	b8 00 00 00 00       	mov    $0x0,%eax
 67c:	eb f4                	jmp    672 <morecore+0x44>

0000067e <malloc>:

void*
malloc(uint nbytes)
{
 67e:	55                   	push   %ebp
 67f:	89 e5                	mov    %esp,%ebp
 681:	53                   	push   %ebx
 682:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 685:	8b 45 08             	mov    0x8(%ebp),%eax
 688:	8d 58 07             	lea    0x7(%eax),%ebx
 68b:	c1 eb 03             	shr    $0x3,%ebx
 68e:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 691:	8b 0d 20 0c 00 00    	mov    0xc20,%ecx
 697:	85 c9                	test   %ecx,%ecx
 699:	74 04                	je     69f <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 69b:	8b 01                	mov    (%ecx),%eax
 69d:	eb 4a                	jmp    6e9 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 69f:	c7 05 20 0c 00 00 24 	movl   $0xc24,0xc20
 6a6:	0c 00 00 
 6a9:	c7 05 24 0c 00 00 24 	movl   $0xc24,0xc24
 6b0:	0c 00 00 
    base.s.size = 0;
 6b3:	c7 05 28 0c 00 00 00 	movl   $0x0,0xc28
 6ba:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 6bd:	b9 24 0c 00 00       	mov    $0xc24,%ecx
 6c2:	eb d7                	jmp    69b <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 6c4:	74 19                	je     6df <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 6c6:	29 da                	sub    %ebx,%edx
 6c8:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 6cb:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 6ce:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 6d1:	89 0d 20 0c 00 00    	mov    %ecx,0xc20
      return (void*)(p + 1);
 6d7:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 6da:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 6dd:	c9                   	leave  
 6de:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 6df:	8b 10                	mov    (%eax),%edx
 6e1:	89 11                	mov    %edx,(%ecx)
 6e3:	eb ec                	jmp    6d1 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6e5:	89 c1                	mov    %eax,%ecx
 6e7:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 6e9:	8b 50 04             	mov    0x4(%eax),%edx
 6ec:	39 da                	cmp    %ebx,%edx
 6ee:	73 d4                	jae    6c4 <malloc+0x46>
    if(p == freep)
 6f0:	39 05 20 0c 00 00    	cmp    %eax,0xc20
 6f6:	75 ed                	jne    6e5 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 6f8:	89 d8                	mov    %ebx,%eax
 6fa:	e8 2f ff ff ff       	call   62e <morecore>
 6ff:	85 c0                	test   %eax,%eax
 701:	75 e2                	jne    6e5 <malloc+0x67>
 703:	eb d5                	jmp    6da <malloc+0x5c>
