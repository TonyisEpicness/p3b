
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
  11:	e8 4c 04 00 00       	call   462 <getpid>
  16:	a3 20 0c 00 00       	mov    %eax,0xc20

   int fork_pid = fork();
  1b:	e8 ba 03 00 00       	call   3da <fork>
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
  2d:	e8 58 04 00 00       	call   48a <join>
   assert(join_pid == -1);
  32:	83 c4 10             	add    $0x10,%esp
  35:	83 f8 ff             	cmp    $0xffffffff,%eax
  38:	0f 84 97 00 00 00    	je     d5 <main+0xd5>
  3e:	6a 22                	push   $0x22
  40:	68 e4 07 00 00       	push   $0x7e4
  45:	68 ed 07 00 00       	push   $0x7ed
  4a:	6a 01                	push   $0x1
  4c:	e8 e6 04 00 00       	call   537 <printf>
  51:	83 c4 0c             	add    $0xc,%esp
  54:	68 23 08 00 00       	push   $0x823
  59:	68 02 08 00 00       	push   $0x802
  5e:	6a 01                	push   $0x1
  60:	e8 d2 04 00 00       	call   537 <printf>
  65:	83 c4 08             	add    $0x8,%esp
  68:	68 16 08 00 00       	push   $0x816
  6d:	6a 01                	push   $0x1
  6f:	e8 c3 04 00 00       	call   537 <printf>
  74:	83 c4 04             	add    $0x4,%esp
  77:	ff 35 20 0c 00 00    	push   0xc20
  7d:	e8 90 03 00 00       	call   412 <kill>
  82:	e8 5b 03 00 00       	call   3e2 <exit>
     exit();
  87:	e8 56 03 00 00       	call   3e2 <exit>
   assert(fork_pid > 0);
  8c:	6a 1e                	push   $0x1e
  8e:	68 e4 07 00 00       	push   $0x7e4
  93:	68 ed 07 00 00       	push   $0x7ed
  98:	6a 01                	push   $0x1
  9a:	e8 98 04 00 00       	call   537 <printf>
  9f:	83 c4 0c             	add    $0xc,%esp
  a2:	68 f5 07 00 00       	push   $0x7f5
  a7:	68 02 08 00 00       	push   $0x802
  ac:	6a 01                	push   $0x1
  ae:	e8 84 04 00 00       	call   537 <printf>
  b3:	83 c4 08             	add    $0x8,%esp
  b6:	68 16 08 00 00       	push   $0x816
  bb:	6a 01                	push   $0x1
  bd:	e8 75 04 00 00       	call   537 <printf>
  c2:	83 c4 04             	add    $0x4,%esp
  c5:	ff 35 20 0c 00 00    	push   0xc20
  cb:	e8 42 03 00 00       	call   412 <kill>
  d0:	e8 0d 03 00 00       	call   3e2 <exit>

   assert(wait() > 0);
  d5:	e8 10 03 00 00       	call   3ea <wait>
  da:	85 c0                	test   %eax,%eax
  dc:	7e 14                	jle    f2 <main+0xf2>
   printf(1, "TEST PASSED\n");
  de:	83 ec 08             	sub    $0x8,%esp
  e1:	68 3d 08 00 00       	push   $0x83d
  e6:	6a 01                	push   $0x1
  e8:	e8 4a 04 00 00       	call   537 <printf>
   exit();
  ed:	e8 f0 02 00 00       	call   3e2 <exit>
   assert(wait() > 0);
  f2:	6a 24                	push   $0x24
  f4:	68 e4 07 00 00       	push   $0x7e4
  f9:	68 ed 07 00 00       	push   $0x7ed
  fe:	6a 01                	push   $0x1
 100:	e8 32 04 00 00       	call   537 <printf>
 105:	83 c4 0c             	add    $0xc,%esp
 108:	68 32 08 00 00       	push   $0x832
 10d:	68 02 08 00 00       	push   $0x802
 112:	6a 01                	push   $0x1
 114:	e8 1e 04 00 00       	call   537 <printf>
 119:	83 c4 08             	add    $0x8,%esp
 11c:	68 16 08 00 00       	push   $0x816
 121:	6a 01                	push   $0x1
 123:	e8 0f 04 00 00       	call   537 <printf>
 128:	83 c4 04             	add    $0x4,%esp
 12b:	ff 35 20 0c 00 00    	push   0xc20
 131:	e8 dc 02 00 00       	call   412 <kill>
 136:	e8 a7 02 00 00       	call   3e2 <exit>

0000013b <test_and_set>:
  int flag;
};

struct thread_ref *threads[64];

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
 157:	e8 01 06 00 00       	call   75d <malloc>
  if(n_stack == 0){
 15c:	83 c4 10             	add    $0x10,%esp
 15f:	85 c0                	test   %eax,%eax
 161:	74 4a                	je     1ad <thread_create+0x61>
    return -1;
  }
  
  for(int i=0; i<64; i++){
 163:	ba 00 00 00 00       	mov    $0x0,%edx
 168:	eb 03                	jmp    16d <thread_create+0x21>
 16a:	83 c2 01             	add    $0x1,%edx
 16d:	83 fa 3f             	cmp    $0x3f,%edx
 170:	7f 27                	jg     199 <thread_create+0x4d>
    if(threads[i]->flag==0){
 172:	8b 0c 95 40 0c 00 00 	mov    0xc40(,%edx,4),%ecx
 179:	83 79 08 00          	cmpl   $0x0,0x8(%ecx)
 17d:	75 eb                	jne    16a <thread_create+0x1e>
      threads[i]->maddr = n_stack;
 17f:	89 01                	mov    %eax,(%ecx)
      threads[i]->pg1addr = n_stack;
 181:	8b 0c 95 40 0c 00 00 	mov    0xc40(,%edx,4),%ecx
 188:	89 41 04             	mov    %eax,0x4(%ecx)
      threads[i]->flag = 1;
 18b:	8b 14 95 40 0c 00 00 	mov    0xc40(,%edx,4),%edx
 192:	c7 42 08 01 00 00 00 	movl   $0x1,0x8(%edx)
      break;
    }
  }
  
  int new_pid = clone(start_routine, arg1, arg2, n_stack); // TODO: is this the right way to call it?
 199:	50                   	push   %eax
 19a:	ff 75 10             	push   0x10(%ebp)
 19d:	ff 75 0c             	push   0xc(%ebp)
 1a0:	ff 75 08             	push   0x8(%ebp)
 1a3:	e8 da 02 00 00       	call   482 <clone>

  // I can't remember if there was something else to do here but I'm sure I'll find out



  return new_pid;
 1a8:	83 c4 10             	add    $0x10,%esp
}
 1ab:	c9                   	leave  
 1ac:	c3                   	ret    
    return -1;
 1ad:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 1b2:	eb f7                	jmp    1ab <thread_create+0x5f>

000001b4 <thread_join>:

//TODO: fix
int thread_join() {
 1b4:	55                   	push   %ebp
 1b5:	89 e5                	mov    %esp,%ebp
 1b7:	56                   	push   %esi
 1b8:	53                   	push   %ebx
 1b9:	83 ec 1c             	sub    $0x1c,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 1bc:	8d 45 f4             	lea    -0xc(%ebp),%eax
 1bf:	50                   	push   %eax
 1c0:	e8 c5 02 00 00       	call   48a <join>
 1c5:	89 c6                	mov    %eax,%esi
  for(int i=0; i<64; i++){
 1c7:	83 c4 10             	add    $0x10,%esp
 1ca:	bb 00 00 00 00       	mov    $0x0,%ebx
 1cf:	eb 03                	jmp    1d4 <thread_join+0x20>
 1d1:	83 c3 01             	add    $0x1,%ebx
 1d4:	83 fb 3f             	cmp    $0x3f,%ebx
 1d7:	7f 23                	jg     1fc <thread_join+0x48>
    if((threads[i]->flag==1) && (stk_addr == threads[i]->pg1addr)){
 1d9:	8b 04 9d 40 0c 00 00 	mov    0xc40(,%ebx,4),%eax
 1e0:	83 78 08 01          	cmpl   $0x1,0x8(%eax)
 1e4:	75 eb                	jne    1d1 <thread_join+0x1d>
 1e6:	8b 55 f4             	mov    -0xc(%ebp),%edx
 1e9:	39 50 04             	cmp    %edx,0x4(%eax)
 1ec:	75 e3                	jne    1d1 <thread_join+0x1d>
      free(stk_addr);
 1ee:	83 ec 0c             	sub    $0xc,%esp
 1f1:	52                   	push   %edx
 1f2:	e8 a6 04 00 00       	call   69d <free>
 1f7:	83 c4 10             	add    $0x10,%esp
 1fa:	eb d5                	jmp    1d1 <thread_join+0x1d>
    }
  }
  return pid;
}
 1fc:	89 f0                	mov    %esi,%eax
 1fe:	8d 65 f8             	lea    -0x8(%ebp),%esp
 201:	5b                   	pop    %ebx
 202:	5e                   	pop    %esi
 203:	5d                   	pop    %ebp
 204:	c3                   	ret    

00000205 <lock_acquire>:

void lock_acquire(lock_t *lock){
 205:	55                   	push   %ebp
 206:	89 e5                	mov    %esp,%ebp
 208:	53                   	push   %ebx
 209:	83 ec 04             	sub    $0x4,%esp
 20c:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 20f:	83 ec 08             	sub    $0x8,%esp
 212:	6a 01                	push   $0x1
 214:	53                   	push   %ebx
 215:	e8 21 ff ff ff       	call   13b <test_and_set>
 21a:	83 c4 10             	add    $0x10,%esp
 21d:	83 f8 01             	cmp    $0x1,%eax
 220:	74 ed                	je     20f <lock_acquire+0xa>
    ;
}
 222:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 225:	c9                   	leave  
 226:	c3                   	ret    

00000227 <lock_release>:

void lock_release(lock_t *lock) {
 227:	55                   	push   %ebp
 228:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 22a:	8b 45 08             	mov    0x8(%ebp),%eax
 22d:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 233:	5d                   	pop    %ebp
 234:	c3                   	ret    

00000235 <lock_init>:

void lock_init(lock_t *lock) {
 235:	55                   	push   %ebp
 236:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 238:	8b 45 08             	mov    0x8(%ebp),%eax
 23b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 241:	5d                   	pop    %ebp
 242:	c3                   	ret    

00000243 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 243:	55                   	push   %ebp
 244:	89 e5                	mov    %esp,%ebp
 246:	56                   	push   %esi
 247:	53                   	push   %ebx
 248:	8b 75 08             	mov    0x8(%ebp),%esi
 24b:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 24e:	89 f0                	mov    %esi,%eax
 250:	89 d1                	mov    %edx,%ecx
 252:	83 c2 01             	add    $0x1,%edx
 255:	89 c3                	mov    %eax,%ebx
 257:	83 c0 01             	add    $0x1,%eax
 25a:	0f b6 09             	movzbl (%ecx),%ecx
 25d:	88 0b                	mov    %cl,(%ebx)
 25f:	84 c9                	test   %cl,%cl
 261:	75 ed                	jne    250 <strcpy+0xd>
    ;
  return os;
}
 263:	89 f0                	mov    %esi,%eax
 265:	5b                   	pop    %ebx
 266:	5e                   	pop    %esi
 267:	5d                   	pop    %ebp
 268:	c3                   	ret    

00000269 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 269:	55                   	push   %ebp
 26a:	89 e5                	mov    %esp,%ebp
 26c:	8b 4d 08             	mov    0x8(%ebp),%ecx
 26f:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 272:	eb 06                	jmp    27a <strcmp+0x11>
    p++, q++;
 274:	83 c1 01             	add    $0x1,%ecx
 277:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 27a:	0f b6 01             	movzbl (%ecx),%eax
 27d:	84 c0                	test   %al,%al
 27f:	74 04                	je     285 <strcmp+0x1c>
 281:	3a 02                	cmp    (%edx),%al
 283:	74 ef                	je     274 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 285:	0f b6 c0             	movzbl %al,%eax
 288:	0f b6 12             	movzbl (%edx),%edx
 28b:	29 d0                	sub    %edx,%eax
}
 28d:	5d                   	pop    %ebp
 28e:	c3                   	ret    

0000028f <strlen>:

uint
strlen(const char *s)
{
 28f:	55                   	push   %ebp
 290:	89 e5                	mov    %esp,%ebp
 292:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 295:	b8 00 00 00 00       	mov    $0x0,%eax
 29a:	eb 03                	jmp    29f <strlen+0x10>
 29c:	83 c0 01             	add    $0x1,%eax
 29f:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 2a3:	75 f7                	jne    29c <strlen+0xd>
    ;
  return n;
}
 2a5:	5d                   	pop    %ebp
 2a6:	c3                   	ret    

000002a7 <memset>:

void*
memset(void *dst, int c, uint n)
{
 2a7:	55                   	push   %ebp
 2a8:	89 e5                	mov    %esp,%ebp
 2aa:	57                   	push   %edi
 2ab:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 2ae:	89 d7                	mov    %edx,%edi
 2b0:	8b 4d 10             	mov    0x10(%ebp),%ecx
 2b3:	8b 45 0c             	mov    0xc(%ebp),%eax
 2b6:	fc                   	cld    
 2b7:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 2b9:	89 d0                	mov    %edx,%eax
 2bb:	8b 7d fc             	mov    -0x4(%ebp),%edi
 2be:	c9                   	leave  
 2bf:	c3                   	ret    

000002c0 <strchr>:

char*
strchr(const char *s, char c)
{
 2c0:	55                   	push   %ebp
 2c1:	89 e5                	mov    %esp,%ebp
 2c3:	8b 45 08             	mov    0x8(%ebp),%eax
 2c6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 2ca:	eb 03                	jmp    2cf <strchr+0xf>
 2cc:	83 c0 01             	add    $0x1,%eax
 2cf:	0f b6 10             	movzbl (%eax),%edx
 2d2:	84 d2                	test   %dl,%dl
 2d4:	74 06                	je     2dc <strchr+0x1c>
    if(*s == c)
 2d6:	38 ca                	cmp    %cl,%dl
 2d8:	75 f2                	jne    2cc <strchr+0xc>
 2da:	eb 05                	jmp    2e1 <strchr+0x21>
      return (char*)s;
  return 0;
 2dc:	b8 00 00 00 00       	mov    $0x0,%eax
}
 2e1:	5d                   	pop    %ebp
 2e2:	c3                   	ret    

000002e3 <gets>:

char*
gets(char *buf, int max)
{
 2e3:	55                   	push   %ebp
 2e4:	89 e5                	mov    %esp,%ebp
 2e6:	57                   	push   %edi
 2e7:	56                   	push   %esi
 2e8:	53                   	push   %ebx
 2e9:	83 ec 1c             	sub    $0x1c,%esp
 2ec:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2ef:	bb 00 00 00 00       	mov    $0x0,%ebx
 2f4:	89 de                	mov    %ebx,%esi
 2f6:	83 c3 01             	add    $0x1,%ebx
 2f9:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2fc:	7d 2e                	jge    32c <gets+0x49>
    cc = read(0, &c, 1);
 2fe:	83 ec 04             	sub    $0x4,%esp
 301:	6a 01                	push   $0x1
 303:	8d 45 e7             	lea    -0x19(%ebp),%eax
 306:	50                   	push   %eax
 307:	6a 00                	push   $0x0
 309:	e8 ec 00 00 00       	call   3fa <read>
    if(cc < 1)
 30e:	83 c4 10             	add    $0x10,%esp
 311:	85 c0                	test   %eax,%eax
 313:	7e 17                	jle    32c <gets+0x49>
      break;
    buf[i++] = c;
 315:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 319:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 31c:	3c 0a                	cmp    $0xa,%al
 31e:	0f 94 c2             	sete   %dl
 321:	3c 0d                	cmp    $0xd,%al
 323:	0f 94 c0             	sete   %al
 326:	08 c2                	or     %al,%dl
 328:	74 ca                	je     2f4 <gets+0x11>
    buf[i++] = c;
 32a:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 32c:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 330:	89 f8                	mov    %edi,%eax
 332:	8d 65 f4             	lea    -0xc(%ebp),%esp
 335:	5b                   	pop    %ebx
 336:	5e                   	pop    %esi
 337:	5f                   	pop    %edi
 338:	5d                   	pop    %ebp
 339:	c3                   	ret    

0000033a <stat>:

int
stat(const char *n, struct stat *st)
{
 33a:	55                   	push   %ebp
 33b:	89 e5                	mov    %esp,%ebp
 33d:	56                   	push   %esi
 33e:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 33f:	83 ec 08             	sub    $0x8,%esp
 342:	6a 00                	push   $0x0
 344:	ff 75 08             	push   0x8(%ebp)
 347:	e8 d6 00 00 00       	call   422 <open>
  if(fd < 0)
 34c:	83 c4 10             	add    $0x10,%esp
 34f:	85 c0                	test   %eax,%eax
 351:	78 24                	js     377 <stat+0x3d>
 353:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 355:	83 ec 08             	sub    $0x8,%esp
 358:	ff 75 0c             	push   0xc(%ebp)
 35b:	50                   	push   %eax
 35c:	e8 d9 00 00 00       	call   43a <fstat>
 361:	89 c6                	mov    %eax,%esi
  close(fd);
 363:	89 1c 24             	mov    %ebx,(%esp)
 366:	e8 9f 00 00 00       	call   40a <close>
  return r;
 36b:	83 c4 10             	add    $0x10,%esp
}
 36e:	89 f0                	mov    %esi,%eax
 370:	8d 65 f8             	lea    -0x8(%ebp),%esp
 373:	5b                   	pop    %ebx
 374:	5e                   	pop    %esi
 375:	5d                   	pop    %ebp
 376:	c3                   	ret    
    return -1;
 377:	be ff ff ff ff       	mov    $0xffffffff,%esi
 37c:	eb f0                	jmp    36e <stat+0x34>

0000037e <atoi>:

int
atoi(const char *s)
{
 37e:	55                   	push   %ebp
 37f:	89 e5                	mov    %esp,%ebp
 381:	53                   	push   %ebx
 382:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 385:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 38a:	eb 10                	jmp    39c <atoi+0x1e>
    n = n*10 + *s++ - '0';
 38c:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 38f:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 392:	83 c1 01             	add    $0x1,%ecx
 395:	0f be c0             	movsbl %al,%eax
 398:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 39c:	0f b6 01             	movzbl (%ecx),%eax
 39f:	8d 58 d0             	lea    -0x30(%eax),%ebx
 3a2:	80 fb 09             	cmp    $0x9,%bl
 3a5:	76 e5                	jbe    38c <atoi+0xe>
  return n;
}
 3a7:	89 d0                	mov    %edx,%eax
 3a9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3ac:	c9                   	leave  
 3ad:	c3                   	ret    

000003ae <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3ae:	55                   	push   %ebp
 3af:	89 e5                	mov    %esp,%ebp
 3b1:	56                   	push   %esi
 3b2:	53                   	push   %ebx
 3b3:	8b 75 08             	mov    0x8(%ebp),%esi
 3b6:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 3b9:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 3bc:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 3be:	eb 0d                	jmp    3cd <memmove+0x1f>
    *dst++ = *src++;
 3c0:	0f b6 01             	movzbl (%ecx),%eax
 3c3:	88 02                	mov    %al,(%edx)
 3c5:	8d 49 01             	lea    0x1(%ecx),%ecx
 3c8:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 3cb:	89 d8                	mov    %ebx,%eax
 3cd:	8d 58 ff             	lea    -0x1(%eax),%ebx
 3d0:	85 c0                	test   %eax,%eax
 3d2:	7f ec                	jg     3c0 <memmove+0x12>
  return vdst;
}
 3d4:	89 f0                	mov    %esi,%eax
 3d6:	5b                   	pop    %ebx
 3d7:	5e                   	pop    %esi
 3d8:	5d                   	pop    %ebp
 3d9:	c3                   	ret    

000003da <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3da:	b8 01 00 00 00       	mov    $0x1,%eax
 3df:	cd 40                	int    $0x40
 3e1:	c3                   	ret    

000003e2 <exit>:
SYSCALL(exit)
 3e2:	b8 02 00 00 00       	mov    $0x2,%eax
 3e7:	cd 40                	int    $0x40
 3e9:	c3                   	ret    

000003ea <wait>:
SYSCALL(wait)
 3ea:	b8 03 00 00 00       	mov    $0x3,%eax
 3ef:	cd 40                	int    $0x40
 3f1:	c3                   	ret    

000003f2 <pipe>:
SYSCALL(pipe)
 3f2:	b8 04 00 00 00       	mov    $0x4,%eax
 3f7:	cd 40                	int    $0x40
 3f9:	c3                   	ret    

000003fa <read>:
SYSCALL(read)
 3fa:	b8 05 00 00 00       	mov    $0x5,%eax
 3ff:	cd 40                	int    $0x40
 401:	c3                   	ret    

00000402 <write>:
SYSCALL(write)
 402:	b8 10 00 00 00       	mov    $0x10,%eax
 407:	cd 40                	int    $0x40
 409:	c3                   	ret    

0000040a <close>:
SYSCALL(close)
 40a:	b8 15 00 00 00       	mov    $0x15,%eax
 40f:	cd 40                	int    $0x40
 411:	c3                   	ret    

00000412 <kill>:
SYSCALL(kill)
 412:	b8 06 00 00 00       	mov    $0x6,%eax
 417:	cd 40                	int    $0x40
 419:	c3                   	ret    

0000041a <exec>:
SYSCALL(exec)
 41a:	b8 07 00 00 00       	mov    $0x7,%eax
 41f:	cd 40                	int    $0x40
 421:	c3                   	ret    

00000422 <open>:
SYSCALL(open)
 422:	b8 0f 00 00 00       	mov    $0xf,%eax
 427:	cd 40                	int    $0x40
 429:	c3                   	ret    

0000042a <mknod>:
SYSCALL(mknod)
 42a:	b8 11 00 00 00       	mov    $0x11,%eax
 42f:	cd 40                	int    $0x40
 431:	c3                   	ret    

00000432 <unlink>:
SYSCALL(unlink)
 432:	b8 12 00 00 00       	mov    $0x12,%eax
 437:	cd 40                	int    $0x40
 439:	c3                   	ret    

0000043a <fstat>:
SYSCALL(fstat)
 43a:	b8 08 00 00 00       	mov    $0x8,%eax
 43f:	cd 40                	int    $0x40
 441:	c3                   	ret    

00000442 <link>:
SYSCALL(link)
 442:	b8 13 00 00 00       	mov    $0x13,%eax
 447:	cd 40                	int    $0x40
 449:	c3                   	ret    

0000044a <mkdir>:
SYSCALL(mkdir)
 44a:	b8 14 00 00 00       	mov    $0x14,%eax
 44f:	cd 40                	int    $0x40
 451:	c3                   	ret    

00000452 <chdir>:
SYSCALL(chdir)
 452:	b8 09 00 00 00       	mov    $0x9,%eax
 457:	cd 40                	int    $0x40
 459:	c3                   	ret    

0000045a <dup>:
SYSCALL(dup)
 45a:	b8 0a 00 00 00       	mov    $0xa,%eax
 45f:	cd 40                	int    $0x40
 461:	c3                   	ret    

00000462 <getpid>:
SYSCALL(getpid)
 462:	b8 0b 00 00 00       	mov    $0xb,%eax
 467:	cd 40                	int    $0x40
 469:	c3                   	ret    

0000046a <sbrk>:
SYSCALL(sbrk)
 46a:	b8 0c 00 00 00       	mov    $0xc,%eax
 46f:	cd 40                	int    $0x40
 471:	c3                   	ret    

00000472 <sleep>:
SYSCALL(sleep)
 472:	b8 0d 00 00 00       	mov    $0xd,%eax
 477:	cd 40                	int    $0x40
 479:	c3                   	ret    

0000047a <uptime>:
SYSCALL(uptime)
 47a:	b8 0e 00 00 00       	mov    $0xe,%eax
 47f:	cd 40                	int    $0x40
 481:	c3                   	ret    

00000482 <clone>:
SYSCALL(clone)
 482:	b8 16 00 00 00       	mov    $0x16,%eax
 487:	cd 40                	int    $0x40
 489:	c3                   	ret    

0000048a <join>:
 48a:	b8 17 00 00 00       	mov    $0x17,%eax
 48f:	cd 40                	int    $0x40
 491:	c3                   	ret    

00000492 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 492:	55                   	push   %ebp
 493:	89 e5                	mov    %esp,%ebp
 495:	83 ec 1c             	sub    $0x1c,%esp
 498:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 49b:	6a 01                	push   $0x1
 49d:	8d 55 f4             	lea    -0xc(%ebp),%edx
 4a0:	52                   	push   %edx
 4a1:	50                   	push   %eax
 4a2:	e8 5b ff ff ff       	call   402 <write>
}
 4a7:	83 c4 10             	add    $0x10,%esp
 4aa:	c9                   	leave  
 4ab:	c3                   	ret    

000004ac <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 4ac:	55                   	push   %ebp
 4ad:	89 e5                	mov    %esp,%ebp
 4af:	57                   	push   %edi
 4b0:	56                   	push   %esi
 4b1:	53                   	push   %ebx
 4b2:	83 ec 2c             	sub    $0x2c,%esp
 4b5:	89 45 d0             	mov    %eax,-0x30(%ebp)
 4b8:	89 d0                	mov    %edx,%eax
 4ba:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 4bc:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 4c0:	0f 95 c1             	setne  %cl
 4c3:	c1 ea 1f             	shr    $0x1f,%edx
 4c6:	84 d1                	test   %dl,%cl
 4c8:	74 44                	je     50e <printint+0x62>
    neg = 1;
    x = -xx;
 4ca:	f7 d8                	neg    %eax
 4cc:	89 c1                	mov    %eax,%ecx
    neg = 1;
 4ce:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 4d5:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 4da:	89 c8                	mov    %ecx,%eax
 4dc:	ba 00 00 00 00       	mov    $0x0,%edx
 4e1:	f7 f6                	div    %esi
 4e3:	89 df                	mov    %ebx,%edi
 4e5:	83 c3 01             	add    $0x1,%ebx
 4e8:	0f b6 92 ac 08 00 00 	movzbl 0x8ac(%edx),%edx
 4ef:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 4f3:	89 ca                	mov    %ecx,%edx
 4f5:	89 c1                	mov    %eax,%ecx
 4f7:	39 d6                	cmp    %edx,%esi
 4f9:	76 df                	jbe    4da <printint+0x2e>
  if(neg)
 4fb:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 4ff:	74 31                	je     532 <printint+0x86>
    buf[i++] = '-';
 501:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 506:	8d 5f 02             	lea    0x2(%edi),%ebx
 509:	8b 75 d0             	mov    -0x30(%ebp),%esi
 50c:	eb 17                	jmp    525 <printint+0x79>
    x = xx;
 50e:	89 c1                	mov    %eax,%ecx
  neg = 0;
 510:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 517:	eb bc                	jmp    4d5 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 519:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 51e:	89 f0                	mov    %esi,%eax
 520:	e8 6d ff ff ff       	call   492 <putc>
  while(--i >= 0)
 525:	83 eb 01             	sub    $0x1,%ebx
 528:	79 ef                	jns    519 <printint+0x6d>
}
 52a:	83 c4 2c             	add    $0x2c,%esp
 52d:	5b                   	pop    %ebx
 52e:	5e                   	pop    %esi
 52f:	5f                   	pop    %edi
 530:	5d                   	pop    %ebp
 531:	c3                   	ret    
 532:	8b 75 d0             	mov    -0x30(%ebp),%esi
 535:	eb ee                	jmp    525 <printint+0x79>

00000537 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 537:	55                   	push   %ebp
 538:	89 e5                	mov    %esp,%ebp
 53a:	57                   	push   %edi
 53b:	56                   	push   %esi
 53c:	53                   	push   %ebx
 53d:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 540:	8d 45 10             	lea    0x10(%ebp),%eax
 543:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 546:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 54b:	bb 00 00 00 00       	mov    $0x0,%ebx
 550:	eb 14                	jmp    566 <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 552:	89 fa                	mov    %edi,%edx
 554:	8b 45 08             	mov    0x8(%ebp),%eax
 557:	e8 36 ff ff ff       	call   492 <putc>
 55c:	eb 05                	jmp    563 <printf+0x2c>
      }
    } else if(state == '%'){
 55e:	83 fe 25             	cmp    $0x25,%esi
 561:	74 25                	je     588 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 563:	83 c3 01             	add    $0x1,%ebx
 566:	8b 45 0c             	mov    0xc(%ebp),%eax
 569:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 56d:	84 c0                	test   %al,%al
 56f:	0f 84 20 01 00 00    	je     695 <printf+0x15e>
    c = fmt[i] & 0xff;
 575:	0f be f8             	movsbl %al,%edi
 578:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 57b:	85 f6                	test   %esi,%esi
 57d:	75 df                	jne    55e <printf+0x27>
      if(c == '%'){
 57f:	83 f8 25             	cmp    $0x25,%eax
 582:	75 ce                	jne    552 <printf+0x1b>
        state = '%';
 584:	89 c6                	mov    %eax,%esi
 586:	eb db                	jmp    563 <printf+0x2c>
      if(c == 'd'){
 588:	83 f8 25             	cmp    $0x25,%eax
 58b:	0f 84 cf 00 00 00    	je     660 <printf+0x129>
 591:	0f 8c dd 00 00 00    	jl     674 <printf+0x13d>
 597:	83 f8 78             	cmp    $0x78,%eax
 59a:	0f 8f d4 00 00 00    	jg     674 <printf+0x13d>
 5a0:	83 f8 63             	cmp    $0x63,%eax
 5a3:	0f 8c cb 00 00 00    	jl     674 <printf+0x13d>
 5a9:	83 e8 63             	sub    $0x63,%eax
 5ac:	83 f8 15             	cmp    $0x15,%eax
 5af:	0f 87 bf 00 00 00    	ja     674 <printf+0x13d>
 5b5:	ff 24 85 54 08 00 00 	jmp    *0x854(,%eax,4)
        printint(fd, *ap, 10, 1);
 5bc:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5bf:	8b 17                	mov    (%edi),%edx
 5c1:	83 ec 0c             	sub    $0xc,%esp
 5c4:	6a 01                	push   $0x1
 5c6:	b9 0a 00 00 00       	mov    $0xa,%ecx
 5cb:	8b 45 08             	mov    0x8(%ebp),%eax
 5ce:	e8 d9 fe ff ff       	call   4ac <printint>
        ap++;
 5d3:	83 c7 04             	add    $0x4,%edi
 5d6:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 5d9:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 5dc:	be 00 00 00 00       	mov    $0x0,%esi
 5e1:	eb 80                	jmp    563 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 5e3:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5e6:	8b 17                	mov    (%edi),%edx
 5e8:	83 ec 0c             	sub    $0xc,%esp
 5eb:	6a 00                	push   $0x0
 5ed:	b9 10 00 00 00       	mov    $0x10,%ecx
 5f2:	8b 45 08             	mov    0x8(%ebp),%eax
 5f5:	e8 b2 fe ff ff       	call   4ac <printint>
        ap++;
 5fa:	83 c7 04             	add    $0x4,%edi
 5fd:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 600:	83 c4 10             	add    $0x10,%esp
      state = 0;
 603:	be 00 00 00 00       	mov    $0x0,%esi
 608:	e9 56 ff ff ff       	jmp    563 <printf+0x2c>
        s = (char*)*ap;
 60d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 610:	8b 30                	mov    (%eax),%esi
        ap++;
 612:	83 c0 04             	add    $0x4,%eax
 615:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 618:	85 f6                	test   %esi,%esi
 61a:	75 15                	jne    631 <printf+0xfa>
          s = "(null)";
 61c:	be 4a 08 00 00       	mov    $0x84a,%esi
 621:	eb 0e                	jmp    631 <printf+0xfa>
          putc(fd, *s);
 623:	0f be d2             	movsbl %dl,%edx
 626:	8b 45 08             	mov    0x8(%ebp),%eax
 629:	e8 64 fe ff ff       	call   492 <putc>
          s++;
 62e:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 631:	0f b6 16             	movzbl (%esi),%edx
 634:	84 d2                	test   %dl,%dl
 636:	75 eb                	jne    623 <printf+0xec>
      state = 0;
 638:	be 00 00 00 00       	mov    $0x0,%esi
 63d:	e9 21 ff ff ff       	jmp    563 <printf+0x2c>
        putc(fd, *ap);
 642:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 645:	0f be 17             	movsbl (%edi),%edx
 648:	8b 45 08             	mov    0x8(%ebp),%eax
 64b:	e8 42 fe ff ff       	call   492 <putc>
        ap++;
 650:	83 c7 04             	add    $0x4,%edi
 653:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 656:	be 00 00 00 00       	mov    $0x0,%esi
 65b:	e9 03 ff ff ff       	jmp    563 <printf+0x2c>
        putc(fd, c);
 660:	89 fa                	mov    %edi,%edx
 662:	8b 45 08             	mov    0x8(%ebp),%eax
 665:	e8 28 fe ff ff       	call   492 <putc>
      state = 0;
 66a:	be 00 00 00 00       	mov    $0x0,%esi
 66f:	e9 ef fe ff ff       	jmp    563 <printf+0x2c>
        putc(fd, '%');
 674:	ba 25 00 00 00       	mov    $0x25,%edx
 679:	8b 45 08             	mov    0x8(%ebp),%eax
 67c:	e8 11 fe ff ff       	call   492 <putc>
        putc(fd, c);
 681:	89 fa                	mov    %edi,%edx
 683:	8b 45 08             	mov    0x8(%ebp),%eax
 686:	e8 07 fe ff ff       	call   492 <putc>
      state = 0;
 68b:	be 00 00 00 00       	mov    $0x0,%esi
 690:	e9 ce fe ff ff       	jmp    563 <printf+0x2c>
    }
  }
}
 695:	8d 65 f4             	lea    -0xc(%ebp),%esp
 698:	5b                   	pop    %ebx
 699:	5e                   	pop    %esi
 69a:	5f                   	pop    %edi
 69b:	5d                   	pop    %ebp
 69c:	c3                   	ret    

0000069d <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 69d:	55                   	push   %ebp
 69e:	89 e5                	mov    %esp,%ebp
 6a0:	57                   	push   %edi
 6a1:	56                   	push   %esi
 6a2:	53                   	push   %ebx
 6a3:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 6a6:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6a9:	a1 40 0d 00 00       	mov    0xd40,%eax
 6ae:	eb 02                	jmp    6b2 <free+0x15>
 6b0:	89 d0                	mov    %edx,%eax
 6b2:	39 c8                	cmp    %ecx,%eax
 6b4:	73 04                	jae    6ba <free+0x1d>
 6b6:	39 08                	cmp    %ecx,(%eax)
 6b8:	77 12                	ja     6cc <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6ba:	8b 10                	mov    (%eax),%edx
 6bc:	39 c2                	cmp    %eax,%edx
 6be:	77 f0                	ja     6b0 <free+0x13>
 6c0:	39 c8                	cmp    %ecx,%eax
 6c2:	72 08                	jb     6cc <free+0x2f>
 6c4:	39 ca                	cmp    %ecx,%edx
 6c6:	77 04                	ja     6cc <free+0x2f>
 6c8:	89 d0                	mov    %edx,%eax
 6ca:	eb e6                	jmp    6b2 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 6cc:	8b 73 fc             	mov    -0x4(%ebx),%esi
 6cf:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 6d2:	8b 10                	mov    (%eax),%edx
 6d4:	39 d7                	cmp    %edx,%edi
 6d6:	74 19                	je     6f1 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 6d8:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 6db:	8b 50 04             	mov    0x4(%eax),%edx
 6de:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 6e1:	39 ce                	cmp    %ecx,%esi
 6e3:	74 1b                	je     700 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 6e5:	89 08                	mov    %ecx,(%eax)
  freep = p;
 6e7:	a3 40 0d 00 00       	mov    %eax,0xd40
}
 6ec:	5b                   	pop    %ebx
 6ed:	5e                   	pop    %esi
 6ee:	5f                   	pop    %edi
 6ef:	5d                   	pop    %ebp
 6f0:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 6f1:	03 72 04             	add    0x4(%edx),%esi
 6f4:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 6f7:	8b 10                	mov    (%eax),%edx
 6f9:	8b 12                	mov    (%edx),%edx
 6fb:	89 53 f8             	mov    %edx,-0x8(%ebx)
 6fe:	eb db                	jmp    6db <free+0x3e>
    p->s.size += bp->s.size;
 700:	03 53 fc             	add    -0x4(%ebx),%edx
 703:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 706:	8b 53 f8             	mov    -0x8(%ebx),%edx
 709:	89 10                	mov    %edx,(%eax)
 70b:	eb da                	jmp    6e7 <free+0x4a>

0000070d <morecore>:

static Header*
morecore(uint nu)
{
 70d:	55                   	push   %ebp
 70e:	89 e5                	mov    %esp,%ebp
 710:	53                   	push   %ebx
 711:	83 ec 04             	sub    $0x4,%esp
 714:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 716:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 71b:	77 05                	ja     722 <morecore+0x15>
    nu = 4096;
 71d:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 722:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 729:	83 ec 0c             	sub    $0xc,%esp
 72c:	50                   	push   %eax
 72d:	e8 38 fd ff ff       	call   46a <sbrk>
  if(p == (char*)-1)
 732:	83 c4 10             	add    $0x10,%esp
 735:	83 f8 ff             	cmp    $0xffffffff,%eax
 738:	74 1c                	je     756 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 73a:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 73d:	83 c0 08             	add    $0x8,%eax
 740:	83 ec 0c             	sub    $0xc,%esp
 743:	50                   	push   %eax
 744:	e8 54 ff ff ff       	call   69d <free>
  return freep;
 749:	a1 40 0d 00 00       	mov    0xd40,%eax
 74e:	83 c4 10             	add    $0x10,%esp
}
 751:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 754:	c9                   	leave  
 755:	c3                   	ret    
    return 0;
 756:	b8 00 00 00 00       	mov    $0x0,%eax
 75b:	eb f4                	jmp    751 <morecore+0x44>

0000075d <malloc>:

void*
malloc(uint nbytes)
{
 75d:	55                   	push   %ebp
 75e:	89 e5                	mov    %esp,%ebp
 760:	53                   	push   %ebx
 761:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 764:	8b 45 08             	mov    0x8(%ebp),%eax
 767:	8d 58 07             	lea    0x7(%eax),%ebx
 76a:	c1 eb 03             	shr    $0x3,%ebx
 76d:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 770:	8b 0d 40 0d 00 00    	mov    0xd40,%ecx
 776:	85 c9                	test   %ecx,%ecx
 778:	74 04                	je     77e <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 77a:	8b 01                	mov    (%ecx),%eax
 77c:	eb 4a                	jmp    7c8 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 77e:	c7 05 40 0d 00 00 44 	movl   $0xd44,0xd40
 785:	0d 00 00 
 788:	c7 05 44 0d 00 00 44 	movl   $0xd44,0xd44
 78f:	0d 00 00 
    base.s.size = 0;
 792:	c7 05 48 0d 00 00 00 	movl   $0x0,0xd48
 799:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 79c:	b9 44 0d 00 00       	mov    $0xd44,%ecx
 7a1:	eb d7                	jmp    77a <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 7a3:	74 19                	je     7be <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 7a5:	29 da                	sub    %ebx,%edx
 7a7:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 7aa:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 7ad:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 7b0:	89 0d 40 0d 00 00    	mov    %ecx,0xd40
      return (void*)(p + 1);
 7b6:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 7b9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 7bc:	c9                   	leave  
 7bd:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 7be:	8b 10                	mov    (%eax),%edx
 7c0:	89 11                	mov    %edx,(%ecx)
 7c2:	eb ec                	jmp    7b0 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7c4:	89 c1                	mov    %eax,%ecx
 7c6:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 7c8:	8b 50 04             	mov    0x4(%eax),%edx
 7cb:	39 da                	cmp    %ebx,%edx
 7cd:	73 d4                	jae    7a3 <malloc+0x46>
    if(p == freep)
 7cf:	39 05 40 0d 00 00    	cmp    %eax,0xd40
 7d5:	75 ed                	jne    7c4 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 7d7:	89 d8                	mov    %ebx,%eax
 7d9:	e8 2f ff ff ff       	call   70d <morecore>
 7de:	85 c0                	test   %eax,%eax
 7e0:	75 e2                	jne    7c4 <malloc+0x67>
 7e2:	eb d5                	jmp    7b9 <malloc+0x5c>
