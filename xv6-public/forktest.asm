
_forktest:     file format elf32-i386


Disassembly of section .text:

00000000 <printf>:

#define N  1000

void
printf(int fd, const char *s, ...)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	53                   	push   %ebx
   4:	83 ec 10             	sub    $0x10,%esp
   7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  write(fd, s, strlen(s));
   a:	53                   	push   %ebx
   b:	e8 25 02 00 00       	call   235 <strlen>
  10:	83 c4 0c             	add    $0xc,%esp
  13:	50                   	push   %eax
  14:	53                   	push   %ebx
  15:	ff 75 08             	push   0x8(%ebp)
  18:	e8 8b 03 00 00       	call   3a8 <write>
}
  1d:	83 c4 10             	add    $0x10,%esp
  20:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  23:	c9                   	leave  
  24:	c3                   	ret    

00000025 <forktest>:

void
forktest(void)
{
  25:	55                   	push   %ebp
  26:	89 e5                	mov    %esp,%ebp
  28:	53                   	push   %ebx
  29:	83 ec 0c             	sub    $0xc,%esp
  int n, pid;

  printf(1, "fork test\n");
  2c:	68 80 05 00 00       	push   $0x580
  31:	6a 01                	push   $0x1
  33:	e8 c8 ff ff ff       	call   0 <printf>

  for(n=0; n<N; n++){
  38:	83 c4 10             	add    $0x10,%esp
  3b:	bb 00 00 00 00       	mov    $0x0,%ebx
  40:	81 fb e7 03 00 00    	cmp    $0x3e7,%ebx
  46:	7f 15                	jg     5d <forktest+0x38>
    pid = fork();
  48:	e8 33 03 00 00       	call   380 <fork>
    if(pid < 0)
  4d:	85 c0                	test   %eax,%eax
  4f:	78 0c                	js     5d <forktest+0x38>
      break;
    if(pid == 0)
  51:	74 05                	je     58 <forktest+0x33>
  for(n=0; n<N; n++){
  53:	83 c3 01             	add    $0x1,%ebx
  56:	eb e8                	jmp    40 <forktest+0x1b>
      exit();
  58:	e8 2b 03 00 00       	call   388 <exit>
  }

  if(n == N){
  5d:	81 fb e8 03 00 00    	cmp    $0x3e8,%ebx
  63:	74 12                	je     77 <forktest+0x52>
    printf(1, "fork claimed to work N times!\n", N);
    exit();
  }

  for(; n > 0; n--){
  65:	85 db                	test   %ebx,%ebx
  67:	7e 3b                	jle    a4 <forktest+0x7f>
    if(wait() < 0){
  69:	e8 22 03 00 00       	call   390 <wait>
  6e:	85 c0                	test   %eax,%eax
  70:	78 1e                	js     90 <forktest+0x6b>
  for(; n > 0; n--){
  72:	83 eb 01             	sub    $0x1,%ebx
  75:	eb ee                	jmp    65 <forktest+0x40>
    printf(1, "fork claimed to work N times!\n", N);
  77:	83 ec 04             	sub    $0x4,%esp
  7a:	68 e8 03 00 00       	push   $0x3e8
  7f:	68 c0 05 00 00       	push   $0x5c0
  84:	6a 01                	push   $0x1
  86:	e8 75 ff ff ff       	call   0 <printf>
    exit();
  8b:	e8 f8 02 00 00       	call   388 <exit>
      printf(1, "wait stopped early\n");
  90:	83 ec 08             	sub    $0x8,%esp
  93:	68 8b 05 00 00       	push   $0x58b
  98:	6a 01                	push   $0x1
  9a:	e8 61 ff ff ff       	call   0 <printf>
      exit();
  9f:	e8 e4 02 00 00       	call   388 <exit>
    }
  }

  if(wait() != -1){
  a4:	e8 e7 02 00 00       	call   390 <wait>
  a9:	83 f8 ff             	cmp    $0xffffffff,%eax
  ac:	75 17                	jne    c5 <forktest+0xa0>
    printf(1, "wait got too many\n");
    exit();
  }

  printf(1, "fork test OK\n");
  ae:	83 ec 08             	sub    $0x8,%esp
  b1:	68 b2 05 00 00       	push   $0x5b2
  b6:	6a 01                	push   $0x1
  b8:	e8 43 ff ff ff       	call   0 <printf>
}
  bd:	83 c4 10             	add    $0x10,%esp
  c0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  c3:	c9                   	leave  
  c4:	c3                   	ret    
    printf(1, "wait got too many\n");
  c5:	83 ec 08             	sub    $0x8,%esp
  c8:	68 9f 05 00 00       	push   $0x59f
  cd:	6a 01                	push   $0x1
  cf:	e8 2c ff ff ff       	call   0 <printf>
    exit();
  d4:	e8 af 02 00 00       	call   388 <exit>

000000d9 <main>:

int
main(void)
{
  d9:	55                   	push   %ebp
  da:	89 e5                	mov    %esp,%ebp
  dc:	83 e4 f0             	and    $0xfffffff0,%esp
  forktest();
  df:	e8 41 ff ff ff       	call   25 <forktest>
  exit();
  e4:	e8 9f 02 00 00       	call   388 <exit>

000000e9 <test_and_set>:
  int flag;
};

struct thread_ref *threads[64];

int test_and_set(int *old_ptr, int new_ptr) {
  e9:	55                   	push   %ebp
  ea:	89 e5                	mov    %esp,%ebp
  ec:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *old_ptr;
  ef:	8b 10                	mov    (%eax),%edx
  *old_ptr = new_ptr;
  f1:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  f4:	89 08                	mov    %ecx,(%eax)
  return old;
}
  f6:	89 d0                	mov    %edx,%eax
  f8:	5d                   	pop    %ebp
  f9:	c3                   	ret    

000000fa <thread_create>:

// a wrapper func for clone
int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
  fa:	55                   	push   %ebp
  fb:	89 e5                	mov    %esp,%ebp
  fd:	53                   	push   %ebx
  fe:	83 ec 10             	sub    $0x10,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE*2);
 101:	68 00 20 00 00       	push   $0x2000
 106:	e8 ed 03 00 00       	call   4f8 <malloc>
  if(n_stack == 0){
 10b:	83 c4 10             	add    $0x10,%esp
 10e:	85 c0                	test   %eax,%eax
 110:	74 41                	je     153 <thread_create+0x59>
 112:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  int new_pid = clone(start_routine, arg1, arg2, n_stack);
 114:	50                   	push   %eax
 115:	ff 75 10             	push   0x10(%ebp)
 118:	ff 75 0c             	push   0xc(%ebp)
 11b:	ff 75 08             	push   0x8(%ebp)
 11e:	e8 05 03 00 00       	call   428 <clone>

  for(int i=0; i<64; i++){
 123:	83 c4 10             	add    $0x10,%esp
 126:	ba 00 00 00 00       	mov    $0x0,%edx
 12b:	eb 03                	jmp    130 <thread_create+0x36>
 12d:	83 c2 01             	add    $0x1,%edx
 130:	83 fa 3f             	cmp    $0x3f,%edx
 133:	7f 19                	jg     14e <thread_create+0x54>
    if(threads[i]->flag==0){
 135:	8b 0c 95 20 09 00 00 	mov    0x920(,%edx,4),%ecx
 13c:	83 79 08 00          	cmpl   $0x0,0x8(%ecx)
 140:	75 eb                	jne    12d <thread_create+0x33>
      threads[i]->maddr = n_stack;
 142:	89 19                	mov    %ebx,(%ecx)
      threads[i]->pg1addr = n_stack;
 144:	8b 14 95 20 09 00 00 	mov    0x920(,%edx,4),%edx
 14b:	89 5a 04             	mov    %ebx,0x4(%edx)
      break;
    }
  }

  return new_pid;
}
 14e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 151:	c9                   	leave  
 152:	c3                   	ret    
    return -1;
 153:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 158:	eb f4                	jmp    14e <thread_create+0x54>

0000015a <thread_join>:

//TODO: fix
int thread_join() {
 15a:	55                   	push   %ebp
 15b:	89 e5                	mov    %esp,%ebp
 15d:	56                   	push   %esi
 15e:	53                   	push   %ebx
 15f:	83 ec 1c             	sub    $0x1c,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 162:	8d 45 f4             	lea    -0xc(%ebp),%eax
 165:	50                   	push   %eax
 166:	e8 c5 02 00 00       	call   430 <join>
 16b:	89 c6                	mov    %eax,%esi
  for(int i=0; i<64; i++){
 16d:	83 c4 10             	add    $0x10,%esp
 170:	bb 00 00 00 00       	mov    $0x0,%ebx
 175:	eb 03                	jmp    17a <thread_join+0x20>
 177:	83 c3 01             	add    $0x1,%ebx
 17a:	83 fb 3f             	cmp    $0x3f,%ebx
 17d:	7f 23                	jg     1a2 <thread_join+0x48>
    if((threads[i]->flag==1) && (stk_addr == threads[i]->pg1addr)){
 17f:	8b 04 9d 20 09 00 00 	mov    0x920(,%ebx,4),%eax
 186:	83 78 08 01          	cmpl   $0x1,0x8(%eax)
 18a:	75 eb                	jne    177 <thread_join+0x1d>
 18c:	8b 55 f4             	mov    -0xc(%ebp),%edx
 18f:	39 50 04             	cmp    %edx,0x4(%eax)
 192:	75 e3                	jne    177 <thread_join+0x1d>
      free(stk_addr);
 194:	83 ec 0c             	sub    $0xc,%esp
 197:	52                   	push   %edx
 198:	e8 9b 02 00 00       	call   438 <free>
 19d:	83 c4 10             	add    $0x10,%esp
 1a0:	eb d5                	jmp    177 <thread_join+0x1d>
    }
  }
  return pid;
}
 1a2:	89 f0                	mov    %esi,%eax
 1a4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1a7:	5b                   	pop    %ebx
 1a8:	5e                   	pop    %esi
 1a9:	5d                   	pop    %ebp
 1aa:	c3                   	ret    

000001ab <lock_acquire>:

void lock_acquire(lock_t *lock){
 1ab:	55                   	push   %ebp
 1ac:	89 e5                	mov    %esp,%ebp
 1ae:	53                   	push   %ebx
 1af:	83 ec 04             	sub    $0x4,%esp
 1b2:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 1b5:	83 ec 08             	sub    $0x8,%esp
 1b8:	6a 01                	push   $0x1
 1ba:	53                   	push   %ebx
 1bb:	e8 29 ff ff ff       	call   e9 <test_and_set>
 1c0:	83 c4 10             	add    $0x10,%esp
 1c3:	83 f8 01             	cmp    $0x1,%eax
 1c6:	74 ed                	je     1b5 <lock_acquire+0xa>
    ;
}
 1c8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1cb:	c9                   	leave  
 1cc:	c3                   	ret    

000001cd <lock_release>:

void lock_release(lock_t *lock) {
 1cd:	55                   	push   %ebp
 1ce:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 1d0:	8b 45 08             	mov    0x8(%ebp),%eax
 1d3:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 1d9:	5d                   	pop    %ebp
 1da:	c3                   	ret    

000001db <lock_init>:

void lock_init(lock_t *lock) {
 1db:	55                   	push   %ebp
 1dc:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 1de:	8b 45 08             	mov    0x8(%ebp),%eax
 1e1:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 1e7:	5d                   	pop    %ebp
 1e8:	c3                   	ret    

000001e9 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 1e9:	55                   	push   %ebp
 1ea:	89 e5                	mov    %esp,%ebp
 1ec:	56                   	push   %esi
 1ed:	53                   	push   %ebx
 1ee:	8b 75 08             	mov    0x8(%ebp),%esi
 1f1:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 1f4:	89 f0                	mov    %esi,%eax
 1f6:	89 d1                	mov    %edx,%ecx
 1f8:	83 c2 01             	add    $0x1,%edx
 1fb:	89 c3                	mov    %eax,%ebx
 1fd:	83 c0 01             	add    $0x1,%eax
 200:	0f b6 09             	movzbl (%ecx),%ecx
 203:	88 0b                	mov    %cl,(%ebx)
 205:	84 c9                	test   %cl,%cl
 207:	75 ed                	jne    1f6 <strcpy+0xd>
    ;
  return os;
}
 209:	89 f0                	mov    %esi,%eax
 20b:	5b                   	pop    %ebx
 20c:	5e                   	pop    %esi
 20d:	5d                   	pop    %ebp
 20e:	c3                   	ret    

0000020f <strcmp>:

int
strcmp(const char *p, const char *q)
{
 20f:	55                   	push   %ebp
 210:	89 e5                	mov    %esp,%ebp
 212:	8b 4d 08             	mov    0x8(%ebp),%ecx
 215:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 218:	eb 06                	jmp    220 <strcmp+0x11>
    p++, q++;
 21a:	83 c1 01             	add    $0x1,%ecx
 21d:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 220:	0f b6 01             	movzbl (%ecx),%eax
 223:	84 c0                	test   %al,%al
 225:	74 04                	je     22b <strcmp+0x1c>
 227:	3a 02                	cmp    (%edx),%al
 229:	74 ef                	je     21a <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 22b:	0f b6 c0             	movzbl %al,%eax
 22e:	0f b6 12             	movzbl (%edx),%edx
 231:	29 d0                	sub    %edx,%eax
}
 233:	5d                   	pop    %ebp
 234:	c3                   	ret    

00000235 <strlen>:

uint
strlen(const char *s)
{
 235:	55                   	push   %ebp
 236:	89 e5                	mov    %esp,%ebp
 238:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 23b:	b8 00 00 00 00       	mov    $0x0,%eax
 240:	eb 03                	jmp    245 <strlen+0x10>
 242:	83 c0 01             	add    $0x1,%eax
 245:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 249:	75 f7                	jne    242 <strlen+0xd>
    ;
  return n;
}
 24b:	5d                   	pop    %ebp
 24c:	c3                   	ret    

0000024d <memset>:

void*
memset(void *dst, int c, uint n)
{
 24d:	55                   	push   %ebp
 24e:	89 e5                	mov    %esp,%ebp
 250:	57                   	push   %edi
 251:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 254:	89 d7                	mov    %edx,%edi
 256:	8b 4d 10             	mov    0x10(%ebp),%ecx
 259:	8b 45 0c             	mov    0xc(%ebp),%eax
 25c:	fc                   	cld    
 25d:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 25f:	89 d0                	mov    %edx,%eax
 261:	8b 7d fc             	mov    -0x4(%ebp),%edi
 264:	c9                   	leave  
 265:	c3                   	ret    

00000266 <strchr>:

char*
strchr(const char *s, char c)
{
 266:	55                   	push   %ebp
 267:	89 e5                	mov    %esp,%ebp
 269:	8b 45 08             	mov    0x8(%ebp),%eax
 26c:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 270:	eb 03                	jmp    275 <strchr+0xf>
 272:	83 c0 01             	add    $0x1,%eax
 275:	0f b6 10             	movzbl (%eax),%edx
 278:	84 d2                	test   %dl,%dl
 27a:	74 06                	je     282 <strchr+0x1c>
    if(*s == c)
 27c:	38 ca                	cmp    %cl,%dl
 27e:	75 f2                	jne    272 <strchr+0xc>
 280:	eb 05                	jmp    287 <strchr+0x21>
      return (char*)s;
  return 0;
 282:	b8 00 00 00 00       	mov    $0x0,%eax
}
 287:	5d                   	pop    %ebp
 288:	c3                   	ret    

00000289 <gets>:

char*
gets(char *buf, int max)
{
 289:	55                   	push   %ebp
 28a:	89 e5                	mov    %esp,%ebp
 28c:	57                   	push   %edi
 28d:	56                   	push   %esi
 28e:	53                   	push   %ebx
 28f:	83 ec 1c             	sub    $0x1c,%esp
 292:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 295:	bb 00 00 00 00       	mov    $0x0,%ebx
 29a:	89 de                	mov    %ebx,%esi
 29c:	83 c3 01             	add    $0x1,%ebx
 29f:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2a2:	7d 2e                	jge    2d2 <gets+0x49>
    cc = read(0, &c, 1);
 2a4:	83 ec 04             	sub    $0x4,%esp
 2a7:	6a 01                	push   $0x1
 2a9:	8d 45 e7             	lea    -0x19(%ebp),%eax
 2ac:	50                   	push   %eax
 2ad:	6a 00                	push   $0x0
 2af:	e8 ec 00 00 00       	call   3a0 <read>
    if(cc < 1)
 2b4:	83 c4 10             	add    $0x10,%esp
 2b7:	85 c0                	test   %eax,%eax
 2b9:	7e 17                	jle    2d2 <gets+0x49>
      break;
    buf[i++] = c;
 2bb:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2bf:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 2c2:	3c 0a                	cmp    $0xa,%al
 2c4:	0f 94 c2             	sete   %dl
 2c7:	3c 0d                	cmp    $0xd,%al
 2c9:	0f 94 c0             	sete   %al
 2cc:	08 c2                	or     %al,%dl
 2ce:	74 ca                	je     29a <gets+0x11>
    buf[i++] = c;
 2d0:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 2d2:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 2d6:	89 f8                	mov    %edi,%eax
 2d8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2db:	5b                   	pop    %ebx
 2dc:	5e                   	pop    %esi
 2dd:	5f                   	pop    %edi
 2de:	5d                   	pop    %ebp
 2df:	c3                   	ret    

000002e0 <stat>:

int
stat(const char *n, struct stat *st)
{
 2e0:	55                   	push   %ebp
 2e1:	89 e5                	mov    %esp,%ebp
 2e3:	56                   	push   %esi
 2e4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2e5:	83 ec 08             	sub    $0x8,%esp
 2e8:	6a 00                	push   $0x0
 2ea:	ff 75 08             	push   0x8(%ebp)
 2ed:	e8 d6 00 00 00       	call   3c8 <open>
  if(fd < 0)
 2f2:	83 c4 10             	add    $0x10,%esp
 2f5:	85 c0                	test   %eax,%eax
 2f7:	78 24                	js     31d <stat+0x3d>
 2f9:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 2fb:	83 ec 08             	sub    $0x8,%esp
 2fe:	ff 75 0c             	push   0xc(%ebp)
 301:	50                   	push   %eax
 302:	e8 d9 00 00 00       	call   3e0 <fstat>
 307:	89 c6                	mov    %eax,%esi
  close(fd);
 309:	89 1c 24             	mov    %ebx,(%esp)
 30c:	e8 9f 00 00 00       	call   3b0 <close>
  return r;
 311:	83 c4 10             	add    $0x10,%esp
}
 314:	89 f0                	mov    %esi,%eax
 316:	8d 65 f8             	lea    -0x8(%ebp),%esp
 319:	5b                   	pop    %ebx
 31a:	5e                   	pop    %esi
 31b:	5d                   	pop    %ebp
 31c:	c3                   	ret    
    return -1;
 31d:	be ff ff ff ff       	mov    $0xffffffff,%esi
 322:	eb f0                	jmp    314 <stat+0x34>

00000324 <atoi>:

int
atoi(const char *s)
{
 324:	55                   	push   %ebp
 325:	89 e5                	mov    %esp,%ebp
 327:	53                   	push   %ebx
 328:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 32b:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 330:	eb 10                	jmp    342 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 332:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 335:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 338:	83 c1 01             	add    $0x1,%ecx
 33b:	0f be c0             	movsbl %al,%eax
 33e:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 342:	0f b6 01             	movzbl (%ecx),%eax
 345:	8d 58 d0             	lea    -0x30(%eax),%ebx
 348:	80 fb 09             	cmp    $0x9,%bl
 34b:	76 e5                	jbe    332 <atoi+0xe>
  return n;
}
 34d:	89 d0                	mov    %edx,%eax
 34f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 352:	c9                   	leave  
 353:	c3                   	ret    

00000354 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 354:	55                   	push   %ebp
 355:	89 e5                	mov    %esp,%ebp
 357:	56                   	push   %esi
 358:	53                   	push   %ebx
 359:	8b 75 08             	mov    0x8(%ebp),%esi
 35c:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 35f:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 362:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 364:	eb 0d                	jmp    373 <memmove+0x1f>
    *dst++ = *src++;
 366:	0f b6 01             	movzbl (%ecx),%eax
 369:	88 02                	mov    %al,(%edx)
 36b:	8d 49 01             	lea    0x1(%ecx),%ecx
 36e:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 371:	89 d8                	mov    %ebx,%eax
 373:	8d 58 ff             	lea    -0x1(%eax),%ebx
 376:	85 c0                	test   %eax,%eax
 378:	7f ec                	jg     366 <memmove+0x12>
  return vdst;
}
 37a:	89 f0                	mov    %esi,%eax
 37c:	5b                   	pop    %ebx
 37d:	5e                   	pop    %esi
 37e:	5d                   	pop    %ebp
 37f:	c3                   	ret    

00000380 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 380:	b8 01 00 00 00       	mov    $0x1,%eax
 385:	cd 40                	int    $0x40
 387:	c3                   	ret    

00000388 <exit>:
SYSCALL(exit)
 388:	b8 02 00 00 00       	mov    $0x2,%eax
 38d:	cd 40                	int    $0x40
 38f:	c3                   	ret    

00000390 <wait>:
SYSCALL(wait)
 390:	b8 03 00 00 00       	mov    $0x3,%eax
 395:	cd 40                	int    $0x40
 397:	c3                   	ret    

00000398 <pipe>:
SYSCALL(pipe)
 398:	b8 04 00 00 00       	mov    $0x4,%eax
 39d:	cd 40                	int    $0x40
 39f:	c3                   	ret    

000003a0 <read>:
SYSCALL(read)
 3a0:	b8 05 00 00 00       	mov    $0x5,%eax
 3a5:	cd 40                	int    $0x40
 3a7:	c3                   	ret    

000003a8 <write>:
SYSCALL(write)
 3a8:	b8 10 00 00 00       	mov    $0x10,%eax
 3ad:	cd 40                	int    $0x40
 3af:	c3                   	ret    

000003b0 <close>:
SYSCALL(close)
 3b0:	b8 15 00 00 00       	mov    $0x15,%eax
 3b5:	cd 40                	int    $0x40
 3b7:	c3                   	ret    

000003b8 <kill>:
SYSCALL(kill)
 3b8:	b8 06 00 00 00       	mov    $0x6,%eax
 3bd:	cd 40                	int    $0x40
 3bf:	c3                   	ret    

000003c0 <exec>:
SYSCALL(exec)
 3c0:	b8 07 00 00 00       	mov    $0x7,%eax
 3c5:	cd 40                	int    $0x40
 3c7:	c3                   	ret    

000003c8 <open>:
SYSCALL(open)
 3c8:	b8 0f 00 00 00       	mov    $0xf,%eax
 3cd:	cd 40                	int    $0x40
 3cf:	c3                   	ret    

000003d0 <mknod>:
SYSCALL(mknod)
 3d0:	b8 11 00 00 00       	mov    $0x11,%eax
 3d5:	cd 40                	int    $0x40
 3d7:	c3                   	ret    

000003d8 <unlink>:
SYSCALL(unlink)
 3d8:	b8 12 00 00 00       	mov    $0x12,%eax
 3dd:	cd 40                	int    $0x40
 3df:	c3                   	ret    

000003e0 <fstat>:
SYSCALL(fstat)
 3e0:	b8 08 00 00 00       	mov    $0x8,%eax
 3e5:	cd 40                	int    $0x40
 3e7:	c3                   	ret    

000003e8 <link>:
SYSCALL(link)
 3e8:	b8 13 00 00 00       	mov    $0x13,%eax
 3ed:	cd 40                	int    $0x40
 3ef:	c3                   	ret    

000003f0 <mkdir>:
SYSCALL(mkdir)
 3f0:	b8 14 00 00 00       	mov    $0x14,%eax
 3f5:	cd 40                	int    $0x40
 3f7:	c3                   	ret    

000003f8 <chdir>:
SYSCALL(chdir)
 3f8:	b8 09 00 00 00       	mov    $0x9,%eax
 3fd:	cd 40                	int    $0x40
 3ff:	c3                   	ret    

00000400 <dup>:
SYSCALL(dup)
 400:	b8 0a 00 00 00       	mov    $0xa,%eax
 405:	cd 40                	int    $0x40
 407:	c3                   	ret    

00000408 <getpid>:
SYSCALL(getpid)
 408:	b8 0b 00 00 00       	mov    $0xb,%eax
 40d:	cd 40                	int    $0x40
 40f:	c3                   	ret    

00000410 <sbrk>:
SYSCALL(sbrk)
 410:	b8 0c 00 00 00       	mov    $0xc,%eax
 415:	cd 40                	int    $0x40
 417:	c3                   	ret    

00000418 <sleep>:
SYSCALL(sleep)
 418:	b8 0d 00 00 00       	mov    $0xd,%eax
 41d:	cd 40                	int    $0x40
 41f:	c3                   	ret    

00000420 <uptime>:
SYSCALL(uptime)
 420:	b8 0e 00 00 00       	mov    $0xe,%eax
 425:	cd 40                	int    $0x40
 427:	c3                   	ret    

00000428 <clone>:
SYSCALL(clone)
 428:	b8 16 00 00 00       	mov    $0x16,%eax
 42d:	cd 40                	int    $0x40
 42f:	c3                   	ret    

00000430 <join>:
 430:	b8 17 00 00 00       	mov    $0x17,%eax
 435:	cd 40                	int    $0x40
 437:	c3                   	ret    

00000438 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 438:	55                   	push   %ebp
 439:	89 e5                	mov    %esp,%ebp
 43b:	57                   	push   %edi
 43c:	56                   	push   %esi
 43d:	53                   	push   %ebx
 43e:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 441:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 444:	a1 20 0a 00 00       	mov    0xa20,%eax
 449:	eb 02                	jmp    44d <free+0x15>
 44b:	89 d0                	mov    %edx,%eax
 44d:	39 c8                	cmp    %ecx,%eax
 44f:	73 04                	jae    455 <free+0x1d>
 451:	39 08                	cmp    %ecx,(%eax)
 453:	77 12                	ja     467 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 455:	8b 10                	mov    (%eax),%edx
 457:	39 c2                	cmp    %eax,%edx
 459:	77 f0                	ja     44b <free+0x13>
 45b:	39 c8                	cmp    %ecx,%eax
 45d:	72 08                	jb     467 <free+0x2f>
 45f:	39 ca                	cmp    %ecx,%edx
 461:	77 04                	ja     467 <free+0x2f>
 463:	89 d0                	mov    %edx,%eax
 465:	eb e6                	jmp    44d <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 467:	8b 73 fc             	mov    -0x4(%ebx),%esi
 46a:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 46d:	8b 10                	mov    (%eax),%edx
 46f:	39 d7                	cmp    %edx,%edi
 471:	74 19                	je     48c <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 473:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 476:	8b 50 04             	mov    0x4(%eax),%edx
 479:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 47c:	39 ce                	cmp    %ecx,%esi
 47e:	74 1b                	je     49b <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 480:	89 08                	mov    %ecx,(%eax)
  freep = p;
 482:	a3 20 0a 00 00       	mov    %eax,0xa20
}
 487:	5b                   	pop    %ebx
 488:	5e                   	pop    %esi
 489:	5f                   	pop    %edi
 48a:	5d                   	pop    %ebp
 48b:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 48c:	03 72 04             	add    0x4(%edx),%esi
 48f:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 492:	8b 10                	mov    (%eax),%edx
 494:	8b 12                	mov    (%edx),%edx
 496:	89 53 f8             	mov    %edx,-0x8(%ebx)
 499:	eb db                	jmp    476 <free+0x3e>
    p->s.size += bp->s.size;
 49b:	03 53 fc             	add    -0x4(%ebx),%edx
 49e:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 4a1:	8b 53 f8             	mov    -0x8(%ebx),%edx
 4a4:	89 10                	mov    %edx,(%eax)
 4a6:	eb da                	jmp    482 <free+0x4a>

000004a8 <morecore>:

static Header*
morecore(uint nu)
{
 4a8:	55                   	push   %ebp
 4a9:	89 e5                	mov    %esp,%ebp
 4ab:	53                   	push   %ebx
 4ac:	83 ec 04             	sub    $0x4,%esp
 4af:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 4b1:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 4b6:	77 05                	ja     4bd <morecore+0x15>
    nu = 4096;
 4b8:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 4bd:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 4c4:	83 ec 0c             	sub    $0xc,%esp
 4c7:	50                   	push   %eax
 4c8:	e8 43 ff ff ff       	call   410 <sbrk>
  if(p == (char*)-1)
 4cd:	83 c4 10             	add    $0x10,%esp
 4d0:	83 f8 ff             	cmp    $0xffffffff,%eax
 4d3:	74 1c                	je     4f1 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 4d5:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 4d8:	83 c0 08             	add    $0x8,%eax
 4db:	83 ec 0c             	sub    $0xc,%esp
 4de:	50                   	push   %eax
 4df:	e8 54 ff ff ff       	call   438 <free>
  return freep;
 4e4:	a1 20 0a 00 00       	mov    0xa20,%eax
 4e9:	83 c4 10             	add    $0x10,%esp
}
 4ec:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4ef:	c9                   	leave  
 4f0:	c3                   	ret    
    return 0;
 4f1:	b8 00 00 00 00       	mov    $0x0,%eax
 4f6:	eb f4                	jmp    4ec <morecore+0x44>

000004f8 <malloc>:

void*
malloc(uint nbytes)
{
 4f8:	55                   	push   %ebp
 4f9:	89 e5                	mov    %esp,%ebp
 4fb:	53                   	push   %ebx
 4fc:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 4ff:	8b 45 08             	mov    0x8(%ebp),%eax
 502:	8d 58 07             	lea    0x7(%eax),%ebx
 505:	c1 eb 03             	shr    $0x3,%ebx
 508:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 50b:	8b 0d 20 0a 00 00    	mov    0xa20,%ecx
 511:	85 c9                	test   %ecx,%ecx
 513:	74 04                	je     519 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 515:	8b 01                	mov    (%ecx),%eax
 517:	eb 4a                	jmp    563 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 519:	c7 05 20 0a 00 00 24 	movl   $0xa24,0xa20
 520:	0a 00 00 
 523:	c7 05 24 0a 00 00 24 	movl   $0xa24,0xa24
 52a:	0a 00 00 
    base.s.size = 0;
 52d:	c7 05 28 0a 00 00 00 	movl   $0x0,0xa28
 534:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 537:	b9 24 0a 00 00       	mov    $0xa24,%ecx
 53c:	eb d7                	jmp    515 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 53e:	74 19                	je     559 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 540:	29 da                	sub    %ebx,%edx
 542:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 545:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 548:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 54b:	89 0d 20 0a 00 00    	mov    %ecx,0xa20
      return (void*)(p + 1);
 551:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 554:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 557:	c9                   	leave  
 558:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 559:	8b 10                	mov    (%eax),%edx
 55b:	89 11                	mov    %edx,(%ecx)
 55d:	eb ec                	jmp    54b <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 55f:	89 c1                	mov    %eax,%ecx
 561:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 563:	8b 50 04             	mov    0x4(%eax),%edx
 566:	39 da                	cmp    %ebx,%edx
 568:	73 d4                	jae    53e <malloc+0x46>
    if(p == freep)
 56a:	39 05 20 0a 00 00    	cmp    %eax,0xa20
 570:	75 ed                	jne    55f <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 572:	89 d8                	mov    %ebx,%eax
 574:	e8 2f ff ff ff       	call   4a8 <morecore>
 579:	85 c0                	test   %eax,%eax
 57b:	75 e2                	jne    55f <malloc+0x67>
 57d:	eb d5                	jmp    554 <malloc+0x5c>
