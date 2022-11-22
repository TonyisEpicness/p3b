
_init:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

char *argv[] = { "sh", 0 };

int
main(void)
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	53                   	push   %ebx
   e:	51                   	push   %ecx
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
   f:	83 ec 08             	sub    $0x8,%esp
  12:	6a 02                	push   $0x2
<<<<<<< HEAD
  14:	68 80 07 00 00       	push   $0x780
  19:	e8 9e 03 00 00       	call   3bc <open>
=======
  14:	68 68 07 00 00       	push   $0x768
  19:	e8 87 03 00 00       	call   3a5 <open>
>>>>>>> c59b0f9 (fixed thread_join and join)
  1e:	83 c4 10             	add    $0x10,%esp
  21:	85 c0                	test   %eax,%eax
  23:	78 1b                	js     40 <main+0x40>
    mknod("console", 1, 1);
    open("console", O_RDWR);
  }
  dup(0);  // stdout
  25:	83 ec 0c             	sub    $0xc,%esp
  28:	6a 00                	push   $0x0
<<<<<<< HEAD
  2a:	e8 c5 03 00 00       	call   3f4 <dup>
  dup(0);  // stderr
  2f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  36:	e8 b9 03 00 00       	call   3f4 <dup>
=======
  2a:	e8 ae 03 00 00       	call   3dd <dup>
  dup(0);  // stderr
  2f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  36:	e8 a2 03 00 00       	call   3dd <dup>
>>>>>>> c59b0f9 (fixed thread_join and join)
  3b:	83 c4 10             	add    $0x10,%esp
  3e:	eb 58                	jmp    98 <main+0x98>
    mknod("console", 1, 1);
  40:	83 ec 04             	sub    $0x4,%esp
  43:	6a 01                	push   $0x1
  45:	6a 01                	push   $0x1
<<<<<<< HEAD
  47:	68 80 07 00 00       	push   $0x780
  4c:	e8 73 03 00 00       	call   3c4 <mknod>
    open("console", O_RDWR);
  51:	83 c4 08             	add    $0x8,%esp
  54:	6a 02                	push   $0x2
  56:	68 80 07 00 00       	push   $0x780
  5b:	e8 5c 03 00 00       	call   3bc <open>
=======
  47:	68 68 07 00 00       	push   $0x768
  4c:	e8 5c 03 00 00       	call   3ad <mknod>
    open("console", O_RDWR);
  51:	83 c4 08             	add    $0x8,%esp
  54:	6a 02                	push   $0x2
  56:	68 68 07 00 00       	push   $0x768
  5b:	e8 45 03 00 00       	call   3a5 <open>
>>>>>>> c59b0f9 (fixed thread_join and join)
  60:	83 c4 10             	add    $0x10,%esp
  63:	eb c0                	jmp    25 <main+0x25>

  for(;;){
    printf(1, "init: starting sh\n");
    pid = fork();
    if(pid < 0){
      printf(1, "init: fork failed\n");
  65:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
  68:	68 9b 07 00 00       	push   $0x79b
  6d:	6a 01                	push   $0x1
  6f:	e8 5d 04 00 00       	call   4d1 <printf>
      exit();
  74:	e8 03 03 00 00       	call   37c <exit>
=======
  68:	68 83 07 00 00       	push   $0x783
  6d:	6a 01                	push   $0x1
  6f:	e8 46 04 00 00       	call   4ba <printf>
      exit();
  74:	e8 ec 02 00 00       	call   365 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)
      exec("sh", argv);
      printf(1, "init: exec sh failed\n");
      exit();
    }
    while((wpid=wait()) >= 0 && wpid != pid)
      printf(1, "zombie!\n");
  79:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
  7c:	68 c7 07 00 00       	push   $0x7c7
  81:	6a 01                	push   $0x1
  83:	e8 49 04 00 00       	call   4d1 <printf>
  88:	83 c4 10             	add    $0x10,%esp
    while((wpid=wait()) >= 0 && wpid != pid)
  8b:	e8 f4 02 00 00       	call   384 <wait>
=======
  7c:	68 af 07 00 00       	push   $0x7af
  81:	6a 01                	push   $0x1
  83:	e8 32 04 00 00       	call   4ba <printf>
  88:	83 c4 10             	add    $0x10,%esp
    while((wpid=wait()) >= 0 && wpid != pid)
  8b:	e8 dd 02 00 00       	call   36d <wait>
>>>>>>> c59b0f9 (fixed thread_join and join)
  90:	85 c0                	test   %eax,%eax
  92:	78 04                	js     98 <main+0x98>
  94:	39 c3                	cmp    %eax,%ebx
  96:	75 e1                	jne    79 <main+0x79>
    printf(1, "init: starting sh\n");
  98:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
  9b:	68 88 07 00 00       	push   $0x788
  a0:	6a 01                	push   $0x1
  a2:	e8 2a 04 00 00       	call   4d1 <printf>
    pid = fork();
  a7:	e8 c8 02 00 00       	call   374 <fork>
=======
  9b:	68 70 07 00 00       	push   $0x770
  a0:	6a 01                	push   $0x1
  a2:	e8 13 04 00 00       	call   4ba <printf>
    pid = fork();
  a7:	e8 b1 02 00 00       	call   35d <fork>
>>>>>>> c59b0f9 (fixed thread_join and join)
  ac:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
  ae:	83 c4 10             	add    $0x10,%esp
  b1:	85 c0                	test   %eax,%eax
  b3:	78 b0                	js     65 <main+0x65>
    if(pid == 0){
  b5:	75 d4                	jne    8b <main+0x8b>
      exec("sh", argv);
  b7:	83 ec 08             	sub    $0x8,%esp
<<<<<<< HEAD
  ba:	68 a8 0b 00 00       	push   $0xba8
  bf:	68 ae 07 00 00       	push   $0x7ae
  c4:	e8 eb 02 00 00       	call   3b4 <exec>
      printf(1, "init: exec sh failed\n");
  c9:	83 c4 08             	add    $0x8,%esp
  cc:	68 b1 07 00 00       	push   $0x7b1
  d1:	6a 01                	push   $0x1
  d3:	e8 f9 03 00 00       	call   4d1 <printf>
      exit();
  d8:	e8 9f 02 00 00       	call   37c <exit>
=======
  ba:	68 8c 0b 00 00       	push   $0xb8c
  bf:	68 96 07 00 00       	push   $0x796
  c4:	e8 d4 02 00 00       	call   39d <exec>
      printf(1, "init: exec sh failed\n");
  c9:	83 c4 08             	add    $0x8,%esp
  cc:	68 99 07 00 00       	push   $0x799
  d1:	6a 01                	push   $0x1
  d3:	e8 e2 03 00 00       	call   4ba <printf>
      exit();
  d8:	e8 88 02 00 00       	call   365 <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)

000000dd <test_and_set>:
  int flag;
};

<<<<<<< HEAD
struct thread_ref *threads[64];
=======
struct thread_ref threads[64];
>>>>>>> c59b0f9 (fixed thread_join and join)

int test_and_set(int *old_ptr, int new_ptr) {
  dd:	55                   	push   %ebp
  de:	89 e5                	mov    %esp,%ebp
  e0:	8b 45 08             	mov    0x8(%ebp),%eax
  int old = *old_ptr;
  e3:	8b 10                	mov    (%eax),%edx
  *old_ptr = new_ptr;
  e5:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  e8:	89 08                	mov    %ecx,(%eax)
  return old;
}
  ea:	89 d0                	mov    %edx,%eax
  ec:	5d                   	pop    %ebp
  ed:	c3                   	ret    

000000ee <thread_create>:

// a wrapper func for clone
int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
  ee:	55                   	push   %ebp
  ef:	89 e5                	mov    %esp,%ebp
  f1:	53                   	push   %ebx
  f2:	83 ec 10             	sub    $0x10,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE*2);
  f5:	68 00 20 00 00       	push   $0x2000
<<<<<<< HEAD
  fa:	e8 f8 05 00 00       	call   6f7 <malloc>
  if(n_stack == 0){
  ff:	83 c4 10             	add    $0x10,%esp
 102:	85 c0                	test   %eax,%eax
 104:	74 41                	je     147 <thread_create+0x59>
 106:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  int new_pid = clone(start_routine, arg1, arg2, n_stack);
 108:	50                   	push   %eax
 109:	ff 75 10             	push   0x10(%ebp)
 10c:	ff 75 0c             	push   0xc(%ebp)
 10f:	ff 75 08             	push   0x8(%ebp)
 112:	e8 05 03 00 00       	call   41c <clone>
=======
  fa:	e8 e1 05 00 00       	call   6e0 <malloc>
  if(n_stack == 0){
  ff:	83 c4 10             	add    $0x10,%esp
 102:	85 c0                	test   %eax,%eax
 104:	74 57                	je     15d <thread_create+0x6f>
 106:	89 c1                	mov    %eax,%ecx
    return -1;
  }
  
  for(int i=0; i<64; i++){
 108:	b8 00 00 00 00       	mov    $0x0,%eax
 10d:	eb 03                	jmp    112 <thread_create+0x24>
 10f:	83 c0 01             	add    $0x1,%eax
 112:	83 f8 3f             	cmp    $0x3f,%eax
 115:	7f 2f                	jg     146 <thread_create+0x58>
    if(threads[i].flag==0){
 117:	8d 14 40             	lea    (%eax,%eax,2),%edx
 11a:	83 3c 95 a8 0b 00 00 	cmpl   $0x0,0xba8(,%edx,4)
 121:	00 
 122:	75 eb                	jne    10f <thread_create+0x21>
      threads[i].maddr = n_stack;
 124:	8d 14 00             	lea    (%eax,%eax,1),%edx
 127:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
 12a:	c1 e3 02             	shl    $0x2,%ebx
 12d:	89 8b a0 0b 00 00    	mov    %ecx,0xba0(%ebx)
      threads[i].pg1addr = n_stack;
 133:	89 8b a4 0b 00 00    	mov    %ecx,0xba4(%ebx)
      threads[i].flag = 1;
 139:	01 c2                	add    %eax,%edx
 13b:	c7 04 95 a8 0b 00 00 	movl   $0x1,0xba8(,%edx,4)
 142:	01 00 00 00 
      break;
    }
  }
  
  int new_pid = clone(start_routine, arg1, arg2, n_stack); // TODO: is this the right way to call it?
 146:	51                   	push   %ecx
 147:	ff 75 10             	push   0x10(%ebp)
 14a:	ff 75 0c             	push   0xc(%ebp)
 14d:	ff 75 08             	push   0x8(%ebp)
 150:	e8 b0 02 00 00       	call   405 <clone>


  // I can't remember if there was something else to do here but I'm sure I'll find out
>>>>>>> c59b0f9 (fixed thread_join and join)

  for(int i=0; i<64; i++){
 117:	83 c4 10             	add    $0x10,%esp
 11a:	ba 00 00 00 00       	mov    $0x0,%edx
 11f:	eb 03                	jmp    124 <thread_create+0x36>
 121:	83 c2 01             	add    $0x1,%edx
 124:	83 fa 3f             	cmp    $0x3f,%edx
 127:	7f 19                	jg     142 <thread_create+0x54>
    if(threads[i]->flag==0){
 129:	8b 0c 95 c0 0b 00 00 	mov    0xbc0(,%edx,4),%ecx
 130:	83 79 08 00          	cmpl   $0x0,0x8(%ecx)
 134:	75 eb                	jne    121 <thread_create+0x33>
      threads[i]->maddr = n_stack;
 136:	89 19                	mov    %ebx,(%ecx)
      threads[i]->pg1addr = n_stack;
 138:	8b 14 95 c0 0b 00 00 	mov    0xbc0(,%edx,4),%edx
 13f:	89 5a 04             	mov    %ebx,0x4(%edx)
      break;
    }
  }

  return new_pid;
<<<<<<< HEAD
}
 142:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 145:	c9                   	leave  
 146:	c3                   	ret    
    return -1;
 147:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 14c:	eb f4                	jmp    142 <thread_create+0x54>

0000014e <thread_join>:
=======
 155:	83 c4 10             	add    $0x10,%esp
}
 158:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 15b:	c9                   	leave  
 15c:	c3                   	ret    
    return -1;
 15d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 162:	eb f4                	jmp    158 <thread_create+0x6a>

00000164 <thread_join>:
>>>>>>> c59b0f9 (fixed thread_join and join)

//TODO: fix
int thread_join() {
<<<<<<< HEAD
 14e:	55                   	push   %ebp
 14f:	89 e5                	mov    %esp,%ebp
 151:	56                   	push   %esi
 152:	53                   	push   %ebx
 153:	83 ec 1c             	sub    $0x1c,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 156:	8d 45 f4             	lea    -0xc(%ebp),%eax
 159:	50                   	push   %eax
 15a:	e8 c5 02 00 00       	call   424 <join>
 15f:	89 c6                	mov    %eax,%esi
  for(int i=0; i<64; i++){
 161:	83 c4 10             	add    $0x10,%esp
 164:	bb 00 00 00 00       	mov    $0x0,%ebx
 169:	eb 03                	jmp    16e <thread_join+0x20>
 16b:	83 c3 01             	add    $0x1,%ebx
 16e:	83 fb 3f             	cmp    $0x3f,%ebx
 171:	7f 23                	jg     196 <thread_join+0x48>
    if((threads[i]->flag==1) && (stk_addr == threads[i]->pg1addr)){
 173:	8b 04 9d c0 0b 00 00 	mov    0xbc0(,%ebx,4),%eax
 17a:	83 78 08 01          	cmpl   $0x1,0x8(%eax)
 17e:	75 eb                	jne    16b <thread_join+0x1d>
 180:	8b 55 f4             	mov    -0xc(%ebp),%edx
 183:	39 50 04             	cmp    %edx,0x4(%eax)
 186:	75 e3                	jne    16b <thread_join+0x1d>
      free(stk_addr);
 188:	83 ec 0c             	sub    $0xc,%esp
 18b:	52                   	push   %edx
 18c:	e8 a6 04 00 00       	call   637 <free>
 191:	83 c4 10             	add    $0x10,%esp
 194:	eb d5                	jmp    16b <thread_join+0x1d>
    }
  }
  return pid;
}
 196:	89 f0                	mov    %esi,%eax
 198:	8d 65 f8             	lea    -0x8(%ebp),%esp
 19b:	5b                   	pop    %ebx
 19c:	5e                   	pop    %esi
 19d:	5d                   	pop    %ebp
 19e:	c3                   	ret    

0000019f <lock_acquire>:

void lock_acquire(lock_t *lock){
 19f:	55                   	push   %ebp
 1a0:	89 e5                	mov    %esp,%ebp
 1a2:	53                   	push   %ebx
 1a3:	83 ec 04             	sub    $0x4,%esp
 1a6:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 1a9:	83 ec 08             	sub    $0x8,%esp
 1ac:	6a 01                	push   $0x1
 1ae:	53                   	push   %ebx
 1af:	e8 29 ff ff ff       	call   dd <test_and_set>
 1b4:	83 c4 10             	add    $0x10,%esp
 1b7:	83 f8 01             	cmp    $0x1,%eax
 1ba:	74 ed                	je     1a9 <lock_acquire+0xa>
    ;
}
 1bc:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1bf:	c9                   	leave  
 1c0:	c3                   	ret    

000001c1 <lock_release>:

void lock_release(lock_t *lock) {
 1c1:	55                   	push   %ebp
 1c2:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 1c4:	8b 45 08             	mov    0x8(%ebp),%eax
 1c7:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 1cd:	5d                   	pop    %ebp
 1ce:	c3                   	ret    

000001cf <lock_init>:

void lock_init(lock_t *lock) {
 1cf:	55                   	push   %ebp
 1d0:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 1d2:	8b 45 08             	mov    0x8(%ebp),%eax
 1d5:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 1db:	5d                   	pop    %ebp
 1dc:	c3                   	ret    

000001dd <strcpy>:
=======
 164:	55                   	push   %ebp
 165:	89 e5                	mov    %esp,%ebp
 167:	53                   	push   %ebx
 168:	83 ec 20             	sub    $0x20,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 16b:	8d 45 f4             	lea    -0xc(%ebp),%eax
 16e:	50                   	push   %eax
 16f:	e8 99 02 00 00       	call   40d <join>
 174:	89 c3                	mov    %eax,%ebx
  free(stk_addr);
 176:	83 c4 04             	add    $0x4,%esp
 179:	ff 75 f4             	push   -0xc(%ebp)
 17c:	e8 9f 04 00 00       	call   620 <free>
  return pid;
}
 181:	89 d8                	mov    %ebx,%eax
 183:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 186:	c9                   	leave  
 187:	c3                   	ret    

00000188 <lock_acquire>:

void lock_acquire(lock_t *lock){
 188:	55                   	push   %ebp
 189:	89 e5                	mov    %esp,%ebp
 18b:	53                   	push   %ebx
 18c:	83 ec 04             	sub    $0x4,%esp
 18f:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 192:	83 ec 08             	sub    $0x8,%esp
 195:	6a 01                	push   $0x1
 197:	53                   	push   %ebx
 198:	e8 40 ff ff ff       	call   dd <test_and_set>
 19d:	83 c4 10             	add    $0x10,%esp
 1a0:	83 f8 01             	cmp    $0x1,%eax
 1a3:	74 ed                	je     192 <lock_acquire+0xa>
    ;
}
 1a5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1a8:	c9                   	leave  
 1a9:	c3                   	ret    

000001aa <lock_release>:

void lock_release(lock_t *lock) {
 1aa:	55                   	push   %ebp
 1ab:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 1ad:	8b 45 08             	mov    0x8(%ebp),%eax
 1b0:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 1b6:	5d                   	pop    %ebp
 1b7:	c3                   	ret    

000001b8 <lock_init>:

void lock_init(lock_t *lock) {
 1b8:	55                   	push   %ebp
 1b9:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 1bb:	8b 45 08             	mov    0x8(%ebp),%eax
 1be:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 1c4:	5d                   	pop    %ebp
 1c5:	c3                   	ret    

000001c6 <strcpy>:
>>>>>>> c59b0f9 (fixed thread_join and join)

char*
strcpy(char *s, const char *t)
{
<<<<<<< HEAD
 1dd:	55                   	push   %ebp
 1de:	89 e5                	mov    %esp,%ebp
 1e0:	56                   	push   %esi
 1e1:	53                   	push   %ebx
 1e2:	8b 75 08             	mov    0x8(%ebp),%esi
 1e5:	8b 55 0c             	mov    0xc(%ebp),%edx
=======
 1c6:	55                   	push   %ebp
 1c7:	89 e5                	mov    %esp,%ebp
 1c9:	56                   	push   %esi
 1ca:	53                   	push   %ebx
 1cb:	8b 75 08             	mov    0x8(%ebp),%esi
 1ce:	8b 55 0c             	mov    0xc(%ebp),%edx
>>>>>>> c59b0f9 (fixed thread_join and join)
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
<<<<<<< HEAD
 1e8:	89 f0                	mov    %esi,%eax
 1ea:	89 d1                	mov    %edx,%ecx
 1ec:	83 c2 01             	add    $0x1,%edx
 1ef:	89 c3                	mov    %eax,%ebx
 1f1:	83 c0 01             	add    $0x1,%eax
 1f4:	0f b6 09             	movzbl (%ecx),%ecx
 1f7:	88 0b                	mov    %cl,(%ebx)
 1f9:	84 c9                	test   %cl,%cl
 1fb:	75 ed                	jne    1ea <strcpy+0xd>
    ;
  return os;
}
 1fd:	89 f0                	mov    %esi,%eax
 1ff:	5b                   	pop    %ebx
 200:	5e                   	pop    %esi
 201:	5d                   	pop    %ebp
 202:	c3                   	ret    

00000203 <strcmp>:
=======
 1d1:	89 f0                	mov    %esi,%eax
 1d3:	89 d1                	mov    %edx,%ecx
 1d5:	83 c2 01             	add    $0x1,%edx
 1d8:	89 c3                	mov    %eax,%ebx
 1da:	83 c0 01             	add    $0x1,%eax
 1dd:	0f b6 09             	movzbl (%ecx),%ecx
 1e0:	88 0b                	mov    %cl,(%ebx)
 1e2:	84 c9                	test   %cl,%cl
 1e4:	75 ed                	jne    1d3 <strcpy+0xd>
    ;
  return os;
}
 1e6:	89 f0                	mov    %esi,%eax
 1e8:	5b                   	pop    %ebx
 1e9:	5e                   	pop    %esi
 1ea:	5d                   	pop    %ebp
 1eb:	c3                   	ret    

000001ec <strcmp>:
>>>>>>> c59b0f9 (fixed thread_join and join)

int
strcmp(const char *p, const char *q)
{
<<<<<<< HEAD
 203:	55                   	push   %ebp
 204:	89 e5                	mov    %esp,%ebp
 206:	8b 4d 08             	mov    0x8(%ebp),%ecx
 209:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 20c:	eb 06                	jmp    214 <strcmp+0x11>
    p++, q++;
 20e:	83 c1 01             	add    $0x1,%ecx
 211:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 214:	0f b6 01             	movzbl (%ecx),%eax
 217:	84 c0                	test   %al,%al
 219:	74 04                	je     21f <strcmp+0x1c>
 21b:	3a 02                	cmp    (%edx),%al
 21d:	74 ef                	je     20e <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 21f:	0f b6 c0             	movzbl %al,%eax
 222:	0f b6 12             	movzbl (%edx),%edx
 225:	29 d0                	sub    %edx,%eax
}
 227:	5d                   	pop    %ebp
 228:	c3                   	ret    

00000229 <strlen>:
=======
 1ec:	55                   	push   %ebp
 1ed:	89 e5                	mov    %esp,%ebp
 1ef:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1f2:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 1f5:	eb 06                	jmp    1fd <strcmp+0x11>
    p++, q++;
 1f7:	83 c1 01             	add    $0x1,%ecx
 1fa:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 1fd:	0f b6 01             	movzbl (%ecx),%eax
 200:	84 c0                	test   %al,%al
 202:	74 04                	je     208 <strcmp+0x1c>
 204:	3a 02                	cmp    (%edx),%al
 206:	74 ef                	je     1f7 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 208:	0f b6 c0             	movzbl %al,%eax
 20b:	0f b6 12             	movzbl (%edx),%edx
 20e:	29 d0                	sub    %edx,%eax
}
 210:	5d                   	pop    %ebp
 211:	c3                   	ret    

00000212 <strlen>:
>>>>>>> c59b0f9 (fixed thread_join and join)

uint
strlen(const char *s)
{
<<<<<<< HEAD
 229:	55                   	push   %ebp
 22a:	89 e5                	mov    %esp,%ebp
 22c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 22f:	b8 00 00 00 00       	mov    $0x0,%eax
 234:	eb 03                	jmp    239 <strlen+0x10>
 236:	83 c0 01             	add    $0x1,%eax
 239:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 23d:	75 f7                	jne    236 <strlen+0xd>
    ;
  return n;
}
 23f:	5d                   	pop    %ebp
 240:	c3                   	ret    

00000241 <memset>:
=======
 212:	55                   	push   %ebp
 213:	89 e5                	mov    %esp,%ebp
 215:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 218:	b8 00 00 00 00       	mov    $0x0,%eax
 21d:	eb 03                	jmp    222 <strlen+0x10>
 21f:	83 c0 01             	add    $0x1,%eax
 222:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 226:	75 f7                	jne    21f <strlen+0xd>
    ;
  return n;
}
 228:	5d                   	pop    %ebp
 229:	c3                   	ret    

0000022a <memset>:
>>>>>>> c59b0f9 (fixed thread_join and join)

void*
memset(void *dst, int c, uint n)
{
<<<<<<< HEAD
 241:	55                   	push   %ebp
 242:	89 e5                	mov    %esp,%ebp
 244:	57                   	push   %edi
 245:	8b 55 08             	mov    0x8(%ebp),%edx
=======
 22a:	55                   	push   %ebp
 22b:	89 e5                	mov    %esp,%ebp
 22d:	57                   	push   %edi
 22e:	8b 55 08             	mov    0x8(%ebp),%edx
>>>>>>> c59b0f9 (fixed thread_join and join)
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
<<<<<<< HEAD
 248:	89 d7                	mov    %edx,%edi
 24a:	8b 4d 10             	mov    0x10(%ebp),%ecx
 24d:	8b 45 0c             	mov    0xc(%ebp),%eax
 250:	fc                   	cld    
 251:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 253:	89 d0                	mov    %edx,%eax
 255:	8b 7d fc             	mov    -0x4(%ebp),%edi
 258:	c9                   	leave  
 259:	c3                   	ret    

0000025a <strchr>:
=======
 231:	89 d7                	mov    %edx,%edi
 233:	8b 4d 10             	mov    0x10(%ebp),%ecx
 236:	8b 45 0c             	mov    0xc(%ebp),%eax
 239:	fc                   	cld    
 23a:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 23c:	89 d0                	mov    %edx,%eax
 23e:	8b 7d fc             	mov    -0x4(%ebp),%edi
 241:	c9                   	leave  
 242:	c3                   	ret    

00000243 <strchr>:
>>>>>>> c59b0f9 (fixed thread_join and join)

char*
strchr(const char *s, char c)
{
<<<<<<< HEAD
 25a:	55                   	push   %ebp
 25b:	89 e5                	mov    %esp,%ebp
 25d:	8b 45 08             	mov    0x8(%ebp),%eax
 260:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 264:	eb 03                	jmp    269 <strchr+0xf>
 266:	83 c0 01             	add    $0x1,%eax
 269:	0f b6 10             	movzbl (%eax),%edx
 26c:	84 d2                	test   %dl,%dl
 26e:	74 06                	je     276 <strchr+0x1c>
    if(*s == c)
 270:	38 ca                	cmp    %cl,%dl
 272:	75 f2                	jne    266 <strchr+0xc>
 274:	eb 05                	jmp    27b <strchr+0x21>
      return (char*)s;
  return 0;
 276:	b8 00 00 00 00       	mov    $0x0,%eax
}
 27b:	5d                   	pop    %ebp
 27c:	c3                   	ret    

0000027d <gets>:
=======
 243:	55                   	push   %ebp
 244:	89 e5                	mov    %esp,%ebp
 246:	8b 45 08             	mov    0x8(%ebp),%eax
 249:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 24d:	eb 03                	jmp    252 <strchr+0xf>
 24f:	83 c0 01             	add    $0x1,%eax
 252:	0f b6 10             	movzbl (%eax),%edx
 255:	84 d2                	test   %dl,%dl
 257:	74 06                	je     25f <strchr+0x1c>
    if(*s == c)
 259:	38 ca                	cmp    %cl,%dl
 25b:	75 f2                	jne    24f <strchr+0xc>
 25d:	eb 05                	jmp    264 <strchr+0x21>
      return (char*)s;
  return 0;
 25f:	b8 00 00 00 00       	mov    $0x0,%eax
}
 264:	5d                   	pop    %ebp
 265:	c3                   	ret    

00000266 <gets>:
>>>>>>> c59b0f9 (fixed thread_join and join)

char*
gets(char *buf, int max)
{
<<<<<<< HEAD
 27d:	55                   	push   %ebp
 27e:	89 e5                	mov    %esp,%ebp
 280:	57                   	push   %edi
 281:	56                   	push   %esi
 282:	53                   	push   %ebx
 283:	83 ec 1c             	sub    $0x1c,%esp
 286:	8b 7d 08             	mov    0x8(%ebp),%edi
=======
 266:	55                   	push   %ebp
 267:	89 e5                	mov    %esp,%ebp
 269:	57                   	push   %edi
 26a:	56                   	push   %esi
 26b:	53                   	push   %ebx
 26c:	83 ec 1c             	sub    $0x1c,%esp
 26f:	8b 7d 08             	mov    0x8(%ebp),%edi
>>>>>>> c59b0f9 (fixed thread_join and join)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
<<<<<<< HEAD
 289:	bb 00 00 00 00       	mov    $0x0,%ebx
 28e:	89 de                	mov    %ebx,%esi
 290:	83 c3 01             	add    $0x1,%ebx
 293:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 296:	7d 2e                	jge    2c6 <gets+0x49>
    cc = read(0, &c, 1);
 298:	83 ec 04             	sub    $0x4,%esp
 29b:	6a 01                	push   $0x1
 29d:	8d 45 e7             	lea    -0x19(%ebp),%eax
 2a0:	50                   	push   %eax
 2a1:	6a 00                	push   $0x0
 2a3:	e8 ec 00 00 00       	call   394 <read>
    if(cc < 1)
 2a8:	83 c4 10             	add    $0x10,%esp
 2ab:	85 c0                	test   %eax,%eax
 2ad:	7e 17                	jle    2c6 <gets+0x49>
      break;
    buf[i++] = c;
 2af:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2b3:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 2b6:	3c 0a                	cmp    $0xa,%al
 2b8:	0f 94 c2             	sete   %dl
 2bb:	3c 0d                	cmp    $0xd,%al
 2bd:	0f 94 c0             	sete   %al
 2c0:	08 c2                	or     %al,%dl
 2c2:	74 ca                	je     28e <gets+0x11>
    buf[i++] = c;
 2c4:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 2c6:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 2ca:	89 f8                	mov    %edi,%eax
 2cc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2cf:	5b                   	pop    %ebx
 2d0:	5e                   	pop    %esi
 2d1:	5f                   	pop    %edi
 2d2:	5d                   	pop    %ebp
 2d3:	c3                   	ret    

000002d4 <stat>:
=======
 272:	bb 00 00 00 00       	mov    $0x0,%ebx
 277:	89 de                	mov    %ebx,%esi
 279:	83 c3 01             	add    $0x1,%ebx
 27c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 27f:	7d 2e                	jge    2af <gets+0x49>
    cc = read(0, &c, 1);
 281:	83 ec 04             	sub    $0x4,%esp
 284:	6a 01                	push   $0x1
 286:	8d 45 e7             	lea    -0x19(%ebp),%eax
 289:	50                   	push   %eax
 28a:	6a 00                	push   $0x0
 28c:	e8 ec 00 00 00       	call   37d <read>
    if(cc < 1)
 291:	83 c4 10             	add    $0x10,%esp
 294:	85 c0                	test   %eax,%eax
 296:	7e 17                	jle    2af <gets+0x49>
      break;
    buf[i++] = c;
 298:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 29c:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 29f:	3c 0a                	cmp    $0xa,%al
 2a1:	0f 94 c2             	sete   %dl
 2a4:	3c 0d                	cmp    $0xd,%al
 2a6:	0f 94 c0             	sete   %al
 2a9:	08 c2                	or     %al,%dl
 2ab:	74 ca                	je     277 <gets+0x11>
    buf[i++] = c;
 2ad:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 2af:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 2b3:	89 f8                	mov    %edi,%eax
 2b5:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2b8:	5b                   	pop    %ebx
 2b9:	5e                   	pop    %esi
 2ba:	5f                   	pop    %edi
 2bb:	5d                   	pop    %ebp
 2bc:	c3                   	ret    

000002bd <stat>:
>>>>>>> c59b0f9 (fixed thread_join and join)

int
stat(const char *n, struct stat *st)
{
<<<<<<< HEAD
 2d4:	55                   	push   %ebp
 2d5:	89 e5                	mov    %esp,%ebp
 2d7:	56                   	push   %esi
 2d8:	53                   	push   %ebx
=======
 2bd:	55                   	push   %ebp
 2be:	89 e5                	mov    %esp,%ebp
 2c0:	56                   	push   %esi
 2c1:	53                   	push   %ebx
>>>>>>> c59b0f9 (fixed thread_join and join)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
<<<<<<< HEAD
 2d9:	83 ec 08             	sub    $0x8,%esp
 2dc:	6a 00                	push   $0x0
 2de:	ff 75 08             	push   0x8(%ebp)
 2e1:	e8 d6 00 00 00       	call   3bc <open>
  if(fd < 0)
 2e6:	83 c4 10             	add    $0x10,%esp
 2e9:	85 c0                	test   %eax,%eax
 2eb:	78 24                	js     311 <stat+0x3d>
 2ed:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 2ef:	83 ec 08             	sub    $0x8,%esp
 2f2:	ff 75 0c             	push   0xc(%ebp)
 2f5:	50                   	push   %eax
 2f6:	e8 d9 00 00 00       	call   3d4 <fstat>
 2fb:	89 c6                	mov    %eax,%esi
  close(fd);
 2fd:	89 1c 24             	mov    %ebx,(%esp)
 300:	e8 9f 00 00 00       	call   3a4 <close>
  return r;
 305:	83 c4 10             	add    $0x10,%esp
}
 308:	89 f0                	mov    %esi,%eax
 30a:	8d 65 f8             	lea    -0x8(%ebp),%esp
 30d:	5b                   	pop    %ebx
 30e:	5e                   	pop    %esi
 30f:	5d                   	pop    %ebp
 310:	c3                   	ret    
    return -1;
 311:	be ff ff ff ff       	mov    $0xffffffff,%esi
 316:	eb f0                	jmp    308 <stat+0x34>

00000318 <atoi>:
=======
 2c2:	83 ec 08             	sub    $0x8,%esp
 2c5:	6a 00                	push   $0x0
 2c7:	ff 75 08             	push   0x8(%ebp)
 2ca:	e8 d6 00 00 00       	call   3a5 <open>
  if(fd < 0)
 2cf:	83 c4 10             	add    $0x10,%esp
 2d2:	85 c0                	test   %eax,%eax
 2d4:	78 24                	js     2fa <stat+0x3d>
 2d6:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 2d8:	83 ec 08             	sub    $0x8,%esp
 2db:	ff 75 0c             	push   0xc(%ebp)
 2de:	50                   	push   %eax
 2df:	e8 d9 00 00 00       	call   3bd <fstat>
 2e4:	89 c6                	mov    %eax,%esi
  close(fd);
 2e6:	89 1c 24             	mov    %ebx,(%esp)
 2e9:	e8 9f 00 00 00       	call   38d <close>
  return r;
 2ee:	83 c4 10             	add    $0x10,%esp
}
 2f1:	89 f0                	mov    %esi,%eax
 2f3:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2f6:	5b                   	pop    %ebx
 2f7:	5e                   	pop    %esi
 2f8:	5d                   	pop    %ebp
 2f9:	c3                   	ret    
    return -1;
 2fa:	be ff ff ff ff       	mov    $0xffffffff,%esi
 2ff:	eb f0                	jmp    2f1 <stat+0x34>

00000301 <atoi>:
>>>>>>> c59b0f9 (fixed thread_join and join)

int
atoi(const char *s)
{
<<<<<<< HEAD
 318:	55                   	push   %ebp
 319:	89 e5                	mov    %esp,%ebp
 31b:	53                   	push   %ebx
 31c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 31f:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 324:	eb 10                	jmp    336 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 326:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 329:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 32c:	83 c1 01             	add    $0x1,%ecx
 32f:	0f be c0             	movsbl %al,%eax
 332:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 336:	0f b6 01             	movzbl (%ecx),%eax
 339:	8d 58 d0             	lea    -0x30(%eax),%ebx
 33c:	80 fb 09             	cmp    $0x9,%bl
 33f:	76 e5                	jbe    326 <atoi+0xe>
  return n;
}
 341:	89 d0                	mov    %edx,%eax
 343:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 346:	c9                   	leave  
 347:	c3                   	ret    

00000348 <memmove>:
=======
 301:	55                   	push   %ebp
 302:	89 e5                	mov    %esp,%ebp
 304:	53                   	push   %ebx
 305:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 308:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 30d:	eb 10                	jmp    31f <atoi+0x1e>
    n = n*10 + *s++ - '0';
 30f:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 312:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 315:	83 c1 01             	add    $0x1,%ecx
 318:	0f be c0             	movsbl %al,%eax
 31b:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 31f:	0f b6 01             	movzbl (%ecx),%eax
 322:	8d 58 d0             	lea    -0x30(%eax),%ebx
 325:	80 fb 09             	cmp    $0x9,%bl
 328:	76 e5                	jbe    30f <atoi+0xe>
  return n;
}
 32a:	89 d0                	mov    %edx,%eax
 32c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 32f:	c9                   	leave  
 330:	c3                   	ret    

00000331 <memmove>:
>>>>>>> c59b0f9 (fixed thread_join and join)

void*
memmove(void *vdst, const void *vsrc, int n)
{
<<<<<<< HEAD
 348:	55                   	push   %ebp
 349:	89 e5                	mov    %esp,%ebp
 34b:	56                   	push   %esi
 34c:	53                   	push   %ebx
 34d:	8b 75 08             	mov    0x8(%ebp),%esi
 350:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 353:	8b 45 10             	mov    0x10(%ebp),%eax
=======
 331:	55                   	push   %ebp
 332:	89 e5                	mov    %esp,%ebp
 334:	56                   	push   %esi
 335:	53                   	push   %ebx
 336:	8b 75 08             	mov    0x8(%ebp),%esi
 339:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 33c:	8b 45 10             	mov    0x10(%ebp),%eax
>>>>>>> c59b0f9 (fixed thread_join and join)
  char *dst;
  const char *src;

  dst = vdst;
<<<<<<< HEAD
 356:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 358:	eb 0d                	jmp    367 <memmove+0x1f>
    *dst++ = *src++;
 35a:	0f b6 01             	movzbl (%ecx),%eax
 35d:	88 02                	mov    %al,(%edx)
 35f:	8d 49 01             	lea    0x1(%ecx),%ecx
 362:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 365:	89 d8                	mov    %ebx,%eax
 367:	8d 58 ff             	lea    -0x1(%eax),%ebx
 36a:	85 c0                	test   %eax,%eax
 36c:	7f ec                	jg     35a <memmove+0x12>
  return vdst;
}
 36e:	89 f0                	mov    %esi,%eax
 370:	5b                   	pop    %ebx
 371:	5e                   	pop    %esi
 372:	5d                   	pop    %ebp
 373:	c3                   	ret    

00000374 <fork>:
=======
 33f:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 341:	eb 0d                	jmp    350 <memmove+0x1f>
    *dst++ = *src++;
 343:	0f b6 01             	movzbl (%ecx),%eax
 346:	88 02                	mov    %al,(%edx)
 348:	8d 49 01             	lea    0x1(%ecx),%ecx
 34b:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 34e:	89 d8                	mov    %ebx,%eax
 350:	8d 58 ff             	lea    -0x1(%eax),%ebx
 353:	85 c0                	test   %eax,%eax
 355:	7f ec                	jg     343 <memmove+0x12>
  return vdst;
}
 357:	89 f0                	mov    %esi,%eax
 359:	5b                   	pop    %ebx
 35a:	5e                   	pop    %esi
 35b:	5d                   	pop    %ebp
 35c:	c3                   	ret    

0000035d <fork>:
>>>>>>> c59b0f9 (fixed thread_join and join)
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
<<<<<<< HEAD
 374:	b8 01 00 00 00       	mov    $0x1,%eax
 379:	cd 40                	int    $0x40
 37b:	c3                   	ret    

0000037c <exit>:
SYSCALL(exit)
 37c:	b8 02 00 00 00       	mov    $0x2,%eax
 381:	cd 40                	int    $0x40
 383:	c3                   	ret    

00000384 <wait>:
SYSCALL(wait)
 384:	b8 03 00 00 00       	mov    $0x3,%eax
 389:	cd 40                	int    $0x40
 38b:	c3                   	ret    

0000038c <pipe>:
SYSCALL(pipe)
 38c:	b8 04 00 00 00       	mov    $0x4,%eax
 391:	cd 40                	int    $0x40
 393:	c3                   	ret    

00000394 <read>:
SYSCALL(read)
 394:	b8 05 00 00 00       	mov    $0x5,%eax
 399:	cd 40                	int    $0x40
 39b:	c3                   	ret    

0000039c <write>:
SYSCALL(write)
 39c:	b8 10 00 00 00       	mov    $0x10,%eax
 3a1:	cd 40                	int    $0x40
 3a3:	c3                   	ret    

000003a4 <close>:
SYSCALL(close)
 3a4:	b8 15 00 00 00       	mov    $0x15,%eax
 3a9:	cd 40                	int    $0x40
 3ab:	c3                   	ret    

000003ac <kill>:
SYSCALL(kill)
 3ac:	b8 06 00 00 00       	mov    $0x6,%eax
 3b1:	cd 40                	int    $0x40
 3b3:	c3                   	ret    

000003b4 <exec>:
SYSCALL(exec)
 3b4:	b8 07 00 00 00       	mov    $0x7,%eax
 3b9:	cd 40                	int    $0x40
 3bb:	c3                   	ret    

000003bc <open>:
SYSCALL(open)
 3bc:	b8 0f 00 00 00       	mov    $0xf,%eax
 3c1:	cd 40                	int    $0x40
 3c3:	c3                   	ret    

000003c4 <mknod>:
SYSCALL(mknod)
 3c4:	b8 11 00 00 00       	mov    $0x11,%eax
 3c9:	cd 40                	int    $0x40
 3cb:	c3                   	ret    

000003cc <unlink>:
SYSCALL(unlink)
 3cc:	b8 12 00 00 00       	mov    $0x12,%eax
 3d1:	cd 40                	int    $0x40
 3d3:	c3                   	ret    

000003d4 <fstat>:
SYSCALL(fstat)
 3d4:	b8 08 00 00 00       	mov    $0x8,%eax
 3d9:	cd 40                	int    $0x40
 3db:	c3                   	ret    

000003dc <link>:
SYSCALL(link)
 3dc:	b8 13 00 00 00       	mov    $0x13,%eax
 3e1:	cd 40                	int    $0x40
 3e3:	c3                   	ret    

000003e4 <mkdir>:
SYSCALL(mkdir)
 3e4:	b8 14 00 00 00       	mov    $0x14,%eax
 3e9:	cd 40                	int    $0x40
 3eb:	c3                   	ret    

000003ec <chdir>:
SYSCALL(chdir)
 3ec:	b8 09 00 00 00       	mov    $0x9,%eax
 3f1:	cd 40                	int    $0x40
 3f3:	c3                   	ret    

000003f4 <dup>:
SYSCALL(dup)
 3f4:	b8 0a 00 00 00       	mov    $0xa,%eax
 3f9:	cd 40                	int    $0x40
 3fb:	c3                   	ret    

000003fc <getpid>:
SYSCALL(getpid)
 3fc:	b8 0b 00 00 00       	mov    $0xb,%eax
 401:	cd 40                	int    $0x40
 403:	c3                   	ret    

00000404 <sbrk>:
SYSCALL(sbrk)
 404:	b8 0c 00 00 00       	mov    $0xc,%eax
 409:	cd 40                	int    $0x40
 40b:	c3                   	ret    

0000040c <sleep>:
SYSCALL(sleep)
 40c:	b8 0d 00 00 00       	mov    $0xd,%eax
 411:	cd 40                	int    $0x40
 413:	c3                   	ret    

00000414 <uptime>:
SYSCALL(uptime)
 414:	b8 0e 00 00 00       	mov    $0xe,%eax
 419:	cd 40                	int    $0x40
 41b:	c3                   	ret    

0000041c <clone>:
SYSCALL(clone)
 41c:	b8 16 00 00 00       	mov    $0x16,%eax
 421:	cd 40                	int    $0x40
 423:	c3                   	ret    

00000424 <join>:
 424:	b8 17 00 00 00       	mov    $0x17,%eax
 429:	cd 40                	int    $0x40
 42b:	c3                   	ret    

0000042c <putc>:
=======
 35d:	b8 01 00 00 00       	mov    $0x1,%eax
 362:	cd 40                	int    $0x40
 364:	c3                   	ret    

00000365 <exit>:
SYSCALL(exit)
 365:	b8 02 00 00 00       	mov    $0x2,%eax
 36a:	cd 40                	int    $0x40
 36c:	c3                   	ret    

0000036d <wait>:
SYSCALL(wait)
 36d:	b8 03 00 00 00       	mov    $0x3,%eax
 372:	cd 40                	int    $0x40
 374:	c3                   	ret    

00000375 <pipe>:
SYSCALL(pipe)
 375:	b8 04 00 00 00       	mov    $0x4,%eax
 37a:	cd 40                	int    $0x40
 37c:	c3                   	ret    

0000037d <read>:
SYSCALL(read)
 37d:	b8 05 00 00 00       	mov    $0x5,%eax
 382:	cd 40                	int    $0x40
 384:	c3                   	ret    

00000385 <write>:
SYSCALL(write)
 385:	b8 10 00 00 00       	mov    $0x10,%eax
 38a:	cd 40                	int    $0x40
 38c:	c3                   	ret    

0000038d <close>:
SYSCALL(close)
 38d:	b8 15 00 00 00       	mov    $0x15,%eax
 392:	cd 40                	int    $0x40
 394:	c3                   	ret    

00000395 <kill>:
SYSCALL(kill)
 395:	b8 06 00 00 00       	mov    $0x6,%eax
 39a:	cd 40                	int    $0x40
 39c:	c3                   	ret    

0000039d <exec>:
SYSCALL(exec)
 39d:	b8 07 00 00 00       	mov    $0x7,%eax
 3a2:	cd 40                	int    $0x40
 3a4:	c3                   	ret    

000003a5 <open>:
SYSCALL(open)
 3a5:	b8 0f 00 00 00       	mov    $0xf,%eax
 3aa:	cd 40                	int    $0x40
 3ac:	c3                   	ret    

000003ad <mknod>:
SYSCALL(mknod)
 3ad:	b8 11 00 00 00       	mov    $0x11,%eax
 3b2:	cd 40                	int    $0x40
 3b4:	c3                   	ret    

000003b5 <unlink>:
SYSCALL(unlink)
 3b5:	b8 12 00 00 00       	mov    $0x12,%eax
 3ba:	cd 40                	int    $0x40
 3bc:	c3                   	ret    

000003bd <fstat>:
SYSCALL(fstat)
 3bd:	b8 08 00 00 00       	mov    $0x8,%eax
 3c2:	cd 40                	int    $0x40
 3c4:	c3                   	ret    

000003c5 <link>:
SYSCALL(link)
 3c5:	b8 13 00 00 00       	mov    $0x13,%eax
 3ca:	cd 40                	int    $0x40
 3cc:	c3                   	ret    

000003cd <mkdir>:
SYSCALL(mkdir)
 3cd:	b8 14 00 00 00       	mov    $0x14,%eax
 3d2:	cd 40                	int    $0x40
 3d4:	c3                   	ret    

000003d5 <chdir>:
SYSCALL(chdir)
 3d5:	b8 09 00 00 00       	mov    $0x9,%eax
 3da:	cd 40                	int    $0x40
 3dc:	c3                   	ret    

000003dd <dup>:
SYSCALL(dup)
 3dd:	b8 0a 00 00 00       	mov    $0xa,%eax
 3e2:	cd 40                	int    $0x40
 3e4:	c3                   	ret    

000003e5 <getpid>:
SYSCALL(getpid)
 3e5:	b8 0b 00 00 00       	mov    $0xb,%eax
 3ea:	cd 40                	int    $0x40
 3ec:	c3                   	ret    

000003ed <sbrk>:
SYSCALL(sbrk)
 3ed:	b8 0c 00 00 00       	mov    $0xc,%eax
 3f2:	cd 40                	int    $0x40
 3f4:	c3                   	ret    

000003f5 <sleep>:
SYSCALL(sleep)
 3f5:	b8 0d 00 00 00       	mov    $0xd,%eax
 3fa:	cd 40                	int    $0x40
 3fc:	c3                   	ret    

000003fd <uptime>:
SYSCALL(uptime)
 3fd:	b8 0e 00 00 00       	mov    $0xe,%eax
 402:	cd 40                	int    $0x40
 404:	c3                   	ret    

00000405 <clone>:
SYSCALL(clone)
 405:	b8 16 00 00 00       	mov    $0x16,%eax
 40a:	cd 40                	int    $0x40
 40c:	c3                   	ret    

0000040d <join>:
 40d:	b8 17 00 00 00       	mov    $0x17,%eax
 412:	cd 40                	int    $0x40
 414:	c3                   	ret    

00000415 <putc>:
>>>>>>> c59b0f9 (fixed thread_join and join)
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
<<<<<<< HEAD
 42c:	55                   	push   %ebp
 42d:	89 e5                	mov    %esp,%ebp
 42f:	83 ec 1c             	sub    $0x1c,%esp
 432:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 435:	6a 01                	push   $0x1
 437:	8d 55 f4             	lea    -0xc(%ebp),%edx
 43a:	52                   	push   %edx
 43b:	50                   	push   %eax
 43c:	e8 5b ff ff ff       	call   39c <write>
}
 441:	83 c4 10             	add    $0x10,%esp
 444:	c9                   	leave  
 445:	c3                   	ret    

00000446 <printint>:
=======
 415:	55                   	push   %ebp
 416:	89 e5                	mov    %esp,%ebp
 418:	83 ec 1c             	sub    $0x1c,%esp
 41b:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 41e:	6a 01                	push   $0x1
 420:	8d 55 f4             	lea    -0xc(%ebp),%edx
 423:	52                   	push   %edx
 424:	50                   	push   %eax
 425:	e8 5b ff ff ff       	call   385 <write>
}
 42a:	83 c4 10             	add    $0x10,%esp
 42d:	c9                   	leave  
 42e:	c3                   	ret    

0000042f <printint>:
>>>>>>> c59b0f9 (fixed thread_join and join)

static void
printint(int fd, int xx, int base, int sgn)
{
<<<<<<< HEAD
 446:	55                   	push   %ebp
 447:	89 e5                	mov    %esp,%ebp
 449:	57                   	push   %edi
 44a:	56                   	push   %esi
 44b:	53                   	push   %ebx
 44c:	83 ec 2c             	sub    $0x2c,%esp
 44f:	89 45 d0             	mov    %eax,-0x30(%ebp)
 452:	89 d0                	mov    %edx,%eax
 454:	89 ce                	mov    %ecx,%esi
=======
 42f:	55                   	push   %ebp
 430:	89 e5                	mov    %esp,%ebp
 432:	57                   	push   %edi
 433:	56                   	push   %esi
 434:	53                   	push   %ebx
 435:	83 ec 2c             	sub    $0x2c,%esp
 438:	89 45 d0             	mov    %eax,-0x30(%ebp)
 43b:	89 d0                	mov    %edx,%eax
 43d:	89 ce                	mov    %ecx,%esi
>>>>>>> c59b0f9 (fixed thread_join and join)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
<<<<<<< HEAD
 456:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 45a:	0f 95 c1             	setne  %cl
 45d:	c1 ea 1f             	shr    $0x1f,%edx
 460:	84 d1                	test   %dl,%cl
 462:	74 44                	je     4a8 <printint+0x62>
    neg = 1;
    x = -xx;
 464:	f7 d8                	neg    %eax
 466:	89 c1                	mov    %eax,%ecx
    neg = 1;
 468:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
=======
 43f:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 443:	0f 95 c1             	setne  %cl
 446:	c1 ea 1f             	shr    $0x1f,%edx
 449:	84 d1                	test   %dl,%cl
 44b:	74 44                	je     491 <printint+0x62>
    neg = 1;
    x = -xx;
 44d:	f7 d8                	neg    %eax
 44f:	89 c1                	mov    %eax,%ecx
    neg = 1;
 451:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
>>>>>>> c59b0f9 (fixed thread_join and join)
  } else {
    x = xx;
  }

  i = 0;
<<<<<<< HEAD
 46f:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 474:	89 c8                	mov    %ecx,%eax
 476:	ba 00 00 00 00       	mov    $0x0,%edx
 47b:	f7 f6                	div    %esi
 47d:	89 df                	mov    %ebx,%edi
 47f:	83 c3 01             	add    $0x1,%ebx
 482:	0f b6 92 30 08 00 00 	movzbl 0x830(%edx),%edx
 489:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 48d:	89 ca                	mov    %ecx,%edx
 48f:	89 c1                	mov    %eax,%ecx
 491:	39 d6                	cmp    %edx,%esi
 493:	76 df                	jbe    474 <printint+0x2e>
  if(neg)
 495:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 499:	74 31                	je     4cc <printint+0x86>
    buf[i++] = '-';
 49b:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 4a0:	8d 5f 02             	lea    0x2(%edi),%ebx
 4a3:	8b 75 d0             	mov    -0x30(%ebp),%esi
 4a6:	eb 17                	jmp    4bf <printint+0x79>
    x = xx;
 4a8:	89 c1                	mov    %eax,%ecx
  neg = 0;
 4aa:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 4b1:	eb bc                	jmp    46f <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 4b3:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 4b8:	89 f0                	mov    %esi,%eax
 4ba:	e8 6d ff ff ff       	call   42c <putc>
  while(--i >= 0)
 4bf:	83 eb 01             	sub    $0x1,%ebx
 4c2:	79 ef                	jns    4b3 <printint+0x6d>
}
 4c4:	83 c4 2c             	add    $0x2c,%esp
 4c7:	5b                   	pop    %ebx
 4c8:	5e                   	pop    %esi
 4c9:	5f                   	pop    %edi
 4ca:	5d                   	pop    %ebp
 4cb:	c3                   	ret    
 4cc:	8b 75 d0             	mov    -0x30(%ebp),%esi
 4cf:	eb ee                	jmp    4bf <printint+0x79>

000004d1 <printf>:
=======
 458:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 45d:	89 c8                	mov    %ecx,%eax
 45f:	ba 00 00 00 00       	mov    $0x0,%edx
 464:	f7 f6                	div    %esi
 466:	89 df                	mov    %ebx,%edi
 468:	83 c3 01             	add    $0x1,%ebx
 46b:	0f b6 92 18 08 00 00 	movzbl 0x818(%edx),%edx
 472:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 476:	89 ca                	mov    %ecx,%edx
 478:	89 c1                	mov    %eax,%ecx
 47a:	39 d6                	cmp    %edx,%esi
 47c:	76 df                	jbe    45d <printint+0x2e>
  if(neg)
 47e:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 482:	74 31                	je     4b5 <printint+0x86>
    buf[i++] = '-';
 484:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 489:	8d 5f 02             	lea    0x2(%edi),%ebx
 48c:	8b 75 d0             	mov    -0x30(%ebp),%esi
 48f:	eb 17                	jmp    4a8 <printint+0x79>
    x = xx;
 491:	89 c1                	mov    %eax,%ecx
  neg = 0;
 493:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 49a:	eb bc                	jmp    458 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 49c:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 4a1:	89 f0                	mov    %esi,%eax
 4a3:	e8 6d ff ff ff       	call   415 <putc>
  while(--i >= 0)
 4a8:	83 eb 01             	sub    $0x1,%ebx
 4ab:	79 ef                	jns    49c <printint+0x6d>
}
 4ad:	83 c4 2c             	add    $0x2c,%esp
 4b0:	5b                   	pop    %ebx
 4b1:	5e                   	pop    %esi
 4b2:	5f                   	pop    %edi
 4b3:	5d                   	pop    %ebp
 4b4:	c3                   	ret    
 4b5:	8b 75 d0             	mov    -0x30(%ebp),%esi
 4b8:	eb ee                	jmp    4a8 <printint+0x79>

000004ba <printf>:
>>>>>>> c59b0f9 (fixed thread_join and join)

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
<<<<<<< HEAD
 4d1:	55                   	push   %ebp
 4d2:	89 e5                	mov    %esp,%ebp
 4d4:	57                   	push   %edi
 4d5:	56                   	push   %esi
 4d6:	53                   	push   %ebx
 4d7:	83 ec 1c             	sub    $0x1c,%esp
=======
 4ba:	55                   	push   %ebp
 4bb:	89 e5                	mov    %esp,%ebp
 4bd:	57                   	push   %edi
 4be:	56                   	push   %esi
 4bf:	53                   	push   %ebx
 4c0:	83 ec 1c             	sub    $0x1c,%esp
>>>>>>> c59b0f9 (fixed thread_join and join)
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
<<<<<<< HEAD
 4da:	8d 45 10             	lea    0x10(%ebp),%eax
 4dd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 4e0:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 4e5:	bb 00 00 00 00       	mov    $0x0,%ebx
 4ea:	eb 14                	jmp    500 <printf+0x2f>
=======
 4c3:	8d 45 10             	lea    0x10(%ebp),%eax
 4c6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 4c9:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 4ce:	bb 00 00 00 00       	mov    $0x0,%ebx
 4d3:	eb 14                	jmp    4e9 <printf+0x2f>
>>>>>>> c59b0f9 (fixed thread_join and join)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
<<<<<<< HEAD
 4ec:	89 fa                	mov    %edi,%edx
 4ee:	8b 45 08             	mov    0x8(%ebp),%eax
 4f1:	e8 36 ff ff ff       	call   42c <putc>
 4f6:	eb 05                	jmp    4fd <printf+0x2c>
      }
    } else if(state == '%'){
 4f8:	83 fe 25             	cmp    $0x25,%esi
 4fb:	74 25                	je     522 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 4fd:	83 c3 01             	add    $0x1,%ebx
 500:	8b 45 0c             	mov    0xc(%ebp),%eax
 503:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 507:	84 c0                	test   %al,%al
 509:	0f 84 20 01 00 00    	je     62f <printf+0x15e>
    c = fmt[i] & 0xff;
 50f:	0f be f8             	movsbl %al,%edi
 512:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 515:	85 f6                	test   %esi,%esi
 517:	75 df                	jne    4f8 <printf+0x27>
      if(c == '%'){
 519:	83 f8 25             	cmp    $0x25,%eax
 51c:	75 ce                	jne    4ec <printf+0x1b>
        state = '%';
 51e:	89 c6                	mov    %eax,%esi
 520:	eb db                	jmp    4fd <printf+0x2c>
      if(c == 'd'){
 522:	83 f8 25             	cmp    $0x25,%eax
 525:	0f 84 cf 00 00 00    	je     5fa <printf+0x129>
 52b:	0f 8c dd 00 00 00    	jl     60e <printf+0x13d>
 531:	83 f8 78             	cmp    $0x78,%eax
 534:	0f 8f d4 00 00 00    	jg     60e <printf+0x13d>
 53a:	83 f8 63             	cmp    $0x63,%eax
 53d:	0f 8c cb 00 00 00    	jl     60e <printf+0x13d>
 543:	83 e8 63             	sub    $0x63,%eax
 546:	83 f8 15             	cmp    $0x15,%eax
 549:	0f 87 bf 00 00 00    	ja     60e <printf+0x13d>
 54f:	ff 24 85 d8 07 00 00 	jmp    *0x7d8(,%eax,4)
        printint(fd, *ap, 10, 1);
 556:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 559:	8b 17                	mov    (%edi),%edx
 55b:	83 ec 0c             	sub    $0xc,%esp
 55e:	6a 01                	push   $0x1
 560:	b9 0a 00 00 00       	mov    $0xa,%ecx
 565:	8b 45 08             	mov    0x8(%ebp),%eax
 568:	e8 d9 fe ff ff       	call   446 <printint>
        ap++;
 56d:	83 c7 04             	add    $0x4,%edi
 570:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 573:	83 c4 10             	add    $0x10,%esp
=======
 4d5:	89 fa                	mov    %edi,%edx
 4d7:	8b 45 08             	mov    0x8(%ebp),%eax
 4da:	e8 36 ff ff ff       	call   415 <putc>
 4df:	eb 05                	jmp    4e6 <printf+0x2c>
      }
    } else if(state == '%'){
 4e1:	83 fe 25             	cmp    $0x25,%esi
 4e4:	74 25                	je     50b <printf+0x51>
  for(i = 0; fmt[i]; i++){
 4e6:	83 c3 01             	add    $0x1,%ebx
 4e9:	8b 45 0c             	mov    0xc(%ebp),%eax
 4ec:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 4f0:	84 c0                	test   %al,%al
 4f2:	0f 84 20 01 00 00    	je     618 <printf+0x15e>
    c = fmt[i] & 0xff;
 4f8:	0f be f8             	movsbl %al,%edi
 4fb:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 4fe:	85 f6                	test   %esi,%esi
 500:	75 df                	jne    4e1 <printf+0x27>
      if(c == '%'){
 502:	83 f8 25             	cmp    $0x25,%eax
 505:	75 ce                	jne    4d5 <printf+0x1b>
        state = '%';
 507:	89 c6                	mov    %eax,%esi
 509:	eb db                	jmp    4e6 <printf+0x2c>
      if(c == 'd'){
 50b:	83 f8 25             	cmp    $0x25,%eax
 50e:	0f 84 cf 00 00 00    	je     5e3 <printf+0x129>
 514:	0f 8c dd 00 00 00    	jl     5f7 <printf+0x13d>
 51a:	83 f8 78             	cmp    $0x78,%eax
 51d:	0f 8f d4 00 00 00    	jg     5f7 <printf+0x13d>
 523:	83 f8 63             	cmp    $0x63,%eax
 526:	0f 8c cb 00 00 00    	jl     5f7 <printf+0x13d>
 52c:	83 e8 63             	sub    $0x63,%eax
 52f:	83 f8 15             	cmp    $0x15,%eax
 532:	0f 87 bf 00 00 00    	ja     5f7 <printf+0x13d>
 538:	ff 24 85 c0 07 00 00 	jmp    *0x7c0(,%eax,4)
        printint(fd, *ap, 10, 1);
 53f:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 542:	8b 17                	mov    (%edi),%edx
 544:	83 ec 0c             	sub    $0xc,%esp
 547:	6a 01                	push   $0x1
 549:	b9 0a 00 00 00       	mov    $0xa,%ecx
 54e:	8b 45 08             	mov    0x8(%ebp),%eax
 551:	e8 d9 fe ff ff       	call   42f <printint>
        ap++;
 556:	83 c7 04             	add    $0x4,%edi
 559:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 55c:	83 c4 10             	add    $0x10,%esp
>>>>>>> c59b0f9 (fixed thread_join and join)
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
<<<<<<< HEAD
 576:	be 00 00 00 00       	mov    $0x0,%esi
 57b:	eb 80                	jmp    4fd <printf+0x2c>
        printint(fd, *ap, 16, 0);
 57d:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 580:	8b 17                	mov    (%edi),%edx
 582:	83 ec 0c             	sub    $0xc,%esp
 585:	6a 00                	push   $0x0
 587:	b9 10 00 00 00       	mov    $0x10,%ecx
 58c:	8b 45 08             	mov    0x8(%ebp),%eax
 58f:	e8 b2 fe ff ff       	call   446 <printint>
        ap++;
 594:	83 c7 04             	add    $0x4,%edi
 597:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 59a:	83 c4 10             	add    $0x10,%esp
      state = 0;
 59d:	be 00 00 00 00       	mov    $0x0,%esi
 5a2:	e9 56 ff ff ff       	jmp    4fd <printf+0x2c>
        s = (char*)*ap;
 5a7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5aa:	8b 30                	mov    (%eax),%esi
        ap++;
 5ac:	83 c0 04             	add    $0x4,%eax
 5af:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 5b2:	85 f6                	test   %esi,%esi
 5b4:	75 15                	jne    5cb <printf+0xfa>
          s = "(null)";
 5b6:	be d0 07 00 00       	mov    $0x7d0,%esi
 5bb:	eb 0e                	jmp    5cb <printf+0xfa>
          putc(fd, *s);
 5bd:	0f be d2             	movsbl %dl,%edx
 5c0:	8b 45 08             	mov    0x8(%ebp),%eax
 5c3:	e8 64 fe ff ff       	call   42c <putc>
          s++;
 5c8:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 5cb:	0f b6 16             	movzbl (%esi),%edx
 5ce:	84 d2                	test   %dl,%dl
 5d0:	75 eb                	jne    5bd <printf+0xec>
      state = 0;
 5d2:	be 00 00 00 00       	mov    $0x0,%esi
 5d7:	e9 21 ff ff ff       	jmp    4fd <printf+0x2c>
        putc(fd, *ap);
 5dc:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5df:	0f be 17             	movsbl (%edi),%edx
 5e2:	8b 45 08             	mov    0x8(%ebp),%eax
 5e5:	e8 42 fe ff ff       	call   42c <putc>
        ap++;
 5ea:	83 c7 04             	add    $0x4,%edi
 5ed:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 5f0:	be 00 00 00 00       	mov    $0x0,%esi
 5f5:	e9 03 ff ff ff       	jmp    4fd <printf+0x2c>
        putc(fd, c);
 5fa:	89 fa                	mov    %edi,%edx
 5fc:	8b 45 08             	mov    0x8(%ebp),%eax
 5ff:	e8 28 fe ff ff       	call   42c <putc>
      state = 0;
 604:	be 00 00 00 00       	mov    $0x0,%esi
 609:	e9 ef fe ff ff       	jmp    4fd <printf+0x2c>
        putc(fd, '%');
 60e:	ba 25 00 00 00       	mov    $0x25,%edx
 613:	8b 45 08             	mov    0x8(%ebp),%eax
 616:	e8 11 fe ff ff       	call   42c <putc>
        putc(fd, c);
 61b:	89 fa                	mov    %edi,%edx
 61d:	8b 45 08             	mov    0x8(%ebp),%eax
 620:	e8 07 fe ff ff       	call   42c <putc>
      state = 0;
 625:	be 00 00 00 00       	mov    $0x0,%esi
 62a:	e9 ce fe ff ff       	jmp    4fd <printf+0x2c>
    }
  }
}
 62f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 632:	5b                   	pop    %ebx
 633:	5e                   	pop    %esi
 634:	5f                   	pop    %edi
 635:	5d                   	pop    %ebp
 636:	c3                   	ret    

00000637 <free>:
=======
 55f:	be 00 00 00 00       	mov    $0x0,%esi
 564:	eb 80                	jmp    4e6 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 566:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 569:	8b 17                	mov    (%edi),%edx
 56b:	83 ec 0c             	sub    $0xc,%esp
 56e:	6a 00                	push   $0x0
 570:	b9 10 00 00 00       	mov    $0x10,%ecx
 575:	8b 45 08             	mov    0x8(%ebp),%eax
 578:	e8 b2 fe ff ff       	call   42f <printint>
        ap++;
 57d:	83 c7 04             	add    $0x4,%edi
 580:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 583:	83 c4 10             	add    $0x10,%esp
      state = 0;
 586:	be 00 00 00 00       	mov    $0x0,%esi
 58b:	e9 56 ff ff ff       	jmp    4e6 <printf+0x2c>
        s = (char*)*ap;
 590:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 593:	8b 30                	mov    (%eax),%esi
        ap++;
 595:	83 c0 04             	add    $0x4,%eax
 598:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 59b:	85 f6                	test   %esi,%esi
 59d:	75 15                	jne    5b4 <printf+0xfa>
          s = "(null)";
 59f:	be b8 07 00 00       	mov    $0x7b8,%esi
 5a4:	eb 0e                	jmp    5b4 <printf+0xfa>
          putc(fd, *s);
 5a6:	0f be d2             	movsbl %dl,%edx
 5a9:	8b 45 08             	mov    0x8(%ebp),%eax
 5ac:	e8 64 fe ff ff       	call   415 <putc>
          s++;
 5b1:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 5b4:	0f b6 16             	movzbl (%esi),%edx
 5b7:	84 d2                	test   %dl,%dl
 5b9:	75 eb                	jne    5a6 <printf+0xec>
      state = 0;
 5bb:	be 00 00 00 00       	mov    $0x0,%esi
 5c0:	e9 21 ff ff ff       	jmp    4e6 <printf+0x2c>
        putc(fd, *ap);
 5c5:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5c8:	0f be 17             	movsbl (%edi),%edx
 5cb:	8b 45 08             	mov    0x8(%ebp),%eax
 5ce:	e8 42 fe ff ff       	call   415 <putc>
        ap++;
 5d3:	83 c7 04             	add    $0x4,%edi
 5d6:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 5d9:	be 00 00 00 00       	mov    $0x0,%esi
 5de:	e9 03 ff ff ff       	jmp    4e6 <printf+0x2c>
        putc(fd, c);
 5e3:	89 fa                	mov    %edi,%edx
 5e5:	8b 45 08             	mov    0x8(%ebp),%eax
 5e8:	e8 28 fe ff ff       	call   415 <putc>
      state = 0;
 5ed:	be 00 00 00 00       	mov    $0x0,%esi
 5f2:	e9 ef fe ff ff       	jmp    4e6 <printf+0x2c>
        putc(fd, '%');
 5f7:	ba 25 00 00 00       	mov    $0x25,%edx
 5fc:	8b 45 08             	mov    0x8(%ebp),%eax
 5ff:	e8 11 fe ff ff       	call   415 <putc>
        putc(fd, c);
 604:	89 fa                	mov    %edi,%edx
 606:	8b 45 08             	mov    0x8(%ebp),%eax
 609:	e8 07 fe ff ff       	call   415 <putc>
      state = 0;
 60e:	be 00 00 00 00       	mov    $0x0,%esi
 613:	e9 ce fe ff ff       	jmp    4e6 <printf+0x2c>
    }
  }
}
 618:	8d 65 f4             	lea    -0xc(%ebp),%esp
 61b:	5b                   	pop    %ebx
 61c:	5e                   	pop    %esi
 61d:	5f                   	pop    %edi
 61e:	5d                   	pop    %ebp
 61f:	c3                   	ret    

00000620 <free>:
>>>>>>> c59b0f9 (fixed thread_join and join)
static Header base;
static Header *freep;

void
free(void *ap)
{
<<<<<<< HEAD
 637:	55                   	push   %ebp
 638:	89 e5                	mov    %esp,%ebp
 63a:	57                   	push   %edi
 63b:	56                   	push   %esi
 63c:	53                   	push   %ebx
 63d:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 640:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 643:	a1 c0 0c 00 00       	mov    0xcc0,%eax
 648:	eb 02                	jmp    64c <free+0x15>
 64a:	89 d0                	mov    %edx,%eax
 64c:	39 c8                	cmp    %ecx,%eax
 64e:	73 04                	jae    654 <free+0x1d>
 650:	39 08                	cmp    %ecx,(%eax)
 652:	77 12                	ja     666 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 654:	8b 10                	mov    (%eax),%edx
 656:	39 c2                	cmp    %eax,%edx
 658:	77 f0                	ja     64a <free+0x13>
 65a:	39 c8                	cmp    %ecx,%eax
 65c:	72 08                	jb     666 <free+0x2f>
 65e:	39 ca                	cmp    %ecx,%edx
 660:	77 04                	ja     666 <free+0x2f>
 662:	89 d0                	mov    %edx,%eax
 664:	eb e6                	jmp    64c <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 666:	8b 73 fc             	mov    -0x4(%ebx),%esi
 669:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 66c:	8b 10                	mov    (%eax),%edx
 66e:	39 d7                	cmp    %edx,%edi
 670:	74 19                	je     68b <free+0x54>
=======
 620:	55                   	push   %ebp
 621:	89 e5                	mov    %esp,%ebp
 623:	57                   	push   %edi
 624:	56                   	push   %esi
 625:	53                   	push   %ebx
 626:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 629:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 62c:	a1 a0 0e 00 00       	mov    0xea0,%eax
 631:	eb 02                	jmp    635 <free+0x15>
 633:	89 d0                	mov    %edx,%eax
 635:	39 c8                	cmp    %ecx,%eax
 637:	73 04                	jae    63d <free+0x1d>
 639:	39 08                	cmp    %ecx,(%eax)
 63b:	77 12                	ja     64f <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 63d:	8b 10                	mov    (%eax),%edx
 63f:	39 c2                	cmp    %eax,%edx
 641:	77 f0                	ja     633 <free+0x13>
 643:	39 c8                	cmp    %ecx,%eax
 645:	72 08                	jb     64f <free+0x2f>
 647:	39 ca                	cmp    %ecx,%edx
 649:	77 04                	ja     64f <free+0x2f>
 64b:	89 d0                	mov    %edx,%eax
 64d:	eb e6                	jmp    635 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 64f:	8b 73 fc             	mov    -0x4(%ebx),%esi
 652:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 655:	8b 10                	mov    (%eax),%edx
 657:	39 d7                	cmp    %edx,%edi
 659:	74 19                	je     674 <free+0x54>
>>>>>>> c59b0f9 (fixed thread_join and join)
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
<<<<<<< HEAD
 672:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 675:	8b 50 04             	mov    0x4(%eax),%edx
 678:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 67b:	39 ce                	cmp    %ecx,%esi
 67d:	74 1b                	je     69a <free+0x63>
=======
 65b:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 65e:	8b 50 04             	mov    0x4(%eax),%edx
 661:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 664:	39 ce                	cmp    %ecx,%esi
 666:	74 1b                	je     683 <free+0x63>
>>>>>>> c59b0f9 (fixed thread_join and join)
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
<<<<<<< HEAD
 67f:	89 08                	mov    %ecx,(%eax)
  freep = p;
 681:	a3 c0 0c 00 00       	mov    %eax,0xcc0
}
 686:	5b                   	pop    %ebx
 687:	5e                   	pop    %esi
 688:	5f                   	pop    %edi
 689:	5d                   	pop    %ebp
 68a:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 68b:	03 72 04             	add    0x4(%edx),%esi
 68e:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 691:	8b 10                	mov    (%eax),%edx
 693:	8b 12                	mov    (%edx),%edx
 695:	89 53 f8             	mov    %edx,-0x8(%ebx)
 698:	eb db                	jmp    675 <free+0x3e>
    p->s.size += bp->s.size;
 69a:	03 53 fc             	add    -0x4(%ebx),%edx
 69d:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6a0:	8b 53 f8             	mov    -0x8(%ebx),%edx
 6a3:	89 10                	mov    %edx,(%eax)
 6a5:	eb da                	jmp    681 <free+0x4a>

000006a7 <morecore>:
=======
 668:	89 08                	mov    %ecx,(%eax)
  freep = p;
 66a:	a3 a0 0e 00 00       	mov    %eax,0xea0
}
 66f:	5b                   	pop    %ebx
 670:	5e                   	pop    %esi
 671:	5f                   	pop    %edi
 672:	5d                   	pop    %ebp
 673:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 674:	03 72 04             	add    0x4(%edx),%esi
 677:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 67a:	8b 10                	mov    (%eax),%edx
 67c:	8b 12                	mov    (%edx),%edx
 67e:	89 53 f8             	mov    %edx,-0x8(%ebx)
 681:	eb db                	jmp    65e <free+0x3e>
    p->s.size += bp->s.size;
 683:	03 53 fc             	add    -0x4(%ebx),%edx
 686:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 689:	8b 53 f8             	mov    -0x8(%ebx),%edx
 68c:	89 10                	mov    %edx,(%eax)
 68e:	eb da                	jmp    66a <free+0x4a>

00000690 <morecore>:
>>>>>>> c59b0f9 (fixed thread_join and join)

static Header*
morecore(uint nu)
{
<<<<<<< HEAD
 6a7:	55                   	push   %ebp
 6a8:	89 e5                	mov    %esp,%ebp
 6aa:	53                   	push   %ebx
 6ab:	83 ec 04             	sub    $0x4,%esp
 6ae:	89 c3                	mov    %eax,%ebx
=======
 690:	55                   	push   %ebp
 691:	89 e5                	mov    %esp,%ebp
 693:	53                   	push   %ebx
 694:	83 ec 04             	sub    $0x4,%esp
 697:	89 c3                	mov    %eax,%ebx
>>>>>>> c59b0f9 (fixed thread_join and join)
  char *p;
  Header *hp;

  if(nu < 4096)
<<<<<<< HEAD
 6b0:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 6b5:	77 05                	ja     6bc <morecore+0x15>
    nu = 4096;
 6b7:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 6bc:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 6c3:	83 ec 0c             	sub    $0xc,%esp
 6c6:	50                   	push   %eax
 6c7:	e8 38 fd ff ff       	call   404 <sbrk>
  if(p == (char*)-1)
 6cc:	83 c4 10             	add    $0x10,%esp
 6cf:	83 f8 ff             	cmp    $0xffffffff,%eax
 6d2:	74 1c                	je     6f0 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 6d4:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 6d7:	83 c0 08             	add    $0x8,%eax
 6da:	83 ec 0c             	sub    $0xc,%esp
 6dd:	50                   	push   %eax
 6de:	e8 54 ff ff ff       	call   637 <free>
  return freep;
 6e3:	a1 c0 0c 00 00       	mov    0xcc0,%eax
 6e8:	83 c4 10             	add    $0x10,%esp
}
 6eb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 6ee:	c9                   	leave  
 6ef:	c3                   	ret    
    return 0;
 6f0:	b8 00 00 00 00       	mov    $0x0,%eax
 6f5:	eb f4                	jmp    6eb <morecore+0x44>

000006f7 <malloc>:
=======
 699:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 69e:	77 05                	ja     6a5 <morecore+0x15>
    nu = 4096;
 6a0:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 6a5:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 6ac:	83 ec 0c             	sub    $0xc,%esp
 6af:	50                   	push   %eax
 6b0:	e8 38 fd ff ff       	call   3ed <sbrk>
  if(p == (char*)-1)
 6b5:	83 c4 10             	add    $0x10,%esp
 6b8:	83 f8 ff             	cmp    $0xffffffff,%eax
 6bb:	74 1c                	je     6d9 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 6bd:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 6c0:	83 c0 08             	add    $0x8,%eax
 6c3:	83 ec 0c             	sub    $0xc,%esp
 6c6:	50                   	push   %eax
 6c7:	e8 54 ff ff ff       	call   620 <free>
  return freep;
 6cc:	a1 a0 0e 00 00       	mov    0xea0,%eax
 6d1:	83 c4 10             	add    $0x10,%esp
}
 6d4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 6d7:	c9                   	leave  
 6d8:	c3                   	ret    
    return 0;
 6d9:	b8 00 00 00 00       	mov    $0x0,%eax
 6de:	eb f4                	jmp    6d4 <morecore+0x44>

000006e0 <malloc>:
>>>>>>> c59b0f9 (fixed thread_join and join)

void*
malloc(uint nbytes)
{
<<<<<<< HEAD
 6f7:	55                   	push   %ebp
 6f8:	89 e5                	mov    %esp,%ebp
 6fa:	53                   	push   %ebx
 6fb:	83 ec 04             	sub    $0x4,%esp
=======
 6e0:	55                   	push   %ebp
 6e1:	89 e5                	mov    %esp,%ebp
 6e3:	53                   	push   %ebx
 6e4:	83 ec 04             	sub    $0x4,%esp
>>>>>>> c59b0f9 (fixed thread_join and join)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
<<<<<<< HEAD
 6fe:	8b 45 08             	mov    0x8(%ebp),%eax
 701:	8d 58 07             	lea    0x7(%eax),%ebx
 704:	c1 eb 03             	shr    $0x3,%ebx
 707:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 70a:	8b 0d c0 0c 00 00    	mov    0xcc0,%ecx
 710:	85 c9                	test   %ecx,%ecx
 712:	74 04                	je     718 <malloc+0x21>
=======
 6e7:	8b 45 08             	mov    0x8(%ebp),%eax
 6ea:	8d 58 07             	lea    0x7(%eax),%ebx
 6ed:	c1 eb 03             	shr    $0x3,%ebx
 6f0:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 6f3:	8b 0d a0 0e 00 00    	mov    0xea0,%ecx
 6f9:	85 c9                	test   %ecx,%ecx
 6fb:	74 04                	je     701 <malloc+0x21>
>>>>>>> c59b0f9 (fixed thread_join and join)
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
<<<<<<< HEAD
 714:	8b 01                	mov    (%ecx),%eax
 716:	eb 4a                	jmp    762 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 718:	c7 05 c0 0c 00 00 c4 	movl   $0xcc4,0xcc0
 71f:	0c 00 00 
 722:	c7 05 c4 0c 00 00 c4 	movl   $0xcc4,0xcc4
 729:	0c 00 00 
    base.s.size = 0;
 72c:	c7 05 c8 0c 00 00 00 	movl   $0x0,0xcc8
 733:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 736:	b9 c4 0c 00 00       	mov    $0xcc4,%ecx
 73b:	eb d7                	jmp    714 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 73d:	74 19                	je     758 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 73f:	29 da                	sub    %ebx,%edx
 741:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 744:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 747:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 74a:	89 0d c0 0c 00 00    	mov    %ecx,0xcc0
      return (void*)(p + 1);
 750:	83 c0 08             	add    $0x8,%eax
=======
 6fd:	8b 01                	mov    (%ecx),%eax
 6ff:	eb 4a                	jmp    74b <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 701:	c7 05 a0 0e 00 00 a4 	movl   $0xea4,0xea0
 708:	0e 00 00 
 70b:	c7 05 a4 0e 00 00 a4 	movl   $0xea4,0xea4
 712:	0e 00 00 
    base.s.size = 0;
 715:	c7 05 a8 0e 00 00 00 	movl   $0x0,0xea8
 71c:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 71f:	b9 a4 0e 00 00       	mov    $0xea4,%ecx
 724:	eb d7                	jmp    6fd <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 726:	74 19                	je     741 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 728:	29 da                	sub    %ebx,%edx
 72a:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 72d:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 730:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 733:	89 0d a0 0e 00 00    	mov    %ecx,0xea0
      return (void*)(p + 1);
 739:	83 c0 08             	add    $0x8,%eax
>>>>>>> c59b0f9 (fixed thread_join and join)
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
<<<<<<< HEAD
 753:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 756:	c9                   	leave  
 757:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 758:	8b 10                	mov    (%eax),%edx
 75a:	89 11                	mov    %edx,(%ecx)
 75c:	eb ec                	jmp    74a <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 75e:	89 c1                	mov    %eax,%ecx
 760:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 762:	8b 50 04             	mov    0x4(%eax),%edx
 765:	39 da                	cmp    %ebx,%edx
 767:	73 d4                	jae    73d <malloc+0x46>
    if(p == freep)
 769:	39 05 c0 0c 00 00    	cmp    %eax,0xcc0
 76f:	75 ed                	jne    75e <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 771:	89 d8                	mov    %ebx,%eax
 773:	e8 2f ff ff ff       	call   6a7 <morecore>
 778:	85 c0                	test   %eax,%eax
 77a:	75 e2                	jne    75e <malloc+0x67>
 77c:	eb d5                	jmp    753 <malloc+0x5c>
=======
 73c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 73f:	c9                   	leave  
 740:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 741:	8b 10                	mov    (%eax),%edx
 743:	89 11                	mov    %edx,(%ecx)
 745:	eb ec                	jmp    733 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 747:	89 c1                	mov    %eax,%ecx
 749:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 74b:	8b 50 04             	mov    0x4(%eax),%edx
 74e:	39 da                	cmp    %ebx,%edx
 750:	73 d4                	jae    726 <malloc+0x46>
    if(p == freep)
 752:	39 05 a0 0e 00 00    	cmp    %eax,0xea0
 758:	75 ed                	jne    747 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 75a:	89 d8                	mov    %ebx,%eax
 75c:	e8 2f ff ff ff       	call   690 <morecore>
 761:	85 c0                	test   %eax,%eax
 763:	75 e2                	jne    747 <malloc+0x67>
 765:	eb d5                	jmp    73c <malloc+0x5c>
>>>>>>> c59b0f9 (fixed thread_join and join)
