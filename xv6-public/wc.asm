
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
  33:	e8 e9 03 00 00       	call   421 <read>
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
  4f:	68 0c 08 00 00       	push   $0x80c
  54:	e8 8e 02 00 00       	call   2e7 <strchr>
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
  a4:	68 22 08 00 00       	push   $0x822
  a9:	6a 01                	push   $0x1
  ab:	e8 ae 04 00 00       	call   55e <printf>
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
  be:	68 12 08 00 00       	push   $0x812
  c3:	6a 01                	push   $0x1
  c5:	e8 94 04 00 00       	call   55e <printf>
    exit();
  ca:	e8 3a 03 00 00       	call   409 <exit>

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
  fd:	68 21 08 00 00       	push   $0x821
 102:	6a 00                	push   $0x0
 104:	e8 f7 fe ff ff       	call   0 <wc>
    exit();
 109:	e8 fb 02 00 00       	call   409 <exit>
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
 11c:	e8 10 03 00 00       	call   431 <close>
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
 139:	e8 0b 03 00 00       	call   449 <open>
 13e:	89 c3                	mov    %eax,%ebx
 140:	83 c4 10             	add    $0x10,%esp
 143:	85 c0                	test   %eax,%eax
 145:	79 c7                	jns    10e <main+0x3f>
      printf(1, "wc: cannot open %s\n", argv[i]);
 147:	83 ec 04             	sub    $0x4,%esp
 14a:	ff 37                	push   (%edi)
 14c:	68 2f 08 00 00       	push   $0x82f
 151:	6a 01                	push   $0x1
 153:	e8 06 04 00 00       	call   55e <printf>
      exit();
 158:	e8 ac 02 00 00       	call   409 <exit>
  }
  exit();
 15d:	e8 a7 02 00 00       	call   409 <exit>

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
 176:	83 ec 14             	sub    $0x14,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE*2);
 179:	68 00 20 00 00       	push   $0x2000
 17e:	e8 01 06 00 00       	call   784 <malloc>
  if(n_stack == 0){
 183:	83 c4 10             	add    $0x10,%esp
 186:	85 c0                	test   %eax,%eax
 188:	74 4a                	je     1d4 <thread_create+0x61>
    return -1;
  }
  
  for(int i=0; i<64; i++){
 18a:	ba 00 00 00 00       	mov    $0x0,%edx
 18f:	eb 03                	jmp    194 <thread_create+0x21>
 191:	83 c2 01             	add    $0x1,%edx
 194:	83 fa 3f             	cmp    $0x3f,%edx
 197:	7f 27                	jg     1c0 <thread_create+0x4d>
    if(threads[i]->flag==0){
 199:	8b 0c 95 60 0e 00 00 	mov    0xe60(,%edx,4),%ecx
 1a0:	83 79 08 00          	cmpl   $0x0,0x8(%ecx)
 1a4:	75 eb                	jne    191 <thread_create+0x1e>
      threads[i]->maddr = n_stack;
 1a6:	89 01                	mov    %eax,(%ecx)
      threads[i]->pg1addr = n_stack;
 1a8:	8b 0c 95 60 0e 00 00 	mov    0xe60(,%edx,4),%ecx
 1af:	89 41 04             	mov    %eax,0x4(%ecx)
      threads[i]->flag = 1;
 1b2:	8b 14 95 60 0e 00 00 	mov    0xe60(,%edx,4),%edx
 1b9:	c7 42 08 01 00 00 00 	movl   $0x1,0x8(%edx)
      break;
    }
  }
  
  int new_pid = clone(start_routine, arg1, arg2, n_stack); // TODO: is this the right way to call it?
 1c0:	50                   	push   %eax
 1c1:	ff 75 10             	push   0x10(%ebp)
 1c4:	ff 75 0c             	push   0xc(%ebp)
 1c7:	ff 75 08             	push   0x8(%ebp)
 1ca:	e8 da 02 00 00       	call   4a9 <clone>

  // I can't remember if there was something else to do here but I'm sure I'll find out



  return new_pid;
 1cf:	83 c4 10             	add    $0x10,%esp
}
 1d2:	c9                   	leave  
 1d3:	c3                   	ret    
    return -1;
 1d4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 1d9:	eb f7                	jmp    1d2 <thread_create+0x5f>

000001db <thread_join>:

//TODO: fix
int thread_join() {
 1db:	55                   	push   %ebp
 1dc:	89 e5                	mov    %esp,%ebp
 1de:	56                   	push   %esi
 1df:	53                   	push   %ebx
 1e0:	83 ec 1c             	sub    $0x1c,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 1e3:	8d 45 f4             	lea    -0xc(%ebp),%eax
 1e6:	50                   	push   %eax
 1e7:	e8 c5 02 00 00       	call   4b1 <join>
 1ec:	89 c6                	mov    %eax,%esi
  for(int i=0; i<64; i++){
 1ee:	83 c4 10             	add    $0x10,%esp
 1f1:	bb 00 00 00 00       	mov    $0x0,%ebx
 1f6:	eb 03                	jmp    1fb <thread_join+0x20>
 1f8:	83 c3 01             	add    $0x1,%ebx
 1fb:	83 fb 3f             	cmp    $0x3f,%ebx
 1fe:	7f 23                	jg     223 <thread_join+0x48>
    if((threads[i]->flag==1) && (stk_addr == threads[i]->pg1addr)){
 200:	8b 04 9d 60 0e 00 00 	mov    0xe60(,%ebx,4),%eax
 207:	83 78 08 01          	cmpl   $0x1,0x8(%eax)
 20b:	75 eb                	jne    1f8 <thread_join+0x1d>
 20d:	8b 55 f4             	mov    -0xc(%ebp),%edx
 210:	39 50 04             	cmp    %edx,0x4(%eax)
 213:	75 e3                	jne    1f8 <thread_join+0x1d>
      free(stk_addr);
 215:	83 ec 0c             	sub    $0xc,%esp
 218:	52                   	push   %edx
 219:	e8 a6 04 00 00       	call   6c4 <free>
 21e:	83 c4 10             	add    $0x10,%esp
 221:	eb d5                	jmp    1f8 <thread_join+0x1d>
    }
  }
  return pid;
}
 223:	89 f0                	mov    %esi,%eax
 225:	8d 65 f8             	lea    -0x8(%ebp),%esp
 228:	5b                   	pop    %ebx
 229:	5e                   	pop    %esi
 22a:	5d                   	pop    %ebp
 22b:	c3                   	ret    

0000022c <lock_acquire>:

void lock_acquire(lock_t *lock){
 22c:	55                   	push   %ebp
 22d:	89 e5                	mov    %esp,%ebp
 22f:	53                   	push   %ebx
 230:	83 ec 04             	sub    $0x4,%esp
 233:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 236:	83 ec 08             	sub    $0x8,%esp
 239:	6a 01                	push   $0x1
 23b:	53                   	push   %ebx
 23c:	e8 21 ff ff ff       	call   162 <test_and_set>
 241:	83 c4 10             	add    $0x10,%esp
 244:	83 f8 01             	cmp    $0x1,%eax
 247:	74 ed                	je     236 <lock_acquire+0xa>
    ;
}
 249:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 24c:	c9                   	leave  
 24d:	c3                   	ret    

0000024e <lock_release>:

void lock_release(lock_t *lock) {
 24e:	55                   	push   %ebp
 24f:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 251:	8b 45 08             	mov    0x8(%ebp),%eax
 254:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 25a:	5d                   	pop    %ebp
 25b:	c3                   	ret    

0000025c <lock_init>:

void lock_init(lock_t *lock) {
 25c:	55                   	push   %ebp
 25d:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 25f:	8b 45 08             	mov    0x8(%ebp),%eax
 262:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 268:	5d                   	pop    %ebp
 269:	c3                   	ret    

0000026a <strcpy>:

char*
strcpy(char *s, const char *t)
{
 26a:	55                   	push   %ebp
 26b:	89 e5                	mov    %esp,%ebp
 26d:	56                   	push   %esi
 26e:	53                   	push   %ebx
 26f:	8b 75 08             	mov    0x8(%ebp),%esi
 272:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 275:	89 f0                	mov    %esi,%eax
 277:	89 d1                	mov    %edx,%ecx
 279:	83 c2 01             	add    $0x1,%edx
 27c:	89 c3                	mov    %eax,%ebx
 27e:	83 c0 01             	add    $0x1,%eax
 281:	0f b6 09             	movzbl (%ecx),%ecx
 284:	88 0b                	mov    %cl,(%ebx)
 286:	84 c9                	test   %cl,%cl
 288:	75 ed                	jne    277 <strcpy+0xd>
    ;
  return os;
}
 28a:	89 f0                	mov    %esi,%eax
 28c:	5b                   	pop    %ebx
 28d:	5e                   	pop    %esi
 28e:	5d                   	pop    %ebp
 28f:	c3                   	ret    

00000290 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 290:	55                   	push   %ebp
 291:	89 e5                	mov    %esp,%ebp
 293:	8b 4d 08             	mov    0x8(%ebp),%ecx
 296:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 299:	eb 06                	jmp    2a1 <strcmp+0x11>
    p++, q++;
 29b:	83 c1 01             	add    $0x1,%ecx
 29e:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 2a1:	0f b6 01             	movzbl (%ecx),%eax
 2a4:	84 c0                	test   %al,%al
 2a6:	74 04                	je     2ac <strcmp+0x1c>
 2a8:	3a 02                	cmp    (%edx),%al
 2aa:	74 ef                	je     29b <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 2ac:	0f b6 c0             	movzbl %al,%eax
 2af:	0f b6 12             	movzbl (%edx),%edx
 2b2:	29 d0                	sub    %edx,%eax
}
 2b4:	5d                   	pop    %ebp
 2b5:	c3                   	ret    

000002b6 <strlen>:

uint
strlen(const char *s)
{
 2b6:	55                   	push   %ebp
 2b7:	89 e5                	mov    %esp,%ebp
 2b9:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 2bc:	b8 00 00 00 00       	mov    $0x0,%eax
 2c1:	eb 03                	jmp    2c6 <strlen+0x10>
 2c3:	83 c0 01             	add    $0x1,%eax
 2c6:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 2ca:	75 f7                	jne    2c3 <strlen+0xd>
    ;
  return n;
}
 2cc:	5d                   	pop    %ebp
 2cd:	c3                   	ret    

000002ce <memset>:

void*
memset(void *dst, int c, uint n)
{
 2ce:	55                   	push   %ebp
 2cf:	89 e5                	mov    %esp,%ebp
 2d1:	57                   	push   %edi
 2d2:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 2d5:	89 d7                	mov    %edx,%edi
 2d7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 2da:	8b 45 0c             	mov    0xc(%ebp),%eax
 2dd:	fc                   	cld    
 2de:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 2e0:	89 d0                	mov    %edx,%eax
 2e2:	8b 7d fc             	mov    -0x4(%ebp),%edi
 2e5:	c9                   	leave  
 2e6:	c3                   	ret    

000002e7 <strchr>:

char*
strchr(const char *s, char c)
{
 2e7:	55                   	push   %ebp
 2e8:	89 e5                	mov    %esp,%ebp
 2ea:	8b 45 08             	mov    0x8(%ebp),%eax
 2ed:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 2f1:	eb 03                	jmp    2f6 <strchr+0xf>
 2f3:	83 c0 01             	add    $0x1,%eax
 2f6:	0f b6 10             	movzbl (%eax),%edx
 2f9:	84 d2                	test   %dl,%dl
 2fb:	74 06                	je     303 <strchr+0x1c>
    if(*s == c)
 2fd:	38 ca                	cmp    %cl,%dl
 2ff:	75 f2                	jne    2f3 <strchr+0xc>
 301:	eb 05                	jmp    308 <strchr+0x21>
      return (char*)s;
  return 0;
 303:	b8 00 00 00 00       	mov    $0x0,%eax
}
 308:	5d                   	pop    %ebp
 309:	c3                   	ret    

0000030a <gets>:

char*
gets(char *buf, int max)
{
 30a:	55                   	push   %ebp
 30b:	89 e5                	mov    %esp,%ebp
 30d:	57                   	push   %edi
 30e:	56                   	push   %esi
 30f:	53                   	push   %ebx
 310:	83 ec 1c             	sub    $0x1c,%esp
 313:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 316:	bb 00 00 00 00       	mov    $0x0,%ebx
 31b:	89 de                	mov    %ebx,%esi
 31d:	83 c3 01             	add    $0x1,%ebx
 320:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 323:	7d 2e                	jge    353 <gets+0x49>
    cc = read(0, &c, 1);
 325:	83 ec 04             	sub    $0x4,%esp
 328:	6a 01                	push   $0x1
 32a:	8d 45 e7             	lea    -0x19(%ebp),%eax
 32d:	50                   	push   %eax
 32e:	6a 00                	push   $0x0
 330:	e8 ec 00 00 00       	call   421 <read>
    if(cc < 1)
 335:	83 c4 10             	add    $0x10,%esp
 338:	85 c0                	test   %eax,%eax
 33a:	7e 17                	jle    353 <gets+0x49>
      break;
    buf[i++] = c;
 33c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 340:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 343:	3c 0a                	cmp    $0xa,%al
 345:	0f 94 c2             	sete   %dl
 348:	3c 0d                	cmp    $0xd,%al
 34a:	0f 94 c0             	sete   %al
 34d:	08 c2                	or     %al,%dl
 34f:	74 ca                	je     31b <gets+0x11>
    buf[i++] = c;
 351:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 353:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 357:	89 f8                	mov    %edi,%eax
 359:	8d 65 f4             	lea    -0xc(%ebp),%esp
 35c:	5b                   	pop    %ebx
 35d:	5e                   	pop    %esi
 35e:	5f                   	pop    %edi
 35f:	5d                   	pop    %ebp
 360:	c3                   	ret    

00000361 <stat>:

int
stat(const char *n, struct stat *st)
{
 361:	55                   	push   %ebp
 362:	89 e5                	mov    %esp,%ebp
 364:	56                   	push   %esi
 365:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 366:	83 ec 08             	sub    $0x8,%esp
 369:	6a 00                	push   $0x0
 36b:	ff 75 08             	push   0x8(%ebp)
 36e:	e8 d6 00 00 00       	call   449 <open>
  if(fd < 0)
 373:	83 c4 10             	add    $0x10,%esp
 376:	85 c0                	test   %eax,%eax
 378:	78 24                	js     39e <stat+0x3d>
 37a:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 37c:	83 ec 08             	sub    $0x8,%esp
 37f:	ff 75 0c             	push   0xc(%ebp)
 382:	50                   	push   %eax
 383:	e8 d9 00 00 00       	call   461 <fstat>
 388:	89 c6                	mov    %eax,%esi
  close(fd);
 38a:	89 1c 24             	mov    %ebx,(%esp)
 38d:	e8 9f 00 00 00       	call   431 <close>
  return r;
 392:	83 c4 10             	add    $0x10,%esp
}
 395:	89 f0                	mov    %esi,%eax
 397:	8d 65 f8             	lea    -0x8(%ebp),%esp
 39a:	5b                   	pop    %ebx
 39b:	5e                   	pop    %esi
 39c:	5d                   	pop    %ebp
 39d:	c3                   	ret    
    return -1;
 39e:	be ff ff ff ff       	mov    $0xffffffff,%esi
 3a3:	eb f0                	jmp    395 <stat+0x34>

000003a5 <atoi>:

int
atoi(const char *s)
{
 3a5:	55                   	push   %ebp
 3a6:	89 e5                	mov    %esp,%ebp
 3a8:	53                   	push   %ebx
 3a9:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 3ac:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 3b1:	eb 10                	jmp    3c3 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 3b3:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 3b6:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 3b9:	83 c1 01             	add    $0x1,%ecx
 3bc:	0f be c0             	movsbl %al,%eax
 3bf:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 3c3:	0f b6 01             	movzbl (%ecx),%eax
 3c6:	8d 58 d0             	lea    -0x30(%eax),%ebx
 3c9:	80 fb 09             	cmp    $0x9,%bl
 3cc:	76 e5                	jbe    3b3 <atoi+0xe>
  return n;
}
 3ce:	89 d0                	mov    %edx,%eax
 3d0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3d3:	c9                   	leave  
 3d4:	c3                   	ret    

000003d5 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3d5:	55                   	push   %ebp
 3d6:	89 e5                	mov    %esp,%ebp
 3d8:	56                   	push   %esi
 3d9:	53                   	push   %ebx
 3da:	8b 75 08             	mov    0x8(%ebp),%esi
 3dd:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 3e0:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 3e3:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 3e5:	eb 0d                	jmp    3f4 <memmove+0x1f>
    *dst++ = *src++;
 3e7:	0f b6 01             	movzbl (%ecx),%eax
 3ea:	88 02                	mov    %al,(%edx)
 3ec:	8d 49 01             	lea    0x1(%ecx),%ecx
 3ef:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 3f2:	89 d8                	mov    %ebx,%eax
 3f4:	8d 58 ff             	lea    -0x1(%eax),%ebx
 3f7:	85 c0                	test   %eax,%eax
 3f9:	7f ec                	jg     3e7 <memmove+0x12>
  return vdst;
}
 3fb:	89 f0                	mov    %esi,%eax
 3fd:	5b                   	pop    %ebx
 3fe:	5e                   	pop    %esi
 3ff:	5d                   	pop    %ebp
 400:	c3                   	ret    

00000401 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 401:	b8 01 00 00 00       	mov    $0x1,%eax
 406:	cd 40                	int    $0x40
 408:	c3                   	ret    

00000409 <exit>:
SYSCALL(exit)
 409:	b8 02 00 00 00       	mov    $0x2,%eax
 40e:	cd 40                	int    $0x40
 410:	c3                   	ret    

00000411 <wait>:
SYSCALL(wait)
 411:	b8 03 00 00 00       	mov    $0x3,%eax
 416:	cd 40                	int    $0x40
 418:	c3                   	ret    

00000419 <pipe>:
SYSCALL(pipe)
 419:	b8 04 00 00 00       	mov    $0x4,%eax
 41e:	cd 40                	int    $0x40
 420:	c3                   	ret    

00000421 <read>:
SYSCALL(read)
 421:	b8 05 00 00 00       	mov    $0x5,%eax
 426:	cd 40                	int    $0x40
 428:	c3                   	ret    

00000429 <write>:
SYSCALL(write)
 429:	b8 10 00 00 00       	mov    $0x10,%eax
 42e:	cd 40                	int    $0x40
 430:	c3                   	ret    

00000431 <close>:
SYSCALL(close)
 431:	b8 15 00 00 00       	mov    $0x15,%eax
 436:	cd 40                	int    $0x40
 438:	c3                   	ret    

00000439 <kill>:
SYSCALL(kill)
 439:	b8 06 00 00 00       	mov    $0x6,%eax
 43e:	cd 40                	int    $0x40
 440:	c3                   	ret    

00000441 <exec>:
SYSCALL(exec)
 441:	b8 07 00 00 00       	mov    $0x7,%eax
 446:	cd 40                	int    $0x40
 448:	c3                   	ret    

00000449 <open>:
SYSCALL(open)
 449:	b8 0f 00 00 00       	mov    $0xf,%eax
 44e:	cd 40                	int    $0x40
 450:	c3                   	ret    

00000451 <mknod>:
SYSCALL(mknod)
 451:	b8 11 00 00 00       	mov    $0x11,%eax
 456:	cd 40                	int    $0x40
 458:	c3                   	ret    

00000459 <unlink>:
SYSCALL(unlink)
 459:	b8 12 00 00 00       	mov    $0x12,%eax
 45e:	cd 40                	int    $0x40
 460:	c3                   	ret    

00000461 <fstat>:
SYSCALL(fstat)
 461:	b8 08 00 00 00       	mov    $0x8,%eax
 466:	cd 40                	int    $0x40
 468:	c3                   	ret    

00000469 <link>:
SYSCALL(link)
 469:	b8 13 00 00 00       	mov    $0x13,%eax
 46e:	cd 40                	int    $0x40
 470:	c3                   	ret    

00000471 <mkdir>:
SYSCALL(mkdir)
 471:	b8 14 00 00 00       	mov    $0x14,%eax
 476:	cd 40                	int    $0x40
 478:	c3                   	ret    

00000479 <chdir>:
SYSCALL(chdir)
 479:	b8 09 00 00 00       	mov    $0x9,%eax
 47e:	cd 40                	int    $0x40
 480:	c3                   	ret    

00000481 <dup>:
SYSCALL(dup)
 481:	b8 0a 00 00 00       	mov    $0xa,%eax
 486:	cd 40                	int    $0x40
 488:	c3                   	ret    

00000489 <getpid>:
SYSCALL(getpid)
 489:	b8 0b 00 00 00       	mov    $0xb,%eax
 48e:	cd 40                	int    $0x40
 490:	c3                   	ret    

00000491 <sbrk>:
SYSCALL(sbrk)
 491:	b8 0c 00 00 00       	mov    $0xc,%eax
 496:	cd 40                	int    $0x40
 498:	c3                   	ret    

00000499 <sleep>:
SYSCALL(sleep)
 499:	b8 0d 00 00 00       	mov    $0xd,%eax
 49e:	cd 40                	int    $0x40
 4a0:	c3                   	ret    

000004a1 <uptime>:
SYSCALL(uptime)
 4a1:	b8 0e 00 00 00       	mov    $0xe,%eax
 4a6:	cd 40                	int    $0x40
 4a8:	c3                   	ret    

000004a9 <clone>:
SYSCALL(clone)
 4a9:	b8 16 00 00 00       	mov    $0x16,%eax
 4ae:	cd 40                	int    $0x40
 4b0:	c3                   	ret    

000004b1 <join>:
 4b1:	b8 17 00 00 00       	mov    $0x17,%eax
 4b6:	cd 40                	int    $0x40
 4b8:	c3                   	ret    

000004b9 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 4b9:	55                   	push   %ebp
 4ba:	89 e5                	mov    %esp,%ebp
 4bc:	83 ec 1c             	sub    $0x1c,%esp
 4bf:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 4c2:	6a 01                	push   $0x1
 4c4:	8d 55 f4             	lea    -0xc(%ebp),%edx
 4c7:	52                   	push   %edx
 4c8:	50                   	push   %eax
 4c9:	e8 5b ff ff ff       	call   429 <write>
}
 4ce:	83 c4 10             	add    $0x10,%esp
 4d1:	c9                   	leave  
 4d2:	c3                   	ret    

000004d3 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 4d3:	55                   	push   %ebp
 4d4:	89 e5                	mov    %esp,%ebp
 4d6:	57                   	push   %edi
 4d7:	56                   	push   %esi
 4d8:	53                   	push   %ebx
 4d9:	83 ec 2c             	sub    $0x2c,%esp
 4dc:	89 45 d0             	mov    %eax,-0x30(%ebp)
 4df:	89 d0                	mov    %edx,%eax
 4e1:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 4e3:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 4e7:	0f 95 c1             	setne  %cl
 4ea:	c1 ea 1f             	shr    $0x1f,%edx
 4ed:	84 d1                	test   %dl,%cl
 4ef:	74 44                	je     535 <printint+0x62>
    neg = 1;
    x = -xx;
 4f1:	f7 d8                	neg    %eax
 4f3:	89 c1                	mov    %eax,%ecx
    neg = 1;
 4f5:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 4fc:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 501:	89 c8                	mov    %ecx,%eax
 503:	ba 00 00 00 00       	mov    $0x0,%edx
 508:	f7 f6                	div    %esi
 50a:	89 df                	mov    %ebx,%edi
 50c:	83 c3 01             	add    $0x1,%ebx
 50f:	0f b6 92 a4 08 00 00 	movzbl 0x8a4(%edx),%edx
 516:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 51a:	89 ca                	mov    %ecx,%edx
 51c:	89 c1                	mov    %eax,%ecx
 51e:	39 d6                	cmp    %edx,%esi
 520:	76 df                	jbe    501 <printint+0x2e>
  if(neg)
 522:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 526:	74 31                	je     559 <printint+0x86>
    buf[i++] = '-';
 528:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 52d:	8d 5f 02             	lea    0x2(%edi),%ebx
 530:	8b 75 d0             	mov    -0x30(%ebp),%esi
 533:	eb 17                	jmp    54c <printint+0x79>
    x = xx;
 535:	89 c1                	mov    %eax,%ecx
  neg = 0;
 537:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 53e:	eb bc                	jmp    4fc <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 540:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 545:	89 f0                	mov    %esi,%eax
 547:	e8 6d ff ff ff       	call   4b9 <putc>
  while(--i >= 0)
 54c:	83 eb 01             	sub    $0x1,%ebx
 54f:	79 ef                	jns    540 <printint+0x6d>
}
 551:	83 c4 2c             	add    $0x2c,%esp
 554:	5b                   	pop    %ebx
 555:	5e                   	pop    %esi
 556:	5f                   	pop    %edi
 557:	5d                   	pop    %ebp
 558:	c3                   	ret    
 559:	8b 75 d0             	mov    -0x30(%ebp),%esi
 55c:	eb ee                	jmp    54c <printint+0x79>

0000055e <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 55e:	55                   	push   %ebp
 55f:	89 e5                	mov    %esp,%ebp
 561:	57                   	push   %edi
 562:	56                   	push   %esi
 563:	53                   	push   %ebx
 564:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 567:	8d 45 10             	lea    0x10(%ebp),%eax
 56a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 56d:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 572:	bb 00 00 00 00       	mov    $0x0,%ebx
 577:	eb 14                	jmp    58d <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 579:	89 fa                	mov    %edi,%edx
 57b:	8b 45 08             	mov    0x8(%ebp),%eax
 57e:	e8 36 ff ff ff       	call   4b9 <putc>
 583:	eb 05                	jmp    58a <printf+0x2c>
      }
    } else if(state == '%'){
 585:	83 fe 25             	cmp    $0x25,%esi
 588:	74 25                	je     5af <printf+0x51>
  for(i = 0; fmt[i]; i++){
 58a:	83 c3 01             	add    $0x1,%ebx
 58d:	8b 45 0c             	mov    0xc(%ebp),%eax
 590:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 594:	84 c0                	test   %al,%al
 596:	0f 84 20 01 00 00    	je     6bc <printf+0x15e>
    c = fmt[i] & 0xff;
 59c:	0f be f8             	movsbl %al,%edi
 59f:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 5a2:	85 f6                	test   %esi,%esi
 5a4:	75 df                	jne    585 <printf+0x27>
      if(c == '%'){
 5a6:	83 f8 25             	cmp    $0x25,%eax
 5a9:	75 ce                	jne    579 <printf+0x1b>
        state = '%';
 5ab:	89 c6                	mov    %eax,%esi
 5ad:	eb db                	jmp    58a <printf+0x2c>
      if(c == 'd'){
 5af:	83 f8 25             	cmp    $0x25,%eax
 5b2:	0f 84 cf 00 00 00    	je     687 <printf+0x129>
 5b8:	0f 8c dd 00 00 00    	jl     69b <printf+0x13d>
 5be:	83 f8 78             	cmp    $0x78,%eax
 5c1:	0f 8f d4 00 00 00    	jg     69b <printf+0x13d>
 5c7:	83 f8 63             	cmp    $0x63,%eax
 5ca:	0f 8c cb 00 00 00    	jl     69b <printf+0x13d>
 5d0:	83 e8 63             	sub    $0x63,%eax
 5d3:	83 f8 15             	cmp    $0x15,%eax
 5d6:	0f 87 bf 00 00 00    	ja     69b <printf+0x13d>
 5dc:	ff 24 85 4c 08 00 00 	jmp    *0x84c(,%eax,4)
        printint(fd, *ap, 10, 1);
 5e3:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5e6:	8b 17                	mov    (%edi),%edx
 5e8:	83 ec 0c             	sub    $0xc,%esp
 5eb:	6a 01                	push   $0x1
 5ed:	b9 0a 00 00 00       	mov    $0xa,%ecx
 5f2:	8b 45 08             	mov    0x8(%ebp),%eax
 5f5:	e8 d9 fe ff ff       	call   4d3 <printint>
        ap++;
 5fa:	83 c7 04             	add    $0x4,%edi
 5fd:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 600:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 603:	be 00 00 00 00       	mov    $0x0,%esi
 608:	eb 80                	jmp    58a <printf+0x2c>
        printint(fd, *ap, 16, 0);
 60a:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 60d:	8b 17                	mov    (%edi),%edx
 60f:	83 ec 0c             	sub    $0xc,%esp
 612:	6a 00                	push   $0x0
 614:	b9 10 00 00 00       	mov    $0x10,%ecx
 619:	8b 45 08             	mov    0x8(%ebp),%eax
 61c:	e8 b2 fe ff ff       	call   4d3 <printint>
        ap++;
 621:	83 c7 04             	add    $0x4,%edi
 624:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 627:	83 c4 10             	add    $0x10,%esp
      state = 0;
 62a:	be 00 00 00 00       	mov    $0x0,%esi
 62f:	e9 56 ff ff ff       	jmp    58a <printf+0x2c>
        s = (char*)*ap;
 634:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 637:	8b 30                	mov    (%eax),%esi
        ap++;
 639:	83 c0 04             	add    $0x4,%eax
 63c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 63f:	85 f6                	test   %esi,%esi
 641:	75 15                	jne    658 <printf+0xfa>
          s = "(null)";
 643:	be 43 08 00 00       	mov    $0x843,%esi
 648:	eb 0e                	jmp    658 <printf+0xfa>
          putc(fd, *s);
 64a:	0f be d2             	movsbl %dl,%edx
 64d:	8b 45 08             	mov    0x8(%ebp),%eax
 650:	e8 64 fe ff ff       	call   4b9 <putc>
          s++;
 655:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 658:	0f b6 16             	movzbl (%esi),%edx
 65b:	84 d2                	test   %dl,%dl
 65d:	75 eb                	jne    64a <printf+0xec>
      state = 0;
 65f:	be 00 00 00 00       	mov    $0x0,%esi
 664:	e9 21 ff ff ff       	jmp    58a <printf+0x2c>
        putc(fd, *ap);
 669:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 66c:	0f be 17             	movsbl (%edi),%edx
 66f:	8b 45 08             	mov    0x8(%ebp),%eax
 672:	e8 42 fe ff ff       	call   4b9 <putc>
        ap++;
 677:	83 c7 04             	add    $0x4,%edi
 67a:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 67d:	be 00 00 00 00       	mov    $0x0,%esi
 682:	e9 03 ff ff ff       	jmp    58a <printf+0x2c>
        putc(fd, c);
 687:	89 fa                	mov    %edi,%edx
 689:	8b 45 08             	mov    0x8(%ebp),%eax
 68c:	e8 28 fe ff ff       	call   4b9 <putc>
      state = 0;
 691:	be 00 00 00 00       	mov    $0x0,%esi
 696:	e9 ef fe ff ff       	jmp    58a <printf+0x2c>
        putc(fd, '%');
 69b:	ba 25 00 00 00       	mov    $0x25,%edx
 6a0:	8b 45 08             	mov    0x8(%ebp),%eax
 6a3:	e8 11 fe ff ff       	call   4b9 <putc>
        putc(fd, c);
 6a8:	89 fa                	mov    %edi,%edx
 6aa:	8b 45 08             	mov    0x8(%ebp),%eax
 6ad:	e8 07 fe ff ff       	call   4b9 <putc>
      state = 0;
 6b2:	be 00 00 00 00       	mov    $0x0,%esi
 6b7:	e9 ce fe ff ff       	jmp    58a <printf+0x2c>
    }
  }
}
 6bc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6bf:	5b                   	pop    %ebx
 6c0:	5e                   	pop    %esi
 6c1:	5f                   	pop    %edi
 6c2:	5d                   	pop    %ebp
 6c3:	c3                   	ret    

000006c4 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6c4:	55                   	push   %ebp
 6c5:	89 e5                	mov    %esp,%ebp
 6c7:	57                   	push   %edi
 6c8:	56                   	push   %esi
 6c9:	53                   	push   %ebx
 6ca:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 6cd:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6d0:	a1 60 0f 00 00       	mov    0xf60,%eax
 6d5:	eb 02                	jmp    6d9 <free+0x15>
 6d7:	89 d0                	mov    %edx,%eax
 6d9:	39 c8                	cmp    %ecx,%eax
 6db:	73 04                	jae    6e1 <free+0x1d>
 6dd:	39 08                	cmp    %ecx,(%eax)
 6df:	77 12                	ja     6f3 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6e1:	8b 10                	mov    (%eax),%edx
 6e3:	39 c2                	cmp    %eax,%edx
 6e5:	77 f0                	ja     6d7 <free+0x13>
 6e7:	39 c8                	cmp    %ecx,%eax
 6e9:	72 08                	jb     6f3 <free+0x2f>
 6eb:	39 ca                	cmp    %ecx,%edx
 6ed:	77 04                	ja     6f3 <free+0x2f>
 6ef:	89 d0                	mov    %edx,%eax
 6f1:	eb e6                	jmp    6d9 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 6f3:	8b 73 fc             	mov    -0x4(%ebx),%esi
 6f6:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 6f9:	8b 10                	mov    (%eax),%edx
 6fb:	39 d7                	cmp    %edx,%edi
 6fd:	74 19                	je     718 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 6ff:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 702:	8b 50 04             	mov    0x4(%eax),%edx
 705:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 708:	39 ce                	cmp    %ecx,%esi
 70a:	74 1b                	je     727 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 70c:	89 08                	mov    %ecx,(%eax)
  freep = p;
 70e:	a3 60 0f 00 00       	mov    %eax,0xf60
}
 713:	5b                   	pop    %ebx
 714:	5e                   	pop    %esi
 715:	5f                   	pop    %edi
 716:	5d                   	pop    %ebp
 717:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 718:	03 72 04             	add    0x4(%edx),%esi
 71b:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 71e:	8b 10                	mov    (%eax),%edx
 720:	8b 12                	mov    (%edx),%edx
 722:	89 53 f8             	mov    %edx,-0x8(%ebx)
 725:	eb db                	jmp    702 <free+0x3e>
    p->s.size += bp->s.size;
 727:	03 53 fc             	add    -0x4(%ebx),%edx
 72a:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 72d:	8b 53 f8             	mov    -0x8(%ebx),%edx
 730:	89 10                	mov    %edx,(%eax)
 732:	eb da                	jmp    70e <free+0x4a>

00000734 <morecore>:

static Header*
morecore(uint nu)
{
 734:	55                   	push   %ebp
 735:	89 e5                	mov    %esp,%ebp
 737:	53                   	push   %ebx
 738:	83 ec 04             	sub    $0x4,%esp
 73b:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 73d:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 742:	77 05                	ja     749 <morecore+0x15>
    nu = 4096;
 744:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 749:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 750:	83 ec 0c             	sub    $0xc,%esp
 753:	50                   	push   %eax
 754:	e8 38 fd ff ff       	call   491 <sbrk>
  if(p == (char*)-1)
 759:	83 c4 10             	add    $0x10,%esp
 75c:	83 f8 ff             	cmp    $0xffffffff,%eax
 75f:	74 1c                	je     77d <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 761:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 764:	83 c0 08             	add    $0x8,%eax
 767:	83 ec 0c             	sub    $0xc,%esp
 76a:	50                   	push   %eax
 76b:	e8 54 ff ff ff       	call   6c4 <free>
  return freep;
 770:	a1 60 0f 00 00       	mov    0xf60,%eax
 775:	83 c4 10             	add    $0x10,%esp
}
 778:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 77b:	c9                   	leave  
 77c:	c3                   	ret    
    return 0;
 77d:	b8 00 00 00 00       	mov    $0x0,%eax
 782:	eb f4                	jmp    778 <morecore+0x44>

00000784 <malloc>:

void*
malloc(uint nbytes)
{
 784:	55                   	push   %ebp
 785:	89 e5                	mov    %esp,%ebp
 787:	53                   	push   %ebx
 788:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 78b:	8b 45 08             	mov    0x8(%ebp),%eax
 78e:	8d 58 07             	lea    0x7(%eax),%ebx
 791:	c1 eb 03             	shr    $0x3,%ebx
 794:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 797:	8b 0d 60 0f 00 00    	mov    0xf60,%ecx
 79d:	85 c9                	test   %ecx,%ecx
 79f:	74 04                	je     7a5 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7a1:	8b 01                	mov    (%ecx),%eax
 7a3:	eb 4a                	jmp    7ef <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 7a5:	c7 05 60 0f 00 00 64 	movl   $0xf64,0xf60
 7ac:	0f 00 00 
 7af:	c7 05 64 0f 00 00 64 	movl   $0xf64,0xf64
 7b6:	0f 00 00 
    base.s.size = 0;
 7b9:	c7 05 68 0f 00 00 00 	movl   $0x0,0xf68
 7c0:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 7c3:	b9 64 0f 00 00       	mov    $0xf64,%ecx
 7c8:	eb d7                	jmp    7a1 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 7ca:	74 19                	je     7e5 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 7cc:	29 da                	sub    %ebx,%edx
 7ce:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 7d1:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 7d4:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 7d7:	89 0d 60 0f 00 00    	mov    %ecx,0xf60
      return (void*)(p + 1);
 7dd:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 7e0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 7e3:	c9                   	leave  
 7e4:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 7e5:	8b 10                	mov    (%eax),%edx
 7e7:	89 11                	mov    %edx,(%ecx)
 7e9:	eb ec                	jmp    7d7 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7eb:	89 c1                	mov    %eax,%ecx
 7ed:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 7ef:	8b 50 04             	mov    0x4(%eax),%edx
 7f2:	39 da                	cmp    %ebx,%edx
 7f4:	73 d4                	jae    7ca <malloc+0x46>
    if(p == freep)
 7f6:	39 05 60 0f 00 00    	cmp    %eax,0xf60
 7fc:	75 ed                	jne    7eb <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 7fe:	89 d8                	mov    %ebx,%eax
 800:	e8 2f ff ff ff       	call   734 <morecore>
 805:	85 c0                	test   %eax,%eax
 807:	75 e2                	jne    7eb <malloc+0x67>
 809:	eb d5                	jmp    7e0 <malloc+0x5c>
