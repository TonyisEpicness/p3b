
_mkdir:     file format elf32-i386


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
  11:	83 ec 18             	sub    $0x18,%esp
  14:	8b 39                	mov    (%ecx),%edi
  16:	8b 41 04             	mov    0x4(%ecx),%eax
  19:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  int i;

  if(argc < 2){
  1c:	83 ff 01             	cmp    $0x1,%edi
  1f:	7e 07                	jle    28 <main+0x28>
    printf(2, "Usage: mkdir files...\n");
    exit();
  }

  for(i = 1; i < argc; i++){
  21:	bb 01 00 00 00       	mov    $0x1,%ebx
  26:	eb 17                	jmp    3f <main+0x3f>
    printf(2, "Usage: mkdir files...\n");
  28:	83 ec 08             	sub    $0x8,%esp
  2b:	68 14 07 00 00       	push   $0x714
  30:	6a 02                	push   $0x2
  32:	e8 30 04 00 00       	call   467 <printf>
    exit();
  37:	e8 d6 02 00 00       	call   312 <exit>
  for(i = 1; i < argc; i++){
  3c:	83 c3 01             	add    $0x1,%ebx
  3f:	39 fb                	cmp    %edi,%ebx
  41:	7d 2b                	jge    6e <main+0x6e>
    if(mkdir(argv[i]) < 0){
  43:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  46:	8d 34 98             	lea    (%eax,%ebx,4),%esi
  49:	83 ec 0c             	sub    $0xc,%esp
  4c:	ff 36                	push   (%esi)
  4e:	e8 27 03 00 00       	call   37a <mkdir>
  53:	83 c4 10             	add    $0x10,%esp
  56:	85 c0                	test   %eax,%eax
  58:	79 e2                	jns    3c <main+0x3c>
      printf(2, "mkdir: %s failed to create\n", argv[i]);
  5a:	83 ec 04             	sub    $0x4,%esp
  5d:	ff 36                	push   (%esi)
  5f:	68 2b 07 00 00       	push   $0x72b
  64:	6a 02                	push   $0x2
  66:	e8 fc 03 00 00       	call   467 <printf>
      break;
  6b:	83 c4 10             	add    $0x10,%esp
    }
  }

  exit();
  6e:	e8 9f 02 00 00       	call   312 <exit>

00000073 <test_and_set>:
  int flag;
};

struct thread_ref *threads[64];

int test_and_set(int *old_ptr, int new_ptr) {
  73:	55                   	push   %ebp
  74:	89 e5                	mov    %esp,%ebp
  76:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *old_ptr;
  79:	8b 10                	mov    (%eax),%edx
  *old_ptr = new_ptr;
  7b:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  7e:	89 08                	mov    %ecx,(%eax)
  return old;
}
  80:	89 d0                	mov    %edx,%eax
  82:	5d                   	pop    %ebp
  83:	c3                   	ret    

00000084 <thread_create>:

// a wrapper func for clone
int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
  84:	55                   	push   %ebp
  85:	89 e5                	mov    %esp,%ebp
  87:	53                   	push   %ebx
  88:	83 ec 10             	sub    $0x10,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE*2);
  8b:	68 00 20 00 00       	push   $0x2000
  90:	e8 f8 05 00 00       	call   68d <malloc>
  if(n_stack == 0){
  95:	83 c4 10             	add    $0x10,%esp
  98:	85 c0                	test   %eax,%eax
  9a:	74 41                	je     dd <thread_create+0x59>
  9c:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  int new_pid = clone(start_routine, arg1, arg2, n_stack);
  9e:	50                   	push   %eax
  9f:	ff 75 10             	push   0x10(%ebp)
  a2:	ff 75 0c             	push   0xc(%ebp)
  a5:	ff 75 08             	push   0x8(%ebp)
  a8:	e8 05 03 00 00       	call   3b2 <clone>

  for(int i=0; i<64; i++){
  ad:	83 c4 10             	add    $0x10,%esp
  b0:	ba 00 00 00 00       	mov    $0x0,%edx
  b5:	eb 03                	jmp    ba <thread_create+0x36>
  b7:	83 c2 01             	add    $0x1,%edx
  ba:	83 fa 3f             	cmp    $0x3f,%edx
  bd:	7f 19                	jg     d8 <thread_create+0x54>
    if(threads[i]->flag==0){
  bf:	8b 0c 95 40 0b 00 00 	mov    0xb40(,%edx,4),%ecx
  c6:	83 79 08 00          	cmpl   $0x0,0x8(%ecx)
  ca:	75 eb                	jne    b7 <thread_create+0x33>
      threads[i]->maddr = n_stack;
  cc:	89 19                	mov    %ebx,(%ecx)
      threads[i]->pg1addr = n_stack;
  ce:	8b 14 95 40 0b 00 00 	mov    0xb40(,%edx,4),%edx
  d5:	89 5a 04             	mov    %ebx,0x4(%edx)
      break;
    }
  }

  return new_pid;
}
  d8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  db:	c9                   	leave  
  dc:	c3                   	ret    
    return -1;
  dd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  e2:	eb f4                	jmp    d8 <thread_create+0x54>

000000e4 <thread_join>:

//TODO: fix
int thread_join() {
  e4:	55                   	push   %ebp
  e5:	89 e5                	mov    %esp,%ebp
  e7:	56                   	push   %esi
  e8:	53                   	push   %ebx
  e9:	83 ec 1c             	sub    $0x1c,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
  ec:	8d 45 f4             	lea    -0xc(%ebp),%eax
  ef:	50                   	push   %eax
  f0:	e8 c5 02 00 00       	call   3ba <join>
  f5:	89 c6                	mov    %eax,%esi
  for(int i=0; i<64; i++){
  f7:	83 c4 10             	add    $0x10,%esp
  fa:	bb 00 00 00 00       	mov    $0x0,%ebx
  ff:	eb 03                	jmp    104 <thread_join+0x20>
 101:	83 c3 01             	add    $0x1,%ebx
 104:	83 fb 3f             	cmp    $0x3f,%ebx
 107:	7f 23                	jg     12c <thread_join+0x48>
    if((threads[i]->flag==1) && (stk_addr == threads[i]->pg1addr)){
 109:	8b 04 9d 40 0b 00 00 	mov    0xb40(,%ebx,4),%eax
 110:	83 78 08 01          	cmpl   $0x1,0x8(%eax)
 114:	75 eb                	jne    101 <thread_join+0x1d>
 116:	8b 55 f4             	mov    -0xc(%ebp),%edx
 119:	39 50 04             	cmp    %edx,0x4(%eax)
 11c:	75 e3                	jne    101 <thread_join+0x1d>
      free(stk_addr);
 11e:	83 ec 0c             	sub    $0xc,%esp
 121:	52                   	push   %edx
 122:	e8 a6 04 00 00       	call   5cd <free>
 127:	83 c4 10             	add    $0x10,%esp
 12a:	eb d5                	jmp    101 <thread_join+0x1d>
    }
  }
  return pid;
}
 12c:	89 f0                	mov    %esi,%eax
 12e:	8d 65 f8             	lea    -0x8(%ebp),%esp
 131:	5b                   	pop    %ebx
 132:	5e                   	pop    %esi
 133:	5d                   	pop    %ebp
 134:	c3                   	ret    

00000135 <lock_acquire>:

void lock_acquire(lock_t *lock){
 135:	55                   	push   %ebp
 136:	89 e5                	mov    %esp,%ebp
 138:	53                   	push   %ebx
 139:	83 ec 04             	sub    $0x4,%esp
 13c:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 13f:	83 ec 08             	sub    $0x8,%esp
 142:	6a 01                	push   $0x1
 144:	53                   	push   %ebx
 145:	e8 29 ff ff ff       	call   73 <test_and_set>
 14a:	83 c4 10             	add    $0x10,%esp
 14d:	83 f8 01             	cmp    $0x1,%eax
 150:	74 ed                	je     13f <lock_acquire+0xa>
    ;
}
 152:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 155:	c9                   	leave  
 156:	c3                   	ret    

00000157 <lock_release>:

void lock_release(lock_t *lock) {
 157:	55                   	push   %ebp
 158:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 15a:	8b 45 08             	mov    0x8(%ebp),%eax
 15d:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 163:	5d                   	pop    %ebp
 164:	c3                   	ret    

00000165 <lock_init>:

void lock_init(lock_t *lock) {
 165:	55                   	push   %ebp
 166:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 168:	8b 45 08             	mov    0x8(%ebp),%eax
 16b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 171:	5d                   	pop    %ebp
 172:	c3                   	ret    

00000173 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 173:	55                   	push   %ebp
 174:	89 e5                	mov    %esp,%ebp
 176:	56                   	push   %esi
 177:	53                   	push   %ebx
 178:	8b 75 08             	mov    0x8(%ebp),%esi
 17b:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 17e:	89 f0                	mov    %esi,%eax
 180:	89 d1                	mov    %edx,%ecx
 182:	83 c2 01             	add    $0x1,%edx
 185:	89 c3                	mov    %eax,%ebx
 187:	83 c0 01             	add    $0x1,%eax
 18a:	0f b6 09             	movzbl (%ecx),%ecx
 18d:	88 0b                	mov    %cl,(%ebx)
 18f:	84 c9                	test   %cl,%cl
 191:	75 ed                	jne    180 <strcpy+0xd>
    ;
  return os;
}
 193:	89 f0                	mov    %esi,%eax
 195:	5b                   	pop    %ebx
 196:	5e                   	pop    %esi
 197:	5d                   	pop    %ebp
 198:	c3                   	ret    

00000199 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 199:	55                   	push   %ebp
 19a:	89 e5                	mov    %esp,%ebp
 19c:	8b 4d 08             	mov    0x8(%ebp),%ecx
 19f:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 1a2:	eb 06                	jmp    1aa <strcmp+0x11>
    p++, q++;
 1a4:	83 c1 01             	add    $0x1,%ecx
 1a7:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 1aa:	0f b6 01             	movzbl (%ecx),%eax
 1ad:	84 c0                	test   %al,%al
 1af:	74 04                	je     1b5 <strcmp+0x1c>
 1b1:	3a 02                	cmp    (%edx),%al
 1b3:	74 ef                	je     1a4 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 1b5:	0f b6 c0             	movzbl %al,%eax
 1b8:	0f b6 12             	movzbl (%edx),%edx
 1bb:	29 d0                	sub    %edx,%eax
}
 1bd:	5d                   	pop    %ebp
 1be:	c3                   	ret    

000001bf <strlen>:

uint
strlen(const char *s)
{
 1bf:	55                   	push   %ebp
 1c0:	89 e5                	mov    %esp,%ebp
 1c2:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 1c5:	b8 00 00 00 00       	mov    $0x0,%eax
 1ca:	eb 03                	jmp    1cf <strlen+0x10>
 1cc:	83 c0 01             	add    $0x1,%eax
 1cf:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 1d3:	75 f7                	jne    1cc <strlen+0xd>
    ;
  return n;
}
 1d5:	5d                   	pop    %ebp
 1d6:	c3                   	ret    

000001d7 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1d7:	55                   	push   %ebp
 1d8:	89 e5                	mov    %esp,%ebp
 1da:	57                   	push   %edi
 1db:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1de:	89 d7                	mov    %edx,%edi
 1e0:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1e3:	8b 45 0c             	mov    0xc(%ebp),%eax
 1e6:	fc                   	cld    
 1e7:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1e9:	89 d0                	mov    %edx,%eax
 1eb:	8b 7d fc             	mov    -0x4(%ebp),%edi
 1ee:	c9                   	leave  
 1ef:	c3                   	ret    

000001f0 <strchr>:

char*
strchr(const char *s, char c)
{
 1f0:	55                   	push   %ebp
 1f1:	89 e5                	mov    %esp,%ebp
 1f3:	8b 45 08             	mov    0x8(%ebp),%eax
 1f6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1fa:	eb 03                	jmp    1ff <strchr+0xf>
 1fc:	83 c0 01             	add    $0x1,%eax
 1ff:	0f b6 10             	movzbl (%eax),%edx
 202:	84 d2                	test   %dl,%dl
 204:	74 06                	je     20c <strchr+0x1c>
    if(*s == c)
 206:	38 ca                	cmp    %cl,%dl
 208:	75 f2                	jne    1fc <strchr+0xc>
 20a:	eb 05                	jmp    211 <strchr+0x21>
      return (char*)s;
  return 0;
 20c:	b8 00 00 00 00       	mov    $0x0,%eax
}
 211:	5d                   	pop    %ebp
 212:	c3                   	ret    

00000213 <gets>:

char*
gets(char *buf, int max)
{
 213:	55                   	push   %ebp
 214:	89 e5                	mov    %esp,%ebp
 216:	57                   	push   %edi
 217:	56                   	push   %esi
 218:	53                   	push   %ebx
 219:	83 ec 1c             	sub    $0x1c,%esp
 21c:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 21f:	bb 00 00 00 00       	mov    $0x0,%ebx
 224:	89 de                	mov    %ebx,%esi
 226:	83 c3 01             	add    $0x1,%ebx
 229:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 22c:	7d 2e                	jge    25c <gets+0x49>
    cc = read(0, &c, 1);
 22e:	83 ec 04             	sub    $0x4,%esp
 231:	6a 01                	push   $0x1
 233:	8d 45 e7             	lea    -0x19(%ebp),%eax
 236:	50                   	push   %eax
 237:	6a 00                	push   $0x0
 239:	e8 ec 00 00 00       	call   32a <read>
    if(cc < 1)
 23e:	83 c4 10             	add    $0x10,%esp
 241:	85 c0                	test   %eax,%eax
 243:	7e 17                	jle    25c <gets+0x49>
      break;
    buf[i++] = c;
 245:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 249:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 24c:	3c 0a                	cmp    $0xa,%al
 24e:	0f 94 c2             	sete   %dl
 251:	3c 0d                	cmp    $0xd,%al
 253:	0f 94 c0             	sete   %al
 256:	08 c2                	or     %al,%dl
 258:	74 ca                	je     224 <gets+0x11>
    buf[i++] = c;
 25a:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 25c:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 260:	89 f8                	mov    %edi,%eax
 262:	8d 65 f4             	lea    -0xc(%ebp),%esp
 265:	5b                   	pop    %ebx
 266:	5e                   	pop    %esi
 267:	5f                   	pop    %edi
 268:	5d                   	pop    %ebp
 269:	c3                   	ret    

0000026a <stat>:

int
stat(const char *n, struct stat *st)
{
 26a:	55                   	push   %ebp
 26b:	89 e5                	mov    %esp,%ebp
 26d:	56                   	push   %esi
 26e:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 26f:	83 ec 08             	sub    $0x8,%esp
 272:	6a 00                	push   $0x0
 274:	ff 75 08             	push   0x8(%ebp)
 277:	e8 d6 00 00 00       	call   352 <open>
  if(fd < 0)
 27c:	83 c4 10             	add    $0x10,%esp
 27f:	85 c0                	test   %eax,%eax
 281:	78 24                	js     2a7 <stat+0x3d>
 283:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 285:	83 ec 08             	sub    $0x8,%esp
 288:	ff 75 0c             	push   0xc(%ebp)
 28b:	50                   	push   %eax
 28c:	e8 d9 00 00 00       	call   36a <fstat>
 291:	89 c6                	mov    %eax,%esi
  close(fd);
 293:	89 1c 24             	mov    %ebx,(%esp)
 296:	e8 9f 00 00 00       	call   33a <close>
  return r;
 29b:	83 c4 10             	add    $0x10,%esp
}
 29e:	89 f0                	mov    %esi,%eax
 2a0:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2a3:	5b                   	pop    %ebx
 2a4:	5e                   	pop    %esi
 2a5:	5d                   	pop    %ebp
 2a6:	c3                   	ret    
    return -1;
 2a7:	be ff ff ff ff       	mov    $0xffffffff,%esi
 2ac:	eb f0                	jmp    29e <stat+0x34>

000002ae <atoi>:

int
atoi(const char *s)
{
 2ae:	55                   	push   %ebp
 2af:	89 e5                	mov    %esp,%ebp
 2b1:	53                   	push   %ebx
 2b2:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 2b5:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 2ba:	eb 10                	jmp    2cc <atoi+0x1e>
    n = n*10 + *s++ - '0';
 2bc:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 2bf:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 2c2:	83 c1 01             	add    $0x1,%ecx
 2c5:	0f be c0             	movsbl %al,%eax
 2c8:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 2cc:	0f b6 01             	movzbl (%ecx),%eax
 2cf:	8d 58 d0             	lea    -0x30(%eax),%ebx
 2d2:	80 fb 09             	cmp    $0x9,%bl
 2d5:	76 e5                	jbe    2bc <atoi+0xe>
  return n;
}
 2d7:	89 d0                	mov    %edx,%eax
 2d9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2dc:	c9                   	leave  
 2dd:	c3                   	ret    

000002de <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2de:	55                   	push   %ebp
 2df:	89 e5                	mov    %esp,%ebp
 2e1:	56                   	push   %esi
 2e2:	53                   	push   %ebx
 2e3:	8b 75 08             	mov    0x8(%ebp),%esi
 2e6:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 2e9:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 2ec:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 2ee:	eb 0d                	jmp    2fd <memmove+0x1f>
    *dst++ = *src++;
 2f0:	0f b6 01             	movzbl (%ecx),%eax
 2f3:	88 02                	mov    %al,(%edx)
 2f5:	8d 49 01             	lea    0x1(%ecx),%ecx
 2f8:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 2fb:	89 d8                	mov    %ebx,%eax
 2fd:	8d 58 ff             	lea    -0x1(%eax),%ebx
 300:	85 c0                	test   %eax,%eax
 302:	7f ec                	jg     2f0 <memmove+0x12>
  return vdst;
}
 304:	89 f0                	mov    %esi,%eax
 306:	5b                   	pop    %ebx
 307:	5e                   	pop    %esi
 308:	5d                   	pop    %ebp
 309:	c3                   	ret    

0000030a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 30a:	b8 01 00 00 00       	mov    $0x1,%eax
 30f:	cd 40                	int    $0x40
 311:	c3                   	ret    

00000312 <exit>:
SYSCALL(exit)
 312:	b8 02 00 00 00       	mov    $0x2,%eax
 317:	cd 40                	int    $0x40
 319:	c3                   	ret    

0000031a <wait>:
SYSCALL(wait)
 31a:	b8 03 00 00 00       	mov    $0x3,%eax
 31f:	cd 40                	int    $0x40
 321:	c3                   	ret    

00000322 <pipe>:
SYSCALL(pipe)
 322:	b8 04 00 00 00       	mov    $0x4,%eax
 327:	cd 40                	int    $0x40
 329:	c3                   	ret    

0000032a <read>:
SYSCALL(read)
 32a:	b8 05 00 00 00       	mov    $0x5,%eax
 32f:	cd 40                	int    $0x40
 331:	c3                   	ret    

00000332 <write>:
SYSCALL(write)
 332:	b8 10 00 00 00       	mov    $0x10,%eax
 337:	cd 40                	int    $0x40
 339:	c3                   	ret    

0000033a <close>:
SYSCALL(close)
 33a:	b8 15 00 00 00       	mov    $0x15,%eax
 33f:	cd 40                	int    $0x40
 341:	c3                   	ret    

00000342 <kill>:
SYSCALL(kill)
 342:	b8 06 00 00 00       	mov    $0x6,%eax
 347:	cd 40                	int    $0x40
 349:	c3                   	ret    

0000034a <exec>:
SYSCALL(exec)
 34a:	b8 07 00 00 00       	mov    $0x7,%eax
 34f:	cd 40                	int    $0x40
 351:	c3                   	ret    

00000352 <open>:
SYSCALL(open)
 352:	b8 0f 00 00 00       	mov    $0xf,%eax
 357:	cd 40                	int    $0x40
 359:	c3                   	ret    

0000035a <mknod>:
SYSCALL(mknod)
 35a:	b8 11 00 00 00       	mov    $0x11,%eax
 35f:	cd 40                	int    $0x40
 361:	c3                   	ret    

00000362 <unlink>:
SYSCALL(unlink)
 362:	b8 12 00 00 00       	mov    $0x12,%eax
 367:	cd 40                	int    $0x40
 369:	c3                   	ret    

0000036a <fstat>:
SYSCALL(fstat)
 36a:	b8 08 00 00 00       	mov    $0x8,%eax
 36f:	cd 40                	int    $0x40
 371:	c3                   	ret    

00000372 <link>:
SYSCALL(link)
 372:	b8 13 00 00 00       	mov    $0x13,%eax
 377:	cd 40                	int    $0x40
 379:	c3                   	ret    

0000037a <mkdir>:
SYSCALL(mkdir)
 37a:	b8 14 00 00 00       	mov    $0x14,%eax
 37f:	cd 40                	int    $0x40
 381:	c3                   	ret    

00000382 <chdir>:
SYSCALL(chdir)
 382:	b8 09 00 00 00       	mov    $0x9,%eax
 387:	cd 40                	int    $0x40
 389:	c3                   	ret    

0000038a <dup>:
SYSCALL(dup)
 38a:	b8 0a 00 00 00       	mov    $0xa,%eax
 38f:	cd 40                	int    $0x40
 391:	c3                   	ret    

00000392 <getpid>:
SYSCALL(getpid)
 392:	b8 0b 00 00 00       	mov    $0xb,%eax
 397:	cd 40                	int    $0x40
 399:	c3                   	ret    

0000039a <sbrk>:
SYSCALL(sbrk)
 39a:	b8 0c 00 00 00       	mov    $0xc,%eax
 39f:	cd 40                	int    $0x40
 3a1:	c3                   	ret    

000003a2 <sleep>:
SYSCALL(sleep)
 3a2:	b8 0d 00 00 00       	mov    $0xd,%eax
 3a7:	cd 40                	int    $0x40
 3a9:	c3                   	ret    

000003aa <uptime>:
SYSCALL(uptime)
 3aa:	b8 0e 00 00 00       	mov    $0xe,%eax
 3af:	cd 40                	int    $0x40
 3b1:	c3                   	ret    

000003b2 <clone>:
SYSCALL(clone)
 3b2:	b8 16 00 00 00       	mov    $0x16,%eax
 3b7:	cd 40                	int    $0x40
 3b9:	c3                   	ret    

000003ba <join>:
 3ba:	b8 17 00 00 00       	mov    $0x17,%eax
 3bf:	cd 40                	int    $0x40
 3c1:	c3                   	ret    

000003c2 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 3c2:	55                   	push   %ebp
 3c3:	89 e5                	mov    %esp,%ebp
 3c5:	83 ec 1c             	sub    $0x1c,%esp
 3c8:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 3cb:	6a 01                	push   $0x1
 3cd:	8d 55 f4             	lea    -0xc(%ebp),%edx
 3d0:	52                   	push   %edx
 3d1:	50                   	push   %eax
 3d2:	e8 5b ff ff ff       	call   332 <write>
}
 3d7:	83 c4 10             	add    $0x10,%esp
 3da:	c9                   	leave  
 3db:	c3                   	ret    

000003dc <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 3dc:	55                   	push   %ebp
 3dd:	89 e5                	mov    %esp,%ebp
 3df:	57                   	push   %edi
 3e0:	56                   	push   %esi
 3e1:	53                   	push   %ebx
 3e2:	83 ec 2c             	sub    $0x2c,%esp
 3e5:	89 45 d0             	mov    %eax,-0x30(%ebp)
 3e8:	89 d0                	mov    %edx,%eax
 3ea:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 3ec:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 3f0:	0f 95 c1             	setne  %cl
 3f3:	c1 ea 1f             	shr    $0x1f,%edx
 3f6:	84 d1                	test   %dl,%cl
 3f8:	74 44                	je     43e <printint+0x62>
    neg = 1;
    x = -xx;
 3fa:	f7 d8                	neg    %eax
 3fc:	89 c1                	mov    %eax,%ecx
    neg = 1;
 3fe:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 405:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 40a:	89 c8                	mov    %ecx,%eax
 40c:	ba 00 00 00 00       	mov    $0x0,%edx
 411:	f7 f6                	div    %esi
 413:	89 df                	mov    %ebx,%edi
 415:	83 c3 01             	add    $0x1,%ebx
 418:	0f b6 92 a8 07 00 00 	movzbl 0x7a8(%edx),%edx
 41f:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 423:	89 ca                	mov    %ecx,%edx
 425:	89 c1                	mov    %eax,%ecx
 427:	39 d6                	cmp    %edx,%esi
 429:	76 df                	jbe    40a <printint+0x2e>
  if(neg)
 42b:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 42f:	74 31                	je     462 <printint+0x86>
    buf[i++] = '-';
 431:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 436:	8d 5f 02             	lea    0x2(%edi),%ebx
 439:	8b 75 d0             	mov    -0x30(%ebp),%esi
 43c:	eb 17                	jmp    455 <printint+0x79>
    x = xx;
 43e:	89 c1                	mov    %eax,%ecx
  neg = 0;
 440:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 447:	eb bc                	jmp    405 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 449:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 44e:	89 f0                	mov    %esi,%eax
 450:	e8 6d ff ff ff       	call   3c2 <putc>
  while(--i >= 0)
 455:	83 eb 01             	sub    $0x1,%ebx
 458:	79 ef                	jns    449 <printint+0x6d>
}
 45a:	83 c4 2c             	add    $0x2c,%esp
 45d:	5b                   	pop    %ebx
 45e:	5e                   	pop    %esi
 45f:	5f                   	pop    %edi
 460:	5d                   	pop    %ebp
 461:	c3                   	ret    
 462:	8b 75 d0             	mov    -0x30(%ebp),%esi
 465:	eb ee                	jmp    455 <printint+0x79>

00000467 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 467:	55                   	push   %ebp
 468:	89 e5                	mov    %esp,%ebp
 46a:	57                   	push   %edi
 46b:	56                   	push   %esi
 46c:	53                   	push   %ebx
 46d:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 470:	8d 45 10             	lea    0x10(%ebp),%eax
 473:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 476:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 47b:	bb 00 00 00 00       	mov    $0x0,%ebx
 480:	eb 14                	jmp    496 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 482:	89 fa                	mov    %edi,%edx
 484:	8b 45 08             	mov    0x8(%ebp),%eax
 487:	e8 36 ff ff ff       	call   3c2 <putc>
 48c:	eb 05                	jmp    493 <printf+0x2c>
      }
    } else if(state == '%'){
 48e:	83 fe 25             	cmp    $0x25,%esi
 491:	74 25                	je     4b8 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 493:	83 c3 01             	add    $0x1,%ebx
 496:	8b 45 0c             	mov    0xc(%ebp),%eax
 499:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 49d:	84 c0                	test   %al,%al
 49f:	0f 84 20 01 00 00    	je     5c5 <printf+0x15e>
    c = fmt[i] & 0xff;
 4a5:	0f be f8             	movsbl %al,%edi
 4a8:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 4ab:	85 f6                	test   %esi,%esi
 4ad:	75 df                	jne    48e <printf+0x27>
      if(c == '%'){
 4af:	83 f8 25             	cmp    $0x25,%eax
 4b2:	75 ce                	jne    482 <printf+0x1b>
        state = '%';
 4b4:	89 c6                	mov    %eax,%esi
 4b6:	eb db                	jmp    493 <printf+0x2c>
      if(c == 'd'){
 4b8:	83 f8 25             	cmp    $0x25,%eax
 4bb:	0f 84 cf 00 00 00    	je     590 <printf+0x129>
 4c1:	0f 8c dd 00 00 00    	jl     5a4 <printf+0x13d>
 4c7:	83 f8 78             	cmp    $0x78,%eax
 4ca:	0f 8f d4 00 00 00    	jg     5a4 <printf+0x13d>
 4d0:	83 f8 63             	cmp    $0x63,%eax
 4d3:	0f 8c cb 00 00 00    	jl     5a4 <printf+0x13d>
 4d9:	83 e8 63             	sub    $0x63,%eax
 4dc:	83 f8 15             	cmp    $0x15,%eax
 4df:	0f 87 bf 00 00 00    	ja     5a4 <printf+0x13d>
 4e5:	ff 24 85 50 07 00 00 	jmp    *0x750(,%eax,4)
        printint(fd, *ap, 10, 1);
 4ec:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4ef:	8b 17                	mov    (%edi),%edx
 4f1:	83 ec 0c             	sub    $0xc,%esp
 4f4:	6a 01                	push   $0x1
 4f6:	b9 0a 00 00 00       	mov    $0xa,%ecx
 4fb:	8b 45 08             	mov    0x8(%ebp),%eax
 4fe:	e8 d9 fe ff ff       	call   3dc <printint>
        ap++;
 503:	83 c7 04             	add    $0x4,%edi
 506:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 509:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 50c:	be 00 00 00 00       	mov    $0x0,%esi
 511:	eb 80                	jmp    493 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 513:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 516:	8b 17                	mov    (%edi),%edx
 518:	83 ec 0c             	sub    $0xc,%esp
 51b:	6a 00                	push   $0x0
 51d:	b9 10 00 00 00       	mov    $0x10,%ecx
 522:	8b 45 08             	mov    0x8(%ebp),%eax
 525:	e8 b2 fe ff ff       	call   3dc <printint>
        ap++;
 52a:	83 c7 04             	add    $0x4,%edi
 52d:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 530:	83 c4 10             	add    $0x10,%esp
      state = 0;
 533:	be 00 00 00 00       	mov    $0x0,%esi
 538:	e9 56 ff ff ff       	jmp    493 <printf+0x2c>
        s = (char*)*ap;
 53d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 540:	8b 30                	mov    (%eax),%esi
        ap++;
 542:	83 c0 04             	add    $0x4,%eax
 545:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 548:	85 f6                	test   %esi,%esi
 54a:	75 15                	jne    561 <printf+0xfa>
          s = "(null)";
 54c:	be 47 07 00 00       	mov    $0x747,%esi
 551:	eb 0e                	jmp    561 <printf+0xfa>
          putc(fd, *s);
 553:	0f be d2             	movsbl %dl,%edx
 556:	8b 45 08             	mov    0x8(%ebp),%eax
 559:	e8 64 fe ff ff       	call   3c2 <putc>
          s++;
 55e:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 561:	0f b6 16             	movzbl (%esi),%edx
 564:	84 d2                	test   %dl,%dl
 566:	75 eb                	jne    553 <printf+0xec>
      state = 0;
 568:	be 00 00 00 00       	mov    $0x0,%esi
 56d:	e9 21 ff ff ff       	jmp    493 <printf+0x2c>
        putc(fd, *ap);
 572:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 575:	0f be 17             	movsbl (%edi),%edx
 578:	8b 45 08             	mov    0x8(%ebp),%eax
 57b:	e8 42 fe ff ff       	call   3c2 <putc>
        ap++;
 580:	83 c7 04             	add    $0x4,%edi
 583:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 586:	be 00 00 00 00       	mov    $0x0,%esi
 58b:	e9 03 ff ff ff       	jmp    493 <printf+0x2c>
        putc(fd, c);
 590:	89 fa                	mov    %edi,%edx
 592:	8b 45 08             	mov    0x8(%ebp),%eax
 595:	e8 28 fe ff ff       	call   3c2 <putc>
      state = 0;
 59a:	be 00 00 00 00       	mov    $0x0,%esi
 59f:	e9 ef fe ff ff       	jmp    493 <printf+0x2c>
        putc(fd, '%');
 5a4:	ba 25 00 00 00       	mov    $0x25,%edx
 5a9:	8b 45 08             	mov    0x8(%ebp),%eax
 5ac:	e8 11 fe ff ff       	call   3c2 <putc>
        putc(fd, c);
 5b1:	89 fa                	mov    %edi,%edx
 5b3:	8b 45 08             	mov    0x8(%ebp),%eax
 5b6:	e8 07 fe ff ff       	call   3c2 <putc>
      state = 0;
 5bb:	be 00 00 00 00       	mov    $0x0,%esi
 5c0:	e9 ce fe ff ff       	jmp    493 <printf+0x2c>
    }
  }
}
 5c5:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5c8:	5b                   	pop    %ebx
 5c9:	5e                   	pop    %esi
 5ca:	5f                   	pop    %edi
 5cb:	5d                   	pop    %ebp
 5cc:	c3                   	ret    

000005cd <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5cd:	55                   	push   %ebp
 5ce:	89 e5                	mov    %esp,%ebp
 5d0:	57                   	push   %edi
 5d1:	56                   	push   %esi
 5d2:	53                   	push   %ebx
 5d3:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 5d6:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5d9:	a1 40 0c 00 00       	mov    0xc40,%eax
 5de:	eb 02                	jmp    5e2 <free+0x15>
 5e0:	89 d0                	mov    %edx,%eax
 5e2:	39 c8                	cmp    %ecx,%eax
 5e4:	73 04                	jae    5ea <free+0x1d>
 5e6:	39 08                	cmp    %ecx,(%eax)
 5e8:	77 12                	ja     5fc <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5ea:	8b 10                	mov    (%eax),%edx
 5ec:	39 c2                	cmp    %eax,%edx
 5ee:	77 f0                	ja     5e0 <free+0x13>
 5f0:	39 c8                	cmp    %ecx,%eax
 5f2:	72 08                	jb     5fc <free+0x2f>
 5f4:	39 ca                	cmp    %ecx,%edx
 5f6:	77 04                	ja     5fc <free+0x2f>
 5f8:	89 d0                	mov    %edx,%eax
 5fa:	eb e6                	jmp    5e2 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 5fc:	8b 73 fc             	mov    -0x4(%ebx),%esi
 5ff:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 602:	8b 10                	mov    (%eax),%edx
 604:	39 d7                	cmp    %edx,%edi
 606:	74 19                	je     621 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 608:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 60b:	8b 50 04             	mov    0x4(%eax),%edx
 60e:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 611:	39 ce                	cmp    %ecx,%esi
 613:	74 1b                	je     630 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 615:	89 08                	mov    %ecx,(%eax)
  freep = p;
 617:	a3 40 0c 00 00       	mov    %eax,0xc40
}
 61c:	5b                   	pop    %ebx
 61d:	5e                   	pop    %esi
 61e:	5f                   	pop    %edi
 61f:	5d                   	pop    %ebp
 620:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 621:	03 72 04             	add    0x4(%edx),%esi
 624:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 627:	8b 10                	mov    (%eax),%edx
 629:	8b 12                	mov    (%edx),%edx
 62b:	89 53 f8             	mov    %edx,-0x8(%ebx)
 62e:	eb db                	jmp    60b <free+0x3e>
    p->s.size += bp->s.size;
 630:	03 53 fc             	add    -0x4(%ebx),%edx
 633:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 636:	8b 53 f8             	mov    -0x8(%ebx),%edx
 639:	89 10                	mov    %edx,(%eax)
 63b:	eb da                	jmp    617 <free+0x4a>

0000063d <morecore>:

static Header*
morecore(uint nu)
{
 63d:	55                   	push   %ebp
 63e:	89 e5                	mov    %esp,%ebp
 640:	53                   	push   %ebx
 641:	83 ec 04             	sub    $0x4,%esp
 644:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 646:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 64b:	77 05                	ja     652 <morecore+0x15>
    nu = 4096;
 64d:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 652:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 659:	83 ec 0c             	sub    $0xc,%esp
 65c:	50                   	push   %eax
 65d:	e8 38 fd ff ff       	call   39a <sbrk>
  if(p == (char*)-1)
 662:	83 c4 10             	add    $0x10,%esp
 665:	83 f8 ff             	cmp    $0xffffffff,%eax
 668:	74 1c                	je     686 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 66a:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 66d:	83 c0 08             	add    $0x8,%eax
 670:	83 ec 0c             	sub    $0xc,%esp
 673:	50                   	push   %eax
 674:	e8 54 ff ff ff       	call   5cd <free>
  return freep;
 679:	a1 40 0c 00 00       	mov    0xc40,%eax
 67e:	83 c4 10             	add    $0x10,%esp
}
 681:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 684:	c9                   	leave  
 685:	c3                   	ret    
    return 0;
 686:	b8 00 00 00 00       	mov    $0x0,%eax
 68b:	eb f4                	jmp    681 <morecore+0x44>

0000068d <malloc>:

void*
malloc(uint nbytes)
{
 68d:	55                   	push   %ebp
 68e:	89 e5                	mov    %esp,%ebp
 690:	53                   	push   %ebx
 691:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 694:	8b 45 08             	mov    0x8(%ebp),%eax
 697:	8d 58 07             	lea    0x7(%eax),%ebx
 69a:	c1 eb 03             	shr    $0x3,%ebx
 69d:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 6a0:	8b 0d 40 0c 00 00    	mov    0xc40,%ecx
 6a6:	85 c9                	test   %ecx,%ecx
 6a8:	74 04                	je     6ae <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6aa:	8b 01                	mov    (%ecx),%eax
 6ac:	eb 4a                	jmp    6f8 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 6ae:	c7 05 40 0c 00 00 44 	movl   $0xc44,0xc40
 6b5:	0c 00 00 
 6b8:	c7 05 44 0c 00 00 44 	movl   $0xc44,0xc44
 6bf:	0c 00 00 
    base.s.size = 0;
 6c2:	c7 05 48 0c 00 00 00 	movl   $0x0,0xc48
 6c9:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 6cc:	b9 44 0c 00 00       	mov    $0xc44,%ecx
 6d1:	eb d7                	jmp    6aa <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 6d3:	74 19                	je     6ee <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 6d5:	29 da                	sub    %ebx,%edx
 6d7:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 6da:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 6dd:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 6e0:	89 0d 40 0c 00 00    	mov    %ecx,0xc40
      return (void*)(p + 1);
 6e6:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 6e9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 6ec:	c9                   	leave  
 6ed:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 6ee:	8b 10                	mov    (%eax),%edx
 6f0:	89 11                	mov    %edx,(%ecx)
 6f2:	eb ec                	jmp    6e0 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6f4:	89 c1                	mov    %eax,%ecx
 6f6:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 6f8:	8b 50 04             	mov    0x4(%eax),%edx
 6fb:	39 da                	cmp    %ebx,%edx
 6fd:	73 d4                	jae    6d3 <malloc+0x46>
    if(p == freep)
 6ff:	39 05 40 0c 00 00    	cmp    %eax,0xc40
 705:	75 ed                	jne    6f4 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 707:	89 d8                	mov    %ebx,%eax
 709:	e8 2f ff ff ff       	call   63d <morecore>
 70e:	85 c0                	test   %eax,%eax
 710:	75 e2                	jne    6f4 <malloc+0x67>
 712:	eb d5                	jmp    6e9 <malloc+0x5c>
