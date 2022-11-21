
_init:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

char *argv[] = { "sh", 0 };

int
main(void)
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	53                   	push   %ebx
   e:	51                   	push   %ecx
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
   f:	83 ec 08             	sub    $0x8,%esp
  12:	6a 02                	push   $0x2
  14:	68 80 07 00 00       	push   $0x780
  19:	e8 9e 03 00 00       	call   3bc <open>
  1e:	83 c4 10             	add    $0x10,%esp
  21:	85 c0                	test   %eax,%eax
  23:	78 1b                	js     40 <main+0x40>
    mknod("console", 1, 1);
    open("console", O_RDWR);
  }
  dup(0);  // stdout
  25:	83 ec 0c             	sub    $0xc,%esp
  28:	6a 00                	push   $0x0
  2a:	e8 c5 03 00 00       	call   3f4 <dup>
  dup(0);  // stderr
  2f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  36:	e8 b9 03 00 00       	call   3f4 <dup>
  3b:	83 c4 10             	add    $0x10,%esp
  3e:	eb 58                	jmp    98 <main+0x98>
    mknod("console", 1, 1);
  40:	83 ec 04             	sub    $0x4,%esp
  43:	6a 01                	push   $0x1
  45:	6a 01                	push   $0x1
  47:	68 80 07 00 00       	push   $0x780
  4c:	e8 73 03 00 00       	call   3c4 <mknod>
    open("console", O_RDWR);
  51:	83 c4 08             	add    $0x8,%esp
  54:	6a 02                	push   $0x2
  56:	68 80 07 00 00       	push   $0x780
  5b:	e8 5c 03 00 00       	call   3bc <open>
  60:	83 c4 10             	add    $0x10,%esp
  63:	eb c0                	jmp    25 <main+0x25>

  for(;;){
    printf(1, "init: starting sh\n");
    pid = fork();
    if(pid < 0){
      printf(1, "init: fork failed\n");
  65:	83 ec 08             	sub    $0x8,%esp
  68:	68 9b 07 00 00       	push   $0x79b
  6d:	6a 01                	push   $0x1
  6f:	e8 5d 04 00 00       	call   4d1 <printf>
      exit();
  74:	e8 03 03 00 00       	call   37c <exit>
      exec("sh", argv);
      printf(1, "init: exec sh failed\n");
      exit();
    }
    while((wpid=wait()) >= 0 && wpid != pid)
      printf(1, "zombie!\n");
  79:	83 ec 08             	sub    $0x8,%esp
  7c:	68 c7 07 00 00       	push   $0x7c7
  81:	6a 01                	push   $0x1
  83:	e8 49 04 00 00       	call   4d1 <printf>
  88:	83 c4 10             	add    $0x10,%esp
    while((wpid=wait()) >= 0 && wpid != pid)
  8b:	e8 f4 02 00 00       	call   384 <wait>
  90:	85 c0                	test   %eax,%eax
  92:	78 04                	js     98 <main+0x98>
  94:	39 c3                	cmp    %eax,%ebx
  96:	75 e1                	jne    79 <main+0x79>
    printf(1, "init: starting sh\n");
  98:	83 ec 08             	sub    $0x8,%esp
  9b:	68 88 07 00 00       	push   $0x788
  a0:	6a 01                	push   $0x1
  a2:	e8 2a 04 00 00       	call   4d1 <printf>
    pid = fork();
  a7:	e8 c8 02 00 00       	call   374 <fork>
  ac:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
  ae:	83 c4 10             	add    $0x10,%esp
  b1:	85 c0                	test   %eax,%eax
  b3:	78 b0                	js     65 <main+0x65>
    if(pid == 0){
  b5:	75 d4                	jne    8b <main+0x8b>
      exec("sh", argv);
  b7:	83 ec 08             	sub    $0x8,%esp
  ba:	68 a8 0b 00 00       	push   $0xba8
  bf:	68 ae 07 00 00       	push   $0x7ae
  c4:	e8 eb 02 00 00       	call   3b4 <exec>
      printf(1, "init: exec sh failed\n");
  c9:	83 c4 08             	add    $0x8,%esp
  cc:	68 b1 07 00 00       	push   $0x7b1
  d1:	6a 01                	push   $0x1
  d3:	e8 f9 03 00 00       	call   4d1 <printf>
      exit();
  d8:	e8 9f 02 00 00       	call   37c <exit>

000000dd <test_and_set>:
  int flag;
};

struct thread_ref *threads[64];

int test_and_set(int *old_ptr, int new_ptr) {
  dd:	55                   	push   %ebp
  de:	89 e5                	mov    %esp,%ebp
  e0:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *old_ptr;
  e3:	8b 10                	mov    (%eax),%edx
  *old_ptr = new_ptr;
  e5:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  e8:	89 08                	mov    %ecx,(%eax)
  return old;
}
  ea:	89 d0                	mov    %edx,%eax
  ec:	5d                   	pop    %ebp
  ed:	c3                   	ret    

000000ee <thread_create>:

// a wrapper func for clone
int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
  ee:	55                   	push   %ebp
  ef:	89 e5                	mov    %esp,%ebp
  f1:	53                   	push   %ebx
  f2:	83 ec 10             	sub    $0x10,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE*2);
  f5:	68 00 20 00 00       	push   $0x2000
  fa:	e8 f8 05 00 00       	call   6f7 <malloc>
  if(n_stack == 0){
  ff:	83 c4 10             	add    $0x10,%esp
 102:	85 c0                	test   %eax,%eax
 104:	74 41                	je     147 <thread_create+0x59>
 106:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  int new_pid = clone(start_routine, arg1, arg2, n_stack);
 108:	50                   	push   %eax
 109:	ff 75 10             	push   0x10(%ebp)
 10c:	ff 75 0c             	push   0xc(%ebp)
 10f:	ff 75 08             	push   0x8(%ebp)
 112:	e8 05 03 00 00       	call   41c <clone>

  for(int i=0; i<64; i++){
 117:	83 c4 10             	add    $0x10,%esp
 11a:	ba 00 00 00 00       	mov    $0x0,%edx
 11f:	eb 03                	jmp    124 <thread_create+0x36>
 121:	83 c2 01             	add    $0x1,%edx
 124:	83 fa 3f             	cmp    $0x3f,%edx
 127:	7f 19                	jg     142 <thread_create+0x54>
    if(threads[i]->flag==0){
 129:	8b 0c 95 c0 0b 00 00 	mov    0xbc0(,%edx,4),%ecx
 130:	83 79 08 00          	cmpl   $0x0,0x8(%ecx)
 134:	75 eb                	jne    121 <thread_create+0x33>
      threads[i]->maddr = n_stack;
 136:	89 19                	mov    %ebx,(%ecx)
      threads[i]->pg1addr = n_stack;
 138:	8b 14 95 c0 0b 00 00 	mov    0xbc0(,%edx,4),%edx
 13f:	89 5a 04             	mov    %ebx,0x4(%edx)
      break;
    }
  }

  return new_pid;
}
 142:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 145:	c9                   	leave  
 146:	c3                   	ret    
    return -1;
 147:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 14c:	eb f4                	jmp    142 <thread_create+0x54>

0000014e <thread_join>:

//TODO: fix
int thread_join() {
 14e:	55                   	push   %ebp
 14f:	89 e5                	mov    %esp,%ebp
 151:	56                   	push   %esi
 152:	53                   	push   %ebx
 153:	83 ec 1c             	sub    $0x1c,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 156:	8d 45 f4             	lea    -0xc(%ebp),%eax
 159:	50                   	push   %eax
 15a:	e8 c5 02 00 00       	call   424 <join>
 15f:	89 c6                	mov    %eax,%esi
  for(int i=0; i<64; i++){
 161:	83 c4 10             	add    $0x10,%esp
 164:	bb 00 00 00 00       	mov    $0x0,%ebx
 169:	eb 03                	jmp    16e <thread_join+0x20>
 16b:	83 c3 01             	add    $0x1,%ebx
 16e:	83 fb 3f             	cmp    $0x3f,%ebx
 171:	7f 23                	jg     196 <thread_join+0x48>
    if((threads[i]->flag==1) && (stk_addr == threads[i]->pg1addr)){
 173:	8b 04 9d c0 0b 00 00 	mov    0xbc0(,%ebx,4),%eax
 17a:	83 78 08 01          	cmpl   $0x1,0x8(%eax)
 17e:	75 eb                	jne    16b <thread_join+0x1d>
 180:	8b 55 f4             	mov    -0xc(%ebp),%edx
 183:	39 50 04             	cmp    %edx,0x4(%eax)
 186:	75 e3                	jne    16b <thread_join+0x1d>
      free(stk_addr);
 188:	83 ec 0c             	sub    $0xc,%esp
 18b:	52                   	push   %edx
 18c:	e8 a6 04 00 00       	call   637 <free>
 191:	83 c4 10             	add    $0x10,%esp
 194:	eb d5                	jmp    16b <thread_join+0x1d>
    }
  }
  return pid;
}
 196:	89 f0                	mov    %esi,%eax
 198:	8d 65 f8             	lea    -0x8(%ebp),%esp
 19b:	5b                   	pop    %ebx
 19c:	5e                   	pop    %esi
 19d:	5d                   	pop    %ebp
 19e:	c3                   	ret    

0000019f <lock_acquire>:

void lock_acquire(lock_t *lock){
 19f:	55                   	push   %ebp
 1a0:	89 e5                	mov    %esp,%ebp
 1a2:	53                   	push   %ebx
 1a3:	83 ec 04             	sub    $0x4,%esp
 1a6:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 1a9:	83 ec 08             	sub    $0x8,%esp
 1ac:	6a 01                	push   $0x1
 1ae:	53                   	push   %ebx
 1af:	e8 29 ff ff ff       	call   dd <test_and_set>
 1b4:	83 c4 10             	add    $0x10,%esp
 1b7:	83 f8 01             	cmp    $0x1,%eax
 1ba:	74 ed                	je     1a9 <lock_acquire+0xa>
    ;
}
 1bc:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1bf:	c9                   	leave  
 1c0:	c3                   	ret    

000001c1 <lock_release>:

void lock_release(lock_t *lock) {
 1c1:	55                   	push   %ebp
 1c2:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 1c4:	8b 45 08             	mov    0x8(%ebp),%eax
 1c7:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 1cd:	5d                   	pop    %ebp
 1ce:	c3                   	ret    

000001cf <lock_init>:

void lock_init(lock_t *lock) {
 1cf:	55                   	push   %ebp
 1d0:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 1d2:	8b 45 08             	mov    0x8(%ebp),%eax
 1d5:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 1db:	5d                   	pop    %ebp
 1dc:	c3                   	ret    

000001dd <strcpy>:

char*
strcpy(char *s, const char *t)
{
 1dd:	55                   	push   %ebp
 1de:	89 e5                	mov    %esp,%ebp
 1e0:	56                   	push   %esi
 1e1:	53                   	push   %ebx
 1e2:	8b 75 08             	mov    0x8(%ebp),%esi
 1e5:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 1e8:	89 f0                	mov    %esi,%eax
 1ea:	89 d1                	mov    %edx,%ecx
 1ec:	83 c2 01             	add    $0x1,%edx
 1ef:	89 c3                	mov    %eax,%ebx
 1f1:	83 c0 01             	add    $0x1,%eax
 1f4:	0f b6 09             	movzbl (%ecx),%ecx
 1f7:	88 0b                	mov    %cl,(%ebx)
 1f9:	84 c9                	test   %cl,%cl
 1fb:	75 ed                	jne    1ea <strcpy+0xd>
    ;
  return os;
}
 1fd:	89 f0                	mov    %esi,%eax
 1ff:	5b                   	pop    %ebx
 200:	5e                   	pop    %esi
 201:	5d                   	pop    %ebp
 202:	c3                   	ret    

00000203 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 203:	55                   	push   %ebp
 204:	89 e5                	mov    %esp,%ebp
 206:	8b 4d 08             	mov    0x8(%ebp),%ecx
 209:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 20c:	eb 06                	jmp    214 <strcmp+0x11>
    p++, q++;
 20e:	83 c1 01             	add    $0x1,%ecx
 211:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 214:	0f b6 01             	movzbl (%ecx),%eax
 217:	84 c0                	test   %al,%al
 219:	74 04                	je     21f <strcmp+0x1c>
 21b:	3a 02                	cmp    (%edx),%al
 21d:	74 ef                	je     20e <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 21f:	0f b6 c0             	movzbl %al,%eax
 222:	0f b6 12             	movzbl (%edx),%edx
 225:	29 d0                	sub    %edx,%eax
}
 227:	5d                   	pop    %ebp
 228:	c3                   	ret    

00000229 <strlen>:

uint
strlen(const char *s)
{
 229:	55                   	push   %ebp
 22a:	89 e5                	mov    %esp,%ebp
 22c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 22f:	b8 00 00 00 00       	mov    $0x0,%eax
 234:	eb 03                	jmp    239 <strlen+0x10>
 236:	83 c0 01             	add    $0x1,%eax
 239:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 23d:	75 f7                	jne    236 <strlen+0xd>
    ;
  return n;
}
 23f:	5d                   	pop    %ebp
 240:	c3                   	ret    

00000241 <memset>:

void*
memset(void *dst, int c, uint n)
{
 241:	55                   	push   %ebp
 242:	89 e5                	mov    %esp,%ebp
 244:	57                   	push   %edi
 245:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 248:	89 d7                	mov    %edx,%edi
 24a:	8b 4d 10             	mov    0x10(%ebp),%ecx
 24d:	8b 45 0c             	mov    0xc(%ebp),%eax
 250:	fc                   	cld    
 251:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 253:	89 d0                	mov    %edx,%eax
 255:	8b 7d fc             	mov    -0x4(%ebp),%edi
 258:	c9                   	leave  
 259:	c3                   	ret    

0000025a <strchr>:

char*
strchr(const char *s, char c)
{
 25a:	55                   	push   %ebp
 25b:	89 e5                	mov    %esp,%ebp
 25d:	8b 45 08             	mov    0x8(%ebp),%eax
 260:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 264:	eb 03                	jmp    269 <strchr+0xf>
 266:	83 c0 01             	add    $0x1,%eax
 269:	0f b6 10             	movzbl (%eax),%edx
 26c:	84 d2                	test   %dl,%dl
 26e:	74 06                	je     276 <strchr+0x1c>
    if(*s == c)
 270:	38 ca                	cmp    %cl,%dl
 272:	75 f2                	jne    266 <strchr+0xc>
 274:	eb 05                	jmp    27b <strchr+0x21>
      return (char*)s;
  return 0;
 276:	b8 00 00 00 00       	mov    $0x0,%eax
}
 27b:	5d                   	pop    %ebp
 27c:	c3                   	ret    

0000027d <gets>:

char*
gets(char *buf, int max)
{
 27d:	55                   	push   %ebp
 27e:	89 e5                	mov    %esp,%ebp
 280:	57                   	push   %edi
 281:	56                   	push   %esi
 282:	53                   	push   %ebx
 283:	83 ec 1c             	sub    $0x1c,%esp
 286:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 289:	bb 00 00 00 00       	mov    $0x0,%ebx
 28e:	89 de                	mov    %ebx,%esi
 290:	83 c3 01             	add    $0x1,%ebx
 293:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 296:	7d 2e                	jge    2c6 <gets+0x49>
    cc = read(0, &c, 1);
 298:	83 ec 04             	sub    $0x4,%esp
 29b:	6a 01                	push   $0x1
 29d:	8d 45 e7             	lea    -0x19(%ebp),%eax
 2a0:	50                   	push   %eax
 2a1:	6a 00                	push   $0x0
 2a3:	e8 ec 00 00 00       	call   394 <read>
    if(cc < 1)
 2a8:	83 c4 10             	add    $0x10,%esp
 2ab:	85 c0                	test   %eax,%eax
 2ad:	7e 17                	jle    2c6 <gets+0x49>
      break;
    buf[i++] = c;
 2af:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2b3:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 2b6:	3c 0a                	cmp    $0xa,%al
 2b8:	0f 94 c2             	sete   %dl
 2bb:	3c 0d                	cmp    $0xd,%al
 2bd:	0f 94 c0             	sete   %al
 2c0:	08 c2                	or     %al,%dl
 2c2:	74 ca                	je     28e <gets+0x11>
    buf[i++] = c;
 2c4:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 2c6:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 2ca:	89 f8                	mov    %edi,%eax
 2cc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2cf:	5b                   	pop    %ebx
 2d0:	5e                   	pop    %esi
 2d1:	5f                   	pop    %edi
 2d2:	5d                   	pop    %ebp
 2d3:	c3                   	ret    

000002d4 <stat>:

int
stat(const char *n, struct stat *st)
{
 2d4:	55                   	push   %ebp
 2d5:	89 e5                	mov    %esp,%ebp
 2d7:	56                   	push   %esi
 2d8:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2d9:	83 ec 08             	sub    $0x8,%esp
 2dc:	6a 00                	push   $0x0
 2de:	ff 75 08             	push   0x8(%ebp)
 2e1:	e8 d6 00 00 00       	call   3bc <open>
  if(fd < 0)
 2e6:	83 c4 10             	add    $0x10,%esp
 2e9:	85 c0                	test   %eax,%eax
 2eb:	78 24                	js     311 <stat+0x3d>
 2ed:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 2ef:	83 ec 08             	sub    $0x8,%esp
 2f2:	ff 75 0c             	push   0xc(%ebp)
 2f5:	50                   	push   %eax
 2f6:	e8 d9 00 00 00       	call   3d4 <fstat>
 2fb:	89 c6                	mov    %eax,%esi
  close(fd);
 2fd:	89 1c 24             	mov    %ebx,(%esp)
 300:	e8 9f 00 00 00       	call   3a4 <close>
  return r;
 305:	83 c4 10             	add    $0x10,%esp
}
 308:	89 f0                	mov    %esi,%eax
 30a:	8d 65 f8             	lea    -0x8(%ebp),%esp
 30d:	5b                   	pop    %ebx
 30e:	5e                   	pop    %esi
 30f:	5d                   	pop    %ebp
 310:	c3                   	ret    
    return -1;
 311:	be ff ff ff ff       	mov    $0xffffffff,%esi
 316:	eb f0                	jmp    308 <stat+0x34>

00000318 <atoi>:

int
atoi(const char *s)
{
 318:	55                   	push   %ebp
 319:	89 e5                	mov    %esp,%ebp
 31b:	53                   	push   %ebx
 31c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 31f:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 324:	eb 10                	jmp    336 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 326:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 329:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 32c:	83 c1 01             	add    $0x1,%ecx
 32f:	0f be c0             	movsbl %al,%eax
 332:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 336:	0f b6 01             	movzbl (%ecx),%eax
 339:	8d 58 d0             	lea    -0x30(%eax),%ebx
 33c:	80 fb 09             	cmp    $0x9,%bl
 33f:	76 e5                	jbe    326 <atoi+0xe>
  return n;
}
 341:	89 d0                	mov    %edx,%eax
 343:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 346:	c9                   	leave  
 347:	c3                   	ret    

00000348 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 348:	55                   	push   %ebp
 349:	89 e5                	mov    %esp,%ebp
 34b:	56                   	push   %esi
 34c:	53                   	push   %ebx
 34d:	8b 75 08             	mov    0x8(%ebp),%esi
 350:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 353:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 356:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 358:	eb 0d                	jmp    367 <memmove+0x1f>
    *dst++ = *src++;
 35a:	0f b6 01             	movzbl (%ecx),%eax
 35d:	88 02                	mov    %al,(%edx)
 35f:	8d 49 01             	lea    0x1(%ecx),%ecx
 362:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 365:	89 d8                	mov    %ebx,%eax
 367:	8d 58 ff             	lea    -0x1(%eax),%ebx
 36a:	85 c0                	test   %eax,%eax
 36c:	7f ec                	jg     35a <memmove+0x12>
  return vdst;
}
 36e:	89 f0                	mov    %esi,%eax
 370:	5b                   	pop    %ebx
 371:	5e                   	pop    %esi
 372:	5d                   	pop    %ebp
 373:	c3                   	ret    

00000374 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 374:	b8 01 00 00 00       	mov    $0x1,%eax
 379:	cd 40                	int    $0x40
 37b:	c3                   	ret    

0000037c <exit>:
SYSCALL(exit)
 37c:	b8 02 00 00 00       	mov    $0x2,%eax
 381:	cd 40                	int    $0x40
 383:	c3                   	ret    

00000384 <wait>:
SYSCALL(wait)
 384:	b8 03 00 00 00       	mov    $0x3,%eax
 389:	cd 40                	int    $0x40
 38b:	c3                   	ret    

0000038c <pipe>:
SYSCALL(pipe)
 38c:	b8 04 00 00 00       	mov    $0x4,%eax
 391:	cd 40                	int    $0x40
 393:	c3                   	ret    

00000394 <read>:
SYSCALL(read)
 394:	b8 05 00 00 00       	mov    $0x5,%eax
 399:	cd 40                	int    $0x40
 39b:	c3                   	ret    

0000039c <write>:
SYSCALL(write)
 39c:	b8 10 00 00 00       	mov    $0x10,%eax
 3a1:	cd 40                	int    $0x40
 3a3:	c3                   	ret    

000003a4 <close>:
SYSCALL(close)
 3a4:	b8 15 00 00 00       	mov    $0x15,%eax
 3a9:	cd 40                	int    $0x40
 3ab:	c3                   	ret    

000003ac <kill>:
SYSCALL(kill)
 3ac:	b8 06 00 00 00       	mov    $0x6,%eax
 3b1:	cd 40                	int    $0x40
 3b3:	c3                   	ret    

000003b4 <exec>:
SYSCALL(exec)
 3b4:	b8 07 00 00 00       	mov    $0x7,%eax
 3b9:	cd 40                	int    $0x40
 3bb:	c3                   	ret    

000003bc <open>:
SYSCALL(open)
 3bc:	b8 0f 00 00 00       	mov    $0xf,%eax
 3c1:	cd 40                	int    $0x40
 3c3:	c3                   	ret    

000003c4 <mknod>:
SYSCALL(mknod)
 3c4:	b8 11 00 00 00       	mov    $0x11,%eax
 3c9:	cd 40                	int    $0x40
 3cb:	c3                   	ret    

000003cc <unlink>:
SYSCALL(unlink)
 3cc:	b8 12 00 00 00       	mov    $0x12,%eax
 3d1:	cd 40                	int    $0x40
 3d3:	c3                   	ret    

000003d4 <fstat>:
SYSCALL(fstat)
 3d4:	b8 08 00 00 00       	mov    $0x8,%eax
 3d9:	cd 40                	int    $0x40
 3db:	c3                   	ret    

000003dc <link>:
SYSCALL(link)
 3dc:	b8 13 00 00 00       	mov    $0x13,%eax
 3e1:	cd 40                	int    $0x40
 3e3:	c3                   	ret    

000003e4 <mkdir>:
SYSCALL(mkdir)
 3e4:	b8 14 00 00 00       	mov    $0x14,%eax
 3e9:	cd 40                	int    $0x40
 3eb:	c3                   	ret    

000003ec <chdir>:
SYSCALL(chdir)
 3ec:	b8 09 00 00 00       	mov    $0x9,%eax
 3f1:	cd 40                	int    $0x40
 3f3:	c3                   	ret    

000003f4 <dup>:
SYSCALL(dup)
 3f4:	b8 0a 00 00 00       	mov    $0xa,%eax
 3f9:	cd 40                	int    $0x40
 3fb:	c3                   	ret    

000003fc <getpid>:
SYSCALL(getpid)
 3fc:	b8 0b 00 00 00       	mov    $0xb,%eax
 401:	cd 40                	int    $0x40
 403:	c3                   	ret    

00000404 <sbrk>:
SYSCALL(sbrk)
 404:	b8 0c 00 00 00       	mov    $0xc,%eax
 409:	cd 40                	int    $0x40
 40b:	c3                   	ret    

0000040c <sleep>:
SYSCALL(sleep)
 40c:	b8 0d 00 00 00       	mov    $0xd,%eax
 411:	cd 40                	int    $0x40
 413:	c3                   	ret    

00000414 <uptime>:
SYSCALL(uptime)
 414:	b8 0e 00 00 00       	mov    $0xe,%eax
 419:	cd 40                	int    $0x40
 41b:	c3                   	ret    

0000041c <clone>:
SYSCALL(clone)
 41c:	b8 16 00 00 00       	mov    $0x16,%eax
 421:	cd 40                	int    $0x40
 423:	c3                   	ret    

00000424 <join>:
 424:	b8 17 00 00 00       	mov    $0x17,%eax
 429:	cd 40                	int    $0x40
 42b:	c3                   	ret    

0000042c <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 42c:	55                   	push   %ebp
 42d:	89 e5                	mov    %esp,%ebp
 42f:	83 ec 1c             	sub    $0x1c,%esp
 432:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 435:	6a 01                	push   $0x1
 437:	8d 55 f4             	lea    -0xc(%ebp),%edx
 43a:	52                   	push   %edx
 43b:	50                   	push   %eax
 43c:	e8 5b ff ff ff       	call   39c <write>
}
 441:	83 c4 10             	add    $0x10,%esp
 444:	c9                   	leave  
 445:	c3                   	ret    

00000446 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 446:	55                   	push   %ebp
 447:	89 e5                	mov    %esp,%ebp
 449:	57                   	push   %edi
 44a:	56                   	push   %esi
 44b:	53                   	push   %ebx
 44c:	83 ec 2c             	sub    $0x2c,%esp
 44f:	89 45 d0             	mov    %eax,-0x30(%ebp)
 452:	89 d0                	mov    %edx,%eax
 454:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 456:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 45a:	0f 95 c1             	setne  %cl
 45d:	c1 ea 1f             	shr    $0x1f,%edx
 460:	84 d1                	test   %dl,%cl
 462:	74 44                	je     4a8 <printint+0x62>
    neg = 1;
    x = -xx;
 464:	f7 d8                	neg    %eax
 466:	89 c1                	mov    %eax,%ecx
    neg = 1;
 468:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 46f:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 474:	89 c8                	mov    %ecx,%eax
 476:	ba 00 00 00 00       	mov    $0x0,%edx
 47b:	f7 f6                	div    %esi
 47d:	89 df                	mov    %ebx,%edi
 47f:	83 c3 01             	add    $0x1,%ebx
 482:	0f b6 92 30 08 00 00 	movzbl 0x830(%edx),%edx
 489:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 48d:	89 ca                	mov    %ecx,%edx
 48f:	89 c1                	mov    %eax,%ecx
 491:	39 d6                	cmp    %edx,%esi
 493:	76 df                	jbe    474 <printint+0x2e>
  if(neg)
 495:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 499:	74 31                	je     4cc <printint+0x86>
    buf[i++] = '-';
 49b:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 4a0:	8d 5f 02             	lea    0x2(%edi),%ebx
 4a3:	8b 75 d0             	mov    -0x30(%ebp),%esi
 4a6:	eb 17                	jmp    4bf <printint+0x79>
    x = xx;
 4a8:	89 c1                	mov    %eax,%ecx
  neg = 0;
 4aa:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 4b1:	eb bc                	jmp    46f <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 4b3:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 4b8:	89 f0                	mov    %esi,%eax
 4ba:	e8 6d ff ff ff       	call   42c <putc>
  while(--i >= 0)
 4bf:	83 eb 01             	sub    $0x1,%ebx
 4c2:	79 ef                	jns    4b3 <printint+0x6d>
}
 4c4:	83 c4 2c             	add    $0x2c,%esp
 4c7:	5b                   	pop    %ebx
 4c8:	5e                   	pop    %esi
 4c9:	5f                   	pop    %edi
 4ca:	5d                   	pop    %ebp
 4cb:	c3                   	ret    
 4cc:	8b 75 d0             	mov    -0x30(%ebp),%esi
 4cf:	eb ee                	jmp    4bf <printint+0x79>

000004d1 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 4d1:	55                   	push   %ebp
 4d2:	89 e5                	mov    %esp,%ebp
 4d4:	57                   	push   %edi
 4d5:	56                   	push   %esi
 4d6:	53                   	push   %ebx
 4d7:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 4da:	8d 45 10             	lea    0x10(%ebp),%eax
 4dd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 4e0:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 4e5:	bb 00 00 00 00       	mov    $0x0,%ebx
 4ea:	eb 14                	jmp    500 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 4ec:	89 fa                	mov    %edi,%edx
 4ee:	8b 45 08             	mov    0x8(%ebp),%eax
 4f1:	e8 36 ff ff ff       	call   42c <putc>
 4f6:	eb 05                	jmp    4fd <printf+0x2c>
      }
    } else if(state == '%'){
 4f8:	83 fe 25             	cmp    $0x25,%esi
 4fb:	74 25                	je     522 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 4fd:	83 c3 01             	add    $0x1,%ebx
 500:	8b 45 0c             	mov    0xc(%ebp),%eax
 503:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 507:	84 c0                	test   %al,%al
 509:	0f 84 20 01 00 00    	je     62f <printf+0x15e>
    c = fmt[i] & 0xff;
 50f:	0f be f8             	movsbl %al,%edi
 512:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 515:	85 f6                	test   %esi,%esi
 517:	75 df                	jne    4f8 <printf+0x27>
      if(c == '%'){
 519:	83 f8 25             	cmp    $0x25,%eax
 51c:	75 ce                	jne    4ec <printf+0x1b>
        state = '%';
 51e:	89 c6                	mov    %eax,%esi
 520:	eb db                	jmp    4fd <printf+0x2c>
      if(c == 'd'){
 522:	83 f8 25             	cmp    $0x25,%eax
 525:	0f 84 cf 00 00 00    	je     5fa <printf+0x129>
 52b:	0f 8c dd 00 00 00    	jl     60e <printf+0x13d>
 531:	83 f8 78             	cmp    $0x78,%eax
 534:	0f 8f d4 00 00 00    	jg     60e <printf+0x13d>
 53a:	83 f8 63             	cmp    $0x63,%eax
 53d:	0f 8c cb 00 00 00    	jl     60e <printf+0x13d>
 543:	83 e8 63             	sub    $0x63,%eax
 546:	83 f8 15             	cmp    $0x15,%eax
 549:	0f 87 bf 00 00 00    	ja     60e <printf+0x13d>
 54f:	ff 24 85 d8 07 00 00 	jmp    *0x7d8(,%eax,4)
        printint(fd, *ap, 10, 1);
 556:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 559:	8b 17                	mov    (%edi),%edx
 55b:	83 ec 0c             	sub    $0xc,%esp
 55e:	6a 01                	push   $0x1
 560:	b9 0a 00 00 00       	mov    $0xa,%ecx
 565:	8b 45 08             	mov    0x8(%ebp),%eax
 568:	e8 d9 fe ff ff       	call   446 <printint>
        ap++;
 56d:	83 c7 04             	add    $0x4,%edi
 570:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 573:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 576:	be 00 00 00 00       	mov    $0x0,%esi
 57b:	eb 80                	jmp    4fd <printf+0x2c>
        printint(fd, *ap, 16, 0);
 57d:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 580:	8b 17                	mov    (%edi),%edx
 582:	83 ec 0c             	sub    $0xc,%esp
 585:	6a 00                	push   $0x0
 587:	b9 10 00 00 00       	mov    $0x10,%ecx
 58c:	8b 45 08             	mov    0x8(%ebp),%eax
 58f:	e8 b2 fe ff ff       	call   446 <printint>
        ap++;
 594:	83 c7 04             	add    $0x4,%edi
 597:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 59a:	83 c4 10             	add    $0x10,%esp
      state = 0;
 59d:	be 00 00 00 00       	mov    $0x0,%esi
 5a2:	e9 56 ff ff ff       	jmp    4fd <printf+0x2c>
        s = (char*)*ap;
 5a7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5aa:	8b 30                	mov    (%eax),%esi
        ap++;
 5ac:	83 c0 04             	add    $0x4,%eax
 5af:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 5b2:	85 f6                	test   %esi,%esi
 5b4:	75 15                	jne    5cb <printf+0xfa>
          s = "(null)";
 5b6:	be d0 07 00 00       	mov    $0x7d0,%esi
 5bb:	eb 0e                	jmp    5cb <printf+0xfa>
          putc(fd, *s);
 5bd:	0f be d2             	movsbl %dl,%edx
 5c0:	8b 45 08             	mov    0x8(%ebp),%eax
 5c3:	e8 64 fe ff ff       	call   42c <putc>
          s++;
 5c8:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 5cb:	0f b6 16             	movzbl (%esi),%edx
 5ce:	84 d2                	test   %dl,%dl
 5d0:	75 eb                	jne    5bd <printf+0xec>
      state = 0;
 5d2:	be 00 00 00 00       	mov    $0x0,%esi
 5d7:	e9 21 ff ff ff       	jmp    4fd <printf+0x2c>
        putc(fd, *ap);
 5dc:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5df:	0f be 17             	movsbl (%edi),%edx
 5e2:	8b 45 08             	mov    0x8(%ebp),%eax
 5e5:	e8 42 fe ff ff       	call   42c <putc>
        ap++;
 5ea:	83 c7 04             	add    $0x4,%edi
 5ed:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 5f0:	be 00 00 00 00       	mov    $0x0,%esi
 5f5:	e9 03 ff ff ff       	jmp    4fd <printf+0x2c>
        putc(fd, c);
 5fa:	89 fa                	mov    %edi,%edx
 5fc:	8b 45 08             	mov    0x8(%ebp),%eax
 5ff:	e8 28 fe ff ff       	call   42c <putc>
      state = 0;
 604:	be 00 00 00 00       	mov    $0x0,%esi
 609:	e9 ef fe ff ff       	jmp    4fd <printf+0x2c>
        putc(fd, '%');
 60e:	ba 25 00 00 00       	mov    $0x25,%edx
 613:	8b 45 08             	mov    0x8(%ebp),%eax
 616:	e8 11 fe ff ff       	call   42c <putc>
        putc(fd, c);
 61b:	89 fa                	mov    %edi,%edx
 61d:	8b 45 08             	mov    0x8(%ebp),%eax
 620:	e8 07 fe ff ff       	call   42c <putc>
      state = 0;
 625:	be 00 00 00 00       	mov    $0x0,%esi
 62a:	e9 ce fe ff ff       	jmp    4fd <printf+0x2c>
    }
  }
}
 62f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 632:	5b                   	pop    %ebx
 633:	5e                   	pop    %esi
 634:	5f                   	pop    %edi
 635:	5d                   	pop    %ebp
 636:	c3                   	ret    

00000637 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 637:	55                   	push   %ebp
 638:	89 e5                	mov    %esp,%ebp
 63a:	57                   	push   %edi
 63b:	56                   	push   %esi
 63c:	53                   	push   %ebx
 63d:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 640:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 643:	a1 c0 0c 00 00       	mov    0xcc0,%eax
 648:	eb 02                	jmp    64c <free+0x15>
 64a:	89 d0                	mov    %edx,%eax
 64c:	39 c8                	cmp    %ecx,%eax
 64e:	73 04                	jae    654 <free+0x1d>
 650:	39 08                	cmp    %ecx,(%eax)
 652:	77 12                	ja     666 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 654:	8b 10                	mov    (%eax),%edx
 656:	39 c2                	cmp    %eax,%edx
 658:	77 f0                	ja     64a <free+0x13>
 65a:	39 c8                	cmp    %ecx,%eax
 65c:	72 08                	jb     666 <free+0x2f>
 65e:	39 ca                	cmp    %ecx,%edx
 660:	77 04                	ja     666 <free+0x2f>
 662:	89 d0                	mov    %edx,%eax
 664:	eb e6                	jmp    64c <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 666:	8b 73 fc             	mov    -0x4(%ebx),%esi
 669:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 66c:	8b 10                	mov    (%eax),%edx
 66e:	39 d7                	cmp    %edx,%edi
 670:	74 19                	je     68b <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 672:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 675:	8b 50 04             	mov    0x4(%eax),%edx
 678:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 67b:	39 ce                	cmp    %ecx,%esi
 67d:	74 1b                	je     69a <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 67f:	89 08                	mov    %ecx,(%eax)
  freep = p;
 681:	a3 c0 0c 00 00       	mov    %eax,0xcc0
}
 686:	5b                   	pop    %ebx
 687:	5e                   	pop    %esi
 688:	5f                   	pop    %edi
 689:	5d                   	pop    %ebp
 68a:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 68b:	03 72 04             	add    0x4(%edx),%esi
 68e:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 691:	8b 10                	mov    (%eax),%edx
 693:	8b 12                	mov    (%edx),%edx
 695:	89 53 f8             	mov    %edx,-0x8(%ebx)
 698:	eb db                	jmp    675 <free+0x3e>
    p->s.size += bp->s.size;
 69a:	03 53 fc             	add    -0x4(%ebx),%edx
 69d:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6a0:	8b 53 f8             	mov    -0x8(%ebx),%edx
 6a3:	89 10                	mov    %edx,(%eax)
 6a5:	eb da                	jmp    681 <free+0x4a>

000006a7 <morecore>:

static Header*
morecore(uint nu)
{
 6a7:	55                   	push   %ebp
 6a8:	89 e5                	mov    %esp,%ebp
 6aa:	53                   	push   %ebx
 6ab:	83 ec 04             	sub    $0x4,%esp
 6ae:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 6b0:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 6b5:	77 05                	ja     6bc <morecore+0x15>
    nu = 4096;
 6b7:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 6bc:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 6c3:	83 ec 0c             	sub    $0xc,%esp
 6c6:	50                   	push   %eax
 6c7:	e8 38 fd ff ff       	call   404 <sbrk>
  if(p == (char*)-1)
 6cc:	83 c4 10             	add    $0x10,%esp
 6cf:	83 f8 ff             	cmp    $0xffffffff,%eax
 6d2:	74 1c                	je     6f0 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 6d4:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 6d7:	83 c0 08             	add    $0x8,%eax
 6da:	83 ec 0c             	sub    $0xc,%esp
 6dd:	50                   	push   %eax
 6de:	e8 54 ff ff ff       	call   637 <free>
  return freep;
 6e3:	a1 c0 0c 00 00       	mov    0xcc0,%eax
 6e8:	83 c4 10             	add    $0x10,%esp
}
 6eb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 6ee:	c9                   	leave  
 6ef:	c3                   	ret    
    return 0;
 6f0:	b8 00 00 00 00       	mov    $0x0,%eax
 6f5:	eb f4                	jmp    6eb <morecore+0x44>

000006f7 <malloc>:

void*
malloc(uint nbytes)
{
 6f7:	55                   	push   %ebp
 6f8:	89 e5                	mov    %esp,%ebp
 6fa:	53                   	push   %ebx
 6fb:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6fe:	8b 45 08             	mov    0x8(%ebp),%eax
 701:	8d 58 07             	lea    0x7(%eax),%ebx
 704:	c1 eb 03             	shr    $0x3,%ebx
 707:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 70a:	8b 0d c0 0c 00 00    	mov    0xcc0,%ecx
 710:	85 c9                	test   %ecx,%ecx
 712:	74 04                	je     718 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 714:	8b 01                	mov    (%ecx),%eax
 716:	eb 4a                	jmp    762 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 718:	c7 05 c0 0c 00 00 c4 	movl   $0xcc4,0xcc0
 71f:	0c 00 00 
 722:	c7 05 c4 0c 00 00 c4 	movl   $0xcc4,0xcc4
 729:	0c 00 00 
    base.s.size = 0;
 72c:	c7 05 c8 0c 00 00 00 	movl   $0x0,0xcc8
 733:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 736:	b9 c4 0c 00 00       	mov    $0xcc4,%ecx
 73b:	eb d7                	jmp    714 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 73d:	74 19                	je     758 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 73f:	29 da                	sub    %ebx,%edx
 741:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 744:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 747:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 74a:	89 0d c0 0c 00 00    	mov    %ecx,0xcc0
      return (void*)(p + 1);
 750:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 753:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 756:	c9                   	leave  
 757:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 758:	8b 10                	mov    (%eax),%edx
 75a:	89 11                	mov    %edx,(%ecx)
 75c:	eb ec                	jmp    74a <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 75e:	89 c1                	mov    %eax,%ecx
 760:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 762:	8b 50 04             	mov    0x4(%eax),%edx
 765:	39 da                	cmp    %ebx,%edx
 767:	73 d4                	jae    73d <malloc+0x46>
    if(p == freep)
 769:	39 05 c0 0c 00 00    	cmp    %eax,0xcc0
 76f:	75 ed                	jne    75e <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 771:	89 d8                	mov    %ebx,%eax
 773:	e8 2f ff ff ff       	call   6a7 <morecore>
 778:	85 c0                	test   %eax,%eax
 77a:	75 e2                	jne    75e <malloc+0x67>
 77c:	eb d5                	jmp    753 <malloc+0x5c>
