
_forktest:     file format elf32-i386


Disassembly of section .text:

00000000 <printf>:

#define N  1000

void
printf(int fd, const char *s, ...)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	53                   	push   %ebx
   4:	83 ec 10             	sub    $0x10,%esp
   7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  write(fd, s, strlen(s));
   a:	53                   	push   %ebx
<<<<<<< HEAD
   b:	e8 25 02 00 00       	call   235 <strlen>
=======
   b:	e8 0e 02 00 00       	call   21e <strlen>
>>>>>>> c59b0f9 (fixed thread_join and join)
  10:	83 c4 0c             	add    $0xc,%esp
  13:	50                   	push   %eax
  14:	53                   	push   %ebx
  15:	ff 75 08             	push   0x8(%ebp)
<<<<<<< HEAD
  18:	e8 8b 03 00 00       	call   3a8 <write>
=======
  18:	e8 74 03 00 00       	call   391 <write>
>>>>>>> c59b0f9 (fixed thread_join and join)
}
  1d:	83 c4 10             	add    $0x10,%esp
  20:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  23:	c9                   	leave  
  24:	c3                   	ret    

00000025 <forktest>:

void
forktest(void)
{
  25:	55                   	push   %ebp
  26:	89 e5                	mov    %esp,%ebp
  28:	53                   	push   %ebx
  29:	83 ec 0c             	sub    $0xc,%esp
  int n, pid;

  printf(1, "fork test\n");
<<<<<<< HEAD
  2c:	68 80 05 00 00       	push   $0x580
=======
  2c:	68 68 05 00 00       	push   $0x568
>>>>>>> c59b0f9 (fixed thread_join and join)
  31:	6a 01                	push   $0x1
  33:	e8 c8 ff ff ff       	call   0 <printf>

  for(n=0; n<N; n++){
  38:	83 c4 10             	add    $0x10,%esp
  3b:	bb 00 00 00 00       	mov    $0x0,%ebx
  40:	81 fb e7 03 00 00    	cmp    $0x3e7,%ebx
  46:	7f 15                	jg     5d <forktest+0x38>
    pid = fork();
<<<<<<< HEAD
  48:	e8 33 03 00 00       	call   380 <fork>
=======
  48:	e8 1c 03 00 00       	call   369 <fork>
>>>>>>> c59b0f9 (fixed thread_join and join)
    if(pid < 0)
  4d:	85 c0                	test   %eax,%eax
  4f:	78 0c                	js     5d <forktest+0x38>
      break;
    if(pid == 0)
  51:	74 05                	je     58 <forktest+0x33>
  for(n=0; n<N; n++){
  53:	83 c3 01             	add    $0x1,%ebx
  56:	eb e8                	jmp    40 <forktest+0x1b>
      exit();
<<<<<<< HEAD
  58:	e8 2b 03 00 00       	call   388 <exit>
=======
  58:	e8 14 03 00 00       	call   371 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)
  }

  if(n == N){
  5d:	81 fb e8 03 00 00    	cmp    $0x3e8,%ebx
  63:	74 12                	je     77 <forktest+0x52>
    printf(1, "fork claimed to work N times!\n", N);
    exit();
  }

  for(; n > 0; n--){
  65:	85 db                	test   %ebx,%ebx
  67:	7e 3b                	jle    a4 <forktest+0x7f>
    if(wait() < 0){
<<<<<<< HEAD
  69:	e8 22 03 00 00       	call   390 <wait>
=======
  69:	e8 0b 03 00 00       	call   379 <wait>
>>>>>>> c59b0f9 (fixed thread_join and join)
  6e:	85 c0                	test   %eax,%eax
  70:	78 1e                	js     90 <forktest+0x6b>
  for(; n > 0; n--){
  72:	83 eb 01             	sub    $0x1,%ebx
  75:	eb ee                	jmp    65 <forktest+0x40>
    printf(1, "fork claimed to work N times!\n", N);
  77:	83 ec 04             	sub    $0x4,%esp
  7a:	68 e8 03 00 00       	push   $0x3e8
<<<<<<< HEAD
  7f:	68 c0 05 00 00       	push   $0x5c0
  84:	6a 01                	push   $0x1
  86:	e8 75 ff ff ff       	call   0 <printf>
    exit();
  8b:	e8 f8 02 00 00       	call   388 <exit>
      printf(1, "wait stopped early\n");
  90:	83 ec 08             	sub    $0x8,%esp
  93:	68 8b 05 00 00       	push   $0x58b
  98:	6a 01                	push   $0x1
  9a:	e8 61 ff ff ff       	call   0 <printf>
      exit();
  9f:	e8 e4 02 00 00       	call   388 <exit>
=======
  7f:	68 a8 05 00 00       	push   $0x5a8
  84:	6a 01                	push   $0x1
  86:	e8 75 ff ff ff       	call   0 <printf>
    exit();
  8b:	e8 e1 02 00 00       	call   371 <exit>
      printf(1, "wait stopped early\n");
  90:	83 ec 08             	sub    $0x8,%esp
  93:	68 73 05 00 00       	push   $0x573
  98:	6a 01                	push   $0x1
  9a:	e8 61 ff ff ff       	call   0 <printf>
      exit();
  9f:	e8 cd 02 00 00       	call   371 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)
    }
  }

  if(wait() != -1){
<<<<<<< HEAD
  a4:	e8 e7 02 00 00       	call   390 <wait>
=======
  a4:	e8 d0 02 00 00       	call   379 <wait>
>>>>>>> c59b0f9 (fixed thread_join and join)
  a9:	83 f8 ff             	cmp    $0xffffffff,%eax
  ac:	75 17                	jne    c5 <forktest+0xa0>
    printf(1, "wait got too many\n");
    exit();
  }

  printf(1, "fork test OK\n");
  ae:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
  b1:	68 b2 05 00 00       	push   $0x5b2
=======
  b1:	68 9a 05 00 00       	push   $0x59a
>>>>>>> c59b0f9 (fixed thread_join and join)
  b6:	6a 01                	push   $0x1
  b8:	e8 43 ff ff ff       	call   0 <printf>
}
  bd:	83 c4 10             	add    $0x10,%esp
  c0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  c3:	c9                   	leave  
  c4:	c3                   	ret    
    printf(1, "wait got too many\n");
  c5:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
  c8:	68 9f 05 00 00       	push   $0x59f
  cd:	6a 01                	push   $0x1
  cf:	e8 2c ff ff ff       	call   0 <printf>
    exit();
  d4:	e8 af 02 00 00       	call   388 <exit>
=======
  c8:	68 87 05 00 00       	push   $0x587
  cd:	6a 01                	push   $0x1
  cf:	e8 2c ff ff ff       	call   0 <printf>
    exit();
  d4:	e8 98 02 00 00       	call   371 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)

000000d9 <main>:

int
main(void)
{
  d9:	55                   	push   %ebp
  da:	89 e5                	mov    %esp,%ebp
  dc:	83 e4 f0             	and    $0xfffffff0,%esp
  forktest();
  df:	e8 41 ff ff ff       	call   25 <forktest>
  exit();
<<<<<<< HEAD
  e4:	e8 9f 02 00 00       	call   388 <exit>
=======
  e4:	e8 88 02 00 00       	call   371 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)

000000e9 <test_and_set>:
  int flag;
};

<<<<<<< HEAD
struct thread_ref *threads[64];
=======
struct thread_ref threads[64];
>>>>>>> c59b0f9 (fixed thread_join and join)

int test_and_set(int *old_ptr, int new_ptr) {
  e9:	55                   	push   %ebp
  ea:	89 e5                	mov    %esp,%ebp
  ec:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *old_ptr;
  ef:	8b 10                	mov    (%eax),%edx
  *old_ptr = new_ptr;
  f1:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  f4:	89 08                	mov    %ecx,(%eax)
  return old;
}
  f6:	89 d0                	mov    %edx,%eax
  f8:	5d                   	pop    %ebp
  f9:	c3                   	ret    

000000fa <thread_create>:

// a wrapper func for clone
int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
  fa:	55                   	push   %ebp
  fb:	89 e5                	mov    %esp,%ebp
  fd:	53                   	push   %ebx
  fe:	83 ec 10             	sub    $0x10,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE*2);
 101:	68 00 20 00 00       	push   $0x2000
<<<<<<< HEAD
 106:	e8 ed 03 00 00       	call   4f8 <malloc>
  if(n_stack == 0){
 10b:	83 c4 10             	add    $0x10,%esp
 10e:	85 c0                	test   %eax,%eax
 110:	74 41                	je     153 <thread_create+0x59>
 112:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  int new_pid = clone(start_routine, arg1, arg2, n_stack);
 114:	50                   	push   %eax
 115:	ff 75 10             	push   0x10(%ebp)
 118:	ff 75 0c             	push   0xc(%ebp)
 11b:	ff 75 08             	push   0x8(%ebp)
 11e:	e8 05 03 00 00       	call   428 <clone>
=======
 106:	e8 d6 03 00 00       	call   4e1 <malloc>
  if(n_stack == 0){
 10b:	83 c4 10             	add    $0x10,%esp
 10e:	85 c0                	test   %eax,%eax
 110:	74 57                	je     169 <thread_create+0x6f>
 112:	89 c1                	mov    %eax,%ecx
    return -1;
  }
  
  for(int i=0; i<64; i++){
 114:	b8 00 00 00 00       	mov    $0x0,%eax
 119:	eb 03                	jmp    11e <thread_create+0x24>
 11b:	83 c0 01             	add    $0x1,%eax
 11e:	83 f8 3f             	cmp    $0x3f,%eax
 121:	7f 2f                	jg     152 <thread_create+0x58>
    if(threads[i].flag==0){
 123:	8d 14 40             	lea    (%eax,%eax,2),%edx
 126:	83 3c 95 08 09 00 00 	cmpl   $0x0,0x908(,%edx,4)
 12d:	00 
 12e:	75 eb                	jne    11b <thread_create+0x21>
      threads[i].maddr = n_stack;
 130:	8d 14 00             	lea    (%eax,%eax,1),%edx
 133:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
 136:	c1 e3 02             	shl    $0x2,%ebx
 139:	89 8b 00 09 00 00    	mov    %ecx,0x900(%ebx)
      threads[i].pg1addr = n_stack;
 13f:	89 8b 04 09 00 00    	mov    %ecx,0x904(%ebx)
      threads[i].flag = 1;
 145:	01 c2                	add    %eax,%edx
 147:	c7 04 95 08 09 00 00 	movl   $0x1,0x908(,%edx,4)
 14e:	01 00 00 00 
      break;
    }
  }
  
  int new_pid = clone(start_routine, arg1, arg2, n_stack); // TODO: is this the right way to call it?
 152:	51                   	push   %ecx
 153:	ff 75 10             	push   0x10(%ebp)
 156:	ff 75 0c             	push   0xc(%ebp)
 159:	ff 75 08             	push   0x8(%ebp)
 15c:	e8 b0 02 00 00       	call   411 <clone>


  // I can't remember if there was something else to do here but I'm sure I'll find out
>>>>>>> c59b0f9 (fixed thread_join and join)

  for(int i=0; i<64; i++){
 123:	83 c4 10             	add    $0x10,%esp
 126:	ba 00 00 00 00       	mov    $0x0,%edx
 12b:	eb 03                	jmp    130 <thread_create+0x36>
 12d:	83 c2 01             	add    $0x1,%edx
 130:	83 fa 3f             	cmp    $0x3f,%edx
 133:	7f 19                	jg     14e <thread_create+0x54>
    if(threads[i]->flag==0){
 135:	8b 0c 95 20 09 00 00 	mov    0x920(,%edx,4),%ecx
 13c:	83 79 08 00          	cmpl   $0x0,0x8(%ecx)
 140:	75 eb                	jne    12d <thread_create+0x33>
      threads[i]->maddr = n_stack;
 142:	89 19                	mov    %ebx,(%ecx)
      threads[i]->pg1addr = n_stack;
 144:	8b 14 95 20 09 00 00 	mov    0x920(,%edx,4),%edx
 14b:	89 5a 04             	mov    %ebx,0x4(%edx)
      break;
    }
  }

  return new_pid;
<<<<<<< HEAD
}
 14e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 151:	c9                   	leave  
 152:	c3                   	ret    
    return -1;
 153:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 158:	eb f4                	jmp    14e <thread_create+0x54>

0000015a <thread_join>:
=======
 161:	83 c4 10             	add    $0x10,%esp
}
 164:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 167:	c9                   	leave  
 168:	c3                   	ret    
    return -1;
 169:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 16e:	eb f4                	jmp    164 <thread_create+0x6a>

00000170 <thread_join>:
>>>>>>> c59b0f9 (fixed thread_join and join)

//TODO: fix
int thread_join() {
<<<<<<< HEAD
 15a:	55                   	push   %ebp
 15b:	89 e5                	mov    %esp,%ebp
 15d:	56                   	push   %esi
 15e:	53                   	push   %ebx
 15f:	83 ec 1c             	sub    $0x1c,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 162:	8d 45 f4             	lea    -0xc(%ebp),%eax
 165:	50                   	push   %eax
 166:	e8 c5 02 00 00       	call   430 <join>
 16b:	89 c6                	mov    %eax,%esi
  for(int i=0; i<64; i++){
 16d:	83 c4 10             	add    $0x10,%esp
 170:	bb 00 00 00 00       	mov    $0x0,%ebx
 175:	eb 03                	jmp    17a <thread_join+0x20>
 177:	83 c3 01             	add    $0x1,%ebx
 17a:	83 fb 3f             	cmp    $0x3f,%ebx
 17d:	7f 23                	jg     1a2 <thread_join+0x48>
    if((threads[i]->flag==1) && (stk_addr == threads[i]->pg1addr)){
 17f:	8b 04 9d 20 09 00 00 	mov    0x920(,%ebx,4),%eax
 186:	83 78 08 01          	cmpl   $0x1,0x8(%eax)
 18a:	75 eb                	jne    177 <thread_join+0x1d>
 18c:	8b 55 f4             	mov    -0xc(%ebp),%edx
 18f:	39 50 04             	cmp    %edx,0x4(%eax)
 192:	75 e3                	jne    177 <thread_join+0x1d>
      free(stk_addr);
 194:	83 ec 0c             	sub    $0xc,%esp
 197:	52                   	push   %edx
 198:	e8 9b 02 00 00       	call   438 <free>
 19d:	83 c4 10             	add    $0x10,%esp
 1a0:	eb d5                	jmp    177 <thread_join+0x1d>
    }
  }
  return pid;
}
 1a2:	89 f0                	mov    %esi,%eax
 1a4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1a7:	5b                   	pop    %ebx
 1a8:	5e                   	pop    %esi
 1a9:	5d                   	pop    %ebp
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
 1bb:	e8 29 ff ff ff       	call   e9 <test_and_set>
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
=======
 170:	55                   	push   %ebp
 171:	89 e5                	mov    %esp,%ebp
 173:	53                   	push   %ebx
 174:	83 ec 20             	sub    $0x20,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 177:	8d 45 f4             	lea    -0xc(%ebp),%eax
 17a:	50                   	push   %eax
 17b:	e8 99 02 00 00       	call   419 <join>
 180:	89 c3                	mov    %eax,%ebx
  free(stk_addr);
 182:	83 c4 04             	add    $0x4,%esp
 185:	ff 75 f4             	push   -0xc(%ebp)
 188:	e8 94 02 00 00       	call   421 <free>
  return pid;
}
 18d:	89 d8                	mov    %ebx,%eax
 18f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 192:	c9                   	leave  
 193:	c3                   	ret    

00000194 <lock_acquire>:

void lock_acquire(lock_t *lock){
 194:	55                   	push   %ebp
 195:	89 e5                	mov    %esp,%ebp
 197:	53                   	push   %ebx
 198:	83 ec 04             	sub    $0x4,%esp
 19b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 19e:	83 ec 08             	sub    $0x8,%esp
 1a1:	6a 01                	push   $0x1
 1a3:	53                   	push   %ebx
 1a4:	e8 40 ff ff ff       	call   e9 <test_and_set>
 1a9:	83 c4 10             	add    $0x10,%esp
 1ac:	83 f8 01             	cmp    $0x1,%eax
 1af:	74 ed                	je     19e <lock_acquire+0xa>
    ;
}
 1b1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1b4:	c9                   	leave  
 1b5:	c3                   	ret    

000001b6 <lock_release>:

void lock_release(lock_t *lock) {
 1b6:	55                   	push   %ebp
 1b7:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 1b9:	8b 45 08             	mov    0x8(%ebp),%eax
 1bc:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 1c2:	5d                   	pop    %ebp
 1c3:	c3                   	ret    

000001c4 <lock_init>:

void lock_init(lock_t *lock) {
 1c4:	55                   	push   %ebp
 1c5:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 1c7:	8b 45 08             	mov    0x8(%ebp),%eax
 1ca:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 1d0:	5d                   	pop    %ebp
 1d1:	c3                   	ret    

000001d2 <strcpy>:
>>>>>>> c59b0f9 (fixed thread_join and join)

char*
strcpy(char *s, const char *t)
{
<<<<<<< HEAD
 1e9:	55                   	push   %ebp
 1ea:	89 e5                	mov    %esp,%ebp
 1ec:	56                   	push   %esi
 1ed:	53                   	push   %ebx
 1ee:	8b 75 08             	mov    0x8(%ebp),%esi
 1f1:	8b 55 0c             	mov    0xc(%ebp),%edx
=======
 1d2:	55                   	push   %ebp
 1d3:	89 e5                	mov    %esp,%ebp
 1d5:	56                   	push   %esi
 1d6:	53                   	push   %ebx
 1d7:	8b 75 08             	mov    0x8(%ebp),%esi
 1da:	8b 55 0c             	mov    0xc(%ebp),%edx
>>>>>>> c59b0f9 (fixed thread_join and join)
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
<<<<<<< HEAD
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
=======
 1dd:	89 f0                	mov    %esi,%eax
 1df:	89 d1                	mov    %edx,%ecx
 1e1:	83 c2 01             	add    $0x1,%edx
 1e4:	89 c3                	mov    %eax,%ebx
 1e6:	83 c0 01             	add    $0x1,%eax
 1e9:	0f b6 09             	movzbl (%ecx),%ecx
 1ec:	88 0b                	mov    %cl,(%ebx)
 1ee:	84 c9                	test   %cl,%cl
 1f0:	75 ed                	jne    1df <strcpy+0xd>
    ;
  return os;
}
 1f2:	89 f0                	mov    %esi,%eax
 1f4:	5b                   	pop    %ebx
 1f5:	5e                   	pop    %esi
 1f6:	5d                   	pop    %ebp
 1f7:	c3                   	ret    

000001f8 <strcmp>:
>>>>>>> c59b0f9 (fixed thread_join and join)

int
strcmp(const char *p, const char *q)
{
<<<<<<< HEAD
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
=======
 1f8:	55                   	push   %ebp
 1f9:	89 e5                	mov    %esp,%ebp
 1fb:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1fe:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 201:	eb 06                	jmp    209 <strcmp+0x11>
    p++, q++;
 203:	83 c1 01             	add    $0x1,%ecx
 206:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 209:	0f b6 01             	movzbl (%ecx),%eax
 20c:	84 c0                	test   %al,%al
 20e:	74 04                	je     214 <strcmp+0x1c>
 210:	3a 02                	cmp    (%edx),%al
 212:	74 ef                	je     203 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 214:	0f b6 c0             	movzbl %al,%eax
 217:	0f b6 12             	movzbl (%edx),%edx
 21a:	29 d0                	sub    %edx,%eax
}
 21c:	5d                   	pop    %ebp
 21d:	c3                   	ret    

0000021e <strlen>:
>>>>>>> c59b0f9 (fixed thread_join and join)

uint
strlen(const char *s)
{
<<<<<<< HEAD
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
=======
 21e:	55                   	push   %ebp
 21f:	89 e5                	mov    %esp,%ebp
 221:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 224:	b8 00 00 00 00       	mov    $0x0,%eax
 229:	eb 03                	jmp    22e <strlen+0x10>
 22b:	83 c0 01             	add    $0x1,%eax
 22e:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 232:	75 f7                	jne    22b <strlen+0xd>
    ;
  return n;
}
 234:	5d                   	pop    %ebp
 235:	c3                   	ret    

00000236 <memset>:
>>>>>>> c59b0f9 (fixed thread_join and join)

void*
memset(void *dst, int c, uint n)
{
<<<<<<< HEAD
 24d:	55                   	push   %ebp
 24e:	89 e5                	mov    %esp,%ebp
 250:	57                   	push   %edi
 251:	8b 55 08             	mov    0x8(%ebp),%edx
=======
 236:	55                   	push   %ebp
 237:	89 e5                	mov    %esp,%ebp
 239:	57                   	push   %edi
 23a:	8b 55 08             	mov    0x8(%ebp),%edx
>>>>>>> c59b0f9 (fixed thread_join and join)
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
<<<<<<< HEAD
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
=======
 23d:	89 d7                	mov    %edx,%edi
 23f:	8b 4d 10             	mov    0x10(%ebp),%ecx
 242:	8b 45 0c             	mov    0xc(%ebp),%eax
 245:	fc                   	cld    
 246:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 248:	89 d0                	mov    %edx,%eax
 24a:	8b 7d fc             	mov    -0x4(%ebp),%edi
 24d:	c9                   	leave  
 24e:	c3                   	ret    

0000024f <strchr>:
>>>>>>> c59b0f9 (fixed thread_join and join)

char*
strchr(const char *s, char c)
{
<<<<<<< HEAD
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
=======
 24f:	55                   	push   %ebp
 250:	89 e5                	mov    %esp,%ebp
 252:	8b 45 08             	mov    0x8(%ebp),%eax
 255:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 259:	eb 03                	jmp    25e <strchr+0xf>
 25b:	83 c0 01             	add    $0x1,%eax
 25e:	0f b6 10             	movzbl (%eax),%edx
 261:	84 d2                	test   %dl,%dl
 263:	74 06                	je     26b <strchr+0x1c>
    if(*s == c)
 265:	38 ca                	cmp    %cl,%dl
 267:	75 f2                	jne    25b <strchr+0xc>
 269:	eb 05                	jmp    270 <strchr+0x21>
      return (char*)s;
  return 0;
 26b:	b8 00 00 00 00       	mov    $0x0,%eax
}
 270:	5d                   	pop    %ebp
 271:	c3                   	ret    

00000272 <gets>:
>>>>>>> c59b0f9 (fixed thread_join and join)

char*
gets(char *buf, int max)
{
<<<<<<< HEAD
 289:	55                   	push   %ebp
 28a:	89 e5                	mov    %esp,%ebp
 28c:	57                   	push   %edi
 28d:	56                   	push   %esi
 28e:	53                   	push   %ebx
 28f:	83 ec 1c             	sub    $0x1c,%esp
 292:	8b 7d 08             	mov    0x8(%ebp),%edi
=======
 272:	55                   	push   %ebp
 273:	89 e5                	mov    %esp,%ebp
 275:	57                   	push   %edi
 276:	56                   	push   %esi
 277:	53                   	push   %ebx
 278:	83 ec 1c             	sub    $0x1c,%esp
 27b:	8b 7d 08             	mov    0x8(%ebp),%edi
>>>>>>> c59b0f9 (fixed thread_join and join)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
<<<<<<< HEAD
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
=======
 27e:	bb 00 00 00 00       	mov    $0x0,%ebx
 283:	89 de                	mov    %ebx,%esi
 285:	83 c3 01             	add    $0x1,%ebx
 288:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 28b:	7d 2e                	jge    2bb <gets+0x49>
    cc = read(0, &c, 1);
 28d:	83 ec 04             	sub    $0x4,%esp
 290:	6a 01                	push   $0x1
 292:	8d 45 e7             	lea    -0x19(%ebp),%eax
 295:	50                   	push   %eax
 296:	6a 00                	push   $0x0
 298:	e8 ec 00 00 00       	call   389 <read>
    if(cc < 1)
 29d:	83 c4 10             	add    $0x10,%esp
 2a0:	85 c0                	test   %eax,%eax
 2a2:	7e 17                	jle    2bb <gets+0x49>
      break;
    buf[i++] = c;
 2a4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2a8:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 2ab:	3c 0a                	cmp    $0xa,%al
 2ad:	0f 94 c2             	sete   %dl
 2b0:	3c 0d                	cmp    $0xd,%al
 2b2:	0f 94 c0             	sete   %al
 2b5:	08 c2                	or     %al,%dl
 2b7:	74 ca                	je     283 <gets+0x11>
    buf[i++] = c;
 2b9:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 2bb:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 2bf:	89 f8                	mov    %edi,%eax
 2c1:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2c4:	5b                   	pop    %ebx
 2c5:	5e                   	pop    %esi
 2c6:	5f                   	pop    %edi
 2c7:	5d                   	pop    %ebp
 2c8:	c3                   	ret    

000002c9 <stat>:
>>>>>>> c59b0f9 (fixed thread_join and join)

int
stat(const char *n, struct stat *st)
{
<<<<<<< HEAD
 2e0:	55                   	push   %ebp
 2e1:	89 e5                	mov    %esp,%ebp
 2e3:	56                   	push   %esi
 2e4:	53                   	push   %ebx
=======
 2c9:	55                   	push   %ebp
 2ca:	89 e5                	mov    %esp,%ebp
 2cc:	56                   	push   %esi
 2cd:	53                   	push   %ebx
>>>>>>> c59b0f9 (fixed thread_join and join)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
<<<<<<< HEAD
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
=======
 2ce:	83 ec 08             	sub    $0x8,%esp
 2d1:	6a 00                	push   $0x0
 2d3:	ff 75 08             	push   0x8(%ebp)
 2d6:	e8 d6 00 00 00       	call   3b1 <open>
  if(fd < 0)
 2db:	83 c4 10             	add    $0x10,%esp
 2de:	85 c0                	test   %eax,%eax
 2e0:	78 24                	js     306 <stat+0x3d>
 2e2:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 2e4:	83 ec 08             	sub    $0x8,%esp
 2e7:	ff 75 0c             	push   0xc(%ebp)
 2ea:	50                   	push   %eax
 2eb:	e8 d9 00 00 00       	call   3c9 <fstat>
 2f0:	89 c6                	mov    %eax,%esi
  close(fd);
 2f2:	89 1c 24             	mov    %ebx,(%esp)
 2f5:	e8 9f 00 00 00       	call   399 <close>
  return r;
 2fa:	83 c4 10             	add    $0x10,%esp
}
 2fd:	89 f0                	mov    %esi,%eax
 2ff:	8d 65 f8             	lea    -0x8(%ebp),%esp
 302:	5b                   	pop    %ebx
 303:	5e                   	pop    %esi
 304:	5d                   	pop    %ebp
 305:	c3                   	ret    
    return -1;
 306:	be ff ff ff ff       	mov    $0xffffffff,%esi
 30b:	eb f0                	jmp    2fd <stat+0x34>

0000030d <atoi>:
>>>>>>> c59b0f9 (fixed thread_join and join)

int
atoi(const char *s)
{
<<<<<<< HEAD
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
=======
 30d:	55                   	push   %ebp
 30e:	89 e5                	mov    %esp,%ebp
 310:	53                   	push   %ebx
 311:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 314:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 319:	eb 10                	jmp    32b <atoi+0x1e>
    n = n*10 + *s++ - '0';
 31b:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 31e:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 321:	83 c1 01             	add    $0x1,%ecx
 324:	0f be c0             	movsbl %al,%eax
 327:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 32b:	0f b6 01             	movzbl (%ecx),%eax
 32e:	8d 58 d0             	lea    -0x30(%eax),%ebx
 331:	80 fb 09             	cmp    $0x9,%bl
 334:	76 e5                	jbe    31b <atoi+0xe>
  return n;
}
 336:	89 d0                	mov    %edx,%eax
 338:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 33b:	c9                   	leave  
 33c:	c3                   	ret    

0000033d <memmove>:
>>>>>>> c59b0f9 (fixed thread_join and join)

void*
memmove(void *vdst, const void *vsrc, int n)
{
<<<<<<< HEAD
 354:	55                   	push   %ebp
 355:	89 e5                	mov    %esp,%ebp
 357:	56                   	push   %esi
 358:	53                   	push   %ebx
 359:	8b 75 08             	mov    0x8(%ebp),%esi
 35c:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 35f:	8b 45 10             	mov    0x10(%ebp),%eax
=======
 33d:	55                   	push   %ebp
 33e:	89 e5                	mov    %esp,%ebp
 340:	56                   	push   %esi
 341:	53                   	push   %ebx
 342:	8b 75 08             	mov    0x8(%ebp),%esi
 345:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 348:	8b 45 10             	mov    0x10(%ebp),%eax
>>>>>>> c59b0f9 (fixed thread_join and join)
  char *dst;
  const char *src;

  dst = vdst;
<<<<<<< HEAD
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
=======
 34b:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 34d:	eb 0d                	jmp    35c <memmove+0x1f>
    *dst++ = *src++;
 34f:	0f b6 01             	movzbl (%ecx),%eax
 352:	88 02                	mov    %al,(%edx)
 354:	8d 49 01             	lea    0x1(%ecx),%ecx
 357:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 35a:	89 d8                	mov    %ebx,%eax
 35c:	8d 58 ff             	lea    -0x1(%eax),%ebx
 35f:	85 c0                	test   %eax,%eax
 361:	7f ec                	jg     34f <memmove+0x12>
  return vdst;
}
 363:	89 f0                	mov    %esi,%eax
 365:	5b                   	pop    %ebx
 366:	5e                   	pop    %esi
 367:	5d                   	pop    %ebp
 368:	c3                   	ret    

00000369 <fork>:
>>>>>>> c59b0f9 (fixed thread_join and join)
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
<<<<<<< HEAD
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

00000438 <free>:
=======
 369:	b8 01 00 00 00       	mov    $0x1,%eax
 36e:	cd 40                	int    $0x40
 370:	c3                   	ret    

00000371 <exit>:
SYSCALL(exit)
 371:	b8 02 00 00 00       	mov    $0x2,%eax
 376:	cd 40                	int    $0x40
 378:	c3                   	ret    

00000379 <wait>:
SYSCALL(wait)
 379:	b8 03 00 00 00       	mov    $0x3,%eax
 37e:	cd 40                	int    $0x40
 380:	c3                   	ret    

00000381 <pipe>:
SYSCALL(pipe)
 381:	b8 04 00 00 00       	mov    $0x4,%eax
 386:	cd 40                	int    $0x40
 388:	c3                   	ret    

00000389 <read>:
SYSCALL(read)
 389:	b8 05 00 00 00       	mov    $0x5,%eax
 38e:	cd 40                	int    $0x40
 390:	c3                   	ret    

00000391 <write>:
SYSCALL(write)
 391:	b8 10 00 00 00       	mov    $0x10,%eax
 396:	cd 40                	int    $0x40
 398:	c3                   	ret    

00000399 <close>:
SYSCALL(close)
 399:	b8 15 00 00 00       	mov    $0x15,%eax
 39e:	cd 40                	int    $0x40
 3a0:	c3                   	ret    

000003a1 <kill>:
SYSCALL(kill)
 3a1:	b8 06 00 00 00       	mov    $0x6,%eax
 3a6:	cd 40                	int    $0x40
 3a8:	c3                   	ret    

000003a9 <exec>:
SYSCALL(exec)
 3a9:	b8 07 00 00 00       	mov    $0x7,%eax
 3ae:	cd 40                	int    $0x40
 3b0:	c3                   	ret    

000003b1 <open>:
SYSCALL(open)
 3b1:	b8 0f 00 00 00       	mov    $0xf,%eax
 3b6:	cd 40                	int    $0x40
 3b8:	c3                   	ret    

000003b9 <mknod>:
SYSCALL(mknod)
 3b9:	b8 11 00 00 00       	mov    $0x11,%eax
 3be:	cd 40                	int    $0x40
 3c0:	c3                   	ret    

000003c1 <unlink>:
SYSCALL(unlink)
 3c1:	b8 12 00 00 00       	mov    $0x12,%eax
 3c6:	cd 40                	int    $0x40
 3c8:	c3                   	ret    

000003c9 <fstat>:
SYSCALL(fstat)
 3c9:	b8 08 00 00 00       	mov    $0x8,%eax
 3ce:	cd 40                	int    $0x40
 3d0:	c3                   	ret    

000003d1 <link>:
SYSCALL(link)
 3d1:	b8 13 00 00 00       	mov    $0x13,%eax
 3d6:	cd 40                	int    $0x40
 3d8:	c3                   	ret    

000003d9 <mkdir>:
SYSCALL(mkdir)
 3d9:	b8 14 00 00 00       	mov    $0x14,%eax
 3de:	cd 40                	int    $0x40
 3e0:	c3                   	ret    

000003e1 <chdir>:
SYSCALL(chdir)
 3e1:	b8 09 00 00 00       	mov    $0x9,%eax
 3e6:	cd 40                	int    $0x40
 3e8:	c3                   	ret    

000003e9 <dup>:
SYSCALL(dup)
 3e9:	b8 0a 00 00 00       	mov    $0xa,%eax
 3ee:	cd 40                	int    $0x40
 3f0:	c3                   	ret    

000003f1 <getpid>:
SYSCALL(getpid)
 3f1:	b8 0b 00 00 00       	mov    $0xb,%eax
 3f6:	cd 40                	int    $0x40
 3f8:	c3                   	ret    

000003f9 <sbrk>:
SYSCALL(sbrk)
 3f9:	b8 0c 00 00 00       	mov    $0xc,%eax
 3fe:	cd 40                	int    $0x40
 400:	c3                   	ret    

00000401 <sleep>:
SYSCALL(sleep)
 401:	b8 0d 00 00 00       	mov    $0xd,%eax
 406:	cd 40                	int    $0x40
 408:	c3                   	ret    

00000409 <uptime>:
SYSCALL(uptime)
 409:	b8 0e 00 00 00       	mov    $0xe,%eax
 40e:	cd 40                	int    $0x40
 410:	c3                   	ret    

00000411 <clone>:
SYSCALL(clone)
 411:	b8 16 00 00 00       	mov    $0x16,%eax
 416:	cd 40                	int    $0x40
 418:	c3                   	ret    

00000419 <join>:
 419:	b8 17 00 00 00       	mov    $0x17,%eax
 41e:	cd 40                	int    $0x40
 420:	c3                   	ret    

00000421 <free>:
>>>>>>> c59b0f9 (fixed thread_join and join)
static Header base;
static Header *freep;

void
free(void *ap)
{
<<<<<<< HEAD
 438:	55                   	push   %ebp
 439:	89 e5                	mov    %esp,%ebp
 43b:	57                   	push   %edi
 43c:	56                   	push   %esi
 43d:	53                   	push   %ebx
 43e:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 441:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 444:	a1 20 0a 00 00       	mov    0xa20,%eax
 449:	eb 02                	jmp    44d <free+0x15>
 44b:	89 d0                	mov    %edx,%eax
 44d:	39 c8                	cmp    %ecx,%eax
 44f:	73 04                	jae    455 <free+0x1d>
 451:	39 08                	cmp    %ecx,(%eax)
 453:	77 12                	ja     467 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 455:	8b 10                	mov    (%eax),%edx
 457:	39 c2                	cmp    %eax,%edx
 459:	77 f0                	ja     44b <free+0x13>
 45b:	39 c8                	cmp    %ecx,%eax
 45d:	72 08                	jb     467 <free+0x2f>
 45f:	39 ca                	cmp    %ecx,%edx
 461:	77 04                	ja     467 <free+0x2f>
 463:	89 d0                	mov    %edx,%eax
 465:	eb e6                	jmp    44d <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 467:	8b 73 fc             	mov    -0x4(%ebx),%esi
 46a:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 46d:	8b 10                	mov    (%eax),%edx
 46f:	39 d7                	cmp    %edx,%edi
 471:	74 19                	je     48c <free+0x54>
=======
 421:	55                   	push   %ebp
 422:	89 e5                	mov    %esp,%ebp
 424:	57                   	push   %edi
 425:	56                   	push   %esi
 426:	53                   	push   %ebx
 427:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 42a:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 42d:	a1 00 0c 00 00       	mov    0xc00,%eax
 432:	eb 02                	jmp    436 <free+0x15>
 434:	89 d0                	mov    %edx,%eax
 436:	39 c8                	cmp    %ecx,%eax
 438:	73 04                	jae    43e <free+0x1d>
 43a:	39 08                	cmp    %ecx,(%eax)
 43c:	77 12                	ja     450 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 43e:	8b 10                	mov    (%eax),%edx
 440:	39 c2                	cmp    %eax,%edx
 442:	77 f0                	ja     434 <free+0x13>
 444:	39 c8                	cmp    %ecx,%eax
 446:	72 08                	jb     450 <free+0x2f>
 448:	39 ca                	cmp    %ecx,%edx
 44a:	77 04                	ja     450 <free+0x2f>
 44c:	89 d0                	mov    %edx,%eax
 44e:	eb e6                	jmp    436 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 450:	8b 73 fc             	mov    -0x4(%ebx),%esi
 453:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 456:	8b 10                	mov    (%eax),%edx
 458:	39 d7                	cmp    %edx,%edi
 45a:	74 19                	je     475 <free+0x54>
>>>>>>> c59b0f9 (fixed thread_join and join)
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
<<<<<<< HEAD
 473:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 476:	8b 50 04             	mov    0x4(%eax),%edx
 479:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 47c:	39 ce                	cmp    %ecx,%esi
 47e:	74 1b                	je     49b <free+0x63>
=======
 45c:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 45f:	8b 50 04             	mov    0x4(%eax),%edx
 462:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 465:	39 ce                	cmp    %ecx,%esi
 467:	74 1b                	je     484 <free+0x63>
>>>>>>> c59b0f9 (fixed thread_join and join)
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
<<<<<<< HEAD
 480:	89 08                	mov    %ecx,(%eax)
  freep = p;
 482:	a3 20 0a 00 00       	mov    %eax,0xa20
}
 487:	5b                   	pop    %ebx
 488:	5e                   	pop    %esi
 489:	5f                   	pop    %edi
 48a:	5d                   	pop    %ebp
 48b:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 48c:	03 72 04             	add    0x4(%edx),%esi
 48f:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 492:	8b 10                	mov    (%eax),%edx
 494:	8b 12                	mov    (%edx),%edx
 496:	89 53 f8             	mov    %edx,-0x8(%ebx)
 499:	eb db                	jmp    476 <free+0x3e>
    p->s.size += bp->s.size;
 49b:	03 53 fc             	add    -0x4(%ebx),%edx
 49e:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 4a1:	8b 53 f8             	mov    -0x8(%ebx),%edx
 4a4:	89 10                	mov    %edx,(%eax)
 4a6:	eb da                	jmp    482 <free+0x4a>

000004a8 <morecore>:
=======
 469:	89 08                	mov    %ecx,(%eax)
  freep = p;
 46b:	a3 00 0c 00 00       	mov    %eax,0xc00
}
 470:	5b                   	pop    %ebx
 471:	5e                   	pop    %esi
 472:	5f                   	pop    %edi
 473:	5d                   	pop    %ebp
 474:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 475:	03 72 04             	add    0x4(%edx),%esi
 478:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 47b:	8b 10                	mov    (%eax),%edx
 47d:	8b 12                	mov    (%edx),%edx
 47f:	89 53 f8             	mov    %edx,-0x8(%ebx)
 482:	eb db                	jmp    45f <free+0x3e>
    p->s.size += bp->s.size;
 484:	03 53 fc             	add    -0x4(%ebx),%edx
 487:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 48a:	8b 53 f8             	mov    -0x8(%ebx),%edx
 48d:	89 10                	mov    %edx,(%eax)
 48f:	eb da                	jmp    46b <free+0x4a>

00000491 <morecore>:
>>>>>>> c59b0f9 (fixed thread_join and join)

static Header*
morecore(uint nu)
{
<<<<<<< HEAD
 4a8:	55                   	push   %ebp
 4a9:	89 e5                	mov    %esp,%ebp
 4ab:	53                   	push   %ebx
 4ac:	83 ec 04             	sub    $0x4,%esp
 4af:	89 c3                	mov    %eax,%ebx
=======
 491:	55                   	push   %ebp
 492:	89 e5                	mov    %esp,%ebp
 494:	53                   	push   %ebx
 495:	83 ec 04             	sub    $0x4,%esp
 498:	89 c3                	mov    %eax,%ebx
>>>>>>> c59b0f9 (fixed thread_join and join)
  char *p;
  Header *hp;

  if(nu < 4096)
<<<<<<< HEAD
 4b1:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 4b6:	77 05                	ja     4bd <morecore+0x15>
    nu = 4096;
 4b8:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 4bd:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 4c4:	83 ec 0c             	sub    $0xc,%esp
 4c7:	50                   	push   %eax
 4c8:	e8 43 ff ff ff       	call   410 <sbrk>
  if(p == (char*)-1)
 4cd:	83 c4 10             	add    $0x10,%esp
 4d0:	83 f8 ff             	cmp    $0xffffffff,%eax
 4d3:	74 1c                	je     4f1 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 4d5:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 4d8:	83 c0 08             	add    $0x8,%eax
 4db:	83 ec 0c             	sub    $0xc,%esp
 4de:	50                   	push   %eax
 4df:	e8 54 ff ff ff       	call   438 <free>
  return freep;
 4e4:	a1 20 0a 00 00       	mov    0xa20,%eax
 4e9:	83 c4 10             	add    $0x10,%esp
}
 4ec:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4ef:	c9                   	leave  
 4f0:	c3                   	ret    
    return 0;
 4f1:	b8 00 00 00 00       	mov    $0x0,%eax
 4f6:	eb f4                	jmp    4ec <morecore+0x44>

000004f8 <malloc>:
=======
 49a:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 49f:	77 05                	ja     4a6 <morecore+0x15>
    nu = 4096;
 4a1:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 4a6:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 4ad:	83 ec 0c             	sub    $0xc,%esp
 4b0:	50                   	push   %eax
 4b1:	e8 43 ff ff ff       	call   3f9 <sbrk>
  if(p == (char*)-1)
 4b6:	83 c4 10             	add    $0x10,%esp
 4b9:	83 f8 ff             	cmp    $0xffffffff,%eax
 4bc:	74 1c                	je     4da <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 4be:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 4c1:	83 c0 08             	add    $0x8,%eax
 4c4:	83 ec 0c             	sub    $0xc,%esp
 4c7:	50                   	push   %eax
 4c8:	e8 54 ff ff ff       	call   421 <free>
  return freep;
 4cd:	a1 00 0c 00 00       	mov    0xc00,%eax
 4d2:	83 c4 10             	add    $0x10,%esp
}
 4d5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4d8:	c9                   	leave  
 4d9:	c3                   	ret    
    return 0;
 4da:	b8 00 00 00 00       	mov    $0x0,%eax
 4df:	eb f4                	jmp    4d5 <morecore+0x44>

000004e1 <malloc>:
>>>>>>> c59b0f9 (fixed thread_join and join)

void*
malloc(uint nbytes)
{
<<<<<<< HEAD
 4f8:	55                   	push   %ebp
 4f9:	89 e5                	mov    %esp,%ebp
 4fb:	53                   	push   %ebx
 4fc:	83 ec 04             	sub    $0x4,%esp
=======
 4e1:	55                   	push   %ebp
 4e2:	89 e5                	mov    %esp,%ebp
 4e4:	53                   	push   %ebx
 4e5:	83 ec 04             	sub    $0x4,%esp
>>>>>>> c59b0f9 (fixed thread_join and join)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
<<<<<<< HEAD
 4ff:	8b 45 08             	mov    0x8(%ebp),%eax
 502:	8d 58 07             	lea    0x7(%eax),%ebx
 505:	c1 eb 03             	shr    $0x3,%ebx
 508:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 50b:	8b 0d 20 0a 00 00    	mov    0xa20,%ecx
 511:	85 c9                	test   %ecx,%ecx
 513:	74 04                	je     519 <malloc+0x21>
=======
 4e8:	8b 45 08             	mov    0x8(%ebp),%eax
 4eb:	8d 58 07             	lea    0x7(%eax),%ebx
 4ee:	c1 eb 03             	shr    $0x3,%ebx
 4f1:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 4f4:	8b 0d 00 0c 00 00    	mov    0xc00,%ecx
 4fa:	85 c9                	test   %ecx,%ecx
 4fc:	74 04                	je     502 <malloc+0x21>
>>>>>>> c59b0f9 (fixed thread_join and join)
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
<<<<<<< HEAD
 515:	8b 01                	mov    (%ecx),%eax
 517:	eb 4a                	jmp    563 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 519:	c7 05 20 0a 00 00 24 	movl   $0xa24,0xa20
 520:	0a 00 00 
 523:	c7 05 24 0a 00 00 24 	movl   $0xa24,0xa24
 52a:	0a 00 00 
    base.s.size = 0;
 52d:	c7 05 28 0a 00 00 00 	movl   $0x0,0xa28
 534:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 537:	b9 24 0a 00 00       	mov    $0xa24,%ecx
 53c:	eb d7                	jmp    515 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 53e:	74 19                	je     559 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 540:	29 da                	sub    %ebx,%edx
 542:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 545:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 548:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 54b:	89 0d 20 0a 00 00    	mov    %ecx,0xa20
      return (void*)(p + 1);
 551:	83 c0 08             	add    $0x8,%eax
=======
 4fe:	8b 01                	mov    (%ecx),%eax
 500:	eb 4a                	jmp    54c <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 502:	c7 05 00 0c 00 00 04 	movl   $0xc04,0xc00
 509:	0c 00 00 
 50c:	c7 05 04 0c 00 00 04 	movl   $0xc04,0xc04
 513:	0c 00 00 
    base.s.size = 0;
 516:	c7 05 08 0c 00 00 00 	movl   $0x0,0xc08
 51d:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 520:	b9 04 0c 00 00       	mov    $0xc04,%ecx
 525:	eb d7                	jmp    4fe <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 527:	74 19                	je     542 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 529:	29 da                	sub    %ebx,%edx
 52b:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 52e:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 531:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 534:	89 0d 00 0c 00 00    	mov    %ecx,0xc00
      return (void*)(p + 1);
 53a:	83 c0 08             	add    $0x8,%eax
>>>>>>> c59b0f9 (fixed thread_join and join)
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
<<<<<<< HEAD
 554:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 557:	c9                   	leave  
 558:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 559:	8b 10                	mov    (%eax),%edx
 55b:	89 11                	mov    %edx,(%ecx)
 55d:	eb ec                	jmp    54b <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 55f:	89 c1                	mov    %eax,%ecx
 561:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 563:	8b 50 04             	mov    0x4(%eax),%edx
 566:	39 da                	cmp    %ebx,%edx
 568:	73 d4                	jae    53e <malloc+0x46>
    if(p == freep)
 56a:	39 05 20 0a 00 00    	cmp    %eax,0xa20
 570:	75 ed                	jne    55f <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 572:	89 d8                	mov    %ebx,%eax
 574:	e8 2f ff ff ff       	call   4a8 <morecore>
 579:	85 c0                	test   %eax,%eax
 57b:	75 e2                	jne    55f <malloc+0x67>
 57d:	eb d5                	jmp    554 <malloc+0x5c>
=======
 53d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 540:	c9                   	leave  
 541:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 542:	8b 10                	mov    (%eax),%edx
 544:	89 11                	mov    %edx,(%ecx)
 546:	eb ec                	jmp    534 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 548:	89 c1                	mov    %eax,%ecx
 54a:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 54c:	8b 50 04             	mov    0x4(%eax),%edx
 54f:	39 da                	cmp    %ebx,%edx
 551:	73 d4                	jae    527 <malloc+0x46>
    if(p == freep)
 553:	39 05 00 0c 00 00    	cmp    %eax,0xc00
 559:	75 ed                	jne    548 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 55b:	89 d8                	mov    %ebx,%eax
 55d:	e8 2f ff ff ff       	call   491 <morecore>
 562:	85 c0                	test   %eax,%eax
 564:	75 e2                	jne    548 <malloc+0x67>
 566:	eb d5                	jmp    53d <malloc+0x5c>
>>>>>>> c59b0f9 (fixed thread_join and join)
