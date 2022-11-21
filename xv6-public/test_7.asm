
_test_7:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
   exit(); \
}

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
   e:	83 ec 14             	sub    $0x14,%esp
   ppid = getpid();
  11:	e8 d6 03 00 00       	call   3ec <getpid>
  16:	a3 a4 0b 00 00       	mov    %eax,0xba4

   int fork_pid = fork();
  1b:	e8 44 03 00 00       	call   364 <fork>
   if(fork_pid == 0) {
  20:	85 c0                	test   %eax,%eax
  22:	74 63                	je     87 <main+0x87>
     exit();
   }
   assert(fork_pid > 0);
  24:	7e 66                	jle    8c <main+0x8c>

   void *join_stack;
   int join_pid = join(&join_stack);
  26:	83 ec 0c             	sub    $0xc,%esp
  29:	8d 45 f4             	lea    -0xc(%ebp),%eax
  2c:	50                   	push   %eax
  2d:	e8 e2 03 00 00       	call   414 <join>
   assert(join_pid == -1);
  32:	83 c4 10             	add    $0x10,%esp
  35:	83 f8 ff             	cmp    $0xffffffff,%eax
  38:	0f 84 97 00 00 00    	je     d5 <main+0xd5>
  3e:	6a 22                	push   $0x22
  40:	68 70 07 00 00       	push   $0x770
  45:	68 79 07 00 00       	push   $0x779
  4a:	6a 01                	push   $0x1
  4c:	e8 70 04 00 00       	call   4c1 <printf>
  51:	83 c4 0c             	add    $0xc,%esp
  54:	68 af 07 00 00       	push   $0x7af
  59:	68 8e 07 00 00       	push   $0x78e
  5e:	6a 01                	push   $0x1
  60:	e8 5c 04 00 00       	call   4c1 <printf>
  65:	83 c4 08             	add    $0x8,%esp
  68:	68 a2 07 00 00       	push   $0x7a2
  6d:	6a 01                	push   $0x1
  6f:	e8 4d 04 00 00       	call   4c1 <printf>
  74:	83 c4 04             	add    $0x4,%esp
  77:	ff 35 a4 0b 00 00    	push   0xba4
  7d:	e8 1a 03 00 00       	call   39c <kill>
  82:	e8 e5 02 00 00       	call   36c <exit>
     exit();
  87:	e8 e0 02 00 00       	call   36c <exit>
   assert(fork_pid > 0);
  8c:	6a 1e                	push   $0x1e
  8e:	68 70 07 00 00       	push   $0x770
  93:	68 79 07 00 00       	push   $0x779
  98:	6a 01                	push   $0x1
  9a:	e8 22 04 00 00       	call   4c1 <printf>
  9f:	83 c4 0c             	add    $0xc,%esp
  a2:	68 81 07 00 00       	push   $0x781
  a7:	68 8e 07 00 00       	push   $0x78e
  ac:	6a 01                	push   $0x1
  ae:	e8 0e 04 00 00       	call   4c1 <printf>
  b3:	83 c4 08             	add    $0x8,%esp
  b6:	68 a2 07 00 00       	push   $0x7a2
  bb:	6a 01                	push   $0x1
  bd:	e8 ff 03 00 00       	call   4c1 <printf>
  c2:	83 c4 04             	add    $0x4,%esp
  c5:	ff 35 a4 0b 00 00    	push   0xba4
  cb:	e8 cc 02 00 00       	call   39c <kill>
  d0:	e8 97 02 00 00       	call   36c <exit>

   assert(wait() > 0);
  d5:	e8 9a 02 00 00       	call   374 <wait>
  da:	85 c0                	test   %eax,%eax
  dc:	7e 14                	jle    f2 <main+0xf2>
   printf(1, "TEST PASSED\n");
  de:	83 ec 08             	sub    $0x8,%esp
  e1:	68 c9 07 00 00       	push   $0x7c9
  e6:	6a 01                	push   $0x1
  e8:	e8 d4 03 00 00       	call   4c1 <printf>
   exit();
  ed:	e8 7a 02 00 00       	call   36c <exit>
   assert(wait() > 0);
  f2:	6a 24                	push   $0x24
  f4:	68 70 07 00 00       	push   $0x770
  f9:	68 79 07 00 00       	push   $0x779
  fe:	6a 01                	push   $0x1
 100:	e8 bc 03 00 00       	call   4c1 <printf>
 105:	83 c4 0c             	add    $0xc,%esp
 108:	68 be 07 00 00       	push   $0x7be
 10d:	68 8e 07 00 00       	push   $0x78e
 112:	6a 01                	push   $0x1
 114:	e8 a8 03 00 00       	call   4c1 <printf>
 119:	83 c4 08             	add    $0x8,%esp
 11c:	68 a2 07 00 00       	push   $0x7a2
 121:	6a 01                	push   $0x1
 123:	e8 99 03 00 00       	call   4c1 <printf>
 128:	83 c4 04             	add    $0x4,%esp
 12b:	ff 35 a4 0b 00 00    	push   0xba4
 131:	e8 66 02 00 00       	call   39c <kill>
 136:	e8 31 02 00 00       	call   36c <exit>

0000013b <test_and_set>:
#include "fcntl.h"
#include "user.h"
#include "x86.h"
#include "mmu.h"

int test_and_set(int *old_ptr, int new_ptr) {
 13b:	55                   	push   %ebp
 13c:	89 e5                	mov    %esp,%ebp
 13e:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *old_ptr;
 141:	8b 10                	mov    (%eax),%edx
  *old_ptr = new_ptr;
 143:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 146:	89 08                	mov    %ecx,(%eax)
  return old;
}
 148:	89 d0                	mov    %edx,%eax
 14a:	5d                   	pop    %ebp
 14b:	c3                   	ret    

0000014c <thread_create>:

// a wrapper func for clone
int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 14c:	55                   	push   %ebp
 14d:	89 e5                	mov    %esp,%ebp
 14f:	83 ec 14             	sub    $0x14,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE*2);
 152:	68 00 20 00 00       	push   $0x2000
 157:	e8 8b 05 00 00       	call   6e7 <malloc>
  if(n_stack == 0){
 15c:	83 c4 10             	add    $0x10,%esp
 15f:	85 c0                	test   %eax,%eax
 161:	74 14                	je     177 <thread_create+0x2b>
    return -1;
  }
  int new_pid = clone(start_routine, arg1, arg2, n_stack); // TODO: is this the right way to call it?
 163:	50                   	push   %eax
 164:	ff 75 10             	push   0x10(%ebp)
 167:	ff 75 0c             	push   0xc(%ebp)
 16a:	ff 75 08             	push   0x8(%ebp)
 16d:	e8 9a 02 00 00       	call   40c <clone>


  // I can't remember if there was something else to do here but I'm sure I'll find out


  return new_pid;
 172:	83 c4 10             	add    $0x10,%esp
}
 175:	c9                   	leave  
 176:	c3                   	ret    
    return -1;
 177:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 17c:	eb f7                	jmp    175 <thread_create+0x29>

0000017e <thread_join>:

int thread_join() {
 17e:	55                   	push   %ebp
 17f:	89 e5                	mov    %esp,%ebp
 181:	83 ec 24             	sub    $0x24,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 184:	8d 45 f4             	lea    -0xc(%ebp),%eax
 187:	50                   	push   %eax
 188:	e8 87 02 00 00       	call   414 <join>
  
  return pid;
}
 18d:	c9                   	leave  
 18e:	c3                   	ret    

0000018f <lock_acquire>:

void lock_acquire(lock_t *lock){
 18f:	55                   	push   %ebp
 190:	89 e5                	mov    %esp,%ebp
 192:	53                   	push   %ebx
 193:	83 ec 04             	sub    $0x4,%esp
 196:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 199:	83 ec 08             	sub    $0x8,%esp
 19c:	6a 01                	push   $0x1
 19e:	53                   	push   %ebx
 19f:	e8 97 ff ff ff       	call   13b <test_and_set>
 1a4:	83 c4 10             	add    $0x10,%esp
 1a7:	83 f8 01             	cmp    $0x1,%eax
 1aa:	74 ed                	je     199 <lock_acquire+0xa>
    ;
}
 1ac:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1af:	c9                   	leave  
 1b0:	c3                   	ret    

000001b1 <lock_release>:

void lock_release(lock_t *lock) {
 1b1:	55                   	push   %ebp
 1b2:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 1b4:	8b 45 08             	mov    0x8(%ebp),%eax
 1b7:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 1bd:	5d                   	pop    %ebp
 1be:	c3                   	ret    

000001bf <lock_init>:

void lock_init(lock_t *lock) {
 1bf:	55                   	push   %ebp
 1c0:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 1c2:	8b 45 08             	mov    0x8(%ebp),%eax
 1c5:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 1cb:	5d                   	pop    %ebp
 1cc:	c3                   	ret    

000001cd <strcpy>:

char*
strcpy(char *s, const char *t)
{
 1cd:	55                   	push   %ebp
 1ce:	89 e5                	mov    %esp,%ebp
 1d0:	56                   	push   %esi
 1d1:	53                   	push   %ebx
 1d2:	8b 75 08             	mov    0x8(%ebp),%esi
 1d5:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 1d8:	89 f0                	mov    %esi,%eax
 1da:	89 d1                	mov    %edx,%ecx
 1dc:	83 c2 01             	add    $0x1,%edx
 1df:	89 c3                	mov    %eax,%ebx
 1e1:	83 c0 01             	add    $0x1,%eax
 1e4:	0f b6 09             	movzbl (%ecx),%ecx
 1e7:	88 0b                	mov    %cl,(%ebx)
 1e9:	84 c9                	test   %cl,%cl
 1eb:	75 ed                	jne    1da <strcpy+0xd>
    ;
  return os;
}
 1ed:	89 f0                	mov    %esi,%eax
 1ef:	5b                   	pop    %ebx
 1f0:	5e                   	pop    %esi
 1f1:	5d                   	pop    %ebp
 1f2:	c3                   	ret    

000001f3 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1f3:	55                   	push   %ebp
 1f4:	89 e5                	mov    %esp,%ebp
 1f6:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1f9:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 1fc:	eb 06                	jmp    204 <strcmp+0x11>
    p++, q++;
 1fe:	83 c1 01             	add    $0x1,%ecx
 201:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 204:	0f b6 01             	movzbl (%ecx),%eax
 207:	84 c0                	test   %al,%al
 209:	74 04                	je     20f <strcmp+0x1c>
 20b:	3a 02                	cmp    (%edx),%al
 20d:	74 ef                	je     1fe <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 20f:	0f b6 c0             	movzbl %al,%eax
 212:	0f b6 12             	movzbl (%edx),%edx
 215:	29 d0                	sub    %edx,%eax
}
 217:	5d                   	pop    %ebp
 218:	c3                   	ret    

00000219 <strlen>:

uint
strlen(const char *s)
{
 219:	55                   	push   %ebp
 21a:	89 e5                	mov    %esp,%ebp
 21c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 21f:	b8 00 00 00 00       	mov    $0x0,%eax
 224:	eb 03                	jmp    229 <strlen+0x10>
 226:	83 c0 01             	add    $0x1,%eax
 229:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 22d:	75 f7                	jne    226 <strlen+0xd>
    ;
  return n;
}
 22f:	5d                   	pop    %ebp
 230:	c3                   	ret    

00000231 <memset>:

void*
memset(void *dst, int c, uint n)
{
 231:	55                   	push   %ebp
 232:	89 e5                	mov    %esp,%ebp
 234:	57                   	push   %edi
 235:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 238:	89 d7                	mov    %edx,%edi
 23a:	8b 4d 10             	mov    0x10(%ebp),%ecx
 23d:	8b 45 0c             	mov    0xc(%ebp),%eax
 240:	fc                   	cld    
 241:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 243:	89 d0                	mov    %edx,%eax
 245:	8b 7d fc             	mov    -0x4(%ebp),%edi
 248:	c9                   	leave  
 249:	c3                   	ret    

0000024a <strchr>:

char*
strchr(const char *s, char c)
{
 24a:	55                   	push   %ebp
 24b:	89 e5                	mov    %esp,%ebp
 24d:	8b 45 08             	mov    0x8(%ebp),%eax
 250:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 254:	eb 03                	jmp    259 <strchr+0xf>
 256:	83 c0 01             	add    $0x1,%eax
 259:	0f b6 10             	movzbl (%eax),%edx
 25c:	84 d2                	test   %dl,%dl
 25e:	74 06                	je     266 <strchr+0x1c>
    if(*s == c)
 260:	38 ca                	cmp    %cl,%dl
 262:	75 f2                	jne    256 <strchr+0xc>
 264:	eb 05                	jmp    26b <strchr+0x21>
      return (char*)s;
  return 0;
 266:	b8 00 00 00 00       	mov    $0x0,%eax
}
 26b:	5d                   	pop    %ebp
 26c:	c3                   	ret    

0000026d <gets>:

char*
gets(char *buf, int max)
{
 26d:	55                   	push   %ebp
 26e:	89 e5                	mov    %esp,%ebp
 270:	57                   	push   %edi
 271:	56                   	push   %esi
 272:	53                   	push   %ebx
 273:	83 ec 1c             	sub    $0x1c,%esp
 276:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 279:	bb 00 00 00 00       	mov    $0x0,%ebx
 27e:	89 de                	mov    %ebx,%esi
 280:	83 c3 01             	add    $0x1,%ebx
 283:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 286:	7d 2e                	jge    2b6 <gets+0x49>
    cc = read(0, &c, 1);
 288:	83 ec 04             	sub    $0x4,%esp
 28b:	6a 01                	push   $0x1
 28d:	8d 45 e7             	lea    -0x19(%ebp),%eax
 290:	50                   	push   %eax
 291:	6a 00                	push   $0x0
 293:	e8 ec 00 00 00       	call   384 <read>
    if(cc < 1)
 298:	83 c4 10             	add    $0x10,%esp
 29b:	85 c0                	test   %eax,%eax
 29d:	7e 17                	jle    2b6 <gets+0x49>
      break;
    buf[i++] = c;
 29f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2a3:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 2a6:	3c 0a                	cmp    $0xa,%al
 2a8:	0f 94 c2             	sete   %dl
 2ab:	3c 0d                	cmp    $0xd,%al
 2ad:	0f 94 c0             	sete   %al
 2b0:	08 c2                	or     %al,%dl
 2b2:	74 ca                	je     27e <gets+0x11>
    buf[i++] = c;
 2b4:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 2b6:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 2ba:	89 f8                	mov    %edi,%eax
 2bc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2bf:	5b                   	pop    %ebx
 2c0:	5e                   	pop    %esi
 2c1:	5f                   	pop    %edi
 2c2:	5d                   	pop    %ebp
 2c3:	c3                   	ret    

000002c4 <stat>:

int
stat(const char *n, struct stat *st)
{
 2c4:	55                   	push   %ebp
 2c5:	89 e5                	mov    %esp,%ebp
 2c7:	56                   	push   %esi
 2c8:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2c9:	83 ec 08             	sub    $0x8,%esp
 2cc:	6a 00                	push   $0x0
 2ce:	ff 75 08             	push   0x8(%ebp)
 2d1:	e8 d6 00 00 00       	call   3ac <open>
  if(fd < 0)
 2d6:	83 c4 10             	add    $0x10,%esp
 2d9:	85 c0                	test   %eax,%eax
 2db:	78 24                	js     301 <stat+0x3d>
 2dd:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 2df:	83 ec 08             	sub    $0x8,%esp
 2e2:	ff 75 0c             	push   0xc(%ebp)
 2e5:	50                   	push   %eax
 2e6:	e8 d9 00 00 00       	call   3c4 <fstat>
 2eb:	89 c6                	mov    %eax,%esi
  close(fd);
 2ed:	89 1c 24             	mov    %ebx,(%esp)
 2f0:	e8 9f 00 00 00       	call   394 <close>
  return r;
 2f5:	83 c4 10             	add    $0x10,%esp
}
 2f8:	89 f0                	mov    %esi,%eax
 2fa:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2fd:	5b                   	pop    %ebx
 2fe:	5e                   	pop    %esi
 2ff:	5d                   	pop    %ebp
 300:	c3                   	ret    
    return -1;
 301:	be ff ff ff ff       	mov    $0xffffffff,%esi
 306:	eb f0                	jmp    2f8 <stat+0x34>

00000308 <atoi>:

int
atoi(const char *s)
{
 308:	55                   	push   %ebp
 309:	89 e5                	mov    %esp,%ebp
 30b:	53                   	push   %ebx
 30c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 30f:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 314:	eb 10                	jmp    326 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 316:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 319:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 31c:	83 c1 01             	add    $0x1,%ecx
 31f:	0f be c0             	movsbl %al,%eax
 322:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 326:	0f b6 01             	movzbl (%ecx),%eax
 329:	8d 58 d0             	lea    -0x30(%eax),%ebx
 32c:	80 fb 09             	cmp    $0x9,%bl
 32f:	76 e5                	jbe    316 <atoi+0xe>
  return n;
}
 331:	89 d0                	mov    %edx,%eax
 333:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 336:	c9                   	leave  
 337:	c3                   	ret    

00000338 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 338:	55                   	push   %ebp
 339:	89 e5                	mov    %esp,%ebp
 33b:	56                   	push   %esi
 33c:	53                   	push   %ebx
 33d:	8b 75 08             	mov    0x8(%ebp),%esi
 340:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 343:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 346:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 348:	eb 0d                	jmp    357 <memmove+0x1f>
    *dst++ = *src++;
 34a:	0f b6 01             	movzbl (%ecx),%eax
 34d:	88 02                	mov    %al,(%edx)
 34f:	8d 49 01             	lea    0x1(%ecx),%ecx
 352:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 355:	89 d8                	mov    %ebx,%eax
 357:	8d 58 ff             	lea    -0x1(%eax),%ebx
 35a:	85 c0                	test   %eax,%eax
 35c:	7f ec                	jg     34a <memmove+0x12>
  return vdst;
}
 35e:	89 f0                	mov    %esi,%eax
 360:	5b                   	pop    %ebx
 361:	5e                   	pop    %esi
 362:	5d                   	pop    %ebp
 363:	c3                   	ret    

00000364 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 364:	b8 01 00 00 00       	mov    $0x1,%eax
 369:	cd 40                	int    $0x40
 36b:	c3                   	ret    

0000036c <exit>:
SYSCALL(exit)
 36c:	b8 02 00 00 00       	mov    $0x2,%eax
 371:	cd 40                	int    $0x40
 373:	c3                   	ret    

00000374 <wait>:
SYSCALL(wait)
 374:	b8 03 00 00 00       	mov    $0x3,%eax
 379:	cd 40                	int    $0x40
 37b:	c3                   	ret    

0000037c <pipe>:
SYSCALL(pipe)
 37c:	b8 04 00 00 00       	mov    $0x4,%eax
 381:	cd 40                	int    $0x40
 383:	c3                   	ret    

00000384 <read>:
SYSCALL(read)
 384:	b8 05 00 00 00       	mov    $0x5,%eax
 389:	cd 40                	int    $0x40
 38b:	c3                   	ret    

0000038c <write>:
SYSCALL(write)
 38c:	b8 10 00 00 00       	mov    $0x10,%eax
 391:	cd 40                	int    $0x40
 393:	c3                   	ret    

00000394 <close>:
SYSCALL(close)
 394:	b8 15 00 00 00       	mov    $0x15,%eax
 399:	cd 40                	int    $0x40
 39b:	c3                   	ret    

0000039c <kill>:
SYSCALL(kill)
 39c:	b8 06 00 00 00       	mov    $0x6,%eax
 3a1:	cd 40                	int    $0x40
 3a3:	c3                   	ret    

000003a4 <exec>:
SYSCALL(exec)
 3a4:	b8 07 00 00 00       	mov    $0x7,%eax
 3a9:	cd 40                	int    $0x40
 3ab:	c3                   	ret    

000003ac <open>:
SYSCALL(open)
 3ac:	b8 0f 00 00 00       	mov    $0xf,%eax
 3b1:	cd 40                	int    $0x40
 3b3:	c3                   	ret    

000003b4 <mknod>:
SYSCALL(mknod)
 3b4:	b8 11 00 00 00       	mov    $0x11,%eax
 3b9:	cd 40                	int    $0x40
 3bb:	c3                   	ret    

000003bc <unlink>:
SYSCALL(unlink)
 3bc:	b8 12 00 00 00       	mov    $0x12,%eax
 3c1:	cd 40                	int    $0x40
 3c3:	c3                   	ret    

000003c4 <fstat>:
SYSCALL(fstat)
 3c4:	b8 08 00 00 00       	mov    $0x8,%eax
 3c9:	cd 40                	int    $0x40
 3cb:	c3                   	ret    

000003cc <link>:
SYSCALL(link)
 3cc:	b8 13 00 00 00       	mov    $0x13,%eax
 3d1:	cd 40                	int    $0x40
 3d3:	c3                   	ret    

000003d4 <mkdir>:
SYSCALL(mkdir)
 3d4:	b8 14 00 00 00       	mov    $0x14,%eax
 3d9:	cd 40                	int    $0x40
 3db:	c3                   	ret    

000003dc <chdir>:
SYSCALL(chdir)
 3dc:	b8 09 00 00 00       	mov    $0x9,%eax
 3e1:	cd 40                	int    $0x40
 3e3:	c3                   	ret    

000003e4 <dup>:
SYSCALL(dup)
 3e4:	b8 0a 00 00 00       	mov    $0xa,%eax
 3e9:	cd 40                	int    $0x40
 3eb:	c3                   	ret    

000003ec <getpid>:
SYSCALL(getpid)
 3ec:	b8 0b 00 00 00       	mov    $0xb,%eax
 3f1:	cd 40                	int    $0x40
 3f3:	c3                   	ret    

000003f4 <sbrk>:
SYSCALL(sbrk)
 3f4:	b8 0c 00 00 00       	mov    $0xc,%eax
 3f9:	cd 40                	int    $0x40
 3fb:	c3                   	ret    

000003fc <sleep>:
SYSCALL(sleep)
 3fc:	b8 0d 00 00 00       	mov    $0xd,%eax
 401:	cd 40                	int    $0x40
 403:	c3                   	ret    

00000404 <uptime>:
SYSCALL(uptime)
 404:	b8 0e 00 00 00       	mov    $0xe,%eax
 409:	cd 40                	int    $0x40
 40b:	c3                   	ret    

0000040c <clone>:
SYSCALL(clone)
 40c:	b8 16 00 00 00       	mov    $0x16,%eax
 411:	cd 40                	int    $0x40
 413:	c3                   	ret    

00000414 <join>:
 414:	b8 17 00 00 00       	mov    $0x17,%eax
 419:	cd 40                	int    $0x40
 41b:	c3                   	ret    

0000041c <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 41c:	55                   	push   %ebp
 41d:	89 e5                	mov    %esp,%ebp
 41f:	83 ec 1c             	sub    $0x1c,%esp
 422:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 425:	6a 01                	push   $0x1
 427:	8d 55 f4             	lea    -0xc(%ebp),%edx
 42a:	52                   	push   %edx
 42b:	50                   	push   %eax
 42c:	e8 5b ff ff ff       	call   38c <write>
}
 431:	83 c4 10             	add    $0x10,%esp
 434:	c9                   	leave  
 435:	c3                   	ret    

00000436 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 436:	55                   	push   %ebp
 437:	89 e5                	mov    %esp,%ebp
 439:	57                   	push   %edi
 43a:	56                   	push   %esi
 43b:	53                   	push   %ebx
 43c:	83 ec 2c             	sub    $0x2c,%esp
 43f:	89 45 d0             	mov    %eax,-0x30(%ebp)
 442:	89 d0                	mov    %edx,%eax
 444:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 446:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 44a:	0f 95 c1             	setne  %cl
 44d:	c1 ea 1f             	shr    $0x1f,%edx
 450:	84 d1                	test   %dl,%cl
 452:	74 44                	je     498 <printint+0x62>
    neg = 1;
    x = -xx;
 454:	f7 d8                	neg    %eax
 456:	89 c1                	mov    %eax,%ecx
    neg = 1;
 458:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 45f:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 464:	89 c8                	mov    %ecx,%eax
 466:	ba 00 00 00 00       	mov    $0x0,%edx
 46b:	f7 f6                	div    %esi
 46d:	89 df                	mov    %ebx,%edi
 46f:	83 c3 01             	add    $0x1,%ebx
 472:	0f b6 92 38 08 00 00 	movzbl 0x838(%edx),%edx
 479:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 47d:	89 ca                	mov    %ecx,%edx
 47f:	89 c1                	mov    %eax,%ecx
 481:	39 d6                	cmp    %edx,%esi
 483:	76 df                	jbe    464 <printint+0x2e>
  if(neg)
 485:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 489:	74 31                	je     4bc <printint+0x86>
    buf[i++] = '-';
 48b:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 490:	8d 5f 02             	lea    0x2(%edi),%ebx
 493:	8b 75 d0             	mov    -0x30(%ebp),%esi
 496:	eb 17                	jmp    4af <printint+0x79>
    x = xx;
 498:	89 c1                	mov    %eax,%ecx
  neg = 0;
 49a:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 4a1:	eb bc                	jmp    45f <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 4a3:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 4a8:	89 f0                	mov    %esi,%eax
 4aa:	e8 6d ff ff ff       	call   41c <putc>
  while(--i >= 0)
 4af:	83 eb 01             	sub    $0x1,%ebx
 4b2:	79 ef                	jns    4a3 <printint+0x6d>
}
 4b4:	83 c4 2c             	add    $0x2c,%esp
 4b7:	5b                   	pop    %ebx
 4b8:	5e                   	pop    %esi
 4b9:	5f                   	pop    %edi
 4ba:	5d                   	pop    %ebp
 4bb:	c3                   	ret    
 4bc:	8b 75 d0             	mov    -0x30(%ebp),%esi
 4bf:	eb ee                	jmp    4af <printint+0x79>

000004c1 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 4c1:	55                   	push   %ebp
 4c2:	89 e5                	mov    %esp,%ebp
 4c4:	57                   	push   %edi
 4c5:	56                   	push   %esi
 4c6:	53                   	push   %ebx
 4c7:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 4ca:	8d 45 10             	lea    0x10(%ebp),%eax
 4cd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 4d0:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 4d5:	bb 00 00 00 00       	mov    $0x0,%ebx
 4da:	eb 14                	jmp    4f0 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 4dc:	89 fa                	mov    %edi,%edx
 4de:	8b 45 08             	mov    0x8(%ebp),%eax
 4e1:	e8 36 ff ff ff       	call   41c <putc>
 4e6:	eb 05                	jmp    4ed <printf+0x2c>
      }
    } else if(state == '%'){
 4e8:	83 fe 25             	cmp    $0x25,%esi
 4eb:	74 25                	je     512 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 4ed:	83 c3 01             	add    $0x1,%ebx
 4f0:	8b 45 0c             	mov    0xc(%ebp),%eax
 4f3:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 4f7:	84 c0                	test   %al,%al
 4f9:	0f 84 20 01 00 00    	je     61f <printf+0x15e>
    c = fmt[i] & 0xff;
 4ff:	0f be f8             	movsbl %al,%edi
 502:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 505:	85 f6                	test   %esi,%esi
 507:	75 df                	jne    4e8 <printf+0x27>
      if(c == '%'){
 509:	83 f8 25             	cmp    $0x25,%eax
 50c:	75 ce                	jne    4dc <printf+0x1b>
        state = '%';
 50e:	89 c6                	mov    %eax,%esi
 510:	eb db                	jmp    4ed <printf+0x2c>
      if(c == 'd'){
 512:	83 f8 25             	cmp    $0x25,%eax
 515:	0f 84 cf 00 00 00    	je     5ea <printf+0x129>
 51b:	0f 8c dd 00 00 00    	jl     5fe <printf+0x13d>
 521:	83 f8 78             	cmp    $0x78,%eax
 524:	0f 8f d4 00 00 00    	jg     5fe <printf+0x13d>
 52a:	83 f8 63             	cmp    $0x63,%eax
 52d:	0f 8c cb 00 00 00    	jl     5fe <printf+0x13d>
 533:	83 e8 63             	sub    $0x63,%eax
 536:	83 f8 15             	cmp    $0x15,%eax
 539:	0f 87 bf 00 00 00    	ja     5fe <printf+0x13d>
 53f:	ff 24 85 e0 07 00 00 	jmp    *0x7e0(,%eax,4)
        printint(fd, *ap, 10, 1);
 546:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 549:	8b 17                	mov    (%edi),%edx
 54b:	83 ec 0c             	sub    $0xc,%esp
 54e:	6a 01                	push   $0x1
 550:	b9 0a 00 00 00       	mov    $0xa,%ecx
 555:	8b 45 08             	mov    0x8(%ebp),%eax
 558:	e8 d9 fe ff ff       	call   436 <printint>
        ap++;
 55d:	83 c7 04             	add    $0x4,%edi
 560:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 563:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 566:	be 00 00 00 00       	mov    $0x0,%esi
 56b:	eb 80                	jmp    4ed <printf+0x2c>
        printint(fd, *ap, 16, 0);
 56d:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 570:	8b 17                	mov    (%edi),%edx
 572:	83 ec 0c             	sub    $0xc,%esp
 575:	6a 00                	push   $0x0
 577:	b9 10 00 00 00       	mov    $0x10,%ecx
 57c:	8b 45 08             	mov    0x8(%ebp),%eax
 57f:	e8 b2 fe ff ff       	call   436 <printint>
        ap++;
 584:	83 c7 04             	add    $0x4,%edi
 587:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 58a:	83 c4 10             	add    $0x10,%esp
      state = 0;
 58d:	be 00 00 00 00       	mov    $0x0,%esi
 592:	e9 56 ff ff ff       	jmp    4ed <printf+0x2c>
        s = (char*)*ap;
 597:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 59a:	8b 30                	mov    (%eax),%esi
        ap++;
 59c:	83 c0 04             	add    $0x4,%eax
 59f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 5a2:	85 f6                	test   %esi,%esi
 5a4:	75 15                	jne    5bb <printf+0xfa>
          s = "(null)";
 5a6:	be d6 07 00 00       	mov    $0x7d6,%esi
 5ab:	eb 0e                	jmp    5bb <printf+0xfa>
          putc(fd, *s);
 5ad:	0f be d2             	movsbl %dl,%edx
 5b0:	8b 45 08             	mov    0x8(%ebp),%eax
 5b3:	e8 64 fe ff ff       	call   41c <putc>
          s++;
 5b8:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 5bb:	0f b6 16             	movzbl (%esi),%edx
 5be:	84 d2                	test   %dl,%dl
 5c0:	75 eb                	jne    5ad <printf+0xec>
      state = 0;
 5c2:	be 00 00 00 00       	mov    $0x0,%esi
 5c7:	e9 21 ff ff ff       	jmp    4ed <printf+0x2c>
        putc(fd, *ap);
 5cc:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5cf:	0f be 17             	movsbl (%edi),%edx
 5d2:	8b 45 08             	mov    0x8(%ebp),%eax
 5d5:	e8 42 fe ff ff       	call   41c <putc>
        ap++;
 5da:	83 c7 04             	add    $0x4,%edi
 5dd:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 5e0:	be 00 00 00 00       	mov    $0x0,%esi
 5e5:	e9 03 ff ff ff       	jmp    4ed <printf+0x2c>
        putc(fd, c);
 5ea:	89 fa                	mov    %edi,%edx
 5ec:	8b 45 08             	mov    0x8(%ebp),%eax
 5ef:	e8 28 fe ff ff       	call   41c <putc>
      state = 0;
 5f4:	be 00 00 00 00       	mov    $0x0,%esi
 5f9:	e9 ef fe ff ff       	jmp    4ed <printf+0x2c>
        putc(fd, '%');
 5fe:	ba 25 00 00 00       	mov    $0x25,%edx
 603:	8b 45 08             	mov    0x8(%ebp),%eax
 606:	e8 11 fe ff ff       	call   41c <putc>
        putc(fd, c);
 60b:	89 fa                	mov    %edi,%edx
 60d:	8b 45 08             	mov    0x8(%ebp),%eax
 610:	e8 07 fe ff ff       	call   41c <putc>
      state = 0;
 615:	be 00 00 00 00       	mov    $0x0,%esi
 61a:	e9 ce fe ff ff       	jmp    4ed <printf+0x2c>
    }
  }
}
 61f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 622:	5b                   	pop    %ebx
 623:	5e                   	pop    %esi
 624:	5f                   	pop    %edi
 625:	5d                   	pop    %ebp
 626:	c3                   	ret    

00000627 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 627:	55                   	push   %ebp
 628:	89 e5                	mov    %esp,%ebp
 62a:	57                   	push   %edi
 62b:	56                   	push   %esi
 62c:	53                   	push   %ebx
 62d:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 630:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 633:	a1 a8 0b 00 00       	mov    0xba8,%eax
 638:	eb 02                	jmp    63c <free+0x15>
 63a:	89 d0                	mov    %edx,%eax
 63c:	39 c8                	cmp    %ecx,%eax
 63e:	73 04                	jae    644 <free+0x1d>
 640:	39 08                	cmp    %ecx,(%eax)
 642:	77 12                	ja     656 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 644:	8b 10                	mov    (%eax),%edx
 646:	39 c2                	cmp    %eax,%edx
 648:	77 f0                	ja     63a <free+0x13>
 64a:	39 c8                	cmp    %ecx,%eax
 64c:	72 08                	jb     656 <free+0x2f>
 64e:	39 ca                	cmp    %ecx,%edx
 650:	77 04                	ja     656 <free+0x2f>
 652:	89 d0                	mov    %edx,%eax
 654:	eb e6                	jmp    63c <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 656:	8b 73 fc             	mov    -0x4(%ebx),%esi
 659:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 65c:	8b 10                	mov    (%eax),%edx
 65e:	39 d7                	cmp    %edx,%edi
 660:	74 19                	je     67b <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 662:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 665:	8b 50 04             	mov    0x4(%eax),%edx
 668:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 66b:	39 ce                	cmp    %ecx,%esi
 66d:	74 1b                	je     68a <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 66f:	89 08                	mov    %ecx,(%eax)
  freep = p;
 671:	a3 a8 0b 00 00       	mov    %eax,0xba8
}
 676:	5b                   	pop    %ebx
 677:	5e                   	pop    %esi
 678:	5f                   	pop    %edi
 679:	5d                   	pop    %ebp
 67a:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 67b:	03 72 04             	add    0x4(%edx),%esi
 67e:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 681:	8b 10                	mov    (%eax),%edx
 683:	8b 12                	mov    (%edx),%edx
 685:	89 53 f8             	mov    %edx,-0x8(%ebx)
 688:	eb db                	jmp    665 <free+0x3e>
    p->s.size += bp->s.size;
 68a:	03 53 fc             	add    -0x4(%ebx),%edx
 68d:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 690:	8b 53 f8             	mov    -0x8(%ebx),%edx
 693:	89 10                	mov    %edx,(%eax)
 695:	eb da                	jmp    671 <free+0x4a>

00000697 <morecore>:

static Header*
morecore(uint nu)
{
 697:	55                   	push   %ebp
 698:	89 e5                	mov    %esp,%ebp
 69a:	53                   	push   %ebx
 69b:	83 ec 04             	sub    $0x4,%esp
 69e:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 6a0:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 6a5:	77 05                	ja     6ac <morecore+0x15>
    nu = 4096;
 6a7:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 6ac:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 6b3:	83 ec 0c             	sub    $0xc,%esp
 6b6:	50                   	push   %eax
 6b7:	e8 38 fd ff ff       	call   3f4 <sbrk>
  if(p == (char*)-1)
 6bc:	83 c4 10             	add    $0x10,%esp
 6bf:	83 f8 ff             	cmp    $0xffffffff,%eax
 6c2:	74 1c                	je     6e0 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 6c4:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 6c7:	83 c0 08             	add    $0x8,%eax
 6ca:	83 ec 0c             	sub    $0xc,%esp
 6cd:	50                   	push   %eax
 6ce:	e8 54 ff ff ff       	call   627 <free>
  return freep;
 6d3:	a1 a8 0b 00 00       	mov    0xba8,%eax
 6d8:	83 c4 10             	add    $0x10,%esp
}
 6db:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 6de:	c9                   	leave  
 6df:	c3                   	ret    
    return 0;
 6e0:	b8 00 00 00 00       	mov    $0x0,%eax
 6e5:	eb f4                	jmp    6db <morecore+0x44>

000006e7 <malloc>:

void*
malloc(uint nbytes)
{
 6e7:	55                   	push   %ebp
 6e8:	89 e5                	mov    %esp,%ebp
 6ea:	53                   	push   %ebx
 6eb:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6ee:	8b 45 08             	mov    0x8(%ebp),%eax
 6f1:	8d 58 07             	lea    0x7(%eax),%ebx
 6f4:	c1 eb 03             	shr    $0x3,%ebx
 6f7:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 6fa:	8b 0d a8 0b 00 00    	mov    0xba8,%ecx
 700:	85 c9                	test   %ecx,%ecx
 702:	74 04                	je     708 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 704:	8b 01                	mov    (%ecx),%eax
 706:	eb 4a                	jmp    752 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 708:	c7 05 a8 0b 00 00 ac 	movl   $0xbac,0xba8
 70f:	0b 00 00 
 712:	c7 05 ac 0b 00 00 ac 	movl   $0xbac,0xbac
 719:	0b 00 00 
    base.s.size = 0;
 71c:	c7 05 b0 0b 00 00 00 	movl   $0x0,0xbb0
 723:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 726:	b9 ac 0b 00 00       	mov    $0xbac,%ecx
 72b:	eb d7                	jmp    704 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 72d:	74 19                	je     748 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 72f:	29 da                	sub    %ebx,%edx
 731:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 734:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 737:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 73a:	89 0d a8 0b 00 00    	mov    %ecx,0xba8
      return (void*)(p + 1);
 740:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 743:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 746:	c9                   	leave  
 747:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 748:	8b 10                	mov    (%eax),%edx
 74a:	89 11                	mov    %edx,(%ecx)
 74c:	eb ec                	jmp    73a <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 74e:	89 c1                	mov    %eax,%ecx
 750:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 752:	8b 50 04             	mov    0x4(%eax),%edx
 755:	39 da                	cmp    %ebx,%edx
 757:	73 d4                	jae    72d <malloc+0x46>
    if(p == freep)
 759:	39 05 a8 0b 00 00    	cmp    %eax,0xba8
 75f:	75 ed                	jne    74e <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 761:	89 d8                	mov    %ebx,%eax
 763:	e8 2f ff ff ff       	call   697 <morecore>
 768:	85 c0                	test   %eax,%eax
 76a:	75 e2                	jne    74e <malloc+0x67>
 76c:	eb d5                	jmp    743 <malloc+0x5c>
