
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
  11:	e8 cb 03 00 00       	call   3e1 <getpid>
  16:	a3 8c 0b 00 00       	mov    %eax,0xb8c

   int fork_pid = fork();
  1b:	e8 39 03 00 00       	call   359 <fork>
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
  2d:	e8 d7 03 00 00       	call   409 <join>
   assert(join_pid == -1);
  32:	83 c4 10             	add    $0x10,%esp
  35:	83 f8 ff             	cmp    $0xffffffff,%eax
  38:	0f 84 97 00 00 00    	je     d5 <main+0xd5>
  3e:	6a 22                	push   $0x22
  40:	68 64 07 00 00       	push   $0x764
  45:	68 6d 07 00 00       	push   $0x76d
  4a:	6a 01                	push   $0x1
  4c:	e8 65 04 00 00       	call   4b6 <printf>
  51:	83 c4 0c             	add    $0xc,%esp
  54:	68 a3 07 00 00       	push   $0x7a3
  59:	68 82 07 00 00       	push   $0x782
  5e:	6a 01                	push   $0x1
  60:	e8 51 04 00 00       	call   4b6 <printf>
  65:	83 c4 08             	add    $0x8,%esp
  68:	68 96 07 00 00       	push   $0x796
  6d:	6a 01                	push   $0x1
  6f:	e8 42 04 00 00       	call   4b6 <printf>
  74:	83 c4 04             	add    $0x4,%esp
  77:	ff 35 8c 0b 00 00    	push   0xb8c
  7d:	e8 0f 03 00 00       	call   391 <kill>
  82:	e8 da 02 00 00       	call   361 <exit>
     exit();
  87:	e8 d5 02 00 00       	call   361 <exit>
   assert(fork_pid > 0);
  8c:	6a 1e                	push   $0x1e
  8e:	68 64 07 00 00       	push   $0x764
  93:	68 6d 07 00 00       	push   $0x76d
  98:	6a 01                	push   $0x1
  9a:	e8 17 04 00 00       	call   4b6 <printf>
  9f:	83 c4 0c             	add    $0xc,%esp
  a2:	68 75 07 00 00       	push   $0x775
  a7:	68 82 07 00 00       	push   $0x782
  ac:	6a 01                	push   $0x1
  ae:	e8 03 04 00 00       	call   4b6 <printf>
  b3:	83 c4 08             	add    $0x8,%esp
  b6:	68 96 07 00 00       	push   $0x796
  bb:	6a 01                	push   $0x1
  bd:	e8 f4 03 00 00       	call   4b6 <printf>
  c2:	83 c4 04             	add    $0x4,%esp
  c5:	ff 35 8c 0b 00 00    	push   0xb8c
  cb:	e8 c1 02 00 00       	call   391 <kill>
  d0:	e8 8c 02 00 00       	call   361 <exit>

   assert(wait() > 0);
  d5:	e8 8f 02 00 00       	call   369 <wait>
  da:	85 c0                	test   %eax,%eax
  dc:	7e 14                	jle    f2 <main+0xf2>
   printf(1, "TEST PASSED\n");
  de:	83 ec 08             	sub    $0x8,%esp
  e1:	68 bd 07 00 00       	push   $0x7bd
  e6:	6a 01                	push   $0x1
  e8:	e8 c9 03 00 00       	call   4b6 <printf>
   exit();
  ed:	e8 6f 02 00 00       	call   361 <exit>
   assert(wait() > 0);
  f2:	6a 24                	push   $0x24
  f4:	68 64 07 00 00       	push   $0x764
  f9:	68 6d 07 00 00       	push   $0x76d
  fe:	6a 01                	push   $0x1
 100:	e8 b1 03 00 00       	call   4b6 <printf>
 105:	83 c4 0c             	add    $0xc,%esp
 108:	68 b2 07 00 00       	push   $0x7b2
 10d:	68 82 07 00 00       	push   $0x782
 112:	6a 01                	push   $0x1
 114:	e8 9d 03 00 00       	call   4b6 <printf>
 119:	83 c4 08             	add    $0x8,%esp
 11c:	68 96 07 00 00       	push   $0x796
 121:	6a 01                	push   $0x1
 123:	e8 8e 03 00 00       	call   4b6 <printf>
 128:	83 c4 04             	add    $0x4,%esp
 12b:	ff 35 8c 0b 00 00    	push   0xb8c
 131:	e8 5b 02 00 00       	call   391 <kill>
 136:	e8 26 02 00 00       	call   361 <exit>

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
  void *n_stack = malloc(PGSIZE);
 152:	68 00 10 00 00       	push   $0x1000
 157:	e8 80 05 00 00       	call   6dc <malloc>
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
 16d:	e8 8f 02 00 00       	call   401 <clone>


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
  return 0;
}
 17e:	b8 00 00 00 00       	mov    $0x0,%eax
 183:	c3                   	ret    

00000184 <lock_acquire>:

void lock_acquire(lock_t *lock){
 184:	55                   	push   %ebp
 185:	89 e5                	mov    %esp,%ebp
 187:	53                   	push   %ebx
 188:	83 ec 04             	sub    $0x4,%esp
 18b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 18e:	83 ec 08             	sub    $0x8,%esp
 191:	6a 01                	push   $0x1
 193:	53                   	push   %ebx
 194:	e8 a2 ff ff ff       	call   13b <test_and_set>
 199:	83 c4 10             	add    $0x10,%esp
 19c:	83 f8 01             	cmp    $0x1,%eax
 19f:	74 ed                	je     18e <lock_acquire+0xa>
    ;
}
 1a1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1a4:	c9                   	leave  
 1a5:	c3                   	ret    

000001a6 <lock_release>:

void lock_release(lock_t *lock) {
 1a6:	55                   	push   %ebp
 1a7:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 1a9:	8b 45 08             	mov    0x8(%ebp),%eax
 1ac:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 1b2:	5d                   	pop    %ebp
 1b3:	c3                   	ret    

000001b4 <lock_init>:

void lock_init(lock_t *lock) {
 1b4:	55                   	push   %ebp
 1b5:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 1b7:	8b 45 08             	mov    0x8(%ebp),%eax
 1ba:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 1c0:	5d                   	pop    %ebp
 1c1:	c3                   	ret    

000001c2 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 1c2:	55                   	push   %ebp
 1c3:	89 e5                	mov    %esp,%ebp
 1c5:	56                   	push   %esi
 1c6:	53                   	push   %ebx
 1c7:	8b 75 08             	mov    0x8(%ebp),%esi
 1ca:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 1cd:	89 f0                	mov    %esi,%eax
 1cf:	89 d1                	mov    %edx,%ecx
 1d1:	83 c2 01             	add    $0x1,%edx
 1d4:	89 c3                	mov    %eax,%ebx
 1d6:	83 c0 01             	add    $0x1,%eax
 1d9:	0f b6 09             	movzbl (%ecx),%ecx
 1dc:	88 0b                	mov    %cl,(%ebx)
 1de:	84 c9                	test   %cl,%cl
 1e0:	75 ed                	jne    1cf <strcpy+0xd>
    ;
  return os;
}
 1e2:	89 f0                	mov    %esi,%eax
 1e4:	5b                   	pop    %ebx
 1e5:	5e                   	pop    %esi
 1e6:	5d                   	pop    %ebp
 1e7:	c3                   	ret    

000001e8 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1e8:	55                   	push   %ebp
 1e9:	89 e5                	mov    %esp,%ebp
 1eb:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1ee:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 1f1:	eb 06                	jmp    1f9 <strcmp+0x11>
    p++, q++;
 1f3:	83 c1 01             	add    $0x1,%ecx
 1f6:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 1f9:	0f b6 01             	movzbl (%ecx),%eax
 1fc:	84 c0                	test   %al,%al
 1fe:	74 04                	je     204 <strcmp+0x1c>
 200:	3a 02                	cmp    (%edx),%al
 202:	74 ef                	je     1f3 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 204:	0f b6 c0             	movzbl %al,%eax
 207:	0f b6 12             	movzbl (%edx),%edx
 20a:	29 d0                	sub    %edx,%eax
}
 20c:	5d                   	pop    %ebp
 20d:	c3                   	ret    

0000020e <strlen>:

uint
strlen(const char *s)
{
 20e:	55                   	push   %ebp
 20f:	89 e5                	mov    %esp,%ebp
 211:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 214:	b8 00 00 00 00       	mov    $0x0,%eax
 219:	eb 03                	jmp    21e <strlen+0x10>
 21b:	83 c0 01             	add    $0x1,%eax
 21e:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 222:	75 f7                	jne    21b <strlen+0xd>
    ;
  return n;
}
 224:	5d                   	pop    %ebp
 225:	c3                   	ret    

00000226 <memset>:

void*
memset(void *dst, int c, uint n)
{
 226:	55                   	push   %ebp
 227:	89 e5                	mov    %esp,%ebp
 229:	57                   	push   %edi
 22a:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 22d:	89 d7                	mov    %edx,%edi
 22f:	8b 4d 10             	mov    0x10(%ebp),%ecx
 232:	8b 45 0c             	mov    0xc(%ebp),%eax
 235:	fc                   	cld    
 236:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 238:	89 d0                	mov    %edx,%eax
 23a:	8b 7d fc             	mov    -0x4(%ebp),%edi
 23d:	c9                   	leave  
 23e:	c3                   	ret    

0000023f <strchr>:

char*
strchr(const char *s, char c)
{
 23f:	55                   	push   %ebp
 240:	89 e5                	mov    %esp,%ebp
 242:	8b 45 08             	mov    0x8(%ebp),%eax
 245:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 249:	eb 03                	jmp    24e <strchr+0xf>
 24b:	83 c0 01             	add    $0x1,%eax
 24e:	0f b6 10             	movzbl (%eax),%edx
 251:	84 d2                	test   %dl,%dl
 253:	74 06                	je     25b <strchr+0x1c>
    if(*s == c)
 255:	38 ca                	cmp    %cl,%dl
 257:	75 f2                	jne    24b <strchr+0xc>
 259:	eb 05                	jmp    260 <strchr+0x21>
      return (char*)s;
  return 0;
 25b:	b8 00 00 00 00       	mov    $0x0,%eax
}
 260:	5d                   	pop    %ebp
 261:	c3                   	ret    

00000262 <gets>:

char*
gets(char *buf, int max)
{
 262:	55                   	push   %ebp
 263:	89 e5                	mov    %esp,%ebp
 265:	57                   	push   %edi
 266:	56                   	push   %esi
 267:	53                   	push   %ebx
 268:	83 ec 1c             	sub    $0x1c,%esp
 26b:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 26e:	bb 00 00 00 00       	mov    $0x0,%ebx
 273:	89 de                	mov    %ebx,%esi
 275:	83 c3 01             	add    $0x1,%ebx
 278:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 27b:	7d 2e                	jge    2ab <gets+0x49>
    cc = read(0, &c, 1);
 27d:	83 ec 04             	sub    $0x4,%esp
 280:	6a 01                	push   $0x1
 282:	8d 45 e7             	lea    -0x19(%ebp),%eax
 285:	50                   	push   %eax
 286:	6a 00                	push   $0x0
 288:	e8 ec 00 00 00       	call   379 <read>
    if(cc < 1)
 28d:	83 c4 10             	add    $0x10,%esp
 290:	85 c0                	test   %eax,%eax
 292:	7e 17                	jle    2ab <gets+0x49>
      break;
    buf[i++] = c;
 294:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 298:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 29b:	3c 0a                	cmp    $0xa,%al
 29d:	0f 94 c2             	sete   %dl
 2a0:	3c 0d                	cmp    $0xd,%al
 2a2:	0f 94 c0             	sete   %al
 2a5:	08 c2                	or     %al,%dl
 2a7:	74 ca                	je     273 <gets+0x11>
    buf[i++] = c;
 2a9:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 2ab:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 2af:	89 f8                	mov    %edi,%eax
 2b1:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2b4:	5b                   	pop    %ebx
 2b5:	5e                   	pop    %esi
 2b6:	5f                   	pop    %edi
 2b7:	5d                   	pop    %ebp
 2b8:	c3                   	ret    

000002b9 <stat>:

int
stat(const char *n, struct stat *st)
{
 2b9:	55                   	push   %ebp
 2ba:	89 e5                	mov    %esp,%ebp
 2bc:	56                   	push   %esi
 2bd:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2be:	83 ec 08             	sub    $0x8,%esp
 2c1:	6a 00                	push   $0x0
 2c3:	ff 75 08             	push   0x8(%ebp)
 2c6:	e8 d6 00 00 00       	call   3a1 <open>
  if(fd < 0)
 2cb:	83 c4 10             	add    $0x10,%esp
 2ce:	85 c0                	test   %eax,%eax
 2d0:	78 24                	js     2f6 <stat+0x3d>
 2d2:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 2d4:	83 ec 08             	sub    $0x8,%esp
 2d7:	ff 75 0c             	push   0xc(%ebp)
 2da:	50                   	push   %eax
 2db:	e8 d9 00 00 00       	call   3b9 <fstat>
 2e0:	89 c6                	mov    %eax,%esi
  close(fd);
 2e2:	89 1c 24             	mov    %ebx,(%esp)
 2e5:	e8 9f 00 00 00       	call   389 <close>
  return r;
 2ea:	83 c4 10             	add    $0x10,%esp
}
 2ed:	89 f0                	mov    %esi,%eax
 2ef:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2f2:	5b                   	pop    %ebx
 2f3:	5e                   	pop    %esi
 2f4:	5d                   	pop    %ebp
 2f5:	c3                   	ret    
    return -1;
 2f6:	be ff ff ff ff       	mov    $0xffffffff,%esi
 2fb:	eb f0                	jmp    2ed <stat+0x34>

000002fd <atoi>:

int
atoi(const char *s)
{
 2fd:	55                   	push   %ebp
 2fe:	89 e5                	mov    %esp,%ebp
 300:	53                   	push   %ebx
 301:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 304:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 309:	eb 10                	jmp    31b <atoi+0x1e>
    n = n*10 + *s++ - '0';
 30b:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 30e:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 311:	83 c1 01             	add    $0x1,%ecx
 314:	0f be c0             	movsbl %al,%eax
 317:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 31b:	0f b6 01             	movzbl (%ecx),%eax
 31e:	8d 58 d0             	lea    -0x30(%eax),%ebx
 321:	80 fb 09             	cmp    $0x9,%bl
 324:	76 e5                	jbe    30b <atoi+0xe>
  return n;
}
 326:	89 d0                	mov    %edx,%eax
 328:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 32b:	c9                   	leave  
 32c:	c3                   	ret    

0000032d <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 32d:	55                   	push   %ebp
 32e:	89 e5                	mov    %esp,%ebp
 330:	56                   	push   %esi
 331:	53                   	push   %ebx
 332:	8b 75 08             	mov    0x8(%ebp),%esi
 335:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 338:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 33b:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 33d:	eb 0d                	jmp    34c <memmove+0x1f>
    *dst++ = *src++;
 33f:	0f b6 01             	movzbl (%ecx),%eax
 342:	88 02                	mov    %al,(%edx)
 344:	8d 49 01             	lea    0x1(%ecx),%ecx
 347:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 34a:	89 d8                	mov    %ebx,%eax
 34c:	8d 58 ff             	lea    -0x1(%eax),%ebx
 34f:	85 c0                	test   %eax,%eax
 351:	7f ec                	jg     33f <memmove+0x12>
  return vdst;
}
 353:	89 f0                	mov    %esi,%eax
 355:	5b                   	pop    %ebx
 356:	5e                   	pop    %esi
 357:	5d                   	pop    %ebp
 358:	c3                   	ret    

00000359 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 359:	b8 01 00 00 00       	mov    $0x1,%eax
 35e:	cd 40                	int    $0x40
 360:	c3                   	ret    

00000361 <exit>:
SYSCALL(exit)
 361:	b8 02 00 00 00       	mov    $0x2,%eax
 366:	cd 40                	int    $0x40
 368:	c3                   	ret    

00000369 <wait>:
SYSCALL(wait)
 369:	b8 03 00 00 00       	mov    $0x3,%eax
 36e:	cd 40                	int    $0x40
 370:	c3                   	ret    

00000371 <pipe>:
SYSCALL(pipe)
 371:	b8 04 00 00 00       	mov    $0x4,%eax
 376:	cd 40                	int    $0x40
 378:	c3                   	ret    

00000379 <read>:
SYSCALL(read)
 379:	b8 05 00 00 00       	mov    $0x5,%eax
 37e:	cd 40                	int    $0x40
 380:	c3                   	ret    

00000381 <write>:
SYSCALL(write)
 381:	b8 10 00 00 00       	mov    $0x10,%eax
 386:	cd 40                	int    $0x40
 388:	c3                   	ret    

00000389 <close>:
SYSCALL(close)
 389:	b8 15 00 00 00       	mov    $0x15,%eax
 38e:	cd 40                	int    $0x40
 390:	c3                   	ret    

00000391 <kill>:
SYSCALL(kill)
 391:	b8 06 00 00 00       	mov    $0x6,%eax
 396:	cd 40                	int    $0x40
 398:	c3                   	ret    

00000399 <exec>:
SYSCALL(exec)
 399:	b8 07 00 00 00       	mov    $0x7,%eax
 39e:	cd 40                	int    $0x40
 3a0:	c3                   	ret    

000003a1 <open>:
SYSCALL(open)
 3a1:	b8 0f 00 00 00       	mov    $0xf,%eax
 3a6:	cd 40                	int    $0x40
 3a8:	c3                   	ret    

000003a9 <mknod>:
SYSCALL(mknod)
 3a9:	b8 11 00 00 00       	mov    $0x11,%eax
 3ae:	cd 40                	int    $0x40
 3b0:	c3                   	ret    

000003b1 <unlink>:
SYSCALL(unlink)
 3b1:	b8 12 00 00 00       	mov    $0x12,%eax
 3b6:	cd 40                	int    $0x40
 3b8:	c3                   	ret    

000003b9 <fstat>:
SYSCALL(fstat)
 3b9:	b8 08 00 00 00       	mov    $0x8,%eax
 3be:	cd 40                	int    $0x40
 3c0:	c3                   	ret    

000003c1 <link>:
SYSCALL(link)
 3c1:	b8 13 00 00 00       	mov    $0x13,%eax
 3c6:	cd 40                	int    $0x40
 3c8:	c3                   	ret    

000003c9 <mkdir>:
SYSCALL(mkdir)
 3c9:	b8 14 00 00 00       	mov    $0x14,%eax
 3ce:	cd 40                	int    $0x40
 3d0:	c3                   	ret    

000003d1 <chdir>:
SYSCALL(chdir)
 3d1:	b8 09 00 00 00       	mov    $0x9,%eax
 3d6:	cd 40                	int    $0x40
 3d8:	c3                   	ret    

000003d9 <dup>:
SYSCALL(dup)
 3d9:	b8 0a 00 00 00       	mov    $0xa,%eax
 3de:	cd 40                	int    $0x40
 3e0:	c3                   	ret    

000003e1 <getpid>:
SYSCALL(getpid)
 3e1:	b8 0b 00 00 00       	mov    $0xb,%eax
 3e6:	cd 40                	int    $0x40
 3e8:	c3                   	ret    

000003e9 <sbrk>:
SYSCALL(sbrk)
 3e9:	b8 0c 00 00 00       	mov    $0xc,%eax
 3ee:	cd 40                	int    $0x40
 3f0:	c3                   	ret    

000003f1 <sleep>:
SYSCALL(sleep)
 3f1:	b8 0d 00 00 00       	mov    $0xd,%eax
 3f6:	cd 40                	int    $0x40
 3f8:	c3                   	ret    

000003f9 <uptime>:
SYSCALL(uptime)
 3f9:	b8 0e 00 00 00       	mov    $0xe,%eax
 3fe:	cd 40                	int    $0x40
 400:	c3                   	ret    

00000401 <clone>:
SYSCALL(clone)
 401:	b8 16 00 00 00       	mov    $0x16,%eax
 406:	cd 40                	int    $0x40
 408:	c3                   	ret    

00000409 <join>:
 409:	b8 17 00 00 00       	mov    $0x17,%eax
 40e:	cd 40                	int    $0x40
 410:	c3                   	ret    

00000411 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 411:	55                   	push   %ebp
 412:	89 e5                	mov    %esp,%ebp
 414:	83 ec 1c             	sub    $0x1c,%esp
 417:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 41a:	6a 01                	push   $0x1
 41c:	8d 55 f4             	lea    -0xc(%ebp),%edx
 41f:	52                   	push   %edx
 420:	50                   	push   %eax
 421:	e8 5b ff ff ff       	call   381 <write>
}
 426:	83 c4 10             	add    $0x10,%esp
 429:	c9                   	leave  
 42a:	c3                   	ret    

0000042b <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 42b:	55                   	push   %ebp
 42c:	89 e5                	mov    %esp,%ebp
 42e:	57                   	push   %edi
 42f:	56                   	push   %esi
 430:	53                   	push   %ebx
 431:	83 ec 2c             	sub    $0x2c,%esp
 434:	89 45 d0             	mov    %eax,-0x30(%ebp)
 437:	89 d0                	mov    %edx,%eax
 439:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 43b:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 43f:	0f 95 c1             	setne  %cl
 442:	c1 ea 1f             	shr    $0x1f,%edx
 445:	84 d1                	test   %dl,%cl
 447:	74 44                	je     48d <printint+0x62>
    neg = 1;
    x = -xx;
 449:	f7 d8                	neg    %eax
 44b:	89 c1                	mov    %eax,%ecx
    neg = 1;
 44d:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 454:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 459:	89 c8                	mov    %ecx,%eax
 45b:	ba 00 00 00 00       	mov    $0x0,%edx
 460:	f7 f6                	div    %esi
 462:	89 df                	mov    %ebx,%edi
 464:	83 c3 01             	add    $0x1,%ebx
 467:	0f b6 92 2c 08 00 00 	movzbl 0x82c(%edx),%edx
 46e:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 472:	89 ca                	mov    %ecx,%edx
 474:	89 c1                	mov    %eax,%ecx
 476:	39 d6                	cmp    %edx,%esi
 478:	76 df                	jbe    459 <printint+0x2e>
  if(neg)
 47a:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 47e:	74 31                	je     4b1 <printint+0x86>
    buf[i++] = '-';
 480:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 485:	8d 5f 02             	lea    0x2(%edi),%ebx
 488:	8b 75 d0             	mov    -0x30(%ebp),%esi
 48b:	eb 17                	jmp    4a4 <printint+0x79>
    x = xx;
 48d:	89 c1                	mov    %eax,%ecx
  neg = 0;
 48f:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 496:	eb bc                	jmp    454 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 498:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 49d:	89 f0                	mov    %esi,%eax
 49f:	e8 6d ff ff ff       	call   411 <putc>
  while(--i >= 0)
 4a4:	83 eb 01             	sub    $0x1,%ebx
 4a7:	79 ef                	jns    498 <printint+0x6d>
}
 4a9:	83 c4 2c             	add    $0x2c,%esp
 4ac:	5b                   	pop    %ebx
 4ad:	5e                   	pop    %esi
 4ae:	5f                   	pop    %edi
 4af:	5d                   	pop    %ebp
 4b0:	c3                   	ret    
 4b1:	8b 75 d0             	mov    -0x30(%ebp),%esi
 4b4:	eb ee                	jmp    4a4 <printint+0x79>

000004b6 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 4b6:	55                   	push   %ebp
 4b7:	89 e5                	mov    %esp,%ebp
 4b9:	57                   	push   %edi
 4ba:	56                   	push   %esi
 4bb:	53                   	push   %ebx
 4bc:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 4bf:	8d 45 10             	lea    0x10(%ebp),%eax
 4c2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 4c5:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 4ca:	bb 00 00 00 00       	mov    $0x0,%ebx
 4cf:	eb 14                	jmp    4e5 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 4d1:	89 fa                	mov    %edi,%edx
 4d3:	8b 45 08             	mov    0x8(%ebp),%eax
 4d6:	e8 36 ff ff ff       	call   411 <putc>
 4db:	eb 05                	jmp    4e2 <printf+0x2c>
      }
    } else if(state == '%'){
 4dd:	83 fe 25             	cmp    $0x25,%esi
 4e0:	74 25                	je     507 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 4e2:	83 c3 01             	add    $0x1,%ebx
 4e5:	8b 45 0c             	mov    0xc(%ebp),%eax
 4e8:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 4ec:	84 c0                	test   %al,%al
 4ee:	0f 84 20 01 00 00    	je     614 <printf+0x15e>
    c = fmt[i] & 0xff;
 4f4:	0f be f8             	movsbl %al,%edi
 4f7:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 4fa:	85 f6                	test   %esi,%esi
 4fc:	75 df                	jne    4dd <printf+0x27>
      if(c == '%'){
 4fe:	83 f8 25             	cmp    $0x25,%eax
 501:	75 ce                	jne    4d1 <printf+0x1b>
        state = '%';
 503:	89 c6                	mov    %eax,%esi
 505:	eb db                	jmp    4e2 <printf+0x2c>
      if(c == 'd'){
 507:	83 f8 25             	cmp    $0x25,%eax
 50a:	0f 84 cf 00 00 00    	je     5df <printf+0x129>
 510:	0f 8c dd 00 00 00    	jl     5f3 <printf+0x13d>
 516:	83 f8 78             	cmp    $0x78,%eax
 519:	0f 8f d4 00 00 00    	jg     5f3 <printf+0x13d>
 51f:	83 f8 63             	cmp    $0x63,%eax
 522:	0f 8c cb 00 00 00    	jl     5f3 <printf+0x13d>
 528:	83 e8 63             	sub    $0x63,%eax
 52b:	83 f8 15             	cmp    $0x15,%eax
 52e:	0f 87 bf 00 00 00    	ja     5f3 <printf+0x13d>
 534:	ff 24 85 d4 07 00 00 	jmp    *0x7d4(,%eax,4)
        printint(fd, *ap, 10, 1);
 53b:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 53e:	8b 17                	mov    (%edi),%edx
 540:	83 ec 0c             	sub    $0xc,%esp
 543:	6a 01                	push   $0x1
 545:	b9 0a 00 00 00       	mov    $0xa,%ecx
 54a:	8b 45 08             	mov    0x8(%ebp),%eax
 54d:	e8 d9 fe ff ff       	call   42b <printint>
        ap++;
 552:	83 c7 04             	add    $0x4,%edi
 555:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 558:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 55b:	be 00 00 00 00       	mov    $0x0,%esi
 560:	eb 80                	jmp    4e2 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 562:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 565:	8b 17                	mov    (%edi),%edx
 567:	83 ec 0c             	sub    $0xc,%esp
 56a:	6a 00                	push   $0x0
 56c:	b9 10 00 00 00       	mov    $0x10,%ecx
 571:	8b 45 08             	mov    0x8(%ebp),%eax
 574:	e8 b2 fe ff ff       	call   42b <printint>
        ap++;
 579:	83 c7 04             	add    $0x4,%edi
 57c:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 57f:	83 c4 10             	add    $0x10,%esp
      state = 0;
 582:	be 00 00 00 00       	mov    $0x0,%esi
 587:	e9 56 ff ff ff       	jmp    4e2 <printf+0x2c>
        s = (char*)*ap;
 58c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 58f:	8b 30                	mov    (%eax),%esi
        ap++;
 591:	83 c0 04             	add    $0x4,%eax
 594:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 597:	85 f6                	test   %esi,%esi
 599:	75 15                	jne    5b0 <printf+0xfa>
          s = "(null)";
 59b:	be ca 07 00 00       	mov    $0x7ca,%esi
 5a0:	eb 0e                	jmp    5b0 <printf+0xfa>
          putc(fd, *s);
 5a2:	0f be d2             	movsbl %dl,%edx
 5a5:	8b 45 08             	mov    0x8(%ebp),%eax
 5a8:	e8 64 fe ff ff       	call   411 <putc>
          s++;
 5ad:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 5b0:	0f b6 16             	movzbl (%esi),%edx
 5b3:	84 d2                	test   %dl,%dl
 5b5:	75 eb                	jne    5a2 <printf+0xec>
      state = 0;
 5b7:	be 00 00 00 00       	mov    $0x0,%esi
 5bc:	e9 21 ff ff ff       	jmp    4e2 <printf+0x2c>
        putc(fd, *ap);
 5c1:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5c4:	0f be 17             	movsbl (%edi),%edx
 5c7:	8b 45 08             	mov    0x8(%ebp),%eax
 5ca:	e8 42 fe ff ff       	call   411 <putc>
        ap++;
 5cf:	83 c7 04             	add    $0x4,%edi
 5d2:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 5d5:	be 00 00 00 00       	mov    $0x0,%esi
 5da:	e9 03 ff ff ff       	jmp    4e2 <printf+0x2c>
        putc(fd, c);
 5df:	89 fa                	mov    %edi,%edx
 5e1:	8b 45 08             	mov    0x8(%ebp),%eax
 5e4:	e8 28 fe ff ff       	call   411 <putc>
      state = 0;
 5e9:	be 00 00 00 00       	mov    $0x0,%esi
 5ee:	e9 ef fe ff ff       	jmp    4e2 <printf+0x2c>
        putc(fd, '%');
 5f3:	ba 25 00 00 00       	mov    $0x25,%edx
 5f8:	8b 45 08             	mov    0x8(%ebp),%eax
 5fb:	e8 11 fe ff ff       	call   411 <putc>
        putc(fd, c);
 600:	89 fa                	mov    %edi,%edx
 602:	8b 45 08             	mov    0x8(%ebp),%eax
 605:	e8 07 fe ff ff       	call   411 <putc>
      state = 0;
 60a:	be 00 00 00 00       	mov    $0x0,%esi
 60f:	e9 ce fe ff ff       	jmp    4e2 <printf+0x2c>
    }
  }
}
 614:	8d 65 f4             	lea    -0xc(%ebp),%esp
 617:	5b                   	pop    %ebx
 618:	5e                   	pop    %esi
 619:	5f                   	pop    %edi
 61a:	5d                   	pop    %ebp
 61b:	c3                   	ret    

0000061c <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 61c:	55                   	push   %ebp
 61d:	89 e5                	mov    %esp,%ebp
 61f:	57                   	push   %edi
 620:	56                   	push   %esi
 621:	53                   	push   %ebx
 622:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 625:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 628:	a1 90 0b 00 00       	mov    0xb90,%eax
 62d:	eb 02                	jmp    631 <free+0x15>
 62f:	89 d0                	mov    %edx,%eax
 631:	39 c8                	cmp    %ecx,%eax
 633:	73 04                	jae    639 <free+0x1d>
 635:	39 08                	cmp    %ecx,(%eax)
 637:	77 12                	ja     64b <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 639:	8b 10                	mov    (%eax),%edx
 63b:	39 c2                	cmp    %eax,%edx
 63d:	77 f0                	ja     62f <free+0x13>
 63f:	39 c8                	cmp    %ecx,%eax
 641:	72 08                	jb     64b <free+0x2f>
 643:	39 ca                	cmp    %ecx,%edx
 645:	77 04                	ja     64b <free+0x2f>
 647:	89 d0                	mov    %edx,%eax
 649:	eb e6                	jmp    631 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 64b:	8b 73 fc             	mov    -0x4(%ebx),%esi
 64e:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 651:	8b 10                	mov    (%eax),%edx
 653:	39 d7                	cmp    %edx,%edi
 655:	74 19                	je     670 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 657:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 65a:	8b 50 04             	mov    0x4(%eax),%edx
 65d:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 660:	39 ce                	cmp    %ecx,%esi
 662:	74 1b                	je     67f <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 664:	89 08                	mov    %ecx,(%eax)
  freep = p;
 666:	a3 90 0b 00 00       	mov    %eax,0xb90
}
 66b:	5b                   	pop    %ebx
 66c:	5e                   	pop    %esi
 66d:	5f                   	pop    %edi
 66e:	5d                   	pop    %ebp
 66f:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 670:	03 72 04             	add    0x4(%edx),%esi
 673:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 676:	8b 10                	mov    (%eax),%edx
 678:	8b 12                	mov    (%edx),%edx
 67a:	89 53 f8             	mov    %edx,-0x8(%ebx)
 67d:	eb db                	jmp    65a <free+0x3e>
    p->s.size += bp->s.size;
 67f:	03 53 fc             	add    -0x4(%ebx),%edx
 682:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 685:	8b 53 f8             	mov    -0x8(%ebx),%edx
 688:	89 10                	mov    %edx,(%eax)
 68a:	eb da                	jmp    666 <free+0x4a>

0000068c <morecore>:

static Header*
morecore(uint nu)
{
 68c:	55                   	push   %ebp
 68d:	89 e5                	mov    %esp,%ebp
 68f:	53                   	push   %ebx
 690:	83 ec 04             	sub    $0x4,%esp
 693:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 695:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 69a:	77 05                	ja     6a1 <morecore+0x15>
    nu = 4096;
 69c:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 6a1:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 6a8:	83 ec 0c             	sub    $0xc,%esp
 6ab:	50                   	push   %eax
 6ac:	e8 38 fd ff ff       	call   3e9 <sbrk>
  if(p == (char*)-1)
 6b1:	83 c4 10             	add    $0x10,%esp
 6b4:	83 f8 ff             	cmp    $0xffffffff,%eax
 6b7:	74 1c                	je     6d5 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 6b9:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 6bc:	83 c0 08             	add    $0x8,%eax
 6bf:	83 ec 0c             	sub    $0xc,%esp
 6c2:	50                   	push   %eax
 6c3:	e8 54 ff ff ff       	call   61c <free>
  return freep;
 6c8:	a1 90 0b 00 00       	mov    0xb90,%eax
 6cd:	83 c4 10             	add    $0x10,%esp
}
 6d0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 6d3:	c9                   	leave  
 6d4:	c3                   	ret    
    return 0;
 6d5:	b8 00 00 00 00       	mov    $0x0,%eax
 6da:	eb f4                	jmp    6d0 <morecore+0x44>

000006dc <malloc>:

void*
malloc(uint nbytes)
{
 6dc:	55                   	push   %ebp
 6dd:	89 e5                	mov    %esp,%ebp
 6df:	53                   	push   %ebx
 6e0:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6e3:	8b 45 08             	mov    0x8(%ebp),%eax
 6e6:	8d 58 07             	lea    0x7(%eax),%ebx
 6e9:	c1 eb 03             	shr    $0x3,%ebx
 6ec:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 6ef:	8b 0d 90 0b 00 00    	mov    0xb90,%ecx
 6f5:	85 c9                	test   %ecx,%ecx
 6f7:	74 04                	je     6fd <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6f9:	8b 01                	mov    (%ecx),%eax
 6fb:	eb 4a                	jmp    747 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 6fd:	c7 05 90 0b 00 00 94 	movl   $0xb94,0xb90
 704:	0b 00 00 
 707:	c7 05 94 0b 00 00 94 	movl   $0xb94,0xb94
 70e:	0b 00 00 
    base.s.size = 0;
 711:	c7 05 98 0b 00 00 00 	movl   $0x0,0xb98
 718:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 71b:	b9 94 0b 00 00       	mov    $0xb94,%ecx
 720:	eb d7                	jmp    6f9 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 722:	74 19                	je     73d <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 724:	29 da                	sub    %ebx,%edx
 726:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 729:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 72c:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 72f:	89 0d 90 0b 00 00    	mov    %ecx,0xb90
      return (void*)(p + 1);
 735:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 738:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 73b:	c9                   	leave  
 73c:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 73d:	8b 10                	mov    (%eax),%edx
 73f:	89 11                	mov    %edx,(%ecx)
 741:	eb ec                	jmp    72f <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 743:	89 c1                	mov    %eax,%ecx
 745:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 747:	8b 50 04             	mov    0x4(%eax),%edx
 74a:	39 da                	cmp    %ebx,%edx
 74c:	73 d4                	jae    722 <malloc+0x46>
    if(p == freep)
 74e:	39 05 90 0b 00 00    	cmp    %eax,0xb90
 754:	75 ed                	jne    743 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 756:	89 d8                	mov    %ebx,%eax
 758:	e8 2f ff ff ff       	call   68c <morecore>
 75d:	85 c0                	test   %eax,%eax
 75f:	75 e2                	jne    743 <malloc+0x67>
 761:	eb d5                	jmp    738 <malloc+0x5c>
