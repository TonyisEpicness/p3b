
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
  1a:	68 00 07 00 00       	push   $0x700
  1f:	6a 02                	push   $0x2
  21:	e8 2a 04 00 00       	call   450 <printf>
    exit();
  26:	e8 d0 02 00 00       	call   2fb <exit>
  }
  if(link(argv[1], argv[2]) < 0)
  2b:	83 ec 08             	sub    $0x8,%esp
  2e:	ff 73 08             	push   0x8(%ebx)
  31:	ff 73 04             	push   0x4(%ebx)
  34:	e8 22 03 00 00       	call   35b <link>
  39:	83 c4 10             	add    $0x10,%esp
  3c:	85 c0                	test   %eax,%eax
  3e:	78 05                	js     45 <main+0x45>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  exit();
  40:	e8 b6 02 00 00       	call   2fb <exit>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  45:	ff 73 08             	push   0x8(%ebx)
  48:	ff 73 04             	push   0x4(%ebx)
  4b:	68 13 07 00 00       	push   $0x713
  50:	6a 02                	push   $0x2
  52:	e8 f9 03 00 00       	call   450 <printf>
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
  70:	53                   	push   %ebx
  71:	83 ec 10             	sub    $0x10,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE*2);
  74:	68 00 20 00 00       	push   $0x2000
  79:	e8 f8 05 00 00       	call   676 <malloc>
  if(n_stack == 0){
  7e:	83 c4 10             	add    $0x10,%esp
  81:	85 c0                	test   %eax,%eax
  83:	74 41                	je     c6 <thread_create+0x59>
  85:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  int new_pid = clone(start_routine, arg1, arg2, n_stack);
  87:	50                   	push   %eax
  88:	ff 75 10             	push   0x10(%ebp)
  8b:	ff 75 0c             	push   0xc(%ebp)
  8e:	ff 75 08             	push   0x8(%ebp)
  91:	e8 05 03 00 00       	call   39b <clone>

  for(int i=0; i<64; i++){
  96:	83 c4 10             	add    $0x10,%esp
  99:	ba 00 00 00 00       	mov    $0x0,%edx
  9e:	eb 03                	jmp    a3 <thread_create+0x36>
  a0:	83 c2 01             	add    $0x1,%edx
  a3:	83 fa 3f             	cmp    $0x3f,%edx
  a6:	7f 19                	jg     c1 <thread_create+0x54>
    if(threads[i]->flag==0){
  a8:	8b 0c 95 00 0b 00 00 	mov    0xb00(,%edx,4),%ecx
  af:	83 79 08 00          	cmpl   $0x0,0x8(%ecx)
  b3:	75 eb                	jne    a0 <thread_create+0x33>
      threads[i]->maddr = n_stack;
  b5:	89 19                	mov    %ebx,(%ecx)
      threads[i]->pg1addr = n_stack;
  b7:	8b 14 95 00 0b 00 00 	mov    0xb00(,%edx,4),%edx
  be:	89 5a 04             	mov    %ebx,0x4(%edx)
      break;
    }
  }

  return new_pid;
}
  c1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  c4:	c9                   	leave  
  c5:	c3                   	ret    
    return -1;
  c6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  cb:	eb f4                	jmp    c1 <thread_create+0x54>

000000cd <thread_join>:

//TODO: fix
int thread_join() {
  cd:	55                   	push   %ebp
  ce:	89 e5                	mov    %esp,%ebp
  d0:	56                   	push   %esi
  d1:	53                   	push   %ebx
  d2:	83 ec 1c             	sub    $0x1c,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
  d5:	8d 45 f4             	lea    -0xc(%ebp),%eax
  d8:	50                   	push   %eax
  d9:	e8 c5 02 00 00       	call   3a3 <join>
  de:	89 c6                	mov    %eax,%esi
  for(int i=0; i<64; i++){
  e0:	83 c4 10             	add    $0x10,%esp
  e3:	bb 00 00 00 00       	mov    $0x0,%ebx
  e8:	eb 03                	jmp    ed <thread_join+0x20>
  ea:	83 c3 01             	add    $0x1,%ebx
  ed:	83 fb 3f             	cmp    $0x3f,%ebx
  f0:	7f 23                	jg     115 <thread_join+0x48>
    if((threads[i]->flag==1) && (stk_addr == threads[i]->pg1addr)){
  f2:	8b 04 9d 00 0b 00 00 	mov    0xb00(,%ebx,4),%eax
  f9:	83 78 08 01          	cmpl   $0x1,0x8(%eax)
  fd:	75 eb                	jne    ea <thread_join+0x1d>
  ff:	8b 55 f4             	mov    -0xc(%ebp),%edx
 102:	39 50 04             	cmp    %edx,0x4(%eax)
 105:	75 e3                	jne    ea <thread_join+0x1d>
      free(stk_addr);
 107:	83 ec 0c             	sub    $0xc,%esp
 10a:	52                   	push   %edx
 10b:	e8 a6 04 00 00       	call   5b6 <free>
 110:	83 c4 10             	add    $0x10,%esp
 113:	eb d5                	jmp    ea <thread_join+0x1d>
    }
  }
  return pid;
}
 115:	89 f0                	mov    %esi,%eax
 117:	8d 65 f8             	lea    -0x8(%ebp),%esp
 11a:	5b                   	pop    %ebx
 11b:	5e                   	pop    %esi
 11c:	5d                   	pop    %ebp
 11d:	c3                   	ret    

0000011e <lock_acquire>:

void lock_acquire(lock_t *lock){
 11e:	55                   	push   %ebp
 11f:	89 e5                	mov    %esp,%ebp
 121:	53                   	push   %ebx
 122:	83 ec 04             	sub    $0x4,%esp
 125:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 128:	83 ec 08             	sub    $0x8,%esp
 12b:	6a 01                	push   $0x1
 12d:	53                   	push   %ebx
 12e:	e8 29 ff ff ff       	call   5c <test_and_set>
 133:	83 c4 10             	add    $0x10,%esp
 136:	83 f8 01             	cmp    $0x1,%eax
 139:	74 ed                	je     128 <lock_acquire+0xa>
    ;
}
 13b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 13e:	c9                   	leave  
 13f:	c3                   	ret    

00000140 <lock_release>:

void lock_release(lock_t *lock) {
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 143:	8b 45 08             	mov    0x8(%ebp),%eax
 146:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 14c:	5d                   	pop    %ebp
 14d:	c3                   	ret    

0000014e <lock_init>:

void lock_init(lock_t *lock) {
 14e:	55                   	push   %ebp
 14f:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 151:	8b 45 08             	mov    0x8(%ebp),%eax
 154:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 15a:	5d                   	pop    %ebp
 15b:	c3                   	ret    

0000015c <strcpy>:

char*
strcpy(char *s, const char *t)
{
 15c:	55                   	push   %ebp
 15d:	89 e5                	mov    %esp,%ebp
 15f:	56                   	push   %esi
 160:	53                   	push   %ebx
 161:	8b 75 08             	mov    0x8(%ebp),%esi
 164:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 167:	89 f0                	mov    %esi,%eax
 169:	89 d1                	mov    %edx,%ecx
 16b:	83 c2 01             	add    $0x1,%edx
 16e:	89 c3                	mov    %eax,%ebx
 170:	83 c0 01             	add    $0x1,%eax
 173:	0f b6 09             	movzbl (%ecx),%ecx
 176:	88 0b                	mov    %cl,(%ebx)
 178:	84 c9                	test   %cl,%cl
 17a:	75 ed                	jne    169 <strcpy+0xd>
    ;
  return os;
}
 17c:	89 f0                	mov    %esi,%eax
 17e:	5b                   	pop    %ebx
 17f:	5e                   	pop    %esi
 180:	5d                   	pop    %ebp
 181:	c3                   	ret    

00000182 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 182:	55                   	push   %ebp
 183:	89 e5                	mov    %esp,%ebp
 185:	8b 4d 08             	mov    0x8(%ebp),%ecx
 188:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 18b:	eb 06                	jmp    193 <strcmp+0x11>
    p++, q++;
 18d:	83 c1 01             	add    $0x1,%ecx
 190:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 193:	0f b6 01             	movzbl (%ecx),%eax
 196:	84 c0                	test   %al,%al
 198:	74 04                	je     19e <strcmp+0x1c>
 19a:	3a 02                	cmp    (%edx),%al
 19c:	74 ef                	je     18d <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 19e:	0f b6 c0             	movzbl %al,%eax
 1a1:	0f b6 12             	movzbl (%edx),%edx
 1a4:	29 d0                	sub    %edx,%eax
}
 1a6:	5d                   	pop    %ebp
 1a7:	c3                   	ret    

000001a8 <strlen>:

uint
strlen(const char *s)
{
 1a8:	55                   	push   %ebp
 1a9:	89 e5                	mov    %esp,%ebp
 1ab:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 1ae:	b8 00 00 00 00       	mov    $0x0,%eax
 1b3:	eb 03                	jmp    1b8 <strlen+0x10>
 1b5:	83 c0 01             	add    $0x1,%eax
 1b8:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 1bc:	75 f7                	jne    1b5 <strlen+0xd>
    ;
  return n;
}
 1be:	5d                   	pop    %ebp
 1bf:	c3                   	ret    

000001c0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1c0:	55                   	push   %ebp
 1c1:	89 e5                	mov    %esp,%ebp
 1c3:	57                   	push   %edi
 1c4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1c7:	89 d7                	mov    %edx,%edi
 1c9:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1cc:	8b 45 0c             	mov    0xc(%ebp),%eax
 1cf:	fc                   	cld    
 1d0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1d2:	89 d0                	mov    %edx,%eax
 1d4:	8b 7d fc             	mov    -0x4(%ebp),%edi
 1d7:	c9                   	leave  
 1d8:	c3                   	ret    

000001d9 <strchr>:

char*
strchr(const char *s, char c)
{
 1d9:	55                   	push   %ebp
 1da:	89 e5                	mov    %esp,%ebp
 1dc:	8b 45 08             	mov    0x8(%ebp),%eax
 1df:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1e3:	eb 03                	jmp    1e8 <strchr+0xf>
 1e5:	83 c0 01             	add    $0x1,%eax
 1e8:	0f b6 10             	movzbl (%eax),%edx
 1eb:	84 d2                	test   %dl,%dl
 1ed:	74 06                	je     1f5 <strchr+0x1c>
    if(*s == c)
 1ef:	38 ca                	cmp    %cl,%dl
 1f1:	75 f2                	jne    1e5 <strchr+0xc>
 1f3:	eb 05                	jmp    1fa <strchr+0x21>
      return (char*)s;
  return 0;
 1f5:	b8 00 00 00 00       	mov    $0x0,%eax
}
 1fa:	5d                   	pop    %ebp
 1fb:	c3                   	ret    

000001fc <gets>:

char*
gets(char *buf, int max)
{
 1fc:	55                   	push   %ebp
 1fd:	89 e5                	mov    %esp,%ebp
 1ff:	57                   	push   %edi
 200:	56                   	push   %esi
 201:	53                   	push   %ebx
 202:	83 ec 1c             	sub    $0x1c,%esp
 205:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 208:	bb 00 00 00 00       	mov    $0x0,%ebx
 20d:	89 de                	mov    %ebx,%esi
 20f:	83 c3 01             	add    $0x1,%ebx
 212:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 215:	7d 2e                	jge    245 <gets+0x49>
    cc = read(0, &c, 1);
 217:	83 ec 04             	sub    $0x4,%esp
 21a:	6a 01                	push   $0x1
 21c:	8d 45 e7             	lea    -0x19(%ebp),%eax
 21f:	50                   	push   %eax
 220:	6a 00                	push   $0x0
 222:	e8 ec 00 00 00       	call   313 <read>
    if(cc < 1)
 227:	83 c4 10             	add    $0x10,%esp
 22a:	85 c0                	test   %eax,%eax
 22c:	7e 17                	jle    245 <gets+0x49>
      break;
    buf[i++] = c;
 22e:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 232:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 235:	3c 0a                	cmp    $0xa,%al
 237:	0f 94 c2             	sete   %dl
 23a:	3c 0d                	cmp    $0xd,%al
 23c:	0f 94 c0             	sete   %al
 23f:	08 c2                	or     %al,%dl
 241:	74 ca                	je     20d <gets+0x11>
    buf[i++] = c;
 243:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 245:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 249:	89 f8                	mov    %edi,%eax
 24b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 24e:	5b                   	pop    %ebx
 24f:	5e                   	pop    %esi
 250:	5f                   	pop    %edi
 251:	5d                   	pop    %ebp
 252:	c3                   	ret    

00000253 <stat>:

int
stat(const char *n, struct stat *st)
{
 253:	55                   	push   %ebp
 254:	89 e5                	mov    %esp,%ebp
 256:	56                   	push   %esi
 257:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 258:	83 ec 08             	sub    $0x8,%esp
 25b:	6a 00                	push   $0x0
 25d:	ff 75 08             	push   0x8(%ebp)
 260:	e8 d6 00 00 00       	call   33b <open>
  if(fd < 0)
 265:	83 c4 10             	add    $0x10,%esp
 268:	85 c0                	test   %eax,%eax
 26a:	78 24                	js     290 <stat+0x3d>
 26c:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 26e:	83 ec 08             	sub    $0x8,%esp
 271:	ff 75 0c             	push   0xc(%ebp)
 274:	50                   	push   %eax
 275:	e8 d9 00 00 00       	call   353 <fstat>
 27a:	89 c6                	mov    %eax,%esi
  close(fd);
 27c:	89 1c 24             	mov    %ebx,(%esp)
 27f:	e8 9f 00 00 00       	call   323 <close>
  return r;
 284:	83 c4 10             	add    $0x10,%esp
}
 287:	89 f0                	mov    %esi,%eax
 289:	8d 65 f8             	lea    -0x8(%ebp),%esp
 28c:	5b                   	pop    %ebx
 28d:	5e                   	pop    %esi
 28e:	5d                   	pop    %ebp
 28f:	c3                   	ret    
    return -1;
 290:	be ff ff ff ff       	mov    $0xffffffff,%esi
 295:	eb f0                	jmp    287 <stat+0x34>

00000297 <atoi>:

int
atoi(const char *s)
{
 297:	55                   	push   %ebp
 298:	89 e5                	mov    %esp,%ebp
 29a:	53                   	push   %ebx
 29b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 29e:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 2a3:	eb 10                	jmp    2b5 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 2a5:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 2a8:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 2ab:	83 c1 01             	add    $0x1,%ecx
 2ae:	0f be c0             	movsbl %al,%eax
 2b1:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 2b5:	0f b6 01             	movzbl (%ecx),%eax
 2b8:	8d 58 d0             	lea    -0x30(%eax),%ebx
 2bb:	80 fb 09             	cmp    $0x9,%bl
 2be:	76 e5                	jbe    2a5 <atoi+0xe>
  return n;
}
 2c0:	89 d0                	mov    %edx,%eax
 2c2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2c5:	c9                   	leave  
 2c6:	c3                   	ret    

000002c7 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2c7:	55                   	push   %ebp
 2c8:	89 e5                	mov    %esp,%ebp
 2ca:	56                   	push   %esi
 2cb:	53                   	push   %ebx
 2cc:	8b 75 08             	mov    0x8(%ebp),%esi
 2cf:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 2d2:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 2d5:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 2d7:	eb 0d                	jmp    2e6 <memmove+0x1f>
    *dst++ = *src++;
 2d9:	0f b6 01             	movzbl (%ecx),%eax
 2dc:	88 02                	mov    %al,(%edx)
 2de:	8d 49 01             	lea    0x1(%ecx),%ecx
 2e1:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 2e4:	89 d8                	mov    %ebx,%eax
 2e6:	8d 58 ff             	lea    -0x1(%eax),%ebx
 2e9:	85 c0                	test   %eax,%eax
 2eb:	7f ec                	jg     2d9 <memmove+0x12>
  return vdst;
}
 2ed:	89 f0                	mov    %esi,%eax
 2ef:	5b                   	pop    %ebx
 2f0:	5e                   	pop    %esi
 2f1:	5d                   	pop    %ebp
 2f2:	c3                   	ret    

000002f3 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2f3:	b8 01 00 00 00       	mov    $0x1,%eax
 2f8:	cd 40                	int    $0x40
 2fa:	c3                   	ret    

000002fb <exit>:
SYSCALL(exit)
 2fb:	b8 02 00 00 00       	mov    $0x2,%eax
 300:	cd 40                	int    $0x40
 302:	c3                   	ret    

00000303 <wait>:
SYSCALL(wait)
 303:	b8 03 00 00 00       	mov    $0x3,%eax
 308:	cd 40                	int    $0x40
 30a:	c3                   	ret    

0000030b <pipe>:
SYSCALL(pipe)
 30b:	b8 04 00 00 00       	mov    $0x4,%eax
 310:	cd 40                	int    $0x40
 312:	c3                   	ret    

00000313 <read>:
SYSCALL(read)
 313:	b8 05 00 00 00       	mov    $0x5,%eax
 318:	cd 40                	int    $0x40
 31a:	c3                   	ret    

0000031b <write>:
SYSCALL(write)
 31b:	b8 10 00 00 00       	mov    $0x10,%eax
 320:	cd 40                	int    $0x40
 322:	c3                   	ret    

00000323 <close>:
SYSCALL(close)
 323:	b8 15 00 00 00       	mov    $0x15,%eax
 328:	cd 40                	int    $0x40
 32a:	c3                   	ret    

0000032b <kill>:
SYSCALL(kill)
 32b:	b8 06 00 00 00       	mov    $0x6,%eax
 330:	cd 40                	int    $0x40
 332:	c3                   	ret    

00000333 <exec>:
SYSCALL(exec)
 333:	b8 07 00 00 00       	mov    $0x7,%eax
 338:	cd 40                	int    $0x40
 33a:	c3                   	ret    

0000033b <open>:
SYSCALL(open)
 33b:	b8 0f 00 00 00       	mov    $0xf,%eax
 340:	cd 40                	int    $0x40
 342:	c3                   	ret    

00000343 <mknod>:
SYSCALL(mknod)
 343:	b8 11 00 00 00       	mov    $0x11,%eax
 348:	cd 40                	int    $0x40
 34a:	c3                   	ret    

0000034b <unlink>:
SYSCALL(unlink)
 34b:	b8 12 00 00 00       	mov    $0x12,%eax
 350:	cd 40                	int    $0x40
 352:	c3                   	ret    

00000353 <fstat>:
SYSCALL(fstat)
 353:	b8 08 00 00 00       	mov    $0x8,%eax
 358:	cd 40                	int    $0x40
 35a:	c3                   	ret    

0000035b <link>:
SYSCALL(link)
 35b:	b8 13 00 00 00       	mov    $0x13,%eax
 360:	cd 40                	int    $0x40
 362:	c3                   	ret    

00000363 <mkdir>:
SYSCALL(mkdir)
 363:	b8 14 00 00 00       	mov    $0x14,%eax
 368:	cd 40                	int    $0x40
 36a:	c3                   	ret    

0000036b <chdir>:
SYSCALL(chdir)
 36b:	b8 09 00 00 00       	mov    $0x9,%eax
 370:	cd 40                	int    $0x40
 372:	c3                   	ret    

00000373 <dup>:
SYSCALL(dup)
 373:	b8 0a 00 00 00       	mov    $0xa,%eax
 378:	cd 40                	int    $0x40
 37a:	c3                   	ret    

0000037b <getpid>:
SYSCALL(getpid)
 37b:	b8 0b 00 00 00       	mov    $0xb,%eax
 380:	cd 40                	int    $0x40
 382:	c3                   	ret    

00000383 <sbrk>:
SYSCALL(sbrk)
 383:	b8 0c 00 00 00       	mov    $0xc,%eax
 388:	cd 40                	int    $0x40
 38a:	c3                   	ret    

0000038b <sleep>:
SYSCALL(sleep)
 38b:	b8 0d 00 00 00       	mov    $0xd,%eax
 390:	cd 40                	int    $0x40
 392:	c3                   	ret    

00000393 <uptime>:
SYSCALL(uptime)
 393:	b8 0e 00 00 00       	mov    $0xe,%eax
 398:	cd 40                	int    $0x40
 39a:	c3                   	ret    

0000039b <clone>:
SYSCALL(clone)
 39b:	b8 16 00 00 00       	mov    $0x16,%eax
 3a0:	cd 40                	int    $0x40
 3a2:	c3                   	ret    

000003a3 <join>:
 3a3:	b8 17 00 00 00       	mov    $0x17,%eax
 3a8:	cd 40                	int    $0x40
 3aa:	c3                   	ret    

000003ab <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 3ab:	55                   	push   %ebp
 3ac:	89 e5                	mov    %esp,%ebp
 3ae:	83 ec 1c             	sub    $0x1c,%esp
 3b1:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 3b4:	6a 01                	push   $0x1
 3b6:	8d 55 f4             	lea    -0xc(%ebp),%edx
 3b9:	52                   	push   %edx
 3ba:	50                   	push   %eax
 3bb:	e8 5b ff ff ff       	call   31b <write>
}
 3c0:	83 c4 10             	add    $0x10,%esp
 3c3:	c9                   	leave  
 3c4:	c3                   	ret    

000003c5 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 3c5:	55                   	push   %ebp
 3c6:	89 e5                	mov    %esp,%ebp
 3c8:	57                   	push   %edi
 3c9:	56                   	push   %esi
 3ca:	53                   	push   %ebx
 3cb:	83 ec 2c             	sub    $0x2c,%esp
 3ce:	89 45 d0             	mov    %eax,-0x30(%ebp)
 3d1:	89 d0                	mov    %edx,%eax
 3d3:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 3d5:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 3d9:	0f 95 c1             	setne  %cl
 3dc:	c1 ea 1f             	shr    $0x1f,%edx
 3df:	84 d1                	test   %dl,%cl
 3e1:	74 44                	je     427 <printint+0x62>
    neg = 1;
    x = -xx;
 3e3:	f7 d8                	neg    %eax
 3e5:	89 c1                	mov    %eax,%ecx
    neg = 1;
 3e7:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 3ee:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 3f3:	89 c8                	mov    %ecx,%eax
 3f5:	ba 00 00 00 00       	mov    $0x0,%edx
 3fa:	f7 f6                	div    %esi
 3fc:	89 df                	mov    %ebx,%edi
 3fe:	83 c3 01             	add    $0x1,%ebx
 401:	0f b6 92 88 07 00 00 	movzbl 0x788(%edx),%edx
 408:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 40c:	89 ca                	mov    %ecx,%edx
 40e:	89 c1                	mov    %eax,%ecx
 410:	39 d6                	cmp    %edx,%esi
 412:	76 df                	jbe    3f3 <printint+0x2e>
  if(neg)
 414:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 418:	74 31                	je     44b <printint+0x86>
    buf[i++] = '-';
 41a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 41f:	8d 5f 02             	lea    0x2(%edi),%ebx
 422:	8b 75 d0             	mov    -0x30(%ebp),%esi
 425:	eb 17                	jmp    43e <printint+0x79>
    x = xx;
 427:	89 c1                	mov    %eax,%ecx
  neg = 0;
 429:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 430:	eb bc                	jmp    3ee <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 432:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 437:	89 f0                	mov    %esi,%eax
 439:	e8 6d ff ff ff       	call   3ab <putc>
  while(--i >= 0)
 43e:	83 eb 01             	sub    $0x1,%ebx
 441:	79 ef                	jns    432 <printint+0x6d>
}
 443:	83 c4 2c             	add    $0x2c,%esp
 446:	5b                   	pop    %ebx
 447:	5e                   	pop    %esi
 448:	5f                   	pop    %edi
 449:	5d                   	pop    %ebp
 44a:	c3                   	ret    
 44b:	8b 75 d0             	mov    -0x30(%ebp),%esi
 44e:	eb ee                	jmp    43e <printint+0x79>

00000450 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 450:	55                   	push   %ebp
 451:	89 e5                	mov    %esp,%ebp
 453:	57                   	push   %edi
 454:	56                   	push   %esi
 455:	53                   	push   %ebx
 456:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 459:	8d 45 10             	lea    0x10(%ebp),%eax
 45c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 45f:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 464:	bb 00 00 00 00       	mov    $0x0,%ebx
 469:	eb 14                	jmp    47f <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 46b:	89 fa                	mov    %edi,%edx
 46d:	8b 45 08             	mov    0x8(%ebp),%eax
 470:	e8 36 ff ff ff       	call   3ab <putc>
 475:	eb 05                	jmp    47c <printf+0x2c>
      }
    } else if(state == '%'){
 477:	83 fe 25             	cmp    $0x25,%esi
 47a:	74 25                	je     4a1 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 47c:	83 c3 01             	add    $0x1,%ebx
 47f:	8b 45 0c             	mov    0xc(%ebp),%eax
 482:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 486:	84 c0                	test   %al,%al
 488:	0f 84 20 01 00 00    	je     5ae <printf+0x15e>
    c = fmt[i] & 0xff;
 48e:	0f be f8             	movsbl %al,%edi
 491:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 494:	85 f6                	test   %esi,%esi
 496:	75 df                	jne    477 <printf+0x27>
      if(c == '%'){
 498:	83 f8 25             	cmp    $0x25,%eax
 49b:	75 ce                	jne    46b <printf+0x1b>
        state = '%';
 49d:	89 c6                	mov    %eax,%esi
 49f:	eb db                	jmp    47c <printf+0x2c>
      if(c == 'd'){
 4a1:	83 f8 25             	cmp    $0x25,%eax
 4a4:	0f 84 cf 00 00 00    	je     579 <printf+0x129>
 4aa:	0f 8c dd 00 00 00    	jl     58d <printf+0x13d>
 4b0:	83 f8 78             	cmp    $0x78,%eax
 4b3:	0f 8f d4 00 00 00    	jg     58d <printf+0x13d>
 4b9:	83 f8 63             	cmp    $0x63,%eax
 4bc:	0f 8c cb 00 00 00    	jl     58d <printf+0x13d>
 4c2:	83 e8 63             	sub    $0x63,%eax
 4c5:	83 f8 15             	cmp    $0x15,%eax
 4c8:	0f 87 bf 00 00 00    	ja     58d <printf+0x13d>
 4ce:	ff 24 85 30 07 00 00 	jmp    *0x730(,%eax,4)
        printint(fd, *ap, 10, 1);
 4d5:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4d8:	8b 17                	mov    (%edi),%edx
 4da:	83 ec 0c             	sub    $0xc,%esp
 4dd:	6a 01                	push   $0x1
 4df:	b9 0a 00 00 00       	mov    $0xa,%ecx
 4e4:	8b 45 08             	mov    0x8(%ebp),%eax
 4e7:	e8 d9 fe ff ff       	call   3c5 <printint>
        ap++;
 4ec:	83 c7 04             	add    $0x4,%edi
 4ef:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 4f2:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 4f5:	be 00 00 00 00       	mov    $0x0,%esi
 4fa:	eb 80                	jmp    47c <printf+0x2c>
        printint(fd, *ap, 16, 0);
 4fc:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4ff:	8b 17                	mov    (%edi),%edx
 501:	83 ec 0c             	sub    $0xc,%esp
 504:	6a 00                	push   $0x0
 506:	b9 10 00 00 00       	mov    $0x10,%ecx
 50b:	8b 45 08             	mov    0x8(%ebp),%eax
 50e:	e8 b2 fe ff ff       	call   3c5 <printint>
        ap++;
 513:	83 c7 04             	add    $0x4,%edi
 516:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 519:	83 c4 10             	add    $0x10,%esp
      state = 0;
 51c:	be 00 00 00 00       	mov    $0x0,%esi
 521:	e9 56 ff ff ff       	jmp    47c <printf+0x2c>
        s = (char*)*ap;
 526:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 529:	8b 30                	mov    (%eax),%esi
        ap++;
 52b:	83 c0 04             	add    $0x4,%eax
 52e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 531:	85 f6                	test   %esi,%esi
 533:	75 15                	jne    54a <printf+0xfa>
          s = "(null)";
 535:	be 27 07 00 00       	mov    $0x727,%esi
 53a:	eb 0e                	jmp    54a <printf+0xfa>
          putc(fd, *s);
 53c:	0f be d2             	movsbl %dl,%edx
 53f:	8b 45 08             	mov    0x8(%ebp),%eax
 542:	e8 64 fe ff ff       	call   3ab <putc>
          s++;
 547:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 54a:	0f b6 16             	movzbl (%esi),%edx
 54d:	84 d2                	test   %dl,%dl
 54f:	75 eb                	jne    53c <printf+0xec>
      state = 0;
 551:	be 00 00 00 00       	mov    $0x0,%esi
 556:	e9 21 ff ff ff       	jmp    47c <printf+0x2c>
        putc(fd, *ap);
 55b:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 55e:	0f be 17             	movsbl (%edi),%edx
 561:	8b 45 08             	mov    0x8(%ebp),%eax
 564:	e8 42 fe ff ff       	call   3ab <putc>
        ap++;
 569:	83 c7 04             	add    $0x4,%edi
 56c:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 56f:	be 00 00 00 00       	mov    $0x0,%esi
 574:	e9 03 ff ff ff       	jmp    47c <printf+0x2c>
        putc(fd, c);
 579:	89 fa                	mov    %edi,%edx
 57b:	8b 45 08             	mov    0x8(%ebp),%eax
 57e:	e8 28 fe ff ff       	call   3ab <putc>
      state = 0;
 583:	be 00 00 00 00       	mov    $0x0,%esi
 588:	e9 ef fe ff ff       	jmp    47c <printf+0x2c>
        putc(fd, '%');
 58d:	ba 25 00 00 00       	mov    $0x25,%edx
 592:	8b 45 08             	mov    0x8(%ebp),%eax
 595:	e8 11 fe ff ff       	call   3ab <putc>
        putc(fd, c);
 59a:	89 fa                	mov    %edi,%edx
 59c:	8b 45 08             	mov    0x8(%ebp),%eax
 59f:	e8 07 fe ff ff       	call   3ab <putc>
      state = 0;
 5a4:	be 00 00 00 00       	mov    $0x0,%esi
 5a9:	e9 ce fe ff ff       	jmp    47c <printf+0x2c>
    }
  }
}
 5ae:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5b1:	5b                   	pop    %ebx
 5b2:	5e                   	pop    %esi
 5b3:	5f                   	pop    %edi
 5b4:	5d                   	pop    %ebp
 5b5:	c3                   	ret    

000005b6 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5b6:	55                   	push   %ebp
 5b7:	89 e5                	mov    %esp,%ebp
 5b9:	57                   	push   %edi
 5ba:	56                   	push   %esi
 5bb:	53                   	push   %ebx
 5bc:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 5bf:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5c2:	a1 00 0c 00 00       	mov    0xc00,%eax
 5c7:	eb 02                	jmp    5cb <free+0x15>
 5c9:	89 d0                	mov    %edx,%eax
 5cb:	39 c8                	cmp    %ecx,%eax
 5cd:	73 04                	jae    5d3 <free+0x1d>
 5cf:	39 08                	cmp    %ecx,(%eax)
 5d1:	77 12                	ja     5e5 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5d3:	8b 10                	mov    (%eax),%edx
 5d5:	39 c2                	cmp    %eax,%edx
 5d7:	77 f0                	ja     5c9 <free+0x13>
 5d9:	39 c8                	cmp    %ecx,%eax
 5db:	72 08                	jb     5e5 <free+0x2f>
 5dd:	39 ca                	cmp    %ecx,%edx
 5df:	77 04                	ja     5e5 <free+0x2f>
 5e1:	89 d0                	mov    %edx,%eax
 5e3:	eb e6                	jmp    5cb <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 5e5:	8b 73 fc             	mov    -0x4(%ebx),%esi
 5e8:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 5eb:	8b 10                	mov    (%eax),%edx
 5ed:	39 d7                	cmp    %edx,%edi
 5ef:	74 19                	je     60a <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 5f1:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 5f4:	8b 50 04             	mov    0x4(%eax),%edx
 5f7:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 5fa:	39 ce                	cmp    %ecx,%esi
 5fc:	74 1b                	je     619 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 5fe:	89 08                	mov    %ecx,(%eax)
  freep = p;
 600:	a3 00 0c 00 00       	mov    %eax,0xc00
}
 605:	5b                   	pop    %ebx
 606:	5e                   	pop    %esi
 607:	5f                   	pop    %edi
 608:	5d                   	pop    %ebp
 609:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 60a:	03 72 04             	add    0x4(%edx),%esi
 60d:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 610:	8b 10                	mov    (%eax),%edx
 612:	8b 12                	mov    (%edx),%edx
 614:	89 53 f8             	mov    %edx,-0x8(%ebx)
 617:	eb db                	jmp    5f4 <free+0x3e>
    p->s.size += bp->s.size;
 619:	03 53 fc             	add    -0x4(%ebx),%edx
 61c:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 61f:	8b 53 f8             	mov    -0x8(%ebx),%edx
 622:	89 10                	mov    %edx,(%eax)
 624:	eb da                	jmp    600 <free+0x4a>

00000626 <morecore>:

static Header*
morecore(uint nu)
{
 626:	55                   	push   %ebp
 627:	89 e5                	mov    %esp,%ebp
 629:	53                   	push   %ebx
 62a:	83 ec 04             	sub    $0x4,%esp
 62d:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 62f:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 634:	77 05                	ja     63b <morecore+0x15>
    nu = 4096;
 636:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 63b:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 642:	83 ec 0c             	sub    $0xc,%esp
 645:	50                   	push   %eax
 646:	e8 38 fd ff ff       	call   383 <sbrk>
  if(p == (char*)-1)
 64b:	83 c4 10             	add    $0x10,%esp
 64e:	83 f8 ff             	cmp    $0xffffffff,%eax
 651:	74 1c                	je     66f <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 653:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 656:	83 c0 08             	add    $0x8,%eax
 659:	83 ec 0c             	sub    $0xc,%esp
 65c:	50                   	push   %eax
 65d:	e8 54 ff ff ff       	call   5b6 <free>
  return freep;
 662:	a1 00 0c 00 00       	mov    0xc00,%eax
 667:	83 c4 10             	add    $0x10,%esp
}
 66a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 66d:	c9                   	leave  
 66e:	c3                   	ret    
    return 0;
 66f:	b8 00 00 00 00       	mov    $0x0,%eax
 674:	eb f4                	jmp    66a <morecore+0x44>

00000676 <malloc>:

void*
malloc(uint nbytes)
{
 676:	55                   	push   %ebp
 677:	89 e5                	mov    %esp,%ebp
 679:	53                   	push   %ebx
 67a:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 67d:	8b 45 08             	mov    0x8(%ebp),%eax
 680:	8d 58 07             	lea    0x7(%eax),%ebx
 683:	c1 eb 03             	shr    $0x3,%ebx
 686:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 689:	8b 0d 00 0c 00 00    	mov    0xc00,%ecx
 68f:	85 c9                	test   %ecx,%ecx
 691:	74 04                	je     697 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 693:	8b 01                	mov    (%ecx),%eax
 695:	eb 4a                	jmp    6e1 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 697:	c7 05 00 0c 00 00 04 	movl   $0xc04,0xc00
 69e:	0c 00 00 
 6a1:	c7 05 04 0c 00 00 04 	movl   $0xc04,0xc04
 6a8:	0c 00 00 
    base.s.size = 0;
 6ab:	c7 05 08 0c 00 00 00 	movl   $0x0,0xc08
 6b2:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 6b5:	b9 04 0c 00 00       	mov    $0xc04,%ecx
 6ba:	eb d7                	jmp    693 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 6bc:	74 19                	je     6d7 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 6be:	29 da                	sub    %ebx,%edx
 6c0:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 6c3:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 6c6:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 6c9:	89 0d 00 0c 00 00    	mov    %ecx,0xc00
      return (void*)(p + 1);
 6cf:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 6d2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 6d5:	c9                   	leave  
 6d6:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 6d7:	8b 10                	mov    (%eax),%edx
 6d9:	89 11                	mov    %edx,(%ecx)
 6db:	eb ec                	jmp    6c9 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6dd:	89 c1                	mov    %eax,%ecx
 6df:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 6e1:	8b 50 04             	mov    0x4(%eax),%edx
 6e4:	39 da                	cmp    %ebx,%edx
 6e6:	73 d4                	jae    6bc <malloc+0x46>
    if(p == freep)
 6e8:	39 05 00 0c 00 00    	cmp    %eax,0xc00
 6ee:	75 ed                	jne    6dd <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 6f0:	89 d8                	mov    %ebx,%eax
 6f2:	e8 2f ff ff ff       	call   626 <morecore>
 6f7:	85 c0                	test   %eax,%eax
 6f9:	75 e2                	jne    6dd <malloc+0x67>
 6fb:	eb d5                	jmp    6d2 <malloc+0x5c>
