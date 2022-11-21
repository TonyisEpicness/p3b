
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
  2b:	68 80 0b 00 00       	push   $0xb80
  30:	ff 75 08             	push   0x8(%ebp)
  33:	e8 3c 03 00 00       	call   374 <read>
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
  4f:	68 60 07 00 00       	push   $0x760
  54:	e8 e1 01 00 00       	call   23a <strchr>
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
  71:	0f b6 83 80 0b 00 00 	movzbl 0xb80(%ebx),%eax
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
  a4:	68 76 07 00 00       	push   $0x776
  a9:	6a 01                	push   $0x1
  ab:	e8 01 04 00 00       	call   4b1 <printf>
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
  be:	68 66 07 00 00       	push   $0x766
  c3:	6a 01                	push   $0x1
  c5:	e8 e7 03 00 00       	call   4b1 <printf>
    exit();
  ca:	e8 8d 02 00 00       	call   35c <exit>

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
  fd:	68 75 07 00 00       	push   $0x775
 102:	6a 00                	push   $0x0
 104:	e8 f7 fe ff ff       	call   0 <wc>
    exit();
 109:	e8 4e 02 00 00       	call   35c <exit>
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
 11c:	e8 63 02 00 00       	call   384 <close>
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
 139:	e8 5e 02 00 00       	call   39c <open>
 13e:	89 c3                	mov    %eax,%ebx
 140:	83 c4 10             	add    $0x10,%esp
 143:	85 c0                	test   %eax,%eax
 145:	79 c7                	jns    10e <main+0x3f>
      printf(1, "wc: cannot open %s\n", argv[i]);
 147:	83 ec 04             	sub    $0x4,%esp
 14a:	ff 37                	push   (%edi)
 14c:	68 83 07 00 00       	push   $0x783
 151:	6a 01                	push   $0x1
 153:	e8 59 03 00 00       	call   4b1 <printf>
      exit();
 158:	e8 ff 01 00 00       	call   35c <exit>
  }
  exit();
 15d:	e8 fa 01 00 00       	call   35c <exit>

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

  // I can't remember if there was something else to do here but I'm sure I'll find out


  return new_pid;
}
 173:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 178:	c3                   	ret    

00000179 <thread_join>:

int thread_join() {
  return 0;
}
 179:	b8 00 00 00 00       	mov    $0x0,%eax
 17e:	c3                   	ret    

0000017f <lock_acquire>:

void lock_acquire(lock_t *lock){
 17f:	55                   	push   %ebp
 180:	89 e5                	mov    %esp,%ebp
 182:	53                   	push   %ebx
 183:	83 ec 04             	sub    $0x4,%esp
 186:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 189:	83 ec 08             	sub    $0x8,%esp
 18c:	6a 01                	push   $0x1
 18e:	53                   	push   %ebx
 18f:	e8 ce ff ff ff       	call   162 <test_and_set>
 194:	83 c4 10             	add    $0x10,%esp
 197:	83 f8 01             	cmp    $0x1,%eax
 19a:	74 ed                	je     189 <lock_acquire+0xa>
    ;
}
 19c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 19f:	c9                   	leave  
 1a0:	c3                   	ret    

000001a1 <lock_release>:

void lock_release(lock_t *lock) {
 1a1:	55                   	push   %ebp
 1a2:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 1a4:	8b 45 08             	mov    0x8(%ebp),%eax
 1a7:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 1ad:	5d                   	pop    %ebp
 1ae:	c3                   	ret    

000001af <lock_init>:

void lock_init(lock_t *lock) {
 1af:	55                   	push   %ebp
 1b0:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 1b2:	8b 45 08             	mov    0x8(%ebp),%eax
 1b5:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 1bb:	5d                   	pop    %ebp
 1bc:	c3                   	ret    

000001bd <strcpy>:

char*
strcpy(char *s, const char *t)
{
 1bd:	55                   	push   %ebp
 1be:	89 e5                	mov    %esp,%ebp
 1c0:	56                   	push   %esi
 1c1:	53                   	push   %ebx
 1c2:	8b 75 08             	mov    0x8(%ebp),%esi
 1c5:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 1c8:	89 f0                	mov    %esi,%eax
 1ca:	89 d1                	mov    %edx,%ecx
 1cc:	83 c2 01             	add    $0x1,%edx
 1cf:	89 c3                	mov    %eax,%ebx
 1d1:	83 c0 01             	add    $0x1,%eax
 1d4:	0f b6 09             	movzbl (%ecx),%ecx
 1d7:	88 0b                	mov    %cl,(%ebx)
 1d9:	84 c9                	test   %cl,%cl
 1db:	75 ed                	jne    1ca <strcpy+0xd>
    ;
  return os;
}
 1dd:	89 f0                	mov    %esi,%eax
 1df:	5b                   	pop    %ebx
 1e0:	5e                   	pop    %esi
 1e1:	5d                   	pop    %ebp
 1e2:	c3                   	ret    

000001e3 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1e3:	55                   	push   %ebp
 1e4:	89 e5                	mov    %esp,%ebp
 1e6:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1e9:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 1ec:	eb 06                	jmp    1f4 <strcmp+0x11>
    p++, q++;
 1ee:	83 c1 01             	add    $0x1,%ecx
 1f1:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 1f4:	0f b6 01             	movzbl (%ecx),%eax
 1f7:	84 c0                	test   %al,%al
 1f9:	74 04                	je     1ff <strcmp+0x1c>
 1fb:	3a 02                	cmp    (%edx),%al
 1fd:	74 ef                	je     1ee <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 1ff:	0f b6 c0             	movzbl %al,%eax
 202:	0f b6 12             	movzbl (%edx),%edx
 205:	29 d0                	sub    %edx,%eax
}
 207:	5d                   	pop    %ebp
 208:	c3                   	ret    

00000209 <strlen>:

uint
strlen(const char *s)
{
 209:	55                   	push   %ebp
 20a:	89 e5                	mov    %esp,%ebp
 20c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 20f:	b8 00 00 00 00       	mov    $0x0,%eax
 214:	eb 03                	jmp    219 <strlen+0x10>
 216:	83 c0 01             	add    $0x1,%eax
 219:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 21d:	75 f7                	jne    216 <strlen+0xd>
    ;
  return n;
}
 21f:	5d                   	pop    %ebp
 220:	c3                   	ret    

00000221 <memset>:

void*
memset(void *dst, int c, uint n)
{
 221:	55                   	push   %ebp
 222:	89 e5                	mov    %esp,%ebp
 224:	57                   	push   %edi
 225:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 228:	89 d7                	mov    %edx,%edi
 22a:	8b 4d 10             	mov    0x10(%ebp),%ecx
 22d:	8b 45 0c             	mov    0xc(%ebp),%eax
 230:	fc                   	cld    
 231:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 233:	89 d0                	mov    %edx,%eax
 235:	8b 7d fc             	mov    -0x4(%ebp),%edi
 238:	c9                   	leave  
 239:	c3                   	ret    

0000023a <strchr>:

char*
strchr(const char *s, char c)
{
 23a:	55                   	push   %ebp
 23b:	89 e5                	mov    %esp,%ebp
 23d:	8b 45 08             	mov    0x8(%ebp),%eax
 240:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 244:	eb 03                	jmp    249 <strchr+0xf>
 246:	83 c0 01             	add    $0x1,%eax
 249:	0f b6 10             	movzbl (%eax),%edx
 24c:	84 d2                	test   %dl,%dl
 24e:	74 06                	je     256 <strchr+0x1c>
    if(*s == c)
 250:	38 ca                	cmp    %cl,%dl
 252:	75 f2                	jne    246 <strchr+0xc>
 254:	eb 05                	jmp    25b <strchr+0x21>
      return (char*)s;
  return 0;
 256:	b8 00 00 00 00       	mov    $0x0,%eax
}
 25b:	5d                   	pop    %ebp
 25c:	c3                   	ret    

0000025d <gets>:

char*
gets(char *buf, int max)
{
 25d:	55                   	push   %ebp
 25e:	89 e5                	mov    %esp,%ebp
 260:	57                   	push   %edi
 261:	56                   	push   %esi
 262:	53                   	push   %ebx
 263:	83 ec 1c             	sub    $0x1c,%esp
 266:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 269:	bb 00 00 00 00       	mov    $0x0,%ebx
 26e:	89 de                	mov    %ebx,%esi
 270:	83 c3 01             	add    $0x1,%ebx
 273:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 276:	7d 2e                	jge    2a6 <gets+0x49>
    cc = read(0, &c, 1);
 278:	83 ec 04             	sub    $0x4,%esp
 27b:	6a 01                	push   $0x1
 27d:	8d 45 e7             	lea    -0x19(%ebp),%eax
 280:	50                   	push   %eax
 281:	6a 00                	push   $0x0
 283:	e8 ec 00 00 00       	call   374 <read>
    if(cc < 1)
 288:	83 c4 10             	add    $0x10,%esp
 28b:	85 c0                	test   %eax,%eax
 28d:	7e 17                	jle    2a6 <gets+0x49>
      break;
    buf[i++] = c;
 28f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 293:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 296:	3c 0a                	cmp    $0xa,%al
 298:	0f 94 c2             	sete   %dl
 29b:	3c 0d                	cmp    $0xd,%al
 29d:	0f 94 c0             	sete   %al
 2a0:	08 c2                	or     %al,%dl
 2a2:	74 ca                	je     26e <gets+0x11>
    buf[i++] = c;
 2a4:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 2a6:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 2aa:	89 f8                	mov    %edi,%eax
 2ac:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2af:	5b                   	pop    %ebx
 2b0:	5e                   	pop    %esi
 2b1:	5f                   	pop    %edi
 2b2:	5d                   	pop    %ebp
 2b3:	c3                   	ret    

000002b4 <stat>:

int
stat(const char *n, struct stat *st)
{
 2b4:	55                   	push   %ebp
 2b5:	89 e5                	mov    %esp,%ebp
 2b7:	56                   	push   %esi
 2b8:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2b9:	83 ec 08             	sub    $0x8,%esp
 2bc:	6a 00                	push   $0x0
 2be:	ff 75 08             	push   0x8(%ebp)
 2c1:	e8 d6 00 00 00       	call   39c <open>
  if(fd < 0)
 2c6:	83 c4 10             	add    $0x10,%esp
 2c9:	85 c0                	test   %eax,%eax
 2cb:	78 24                	js     2f1 <stat+0x3d>
 2cd:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 2cf:	83 ec 08             	sub    $0x8,%esp
 2d2:	ff 75 0c             	push   0xc(%ebp)
 2d5:	50                   	push   %eax
 2d6:	e8 d9 00 00 00       	call   3b4 <fstat>
 2db:	89 c6                	mov    %eax,%esi
  close(fd);
 2dd:	89 1c 24             	mov    %ebx,(%esp)
 2e0:	e8 9f 00 00 00       	call   384 <close>
  return r;
 2e5:	83 c4 10             	add    $0x10,%esp
}
 2e8:	89 f0                	mov    %esi,%eax
 2ea:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2ed:	5b                   	pop    %ebx
 2ee:	5e                   	pop    %esi
 2ef:	5d                   	pop    %ebp
 2f0:	c3                   	ret    
    return -1;
 2f1:	be ff ff ff ff       	mov    $0xffffffff,%esi
 2f6:	eb f0                	jmp    2e8 <stat+0x34>

000002f8 <atoi>:

int
atoi(const char *s)
{
 2f8:	55                   	push   %ebp
 2f9:	89 e5                	mov    %esp,%ebp
 2fb:	53                   	push   %ebx
 2fc:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 2ff:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 304:	eb 10                	jmp    316 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 306:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 309:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 30c:	83 c1 01             	add    $0x1,%ecx
 30f:	0f be c0             	movsbl %al,%eax
 312:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 316:	0f b6 01             	movzbl (%ecx),%eax
 319:	8d 58 d0             	lea    -0x30(%eax),%ebx
 31c:	80 fb 09             	cmp    $0x9,%bl
 31f:	76 e5                	jbe    306 <atoi+0xe>
  return n;
}
 321:	89 d0                	mov    %edx,%eax
 323:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 326:	c9                   	leave  
 327:	c3                   	ret    

00000328 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 328:	55                   	push   %ebp
 329:	89 e5                	mov    %esp,%ebp
 32b:	56                   	push   %esi
 32c:	53                   	push   %ebx
 32d:	8b 75 08             	mov    0x8(%ebp),%esi
 330:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 333:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 336:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 338:	eb 0d                	jmp    347 <memmove+0x1f>
    *dst++ = *src++;
 33a:	0f b6 01             	movzbl (%ecx),%eax
 33d:	88 02                	mov    %al,(%edx)
 33f:	8d 49 01             	lea    0x1(%ecx),%ecx
 342:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 345:	89 d8                	mov    %ebx,%eax
 347:	8d 58 ff             	lea    -0x1(%eax),%ebx
 34a:	85 c0                	test   %eax,%eax
 34c:	7f ec                	jg     33a <memmove+0x12>
  return vdst;
}
 34e:	89 f0                	mov    %esi,%eax
 350:	5b                   	pop    %ebx
 351:	5e                   	pop    %esi
 352:	5d                   	pop    %ebp
 353:	c3                   	ret    

00000354 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 354:	b8 01 00 00 00       	mov    $0x1,%eax
 359:	cd 40                	int    $0x40
 35b:	c3                   	ret    

0000035c <exit>:
SYSCALL(exit)
 35c:	b8 02 00 00 00       	mov    $0x2,%eax
 361:	cd 40                	int    $0x40
 363:	c3                   	ret    

00000364 <wait>:
SYSCALL(wait)
 364:	b8 03 00 00 00       	mov    $0x3,%eax
 369:	cd 40                	int    $0x40
 36b:	c3                   	ret    

0000036c <pipe>:
SYSCALL(pipe)
 36c:	b8 04 00 00 00       	mov    $0x4,%eax
 371:	cd 40                	int    $0x40
 373:	c3                   	ret    

00000374 <read>:
SYSCALL(read)
 374:	b8 05 00 00 00       	mov    $0x5,%eax
 379:	cd 40                	int    $0x40
 37b:	c3                   	ret    

0000037c <write>:
SYSCALL(write)
 37c:	b8 10 00 00 00       	mov    $0x10,%eax
 381:	cd 40                	int    $0x40
 383:	c3                   	ret    

00000384 <close>:
SYSCALL(close)
 384:	b8 15 00 00 00       	mov    $0x15,%eax
 389:	cd 40                	int    $0x40
 38b:	c3                   	ret    

0000038c <kill>:
SYSCALL(kill)
 38c:	b8 06 00 00 00       	mov    $0x6,%eax
 391:	cd 40                	int    $0x40
 393:	c3                   	ret    

00000394 <exec>:
SYSCALL(exec)
 394:	b8 07 00 00 00       	mov    $0x7,%eax
 399:	cd 40                	int    $0x40
 39b:	c3                   	ret    

0000039c <open>:
SYSCALL(open)
 39c:	b8 0f 00 00 00       	mov    $0xf,%eax
 3a1:	cd 40                	int    $0x40
 3a3:	c3                   	ret    

000003a4 <mknod>:
SYSCALL(mknod)
 3a4:	b8 11 00 00 00       	mov    $0x11,%eax
 3a9:	cd 40                	int    $0x40
 3ab:	c3                   	ret    

000003ac <unlink>:
SYSCALL(unlink)
 3ac:	b8 12 00 00 00       	mov    $0x12,%eax
 3b1:	cd 40                	int    $0x40
 3b3:	c3                   	ret    

000003b4 <fstat>:
SYSCALL(fstat)
 3b4:	b8 08 00 00 00       	mov    $0x8,%eax
 3b9:	cd 40                	int    $0x40
 3bb:	c3                   	ret    

000003bc <link>:
SYSCALL(link)
 3bc:	b8 13 00 00 00       	mov    $0x13,%eax
 3c1:	cd 40                	int    $0x40
 3c3:	c3                   	ret    

000003c4 <mkdir>:
SYSCALL(mkdir)
 3c4:	b8 14 00 00 00       	mov    $0x14,%eax
 3c9:	cd 40                	int    $0x40
 3cb:	c3                   	ret    

000003cc <chdir>:
SYSCALL(chdir)
 3cc:	b8 09 00 00 00       	mov    $0x9,%eax
 3d1:	cd 40                	int    $0x40
 3d3:	c3                   	ret    

000003d4 <dup>:
SYSCALL(dup)
 3d4:	b8 0a 00 00 00       	mov    $0xa,%eax
 3d9:	cd 40                	int    $0x40
 3db:	c3                   	ret    

000003dc <getpid>:
SYSCALL(getpid)
 3dc:	b8 0b 00 00 00       	mov    $0xb,%eax
 3e1:	cd 40                	int    $0x40
 3e3:	c3                   	ret    

000003e4 <sbrk>:
SYSCALL(sbrk)
 3e4:	b8 0c 00 00 00       	mov    $0xc,%eax
 3e9:	cd 40                	int    $0x40
 3eb:	c3                   	ret    

000003ec <sleep>:
SYSCALL(sleep)
 3ec:	b8 0d 00 00 00       	mov    $0xd,%eax
 3f1:	cd 40                	int    $0x40
 3f3:	c3                   	ret    

000003f4 <uptime>:
SYSCALL(uptime)
 3f4:	b8 0e 00 00 00       	mov    $0xe,%eax
 3f9:	cd 40                	int    $0x40
 3fb:	c3                   	ret    

000003fc <clone>:
SYSCALL(clone)
 3fc:	b8 16 00 00 00       	mov    $0x16,%eax
 401:	cd 40                	int    $0x40
 403:	c3                   	ret    

00000404 <join>:
 404:	b8 17 00 00 00       	mov    $0x17,%eax
 409:	cd 40                	int    $0x40
 40b:	c3                   	ret    

0000040c <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 40c:	55                   	push   %ebp
 40d:	89 e5                	mov    %esp,%ebp
 40f:	83 ec 1c             	sub    $0x1c,%esp
 412:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 415:	6a 01                	push   $0x1
 417:	8d 55 f4             	lea    -0xc(%ebp),%edx
 41a:	52                   	push   %edx
 41b:	50                   	push   %eax
 41c:	e8 5b ff ff ff       	call   37c <write>
}
 421:	83 c4 10             	add    $0x10,%esp
 424:	c9                   	leave  
 425:	c3                   	ret    

00000426 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 426:	55                   	push   %ebp
 427:	89 e5                	mov    %esp,%ebp
 429:	57                   	push   %edi
 42a:	56                   	push   %esi
 42b:	53                   	push   %ebx
 42c:	83 ec 2c             	sub    $0x2c,%esp
 42f:	89 45 d0             	mov    %eax,-0x30(%ebp)
 432:	89 d0                	mov    %edx,%eax
 434:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 436:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 43a:	0f 95 c1             	setne  %cl
 43d:	c1 ea 1f             	shr    $0x1f,%edx
 440:	84 d1                	test   %dl,%cl
 442:	74 44                	je     488 <printint+0x62>
    neg = 1;
    x = -xx;
 444:	f7 d8                	neg    %eax
 446:	89 c1                	mov    %eax,%ecx
    neg = 1;
 448:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 44f:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 454:	89 c8                	mov    %ecx,%eax
 456:	ba 00 00 00 00       	mov    $0x0,%edx
 45b:	f7 f6                	div    %esi
 45d:	89 df                	mov    %ebx,%edi
 45f:	83 c3 01             	add    $0x1,%ebx
 462:	0f b6 92 f8 07 00 00 	movzbl 0x7f8(%edx),%edx
 469:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 46d:	89 ca                	mov    %ecx,%edx
 46f:	89 c1                	mov    %eax,%ecx
 471:	39 d6                	cmp    %edx,%esi
 473:	76 df                	jbe    454 <printint+0x2e>
  if(neg)
 475:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 479:	74 31                	je     4ac <printint+0x86>
    buf[i++] = '-';
 47b:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 480:	8d 5f 02             	lea    0x2(%edi),%ebx
 483:	8b 75 d0             	mov    -0x30(%ebp),%esi
 486:	eb 17                	jmp    49f <printint+0x79>
    x = xx;
 488:	89 c1                	mov    %eax,%ecx
  neg = 0;
 48a:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 491:	eb bc                	jmp    44f <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 493:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 498:	89 f0                	mov    %esi,%eax
 49a:	e8 6d ff ff ff       	call   40c <putc>
  while(--i >= 0)
 49f:	83 eb 01             	sub    $0x1,%ebx
 4a2:	79 ef                	jns    493 <printint+0x6d>
}
 4a4:	83 c4 2c             	add    $0x2c,%esp
 4a7:	5b                   	pop    %ebx
 4a8:	5e                   	pop    %esi
 4a9:	5f                   	pop    %edi
 4aa:	5d                   	pop    %ebp
 4ab:	c3                   	ret    
 4ac:	8b 75 d0             	mov    -0x30(%ebp),%esi
 4af:	eb ee                	jmp    49f <printint+0x79>

000004b1 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 4b1:	55                   	push   %ebp
 4b2:	89 e5                	mov    %esp,%ebp
 4b4:	57                   	push   %edi
 4b5:	56                   	push   %esi
 4b6:	53                   	push   %ebx
 4b7:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 4ba:	8d 45 10             	lea    0x10(%ebp),%eax
 4bd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 4c0:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 4c5:	bb 00 00 00 00       	mov    $0x0,%ebx
 4ca:	eb 14                	jmp    4e0 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 4cc:	89 fa                	mov    %edi,%edx
 4ce:	8b 45 08             	mov    0x8(%ebp),%eax
 4d1:	e8 36 ff ff ff       	call   40c <putc>
 4d6:	eb 05                	jmp    4dd <printf+0x2c>
      }
    } else if(state == '%'){
 4d8:	83 fe 25             	cmp    $0x25,%esi
 4db:	74 25                	je     502 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 4dd:	83 c3 01             	add    $0x1,%ebx
 4e0:	8b 45 0c             	mov    0xc(%ebp),%eax
 4e3:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 4e7:	84 c0                	test   %al,%al
 4e9:	0f 84 20 01 00 00    	je     60f <printf+0x15e>
    c = fmt[i] & 0xff;
 4ef:	0f be f8             	movsbl %al,%edi
 4f2:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 4f5:	85 f6                	test   %esi,%esi
 4f7:	75 df                	jne    4d8 <printf+0x27>
      if(c == '%'){
 4f9:	83 f8 25             	cmp    $0x25,%eax
 4fc:	75 ce                	jne    4cc <printf+0x1b>
        state = '%';
 4fe:	89 c6                	mov    %eax,%esi
 500:	eb db                	jmp    4dd <printf+0x2c>
      if(c == 'd'){
 502:	83 f8 25             	cmp    $0x25,%eax
 505:	0f 84 cf 00 00 00    	je     5da <printf+0x129>
 50b:	0f 8c dd 00 00 00    	jl     5ee <printf+0x13d>
 511:	83 f8 78             	cmp    $0x78,%eax
 514:	0f 8f d4 00 00 00    	jg     5ee <printf+0x13d>
 51a:	83 f8 63             	cmp    $0x63,%eax
 51d:	0f 8c cb 00 00 00    	jl     5ee <printf+0x13d>
 523:	83 e8 63             	sub    $0x63,%eax
 526:	83 f8 15             	cmp    $0x15,%eax
 529:	0f 87 bf 00 00 00    	ja     5ee <printf+0x13d>
 52f:	ff 24 85 a0 07 00 00 	jmp    *0x7a0(,%eax,4)
        printint(fd, *ap, 10, 1);
 536:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 539:	8b 17                	mov    (%edi),%edx
 53b:	83 ec 0c             	sub    $0xc,%esp
 53e:	6a 01                	push   $0x1
 540:	b9 0a 00 00 00       	mov    $0xa,%ecx
 545:	8b 45 08             	mov    0x8(%ebp),%eax
 548:	e8 d9 fe ff ff       	call   426 <printint>
        ap++;
 54d:	83 c7 04             	add    $0x4,%edi
 550:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 553:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 556:	be 00 00 00 00       	mov    $0x0,%esi
 55b:	eb 80                	jmp    4dd <printf+0x2c>
        printint(fd, *ap, 16, 0);
 55d:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 560:	8b 17                	mov    (%edi),%edx
 562:	83 ec 0c             	sub    $0xc,%esp
 565:	6a 00                	push   $0x0
 567:	b9 10 00 00 00       	mov    $0x10,%ecx
 56c:	8b 45 08             	mov    0x8(%ebp),%eax
 56f:	e8 b2 fe ff ff       	call   426 <printint>
        ap++;
 574:	83 c7 04             	add    $0x4,%edi
 577:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 57a:	83 c4 10             	add    $0x10,%esp
      state = 0;
 57d:	be 00 00 00 00       	mov    $0x0,%esi
 582:	e9 56 ff ff ff       	jmp    4dd <printf+0x2c>
        s = (char*)*ap;
 587:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 58a:	8b 30                	mov    (%eax),%esi
        ap++;
 58c:	83 c0 04             	add    $0x4,%eax
 58f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 592:	85 f6                	test   %esi,%esi
 594:	75 15                	jne    5ab <printf+0xfa>
          s = "(null)";
 596:	be 97 07 00 00       	mov    $0x797,%esi
 59b:	eb 0e                	jmp    5ab <printf+0xfa>
          putc(fd, *s);
 59d:	0f be d2             	movsbl %dl,%edx
 5a0:	8b 45 08             	mov    0x8(%ebp),%eax
 5a3:	e8 64 fe ff ff       	call   40c <putc>
          s++;
 5a8:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 5ab:	0f b6 16             	movzbl (%esi),%edx
 5ae:	84 d2                	test   %dl,%dl
 5b0:	75 eb                	jne    59d <printf+0xec>
      state = 0;
 5b2:	be 00 00 00 00       	mov    $0x0,%esi
 5b7:	e9 21 ff ff ff       	jmp    4dd <printf+0x2c>
        putc(fd, *ap);
 5bc:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5bf:	0f be 17             	movsbl (%edi),%edx
 5c2:	8b 45 08             	mov    0x8(%ebp),%eax
 5c5:	e8 42 fe ff ff       	call   40c <putc>
        ap++;
 5ca:	83 c7 04             	add    $0x4,%edi
 5cd:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 5d0:	be 00 00 00 00       	mov    $0x0,%esi
 5d5:	e9 03 ff ff ff       	jmp    4dd <printf+0x2c>
        putc(fd, c);
 5da:	89 fa                	mov    %edi,%edx
 5dc:	8b 45 08             	mov    0x8(%ebp),%eax
 5df:	e8 28 fe ff ff       	call   40c <putc>
      state = 0;
 5e4:	be 00 00 00 00       	mov    $0x0,%esi
 5e9:	e9 ef fe ff ff       	jmp    4dd <printf+0x2c>
        putc(fd, '%');
 5ee:	ba 25 00 00 00       	mov    $0x25,%edx
 5f3:	8b 45 08             	mov    0x8(%ebp),%eax
 5f6:	e8 11 fe ff ff       	call   40c <putc>
        putc(fd, c);
 5fb:	89 fa                	mov    %edi,%edx
 5fd:	8b 45 08             	mov    0x8(%ebp),%eax
 600:	e8 07 fe ff ff       	call   40c <putc>
      state = 0;
 605:	be 00 00 00 00       	mov    $0x0,%esi
 60a:	e9 ce fe ff ff       	jmp    4dd <printf+0x2c>
    }
  }
}
 60f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 612:	5b                   	pop    %ebx
 613:	5e                   	pop    %esi
 614:	5f                   	pop    %edi
 615:	5d                   	pop    %ebp
 616:	c3                   	ret    

00000617 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 617:	55                   	push   %ebp
 618:	89 e5                	mov    %esp,%ebp
 61a:	57                   	push   %edi
 61b:	56                   	push   %esi
 61c:	53                   	push   %ebx
 61d:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 620:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 623:	a1 80 0d 00 00       	mov    0xd80,%eax
 628:	eb 02                	jmp    62c <free+0x15>
 62a:	89 d0                	mov    %edx,%eax
 62c:	39 c8                	cmp    %ecx,%eax
 62e:	73 04                	jae    634 <free+0x1d>
 630:	39 08                	cmp    %ecx,(%eax)
 632:	77 12                	ja     646 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 634:	8b 10                	mov    (%eax),%edx
 636:	39 c2                	cmp    %eax,%edx
 638:	77 f0                	ja     62a <free+0x13>
 63a:	39 c8                	cmp    %ecx,%eax
 63c:	72 08                	jb     646 <free+0x2f>
 63e:	39 ca                	cmp    %ecx,%edx
 640:	77 04                	ja     646 <free+0x2f>
 642:	89 d0                	mov    %edx,%eax
 644:	eb e6                	jmp    62c <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 646:	8b 73 fc             	mov    -0x4(%ebx),%esi
 649:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 64c:	8b 10                	mov    (%eax),%edx
 64e:	39 d7                	cmp    %edx,%edi
 650:	74 19                	je     66b <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 652:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 655:	8b 50 04             	mov    0x4(%eax),%edx
 658:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 65b:	39 ce                	cmp    %ecx,%esi
 65d:	74 1b                	je     67a <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 65f:	89 08                	mov    %ecx,(%eax)
  freep = p;
 661:	a3 80 0d 00 00       	mov    %eax,0xd80
}
 666:	5b                   	pop    %ebx
 667:	5e                   	pop    %esi
 668:	5f                   	pop    %edi
 669:	5d                   	pop    %ebp
 66a:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 66b:	03 72 04             	add    0x4(%edx),%esi
 66e:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 671:	8b 10                	mov    (%eax),%edx
 673:	8b 12                	mov    (%edx),%edx
 675:	89 53 f8             	mov    %edx,-0x8(%ebx)
 678:	eb db                	jmp    655 <free+0x3e>
    p->s.size += bp->s.size;
 67a:	03 53 fc             	add    -0x4(%ebx),%edx
 67d:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 680:	8b 53 f8             	mov    -0x8(%ebx),%edx
 683:	89 10                	mov    %edx,(%eax)
 685:	eb da                	jmp    661 <free+0x4a>

00000687 <morecore>:

static Header*
morecore(uint nu)
{
 687:	55                   	push   %ebp
 688:	89 e5                	mov    %esp,%ebp
 68a:	53                   	push   %ebx
 68b:	83 ec 04             	sub    $0x4,%esp
 68e:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 690:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 695:	77 05                	ja     69c <morecore+0x15>
    nu = 4096;
 697:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 69c:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 6a3:	83 ec 0c             	sub    $0xc,%esp
 6a6:	50                   	push   %eax
 6a7:	e8 38 fd ff ff       	call   3e4 <sbrk>
  if(p == (char*)-1)
 6ac:	83 c4 10             	add    $0x10,%esp
 6af:	83 f8 ff             	cmp    $0xffffffff,%eax
 6b2:	74 1c                	je     6d0 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 6b4:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 6b7:	83 c0 08             	add    $0x8,%eax
 6ba:	83 ec 0c             	sub    $0xc,%esp
 6bd:	50                   	push   %eax
 6be:	e8 54 ff ff ff       	call   617 <free>
  return freep;
 6c3:	a1 80 0d 00 00       	mov    0xd80,%eax
 6c8:	83 c4 10             	add    $0x10,%esp
}
 6cb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 6ce:	c9                   	leave  
 6cf:	c3                   	ret    
    return 0;
 6d0:	b8 00 00 00 00       	mov    $0x0,%eax
 6d5:	eb f4                	jmp    6cb <morecore+0x44>

000006d7 <malloc>:

void*
malloc(uint nbytes)
{
 6d7:	55                   	push   %ebp
 6d8:	89 e5                	mov    %esp,%ebp
 6da:	53                   	push   %ebx
 6db:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6de:	8b 45 08             	mov    0x8(%ebp),%eax
 6e1:	8d 58 07             	lea    0x7(%eax),%ebx
 6e4:	c1 eb 03             	shr    $0x3,%ebx
 6e7:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 6ea:	8b 0d 80 0d 00 00    	mov    0xd80,%ecx
 6f0:	85 c9                	test   %ecx,%ecx
 6f2:	74 04                	je     6f8 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6f4:	8b 01                	mov    (%ecx),%eax
 6f6:	eb 4a                	jmp    742 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 6f8:	c7 05 80 0d 00 00 84 	movl   $0xd84,0xd80
 6ff:	0d 00 00 
 702:	c7 05 84 0d 00 00 84 	movl   $0xd84,0xd84
 709:	0d 00 00 
    base.s.size = 0;
 70c:	c7 05 88 0d 00 00 00 	movl   $0x0,0xd88
 713:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 716:	b9 84 0d 00 00       	mov    $0xd84,%ecx
 71b:	eb d7                	jmp    6f4 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 71d:	74 19                	je     738 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 71f:	29 da                	sub    %ebx,%edx
 721:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 724:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 727:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 72a:	89 0d 80 0d 00 00    	mov    %ecx,0xd80
      return (void*)(p + 1);
 730:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 733:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 736:	c9                   	leave  
 737:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 738:	8b 10                	mov    (%eax),%edx
 73a:	89 11                	mov    %edx,(%ecx)
 73c:	eb ec                	jmp    72a <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 73e:	89 c1                	mov    %eax,%ecx
 740:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 742:	8b 50 04             	mov    0x4(%eax),%edx
 745:	39 da                	cmp    %ebx,%edx
 747:	73 d4                	jae    71d <malloc+0x46>
    if(p == freep)
 749:	39 05 80 0d 00 00    	cmp    %eax,0xd80
 74f:	75 ed                	jne    73e <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 751:	89 d8                	mov    %ebx,%eax
 753:	e8 2f ff ff ff       	call   687 <morecore>
 758:	85 c0                	test   %eax,%eax
 75a:	75 e2                	jne    73e <malloc+0x67>
 75c:	eb d5                	jmp    733 <malloc+0x5c>
