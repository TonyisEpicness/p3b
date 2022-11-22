
_mkdir:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	83 ec 18             	sub    $0x18,%esp
  14:	8b 39                	mov    (%ecx),%edi
  16:	8b 41 04             	mov    0x4(%ecx),%eax
  19:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  int i;

  if(argc < 2){
  1c:	83 ff 01             	cmp    $0x1,%edi
  1f:	7e 07                	jle    28 <main+0x28>
    printf(2, "Usage: mkdir files...\n");
    exit();
  }

  for(i = 1; i < argc; i++){
  21:	bb 01 00 00 00       	mov    $0x1,%ebx
  26:	eb 17                	jmp    3f <main+0x3f>
    printf(2, "Usage: mkdir files...\n");
  28:	83 ec 08             	sub    $0x8,%esp
  2b:	68 1c 07 00 00       	push   $0x71c
  30:	6a 02                	push   $0x2
  32:	e8 38 04 00 00       	call   46f <printf>
    exit();
  37:	e8 de 02 00 00       	call   31a <exit>
  for(i = 1; i < argc; i++){
  3c:	83 c3 01             	add    $0x1,%ebx
  3f:	39 fb                	cmp    %edi,%ebx
  41:	7d 2b                	jge    6e <main+0x6e>
    if(mkdir(argv[i]) < 0){
  43:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  46:	8d 34 98             	lea    (%eax,%ebx,4),%esi
  49:	83 ec 0c             	sub    $0xc,%esp
  4c:	ff 36                	push   (%esi)
  4e:	e8 2f 03 00 00       	call   382 <mkdir>
  53:	83 c4 10             	add    $0x10,%esp
  56:	85 c0                	test   %eax,%eax
  58:	79 e2                	jns    3c <main+0x3c>
      printf(2, "mkdir: %s failed to create\n", argv[i]);
  5a:	83 ec 04             	sub    $0x4,%esp
  5d:	ff 36                	push   (%esi)
  5f:	68 33 07 00 00       	push   $0x733
  64:	6a 02                	push   $0x2
  66:	e8 04 04 00 00       	call   46f <printf>
      break;
  6b:	83 c4 10             	add    $0x10,%esp
    }
  }

  exit();
  6e:	e8 a7 02 00 00       	call   31a <exit>

00000073 <test_and_set>:
  int flag;
};

struct thread_ref *threads[64];

int test_and_set(int *old_ptr, int new_ptr) {
  73:	55                   	push   %ebp
  74:	89 e5                	mov    %esp,%ebp
  76:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *old_ptr;
  79:	8b 10                	mov    (%eax),%edx
  *old_ptr = new_ptr;
  7b:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  7e:	89 08                	mov    %ecx,(%eax)
  return old;
}
  80:	89 d0                	mov    %edx,%eax
  82:	5d                   	pop    %ebp
  83:	c3                   	ret    

00000084 <thread_create>:

// a wrapper func for clone
int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
  84:	55                   	push   %ebp
  85:	89 e5                	mov    %esp,%ebp
  87:	83 ec 14             	sub    $0x14,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE*2);
  8a:	68 00 20 00 00       	push   $0x2000
  8f:	e8 01 06 00 00       	call   695 <malloc>
  if(n_stack == 0){
  94:	83 c4 10             	add    $0x10,%esp
  97:	85 c0                	test   %eax,%eax
  99:	74 4a                	je     e5 <thread_create+0x61>
    return -1;
  }
  
  for(int i=0; i<64; i++){
  9b:	ba 00 00 00 00       	mov    $0x0,%edx
  a0:	eb 03                	jmp    a5 <thread_create+0x21>
  a2:	83 c2 01             	add    $0x1,%edx
  a5:	83 fa 3f             	cmp    $0x3f,%edx
  a8:	7f 27                	jg     d1 <thread_create+0x4d>
    if(threads[i]->flag==0){
  aa:	8b 0c 95 40 0b 00 00 	mov    0xb40(,%edx,4),%ecx
  b1:	83 79 08 00          	cmpl   $0x0,0x8(%ecx)
  b5:	75 eb                	jne    a2 <thread_create+0x1e>
      threads[i]->maddr = n_stack;
  b7:	89 01                	mov    %eax,(%ecx)
      threads[i]->pg1addr = n_stack;
  b9:	8b 0c 95 40 0b 00 00 	mov    0xb40(,%edx,4),%ecx
  c0:	89 41 04             	mov    %eax,0x4(%ecx)
      threads[i]->flag = 1;
  c3:	8b 14 95 40 0b 00 00 	mov    0xb40(,%edx,4),%edx
  ca:	c7 42 08 01 00 00 00 	movl   $0x1,0x8(%edx)
      break;
    }
  }
  
  int new_pid = clone(start_routine, arg1, arg2, n_stack); // TODO: is this the right way to call it?
  d1:	50                   	push   %eax
  d2:	ff 75 10             	push   0x10(%ebp)
  d5:	ff 75 0c             	push   0xc(%ebp)
  d8:	ff 75 08             	push   0x8(%ebp)
  db:	e8 da 02 00 00       	call   3ba <clone>

  // I can't remember if there was something else to do here but I'm sure I'll find out



  return new_pid;
  e0:	83 c4 10             	add    $0x10,%esp
}
  e3:	c9                   	leave  
  e4:	c3                   	ret    
    return -1;
  e5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  ea:	eb f7                	jmp    e3 <thread_create+0x5f>

000000ec <thread_join>:

//TODO: fix
int thread_join() {
  ec:	55                   	push   %ebp
  ed:	89 e5                	mov    %esp,%ebp
  ef:	56                   	push   %esi
  f0:	53                   	push   %ebx
  f1:	83 ec 1c             	sub    $0x1c,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
  f4:	8d 45 f4             	lea    -0xc(%ebp),%eax
  f7:	50                   	push   %eax
  f8:	e8 c5 02 00 00       	call   3c2 <join>
  fd:	89 c6                	mov    %eax,%esi
  for(int i=0; i<64; i++){
  ff:	83 c4 10             	add    $0x10,%esp
 102:	bb 00 00 00 00       	mov    $0x0,%ebx
 107:	eb 03                	jmp    10c <thread_join+0x20>
 109:	83 c3 01             	add    $0x1,%ebx
 10c:	83 fb 3f             	cmp    $0x3f,%ebx
 10f:	7f 23                	jg     134 <thread_join+0x48>
    if((threads[i]->flag==1) && (stk_addr == threads[i]->pg1addr)){
 111:	8b 04 9d 40 0b 00 00 	mov    0xb40(,%ebx,4),%eax
 118:	83 78 08 01          	cmpl   $0x1,0x8(%eax)
 11c:	75 eb                	jne    109 <thread_join+0x1d>
 11e:	8b 55 f4             	mov    -0xc(%ebp),%edx
 121:	39 50 04             	cmp    %edx,0x4(%eax)
 124:	75 e3                	jne    109 <thread_join+0x1d>
      free(stk_addr);
 126:	83 ec 0c             	sub    $0xc,%esp
 129:	52                   	push   %edx
 12a:	e8 a6 04 00 00       	call   5d5 <free>
 12f:	83 c4 10             	add    $0x10,%esp
 132:	eb d5                	jmp    109 <thread_join+0x1d>
    }
  }
  return pid;
}
 134:	89 f0                	mov    %esi,%eax
 136:	8d 65 f8             	lea    -0x8(%ebp),%esp
 139:	5b                   	pop    %ebx
 13a:	5e                   	pop    %esi
 13b:	5d                   	pop    %ebp
 13c:	c3                   	ret    

0000013d <lock_acquire>:

void lock_acquire(lock_t *lock){
 13d:	55                   	push   %ebp
 13e:	89 e5                	mov    %esp,%ebp
 140:	53                   	push   %ebx
 141:	83 ec 04             	sub    $0x4,%esp
 144:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 147:	83 ec 08             	sub    $0x8,%esp
 14a:	6a 01                	push   $0x1
 14c:	53                   	push   %ebx
 14d:	e8 21 ff ff ff       	call   73 <test_and_set>
 152:	83 c4 10             	add    $0x10,%esp
 155:	83 f8 01             	cmp    $0x1,%eax
 158:	74 ed                	je     147 <lock_acquire+0xa>
    ;
}
 15a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 15d:	c9                   	leave  
 15e:	c3                   	ret    

0000015f <lock_release>:

void lock_release(lock_t *lock) {
 15f:	55                   	push   %ebp
 160:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 162:	8b 45 08             	mov    0x8(%ebp),%eax
 165:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 16b:	5d                   	pop    %ebp
 16c:	c3                   	ret    

0000016d <lock_init>:

void lock_init(lock_t *lock) {
 16d:	55                   	push   %ebp
 16e:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 170:	8b 45 08             	mov    0x8(%ebp),%eax
 173:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 179:	5d                   	pop    %ebp
 17a:	c3                   	ret    

0000017b <strcpy>:

char*
strcpy(char *s, const char *t)
{
 17b:	55                   	push   %ebp
 17c:	89 e5                	mov    %esp,%ebp
 17e:	56                   	push   %esi
 17f:	53                   	push   %ebx
 180:	8b 75 08             	mov    0x8(%ebp),%esi
 183:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 186:	89 f0                	mov    %esi,%eax
 188:	89 d1                	mov    %edx,%ecx
 18a:	83 c2 01             	add    $0x1,%edx
 18d:	89 c3                	mov    %eax,%ebx
 18f:	83 c0 01             	add    $0x1,%eax
 192:	0f b6 09             	movzbl (%ecx),%ecx
 195:	88 0b                	mov    %cl,(%ebx)
 197:	84 c9                	test   %cl,%cl
 199:	75 ed                	jne    188 <strcpy+0xd>
    ;
  return os;
}
 19b:	89 f0                	mov    %esi,%eax
 19d:	5b                   	pop    %ebx
 19e:	5e                   	pop    %esi
 19f:	5d                   	pop    %ebp
 1a0:	c3                   	ret    

000001a1 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1a1:	55                   	push   %ebp
 1a2:	89 e5                	mov    %esp,%ebp
 1a4:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1a7:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 1aa:	eb 06                	jmp    1b2 <strcmp+0x11>
    p++, q++;
 1ac:	83 c1 01             	add    $0x1,%ecx
 1af:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 1b2:	0f b6 01             	movzbl (%ecx),%eax
 1b5:	84 c0                	test   %al,%al
 1b7:	74 04                	je     1bd <strcmp+0x1c>
 1b9:	3a 02                	cmp    (%edx),%al
 1bb:	74 ef                	je     1ac <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 1bd:	0f b6 c0             	movzbl %al,%eax
 1c0:	0f b6 12             	movzbl (%edx),%edx
 1c3:	29 d0                	sub    %edx,%eax
}
 1c5:	5d                   	pop    %ebp
 1c6:	c3                   	ret    

000001c7 <strlen>:

uint
strlen(const char *s)
{
 1c7:	55                   	push   %ebp
 1c8:	89 e5                	mov    %esp,%ebp
 1ca:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 1cd:	b8 00 00 00 00       	mov    $0x0,%eax
 1d2:	eb 03                	jmp    1d7 <strlen+0x10>
 1d4:	83 c0 01             	add    $0x1,%eax
 1d7:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 1db:	75 f7                	jne    1d4 <strlen+0xd>
    ;
  return n;
}
 1dd:	5d                   	pop    %ebp
 1de:	c3                   	ret    

000001df <memset>:

void*
memset(void *dst, int c, uint n)
{
 1df:	55                   	push   %ebp
 1e0:	89 e5                	mov    %esp,%ebp
 1e2:	57                   	push   %edi
 1e3:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1e6:	89 d7                	mov    %edx,%edi
 1e8:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1eb:	8b 45 0c             	mov    0xc(%ebp),%eax
 1ee:	fc                   	cld    
 1ef:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1f1:	89 d0                	mov    %edx,%eax
 1f3:	8b 7d fc             	mov    -0x4(%ebp),%edi
 1f6:	c9                   	leave  
 1f7:	c3                   	ret    

000001f8 <strchr>:

char*
strchr(const char *s, char c)
{
 1f8:	55                   	push   %ebp
 1f9:	89 e5                	mov    %esp,%ebp
 1fb:	8b 45 08             	mov    0x8(%ebp),%eax
 1fe:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 202:	eb 03                	jmp    207 <strchr+0xf>
 204:	83 c0 01             	add    $0x1,%eax
 207:	0f b6 10             	movzbl (%eax),%edx
 20a:	84 d2                	test   %dl,%dl
 20c:	74 06                	je     214 <strchr+0x1c>
    if(*s == c)
 20e:	38 ca                	cmp    %cl,%dl
 210:	75 f2                	jne    204 <strchr+0xc>
 212:	eb 05                	jmp    219 <strchr+0x21>
      return (char*)s;
  return 0;
 214:	b8 00 00 00 00       	mov    $0x0,%eax
}
 219:	5d                   	pop    %ebp
 21a:	c3                   	ret    

0000021b <gets>:

char*
gets(char *buf, int max)
{
 21b:	55                   	push   %ebp
 21c:	89 e5                	mov    %esp,%ebp
 21e:	57                   	push   %edi
 21f:	56                   	push   %esi
 220:	53                   	push   %ebx
 221:	83 ec 1c             	sub    $0x1c,%esp
 224:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 227:	bb 00 00 00 00       	mov    $0x0,%ebx
 22c:	89 de                	mov    %ebx,%esi
 22e:	83 c3 01             	add    $0x1,%ebx
 231:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 234:	7d 2e                	jge    264 <gets+0x49>
    cc = read(0, &c, 1);
 236:	83 ec 04             	sub    $0x4,%esp
 239:	6a 01                	push   $0x1
 23b:	8d 45 e7             	lea    -0x19(%ebp),%eax
 23e:	50                   	push   %eax
 23f:	6a 00                	push   $0x0
 241:	e8 ec 00 00 00       	call   332 <read>
    if(cc < 1)
 246:	83 c4 10             	add    $0x10,%esp
 249:	85 c0                	test   %eax,%eax
 24b:	7e 17                	jle    264 <gets+0x49>
      break;
    buf[i++] = c;
 24d:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 251:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 254:	3c 0a                	cmp    $0xa,%al
 256:	0f 94 c2             	sete   %dl
 259:	3c 0d                	cmp    $0xd,%al
 25b:	0f 94 c0             	sete   %al
 25e:	08 c2                	or     %al,%dl
 260:	74 ca                	je     22c <gets+0x11>
    buf[i++] = c;
 262:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 264:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 268:	89 f8                	mov    %edi,%eax
 26a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 26d:	5b                   	pop    %ebx
 26e:	5e                   	pop    %esi
 26f:	5f                   	pop    %edi
 270:	5d                   	pop    %ebp
 271:	c3                   	ret    

00000272 <stat>:

int
stat(const char *n, struct stat *st)
{
 272:	55                   	push   %ebp
 273:	89 e5                	mov    %esp,%ebp
 275:	56                   	push   %esi
 276:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 277:	83 ec 08             	sub    $0x8,%esp
 27a:	6a 00                	push   $0x0
 27c:	ff 75 08             	push   0x8(%ebp)
 27f:	e8 d6 00 00 00       	call   35a <open>
  if(fd < 0)
 284:	83 c4 10             	add    $0x10,%esp
 287:	85 c0                	test   %eax,%eax
 289:	78 24                	js     2af <stat+0x3d>
 28b:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 28d:	83 ec 08             	sub    $0x8,%esp
 290:	ff 75 0c             	push   0xc(%ebp)
 293:	50                   	push   %eax
 294:	e8 d9 00 00 00       	call   372 <fstat>
 299:	89 c6                	mov    %eax,%esi
  close(fd);
 29b:	89 1c 24             	mov    %ebx,(%esp)
 29e:	e8 9f 00 00 00       	call   342 <close>
  return r;
 2a3:	83 c4 10             	add    $0x10,%esp
}
 2a6:	89 f0                	mov    %esi,%eax
 2a8:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2ab:	5b                   	pop    %ebx
 2ac:	5e                   	pop    %esi
 2ad:	5d                   	pop    %ebp
 2ae:	c3                   	ret    
    return -1;
 2af:	be ff ff ff ff       	mov    $0xffffffff,%esi
 2b4:	eb f0                	jmp    2a6 <stat+0x34>

000002b6 <atoi>:

int
atoi(const char *s)
{
 2b6:	55                   	push   %ebp
 2b7:	89 e5                	mov    %esp,%ebp
 2b9:	53                   	push   %ebx
 2ba:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 2bd:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 2c2:	eb 10                	jmp    2d4 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 2c4:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 2c7:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 2ca:	83 c1 01             	add    $0x1,%ecx
 2cd:	0f be c0             	movsbl %al,%eax
 2d0:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 2d4:	0f b6 01             	movzbl (%ecx),%eax
 2d7:	8d 58 d0             	lea    -0x30(%eax),%ebx
 2da:	80 fb 09             	cmp    $0x9,%bl
 2dd:	76 e5                	jbe    2c4 <atoi+0xe>
  return n;
}
 2df:	89 d0                	mov    %edx,%eax
 2e1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2e4:	c9                   	leave  
 2e5:	c3                   	ret    

000002e6 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2e6:	55                   	push   %ebp
 2e7:	89 e5                	mov    %esp,%ebp
 2e9:	56                   	push   %esi
 2ea:	53                   	push   %ebx
 2eb:	8b 75 08             	mov    0x8(%ebp),%esi
 2ee:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 2f1:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 2f4:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 2f6:	eb 0d                	jmp    305 <memmove+0x1f>
    *dst++ = *src++;
 2f8:	0f b6 01             	movzbl (%ecx),%eax
 2fb:	88 02                	mov    %al,(%edx)
 2fd:	8d 49 01             	lea    0x1(%ecx),%ecx
 300:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 303:	89 d8                	mov    %ebx,%eax
 305:	8d 58 ff             	lea    -0x1(%eax),%ebx
 308:	85 c0                	test   %eax,%eax
 30a:	7f ec                	jg     2f8 <memmove+0x12>
  return vdst;
}
 30c:	89 f0                	mov    %esi,%eax
 30e:	5b                   	pop    %ebx
 30f:	5e                   	pop    %esi
 310:	5d                   	pop    %ebp
 311:	c3                   	ret    

00000312 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 312:	b8 01 00 00 00       	mov    $0x1,%eax
 317:	cd 40                	int    $0x40
 319:	c3                   	ret    

0000031a <exit>:
SYSCALL(exit)
 31a:	b8 02 00 00 00       	mov    $0x2,%eax
 31f:	cd 40                	int    $0x40
 321:	c3                   	ret    

00000322 <wait>:
SYSCALL(wait)
 322:	b8 03 00 00 00       	mov    $0x3,%eax
 327:	cd 40                	int    $0x40
 329:	c3                   	ret    

0000032a <pipe>:
SYSCALL(pipe)
 32a:	b8 04 00 00 00       	mov    $0x4,%eax
 32f:	cd 40                	int    $0x40
 331:	c3                   	ret    

00000332 <read>:
SYSCALL(read)
 332:	b8 05 00 00 00       	mov    $0x5,%eax
 337:	cd 40                	int    $0x40
 339:	c3                   	ret    

0000033a <write>:
SYSCALL(write)
 33a:	b8 10 00 00 00       	mov    $0x10,%eax
 33f:	cd 40                	int    $0x40
 341:	c3                   	ret    

00000342 <close>:
SYSCALL(close)
 342:	b8 15 00 00 00       	mov    $0x15,%eax
 347:	cd 40                	int    $0x40
 349:	c3                   	ret    

0000034a <kill>:
SYSCALL(kill)
 34a:	b8 06 00 00 00       	mov    $0x6,%eax
 34f:	cd 40                	int    $0x40
 351:	c3                   	ret    

00000352 <exec>:
SYSCALL(exec)
 352:	b8 07 00 00 00       	mov    $0x7,%eax
 357:	cd 40                	int    $0x40
 359:	c3                   	ret    

0000035a <open>:
SYSCALL(open)
 35a:	b8 0f 00 00 00       	mov    $0xf,%eax
 35f:	cd 40                	int    $0x40
 361:	c3                   	ret    

00000362 <mknod>:
SYSCALL(mknod)
 362:	b8 11 00 00 00       	mov    $0x11,%eax
 367:	cd 40                	int    $0x40
 369:	c3                   	ret    

0000036a <unlink>:
SYSCALL(unlink)
 36a:	b8 12 00 00 00       	mov    $0x12,%eax
 36f:	cd 40                	int    $0x40
 371:	c3                   	ret    

00000372 <fstat>:
SYSCALL(fstat)
 372:	b8 08 00 00 00       	mov    $0x8,%eax
 377:	cd 40                	int    $0x40
 379:	c3                   	ret    

0000037a <link>:
SYSCALL(link)
 37a:	b8 13 00 00 00       	mov    $0x13,%eax
 37f:	cd 40                	int    $0x40
 381:	c3                   	ret    

00000382 <mkdir>:
SYSCALL(mkdir)
 382:	b8 14 00 00 00       	mov    $0x14,%eax
 387:	cd 40                	int    $0x40
 389:	c3                   	ret    

0000038a <chdir>:
SYSCALL(chdir)
 38a:	b8 09 00 00 00       	mov    $0x9,%eax
 38f:	cd 40                	int    $0x40
 391:	c3                   	ret    

00000392 <dup>:
SYSCALL(dup)
 392:	b8 0a 00 00 00       	mov    $0xa,%eax
 397:	cd 40                	int    $0x40
 399:	c3                   	ret    

0000039a <getpid>:
SYSCALL(getpid)
 39a:	b8 0b 00 00 00       	mov    $0xb,%eax
 39f:	cd 40                	int    $0x40
 3a1:	c3                   	ret    

000003a2 <sbrk>:
SYSCALL(sbrk)
 3a2:	b8 0c 00 00 00       	mov    $0xc,%eax
 3a7:	cd 40                	int    $0x40
 3a9:	c3                   	ret    

000003aa <sleep>:
SYSCALL(sleep)
 3aa:	b8 0d 00 00 00       	mov    $0xd,%eax
 3af:	cd 40                	int    $0x40
 3b1:	c3                   	ret    

000003b2 <uptime>:
SYSCALL(uptime)
 3b2:	b8 0e 00 00 00       	mov    $0xe,%eax
 3b7:	cd 40                	int    $0x40
 3b9:	c3                   	ret    

000003ba <clone>:
SYSCALL(clone)
 3ba:	b8 16 00 00 00       	mov    $0x16,%eax
 3bf:	cd 40                	int    $0x40
 3c1:	c3                   	ret    

000003c2 <join>:
 3c2:	b8 17 00 00 00       	mov    $0x17,%eax
 3c7:	cd 40                	int    $0x40
 3c9:	c3                   	ret    

000003ca <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 3ca:	55                   	push   %ebp
 3cb:	89 e5                	mov    %esp,%ebp
 3cd:	83 ec 1c             	sub    $0x1c,%esp
 3d0:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 3d3:	6a 01                	push   $0x1
 3d5:	8d 55 f4             	lea    -0xc(%ebp),%edx
 3d8:	52                   	push   %edx
 3d9:	50                   	push   %eax
 3da:	e8 5b ff ff ff       	call   33a <write>
}
 3df:	83 c4 10             	add    $0x10,%esp
 3e2:	c9                   	leave  
 3e3:	c3                   	ret    

000003e4 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 3e4:	55                   	push   %ebp
 3e5:	89 e5                	mov    %esp,%ebp
 3e7:	57                   	push   %edi
 3e8:	56                   	push   %esi
 3e9:	53                   	push   %ebx
 3ea:	83 ec 2c             	sub    $0x2c,%esp
 3ed:	89 45 d0             	mov    %eax,-0x30(%ebp)
 3f0:	89 d0                	mov    %edx,%eax
 3f2:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 3f4:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 3f8:	0f 95 c1             	setne  %cl
 3fb:	c1 ea 1f             	shr    $0x1f,%edx
 3fe:	84 d1                	test   %dl,%cl
 400:	74 44                	je     446 <printint+0x62>
    neg = 1;
    x = -xx;
 402:	f7 d8                	neg    %eax
 404:	89 c1                	mov    %eax,%ecx
    neg = 1;
 406:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 40d:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 412:	89 c8                	mov    %ecx,%eax
 414:	ba 00 00 00 00       	mov    $0x0,%edx
 419:	f7 f6                	div    %esi
 41b:	89 df                	mov    %ebx,%edi
 41d:	83 c3 01             	add    $0x1,%ebx
 420:	0f b6 92 b0 07 00 00 	movzbl 0x7b0(%edx),%edx
 427:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 42b:	89 ca                	mov    %ecx,%edx
 42d:	89 c1                	mov    %eax,%ecx
 42f:	39 d6                	cmp    %edx,%esi
 431:	76 df                	jbe    412 <printint+0x2e>
  if(neg)
 433:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 437:	74 31                	je     46a <printint+0x86>
    buf[i++] = '-';
 439:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 43e:	8d 5f 02             	lea    0x2(%edi),%ebx
 441:	8b 75 d0             	mov    -0x30(%ebp),%esi
 444:	eb 17                	jmp    45d <printint+0x79>
    x = xx;
 446:	89 c1                	mov    %eax,%ecx
  neg = 0;
 448:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 44f:	eb bc                	jmp    40d <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 451:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 456:	89 f0                	mov    %esi,%eax
 458:	e8 6d ff ff ff       	call   3ca <putc>
  while(--i >= 0)
 45d:	83 eb 01             	sub    $0x1,%ebx
 460:	79 ef                	jns    451 <printint+0x6d>
}
 462:	83 c4 2c             	add    $0x2c,%esp
 465:	5b                   	pop    %ebx
 466:	5e                   	pop    %esi
 467:	5f                   	pop    %edi
 468:	5d                   	pop    %ebp
 469:	c3                   	ret    
 46a:	8b 75 d0             	mov    -0x30(%ebp),%esi
 46d:	eb ee                	jmp    45d <printint+0x79>

0000046f <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 46f:	55                   	push   %ebp
 470:	89 e5                	mov    %esp,%ebp
 472:	57                   	push   %edi
 473:	56                   	push   %esi
 474:	53                   	push   %ebx
 475:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 478:	8d 45 10             	lea    0x10(%ebp),%eax
 47b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 47e:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 483:	bb 00 00 00 00       	mov    $0x0,%ebx
 488:	eb 14                	jmp    49e <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 48a:	89 fa                	mov    %edi,%edx
 48c:	8b 45 08             	mov    0x8(%ebp),%eax
 48f:	e8 36 ff ff ff       	call   3ca <putc>
 494:	eb 05                	jmp    49b <printf+0x2c>
      }
    } else if(state == '%'){
 496:	83 fe 25             	cmp    $0x25,%esi
 499:	74 25                	je     4c0 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 49b:	83 c3 01             	add    $0x1,%ebx
 49e:	8b 45 0c             	mov    0xc(%ebp),%eax
 4a1:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 4a5:	84 c0                	test   %al,%al
 4a7:	0f 84 20 01 00 00    	je     5cd <printf+0x15e>
    c = fmt[i] & 0xff;
 4ad:	0f be f8             	movsbl %al,%edi
 4b0:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 4b3:	85 f6                	test   %esi,%esi
 4b5:	75 df                	jne    496 <printf+0x27>
      if(c == '%'){
 4b7:	83 f8 25             	cmp    $0x25,%eax
 4ba:	75 ce                	jne    48a <printf+0x1b>
        state = '%';
 4bc:	89 c6                	mov    %eax,%esi
 4be:	eb db                	jmp    49b <printf+0x2c>
      if(c == 'd'){
 4c0:	83 f8 25             	cmp    $0x25,%eax
 4c3:	0f 84 cf 00 00 00    	je     598 <printf+0x129>
 4c9:	0f 8c dd 00 00 00    	jl     5ac <printf+0x13d>
 4cf:	83 f8 78             	cmp    $0x78,%eax
 4d2:	0f 8f d4 00 00 00    	jg     5ac <printf+0x13d>
 4d8:	83 f8 63             	cmp    $0x63,%eax
 4db:	0f 8c cb 00 00 00    	jl     5ac <printf+0x13d>
 4e1:	83 e8 63             	sub    $0x63,%eax
 4e4:	83 f8 15             	cmp    $0x15,%eax
 4e7:	0f 87 bf 00 00 00    	ja     5ac <printf+0x13d>
 4ed:	ff 24 85 58 07 00 00 	jmp    *0x758(,%eax,4)
        printint(fd, *ap, 10, 1);
 4f4:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 4f7:	8b 17                	mov    (%edi),%edx
 4f9:	83 ec 0c             	sub    $0xc,%esp
 4fc:	6a 01                	push   $0x1
 4fe:	b9 0a 00 00 00       	mov    $0xa,%ecx
 503:	8b 45 08             	mov    0x8(%ebp),%eax
 506:	e8 d9 fe ff ff       	call   3e4 <printint>
        ap++;
 50b:	83 c7 04             	add    $0x4,%edi
 50e:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 511:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 514:	be 00 00 00 00       	mov    $0x0,%esi
 519:	eb 80                	jmp    49b <printf+0x2c>
        printint(fd, *ap, 16, 0);
 51b:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 51e:	8b 17                	mov    (%edi),%edx
 520:	83 ec 0c             	sub    $0xc,%esp
 523:	6a 00                	push   $0x0
 525:	b9 10 00 00 00       	mov    $0x10,%ecx
 52a:	8b 45 08             	mov    0x8(%ebp),%eax
 52d:	e8 b2 fe ff ff       	call   3e4 <printint>
        ap++;
 532:	83 c7 04             	add    $0x4,%edi
 535:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 538:	83 c4 10             	add    $0x10,%esp
      state = 0;
 53b:	be 00 00 00 00       	mov    $0x0,%esi
 540:	e9 56 ff ff ff       	jmp    49b <printf+0x2c>
        s = (char*)*ap;
 545:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 548:	8b 30                	mov    (%eax),%esi
        ap++;
 54a:	83 c0 04             	add    $0x4,%eax
 54d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 550:	85 f6                	test   %esi,%esi
 552:	75 15                	jne    569 <printf+0xfa>
          s = "(null)";
 554:	be 4f 07 00 00       	mov    $0x74f,%esi
 559:	eb 0e                	jmp    569 <printf+0xfa>
          putc(fd, *s);
 55b:	0f be d2             	movsbl %dl,%edx
 55e:	8b 45 08             	mov    0x8(%ebp),%eax
 561:	e8 64 fe ff ff       	call   3ca <putc>
          s++;
 566:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 569:	0f b6 16             	movzbl (%esi),%edx
 56c:	84 d2                	test   %dl,%dl
 56e:	75 eb                	jne    55b <printf+0xec>
      state = 0;
 570:	be 00 00 00 00       	mov    $0x0,%esi
 575:	e9 21 ff ff ff       	jmp    49b <printf+0x2c>
        putc(fd, *ap);
 57a:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 57d:	0f be 17             	movsbl (%edi),%edx
 580:	8b 45 08             	mov    0x8(%ebp),%eax
 583:	e8 42 fe ff ff       	call   3ca <putc>
        ap++;
 588:	83 c7 04             	add    $0x4,%edi
 58b:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 58e:	be 00 00 00 00       	mov    $0x0,%esi
 593:	e9 03 ff ff ff       	jmp    49b <printf+0x2c>
        putc(fd, c);
 598:	89 fa                	mov    %edi,%edx
 59a:	8b 45 08             	mov    0x8(%ebp),%eax
 59d:	e8 28 fe ff ff       	call   3ca <putc>
      state = 0;
 5a2:	be 00 00 00 00       	mov    $0x0,%esi
 5a7:	e9 ef fe ff ff       	jmp    49b <printf+0x2c>
        putc(fd, '%');
 5ac:	ba 25 00 00 00       	mov    $0x25,%edx
 5b1:	8b 45 08             	mov    0x8(%ebp),%eax
 5b4:	e8 11 fe ff ff       	call   3ca <putc>
        putc(fd, c);
 5b9:	89 fa                	mov    %edi,%edx
 5bb:	8b 45 08             	mov    0x8(%ebp),%eax
 5be:	e8 07 fe ff ff       	call   3ca <putc>
      state = 0;
 5c3:	be 00 00 00 00       	mov    $0x0,%esi
 5c8:	e9 ce fe ff ff       	jmp    49b <printf+0x2c>
    }
  }
}
 5cd:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5d0:	5b                   	pop    %ebx
 5d1:	5e                   	pop    %esi
 5d2:	5f                   	pop    %edi
 5d3:	5d                   	pop    %ebp
 5d4:	c3                   	ret    

000005d5 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5d5:	55                   	push   %ebp
 5d6:	89 e5                	mov    %esp,%ebp
 5d8:	57                   	push   %edi
 5d9:	56                   	push   %esi
 5da:	53                   	push   %ebx
 5db:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 5de:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5e1:	a1 40 0c 00 00       	mov    0xc40,%eax
 5e6:	eb 02                	jmp    5ea <free+0x15>
 5e8:	89 d0                	mov    %edx,%eax
 5ea:	39 c8                	cmp    %ecx,%eax
 5ec:	73 04                	jae    5f2 <free+0x1d>
 5ee:	39 08                	cmp    %ecx,(%eax)
 5f0:	77 12                	ja     604 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5f2:	8b 10                	mov    (%eax),%edx
 5f4:	39 c2                	cmp    %eax,%edx
 5f6:	77 f0                	ja     5e8 <free+0x13>
 5f8:	39 c8                	cmp    %ecx,%eax
 5fa:	72 08                	jb     604 <free+0x2f>
 5fc:	39 ca                	cmp    %ecx,%edx
 5fe:	77 04                	ja     604 <free+0x2f>
 600:	89 d0                	mov    %edx,%eax
 602:	eb e6                	jmp    5ea <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 604:	8b 73 fc             	mov    -0x4(%ebx),%esi
 607:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 60a:	8b 10                	mov    (%eax),%edx
 60c:	39 d7                	cmp    %edx,%edi
 60e:	74 19                	je     629 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 610:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 613:	8b 50 04             	mov    0x4(%eax),%edx
 616:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 619:	39 ce                	cmp    %ecx,%esi
 61b:	74 1b                	je     638 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 61d:	89 08                	mov    %ecx,(%eax)
  freep = p;
 61f:	a3 40 0c 00 00       	mov    %eax,0xc40
}
 624:	5b                   	pop    %ebx
 625:	5e                   	pop    %esi
 626:	5f                   	pop    %edi
 627:	5d                   	pop    %ebp
 628:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 629:	03 72 04             	add    0x4(%edx),%esi
 62c:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 62f:	8b 10                	mov    (%eax),%edx
 631:	8b 12                	mov    (%edx),%edx
 633:	89 53 f8             	mov    %edx,-0x8(%ebx)
 636:	eb db                	jmp    613 <free+0x3e>
    p->s.size += bp->s.size;
 638:	03 53 fc             	add    -0x4(%ebx),%edx
 63b:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 63e:	8b 53 f8             	mov    -0x8(%ebx),%edx
 641:	89 10                	mov    %edx,(%eax)
 643:	eb da                	jmp    61f <free+0x4a>

00000645 <morecore>:

static Header*
morecore(uint nu)
{
 645:	55                   	push   %ebp
 646:	89 e5                	mov    %esp,%ebp
 648:	53                   	push   %ebx
 649:	83 ec 04             	sub    $0x4,%esp
 64c:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 64e:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 653:	77 05                	ja     65a <morecore+0x15>
    nu = 4096;
 655:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 65a:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 661:	83 ec 0c             	sub    $0xc,%esp
 664:	50                   	push   %eax
 665:	e8 38 fd ff ff       	call   3a2 <sbrk>
  if(p == (char*)-1)
 66a:	83 c4 10             	add    $0x10,%esp
 66d:	83 f8 ff             	cmp    $0xffffffff,%eax
 670:	74 1c                	je     68e <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 672:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 675:	83 c0 08             	add    $0x8,%eax
 678:	83 ec 0c             	sub    $0xc,%esp
 67b:	50                   	push   %eax
 67c:	e8 54 ff ff ff       	call   5d5 <free>
  return freep;
 681:	a1 40 0c 00 00       	mov    0xc40,%eax
 686:	83 c4 10             	add    $0x10,%esp
}
 689:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 68c:	c9                   	leave  
 68d:	c3                   	ret    
    return 0;
 68e:	b8 00 00 00 00       	mov    $0x0,%eax
 693:	eb f4                	jmp    689 <morecore+0x44>

00000695 <malloc>:

void*
malloc(uint nbytes)
{
 695:	55                   	push   %ebp
 696:	89 e5                	mov    %esp,%ebp
 698:	53                   	push   %ebx
 699:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 69c:	8b 45 08             	mov    0x8(%ebp),%eax
 69f:	8d 58 07             	lea    0x7(%eax),%ebx
 6a2:	c1 eb 03             	shr    $0x3,%ebx
 6a5:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 6a8:	8b 0d 40 0c 00 00    	mov    0xc40,%ecx
 6ae:	85 c9                	test   %ecx,%ecx
 6b0:	74 04                	je     6b6 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6b2:	8b 01                	mov    (%ecx),%eax
 6b4:	eb 4a                	jmp    700 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 6b6:	c7 05 40 0c 00 00 44 	movl   $0xc44,0xc40
 6bd:	0c 00 00 
 6c0:	c7 05 44 0c 00 00 44 	movl   $0xc44,0xc44
 6c7:	0c 00 00 
    base.s.size = 0;
 6ca:	c7 05 48 0c 00 00 00 	movl   $0x0,0xc48
 6d1:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 6d4:	b9 44 0c 00 00       	mov    $0xc44,%ecx
 6d9:	eb d7                	jmp    6b2 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 6db:	74 19                	je     6f6 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 6dd:	29 da                	sub    %ebx,%edx
 6df:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 6e2:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 6e5:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 6e8:	89 0d 40 0c 00 00    	mov    %ecx,0xc40
      return (void*)(p + 1);
 6ee:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 6f1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 6f4:	c9                   	leave  
 6f5:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 6f6:	8b 10                	mov    (%eax),%edx
 6f8:	89 11                	mov    %edx,(%ecx)
 6fa:	eb ec                	jmp    6e8 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6fc:	89 c1                	mov    %eax,%ecx
 6fe:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 700:	8b 50 04             	mov    0x4(%eax),%edx
 703:	39 da                	cmp    %ebx,%edx
 705:	73 d4                	jae    6db <malloc+0x46>
    if(p == freep)
 707:	39 05 40 0c 00 00    	cmp    %eax,0xc40
 70d:	75 ed                	jne    6fc <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 70f:	89 d8                	mov    %ebx,%eax
 711:	e8 2f ff ff ff       	call   645 <morecore>
 716:	85 c0                	test   %eax,%eax
 718:	75 e2                	jne    6fc <malloc+0x67>
 71a:	eb d5                	jmp    6f1 <malloc+0x5c>
