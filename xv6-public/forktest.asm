
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
   b:	e8 2d 02 00 00       	call   23d <strlen>
  10:	83 c4 0c             	add    $0xc,%esp
  13:	50                   	push   %eax
  14:	53                   	push   %ebx
  15:	ff 75 08             	push   0x8(%ebp)
  18:	e8 93 03 00 00       	call   3b0 <write>
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
  2c:	68 88 05 00 00       	push   $0x588
  31:	6a 01                	push   $0x1
  33:	e8 c8 ff ff ff       	call   0 <printf>

  for(n=0; n<N; n++){
  38:	83 c4 10             	add    $0x10,%esp
  3b:	bb 00 00 00 00       	mov    $0x0,%ebx
  40:	81 fb e7 03 00 00    	cmp    $0x3e7,%ebx
  46:	7f 15                	jg     5d <forktest+0x38>
    pid = fork();
  48:	e8 3b 03 00 00       	call   388 <fork>
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
  58:	e8 33 03 00 00       	call   390 <exit>
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
  69:	e8 2a 03 00 00       	call   398 <wait>
  6e:	85 c0                	test   %eax,%eax
  70:	78 1e                	js     90 <forktest+0x6b>
  for(; n > 0; n--){
  72:	83 eb 01             	sub    $0x1,%ebx
  75:	eb ee                	jmp    65 <forktest+0x40>
    printf(1, "fork claimed to work N times!\n", N);
  77:	83 ec 04             	sub    $0x4,%esp
  7a:	68 e8 03 00 00       	push   $0x3e8
  7f:	68 c8 05 00 00       	push   $0x5c8
  84:	6a 01                	push   $0x1
  86:	e8 75 ff ff ff       	call   0 <printf>
    exit();
  8b:	e8 00 03 00 00       	call   390 <exit>
      printf(1, "wait stopped early\n");
  90:	83 ec 08             	sub    $0x8,%esp
  93:	68 93 05 00 00       	push   $0x593
  98:	6a 01                	push   $0x1
  9a:	e8 61 ff ff ff       	call   0 <printf>
      exit();
  9f:	e8 ec 02 00 00       	call   390 <exit>
    }
  }

  if(wait() != -1){
  a4:	e8 ef 02 00 00       	call   398 <wait>
  a9:	83 f8 ff             	cmp    $0xffffffff,%eax
  ac:	75 17                	jne    c5 <forktest+0xa0>
    printf(1, "wait got too many\n");
    exit();
  }

  printf(1, "fork test OK\n");
  ae:	83 ec 08             	sub    $0x8,%esp
  b1:	68 ba 05 00 00       	push   $0x5ba
  b6:	6a 01                	push   $0x1
  b8:	e8 43 ff ff ff       	call   0 <printf>
}
  bd:	83 c4 10             	add    $0x10,%esp
  c0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  c3:	c9                   	leave  
  c4:	c3                   	ret    
    printf(1, "wait got too many\n");
  c5:	83 ec 08             	sub    $0x8,%esp
  c8:	68 a7 05 00 00       	push   $0x5a7
  cd:	6a 01                	push   $0x1
  cf:	e8 2c ff ff ff       	call   0 <printf>
    exit();
  d4:	e8 b7 02 00 00       	call   390 <exit>

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
  e4:	e8 a7 02 00 00       	call   390 <exit>

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
  fd:	83 ec 14             	sub    $0x14,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE*2);
 100:	68 00 20 00 00       	push   $0x2000
 105:	e8 f6 03 00 00       	call   500 <malloc>
  if(n_stack == 0){
 10a:	83 c4 10             	add    $0x10,%esp
 10d:	85 c0                	test   %eax,%eax
 10f:	74 4a                	je     15b <thread_create+0x61>
    return -1;
  }
  
  for(int i=0; i<64; i++){
 111:	ba 00 00 00 00       	mov    $0x0,%edx
 116:	eb 03                	jmp    11b <thread_create+0x21>
 118:	83 c2 01             	add    $0x1,%edx
 11b:	83 fa 3f             	cmp    $0x3f,%edx
 11e:	7f 27                	jg     147 <thread_create+0x4d>
    if(threads[i]->flag==0){
 120:	8b 0c 95 20 09 00 00 	mov    0x920(,%edx,4),%ecx
 127:	83 79 08 00          	cmpl   $0x0,0x8(%ecx)
 12b:	75 eb                	jne    118 <thread_create+0x1e>
      threads[i]->maddr = n_stack;
 12d:	89 01                	mov    %eax,(%ecx)
      threads[i]->pg1addr = n_stack;
 12f:	8b 0c 95 20 09 00 00 	mov    0x920(,%edx,4),%ecx
 136:	89 41 04             	mov    %eax,0x4(%ecx)
      threads[i]->flag = 1;
 139:	8b 14 95 20 09 00 00 	mov    0x920(,%edx,4),%edx
 140:	c7 42 08 01 00 00 00 	movl   $0x1,0x8(%edx)
      break;
    }
  }
  
  int new_pid = clone(start_routine, arg1, arg2, n_stack); // TODO: is this the right way to call it?
 147:	50                   	push   %eax
 148:	ff 75 10             	push   0x10(%ebp)
 14b:	ff 75 0c             	push   0xc(%ebp)
 14e:	ff 75 08             	push   0x8(%ebp)
 151:	e8 da 02 00 00       	call   430 <clone>

  // I can't remember if there was something else to do here but I'm sure I'll find out



  return new_pid;
 156:	83 c4 10             	add    $0x10,%esp
}
 159:	c9                   	leave  
 15a:	c3                   	ret    
    return -1;
 15b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 160:	eb f7                	jmp    159 <thread_create+0x5f>

00000162 <thread_join>:

//TODO: fix
int thread_join() {
 162:	55                   	push   %ebp
 163:	89 e5                	mov    %esp,%ebp
 165:	56                   	push   %esi
 166:	53                   	push   %ebx
 167:	83 ec 1c             	sub    $0x1c,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 16a:	8d 45 f4             	lea    -0xc(%ebp),%eax
 16d:	50                   	push   %eax
 16e:	e8 c5 02 00 00       	call   438 <join>
 173:	89 c6                	mov    %eax,%esi
  for(int i=0; i<64; i++){
 175:	83 c4 10             	add    $0x10,%esp
 178:	bb 00 00 00 00       	mov    $0x0,%ebx
 17d:	eb 03                	jmp    182 <thread_join+0x20>
 17f:	83 c3 01             	add    $0x1,%ebx
 182:	83 fb 3f             	cmp    $0x3f,%ebx
 185:	7f 23                	jg     1aa <thread_join+0x48>
    if((threads[i]->flag==1) && (stk_addr == threads[i]->pg1addr)){
 187:	8b 04 9d 20 09 00 00 	mov    0x920(,%ebx,4),%eax
 18e:	83 78 08 01          	cmpl   $0x1,0x8(%eax)
 192:	75 eb                	jne    17f <thread_join+0x1d>
 194:	8b 55 f4             	mov    -0xc(%ebp),%edx
 197:	39 50 04             	cmp    %edx,0x4(%eax)
 19a:	75 e3                	jne    17f <thread_join+0x1d>
      free(stk_addr);
 19c:	83 ec 0c             	sub    $0xc,%esp
 19f:	52                   	push   %edx
 1a0:	e8 9b 02 00 00       	call   440 <free>
 1a5:	83 c4 10             	add    $0x10,%esp
 1a8:	eb d5                	jmp    17f <thread_join+0x1d>
    }
  }
  return pid;
}
 1aa:	89 f0                	mov    %esi,%eax
 1ac:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1af:	5b                   	pop    %ebx
 1b0:	5e                   	pop    %esi
 1b1:	5d                   	pop    %ebp
 1b2:	c3                   	ret    

000001b3 <lock_acquire>:

void lock_acquire(lock_t *lock){
 1b3:	55                   	push   %ebp
 1b4:	89 e5                	mov    %esp,%ebp
 1b6:	53                   	push   %ebx
 1b7:	83 ec 04             	sub    $0x4,%esp
 1ba:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 1bd:	83 ec 08             	sub    $0x8,%esp
 1c0:	6a 01                	push   $0x1
 1c2:	53                   	push   %ebx
 1c3:	e8 21 ff ff ff       	call   e9 <test_and_set>
 1c8:	83 c4 10             	add    $0x10,%esp
 1cb:	83 f8 01             	cmp    $0x1,%eax
 1ce:	74 ed                	je     1bd <lock_acquire+0xa>
    ;
}
 1d0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1d3:	c9                   	leave  
 1d4:	c3                   	ret    

000001d5 <lock_release>:

void lock_release(lock_t *lock) {
 1d5:	55                   	push   %ebp
 1d6:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 1d8:	8b 45 08             	mov    0x8(%ebp),%eax
 1db:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 1e1:	5d                   	pop    %ebp
 1e2:	c3                   	ret    

000001e3 <lock_init>:

void lock_init(lock_t *lock) {
 1e3:	55                   	push   %ebp
 1e4:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 1e6:	8b 45 08             	mov    0x8(%ebp),%eax
 1e9:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 1ef:	5d                   	pop    %ebp
 1f0:	c3                   	ret    

000001f1 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 1f1:	55                   	push   %ebp
 1f2:	89 e5                	mov    %esp,%ebp
 1f4:	56                   	push   %esi
 1f5:	53                   	push   %ebx
 1f6:	8b 75 08             	mov    0x8(%ebp),%esi
 1f9:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 1fc:	89 f0                	mov    %esi,%eax
 1fe:	89 d1                	mov    %edx,%ecx
 200:	83 c2 01             	add    $0x1,%edx
 203:	89 c3                	mov    %eax,%ebx
 205:	83 c0 01             	add    $0x1,%eax
 208:	0f b6 09             	movzbl (%ecx),%ecx
 20b:	88 0b                	mov    %cl,(%ebx)
 20d:	84 c9                	test   %cl,%cl
 20f:	75 ed                	jne    1fe <strcpy+0xd>
    ;
  return os;
}
 211:	89 f0                	mov    %esi,%eax
 213:	5b                   	pop    %ebx
 214:	5e                   	pop    %esi
 215:	5d                   	pop    %ebp
 216:	c3                   	ret    

00000217 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 217:	55                   	push   %ebp
 218:	89 e5                	mov    %esp,%ebp
 21a:	8b 4d 08             	mov    0x8(%ebp),%ecx
 21d:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 220:	eb 06                	jmp    228 <strcmp+0x11>
    p++, q++;
 222:	83 c1 01             	add    $0x1,%ecx
 225:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 228:	0f b6 01             	movzbl (%ecx),%eax
 22b:	84 c0                	test   %al,%al
 22d:	74 04                	je     233 <strcmp+0x1c>
 22f:	3a 02                	cmp    (%edx),%al
 231:	74 ef                	je     222 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 233:	0f b6 c0             	movzbl %al,%eax
 236:	0f b6 12             	movzbl (%edx),%edx
 239:	29 d0                	sub    %edx,%eax
}
 23b:	5d                   	pop    %ebp
 23c:	c3                   	ret    

0000023d <strlen>:

uint
strlen(const char *s)
{
 23d:	55                   	push   %ebp
 23e:	89 e5                	mov    %esp,%ebp
 240:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 243:	b8 00 00 00 00       	mov    $0x0,%eax
 248:	eb 03                	jmp    24d <strlen+0x10>
 24a:	83 c0 01             	add    $0x1,%eax
 24d:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 251:	75 f7                	jne    24a <strlen+0xd>
    ;
  return n;
}
 253:	5d                   	pop    %ebp
 254:	c3                   	ret    

00000255 <memset>:

void*
memset(void *dst, int c, uint n)
{
 255:	55                   	push   %ebp
 256:	89 e5                	mov    %esp,%ebp
 258:	57                   	push   %edi
 259:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 25c:	89 d7                	mov    %edx,%edi
 25e:	8b 4d 10             	mov    0x10(%ebp),%ecx
 261:	8b 45 0c             	mov    0xc(%ebp),%eax
 264:	fc                   	cld    
 265:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 267:	89 d0                	mov    %edx,%eax
 269:	8b 7d fc             	mov    -0x4(%ebp),%edi
 26c:	c9                   	leave  
 26d:	c3                   	ret    

0000026e <strchr>:

char*
strchr(const char *s, char c)
{
 26e:	55                   	push   %ebp
 26f:	89 e5                	mov    %esp,%ebp
 271:	8b 45 08             	mov    0x8(%ebp),%eax
 274:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 278:	eb 03                	jmp    27d <strchr+0xf>
 27a:	83 c0 01             	add    $0x1,%eax
 27d:	0f b6 10             	movzbl (%eax),%edx
 280:	84 d2                	test   %dl,%dl
 282:	74 06                	je     28a <strchr+0x1c>
    if(*s == c)
 284:	38 ca                	cmp    %cl,%dl
 286:	75 f2                	jne    27a <strchr+0xc>
 288:	eb 05                	jmp    28f <strchr+0x21>
      return (char*)s;
  return 0;
 28a:	b8 00 00 00 00       	mov    $0x0,%eax
}
 28f:	5d                   	pop    %ebp
 290:	c3                   	ret    

00000291 <gets>:

char*
gets(char *buf, int max)
{
 291:	55                   	push   %ebp
 292:	89 e5                	mov    %esp,%ebp
 294:	57                   	push   %edi
 295:	56                   	push   %esi
 296:	53                   	push   %ebx
 297:	83 ec 1c             	sub    $0x1c,%esp
 29a:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 29d:	bb 00 00 00 00       	mov    $0x0,%ebx
 2a2:	89 de                	mov    %ebx,%esi
 2a4:	83 c3 01             	add    $0x1,%ebx
 2a7:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2aa:	7d 2e                	jge    2da <gets+0x49>
    cc = read(0, &c, 1);
 2ac:	83 ec 04             	sub    $0x4,%esp
 2af:	6a 01                	push   $0x1
 2b1:	8d 45 e7             	lea    -0x19(%ebp),%eax
 2b4:	50                   	push   %eax
 2b5:	6a 00                	push   $0x0
 2b7:	e8 ec 00 00 00       	call   3a8 <read>
    if(cc < 1)
 2bc:	83 c4 10             	add    $0x10,%esp
 2bf:	85 c0                	test   %eax,%eax
 2c1:	7e 17                	jle    2da <gets+0x49>
      break;
    buf[i++] = c;
 2c3:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2c7:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 2ca:	3c 0a                	cmp    $0xa,%al
 2cc:	0f 94 c2             	sete   %dl
 2cf:	3c 0d                	cmp    $0xd,%al
 2d1:	0f 94 c0             	sete   %al
 2d4:	08 c2                	or     %al,%dl
 2d6:	74 ca                	je     2a2 <gets+0x11>
    buf[i++] = c;
 2d8:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 2da:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 2de:	89 f8                	mov    %edi,%eax
 2e0:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2e3:	5b                   	pop    %ebx
 2e4:	5e                   	pop    %esi
 2e5:	5f                   	pop    %edi
 2e6:	5d                   	pop    %ebp
 2e7:	c3                   	ret    

000002e8 <stat>:

int
stat(const char *n, struct stat *st)
{
 2e8:	55                   	push   %ebp
 2e9:	89 e5                	mov    %esp,%ebp
 2eb:	56                   	push   %esi
 2ec:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2ed:	83 ec 08             	sub    $0x8,%esp
 2f0:	6a 00                	push   $0x0
 2f2:	ff 75 08             	push   0x8(%ebp)
 2f5:	e8 d6 00 00 00       	call   3d0 <open>
  if(fd < 0)
 2fa:	83 c4 10             	add    $0x10,%esp
 2fd:	85 c0                	test   %eax,%eax
 2ff:	78 24                	js     325 <stat+0x3d>
 301:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 303:	83 ec 08             	sub    $0x8,%esp
 306:	ff 75 0c             	push   0xc(%ebp)
 309:	50                   	push   %eax
 30a:	e8 d9 00 00 00       	call   3e8 <fstat>
 30f:	89 c6                	mov    %eax,%esi
  close(fd);
 311:	89 1c 24             	mov    %ebx,(%esp)
 314:	e8 9f 00 00 00       	call   3b8 <close>
  return r;
 319:	83 c4 10             	add    $0x10,%esp
}
 31c:	89 f0                	mov    %esi,%eax
 31e:	8d 65 f8             	lea    -0x8(%ebp),%esp
 321:	5b                   	pop    %ebx
 322:	5e                   	pop    %esi
 323:	5d                   	pop    %ebp
 324:	c3                   	ret    
    return -1;
 325:	be ff ff ff ff       	mov    $0xffffffff,%esi
 32a:	eb f0                	jmp    31c <stat+0x34>

0000032c <atoi>:

int
atoi(const char *s)
{
 32c:	55                   	push   %ebp
 32d:	89 e5                	mov    %esp,%ebp
 32f:	53                   	push   %ebx
 330:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 333:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 338:	eb 10                	jmp    34a <atoi+0x1e>
    n = n*10 + *s++ - '0';
 33a:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 33d:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 340:	83 c1 01             	add    $0x1,%ecx
 343:	0f be c0             	movsbl %al,%eax
 346:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 34a:	0f b6 01             	movzbl (%ecx),%eax
 34d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 350:	80 fb 09             	cmp    $0x9,%bl
 353:	76 e5                	jbe    33a <atoi+0xe>
  return n;
}
 355:	89 d0                	mov    %edx,%eax
 357:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 35a:	c9                   	leave  
 35b:	c3                   	ret    

0000035c <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 35c:	55                   	push   %ebp
 35d:	89 e5                	mov    %esp,%ebp
 35f:	56                   	push   %esi
 360:	53                   	push   %ebx
 361:	8b 75 08             	mov    0x8(%ebp),%esi
 364:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 367:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 36a:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 36c:	eb 0d                	jmp    37b <memmove+0x1f>
    *dst++ = *src++;
 36e:	0f b6 01             	movzbl (%ecx),%eax
 371:	88 02                	mov    %al,(%edx)
 373:	8d 49 01             	lea    0x1(%ecx),%ecx
 376:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 379:	89 d8                	mov    %ebx,%eax
 37b:	8d 58 ff             	lea    -0x1(%eax),%ebx
 37e:	85 c0                	test   %eax,%eax
 380:	7f ec                	jg     36e <memmove+0x12>
  return vdst;
}
 382:	89 f0                	mov    %esi,%eax
 384:	5b                   	pop    %ebx
 385:	5e                   	pop    %esi
 386:	5d                   	pop    %ebp
 387:	c3                   	ret    

00000388 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 388:	b8 01 00 00 00       	mov    $0x1,%eax
 38d:	cd 40                	int    $0x40
 38f:	c3                   	ret    

00000390 <exit>:
SYSCALL(exit)
 390:	b8 02 00 00 00       	mov    $0x2,%eax
 395:	cd 40                	int    $0x40
 397:	c3                   	ret    

00000398 <wait>:
SYSCALL(wait)
 398:	b8 03 00 00 00       	mov    $0x3,%eax
 39d:	cd 40                	int    $0x40
 39f:	c3                   	ret    

000003a0 <pipe>:
SYSCALL(pipe)
 3a0:	b8 04 00 00 00       	mov    $0x4,%eax
 3a5:	cd 40                	int    $0x40
 3a7:	c3                   	ret    

000003a8 <read>:
SYSCALL(read)
 3a8:	b8 05 00 00 00       	mov    $0x5,%eax
 3ad:	cd 40                	int    $0x40
 3af:	c3                   	ret    

000003b0 <write>:
SYSCALL(write)
 3b0:	b8 10 00 00 00       	mov    $0x10,%eax
 3b5:	cd 40                	int    $0x40
 3b7:	c3                   	ret    

000003b8 <close>:
SYSCALL(close)
 3b8:	b8 15 00 00 00       	mov    $0x15,%eax
 3bd:	cd 40                	int    $0x40
 3bf:	c3                   	ret    

000003c0 <kill>:
SYSCALL(kill)
 3c0:	b8 06 00 00 00       	mov    $0x6,%eax
 3c5:	cd 40                	int    $0x40
 3c7:	c3                   	ret    

000003c8 <exec>:
SYSCALL(exec)
 3c8:	b8 07 00 00 00       	mov    $0x7,%eax
 3cd:	cd 40                	int    $0x40
 3cf:	c3                   	ret    

000003d0 <open>:
SYSCALL(open)
 3d0:	b8 0f 00 00 00       	mov    $0xf,%eax
 3d5:	cd 40                	int    $0x40
 3d7:	c3                   	ret    

000003d8 <mknod>:
SYSCALL(mknod)
 3d8:	b8 11 00 00 00       	mov    $0x11,%eax
 3dd:	cd 40                	int    $0x40
 3df:	c3                   	ret    

000003e0 <unlink>:
SYSCALL(unlink)
 3e0:	b8 12 00 00 00       	mov    $0x12,%eax
 3e5:	cd 40                	int    $0x40
 3e7:	c3                   	ret    

000003e8 <fstat>:
SYSCALL(fstat)
 3e8:	b8 08 00 00 00       	mov    $0x8,%eax
 3ed:	cd 40                	int    $0x40
 3ef:	c3                   	ret    

000003f0 <link>:
SYSCALL(link)
 3f0:	b8 13 00 00 00       	mov    $0x13,%eax
 3f5:	cd 40                	int    $0x40
 3f7:	c3                   	ret    

000003f8 <mkdir>:
SYSCALL(mkdir)
 3f8:	b8 14 00 00 00       	mov    $0x14,%eax
 3fd:	cd 40                	int    $0x40
 3ff:	c3                   	ret    

00000400 <chdir>:
SYSCALL(chdir)
 400:	b8 09 00 00 00       	mov    $0x9,%eax
 405:	cd 40                	int    $0x40
 407:	c3                   	ret    

00000408 <dup>:
SYSCALL(dup)
 408:	b8 0a 00 00 00       	mov    $0xa,%eax
 40d:	cd 40                	int    $0x40
 40f:	c3                   	ret    

00000410 <getpid>:
SYSCALL(getpid)
 410:	b8 0b 00 00 00       	mov    $0xb,%eax
 415:	cd 40                	int    $0x40
 417:	c3                   	ret    

00000418 <sbrk>:
SYSCALL(sbrk)
 418:	b8 0c 00 00 00       	mov    $0xc,%eax
 41d:	cd 40                	int    $0x40
 41f:	c3                   	ret    

00000420 <sleep>:
SYSCALL(sleep)
 420:	b8 0d 00 00 00       	mov    $0xd,%eax
 425:	cd 40                	int    $0x40
 427:	c3                   	ret    

00000428 <uptime>:
SYSCALL(uptime)
 428:	b8 0e 00 00 00       	mov    $0xe,%eax
 42d:	cd 40                	int    $0x40
 42f:	c3                   	ret    

00000430 <clone>:
SYSCALL(clone)
 430:	b8 16 00 00 00       	mov    $0x16,%eax
 435:	cd 40                	int    $0x40
 437:	c3                   	ret    

00000438 <join>:
 438:	b8 17 00 00 00       	mov    $0x17,%eax
 43d:	cd 40                	int    $0x40
 43f:	c3                   	ret    

00000440 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 440:	55                   	push   %ebp
 441:	89 e5                	mov    %esp,%ebp
 443:	57                   	push   %edi
 444:	56                   	push   %esi
 445:	53                   	push   %ebx
 446:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 449:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 44c:	a1 20 0a 00 00       	mov    0xa20,%eax
 451:	eb 02                	jmp    455 <free+0x15>
 453:	89 d0                	mov    %edx,%eax
 455:	39 c8                	cmp    %ecx,%eax
 457:	73 04                	jae    45d <free+0x1d>
 459:	39 08                	cmp    %ecx,(%eax)
 45b:	77 12                	ja     46f <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 45d:	8b 10                	mov    (%eax),%edx
 45f:	39 c2                	cmp    %eax,%edx
 461:	77 f0                	ja     453 <free+0x13>
 463:	39 c8                	cmp    %ecx,%eax
 465:	72 08                	jb     46f <free+0x2f>
 467:	39 ca                	cmp    %ecx,%edx
 469:	77 04                	ja     46f <free+0x2f>
 46b:	89 d0                	mov    %edx,%eax
 46d:	eb e6                	jmp    455 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 46f:	8b 73 fc             	mov    -0x4(%ebx),%esi
 472:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 475:	8b 10                	mov    (%eax),%edx
 477:	39 d7                	cmp    %edx,%edi
 479:	74 19                	je     494 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 47b:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 47e:	8b 50 04             	mov    0x4(%eax),%edx
 481:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 484:	39 ce                	cmp    %ecx,%esi
 486:	74 1b                	je     4a3 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 488:	89 08                	mov    %ecx,(%eax)
  freep = p;
 48a:	a3 20 0a 00 00       	mov    %eax,0xa20
}
 48f:	5b                   	pop    %ebx
 490:	5e                   	pop    %esi
 491:	5f                   	pop    %edi
 492:	5d                   	pop    %ebp
 493:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 494:	03 72 04             	add    0x4(%edx),%esi
 497:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 49a:	8b 10                	mov    (%eax),%edx
 49c:	8b 12                	mov    (%edx),%edx
 49e:	89 53 f8             	mov    %edx,-0x8(%ebx)
 4a1:	eb db                	jmp    47e <free+0x3e>
    p->s.size += bp->s.size;
 4a3:	03 53 fc             	add    -0x4(%ebx),%edx
 4a6:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 4a9:	8b 53 f8             	mov    -0x8(%ebx),%edx
 4ac:	89 10                	mov    %edx,(%eax)
 4ae:	eb da                	jmp    48a <free+0x4a>

000004b0 <morecore>:

static Header*
morecore(uint nu)
{
 4b0:	55                   	push   %ebp
 4b1:	89 e5                	mov    %esp,%ebp
 4b3:	53                   	push   %ebx
 4b4:	83 ec 04             	sub    $0x4,%esp
 4b7:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 4b9:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 4be:	77 05                	ja     4c5 <morecore+0x15>
    nu = 4096;
 4c0:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 4c5:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 4cc:	83 ec 0c             	sub    $0xc,%esp
 4cf:	50                   	push   %eax
 4d0:	e8 43 ff ff ff       	call   418 <sbrk>
  if(p == (char*)-1)
 4d5:	83 c4 10             	add    $0x10,%esp
 4d8:	83 f8 ff             	cmp    $0xffffffff,%eax
 4db:	74 1c                	je     4f9 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 4dd:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 4e0:	83 c0 08             	add    $0x8,%eax
 4e3:	83 ec 0c             	sub    $0xc,%esp
 4e6:	50                   	push   %eax
 4e7:	e8 54 ff ff ff       	call   440 <free>
  return freep;
 4ec:	a1 20 0a 00 00       	mov    0xa20,%eax
 4f1:	83 c4 10             	add    $0x10,%esp
}
 4f4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4f7:	c9                   	leave  
 4f8:	c3                   	ret    
    return 0;
 4f9:	b8 00 00 00 00       	mov    $0x0,%eax
 4fe:	eb f4                	jmp    4f4 <morecore+0x44>

00000500 <malloc>:

void*
malloc(uint nbytes)
{
 500:	55                   	push   %ebp
 501:	89 e5                	mov    %esp,%ebp
 503:	53                   	push   %ebx
 504:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 507:	8b 45 08             	mov    0x8(%ebp),%eax
 50a:	8d 58 07             	lea    0x7(%eax),%ebx
 50d:	c1 eb 03             	shr    $0x3,%ebx
 510:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 513:	8b 0d 20 0a 00 00    	mov    0xa20,%ecx
 519:	85 c9                	test   %ecx,%ecx
 51b:	74 04                	je     521 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 51d:	8b 01                	mov    (%ecx),%eax
 51f:	eb 4a                	jmp    56b <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 521:	c7 05 20 0a 00 00 24 	movl   $0xa24,0xa20
 528:	0a 00 00 
 52b:	c7 05 24 0a 00 00 24 	movl   $0xa24,0xa24
 532:	0a 00 00 
    base.s.size = 0;
 535:	c7 05 28 0a 00 00 00 	movl   $0x0,0xa28
 53c:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 53f:	b9 24 0a 00 00       	mov    $0xa24,%ecx
 544:	eb d7                	jmp    51d <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 546:	74 19                	je     561 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 548:	29 da                	sub    %ebx,%edx
 54a:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 54d:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 550:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 553:	89 0d 20 0a 00 00    	mov    %ecx,0xa20
      return (void*)(p + 1);
 559:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 55c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 55f:	c9                   	leave  
 560:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 561:	8b 10                	mov    (%eax),%edx
 563:	89 11                	mov    %edx,(%ecx)
 565:	eb ec                	jmp    553 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 567:	89 c1                	mov    %eax,%ecx
 569:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 56b:	8b 50 04             	mov    0x4(%eax),%edx
 56e:	39 da                	cmp    %ebx,%edx
 570:	73 d4                	jae    546 <malloc+0x46>
    if(p == freep)
 572:	39 05 20 0a 00 00    	cmp    %eax,0xa20
 578:	75 ed                	jne    567 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 57a:	89 d8                	mov    %ebx,%eax
 57c:	e8 2f ff ff ff       	call   4b0 <morecore>
 581:	85 c0                	test   %eax,%eax
 583:	75 e2                	jne    567 <malloc+0x67>
 585:	eb d5                	jmp    55c <malloc+0x5c>
