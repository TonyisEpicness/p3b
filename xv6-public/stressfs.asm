
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
  2a:	68 c0 07 00 00       	push   $0x7c0
  2f:	6a 01                	push   $0x1
  31:	e8 da 04 00 00       	call   510 <printf>
  memset(data, 'a', sizeof(data));
  36:	83 c4 0c             	add    $0xc,%esp
  39:	68 00 02 00 00       	push   $0x200
  3e:	6a 61                	push   $0x61
  40:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  46:	50                   	push   %eax
  47:	e8 34 02 00 00       	call   280 <memset>

  for(i = 0; i < 4; i++)
  4c:	83 c4 10             	add    $0x10,%esp
  4f:	bb 00 00 00 00       	mov    $0x0,%ebx
  54:	83 fb 03             	cmp    $0x3,%ebx
  57:	7f 0e                	jg     67 <main+0x67>
    if(fork() > 0)
  59:	e8 55 03 00 00       	call   3b3 <fork>
  5e:	85 c0                	test   %eax,%eax
  60:	7f 05                	jg     67 <main+0x67>
  for(i = 0; i < 4; i++)
  62:	83 c3 01             	add    $0x1,%ebx
  65:	eb ed                	jmp    54 <main+0x54>
      break;

  printf(1, "write %d\n", i);
  67:	83 ec 04             	sub    $0x4,%esp
  6a:	53                   	push   %ebx
  6b:	68 d3 07 00 00       	push   $0x7d3
  70:	6a 01                	push   $0x1
  72:	e8 99 04 00 00       	call   510 <printf>

  path[8] += i;
  77:	00 5d e6             	add    %bl,-0x1a(%ebp)
  fd = open(path, O_CREATE | O_RDWR);
  7a:	83 c4 08             	add    $0x8,%esp
  7d:	68 02 02 00 00       	push   $0x202
  82:	8d 45 de             	lea    -0x22(%ebp),%eax
  85:	50                   	push   %eax
  86:	e8 70 03 00 00       	call   3fb <open>
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
  a7:	e8 2f 03 00 00       	call   3db <write>
  for(i = 0; i < 20; i++)
  ac:	83 c3 01             	add    $0x1,%ebx
  af:	83 c4 10             	add    $0x10,%esp
  b2:	83 fb 13             	cmp    $0x13,%ebx
  b5:	7e e0                	jle    97 <main+0x97>
  close(fd);
  b7:	83 ec 0c             	sub    $0xc,%esp
  ba:	56                   	push   %esi
  bb:	e8 23 03 00 00       	call   3e3 <close>

  printf(1, "read\n");
  c0:	83 c4 08             	add    $0x8,%esp
  c3:	68 dd 07 00 00       	push   $0x7dd
  c8:	6a 01                	push   $0x1
  ca:	e8 41 04 00 00       	call   510 <printf>

  fd = open(path, O_RDONLY);
  cf:	83 c4 08             	add    $0x8,%esp
  d2:	6a 00                	push   $0x0
  d4:	8d 45 de             	lea    -0x22(%ebp),%eax
  d7:	50                   	push   %eax
  d8:	e8 1e 03 00 00       	call   3fb <open>
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
  f9:	e8 d5 02 00 00       	call   3d3 <read>
  for (i = 0; i < 20; i++)
  fe:	83 c3 01             	add    $0x1,%ebx
 101:	83 c4 10             	add    $0x10,%esp
 104:	83 fb 13             	cmp    $0x13,%ebx
 107:	7e e0                	jle    e9 <main+0xe9>
  close(fd);
 109:	83 ec 0c             	sub    $0xc,%esp
 10c:	56                   	push   %esi
 10d:	e8 d1 02 00 00       	call   3e3 <close>

  wait();
 112:	e8 ac 02 00 00       	call   3c3 <wait>

  exit();
 117:	e8 9f 02 00 00       	call   3bb <exit>

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
 130:	53                   	push   %ebx
 131:	83 ec 10             	sub    $0x10,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE*2);
 134:	68 00 20 00 00       	push   $0x2000
 139:	e8 f8 05 00 00       	call   736 <malloc>
  if(n_stack == 0){
 13e:	83 c4 10             	add    $0x10,%esp
 141:	85 c0                	test   %eax,%eax
 143:	74 41                	je     186 <thread_create+0x59>
 145:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  int new_pid = clone(start_routine, arg1, arg2, n_stack);
 147:	50                   	push   %eax
 148:	ff 75 10             	push   0x10(%ebp)
 14b:	ff 75 0c             	push   0xc(%ebp)
 14e:	ff 75 08             	push   0x8(%ebp)
 151:	e8 05 03 00 00       	call   45b <clone>

  for(int i=0; i<64; i++){
 156:	83 c4 10             	add    $0x10,%esp
 159:	ba 00 00 00 00       	mov    $0x0,%edx
 15e:	eb 03                	jmp    163 <thread_create+0x36>
 160:	83 c2 01             	add    $0x1,%edx
 163:	83 fa 3f             	cmp    $0x3f,%edx
 166:	7f 19                	jg     181 <thread_create+0x54>
    if(threads[i]->flag==0){
 168:	8b 0c 95 c0 0b 00 00 	mov    0xbc0(,%edx,4),%ecx
 16f:	83 79 08 00          	cmpl   $0x0,0x8(%ecx)
 173:	75 eb                	jne    160 <thread_create+0x33>
      threads[i]->maddr = n_stack;
 175:	89 19                	mov    %ebx,(%ecx)
      threads[i]->pg1addr = n_stack;
 177:	8b 14 95 c0 0b 00 00 	mov    0xbc0(,%edx,4),%edx
 17e:	89 5a 04             	mov    %ebx,0x4(%edx)
      break;
    }
  }

  return new_pid;
}
 181:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 184:	c9                   	leave  
 185:	c3                   	ret    
    return -1;
 186:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 18b:	eb f4                	jmp    181 <thread_create+0x54>

0000018d <thread_join>:

//TODO: fix
int thread_join() {
 18d:	55                   	push   %ebp
 18e:	89 e5                	mov    %esp,%ebp
 190:	56                   	push   %esi
 191:	53                   	push   %ebx
 192:	83 ec 1c             	sub    $0x1c,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 195:	8d 45 f4             	lea    -0xc(%ebp),%eax
 198:	50                   	push   %eax
 199:	e8 c5 02 00 00       	call   463 <join>
 19e:	89 c6                	mov    %eax,%esi
  for(int i=0; i<64; i++){
 1a0:	83 c4 10             	add    $0x10,%esp
 1a3:	bb 00 00 00 00       	mov    $0x0,%ebx
 1a8:	eb 03                	jmp    1ad <thread_join+0x20>
 1aa:	83 c3 01             	add    $0x1,%ebx
 1ad:	83 fb 3f             	cmp    $0x3f,%ebx
 1b0:	7f 23                	jg     1d5 <thread_join+0x48>
    if((threads[i]->flag==1) && (stk_addr == threads[i]->pg1addr)){
 1b2:	8b 04 9d c0 0b 00 00 	mov    0xbc0(,%ebx,4),%eax
 1b9:	83 78 08 01          	cmpl   $0x1,0x8(%eax)
 1bd:	75 eb                	jne    1aa <thread_join+0x1d>
 1bf:	8b 55 f4             	mov    -0xc(%ebp),%edx
 1c2:	39 50 04             	cmp    %edx,0x4(%eax)
 1c5:	75 e3                	jne    1aa <thread_join+0x1d>
      free(stk_addr);
 1c7:	83 ec 0c             	sub    $0xc,%esp
 1ca:	52                   	push   %edx
 1cb:	e8 a6 04 00 00       	call   676 <free>
 1d0:	83 c4 10             	add    $0x10,%esp
 1d3:	eb d5                	jmp    1aa <thread_join+0x1d>
    }
  }
  return pid;
}
 1d5:	89 f0                	mov    %esi,%eax
 1d7:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1da:	5b                   	pop    %ebx
 1db:	5e                   	pop    %esi
 1dc:	5d                   	pop    %ebp
 1dd:	c3                   	ret    

000001de <lock_acquire>:

void lock_acquire(lock_t *lock){
 1de:	55                   	push   %ebp
 1df:	89 e5                	mov    %esp,%ebp
 1e1:	53                   	push   %ebx
 1e2:	83 ec 04             	sub    $0x4,%esp
 1e5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 1e8:	83 ec 08             	sub    $0x8,%esp
 1eb:	6a 01                	push   $0x1
 1ed:	53                   	push   %ebx
 1ee:	e8 29 ff ff ff       	call   11c <test_and_set>
 1f3:	83 c4 10             	add    $0x10,%esp
 1f6:	83 f8 01             	cmp    $0x1,%eax
 1f9:	74 ed                	je     1e8 <lock_acquire+0xa>
    ;
}
 1fb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1fe:	c9                   	leave  
 1ff:	c3                   	ret    

00000200 <lock_release>:

void lock_release(lock_t *lock) {
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 203:	8b 45 08             	mov    0x8(%ebp),%eax
 206:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 20c:	5d                   	pop    %ebp
 20d:	c3                   	ret    

0000020e <lock_init>:

void lock_init(lock_t *lock) {
 20e:	55                   	push   %ebp
 20f:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 211:	8b 45 08             	mov    0x8(%ebp),%eax
 214:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 21a:	5d                   	pop    %ebp
 21b:	c3                   	ret    

0000021c <strcpy>:

char*
strcpy(char *s, const char *t)
{
 21c:	55                   	push   %ebp
 21d:	89 e5                	mov    %esp,%ebp
 21f:	56                   	push   %esi
 220:	53                   	push   %ebx
 221:	8b 75 08             	mov    0x8(%ebp),%esi
 224:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 227:	89 f0                	mov    %esi,%eax
 229:	89 d1                	mov    %edx,%ecx
 22b:	83 c2 01             	add    $0x1,%edx
 22e:	89 c3                	mov    %eax,%ebx
 230:	83 c0 01             	add    $0x1,%eax
 233:	0f b6 09             	movzbl (%ecx),%ecx
 236:	88 0b                	mov    %cl,(%ebx)
 238:	84 c9                	test   %cl,%cl
 23a:	75 ed                	jne    229 <strcpy+0xd>
    ;
  return os;
}
 23c:	89 f0                	mov    %esi,%eax
 23e:	5b                   	pop    %ebx
 23f:	5e                   	pop    %esi
 240:	5d                   	pop    %ebp
 241:	c3                   	ret    

00000242 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 242:	55                   	push   %ebp
 243:	89 e5                	mov    %esp,%ebp
 245:	8b 4d 08             	mov    0x8(%ebp),%ecx
 248:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 24b:	eb 06                	jmp    253 <strcmp+0x11>
    p++, q++;
 24d:	83 c1 01             	add    $0x1,%ecx
 250:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 253:	0f b6 01             	movzbl (%ecx),%eax
 256:	84 c0                	test   %al,%al
 258:	74 04                	je     25e <strcmp+0x1c>
 25a:	3a 02                	cmp    (%edx),%al
 25c:	74 ef                	je     24d <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 25e:	0f b6 c0             	movzbl %al,%eax
 261:	0f b6 12             	movzbl (%edx),%edx
 264:	29 d0                	sub    %edx,%eax
}
 266:	5d                   	pop    %ebp
 267:	c3                   	ret    

00000268 <strlen>:

uint
strlen(const char *s)
{
 268:	55                   	push   %ebp
 269:	89 e5                	mov    %esp,%ebp
 26b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 26e:	b8 00 00 00 00       	mov    $0x0,%eax
 273:	eb 03                	jmp    278 <strlen+0x10>
 275:	83 c0 01             	add    $0x1,%eax
 278:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 27c:	75 f7                	jne    275 <strlen+0xd>
    ;
  return n;
}
 27e:	5d                   	pop    %ebp
 27f:	c3                   	ret    

00000280 <memset>:

void*
memset(void *dst, int c, uint n)
{
 280:	55                   	push   %ebp
 281:	89 e5                	mov    %esp,%ebp
 283:	57                   	push   %edi
 284:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 287:	89 d7                	mov    %edx,%edi
 289:	8b 4d 10             	mov    0x10(%ebp),%ecx
 28c:	8b 45 0c             	mov    0xc(%ebp),%eax
 28f:	fc                   	cld    
 290:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 292:	89 d0                	mov    %edx,%eax
 294:	8b 7d fc             	mov    -0x4(%ebp),%edi
 297:	c9                   	leave  
 298:	c3                   	ret    

00000299 <strchr>:

char*
strchr(const char *s, char c)
{
 299:	55                   	push   %ebp
 29a:	89 e5                	mov    %esp,%ebp
 29c:	8b 45 08             	mov    0x8(%ebp),%eax
 29f:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 2a3:	eb 03                	jmp    2a8 <strchr+0xf>
 2a5:	83 c0 01             	add    $0x1,%eax
 2a8:	0f b6 10             	movzbl (%eax),%edx
 2ab:	84 d2                	test   %dl,%dl
 2ad:	74 06                	je     2b5 <strchr+0x1c>
    if(*s == c)
 2af:	38 ca                	cmp    %cl,%dl
 2b1:	75 f2                	jne    2a5 <strchr+0xc>
 2b3:	eb 05                	jmp    2ba <strchr+0x21>
      return (char*)s;
  return 0;
 2b5:	b8 00 00 00 00       	mov    $0x0,%eax
}
 2ba:	5d                   	pop    %ebp
 2bb:	c3                   	ret    

000002bc <gets>:

char*
gets(char *buf, int max)
{
 2bc:	55                   	push   %ebp
 2bd:	89 e5                	mov    %esp,%ebp
 2bf:	57                   	push   %edi
 2c0:	56                   	push   %esi
 2c1:	53                   	push   %ebx
 2c2:	83 ec 1c             	sub    $0x1c,%esp
 2c5:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2c8:	bb 00 00 00 00       	mov    $0x0,%ebx
 2cd:	89 de                	mov    %ebx,%esi
 2cf:	83 c3 01             	add    $0x1,%ebx
 2d2:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2d5:	7d 2e                	jge    305 <gets+0x49>
    cc = read(0, &c, 1);
 2d7:	83 ec 04             	sub    $0x4,%esp
 2da:	6a 01                	push   $0x1
 2dc:	8d 45 e7             	lea    -0x19(%ebp),%eax
 2df:	50                   	push   %eax
 2e0:	6a 00                	push   $0x0
 2e2:	e8 ec 00 00 00       	call   3d3 <read>
    if(cc < 1)
 2e7:	83 c4 10             	add    $0x10,%esp
 2ea:	85 c0                	test   %eax,%eax
 2ec:	7e 17                	jle    305 <gets+0x49>
      break;
    buf[i++] = c;
 2ee:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2f2:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 2f5:	3c 0a                	cmp    $0xa,%al
 2f7:	0f 94 c2             	sete   %dl
 2fa:	3c 0d                	cmp    $0xd,%al
 2fc:	0f 94 c0             	sete   %al
 2ff:	08 c2                	or     %al,%dl
 301:	74 ca                	je     2cd <gets+0x11>
    buf[i++] = c;
 303:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 305:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 309:	89 f8                	mov    %edi,%eax
 30b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 30e:	5b                   	pop    %ebx
 30f:	5e                   	pop    %esi
 310:	5f                   	pop    %edi
 311:	5d                   	pop    %ebp
 312:	c3                   	ret    

00000313 <stat>:

int
stat(const char *n, struct stat *st)
{
 313:	55                   	push   %ebp
 314:	89 e5                	mov    %esp,%ebp
 316:	56                   	push   %esi
 317:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 318:	83 ec 08             	sub    $0x8,%esp
 31b:	6a 00                	push   $0x0
 31d:	ff 75 08             	push   0x8(%ebp)
 320:	e8 d6 00 00 00       	call   3fb <open>
  if(fd < 0)
 325:	83 c4 10             	add    $0x10,%esp
 328:	85 c0                	test   %eax,%eax
 32a:	78 24                	js     350 <stat+0x3d>
 32c:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 32e:	83 ec 08             	sub    $0x8,%esp
 331:	ff 75 0c             	push   0xc(%ebp)
 334:	50                   	push   %eax
 335:	e8 d9 00 00 00       	call   413 <fstat>
 33a:	89 c6                	mov    %eax,%esi
  close(fd);
 33c:	89 1c 24             	mov    %ebx,(%esp)
 33f:	e8 9f 00 00 00       	call   3e3 <close>
  return r;
 344:	83 c4 10             	add    $0x10,%esp
}
 347:	89 f0                	mov    %esi,%eax
 349:	8d 65 f8             	lea    -0x8(%ebp),%esp
 34c:	5b                   	pop    %ebx
 34d:	5e                   	pop    %esi
 34e:	5d                   	pop    %ebp
 34f:	c3                   	ret    
    return -1;
 350:	be ff ff ff ff       	mov    $0xffffffff,%esi
 355:	eb f0                	jmp    347 <stat+0x34>

00000357 <atoi>:

int
atoi(const char *s)
{
 357:	55                   	push   %ebp
 358:	89 e5                	mov    %esp,%ebp
 35a:	53                   	push   %ebx
 35b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 35e:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 363:	eb 10                	jmp    375 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 365:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 368:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 36b:	83 c1 01             	add    $0x1,%ecx
 36e:	0f be c0             	movsbl %al,%eax
 371:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 375:	0f b6 01             	movzbl (%ecx),%eax
 378:	8d 58 d0             	lea    -0x30(%eax),%ebx
 37b:	80 fb 09             	cmp    $0x9,%bl
 37e:	76 e5                	jbe    365 <atoi+0xe>
  return n;
}
 380:	89 d0                	mov    %edx,%eax
 382:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 385:	c9                   	leave  
 386:	c3                   	ret    

00000387 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 387:	55                   	push   %ebp
 388:	89 e5                	mov    %esp,%ebp
 38a:	56                   	push   %esi
 38b:	53                   	push   %ebx
 38c:	8b 75 08             	mov    0x8(%ebp),%esi
 38f:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 392:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 395:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 397:	eb 0d                	jmp    3a6 <memmove+0x1f>
    *dst++ = *src++;
 399:	0f b6 01             	movzbl (%ecx),%eax
 39c:	88 02                	mov    %al,(%edx)
 39e:	8d 49 01             	lea    0x1(%ecx),%ecx
 3a1:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 3a4:	89 d8                	mov    %ebx,%eax
 3a6:	8d 58 ff             	lea    -0x1(%eax),%ebx
 3a9:	85 c0                	test   %eax,%eax
 3ab:	7f ec                	jg     399 <memmove+0x12>
  return vdst;
}
 3ad:	89 f0                	mov    %esi,%eax
 3af:	5b                   	pop    %ebx
 3b0:	5e                   	pop    %esi
 3b1:	5d                   	pop    %ebp
 3b2:	c3                   	ret    

000003b3 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3b3:	b8 01 00 00 00       	mov    $0x1,%eax
 3b8:	cd 40                	int    $0x40
 3ba:	c3                   	ret    

000003bb <exit>:
SYSCALL(exit)
 3bb:	b8 02 00 00 00       	mov    $0x2,%eax
 3c0:	cd 40                	int    $0x40
 3c2:	c3                   	ret    

000003c3 <wait>:
SYSCALL(wait)
 3c3:	b8 03 00 00 00       	mov    $0x3,%eax
 3c8:	cd 40                	int    $0x40
 3ca:	c3                   	ret    

000003cb <pipe>:
SYSCALL(pipe)
 3cb:	b8 04 00 00 00       	mov    $0x4,%eax
 3d0:	cd 40                	int    $0x40
 3d2:	c3                   	ret    

000003d3 <read>:
SYSCALL(read)
 3d3:	b8 05 00 00 00       	mov    $0x5,%eax
 3d8:	cd 40                	int    $0x40
 3da:	c3                   	ret    

000003db <write>:
SYSCALL(write)
 3db:	b8 10 00 00 00       	mov    $0x10,%eax
 3e0:	cd 40                	int    $0x40
 3e2:	c3                   	ret    

000003e3 <close>:
SYSCALL(close)
 3e3:	b8 15 00 00 00       	mov    $0x15,%eax
 3e8:	cd 40                	int    $0x40
 3ea:	c3                   	ret    

000003eb <kill>:
SYSCALL(kill)
 3eb:	b8 06 00 00 00       	mov    $0x6,%eax
 3f0:	cd 40                	int    $0x40
 3f2:	c3                   	ret    

000003f3 <exec>:
SYSCALL(exec)
 3f3:	b8 07 00 00 00       	mov    $0x7,%eax
 3f8:	cd 40                	int    $0x40
 3fa:	c3                   	ret    

000003fb <open>:
SYSCALL(open)
 3fb:	b8 0f 00 00 00       	mov    $0xf,%eax
 400:	cd 40                	int    $0x40
 402:	c3                   	ret    

00000403 <mknod>:
SYSCALL(mknod)
 403:	b8 11 00 00 00       	mov    $0x11,%eax
 408:	cd 40                	int    $0x40
 40a:	c3                   	ret    

0000040b <unlink>:
SYSCALL(unlink)
 40b:	b8 12 00 00 00       	mov    $0x12,%eax
 410:	cd 40                	int    $0x40
 412:	c3                   	ret    

00000413 <fstat>:
SYSCALL(fstat)
 413:	b8 08 00 00 00       	mov    $0x8,%eax
 418:	cd 40                	int    $0x40
 41a:	c3                   	ret    

0000041b <link>:
SYSCALL(link)
 41b:	b8 13 00 00 00       	mov    $0x13,%eax
 420:	cd 40                	int    $0x40
 422:	c3                   	ret    

00000423 <mkdir>:
SYSCALL(mkdir)
 423:	b8 14 00 00 00       	mov    $0x14,%eax
 428:	cd 40                	int    $0x40
 42a:	c3                   	ret    

0000042b <chdir>:
SYSCALL(chdir)
 42b:	b8 09 00 00 00       	mov    $0x9,%eax
 430:	cd 40                	int    $0x40
 432:	c3                   	ret    

00000433 <dup>:
SYSCALL(dup)
 433:	b8 0a 00 00 00       	mov    $0xa,%eax
 438:	cd 40                	int    $0x40
 43a:	c3                   	ret    

0000043b <getpid>:
SYSCALL(getpid)
 43b:	b8 0b 00 00 00       	mov    $0xb,%eax
 440:	cd 40                	int    $0x40
 442:	c3                   	ret    

00000443 <sbrk>:
SYSCALL(sbrk)
 443:	b8 0c 00 00 00       	mov    $0xc,%eax
 448:	cd 40                	int    $0x40
 44a:	c3                   	ret    

0000044b <sleep>:
SYSCALL(sleep)
 44b:	b8 0d 00 00 00       	mov    $0xd,%eax
 450:	cd 40                	int    $0x40
 452:	c3                   	ret    

00000453 <uptime>:
SYSCALL(uptime)
 453:	b8 0e 00 00 00       	mov    $0xe,%eax
 458:	cd 40                	int    $0x40
 45a:	c3                   	ret    

0000045b <clone>:
SYSCALL(clone)
 45b:	b8 16 00 00 00       	mov    $0x16,%eax
 460:	cd 40                	int    $0x40
 462:	c3                   	ret    

00000463 <join>:
 463:	b8 17 00 00 00       	mov    $0x17,%eax
 468:	cd 40                	int    $0x40
 46a:	c3                   	ret    

0000046b <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 46b:	55                   	push   %ebp
 46c:	89 e5                	mov    %esp,%ebp
 46e:	83 ec 1c             	sub    $0x1c,%esp
 471:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 474:	6a 01                	push   $0x1
 476:	8d 55 f4             	lea    -0xc(%ebp),%edx
 479:	52                   	push   %edx
 47a:	50                   	push   %eax
 47b:	e8 5b ff ff ff       	call   3db <write>
}
 480:	83 c4 10             	add    $0x10,%esp
 483:	c9                   	leave  
 484:	c3                   	ret    

00000485 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 485:	55                   	push   %ebp
 486:	89 e5                	mov    %esp,%ebp
 488:	57                   	push   %edi
 489:	56                   	push   %esi
 48a:	53                   	push   %ebx
 48b:	83 ec 2c             	sub    $0x2c,%esp
 48e:	89 45 d0             	mov    %eax,-0x30(%ebp)
 491:	89 d0                	mov    %edx,%eax
 493:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 495:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 499:	0f 95 c1             	setne  %cl
 49c:	c1 ea 1f             	shr    $0x1f,%edx
 49f:	84 d1                	test   %dl,%cl
 4a1:	74 44                	je     4e7 <printint+0x62>
    neg = 1;
    x = -xx;
 4a3:	f7 d8                	neg    %eax
 4a5:	89 c1                	mov    %eax,%ecx
    neg = 1;
 4a7:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 4ae:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 4b3:	89 c8                	mov    %ecx,%eax
 4b5:	ba 00 00 00 00       	mov    $0x0,%edx
 4ba:	f7 f6                	div    %esi
 4bc:	89 df                	mov    %ebx,%edi
 4be:	83 c3 01             	add    $0x1,%ebx
 4c1:	0f b6 92 44 08 00 00 	movzbl 0x844(%edx),%edx
 4c8:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 4cc:	89 ca                	mov    %ecx,%edx
 4ce:	89 c1                	mov    %eax,%ecx
 4d0:	39 d6                	cmp    %edx,%esi
 4d2:	76 df                	jbe    4b3 <printint+0x2e>
  if(neg)
 4d4:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 4d8:	74 31                	je     50b <printint+0x86>
    buf[i++] = '-';
 4da:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 4df:	8d 5f 02             	lea    0x2(%edi),%ebx
 4e2:	8b 75 d0             	mov    -0x30(%ebp),%esi
 4e5:	eb 17                	jmp    4fe <printint+0x79>
    x = xx;
 4e7:	89 c1                	mov    %eax,%ecx
  neg = 0;
 4e9:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 4f0:	eb bc                	jmp    4ae <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 4f2:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 4f7:	89 f0                	mov    %esi,%eax
 4f9:	e8 6d ff ff ff       	call   46b <putc>
  while(--i >= 0)
 4fe:	83 eb 01             	sub    $0x1,%ebx
 501:	79 ef                	jns    4f2 <printint+0x6d>
}
 503:	83 c4 2c             	add    $0x2c,%esp
 506:	5b                   	pop    %ebx
 507:	5e                   	pop    %esi
 508:	5f                   	pop    %edi
 509:	5d                   	pop    %ebp
 50a:	c3                   	ret    
 50b:	8b 75 d0             	mov    -0x30(%ebp),%esi
 50e:	eb ee                	jmp    4fe <printint+0x79>

00000510 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 510:	55                   	push   %ebp
 511:	89 e5                	mov    %esp,%ebp
 513:	57                   	push   %edi
 514:	56                   	push   %esi
 515:	53                   	push   %ebx
 516:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 519:	8d 45 10             	lea    0x10(%ebp),%eax
 51c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 51f:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 524:	bb 00 00 00 00       	mov    $0x0,%ebx
 529:	eb 14                	jmp    53f <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 52b:	89 fa                	mov    %edi,%edx
 52d:	8b 45 08             	mov    0x8(%ebp),%eax
 530:	e8 36 ff ff ff       	call   46b <putc>
 535:	eb 05                	jmp    53c <printf+0x2c>
      }
    } else if(state == '%'){
 537:	83 fe 25             	cmp    $0x25,%esi
 53a:	74 25                	je     561 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 53c:	83 c3 01             	add    $0x1,%ebx
 53f:	8b 45 0c             	mov    0xc(%ebp),%eax
 542:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 546:	84 c0                	test   %al,%al
 548:	0f 84 20 01 00 00    	je     66e <printf+0x15e>
    c = fmt[i] & 0xff;
 54e:	0f be f8             	movsbl %al,%edi
 551:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 554:	85 f6                	test   %esi,%esi
 556:	75 df                	jne    537 <printf+0x27>
      if(c == '%'){
 558:	83 f8 25             	cmp    $0x25,%eax
 55b:	75 ce                	jne    52b <printf+0x1b>
        state = '%';
 55d:	89 c6                	mov    %eax,%esi
 55f:	eb db                	jmp    53c <printf+0x2c>
      if(c == 'd'){
 561:	83 f8 25             	cmp    $0x25,%eax
 564:	0f 84 cf 00 00 00    	je     639 <printf+0x129>
 56a:	0f 8c dd 00 00 00    	jl     64d <printf+0x13d>
 570:	83 f8 78             	cmp    $0x78,%eax
 573:	0f 8f d4 00 00 00    	jg     64d <printf+0x13d>
 579:	83 f8 63             	cmp    $0x63,%eax
 57c:	0f 8c cb 00 00 00    	jl     64d <printf+0x13d>
 582:	83 e8 63             	sub    $0x63,%eax
 585:	83 f8 15             	cmp    $0x15,%eax
 588:	0f 87 bf 00 00 00    	ja     64d <printf+0x13d>
 58e:	ff 24 85 ec 07 00 00 	jmp    *0x7ec(,%eax,4)
        printint(fd, *ap, 10, 1);
 595:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 598:	8b 17                	mov    (%edi),%edx
 59a:	83 ec 0c             	sub    $0xc,%esp
 59d:	6a 01                	push   $0x1
 59f:	b9 0a 00 00 00       	mov    $0xa,%ecx
 5a4:	8b 45 08             	mov    0x8(%ebp),%eax
 5a7:	e8 d9 fe ff ff       	call   485 <printint>
        ap++;
 5ac:	83 c7 04             	add    $0x4,%edi
 5af:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 5b2:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 5b5:	be 00 00 00 00       	mov    $0x0,%esi
 5ba:	eb 80                	jmp    53c <printf+0x2c>
        printint(fd, *ap, 16, 0);
 5bc:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5bf:	8b 17                	mov    (%edi),%edx
 5c1:	83 ec 0c             	sub    $0xc,%esp
 5c4:	6a 00                	push   $0x0
 5c6:	b9 10 00 00 00       	mov    $0x10,%ecx
 5cb:	8b 45 08             	mov    0x8(%ebp),%eax
 5ce:	e8 b2 fe ff ff       	call   485 <printint>
        ap++;
 5d3:	83 c7 04             	add    $0x4,%edi
 5d6:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 5d9:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5dc:	be 00 00 00 00       	mov    $0x0,%esi
 5e1:	e9 56 ff ff ff       	jmp    53c <printf+0x2c>
        s = (char*)*ap;
 5e6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5e9:	8b 30                	mov    (%eax),%esi
        ap++;
 5eb:	83 c0 04             	add    $0x4,%eax
 5ee:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 5f1:	85 f6                	test   %esi,%esi
 5f3:	75 15                	jne    60a <printf+0xfa>
          s = "(null)";
 5f5:	be e3 07 00 00       	mov    $0x7e3,%esi
 5fa:	eb 0e                	jmp    60a <printf+0xfa>
          putc(fd, *s);
 5fc:	0f be d2             	movsbl %dl,%edx
 5ff:	8b 45 08             	mov    0x8(%ebp),%eax
 602:	e8 64 fe ff ff       	call   46b <putc>
          s++;
 607:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 60a:	0f b6 16             	movzbl (%esi),%edx
 60d:	84 d2                	test   %dl,%dl
 60f:	75 eb                	jne    5fc <printf+0xec>
      state = 0;
 611:	be 00 00 00 00       	mov    $0x0,%esi
 616:	e9 21 ff ff ff       	jmp    53c <printf+0x2c>
        putc(fd, *ap);
 61b:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 61e:	0f be 17             	movsbl (%edi),%edx
 621:	8b 45 08             	mov    0x8(%ebp),%eax
 624:	e8 42 fe ff ff       	call   46b <putc>
        ap++;
 629:	83 c7 04             	add    $0x4,%edi
 62c:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 62f:	be 00 00 00 00       	mov    $0x0,%esi
 634:	e9 03 ff ff ff       	jmp    53c <printf+0x2c>
        putc(fd, c);
 639:	89 fa                	mov    %edi,%edx
 63b:	8b 45 08             	mov    0x8(%ebp),%eax
 63e:	e8 28 fe ff ff       	call   46b <putc>
      state = 0;
 643:	be 00 00 00 00       	mov    $0x0,%esi
 648:	e9 ef fe ff ff       	jmp    53c <printf+0x2c>
        putc(fd, '%');
 64d:	ba 25 00 00 00       	mov    $0x25,%edx
 652:	8b 45 08             	mov    0x8(%ebp),%eax
 655:	e8 11 fe ff ff       	call   46b <putc>
        putc(fd, c);
 65a:	89 fa                	mov    %edi,%edx
 65c:	8b 45 08             	mov    0x8(%ebp),%eax
 65f:	e8 07 fe ff ff       	call   46b <putc>
      state = 0;
 664:	be 00 00 00 00       	mov    $0x0,%esi
 669:	e9 ce fe ff ff       	jmp    53c <printf+0x2c>
    }
  }
}
 66e:	8d 65 f4             	lea    -0xc(%ebp),%esp
 671:	5b                   	pop    %ebx
 672:	5e                   	pop    %esi
 673:	5f                   	pop    %edi
 674:	5d                   	pop    %ebp
 675:	c3                   	ret    

00000676 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 676:	55                   	push   %ebp
 677:	89 e5                	mov    %esp,%ebp
 679:	57                   	push   %edi
 67a:	56                   	push   %esi
 67b:	53                   	push   %ebx
 67c:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 67f:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 682:	a1 c0 0c 00 00       	mov    0xcc0,%eax
 687:	eb 02                	jmp    68b <free+0x15>
 689:	89 d0                	mov    %edx,%eax
 68b:	39 c8                	cmp    %ecx,%eax
 68d:	73 04                	jae    693 <free+0x1d>
 68f:	39 08                	cmp    %ecx,(%eax)
 691:	77 12                	ja     6a5 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 693:	8b 10                	mov    (%eax),%edx
 695:	39 c2                	cmp    %eax,%edx
 697:	77 f0                	ja     689 <free+0x13>
 699:	39 c8                	cmp    %ecx,%eax
 69b:	72 08                	jb     6a5 <free+0x2f>
 69d:	39 ca                	cmp    %ecx,%edx
 69f:	77 04                	ja     6a5 <free+0x2f>
 6a1:	89 d0                	mov    %edx,%eax
 6a3:	eb e6                	jmp    68b <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 6a5:	8b 73 fc             	mov    -0x4(%ebx),%esi
 6a8:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 6ab:	8b 10                	mov    (%eax),%edx
 6ad:	39 d7                	cmp    %edx,%edi
 6af:	74 19                	je     6ca <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 6b1:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 6b4:	8b 50 04             	mov    0x4(%eax),%edx
 6b7:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 6ba:	39 ce                	cmp    %ecx,%esi
 6bc:	74 1b                	je     6d9 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 6be:	89 08                	mov    %ecx,(%eax)
  freep = p;
 6c0:	a3 c0 0c 00 00       	mov    %eax,0xcc0
}
 6c5:	5b                   	pop    %ebx
 6c6:	5e                   	pop    %esi
 6c7:	5f                   	pop    %edi
 6c8:	5d                   	pop    %ebp
 6c9:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 6ca:	03 72 04             	add    0x4(%edx),%esi
 6cd:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 6d0:	8b 10                	mov    (%eax),%edx
 6d2:	8b 12                	mov    (%edx),%edx
 6d4:	89 53 f8             	mov    %edx,-0x8(%ebx)
 6d7:	eb db                	jmp    6b4 <free+0x3e>
    p->s.size += bp->s.size;
 6d9:	03 53 fc             	add    -0x4(%ebx),%edx
 6dc:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6df:	8b 53 f8             	mov    -0x8(%ebx),%edx
 6e2:	89 10                	mov    %edx,(%eax)
 6e4:	eb da                	jmp    6c0 <free+0x4a>

000006e6 <morecore>:

static Header*
morecore(uint nu)
{
 6e6:	55                   	push   %ebp
 6e7:	89 e5                	mov    %esp,%ebp
 6e9:	53                   	push   %ebx
 6ea:	83 ec 04             	sub    $0x4,%esp
 6ed:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 6ef:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 6f4:	77 05                	ja     6fb <morecore+0x15>
    nu = 4096;
 6f6:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 6fb:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 702:	83 ec 0c             	sub    $0xc,%esp
 705:	50                   	push   %eax
 706:	e8 38 fd ff ff       	call   443 <sbrk>
  if(p == (char*)-1)
 70b:	83 c4 10             	add    $0x10,%esp
 70e:	83 f8 ff             	cmp    $0xffffffff,%eax
 711:	74 1c                	je     72f <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 713:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 716:	83 c0 08             	add    $0x8,%eax
 719:	83 ec 0c             	sub    $0xc,%esp
 71c:	50                   	push   %eax
 71d:	e8 54 ff ff ff       	call   676 <free>
  return freep;
 722:	a1 c0 0c 00 00       	mov    0xcc0,%eax
 727:	83 c4 10             	add    $0x10,%esp
}
 72a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 72d:	c9                   	leave  
 72e:	c3                   	ret    
    return 0;
 72f:	b8 00 00 00 00       	mov    $0x0,%eax
 734:	eb f4                	jmp    72a <morecore+0x44>

00000736 <malloc>:

void*
malloc(uint nbytes)
{
 736:	55                   	push   %ebp
 737:	89 e5                	mov    %esp,%ebp
 739:	53                   	push   %ebx
 73a:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 73d:	8b 45 08             	mov    0x8(%ebp),%eax
 740:	8d 58 07             	lea    0x7(%eax),%ebx
 743:	c1 eb 03             	shr    $0x3,%ebx
 746:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 749:	8b 0d c0 0c 00 00    	mov    0xcc0,%ecx
 74f:	85 c9                	test   %ecx,%ecx
 751:	74 04                	je     757 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 753:	8b 01                	mov    (%ecx),%eax
 755:	eb 4a                	jmp    7a1 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 757:	c7 05 c0 0c 00 00 c4 	movl   $0xcc4,0xcc0
 75e:	0c 00 00 
 761:	c7 05 c4 0c 00 00 c4 	movl   $0xcc4,0xcc4
 768:	0c 00 00 
    base.s.size = 0;
 76b:	c7 05 c8 0c 00 00 00 	movl   $0x0,0xcc8
 772:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 775:	b9 c4 0c 00 00       	mov    $0xcc4,%ecx
 77a:	eb d7                	jmp    753 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 77c:	74 19                	je     797 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 77e:	29 da                	sub    %ebx,%edx
 780:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 783:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 786:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 789:	89 0d c0 0c 00 00    	mov    %ecx,0xcc0
      return (void*)(p + 1);
 78f:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 792:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 795:	c9                   	leave  
 796:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 797:	8b 10                	mov    (%eax),%edx
 799:	89 11                	mov    %edx,(%ecx)
 79b:	eb ec                	jmp    789 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 79d:	89 c1                	mov    %eax,%ecx
 79f:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 7a1:	8b 50 04             	mov    0x4(%eax),%edx
 7a4:	39 da                	cmp    %ebx,%edx
 7a6:	73 d4                	jae    77c <malloc+0x46>
    if(p == freep)
 7a8:	39 05 c0 0c 00 00    	cmp    %eax,0xcc0
 7ae:	75 ed                	jne    79d <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 7b0:	89 d8                	mov    %ebx,%eax
 7b2:	e8 2f ff ff ff       	call   6e6 <morecore>
 7b7:	85 c0                	test   %eax,%eax
 7b9:	75 e2                	jne    79d <malloc+0x67>
 7bb:	eb d5                	jmp    792 <malloc+0x5c>
