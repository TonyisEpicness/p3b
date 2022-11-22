
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
<<<<<<< HEAD
  2b:	68 60 0c 00 00       	push   $0xc60
  30:	ff 75 08             	push   0x8(%ebp)
  33:	e8 e1 03 00 00       	call   419 <read>
=======
  2b:	68 40 0c 00 00       	push   $0xc40
  30:	ff 75 08             	push   0x8(%ebp)
  33:	e8 ca 03 00 00       	call   402 <read>
>>>>>>> c59b0f9 (fixed thread_join and join)
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
<<<<<<< HEAD
  4f:	68 04 08 00 00       	push   $0x804
  54:	e8 86 02 00 00       	call   2df <strchr>
=======
  4f:	68 ec 07 00 00       	push   $0x7ec
  54:	e8 6f 02 00 00       	call   2c8 <strchr>
>>>>>>> c59b0f9 (fixed thread_join and join)
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
<<<<<<< HEAD
  71:	0f b6 83 60 0c 00 00 	movzbl 0xc60(%ebx),%eax
=======
  71:	0f b6 83 40 0c 00 00 	movzbl 0xc40(%ebx),%eax
>>>>>>> c59b0f9 (fixed thread_join and join)
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
<<<<<<< HEAD
  a4:	68 1a 08 00 00       	push   $0x81a
  a9:	6a 01                	push   $0x1
  ab:	e8 a6 04 00 00       	call   556 <printf>
=======
  a4:	68 02 08 00 00       	push   $0x802
  a9:	6a 01                	push   $0x1
  ab:	e8 8f 04 00 00       	call   53f <printf>
>>>>>>> c59b0f9 (fixed thread_join and join)
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
<<<<<<< HEAD
  be:	68 0a 08 00 00       	push   $0x80a
  c3:	6a 01                	push   $0x1
  c5:	e8 8c 04 00 00       	call   556 <printf>
    exit();
  ca:	e8 32 03 00 00       	call   401 <exit>
=======
  be:	68 f2 07 00 00       	push   $0x7f2
  c3:	6a 01                	push   $0x1
  c5:	e8 75 04 00 00       	call   53f <printf>
    exit();
  ca:	e8 1b 03 00 00       	call   3ea <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)

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
<<<<<<< HEAD
  fd:	68 19 08 00 00       	push   $0x819
 102:	6a 00                	push   $0x0
 104:	e8 f7 fe ff ff       	call   0 <wc>
    exit();
 109:	e8 f3 02 00 00       	call   401 <exit>
=======
  fd:	68 01 08 00 00       	push   $0x801
 102:	6a 00                	push   $0x0
 104:	e8 f7 fe ff ff       	call   0 <wc>
    exit();
 109:	e8 dc 02 00 00       	call   3ea <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)
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
<<<<<<< HEAD
 11c:	e8 08 03 00 00       	call   429 <close>
=======
 11c:	e8 f1 02 00 00       	call   412 <close>
>>>>>>> c59b0f9 (fixed thread_join and join)
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
<<<<<<< HEAD
 139:	e8 03 03 00 00       	call   441 <open>
=======
 139:	e8 ec 02 00 00       	call   42a <open>
>>>>>>> c59b0f9 (fixed thread_join and join)
 13e:	89 c3                	mov    %eax,%ebx
 140:	83 c4 10             	add    $0x10,%esp
 143:	85 c0                	test   %eax,%eax
 145:	79 c7                	jns    10e <main+0x3f>
      printf(1, "wc: cannot open %s\n", argv[i]);
 147:	83 ec 04             	sub    $0x4,%esp
 14a:	ff 37                	push   (%edi)
<<<<<<< HEAD
 14c:	68 27 08 00 00       	push   $0x827
 151:	6a 01                	push   $0x1
 153:	e8 fe 03 00 00       	call   556 <printf>
      exit();
 158:	e8 a4 02 00 00       	call   401 <exit>
  }
  exit();
 15d:	e8 9f 02 00 00       	call   401 <exit>
=======
 14c:	68 0f 08 00 00       	push   $0x80f
 151:	6a 01                	push   $0x1
 153:	e8 e7 03 00 00       	call   53f <printf>
      exit();
 158:	e8 8d 02 00 00       	call   3ea <exit>
  }
  exit();
 15d:	e8 88 02 00 00       	call   3ea <exit>
>>>>>>> c59b0f9 (fixed thread_join and join)

00000162 <test_and_set>:
  int flag;
};

<<<<<<< HEAD
struct thread_ref *threads[64];
=======
struct thread_ref threads[64];
>>>>>>> c59b0f9 (fixed thread_join and join)

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

// a wrapper func for clone
int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 173:	55                   	push   %ebp
 174:	89 e5                	mov    %esp,%ebp
 176:	53                   	push   %ebx
 177:	83 ec 10             	sub    $0x10,%esp
  // allocate user stack that is passed into clone using malloc -- pass its addr into clone
  void *n_stack = malloc(PGSIZE*2);
 17a:	68 00 20 00 00       	push   $0x2000
<<<<<<< HEAD
 17f:	e8 f8 05 00 00       	call   77c <malloc>
  if(n_stack == 0){
 184:	83 c4 10             	add    $0x10,%esp
 187:	85 c0                	test   %eax,%eax
 189:	74 41                	je     1cc <thread_create+0x59>
 18b:	89 c3                	mov    %eax,%ebx
    return -1;
  }
  int new_pid = clone(start_routine, arg1, arg2, n_stack);
 18d:	50                   	push   %eax
 18e:	ff 75 10             	push   0x10(%ebp)
 191:	ff 75 0c             	push   0xc(%ebp)
 194:	ff 75 08             	push   0x8(%ebp)
 197:	e8 05 03 00 00       	call   4a1 <clone>
=======
 17f:	e8 e1 05 00 00       	call   765 <malloc>
  if(n_stack == 0){
 184:	83 c4 10             	add    $0x10,%esp
 187:	85 c0                	test   %eax,%eax
 189:	74 57                	je     1e2 <thread_create+0x6f>
 18b:	89 c1                	mov    %eax,%ecx
    return -1;
  }
  
  for(int i=0; i<64; i++){
 18d:	b8 00 00 00 00       	mov    $0x0,%eax
 192:	eb 03                	jmp    197 <thread_create+0x24>
 194:	83 c0 01             	add    $0x1,%eax
 197:	83 f8 3f             	cmp    $0x3f,%eax
 19a:	7f 2f                	jg     1cb <thread_create+0x58>
    if(threads[i].flag==0){
 19c:	8d 14 40             	lea    (%eax,%eax,2),%edx
 19f:	83 3c 95 48 0e 00 00 	cmpl   $0x0,0xe48(,%edx,4)
 1a6:	00 
 1a7:	75 eb                	jne    194 <thread_create+0x21>
      threads[i].maddr = n_stack;
 1a9:	8d 14 00             	lea    (%eax,%eax,1),%edx
 1ac:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
 1af:	c1 e3 02             	shl    $0x2,%ebx
 1b2:	89 8b 40 0e 00 00    	mov    %ecx,0xe40(%ebx)
      threads[i].pg1addr = n_stack;
 1b8:	89 8b 44 0e 00 00    	mov    %ecx,0xe44(%ebx)
      threads[i].flag = 1;
 1be:	01 c2                	add    %eax,%edx
 1c0:	c7 04 95 48 0e 00 00 	movl   $0x1,0xe48(,%edx,4)
 1c7:	01 00 00 00 
      break;
    }
  }
  
  int new_pid = clone(start_routine, arg1, arg2, n_stack); // TODO: is this the right way to call it?
 1cb:	51                   	push   %ecx
 1cc:	ff 75 10             	push   0x10(%ebp)
 1cf:	ff 75 0c             	push   0xc(%ebp)
 1d2:	ff 75 08             	push   0x8(%ebp)
 1d5:	e8 b0 02 00 00       	call   48a <clone>


  // I can't remember if there was something else to do here but I'm sure I'll find out
>>>>>>> c59b0f9 (fixed thread_join and join)

  for(int i=0; i<64; i++){
 19c:	83 c4 10             	add    $0x10,%esp
 19f:	ba 00 00 00 00       	mov    $0x0,%edx
 1a4:	eb 03                	jmp    1a9 <thread_create+0x36>
 1a6:	83 c2 01             	add    $0x1,%edx
 1a9:	83 fa 3f             	cmp    $0x3f,%edx
 1ac:	7f 19                	jg     1c7 <thread_create+0x54>
    if(threads[i]->flag==0){
 1ae:	8b 0c 95 60 0e 00 00 	mov    0xe60(,%edx,4),%ecx
 1b5:	83 79 08 00          	cmpl   $0x0,0x8(%ecx)
 1b9:	75 eb                	jne    1a6 <thread_create+0x33>
      threads[i]->maddr = n_stack;
 1bb:	89 19                	mov    %ebx,(%ecx)
      threads[i]->pg1addr = n_stack;
 1bd:	8b 14 95 60 0e 00 00 	mov    0xe60(,%edx,4),%edx
 1c4:	89 5a 04             	mov    %ebx,0x4(%edx)
      break;
    }
  }

  return new_pid;
<<<<<<< HEAD
}
 1c7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1ca:	c9                   	leave  
 1cb:	c3                   	ret    
    return -1;
 1cc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 1d1:	eb f4                	jmp    1c7 <thread_create+0x54>

000001d3 <thread_join>:
=======
 1da:	83 c4 10             	add    $0x10,%esp
}
 1dd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1e0:	c9                   	leave  
 1e1:	c3                   	ret    
    return -1;
 1e2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 1e7:	eb f4                	jmp    1dd <thread_create+0x6a>

000001e9 <thread_join>:
>>>>>>> c59b0f9 (fixed thread_join and join)

//TODO: fix
int thread_join() {
<<<<<<< HEAD
 1d3:	55                   	push   %ebp
 1d4:	89 e5                	mov    %esp,%ebp
 1d6:	56                   	push   %esi
 1d7:	53                   	push   %ebx
 1d8:	83 ec 1c             	sub    $0x1c,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 1db:	8d 45 f4             	lea    -0xc(%ebp),%eax
 1de:	50                   	push   %eax
 1df:	e8 c5 02 00 00       	call   4a9 <join>
 1e4:	89 c6                	mov    %eax,%esi
  for(int i=0; i<64; i++){
 1e6:	83 c4 10             	add    $0x10,%esp
 1e9:	bb 00 00 00 00       	mov    $0x0,%ebx
 1ee:	eb 03                	jmp    1f3 <thread_join+0x20>
 1f0:	83 c3 01             	add    $0x1,%ebx
 1f3:	83 fb 3f             	cmp    $0x3f,%ebx
 1f6:	7f 23                	jg     21b <thread_join+0x48>
    if((threads[i]->flag==1) && (stk_addr == threads[i]->pg1addr)){
 1f8:	8b 04 9d 60 0e 00 00 	mov    0xe60(,%ebx,4),%eax
 1ff:	83 78 08 01          	cmpl   $0x1,0x8(%eax)
 203:	75 eb                	jne    1f0 <thread_join+0x1d>
 205:	8b 55 f4             	mov    -0xc(%ebp),%edx
 208:	39 50 04             	cmp    %edx,0x4(%eax)
 20b:	75 e3                	jne    1f0 <thread_join+0x1d>
      free(stk_addr);
 20d:	83 ec 0c             	sub    $0xc,%esp
 210:	52                   	push   %edx
 211:	e8 a6 04 00 00       	call   6bc <free>
 216:	83 c4 10             	add    $0x10,%esp
 219:	eb d5                	jmp    1f0 <thread_join+0x1d>
    }
  }
  return pid;
}
 21b:	89 f0                	mov    %esi,%eax
 21d:	8d 65 f8             	lea    -0x8(%ebp),%esp
 220:	5b                   	pop    %ebx
 221:	5e                   	pop    %esi
 222:	5d                   	pop    %ebp
 223:	c3                   	ret    

00000224 <lock_acquire>:

void lock_acquire(lock_t *lock){
 224:	55                   	push   %ebp
 225:	89 e5                	mov    %esp,%ebp
 227:	53                   	push   %ebx
 228:	83 ec 04             	sub    $0x4,%esp
 22b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 22e:	83 ec 08             	sub    $0x8,%esp
 231:	6a 01                	push   $0x1
 233:	53                   	push   %ebx
 234:	e8 29 ff ff ff       	call   162 <test_and_set>
 239:	83 c4 10             	add    $0x10,%esp
 23c:	83 f8 01             	cmp    $0x1,%eax
 23f:	74 ed                	je     22e <lock_acquire+0xa>
    ;
}
 241:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 244:	c9                   	leave  
 245:	c3                   	ret    

00000246 <lock_release>:

void lock_release(lock_t *lock) {
 246:	55                   	push   %ebp
 247:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 249:	8b 45 08             	mov    0x8(%ebp),%eax
 24c:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 252:	5d                   	pop    %ebp
 253:	c3                   	ret    

00000254 <lock_init>:

void lock_init(lock_t *lock) {
 254:	55                   	push   %ebp
 255:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 257:	8b 45 08             	mov    0x8(%ebp),%eax
 25a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 260:	5d                   	pop    %ebp
 261:	c3                   	ret    

00000262 <strcpy>:
=======
 1e9:	55                   	push   %ebp
 1ea:	89 e5                	mov    %esp,%ebp
 1ec:	53                   	push   %ebx
 1ed:	83 ec 20             	sub    $0x20,%esp
  void *stk_addr;
  int pid = join(&stk_addr);
 1f0:	8d 45 f4             	lea    -0xc(%ebp),%eax
 1f3:	50                   	push   %eax
 1f4:	e8 99 02 00 00       	call   492 <join>
 1f9:	89 c3                	mov    %eax,%ebx
  free(stk_addr);
 1fb:	83 c4 04             	add    $0x4,%esp
 1fe:	ff 75 f4             	push   -0xc(%ebp)
 201:	e8 9f 04 00 00       	call   6a5 <free>
  return pid;
}
 206:	89 d8                	mov    %ebx,%eax
 208:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 20b:	c9                   	leave  
 20c:	c3                   	ret    

0000020d <lock_acquire>:

void lock_acquire(lock_t *lock){
 20d:	55                   	push   %ebp
 20e:	89 e5                	mov    %esp,%ebp
 210:	53                   	push   %ebx
 211:	83 ec 04             	sub    $0x4,%esp
 214:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(test_and_set(&lock->flag, 1) == 1)
 217:	83 ec 08             	sub    $0x8,%esp
 21a:	6a 01                	push   $0x1
 21c:	53                   	push   %ebx
 21d:	e8 40 ff ff ff       	call   162 <test_and_set>
 222:	83 c4 10             	add    $0x10,%esp
 225:	83 f8 01             	cmp    $0x1,%eax
 228:	74 ed                	je     217 <lock_acquire+0xa>
    ;
}
 22a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 22d:	c9                   	leave  
 22e:	c3                   	ret    

0000022f <lock_release>:

void lock_release(lock_t *lock) {
 22f:	55                   	push   %ebp
 230:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 232:	8b 45 08             	mov    0x8(%ebp),%eax
 235:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 23b:	5d                   	pop    %ebp
 23c:	c3                   	ret    

0000023d <lock_init>:

void lock_init(lock_t *lock) {
 23d:	55                   	push   %ebp
 23e:	89 e5                	mov    %esp,%ebp
  lock->flag = 0;
 240:	8b 45 08             	mov    0x8(%ebp),%eax
 243:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 249:	5d                   	pop    %ebp
 24a:	c3                   	ret    

0000024b <strcpy>:
>>>>>>> c59b0f9 (fixed thread_join and join)

char*
strcpy(char *s, const char *t)
{
<<<<<<< HEAD
 262:	55                   	push   %ebp
 263:	89 e5                	mov    %esp,%ebp
 265:	56                   	push   %esi
 266:	53                   	push   %ebx
 267:	8b 75 08             	mov    0x8(%ebp),%esi
 26a:	8b 55 0c             	mov    0xc(%ebp),%edx
=======
 24b:	55                   	push   %ebp
 24c:	89 e5                	mov    %esp,%ebp
 24e:	56                   	push   %esi
 24f:	53                   	push   %ebx
 250:	8b 75 08             	mov    0x8(%ebp),%esi
 253:	8b 55 0c             	mov    0xc(%ebp),%edx
>>>>>>> c59b0f9 (fixed thread_join and join)
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
<<<<<<< HEAD
 26d:	89 f0                	mov    %esi,%eax
 26f:	89 d1                	mov    %edx,%ecx
 271:	83 c2 01             	add    $0x1,%edx
 274:	89 c3                	mov    %eax,%ebx
 276:	83 c0 01             	add    $0x1,%eax
 279:	0f b6 09             	movzbl (%ecx),%ecx
 27c:	88 0b                	mov    %cl,(%ebx)
 27e:	84 c9                	test   %cl,%cl
 280:	75 ed                	jne    26f <strcpy+0xd>
    ;
  return os;
}
 282:	89 f0                	mov    %esi,%eax
 284:	5b                   	pop    %ebx
 285:	5e                   	pop    %esi
 286:	5d                   	pop    %ebp
 287:	c3                   	ret    

00000288 <strcmp>:
=======
 256:	89 f0                	mov    %esi,%eax
 258:	89 d1                	mov    %edx,%ecx
 25a:	83 c2 01             	add    $0x1,%edx
 25d:	89 c3                	mov    %eax,%ebx
 25f:	83 c0 01             	add    $0x1,%eax
 262:	0f b6 09             	movzbl (%ecx),%ecx
 265:	88 0b                	mov    %cl,(%ebx)
 267:	84 c9                	test   %cl,%cl
 269:	75 ed                	jne    258 <strcpy+0xd>
    ;
  return os;
}
 26b:	89 f0                	mov    %esi,%eax
 26d:	5b                   	pop    %ebx
 26e:	5e                   	pop    %esi
 26f:	5d                   	pop    %ebp
 270:	c3                   	ret    

00000271 <strcmp>:
>>>>>>> c59b0f9 (fixed thread_join and join)

int
strcmp(const char *p, const char *q)
{
<<<<<<< HEAD
 288:	55                   	push   %ebp
 289:	89 e5                	mov    %esp,%ebp
 28b:	8b 4d 08             	mov    0x8(%ebp),%ecx
 28e:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 291:	eb 06                	jmp    299 <strcmp+0x11>
    p++, q++;
 293:	83 c1 01             	add    $0x1,%ecx
 296:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 299:	0f b6 01             	movzbl (%ecx),%eax
 29c:	84 c0                	test   %al,%al
 29e:	74 04                	je     2a4 <strcmp+0x1c>
 2a0:	3a 02                	cmp    (%edx),%al
 2a2:	74 ef                	je     293 <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 2a4:	0f b6 c0             	movzbl %al,%eax
 2a7:	0f b6 12             	movzbl (%edx),%edx
 2aa:	29 d0                	sub    %edx,%eax
}
 2ac:	5d                   	pop    %ebp
 2ad:	c3                   	ret    

000002ae <strlen>:
=======
 271:	55                   	push   %ebp
 272:	89 e5                	mov    %esp,%ebp
 274:	8b 4d 08             	mov    0x8(%ebp),%ecx
 277:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 27a:	eb 06                	jmp    282 <strcmp+0x11>
    p++, q++;
 27c:	83 c1 01             	add    $0x1,%ecx
 27f:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 282:	0f b6 01             	movzbl (%ecx),%eax
 285:	84 c0                	test   %al,%al
 287:	74 04                	je     28d <strcmp+0x1c>
 289:	3a 02                	cmp    (%edx),%al
 28b:	74 ef                	je     27c <strcmp+0xb>
  return (uchar)*p - (uchar)*q;
 28d:	0f b6 c0             	movzbl %al,%eax
 290:	0f b6 12             	movzbl (%edx),%edx
 293:	29 d0                	sub    %edx,%eax
}
 295:	5d                   	pop    %ebp
 296:	c3                   	ret    

00000297 <strlen>:
>>>>>>> c59b0f9 (fixed thread_join and join)

uint
strlen(const char *s)
{
<<<<<<< HEAD
 2ae:	55                   	push   %ebp
 2af:	89 e5                	mov    %esp,%ebp
 2b1:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 2b4:	b8 00 00 00 00       	mov    $0x0,%eax
 2b9:	eb 03                	jmp    2be <strlen+0x10>
 2bb:	83 c0 01             	add    $0x1,%eax
 2be:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 2c2:	75 f7                	jne    2bb <strlen+0xd>
    ;
  return n;
}
 2c4:	5d                   	pop    %ebp
 2c5:	c3                   	ret    

000002c6 <memset>:
=======
 297:	55                   	push   %ebp
 298:	89 e5                	mov    %esp,%ebp
 29a:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 29d:	b8 00 00 00 00       	mov    $0x0,%eax
 2a2:	eb 03                	jmp    2a7 <strlen+0x10>
 2a4:	83 c0 01             	add    $0x1,%eax
 2a7:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 2ab:	75 f7                	jne    2a4 <strlen+0xd>
    ;
  return n;
}
 2ad:	5d                   	pop    %ebp
 2ae:	c3                   	ret    

000002af <memset>:
>>>>>>> c59b0f9 (fixed thread_join and join)

void*
memset(void *dst, int c, uint n)
{
<<<<<<< HEAD
 2c6:	55                   	push   %ebp
 2c7:	89 e5                	mov    %esp,%ebp
 2c9:	57                   	push   %edi
 2ca:	8b 55 08             	mov    0x8(%ebp),%edx
=======
 2af:	55                   	push   %ebp
 2b0:	89 e5                	mov    %esp,%ebp
 2b2:	57                   	push   %edi
 2b3:	8b 55 08             	mov    0x8(%ebp),%edx
>>>>>>> c59b0f9 (fixed thread_join and join)
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
<<<<<<< HEAD
 2cd:	89 d7                	mov    %edx,%edi
 2cf:	8b 4d 10             	mov    0x10(%ebp),%ecx
 2d2:	8b 45 0c             	mov    0xc(%ebp),%eax
 2d5:	fc                   	cld    
 2d6:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 2d8:	89 d0                	mov    %edx,%eax
 2da:	8b 7d fc             	mov    -0x4(%ebp),%edi
 2dd:	c9                   	leave  
 2de:	c3                   	ret    

000002df <strchr>:
=======
 2b6:	89 d7                	mov    %edx,%edi
 2b8:	8b 4d 10             	mov    0x10(%ebp),%ecx
 2bb:	8b 45 0c             	mov    0xc(%ebp),%eax
 2be:	fc                   	cld    
 2bf:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 2c1:	89 d0                	mov    %edx,%eax
 2c3:	8b 7d fc             	mov    -0x4(%ebp),%edi
 2c6:	c9                   	leave  
 2c7:	c3                   	ret    

000002c8 <strchr>:
>>>>>>> c59b0f9 (fixed thread_join and join)

char*
strchr(const char *s, char c)
{
<<<<<<< HEAD
 2df:	55                   	push   %ebp
 2e0:	89 e5                	mov    %esp,%ebp
 2e2:	8b 45 08             	mov    0x8(%ebp),%eax
 2e5:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 2e9:	eb 03                	jmp    2ee <strchr+0xf>
 2eb:	83 c0 01             	add    $0x1,%eax
 2ee:	0f b6 10             	movzbl (%eax),%edx
 2f1:	84 d2                	test   %dl,%dl
 2f3:	74 06                	je     2fb <strchr+0x1c>
    if(*s == c)
 2f5:	38 ca                	cmp    %cl,%dl
 2f7:	75 f2                	jne    2eb <strchr+0xc>
 2f9:	eb 05                	jmp    300 <strchr+0x21>
      return (char*)s;
  return 0;
 2fb:	b8 00 00 00 00       	mov    $0x0,%eax
}
 300:	5d                   	pop    %ebp
 301:	c3                   	ret    

00000302 <gets>:
=======
 2c8:	55                   	push   %ebp
 2c9:	89 e5                	mov    %esp,%ebp
 2cb:	8b 45 08             	mov    0x8(%ebp),%eax
 2ce:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 2d2:	eb 03                	jmp    2d7 <strchr+0xf>
 2d4:	83 c0 01             	add    $0x1,%eax
 2d7:	0f b6 10             	movzbl (%eax),%edx
 2da:	84 d2                	test   %dl,%dl
 2dc:	74 06                	je     2e4 <strchr+0x1c>
    if(*s == c)
 2de:	38 ca                	cmp    %cl,%dl
 2e0:	75 f2                	jne    2d4 <strchr+0xc>
 2e2:	eb 05                	jmp    2e9 <strchr+0x21>
      return (char*)s;
  return 0;
 2e4:	b8 00 00 00 00       	mov    $0x0,%eax
}
 2e9:	5d                   	pop    %ebp
 2ea:	c3                   	ret    

000002eb <gets>:
>>>>>>> c59b0f9 (fixed thread_join and join)

char*
gets(char *buf, int max)
{
<<<<<<< HEAD
 302:	55                   	push   %ebp
 303:	89 e5                	mov    %esp,%ebp
 305:	57                   	push   %edi
 306:	56                   	push   %esi
 307:	53                   	push   %ebx
 308:	83 ec 1c             	sub    $0x1c,%esp
 30b:	8b 7d 08             	mov    0x8(%ebp),%edi
=======
 2eb:	55                   	push   %ebp
 2ec:	89 e5                	mov    %esp,%ebp
 2ee:	57                   	push   %edi
 2ef:	56                   	push   %esi
 2f0:	53                   	push   %ebx
 2f1:	83 ec 1c             	sub    $0x1c,%esp
 2f4:	8b 7d 08             	mov    0x8(%ebp),%edi
>>>>>>> c59b0f9 (fixed thread_join and join)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
<<<<<<< HEAD
 30e:	bb 00 00 00 00       	mov    $0x0,%ebx
 313:	89 de                	mov    %ebx,%esi
 315:	83 c3 01             	add    $0x1,%ebx
 318:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 31b:	7d 2e                	jge    34b <gets+0x49>
    cc = read(0, &c, 1);
 31d:	83 ec 04             	sub    $0x4,%esp
 320:	6a 01                	push   $0x1
 322:	8d 45 e7             	lea    -0x19(%ebp),%eax
 325:	50                   	push   %eax
 326:	6a 00                	push   $0x0
 328:	e8 ec 00 00 00       	call   419 <read>
    if(cc < 1)
 32d:	83 c4 10             	add    $0x10,%esp
 330:	85 c0                	test   %eax,%eax
 332:	7e 17                	jle    34b <gets+0x49>
      break;
    buf[i++] = c;
 334:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 338:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 33b:	3c 0a                	cmp    $0xa,%al
 33d:	0f 94 c2             	sete   %dl
 340:	3c 0d                	cmp    $0xd,%al
 342:	0f 94 c0             	sete   %al
 345:	08 c2                	or     %al,%dl
 347:	74 ca                	je     313 <gets+0x11>
    buf[i++] = c;
 349:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 34b:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 34f:	89 f8                	mov    %edi,%eax
 351:	8d 65 f4             	lea    -0xc(%ebp),%esp
 354:	5b                   	pop    %ebx
 355:	5e                   	pop    %esi
 356:	5f                   	pop    %edi
 357:	5d                   	pop    %ebp
 358:	c3                   	ret    

00000359 <stat>:
=======
 2f7:	bb 00 00 00 00       	mov    $0x0,%ebx
 2fc:	89 de                	mov    %ebx,%esi
 2fe:	83 c3 01             	add    $0x1,%ebx
 301:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 304:	7d 2e                	jge    334 <gets+0x49>
    cc = read(0, &c, 1);
 306:	83 ec 04             	sub    $0x4,%esp
 309:	6a 01                	push   $0x1
 30b:	8d 45 e7             	lea    -0x19(%ebp),%eax
 30e:	50                   	push   %eax
 30f:	6a 00                	push   $0x0
 311:	e8 ec 00 00 00       	call   402 <read>
    if(cc < 1)
 316:	83 c4 10             	add    $0x10,%esp
 319:	85 c0                	test   %eax,%eax
 31b:	7e 17                	jle    334 <gets+0x49>
      break;
    buf[i++] = c;
 31d:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 321:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 324:	3c 0a                	cmp    $0xa,%al
 326:	0f 94 c2             	sete   %dl
 329:	3c 0d                	cmp    $0xd,%al
 32b:	0f 94 c0             	sete   %al
 32e:	08 c2                	or     %al,%dl
 330:	74 ca                	je     2fc <gets+0x11>
    buf[i++] = c;
 332:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 334:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 338:	89 f8                	mov    %edi,%eax
 33a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 33d:	5b                   	pop    %ebx
 33e:	5e                   	pop    %esi
 33f:	5f                   	pop    %edi
 340:	5d                   	pop    %ebp
 341:	c3                   	ret    

00000342 <stat>:
>>>>>>> c59b0f9 (fixed thread_join and join)

int
stat(const char *n, struct stat *st)
{
<<<<<<< HEAD
 359:	55                   	push   %ebp
 35a:	89 e5                	mov    %esp,%ebp
 35c:	56                   	push   %esi
 35d:	53                   	push   %ebx
=======
 342:	55                   	push   %ebp
 343:	89 e5                	mov    %esp,%ebp
 345:	56                   	push   %esi
 346:	53                   	push   %ebx
>>>>>>> c59b0f9 (fixed thread_join and join)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
<<<<<<< HEAD
 35e:	83 ec 08             	sub    $0x8,%esp
 361:	6a 00                	push   $0x0
 363:	ff 75 08             	push   0x8(%ebp)
 366:	e8 d6 00 00 00       	call   441 <open>
  if(fd < 0)
 36b:	83 c4 10             	add    $0x10,%esp
 36e:	85 c0                	test   %eax,%eax
 370:	78 24                	js     396 <stat+0x3d>
 372:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 374:	83 ec 08             	sub    $0x8,%esp
 377:	ff 75 0c             	push   0xc(%ebp)
 37a:	50                   	push   %eax
 37b:	e8 d9 00 00 00       	call   459 <fstat>
 380:	89 c6                	mov    %eax,%esi
  close(fd);
 382:	89 1c 24             	mov    %ebx,(%esp)
 385:	e8 9f 00 00 00       	call   429 <close>
  return r;
 38a:	83 c4 10             	add    $0x10,%esp
}
 38d:	89 f0                	mov    %esi,%eax
 38f:	8d 65 f8             	lea    -0x8(%ebp),%esp
 392:	5b                   	pop    %ebx
 393:	5e                   	pop    %esi
 394:	5d                   	pop    %ebp
 395:	c3                   	ret    
    return -1;
 396:	be ff ff ff ff       	mov    $0xffffffff,%esi
 39b:	eb f0                	jmp    38d <stat+0x34>

0000039d <atoi>:
=======
 347:	83 ec 08             	sub    $0x8,%esp
 34a:	6a 00                	push   $0x0
 34c:	ff 75 08             	push   0x8(%ebp)
 34f:	e8 d6 00 00 00       	call   42a <open>
  if(fd < 0)
 354:	83 c4 10             	add    $0x10,%esp
 357:	85 c0                	test   %eax,%eax
 359:	78 24                	js     37f <stat+0x3d>
 35b:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 35d:	83 ec 08             	sub    $0x8,%esp
 360:	ff 75 0c             	push   0xc(%ebp)
 363:	50                   	push   %eax
 364:	e8 d9 00 00 00       	call   442 <fstat>
 369:	89 c6                	mov    %eax,%esi
  close(fd);
 36b:	89 1c 24             	mov    %ebx,(%esp)
 36e:	e8 9f 00 00 00       	call   412 <close>
  return r;
 373:	83 c4 10             	add    $0x10,%esp
}
 376:	89 f0                	mov    %esi,%eax
 378:	8d 65 f8             	lea    -0x8(%ebp),%esp
 37b:	5b                   	pop    %ebx
 37c:	5e                   	pop    %esi
 37d:	5d                   	pop    %ebp
 37e:	c3                   	ret    
    return -1;
 37f:	be ff ff ff ff       	mov    $0xffffffff,%esi
 384:	eb f0                	jmp    376 <stat+0x34>

00000386 <atoi>:
>>>>>>> c59b0f9 (fixed thread_join and join)

int
atoi(const char *s)
{
<<<<<<< HEAD
 39d:	55                   	push   %ebp
 39e:	89 e5                	mov    %esp,%ebp
 3a0:	53                   	push   %ebx
 3a1:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 3a4:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 3a9:	eb 10                	jmp    3bb <atoi+0x1e>
    n = n*10 + *s++ - '0';
 3ab:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 3ae:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 3b1:	83 c1 01             	add    $0x1,%ecx
 3b4:	0f be c0             	movsbl %al,%eax
 3b7:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 3bb:	0f b6 01             	movzbl (%ecx),%eax
 3be:	8d 58 d0             	lea    -0x30(%eax),%ebx
 3c1:	80 fb 09             	cmp    $0x9,%bl
 3c4:	76 e5                	jbe    3ab <atoi+0xe>
  return n;
}
 3c6:	89 d0                	mov    %edx,%eax
 3c8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3cb:	c9                   	leave  
 3cc:	c3                   	ret    

000003cd <memmove>:
=======
 386:	55                   	push   %ebp
 387:	89 e5                	mov    %esp,%ebp
 389:	53                   	push   %ebx
 38a:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 38d:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 392:	eb 10                	jmp    3a4 <atoi+0x1e>
    n = n*10 + *s++ - '0';
 394:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 397:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 39a:	83 c1 01             	add    $0x1,%ecx
 39d:	0f be c0             	movsbl %al,%eax
 3a0:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
  while('0' <= *s && *s <= '9')
 3a4:	0f b6 01             	movzbl (%ecx),%eax
 3a7:	8d 58 d0             	lea    -0x30(%eax),%ebx
 3aa:	80 fb 09             	cmp    $0x9,%bl
 3ad:	76 e5                	jbe    394 <atoi+0xe>
  return n;
}
 3af:	89 d0                	mov    %edx,%eax
 3b1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3b4:	c9                   	leave  
 3b5:	c3                   	ret    

000003b6 <memmove>:
>>>>>>> c59b0f9 (fixed thread_join and join)

void*
memmove(void *vdst, const void *vsrc, int n)
{
<<<<<<< HEAD
 3cd:	55                   	push   %ebp
 3ce:	89 e5                	mov    %esp,%ebp
 3d0:	56                   	push   %esi
 3d1:	53                   	push   %ebx
 3d2:	8b 75 08             	mov    0x8(%ebp),%esi
 3d5:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 3d8:	8b 45 10             	mov    0x10(%ebp),%eax
=======
 3b6:	55                   	push   %ebp
 3b7:	89 e5                	mov    %esp,%ebp
 3b9:	56                   	push   %esi
 3ba:	53                   	push   %ebx
 3bb:	8b 75 08             	mov    0x8(%ebp),%esi
 3be:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 3c1:	8b 45 10             	mov    0x10(%ebp),%eax
>>>>>>> c59b0f9 (fixed thread_join and join)
  char *dst;
  const char *src;

  dst = vdst;
<<<<<<< HEAD
 3db:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 3dd:	eb 0d                	jmp    3ec <memmove+0x1f>
    *dst++ = *src++;
 3df:	0f b6 01             	movzbl (%ecx),%eax
 3e2:	88 02                	mov    %al,(%edx)
 3e4:	8d 49 01             	lea    0x1(%ecx),%ecx
 3e7:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 3ea:	89 d8                	mov    %ebx,%eax
 3ec:	8d 58 ff             	lea    -0x1(%eax),%ebx
 3ef:	85 c0                	test   %eax,%eax
 3f1:	7f ec                	jg     3df <memmove+0x12>
  return vdst;
}
 3f3:	89 f0                	mov    %esi,%eax
 3f5:	5b                   	pop    %ebx
 3f6:	5e                   	pop    %esi
 3f7:	5d                   	pop    %ebp
 3f8:	c3                   	ret    

000003f9 <fork>:
=======
 3c4:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 3c6:	eb 0d                	jmp    3d5 <memmove+0x1f>
    *dst++ = *src++;
 3c8:	0f b6 01             	movzbl (%ecx),%eax
 3cb:	88 02                	mov    %al,(%edx)
 3cd:	8d 49 01             	lea    0x1(%ecx),%ecx
 3d0:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 3d3:	89 d8                	mov    %ebx,%eax
 3d5:	8d 58 ff             	lea    -0x1(%eax),%ebx
 3d8:	85 c0                	test   %eax,%eax
 3da:	7f ec                	jg     3c8 <memmove+0x12>
  return vdst;
}
 3dc:	89 f0                	mov    %esi,%eax
 3de:	5b                   	pop    %ebx
 3df:	5e                   	pop    %esi
 3e0:	5d                   	pop    %ebp
 3e1:	c3                   	ret    

000003e2 <fork>:
>>>>>>> c59b0f9 (fixed thread_join and join)
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
<<<<<<< HEAD
 3f9:	b8 01 00 00 00       	mov    $0x1,%eax
 3fe:	cd 40                	int    $0x40
 400:	c3                   	ret    

00000401 <exit>:
SYSCALL(exit)
 401:	b8 02 00 00 00       	mov    $0x2,%eax
 406:	cd 40                	int    $0x40
 408:	c3                   	ret    

00000409 <wait>:
SYSCALL(wait)
 409:	b8 03 00 00 00       	mov    $0x3,%eax
 40e:	cd 40                	int    $0x40
 410:	c3                   	ret    

00000411 <pipe>:
SYSCALL(pipe)
 411:	b8 04 00 00 00       	mov    $0x4,%eax
 416:	cd 40                	int    $0x40
 418:	c3                   	ret    

00000419 <read>:
SYSCALL(read)
 419:	b8 05 00 00 00       	mov    $0x5,%eax
 41e:	cd 40                	int    $0x40
 420:	c3                   	ret    

00000421 <write>:
SYSCALL(write)
 421:	b8 10 00 00 00       	mov    $0x10,%eax
 426:	cd 40                	int    $0x40
 428:	c3                   	ret    

00000429 <close>:
SYSCALL(close)
 429:	b8 15 00 00 00       	mov    $0x15,%eax
 42e:	cd 40                	int    $0x40
 430:	c3                   	ret    

00000431 <kill>:
SYSCALL(kill)
 431:	b8 06 00 00 00       	mov    $0x6,%eax
 436:	cd 40                	int    $0x40
 438:	c3                   	ret    

00000439 <exec>:
SYSCALL(exec)
 439:	b8 07 00 00 00       	mov    $0x7,%eax
 43e:	cd 40                	int    $0x40
 440:	c3                   	ret    

00000441 <open>:
SYSCALL(open)
 441:	b8 0f 00 00 00       	mov    $0xf,%eax
 446:	cd 40                	int    $0x40
 448:	c3                   	ret    

00000449 <mknod>:
SYSCALL(mknod)
 449:	b8 11 00 00 00       	mov    $0x11,%eax
 44e:	cd 40                	int    $0x40
 450:	c3                   	ret    

00000451 <unlink>:
SYSCALL(unlink)
 451:	b8 12 00 00 00       	mov    $0x12,%eax
 456:	cd 40                	int    $0x40
 458:	c3                   	ret    

00000459 <fstat>:
SYSCALL(fstat)
 459:	b8 08 00 00 00       	mov    $0x8,%eax
 45e:	cd 40                	int    $0x40
 460:	c3                   	ret    

00000461 <link>:
SYSCALL(link)
 461:	b8 13 00 00 00       	mov    $0x13,%eax
 466:	cd 40                	int    $0x40
 468:	c3                   	ret    

00000469 <mkdir>:
SYSCALL(mkdir)
 469:	b8 14 00 00 00       	mov    $0x14,%eax
 46e:	cd 40                	int    $0x40
 470:	c3                   	ret    

00000471 <chdir>:
SYSCALL(chdir)
 471:	b8 09 00 00 00       	mov    $0x9,%eax
 476:	cd 40                	int    $0x40
 478:	c3                   	ret    

00000479 <dup>:
SYSCALL(dup)
 479:	b8 0a 00 00 00       	mov    $0xa,%eax
 47e:	cd 40                	int    $0x40
 480:	c3                   	ret    

00000481 <getpid>:
SYSCALL(getpid)
 481:	b8 0b 00 00 00       	mov    $0xb,%eax
 486:	cd 40                	int    $0x40
 488:	c3                   	ret    

00000489 <sbrk>:
SYSCALL(sbrk)
 489:	b8 0c 00 00 00       	mov    $0xc,%eax
 48e:	cd 40                	int    $0x40
 490:	c3                   	ret    

00000491 <sleep>:
SYSCALL(sleep)
 491:	b8 0d 00 00 00       	mov    $0xd,%eax
 496:	cd 40                	int    $0x40
 498:	c3                   	ret    

00000499 <uptime>:
SYSCALL(uptime)
 499:	b8 0e 00 00 00       	mov    $0xe,%eax
 49e:	cd 40                	int    $0x40
 4a0:	c3                   	ret    

000004a1 <clone>:
SYSCALL(clone)
 4a1:	b8 16 00 00 00       	mov    $0x16,%eax
 4a6:	cd 40                	int    $0x40
 4a8:	c3                   	ret    

000004a9 <join>:
 4a9:	b8 17 00 00 00       	mov    $0x17,%eax
 4ae:	cd 40                	int    $0x40
 4b0:	c3                   	ret    

000004b1 <putc>:
=======
 3e2:	b8 01 00 00 00       	mov    $0x1,%eax
 3e7:	cd 40                	int    $0x40
 3e9:	c3                   	ret    

000003ea <exit>:
SYSCALL(exit)
 3ea:	b8 02 00 00 00       	mov    $0x2,%eax
 3ef:	cd 40                	int    $0x40
 3f1:	c3                   	ret    

000003f2 <wait>:
SYSCALL(wait)
 3f2:	b8 03 00 00 00       	mov    $0x3,%eax
 3f7:	cd 40                	int    $0x40
 3f9:	c3                   	ret    

000003fa <pipe>:
SYSCALL(pipe)
 3fa:	b8 04 00 00 00       	mov    $0x4,%eax
 3ff:	cd 40                	int    $0x40
 401:	c3                   	ret    

00000402 <read>:
SYSCALL(read)
 402:	b8 05 00 00 00       	mov    $0x5,%eax
 407:	cd 40                	int    $0x40
 409:	c3                   	ret    

0000040a <write>:
SYSCALL(write)
 40a:	b8 10 00 00 00       	mov    $0x10,%eax
 40f:	cd 40                	int    $0x40
 411:	c3                   	ret    

00000412 <close>:
SYSCALL(close)
 412:	b8 15 00 00 00       	mov    $0x15,%eax
 417:	cd 40                	int    $0x40
 419:	c3                   	ret    

0000041a <kill>:
SYSCALL(kill)
 41a:	b8 06 00 00 00       	mov    $0x6,%eax
 41f:	cd 40                	int    $0x40
 421:	c3                   	ret    

00000422 <exec>:
SYSCALL(exec)
 422:	b8 07 00 00 00       	mov    $0x7,%eax
 427:	cd 40                	int    $0x40
 429:	c3                   	ret    

0000042a <open>:
SYSCALL(open)
 42a:	b8 0f 00 00 00       	mov    $0xf,%eax
 42f:	cd 40                	int    $0x40
 431:	c3                   	ret    

00000432 <mknod>:
SYSCALL(mknod)
 432:	b8 11 00 00 00       	mov    $0x11,%eax
 437:	cd 40                	int    $0x40
 439:	c3                   	ret    

0000043a <unlink>:
SYSCALL(unlink)
 43a:	b8 12 00 00 00       	mov    $0x12,%eax
 43f:	cd 40                	int    $0x40
 441:	c3                   	ret    

00000442 <fstat>:
SYSCALL(fstat)
 442:	b8 08 00 00 00       	mov    $0x8,%eax
 447:	cd 40                	int    $0x40
 449:	c3                   	ret    

0000044a <link>:
SYSCALL(link)
 44a:	b8 13 00 00 00       	mov    $0x13,%eax
 44f:	cd 40                	int    $0x40
 451:	c3                   	ret    

00000452 <mkdir>:
SYSCALL(mkdir)
 452:	b8 14 00 00 00       	mov    $0x14,%eax
 457:	cd 40                	int    $0x40
 459:	c3                   	ret    

0000045a <chdir>:
SYSCALL(chdir)
 45a:	b8 09 00 00 00       	mov    $0x9,%eax
 45f:	cd 40                	int    $0x40
 461:	c3                   	ret    

00000462 <dup>:
SYSCALL(dup)
 462:	b8 0a 00 00 00       	mov    $0xa,%eax
 467:	cd 40                	int    $0x40
 469:	c3                   	ret    

0000046a <getpid>:
SYSCALL(getpid)
 46a:	b8 0b 00 00 00       	mov    $0xb,%eax
 46f:	cd 40                	int    $0x40
 471:	c3                   	ret    

00000472 <sbrk>:
SYSCALL(sbrk)
 472:	b8 0c 00 00 00       	mov    $0xc,%eax
 477:	cd 40                	int    $0x40
 479:	c3                   	ret    

0000047a <sleep>:
SYSCALL(sleep)
 47a:	b8 0d 00 00 00       	mov    $0xd,%eax
 47f:	cd 40                	int    $0x40
 481:	c3                   	ret    

00000482 <uptime>:
SYSCALL(uptime)
 482:	b8 0e 00 00 00       	mov    $0xe,%eax
 487:	cd 40                	int    $0x40
 489:	c3                   	ret    

0000048a <clone>:
SYSCALL(clone)
 48a:	b8 16 00 00 00       	mov    $0x16,%eax
 48f:	cd 40                	int    $0x40
 491:	c3                   	ret    

00000492 <join>:
 492:	b8 17 00 00 00       	mov    $0x17,%eax
 497:	cd 40                	int    $0x40
 499:	c3                   	ret    

0000049a <putc>:
>>>>>>> c59b0f9 (fixed thread_join and join)
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
<<<<<<< HEAD
 4b1:	55                   	push   %ebp
 4b2:	89 e5                	mov    %esp,%ebp
 4b4:	83 ec 1c             	sub    $0x1c,%esp
 4b7:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 4ba:	6a 01                	push   $0x1
 4bc:	8d 55 f4             	lea    -0xc(%ebp),%edx
 4bf:	52                   	push   %edx
 4c0:	50                   	push   %eax
 4c1:	e8 5b ff ff ff       	call   421 <write>
}
 4c6:	83 c4 10             	add    $0x10,%esp
 4c9:	c9                   	leave  
 4ca:	c3                   	ret    

000004cb <printint>:
=======
 49a:	55                   	push   %ebp
 49b:	89 e5                	mov    %esp,%ebp
 49d:	83 ec 1c             	sub    $0x1c,%esp
 4a0:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 4a3:	6a 01                	push   $0x1
 4a5:	8d 55 f4             	lea    -0xc(%ebp),%edx
 4a8:	52                   	push   %edx
 4a9:	50                   	push   %eax
 4aa:	e8 5b ff ff ff       	call   40a <write>
}
 4af:	83 c4 10             	add    $0x10,%esp
 4b2:	c9                   	leave  
 4b3:	c3                   	ret    

000004b4 <printint>:
>>>>>>> c59b0f9 (fixed thread_join and join)

static void
printint(int fd, int xx, int base, int sgn)
{
<<<<<<< HEAD
 4cb:	55                   	push   %ebp
 4cc:	89 e5                	mov    %esp,%ebp
 4ce:	57                   	push   %edi
 4cf:	56                   	push   %esi
 4d0:	53                   	push   %ebx
 4d1:	83 ec 2c             	sub    $0x2c,%esp
 4d4:	89 45 d0             	mov    %eax,-0x30(%ebp)
 4d7:	89 d0                	mov    %edx,%eax
 4d9:	89 ce                	mov    %ecx,%esi
=======
 4b4:	55                   	push   %ebp
 4b5:	89 e5                	mov    %esp,%ebp
 4b7:	57                   	push   %edi
 4b8:	56                   	push   %esi
 4b9:	53                   	push   %ebx
 4ba:	83 ec 2c             	sub    $0x2c,%esp
 4bd:	89 45 d0             	mov    %eax,-0x30(%ebp)
 4c0:	89 d0                	mov    %edx,%eax
 4c2:	89 ce                	mov    %ecx,%esi
>>>>>>> c59b0f9 (fixed thread_join and join)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
<<<<<<< HEAD
 4db:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 4df:	0f 95 c1             	setne  %cl
 4e2:	c1 ea 1f             	shr    $0x1f,%edx
 4e5:	84 d1                	test   %dl,%cl
 4e7:	74 44                	je     52d <printint+0x62>
    neg = 1;
    x = -xx;
 4e9:	f7 d8                	neg    %eax
 4eb:	89 c1                	mov    %eax,%ecx
    neg = 1;
 4ed:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
=======
 4c4:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 4c8:	0f 95 c1             	setne  %cl
 4cb:	c1 ea 1f             	shr    $0x1f,%edx
 4ce:	84 d1                	test   %dl,%cl
 4d0:	74 44                	je     516 <printint+0x62>
    neg = 1;
    x = -xx;
 4d2:	f7 d8                	neg    %eax
 4d4:	89 c1                	mov    %eax,%ecx
    neg = 1;
 4d6:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
>>>>>>> c59b0f9 (fixed thread_join and join)
  } else {
    x = xx;
  }

  i = 0;
<<<<<<< HEAD
 4f4:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 4f9:	89 c8                	mov    %ecx,%eax
 4fb:	ba 00 00 00 00       	mov    $0x0,%edx
 500:	f7 f6                	div    %esi
 502:	89 df                	mov    %ebx,%edi
 504:	83 c3 01             	add    $0x1,%ebx
 507:	0f b6 92 9c 08 00 00 	movzbl 0x89c(%edx),%edx
 50e:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 512:	89 ca                	mov    %ecx,%edx
 514:	89 c1                	mov    %eax,%ecx
 516:	39 d6                	cmp    %edx,%esi
 518:	76 df                	jbe    4f9 <printint+0x2e>
  if(neg)
 51a:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 51e:	74 31                	je     551 <printint+0x86>
    buf[i++] = '-';
 520:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 525:	8d 5f 02             	lea    0x2(%edi),%ebx
 528:	8b 75 d0             	mov    -0x30(%ebp),%esi
 52b:	eb 17                	jmp    544 <printint+0x79>
    x = xx;
 52d:	89 c1                	mov    %eax,%ecx
  neg = 0;
 52f:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 536:	eb bc                	jmp    4f4 <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 538:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 53d:	89 f0                	mov    %esi,%eax
 53f:	e8 6d ff ff ff       	call   4b1 <putc>
  while(--i >= 0)
 544:	83 eb 01             	sub    $0x1,%ebx
 547:	79 ef                	jns    538 <printint+0x6d>
}
 549:	83 c4 2c             	add    $0x2c,%esp
 54c:	5b                   	pop    %ebx
 54d:	5e                   	pop    %esi
 54e:	5f                   	pop    %edi
 54f:	5d                   	pop    %ebp
 550:	c3                   	ret    
 551:	8b 75 d0             	mov    -0x30(%ebp),%esi
 554:	eb ee                	jmp    544 <printint+0x79>

00000556 <printf>:
=======
 4dd:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 4e2:	89 c8                	mov    %ecx,%eax
 4e4:	ba 00 00 00 00       	mov    $0x0,%edx
 4e9:	f7 f6                	div    %esi
 4eb:	89 df                	mov    %ebx,%edi
 4ed:	83 c3 01             	add    $0x1,%ebx
 4f0:	0f b6 92 84 08 00 00 	movzbl 0x884(%edx),%edx
 4f7:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 4fb:	89 ca                	mov    %ecx,%edx
 4fd:	89 c1                	mov    %eax,%ecx
 4ff:	39 d6                	cmp    %edx,%esi
 501:	76 df                	jbe    4e2 <printint+0x2e>
  if(neg)
 503:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 507:	74 31                	je     53a <printint+0x86>
    buf[i++] = '-';
 509:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 50e:	8d 5f 02             	lea    0x2(%edi),%ebx
 511:	8b 75 d0             	mov    -0x30(%ebp),%esi
 514:	eb 17                	jmp    52d <printint+0x79>
    x = xx;
 516:	89 c1                	mov    %eax,%ecx
  neg = 0;
 518:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 51f:	eb bc                	jmp    4dd <printint+0x29>

  while(--i >= 0)
    putc(fd, buf[i]);
 521:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 526:	89 f0                	mov    %esi,%eax
 528:	e8 6d ff ff ff       	call   49a <putc>
  while(--i >= 0)
 52d:	83 eb 01             	sub    $0x1,%ebx
 530:	79 ef                	jns    521 <printint+0x6d>
}
 532:	83 c4 2c             	add    $0x2c,%esp
 535:	5b                   	pop    %ebx
 536:	5e                   	pop    %esi
 537:	5f                   	pop    %edi
 538:	5d                   	pop    %ebp
 539:	c3                   	ret    
 53a:	8b 75 d0             	mov    -0x30(%ebp),%esi
 53d:	eb ee                	jmp    52d <printint+0x79>

0000053f <printf>:
>>>>>>> c59b0f9 (fixed thread_join and join)

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
<<<<<<< HEAD
 556:	55                   	push   %ebp
 557:	89 e5                	mov    %esp,%ebp
 559:	57                   	push   %edi
 55a:	56                   	push   %esi
 55b:	53                   	push   %ebx
 55c:	83 ec 1c             	sub    $0x1c,%esp
=======
 53f:	55                   	push   %ebp
 540:	89 e5                	mov    %esp,%ebp
 542:	57                   	push   %edi
 543:	56                   	push   %esi
 544:	53                   	push   %ebx
 545:	83 ec 1c             	sub    $0x1c,%esp
>>>>>>> c59b0f9 (fixed thread_join and join)
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
<<<<<<< HEAD
 55f:	8d 45 10             	lea    0x10(%ebp),%eax
 562:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 565:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 56a:	bb 00 00 00 00       	mov    $0x0,%ebx
 56f:	eb 14                	jmp    585 <printf+0x2f>
=======
 548:	8d 45 10             	lea    0x10(%ebp),%eax
 54b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 54e:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 553:	bb 00 00 00 00       	mov    $0x0,%ebx
 558:	eb 14                	jmp    56e <printf+0x2f>
>>>>>>> c59b0f9 (fixed thread_join and join)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
<<<<<<< HEAD
 571:	89 fa                	mov    %edi,%edx
 573:	8b 45 08             	mov    0x8(%ebp),%eax
 576:	e8 36 ff ff ff       	call   4b1 <putc>
 57b:	eb 05                	jmp    582 <printf+0x2c>
      }
    } else if(state == '%'){
 57d:	83 fe 25             	cmp    $0x25,%esi
 580:	74 25                	je     5a7 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 582:	83 c3 01             	add    $0x1,%ebx
 585:	8b 45 0c             	mov    0xc(%ebp),%eax
 588:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 58c:	84 c0                	test   %al,%al
 58e:	0f 84 20 01 00 00    	je     6b4 <printf+0x15e>
    c = fmt[i] & 0xff;
 594:	0f be f8             	movsbl %al,%edi
 597:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 59a:	85 f6                	test   %esi,%esi
 59c:	75 df                	jne    57d <printf+0x27>
      if(c == '%'){
 59e:	83 f8 25             	cmp    $0x25,%eax
 5a1:	75 ce                	jne    571 <printf+0x1b>
        state = '%';
 5a3:	89 c6                	mov    %eax,%esi
 5a5:	eb db                	jmp    582 <printf+0x2c>
      if(c == 'd'){
 5a7:	83 f8 25             	cmp    $0x25,%eax
 5aa:	0f 84 cf 00 00 00    	je     67f <printf+0x129>
 5b0:	0f 8c dd 00 00 00    	jl     693 <printf+0x13d>
 5b6:	83 f8 78             	cmp    $0x78,%eax
 5b9:	0f 8f d4 00 00 00    	jg     693 <printf+0x13d>
 5bf:	83 f8 63             	cmp    $0x63,%eax
 5c2:	0f 8c cb 00 00 00    	jl     693 <printf+0x13d>
 5c8:	83 e8 63             	sub    $0x63,%eax
 5cb:	83 f8 15             	cmp    $0x15,%eax
 5ce:	0f 87 bf 00 00 00    	ja     693 <printf+0x13d>
 5d4:	ff 24 85 44 08 00 00 	jmp    *0x844(,%eax,4)
        printint(fd, *ap, 10, 1);
 5db:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5de:	8b 17                	mov    (%edi),%edx
 5e0:	83 ec 0c             	sub    $0xc,%esp
 5e3:	6a 01                	push   $0x1
 5e5:	b9 0a 00 00 00       	mov    $0xa,%ecx
 5ea:	8b 45 08             	mov    0x8(%ebp),%eax
 5ed:	e8 d9 fe ff ff       	call   4cb <printint>
        ap++;
 5f2:	83 c7 04             	add    $0x4,%edi
 5f5:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 5f8:	83 c4 10             	add    $0x10,%esp
=======
 55a:	89 fa                	mov    %edi,%edx
 55c:	8b 45 08             	mov    0x8(%ebp),%eax
 55f:	e8 36 ff ff ff       	call   49a <putc>
 564:	eb 05                	jmp    56b <printf+0x2c>
      }
    } else if(state == '%'){
 566:	83 fe 25             	cmp    $0x25,%esi
 569:	74 25                	je     590 <printf+0x51>
  for(i = 0; fmt[i]; i++){
 56b:	83 c3 01             	add    $0x1,%ebx
 56e:	8b 45 0c             	mov    0xc(%ebp),%eax
 571:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 575:	84 c0                	test   %al,%al
 577:	0f 84 20 01 00 00    	je     69d <printf+0x15e>
    c = fmt[i] & 0xff;
 57d:	0f be f8             	movsbl %al,%edi
 580:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 583:	85 f6                	test   %esi,%esi
 585:	75 df                	jne    566 <printf+0x27>
      if(c == '%'){
 587:	83 f8 25             	cmp    $0x25,%eax
 58a:	75 ce                	jne    55a <printf+0x1b>
        state = '%';
 58c:	89 c6                	mov    %eax,%esi
 58e:	eb db                	jmp    56b <printf+0x2c>
      if(c == 'd'){
 590:	83 f8 25             	cmp    $0x25,%eax
 593:	0f 84 cf 00 00 00    	je     668 <printf+0x129>
 599:	0f 8c dd 00 00 00    	jl     67c <printf+0x13d>
 59f:	83 f8 78             	cmp    $0x78,%eax
 5a2:	0f 8f d4 00 00 00    	jg     67c <printf+0x13d>
 5a8:	83 f8 63             	cmp    $0x63,%eax
 5ab:	0f 8c cb 00 00 00    	jl     67c <printf+0x13d>
 5b1:	83 e8 63             	sub    $0x63,%eax
 5b4:	83 f8 15             	cmp    $0x15,%eax
 5b7:	0f 87 bf 00 00 00    	ja     67c <printf+0x13d>
 5bd:	ff 24 85 2c 08 00 00 	jmp    *0x82c(,%eax,4)
        printint(fd, *ap, 10, 1);
 5c4:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5c7:	8b 17                	mov    (%edi),%edx
 5c9:	83 ec 0c             	sub    $0xc,%esp
 5cc:	6a 01                	push   $0x1
 5ce:	b9 0a 00 00 00       	mov    $0xa,%ecx
 5d3:	8b 45 08             	mov    0x8(%ebp),%eax
 5d6:	e8 d9 fe ff ff       	call   4b4 <printint>
        ap++;
 5db:	83 c7 04             	add    $0x4,%edi
 5de:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 5e1:	83 c4 10             	add    $0x10,%esp
>>>>>>> c59b0f9 (fixed thread_join and join)
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
<<<<<<< HEAD
 5fb:	be 00 00 00 00       	mov    $0x0,%esi
 600:	eb 80                	jmp    582 <printf+0x2c>
        printint(fd, *ap, 16, 0);
 602:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 605:	8b 17                	mov    (%edi),%edx
 607:	83 ec 0c             	sub    $0xc,%esp
 60a:	6a 00                	push   $0x0
 60c:	b9 10 00 00 00       	mov    $0x10,%ecx
 611:	8b 45 08             	mov    0x8(%ebp),%eax
 614:	e8 b2 fe ff ff       	call   4cb <printint>
        ap++;
 619:	83 c7 04             	add    $0x4,%edi
 61c:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 61f:	83 c4 10             	add    $0x10,%esp
      state = 0;
 622:	be 00 00 00 00       	mov    $0x0,%esi
 627:	e9 56 ff ff ff       	jmp    582 <printf+0x2c>
        s = (char*)*ap;
 62c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 62f:	8b 30                	mov    (%eax),%esi
        ap++;
 631:	83 c0 04             	add    $0x4,%eax
 634:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 637:	85 f6                	test   %esi,%esi
 639:	75 15                	jne    650 <printf+0xfa>
          s = "(null)";
 63b:	be 3b 08 00 00       	mov    $0x83b,%esi
 640:	eb 0e                	jmp    650 <printf+0xfa>
          putc(fd, *s);
 642:	0f be d2             	movsbl %dl,%edx
 645:	8b 45 08             	mov    0x8(%ebp),%eax
 648:	e8 64 fe ff ff       	call   4b1 <putc>
          s++;
 64d:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 650:	0f b6 16             	movzbl (%esi),%edx
 653:	84 d2                	test   %dl,%dl
 655:	75 eb                	jne    642 <printf+0xec>
      state = 0;
 657:	be 00 00 00 00       	mov    $0x0,%esi
 65c:	e9 21 ff ff ff       	jmp    582 <printf+0x2c>
        putc(fd, *ap);
 661:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 664:	0f be 17             	movsbl (%edi),%edx
 667:	8b 45 08             	mov    0x8(%ebp),%eax
 66a:	e8 42 fe ff ff       	call   4b1 <putc>
        ap++;
 66f:	83 c7 04             	add    $0x4,%edi
 672:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 675:	be 00 00 00 00       	mov    $0x0,%esi
 67a:	e9 03 ff ff ff       	jmp    582 <printf+0x2c>
        putc(fd, c);
 67f:	89 fa                	mov    %edi,%edx
 681:	8b 45 08             	mov    0x8(%ebp),%eax
 684:	e8 28 fe ff ff       	call   4b1 <putc>
      state = 0;
 689:	be 00 00 00 00       	mov    $0x0,%esi
 68e:	e9 ef fe ff ff       	jmp    582 <printf+0x2c>
        putc(fd, '%');
 693:	ba 25 00 00 00       	mov    $0x25,%edx
 698:	8b 45 08             	mov    0x8(%ebp),%eax
 69b:	e8 11 fe ff ff       	call   4b1 <putc>
        putc(fd, c);
 6a0:	89 fa                	mov    %edi,%edx
 6a2:	8b 45 08             	mov    0x8(%ebp),%eax
 6a5:	e8 07 fe ff ff       	call   4b1 <putc>
      state = 0;
 6aa:	be 00 00 00 00       	mov    $0x0,%esi
 6af:	e9 ce fe ff ff       	jmp    582 <printf+0x2c>
    }
  }
}
 6b4:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6b7:	5b                   	pop    %ebx
 6b8:	5e                   	pop    %esi
 6b9:	5f                   	pop    %edi
 6ba:	5d                   	pop    %ebp
 6bb:	c3                   	ret    

000006bc <free>:
=======
 5e4:	be 00 00 00 00       	mov    $0x0,%esi
 5e9:	eb 80                	jmp    56b <printf+0x2c>
        printint(fd, *ap, 16, 0);
 5eb:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5ee:	8b 17                	mov    (%edi),%edx
 5f0:	83 ec 0c             	sub    $0xc,%esp
 5f3:	6a 00                	push   $0x0
 5f5:	b9 10 00 00 00       	mov    $0x10,%ecx
 5fa:	8b 45 08             	mov    0x8(%ebp),%eax
 5fd:	e8 b2 fe ff ff       	call   4b4 <printint>
        ap++;
 602:	83 c7 04             	add    $0x4,%edi
 605:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 608:	83 c4 10             	add    $0x10,%esp
      state = 0;
 60b:	be 00 00 00 00       	mov    $0x0,%esi
 610:	e9 56 ff ff ff       	jmp    56b <printf+0x2c>
        s = (char*)*ap;
 615:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 618:	8b 30                	mov    (%eax),%esi
        ap++;
 61a:	83 c0 04             	add    $0x4,%eax
 61d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 620:	85 f6                	test   %esi,%esi
 622:	75 15                	jne    639 <printf+0xfa>
          s = "(null)";
 624:	be 23 08 00 00       	mov    $0x823,%esi
 629:	eb 0e                	jmp    639 <printf+0xfa>
          putc(fd, *s);
 62b:	0f be d2             	movsbl %dl,%edx
 62e:	8b 45 08             	mov    0x8(%ebp),%eax
 631:	e8 64 fe ff ff       	call   49a <putc>
          s++;
 636:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 639:	0f b6 16             	movzbl (%esi),%edx
 63c:	84 d2                	test   %dl,%dl
 63e:	75 eb                	jne    62b <printf+0xec>
      state = 0;
 640:	be 00 00 00 00       	mov    $0x0,%esi
 645:	e9 21 ff ff ff       	jmp    56b <printf+0x2c>
        putc(fd, *ap);
 64a:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 64d:	0f be 17             	movsbl (%edi),%edx
 650:	8b 45 08             	mov    0x8(%ebp),%eax
 653:	e8 42 fe ff ff       	call   49a <putc>
        ap++;
 658:	83 c7 04             	add    $0x4,%edi
 65b:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 65e:	be 00 00 00 00       	mov    $0x0,%esi
 663:	e9 03 ff ff ff       	jmp    56b <printf+0x2c>
        putc(fd, c);
 668:	89 fa                	mov    %edi,%edx
 66a:	8b 45 08             	mov    0x8(%ebp),%eax
 66d:	e8 28 fe ff ff       	call   49a <putc>
      state = 0;
 672:	be 00 00 00 00       	mov    $0x0,%esi
 677:	e9 ef fe ff ff       	jmp    56b <printf+0x2c>
        putc(fd, '%');
 67c:	ba 25 00 00 00       	mov    $0x25,%edx
 681:	8b 45 08             	mov    0x8(%ebp),%eax
 684:	e8 11 fe ff ff       	call   49a <putc>
        putc(fd, c);
 689:	89 fa                	mov    %edi,%edx
 68b:	8b 45 08             	mov    0x8(%ebp),%eax
 68e:	e8 07 fe ff ff       	call   49a <putc>
      state = 0;
 693:	be 00 00 00 00       	mov    $0x0,%esi
 698:	e9 ce fe ff ff       	jmp    56b <printf+0x2c>
    }
  }
}
 69d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6a0:	5b                   	pop    %ebx
 6a1:	5e                   	pop    %esi
 6a2:	5f                   	pop    %edi
 6a3:	5d                   	pop    %ebp
 6a4:	c3                   	ret    

000006a5 <free>:
>>>>>>> c59b0f9 (fixed thread_join and join)
static Header base;
static Header *freep;

void
free(void *ap)
{
<<<<<<< HEAD
 6bc:	55                   	push   %ebp
 6bd:	89 e5                	mov    %esp,%ebp
 6bf:	57                   	push   %edi
 6c0:	56                   	push   %esi
 6c1:	53                   	push   %ebx
 6c2:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 6c5:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6c8:	a1 60 0f 00 00       	mov    0xf60,%eax
 6cd:	eb 02                	jmp    6d1 <free+0x15>
 6cf:	89 d0                	mov    %edx,%eax
 6d1:	39 c8                	cmp    %ecx,%eax
 6d3:	73 04                	jae    6d9 <free+0x1d>
 6d5:	39 08                	cmp    %ecx,(%eax)
 6d7:	77 12                	ja     6eb <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6d9:	8b 10                	mov    (%eax),%edx
 6db:	39 c2                	cmp    %eax,%edx
 6dd:	77 f0                	ja     6cf <free+0x13>
 6df:	39 c8                	cmp    %ecx,%eax
 6e1:	72 08                	jb     6eb <free+0x2f>
 6e3:	39 ca                	cmp    %ecx,%edx
 6e5:	77 04                	ja     6eb <free+0x2f>
 6e7:	89 d0                	mov    %edx,%eax
 6e9:	eb e6                	jmp    6d1 <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 6eb:	8b 73 fc             	mov    -0x4(%ebx),%esi
 6ee:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 6f1:	8b 10                	mov    (%eax),%edx
 6f3:	39 d7                	cmp    %edx,%edi
 6f5:	74 19                	je     710 <free+0x54>
=======
 6a5:	55                   	push   %ebp
 6a6:	89 e5                	mov    %esp,%ebp
 6a8:	57                   	push   %edi
 6a9:	56                   	push   %esi
 6aa:	53                   	push   %ebx
 6ab:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 6ae:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6b1:	a1 40 11 00 00       	mov    0x1140,%eax
 6b6:	eb 02                	jmp    6ba <free+0x15>
 6b8:	89 d0                	mov    %edx,%eax
 6ba:	39 c8                	cmp    %ecx,%eax
 6bc:	73 04                	jae    6c2 <free+0x1d>
 6be:	39 08                	cmp    %ecx,(%eax)
 6c0:	77 12                	ja     6d4 <free+0x2f>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6c2:	8b 10                	mov    (%eax),%edx
 6c4:	39 c2                	cmp    %eax,%edx
 6c6:	77 f0                	ja     6b8 <free+0x13>
 6c8:	39 c8                	cmp    %ecx,%eax
 6ca:	72 08                	jb     6d4 <free+0x2f>
 6cc:	39 ca                	cmp    %ecx,%edx
 6ce:	77 04                	ja     6d4 <free+0x2f>
 6d0:	89 d0                	mov    %edx,%eax
 6d2:	eb e6                	jmp    6ba <free+0x15>
      break;
  if(bp + bp->s.size == p->s.ptr){
 6d4:	8b 73 fc             	mov    -0x4(%ebx),%esi
 6d7:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 6da:	8b 10                	mov    (%eax),%edx
 6dc:	39 d7                	cmp    %edx,%edi
 6de:	74 19                	je     6f9 <free+0x54>
>>>>>>> c59b0f9 (fixed thread_join and join)
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
<<<<<<< HEAD
 6f7:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 6fa:	8b 50 04             	mov    0x4(%eax),%edx
 6fd:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 700:	39 ce                	cmp    %ecx,%esi
 702:	74 1b                	je     71f <free+0x63>
=======
 6e0:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 6e3:	8b 50 04             	mov    0x4(%eax),%edx
 6e6:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 6e9:	39 ce                	cmp    %ecx,%esi
 6eb:	74 1b                	je     708 <free+0x63>
>>>>>>> c59b0f9 (fixed thread_join and join)
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
<<<<<<< HEAD
 704:	89 08                	mov    %ecx,(%eax)
  freep = p;
 706:	a3 60 0f 00 00       	mov    %eax,0xf60
}
 70b:	5b                   	pop    %ebx
 70c:	5e                   	pop    %esi
 70d:	5f                   	pop    %edi
 70e:	5d                   	pop    %ebp
 70f:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 710:	03 72 04             	add    0x4(%edx),%esi
 713:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 716:	8b 10                	mov    (%eax),%edx
 718:	8b 12                	mov    (%edx),%edx
 71a:	89 53 f8             	mov    %edx,-0x8(%ebx)
 71d:	eb db                	jmp    6fa <free+0x3e>
    p->s.size += bp->s.size;
 71f:	03 53 fc             	add    -0x4(%ebx),%edx
 722:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 725:	8b 53 f8             	mov    -0x8(%ebx),%edx
 728:	89 10                	mov    %edx,(%eax)
 72a:	eb da                	jmp    706 <free+0x4a>

0000072c <morecore>:
=======
 6ed:	89 08                	mov    %ecx,(%eax)
  freep = p;
 6ef:	a3 40 11 00 00       	mov    %eax,0x1140
}
 6f4:	5b                   	pop    %ebx
 6f5:	5e                   	pop    %esi
 6f6:	5f                   	pop    %edi
 6f7:	5d                   	pop    %ebp
 6f8:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 6f9:	03 72 04             	add    0x4(%edx),%esi
 6fc:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 6ff:	8b 10                	mov    (%eax),%edx
 701:	8b 12                	mov    (%edx),%edx
 703:	89 53 f8             	mov    %edx,-0x8(%ebx)
 706:	eb db                	jmp    6e3 <free+0x3e>
    p->s.size += bp->s.size;
 708:	03 53 fc             	add    -0x4(%ebx),%edx
 70b:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 70e:	8b 53 f8             	mov    -0x8(%ebx),%edx
 711:	89 10                	mov    %edx,(%eax)
 713:	eb da                	jmp    6ef <free+0x4a>

00000715 <morecore>:
>>>>>>> c59b0f9 (fixed thread_join and join)

static Header*
morecore(uint nu)
{
<<<<<<< HEAD
 72c:	55                   	push   %ebp
 72d:	89 e5                	mov    %esp,%ebp
 72f:	53                   	push   %ebx
 730:	83 ec 04             	sub    $0x4,%esp
 733:	89 c3                	mov    %eax,%ebx
=======
 715:	55                   	push   %ebp
 716:	89 e5                	mov    %esp,%ebp
 718:	53                   	push   %ebx
 719:	83 ec 04             	sub    $0x4,%esp
 71c:	89 c3                	mov    %eax,%ebx
>>>>>>> c59b0f9 (fixed thread_join and join)
  char *p;
  Header *hp;

  if(nu < 4096)
<<<<<<< HEAD
 735:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 73a:	77 05                	ja     741 <morecore+0x15>
    nu = 4096;
 73c:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 741:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 748:	83 ec 0c             	sub    $0xc,%esp
 74b:	50                   	push   %eax
 74c:	e8 38 fd ff ff       	call   489 <sbrk>
  if(p == (char*)-1)
 751:	83 c4 10             	add    $0x10,%esp
 754:	83 f8 ff             	cmp    $0xffffffff,%eax
 757:	74 1c                	je     775 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 759:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 75c:	83 c0 08             	add    $0x8,%eax
 75f:	83 ec 0c             	sub    $0xc,%esp
 762:	50                   	push   %eax
 763:	e8 54 ff ff ff       	call   6bc <free>
  return freep;
 768:	a1 60 0f 00 00       	mov    0xf60,%eax
 76d:	83 c4 10             	add    $0x10,%esp
}
 770:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 773:	c9                   	leave  
 774:	c3                   	ret    
    return 0;
 775:	b8 00 00 00 00       	mov    $0x0,%eax
 77a:	eb f4                	jmp    770 <morecore+0x44>

0000077c <malloc>:
=======
 71e:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 723:	77 05                	ja     72a <morecore+0x15>
    nu = 4096;
 725:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 72a:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 731:	83 ec 0c             	sub    $0xc,%esp
 734:	50                   	push   %eax
 735:	e8 38 fd ff ff       	call   472 <sbrk>
  if(p == (char*)-1)
 73a:	83 c4 10             	add    $0x10,%esp
 73d:	83 f8 ff             	cmp    $0xffffffff,%eax
 740:	74 1c                	je     75e <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 742:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 745:	83 c0 08             	add    $0x8,%eax
 748:	83 ec 0c             	sub    $0xc,%esp
 74b:	50                   	push   %eax
 74c:	e8 54 ff ff ff       	call   6a5 <free>
  return freep;
 751:	a1 40 11 00 00       	mov    0x1140,%eax
 756:	83 c4 10             	add    $0x10,%esp
}
 759:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 75c:	c9                   	leave  
 75d:	c3                   	ret    
    return 0;
 75e:	b8 00 00 00 00       	mov    $0x0,%eax
 763:	eb f4                	jmp    759 <morecore+0x44>

00000765 <malloc>:
>>>>>>> c59b0f9 (fixed thread_join and join)

void*
malloc(uint nbytes)
{
<<<<<<< HEAD
 77c:	55                   	push   %ebp
 77d:	89 e5                	mov    %esp,%ebp
 77f:	53                   	push   %ebx
 780:	83 ec 04             	sub    $0x4,%esp
=======
 765:	55                   	push   %ebp
 766:	89 e5                	mov    %esp,%ebp
 768:	53                   	push   %ebx
 769:	83 ec 04             	sub    $0x4,%esp
>>>>>>> c59b0f9 (fixed thread_join and join)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
<<<<<<< HEAD
 783:	8b 45 08             	mov    0x8(%ebp),%eax
 786:	8d 58 07             	lea    0x7(%eax),%ebx
 789:	c1 eb 03             	shr    $0x3,%ebx
 78c:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 78f:	8b 0d 60 0f 00 00    	mov    0xf60,%ecx
 795:	85 c9                	test   %ecx,%ecx
 797:	74 04                	je     79d <malloc+0x21>
=======
 76c:	8b 45 08             	mov    0x8(%ebp),%eax
 76f:	8d 58 07             	lea    0x7(%eax),%ebx
 772:	c1 eb 03             	shr    $0x3,%ebx
 775:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 778:	8b 0d 40 11 00 00    	mov    0x1140,%ecx
 77e:	85 c9                	test   %ecx,%ecx
 780:	74 04                	je     786 <malloc+0x21>
>>>>>>> c59b0f9 (fixed thread_join and join)
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
<<<<<<< HEAD
 799:	8b 01                	mov    (%ecx),%eax
 79b:	eb 4a                	jmp    7e7 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 79d:	c7 05 60 0f 00 00 64 	movl   $0xf64,0xf60
 7a4:	0f 00 00 
 7a7:	c7 05 64 0f 00 00 64 	movl   $0xf64,0xf64
 7ae:	0f 00 00 
    base.s.size = 0;
 7b1:	c7 05 68 0f 00 00 00 	movl   $0x0,0xf68
 7b8:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 7bb:	b9 64 0f 00 00       	mov    $0xf64,%ecx
 7c0:	eb d7                	jmp    799 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 7c2:	74 19                	je     7dd <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 7c4:	29 da                	sub    %ebx,%edx
 7c6:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 7c9:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 7cc:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 7cf:	89 0d 60 0f 00 00    	mov    %ecx,0xf60
      return (void*)(p + 1);
 7d5:	83 c0 08             	add    $0x8,%eax
=======
 782:	8b 01                	mov    (%ecx),%eax
 784:	eb 4a                	jmp    7d0 <malloc+0x6b>
    base.s.ptr = freep = prevp = &base;
 786:	c7 05 40 11 00 00 44 	movl   $0x1144,0x1140
 78d:	11 00 00 
 790:	c7 05 44 11 00 00 44 	movl   $0x1144,0x1144
 797:	11 00 00 
    base.s.size = 0;
 79a:	c7 05 48 11 00 00 00 	movl   $0x0,0x1148
 7a1:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 7a4:	b9 44 11 00 00       	mov    $0x1144,%ecx
 7a9:	eb d7                	jmp    782 <malloc+0x1d>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 7ab:	74 19                	je     7c6 <malloc+0x61>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 7ad:	29 da                	sub    %ebx,%edx
 7af:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 7b2:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 7b5:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 7b8:	89 0d 40 11 00 00    	mov    %ecx,0x1140
      return (void*)(p + 1);
 7be:	83 c0 08             	add    $0x8,%eax
>>>>>>> c59b0f9 (fixed thread_join and join)
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
<<<<<<< HEAD
 7d8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 7db:	c9                   	leave  
 7dc:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 7dd:	8b 10                	mov    (%eax),%edx
 7df:	89 11                	mov    %edx,(%ecx)
 7e1:	eb ec                	jmp    7cf <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7e3:	89 c1                	mov    %eax,%ecx
 7e5:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 7e7:	8b 50 04             	mov    0x4(%eax),%edx
 7ea:	39 da                	cmp    %ebx,%edx
 7ec:	73 d4                	jae    7c2 <malloc+0x46>
    if(p == freep)
 7ee:	39 05 60 0f 00 00    	cmp    %eax,0xf60
 7f4:	75 ed                	jne    7e3 <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 7f6:	89 d8                	mov    %ebx,%eax
 7f8:	e8 2f ff ff ff       	call   72c <morecore>
 7fd:	85 c0                	test   %eax,%eax
 7ff:	75 e2                	jne    7e3 <malloc+0x67>
 801:	eb d5                	jmp    7d8 <malloc+0x5c>
=======
 7c1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 7c4:	c9                   	leave  
 7c5:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 7c6:	8b 10                	mov    (%eax),%edx
 7c8:	89 11                	mov    %edx,(%ecx)
 7ca:	eb ec                	jmp    7b8 <malloc+0x53>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7cc:	89 c1                	mov    %eax,%ecx
 7ce:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 7d0:	8b 50 04             	mov    0x4(%eax),%edx
 7d3:	39 da                	cmp    %ebx,%edx
 7d5:	73 d4                	jae    7ab <malloc+0x46>
    if(p == freep)
 7d7:	39 05 40 11 00 00    	cmp    %eax,0x1140
 7dd:	75 ed                	jne    7cc <malloc+0x67>
      if((p = morecore(nunits)) == 0)
 7df:	89 d8                	mov    %ebx,%eax
 7e1:	e8 2f ff ff ff       	call   715 <morecore>
 7e6:	85 c0                	test   %eax,%eax
 7e8:	75 e2                	jne    7cc <malloc+0x67>
 7ea:	eb d5                	jmp    7c1 <malloc+0x5c>
>>>>>>> c59b0f9 (fixed thread_join and join)
