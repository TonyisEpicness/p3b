
_wc:     file format elf32-i386


Disassembly of section .text:

00000000 <wc>:

char buf[512];

void
wc(int fd, char *name)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	57                   	push   %edi
   4:	56                   	push   %esi
   5:	53                   	push   %ebx
   6:	83 ec 1c             	sub    $0x1c,%esp
  int i, n;
  int l, w, c, inword;

  l = w = c = 0;
  inword = 0;
   9:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  l = w = c = 0;
  10:	be 00 00 00 00       	mov    $0x0,%esi
  15:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  1c:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  while((n = read(fd, buf, sizeof(buf))) > 0){
  23:	83 ec 04             	sub    $0x4,%esp
  26:	68 00 02 00 00       	push   $0x200
  2b:	68 60 0c 00 00       	push   $0xc60
  30:	ff 75 08             	push   0x8(%ebp)
  33:	e8 e1 03 00 00       	call   419 <read>
  38:	89 c7                	mov    %eax,%edi
  3a:	83 c4 10             	add    $0x10,%esp
  3d:	85 c0                	test   %eax,%eax
  3f:	7e 54                	jle    95 <wc+0x95>
    for(i=0; i<n; i++){
  41:	bb 00 00 00 00       	mov    $0x0,%ebx
  46:	eb 22                	jmp    6a <wc+0x6a>
      c++;
      if(buf[i] == '\n')
        l++;
      if(strchr(" \r\t\n\v", buf[i]))
  48:	83 ec 08             	sub    $0x8,%esp
  4b:	0f be c0             	movsbl %al,%eax
  4e:	50                   	push   %eax
  4f:	68 04 08 00 00       	push   $0x804
  54:	e8 86 02 00 00       	call   2df <strchr>
  59:	83 c4 10             	add    $0x10,%esp
  5c:	85 c0                	test   %eax,%eax
  5e:	74 22                	je     82 <wc+0x82>
        inword = 0;
  60:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    for(i=0; i<n; i++){
  67:	83 c3 01             	add    $0x1,%ebx
  6a:	39 fb                	cmp    %edi,%ebx
  6c:	7d b5                	jge    23 <wc+0x23>
      c++;
  6e:	83 c6 01             	add    $0x1,%esi
      if(buf[i] == '\n')
  71:	0f b6 83 60 0c 00 00 	movzbl 0xc60(%ebx),%eax
  78:	3c 0a                	cmp    $0xa,%al
  7a:	75 cc                	jne    48 <wc+0x48>
        l++;
  7c:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
  80:	eb c6                	jmp    48 <wc+0x48>
      else if(!inword){
  82:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  86:	75 df                	jne    67 <wc+0x67>
        w++;
  88:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
        inword = 1;
  8c:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
  93:	eb d2                	jmp    67 <wc+0x67>
      }
    }
  }
  if(n < 0){
  95:	78 24                	js     bb <wc+0xbb>
    printf(1, "wc: read error\n");
    exit();
  }
  printf(1, "%d %d %d %s\n", l, w, c, name);
  97:	83 ec 08             	sub    $0x8,%esp
  9a:	ff 75 0c             	push   0xc(%ebp)
  9d:	56                   	push   %esi
  9e:	ff 75 dc             	push   -0x24(%ebp)
  a1:	ff 75 e0             	push   -0x20(%ebp)
  a4:	68 1a 08 00 00       	push   $0x81a
  a9:	6a 01                	push   $0x1
  ab:	e8 a6 04 00 00       	call   556 <printf>
}
  b0:	83 c4 20             	add    $0x20,%esp
  b3:	8d 65 f4             	lea    -0xc(%ebp),%esp
  b6:	5b                   	pop    %ebx
  b7:	5e                   	pop    %esi
  b8:	5f                   	pop    %edi
  b9:	5d                   	pop    %ebp
  ba:	c3                   	ret    
    printf(1, "wc: read error\n");
  bb:	83 ec 08             	sub    $0x8,%esp
  be:	68 0a 08 00 00       	push   $0x80a
  c3:	6a 01                	push   $0x1
  c5:	e8 8c 04 00 00       	call   556 <printf>
    exit();
  ca:	e8 32 03 00 00       	call   401 <exit>

000000cf <main>:

int
main(int argc, char *argv[])
{
  cf:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  d3:	83 e4 f0             	and    $0xfffffff0,%esp
  d6:	ff 71 fc             	push   -0x4(%ecx)
  d9:	55                   	push   %ebp
  da:	89 e5                	mov    %esp,%ebp
  dc:	57                   	push   %edi
  dd:	56                   	push   %esi
  de:	53                   	push   %ebx
  df:	51                   	push   %ecx
  e0:	83 ec 18             	sub    $0x18,%esp
  e3:	8b 01                	mov    (%ecx),%eax
  e5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  e8:	8b 51 04             	mov    0x4(%ecx),%edx
  eb:	89 55 e0             	mov    %edx,-0x20(%ebp)
  int fd, i;

  if(argc <= 1){
  ee:	83 f8 01             	cmp    $0x1,%eax
  f1:	7e 07                	jle    fa <main+0x2b>
    wc(0, "");
    exit();
  }

  for(i = 1; i < argc; i++){
  f3:	be 01 00 00 00       	mov    $0x1,%esi
  f8:	eb 2d                	jmp    127 <main+0x58>
    wc(0, "");
  fa:	83 ec 08             	sub    $0x8,%esp
  fd:	68 19 08 00 00       	push   $0x819
 102:	6a 00                	push   $0x0
 104:	e8 f7 fe ff ff       	call   0 <wc>
    exit();
 109:	e8 f3 02 00 00       	call   401 <exit>
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "wc: cannot open %s\n", argv[i]);
      exit();
    }
    wc(fd, argv[i]);
 10e:	83 ec 08             	sub    $0x8,%esp
 111:	ff 37                	push   (%edi)
 113:	50                   	push   %eax
 114:	e8 e7 fe ff ff       	call   0 <wc>
    close(fd);
 119:	89 1c 24             	mov    %ebx,(%esp)
 11c:	e8 08 03 00 00       	call   429 <close>
  for(i = 1; i < argc; i++){
 121:	83 c6 01             	add    $0x1,%esi
 124:	83 c4 10             	add    $0x10,%esp
 127:	3b 75 e4             	cmp    -0x1c(%ebp),%esi
 12a:	7d 31                	jge    15d <main+0x8e>
    if((fd = open(argv[i], 0)) < 0){
 12c:	8b 45 e0             	mov    -0x20(%ebp),%eax
 12f:	8d 3c b0             	lea    (%eax,%esi,4),%edi
 132:	83 ec 08             	sub    $0x8,%esp
 135:	6a 00                	push   $0x0
 137:	ff 37                	push   (%edi)
 139:	e8 03 03 00 00       	call   441 <open>
 13e:	89 c3                	mov    %eax,%ebx
 140:	83 c4 10             	add    $0x10,%esp
 143:	85 c0                	test   %eax,%eax
 145:	79 c7                	jns    10e <main+0x3f>
      printf(1, "wc: cannot open %s\n", argv[i]);
 147:	83 ec 04             	sub    $0x4,%esp
 14a:	ff 37                	push   (%edi)
 14c:	68 27 08 00 00       	push   $0x827
 151:	6a 01                	push   $0x1
 153:	e8 fe 03 00 00       	call   556 <printf>
      exit();
 158:	e8 a4 02 00 00       	call   401 <exit>
  }
  exit();
 15d:	e8 9f 02 00 00       	call   401 <exit>

00000162 <test_and_set>:
  int flag;
};

struct thread_ref *threads[64];

int test_and_set(int *old_ptr, int new_ptr) {
 162:	55                   	push   %ebp
 163:	89 e5                	mov    %esp,%ebp
 165:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *old_ptr;
 168:	8b 10                	mov    (%eax),%edx
  *old_ptr = new_ptr;
 16a:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 16d:	89 08                	mov    %ecx,(%eax)
  return old;
}
 16f:	89 d0                	mov    %edx,%eax
 171:	5d                   	pop    %ebp
 172:	c3                   	ret    

00000173 <thread_create>:

// a wrapper func for clone
int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 173:	55                   	push   %ebp
 174:	89 e5                	mov    %esp,%ebp
 176:	53                   	push   %ebx
 177:	83 ec 10             	sub    $0x10,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE*2);
 17a:	68 00 20 00 00       	push   $0x2000
 17f:	e8 f8 05 00 00       	call   77c <malloc>
  if(n_stack == 0){
 184:	83 c4 10             	add    $0x10,%esp
 187:	85 c0                	test   %eax,%eax
 189:	74 41                	je     1cc <thread_create+0x59>
 18b:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  int new_pid = clone(start_routine, arg1, arg2, n_stack);
 18d:	50                   	push   %eax
 18e:	ff 75 10             	push   0x10(%ebp)
 191:	ff 75 0c             	push   0xc(%ebp)
 194:	ff 75 08             	push   0x8(%ebp)
 197:	e8 05 03 00 00       	call   4a1 <clone>

  for(int i=0; i<64; i++){
 19c:	83 c4 10             	add    $0x10,%esp
 19f:	ba 00 00 00 00       	mov    $0x0,%edx
 1a4:	eb 03                	jmp    1a9 <thread_create+0x36>
 1a6:	83 c2 01             	add    $0x1,%edx
 1a9:	83 fa 3f             	cmp    $0x3f,%edx
 1ac:	7f 19                	jg     1c7 <thread_create+0x54>
    if(threads[i]->flag==0){
 1ae:	8b 0c 95 60 0e 00 00 	mov    0xe60(,%edx,4),%ecx
 1b5:	83 79 08 00          	cmpl   $0x0,0x8(%ecx)
 1b9:	75 eb                	jne    1a6 <thread_create+0x33>
      threads[i]->maddr = n_stack;
 1bb:	89 19                	mov    %ebx,(%ecx)
      threads[i]->pg1addr = n_stack;
 1bd:	8b 14 95 60 0e 00 00 	mov    0xe60(,%edx,4),%edx
 1c4:	89 5a 04             	mov    %ebx,0x4(%edx)
      break;
    }
  }

  return new_pid;
}
 1c7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1ca:	c9                   	leave  
 1cb:	c3                   	ret    
    return -1;
 1cc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 1d1:	eb f4                	jmp    1c7 <thread_create+0x54>

000001d3 <thread_join>:

//TODO: fix
int thread_join() {
 1d3:	55                   	push   %ebp
 1d4:	89 e5                	mov    %esp,%ebp
 1d6:	56                   	push   %esi
 1d7:	53                   	push   %ebx
 1d8:	83 ec 1c             	sub    $0x1c,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 1db:	8d 45 f4             	lea    -0xc(%ebp),%eax
 1de:	50                   	push   %eax
 1df:	e8 c5 02 00 00       	call   4a9 <join>
 1e4:	89 c6                	mov    %eax,%esi
  for(int i=0; i<64; i++){
 1e6:	83 c4 10             	add    $0x10,%esp
 1e9:	bb 00 00 00 00       	mov    $0x0,%ebx
 1ee:	eb 03                	jmp    1f3 <thread_join+0x20>
 1f0:	83 c3 01             	add    $0x1,%ebx
 1f3:	83 fb 3f             	cmp    $0x3f,%ebx
 1f6:	7f 23                	jg     21b <thread_join+0x48>
    if((threads[i]->flag==1) && (stk_addr == threads[i]->pg1addr)){
 1f8:	8b 04 9d 60 0e 00 00 	mov    0xe60(,%ebx,4),%eax
 1ff:	83 78 08 01          	cmpl   $0x1,0x8(%eax)
 203:	75 eb                	jne    1f0 <thread_join+0x1d>
 205:	8b 55 f4             	mov    -0xc(%ebp),%edx
 208:	39 50 04             	cmp    %edx,0x4(%eax)
 20b:	75 e3                	jne    1f0 <thread_join+0x1d>
      free(stk_addr);
 20d:	83 ec 0c             	sub    $0xc,%esp
 210:	52                   	push   %edx
 211:	e8 a6 04 00 00       	call   6bc <free>
 216:	83 c4 10             	add    $0x10,%esp
 219:	eb d5                	jmp    1f0 <thread_join+0x1d>
    }
  }
  return pid;
}
 21b:	89 f0                	mov    %esi,%eax
 21d:	8d 65 f8             	lea    -0x8(%ebp),%esp
 220:	5b                   	pop    %ebx
 221:	5e                   	pop    %esi
 222:	5d                   	pop    %ebp
 223:	c3                   	ret    

00000224 <lock_acquire>:

void lock_acquire(lock_t *lock){
 224:	55                   	push   %ebp
 225:	89 e5                	mov    %esp,%ebp
 227:	53                   	push   %ebx
 228:	83 ec 04             	sub    $0x4,%esp
 22b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 22e:	83 ec 08             	sub    $0x8,%esp
 231:	6a 01                	push   $0x1
 233:	53                   	push   %ebx
 234:	e8 29 ff ff ff       	call   162 <test_and_set>
 239:	83 c4 10             	add    $0x10,%esp
 23c:	83 f8 01             	cmp    $0x1,%eax
 23f:	74 ed                	je     22e <lock_acquire+0xa>
    ;
}
 241:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 244:	c9                   	leave  
 245:	c3                   	ret    

00000246 <lock_release>:

void lock_release(lock_t *lock) {
 246:	55                   	push   %ebp
 247:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 249:	8b 45 08             	mov    0x8(%ebp),%eax
 24c:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 252:	5d                   	pop    %ebp
 253:	c3                   	ret    

00000254 <lock_init>:

void lock_init(lock_t *lock) {
 254:	55                   	push   %ebp
 255:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 257:	8b 45 08             	mov    0x8(%ebp),%eax
 25a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 260:	5d                   	pop    %ebp
 261:	c3                   	ret    

00000262 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 262:	55                   	push   %ebp
 263:	89 e5                	mov    %esp,%ebp
 265:	56                   	push   %esi
 266:	53                   	push   %ebx
 267:	8b 75 08             	mov    0x8(%ebp),%esi
 26a:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 26d:	89 f0                	mov    %esi,%eax
 26f:	89 d1                	mov    %edx,%ecx
 271:	83 c2 01             	add    $0x1,%edx
 274:	89 c3                	mov    %eax,%ebx
 276:	83 c0 01             	add    $0x1,%eax
 279:	0f b6 09             	movzbl (%ecx),%ecx
 27c:	88 0b                	mov    %cl,(%ebx)
 27e:	84 c9                	test   %cl,%cl
 280:	75 ed                	jne    26f <strcpy+0xd>
    ;
  return os;
}
 282:	89 f0                	mov    %esi,%eax
 284:	5b                   	pop    %ebx
 285:	5e                   	pop    %esi
 286:	5d                   	pop    %ebp
 287:	c3                   	ret    

00000288 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 288:	55                   	push   %ebp
 289:	89 e5                	mov    %esp,%ebp
 28b:	8b 4d 08             	mov    0x8(%ebp),%ecx
 28e:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 291:	eb 06                	jmp    299 <strcmp+0x11>
    p++, q++;
 293:	83 c1 01             	add    $0x1,%ecx
 296:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 299:	0f b6 01             	movzbl (%ecx),%eax
 29c:	84 c0                	test   %al,%al
 29e:	74 04                	je     2a4 <strcmp+0x1c>
 2a0:	3a 02                	cmp    (%edx),%al
 2a2:	74 ef                	je     293 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 2a4:	0f b6 c0             	movzbl %al,%eax
 2a7:	0f b6 12             	movzbl (%edx),%edx
 2aa:	29 d0                	sub    %edx,%eax
}
 2ac:	5d                   	pop    %ebp
 2ad:	c3                   	ret    

000002ae <strlen>:

uint
strlen(const char *s)
{
 2ae:	55                   	push   %ebp
 2af:	89 e5                	mov    %esp,%ebp
 2b1:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 2b4:	b8 00 00 00 00       	mov    $0x0,%eax
 2b9:	eb 03                	jmp    2be <strlen+0x10>
 2bb:	83 c0 01             	add    $0x1,%eax
 2be:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 2c2:	75 f7                	jne    2bb <strlen+0xd>
    ;
  return n;
}
 2c4:	5d                   	pop    %ebp
 2c5:	c3                   	ret    

000002c6 <memset>:

void*
memset(void *dst, int c, uint n)
{
 2c6:	55                   	push   %ebp
 2c7:	89 e5                	mov    %esp,%ebp
 2c9:	57                   	push   %edi
 2ca:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 2cd:	89 d7                	mov    %edx,%edi
 2cf:	8b 4d 10             	mov    0x10(%ebp),%ecx
 2d2:	8b 45 0c             	mov    0xc(%ebp),%eax
 2d5:	fc                   	cld    
 2d6:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 2d8:	89 d0                	mov    %edx,%eax
 2da:	8b 7d fc             	mov    -0x4(%ebp),%edi
 2dd:	c9                   	leave  
 2de:	c3                   	ret    

000002df <strchr>:

char*
strchr(const char *s, char c)
{
 2df:	55                   	push   %ebp
 2e0:	89 e5                	mov    %esp,%ebp
 2e2:	8b 45 08             	mov    0x8(%ebp),%eax
 2e5:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 2e9:	eb 03                	jmp    2ee <strchr+0xf>
 2eb:	83 c0 01             	add    $0x1,%eax
 2ee:	0f b6 10             	movzbl (%eax),%edx
 2f1:	84 d2                	test   %dl,%dl
 2f3:	74 06                	je     2fb <strchr+0x1c>
    if(*s == c)
 2f5:	38 ca                	cmp    %cl,%dl
 2f7:	75 f2                	jne    2eb <strchr+0xc>
 2f9:	eb 05                	jmp    300 <strchr+0x21>
      return (char*)s;
  return 0;
 2fb:	b8 00 00 00 00       	mov    $0x0,%eax
}
 300:	5d                   	pop    %ebp
 301:	c3                   	ret    

00000302 <gets>:

char*
gets(char *buf, int max)
{
 302:	55                   	push   %ebp
 303:	89 e5                	mov    %esp,%ebp
 305:	57                   	push   %edi
 306:	56                   	push   %esi
 307:	53                   	push   %ebx
 308:	83 ec 1c             	sub    $0x1c,%esp
 30b:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 30e:	bb 00 00 00 00       	mov    $0x0,%ebx
 313:	89 de                	mov    %ebx,%esi
 315:	83 c3 01             	add    $0x1,%ebx
 318:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 31b:	7d 2e                	jge    34b <gets+0x49>
    cc = read(0, &c, 1);
 31d:	83 ec 04             	sub    $0x4,%esp
 320:	6a 01                	push   $0x1
 322:	8d 45 e7             	lea    -0x19(%ebp),%eax
 325:	50                   	push   %eax
 326:	6a 00                	push   $0x0
 328:	e8 ec 00 00 00       	call   419 <read>
    if(cc < 1)
 32d:	83 c4 10             	add    $0x10,%esp
 330:	85 c0                	test   %eax,%eax
 332:	7e 17                	jle    34b <gets+0x49>
      break;
    buf[i++] = c;
 334:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 338:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 33b:	3c 0a                	cmp    $0xa,%al
 33d:	0f 94 c2             	sete   %dl
 340:	3c 0d                	cmp    $0xd,%al
 342:	0f 94 c0             	sete   %al
 345:	08 c2                	or     %al,%dl
 347:	74 ca                	je     313 <gets+0x11>
    buf[i++] = c;
 349:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 34b:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 34f:	89 f8                	mov    %edi,%eax
 351:	8d 65 f4             	lea    -0xc(%ebp),%esp
 354:	5b                   	pop    %ebx
 355:	5e                   	pop    %esi
 356:	5f                   	pop    %edi
 357:	5d                   	pop    %ebp
 358:	c3                   	ret    

00000359 <stat>:

int
stat(const char *n, struct stat *st)
{
 359:	55                   	push   %ebp
 35a:	89 e5                	mov    %esp,%ebp
 35c:	56                   	push   %esi
 35d:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 35e:	83 ec 08             	sub    $0x8,%esp
 361:	6a 00                	push   $0x0
 363:	ff 75 08             	push   0x8(%ebp)
 366:	e8 d6 00 00 00       	call   441 <open>
  if(fd < 0)
 36b:	83 c4 10             	add    $0x10,%esp
 36e:	85 c0                	test   %eax,%eax
 370:	78 24                	js     396 <stat+0x3d>
 372:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 374:	83 ec 08             	sub    $0x8,%esp
 377:	ff 75 0c             	push   0xc(%ebp)
 37a:	50                   	push   %eax
 37b:	e8 d9 00 00 00       	call   459 <fstat>
 380:	89 c6                	mov    %eax,%esi
  close(fd);
 382:	89 1c 24             	mov    %ebx,(%esp)
 385:	e8 9f 00 00 00       	call   429 <close>
  return r;
 38a:	83 c4 10             	add    $0x10,%esp
}
 38d:	89 f0                	mov    %esi,%eax
 38f:	8d 65 f8             	lea    -0x8(%ebp),%esp
 392:	5b                   	pop    %ebx
 393:	5e                   	pop    %esi
 394:	5d                   	pop    %ebp
 395:	c3                   	ret    
    return -1;
 396:	be ff ff ff ff       	mov    $0xffffffff,%esi
 39b:	eb f0                	jmp    38d <stat+0x34>

0000039d <atoi>:

int
atoi(const char *s)
{
 39d:	55                   	push   %ebp
 39e:	89 e5                	mov    %esp,%ebp
 3a0:	53                   	push   %ebx
 3a1:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 3a4:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 3a9:	eb 10                	jmp    3bb <atoi+0x1e>
    n = n*10 + *s++ - '0';
 3ab:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 3ae:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 3b1:	83 c1 01             	add    $0x1,%ecx
 3b4:	0f be c0             	movsbl %al,%eax
 3b7:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 3bb:	0f b6 01             	movzbl (%ecx),%eax
 3be:	8d 58 d0             	lea    -0x30(%eax),%ebx
 3c1:	80 fb 09             	cmp    $0x9,%bl
 3c4:	76 e5                	jbe    3ab <atoi+0xe>
  return n;
}
 3c6:	89 d0                	mov    %edx,%eax
 3c8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3cb:	c9                   	leave  
 3cc:	c3                   	ret    

000003cd <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3cd:	55                   	push   %ebp
 3ce:	89 e5                	mov    %esp,%ebp
 3d0:	56                   	push   %esi
 3d1:	53                   	push   %ebx
 3d2:	8b 75 08             	mov    0x8(%ebp),%esi
 3d5:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 3d8:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 3db:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 3dd:	eb 0d                	jmp    3ec <memmove+0x1f>
    *dst++ = *src++;
 3df:	0f b6 01             	movzbl (%ecx),%eax
 3e2:	88 02                	mov    %al,(%edx)
 3e4:	8d 49 01             	lea    0x1(%ecx),%ecx
 3e7:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 3ea:	89 d8                	mov    %ebx,%eax
 3ec:	8d 58 ff             	lea    -0x1(%eax),%ebx
 3ef:	85 c0                	test   %eax,%eax
 3f1:	7f ec                	jg     3df <memmove+0x12>
  return vdst;
}
 3f3:	89 f0                	mov    %esi,%eax
 3f5:	5b                   	pop    %ebx
 3f6:	5e                   	pop    %esi
 3f7:	5d                   	pop    %ebp
 3f8:	c3                   	ret    

000003f9 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3f9:	b8 01 00 00 00       	mov    $0x1,%eax
 3fe:	cd 40                	int    $0x40
 400:	c3                   	ret    

00000401 <exit>:
SYSCALL(exit)
 401:	b8 02 00 00 00       	mov    $0x2,%eax
 406:	cd 40                	int    $0x40
 408:	c3                   	ret    

00000409 <wait>:
SYSCALL(wait)
 409:	b8 03 00 00 00       	mov    $0x3,%eax
 40e:	cd 40                	int    $0x40
 410:	c3                   	ret    

00000411 <pipe>:
SYSCALL(pipe)
 411:	b8 04 00 00 00       	mov    $0x4,%eax
 416:	cd 40                	int    $0x40
 418:	c3                   	ret    

00000419 <read>:
SYSCALL(read)
 419:	b8 05 00 00 00       	mov    $0x5,%eax
 41e:	cd 40                	int    $0x40
 420:	c3                   	ret    

00000421 <write>:
SYSCALL(write)
 421:	b8 10 00 00 00       	mov    $0x10,%eax
 426:	cd 40                	int    $0x40
 428:	c3                   	ret    

00000429 <close>:
SYSCALL(close)
 429:	b8 15 00 00 00       	mov    $0x15,%eax
 42e:	cd 40                	int    $0x40
 430:	c3                   	ret    

00000431 <kill>:
SYSCALL(kill)
 431:	b8 06 00 00 00       	mov    $0x6,%eax
 436:	cd 40                	int    $0x40
 438:	c3                   	ret    

00000439 <exec>:
SYSCALL(exec)
 439:	b8 07 00 00 00       	mov    $0x7,%eax
 43e:	cd 40                	int    $0x40
 440:	c3                   	ret    

00000441 <open>:
SYSCALL(open)
 441:	b8 0f 00 00 00       	mov    $0xf,%eax
 446:	cd 40                	int    $0x40
 448:	c3                   	ret    

00000449 <mknod>:
SYSCALL(mknod)
 449:	b8 11 00 00 00       	mov    $0x11,%eax
 44e:	cd 40                	int    $0x40
 450:	c3                   	ret    

00000451 <unlink>:
SYSCALL(unlink)
 451:	b8 12 00 00 00       	mov    $0x12,%eax
 456:	cd 40                	int    $0x40
 458:	c3                   	ret    

00000459 <fstat>:
SYSCALL(fstat)
 459:	b8 08 00 00 00       	mov    $0x8,%eax
 45e:	cd 40                	int    $0x40
 460:	c3                   	ret    

00000461 <link>:
SYSCALL(link)
 461:	b8 13 00 00 00       	mov    $0x13,%eax
 466:	cd 40                	int    $0x40
 468:	c3                   	ret    

00000469 <mkdir>:
SYSCALL(mkdir)
 469:	b8 14 00 00 00       	mov    $0x14,%eax
 46e:	cd 40                	int    $0x40
 470:	c3                   	ret    

00000471 <chdir>:
SYSCALL(chdir)
 471:	b8 09 00 00 00       	mov    $0x9,%eax
 476:	cd 40                	int    $0x40
 478:	c3                   	ret    

00000479 <dup>:
SYSCALL(dup)
 479:	b8 0a 00 00 00       	mov    $0xa,%eax
 47e:	cd 40                	int    $0x40
 480:	c3                   	ret    

00000481 <getpid>:
SYSCALL(getpid)
 481:	b8 0b 00 00 00       	mov    $0xb,%eax
 486:	cd 40                	int    $0x40
 488:	c3                   	ret    

00000489 <sbrk>:
SYSCALL(sbrk)
 489:	b8 0c 00 00 00       	mov    $0xc,%eax
 48e:	cd 40                	int    $0x40
 490:	c3                   	ret    

00000491 <sleep>:
SYSCALL(sleep)
 491:	b8 0d 00 00 00       	mov    $0xd,%eax
 496:	cd 40                	int    $0x40
 498:	c3                   	ret    

00000499 <uptime>:
SYSCALL(uptime)
 499:	b8 0e 00 00 00       	mov    $0xe,%eax
 49e:	cd 40                	int    $0x40
 4a0:	c3                   	ret    

000004a1 <clone>:
SYSCALL(clone)
 4a1:	b8 16 00 00 00       	mov    $0x16,%eax
 4a6:	cd 40                	int    $0x40
 4a8:	c3                   	ret    

000004a9 <join>:
 4a9:	b8 17 00 00 00       	mov    $0x17,%eax
 4ae:	cd 40                	int    $0x40
 4b0:	c3                   	ret    

000004b1 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 4b1:	55                   	push   %ebp
 4b2:	89 e5                	mov    %esp,%ebp
 4b4:	83 ec 1c             	sub    $0x1c,%esp
 4b7:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 4ba:	6a 01                	push   $0x1
 4bc:	8d 55 f4             	lea    -0xc(%ebp),%edx
 4bf:	52                   	push   %edx
 4c0:	50                   	push   %eax
 4c1:	e8 5b ff ff ff       	call   421 <write>
}
 4c6:	83 c4 10             	add    $0x10,%esp
 4c9:	c9                   	leave  
 4ca:	c3                   	ret    

000004cb <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 4cb:	55                   	push   %ebp
 4cc:	89 e5                	mov    %esp,%ebp
 4ce:	57                   	push   %edi
 4cf:	56                   	push   %esi
 4d0:	53                   	push   %ebx
 4d1:	83 ec 2c             	sub    $0x2c,%esp
 4d4:	89 45 d0             	mov    %eax,-0x30(%ebp)
 4d7:	89 d0                	mov    %edx,%eax
 4d9:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 4db:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 4df:	0f 95 c1             	setne  %cl
 4e2:	c1 ea 1f             	shr    $0x1f,%edx
 4e5:	84 d1                	test   %dl,%cl
 4e7:	74 44                	je     52d <printint+0x62>
    neg = 1;
    x = -xx;
 4e9:	f7 d8                	neg    %eax
 4eb:	89 c1                	mov    %eax,%ecx
    neg = 1;
 4ed:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 4f4:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 4f9:	89 c8                	mov    %ecx,%eax
 4fb:	ba 00 00 00 00       	mov    $0x0,%edx
 500:	f7 f6                	div    %esi
 502:	89 df                	mov    %ebx,%edi
 504:	83 c3 01             	add    $0x1,%ebx
 507:	0f b6 92 9c 08 00 00 	movzbl 0x89c(%edx),%edx
 50e:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 512:	89 ca                	mov    %ecx,%edx
 514:	89 c1                	mov    %eax,%ecx
 516:	39 d6                	cmp    %edx,%esi
 518:	76 df                	jbe    4f9 <printint+0x2e>
  if(neg)
 51a:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 51e:	74 31                	je     551 <printint+0x86>
    buf[i++] = '-';
 520:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 525:	8d 5f 02             	lea    0x2(%edi),%ebx
 528:	8b 75 d0             	mov    -0x30(%ebp),%esi
 52b:	eb 17                	jmp    544 <printint+0x79>
    x = xx;
 52d:	89 c1                	mov    %eax,%ecx
  neg = 0;
 52f:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 536:	eb bc                	jmp    4f4 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 538:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 53d:	89 f0                	mov    %esi,%eax
 53f:	e8 6d ff ff ff       	call   4b1 <putc>
  while(--i >= 0)
 544:	83 eb 01             	sub    $0x1,%ebx
 547:	79 ef                	jns    538 <printint+0x6d>
}
 549:	83 c4 2c             	add    $0x2c,%esp
 54c:	5b                   	pop    %ebx
 54d:	5e                   	pop    %esi
 54e:	5f                   	pop    %edi
 54f:	5d                   	pop    %ebp
 550:	c3                   	ret    
 551:	8b 75 d0             	mov    -0x30(%ebp),%esi
 554:	eb ee                	jmp    544 <printint+0x79>

00000556 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 556:	55                   	push   %ebp
 557:	89 e5                	mov    %esp,%ebp
 559:	57                   	push   %edi
 55a:	56                   	push   %esi
 55b:	53                   	push   %ebx
 55c:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 55f:	8d 45 10             	lea    0x10(%ebp),%eax
 562:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 565:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 56a:	bb 00 00 00 00       	mov    $0x0,%ebx
 56f:	eb 14                	jmp    585 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 571:	89 fa                	mov    %edi,%edx
 573:	8b 45 08             	mov    0x8(%ebp),%eax
 576:	e8 36 ff ff ff       	call   4b1 <putc>
 57b:	eb 05                	jmp    582 <printf+0x2c>
      }
    } else if(state == '%'){
 57d:	83 fe 25             	cmp    $0x25,%esi
 580:	74 25                	je     5a7 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 582:	83 c3 01             	add    $0x1,%ebx
 585:	8b 45 0c             	mov    0xc(%ebp),%eax
 588:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 58c:	84 c0                	test   %al,%al
 58e:	0f 84 20 01 00 00    	je     6b4 <printf+0x15e>
    c = fmt[i] & 0xff;
 594:	0f be f8             	movsbl %al,%edi
 597:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 59a:	85 f6                	test   %esi,%esi
 59c:	75 df                	jne    57d <printf+0x27>
      if(c == '%'){
 59e:	83 f8 25             	cmp    $0x25,%eax
 5a1:	75 ce                	jne    571 <printf+0x1b>
        state = '%';
 5a3:	89 c6                	mov    %eax,%esi
 5a5:	eb db                	jmp    582 <printf+0x2c>
      if(c == 'd'){
 5a7:	83 f8 25             	cmp    $0x25,%eax
 5aa:	0f 84 cf 00 00 00    	je     67f <printf+0x129>
 5b0:	0f 8c dd 00 00 00    	jl     693 <printf+0x13d>
 5b6:	83 f8 78             	cmp    $0x78,%eax
 5b9:	0f 8f d4 00 00 00    	jg     693 <printf+0x13d>
 5bf:	83 f8 63             	cmp    $0x63,%eax
 5c2:	0f 8c cb 00 00 00    	jl     693 <printf+0x13d>
 5c8:	83 e8 63             	sub    $0x63,%eax
 5cb:	83 f8 15             	cmp    $0x15,%eax
 5ce:	0f 87 bf 00 00 00    	ja     693 <printf+0x13d>
 5d4:	ff 24 85 44 08 00 00 	jmp    *0x844(,%eax,4)
        printint(fd, *ap, 10, 1);
 5db:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5de:	8b 17                	mov    (%edi),%edx
 5e0:	83 ec 0c             	sub    $0xc,%esp
 5e3:	6a 01                	push   $0x1
 5e5:	b9 0a 00 00 00       	mov    $0xa,%ecx
 5ea:	8b 45 08             	mov    0x8(%ebp),%eax
 5ed:	e8 d9 fe ff ff       	call   4cb <printint>
        ap++;
 5f2:	83 c7 04             	add    $0x4,%edi
 5f5:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 5f8:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 5fb:	be 00 00 00 00       	mov    $0x0,%esi
 600:	eb 80                	jmp    582 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 602:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 605:	8b 17                	mov    (%edi),%edx
 607:	83 ec 0c             	sub    $0xc,%esp
 60a:	6a 00                	push   $0x0
 60c:	b9 10 00 00 00       	mov    $0x10,%ecx
 611:	8b 45 08             	mov    0x8(%ebp),%eax
 614:	e8 b2 fe ff ff       	call   4cb <printint>
        ap++;
 619:	83 c7 04             	add    $0x4,%edi
 61c:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 61f:	83 c4 10             	add    $0x10,%esp
      state = 0;
 622:	be 00 00 00 00       	mov    $0x0,%esi
 627:	e9 56 ff ff ff       	jmp    582 <printf+0x2c>
        s = (char*)*ap;
 62c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 62f:	8b 30                	mov    (%eax),%esi
        ap++;
 631:	83 c0 04             	add    $0x4,%eax
 634:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 637:	85 f6                	test   %esi,%esi
 639:	75 15                	jne    650 <printf+0xfa>
          s = "(null)";
 63b:	be 3b 08 00 00       	mov    $0x83b,%esi
 640:	eb 0e                	jmp    650 <printf+0xfa>
          putc(fd, *s);
 642:	0f be d2             	movsbl %dl,%edx
 645:	8b 45 08             	mov    0x8(%ebp),%eax
 648:	e8 64 fe ff ff       	call   4b1 <putc>
          s++;
 64d:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 650:	0f b6 16             	movzbl (%esi),%edx
 653:	84 d2                	test   %dl,%dl
 655:	75 eb                	jne    642 <printf+0xec>
      state = 0;
 657:	be 00 00 00 00       	mov    $0x0,%esi
 65c:	e9 21 ff ff ff       	jmp    582 <printf+0x2c>
        putc(fd, *ap);
 661:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 664:	0f be 17             	movsbl (%edi),%edx
 667:	8b 45 08             	mov    0x8(%ebp),%eax
 66a:	e8 42 fe ff ff       	call   4b1 <putc>
        ap++;
 66f:	83 c7 04             	add    $0x4,%edi
 672:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 675:	be 00 00 00 00       	mov    $0x0,%esi
 67a:	e9 03 ff ff ff       	jmp    582 <printf+0x2c>
        putc(fd, c);
 67f:	89 fa                	mov    %edi,%edx
 681:	8b 45 08             	mov    0x8(%ebp),%eax
 684:	e8 28 fe ff ff       	call   4b1 <putc>
      state = 0;
 689:	be 00 00 00 00       	mov    $0x0,%esi
 68e:	e9 ef fe ff ff       	jmp    582 <printf+0x2c>
        putc(fd, '%');
 693:	ba 25 00 00 00       	mov    $0x25,%edx
 698:	8b 45 08             	mov    0x8(%ebp),%eax
 69b:	e8 11 fe ff ff       	call   4b1 <putc>
        putc(fd, c);
 6a0:	89 fa                	mov    %edi,%edx
 6a2:	8b 45 08             	mov    0x8(%ebp),%eax
 6a5:	e8 07 fe ff ff       	call   4b1 <putc>
      state = 0;
 6aa:	be 00 00 00 00       	mov    $0x0,%esi
 6af:	e9 ce fe ff ff       	jmp    582 <printf+0x2c>
    }
  }
}
 6b4:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6b7:	5b                   	pop    %ebx
 6b8:	5e                   	pop    %esi
 6b9:	5f                   	pop    %edi
 6ba:	5d                   	pop    %ebp
 6bb:	c3                   	ret    

000006bc <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6bc:	55                   	push   %ebp
 6bd:	89 e5                	mov    %esp,%ebp
 6bf:	57                   	push   %edi
 6c0:	56                   	push   %esi
 6c1:	53                   	push   %ebx
 6c2:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 6c5:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6c8:	a1 60 0f 00 00       	mov    0xf60,%eax
 6cd:	eb 02                	jmp    6d1 <free+0x15>
 6cf:	89 d0                	mov    %edx,%eax
 6d1:	39 c8                	cmp    %ecx,%eax
 6d3:	73 04                	jae    6d9 <free+0x1d>
 6d5:	39 08                	cmp    %ecx,(%eax)
 6d7:	77 12                	ja     6eb <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6d9:	8b 10                	mov    (%eax),%edx
 6db:	39 c2                	cmp    %eax,%edx
 6dd:	77 f0                	ja     6cf <free+0x13>
 6df:	39 c8                	cmp    %ecx,%eax
 6e1:	72 08                	jb     6eb <free+0x2f>
 6e3:	39 ca                	cmp    %ecx,%edx
 6e5:	77 04                	ja     6eb <free+0x2f>
 6e7:	89 d0                	mov    %edx,%eax
 6e9:	eb e6                	jmp    6d1 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 6eb:	8b 73 fc             	mov    -0x4(%ebx),%esi
 6ee:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 6f1:	8b 10                	mov    (%eax),%edx
 6f3:	39 d7                	cmp    %edx,%edi
 6f5:	74 19                	je     710 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 6f7:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 6fa:	8b 50 04             	mov    0x4(%eax),%edx
 6fd:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 700:	39 ce                	cmp    %ecx,%esi
 702:	74 1b                	je     71f <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 704:	89 08                	mov    %ecx,(%eax)
  freep = p;
 706:	a3 60 0f 00 00       	mov    %eax,0xf60
}
 70b:	5b                   	pop    %ebx
 70c:	5e                   	pop    %esi
 70d:	5f                   	pop    %edi
 70e:	5d                   	pop    %ebp
 70f:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 710:	03 72 04             	add    0x4(%edx),%esi
 713:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 716:	8b 10                	mov    (%eax),%edx
 718:	8b 12                	mov    (%edx),%edx
 71a:	89 53 f8             	mov    %edx,-0x8(%ebx)
 71d:	eb db                	jmp    6fa <free+0x3e>
    p->s.size += bp->s.size;
 71f:	03 53 fc             	add    -0x4(%ebx),%edx
 722:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 725:	8b 53 f8             	mov    -0x8(%ebx),%edx
 728:	89 10                	mov    %edx,(%eax)
 72a:	eb da                	jmp    706 <free+0x4a>

0000072c <morecore>:

static Header*
morecore(uint nu)
{
 72c:	55                   	push   %ebp
 72d:	89 e5                	mov    %esp,%ebp
 72f:	53                   	push   %ebx
 730:	83 ec 04             	sub    $0x4,%esp
 733:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 735:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 73a:	77 05                	ja     741 <morecore+0x15>
    nu = 4096;
 73c:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 741:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 748:	83 ec 0c             	sub    $0xc,%esp
 74b:	50                   	push   %eax
 74c:	e8 38 fd ff ff       	call   489 <sbrk>
  if(p == (char*)-1)
 751:	83 c4 10             	add    $0x10,%esp
 754:	83 f8 ff             	cmp    $0xffffffff,%eax
 757:	74 1c                	je     775 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 759:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 75c:	83 c0 08             	add    $0x8,%eax
 75f:	83 ec 0c             	sub    $0xc,%esp
 762:	50                   	push   %eax
 763:	e8 54 ff ff ff       	call   6bc <free>
  return freep;
 768:	a1 60 0f 00 00       	mov    0xf60,%eax
 76d:	83 c4 10             	add    $0x10,%esp
}
 770:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 773:	c9                   	leave  
 774:	c3                   	ret    
    return 0;
 775:	b8 00 00 00 00       	mov    $0x0,%eax
 77a:	eb f4                	jmp    770 <morecore+0x44>

0000077c <malloc>:

void*
malloc(uint nbytes)
{
 77c:	55                   	push   %ebp
 77d:	89 e5                	mov    %esp,%ebp
 77f:	53                   	push   %ebx
 780:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 783:	8b 45 08             	mov    0x8(%ebp),%eax
 786:	8d 58 07             	lea    0x7(%eax),%ebx
 789:	c1 eb 03             	shr    $0x3,%ebx
 78c:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 78f:	8b 0d 60 0f 00 00    	mov    0xf60,%ecx
 795:	85 c9                	test   %ecx,%ecx
 797:	74 04                	je     79d <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 799:	8b 01                	mov    (%ecx),%eax
 79b:	eb 4a                	jmp    7e7 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 79d:	c7 05 60 0f 00 00 64 	movl   $0xf64,0xf60
 7a4:	0f 00 00 
 7a7:	c7 05 64 0f 00 00 64 	movl   $0xf64,0xf64
 7ae:	0f 00 00 
    base.s.size = 0;
 7b1:	c7 05 68 0f 00 00 00 	movl   $0x0,0xf68
 7b8:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 7bb:	b9 64 0f 00 00       	mov    $0xf64,%ecx
 7c0:	eb d7                	jmp    799 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 7c2:	74 19                	je     7dd <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 7c4:	29 da                	sub    %ebx,%edx
 7c6:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 7c9:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 7cc:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 7cf:	89 0d 60 0f 00 00    	mov    %ecx,0xf60
      return (void*)(p + 1);
 7d5:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 7d8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 7db:	c9                   	leave  
 7dc:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 7dd:	8b 10                	mov    (%eax),%edx
 7df:	89 11                	mov    %edx,(%ecx)
 7e1:	eb ec                	jmp    7cf <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7e3:	89 c1                	mov    %eax,%ecx
 7e5:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 7e7:	8b 50 04             	mov    0x4(%eax),%edx
 7ea:	39 da                	cmp    %ebx,%edx
 7ec:	73 d4                	jae    7c2 <malloc+0x46>
    if(p == freep)
 7ee:	39 05 60 0f 00 00    	cmp    %eax,0xf60
 7f4:	75 ed                	jne    7e3 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 7f6:	89 d8                	mov    %ebx,%eax
 7f8:	e8 2f ff ff ff       	call   72c <morecore>
 7fd:	85 c0                	test   %eax,%eax
 7ff:	75 e2                	jne    7e3 <malloc+0x67>
 801:	eb d5                	jmp    7d8 <malloc+0x5c>
