
_cat:     file format elf32-i386


Disassembly of section .text:

00000000 <cat>:

char buf[512];

void
cat(int fd)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	56                   	push   %esi
   4:	53                   	push   %ebx
   5:	8b 75 08             	mov    0x8(%ebp),%esi
  int n;

  while((n = read(fd, buf, sizeof(buf))) > 0) {
   8:	83 ec 04             	sub    $0x4,%esp
   b:	68 00 02 00 00       	push   $0x200
  10:	68 00 0c 00 00       	push   $0xc00
  15:	56                   	push   %esi
  16:	e8 9c 03 00 00       	call   3b7 <read>
  1b:	89 c3                	mov    %eax,%ebx
  1d:	83 c4 10             	add    $0x10,%esp
  20:	85 c0                	test   %eax,%eax
  22:	7e 2b                	jle    4f <cat+0x4f>
    if (write(1, buf, n) != n) {
  24:	83 ec 04             	sub    $0x4,%esp
  27:	53                   	push   %ebx
  28:	68 00 0c 00 00       	push   $0xc00
  2d:	6a 01                	push   $0x1
  2f:	e8 8b 03 00 00       	call   3bf <write>
  34:	83 c4 10             	add    $0x10,%esp
  37:	39 d8                	cmp    %ebx,%eax
  39:	74 cd                	je     8 <cat+0x8>
      printf(1, "cat: write error\n");
  3b:	83 ec 08             	sub    $0x8,%esp
  3e:	68 a4 07 00 00       	push   $0x7a4
  43:	6a 01                	push   $0x1
  45:	e8 aa 04 00 00       	call   4f4 <printf>
      exit();
  4a:	e8 50 03 00 00       	call   39f <exit>
    }
  }
  if(n < 0){
  4f:	78 07                	js     58 <cat+0x58>
    printf(1, "cat: read error\n");
    exit();
  }
}
  51:	8d 65 f8             	lea    -0x8(%ebp),%esp
  54:	5b                   	pop    %ebx
  55:	5e                   	pop    %esi
  56:	5d                   	pop    %ebp
  57:	c3                   	ret    
    printf(1, "cat: read error\n");
  58:	83 ec 08             	sub    $0x8,%esp
  5b:	68 b6 07 00 00       	push   $0x7b6
  60:	6a 01                	push   $0x1
  62:	e8 8d 04 00 00       	call   4f4 <printf>
    exit();
  67:	e8 33 03 00 00       	call   39f <exit>

0000006c <main>:

int
main(int argc, char *argv[])
{
  6c:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  70:	83 e4 f0             	and    $0xfffffff0,%esp
  73:	ff 71 fc             	push   -0x4(%ecx)
  76:	55                   	push   %ebp
  77:	89 e5                	mov    %esp,%ebp
  79:	57                   	push   %edi
  7a:	56                   	push   %esi
  7b:	53                   	push   %ebx
  7c:	51                   	push   %ecx
  7d:	83 ec 18             	sub    $0x18,%esp
  80:	8b 01                	mov    (%ecx),%eax
  82:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  85:	8b 51 04             	mov    0x4(%ecx),%edx
  88:	89 55 e0             	mov    %edx,-0x20(%ebp)
  int fd, i;

  if(argc <= 1){
  8b:	83 f8 01             	cmp    $0x1,%eax
  8e:	7e 07                	jle    97 <main+0x2b>
    cat(0);
    exit();
  }

  for(i = 1; i < argc; i++){
  90:	be 01 00 00 00       	mov    $0x1,%esi
  95:	eb 26                	jmp    bd <main+0x51>
    cat(0);
  97:	83 ec 0c             	sub    $0xc,%esp
  9a:	6a 00                	push   $0x0
  9c:	e8 5f ff ff ff       	call   0 <cat>
    exit();
  a1:	e8 f9 02 00 00       	call   39f <exit>
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "cat: cannot open %s\n", argv[i]);
      exit();
    }
    cat(fd);
  a6:	83 ec 0c             	sub    $0xc,%esp
  a9:	50                   	push   %eax
  aa:	e8 51 ff ff ff       	call   0 <cat>
    close(fd);
  af:	89 1c 24             	mov    %ebx,(%esp)
  b2:	e8 10 03 00 00       	call   3c7 <close>
  for(i = 1; i < argc; i++){
  b7:	83 c6 01             	add    $0x1,%esi
  ba:	83 c4 10             	add    $0x10,%esp
  bd:	3b 75 e4             	cmp    -0x1c(%ebp),%esi
  c0:	7d 31                	jge    f3 <main+0x87>
    if((fd = open(argv[i], 0)) < 0){
  c2:	8b 45 e0             	mov    -0x20(%ebp),%eax
  c5:	8d 3c b0             	lea    (%eax,%esi,4),%edi
  c8:	83 ec 08             	sub    $0x8,%esp
  cb:	6a 00                	push   $0x0
  cd:	ff 37                	push   (%edi)
  cf:	e8 0b 03 00 00       	call   3df <open>
  d4:	89 c3                	mov    %eax,%ebx
  d6:	83 c4 10             	add    $0x10,%esp
  d9:	85 c0                	test   %eax,%eax
  db:	79 c9                	jns    a6 <main+0x3a>
      printf(1, "cat: cannot open %s\n", argv[i]);
  dd:	83 ec 04             	sub    $0x4,%esp
  e0:	ff 37                	push   (%edi)
  e2:	68 c7 07 00 00       	push   $0x7c7
  e7:	6a 01                	push   $0x1
  e9:	e8 06 04 00 00       	call   4f4 <printf>
      exit();
  ee:	e8 ac 02 00 00       	call   39f <exit>
  }
  exit();
  f3:	e8 a7 02 00 00       	call   39f <exit>

000000f8 <test_and_set>:
  int flag;
};

struct thread_ref *threads[64];

int test_and_set(int *old_ptr, int new_ptr) {
  f8:	55                   	push   %ebp
  f9:	89 e5                	mov    %esp,%ebp
  fb:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *old_ptr;
  fe:	8b 10                	mov    (%eax),%edx
  *old_ptr = new_ptr;
 100:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 103:	89 08                	mov    %ecx,(%eax)
  return old;
}
 105:	89 d0                	mov    %edx,%eax
 107:	5d                   	pop    %ebp
 108:	c3                   	ret    

00000109 <thread_create>:

// a wrapper func for clone
int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 109:	55                   	push   %ebp
 10a:	89 e5                	mov    %esp,%ebp
 10c:	83 ec 14             	sub    $0x14,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE*2);
 10f:	68 00 20 00 00       	push   $0x2000
 114:	e8 01 06 00 00       	call   71a <malloc>
  if(n_stack == 0){
 119:	83 c4 10             	add    $0x10,%esp
 11c:	85 c0                	test   %eax,%eax
 11e:	74 4a                	je     16a <thread_create+0x61>
    return -1;
  }
  
  for(int i=0; i<64; i++){
 120:	ba 00 00 00 00       	mov    $0x0,%edx
 125:	eb 03                	jmp    12a <thread_create+0x21>
 127:	83 c2 01             	add    $0x1,%edx
 12a:	83 fa 3f             	cmp    $0x3f,%edx
 12d:	7f 27                	jg     156 <thread_create+0x4d>
    if(threads[i]->flag==0){
 12f:	8b 0c 95 00 0e 00 00 	mov    0xe00(,%edx,4),%ecx
 136:	83 79 08 00          	cmpl   $0x0,0x8(%ecx)
 13a:	75 eb                	jne    127 <thread_create+0x1e>
      threads[i]->maddr = n_stack;
 13c:	89 01                	mov    %eax,(%ecx)
      threads[i]->pg1addr = n_stack;
 13e:	8b 0c 95 00 0e 00 00 	mov    0xe00(,%edx,4),%ecx
 145:	89 41 04             	mov    %eax,0x4(%ecx)
      threads[i]->flag = 1;
 148:	8b 14 95 00 0e 00 00 	mov    0xe00(,%edx,4),%edx
 14f:	c7 42 08 01 00 00 00 	movl   $0x1,0x8(%edx)
      break;
    }
  }
  
  int new_pid = clone(start_routine, arg1, arg2, n_stack); // TODO: is this the right way to call it?
 156:	50                   	push   %eax
 157:	ff 75 10             	push   0x10(%ebp)
 15a:	ff 75 0c             	push   0xc(%ebp)
 15d:	ff 75 08             	push   0x8(%ebp)
 160:	e8 da 02 00 00       	call   43f <clone>

  // I can't remember if there was something else to do here but I'm sure I'll find out



  return new_pid;
 165:	83 c4 10             	add    $0x10,%esp
}
 168:	c9                   	leave  
 169:	c3                   	ret    
    return -1;
 16a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 16f:	eb f7                	jmp    168 <thread_create+0x5f>

00000171 <thread_join>:

//TODO: fix
int thread_join() {
 171:	55                   	push   %ebp
 172:	89 e5                	mov    %esp,%ebp
 174:	56                   	push   %esi
 175:	53                   	push   %ebx
 176:	83 ec 1c             	sub    $0x1c,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 179:	8d 45 f4             	lea    -0xc(%ebp),%eax
 17c:	50                   	push   %eax
 17d:	e8 c5 02 00 00       	call   447 <join>
 182:	89 c6                	mov    %eax,%esi
  for(int i=0; i<64; i++){
 184:	83 c4 10             	add    $0x10,%esp
 187:	bb 00 00 00 00       	mov    $0x0,%ebx
 18c:	eb 03                	jmp    191 <thread_join+0x20>
 18e:	83 c3 01             	add    $0x1,%ebx
 191:	83 fb 3f             	cmp    $0x3f,%ebx
 194:	7f 23                	jg     1b9 <thread_join+0x48>
    if((threads[i]->flag==1) && (stk_addr == threads[i]->pg1addr)){
 196:	8b 04 9d 00 0e 00 00 	mov    0xe00(,%ebx,4),%eax
 19d:	83 78 08 01          	cmpl   $0x1,0x8(%eax)
 1a1:	75 eb                	jne    18e <thread_join+0x1d>
 1a3:	8b 55 f4             	mov    -0xc(%ebp),%edx
 1a6:	39 50 04             	cmp    %edx,0x4(%eax)
 1a9:	75 e3                	jne    18e <thread_join+0x1d>
      free(stk_addr);
 1ab:	83 ec 0c             	sub    $0xc,%esp
 1ae:	52                   	push   %edx
 1af:	e8 a6 04 00 00       	call   65a <free>
 1b4:	83 c4 10             	add    $0x10,%esp
 1b7:	eb d5                	jmp    18e <thread_join+0x1d>
    }
  }
  return pid;
}
 1b9:	89 f0                	mov    %esi,%eax
 1bb:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1be:	5b                   	pop    %ebx
 1bf:	5e                   	pop    %esi
 1c0:	5d                   	pop    %ebp
 1c1:	c3                   	ret    

000001c2 <lock_acquire>:

void lock_acquire(lock_t *lock){
 1c2:	55                   	push   %ebp
 1c3:	89 e5                	mov    %esp,%ebp
 1c5:	53                   	push   %ebx
 1c6:	83 ec 04             	sub    $0x4,%esp
 1c9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 1cc:	83 ec 08             	sub    $0x8,%esp
 1cf:	6a 01                	push   $0x1
 1d1:	53                   	push   %ebx
 1d2:	e8 21 ff ff ff       	call   f8 <test_and_set>
 1d7:	83 c4 10             	add    $0x10,%esp
 1da:	83 f8 01             	cmp    $0x1,%eax
 1dd:	74 ed                	je     1cc <lock_acquire+0xa>
    ;
}
 1df:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1e2:	c9                   	leave  
 1e3:	c3                   	ret    

000001e4 <lock_release>:

void lock_release(lock_t *lock) {
 1e4:	55                   	push   %ebp
 1e5:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 1e7:	8b 45 08             	mov    0x8(%ebp),%eax
 1ea:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 1f0:	5d                   	pop    %ebp
 1f1:	c3                   	ret    

000001f2 <lock_init>:

void lock_init(lock_t *lock) {
 1f2:	55                   	push   %ebp
 1f3:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 1f5:	8b 45 08             	mov    0x8(%ebp),%eax
 1f8:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 1fe:	5d                   	pop    %ebp
 1ff:	c3                   	ret    

00000200 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	56                   	push   %esi
 204:	53                   	push   %ebx
 205:	8b 75 08             	mov    0x8(%ebp),%esi
 208:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 20b:	89 f0                	mov    %esi,%eax
 20d:	89 d1                	mov    %edx,%ecx
 20f:	83 c2 01             	add    $0x1,%edx
 212:	89 c3                	mov    %eax,%ebx
 214:	83 c0 01             	add    $0x1,%eax
 217:	0f b6 09             	movzbl (%ecx),%ecx
 21a:	88 0b                	mov    %cl,(%ebx)
 21c:	84 c9                	test   %cl,%cl
 21e:	75 ed                	jne    20d <strcpy+0xd>
    ;
  return os;
}
 220:	89 f0                	mov    %esi,%eax
 222:	5b                   	pop    %ebx
 223:	5e                   	pop    %esi
 224:	5d                   	pop    %ebp
 225:	c3                   	ret    

00000226 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 226:	55                   	push   %ebp
 227:	89 e5                	mov    %esp,%ebp
 229:	8b 4d 08             	mov    0x8(%ebp),%ecx
 22c:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 22f:	eb 06                	jmp    237 <strcmp+0x11>
    p++, q++;
 231:	83 c1 01             	add    $0x1,%ecx
 234:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 237:	0f b6 01             	movzbl (%ecx),%eax
 23a:	84 c0                	test   %al,%al
 23c:	74 04                	je     242 <strcmp+0x1c>
 23e:	3a 02                	cmp    (%edx),%al
 240:	74 ef                	je     231 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 242:	0f b6 c0             	movzbl %al,%eax
 245:	0f b6 12             	movzbl (%edx),%edx
 248:	29 d0                	sub    %edx,%eax
}
 24a:	5d                   	pop    %ebp
 24b:	c3                   	ret    

0000024c <strlen>:

uint
strlen(const char *s)
{
 24c:	55                   	push   %ebp
 24d:	89 e5                	mov    %esp,%ebp
 24f:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 252:	b8 00 00 00 00       	mov    $0x0,%eax
 257:	eb 03                	jmp    25c <strlen+0x10>
 259:	83 c0 01             	add    $0x1,%eax
 25c:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 260:	75 f7                	jne    259 <strlen+0xd>
    ;
  return n;
}
 262:	5d                   	pop    %ebp
 263:	c3                   	ret    

00000264 <memset>:

void*
memset(void *dst, int c, uint n)
{
 264:	55                   	push   %ebp
 265:	89 e5                	mov    %esp,%ebp
 267:	57                   	push   %edi
 268:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 26b:	89 d7                	mov    %edx,%edi
 26d:	8b 4d 10             	mov    0x10(%ebp),%ecx
 270:	8b 45 0c             	mov    0xc(%ebp),%eax
 273:	fc                   	cld    
 274:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 276:	89 d0                	mov    %edx,%eax
 278:	8b 7d fc             	mov    -0x4(%ebp),%edi
 27b:	c9                   	leave  
 27c:	c3                   	ret    

0000027d <strchr>:

char*
strchr(const char *s, char c)
{
 27d:	55                   	push   %ebp
 27e:	89 e5                	mov    %esp,%ebp
 280:	8b 45 08             	mov    0x8(%ebp),%eax
 283:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 287:	eb 03                	jmp    28c <strchr+0xf>
 289:	83 c0 01             	add    $0x1,%eax
 28c:	0f b6 10             	movzbl (%eax),%edx
 28f:	84 d2                	test   %dl,%dl
 291:	74 06                	je     299 <strchr+0x1c>
    if(*s == c)
 293:	38 ca                	cmp    %cl,%dl
 295:	75 f2                	jne    289 <strchr+0xc>
 297:	eb 05                	jmp    29e <strchr+0x21>
      return (char*)s;
  return 0;
 299:	b8 00 00 00 00       	mov    $0x0,%eax
}
 29e:	5d                   	pop    %ebp
 29f:	c3                   	ret    

000002a0 <gets>:

char*
gets(char *buf, int max)
{
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	57                   	push   %edi
 2a4:	56                   	push   %esi
 2a5:	53                   	push   %ebx
 2a6:	83 ec 1c             	sub    $0x1c,%esp
 2a9:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2ac:	bb 00 00 00 00       	mov    $0x0,%ebx
 2b1:	89 de                	mov    %ebx,%esi
 2b3:	83 c3 01             	add    $0x1,%ebx
 2b6:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2b9:	7d 2e                	jge    2e9 <gets+0x49>
    cc = read(0, &c, 1);
 2bb:	83 ec 04             	sub    $0x4,%esp
 2be:	6a 01                	push   $0x1
 2c0:	8d 45 e7             	lea    -0x19(%ebp),%eax
 2c3:	50                   	push   %eax
 2c4:	6a 00                	push   $0x0
 2c6:	e8 ec 00 00 00       	call   3b7 <read>
    if(cc < 1)
 2cb:	83 c4 10             	add    $0x10,%esp
 2ce:	85 c0                	test   %eax,%eax
 2d0:	7e 17                	jle    2e9 <gets+0x49>
      break;
    buf[i++] = c;
 2d2:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2d6:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 2d9:	3c 0a                	cmp    $0xa,%al
 2db:	0f 94 c2             	sete   %dl
 2de:	3c 0d                	cmp    $0xd,%al
 2e0:	0f 94 c0             	sete   %al
 2e3:	08 c2                	or     %al,%dl
 2e5:	74 ca                	je     2b1 <gets+0x11>
    buf[i++] = c;
 2e7:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 2e9:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 2ed:	89 f8                	mov    %edi,%eax
 2ef:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2f2:	5b                   	pop    %ebx
 2f3:	5e                   	pop    %esi
 2f4:	5f                   	pop    %edi
 2f5:	5d                   	pop    %ebp
 2f6:	c3                   	ret    

000002f7 <stat>:

int
stat(const char *n, struct stat *st)
{
 2f7:	55                   	push   %ebp
 2f8:	89 e5                	mov    %esp,%ebp
 2fa:	56                   	push   %esi
 2fb:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2fc:	83 ec 08             	sub    $0x8,%esp
 2ff:	6a 00                	push   $0x0
 301:	ff 75 08             	push   0x8(%ebp)
 304:	e8 d6 00 00 00       	call   3df <open>
  if(fd < 0)
 309:	83 c4 10             	add    $0x10,%esp
 30c:	85 c0                	test   %eax,%eax
 30e:	78 24                	js     334 <stat+0x3d>
 310:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 312:	83 ec 08             	sub    $0x8,%esp
 315:	ff 75 0c             	push   0xc(%ebp)
 318:	50                   	push   %eax
 319:	e8 d9 00 00 00       	call   3f7 <fstat>
 31e:	89 c6                	mov    %eax,%esi
  close(fd);
 320:	89 1c 24             	mov    %ebx,(%esp)
 323:	e8 9f 00 00 00       	call   3c7 <close>
  return r;
 328:	83 c4 10             	add    $0x10,%esp
}
 32b:	89 f0                	mov    %esi,%eax
 32d:	8d 65 f8             	lea    -0x8(%ebp),%esp
 330:	5b                   	pop    %ebx
 331:	5e                   	pop    %esi
 332:	5d                   	pop    %ebp
 333:	c3                   	ret    
    return -1;
 334:	be ff ff ff ff       	mov    $0xffffffff,%esi
 339:	eb f0                	jmp    32b <stat+0x34>

0000033b <atoi>:

int
atoi(const char *s)
{
 33b:	55                   	push   %ebp
 33c:	89 e5                	mov    %esp,%ebp
 33e:	53                   	push   %ebx
 33f:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 342:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 347:	eb 10                	jmp    359 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 349:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 34c:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 34f:	83 c1 01             	add    $0x1,%ecx
 352:	0f be c0             	movsbl %al,%eax
 355:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 359:	0f b6 01             	movzbl (%ecx),%eax
 35c:	8d 58 d0             	lea    -0x30(%eax),%ebx
 35f:	80 fb 09             	cmp    $0x9,%bl
 362:	76 e5                	jbe    349 <atoi+0xe>
  return n;
}
 364:	89 d0                	mov    %edx,%eax
 366:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 369:	c9                   	leave  
 36a:	c3                   	ret    

0000036b <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 36b:	55                   	push   %ebp
 36c:	89 e5                	mov    %esp,%ebp
 36e:	56                   	push   %esi
 36f:	53                   	push   %ebx
 370:	8b 75 08             	mov    0x8(%ebp),%esi
 373:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 376:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 379:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 37b:	eb 0d                	jmp    38a <memmove+0x1f>
    *dst++ = *src++;
 37d:	0f b6 01             	movzbl (%ecx),%eax
 380:	88 02                	mov    %al,(%edx)
 382:	8d 49 01             	lea    0x1(%ecx),%ecx
 385:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 388:	89 d8                	mov    %ebx,%eax
 38a:	8d 58 ff             	lea    -0x1(%eax),%ebx
 38d:	85 c0                	test   %eax,%eax
 38f:	7f ec                	jg     37d <memmove+0x12>
  return vdst;
}
 391:	89 f0                	mov    %esi,%eax
 393:	5b                   	pop    %ebx
 394:	5e                   	pop    %esi
 395:	5d                   	pop    %ebp
 396:	c3                   	ret    

00000397 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 397:	b8 01 00 00 00       	mov    $0x1,%eax
 39c:	cd 40                	int    $0x40
 39e:	c3                   	ret    

0000039f <exit>:
SYSCALL(exit)
 39f:	b8 02 00 00 00       	mov    $0x2,%eax
 3a4:	cd 40                	int    $0x40
 3a6:	c3                   	ret    

000003a7 <wait>:
SYSCALL(wait)
 3a7:	b8 03 00 00 00       	mov    $0x3,%eax
 3ac:	cd 40                	int    $0x40
 3ae:	c3                   	ret    

000003af <pipe>:
SYSCALL(pipe)
 3af:	b8 04 00 00 00       	mov    $0x4,%eax
 3b4:	cd 40                	int    $0x40
 3b6:	c3                   	ret    

000003b7 <read>:
SYSCALL(read)
 3b7:	b8 05 00 00 00       	mov    $0x5,%eax
 3bc:	cd 40                	int    $0x40
 3be:	c3                   	ret    

000003bf <write>:
SYSCALL(write)
 3bf:	b8 10 00 00 00       	mov    $0x10,%eax
 3c4:	cd 40                	int    $0x40
 3c6:	c3                   	ret    

000003c7 <close>:
SYSCALL(close)
 3c7:	b8 15 00 00 00       	mov    $0x15,%eax
 3cc:	cd 40                	int    $0x40
 3ce:	c3                   	ret    

000003cf <kill>:
SYSCALL(kill)
 3cf:	b8 06 00 00 00       	mov    $0x6,%eax
 3d4:	cd 40                	int    $0x40
 3d6:	c3                   	ret    

000003d7 <exec>:
SYSCALL(exec)
 3d7:	b8 07 00 00 00       	mov    $0x7,%eax
 3dc:	cd 40                	int    $0x40
 3de:	c3                   	ret    

000003df <open>:
SYSCALL(open)
 3df:	b8 0f 00 00 00       	mov    $0xf,%eax
 3e4:	cd 40                	int    $0x40
 3e6:	c3                   	ret    

000003e7 <mknod>:
SYSCALL(mknod)
 3e7:	b8 11 00 00 00       	mov    $0x11,%eax
 3ec:	cd 40                	int    $0x40
 3ee:	c3                   	ret    

000003ef <unlink>:
SYSCALL(unlink)
 3ef:	b8 12 00 00 00       	mov    $0x12,%eax
 3f4:	cd 40                	int    $0x40
 3f6:	c3                   	ret    

000003f7 <fstat>:
SYSCALL(fstat)
 3f7:	b8 08 00 00 00       	mov    $0x8,%eax
 3fc:	cd 40                	int    $0x40
 3fe:	c3                   	ret    

000003ff <link>:
SYSCALL(link)
 3ff:	b8 13 00 00 00       	mov    $0x13,%eax
 404:	cd 40                	int    $0x40
 406:	c3                   	ret    

00000407 <mkdir>:
SYSCALL(mkdir)
 407:	b8 14 00 00 00       	mov    $0x14,%eax
 40c:	cd 40                	int    $0x40
 40e:	c3                   	ret    

0000040f <chdir>:
SYSCALL(chdir)
 40f:	b8 09 00 00 00       	mov    $0x9,%eax
 414:	cd 40                	int    $0x40
 416:	c3                   	ret    

00000417 <dup>:
SYSCALL(dup)
 417:	b8 0a 00 00 00       	mov    $0xa,%eax
 41c:	cd 40                	int    $0x40
 41e:	c3                   	ret    

0000041f <getpid>:
SYSCALL(getpid)
 41f:	b8 0b 00 00 00       	mov    $0xb,%eax
 424:	cd 40                	int    $0x40
 426:	c3                   	ret    

00000427 <sbrk>:
SYSCALL(sbrk)
 427:	b8 0c 00 00 00       	mov    $0xc,%eax
 42c:	cd 40                	int    $0x40
 42e:	c3                   	ret    

0000042f <sleep>:
SYSCALL(sleep)
 42f:	b8 0d 00 00 00       	mov    $0xd,%eax
 434:	cd 40                	int    $0x40
 436:	c3                   	ret    

00000437 <uptime>:
SYSCALL(uptime)
 437:	b8 0e 00 00 00       	mov    $0xe,%eax
 43c:	cd 40                	int    $0x40
 43e:	c3                   	ret    

0000043f <clone>:
SYSCALL(clone)
 43f:	b8 16 00 00 00       	mov    $0x16,%eax
 444:	cd 40                	int    $0x40
 446:	c3                   	ret    

00000447 <join>:
 447:	b8 17 00 00 00       	mov    $0x17,%eax
 44c:	cd 40                	int    $0x40
 44e:	c3                   	ret    

0000044f <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 44f:	55                   	push   %ebp
 450:	89 e5                	mov    %esp,%ebp
 452:	83 ec 1c             	sub    $0x1c,%esp
 455:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 458:	6a 01                	push   $0x1
 45a:	8d 55 f4             	lea    -0xc(%ebp),%edx
 45d:	52                   	push   %edx
 45e:	50                   	push   %eax
 45f:	e8 5b ff ff ff       	call   3bf <write>
}
 464:	83 c4 10             	add    $0x10,%esp
 467:	c9                   	leave  
 468:	c3                   	ret    

00000469 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 469:	55                   	push   %ebp
 46a:	89 e5                	mov    %esp,%ebp
 46c:	57                   	push   %edi
 46d:	56                   	push   %esi
 46e:	53                   	push   %ebx
 46f:	83 ec 2c             	sub    $0x2c,%esp
 472:	89 45 d0             	mov    %eax,-0x30(%ebp)
 475:	89 d0                	mov    %edx,%eax
 477:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 479:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 47d:	0f 95 c1             	setne  %cl
 480:	c1 ea 1f             	shr    $0x1f,%edx
 483:	84 d1                	test   %dl,%cl
 485:	74 44                	je     4cb <printint+0x62>
    neg = 1;
    x = -xx;
 487:	f7 d8                	neg    %eax
 489:	89 c1                	mov    %eax,%ecx
    neg = 1;
 48b:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 492:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 497:	89 c8                	mov    %ecx,%eax
 499:	ba 00 00 00 00       	mov    $0x0,%edx
 49e:	f7 f6                	div    %esi
 4a0:	89 df                	mov    %ebx,%edi
 4a2:	83 c3 01             	add    $0x1,%ebx
 4a5:	0f b6 92 3c 08 00 00 	movzbl 0x83c(%edx),%edx
 4ac:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 4b0:	89 ca                	mov    %ecx,%edx
 4b2:	89 c1                	mov    %eax,%ecx
 4b4:	39 d6                	cmp    %edx,%esi
 4b6:	76 df                	jbe    497 <printint+0x2e>
  if(neg)
 4b8:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 4bc:	74 31                	je     4ef <printint+0x86>
    buf[i++] = '-';
 4be:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 4c3:	8d 5f 02             	lea    0x2(%edi),%ebx
 4c6:	8b 75 d0             	mov    -0x30(%ebp),%esi
 4c9:	eb 17                	jmp    4e2 <printint+0x79>
    x = xx;
 4cb:	89 c1                	mov    %eax,%ecx
  neg = 0;
 4cd:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 4d4:	eb bc                	jmp    492 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 4d6:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 4db:	89 f0                	mov    %esi,%eax
 4dd:	e8 6d ff ff ff       	call   44f <putc>
  while(--i >= 0)
 4e2:	83 eb 01             	sub    $0x1,%ebx
 4e5:	79 ef                	jns    4d6 <printint+0x6d>
}
 4e7:	83 c4 2c             	add    $0x2c,%esp
 4ea:	5b                   	pop    %ebx
 4eb:	5e                   	pop    %esi
 4ec:	5f                   	pop    %edi
 4ed:	5d                   	pop    %ebp
 4ee:	c3                   	ret    
 4ef:	8b 75 d0             	mov    -0x30(%ebp),%esi
 4f2:	eb ee                	jmp    4e2 <printint+0x79>

000004f4 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 4f4:	55                   	push   %ebp
 4f5:	89 e5                	mov    %esp,%ebp
 4f7:	57                   	push   %edi
 4f8:	56                   	push   %esi
 4f9:	53                   	push   %ebx
 4fa:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 4fd:	8d 45 10             	lea    0x10(%ebp),%eax
 500:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 503:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 508:	bb 00 00 00 00       	mov    $0x0,%ebx
 50d:	eb 14                	jmp    523 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 50f:	89 fa                	mov    %edi,%edx
 511:	8b 45 08             	mov    0x8(%ebp),%eax
 514:	e8 36 ff ff ff       	call   44f <putc>
 519:	eb 05                	jmp    520 <printf+0x2c>
      }
    } else if(state == '%'){
 51b:	83 fe 25             	cmp    $0x25,%esi
 51e:	74 25                	je     545 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 520:	83 c3 01             	add    $0x1,%ebx
 523:	8b 45 0c             	mov    0xc(%ebp),%eax
 526:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 52a:	84 c0                	test   %al,%al
 52c:	0f 84 20 01 00 00    	je     652 <printf+0x15e>
    c = fmt[i] & 0xff;
 532:	0f be f8             	movsbl %al,%edi
 535:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 538:	85 f6                	test   %esi,%esi
 53a:	75 df                	jne    51b <printf+0x27>
      if(c == '%'){
 53c:	83 f8 25             	cmp    $0x25,%eax
 53f:	75 ce                	jne    50f <printf+0x1b>
        state = '%';
 541:	89 c6                	mov    %eax,%esi
 543:	eb db                	jmp    520 <printf+0x2c>
      if(c == 'd'){
 545:	83 f8 25             	cmp    $0x25,%eax
 548:	0f 84 cf 00 00 00    	je     61d <printf+0x129>
 54e:	0f 8c dd 00 00 00    	jl     631 <printf+0x13d>
 554:	83 f8 78             	cmp    $0x78,%eax
 557:	0f 8f d4 00 00 00    	jg     631 <printf+0x13d>
 55d:	83 f8 63             	cmp    $0x63,%eax
 560:	0f 8c cb 00 00 00    	jl     631 <printf+0x13d>
 566:	83 e8 63             	sub    $0x63,%eax
 569:	83 f8 15             	cmp    $0x15,%eax
 56c:	0f 87 bf 00 00 00    	ja     631 <printf+0x13d>
 572:	ff 24 85 e4 07 00 00 	jmp    *0x7e4(,%eax,4)
        printint(fd, *ap, 10, 1);
 579:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 57c:	8b 17                	mov    (%edi),%edx
 57e:	83 ec 0c             	sub    $0xc,%esp
 581:	6a 01                	push   $0x1
 583:	b9 0a 00 00 00       	mov    $0xa,%ecx
 588:	8b 45 08             	mov    0x8(%ebp),%eax
 58b:	e8 d9 fe ff ff       	call   469 <printint>
        ap++;
 590:	83 c7 04             	add    $0x4,%edi
 593:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 596:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 599:	be 00 00 00 00       	mov    $0x0,%esi
 59e:	eb 80                	jmp    520 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 5a0:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5a3:	8b 17                	mov    (%edi),%edx
 5a5:	83 ec 0c             	sub    $0xc,%esp
 5a8:	6a 00                	push   $0x0
 5aa:	b9 10 00 00 00       	mov    $0x10,%ecx
 5af:	8b 45 08             	mov    0x8(%ebp),%eax
 5b2:	e8 b2 fe ff ff       	call   469 <printint>
        ap++;
 5b7:	83 c7 04             	add    $0x4,%edi
 5ba:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 5bd:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5c0:	be 00 00 00 00       	mov    $0x0,%esi
 5c5:	e9 56 ff ff ff       	jmp    520 <printf+0x2c>
        s = (char*)*ap;
 5ca:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5cd:	8b 30                	mov    (%eax),%esi
        ap++;
 5cf:	83 c0 04             	add    $0x4,%eax
 5d2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 5d5:	85 f6                	test   %esi,%esi
 5d7:	75 15                	jne    5ee <printf+0xfa>
          s = "(null)";
 5d9:	be dc 07 00 00       	mov    $0x7dc,%esi
 5de:	eb 0e                	jmp    5ee <printf+0xfa>
          putc(fd, *s);
 5e0:	0f be d2             	movsbl %dl,%edx
 5e3:	8b 45 08             	mov    0x8(%ebp),%eax
 5e6:	e8 64 fe ff ff       	call   44f <putc>
          s++;
 5eb:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 5ee:	0f b6 16             	movzbl (%esi),%edx
 5f1:	84 d2                	test   %dl,%dl
 5f3:	75 eb                	jne    5e0 <printf+0xec>
      state = 0;
 5f5:	be 00 00 00 00       	mov    $0x0,%esi
 5fa:	e9 21 ff ff ff       	jmp    520 <printf+0x2c>
        putc(fd, *ap);
 5ff:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 602:	0f be 17             	movsbl (%edi),%edx
 605:	8b 45 08             	mov    0x8(%ebp),%eax
 608:	e8 42 fe ff ff       	call   44f <putc>
        ap++;
 60d:	83 c7 04             	add    $0x4,%edi
 610:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 613:	be 00 00 00 00       	mov    $0x0,%esi
 618:	e9 03 ff ff ff       	jmp    520 <printf+0x2c>
        putc(fd, c);
 61d:	89 fa                	mov    %edi,%edx
 61f:	8b 45 08             	mov    0x8(%ebp),%eax
 622:	e8 28 fe ff ff       	call   44f <putc>
      state = 0;
 627:	be 00 00 00 00       	mov    $0x0,%esi
 62c:	e9 ef fe ff ff       	jmp    520 <printf+0x2c>
        putc(fd, '%');
 631:	ba 25 00 00 00       	mov    $0x25,%edx
 636:	8b 45 08             	mov    0x8(%ebp),%eax
 639:	e8 11 fe ff ff       	call   44f <putc>
        putc(fd, c);
 63e:	89 fa                	mov    %edi,%edx
 640:	8b 45 08             	mov    0x8(%ebp),%eax
 643:	e8 07 fe ff ff       	call   44f <putc>
      state = 0;
 648:	be 00 00 00 00       	mov    $0x0,%esi
 64d:	e9 ce fe ff ff       	jmp    520 <printf+0x2c>
    }
  }
}
 652:	8d 65 f4             	lea    -0xc(%ebp),%esp
 655:	5b                   	pop    %ebx
 656:	5e                   	pop    %esi
 657:	5f                   	pop    %edi
 658:	5d                   	pop    %ebp
 659:	c3                   	ret    

0000065a <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 65a:	55                   	push   %ebp
 65b:	89 e5                	mov    %esp,%ebp
 65d:	57                   	push   %edi
 65e:	56                   	push   %esi
 65f:	53                   	push   %ebx
 660:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 663:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 666:	a1 00 0f 00 00       	mov    0xf00,%eax
 66b:	eb 02                	jmp    66f <free+0x15>
 66d:	89 d0                	mov    %edx,%eax
 66f:	39 c8                	cmp    %ecx,%eax
 671:	73 04                	jae    677 <free+0x1d>
 673:	39 08                	cmp    %ecx,(%eax)
 675:	77 12                	ja     689 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 677:	8b 10                	mov    (%eax),%edx
 679:	39 c2                	cmp    %eax,%edx
 67b:	77 f0                	ja     66d <free+0x13>
 67d:	39 c8                	cmp    %ecx,%eax
 67f:	72 08                	jb     689 <free+0x2f>
 681:	39 ca                	cmp    %ecx,%edx
 683:	77 04                	ja     689 <free+0x2f>
 685:	89 d0                	mov    %edx,%eax
 687:	eb e6                	jmp    66f <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 689:	8b 73 fc             	mov    -0x4(%ebx),%esi
 68c:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 68f:	8b 10                	mov    (%eax),%edx
 691:	39 d7                	cmp    %edx,%edi
 693:	74 19                	je     6ae <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 695:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 698:	8b 50 04             	mov    0x4(%eax),%edx
 69b:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 69e:	39 ce                	cmp    %ecx,%esi
 6a0:	74 1b                	je     6bd <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 6a2:	89 08                	mov    %ecx,(%eax)
  freep = p;
 6a4:	a3 00 0f 00 00       	mov    %eax,0xf00
}
 6a9:	5b                   	pop    %ebx
 6aa:	5e                   	pop    %esi
 6ab:	5f                   	pop    %edi
 6ac:	5d                   	pop    %ebp
 6ad:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 6ae:	03 72 04             	add    0x4(%edx),%esi
 6b1:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 6b4:	8b 10                	mov    (%eax),%edx
 6b6:	8b 12                	mov    (%edx),%edx
 6b8:	89 53 f8             	mov    %edx,-0x8(%ebx)
 6bb:	eb db                	jmp    698 <free+0x3e>
    p->s.size += bp->s.size;
 6bd:	03 53 fc             	add    -0x4(%ebx),%edx
 6c0:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6c3:	8b 53 f8             	mov    -0x8(%ebx),%edx
 6c6:	89 10                	mov    %edx,(%eax)
 6c8:	eb da                	jmp    6a4 <free+0x4a>

000006ca <morecore>:

static Header*
morecore(uint nu)
{
 6ca:	55                   	push   %ebp
 6cb:	89 e5                	mov    %esp,%ebp
 6cd:	53                   	push   %ebx
 6ce:	83 ec 04             	sub    $0x4,%esp
 6d1:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 6d3:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 6d8:	77 05                	ja     6df <morecore+0x15>
    nu = 4096;
 6da:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 6df:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 6e6:	83 ec 0c             	sub    $0xc,%esp
 6e9:	50                   	push   %eax
 6ea:	e8 38 fd ff ff       	call   427 <sbrk>
  if(p == (char*)-1)
 6ef:	83 c4 10             	add    $0x10,%esp
 6f2:	83 f8 ff             	cmp    $0xffffffff,%eax
 6f5:	74 1c                	je     713 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 6f7:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 6fa:	83 c0 08             	add    $0x8,%eax
 6fd:	83 ec 0c             	sub    $0xc,%esp
 700:	50                   	push   %eax
 701:	e8 54 ff ff ff       	call   65a <free>
  return freep;
 706:	a1 00 0f 00 00       	mov    0xf00,%eax
 70b:	83 c4 10             	add    $0x10,%esp
}
 70e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 711:	c9                   	leave  
 712:	c3                   	ret    
    return 0;
 713:	b8 00 00 00 00       	mov    $0x0,%eax
 718:	eb f4                	jmp    70e <morecore+0x44>

0000071a <malloc>:

void*
malloc(uint nbytes)
{
 71a:	55                   	push   %ebp
 71b:	89 e5                	mov    %esp,%ebp
 71d:	53                   	push   %ebx
 71e:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 721:	8b 45 08             	mov    0x8(%ebp),%eax
 724:	8d 58 07             	lea    0x7(%eax),%ebx
 727:	c1 eb 03             	shr    $0x3,%ebx
 72a:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 72d:	8b 0d 00 0f 00 00    	mov    0xf00,%ecx
 733:	85 c9                	test   %ecx,%ecx
 735:	74 04                	je     73b <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 737:	8b 01                	mov    (%ecx),%eax
 739:	eb 4a                	jmp    785 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 73b:	c7 05 00 0f 00 00 04 	movl   $0xf04,0xf00
 742:	0f 00 00 
 745:	c7 05 04 0f 00 00 04 	movl   $0xf04,0xf04
 74c:	0f 00 00 
    base.s.size = 0;
 74f:	c7 05 08 0f 00 00 00 	movl   $0x0,0xf08
 756:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 759:	b9 04 0f 00 00       	mov    $0xf04,%ecx
 75e:	eb d7                	jmp    737 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 760:	74 19                	je     77b <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 762:	29 da                	sub    %ebx,%edx
 764:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 767:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 76a:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 76d:	89 0d 00 0f 00 00    	mov    %ecx,0xf00
      return (void*)(p + 1);
 773:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 776:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 779:	c9                   	leave  
 77a:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 77b:	8b 10                	mov    (%eax),%edx
 77d:	89 11                	mov    %edx,(%ecx)
 77f:	eb ec                	jmp    76d <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 781:	89 c1                	mov    %eax,%ecx
 783:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 785:	8b 50 04             	mov    0x4(%eax),%edx
 788:	39 da                	cmp    %ebx,%edx
 78a:	73 d4                	jae    760 <malloc+0x46>
    if(p == freep)
 78c:	39 05 00 0f 00 00    	cmp    %eax,0xf00
 792:	75 ed                	jne    781 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 794:	89 d8                	mov    %ebx,%eax
 796:	e8 2f ff ff ff       	call   6ca <morecore>
 79b:	85 c0                	test   %eax,%eax
 79d:	75 e2                	jne    781 <malloc+0x67>
 79f:	eb d5                	jmp    776 <malloc+0x5c>
