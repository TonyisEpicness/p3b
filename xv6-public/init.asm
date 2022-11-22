
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
  14:	68 88 07 00 00       	push   $0x788
  19:	e8 a6 03 00 00       	call   3c4 <open>
  1e:	83 c4 10             	add    $0x10,%esp
  21:	85 c0                	test   %eax,%eax
  23:	78 1b                	js     40 <main+0x40>
    mknod("console", 1, 1);
    open("console", O_RDWR);
  }
  dup(0);  // stdout
  25:	83 ec 0c             	sub    $0xc,%esp
  28:	6a 00                	push   $0x0
  2a:	e8 cd 03 00 00       	call   3fc <dup>
  dup(0);  // stderr
  2f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  36:	e8 c1 03 00 00       	call   3fc <dup>
  3b:	83 c4 10             	add    $0x10,%esp
  3e:	eb 58                	jmp    98 <main+0x98>
    mknod("console", 1, 1);
  40:	83 ec 04             	sub    $0x4,%esp
  43:	6a 01                	push   $0x1
  45:	6a 01                	push   $0x1
  47:	68 88 07 00 00       	push   $0x788
  4c:	e8 7b 03 00 00       	call   3cc <mknod>
    open("console", O_RDWR);
  51:	83 c4 08             	add    $0x8,%esp
  54:	6a 02                	push   $0x2
  56:	68 88 07 00 00       	push   $0x788
  5b:	e8 64 03 00 00       	call   3c4 <open>
  60:	83 c4 10             	add    $0x10,%esp
  63:	eb c0                	jmp    25 <main+0x25>

  for(;;){
    printf(1, "init: starting sh\n");
    pid = fork();
    if(pid < 0){
      printf(1, "init: fork failed\n");
  65:	83 ec 08             	sub    $0x8,%esp
  68:	68 a3 07 00 00       	push   $0x7a3
  6d:	6a 01                	push   $0x1
  6f:	e8 65 04 00 00       	call   4d9 <printf>
      exit();
  74:	e8 0b 03 00 00       	call   384 <exit>
      exec("sh", argv);
      printf(1, "init: exec sh failed\n");
      exit();
    }
    while((wpid=wait()) >= 0 && wpid != pid)
      printf(1, "zombie!\n");
  79:	83 ec 08             	sub    $0x8,%esp
  7c:	68 cf 07 00 00       	push   $0x7cf
  81:	6a 01                	push   $0x1
  83:	e8 51 04 00 00       	call   4d9 <printf>
  88:	83 c4 10             	add    $0x10,%esp
    while((wpid=wait()) >= 0 && wpid != pid)
  8b:	e8 fc 02 00 00       	call   38c <wait>
  90:	85 c0                	test   %eax,%eax
  92:	78 04                	js     98 <main+0x98>
  94:	39 c3                	cmp    %eax,%ebx
  96:	75 e1                	jne    79 <main+0x79>
    printf(1, "init: starting sh\n");
  98:	83 ec 08             	sub    $0x8,%esp
  9b:	68 90 07 00 00       	push   $0x790
  a0:	6a 01                	push   $0x1
  a2:	e8 32 04 00 00       	call   4d9 <printf>
    pid = fork();
  a7:	e8 d0 02 00 00       	call   37c <fork>
  ac:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
  ae:	83 c4 10             	add    $0x10,%esp
  b1:	85 c0                	test   %eax,%eax
  b3:	78 b0                	js     65 <main+0x65>
    if(pid == 0){
  b5:	75 d4                	jne    8b <main+0x8b>
      exec("sh", argv);
  b7:	83 ec 08             	sub    $0x8,%esp
  ba:	68 ac 0b 00 00       	push   $0xbac
  bf:	68 b6 07 00 00       	push   $0x7b6
  c4:	e8 f3 02 00 00       	call   3bc <exec>
      printf(1, "init: exec sh failed\n");
  c9:	83 c4 08             	add    $0x8,%esp
  cc:	68 b9 07 00 00       	push   $0x7b9
  d1:	6a 01                	push   $0x1
  d3:	e8 01 04 00 00       	call   4d9 <printf>
      exit();
  d8:	e8 a7 02 00 00       	call   384 <exit>

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
  f1:	83 ec 14             	sub    $0x14,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE*2);
  f4:	68 00 20 00 00       	push   $0x2000
  f9:	e8 01 06 00 00       	call   6ff <malloc>
  if(n_stack == 0){
  fe:	83 c4 10             	add    $0x10,%esp
 101:	85 c0                	test   %eax,%eax
 103:	74 4a                	je     14f <thread_create+0x61>
    return -1;
  }
  
  for(int i=0; i<64; i++){
 105:	ba 00 00 00 00       	mov    $0x0,%edx
 10a:	eb 03                	jmp    10f <thread_create+0x21>
 10c:	83 c2 01             	add    $0x1,%edx
 10f:	83 fa 3f             	cmp    $0x3f,%edx
 112:	7f 27                	jg     13b <thread_create+0x4d>
    if(threads[i]->flag==0){
 114:	8b 0c 95 c0 0b 00 00 	mov    0xbc0(,%edx,4),%ecx
 11b:	83 79 08 00          	cmpl   $0x0,0x8(%ecx)
 11f:	75 eb                	jne    10c <thread_create+0x1e>
      threads[i]->maddr = n_stack;
 121:	89 01                	mov    %eax,(%ecx)
      threads[i]->pg1addr = n_stack;
 123:	8b 0c 95 c0 0b 00 00 	mov    0xbc0(,%edx,4),%ecx
 12a:	89 41 04             	mov    %eax,0x4(%ecx)
      threads[i]->flag = 1;
 12d:	8b 14 95 c0 0b 00 00 	mov    0xbc0(,%edx,4),%edx
 134:	c7 42 08 01 00 00 00 	movl   $0x1,0x8(%edx)
      break;
    }
  }
  
  int new_pid = clone(start_routine, arg1, arg2, n_stack); // TODO: is this the right way to call it?
 13b:	50                   	push   %eax
 13c:	ff 75 10             	push   0x10(%ebp)
 13f:	ff 75 0c             	push   0xc(%ebp)
 142:	ff 75 08             	push   0x8(%ebp)
 145:	e8 da 02 00 00       	call   424 <clone>

  // I can't remember if there was something else to do here but I'm sure I'll find out



  return new_pid;
 14a:	83 c4 10             	add    $0x10,%esp
}
 14d:	c9                   	leave  
 14e:	c3                   	ret    
    return -1;
 14f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 154:	eb f7                	jmp    14d <thread_create+0x5f>

00000156 <thread_join>:

//TODO: fix
int thread_join() {
 156:	55                   	push   %ebp
 157:	89 e5                	mov    %esp,%ebp
 159:	56                   	push   %esi
 15a:	53                   	push   %ebx
 15b:	83 ec 1c             	sub    $0x1c,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 15e:	8d 45 f4             	lea    -0xc(%ebp),%eax
 161:	50                   	push   %eax
 162:	e8 c5 02 00 00       	call   42c <join>
 167:	89 c6                	mov    %eax,%esi
  for(int i=0; i<64; i++){
 169:	83 c4 10             	add    $0x10,%esp
 16c:	bb 00 00 00 00       	mov    $0x0,%ebx
 171:	eb 03                	jmp    176 <thread_join+0x20>
 173:	83 c3 01             	add    $0x1,%ebx
 176:	83 fb 3f             	cmp    $0x3f,%ebx
 179:	7f 23                	jg     19e <thread_join+0x48>
    if((threads[i]->flag==1) && (stk_addr == threads[i]->pg1addr)){
 17b:	8b 04 9d c0 0b 00 00 	mov    0xbc0(,%ebx,4),%eax
 182:	83 78 08 01          	cmpl   $0x1,0x8(%eax)
 186:	75 eb                	jne    173 <thread_join+0x1d>
 188:	8b 55 f4             	mov    -0xc(%ebp),%edx
 18b:	39 50 04             	cmp    %edx,0x4(%eax)
 18e:	75 e3                	jne    173 <thread_join+0x1d>
      free(stk_addr);
 190:	83 ec 0c             	sub    $0xc,%esp
 193:	52                   	push   %edx
 194:	e8 a6 04 00 00       	call   63f <free>
 199:	83 c4 10             	add    $0x10,%esp
 19c:	eb d5                	jmp    173 <thread_join+0x1d>
    }
  }
  return pid;
}
 19e:	89 f0                	mov    %esi,%eax
 1a0:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1a3:	5b                   	pop    %ebx
 1a4:	5e                   	pop    %esi
 1a5:	5d                   	pop    %ebp
 1a6:	c3                   	ret    

000001a7 <lock_acquire>:

void lock_acquire(lock_t *lock){
 1a7:	55                   	push   %ebp
 1a8:	89 e5                	mov    %esp,%ebp
 1aa:	53                   	push   %ebx
 1ab:	83 ec 04             	sub    $0x4,%esp
 1ae:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 1b1:	83 ec 08             	sub    $0x8,%esp
 1b4:	6a 01                	push   $0x1
 1b6:	53                   	push   %ebx
 1b7:	e8 21 ff ff ff       	call   dd <test_and_set>
 1bc:	83 c4 10             	add    $0x10,%esp
 1bf:	83 f8 01             	cmp    $0x1,%eax
 1c2:	74 ed                	je     1b1 <lock_acquire+0xa>
    ;
}
 1c4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1c7:	c9                   	leave  
 1c8:	c3                   	ret    

000001c9 <lock_release>:

void lock_release(lock_t *lock) {
 1c9:	55                   	push   %ebp
 1ca:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 1cc:	8b 45 08             	mov    0x8(%ebp),%eax
 1cf:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 1d5:	5d                   	pop    %ebp
 1d6:	c3                   	ret    

000001d7 <lock_init>:

void lock_init(lock_t *lock) {
 1d7:	55                   	push   %ebp
 1d8:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 1da:	8b 45 08             	mov    0x8(%ebp),%eax
 1dd:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 1e3:	5d                   	pop    %ebp
 1e4:	c3                   	ret    

000001e5 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 1e5:	55                   	push   %ebp
 1e6:	89 e5                	mov    %esp,%ebp
 1e8:	56                   	push   %esi
 1e9:	53                   	push   %ebx
 1ea:	8b 75 08             	mov    0x8(%ebp),%esi
 1ed:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 1f0:	89 f0                	mov    %esi,%eax
 1f2:	89 d1                	mov    %edx,%ecx
 1f4:	83 c2 01             	add    $0x1,%edx
 1f7:	89 c3                	mov    %eax,%ebx
 1f9:	83 c0 01             	add    $0x1,%eax
 1fc:	0f b6 09             	movzbl (%ecx),%ecx
 1ff:	88 0b                	mov    %cl,(%ebx)
 201:	84 c9                	test   %cl,%cl
 203:	75 ed                	jne    1f2 <strcpy+0xd>
    ;
  return os;
}
 205:	89 f0                	mov    %esi,%eax
 207:	5b                   	pop    %ebx
 208:	5e                   	pop    %esi
 209:	5d                   	pop    %ebp
 20a:	c3                   	ret    

0000020b <strcmp>:

int
strcmp(const char *p, const char *q)
{
 20b:	55                   	push   %ebp
 20c:	89 e5                	mov    %esp,%ebp
 20e:	8b 4d 08             	mov    0x8(%ebp),%ecx
 211:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 214:	eb 06                	jmp    21c <strcmp+0x11>
    p++, q++;
 216:	83 c1 01             	add    $0x1,%ecx
 219:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 21c:	0f b6 01             	movzbl (%ecx),%eax
 21f:	84 c0                	test   %al,%al
 221:	74 04                	je     227 <strcmp+0x1c>
 223:	3a 02                	cmp    (%edx),%al
 225:	74 ef                	je     216 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 227:	0f b6 c0             	movzbl %al,%eax
 22a:	0f b6 12             	movzbl (%edx),%edx
 22d:	29 d0                	sub    %edx,%eax
}
 22f:	5d                   	pop    %ebp
 230:	c3                   	ret    

00000231 <strlen>:

uint
strlen(const char *s)
{
 231:	55                   	push   %ebp
 232:	89 e5                	mov    %esp,%ebp
 234:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 237:	b8 00 00 00 00       	mov    $0x0,%eax
 23c:	eb 03                	jmp    241 <strlen+0x10>
 23e:	83 c0 01             	add    $0x1,%eax
 241:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 245:	75 f7                	jne    23e <strlen+0xd>
    ;
  return n;
}
 247:	5d                   	pop    %ebp
 248:	c3                   	ret    

00000249 <memset>:

void*
memset(void *dst, int c, uint n)
{
 249:	55                   	push   %ebp
 24a:	89 e5                	mov    %esp,%ebp
 24c:	57                   	push   %edi
 24d:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 250:	89 d7                	mov    %edx,%edi
 252:	8b 4d 10             	mov    0x10(%ebp),%ecx
 255:	8b 45 0c             	mov    0xc(%ebp),%eax
 258:	fc                   	cld    
 259:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 25b:	89 d0                	mov    %edx,%eax
 25d:	8b 7d fc             	mov    -0x4(%ebp),%edi
 260:	c9                   	leave  
 261:	c3                   	ret    

00000262 <strchr>:

char*
strchr(const char *s, char c)
{
 262:	55                   	push   %ebp
 263:	89 e5                	mov    %esp,%ebp
 265:	8b 45 08             	mov    0x8(%ebp),%eax
 268:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 26c:	eb 03                	jmp    271 <strchr+0xf>
 26e:	83 c0 01             	add    $0x1,%eax
 271:	0f b6 10             	movzbl (%eax),%edx
 274:	84 d2                	test   %dl,%dl
 276:	74 06                	je     27e <strchr+0x1c>
    if(*s == c)
 278:	38 ca                	cmp    %cl,%dl
 27a:	75 f2                	jne    26e <strchr+0xc>
 27c:	eb 05                	jmp    283 <strchr+0x21>
      return (char*)s;
  return 0;
 27e:	b8 00 00 00 00       	mov    $0x0,%eax
}
 283:	5d                   	pop    %ebp
 284:	c3                   	ret    

00000285 <gets>:

char*
gets(char *buf, int max)
{
 285:	55                   	push   %ebp
 286:	89 e5                	mov    %esp,%ebp
 288:	57                   	push   %edi
 289:	56                   	push   %esi
 28a:	53                   	push   %ebx
 28b:	83 ec 1c             	sub    $0x1c,%esp
 28e:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 291:	bb 00 00 00 00       	mov    $0x0,%ebx
 296:	89 de                	mov    %ebx,%esi
 298:	83 c3 01             	add    $0x1,%ebx
 29b:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 29e:	7d 2e                	jge    2ce <gets+0x49>
    cc = read(0, &c, 1);
 2a0:	83 ec 04             	sub    $0x4,%esp
 2a3:	6a 01                	push   $0x1
 2a5:	8d 45 e7             	lea    -0x19(%ebp),%eax
 2a8:	50                   	push   %eax
 2a9:	6a 00                	push   $0x0
 2ab:	e8 ec 00 00 00       	call   39c <read>
    if(cc < 1)
 2b0:	83 c4 10             	add    $0x10,%esp
 2b3:	85 c0                	test   %eax,%eax
 2b5:	7e 17                	jle    2ce <gets+0x49>
      break;
    buf[i++] = c;
 2b7:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2bb:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 2be:	3c 0a                	cmp    $0xa,%al
 2c0:	0f 94 c2             	sete   %dl
 2c3:	3c 0d                	cmp    $0xd,%al
 2c5:	0f 94 c0             	sete   %al
 2c8:	08 c2                	or     %al,%dl
 2ca:	74 ca                	je     296 <gets+0x11>
    buf[i++] = c;
 2cc:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 2ce:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 2d2:	89 f8                	mov    %edi,%eax
 2d4:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2d7:	5b                   	pop    %ebx
 2d8:	5e                   	pop    %esi
 2d9:	5f                   	pop    %edi
 2da:	5d                   	pop    %ebp
 2db:	c3                   	ret    

000002dc <stat>:

int
stat(const char *n, struct stat *st)
{
 2dc:	55                   	push   %ebp
 2dd:	89 e5                	mov    %esp,%ebp
 2df:	56                   	push   %esi
 2e0:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2e1:	83 ec 08             	sub    $0x8,%esp
 2e4:	6a 00                	push   $0x0
 2e6:	ff 75 08             	push   0x8(%ebp)
 2e9:	e8 d6 00 00 00       	call   3c4 <open>
  if(fd < 0)
 2ee:	83 c4 10             	add    $0x10,%esp
 2f1:	85 c0                	test   %eax,%eax
 2f3:	78 24                	js     319 <stat+0x3d>
 2f5:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 2f7:	83 ec 08             	sub    $0x8,%esp
 2fa:	ff 75 0c             	push   0xc(%ebp)
 2fd:	50                   	push   %eax
 2fe:	e8 d9 00 00 00       	call   3dc <fstat>
 303:	89 c6                	mov    %eax,%esi
  close(fd);
 305:	89 1c 24             	mov    %ebx,(%esp)
 308:	e8 9f 00 00 00       	call   3ac <close>
  return r;
 30d:	83 c4 10             	add    $0x10,%esp
}
 310:	89 f0                	mov    %esi,%eax
 312:	8d 65 f8             	lea    -0x8(%ebp),%esp
 315:	5b                   	pop    %ebx
 316:	5e                   	pop    %esi
 317:	5d                   	pop    %ebp
 318:	c3                   	ret    
    return -1;
 319:	be ff ff ff ff       	mov    $0xffffffff,%esi
 31e:	eb f0                	jmp    310 <stat+0x34>

00000320 <atoi>:

int
atoi(const char *s)
{
 320:	55                   	push   %ebp
 321:	89 e5                	mov    %esp,%ebp
 323:	53                   	push   %ebx
 324:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 327:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 32c:	eb 10                	jmp    33e <atoi+0x1e>
    n = n*10 + *s++ - '0';
 32e:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 331:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 334:	83 c1 01             	add    $0x1,%ecx
 337:	0f be c0             	movsbl %al,%eax
 33a:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 33e:	0f b6 01             	movzbl (%ecx),%eax
 341:	8d 58 d0             	lea    -0x30(%eax),%ebx
 344:	80 fb 09             	cmp    $0x9,%bl
 347:	76 e5                	jbe    32e <atoi+0xe>
  return n;
}
 349:	89 d0                	mov    %edx,%eax
 34b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 34e:	c9                   	leave  
 34f:	c3                   	ret    

00000350 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 350:	55                   	push   %ebp
 351:	89 e5                	mov    %esp,%ebp
 353:	56                   	push   %esi
 354:	53                   	push   %ebx
 355:	8b 75 08             	mov    0x8(%ebp),%esi
 358:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 35b:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 35e:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 360:	eb 0d                	jmp    36f <memmove+0x1f>
    *dst++ = *src++;
 362:	0f b6 01             	movzbl (%ecx),%eax
 365:	88 02                	mov    %al,(%edx)
 367:	8d 49 01             	lea    0x1(%ecx),%ecx
 36a:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 36d:	89 d8                	mov    %ebx,%eax
 36f:	8d 58 ff             	lea    -0x1(%eax),%ebx
 372:	85 c0                	test   %eax,%eax
 374:	7f ec                	jg     362 <memmove+0x12>
  return vdst;
}
 376:	89 f0                	mov    %esi,%eax
 378:	5b                   	pop    %ebx
 379:	5e                   	pop    %esi
 37a:	5d                   	pop    %ebp
 37b:	c3                   	ret    

0000037c <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 37c:	b8 01 00 00 00       	mov    $0x1,%eax
 381:	cd 40                	int    $0x40
 383:	c3                   	ret    

00000384 <exit>:
SYSCALL(exit)
 384:	b8 02 00 00 00       	mov    $0x2,%eax
 389:	cd 40                	int    $0x40
 38b:	c3                   	ret    

0000038c <wait>:
SYSCALL(wait)
 38c:	b8 03 00 00 00       	mov    $0x3,%eax
 391:	cd 40                	int    $0x40
 393:	c3                   	ret    

00000394 <pipe>:
SYSCALL(pipe)
 394:	b8 04 00 00 00       	mov    $0x4,%eax
 399:	cd 40                	int    $0x40
 39b:	c3                   	ret    

0000039c <read>:
SYSCALL(read)
 39c:	b8 05 00 00 00       	mov    $0x5,%eax
 3a1:	cd 40                	int    $0x40
 3a3:	c3                   	ret    

000003a4 <write>:
SYSCALL(write)
 3a4:	b8 10 00 00 00       	mov    $0x10,%eax
 3a9:	cd 40                	int    $0x40
 3ab:	c3                   	ret    

000003ac <close>:
SYSCALL(close)
 3ac:	b8 15 00 00 00       	mov    $0x15,%eax
 3b1:	cd 40                	int    $0x40
 3b3:	c3                   	ret    

000003b4 <kill>:
SYSCALL(kill)
 3b4:	b8 06 00 00 00       	mov    $0x6,%eax
 3b9:	cd 40                	int    $0x40
 3bb:	c3                   	ret    

000003bc <exec>:
SYSCALL(exec)
 3bc:	b8 07 00 00 00       	mov    $0x7,%eax
 3c1:	cd 40                	int    $0x40
 3c3:	c3                   	ret    

000003c4 <open>:
SYSCALL(open)
 3c4:	b8 0f 00 00 00       	mov    $0xf,%eax
 3c9:	cd 40                	int    $0x40
 3cb:	c3                   	ret    

000003cc <mknod>:
SYSCALL(mknod)
 3cc:	b8 11 00 00 00       	mov    $0x11,%eax
 3d1:	cd 40                	int    $0x40
 3d3:	c3                   	ret    

000003d4 <unlink>:
SYSCALL(unlink)
 3d4:	b8 12 00 00 00       	mov    $0x12,%eax
 3d9:	cd 40                	int    $0x40
 3db:	c3                   	ret    

000003dc <fstat>:
SYSCALL(fstat)
 3dc:	b8 08 00 00 00       	mov    $0x8,%eax
 3e1:	cd 40                	int    $0x40
 3e3:	c3                   	ret    

000003e4 <link>:
SYSCALL(link)
 3e4:	b8 13 00 00 00       	mov    $0x13,%eax
 3e9:	cd 40                	int    $0x40
 3eb:	c3                   	ret    

000003ec <mkdir>:
SYSCALL(mkdir)
 3ec:	b8 14 00 00 00       	mov    $0x14,%eax
 3f1:	cd 40                	int    $0x40
 3f3:	c3                   	ret    

000003f4 <chdir>:
SYSCALL(chdir)
 3f4:	b8 09 00 00 00       	mov    $0x9,%eax
 3f9:	cd 40                	int    $0x40
 3fb:	c3                   	ret    

000003fc <dup>:
SYSCALL(dup)
 3fc:	b8 0a 00 00 00       	mov    $0xa,%eax
 401:	cd 40                	int    $0x40
 403:	c3                   	ret    

00000404 <getpid>:
SYSCALL(getpid)
 404:	b8 0b 00 00 00       	mov    $0xb,%eax
 409:	cd 40                	int    $0x40
 40b:	c3                   	ret    

0000040c <sbrk>:
SYSCALL(sbrk)
 40c:	b8 0c 00 00 00       	mov    $0xc,%eax
 411:	cd 40                	int    $0x40
 413:	c3                   	ret    

00000414 <sleep>:
SYSCALL(sleep)
 414:	b8 0d 00 00 00       	mov    $0xd,%eax
 419:	cd 40                	int    $0x40
 41b:	c3                   	ret    

0000041c <uptime>:
SYSCALL(uptime)
 41c:	b8 0e 00 00 00       	mov    $0xe,%eax
 421:	cd 40                	int    $0x40
 423:	c3                   	ret    

00000424 <clone>:
SYSCALL(clone)
 424:	b8 16 00 00 00       	mov    $0x16,%eax
 429:	cd 40                	int    $0x40
 42b:	c3                   	ret    

0000042c <join>:
 42c:	b8 17 00 00 00       	mov    $0x17,%eax
 431:	cd 40                	int    $0x40
 433:	c3                   	ret    

00000434 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 434:	55                   	push   %ebp
 435:	89 e5                	mov    %esp,%ebp
 437:	83 ec 1c             	sub    $0x1c,%esp
 43a:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 43d:	6a 01                	push   $0x1
 43f:	8d 55 f4             	lea    -0xc(%ebp),%edx
 442:	52                   	push   %edx
 443:	50                   	push   %eax
 444:	e8 5b ff ff ff       	call   3a4 <write>
}
 449:	83 c4 10             	add    $0x10,%esp
 44c:	c9                   	leave  
 44d:	c3                   	ret    

0000044e <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 44e:	55                   	push   %ebp
 44f:	89 e5                	mov    %esp,%ebp
 451:	57                   	push   %edi
 452:	56                   	push   %esi
 453:	53                   	push   %ebx
 454:	83 ec 2c             	sub    $0x2c,%esp
 457:	89 45 d0             	mov    %eax,-0x30(%ebp)
 45a:	89 d0                	mov    %edx,%eax
 45c:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 45e:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 462:	0f 95 c1             	setne  %cl
 465:	c1 ea 1f             	shr    $0x1f,%edx
 468:	84 d1                	test   %dl,%cl
 46a:	74 44                	je     4b0 <printint+0x62>
    neg = 1;
    x = -xx;
 46c:	f7 d8                	neg    %eax
 46e:	89 c1                	mov    %eax,%ecx
    neg = 1;
 470:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 477:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 47c:	89 c8                	mov    %ecx,%eax
 47e:	ba 00 00 00 00       	mov    $0x0,%edx
 483:	f7 f6                	div    %esi
 485:	89 df                	mov    %ebx,%edi
 487:	83 c3 01             	add    $0x1,%ebx
 48a:	0f b6 92 38 08 00 00 	movzbl 0x838(%edx),%edx
 491:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 495:	89 ca                	mov    %ecx,%edx
 497:	89 c1                	mov    %eax,%ecx
 499:	39 d6                	cmp    %edx,%esi
 49b:	76 df                	jbe    47c <printint+0x2e>
  if(neg)
 49d:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 4a1:	74 31                	je     4d4 <printint+0x86>
    buf[i++] = '-';
 4a3:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 4a8:	8d 5f 02             	lea    0x2(%edi),%ebx
 4ab:	8b 75 d0             	mov    -0x30(%ebp),%esi
 4ae:	eb 17                	jmp    4c7 <printint+0x79>
    x = xx;
 4b0:	89 c1                	mov    %eax,%ecx
  neg = 0;
 4b2:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 4b9:	eb bc                	jmp    477 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 4bb:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 4c0:	89 f0                	mov    %esi,%eax
 4c2:	e8 6d ff ff ff       	call   434 <putc>
  while(--i >= 0)
 4c7:	83 eb 01             	sub    $0x1,%ebx
 4ca:	79 ef                	jns    4bb <printint+0x6d>
}
 4cc:	83 c4 2c             	add    $0x2c,%esp
 4cf:	5b                   	pop    %ebx
 4d0:	5e                   	pop    %esi
 4d1:	5f                   	pop    %edi
 4d2:	5d                   	pop    %ebp
 4d3:	c3                   	ret    
 4d4:	8b 75 d0             	mov    -0x30(%ebp),%esi
 4d7:	eb ee                	jmp    4c7 <printint+0x79>

000004d9 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 4d9:	55                   	push   %ebp
 4da:	89 e5                	mov    %esp,%ebp
 4dc:	57                   	push   %edi
 4dd:	56                   	push   %esi
 4de:	53                   	push   %ebx
 4df:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 4e2:	8d 45 10             	lea    0x10(%ebp),%eax
 4e5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 4e8:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 4ed:	bb 00 00 00 00       	mov    $0x0,%ebx
 4f2:	eb 14                	jmp    508 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 4f4:	89 fa                	mov    %edi,%edx
 4f6:	8b 45 08             	mov    0x8(%ebp),%eax
 4f9:	e8 36 ff ff ff       	call   434 <putc>
 4fe:	eb 05                	jmp    505 <printf+0x2c>
      }
    } else if(state == '%'){
 500:	83 fe 25             	cmp    $0x25,%esi
 503:	74 25                	je     52a <printf+0x51>
  for(i = 0; fmt[i]; i++){
 505:	83 c3 01             	add    $0x1,%ebx
 508:	8b 45 0c             	mov    0xc(%ebp),%eax
 50b:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 50f:	84 c0                	test   %al,%al
 511:	0f 84 20 01 00 00    	je     637 <printf+0x15e>
    c = fmt[i] & 0xff;
 517:	0f be f8             	movsbl %al,%edi
 51a:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 51d:	85 f6                	test   %esi,%esi
 51f:	75 df                	jne    500 <printf+0x27>
      if(c == '%'){
 521:	83 f8 25             	cmp    $0x25,%eax
 524:	75 ce                	jne    4f4 <printf+0x1b>
        state = '%';
 526:	89 c6                	mov    %eax,%esi
 528:	eb db                	jmp    505 <printf+0x2c>
      if(c == 'd'){
 52a:	83 f8 25             	cmp    $0x25,%eax
 52d:	0f 84 cf 00 00 00    	je     602 <printf+0x129>
 533:	0f 8c dd 00 00 00    	jl     616 <printf+0x13d>
 539:	83 f8 78             	cmp    $0x78,%eax
 53c:	0f 8f d4 00 00 00    	jg     616 <printf+0x13d>
 542:	83 f8 63             	cmp    $0x63,%eax
 545:	0f 8c cb 00 00 00    	jl     616 <printf+0x13d>
 54b:	83 e8 63             	sub    $0x63,%eax
 54e:	83 f8 15             	cmp    $0x15,%eax
 551:	0f 87 bf 00 00 00    	ja     616 <printf+0x13d>
 557:	ff 24 85 e0 07 00 00 	jmp    *0x7e0(,%eax,4)
        printint(fd, *ap, 10, 1);
 55e:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 561:	8b 17                	mov    (%edi),%edx
 563:	83 ec 0c             	sub    $0xc,%esp
 566:	6a 01                	push   $0x1
 568:	b9 0a 00 00 00       	mov    $0xa,%ecx
 56d:	8b 45 08             	mov    0x8(%ebp),%eax
 570:	e8 d9 fe ff ff       	call   44e <printint>
        ap++;
 575:	83 c7 04             	add    $0x4,%edi
 578:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 57b:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 57e:	be 00 00 00 00       	mov    $0x0,%esi
 583:	eb 80                	jmp    505 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 585:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 588:	8b 17                	mov    (%edi),%edx
 58a:	83 ec 0c             	sub    $0xc,%esp
 58d:	6a 00                	push   $0x0
 58f:	b9 10 00 00 00       	mov    $0x10,%ecx
 594:	8b 45 08             	mov    0x8(%ebp),%eax
 597:	e8 b2 fe ff ff       	call   44e <printint>
        ap++;
 59c:	83 c7 04             	add    $0x4,%edi
 59f:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 5a2:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5a5:	be 00 00 00 00       	mov    $0x0,%esi
 5aa:	e9 56 ff ff ff       	jmp    505 <printf+0x2c>
        s = (char*)*ap;
 5af:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5b2:	8b 30                	mov    (%eax),%esi
        ap++;
 5b4:	83 c0 04             	add    $0x4,%eax
 5b7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 5ba:	85 f6                	test   %esi,%esi
 5bc:	75 15                	jne    5d3 <printf+0xfa>
          s = "(null)";
 5be:	be d8 07 00 00       	mov    $0x7d8,%esi
 5c3:	eb 0e                	jmp    5d3 <printf+0xfa>
          putc(fd, *s);
 5c5:	0f be d2             	movsbl %dl,%edx
 5c8:	8b 45 08             	mov    0x8(%ebp),%eax
 5cb:	e8 64 fe ff ff       	call   434 <putc>
          s++;
 5d0:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 5d3:	0f b6 16             	movzbl (%esi),%edx
 5d6:	84 d2                	test   %dl,%dl
 5d8:	75 eb                	jne    5c5 <printf+0xec>
      state = 0;
 5da:	be 00 00 00 00       	mov    $0x0,%esi
 5df:	e9 21 ff ff ff       	jmp    505 <printf+0x2c>
        putc(fd, *ap);
 5e4:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5e7:	0f be 17             	movsbl (%edi),%edx
 5ea:	8b 45 08             	mov    0x8(%ebp),%eax
 5ed:	e8 42 fe ff ff       	call   434 <putc>
        ap++;
 5f2:	83 c7 04             	add    $0x4,%edi
 5f5:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 5f8:	be 00 00 00 00       	mov    $0x0,%esi
 5fd:	e9 03 ff ff ff       	jmp    505 <printf+0x2c>
        putc(fd, c);
 602:	89 fa                	mov    %edi,%edx
 604:	8b 45 08             	mov    0x8(%ebp),%eax
 607:	e8 28 fe ff ff       	call   434 <putc>
      state = 0;
 60c:	be 00 00 00 00       	mov    $0x0,%esi
 611:	e9 ef fe ff ff       	jmp    505 <printf+0x2c>
        putc(fd, '%');
 616:	ba 25 00 00 00       	mov    $0x25,%edx
 61b:	8b 45 08             	mov    0x8(%ebp),%eax
 61e:	e8 11 fe ff ff       	call   434 <putc>
        putc(fd, c);
 623:	89 fa                	mov    %edi,%edx
 625:	8b 45 08             	mov    0x8(%ebp),%eax
 628:	e8 07 fe ff ff       	call   434 <putc>
      state = 0;
 62d:	be 00 00 00 00       	mov    $0x0,%esi
 632:	e9 ce fe ff ff       	jmp    505 <printf+0x2c>
    }
  }
}
 637:	8d 65 f4             	lea    -0xc(%ebp),%esp
 63a:	5b                   	pop    %ebx
 63b:	5e                   	pop    %esi
 63c:	5f                   	pop    %edi
 63d:	5d                   	pop    %ebp
 63e:	c3                   	ret    

0000063f <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 63f:	55                   	push   %ebp
 640:	89 e5                	mov    %esp,%ebp
 642:	57                   	push   %edi
 643:	56                   	push   %esi
 644:	53                   	push   %ebx
 645:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 648:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 64b:	a1 c0 0c 00 00       	mov    0xcc0,%eax
 650:	eb 02                	jmp    654 <free+0x15>
 652:	89 d0                	mov    %edx,%eax
 654:	39 c8                	cmp    %ecx,%eax
 656:	73 04                	jae    65c <free+0x1d>
 658:	39 08                	cmp    %ecx,(%eax)
 65a:	77 12                	ja     66e <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 65c:	8b 10                	mov    (%eax),%edx
 65e:	39 c2                	cmp    %eax,%edx
 660:	77 f0                	ja     652 <free+0x13>
 662:	39 c8                	cmp    %ecx,%eax
 664:	72 08                	jb     66e <free+0x2f>
 666:	39 ca                	cmp    %ecx,%edx
 668:	77 04                	ja     66e <free+0x2f>
 66a:	89 d0                	mov    %edx,%eax
 66c:	eb e6                	jmp    654 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 66e:	8b 73 fc             	mov    -0x4(%ebx),%esi
 671:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 674:	8b 10                	mov    (%eax),%edx
 676:	39 d7                	cmp    %edx,%edi
 678:	74 19                	je     693 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 67a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 67d:	8b 50 04             	mov    0x4(%eax),%edx
 680:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 683:	39 ce                	cmp    %ecx,%esi
 685:	74 1b                	je     6a2 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 687:	89 08                	mov    %ecx,(%eax)
  freep = p;
 689:	a3 c0 0c 00 00       	mov    %eax,0xcc0
}
 68e:	5b                   	pop    %ebx
 68f:	5e                   	pop    %esi
 690:	5f                   	pop    %edi
 691:	5d                   	pop    %ebp
 692:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 693:	03 72 04             	add    0x4(%edx),%esi
 696:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 699:	8b 10                	mov    (%eax),%edx
 69b:	8b 12                	mov    (%edx),%edx
 69d:	89 53 f8             	mov    %edx,-0x8(%ebx)
 6a0:	eb db                	jmp    67d <free+0x3e>
    p->s.size += bp->s.size;
 6a2:	03 53 fc             	add    -0x4(%ebx),%edx
 6a5:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6a8:	8b 53 f8             	mov    -0x8(%ebx),%edx
 6ab:	89 10                	mov    %edx,(%eax)
 6ad:	eb da                	jmp    689 <free+0x4a>

000006af <morecore>:

static Header*
morecore(uint nu)
{
 6af:	55                   	push   %ebp
 6b0:	89 e5                	mov    %esp,%ebp
 6b2:	53                   	push   %ebx
 6b3:	83 ec 04             	sub    $0x4,%esp
 6b6:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 6b8:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 6bd:	77 05                	ja     6c4 <morecore+0x15>
    nu = 4096;
 6bf:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 6c4:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 6cb:	83 ec 0c             	sub    $0xc,%esp
 6ce:	50                   	push   %eax
 6cf:	e8 38 fd ff ff       	call   40c <sbrk>
  if(p == (char*)-1)
 6d4:	83 c4 10             	add    $0x10,%esp
 6d7:	83 f8 ff             	cmp    $0xffffffff,%eax
 6da:	74 1c                	je     6f8 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 6dc:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 6df:	83 c0 08             	add    $0x8,%eax
 6e2:	83 ec 0c             	sub    $0xc,%esp
 6e5:	50                   	push   %eax
 6e6:	e8 54 ff ff ff       	call   63f <free>
  return freep;
 6eb:	a1 c0 0c 00 00       	mov    0xcc0,%eax
 6f0:	83 c4 10             	add    $0x10,%esp
}
 6f3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 6f6:	c9                   	leave  
 6f7:	c3                   	ret    
    return 0;
 6f8:	b8 00 00 00 00       	mov    $0x0,%eax
 6fd:	eb f4                	jmp    6f3 <morecore+0x44>

000006ff <malloc>:

void*
malloc(uint nbytes)
{
 6ff:	55                   	push   %ebp
 700:	89 e5                	mov    %esp,%ebp
 702:	53                   	push   %ebx
 703:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 706:	8b 45 08             	mov    0x8(%ebp),%eax
 709:	8d 58 07             	lea    0x7(%eax),%ebx
 70c:	c1 eb 03             	shr    $0x3,%ebx
 70f:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 712:	8b 0d c0 0c 00 00    	mov    0xcc0,%ecx
 718:	85 c9                	test   %ecx,%ecx
 71a:	74 04                	je     720 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 71c:	8b 01                	mov    (%ecx),%eax
 71e:	eb 4a                	jmp    76a <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 720:	c7 05 c0 0c 00 00 c4 	movl   $0xcc4,0xcc0
 727:	0c 00 00 
 72a:	c7 05 c4 0c 00 00 c4 	movl   $0xcc4,0xcc4
 731:	0c 00 00 
    base.s.size = 0;
 734:	c7 05 c8 0c 00 00 00 	movl   $0x0,0xcc8
 73b:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 73e:	b9 c4 0c 00 00       	mov    $0xcc4,%ecx
 743:	eb d7                	jmp    71c <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 745:	74 19                	je     760 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 747:	29 da                	sub    %ebx,%edx
 749:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 74c:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 74f:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 752:	89 0d c0 0c 00 00    	mov    %ecx,0xcc0
      return (void*)(p + 1);
 758:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 75b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 75e:	c9                   	leave  
 75f:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 760:	8b 10                	mov    (%eax),%edx
 762:	89 11                	mov    %edx,(%ecx)
 764:	eb ec                	jmp    752 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 766:	89 c1                	mov    %eax,%ecx
 768:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 76a:	8b 50 04             	mov    0x4(%eax),%edx
 76d:	39 da                	cmp    %ebx,%edx
 76f:	73 d4                	jae    745 <malloc+0x46>
    if(p == freep)
 771:	39 05 c0 0c 00 00    	cmp    %eax,0xcc0
 777:	75 ed                	jne    766 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 779:	89 d8                	mov    %ebx,%eax
 77b:	e8 2f ff ff ff       	call   6af <morecore>
 780:	85 c0                	test   %eax,%eax
 782:	75 e2                	jne    766 <malloc+0x67>
 784:	eb d5                	jmp    75b <malloc+0x5c>
