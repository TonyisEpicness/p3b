
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
  2b:	68 e0 0b 00 00       	push   $0xbe0
  30:	ff 75 08             	push   0x8(%ebp)
  33:	e8 73 03 00 00       	call   3ab <read>
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
  4f:	68 98 07 00 00       	push   $0x798
  54:	e8 18 02 00 00       	call   271 <strchr>
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
  71:	0f b6 83 e0 0b 00 00 	movzbl 0xbe0(%ebx),%eax
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
  a4:	68 ae 07 00 00       	push   $0x7ae
  a9:	6a 01                	push   $0x1
  ab:	e8 38 04 00 00       	call   4e8 <printf>
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
  be:	68 9e 07 00 00       	push   $0x79e
  c3:	6a 01                	push   $0x1
  c5:	e8 1e 04 00 00       	call   4e8 <printf>
    exit();
  ca:	e8 c4 02 00 00       	call   393 <exit>

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
  fd:	68 ad 07 00 00       	push   $0x7ad
 102:	6a 00                	push   $0x0
 104:	e8 f7 fe ff ff       	call   0 <wc>
    exit();
 109:	e8 85 02 00 00       	call   393 <exit>
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
 11c:	e8 9a 02 00 00       	call   3bb <close>
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
 139:	e8 95 02 00 00       	call   3d3 <open>
 13e:	89 c3                	mov    %eax,%ebx
 140:	83 c4 10             	add    $0x10,%esp
 143:	85 c0                	test   %eax,%eax
 145:	79 c7                	jns    10e <main+0x3f>
      printf(1, "wc: cannot open %s\n", argv[i]);
 147:	83 ec 04             	sub    $0x4,%esp
 14a:	ff 37                	push   (%edi)
 14c:	68 bb 07 00 00       	push   $0x7bb
 151:	6a 01                	push   $0x1
 153:	e8 90 03 00 00       	call   4e8 <printf>
      exit();
 158:	e8 36 02 00 00       	call   393 <exit>
  }
  exit();
 15d:	e8 31 02 00 00       	call   393 <exit>

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
  void *n_stack = malloc(PGSIZE*2);
 179:	68 00 20 00 00       	push   $0x2000
 17e:	e8 8b 05 00 00       	call   70e <malloc>
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
 194:	e8 9a 02 00 00       	call   433 <clone>


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
 1a5:	55                   	push   %ebp
 1a6:	89 e5                	mov    %esp,%ebp
 1a8:	83 ec 24             	sub    $0x24,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 1ab:	8d 45 f4             	lea    -0xc(%ebp),%eax
 1ae:	50                   	push   %eax
 1af:	e8 87 02 00 00       	call   43b <join>
  
  return pid;
}
 1b4:	c9                   	leave  
 1b5:	c3                   	ret    

000001b6 <lock_acquire>:

void lock_acquire(lock_t *lock){
 1b6:	55                   	push   %ebp
 1b7:	89 e5                	mov    %esp,%ebp
 1b9:	53                   	push   %ebx
 1ba:	83 ec 04             	sub    $0x4,%esp
 1bd:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 1c0:	83 ec 08             	sub    $0x8,%esp
 1c3:	6a 01                	push   $0x1
 1c5:	53                   	push   %ebx
 1c6:	e8 97 ff ff ff       	call   162 <test_and_set>
 1cb:	83 c4 10             	add    $0x10,%esp
 1ce:	83 f8 01             	cmp    $0x1,%eax
 1d1:	74 ed                	je     1c0 <lock_acquire+0xa>
    ;
}
 1d3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1d6:	c9                   	leave  
 1d7:	c3                   	ret    

000001d8 <lock_release>:

void lock_release(lock_t *lock) {
 1d8:	55                   	push   %ebp
 1d9:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 1db:	8b 45 08             	mov    0x8(%ebp),%eax
 1de:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 1e4:	5d                   	pop    %ebp
 1e5:	c3                   	ret    

000001e6 <lock_init>:

void lock_init(lock_t *lock) {
 1e6:	55                   	push   %ebp
 1e7:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 1e9:	8b 45 08             	mov    0x8(%ebp),%eax
 1ec:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 1f2:	5d                   	pop    %ebp
 1f3:	c3                   	ret    

000001f4 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 1f4:	55                   	push   %ebp
 1f5:	89 e5                	mov    %esp,%ebp
 1f7:	56                   	push   %esi
 1f8:	53                   	push   %ebx
 1f9:	8b 75 08             	mov    0x8(%ebp),%esi
 1fc:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 1ff:	89 f0                	mov    %esi,%eax
 201:	89 d1                	mov    %edx,%ecx
 203:	83 c2 01             	add    $0x1,%edx
 206:	89 c3                	mov    %eax,%ebx
 208:	83 c0 01             	add    $0x1,%eax
 20b:	0f b6 09             	movzbl (%ecx),%ecx
 20e:	88 0b                	mov    %cl,(%ebx)
 210:	84 c9                	test   %cl,%cl
 212:	75 ed                	jne    201 <strcpy+0xd>
    ;
  return os;
}
 214:	89 f0                	mov    %esi,%eax
 216:	5b                   	pop    %ebx
 217:	5e                   	pop    %esi
 218:	5d                   	pop    %ebp
 219:	c3                   	ret    

0000021a <strcmp>:

int
strcmp(const char *p, const char *q)
{
 21a:	55                   	push   %ebp
 21b:	89 e5                	mov    %esp,%ebp
 21d:	8b 4d 08             	mov    0x8(%ebp),%ecx
 220:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 223:	eb 06                	jmp    22b <strcmp+0x11>
    p++, q++;
 225:	83 c1 01             	add    $0x1,%ecx
 228:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 22b:	0f b6 01             	movzbl (%ecx),%eax
 22e:	84 c0                	test   %al,%al
 230:	74 04                	je     236 <strcmp+0x1c>
 232:	3a 02                	cmp    (%edx),%al
 234:	74 ef                	je     225 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 236:	0f b6 c0             	movzbl %al,%eax
 239:	0f b6 12             	movzbl (%edx),%edx
 23c:	29 d0                	sub    %edx,%eax
}
 23e:	5d                   	pop    %ebp
 23f:	c3                   	ret    

00000240 <strlen>:

uint
strlen(const char *s)
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 246:	b8 00 00 00 00       	mov    $0x0,%eax
 24b:	eb 03                	jmp    250 <strlen+0x10>
 24d:	83 c0 01             	add    $0x1,%eax
 250:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 254:	75 f7                	jne    24d <strlen+0xd>
    ;
  return n;
}
 256:	5d                   	pop    %ebp
 257:	c3                   	ret    

00000258 <memset>:

void*
memset(void *dst, int c, uint n)
{
 258:	55                   	push   %ebp
 259:	89 e5                	mov    %esp,%ebp
 25b:	57                   	push   %edi
 25c:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 25f:	89 d7                	mov    %edx,%edi
 261:	8b 4d 10             	mov    0x10(%ebp),%ecx
 264:	8b 45 0c             	mov    0xc(%ebp),%eax
 267:	fc                   	cld    
 268:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 26a:	89 d0                	mov    %edx,%eax
 26c:	8b 7d fc             	mov    -0x4(%ebp),%edi
 26f:	c9                   	leave  
 270:	c3                   	ret    

00000271 <strchr>:

char*
strchr(const char *s, char c)
{
 271:	55                   	push   %ebp
 272:	89 e5                	mov    %esp,%ebp
 274:	8b 45 08             	mov    0x8(%ebp),%eax
 277:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 27b:	eb 03                	jmp    280 <strchr+0xf>
 27d:	83 c0 01             	add    $0x1,%eax
 280:	0f b6 10             	movzbl (%eax),%edx
 283:	84 d2                	test   %dl,%dl
 285:	74 06                	je     28d <strchr+0x1c>
    if(*s == c)
 287:	38 ca                	cmp    %cl,%dl
 289:	75 f2                	jne    27d <strchr+0xc>
 28b:	eb 05                	jmp    292 <strchr+0x21>
      return (char*)s;
  return 0;
 28d:	b8 00 00 00 00       	mov    $0x0,%eax
}
 292:	5d                   	pop    %ebp
 293:	c3                   	ret    

00000294 <gets>:

char*
gets(char *buf, int max)
{
 294:	55                   	push   %ebp
 295:	89 e5                	mov    %esp,%ebp
 297:	57                   	push   %edi
 298:	56                   	push   %esi
 299:	53                   	push   %ebx
 29a:	83 ec 1c             	sub    $0x1c,%esp
 29d:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2a0:	bb 00 00 00 00       	mov    $0x0,%ebx
 2a5:	89 de                	mov    %ebx,%esi
 2a7:	83 c3 01             	add    $0x1,%ebx
 2aa:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2ad:	7d 2e                	jge    2dd <gets+0x49>
    cc = read(0, &c, 1);
 2af:	83 ec 04             	sub    $0x4,%esp
 2b2:	6a 01                	push   $0x1
 2b4:	8d 45 e7             	lea    -0x19(%ebp),%eax
 2b7:	50                   	push   %eax
 2b8:	6a 00                	push   $0x0
 2ba:	e8 ec 00 00 00       	call   3ab <read>
    if(cc < 1)
 2bf:	83 c4 10             	add    $0x10,%esp
 2c2:	85 c0                	test   %eax,%eax
 2c4:	7e 17                	jle    2dd <gets+0x49>
      break;
    buf[i++] = c;
 2c6:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2ca:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 2cd:	3c 0a                	cmp    $0xa,%al
 2cf:	0f 94 c2             	sete   %dl
 2d2:	3c 0d                	cmp    $0xd,%al
 2d4:	0f 94 c0             	sete   %al
 2d7:	08 c2                	or     %al,%dl
 2d9:	74 ca                	je     2a5 <gets+0x11>
    buf[i++] = c;
 2db:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 2dd:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 2e1:	89 f8                	mov    %edi,%eax
 2e3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2e6:	5b                   	pop    %ebx
 2e7:	5e                   	pop    %esi
 2e8:	5f                   	pop    %edi
 2e9:	5d                   	pop    %ebp
 2ea:	c3                   	ret    

000002eb <stat>:

int
stat(const char *n, struct stat *st)
{
 2eb:	55                   	push   %ebp
 2ec:	89 e5                	mov    %esp,%ebp
 2ee:	56                   	push   %esi
 2ef:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2f0:	83 ec 08             	sub    $0x8,%esp
 2f3:	6a 00                	push   $0x0
 2f5:	ff 75 08             	push   0x8(%ebp)
 2f8:	e8 d6 00 00 00       	call   3d3 <open>
  if(fd < 0)
 2fd:	83 c4 10             	add    $0x10,%esp
 300:	85 c0                	test   %eax,%eax
 302:	78 24                	js     328 <stat+0x3d>
 304:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 306:	83 ec 08             	sub    $0x8,%esp
 309:	ff 75 0c             	push   0xc(%ebp)
 30c:	50                   	push   %eax
 30d:	e8 d9 00 00 00       	call   3eb <fstat>
 312:	89 c6                	mov    %eax,%esi
  close(fd);
 314:	89 1c 24             	mov    %ebx,(%esp)
 317:	e8 9f 00 00 00       	call   3bb <close>
  return r;
 31c:	83 c4 10             	add    $0x10,%esp
}
 31f:	89 f0                	mov    %esi,%eax
 321:	8d 65 f8             	lea    -0x8(%ebp),%esp
 324:	5b                   	pop    %ebx
 325:	5e                   	pop    %esi
 326:	5d                   	pop    %ebp
 327:	c3                   	ret    
    return -1;
 328:	be ff ff ff ff       	mov    $0xffffffff,%esi
 32d:	eb f0                	jmp    31f <stat+0x34>

0000032f <atoi>:

int
atoi(const char *s)
{
 32f:	55                   	push   %ebp
 330:	89 e5                	mov    %esp,%ebp
 332:	53                   	push   %ebx
 333:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 336:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 33b:	eb 10                	jmp    34d <atoi+0x1e>
    n = n*10 + *s++ - '0';
 33d:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 340:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 343:	83 c1 01             	add    $0x1,%ecx
 346:	0f be c0             	movsbl %al,%eax
 349:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 34d:	0f b6 01             	movzbl (%ecx),%eax
 350:	8d 58 d0             	lea    -0x30(%eax),%ebx
 353:	80 fb 09             	cmp    $0x9,%bl
 356:	76 e5                	jbe    33d <atoi+0xe>
  return n;
}
 358:	89 d0                	mov    %edx,%eax
 35a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 35d:	c9                   	leave  
 35e:	c3                   	ret    

0000035f <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 35f:	55                   	push   %ebp
 360:	89 e5                	mov    %esp,%ebp
 362:	56                   	push   %esi
 363:	53                   	push   %ebx
 364:	8b 75 08             	mov    0x8(%ebp),%esi
 367:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 36a:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 36d:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 36f:	eb 0d                	jmp    37e <memmove+0x1f>
    *dst++ = *src++;
 371:	0f b6 01             	movzbl (%ecx),%eax
 374:	88 02                	mov    %al,(%edx)
 376:	8d 49 01             	lea    0x1(%ecx),%ecx
 379:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 37c:	89 d8                	mov    %ebx,%eax
 37e:	8d 58 ff             	lea    -0x1(%eax),%ebx
 381:	85 c0                	test   %eax,%eax
 383:	7f ec                	jg     371 <memmove+0x12>
  return vdst;
}
 385:	89 f0                	mov    %esi,%eax
 387:	5b                   	pop    %ebx
 388:	5e                   	pop    %esi
 389:	5d                   	pop    %ebp
 38a:	c3                   	ret    

0000038b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 38b:	b8 01 00 00 00       	mov    $0x1,%eax
 390:	cd 40                	int    $0x40
 392:	c3                   	ret    

00000393 <exit>:
SYSCALL(exit)
 393:	b8 02 00 00 00       	mov    $0x2,%eax
 398:	cd 40                	int    $0x40
 39a:	c3                   	ret    

0000039b <wait>:
SYSCALL(wait)
 39b:	b8 03 00 00 00       	mov    $0x3,%eax
 3a0:	cd 40                	int    $0x40
 3a2:	c3                   	ret    

000003a3 <pipe>:
SYSCALL(pipe)
 3a3:	b8 04 00 00 00       	mov    $0x4,%eax
 3a8:	cd 40                	int    $0x40
 3aa:	c3                   	ret    

000003ab <read>:
SYSCALL(read)
 3ab:	b8 05 00 00 00       	mov    $0x5,%eax
 3b0:	cd 40                	int    $0x40
 3b2:	c3                   	ret    

000003b3 <write>:
SYSCALL(write)
 3b3:	b8 10 00 00 00       	mov    $0x10,%eax
 3b8:	cd 40                	int    $0x40
 3ba:	c3                   	ret    

000003bb <close>:
SYSCALL(close)
 3bb:	b8 15 00 00 00       	mov    $0x15,%eax
 3c0:	cd 40                	int    $0x40
 3c2:	c3                   	ret    

000003c3 <kill>:
SYSCALL(kill)
 3c3:	b8 06 00 00 00       	mov    $0x6,%eax
 3c8:	cd 40                	int    $0x40
 3ca:	c3                   	ret    

000003cb <exec>:
SYSCALL(exec)
 3cb:	b8 07 00 00 00       	mov    $0x7,%eax
 3d0:	cd 40                	int    $0x40
 3d2:	c3                   	ret    

000003d3 <open>:
SYSCALL(open)
 3d3:	b8 0f 00 00 00       	mov    $0xf,%eax
 3d8:	cd 40                	int    $0x40
 3da:	c3                   	ret    

000003db <mknod>:
SYSCALL(mknod)
 3db:	b8 11 00 00 00       	mov    $0x11,%eax
 3e0:	cd 40                	int    $0x40
 3e2:	c3                   	ret    

000003e3 <unlink>:
SYSCALL(unlink)
 3e3:	b8 12 00 00 00       	mov    $0x12,%eax
 3e8:	cd 40                	int    $0x40
 3ea:	c3                   	ret    

000003eb <fstat>:
SYSCALL(fstat)
 3eb:	b8 08 00 00 00       	mov    $0x8,%eax
 3f0:	cd 40                	int    $0x40
 3f2:	c3                   	ret    

000003f3 <link>:
SYSCALL(link)
 3f3:	b8 13 00 00 00       	mov    $0x13,%eax
 3f8:	cd 40                	int    $0x40
 3fa:	c3                   	ret    

000003fb <mkdir>:
SYSCALL(mkdir)
 3fb:	b8 14 00 00 00       	mov    $0x14,%eax
 400:	cd 40                	int    $0x40
 402:	c3                   	ret    

00000403 <chdir>:
SYSCALL(chdir)
 403:	b8 09 00 00 00       	mov    $0x9,%eax
 408:	cd 40                	int    $0x40
 40a:	c3                   	ret    

0000040b <dup>:
SYSCALL(dup)
 40b:	b8 0a 00 00 00       	mov    $0xa,%eax
 410:	cd 40                	int    $0x40
 412:	c3                   	ret    

00000413 <getpid>:
SYSCALL(getpid)
 413:	b8 0b 00 00 00       	mov    $0xb,%eax
 418:	cd 40                	int    $0x40
 41a:	c3                   	ret    

0000041b <sbrk>:
SYSCALL(sbrk)
 41b:	b8 0c 00 00 00       	mov    $0xc,%eax
 420:	cd 40                	int    $0x40
 422:	c3                   	ret    

00000423 <sleep>:
SYSCALL(sleep)
 423:	b8 0d 00 00 00       	mov    $0xd,%eax
 428:	cd 40                	int    $0x40
 42a:	c3                   	ret    

0000042b <uptime>:
SYSCALL(uptime)
 42b:	b8 0e 00 00 00       	mov    $0xe,%eax
 430:	cd 40                	int    $0x40
 432:	c3                   	ret    

00000433 <clone>:
SYSCALL(clone)
 433:	b8 16 00 00 00       	mov    $0x16,%eax
 438:	cd 40                	int    $0x40
 43a:	c3                   	ret    

0000043b <join>:
 43b:	b8 17 00 00 00       	mov    $0x17,%eax
 440:	cd 40                	int    $0x40
 442:	c3                   	ret    

00000443 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 443:	55                   	push   %ebp
 444:	89 e5                	mov    %esp,%ebp
 446:	83 ec 1c             	sub    $0x1c,%esp
 449:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 44c:	6a 01                	push   $0x1
 44e:	8d 55 f4             	lea    -0xc(%ebp),%edx
 451:	52                   	push   %edx
 452:	50                   	push   %eax
 453:	e8 5b ff ff ff       	call   3b3 <write>
}
 458:	83 c4 10             	add    $0x10,%esp
 45b:	c9                   	leave  
 45c:	c3                   	ret    

0000045d <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 45d:	55                   	push   %ebp
 45e:	89 e5                	mov    %esp,%ebp
 460:	57                   	push   %edi
 461:	56                   	push   %esi
 462:	53                   	push   %ebx
 463:	83 ec 2c             	sub    $0x2c,%esp
 466:	89 45 d0             	mov    %eax,-0x30(%ebp)
 469:	89 d0                	mov    %edx,%eax
 46b:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 46d:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 471:	0f 95 c1             	setne  %cl
 474:	c1 ea 1f             	shr    $0x1f,%edx
 477:	84 d1                	test   %dl,%cl
 479:	74 44                	je     4bf <printint+0x62>
    neg = 1;
    x = -xx;
 47b:	f7 d8                	neg    %eax
 47d:	89 c1                	mov    %eax,%ecx
    neg = 1;
 47f:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 486:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 48b:	89 c8                	mov    %ecx,%eax
 48d:	ba 00 00 00 00       	mov    $0x0,%edx
 492:	f7 f6                	div    %esi
 494:	89 df                	mov    %ebx,%edi
 496:	83 c3 01             	add    $0x1,%ebx
 499:	0f b6 92 30 08 00 00 	movzbl 0x830(%edx),%edx
 4a0:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 4a4:	89 ca                	mov    %ecx,%edx
 4a6:	89 c1                	mov    %eax,%ecx
 4a8:	39 d6                	cmp    %edx,%esi
 4aa:	76 df                	jbe    48b <printint+0x2e>
  if(neg)
 4ac:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 4b0:	74 31                	je     4e3 <printint+0x86>
    buf[i++] = '-';
 4b2:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 4b7:	8d 5f 02             	lea    0x2(%edi),%ebx
 4ba:	8b 75 d0             	mov    -0x30(%ebp),%esi
 4bd:	eb 17                	jmp    4d6 <printint+0x79>
    x = xx;
 4bf:	89 c1                	mov    %eax,%ecx
  neg = 0;
 4c1:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 4c8:	eb bc                	jmp    486 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 4ca:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 4cf:	89 f0                	mov    %esi,%eax
 4d1:	e8 6d ff ff ff       	call   443 <putc>
  while(--i >= 0)
 4d6:	83 eb 01             	sub    $0x1,%ebx
 4d9:	79 ef                	jns    4ca <printint+0x6d>
}
 4db:	83 c4 2c             	add    $0x2c,%esp
 4de:	5b                   	pop    %ebx
 4df:	5e                   	pop    %esi
 4e0:	5f                   	pop    %edi
 4e1:	5d                   	pop    %ebp
 4e2:	c3                   	ret    
 4e3:	8b 75 d0             	mov    -0x30(%ebp),%esi
 4e6:	eb ee                	jmp    4d6 <printint+0x79>

000004e8 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 4e8:	55                   	push   %ebp
 4e9:	89 e5                	mov    %esp,%ebp
 4eb:	57                   	push   %edi
 4ec:	56                   	push   %esi
 4ed:	53                   	push   %ebx
 4ee:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 4f1:	8d 45 10             	lea    0x10(%ebp),%eax
 4f4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 4f7:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 4fc:	bb 00 00 00 00       	mov    $0x0,%ebx
 501:	eb 14                	jmp    517 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 503:	89 fa                	mov    %edi,%edx
 505:	8b 45 08             	mov    0x8(%ebp),%eax
 508:	e8 36 ff ff ff       	call   443 <putc>
 50d:	eb 05                	jmp    514 <printf+0x2c>
      }
    } else if(state == '%'){
 50f:	83 fe 25             	cmp    $0x25,%esi
 512:	74 25                	je     539 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 514:	83 c3 01             	add    $0x1,%ebx
 517:	8b 45 0c             	mov    0xc(%ebp),%eax
 51a:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 51e:	84 c0                	test   %al,%al
 520:	0f 84 20 01 00 00    	je     646 <printf+0x15e>
    c = fmt[i] & 0xff;
 526:	0f be f8             	movsbl %al,%edi
 529:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 52c:	85 f6                	test   %esi,%esi
 52e:	75 df                	jne    50f <printf+0x27>
      if(c == '%'){
 530:	83 f8 25             	cmp    $0x25,%eax
 533:	75 ce                	jne    503 <printf+0x1b>
        state = '%';
 535:	89 c6                	mov    %eax,%esi
 537:	eb db                	jmp    514 <printf+0x2c>
      if(c == 'd'){
 539:	83 f8 25             	cmp    $0x25,%eax
 53c:	0f 84 cf 00 00 00    	je     611 <printf+0x129>
 542:	0f 8c dd 00 00 00    	jl     625 <printf+0x13d>
 548:	83 f8 78             	cmp    $0x78,%eax
 54b:	0f 8f d4 00 00 00    	jg     625 <printf+0x13d>
 551:	83 f8 63             	cmp    $0x63,%eax
 554:	0f 8c cb 00 00 00    	jl     625 <printf+0x13d>
 55a:	83 e8 63             	sub    $0x63,%eax
 55d:	83 f8 15             	cmp    $0x15,%eax
 560:	0f 87 bf 00 00 00    	ja     625 <printf+0x13d>
 566:	ff 24 85 d8 07 00 00 	jmp    *0x7d8(,%eax,4)
        printint(fd, *ap, 10, 1);
 56d:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 570:	8b 17                	mov    (%edi),%edx
 572:	83 ec 0c             	sub    $0xc,%esp
 575:	6a 01                	push   $0x1
 577:	b9 0a 00 00 00       	mov    $0xa,%ecx
 57c:	8b 45 08             	mov    0x8(%ebp),%eax
 57f:	e8 d9 fe ff ff       	call   45d <printint>
        ap++;
 584:	83 c7 04             	add    $0x4,%edi
 587:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 58a:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 58d:	be 00 00 00 00       	mov    $0x0,%esi
 592:	eb 80                	jmp    514 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 594:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 597:	8b 17                	mov    (%edi),%edx
 599:	83 ec 0c             	sub    $0xc,%esp
 59c:	6a 00                	push   $0x0
 59e:	b9 10 00 00 00       	mov    $0x10,%ecx
 5a3:	8b 45 08             	mov    0x8(%ebp),%eax
 5a6:	e8 b2 fe ff ff       	call   45d <printint>
        ap++;
 5ab:	83 c7 04             	add    $0x4,%edi
 5ae:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 5b1:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5b4:	be 00 00 00 00       	mov    $0x0,%esi
 5b9:	e9 56 ff ff ff       	jmp    514 <printf+0x2c>
        s = (char*)*ap;
 5be:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5c1:	8b 30                	mov    (%eax),%esi
        ap++;
 5c3:	83 c0 04             	add    $0x4,%eax
 5c6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 5c9:	85 f6                	test   %esi,%esi
 5cb:	75 15                	jne    5e2 <printf+0xfa>
          s = "(null)";
 5cd:	be cf 07 00 00       	mov    $0x7cf,%esi
 5d2:	eb 0e                	jmp    5e2 <printf+0xfa>
          putc(fd, *s);
 5d4:	0f be d2             	movsbl %dl,%edx
 5d7:	8b 45 08             	mov    0x8(%ebp),%eax
 5da:	e8 64 fe ff ff       	call   443 <putc>
          s++;
 5df:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 5e2:	0f b6 16             	movzbl (%esi),%edx
 5e5:	84 d2                	test   %dl,%dl
 5e7:	75 eb                	jne    5d4 <printf+0xec>
      state = 0;
 5e9:	be 00 00 00 00       	mov    $0x0,%esi
 5ee:	e9 21 ff ff ff       	jmp    514 <printf+0x2c>
        putc(fd, *ap);
 5f3:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5f6:	0f be 17             	movsbl (%edi),%edx
 5f9:	8b 45 08             	mov    0x8(%ebp),%eax
 5fc:	e8 42 fe ff ff       	call   443 <putc>
        ap++;
 601:	83 c7 04             	add    $0x4,%edi
 604:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 607:	be 00 00 00 00       	mov    $0x0,%esi
 60c:	e9 03 ff ff ff       	jmp    514 <printf+0x2c>
        putc(fd, c);
 611:	89 fa                	mov    %edi,%edx
 613:	8b 45 08             	mov    0x8(%ebp),%eax
 616:	e8 28 fe ff ff       	call   443 <putc>
      state = 0;
 61b:	be 00 00 00 00       	mov    $0x0,%esi
 620:	e9 ef fe ff ff       	jmp    514 <printf+0x2c>
        putc(fd, '%');
 625:	ba 25 00 00 00       	mov    $0x25,%edx
 62a:	8b 45 08             	mov    0x8(%ebp),%eax
 62d:	e8 11 fe ff ff       	call   443 <putc>
        putc(fd, c);
 632:	89 fa                	mov    %edi,%edx
 634:	8b 45 08             	mov    0x8(%ebp),%eax
 637:	e8 07 fe ff ff       	call   443 <putc>
      state = 0;
 63c:	be 00 00 00 00       	mov    $0x0,%esi
 641:	e9 ce fe ff ff       	jmp    514 <printf+0x2c>
    }
  }
}
 646:	8d 65 f4             	lea    -0xc(%ebp),%esp
 649:	5b                   	pop    %ebx
 64a:	5e                   	pop    %esi
 64b:	5f                   	pop    %edi
 64c:	5d                   	pop    %ebp
 64d:	c3                   	ret    

0000064e <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 64e:	55                   	push   %ebp
 64f:	89 e5                	mov    %esp,%ebp
 651:	57                   	push   %edi
 652:	56                   	push   %esi
 653:	53                   	push   %ebx
 654:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 657:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 65a:	a1 e0 0d 00 00       	mov    0xde0,%eax
 65f:	eb 02                	jmp    663 <free+0x15>
 661:	89 d0                	mov    %edx,%eax
 663:	39 c8                	cmp    %ecx,%eax
 665:	73 04                	jae    66b <free+0x1d>
 667:	39 08                	cmp    %ecx,(%eax)
 669:	77 12                	ja     67d <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 66b:	8b 10                	mov    (%eax),%edx
 66d:	39 c2                	cmp    %eax,%edx
 66f:	77 f0                	ja     661 <free+0x13>
 671:	39 c8                	cmp    %ecx,%eax
 673:	72 08                	jb     67d <free+0x2f>
 675:	39 ca                	cmp    %ecx,%edx
 677:	77 04                	ja     67d <free+0x2f>
 679:	89 d0                	mov    %edx,%eax
 67b:	eb e6                	jmp    663 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 67d:	8b 73 fc             	mov    -0x4(%ebx),%esi
 680:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 683:	8b 10                	mov    (%eax),%edx
 685:	39 d7                	cmp    %edx,%edi
 687:	74 19                	je     6a2 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 689:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 68c:	8b 50 04             	mov    0x4(%eax),%edx
 68f:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 692:	39 ce                	cmp    %ecx,%esi
 694:	74 1b                	je     6b1 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 696:	89 08                	mov    %ecx,(%eax)
  freep = p;
 698:	a3 e0 0d 00 00       	mov    %eax,0xde0
}
 69d:	5b                   	pop    %ebx
 69e:	5e                   	pop    %esi
 69f:	5f                   	pop    %edi
 6a0:	5d                   	pop    %ebp
 6a1:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 6a2:	03 72 04             	add    0x4(%edx),%esi
 6a5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 6a8:	8b 10                	mov    (%eax),%edx
 6aa:	8b 12                	mov    (%edx),%edx
 6ac:	89 53 f8             	mov    %edx,-0x8(%ebx)
 6af:	eb db                	jmp    68c <free+0x3e>
    p->s.size += bp->s.size;
 6b1:	03 53 fc             	add    -0x4(%ebx),%edx
 6b4:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6b7:	8b 53 f8             	mov    -0x8(%ebx),%edx
 6ba:	89 10                	mov    %edx,(%eax)
 6bc:	eb da                	jmp    698 <free+0x4a>

000006be <morecore>:

static Header*
morecore(uint nu)
{
 6be:	55                   	push   %ebp
 6bf:	89 e5                	mov    %esp,%ebp
 6c1:	53                   	push   %ebx
 6c2:	83 ec 04             	sub    $0x4,%esp
 6c5:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 6c7:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 6cc:	77 05                	ja     6d3 <morecore+0x15>
    nu = 4096;
 6ce:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 6d3:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 6da:	83 ec 0c             	sub    $0xc,%esp
 6dd:	50                   	push   %eax
 6de:	e8 38 fd ff ff       	call   41b <sbrk>
  if(p == (char*)-1)
 6e3:	83 c4 10             	add    $0x10,%esp
 6e6:	83 f8 ff             	cmp    $0xffffffff,%eax
 6e9:	74 1c                	je     707 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 6eb:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 6ee:	83 c0 08             	add    $0x8,%eax
 6f1:	83 ec 0c             	sub    $0xc,%esp
 6f4:	50                   	push   %eax
 6f5:	e8 54 ff ff ff       	call   64e <free>
  return freep;
 6fa:	a1 e0 0d 00 00       	mov    0xde0,%eax
 6ff:	83 c4 10             	add    $0x10,%esp
}
 702:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 705:	c9                   	leave  
 706:	c3                   	ret    
    return 0;
 707:	b8 00 00 00 00       	mov    $0x0,%eax
 70c:	eb f4                	jmp    702 <morecore+0x44>

0000070e <malloc>:

void*
malloc(uint nbytes)
{
 70e:	55                   	push   %ebp
 70f:	89 e5                	mov    %esp,%ebp
 711:	53                   	push   %ebx
 712:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 715:	8b 45 08             	mov    0x8(%ebp),%eax
 718:	8d 58 07             	lea    0x7(%eax),%ebx
 71b:	c1 eb 03             	shr    $0x3,%ebx
 71e:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 721:	8b 0d e0 0d 00 00    	mov    0xde0,%ecx
 727:	85 c9                	test   %ecx,%ecx
 729:	74 04                	je     72f <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 72b:	8b 01                	mov    (%ecx),%eax
 72d:	eb 4a                	jmp    779 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 72f:	c7 05 e0 0d 00 00 e4 	movl   $0xde4,0xde0
 736:	0d 00 00 
 739:	c7 05 e4 0d 00 00 e4 	movl   $0xde4,0xde4
 740:	0d 00 00 
    base.s.size = 0;
 743:	c7 05 e8 0d 00 00 00 	movl   $0x0,0xde8
 74a:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 74d:	b9 e4 0d 00 00       	mov    $0xde4,%ecx
 752:	eb d7                	jmp    72b <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 754:	74 19                	je     76f <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 756:	29 da                	sub    %ebx,%edx
 758:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 75b:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 75e:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 761:	89 0d e0 0d 00 00    	mov    %ecx,0xde0
      return (void*)(p + 1);
 767:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 76a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 76d:	c9                   	leave  
 76e:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 76f:	8b 10                	mov    (%eax),%edx
 771:	89 11                	mov    %edx,(%ecx)
 773:	eb ec                	jmp    761 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 775:	89 c1                	mov    %eax,%ecx
 777:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 779:	8b 50 04             	mov    0x4(%eax),%edx
 77c:	39 da                	cmp    %ebx,%edx
 77e:	73 d4                	jae    754 <malloc+0x46>
    if(p == freep)
 780:	39 05 e0 0d 00 00    	cmp    %eax,0xde0
 786:	75 ed                	jne    775 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 788:	89 d8                	mov    %ebx,%eax
 78a:	e8 2f ff ff ff       	call   6be <morecore>
 78f:	85 c0                	test   %eax,%eax
 791:	75 e2                	jne    775 <malloc+0x67>
 793:	eb d5                	jmp    76a <malloc+0x5c>
