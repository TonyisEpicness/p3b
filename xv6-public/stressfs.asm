
_stressfs:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "fs.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	56                   	push   %esi
   e:	53                   	push   %ebx
   f:	51                   	push   %ecx
  10:	81 ec 24 02 00 00    	sub    $0x224,%esp
  int fd, i;
  char path[] = "stressfs0";
  16:	c7 45 de 73 74 72 65 	movl   $0x65727473,-0x22(%ebp)
  1d:	c7 45 e2 73 73 66 73 	movl   $0x73667373,-0x1e(%ebp)
  24:	66 c7 45 e6 30 00    	movw   $0x30,-0x1a(%ebp)
  char data[512];

  printf(1, "stressfs starting\n");
  2a:	68 c8 07 00 00       	push   $0x7c8
  2f:	6a 01                	push   $0x1
  31:	e8 e2 04 00 00       	call   518 <printf>
  memset(data, 'a', sizeof(data));
  36:	83 c4 0c             	add    $0xc,%esp
  39:	68 00 02 00 00       	push   $0x200
  3e:	6a 61                	push   $0x61
  40:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  46:	50                   	push   %eax
  47:	e8 3c 02 00 00       	call   288 <memset>

  for(i = 0; i < 4; i++)
  4c:	83 c4 10             	add    $0x10,%esp
  4f:	bb 00 00 00 00       	mov    $0x0,%ebx
  54:	83 fb 03             	cmp    $0x3,%ebx
  57:	7f 0e                	jg     67 <main+0x67>
    if(fork() > 0)
  59:	e8 5d 03 00 00       	call   3bb <fork>
  5e:	85 c0                	test   %eax,%eax
  60:	7f 05                	jg     67 <main+0x67>
  for(i = 0; i < 4; i++)
  62:	83 c3 01             	add    $0x1,%ebx
  65:	eb ed                	jmp    54 <main+0x54>
      break;

  printf(1, "write %d\n", i);
  67:	83 ec 04             	sub    $0x4,%esp
  6a:	53                   	push   %ebx
  6b:	68 db 07 00 00       	push   $0x7db
  70:	6a 01                	push   $0x1
  72:	e8 a1 04 00 00       	call   518 <printf>

  path[8] += i;
  77:	00 5d e6             	add    %bl,-0x1a(%ebp)
  fd = open(path, O_CREATE | O_RDWR);
  7a:	83 c4 08             	add    $0x8,%esp
  7d:	68 02 02 00 00       	push   $0x202
  82:	8d 45 de             	lea    -0x22(%ebp),%eax
  85:	50                   	push   %eax
  86:	e8 78 03 00 00       	call   403 <open>
  8b:	89 c6                	mov    %eax,%esi
  for(i = 0; i < 20; i++)
  8d:	83 c4 10             	add    $0x10,%esp
  90:	bb 00 00 00 00       	mov    $0x0,%ebx
  95:	eb 1b                	jmp    b2 <main+0xb2>
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
  97:	83 ec 04             	sub    $0x4,%esp
  9a:	68 00 02 00 00       	push   $0x200
  9f:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  a5:	50                   	push   %eax
  a6:	56                   	push   %esi
  a7:	e8 37 03 00 00       	call   3e3 <write>
  for(i = 0; i < 20; i++)
  ac:	83 c3 01             	add    $0x1,%ebx
  af:	83 c4 10             	add    $0x10,%esp
  b2:	83 fb 13             	cmp    $0x13,%ebx
  b5:	7e e0                	jle    97 <main+0x97>
  close(fd);
  b7:	83 ec 0c             	sub    $0xc,%esp
  ba:	56                   	push   %esi
  bb:	e8 2b 03 00 00       	call   3eb <close>

  printf(1, "read\n");
  c0:	83 c4 08             	add    $0x8,%esp
  c3:	68 e5 07 00 00       	push   $0x7e5
  c8:	6a 01                	push   $0x1
  ca:	e8 49 04 00 00       	call   518 <printf>

  fd = open(path, O_RDONLY);
  cf:	83 c4 08             	add    $0x8,%esp
  d2:	6a 00                	push   $0x0
  d4:	8d 45 de             	lea    -0x22(%ebp),%eax
  d7:	50                   	push   %eax
  d8:	e8 26 03 00 00       	call   403 <open>
  dd:	89 c6                	mov    %eax,%esi
  for (i = 0; i < 20; i++)
  df:	83 c4 10             	add    $0x10,%esp
  e2:	bb 00 00 00 00       	mov    $0x0,%ebx
  e7:	eb 1b                	jmp    104 <main+0x104>
    read(fd, data, sizeof(data));
  e9:	83 ec 04             	sub    $0x4,%esp
  ec:	68 00 02 00 00       	push   $0x200
  f1:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  f7:	50                   	push   %eax
  f8:	56                   	push   %esi
  f9:	e8 dd 02 00 00       	call   3db <read>
  for (i = 0; i < 20; i++)
  fe:	83 c3 01             	add    $0x1,%ebx
 101:	83 c4 10             	add    $0x10,%esp
 104:	83 fb 13             	cmp    $0x13,%ebx
 107:	7e e0                	jle    e9 <main+0xe9>
  close(fd);
 109:	83 ec 0c             	sub    $0xc,%esp
 10c:	56                   	push   %esi
 10d:	e8 d9 02 00 00       	call   3eb <close>

  wait();
 112:	e8 b4 02 00 00       	call   3cb <wait>

  exit();
 117:	e8 a7 02 00 00       	call   3c3 <exit>

0000011c <test_and_set>:
  int flag;
};

struct thread_ref *threads[64];

int test_and_set(int *old_ptr, int new_ptr) {
 11c:	55                   	push   %ebp
 11d:	89 e5                	mov    %esp,%ebp
 11f:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *old_ptr;
 122:	8b 10                	mov    (%eax),%edx
  *old_ptr = new_ptr;
 124:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 127:	89 08                	mov    %ecx,(%eax)
  return old;
}
 129:	89 d0                	mov    %edx,%eax
 12b:	5d                   	pop    %ebp
 12c:	c3                   	ret    

0000012d <thread_create>:

// a wrapper func for clone
int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 12d:	55                   	push   %ebp
 12e:	89 e5                	mov    %esp,%ebp
 130:	83 ec 14             	sub    $0x14,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE*2);
 133:	68 00 20 00 00       	push   $0x2000
 138:	e8 01 06 00 00       	call   73e <malloc>
  if(n_stack == 0){
 13d:	83 c4 10             	add    $0x10,%esp
 140:	85 c0                	test   %eax,%eax
 142:	74 4a                	je     18e <thread_create+0x61>
    return -1;
  }
  
  for(int i=0; i<64; i++){
 144:	ba 00 00 00 00       	mov    $0x0,%edx
 149:	eb 03                	jmp    14e <thread_create+0x21>
 14b:	83 c2 01             	add    $0x1,%edx
 14e:	83 fa 3f             	cmp    $0x3f,%edx
 151:	7f 27                	jg     17a <thread_create+0x4d>
    if(threads[i]->flag==0){
 153:	8b 0c 95 e0 0b 00 00 	mov    0xbe0(,%edx,4),%ecx
 15a:	83 79 08 00          	cmpl   $0x0,0x8(%ecx)
 15e:	75 eb                	jne    14b <thread_create+0x1e>
      threads[i]->maddr = n_stack;
 160:	89 01                	mov    %eax,(%ecx)
      threads[i]->pg1addr = n_stack;
 162:	8b 0c 95 e0 0b 00 00 	mov    0xbe0(,%edx,4),%ecx
 169:	89 41 04             	mov    %eax,0x4(%ecx)
      threads[i]->flag = 1;
 16c:	8b 14 95 e0 0b 00 00 	mov    0xbe0(,%edx,4),%edx
 173:	c7 42 08 01 00 00 00 	movl   $0x1,0x8(%edx)
      break;
    }
  }
  
  int new_pid = clone(start_routine, arg1, arg2, n_stack); // TODO: is this the right way to call it?
 17a:	50                   	push   %eax
 17b:	ff 75 10             	push   0x10(%ebp)
 17e:	ff 75 0c             	push   0xc(%ebp)
 181:	ff 75 08             	push   0x8(%ebp)
 184:	e8 da 02 00 00       	call   463 <clone>

  // I can't remember if there was something else to do here but I'm sure I'll find out



  return new_pid;
 189:	83 c4 10             	add    $0x10,%esp
}
 18c:	c9                   	leave  
 18d:	c3                   	ret    
    return -1;
 18e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 193:	eb f7                	jmp    18c <thread_create+0x5f>

00000195 <thread_join>:

//TODO: fix
int thread_join() {
 195:	55                   	push   %ebp
 196:	89 e5                	mov    %esp,%ebp
 198:	56                   	push   %esi
 199:	53                   	push   %ebx
 19a:	83 ec 1c             	sub    $0x1c,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 19d:	8d 45 f4             	lea    -0xc(%ebp),%eax
 1a0:	50                   	push   %eax
 1a1:	e8 c5 02 00 00       	call   46b <join>
 1a6:	89 c6                	mov    %eax,%esi
  for(int i=0; i<64; i++){
 1a8:	83 c4 10             	add    $0x10,%esp
 1ab:	bb 00 00 00 00       	mov    $0x0,%ebx
 1b0:	eb 03                	jmp    1b5 <thread_join+0x20>
 1b2:	83 c3 01             	add    $0x1,%ebx
 1b5:	83 fb 3f             	cmp    $0x3f,%ebx
 1b8:	7f 23                	jg     1dd <thread_join+0x48>
    if((threads[i]->flag==1) && (stk_addr == threads[i]->pg1addr)){
 1ba:	8b 04 9d e0 0b 00 00 	mov    0xbe0(,%ebx,4),%eax
 1c1:	83 78 08 01          	cmpl   $0x1,0x8(%eax)
 1c5:	75 eb                	jne    1b2 <thread_join+0x1d>
 1c7:	8b 55 f4             	mov    -0xc(%ebp),%edx
 1ca:	39 50 04             	cmp    %edx,0x4(%eax)
 1cd:	75 e3                	jne    1b2 <thread_join+0x1d>
      free(stk_addr);
 1cf:	83 ec 0c             	sub    $0xc,%esp
 1d2:	52                   	push   %edx
 1d3:	e8 a6 04 00 00       	call   67e <free>
 1d8:	83 c4 10             	add    $0x10,%esp
 1db:	eb d5                	jmp    1b2 <thread_join+0x1d>
    }
  }
  return pid;
}
 1dd:	89 f0                	mov    %esi,%eax
 1df:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1e2:	5b                   	pop    %ebx
 1e3:	5e                   	pop    %esi
 1e4:	5d                   	pop    %ebp
 1e5:	c3                   	ret    

000001e6 <lock_acquire>:

void lock_acquire(lock_t *lock){
 1e6:	55                   	push   %ebp
 1e7:	89 e5                	mov    %esp,%ebp
 1e9:	53                   	push   %ebx
 1ea:	83 ec 04             	sub    $0x4,%esp
 1ed:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 1f0:	83 ec 08             	sub    $0x8,%esp
 1f3:	6a 01                	push   $0x1
 1f5:	53                   	push   %ebx
 1f6:	e8 21 ff ff ff       	call   11c <test_and_set>
 1fb:	83 c4 10             	add    $0x10,%esp
 1fe:	83 f8 01             	cmp    $0x1,%eax
 201:	74 ed                	je     1f0 <lock_acquire+0xa>
    ;
}
 203:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 206:	c9                   	leave  
 207:	c3                   	ret    

00000208 <lock_release>:

void lock_release(lock_t *lock) {
 208:	55                   	push   %ebp
 209:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 20b:	8b 45 08             	mov    0x8(%ebp),%eax
 20e:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 214:	5d                   	pop    %ebp
 215:	c3                   	ret    

00000216 <lock_init>:

void lock_init(lock_t *lock) {
 216:	55                   	push   %ebp
 217:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 219:	8b 45 08             	mov    0x8(%ebp),%eax
 21c:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 222:	5d                   	pop    %ebp
 223:	c3                   	ret    

00000224 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 224:	55                   	push   %ebp
 225:	89 e5                	mov    %esp,%ebp
 227:	56                   	push   %esi
 228:	53                   	push   %ebx
 229:	8b 75 08             	mov    0x8(%ebp),%esi
 22c:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 22f:	89 f0                	mov    %esi,%eax
 231:	89 d1                	mov    %edx,%ecx
 233:	83 c2 01             	add    $0x1,%edx
 236:	89 c3                	mov    %eax,%ebx
 238:	83 c0 01             	add    $0x1,%eax
 23b:	0f b6 09             	movzbl (%ecx),%ecx
 23e:	88 0b                	mov    %cl,(%ebx)
 240:	84 c9                	test   %cl,%cl
 242:	75 ed                	jne    231 <strcpy+0xd>
    ;
  return os;
}
 244:	89 f0                	mov    %esi,%eax
 246:	5b                   	pop    %ebx
 247:	5e                   	pop    %esi
 248:	5d                   	pop    %ebp
 249:	c3                   	ret    

0000024a <strcmp>:

int
strcmp(const char *p, const char *q)
{
 24a:	55                   	push   %ebp
 24b:	89 e5                	mov    %esp,%ebp
 24d:	8b 4d 08             	mov    0x8(%ebp),%ecx
 250:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 253:	eb 06                	jmp    25b <strcmp+0x11>
    p++, q++;
 255:	83 c1 01             	add    $0x1,%ecx
 258:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 25b:	0f b6 01             	movzbl (%ecx),%eax
 25e:	84 c0                	test   %al,%al
 260:	74 04                	je     266 <strcmp+0x1c>
 262:	3a 02                	cmp    (%edx),%al
 264:	74 ef                	je     255 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 266:	0f b6 c0             	movzbl %al,%eax
 269:	0f b6 12             	movzbl (%edx),%edx
 26c:	29 d0                	sub    %edx,%eax
}
 26e:	5d                   	pop    %ebp
 26f:	c3                   	ret    

00000270 <strlen>:

uint
strlen(const char *s)
{
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 276:	b8 00 00 00 00       	mov    $0x0,%eax
 27b:	eb 03                	jmp    280 <strlen+0x10>
 27d:	83 c0 01             	add    $0x1,%eax
 280:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 284:	75 f7                	jne    27d <strlen+0xd>
    ;
  return n;
}
 286:	5d                   	pop    %ebp
 287:	c3                   	ret    

00000288 <memset>:

void*
memset(void *dst, int c, uint n)
{
 288:	55                   	push   %ebp
 289:	89 e5                	mov    %esp,%ebp
 28b:	57                   	push   %edi
 28c:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 28f:	89 d7                	mov    %edx,%edi
 291:	8b 4d 10             	mov    0x10(%ebp),%ecx
 294:	8b 45 0c             	mov    0xc(%ebp),%eax
 297:	fc                   	cld    
 298:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 29a:	89 d0                	mov    %edx,%eax
 29c:	8b 7d fc             	mov    -0x4(%ebp),%edi
 29f:	c9                   	leave  
 2a0:	c3                   	ret    

000002a1 <strchr>:

char*
strchr(const char *s, char c)
{
 2a1:	55                   	push   %ebp
 2a2:	89 e5                	mov    %esp,%ebp
 2a4:	8b 45 08             	mov    0x8(%ebp),%eax
 2a7:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 2ab:	eb 03                	jmp    2b0 <strchr+0xf>
 2ad:	83 c0 01             	add    $0x1,%eax
 2b0:	0f b6 10             	movzbl (%eax),%edx
 2b3:	84 d2                	test   %dl,%dl
 2b5:	74 06                	je     2bd <strchr+0x1c>
    if(*s == c)
 2b7:	38 ca                	cmp    %cl,%dl
 2b9:	75 f2                	jne    2ad <strchr+0xc>
 2bb:	eb 05                	jmp    2c2 <strchr+0x21>
      return (char*)s;
  return 0;
 2bd:	b8 00 00 00 00       	mov    $0x0,%eax
}
 2c2:	5d                   	pop    %ebp
 2c3:	c3                   	ret    

000002c4 <gets>:

char*
gets(char *buf, int max)
{
 2c4:	55                   	push   %ebp
 2c5:	89 e5                	mov    %esp,%ebp
 2c7:	57                   	push   %edi
 2c8:	56                   	push   %esi
 2c9:	53                   	push   %ebx
 2ca:	83 ec 1c             	sub    $0x1c,%esp
 2cd:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2d0:	bb 00 00 00 00       	mov    $0x0,%ebx
 2d5:	89 de                	mov    %ebx,%esi
 2d7:	83 c3 01             	add    $0x1,%ebx
 2da:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2dd:	7d 2e                	jge    30d <gets+0x49>
    cc = read(0, &c, 1);
 2df:	83 ec 04             	sub    $0x4,%esp
 2e2:	6a 01                	push   $0x1
 2e4:	8d 45 e7             	lea    -0x19(%ebp),%eax
 2e7:	50                   	push   %eax
 2e8:	6a 00                	push   $0x0
 2ea:	e8 ec 00 00 00       	call   3db <read>
    if(cc < 1)
 2ef:	83 c4 10             	add    $0x10,%esp
 2f2:	85 c0                	test   %eax,%eax
 2f4:	7e 17                	jle    30d <gets+0x49>
      break;
    buf[i++] = c;
 2f6:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2fa:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 2fd:	3c 0a                	cmp    $0xa,%al
 2ff:	0f 94 c2             	sete   %dl
 302:	3c 0d                	cmp    $0xd,%al
 304:	0f 94 c0             	sete   %al
 307:	08 c2                	or     %al,%dl
 309:	74 ca                	je     2d5 <gets+0x11>
    buf[i++] = c;
 30b:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 30d:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 311:	89 f8                	mov    %edi,%eax
 313:	8d 65 f4             	lea    -0xc(%ebp),%esp
 316:	5b                   	pop    %ebx
 317:	5e                   	pop    %esi
 318:	5f                   	pop    %edi
 319:	5d                   	pop    %ebp
 31a:	c3                   	ret    

0000031b <stat>:

int
stat(const char *n, struct stat *st)
{
 31b:	55                   	push   %ebp
 31c:	89 e5                	mov    %esp,%ebp
 31e:	56                   	push   %esi
 31f:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 320:	83 ec 08             	sub    $0x8,%esp
 323:	6a 00                	push   $0x0
 325:	ff 75 08             	push   0x8(%ebp)
 328:	e8 d6 00 00 00       	call   403 <open>
  if(fd < 0)
 32d:	83 c4 10             	add    $0x10,%esp
 330:	85 c0                	test   %eax,%eax
 332:	78 24                	js     358 <stat+0x3d>
 334:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 336:	83 ec 08             	sub    $0x8,%esp
 339:	ff 75 0c             	push   0xc(%ebp)
 33c:	50                   	push   %eax
 33d:	e8 d9 00 00 00       	call   41b <fstat>
 342:	89 c6                	mov    %eax,%esi
  close(fd);
 344:	89 1c 24             	mov    %ebx,(%esp)
 347:	e8 9f 00 00 00       	call   3eb <close>
  return r;
 34c:	83 c4 10             	add    $0x10,%esp
}
 34f:	89 f0                	mov    %esi,%eax
 351:	8d 65 f8             	lea    -0x8(%ebp),%esp
 354:	5b                   	pop    %ebx
 355:	5e                   	pop    %esi
 356:	5d                   	pop    %ebp
 357:	c3                   	ret    
    return -1;
 358:	be ff ff ff ff       	mov    $0xffffffff,%esi
 35d:	eb f0                	jmp    34f <stat+0x34>

0000035f <atoi>:

int
atoi(const char *s)
{
 35f:	55                   	push   %ebp
 360:	89 e5                	mov    %esp,%ebp
 362:	53                   	push   %ebx
 363:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 366:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 36b:	eb 10                	jmp    37d <atoi+0x1e>
    n = n*10 + *s++ - '0';
 36d:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 370:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 373:	83 c1 01             	add    $0x1,%ecx
 376:	0f be c0             	movsbl %al,%eax
 379:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 37d:	0f b6 01             	movzbl (%ecx),%eax
 380:	8d 58 d0             	lea    -0x30(%eax),%ebx
 383:	80 fb 09             	cmp    $0x9,%bl
 386:	76 e5                	jbe    36d <atoi+0xe>
  return n;
}
 388:	89 d0                	mov    %edx,%eax
 38a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 38d:	c9                   	leave  
 38e:	c3                   	ret    

0000038f <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 38f:	55                   	push   %ebp
 390:	89 e5                	mov    %esp,%ebp
 392:	56                   	push   %esi
 393:	53                   	push   %ebx
 394:	8b 75 08             	mov    0x8(%ebp),%esi
 397:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 39a:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 39d:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 39f:	eb 0d                	jmp    3ae <memmove+0x1f>
    *dst++ = *src++;
 3a1:	0f b6 01             	movzbl (%ecx),%eax
 3a4:	88 02                	mov    %al,(%edx)
 3a6:	8d 49 01             	lea    0x1(%ecx),%ecx
 3a9:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 3ac:	89 d8                	mov    %ebx,%eax
 3ae:	8d 58 ff             	lea    -0x1(%eax),%ebx
 3b1:	85 c0                	test   %eax,%eax
 3b3:	7f ec                	jg     3a1 <memmove+0x12>
  return vdst;
}
 3b5:	89 f0                	mov    %esi,%eax
 3b7:	5b                   	pop    %ebx
 3b8:	5e                   	pop    %esi
 3b9:	5d                   	pop    %ebp
 3ba:	c3                   	ret    

000003bb <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3bb:	b8 01 00 00 00       	mov    $0x1,%eax
 3c0:	cd 40                	int    $0x40
 3c2:	c3                   	ret    

000003c3 <exit>:
SYSCALL(exit)
 3c3:	b8 02 00 00 00       	mov    $0x2,%eax
 3c8:	cd 40                	int    $0x40
 3ca:	c3                   	ret    

000003cb <wait>:
SYSCALL(wait)
 3cb:	b8 03 00 00 00       	mov    $0x3,%eax
 3d0:	cd 40                	int    $0x40
 3d2:	c3                   	ret    

000003d3 <pipe>:
SYSCALL(pipe)
 3d3:	b8 04 00 00 00       	mov    $0x4,%eax
 3d8:	cd 40                	int    $0x40
 3da:	c3                   	ret    

000003db <read>:
SYSCALL(read)
 3db:	b8 05 00 00 00       	mov    $0x5,%eax
 3e0:	cd 40                	int    $0x40
 3e2:	c3                   	ret    

000003e3 <write>:
SYSCALL(write)
 3e3:	b8 10 00 00 00       	mov    $0x10,%eax
 3e8:	cd 40                	int    $0x40
 3ea:	c3                   	ret    

000003eb <close>:
SYSCALL(close)
 3eb:	b8 15 00 00 00       	mov    $0x15,%eax
 3f0:	cd 40                	int    $0x40
 3f2:	c3                   	ret    

000003f3 <kill>:
SYSCALL(kill)
 3f3:	b8 06 00 00 00       	mov    $0x6,%eax
 3f8:	cd 40                	int    $0x40
 3fa:	c3                   	ret    

000003fb <exec>:
SYSCALL(exec)
 3fb:	b8 07 00 00 00       	mov    $0x7,%eax
 400:	cd 40                	int    $0x40
 402:	c3                   	ret    

00000403 <open>:
SYSCALL(open)
 403:	b8 0f 00 00 00       	mov    $0xf,%eax
 408:	cd 40                	int    $0x40
 40a:	c3                   	ret    

0000040b <mknod>:
SYSCALL(mknod)
 40b:	b8 11 00 00 00       	mov    $0x11,%eax
 410:	cd 40                	int    $0x40
 412:	c3                   	ret    

00000413 <unlink>:
SYSCALL(unlink)
 413:	b8 12 00 00 00       	mov    $0x12,%eax
 418:	cd 40                	int    $0x40
 41a:	c3                   	ret    

0000041b <fstat>:
SYSCALL(fstat)
 41b:	b8 08 00 00 00       	mov    $0x8,%eax
 420:	cd 40                	int    $0x40
 422:	c3                   	ret    

00000423 <link>:
SYSCALL(link)
 423:	b8 13 00 00 00       	mov    $0x13,%eax
 428:	cd 40                	int    $0x40
 42a:	c3                   	ret    

0000042b <mkdir>:
SYSCALL(mkdir)
 42b:	b8 14 00 00 00       	mov    $0x14,%eax
 430:	cd 40                	int    $0x40
 432:	c3                   	ret    

00000433 <chdir>:
SYSCALL(chdir)
 433:	b8 09 00 00 00       	mov    $0x9,%eax
 438:	cd 40                	int    $0x40
 43a:	c3                   	ret    

0000043b <dup>:
SYSCALL(dup)
 43b:	b8 0a 00 00 00       	mov    $0xa,%eax
 440:	cd 40                	int    $0x40
 442:	c3                   	ret    

00000443 <getpid>:
SYSCALL(getpid)
 443:	b8 0b 00 00 00       	mov    $0xb,%eax
 448:	cd 40                	int    $0x40
 44a:	c3                   	ret    

0000044b <sbrk>:
SYSCALL(sbrk)
 44b:	b8 0c 00 00 00       	mov    $0xc,%eax
 450:	cd 40                	int    $0x40
 452:	c3                   	ret    

00000453 <sleep>:
SYSCALL(sleep)
 453:	b8 0d 00 00 00       	mov    $0xd,%eax
 458:	cd 40                	int    $0x40
 45a:	c3                   	ret    

0000045b <uptime>:
SYSCALL(uptime)
 45b:	b8 0e 00 00 00       	mov    $0xe,%eax
 460:	cd 40                	int    $0x40
 462:	c3                   	ret    

00000463 <clone>:
SYSCALL(clone)
 463:	b8 16 00 00 00       	mov    $0x16,%eax
 468:	cd 40                	int    $0x40
 46a:	c3                   	ret    

0000046b <join>:
 46b:	b8 17 00 00 00       	mov    $0x17,%eax
 470:	cd 40                	int    $0x40
 472:	c3                   	ret    

00000473 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 473:	55                   	push   %ebp
 474:	89 e5                	mov    %esp,%ebp
 476:	83 ec 1c             	sub    $0x1c,%esp
 479:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 47c:	6a 01                	push   $0x1
 47e:	8d 55 f4             	lea    -0xc(%ebp),%edx
 481:	52                   	push   %edx
 482:	50                   	push   %eax
 483:	e8 5b ff ff ff       	call   3e3 <write>
}
 488:	83 c4 10             	add    $0x10,%esp
 48b:	c9                   	leave  
 48c:	c3                   	ret    

0000048d <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 48d:	55                   	push   %ebp
 48e:	89 e5                	mov    %esp,%ebp
 490:	57                   	push   %edi
 491:	56                   	push   %esi
 492:	53                   	push   %ebx
 493:	83 ec 2c             	sub    $0x2c,%esp
 496:	89 45 d0             	mov    %eax,-0x30(%ebp)
 499:	89 d0                	mov    %edx,%eax
 49b:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 49d:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 4a1:	0f 95 c1             	setne  %cl
 4a4:	c1 ea 1f             	shr    $0x1f,%edx
 4a7:	84 d1                	test   %dl,%cl
 4a9:	74 44                	je     4ef <printint+0x62>
    neg = 1;
    x = -xx;
 4ab:	f7 d8                	neg    %eax
 4ad:	89 c1                	mov    %eax,%ecx
    neg = 1;
 4af:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 4b6:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 4bb:	89 c8                	mov    %ecx,%eax
 4bd:	ba 00 00 00 00       	mov    $0x0,%edx
 4c2:	f7 f6                	div    %esi
 4c4:	89 df                	mov    %ebx,%edi
 4c6:	83 c3 01             	add    $0x1,%ebx
 4c9:	0f b6 92 4c 08 00 00 	movzbl 0x84c(%edx),%edx
 4d0:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 4d4:	89 ca                	mov    %ecx,%edx
 4d6:	89 c1                	mov    %eax,%ecx
 4d8:	39 d6                	cmp    %edx,%esi
 4da:	76 df                	jbe    4bb <printint+0x2e>
  if(neg)
 4dc:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 4e0:	74 31                	je     513 <printint+0x86>
    buf[i++] = '-';
 4e2:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 4e7:	8d 5f 02             	lea    0x2(%edi),%ebx
 4ea:	8b 75 d0             	mov    -0x30(%ebp),%esi
 4ed:	eb 17                	jmp    506 <printint+0x79>
    x = xx;
 4ef:	89 c1                	mov    %eax,%ecx
  neg = 0;
 4f1:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 4f8:	eb bc                	jmp    4b6 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 4fa:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 4ff:	89 f0                	mov    %esi,%eax
 501:	e8 6d ff ff ff       	call   473 <putc>
  while(--i >= 0)
 506:	83 eb 01             	sub    $0x1,%ebx
 509:	79 ef                	jns    4fa <printint+0x6d>
}
 50b:	83 c4 2c             	add    $0x2c,%esp
 50e:	5b                   	pop    %ebx
 50f:	5e                   	pop    %esi
 510:	5f                   	pop    %edi
 511:	5d                   	pop    %ebp
 512:	c3                   	ret    
 513:	8b 75 d0             	mov    -0x30(%ebp),%esi
 516:	eb ee                	jmp    506 <printint+0x79>

00000518 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 518:	55                   	push   %ebp
 519:	89 e5                	mov    %esp,%ebp
 51b:	57                   	push   %edi
 51c:	56                   	push   %esi
 51d:	53                   	push   %ebx
 51e:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 521:	8d 45 10             	lea    0x10(%ebp),%eax
 524:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 527:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 52c:	bb 00 00 00 00       	mov    $0x0,%ebx
 531:	eb 14                	jmp    547 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 533:	89 fa                	mov    %edi,%edx
 535:	8b 45 08             	mov    0x8(%ebp),%eax
 538:	e8 36 ff ff ff       	call   473 <putc>
 53d:	eb 05                	jmp    544 <printf+0x2c>
      }
    } else if(state == '%'){
 53f:	83 fe 25             	cmp    $0x25,%esi
 542:	74 25                	je     569 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 544:	83 c3 01             	add    $0x1,%ebx
 547:	8b 45 0c             	mov    0xc(%ebp),%eax
 54a:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 54e:	84 c0                	test   %al,%al
 550:	0f 84 20 01 00 00    	je     676 <printf+0x15e>
    c = fmt[i] & 0xff;
 556:	0f be f8             	movsbl %al,%edi
 559:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 55c:	85 f6                	test   %esi,%esi
 55e:	75 df                	jne    53f <printf+0x27>
      if(c == '%'){
 560:	83 f8 25             	cmp    $0x25,%eax
 563:	75 ce                	jne    533 <printf+0x1b>
        state = '%';
 565:	89 c6                	mov    %eax,%esi
 567:	eb db                	jmp    544 <printf+0x2c>
      if(c == 'd'){
 569:	83 f8 25             	cmp    $0x25,%eax
 56c:	0f 84 cf 00 00 00    	je     641 <printf+0x129>
 572:	0f 8c dd 00 00 00    	jl     655 <printf+0x13d>
 578:	83 f8 78             	cmp    $0x78,%eax
 57b:	0f 8f d4 00 00 00    	jg     655 <printf+0x13d>
 581:	83 f8 63             	cmp    $0x63,%eax
 584:	0f 8c cb 00 00 00    	jl     655 <printf+0x13d>
 58a:	83 e8 63             	sub    $0x63,%eax
 58d:	83 f8 15             	cmp    $0x15,%eax
 590:	0f 87 bf 00 00 00    	ja     655 <printf+0x13d>
 596:	ff 24 85 f4 07 00 00 	jmp    *0x7f4(,%eax,4)
        printint(fd, *ap, 10, 1);
 59d:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5a0:	8b 17                	mov    (%edi),%edx
 5a2:	83 ec 0c             	sub    $0xc,%esp
 5a5:	6a 01                	push   $0x1
 5a7:	b9 0a 00 00 00       	mov    $0xa,%ecx
 5ac:	8b 45 08             	mov    0x8(%ebp),%eax
 5af:	e8 d9 fe ff ff       	call   48d <printint>
        ap++;
 5b4:	83 c7 04             	add    $0x4,%edi
 5b7:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 5ba:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 5bd:	be 00 00 00 00       	mov    $0x0,%esi
 5c2:	eb 80                	jmp    544 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 5c4:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5c7:	8b 17                	mov    (%edi),%edx
 5c9:	83 ec 0c             	sub    $0xc,%esp
 5cc:	6a 00                	push   $0x0
 5ce:	b9 10 00 00 00       	mov    $0x10,%ecx
 5d3:	8b 45 08             	mov    0x8(%ebp),%eax
 5d6:	e8 b2 fe ff ff       	call   48d <printint>
        ap++;
 5db:	83 c7 04             	add    $0x4,%edi
 5de:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 5e1:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5e4:	be 00 00 00 00       	mov    $0x0,%esi
 5e9:	e9 56 ff ff ff       	jmp    544 <printf+0x2c>
        s = (char*)*ap;
 5ee:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5f1:	8b 30                	mov    (%eax),%esi
        ap++;
 5f3:	83 c0 04             	add    $0x4,%eax
 5f6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 5f9:	85 f6                	test   %esi,%esi
 5fb:	75 15                	jne    612 <printf+0xfa>
          s = "(null)";
 5fd:	be eb 07 00 00       	mov    $0x7eb,%esi
 602:	eb 0e                	jmp    612 <printf+0xfa>
          putc(fd, *s);
 604:	0f be d2             	movsbl %dl,%edx
 607:	8b 45 08             	mov    0x8(%ebp),%eax
 60a:	e8 64 fe ff ff       	call   473 <putc>
          s++;
 60f:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 612:	0f b6 16             	movzbl (%esi),%edx
 615:	84 d2                	test   %dl,%dl
 617:	75 eb                	jne    604 <printf+0xec>
      state = 0;
 619:	be 00 00 00 00       	mov    $0x0,%esi
 61e:	e9 21 ff ff ff       	jmp    544 <printf+0x2c>
        putc(fd, *ap);
 623:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 626:	0f be 17             	movsbl (%edi),%edx
 629:	8b 45 08             	mov    0x8(%ebp),%eax
 62c:	e8 42 fe ff ff       	call   473 <putc>
        ap++;
 631:	83 c7 04             	add    $0x4,%edi
 634:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 637:	be 00 00 00 00       	mov    $0x0,%esi
 63c:	e9 03 ff ff ff       	jmp    544 <printf+0x2c>
        putc(fd, c);
 641:	89 fa                	mov    %edi,%edx
 643:	8b 45 08             	mov    0x8(%ebp),%eax
 646:	e8 28 fe ff ff       	call   473 <putc>
      state = 0;
 64b:	be 00 00 00 00       	mov    $0x0,%esi
 650:	e9 ef fe ff ff       	jmp    544 <printf+0x2c>
        putc(fd, '%');
 655:	ba 25 00 00 00       	mov    $0x25,%edx
 65a:	8b 45 08             	mov    0x8(%ebp),%eax
 65d:	e8 11 fe ff ff       	call   473 <putc>
        putc(fd, c);
 662:	89 fa                	mov    %edi,%edx
 664:	8b 45 08             	mov    0x8(%ebp),%eax
 667:	e8 07 fe ff ff       	call   473 <putc>
      state = 0;
 66c:	be 00 00 00 00       	mov    $0x0,%esi
 671:	e9 ce fe ff ff       	jmp    544 <printf+0x2c>
    }
  }
}
 676:	8d 65 f4             	lea    -0xc(%ebp),%esp
 679:	5b                   	pop    %ebx
 67a:	5e                   	pop    %esi
 67b:	5f                   	pop    %edi
 67c:	5d                   	pop    %ebp
 67d:	c3                   	ret    

0000067e <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 67e:	55                   	push   %ebp
 67f:	89 e5                	mov    %esp,%ebp
 681:	57                   	push   %edi
 682:	56                   	push   %esi
 683:	53                   	push   %ebx
 684:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 687:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 68a:	a1 e0 0c 00 00       	mov    0xce0,%eax
 68f:	eb 02                	jmp    693 <free+0x15>
 691:	89 d0                	mov    %edx,%eax
 693:	39 c8                	cmp    %ecx,%eax
 695:	73 04                	jae    69b <free+0x1d>
 697:	39 08                	cmp    %ecx,(%eax)
 699:	77 12                	ja     6ad <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 69b:	8b 10                	mov    (%eax),%edx
 69d:	39 c2                	cmp    %eax,%edx
 69f:	77 f0                	ja     691 <free+0x13>
 6a1:	39 c8                	cmp    %ecx,%eax
 6a3:	72 08                	jb     6ad <free+0x2f>
 6a5:	39 ca                	cmp    %ecx,%edx
 6a7:	77 04                	ja     6ad <free+0x2f>
 6a9:	89 d0                	mov    %edx,%eax
 6ab:	eb e6                	jmp    693 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 6ad:	8b 73 fc             	mov    -0x4(%ebx),%esi
 6b0:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 6b3:	8b 10                	mov    (%eax),%edx
 6b5:	39 d7                	cmp    %edx,%edi
 6b7:	74 19                	je     6d2 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 6b9:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 6bc:	8b 50 04             	mov    0x4(%eax),%edx
 6bf:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 6c2:	39 ce                	cmp    %ecx,%esi
 6c4:	74 1b                	je     6e1 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 6c6:	89 08                	mov    %ecx,(%eax)
  freep = p;
 6c8:	a3 e0 0c 00 00       	mov    %eax,0xce0
}
 6cd:	5b                   	pop    %ebx
 6ce:	5e                   	pop    %esi
 6cf:	5f                   	pop    %edi
 6d0:	5d                   	pop    %ebp
 6d1:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 6d2:	03 72 04             	add    0x4(%edx),%esi
 6d5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 6d8:	8b 10                	mov    (%eax),%edx
 6da:	8b 12                	mov    (%edx),%edx
 6dc:	89 53 f8             	mov    %edx,-0x8(%ebx)
 6df:	eb db                	jmp    6bc <free+0x3e>
    p->s.size += bp->s.size;
 6e1:	03 53 fc             	add    -0x4(%ebx),%edx
 6e4:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6e7:	8b 53 f8             	mov    -0x8(%ebx),%edx
 6ea:	89 10                	mov    %edx,(%eax)
 6ec:	eb da                	jmp    6c8 <free+0x4a>

000006ee <morecore>:

static Header*
morecore(uint nu)
{
 6ee:	55                   	push   %ebp
 6ef:	89 e5                	mov    %esp,%ebp
 6f1:	53                   	push   %ebx
 6f2:	83 ec 04             	sub    $0x4,%esp
 6f5:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 6f7:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 6fc:	77 05                	ja     703 <morecore+0x15>
    nu = 4096;
 6fe:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 703:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 70a:	83 ec 0c             	sub    $0xc,%esp
 70d:	50                   	push   %eax
 70e:	e8 38 fd ff ff       	call   44b <sbrk>
  if(p == (char*)-1)
 713:	83 c4 10             	add    $0x10,%esp
 716:	83 f8 ff             	cmp    $0xffffffff,%eax
 719:	74 1c                	je     737 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 71b:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 71e:	83 c0 08             	add    $0x8,%eax
 721:	83 ec 0c             	sub    $0xc,%esp
 724:	50                   	push   %eax
 725:	e8 54 ff ff ff       	call   67e <free>
  return freep;
 72a:	a1 e0 0c 00 00       	mov    0xce0,%eax
 72f:	83 c4 10             	add    $0x10,%esp
}
 732:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 735:	c9                   	leave  
 736:	c3                   	ret    
    return 0;
 737:	b8 00 00 00 00       	mov    $0x0,%eax
 73c:	eb f4                	jmp    732 <morecore+0x44>

0000073e <malloc>:

void*
malloc(uint nbytes)
{
 73e:	55                   	push   %ebp
 73f:	89 e5                	mov    %esp,%ebp
 741:	53                   	push   %ebx
 742:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 745:	8b 45 08             	mov    0x8(%ebp),%eax
 748:	8d 58 07             	lea    0x7(%eax),%ebx
 74b:	c1 eb 03             	shr    $0x3,%ebx
 74e:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 751:	8b 0d e0 0c 00 00    	mov    0xce0,%ecx
 757:	85 c9                	test   %ecx,%ecx
 759:	74 04                	je     75f <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 75b:	8b 01                	mov    (%ecx),%eax
 75d:	eb 4a                	jmp    7a9 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 75f:	c7 05 e0 0c 00 00 e4 	movl   $0xce4,0xce0
 766:	0c 00 00 
 769:	c7 05 e4 0c 00 00 e4 	movl   $0xce4,0xce4
 770:	0c 00 00 
    base.s.size = 0;
 773:	c7 05 e8 0c 00 00 00 	movl   $0x0,0xce8
 77a:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 77d:	b9 e4 0c 00 00       	mov    $0xce4,%ecx
 782:	eb d7                	jmp    75b <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 784:	74 19                	je     79f <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 786:	29 da                	sub    %ebx,%edx
 788:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 78b:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 78e:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 791:	89 0d e0 0c 00 00    	mov    %ecx,0xce0
      return (void*)(p + 1);
 797:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 79a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 79d:	c9                   	leave  
 79e:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 79f:	8b 10                	mov    (%eax),%edx
 7a1:	89 11                	mov    %edx,(%ecx)
 7a3:	eb ec                	jmp    791 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7a5:	89 c1                	mov    %eax,%ecx
 7a7:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 7a9:	8b 50 04             	mov    0x4(%eax),%edx
 7ac:	39 da                	cmp    %ebx,%edx
 7ae:	73 d4                	jae    784 <malloc+0x46>
    if(p == freep)
 7b0:	39 05 e0 0c 00 00    	cmp    %eax,0xce0
 7b6:	75 ed                	jne    7a5 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 7b8:	89 d8                	mov    %ebx,%eax
 7ba:	e8 2f ff ff ff       	call   6ee <morecore>
 7bf:	85 c0                	test   %eax,%eax
 7c1:	75 e2                	jne    7a5 <malloc+0x67>
 7c3:	eb d5                	jmp    79a <malloc+0x5c>
