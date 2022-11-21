
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
  11:	e8 44 04 00 00       	call   45a <getpid>
  16:	a3 20 0c 00 00       	mov    %eax,0xc20

   int fork_pid = fork();
  1b:	e8 b2 03 00 00       	call   3d2 <fork>
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
  2d:	e8 50 04 00 00       	call   482 <join>
   assert(join_pid == -1);
  32:	83 c4 10             	add    $0x10,%esp
  35:	83 f8 ff             	cmp    $0xffffffff,%eax
  38:	0f 84 97 00 00 00    	je     d5 <main+0xd5>
  3e:	6a 22                	push   $0x22
  40:	68 dc 07 00 00       	push   $0x7dc
  45:	68 e5 07 00 00       	push   $0x7e5
  4a:	6a 01                	push   $0x1
  4c:	e8 de 04 00 00       	call   52f <printf>
  51:	83 c4 0c             	add    $0xc,%esp
  54:	68 1b 08 00 00       	push   $0x81b
  59:	68 fa 07 00 00       	push   $0x7fa
  5e:	6a 01                	push   $0x1
  60:	e8 ca 04 00 00       	call   52f <printf>
  65:	83 c4 08             	add    $0x8,%esp
  68:	68 0e 08 00 00       	push   $0x80e
  6d:	6a 01                	push   $0x1
  6f:	e8 bb 04 00 00       	call   52f <printf>
  74:	83 c4 04             	add    $0x4,%esp
  77:	ff 35 20 0c 00 00    	push   0xc20
  7d:	e8 88 03 00 00       	call   40a <kill>
  82:	e8 53 03 00 00       	call   3da <exit>
     exit();
  87:	e8 4e 03 00 00       	call   3da <exit>
   assert(fork_pid > 0);
  8c:	6a 1e                	push   $0x1e
  8e:	68 dc 07 00 00       	push   $0x7dc
  93:	68 e5 07 00 00       	push   $0x7e5
  98:	6a 01                	push   $0x1
  9a:	e8 90 04 00 00       	call   52f <printf>
  9f:	83 c4 0c             	add    $0xc,%esp
  a2:	68 ed 07 00 00       	push   $0x7ed
  a7:	68 fa 07 00 00       	push   $0x7fa
  ac:	6a 01                	push   $0x1
  ae:	e8 7c 04 00 00       	call   52f <printf>
  b3:	83 c4 08             	add    $0x8,%esp
  b6:	68 0e 08 00 00       	push   $0x80e
  bb:	6a 01                	push   $0x1
  bd:	e8 6d 04 00 00       	call   52f <printf>
  c2:	83 c4 04             	add    $0x4,%esp
  c5:	ff 35 20 0c 00 00    	push   0xc20
  cb:	e8 3a 03 00 00       	call   40a <kill>
  d0:	e8 05 03 00 00       	call   3da <exit>

   assert(wait() > 0);
  d5:	e8 08 03 00 00       	call   3e2 <wait>
  da:	85 c0                	test   %eax,%eax
  dc:	7e 14                	jle    f2 <main+0xf2>
   printf(1, "TEST PASSED\n");
  de:	83 ec 08             	sub    $0x8,%esp
  e1:	68 35 08 00 00       	push   $0x835
  e6:	6a 01                	push   $0x1
  e8:	e8 42 04 00 00       	call   52f <printf>
   exit();
  ed:	e8 e8 02 00 00       	call   3da <exit>
   assert(wait() > 0);
  f2:	6a 24                	push   $0x24
  f4:	68 dc 07 00 00       	push   $0x7dc
  f9:	68 e5 07 00 00       	push   $0x7e5
  fe:	6a 01                	push   $0x1
 100:	e8 2a 04 00 00       	call   52f <printf>
 105:	83 c4 0c             	add    $0xc,%esp
 108:	68 2a 08 00 00       	push   $0x82a
 10d:	68 fa 07 00 00       	push   $0x7fa
 112:	6a 01                	push   $0x1
 114:	e8 16 04 00 00       	call   52f <printf>
 119:	83 c4 08             	add    $0x8,%esp
 11c:	68 0e 08 00 00       	push   $0x80e
 121:	6a 01                	push   $0x1
 123:	e8 07 04 00 00       	call   52f <printf>
 128:	83 c4 04             	add    $0x4,%esp
 12b:	ff 35 20 0c 00 00    	push   0xc20
 131:	e8 d4 02 00 00       	call   40a <kill>
 136:	e8 9f 02 00 00       	call   3da <exit>

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
 14f:	53                   	push   %ebx
 150:	83 ec 10             	sub    $0x10,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE*2);
 153:	68 00 20 00 00       	push   $0x2000
 158:	e8 f8 05 00 00       	call   755 <malloc>
  if(n_stack == 0){
 15d:	83 c4 10             	add    $0x10,%esp
 160:	85 c0                	test   %eax,%eax
 162:	74 41                	je     1a5 <thread_create+0x59>
 164:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  int new_pid = clone(start_routine, arg1, arg2, n_stack);
 166:	50                   	push   %eax
 167:	ff 75 10             	push   0x10(%ebp)
 16a:	ff 75 0c             	push   0xc(%ebp)
 16d:	ff 75 08             	push   0x8(%ebp)
 170:	e8 05 03 00 00       	call   47a <clone>

  for(int i=0; i<64; i++){
 175:	83 c4 10             	add    $0x10,%esp
 178:	ba 00 00 00 00       	mov    $0x0,%edx
 17d:	eb 03                	jmp    182 <thread_create+0x36>
 17f:	83 c2 01             	add    $0x1,%edx
 182:	83 fa 3f             	cmp    $0x3f,%edx
 185:	7f 19                	jg     1a0 <thread_create+0x54>
    if(threads[i]->flag==0){
 187:	8b 0c 95 40 0c 00 00 	mov    0xc40(,%edx,4),%ecx
 18e:	83 79 08 00          	cmpl   $0x0,0x8(%ecx)
 192:	75 eb                	jne    17f <thread_create+0x33>
      threads[i]->maddr = n_stack;
 194:	89 19                	mov    %ebx,(%ecx)
      threads[i]->pg1addr = n_stack;
 196:	8b 14 95 40 0c 00 00 	mov    0xc40(,%edx,4),%edx
 19d:	89 5a 04             	mov    %ebx,0x4(%edx)
      break;
    }
  }

  return new_pid;
}
 1a0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1a3:	c9                   	leave  
 1a4:	c3                   	ret    
    return -1;
 1a5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 1aa:	eb f4                	jmp    1a0 <thread_create+0x54>

000001ac <thread_join>:

//TODO: fix
int thread_join() {
 1ac:	55                   	push   %ebp
 1ad:	89 e5                	mov    %esp,%ebp
 1af:	56                   	push   %esi
 1b0:	53                   	push   %ebx
 1b1:	83 ec 1c             	sub    $0x1c,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 1b4:	8d 45 f4             	lea    -0xc(%ebp),%eax
 1b7:	50                   	push   %eax
 1b8:	e8 c5 02 00 00       	call   482 <join>
 1bd:	89 c6                	mov    %eax,%esi
  for(int i=0; i<64; i++){
 1bf:	83 c4 10             	add    $0x10,%esp
 1c2:	bb 00 00 00 00       	mov    $0x0,%ebx
 1c7:	eb 03                	jmp    1cc <thread_join+0x20>
 1c9:	83 c3 01             	add    $0x1,%ebx
 1cc:	83 fb 3f             	cmp    $0x3f,%ebx
 1cf:	7f 23                	jg     1f4 <thread_join+0x48>
    if((threads[i]->flag==1) && (stk_addr == threads[i]->pg1addr)){
 1d1:	8b 04 9d 40 0c 00 00 	mov    0xc40(,%ebx,4),%eax
 1d8:	83 78 08 01          	cmpl   $0x1,0x8(%eax)
 1dc:	75 eb                	jne    1c9 <thread_join+0x1d>
 1de:	8b 55 f4             	mov    -0xc(%ebp),%edx
 1e1:	39 50 04             	cmp    %edx,0x4(%eax)
 1e4:	75 e3                	jne    1c9 <thread_join+0x1d>
      free(stk_addr);
 1e6:	83 ec 0c             	sub    $0xc,%esp
 1e9:	52                   	push   %edx
 1ea:	e8 a6 04 00 00       	call   695 <free>
 1ef:	83 c4 10             	add    $0x10,%esp
 1f2:	eb d5                	jmp    1c9 <thread_join+0x1d>
    }
  }
  return pid;
}
 1f4:	89 f0                	mov    %esi,%eax
 1f6:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1f9:	5b                   	pop    %ebx
 1fa:	5e                   	pop    %esi
 1fb:	5d                   	pop    %ebp
 1fc:	c3                   	ret    

000001fd <lock_acquire>:

void lock_acquire(lock_t *lock){
 1fd:	55                   	push   %ebp
 1fe:	89 e5                	mov    %esp,%ebp
 200:	53                   	push   %ebx
 201:	83 ec 04             	sub    $0x4,%esp
 204:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 207:	83 ec 08             	sub    $0x8,%esp
 20a:	6a 01                	push   $0x1
 20c:	53                   	push   %ebx
 20d:	e8 29 ff ff ff       	call   13b <test_and_set>
 212:	83 c4 10             	add    $0x10,%esp
 215:	83 f8 01             	cmp    $0x1,%eax
 218:	74 ed                	je     207 <lock_acquire+0xa>
    ;
}
 21a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 21d:	c9                   	leave  
 21e:	c3                   	ret    

0000021f <lock_release>:

void lock_release(lock_t *lock) {
 21f:	55                   	push   %ebp
 220:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 222:	8b 45 08             	mov    0x8(%ebp),%eax
 225:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 22b:	5d                   	pop    %ebp
 22c:	c3                   	ret    

0000022d <lock_init>:

void lock_init(lock_t *lock) {
 22d:	55                   	push   %ebp
 22e:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 230:	8b 45 08             	mov    0x8(%ebp),%eax
 233:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 239:	5d                   	pop    %ebp
 23a:	c3                   	ret    

0000023b <strcpy>:

char*
strcpy(char *s, const char *t)
{
 23b:	55                   	push   %ebp
 23c:	89 e5                	mov    %esp,%ebp
 23e:	56                   	push   %esi
 23f:	53                   	push   %ebx
 240:	8b 75 08             	mov    0x8(%ebp),%esi
 243:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 246:	89 f0                	mov    %esi,%eax
 248:	89 d1                	mov    %edx,%ecx
 24a:	83 c2 01             	add    $0x1,%edx
 24d:	89 c3                	mov    %eax,%ebx
 24f:	83 c0 01             	add    $0x1,%eax
 252:	0f b6 09             	movzbl (%ecx),%ecx
 255:	88 0b                	mov    %cl,(%ebx)
 257:	84 c9                	test   %cl,%cl
 259:	75 ed                	jne    248 <strcpy+0xd>
    ;
  return os;
}
 25b:	89 f0                	mov    %esi,%eax
 25d:	5b                   	pop    %ebx
 25e:	5e                   	pop    %esi
 25f:	5d                   	pop    %ebp
 260:	c3                   	ret    

00000261 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 261:	55                   	push   %ebp
 262:	89 e5                	mov    %esp,%ebp
 264:	8b 4d 08             	mov    0x8(%ebp),%ecx
 267:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 26a:	eb 06                	jmp    272 <strcmp+0x11>
    p++, q++;
 26c:	83 c1 01             	add    $0x1,%ecx
 26f:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 272:	0f b6 01             	movzbl (%ecx),%eax
 275:	84 c0                	test   %al,%al
 277:	74 04                	je     27d <strcmp+0x1c>
 279:	3a 02                	cmp    (%edx),%al
 27b:	74 ef                	je     26c <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 27d:	0f b6 c0             	movzbl %al,%eax
 280:	0f b6 12             	movzbl (%edx),%edx
 283:	29 d0                	sub    %edx,%eax
}
 285:	5d                   	pop    %ebp
 286:	c3                   	ret    

00000287 <strlen>:

uint
strlen(const char *s)
{
 287:	55                   	push   %ebp
 288:	89 e5                	mov    %esp,%ebp
 28a:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 28d:	b8 00 00 00 00       	mov    $0x0,%eax
 292:	eb 03                	jmp    297 <strlen+0x10>
 294:	83 c0 01             	add    $0x1,%eax
 297:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 29b:	75 f7                	jne    294 <strlen+0xd>
    ;
  return n;
}
 29d:	5d                   	pop    %ebp
 29e:	c3                   	ret    

0000029f <memset>:

void*
memset(void *dst, int c, uint n)
{
 29f:	55                   	push   %ebp
 2a0:	89 e5                	mov    %esp,%ebp
 2a2:	57                   	push   %edi
 2a3:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 2a6:	89 d7                	mov    %edx,%edi
 2a8:	8b 4d 10             	mov    0x10(%ebp),%ecx
 2ab:	8b 45 0c             	mov    0xc(%ebp),%eax
 2ae:	fc                   	cld    
 2af:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 2b1:	89 d0                	mov    %edx,%eax
 2b3:	8b 7d fc             	mov    -0x4(%ebp),%edi
 2b6:	c9                   	leave  
 2b7:	c3                   	ret    

000002b8 <strchr>:

char*
strchr(const char *s, char c)
{
 2b8:	55                   	push   %ebp
 2b9:	89 e5                	mov    %esp,%ebp
 2bb:	8b 45 08             	mov    0x8(%ebp),%eax
 2be:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 2c2:	eb 03                	jmp    2c7 <strchr+0xf>
 2c4:	83 c0 01             	add    $0x1,%eax
 2c7:	0f b6 10             	movzbl (%eax),%edx
 2ca:	84 d2                	test   %dl,%dl
 2cc:	74 06                	je     2d4 <strchr+0x1c>
    if(*s == c)
 2ce:	38 ca                	cmp    %cl,%dl
 2d0:	75 f2                	jne    2c4 <strchr+0xc>
 2d2:	eb 05                	jmp    2d9 <strchr+0x21>
      return (char*)s;
  return 0;
 2d4:	b8 00 00 00 00       	mov    $0x0,%eax
}
 2d9:	5d                   	pop    %ebp
 2da:	c3                   	ret    

000002db <gets>:

char*
gets(char *buf, int max)
{
 2db:	55                   	push   %ebp
 2dc:	89 e5                	mov    %esp,%ebp
 2de:	57                   	push   %edi
 2df:	56                   	push   %esi
 2e0:	53                   	push   %ebx
 2e1:	83 ec 1c             	sub    $0x1c,%esp
 2e4:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2e7:	bb 00 00 00 00       	mov    $0x0,%ebx
 2ec:	89 de                	mov    %ebx,%esi
 2ee:	83 c3 01             	add    $0x1,%ebx
 2f1:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2f4:	7d 2e                	jge    324 <gets+0x49>
    cc = read(0, &c, 1);
 2f6:	83 ec 04             	sub    $0x4,%esp
 2f9:	6a 01                	push   $0x1
 2fb:	8d 45 e7             	lea    -0x19(%ebp),%eax
 2fe:	50                   	push   %eax
 2ff:	6a 00                	push   $0x0
 301:	e8 ec 00 00 00       	call   3f2 <read>
    if(cc < 1)
 306:	83 c4 10             	add    $0x10,%esp
 309:	85 c0                	test   %eax,%eax
 30b:	7e 17                	jle    324 <gets+0x49>
      break;
    buf[i++] = c;
 30d:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 311:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 314:	3c 0a                	cmp    $0xa,%al
 316:	0f 94 c2             	sete   %dl
 319:	3c 0d                	cmp    $0xd,%al
 31b:	0f 94 c0             	sete   %al
 31e:	08 c2                	or     %al,%dl
 320:	74 ca                	je     2ec <gets+0x11>
    buf[i++] = c;
 322:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 324:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 328:	89 f8                	mov    %edi,%eax
 32a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 32d:	5b                   	pop    %ebx
 32e:	5e                   	pop    %esi
 32f:	5f                   	pop    %edi
 330:	5d                   	pop    %ebp
 331:	c3                   	ret    

00000332 <stat>:

int
stat(const char *n, struct stat *st)
{
 332:	55                   	push   %ebp
 333:	89 e5                	mov    %esp,%ebp
 335:	56                   	push   %esi
 336:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 337:	83 ec 08             	sub    $0x8,%esp
 33a:	6a 00                	push   $0x0
 33c:	ff 75 08             	push   0x8(%ebp)
 33f:	e8 d6 00 00 00       	call   41a <open>
  if(fd < 0)
 344:	83 c4 10             	add    $0x10,%esp
 347:	85 c0                	test   %eax,%eax
 349:	78 24                	js     36f <stat+0x3d>
 34b:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 34d:	83 ec 08             	sub    $0x8,%esp
 350:	ff 75 0c             	push   0xc(%ebp)
 353:	50                   	push   %eax
 354:	e8 d9 00 00 00       	call   432 <fstat>
 359:	89 c6                	mov    %eax,%esi
  close(fd);
 35b:	89 1c 24             	mov    %ebx,(%esp)
 35e:	e8 9f 00 00 00       	call   402 <close>
  return r;
 363:	83 c4 10             	add    $0x10,%esp
}
 366:	89 f0                	mov    %esi,%eax
 368:	8d 65 f8             	lea    -0x8(%ebp),%esp
 36b:	5b                   	pop    %ebx
 36c:	5e                   	pop    %esi
 36d:	5d                   	pop    %ebp
 36e:	c3                   	ret    
    return -1;
 36f:	be ff ff ff ff       	mov    $0xffffffff,%esi
 374:	eb f0                	jmp    366 <stat+0x34>

00000376 <atoi>:

int
atoi(const char *s)
{
 376:	55                   	push   %ebp
 377:	89 e5                	mov    %esp,%ebp
 379:	53                   	push   %ebx
 37a:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 37d:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 382:	eb 10                	jmp    394 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 384:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 387:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 38a:	83 c1 01             	add    $0x1,%ecx
 38d:	0f be c0             	movsbl %al,%eax
 390:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 394:	0f b6 01             	movzbl (%ecx),%eax
 397:	8d 58 d0             	lea    -0x30(%eax),%ebx
 39a:	80 fb 09             	cmp    $0x9,%bl
 39d:	76 e5                	jbe    384 <atoi+0xe>
  return n;
}
 39f:	89 d0                	mov    %edx,%eax
 3a1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3a4:	c9                   	leave  
 3a5:	c3                   	ret    

000003a6 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3a6:	55                   	push   %ebp
 3a7:	89 e5                	mov    %esp,%ebp
 3a9:	56                   	push   %esi
 3aa:	53                   	push   %ebx
 3ab:	8b 75 08             	mov    0x8(%ebp),%esi
 3ae:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 3b1:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 3b4:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 3b6:	eb 0d                	jmp    3c5 <memmove+0x1f>
    *dst++ = *src++;
 3b8:	0f b6 01             	movzbl (%ecx),%eax
 3bb:	88 02                	mov    %al,(%edx)
 3bd:	8d 49 01             	lea    0x1(%ecx),%ecx
 3c0:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 3c3:	89 d8                	mov    %ebx,%eax
 3c5:	8d 58 ff             	lea    -0x1(%eax),%ebx
 3c8:	85 c0                	test   %eax,%eax
 3ca:	7f ec                	jg     3b8 <memmove+0x12>
  return vdst;
}
 3cc:	89 f0                	mov    %esi,%eax
 3ce:	5b                   	pop    %ebx
 3cf:	5e                   	pop    %esi
 3d0:	5d                   	pop    %ebp
 3d1:	c3                   	ret    

000003d2 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3d2:	b8 01 00 00 00       	mov    $0x1,%eax
 3d7:	cd 40                	int    $0x40
 3d9:	c3                   	ret    

000003da <exit>:
SYSCALL(exit)
 3da:	b8 02 00 00 00       	mov    $0x2,%eax
 3df:	cd 40                	int    $0x40
 3e1:	c3                   	ret    

000003e2 <wait>:
SYSCALL(wait)
 3e2:	b8 03 00 00 00       	mov    $0x3,%eax
 3e7:	cd 40                	int    $0x40
 3e9:	c3                   	ret    

000003ea <pipe>:
SYSCALL(pipe)
 3ea:	b8 04 00 00 00       	mov    $0x4,%eax
 3ef:	cd 40                	int    $0x40
 3f1:	c3                   	ret    

000003f2 <read>:
SYSCALL(read)
 3f2:	b8 05 00 00 00       	mov    $0x5,%eax
 3f7:	cd 40                	int    $0x40
 3f9:	c3                   	ret    

000003fa <write>:
SYSCALL(write)
 3fa:	b8 10 00 00 00       	mov    $0x10,%eax
 3ff:	cd 40                	int    $0x40
 401:	c3                   	ret    

00000402 <close>:
SYSCALL(close)
 402:	b8 15 00 00 00       	mov    $0x15,%eax
 407:	cd 40                	int    $0x40
 409:	c3                   	ret    

0000040a <kill>:
SYSCALL(kill)
 40a:	b8 06 00 00 00       	mov    $0x6,%eax
 40f:	cd 40                	int    $0x40
 411:	c3                   	ret    

00000412 <exec>:
SYSCALL(exec)
 412:	b8 07 00 00 00       	mov    $0x7,%eax
 417:	cd 40                	int    $0x40
 419:	c3                   	ret    

0000041a <open>:
SYSCALL(open)
 41a:	b8 0f 00 00 00       	mov    $0xf,%eax
 41f:	cd 40                	int    $0x40
 421:	c3                   	ret    

00000422 <mknod>:
SYSCALL(mknod)
 422:	b8 11 00 00 00       	mov    $0x11,%eax
 427:	cd 40                	int    $0x40
 429:	c3                   	ret    

0000042a <unlink>:
SYSCALL(unlink)
 42a:	b8 12 00 00 00       	mov    $0x12,%eax
 42f:	cd 40                	int    $0x40
 431:	c3                   	ret    

00000432 <fstat>:
SYSCALL(fstat)
 432:	b8 08 00 00 00       	mov    $0x8,%eax
 437:	cd 40                	int    $0x40
 439:	c3                   	ret    

0000043a <link>:
SYSCALL(link)
 43a:	b8 13 00 00 00       	mov    $0x13,%eax
 43f:	cd 40                	int    $0x40
 441:	c3                   	ret    

00000442 <mkdir>:
SYSCALL(mkdir)
 442:	b8 14 00 00 00       	mov    $0x14,%eax
 447:	cd 40                	int    $0x40
 449:	c3                   	ret    

0000044a <chdir>:
SYSCALL(chdir)
 44a:	b8 09 00 00 00       	mov    $0x9,%eax
 44f:	cd 40                	int    $0x40
 451:	c3                   	ret    

00000452 <dup>:
SYSCALL(dup)
 452:	b8 0a 00 00 00       	mov    $0xa,%eax
 457:	cd 40                	int    $0x40
 459:	c3                   	ret    

0000045a <getpid>:
SYSCALL(getpid)
 45a:	b8 0b 00 00 00       	mov    $0xb,%eax
 45f:	cd 40                	int    $0x40
 461:	c3                   	ret    

00000462 <sbrk>:
SYSCALL(sbrk)
 462:	b8 0c 00 00 00       	mov    $0xc,%eax
 467:	cd 40                	int    $0x40
 469:	c3                   	ret    

0000046a <sleep>:
SYSCALL(sleep)
 46a:	b8 0d 00 00 00       	mov    $0xd,%eax
 46f:	cd 40                	int    $0x40
 471:	c3                   	ret    

00000472 <uptime>:
SYSCALL(uptime)
 472:	b8 0e 00 00 00       	mov    $0xe,%eax
 477:	cd 40                	int    $0x40
 479:	c3                   	ret    

0000047a <clone>:
SYSCALL(clone)
 47a:	b8 16 00 00 00       	mov    $0x16,%eax
 47f:	cd 40                	int    $0x40
 481:	c3                   	ret    

00000482 <join>:
 482:	b8 17 00 00 00       	mov    $0x17,%eax
 487:	cd 40                	int    $0x40
 489:	c3                   	ret    

0000048a <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 48a:	55                   	push   %ebp
 48b:	89 e5                	mov    %esp,%ebp
 48d:	83 ec 1c             	sub    $0x1c,%esp
 490:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 493:	6a 01                	push   $0x1
 495:	8d 55 f4             	lea    -0xc(%ebp),%edx
 498:	52                   	push   %edx
 499:	50                   	push   %eax
 49a:	e8 5b ff ff ff       	call   3fa <write>
}
 49f:	83 c4 10             	add    $0x10,%esp
 4a2:	c9                   	leave  
 4a3:	c3                   	ret    

000004a4 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 4a4:	55                   	push   %ebp
 4a5:	89 e5                	mov    %esp,%ebp
 4a7:	57                   	push   %edi
 4a8:	56                   	push   %esi
 4a9:	53                   	push   %ebx
 4aa:	83 ec 2c             	sub    $0x2c,%esp
 4ad:	89 45 d0             	mov    %eax,-0x30(%ebp)
 4b0:	89 d0                	mov    %edx,%eax
 4b2:	89 ce                	mov    %ecx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 4b4:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 4b8:	0f 95 c1             	setne  %cl
 4bb:	c1 ea 1f             	shr    $0x1f,%edx
 4be:	84 d1                	test   %dl,%cl
 4c0:	74 44                	je     506 <printint+0x62>
    neg = 1;
    x = -xx;
 4c2:	f7 d8                	neg    %eax
 4c4:	89 c1                	mov    %eax,%ecx
    neg = 1;
 4c6:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 4cd:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 4d2:	89 c8                	mov    %ecx,%eax
 4d4:	ba 00 00 00 00       	mov    $0x0,%edx
 4d9:	f7 f6                	div    %esi
 4db:	89 df                	mov    %ebx,%edi
 4dd:	83 c3 01             	add    $0x1,%ebx
 4e0:	0f b6 92 a4 08 00 00 	movzbl 0x8a4(%edx),%edx
 4e7:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 4eb:	89 ca                	mov    %ecx,%edx
 4ed:	89 c1                	mov    %eax,%ecx
 4ef:	39 d6                	cmp    %edx,%esi
 4f1:	76 df                	jbe    4d2 <printint+0x2e>
  if(neg)
 4f3:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 4f7:	74 31                	je     52a <printint+0x86>
    buf[i++] = '-';
 4f9:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 4fe:	8d 5f 02             	lea    0x2(%edi),%ebx
 501:	8b 75 d0             	mov    -0x30(%ebp),%esi
 504:	eb 17                	jmp    51d <printint+0x79>
    x = xx;
 506:	89 c1                	mov    %eax,%ecx
  neg = 0;
 508:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 50f:	eb bc                	jmp    4cd <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 511:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 516:	89 f0                	mov    %esi,%eax
 518:	e8 6d ff ff ff       	call   48a <putc>
  while(--i >= 0)
 51d:	83 eb 01             	sub    $0x1,%ebx
 520:	79 ef                	jns    511 <printint+0x6d>
}
 522:	83 c4 2c             	add    $0x2c,%esp
 525:	5b                   	pop    %ebx
 526:	5e                   	pop    %esi
 527:	5f                   	pop    %edi
 528:	5d                   	pop    %ebp
 529:	c3                   	ret    
 52a:	8b 75 d0             	mov    -0x30(%ebp),%esi
 52d:	eb ee                	jmp    51d <printint+0x79>

0000052f <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 52f:	55                   	push   %ebp
 530:	89 e5                	mov    %esp,%ebp
 532:	57                   	push   %edi
 533:	56                   	push   %esi
 534:	53                   	push   %ebx
 535:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 538:	8d 45 10             	lea    0x10(%ebp),%eax
 53b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 53e:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 543:	bb 00 00 00 00       	mov    $0x0,%ebx
 548:	eb 14                	jmp    55e <printf+0x2f>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 54a:	89 fa                	mov    %edi,%edx
 54c:	8b 45 08             	mov    0x8(%ebp),%eax
 54f:	e8 36 ff ff ff       	call   48a <putc>
 554:	eb 05                	jmp    55b <printf+0x2c>
      }
    } else if(state == '%'){
 556:	83 fe 25             	cmp    $0x25,%esi
 559:	74 25                	je     580 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 55b:	83 c3 01             	add    $0x1,%ebx
 55e:	8b 45 0c             	mov    0xc(%ebp),%eax
 561:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 565:	84 c0                	test   %al,%al
 567:	0f 84 20 01 00 00    	je     68d <printf+0x15e>
    c = fmt[i] & 0xff;
 56d:	0f be f8             	movsbl %al,%edi
 570:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 573:	85 f6                	test   %esi,%esi
 575:	75 df                	jne    556 <printf+0x27>
      if(c == '%'){
 577:	83 f8 25             	cmp    $0x25,%eax
 57a:	75 ce                	jne    54a <printf+0x1b>
        state = '%';
 57c:	89 c6                	mov    %eax,%esi
 57e:	eb db                	jmp    55b <printf+0x2c>
      if(c == 'd'){
 580:	83 f8 25             	cmp    $0x25,%eax
 583:	0f 84 cf 00 00 00    	je     658 <printf+0x129>
 589:	0f 8c dd 00 00 00    	jl     66c <printf+0x13d>
 58f:	83 f8 78             	cmp    $0x78,%eax
 592:	0f 8f d4 00 00 00    	jg     66c <printf+0x13d>
 598:	83 f8 63             	cmp    $0x63,%eax
 59b:	0f 8c cb 00 00 00    	jl     66c <printf+0x13d>
 5a1:	83 e8 63             	sub    $0x63,%eax
 5a4:	83 f8 15             	cmp    $0x15,%eax
 5a7:	0f 87 bf 00 00 00    	ja     66c <printf+0x13d>
 5ad:	ff 24 85 4c 08 00 00 	jmp    *0x84c(,%eax,4)
        printint(fd, *ap, 10, 1);
 5b4:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5b7:	8b 17                	mov    (%edi),%edx
 5b9:	83 ec 0c             	sub    $0xc,%esp
 5bc:	6a 01                	push   $0x1
 5be:	b9 0a 00 00 00       	mov    $0xa,%ecx
 5c3:	8b 45 08             	mov    0x8(%ebp),%eax
 5c6:	e8 d9 fe ff ff       	call   4a4 <printint>
        ap++;
 5cb:	83 c7 04             	add    $0x4,%edi
 5ce:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 5d1:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 5d4:	be 00 00 00 00       	mov    $0x0,%esi
 5d9:	eb 80                	jmp    55b <printf+0x2c>
        printint(fd, *ap, 16, 0);
 5db:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5de:	8b 17                	mov    (%edi),%edx
 5e0:	83 ec 0c             	sub    $0xc,%esp
 5e3:	6a 00                	push   $0x0
 5e5:	b9 10 00 00 00       	mov    $0x10,%ecx
 5ea:	8b 45 08             	mov    0x8(%ebp),%eax
 5ed:	e8 b2 fe ff ff       	call   4a4 <printint>
        ap++;
 5f2:	83 c7 04             	add    $0x4,%edi
 5f5:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 5f8:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5fb:	be 00 00 00 00       	mov    $0x0,%esi
 600:	e9 56 ff ff ff       	jmp    55b <printf+0x2c>
        s = (char*)*ap;
 605:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 608:	8b 30                	mov    (%eax),%esi
        ap++;
 60a:	83 c0 04             	add    $0x4,%eax
 60d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 610:	85 f6                	test   %esi,%esi
 612:	75 15                	jne    629 <printf+0xfa>
          s = "(null)";
 614:	be 42 08 00 00       	mov    $0x842,%esi
 619:	eb 0e                	jmp    629 <printf+0xfa>
          putc(fd, *s);
 61b:	0f be d2             	movsbl %dl,%edx
 61e:	8b 45 08             	mov    0x8(%ebp),%eax
 621:	e8 64 fe ff ff       	call   48a <putc>
          s++;
 626:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 629:	0f b6 16             	movzbl (%esi),%edx
 62c:	84 d2                	test   %dl,%dl
 62e:	75 eb                	jne    61b <printf+0xec>
      state = 0;
 630:	be 00 00 00 00       	mov    $0x0,%esi
 635:	e9 21 ff ff ff       	jmp    55b <printf+0x2c>
        putc(fd, *ap);
 63a:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 63d:	0f be 17             	movsbl (%edi),%edx
 640:	8b 45 08             	mov    0x8(%ebp),%eax
 643:	e8 42 fe ff ff       	call   48a <putc>
        ap++;
 648:	83 c7 04             	add    $0x4,%edi
 64b:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 64e:	be 00 00 00 00       	mov    $0x0,%esi
 653:	e9 03 ff ff ff       	jmp    55b <printf+0x2c>
        putc(fd, c);
 658:	89 fa                	mov    %edi,%edx
 65a:	8b 45 08             	mov    0x8(%ebp),%eax
 65d:	e8 28 fe ff ff       	call   48a <putc>
      state = 0;
 662:	be 00 00 00 00       	mov    $0x0,%esi
 667:	e9 ef fe ff ff       	jmp    55b <printf+0x2c>
        putc(fd, '%');
 66c:	ba 25 00 00 00       	mov    $0x25,%edx
 671:	8b 45 08             	mov    0x8(%ebp),%eax
 674:	e8 11 fe ff ff       	call   48a <putc>
        putc(fd, c);
 679:	89 fa                	mov    %edi,%edx
 67b:	8b 45 08             	mov    0x8(%ebp),%eax
 67e:	e8 07 fe ff ff       	call   48a <putc>
      state = 0;
 683:	be 00 00 00 00       	mov    $0x0,%esi
 688:	e9 ce fe ff ff       	jmp    55b <printf+0x2c>
    }
  }
}
 68d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 690:	5b                   	pop    %ebx
 691:	5e                   	pop    %esi
 692:	5f                   	pop    %edi
 693:	5d                   	pop    %ebp
 694:	c3                   	ret    

00000695 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 695:	55                   	push   %ebp
 696:	89 e5                	mov    %esp,%ebp
 698:	57                   	push   %edi
 699:	56                   	push   %esi
 69a:	53                   	push   %ebx
 69b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 69e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6a1:	a1 40 0d 00 00       	mov    0xd40,%eax
 6a6:	eb 02                	jmp    6aa <free+0x15>
 6a8:	89 d0                	mov    %edx,%eax
 6aa:	39 c8                	cmp    %ecx,%eax
 6ac:	73 04                	jae    6b2 <free+0x1d>
 6ae:	39 08                	cmp    %ecx,(%eax)
 6b0:	77 12                	ja     6c4 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6b2:	8b 10                	mov    (%eax),%edx
 6b4:	39 c2                	cmp    %eax,%edx
 6b6:	77 f0                	ja     6a8 <free+0x13>
 6b8:	39 c8                	cmp    %ecx,%eax
 6ba:	72 08                	jb     6c4 <free+0x2f>
 6bc:	39 ca                	cmp    %ecx,%edx
 6be:	77 04                	ja     6c4 <free+0x2f>
 6c0:	89 d0                	mov    %edx,%eax
 6c2:	eb e6                	jmp    6aa <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 6c4:	8b 73 fc             	mov    -0x4(%ebx),%esi
 6c7:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 6ca:	8b 10                	mov    (%eax),%edx
 6cc:	39 d7                	cmp    %edx,%edi
 6ce:	74 19                	je     6e9 <free+0x54>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 6d0:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 6d3:	8b 50 04             	mov    0x4(%eax),%edx
 6d6:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 6d9:	39 ce                	cmp    %ecx,%esi
 6db:	74 1b                	je     6f8 <free+0x63>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 6dd:	89 08                	mov    %ecx,(%eax)
  freep = p;
 6df:	a3 40 0d 00 00       	mov    %eax,0xd40
}
 6e4:	5b                   	pop    %ebx
 6e5:	5e                   	pop    %esi
 6e6:	5f                   	pop    %edi
 6e7:	5d                   	pop    %ebp
 6e8:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 6e9:	03 72 04             	add    0x4(%edx),%esi
 6ec:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 6ef:	8b 10                	mov    (%eax),%edx
 6f1:	8b 12                	mov    (%edx),%edx
 6f3:	89 53 f8             	mov    %edx,-0x8(%ebx)
 6f6:	eb db                	jmp    6d3 <free+0x3e>
    p->s.size += bp->s.size;
 6f8:	03 53 fc             	add    -0x4(%ebx),%edx
 6fb:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6fe:	8b 53 f8             	mov    -0x8(%ebx),%edx
 701:	89 10                	mov    %edx,(%eax)
 703:	eb da                	jmp    6df <free+0x4a>

00000705 <morecore>:

static Header*
morecore(uint nu)
{
 705:	55                   	push   %ebp
 706:	89 e5                	mov    %esp,%ebp
 708:	53                   	push   %ebx
 709:	83 ec 04             	sub    $0x4,%esp
 70c:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 70e:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 713:	77 05                	ja     71a <morecore+0x15>
    nu = 4096;
 715:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 71a:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 721:	83 ec 0c             	sub    $0xc,%esp
 724:	50                   	push   %eax
 725:	e8 38 fd ff ff       	call   462 <sbrk>
  if(p == (char*)-1)
 72a:	83 c4 10             	add    $0x10,%esp
 72d:	83 f8 ff             	cmp    $0xffffffff,%eax
 730:	74 1c                	je     74e <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 732:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 735:	83 c0 08             	add    $0x8,%eax
 738:	83 ec 0c             	sub    $0xc,%esp
 73b:	50                   	push   %eax
 73c:	e8 54 ff ff ff       	call   695 <free>
  return freep;
 741:	a1 40 0d 00 00       	mov    0xd40,%eax
 746:	83 c4 10             	add    $0x10,%esp
}
 749:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 74c:	c9                   	leave  
 74d:	c3                   	ret    
    return 0;
 74e:	b8 00 00 00 00       	mov    $0x0,%eax
 753:	eb f4                	jmp    749 <morecore+0x44>

00000755 <malloc>:

void*
malloc(uint nbytes)
{
 755:	55                   	push   %ebp
 756:	89 e5                	mov    %esp,%ebp
 758:	53                   	push   %ebx
 759:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 75c:	8b 45 08             	mov    0x8(%ebp),%eax
 75f:	8d 58 07             	lea    0x7(%eax),%ebx
 762:	c1 eb 03             	shr    $0x3,%ebx
 765:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 768:	8b 0d 40 0d 00 00    	mov    0xd40,%ecx
 76e:	85 c9                	test   %ecx,%ecx
 770:	74 04                	je     776 <malloc+0x21>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 772:	8b 01                	mov    (%ecx),%eax
 774:	eb 4a                	jmp    7c0 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 776:	c7 05 40 0d 00 00 44 	movl   $0xd44,0xd40
 77d:	0d 00 00 
 780:	c7 05 44 0d 00 00 44 	movl   $0xd44,0xd44
 787:	0d 00 00 
    base.s.size = 0;
 78a:	c7 05 48 0d 00 00 00 	movl   $0x0,0xd48
 791:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 794:	b9 44 0d 00 00       	mov    $0xd44,%ecx
 799:	eb d7                	jmp    772 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 79b:	74 19                	je     7b6 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 79d:	29 da                	sub    %ebx,%edx
 79f:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 7a2:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 7a5:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 7a8:	89 0d 40 0d 00 00    	mov    %ecx,0xd40
      return (void*)(p + 1);
 7ae:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 7b1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 7b4:	c9                   	leave  
 7b5:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 7b6:	8b 10                	mov    (%eax),%edx
 7b8:	89 11                	mov    %edx,(%ecx)
 7ba:	eb ec                	jmp    7a8 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7bc:	89 c1                	mov    %eax,%ecx
 7be:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 7c0:	8b 50 04             	mov    0x4(%eax),%edx
 7c3:	39 da                	cmp    %ebx,%edx
 7c5:	73 d4                	jae    79b <malloc+0x46>
    if(p == freep)
 7c7:	39 05 40 0d 00 00    	cmp    %eax,0xd40
 7cd:	75 ed                	jne    7bc <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 7cf:	89 d8                	mov    %ebx,%eax
 7d1:	e8 2f ff ff ff       	call   705 <morecore>
 7d6:	85 c0                	test   %eax,%eax
 7d8:	75 e2                	jne    7bc <malloc+0x67>
 7da:	eb d5                	jmp    7b1 <malloc+0x5c>
