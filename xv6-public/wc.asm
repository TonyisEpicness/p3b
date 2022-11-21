
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
  2b:	68 c0 0b 00 00       	push   $0xbc0
  30:	ff 75 08             	push   0x8(%ebp)
  33:	e8 68 03 00 00       	call   3a0 <read>
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
  4f:	68 8c 07 00 00       	push   $0x78c
  54:	e8 0d 02 00 00       	call   266 <strchr>
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
  71:	0f b6 83 c0 0b 00 00 	movzbl 0xbc0(%ebx),%eax
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
  a4:	68 a2 07 00 00       	push   $0x7a2
  a9:	6a 01                	push   $0x1
  ab:	e8 2d 04 00 00       	call   4dd <printf>
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
  be:	68 92 07 00 00       	push   $0x792
  c3:	6a 01                	push   $0x1
  c5:	e8 13 04 00 00       	call   4dd <printf>
    exit();
  ca:	e8 b9 02 00 00       	call   388 <exit>

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
  fd:	68 a1 07 00 00       	push   $0x7a1
 102:	6a 00                	push   $0x0
 104:	e8 f7 fe ff ff       	call   0 <wc>
    exit();
 109:	e8 7a 02 00 00       	call   388 <exit>
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
 11c:	e8 8f 02 00 00       	call   3b0 <close>
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
 139:	e8 8a 02 00 00       	call   3c8 <open>
 13e:	89 c3                	mov    %eax,%ebx
 140:	83 c4 10             	add    $0x10,%esp
 143:	85 c0                	test   %eax,%eax
 145:	79 c7                	jns    10e <main+0x3f>
      printf(1, "wc: cannot open %s\n", argv[i]);
 147:	83 ec 04             	sub    $0x4,%esp
 14a:	ff 37                	push   (%edi)
 14c:	68 af 07 00 00       	push   $0x7af
 151:	6a 01                	push   $0x1
 153:	e8 85 03 00 00       	call   4dd <printf>
      exit();
 158:	e8 2b 02 00 00       	call   388 <exit>
  }
  exit();
 15d:	e8 26 02 00 00       	call   388 <exit>

00000162 <test_and_set>:
#include "fcntl.h"
#include "user.h"
#include "x86.h"
#include "mmu.h"

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
  void *n_stack = malloc(PGSIZE);
 179:	68 00 10 00 00       	push   $0x1000
 17e:	e8 80 05 00 00       	call   703 <malloc>
  if(n_stack == 0){
 183:	83 c4 10             	add    $0x10,%esp
 186:	85 c0                	test   %eax,%eax
 188:	74 14                	je     19e <thread_create+0x2b>
    return -1;
  }
  int new_pid = clone(start_routine, arg1, arg2, n_stack); // TODO: is this the right way to call it?
 18a:	50                   	push   %eax
 18b:	ff 75 10             	push   0x10(%ebp)
 18e:	ff 75 0c             	push   0xc(%ebp)
 191:	ff 75 08             	push   0x8(%ebp)
 194:	e8 8f 02 00 00       	call   428 <clone>


  // I can't remember if there was something else to do here but I'm sure I'll find out


  return new_pid;
 199:	83 c4 10             	add    $0x10,%esp
}
 19c:	c9                   	leave  
 19d:	c3                   	ret    
    return -1;
 19e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 1a3:	eb f7                	jmp    19c <thread_create+0x29>

000001a5 <thread_join>:

int thread_join() {
  return 0;
}
 1a5:	b8 00 00 00 00       	mov    $0x0,%eax
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
 1bb:	e8 a2 ff ff ff       	call   162 <test_and_set>
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

00000438 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 438:	55                   	push   %ebp
 439:	89 e5                	mov    %esp,%ebp
 43b:	83 ec 1c             	sub    $0x1c,%esp
 43e:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 441:	6a 01                	push   $0x1
 443:	8d 55 f4             	lea    -0xc(%ebp),%edx
 446:	52                   	push   %edx
 447:	50                   	push   %eax
 448:	e8 5b ff ff ff       	call   3a8 <write>
}
 44d:	83 c4 10             	add    $0x10,%esp
 450:	c9                   	leave  
 451:	c3                   	ret    

00000452 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 452:	55                   	push   %ebp
 453:	89 e5                	mov    %esp,%ebp
 455:	57                   	push   %edi
 456:	56                   	push   %esi
 457:	53                   	push   %ebx
 458:	83 ec 2c             	sub    $0x2c,%esp
 45b:	89 45 d0             	mov    %eax,-0x30(%ebp)
 45e:	89 d0                	mov    %edx,%eax
 460:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 462:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 466:	0f 95 c1             	setne  %cl
 469:	c1 ea 1f             	shr    $0x1f,%edx
 46c:	84 d1                	test   %dl,%cl
 46e:	74 44                	je     4b4 <printint+0x62>
    neg = 1;
    x = -xx;
 470:	f7 d8                	neg    %eax
 472:	89 c1                	mov    %eax,%ecx
    neg = 1;
 474:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 47b:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 480:	89 c8                	mov    %ecx,%eax
 482:	ba 00 00 00 00       	mov    $0x0,%edx
 487:	f7 f6                	div    %esi
 489:	89 df                	mov    %ebx,%edi
 48b:	83 c3 01             	add    $0x1,%ebx
 48e:	0f b6 92 24 08 00 00 	movzbl 0x824(%edx),%edx
 495:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 499:	89 ca                	mov    %ecx,%edx
 49b:	89 c1                	mov    %eax,%ecx
 49d:	39 d6                	cmp    %edx,%esi
 49f:	76 df                	jbe    480 <printint+0x2e>
  if(neg)
 4a1:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 4a5:	74 31                	je     4d8 <printint+0x86>
    buf[i++] = '-';
 4a7:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 4ac:	8d 5f 02             	lea    0x2(%edi),%ebx
 4af:	8b 75 d0             	mov    -0x30(%ebp),%esi
 4b2:	eb 17                	jmp    4cb <printint+0x79>
    x = xx;
 4b4:	89 c1                	mov    %eax,%ecx
  neg = 0;
 4b6:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 4bd:	eb bc                	jmp    47b <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 4bf:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 4c4:	89 f0                	mov    %esi,%eax
 4c6:	e8 6d ff ff ff       	call   438 <putc>
  while(--i >= 0)
 4cb:	83 eb 01             	sub    $0x1,%ebx
 4ce:	79 ef                	jns    4bf <printint+0x6d>
}
 4d0:	83 c4 2c             	add    $0x2c,%esp
 4d3:	5b                   	pop    %ebx
 4d4:	5e                   	pop    %esi
 4d5:	5f                   	pop    %edi
 4d6:	5d                   	pop    %ebp
 4d7:	c3                   	ret    
 4d8:	8b 75 d0             	mov    -0x30(%ebp),%esi
 4db:	eb ee                	jmp    4cb <printint+0x79>

000004dd <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 4dd:	55                   	push   %ebp
 4de:	89 e5                	mov    %esp,%ebp
 4e0:	57                   	push   %edi
 4e1:	56                   	push   %esi
 4e2:	53                   	push   %ebx
 4e3:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 4e6:	8d 45 10             	lea    0x10(%ebp),%eax
 4e9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 4ec:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 4f1:	bb 00 00 00 00       	mov    $0x0,%ebx
 4f6:	eb 14                	jmp    50c <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 4f8:	89 fa                	mov    %edi,%edx
 4fa:	8b 45 08             	mov    0x8(%ebp),%eax
 4fd:	e8 36 ff ff ff       	call   438 <putc>
 502:	eb 05                	jmp    509 <printf+0x2c>
      }
    } else if(state == '%'){
 504:	83 fe 25             	cmp    $0x25,%esi
 507:	74 25                	je     52e <printf+0x51>
  for(i = 0; fmt[i]; i++){
 509:	83 c3 01             	add    $0x1,%ebx
 50c:	8b 45 0c             	mov    0xc(%ebp),%eax
 50f:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 513:	84 c0                	test   %al,%al
 515:	0f 84 20 01 00 00    	je     63b <printf+0x15e>
    c = fmt[i] & 0xff;
 51b:	0f be f8             	movsbl %al,%edi
 51e:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 521:	85 f6                	test   %esi,%esi
 523:	75 df                	jne    504 <printf+0x27>
      if(c == '%'){
 525:	83 f8 25             	cmp    $0x25,%eax
 528:	75 ce                	jne    4f8 <printf+0x1b>
        state = '%';
 52a:	89 c6                	mov    %eax,%esi
 52c:	eb db                	jmp    509 <printf+0x2c>
      if(c == 'd'){
 52e:	83 f8 25             	cmp    $0x25,%eax
 531:	0f 84 cf 00 00 00    	je     606 <printf+0x129>
 537:	0f 8c dd 00 00 00    	jl     61a <printf+0x13d>
 53d:	83 f8 78             	cmp    $0x78,%eax
 540:	0f 8f d4 00 00 00    	jg     61a <printf+0x13d>
 546:	83 f8 63             	cmp    $0x63,%eax
 549:	0f 8c cb 00 00 00    	jl     61a <printf+0x13d>
 54f:	83 e8 63             	sub    $0x63,%eax
 552:	83 f8 15             	cmp    $0x15,%eax
 555:	0f 87 bf 00 00 00    	ja     61a <printf+0x13d>
 55b:	ff 24 85 cc 07 00 00 	jmp    *0x7cc(,%eax,4)
        printint(fd, *ap, 10, 1);
 562:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 565:	8b 17                	mov    (%edi),%edx
 567:	83 ec 0c             	sub    $0xc,%esp
 56a:	6a 01                	push   $0x1
 56c:	b9 0a 00 00 00       	mov    $0xa,%ecx
 571:	8b 45 08             	mov    0x8(%ebp),%eax
 574:	e8 d9 fe ff ff       	call   452 <printint>
        ap++;
 579:	83 c7 04             	add    $0x4,%edi
 57c:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 57f:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 582:	be 00 00 00 00       	mov    $0x0,%esi
 587:	eb 80                	jmp    509 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 589:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 58c:	8b 17                	mov    (%edi),%edx
 58e:	83 ec 0c             	sub    $0xc,%esp
 591:	6a 00                	push   $0x0
 593:	b9 10 00 00 00       	mov    $0x10,%ecx
 598:	8b 45 08             	mov    0x8(%ebp),%eax
 59b:	e8 b2 fe ff ff       	call   452 <printint>
        ap++;
 5a0:	83 c7 04             	add    $0x4,%edi
 5a3:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 5a6:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5a9:	be 00 00 00 00       	mov    $0x0,%esi
 5ae:	e9 56 ff ff ff       	jmp    509 <printf+0x2c>
        s = (char*)*ap;
 5b3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5b6:	8b 30                	mov    (%eax),%esi
        ap++;
 5b8:	83 c0 04             	add    $0x4,%eax
 5bb:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 5be:	85 f6                	test   %esi,%esi
 5c0:	75 15                	jne    5d7 <printf+0xfa>
          s = "(null)";
 5c2:	be c3 07 00 00       	mov    $0x7c3,%esi
 5c7:	eb 0e                	jmp    5d7 <printf+0xfa>
          putc(fd, *s);
 5c9:	0f be d2             	movsbl %dl,%edx
 5cc:	8b 45 08             	mov    0x8(%ebp),%eax
 5cf:	e8 64 fe ff ff       	call   438 <putc>
          s++;
 5d4:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 5d7:	0f b6 16             	movzbl (%esi),%edx
 5da:	84 d2                	test   %dl,%dl
 5dc:	75 eb                	jne    5c9 <printf+0xec>
      state = 0;
 5de:	be 00 00 00 00       	mov    $0x0,%esi
 5e3:	e9 21 ff ff ff       	jmp    509 <printf+0x2c>
        putc(fd, *ap);
 5e8:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5eb:	0f be 17             	movsbl (%edi),%edx
 5ee:	8b 45 08             	mov    0x8(%ebp),%eax
 5f1:	e8 42 fe ff ff       	call   438 <putc>
        ap++;
 5f6:	83 c7 04             	add    $0x4,%edi
 5f9:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 5fc:	be 00 00 00 00       	mov    $0x0,%esi
 601:	e9 03 ff ff ff       	jmp    509 <printf+0x2c>
        putc(fd, c);
 606:	89 fa                	mov    %edi,%edx
 608:	8b 45 08             	mov    0x8(%ebp),%eax
 60b:	e8 28 fe ff ff       	call   438 <putc>
      state = 0;
 610:	be 00 00 00 00       	mov    $0x0,%esi
 615:	e9 ef fe ff ff       	jmp    509 <printf+0x2c>
        putc(fd, '%');
 61a:	ba 25 00 00 00       	mov    $0x25,%edx
 61f:	8b 45 08             	mov    0x8(%ebp),%eax
 622:	e8 11 fe ff ff       	call   438 <putc>
        putc(fd, c);
 627:	89 fa                	mov    %edi,%edx
 629:	8b 45 08             	mov    0x8(%ebp),%eax
 62c:	e8 07 fe ff ff       	call   438 <putc>
      state = 0;
 631:	be 00 00 00 00       	mov    $0x0,%esi
 636:	e9 ce fe ff ff       	jmp    509 <printf+0x2c>
    }
  }
}
 63b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 63e:	5b                   	pop    %ebx
 63f:	5e                   	pop    %esi
 640:	5f                   	pop    %edi
 641:	5d                   	pop    %ebp
 642:	c3                   	ret    

00000643 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 643:	55                   	push   %ebp
 644:	89 e5                	mov    %esp,%ebp
 646:	57                   	push   %edi
 647:	56                   	push   %esi
 648:	53                   	push   %ebx
 649:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 64c:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 64f:	a1 c0 0d 00 00       	mov    0xdc0,%eax
 654:	eb 02                	jmp    658 <free+0x15>
 656:	89 d0                	mov    %edx,%eax
 658:	39 c8                	cmp    %ecx,%eax
 65a:	73 04                	jae    660 <free+0x1d>
 65c:	39 08                	cmp    %ecx,(%eax)
 65e:	77 12                	ja     672 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 660:	8b 10                	mov    (%eax),%edx
 662:	39 c2                	cmp    %eax,%edx
 664:	77 f0                	ja     656 <free+0x13>
 666:	39 c8                	cmp    %ecx,%eax
 668:	72 08                	jb     672 <free+0x2f>
 66a:	39 ca                	cmp    %ecx,%edx
 66c:	77 04                	ja     672 <free+0x2f>
 66e:	89 d0                	mov    %edx,%eax
 670:	eb e6                	jmp    658 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 672:	8b 73 fc             	mov    -0x4(%ebx),%esi
 675:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 678:	8b 10                	mov    (%eax),%edx
 67a:	39 d7                	cmp    %edx,%edi
 67c:	74 19                	je     697 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 67e:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 681:	8b 50 04             	mov    0x4(%eax),%edx
 684:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 687:	39 ce                	cmp    %ecx,%esi
 689:	74 1b                	je     6a6 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 68b:	89 08                	mov    %ecx,(%eax)
  freep = p;
 68d:	a3 c0 0d 00 00       	mov    %eax,0xdc0
}
 692:	5b                   	pop    %ebx
 693:	5e                   	pop    %esi
 694:	5f                   	pop    %edi
 695:	5d                   	pop    %ebp
 696:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 697:	03 72 04             	add    0x4(%edx),%esi
 69a:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 69d:	8b 10                	mov    (%eax),%edx
 69f:	8b 12                	mov    (%edx),%edx
 6a1:	89 53 f8             	mov    %edx,-0x8(%ebx)
 6a4:	eb db                	jmp    681 <free+0x3e>
    p->s.size += bp->s.size;
 6a6:	03 53 fc             	add    -0x4(%ebx),%edx
 6a9:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6ac:	8b 53 f8             	mov    -0x8(%ebx),%edx
 6af:	89 10                	mov    %edx,(%eax)
 6b1:	eb da                	jmp    68d <free+0x4a>

000006b3 <morecore>:

static Header*
morecore(uint nu)
{
 6b3:	55                   	push   %ebp
 6b4:	89 e5                	mov    %esp,%ebp
 6b6:	53                   	push   %ebx
 6b7:	83 ec 04             	sub    $0x4,%esp
 6ba:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 6bc:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 6c1:	77 05                	ja     6c8 <morecore+0x15>
    nu = 4096;
 6c3:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 6c8:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 6cf:	83 ec 0c             	sub    $0xc,%esp
 6d2:	50                   	push   %eax
 6d3:	e8 38 fd ff ff       	call   410 <sbrk>
  if(p == (char*)-1)
 6d8:	83 c4 10             	add    $0x10,%esp
 6db:	83 f8 ff             	cmp    $0xffffffff,%eax
 6de:	74 1c                	je     6fc <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 6e0:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 6e3:	83 c0 08             	add    $0x8,%eax
 6e6:	83 ec 0c             	sub    $0xc,%esp
 6e9:	50                   	push   %eax
 6ea:	e8 54 ff ff ff       	call   643 <free>
  return freep;
 6ef:	a1 c0 0d 00 00       	mov    0xdc0,%eax
 6f4:	83 c4 10             	add    $0x10,%esp
}
 6f7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 6fa:	c9                   	leave  
 6fb:	c3                   	ret    
    return 0;
 6fc:	b8 00 00 00 00       	mov    $0x0,%eax
 701:	eb f4                	jmp    6f7 <morecore+0x44>

00000703 <malloc>:

void*
malloc(uint nbytes)
{
 703:	55                   	push   %ebp
 704:	89 e5                	mov    %esp,%ebp
 706:	53                   	push   %ebx
 707:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 70a:	8b 45 08             	mov    0x8(%ebp),%eax
 70d:	8d 58 07             	lea    0x7(%eax),%ebx
 710:	c1 eb 03             	shr    $0x3,%ebx
 713:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 716:	8b 0d c0 0d 00 00    	mov    0xdc0,%ecx
 71c:	85 c9                	test   %ecx,%ecx
 71e:	74 04                	je     724 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 720:	8b 01                	mov    (%ecx),%eax
 722:	eb 4a                	jmp    76e <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 724:	c7 05 c0 0d 00 00 c4 	movl   $0xdc4,0xdc0
 72b:	0d 00 00 
 72e:	c7 05 c4 0d 00 00 c4 	movl   $0xdc4,0xdc4
 735:	0d 00 00 
    base.s.size = 0;
 738:	c7 05 c8 0d 00 00 00 	movl   $0x0,0xdc8
 73f:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 742:	b9 c4 0d 00 00       	mov    $0xdc4,%ecx
 747:	eb d7                	jmp    720 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 749:	74 19                	je     764 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 74b:	29 da                	sub    %ebx,%edx
 74d:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 750:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 753:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 756:	89 0d c0 0d 00 00    	mov    %ecx,0xdc0
      return (void*)(p + 1);
 75c:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 75f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 762:	c9                   	leave  
 763:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 764:	8b 10                	mov    (%eax),%edx
 766:	89 11                	mov    %edx,(%ecx)
 768:	eb ec                	jmp    756 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 76a:	89 c1                	mov    %eax,%ecx
 76c:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 76e:	8b 50 04             	mov    0x4(%eax),%edx
 771:	39 da                	cmp    %ebx,%edx
 773:	73 d4                	jae    749 <malloc+0x46>
    if(p == freep)
 775:	39 05 c0 0d 00 00    	cmp    %eax,0xdc0
 77b:	75 ed                	jne    76a <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 77d:	89 d8                	mov    %ebx,%eax
 77f:	e8 2f ff ff ff       	call   6b3 <morecore>
 784:	85 c0                	test   %eax,%eax
 786:	75 e2                	jne    76a <malloc+0x67>
 788:	eb d5                	jmp    75f <malloc+0x5c>
